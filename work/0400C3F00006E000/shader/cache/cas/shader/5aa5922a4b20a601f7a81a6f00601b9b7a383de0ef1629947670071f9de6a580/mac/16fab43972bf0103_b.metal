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
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1613 = as_type<float>(_98);
        out.gl_Position.z = _1613;
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
        float _1683 = as_type<float>(_136);
        out.gl_Position.z = _1683;
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
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _178 = _154;
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
    float _194 = _140;
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
    float _230 = 1.4012984643248170709237295832899e-45;
    float _232 = _198;
    float _234 = _206;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _236 = _228;
    bool _238 = _218 > 0.0;
    float _240 = _146;
    float _242 = _236;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _240 = _244;
    }
    float _246 = _240;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_164)
    {
        _230 = _154;
    }
    float _252 = _230;
    float _254 = 0.0;
    float _256 = _252;
    if (!_220)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_220)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_224)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = -_226;
    float _276 = _222 + _274;
    float _278 = _222 * 6.283185482025146484375;
    float _280 = _214;
    if (_238)
    {
        float _282 = rsqrt(_212);
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_164;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _154 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _154);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _316;
        _234 = _306;
    }
    float _318 = _232;
    float _320 = _234;
    bool _322 = !_164;
    float _324 = _320;
    if (!_322)
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
        _256 = _344;
        _176 = _332;
    }
    float _346 = _256;
    float _348 = _176;
    float _350 = _278 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (_220)
    {
        float _360 = _246 * _148;
        _242 = _360;
    }
    float _362 = _242;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    if (!_224)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = _368;
    if (_220)
    {
        float _372 = _246 * _138;
        _262 = _372;
    }
    float _374 = _262;
    if (!_224)
    {
        _324 = 0.0;
    }
    float _376 = _324;
    float _378 = _376;
    if (_220)
    {
        float _380 = _246 * _166;
        _268 = _380;
    }
    float _382 = _268;
    if (!_224)
    {
        _178 = 0.0;
    }
    float _384 = _178;
    float _386 = _384;
    if (_224)
    {
        float _388 = _272 * _150;
        _370 = _388;
    }
    float _390 = _370;
    if (_224)
    {
        float _392 = _272 * _140;
        _378 = _392;
    }
    float _394 = _378;
    if (_224)
    {
        float _396 = _272 * _168;
        _386 = _396;
    }
    float _398 = _386;
    float _400 = in.m_50.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _408 = _406 != 0;
    float _410 = -_276;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _414 = 0.0;
    if (!_238)
    {
        _414 = 0.0;
    }
    float _416 = _414;
    float _418 = _416;
    if (_238)
    {
        float _420 = _284 * _152;
        _418 = _420;
    }
    float _422 = _418;
    float _424 = 0.0;
    if (!_238)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_238)
    {
        float _430 = _284 * _142;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 0.0;
    if (!_238)
    {
        _434 = 0.0;
    }
    float _436 = _434;
    float _438 = _436;
    if (_238)
    {
        float _440 = _284 * _170;
        _438 = _440;
    }
    float _442 = _438;
    bool _444 = _276 < 0.5;
    float _446 = float(_444);
    float _448 = in.m_35.x;
    float _450 = in.m_35.y;
    float _452 = in.m_35.z;
    float _454 = fma(_366, 0.5, 0.5);
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    float _460 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _462 = -_446;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_250;
    int _468 = _466 ? 0 : 1;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_458);
    float _476 = fma(_346, _352, _460);
    bool _478 = !_408;
    int _480 = _478 ? 0 : 1;
    float _482 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _488 = abs(_468);
    float _490 = fma(_346, _354, _482);
    int _492 = abs(_480);
    float _494 = float(_474);
    float _496 = float(_488);
    float _498 = abs(_412);
    float _500 = _494 * _498;
    float _502 = fma(_346, _356, _486);
    float _504 = fma(_476, _400, _448);
    float _506 = float(_492);
    float _508 = fma(_496, _472, _500);
    float _510 = fma(_490, _400, _450);
    float _512 = fma(_502, _400, _452);
    float _514 = abs(_464);
    float _516 = fma(_506, _514, _508);
    bool _518 = !_484;
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
    float _648 = in.m_48.w;
    float _650 = _210 * 2.0;
    float _652 = in.m_48.y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _674 = _672 != 0;
    float _676 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = floor(_650);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_656)
    {
        float _686 = in.m_48.z;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _692 = _660 * _116;
    float _694 = _646 * 2.0;
    float _696 = _652 * 2.0;
    float _698 = exp2(_692);
    bool _700 = _680 > 0.0;
    bool _702 = _680 >= 0.0;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    float _712 = _680;
    float _714 = _652;
    if (!_656)
    {
        _712 = _652;
    }
    float _716 = _712;
    int _718 = _710 ? 0 : 1;
    float _720 = floor(_694);
    float _722 = _716;
    if (_656)
    {
        _722 = _210;
    }
    float _724 = _722;
    int _726 = ~_718;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    if (!_700)
    {
        int _734 = ~_718;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _744 = floor(_696);
    float _746 = float(_738);
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -_682;
    float _754 = fma(_742, 2.0, _752);
    bool _756 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _764 = _760 || _762;
    float _766 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _740);
    bool _768 = _720 > 0.0;
    bool _770 = _720 >= 0.0;
    bool _772 = isnan(_720);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _720;
    float _782 = _688;
    if (!_656)
    {
        _780 = _688;
    }
    float _784 = _780;
    float _786 = _784;
    if (_656)
    {
        _782 = _652;
    }
    float _788 = _782;
    if (_656)
    {
        _786 = _652;
    }
    float _790 = _786;
    int _792 = _778 ? 0 : 1;
    float _794 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].w, _662);
    float _796 = _210 + _652;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = _796 + (-1.0);
    int _808 = _804;
    if (!_768)
    {
        int _810 = ~_792;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = fma(_798, -2.0, _690);
    float _818 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _646 + _652;
    bool _822 = !_670;
    int _824 = _822 ? 0 : 1;
    bool _826 = !_666;
    int _828 = _826 ? 0 : 1;
    float _830 = _820 + (-1.0);
    int _832 = abs(_824);
    int _834 = abs(_828);
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = in.m_52.x;
    float _850 = in.m_52.y;
    float _852 = in.m_52.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _856 = 1.0 + _854;
    float _858 = float(_832);
    float _860 = float(_834);
    float _862 = float(_814);
    float _864 = 1.0 / _856;
    bool _866 = _744 > 0.0;
    float _868 = _858 * _746;
    float _870 = _764 ? _750 : 0.0;
    float _872 = _860 * _862;
    bool _874 = _744 >= 0.0;
    bool _876 = isnan(_744);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_116;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _888 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _816);
    float _890 = _868 * (-2.0);
    bool _892 = !_674;
    int _894 = _892 ? 0 : 1;
    float _896 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _898 = _652 + (-0.5);
    int _900 = abs(_894);
    if (_846)
    {
        float _902 = _870 * _864;
        _118 = _902;
    }
    float _904 = _118;
    int _906 = _882 ? 0 : 1;
    float _908 = fma(_890, _850, _850);
    float _910 = fma(_836, _890, _836);
    int _912 = ~_906;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    int _920 = _916;
    if (!_866)
    {
        int _922 = ~_906;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _872 * (-2.0);
    float _930 = fma(_910, _904, _918);
    float _932 = float(_926);
    float _934 = _210 + (-0.5);
    float _936 = float(_900);
    float _938 = fma(_928, _848, _848);
    float _940 = fma(_818, _928, _818);
    float _942 = _210 + _646;
    float _944 = as_type<float>(int(gl_VertexIndex));
    float _946 = _936 * _932;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = _942 + (-1.0);
    float _952 = in.m_50.x;
    float _954 = in.m_50.y;
    float _956 = _946 * (-2.0);
    float _958 = fma(_940, _904, _948);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _962 = _930 * 0.15915493667125701904296875;
    float _964 = fma(_956, _852, _852);
    float _966 = _646 + (-0.5);
    float _968 = _958 * 0.15915493667125701904296875;
    float _970 = fma(_960, _956, _960);
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _978 = fma(_970, _904, _976);
    float _980 = _962 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _978 * 0.15915493667125701904296875;
    int _986 = as_type<int>(_944) & 1;
    bool _988 = _986 != 0;
    int _990 = as_type<int>(_944) & 2;
    bool _992 = _990 != 0;
    float _994 = _614 * _952;
    float _996 = _968 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _510 * _168;
    bool _1002 = !_988;
    float _1004 = _1002 ? (-0.5) : 0.5;
    float _1006 = _616 * _954;
    float _1008 = _510 * _150;
    bool _1010 = !_992;
    float _1012 = _1010 ? (-0.5) : 0.5;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1018 = _968 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1026 = _1014 * _1016;
    float _1028 = fma(_504, _148, _1008);
    float _1030 = in.m_46.w;
    float _1032 = fma(_504, _166, _1000);
    float _1034 = _1022 * _1024;
    float _1036 = _984 * 6.283185482025146484375;
    float _1038 = cos(_1036);
    float _1040 = _998 * _974;
    float _1042 = in.m_44.w;
    float _1044 = _998 * _982;
    float _1046 = fma(_512, _170, _1032);
    float _1048 = _510 * _140;
    float _1050 = _984 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _1020 * _982;
    float _1056 = _1020 * _974;
    float _1058 = fma(_504, _138, _1048);
    float _1060 = fma(_512, _142, _1058);
    float _1062 = _1038 * _676;
    float _1064 = _974 * _1038;
    float _1066 = _982 * _1038;
    float _1068 = _1020 * _1062;
    float _1070 = _998 * _1062;
    float _1072 = _1046 + _1030;
    float _1074 = fma(_1052, _1054, _1040);
    float _1076 = _1052 * _676;
    float _1078 = -_1044;
    float _1080 = fma(_1052, _1056, _1078);
    float _1082 = -_1056;
    float _1084 = fma(_1052, _1044, _1082);
    float _1086 = fma(_1074, _1026, _1068);
    float _1088 = -_1076;
    float _1090 = fma(_1066, _1026, _1088);
    float _1092 = fma(_1052, _1040, _1054);
    float _1094 = fma(_1084, _1026, _1070);
    float _1096 = -_1034;
    float _1098 = fma(_1080, _1096, _1086);
    float _1100 = -_1034;
    float _1102 = fma(_1064, _1100, _1090);
    float _1104 = -_1034;
    float _1106 = fma(_1092, _1104, _1094);
    float _1108 = _1098 * _398;
    float _1110 = _1098 * _390;
    float _1112 = fma(_512, _152, _1028);
    float _1114 = _1098 * _394;
    float _1116 = fma(_1102, _382, _1108);
    float _1118 = fma(_1102, _362, _1110);
    float _1120 = _1112 + _1042;
    float _1122 = fma(_1102, _374, _1114);
    float _1124 = fma(_1106, _442, _1116);
    float _1126 = fma(_1106, _422, _1118);
    float _1128 = fma(_1106, _432, _1122);
    float _1130 = _1072 + _1124;
    float _1132 = _1120 + _1126;
    float _1134 = in.m_42.w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1132 + _1140;
    float _1144 = _1138 * _1138;
    float _1146 = fma(_1142, _1142, _1144);
    float _1148 = sqrt(_1146);
    float _1150 = _1060 + _1134;
    float _1152 = _1150 + _1128;
    bool _1154 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1148 + _1156;
    float _1160 = _1118;
    float _1162 = _1102;
    float _1164 = _1148;
    float _1166 = _1132;
    float _1168 = _1130;
    float _1170 = _1122;
    float _1172 = _1152;
    if (_1154)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    if (_1154)
    {
        float _1178 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1178;
    }
    float _1180 = _1162;
    float _1182 = _1176;
    float _1184 = _1180;
    if (_1154)
    {
        float _1186 = _1158 * _1176;
        _1164 = _1186;
    }
    float _1188 = _1164;
    if (_1154)
    {
        float _1190 = rsqrt(_1146);
        _1182 = _1190;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1154)
    {
        float _1196 = _1188 * 0.15915493667125701904296875;
        _194 = _1196;
    }
    float _1198 = _194;
    float _1200 = _1188;
    if (_1154)
    {
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    if (_1154)
    {
        float _1208 = fma(_1206, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1184 = _1208;
    }
    float _1210 = _1184;
    if (_1154)
    {
        float _1212 = _1192 * _1210;
        _1194 = _1212;
    }
    float _1214 = _1194;
    if (_1154)
    {
        float _1216 = fma(_1142, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1166 = _1216;
    }
    float _1218 = _1166;
    if (_1154)
    {
        float _1220 = fma(_1138, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1220;
    }
    float _1222 = _1168;
    float _1224 = fma(_1218, 6.2500002968590706586837768554688e-05, 0.5);
    float _1226 = fma(_1222, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3270 = float2(_1224, _1226);
    float3 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3270, float2(0.0), isnan(_3270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3270, float2(0.0), isnan(_3270)), level(0.0)).xyz;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    if (_1154)
    {
        float _1238 = _1198 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        _1170 = _1240;
    }
    float _1242 = _1170;
    float _1244 = -_896;
    float _1246 = _1244 + 1.0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1250 = _1248 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1252 = _210 > 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1258 = _648 > 0.5;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1260;
    float _1264 = 1.0 / _1250;
    float _1266 = -_1012;
    int _1268 = _1258 ? as_type<int>(_1266) : as_type<int>(_1012);
    float _1270 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    float _1276 = -_766;
    float _1278 = _1276 + 1.0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1256;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1292 = _1290 != 0;
    bool _1294 = _646 > 0.5;
    float _1296 = -_1004;
    float _1298 = _1252 ? _1296 : _1004;
    float _1300 = _1262 * _1264;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1308 = _644 + _1306;
    bool _1310 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1312 = isnan(_644);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1324 = fma(_1300, _1308, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1326 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1328 = isnan(_644);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1304 * _1288;
    bool _1340 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1342 = isnan(_644);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1358 = _644 + _1356;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1362 = -_1350;
    float _1364 = _1362 + 1.0;
    float _1366 = _1350 * _1354;
    float _1368 = -_1004;
    int _1370 = _1294 ? as_type<int>(_1368) : as_type<int>(_1004);
    float _1372 = fma(_1338, _1358, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1374 = _1336 * _1364;
    float _1376 = -_1336;
    float _1378 = _1376 + 1.0;
    bool _1380 = _652 > 0.5;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1324 * _1374;
    bool _1386 = !_1286;
    float _1388 = _1386 ? _1004 : _1298;
    float _1390 = _1298;
    if (_1154)
    {
        float _1392 = _1242 + (-1.0);
        _1390 = _1392;
    }
    float _1394 = _1390;
    bool _1396 = !_1274;
    float _1398 = _1396 ? _1004 : as_type<float>(_1370);
    float _1400 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1384);
    float _1402 = -_1012;
    int _1404 = _1380 ? as_type<int>(_1402) : as_type<int>(_1012);
    if (_1154)
    {
        float _1406 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _1406;
    }
    float _1408 = _714;
    bool _1410 = !_1282;
    float _1412 = _1410 ? _1012 : as_type<float>(_1268);
    float _1414 = fma(_1372, _1366, _1400);
    bool _1416 = !_1292;
    float _1418 = _1416 ? _1012 : as_type<float>(_1404);
    float _1420 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1422 = _1398 + 0.5;
    if (_1154)
    {
        float _1424 = fma(_1152, _1242, _1408);
        _1172 = _1424;
    }
    float _1426 = _1172;
    float _1428 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = _1412 + (-0.5);
    float _1432 = fma(_1420, _1422, _886);
    float _1434 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1414);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1438 = -_1428;
    float _1440 = -_888;
    float _1442 = fma(_1438, _1430, _1440);
    float _1444 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1436);
    float _1450 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1454 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1468 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1486 = -_1418;
    float _1488 = _1486 + 0.5;
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1476);
    float _1492 = _1388 + 0.5;
    float _1494 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1508 = fma(_1412, _1246, _1442);
    float _1510 = _1500 * _1462;
    float _1512 = _1270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1520 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1536 = _1504 * _1382;
    float _1538 = -_1278;
    float _1540 = fma(_1398, _1538, _1432);
    float _1542 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1552 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1496);
    float _1556 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1506);
    out.m_38.x = _1512;
    out.m_57.x = _1548;
    out.m_57.y = _1530;
    out.m_57.z = _1532;
    out.m_57.w = _1516;
    out.m_59.x = _1542;
    out.m_59.y = _1544;
    out.m_59.z = _1546;
    out.m_59.w = _1550;
    out.m_61.x = _1536;
    out.m_61.y = _1510;
    out.m_61.z = _1540;
    out.m_61.w = _1508;
    out.gl_Position.x = _1552;
    out.gl_Position.y = _1554;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1556;
    out.m_63.x = _1232;
    out.m_63.y = _1234;
    out.m_63.z = _1236;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1613 = as_type<float>(_98);
        out.gl_Position.z = _1613;
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
        float _1683 = as_type<float>(_136);
        out.gl_Position.z = _1683;
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
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _178 = _154;
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
    float _194 = _140;
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
    float _230 = 1.4012984643248170709237295832899e-45;
    float _232 = _198;
    float _234 = _206;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _236 = _228;
    bool _238 = _218 > 0.0;
    float _240 = _146;
    float _242 = _236;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _240 = _244;
    }
    float _246 = _240;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_164)
    {
        _230 = _154;
    }
    float _252 = _230;
    float _254 = 0.0;
    float _256 = _252;
    if (!_220)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_220)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_224)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = -_226;
    float _276 = _222 + _274;
    float _278 = _222 * 6.283185482025146484375;
    float _280 = _214;
    if (_238)
    {
        float _282 = rsqrt(_212);
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_164;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _154 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _154);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _316;
        _234 = _306;
    }
    float _318 = _232;
    float _320 = _234;
    bool _322 = !_164;
    float _324 = _320;
    if (!_322)
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
        _256 = _344;
        _176 = _332;
    }
    float _346 = _256;
    float _348 = _176;
    float _350 = _278 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (_220)
    {
        float _360 = _246 * _148;
        _242 = _360;
    }
    float _362 = _242;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    if (!_224)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = _368;
    if (_220)
    {
        float _372 = _246 * _138;
        _262 = _372;
    }
    float _374 = _262;
    if (!_224)
    {
        _324 = 0.0;
    }
    float _376 = _324;
    float _378 = _376;
    if (_220)
    {
        float _380 = _246 * _166;
        _268 = _380;
    }
    float _382 = _268;
    if (!_224)
    {
        _178 = 0.0;
    }
    float _384 = _178;
    float _386 = _384;
    if (_224)
    {
        float _388 = _272 * _150;
        _370 = _388;
    }
    float _390 = _370;
    if (_224)
    {
        float _392 = _272 * _140;
        _378 = _392;
    }
    float _394 = _378;
    if (_224)
    {
        float _396 = _272 * _168;
        _386 = _396;
    }
    float _398 = _386;
    float _400 = in.m_50.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _408 = _406 != 0;
    float _410 = -_276;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _414 = 0.0;
    if (!_238)
    {
        _414 = 0.0;
    }
    float _416 = _414;
    float _418 = _416;
    if (_238)
    {
        float _420 = _284 * _152;
        _418 = _420;
    }
    float _422 = _418;
    float _424 = 0.0;
    if (!_238)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_238)
    {
        float _430 = _284 * _142;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 0.0;
    if (!_238)
    {
        _434 = 0.0;
    }
    float _436 = _434;
    float _438 = _436;
    if (_238)
    {
        float _440 = _284 * _170;
        _438 = _440;
    }
    float _442 = _438;
    bool _444 = _276 < 0.5;
    float _446 = float(_444);
    float _448 = in.m_35.x;
    float _450 = in.m_35.y;
    float _452 = in.m_35.z;
    float _454 = fma(_366, 0.5, 0.5);
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    float _460 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _462 = -_446;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_250;
    int _468 = _466 ? 0 : 1;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_458);
    float _476 = fma(_346, _352, _460);
    bool _478 = !_408;
    int _480 = _478 ? 0 : 1;
    float _482 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _488 = abs(_468);
    float _490 = fma(_346, _354, _482);
    int _492 = abs(_480);
    float _494 = float(_474);
    float _496 = float(_488);
    float _498 = abs(_412);
    float _500 = _494 * _498;
    float _502 = fma(_346, _356, _486);
    float _504 = fma(_476, _400, _448);
    float _506 = float(_492);
    float _508 = fma(_496, _472, _500);
    float _510 = fma(_490, _400, _450);
    float _512 = fma(_502, _400, _452);
    float _514 = abs(_464);
    float _516 = fma(_506, _514, _508);
    bool _518 = !_484;
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
    float _648 = in.m_48.w;
    float _650 = _210 * 2.0;
    float _652 = in.m_48.y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _674 = _672 != 0;
    float _676 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = floor(_650);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_656)
    {
        float _686 = in.m_48.z;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _692 = _660 * _116;
    float _694 = _646 * 2.0;
    float _696 = _652 * 2.0;
    float _698 = exp2(_692);
    bool _700 = _680 > 0.0;
    bool _702 = _680 >= 0.0;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    float _712 = _680;
    float _714 = _652;
    if (!_656)
    {
        _712 = _652;
    }
    float _716 = _712;
    int _718 = _710 ? 0 : 1;
    float _720 = floor(_694);
    float _722 = _716;
    if (_656)
    {
        _722 = _210;
    }
    float _724 = _722;
    int _726 = ~_718;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    if (!_700)
    {
        int _734 = ~_718;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _744 = floor(_696);
    float _746 = float(_738);
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -_682;
    float _754 = fma(_742, 2.0, _752);
    bool _756 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _764 = _760 || _762;
    float _766 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _740);
    bool _768 = _720 > 0.0;
    bool _770 = _720 >= 0.0;
    bool _772 = isnan(_720);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _720;
    float _782 = _688;
    if (!_656)
    {
        _780 = _688;
    }
    float _784 = _780;
    float _786 = _784;
    if (_656)
    {
        _782 = _652;
    }
    float _788 = _782;
    if (_656)
    {
        _786 = _652;
    }
    float _790 = _786;
    int _792 = _778 ? 0 : 1;
    float _794 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].w, _662);
    float _796 = _210 + _652;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = _796 + (-1.0);
    int _808 = _804;
    if (!_768)
    {
        int _810 = ~_792;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = fma(_798, -2.0, _690);
    float _818 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _646 + _652;
    bool _822 = !_670;
    int _824 = _822 ? 0 : 1;
    bool _826 = !_666;
    int _828 = _826 ? 0 : 1;
    float _830 = _820 + (-1.0);
    int _832 = abs(_824);
    int _834 = abs(_828);
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = in.m_52.x;
    float _850 = in.m_52.y;
    float _852 = in.m_52.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _856 = 1.0 + _854;
    float _858 = float(_832);
    float _860 = float(_834);
    float _862 = float(_814);
    float _864 = 1.0 / _856;
    bool _866 = _744 > 0.0;
    float _868 = _858 * _746;
    float _870 = _764 ? _750 : 0.0;
    float _872 = _860 * _862;
    bool _874 = _744 >= 0.0;
    bool _876 = isnan(_744);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_116;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _888 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _816);
    float _890 = _868 * (-2.0);
    bool _892 = !_674;
    int _894 = _892 ? 0 : 1;
    float _896 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _898 = _652 + (-0.5);
    int _900 = abs(_894);
    if (_846)
    {
        float _902 = _870 * _864;
        _118 = _902;
    }
    float _904 = _118;
    int _906 = _882 ? 0 : 1;
    float _908 = fma(_890, _850, _850);
    float _910 = fma(_836, _890, _836);
    int _912 = ~_906;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    int _920 = _916;
    if (!_866)
    {
        int _922 = ~_906;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _872 * (-2.0);
    float _930 = fma(_910, _904, _918);
    float _932 = float(_926);
    float _934 = _210 + (-0.5);
    float _936 = float(_900);
    float _938 = fma(_928, _848, _848);
    float _940 = fma(_818, _928, _818);
    float _942 = _210 + _646;
    float _944 = as_type<float>(int(gl_VertexIndex));
    float _946 = _936 * _932;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = _942 + (-1.0);
    float _952 = in.m_50.x;
    float _954 = in.m_50.y;
    float _956 = _946 * (-2.0);
    float _958 = fma(_940, _904, _948);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _962 = _930 * 0.15915493667125701904296875;
    float _964 = fma(_956, _852, _852);
    float _966 = _646 + (-0.5);
    float _968 = _958 * 0.15915493667125701904296875;
    float _970 = fma(_960, _956, _960);
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _978 = fma(_970, _904, _976);
    float _980 = _962 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _978 * 0.15915493667125701904296875;
    int _986 = as_type<int>(_944) & 1;
    bool _988 = _986 != 0;
    int _990 = as_type<int>(_944) & 2;
    bool _992 = _990 != 0;
    float _994 = _614 * _952;
    float _996 = _968 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _510 * _168;
    bool _1002 = !_988;
    float _1004 = _1002 ? (-0.5) : 0.5;
    float _1006 = _616 * _954;
    float _1008 = _510 * _150;
    bool _1010 = !_992;
    float _1012 = _1010 ? (-0.5) : 0.5;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1018 = _968 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1026 = _1014 * _1016;
    float _1028 = fma(_504, _148, _1008);
    float _1030 = in.m_46.w;
    float _1032 = fma(_504, _166, _1000);
    float _1034 = _1022 * _1024;
    float _1036 = _984 * 6.283185482025146484375;
    float _1038 = cos(_1036);
    float _1040 = _998 * _974;
    float _1042 = in.m_44.w;
    float _1044 = _998 * _982;
    float _1046 = fma(_512, _170, _1032);
    float _1048 = _510 * _140;
    float _1050 = _984 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _1020 * _982;
    float _1056 = _1020 * _974;
    float _1058 = fma(_504, _138, _1048);
    float _1060 = fma(_512, _142, _1058);
    float _1062 = _1038 * _676;
    float _1064 = _974 * _1038;
    float _1066 = _982 * _1038;
    float _1068 = _1020 * _1062;
    float _1070 = _998 * _1062;
    float _1072 = _1046 + _1030;
    float _1074 = fma(_1052, _1054, _1040);
    float _1076 = _1052 * _676;
    float _1078 = -_1044;
    float _1080 = fma(_1052, _1056, _1078);
    float _1082 = -_1056;
    float _1084 = fma(_1052, _1044, _1082);
    float _1086 = fma(_1074, _1026, _1068);
    float _1088 = -_1076;
    float _1090 = fma(_1066, _1026, _1088);
    float _1092 = fma(_1052, _1040, _1054);
    float _1094 = fma(_1084, _1026, _1070);
    float _1096 = -_1034;
    float _1098 = fma(_1080, _1096, _1086);
    float _1100 = -_1034;
    float _1102 = fma(_1064, _1100, _1090);
    float _1104 = -_1034;
    float _1106 = fma(_1092, _1104, _1094);
    float _1108 = _1098 * _398;
    float _1110 = _1098 * _390;
    float _1112 = fma(_512, _152, _1028);
    float _1114 = _1098 * _394;
    float _1116 = fma(_1102, _382, _1108);
    float _1118 = fma(_1102, _362, _1110);
    float _1120 = _1112 + _1042;
    float _1122 = fma(_1102, _374, _1114);
    float _1124 = fma(_1106, _442, _1116);
    float _1126 = fma(_1106, _422, _1118);
    float _1128 = fma(_1106, _432, _1122);
    float _1130 = _1072 + _1124;
    float _1132 = _1120 + _1126;
    float _1134 = in.m_42.w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1132 + _1140;
    float _1144 = _1138 * _1138;
    float _1146 = fma(_1142, _1142, _1144);
    float _1148 = sqrt(_1146);
    float _1150 = _1060 + _1134;
    float _1152 = _1150 + _1128;
    bool _1154 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1148 + _1156;
    float _1160 = _1118;
    float _1162 = _1102;
    float _1164 = _1148;
    float _1166 = _1132;
    float _1168 = _1130;
    float _1170 = _1122;
    float _1172 = _1152;
    if (_1154)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    if (_1154)
    {
        float _1178 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1178;
    }
    float _1180 = _1162;
    float _1182 = _1176;
    float _1184 = _1180;
    if (_1154)
    {
        float _1186 = _1158 * _1176;
        _1164 = _1186;
    }
    float _1188 = _1164;
    if (_1154)
    {
        float _1190 = rsqrt(_1146);
        _1182 = _1190;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1154)
    {
        float _1196 = _1188 * 0.15915493667125701904296875;
        _194 = _1196;
    }
    float _1198 = _194;
    float _1200 = _1188;
    if (_1154)
    {
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    if (_1154)
    {
        float _1208 = fma(_1206, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1184 = _1208;
    }
    float _1210 = _1184;
    if (_1154)
    {
        float _1212 = _1192 * _1210;
        _1194 = _1212;
    }
    float _1214 = _1194;
    if (_1154)
    {
        float _1216 = fma(_1142, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1166 = _1216;
    }
    float _1218 = _1166;
    if (_1154)
    {
        float _1220 = fma(_1138, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1220;
    }
    float _1222 = _1168;
    float _1224 = fma(_1218, 6.2500002968590706586837768554688e-05, 0.5);
    float _1226 = fma(_1222, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3270 = float2(_1224, _1226);
    float3 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3270, float2(0.0), isnan(_3270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3270, float2(0.0), isnan(_3270)), level(0.0)).xyz;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    if (_1154)
    {
        float _1238 = _1198 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        _1170 = _1240;
    }
    float _1242 = _1170;
    float _1244 = -_896;
    float _1246 = _1244 + 1.0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1250 = _1248 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1252 = _210 > 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1258 = _648 > 0.5;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1260;
    float _1264 = 1.0 / _1250;
    float _1266 = -_1012;
    int _1268 = _1258 ? as_type<int>(_1266) : as_type<int>(_1012);
    float _1270 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    float _1276 = -_766;
    float _1278 = _1276 + 1.0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1256;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1292 = _1290 != 0;
    bool _1294 = _646 > 0.5;
    float _1296 = -_1004;
    float _1298 = _1252 ? _1296 : _1004;
    float _1300 = _1262 * _1264;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1308 = _644 + _1306;
    bool _1310 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1312 = isnan(_644);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1324 = fma(_1300, _1308, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1326 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1328 = isnan(_644);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1304 * _1288;
    bool _1340 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1342 = isnan(_644);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1358 = _644 + _1356;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1362 = -_1350;
    float _1364 = _1362 + 1.0;
    float _1366 = _1350 * _1354;
    float _1368 = -_1004;
    int _1370 = _1294 ? as_type<int>(_1368) : as_type<int>(_1004);
    float _1372 = fma(_1338, _1358, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1374 = _1336 * _1364;
    float _1376 = -_1336;
    float _1378 = _1376 + 1.0;
    bool _1380 = _652 > 0.5;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1324 * _1374;
    bool _1386 = !_1286;
    float _1388 = _1386 ? _1004 : _1298;
    float _1390 = _1298;
    if (_1154)
    {
        float _1392 = _1242 + (-1.0);
        _1390 = _1392;
    }
    float _1394 = _1390;
    bool _1396 = !_1274;
    float _1398 = _1396 ? _1004 : as_type<float>(_1370);
    float _1400 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1384);
    float _1402 = -_1012;
    int _1404 = _1380 ? as_type<int>(_1402) : as_type<int>(_1012);
    if (_1154)
    {
        float _1406 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _1406;
    }
    float _1408 = _714;
    bool _1410 = !_1282;
    float _1412 = _1410 ? _1012 : as_type<float>(_1268);
    float _1414 = fma(_1372, _1366, _1400);
    bool _1416 = !_1292;
    float _1418 = _1416 ? _1012 : as_type<float>(_1404);
    float _1420 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1422 = _1398 + 0.5;
    if (_1154)
    {
        float _1424 = fma(_1152, _1242, _1408);
        _1172 = _1424;
    }
    float _1426 = _1172;
    float _1428 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = _1412 + (-0.5);
    float _1432 = fma(_1420, _1422, _886);
    float _1434 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1414);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1438 = -_1428;
    float _1440 = -_888;
    float _1442 = fma(_1438, _1430, _1440);
    float _1444 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1436);
    float _1450 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1454 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1468 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1486 = -_1418;
    float _1488 = _1486 + 0.5;
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1476);
    float _1492 = _1388 + 0.5;
    float _1494 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1508 = fma(_1412, _1246, _1442);
    float _1510 = _1500 * _1462;
    float _1512 = _1270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1520 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1536 = _1504 * _1382;
    float _1538 = -_1278;
    float _1540 = fma(_1398, _1538, _1432);
    float _1542 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1552 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1496);
    float _1556 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1506);
    out.m_38.x = _1512;
    out.m_57.x = _1548;
    out.m_57.y = _1530;
    out.m_57.z = _1532;
    out.m_57.w = _1516;
    out.m_59.x = _1542;
    out.m_59.y = _1544;
    out.m_59.z = _1546;
    out.m_59.w = _1550;
    out.m_61.x = _1536;
    out.m_61.y = _1510;
    out.m_61.z = _1540;
    out.m_61.w = _1508;
    out.gl_Position.x = _1552;
    out.gl_Position.y = _1554;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1556;
    out.m_63.x = _1232;
    out.m_63.y = _1234;
    out.m_63.z = _1236;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1613 = as_type<float>(_98);
        out.gl_Position.z = _1613;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1683 = as_type<float>(_136);
        out.gl_Position.z = _1683;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _178 = _154;
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
    float _194 = _140;
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
    float _230 = 1.4012984643248170709237295832899e-45;
    float _232 = _198;
    float _234 = _206;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _236 = _228;
    bool _238 = _218 > 0.0;
    float _240 = _146;
    float _242 = _236;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _240 = _244;
    }
    float _246 = _240;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_164)
    {
        _230 = _154;
    }
    float _252 = _230;
    float _254 = 0.0;
    float _256 = _252;
    if (!_220)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _258;
    if (!_220)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (_224)
    {
        float _270 = rsqrt(_208);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = -_226;
    float _276 = _222 + _274;
    float _278 = _222 * 6.283185482025146484375;
    float _280 = _214;
    if (_238)
    {
        float _282 = rsqrt(_212);
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_164;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _154 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _154);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _316;
        _234 = _306;
    }
    float _318 = _232;
    float _320 = _234;
    bool _322 = !_164;
    float _324 = _320;
    if (!_322)
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
        _256 = _344;
        _176 = _332;
    }
    float _346 = _256;
    float _348 = _176;
    float _350 = _278 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (_220)
    {
        float _360 = _246 * _148;
        _242 = _360;
    }
    float _362 = _242;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    if (!_224)
    {
        _358 = 0.0;
    }
    float _368 = _358;
    float _370 = _368;
    if (_220)
    {
        float _372 = _246 * _138;
        _262 = _372;
    }
    float _374 = _262;
    if (!_224)
    {
        _324 = 0.0;
    }
    float _376 = _324;
    float _378 = _376;
    if (_220)
    {
        float _380 = _246 * _166;
        _268 = _380;
    }
    float _382 = _268;
    if (!_224)
    {
        _178 = 0.0;
    }
    float _384 = _178;
    float _386 = _384;
    if (_224)
    {
        float _388 = _272 * _150;
        _370 = _388;
    }
    float _390 = _370;
    if (_224)
    {
        float _392 = _272 * _140;
        _378 = _392;
    }
    float _394 = _378;
    if (_224)
    {
        float _396 = _272 * _168;
        _386 = _396;
    }
    float _398 = _386;
    float _400 = in.m_50.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _408 = _406 != 0;
    float _410 = -_276;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _414 = 0.0;
    if (!_238)
    {
        _414 = 0.0;
    }
    float _416 = _414;
    float _418 = _416;
    if (_238)
    {
        float _420 = _284 * _152;
        _418 = _420;
    }
    float _422 = _418;
    float _424 = 0.0;
    if (!_238)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_238)
    {
        float _430 = _284 * _142;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 0.0;
    if (!_238)
    {
        _434 = 0.0;
    }
    float _436 = _434;
    float _438 = _436;
    if (_238)
    {
        float _440 = _284 * _170;
        _438 = _440;
    }
    float _442 = _438;
    bool _444 = _276 < 0.5;
    float _446 = float(_444);
    float _448 = in.m_35.x;
    float _450 = in.m_35.y;
    float _452 = in.m_35.z;
    float _454 = fma(_366, 0.5, 0.5);
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    float _460 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _462 = -_446;
    float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _466 = !_250;
    int _468 = _466 ? 0 : 1;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_458);
    float _476 = fma(_346, _352, _460);
    bool _478 = !_408;
    int _480 = _478 ? 0 : 1;
    float _482 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _488 = abs(_468);
    float _490 = fma(_346, _354, _482);
    int _492 = abs(_480);
    float _494 = float(_474);
    float _496 = float(_488);
    float _498 = abs(_412);
    float _500 = _494 * _498;
    float _502 = fma(_346, _356, _486);
    float _504 = fma(_476, _400, _448);
    float _506 = float(_492);
    float _508 = fma(_496, _472, _500);
    float _510 = fma(_490, _400, _450);
    float _512 = fma(_502, _400, _452);
    float _514 = abs(_464);
    float _516 = fma(_506, _514, _508);
    bool _518 = !_484;
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
    float _648 = in.m_48.w;
    float _650 = _210 * 2.0;
    float _652 = in.m_48.y;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _656 = _654 != 0;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _666 = _664 != 0;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _674 = _672 != 0;
    float _676 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = floor(_650);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_656)
    {
        float _686 = in.m_48.z;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _692 = _660 * _116;
    float _694 = _646 * 2.0;
    float _696 = _652 * 2.0;
    float _698 = exp2(_692);
    bool _700 = _680 > 0.0;
    bool _702 = _680 >= 0.0;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    float _712 = _680;
    float _714 = _652;
    if (!_656)
    {
        _712 = _652;
    }
    float _716 = _712;
    int _718 = _710 ? 0 : 1;
    float _720 = floor(_694);
    float _722 = _716;
    if (_656)
    {
        _722 = _210;
    }
    float _724 = _722;
    int _726 = ~_718;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    if (!_700)
    {
        int _734 = ~_718;
        int _736 = _734 + 1;
        _732 = _736;
    }
    int _738 = _732;
    float _740 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _744 = floor(_696);
    float _746 = float(_738);
    float _748 = -_698;
    float _750 = _748 + 1.0;
    float _752 = -_682;
    float _754 = fma(_742, 2.0, _752);
    bool _756 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _764 = _760 || _762;
    float _766 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _740);
    bool _768 = _720 > 0.0;
    bool _770 = _720 >= 0.0;
    bool _772 = isnan(_720);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = _720;
    float _782 = _688;
    if (!_656)
    {
        _780 = _688;
    }
    float _784 = _780;
    float _786 = _784;
    if (_656)
    {
        _782 = _652;
    }
    float _788 = _782;
    if (_656)
    {
        _786 = _652;
    }
    float _790 = _786;
    int _792 = _778 ? 0 : 1;
    float _794 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].w, _662);
    float _796 = _210 + _652;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = _796 + (-1.0);
    int _808 = _804;
    if (!_768)
    {
        int _810 = ~_792;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = fma(_798, -2.0, _690);
    float _818 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _646 + _652;
    bool _822 = !_670;
    int _824 = _822 ? 0 : 1;
    bool _826 = !_666;
    int _828 = _826 ? 0 : 1;
    float _830 = _820 + (-1.0);
    int _832 = abs(_824);
    int _834 = abs(_828);
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = in.m_52.x;
    float _850 = in.m_52.y;
    float _852 = in.m_52.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _856 = 1.0 + _854;
    float _858 = float(_832);
    float _860 = float(_834);
    float _862 = float(_814);
    float _864 = 1.0 / _856;
    bool _866 = _744 > 0.0;
    float _868 = _858 * _746;
    float _870 = _764 ? _750 : 0.0;
    float _872 = _860 * _862;
    bool _874 = _744 >= 0.0;
    bool _876 = isnan(_744);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_116;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _888 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _816);
    float _890 = _868 * (-2.0);
    bool _892 = !_674;
    int _894 = _892 ? 0 : 1;
    float _896 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _898 = _652 + (-0.5);
    int _900 = abs(_894);
    if (_846)
    {
        float _902 = _870 * _864;
        _118 = _902;
    }
    float _904 = _118;
    int _906 = _882 ? 0 : 1;
    float _908 = fma(_890, _850, _850);
    float _910 = fma(_836, _890, _836);
    int _912 = ~_906;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _908);
    int _920 = _916;
    if (!_866)
    {
        int _922 = ~_906;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _872 * (-2.0);
    float _930 = fma(_910, _904, _918);
    float _932 = float(_926);
    float _934 = _210 + (-0.5);
    float _936 = float(_900);
    float _938 = fma(_928, _848, _848);
    float _940 = fma(_818, _928, _818);
    float _942 = _210 + _646;
    float _944 = as_type<float>(int(gl_VertexIndex));
    float _946 = _936 * _932;
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = _942 + (-1.0);
    float _952 = in.m_50.x;
    float _954 = in.m_50.y;
    float _956 = _946 * (-2.0);
    float _958 = fma(_940, _904, _948);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _962 = _930 * 0.15915493667125701904296875;
    float _964 = fma(_956, _852, _852);
    float _966 = _646 + (-0.5);
    float _968 = _958 * 0.15915493667125701904296875;
    float _970 = fma(_960, _956, _960);
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _978 = fma(_970, _904, _976);
    float _980 = _962 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _978 * 0.15915493667125701904296875;
    int _986 = as_type<int>(_944) & 1;
    bool _988 = _986 != 0;
    int _990 = as_type<int>(_944) & 2;
    bool _992 = _990 != 0;
    float _994 = _614 * _952;
    float _996 = _968 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _510 * _168;
    bool _1002 = !_988;
    float _1004 = _1002 ? (-0.5) : 0.5;
    float _1006 = _616 * _954;
    float _1008 = _510 * _150;
    bool _1010 = !_992;
    float _1012 = _1010 ? (-0.5) : 0.5;
    float _1014 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1018 = _968 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1026 = _1014 * _1016;
    float _1028 = fma(_504, _148, _1008);
    float _1030 = in.m_46.w;
    float _1032 = fma(_504, _166, _1000);
    float _1034 = _1022 * _1024;
    float _1036 = _984 * 6.283185482025146484375;
    float _1038 = cos(_1036);
    float _1040 = _998 * _974;
    float _1042 = in.m_44.w;
    float _1044 = _998 * _982;
    float _1046 = fma(_512, _170, _1032);
    float _1048 = _510 * _140;
    float _1050 = _984 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = _1020 * _982;
    float _1056 = _1020 * _974;
    float _1058 = fma(_504, _138, _1048);
    float _1060 = fma(_512, _142, _1058);
    float _1062 = _1038 * _676;
    float _1064 = _974 * _1038;
    float _1066 = _982 * _1038;
    float _1068 = _1020 * _1062;
    float _1070 = _998 * _1062;
    float _1072 = _1046 + _1030;
    float _1074 = fma(_1052, _1054, _1040);
    float _1076 = _1052 * _676;
    float _1078 = -_1044;
    float _1080 = fma(_1052, _1056, _1078);
    float _1082 = -_1056;
    float _1084 = fma(_1052, _1044, _1082);
    float _1086 = fma(_1074, _1026, _1068);
    float _1088 = -_1076;
    float _1090 = fma(_1066, _1026, _1088);
    float _1092 = fma(_1052, _1040, _1054);
    float _1094 = fma(_1084, _1026, _1070);
    float _1096 = -_1034;
    float _1098 = fma(_1080, _1096, _1086);
    float _1100 = -_1034;
    float _1102 = fma(_1064, _1100, _1090);
    float _1104 = -_1034;
    float _1106 = fma(_1092, _1104, _1094);
    float _1108 = _1098 * _398;
    float _1110 = _1098 * _390;
    float _1112 = fma(_512, _152, _1028);
    float _1114 = _1098 * _394;
    float _1116 = fma(_1102, _382, _1108);
    float _1118 = fma(_1102, _362, _1110);
    float _1120 = _1112 + _1042;
    float _1122 = fma(_1102, _374, _1114);
    float _1124 = fma(_1106, _442, _1116);
    float _1126 = fma(_1106, _422, _1118);
    float _1128 = fma(_1106, _432, _1122);
    float _1130 = _1072 + _1124;
    float _1132 = _1120 + _1126;
    float _1134 = in.m_42.w;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1142 = _1132 + _1140;
    float _1144 = _1138 * _1138;
    float _1146 = fma(_1142, _1142, _1144);
    float _1148 = sqrt(_1146);
    float _1150 = _1060 + _1134;
    float _1152 = _1150 + _1128;
    bool _1154 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1158 = _1148 + _1156;
    float _1160 = _1118;
    float _1162 = _1102;
    float _1164 = _1148;
    float _1166 = _1132;
    float _1168 = _1130;
    float _1170 = _1122;
    float _1172 = _1152;
    if (_1154)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    if (_1154)
    {
        float _1178 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1178;
    }
    float _1180 = _1162;
    float _1182 = _1176;
    float _1184 = _1180;
    if (_1154)
    {
        float _1186 = _1158 * _1176;
        _1164 = _1186;
    }
    float _1188 = _1164;
    if (_1154)
    {
        float _1190 = rsqrt(_1146);
        _1182 = _1190;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1154)
    {
        float _1196 = _1188 * 0.15915493667125701904296875;
        _194 = _1196;
    }
    float _1198 = _194;
    float _1200 = _1188;
    if (_1154)
    {
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1200 = _1204;
    }
    float _1206 = _1200;
    if (_1154)
    {
        float _1208 = fma(_1206, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1184 = _1208;
    }
    float _1210 = _1184;
    if (_1154)
    {
        float _1212 = _1192 * _1210;
        _1194 = _1212;
    }
    float _1214 = _1194;
    if (_1154)
    {
        float _1216 = fma(_1142, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1166 = _1216;
    }
    float _1218 = _1166;
    if (_1154)
    {
        float _1220 = fma(_1138, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1220;
    }
    float _1222 = _1168;
    float _1224 = fma(_1218, 6.2500002968590706586837768554688e-05, 0.5);
    float _1226 = fma(_1222, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3270 = float2(_1224, _1226);
    float3 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3270, float2(0.0), isnan(_3270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3270, float2(0.0), isnan(_3270)), level(0.0)).xyz;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    if (_1154)
    {
        float _1238 = _1198 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        _1170 = _1240;
    }
    float _1242 = _1170;
    float _1244 = -_896;
    float _1246 = _1244 + 1.0;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1250 = _1248 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1252 = _210 > 0.5;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1258 = _648 > 0.5;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1260;
    float _1264 = 1.0 / _1250;
    float _1266 = -_1012;
    int _1268 = _1258 ? as_type<int>(_1266) : as_type<int>(_1012);
    float _1270 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1274 = _1272 != 0;
    float _1276 = -_766;
    float _1278 = _1276 + 1.0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1286 = _1284 != 0;
    float _1288 = 1.0 / _1256;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1292 = _1290 != 0;
    bool _1294 = _646 > 0.5;
    float _1296 = -_1004;
    float _1298 = _1252 ? _1296 : _1004;
    float _1300 = _1262 * _1264;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1308 = _644 + _1306;
    bool _1310 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1312 = isnan(_644);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1324 = fma(_1300, _1308, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1326 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1328 = isnan(_644);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1304 * _1288;
    bool _1340 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1342 = isnan(_644);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1320;
    float _1354 = _1352 + 1.0;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1358 = _644 + _1356;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1362 = -_1350;
    float _1364 = _1362 + 1.0;
    float _1366 = _1350 * _1354;
    float _1368 = -_1004;
    int _1370 = _1294 ? as_type<int>(_1368) : as_type<int>(_1004);
    float _1372 = fma(_1338, _1358, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1374 = _1336 * _1364;
    float _1376 = -_1336;
    float _1378 = _1376 + 1.0;
    bool _1380 = _652 > 0.5;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1384 = _1324 * _1374;
    bool _1386 = !_1286;
    float _1388 = _1386 ? _1004 : _1298;
    float _1390 = _1298;
    if (_1154)
    {
        float _1392 = _1242 + (-1.0);
        _1390 = _1392;
    }
    float _1394 = _1390;
    bool _1396 = !_1274;
    float _1398 = _1396 ? _1004 : as_type<float>(_1370);
    float _1400 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1384);
    float _1402 = -_1012;
    int _1404 = _1380 ? as_type<int>(_1402) : as_type<int>(_1012);
    if (_1154)
    {
        float _1406 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _1406;
    }
    float _1408 = _714;
    bool _1410 = !_1282;
    float _1412 = _1410 ? _1012 : as_type<float>(_1268);
    float _1414 = fma(_1372, _1366, _1400);
    bool _1416 = !_1292;
    float _1418 = _1416 ? _1012 : as_type<float>(_1404);
    float _1420 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1422 = _1398 + 0.5;
    if (_1154)
    {
        float _1424 = fma(_1152, _1242, _1408);
        _1172 = _1424;
    }
    float _1426 = _1172;
    float _1428 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = _1412 + (-0.5);
    float _1432 = fma(_1420, _1422, _886);
    float _1434 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1414);
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1438 = -_1428;
    float _1440 = -_888;
    float _1442 = fma(_1438, _1430, _1440);
    float _1444 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1448 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1436);
    float _1450 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1454 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1456 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1448);
    float _1458 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1452);
    float _1462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1466 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1454);
    float _1468 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1478 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1480 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1484 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1486 = -_1418;
    float _1488 = _1486 + 0.5;
    float _1490 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1476);
    float _1492 = _1388 + 0.5;
    float _1494 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1478);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1506 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1494);
    float _1508 = fma(_1412, _1246, _1442);
    float _1510 = _1500 * _1462;
    float _1512 = _1270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1520 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1498);
    float _1536 = _1504 * _1382;
    float _1538 = -_1278;
    float _1540 = fma(_1398, _1538, _1432);
    float _1542 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1552 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1496);
    float _1556 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1506);
    out.m_38.x = _1512;
    out.m_57.x = _1548;
    out.m_57.y = _1530;
    out.m_57.z = _1532;
    out.m_57.w = _1516;
    out.m_59.x = _1542;
    out.m_59.y = _1544;
    out.m_59.z = _1546;
    out.m_59.w = _1550;
    out.m_61.x = _1536;
    out.m_61.y = _1510;
    out.m_61.z = _1540;
    out.m_61.w = _1508;
    out.gl_Position.x = _1552;
    out.gl_Position.y = _1554;
    out.gl_Position.z = _1534;
    out.gl_Position.w = _1556;
    out.m_63.x = _1232;
    out.m_63.y = _1234;
    out.m_63.z = _1236;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

