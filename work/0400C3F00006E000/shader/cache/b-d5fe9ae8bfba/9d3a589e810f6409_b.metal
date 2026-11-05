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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_73 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_124);
        out.gl_Position.z = _1525;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    bool _142 = _106 >= _140;
    bool _144 = !_136;
    bool _146 = _142 || _144;
    if (_146)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    out.m_53.x = _138;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_152);
        out.gl_Position.z = _1584;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _140;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    float _276 = fma(_270, _154, _180);
    float _278 = _106 * _156;
    bool _280 = !_258;
    float _282 = _278;
    if (!_280)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _282 = _296;
    }
    float _298 = _282;
    float _300 = in.m_51.z;
    float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _304 = log2(_302);
    float _306 = _138 * 2.0;
    float _308 = in.m_51.y;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _320 = _318 != 0;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = floor(_306);
    float _330 = _304 * _106;
    float _332 = exp2(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _336 = 1.0 + _334;
    float _338 = _300 * 2.0;
    bool _340 = _328 > 0.0;
    bool _342 = _328 >= 0.0;
    bool _344 = isnan(_328);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _308 + _300;
    float _354 = floor(_338);
    float _356 = fma(_138, 100.0, _106);
    float _358 = _352 + (-1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _362 = _138 + _308;
    float _364 = _308 * 2.0;
    float _366 = 1.0 / _336;
    float _368 = in.m_59.x;
    float _370 = in.m_59.y;
    float _372 = _362 + (-1.0);
    float _374 = -_332;
    float _376 = _374 + 1.0;
    float _378 = _308 + (-0.5);
    bool _380 = _354 > 0.0;
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _354 >= 0.0;
    bool _386 = isnan(_354);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _356 * 0.100000001490116119384765625;
    int _396 = _350 ? 0 : 1;
    float _398 = floor(_364);
    float _400 = _356 * 0.800000011920928955078125;
    bool _402 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(1.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_324, 8.0, _394);
    int _414 = ~_396;
    int _416 = _414 + 1;
    int _418 = _416 + 1;
    int _420 = _418;
    if (!_340)
    {
        int _422 = ~_396;
        int _424 = _422 + 1;
        _420 = _424;
    }
    int _426 = _420;
    bool _428 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _436 = _432 || _434;
    float _438 = fma(_324, 12.0, _400);
    bool _440 = !_316;
    int _442 = _440 ? 0 : 1;
    float _444 = _436 ? _376 : 0.0;
    float _446 = fma(_438, 0.100000001490116119384765625, _412);
    int _448 = abs(_442);
    float _450 = in.m_61.x;
    float _452 = in.m_61.y;
    float _454 = in.m_61.z;
    bool _456 = _398 > 0.0;
    if (_410)
    {
        float _458 = _444 * _366;
        _116 = _458;
    }
    float _460 = _116;
    float _462 = fma(_370, 1.5, _446);
    bool _464 = _398 >= 0.0;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = float(_448);
    float _476 = float(_426);
    int _478 = _472 ? 0 : 1;
    int _480 = _392 ? 0 : 1;
    float _482 = _474 * _476;
    bool _484 = !_312;
    int _486 = _484 ? 0 : 1;
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    int _494 = ~_480;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    int _500 = _492;
    int _502 = _498;
    if (!_456)
    {
        int _504 = ~_478;
        int _506 = _504 + 1;
        _500 = _506;
    }
    int _508 = _500;
    float _510 = _482 * (-2.0);
    if (!_380)
    {
        int _512 = ~_480;
        int _514 = _512 + 1;
        _502 = _514;
    }
    int _516 = _502;
    int _518 = abs(_486);
    float _520 = fma(_510, _452, _452);
    float _522 = float(_516);
    float _524 = fma(_360, _510, _360);
    float _526 = float(_518);
    float _528 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].y, _520);
    bool _530 = !_320;
    int _532 = _530 ? 0 : 1;
    float _534 = _462 * 0.15915493667125701904296875;
    float _536 = float(_508);
    float _538 = _526 * _522;
    int _540 = abs(_532);
    float _542 = fma(_524, _460, _528);
    float _544 = _138 + (-0.5);
    float _546 = _538 * (-2.0);
    float _548 = float(_540);
    float _550 = _138 + _300;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = fma(_546, _450, _450);
    float _558 = _548 * _536;
    float _560 = _550 + (-1.0);
    float _562 = fma(_382, _546, _382);
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].x, _556);
    float _566 = _558 * (-2.0);
    float _568 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = fma(_562, _460, _564);
    float _578 = precise::max(_324, -1.0);
    float _580 = fma(_566, _454, _454);
    float _582 = in.m_63.x;
    float _584 = in.m_63.y;
    float _586 = in.m_63.z;
    float _588 = _300 + (-0.5);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = fma(_568, _566, _568);
    float _594 = precise::min(0.0, _578);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _580);
    float _598 = fma(_554, 0.60000002384185791015625, 0.400000035762786865234375);
    float _600 = _542 * 0.15915493667125701904296875;
    float _602 = _590 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_594, 0.5, 1.0);
    float _608 = fma(_592, _460, _596);
    float _610 = _598 * _606;
    float _612 = _608 * 0.15915493667125701904296875;
    float _614 = _600 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _620 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _622 = _570 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = fma(_582, _618, _322);
    float _628 = fma(_584, _618, _324);
    float _630 = _600 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(_586, _618, _326);
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _644 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _634);
    float _648 = _612 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _636 * _640;
    float _654 = _638 * _642;
    float _656 = _644 * _646;
    float _658 = _604 * _616;
    float _660 = _590 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _604 * _632;
    float _666 = _612 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _604 * _650;
    float _672 = _632 * _650;
    float _674 = _662 * _632;
    float _676 = _662 * _650;
    float _678 = _662 * _616;
    float _680 = _616 * _650;
    float _682 = _676 * _654;
    float _684 = fma(_668, _674, _658);
    float _686 = fma(_668, _658, _674);
    float _688 = -_678;
    float _690 = fma(_668, _664, _688);
    float _692 = -_664;
    float _694 = fma(_668, _678, _692);
    float _696 = -_654;
    float _698 = _668 * _696;
    float _700 = fma(_684, _652, _682);
    float _702 = _670 * _654;
    float _704 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_672, _652, _698);
    float _708 = fma(_694, _656, _700);
    float _710 = fma(_690, _652, _702);
    float _712 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = fma(_680, _656, _706);
    float _718 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _720 = fma(_686, _656, _710);
    float _722 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _724 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    float _726 = _708 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _718);
    float _730 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _738 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _734);
    float _742 = _732 + _736;
    float _744 = _738 + _740;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _748 = _742 + _746;
    float _750 = _708 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _744 + _752;
    float _756 = _748 * _748;
    float _758 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _750);
    float _760 = fma(_754, _754, _756);
    float _762 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _758);
    float _766 = sqrt(_760);
    float _768 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _762);
    float _770 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _772 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _772 + _764;
    bool _776 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = _762;
    float _780 = _764;
    float _782 = _750;
    float _784 = _774;
    float _786 = _584;
    float _788 = _582;
    float _790 = _586;
    if (!_776)
    {
        _778 = _744;
    }
    float _792 = _778;
    float _794 = _792;
    if (!_776)
    {
        _780 = _742;
    }
    float _796 = _780;
    float _798 = _796;
    if (!_776)
    {
        _782 = _774;
    }
    float _800 = _782;
    bool _802 = !_776;
    float _804 = _800;
    if (!_802)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _810 = _766 + _808;
        float _812 = rsqrt(_760);
        float _814 = _810 * _806;
        float _816 = _774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = _814 * 0.15915493667125701904296875;
        float _820 = _818 * 6.283185482025146484375;
        float _822 = cos(_820);
        float _824 = _818 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = _822 + (-1.0);
        float _830 = _828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _834 = fma(_774, _822, _830);
        float _836 = _812 * _832;
        float _838 = fma(_754, _836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _840 = fma(_748, _836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _804 = _834;
        _794 = _838;
        _798 = _840;
    }
    float _842 = _804;
    float _844 = _794;
    float _846 = _798;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _842 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _844 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _854 * _870;
    float _874 = _858 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _862;
    float _892 = _866;
    float _894 = _888;
    float _896 = _850;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    float _912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_884)
    {
        float _914 = _910 * 0.15915493667125701904296875;
        _784 = _914;
    }
    float _916 = _784;
    float _918 = _858;
    float _920 = _916;
    if (_884)
    {
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        _918 = _924;
    }
    float _926 = _918;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _930 = precise::max(0.0, _928);
    float _932 = _900;
    float _934 = _930;
    if (_884)
    {
        float _936 = _916 * 6.283185482025146484375;
        float _938 = cos(_936);
        _932 = _938;
    }
    float _940 = _932;
    float _942 = -_870;
    float _944 = -_930;
    float _946 = fma(_850, _942, _944);
    if (_884)
    {
        float _948 = _946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _948;
    }
    float _950 = _896;
    float _952 = _950;
    float _954 = _926;
    if (_884)
    {
        float _956 = fma(_926, _950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = _958;
    if (!_884)
    {
        _954 = _946;
    }
    float _962 = _954;
    float _964 = _962;
    float _966 = _940;
    if (_884)
    {
        float _968 = _940 + (-1.0);
        _934 = _968;
    }
    float _970 = _934;
    float _972 = 0.0;
    float _974 = _970;
    if (_884)
    {
        float _976 = _904 * _958;
        _972 = _976;
    }
    float _978 = _972;
    if (!_884)
    {
        _906 = _872;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _920 = _984;
    }
    float _986 = _920;
    if (_884)
    {
        float _988 = _872 * _978;
        _982 = _988;
    }
    float _990 = _982;
    if (!_884)
    {
        _974 = _874;
    }
    float _992 = _974;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _978;
        _994 = _996;
    }
    float _998 = _994;
    if (!_884)
    {
        _960 = _876;
    }
    float _1000 = _960;
    float _1002 = _1000;
    if (_884)
    {
        float _1004 = fma(_946, _940, _986);
        _964 = _1004;
    }
    float _1006 = _964;
    if (_884)
    {
        float _1008 = _990 * _990;
        _1002 = _1008;
    }
    float _1010 = _1002;
    if (!_884)
    {
        _966 = _878;
    }
    float _1012 = _966;
    float _1014 = _1012;
    if (_884)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = _842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1022 = fma(_1006, _1006, _1010);
    float _1024 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1020);
    float _1026 = _1022 + _1018;
    float _1028 = _842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1032 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1030);
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1038 = rsqrt(_1026);
    float _1040 = _842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = -_1034;
    float _1046 = _1044 + 1.0;
    float _1048 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    float _1054 = _842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = abs(_1046);
    float _1064 = log2(_1062);
    float _1066 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1054);
    float _1068 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1072 = -_1056;
    float _1074 = fma(_1072, _912, 1.0);
    float _1076 = _1038 * _990;
    float _1078 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1070);
    float _1082 = _1038 * _1006;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1086 = _1038 * _998;
    float _1088 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1080);
    float _1092 = -_1084;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1092);
    float _1096 = log2(_1074);
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1100 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = -_1086;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1094);
    float _1106 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1090);
    float _1108 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1110 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1098);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1108);
    float _1118 = fma(_1104, 0.5, 0.5);
    float _1120 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1122 = _1082 + 1.0;
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1126 = 1.0 / _1106;
    float _1128 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1116);
    float _1130 = fma(_1118, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1132 = _1096 * 0.693147182464599609375;
    float _1134 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1128);
    float _1136 = fma(_1118, _1130, -0.212114393711090087890625);
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1140 = sqrt(_1112);
    float _1142 = -_1082;
    float _1144 = fma(_1114, _1122, _1142);
    float _1146 = fma(_1118, _1136, 1.570728778839111328125);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * _1126;
    float _1152 = _1124 * _1126;
    float _1154 = fma(_1150, 0.5, 0.5);
    float _1156 = fma(_1152, -0.5, 0.5);
    float _1158 = _1140 * 0.636619746685028076171875;
    float _1160 = -_1146;
    float _1162 = fma(_1158, _1160, 1.0);
    float3 _3143 = float3(_1154, _1156, _1138);
    float _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3143, float3(0.0), isnan(_3143)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3143, float3(0.0), isnan(_3143)), level(0.0)).x;
    float3 _3154 = float3(_1154, _1156, _1138);
    float4 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3154, float3(0.0), isnan(_3154)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3154, float3(0.0), isnan(_3154)), level(0.0)).xyzw;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = _1167.w;
    float2 _3171 = float2(_1162, _1148);
    float3 _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).xyz;
    float _1181 = _1179.x;
    float _1183 = _1179.y;
    float _1185 = _1179.z;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1189 = _298 + _1187;
    bool _1191 = _628 != 0.0;
    bool _1193 = isnan(_628);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1203 = _298 + _1201;
    bool _1205 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1207 = isnan(_298);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1225 = _626 == 0.0;
    bool _1227 = !_1199;
    bool _1229 = _1225 && _1227;
    float _1231 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _368;
    float _1233 = 1.0 / _1219;
    bool _1235 = _634 == 0.0;
    bool _1237 = _1235 && _1229;
    out.m_49.x = 1.0;
    out.m_67.y = _628;
    float _1239 = 1.0 / _1223;
    bool _1241 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1243 = isnan(_298);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    bool _1253 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1255 = isnan(_298);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    out.m_69.x = _844;
    out.m_69.y = _842;
    out.m_69.z = _846;
    if (!_1237)
    {
        float _1265 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _584);
        _786 = _1265;
    }
    float _1267 = _786;
    if (!_1237)
    {
        float _1269 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _582);
        _788 = _1269;
    }
    float _1271 = _788;
    float _1273 = _1189 * _1233;
    float _1275 = -_1215;
    float _1277 = _1275 + 1.0;
    float _1279 = _676 * _1267;
    float _1281 = exp2(_1231);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = _1251 * _1277;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1289;
    float _1293 = -_1267;
    float _1295 = _668 * _1293;
    float _1297 = _1203 * _1239;
    float _1299 = _670 * _1267;
    if (!_1237)
    {
        float _1301 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _586);
        _790 = _1301;
    }
    float _1303 = _790;
    float _1305 = fma(_684, _1271, _1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1307;
    float _1311 = _1263 * _1285;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1313;
    float _1317 = fma(_1291, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1319 = fma(_1309, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1321 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = fma(_1315, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1325 = fma(_672, _1271, _1295);
    float _1327 = fma(_690, _1271, _1299);
    float _1329 = fma(_694, _1303, _1305);
    float _1331 = _1319 * _1311;
    float _1333 = _1323 * _1311;
    float _1335 = _1317 * _1311;
    float _1337 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1347 = -_1263;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_680, _1303, _1325);
    float _1353 = fma(_686, _1303, _1327);
    float _1355 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1361 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1365 = fma(_1341, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1367 = fma(_1345, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1331);
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1333);
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1375 = -_1281;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1359, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1381 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1335);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1361);
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1387 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1395 = fma(_1365, _1287, _1369);
    float _1397 = fma(_1367, _1287, _1371);
    float _1399 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1401 = fma(_1379, _1287, _1381);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1393 + _1106;
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1395);
    float _1415 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1397);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1401);
    float _1419 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1383);
    out.m_71.x = _1405;
    out.m_71.y = _1407;
    out.m_71.z = _1409;
    float _1421 = _1411 * 0.5;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1373);
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1437 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1439 = -_1399;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1429;
    out.m_73.y = _1433;
    out.m_73.z = _1435;
    out.m_75.x = _1431;
    out.m_75.y = _1419;
    out.m_75.z = _1437;
    out.gl_Position.x = _1134;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1106;
    out.m_77.z = _1421;
    out.m_77.w = _1106;
    out.m_79.w = _1443;
    float _1445 = _1399 * _1164;
    float _1447 = _1175 * _1441;
    float _1449 = _1175 * _1445;
    float _1451 = _1185 * _1445;
    float _1453 = fma(_1181, _1449, _1169);
    float _1455 = fma(_1183, _1449, _1171);
    float _1457 = fma(_1175, _1451, _1173);
    out.m_81.x = _1453;
    out.m_81.y = _1455;
    out.m_81.z = _1457;
    out.m_81.w = _1447;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_124);
        out.gl_Position.z = _1525;
    }
    if (!_110)
    {
        return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    bool _142 = _106 >= _140;
    bool _144 = !_136;
    bool _146 = _142 || _144;
    if (_146)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    out.m_53.x = _138;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_152);
        out.gl_Position.z = _1584;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _140;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    float _276 = fma(_270, _154, _180);
    float _278 = _106 * _156;
    bool _280 = !_258;
    float _282 = _278;
    if (!_280)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _282 = _296;
    }
    float _298 = _282;
    float _300 = in.m_51.z;
    float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _304 = log2(_302);
    float _306 = _138 * 2.0;
    float _308 = in.m_51.y;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _320 = _318 != 0;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = floor(_306);
    float _330 = _304 * _106;
    float _332 = exp2(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _336 = 1.0 + _334;
    float _338 = _300 * 2.0;
    bool _340 = _328 > 0.0;
    bool _342 = _328 >= 0.0;
    bool _344 = isnan(_328);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _308 + _300;
    float _354 = floor(_338);
    float _356 = fma(_138, 100.0, _106);
    float _358 = _352 + (-1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _362 = _138 + _308;
    float _364 = _308 * 2.0;
    float _366 = 1.0 / _336;
    float _368 = in.m_59.x;
    float _370 = in.m_59.y;
    float _372 = _362 + (-1.0);
    float _374 = -_332;
    float _376 = _374 + 1.0;
    float _378 = _308 + (-0.5);
    bool _380 = _354 > 0.0;
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _354 >= 0.0;
    bool _386 = isnan(_354);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _356 * 0.100000001490116119384765625;
    int _396 = _350 ? 0 : 1;
    float _398 = floor(_364);
    float _400 = _356 * 0.800000011920928955078125;
    bool _402 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(1.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_324, 8.0, _394);
    int _414 = ~_396;
    int _416 = _414 + 1;
    int _418 = _416 + 1;
    int _420 = _418;
    if (!_340)
    {
        int _422 = ~_396;
        int _424 = _422 + 1;
        _420 = _424;
    }
    int _426 = _420;
    bool _428 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _436 = _432 || _434;
    float _438 = fma(_324, 12.0, _400);
    bool _440 = !_316;
    int _442 = _440 ? 0 : 1;
    float _444 = _436 ? _376 : 0.0;
    float _446 = fma(_438, 0.100000001490116119384765625, _412);
    int _448 = abs(_442);
    float _450 = in.m_61.x;
    float _452 = in.m_61.y;
    float _454 = in.m_61.z;
    bool _456 = _398 > 0.0;
    if (_410)
    {
        float _458 = _444 * _366;
        _116 = _458;
    }
    float _460 = _116;
    float _462 = fma(_370, 1.5, _446);
    bool _464 = _398 >= 0.0;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = float(_448);
    float _476 = float(_426);
    int _478 = _472 ? 0 : 1;
    int _480 = _392 ? 0 : 1;
    float _482 = _474 * _476;
    bool _484 = !_312;
    int _486 = _484 ? 0 : 1;
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    int _494 = ~_480;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    int _500 = _492;
    int _502 = _498;
    if (!_456)
    {
        int _504 = ~_478;
        int _506 = _504 + 1;
        _500 = _506;
    }
    int _508 = _500;
    float _510 = _482 * (-2.0);
    if (!_380)
    {
        int _512 = ~_480;
        int _514 = _512 + 1;
        _502 = _514;
    }
    int _516 = _502;
    int _518 = abs(_486);
    float _520 = fma(_510, _452, _452);
    float _522 = float(_516);
    float _524 = fma(_360, _510, _360);
    float _526 = float(_518);
    float _528 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].y, _520);
    bool _530 = !_320;
    int _532 = _530 ? 0 : 1;
    float _534 = _462 * 0.15915493667125701904296875;
    float _536 = float(_508);
    float _538 = _526 * _522;
    int _540 = abs(_532);
    float _542 = fma(_524, _460, _528);
    float _544 = _138 + (-0.5);
    float _546 = _538 * (-2.0);
    float _548 = float(_540);
    float _550 = _138 + _300;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = fma(_546, _450, _450);
    float _558 = _548 * _536;
    float _560 = _550 + (-1.0);
    float _562 = fma(_382, _546, _382);
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].x, _556);
    float _566 = _558 * (-2.0);
    float _568 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = fma(_562, _460, _564);
    float _578 = precise::max(_324, -1.0);
    float _580 = fma(_566, _454, _454);
    float _582 = in.m_63.x;
    float _584 = in.m_63.y;
    float _586 = in.m_63.z;
    float _588 = _300 + (-0.5);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = fma(_568, _566, _568);
    float _594 = precise::min(0.0, _578);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _580);
    float _598 = fma(_554, 0.60000002384185791015625, 0.400000035762786865234375);
    float _600 = _542 * 0.15915493667125701904296875;
    float _602 = _590 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_594, 0.5, 1.0);
    float _608 = fma(_592, _460, _596);
    float _610 = _598 * _606;
    float _612 = _608 * 0.15915493667125701904296875;
    float _614 = _600 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _620 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _622 = _570 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = fma(_582, _618, _322);
    float _628 = fma(_584, _618, _324);
    float _630 = _600 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(_586, _618, _326);
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _644 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _634);
    float _648 = _612 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _636 * _640;
    float _654 = _638 * _642;
    float _656 = _644 * _646;
    float _658 = _604 * _616;
    float _660 = _590 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _604 * _632;
    float _666 = _612 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _604 * _650;
    float _672 = _632 * _650;
    float _674 = _662 * _632;
    float _676 = _662 * _650;
    float _678 = _662 * _616;
    float _680 = _616 * _650;
    float _682 = _676 * _654;
    float _684 = fma(_668, _674, _658);
    float _686 = fma(_668, _658, _674);
    float _688 = -_678;
    float _690 = fma(_668, _664, _688);
    float _692 = -_664;
    float _694 = fma(_668, _678, _692);
    float _696 = -_654;
    float _698 = _668 * _696;
    float _700 = fma(_684, _652, _682);
    float _702 = _670 * _654;
    float _704 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_672, _652, _698);
    float _708 = fma(_694, _656, _700);
    float _710 = fma(_690, _652, _702);
    float _712 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = fma(_680, _656, _706);
    float _718 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _720 = fma(_686, _656, _710);
    float _722 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _724 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    float _726 = _708 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _718);
    float _730 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _738 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _734);
    float _742 = _732 + _736;
    float _744 = _738 + _740;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _748 = _742 + _746;
    float _750 = _708 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _744 + _752;
    float _756 = _748 * _748;
    float _758 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _750);
    float _760 = fma(_754, _754, _756);
    float _762 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _758);
    float _766 = sqrt(_760);
    float _768 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _762);
    float _770 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _772 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _772 + _764;
    bool _776 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = _762;
    float _780 = _764;
    float _782 = _750;
    float _784 = _774;
    float _786 = _584;
    float _788 = _582;
    float _790 = _586;
    if (!_776)
    {
        _778 = _744;
    }
    float _792 = _778;
    float _794 = _792;
    if (!_776)
    {
        _780 = _742;
    }
    float _796 = _780;
    float _798 = _796;
    if (!_776)
    {
        _782 = _774;
    }
    float _800 = _782;
    bool _802 = !_776;
    float _804 = _800;
    if (!_802)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _810 = _766 + _808;
        float _812 = rsqrt(_760);
        float _814 = _810 * _806;
        float _816 = _774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = _814 * 0.15915493667125701904296875;
        float _820 = _818 * 6.283185482025146484375;
        float _822 = cos(_820);
        float _824 = _818 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = _822 + (-1.0);
        float _830 = _828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _834 = fma(_774, _822, _830);
        float _836 = _812 * _832;
        float _838 = fma(_754, _836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _840 = fma(_748, _836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _804 = _834;
        _794 = _838;
        _798 = _840;
    }
    float _842 = _804;
    float _844 = _794;
    float _846 = _798;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _842 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _844 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _854 * _870;
    float _874 = _858 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _862;
    float _892 = _866;
    float _894 = _888;
    float _896 = _850;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    float _912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_884)
    {
        float _914 = _910 * 0.15915493667125701904296875;
        _784 = _914;
    }
    float _916 = _784;
    float _918 = _858;
    float _920 = _916;
    if (_884)
    {
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        _918 = _924;
    }
    float _926 = _918;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _930 = precise::max(0.0, _928);
    float _932 = _900;
    float _934 = _930;
    if (_884)
    {
        float _936 = _916 * 6.283185482025146484375;
        float _938 = cos(_936);
        _932 = _938;
    }
    float _940 = _932;
    float _942 = -_870;
    float _944 = -_930;
    float _946 = fma(_850, _942, _944);
    if (_884)
    {
        float _948 = _946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _948;
    }
    float _950 = _896;
    float _952 = _950;
    float _954 = _926;
    if (_884)
    {
        float _956 = fma(_926, _950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = _958;
    if (!_884)
    {
        _954 = _946;
    }
    float _962 = _954;
    float _964 = _962;
    float _966 = _940;
    if (_884)
    {
        float _968 = _940 + (-1.0);
        _934 = _968;
    }
    float _970 = _934;
    float _972 = 0.0;
    float _974 = _970;
    if (_884)
    {
        float _976 = _904 * _958;
        _972 = _976;
    }
    float _978 = _972;
    if (!_884)
    {
        _906 = _872;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _920 = _984;
    }
    float _986 = _920;
    if (_884)
    {
        float _988 = _872 * _978;
        _982 = _988;
    }
    float _990 = _982;
    if (!_884)
    {
        _974 = _874;
    }
    float _992 = _974;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _978;
        _994 = _996;
    }
    float _998 = _994;
    if (!_884)
    {
        _960 = _876;
    }
    float _1000 = _960;
    float _1002 = _1000;
    if (_884)
    {
        float _1004 = fma(_946, _940, _986);
        _964 = _1004;
    }
    float _1006 = _964;
    if (_884)
    {
        float _1008 = _990 * _990;
        _1002 = _1008;
    }
    float _1010 = _1002;
    if (!_884)
    {
        _966 = _878;
    }
    float _1012 = _966;
    float _1014 = _1012;
    if (_884)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = _842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1022 = fma(_1006, _1006, _1010);
    float _1024 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1020);
    float _1026 = _1022 + _1018;
    float _1028 = _842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1032 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1030);
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1038 = rsqrt(_1026);
    float _1040 = _842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = -_1034;
    float _1046 = _1044 + 1.0;
    float _1048 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    float _1054 = _842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = abs(_1046);
    float _1064 = log2(_1062);
    float _1066 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1054);
    float _1068 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1072 = -_1056;
    float _1074 = fma(_1072, _912, 1.0);
    float _1076 = _1038 * _990;
    float _1078 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1070);
    float _1082 = _1038 * _1006;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1086 = _1038 * _998;
    float _1088 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1080);
    float _1092 = -_1084;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1092);
    float _1096 = log2(_1074);
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1100 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = -_1086;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1094);
    float _1106 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1090);
    float _1108 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1110 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1098);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1108);
    float _1118 = fma(_1104, 0.5, 0.5);
    float _1120 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1122 = _1082 + 1.0;
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1126 = 1.0 / _1106;
    float _1128 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1116);
    float _1130 = fma(_1118, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1132 = _1096 * 0.693147182464599609375;
    float _1134 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1128);
    float _1136 = fma(_1118, _1130, -0.212114393711090087890625);
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1140 = sqrt(_1112);
    float _1142 = -_1082;
    float _1144 = fma(_1114, _1122, _1142);
    float _1146 = fma(_1118, _1136, 1.570728778839111328125);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * _1126;
    float _1152 = _1124 * _1126;
    float _1154 = fma(_1150, 0.5, 0.5);
    float _1156 = fma(_1152, -0.5, 0.5);
    float _1158 = _1140 * 0.636619746685028076171875;
    float _1160 = -_1146;
    float _1162 = fma(_1158, _1160, 1.0);
    float3 _3143 = float3(_1154, _1156, _1138);
    float _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3143, float3(0.0), isnan(_3143)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3143, float3(0.0), isnan(_3143)), level(0.0)).x;
    float3 _3154 = float3(_1154, _1156, _1138);
    float4 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3154, float3(0.0), isnan(_3154)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3154, float3(0.0), isnan(_3154)), level(0.0)).xyzw;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = _1167.w;
    float2 _3171 = float2(_1162, _1148);
    float3 _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).xyz;
    float _1181 = _1179.x;
    float _1183 = _1179.y;
    float _1185 = _1179.z;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1189 = _298 + _1187;
    bool _1191 = _628 != 0.0;
    bool _1193 = isnan(_628);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1203 = _298 + _1201;
    bool _1205 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1207 = isnan(_298);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1225 = _626 == 0.0;
    bool _1227 = !_1199;
    bool _1229 = _1225 && _1227;
    float _1231 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _368;
    float _1233 = 1.0 / _1219;
    bool _1235 = _634 == 0.0;
    bool _1237 = _1235 && _1229;
    out.m_49.x = 1.0;
    out.m_67.y = _628;
    float _1239 = 1.0 / _1223;
    bool _1241 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1243 = isnan(_298);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    bool _1253 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1255 = isnan(_298);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    out.m_69.x = _844;
    out.m_69.y = _842;
    out.m_69.z = _846;
    if (!_1237)
    {
        float _1265 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _584);
        _786 = _1265;
    }
    float _1267 = _786;
    if (!_1237)
    {
        float _1269 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _582);
        _788 = _1269;
    }
    float _1271 = _788;
    float _1273 = _1189 * _1233;
    float _1275 = -_1215;
    float _1277 = _1275 + 1.0;
    float _1279 = _676 * _1267;
    float _1281 = exp2(_1231);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = _1251 * _1277;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1289;
    float _1293 = -_1267;
    float _1295 = _668 * _1293;
    float _1297 = _1203 * _1239;
    float _1299 = _670 * _1267;
    if (!_1237)
    {
        float _1301 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _586);
        _790 = _1301;
    }
    float _1303 = _790;
    float _1305 = fma(_684, _1271, _1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1307;
    float _1311 = _1263 * _1285;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1313;
    float _1317 = fma(_1291, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1319 = fma(_1309, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1321 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = fma(_1315, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1325 = fma(_672, _1271, _1295);
    float _1327 = fma(_690, _1271, _1299);
    float _1329 = fma(_694, _1303, _1305);
    float _1331 = _1319 * _1311;
    float _1333 = _1323 * _1311;
    float _1335 = _1317 * _1311;
    float _1337 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1347 = -_1263;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_680, _1303, _1325);
    float _1353 = fma(_686, _1303, _1327);
    float _1355 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1361 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1365 = fma(_1341, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1367 = fma(_1345, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1331);
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1333);
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1375 = -_1281;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1359, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1381 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1335);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1361);
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1387 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1395 = fma(_1365, _1287, _1369);
    float _1397 = fma(_1367, _1287, _1371);
    float _1399 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1401 = fma(_1379, _1287, _1381);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1393 + _1106;
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1395);
    float _1415 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1397);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1401);
    float _1419 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1383);
    out.m_71.x = _1405;
    out.m_71.y = _1407;
    out.m_71.z = _1409;
    float _1421 = _1411 * 0.5;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1373);
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1437 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1439 = -_1399;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1429;
    out.m_73.y = _1433;
    out.m_73.z = _1435;
    out.m_75.x = _1431;
    out.m_75.y = _1419;
    out.m_75.z = _1437;
    out.gl_Position.x = _1134;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1106;
    out.m_77.z = _1421;
    out.m_77.w = _1106;
    out.m_79.w = _1443;
    float _1445 = _1399 * _1164;
    float _1447 = _1175 * _1441;
    float _1449 = _1175 * _1445;
    float _1451 = _1185 * _1445;
    float _1453 = fma(_1181, _1449, _1169);
    float _1455 = fma(_1183, _1449, _1171);
    float _1457 = fma(_1175, _1451, _1173);
    out.m_81.x = _1453;
    out.m_81.y = _1455;
    out.m_81.z = _1457;
    out.m_81.w = _1447;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1525 = as_type<float>(_124);
        out.gl_Position.z = _1525;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = in.m_51.x;
    float _140 = float(_102);
    bool _142 = _106 >= _140;
    bool _144 = !_136;
    bool _146 = _142 || _144;
    if (_146)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    out.m_53.x = _138;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_152);
        out.gl_Position.z = _1584;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _140;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    float _276 = fma(_270, _154, _180);
    float _278 = _106 * _156;
    bool _280 = !_258;
    float _282 = _278;
    if (!_280)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _138 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _282 = _296;
    }
    float _298 = _282;
    float _300 = in.m_51.z;
    float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _304 = log2(_302);
    float _306 = _138 * 2.0;
    float _308 = in.m_51.y;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _320 = _318 != 0;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = floor(_306);
    float _330 = _304 * _106;
    float _332 = exp2(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _336 = 1.0 + _334;
    float _338 = _300 * 2.0;
    bool _340 = _328 > 0.0;
    bool _342 = _328 >= 0.0;
    bool _344 = isnan(_328);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _308 + _300;
    float _354 = floor(_338);
    float _356 = fma(_138, 100.0, _106);
    float _358 = _352 + (-1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _362 = _138 + _308;
    float _364 = _308 * 2.0;
    float _366 = 1.0 / _336;
    float _368 = in.m_59.x;
    float _370 = in.m_59.y;
    float _372 = _362 + (-1.0);
    float _374 = -_332;
    float _376 = _374 + 1.0;
    float _378 = _308 + (-0.5);
    bool _380 = _354 > 0.0;
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _354 >= 0.0;
    bool _386 = isnan(_354);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _356 * 0.100000001490116119384765625;
    int _396 = _350 ? 0 : 1;
    float _398 = floor(_364);
    float _400 = _356 * 0.800000011920928955078125;
    bool _402 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _404 = isnan(1.0);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _410 = _406 || _408;
    float _412 = fma(_324, 8.0, _394);
    int _414 = ~_396;
    int _416 = _414 + 1;
    int _418 = _416 + 1;
    int _420 = _418;
    if (!_340)
    {
        int _422 = ~_396;
        int _424 = _422 + 1;
        _420 = _424;
    }
    int _426 = _420;
    bool _428 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _436 = _432 || _434;
    float _438 = fma(_324, 12.0, _400);
    bool _440 = !_316;
    int _442 = _440 ? 0 : 1;
    float _444 = _436 ? _376 : 0.0;
    float _446 = fma(_438, 0.100000001490116119384765625, _412);
    int _448 = abs(_442);
    float _450 = in.m_61.x;
    float _452 = in.m_61.y;
    float _454 = in.m_61.z;
    bool _456 = _398 > 0.0;
    if (_410)
    {
        float _458 = _444 * _366;
        _116 = _458;
    }
    float _460 = _116;
    float _462 = fma(_370, 1.5, _446);
    bool _464 = _398 >= 0.0;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = float(_448);
    float _476 = float(_426);
    int _478 = _472 ? 0 : 1;
    int _480 = _392 ? 0 : 1;
    float _482 = _474 * _476;
    bool _484 = !_312;
    int _486 = _484 ? 0 : 1;
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    int _494 = ~_480;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    int _500 = _492;
    int _502 = _498;
    if (!_456)
    {
        int _504 = ~_478;
        int _506 = _504 + 1;
        _500 = _506;
    }
    int _508 = _500;
    float _510 = _482 * (-2.0);
    if (!_380)
    {
        int _512 = ~_480;
        int _514 = _512 + 1;
        _502 = _514;
    }
    int _516 = _502;
    int _518 = abs(_486);
    float _520 = fma(_510, _452, _452);
    float _522 = float(_516);
    float _524 = fma(_360, _510, _360);
    float _526 = float(_518);
    float _528 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].y, _520);
    bool _530 = !_320;
    int _532 = _530 ? 0 : 1;
    float _534 = _462 * 0.15915493667125701904296875;
    float _536 = float(_508);
    float _538 = _526 * _522;
    int _540 = abs(_532);
    float _542 = fma(_524, _460, _528);
    float _544 = _138 + (-0.5);
    float _546 = _538 * (-2.0);
    float _548 = float(_540);
    float _550 = _138 + _300;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = fma(_546, _450, _450);
    float _558 = _548 * _536;
    float _560 = _550 + (-1.0);
    float _562 = fma(_382, _546, _382);
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[196].x, _556);
    float _566 = _558 * (-2.0);
    float _568 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _570 = in.m_55.x;
    float _572 = in.m_55.y;
    float _574 = in.m_55.z;
    float _576 = fma(_562, _460, _564);
    float _578 = precise::max(_324, -1.0);
    float _580 = fma(_566, _454, _454);
    float _582 = in.m_63.x;
    float _584 = in.m_63.y;
    float _586 = in.m_63.z;
    float _588 = _300 + (-0.5);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = fma(_568, _566, _568);
    float _594 = precise::min(0.0, _578);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].z, _580);
    float _598 = fma(_554, 0.60000002384185791015625, 0.400000035762786865234375);
    float _600 = _542 * 0.15915493667125701904296875;
    float _602 = _590 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_594, 0.5, 1.0);
    float _608 = fma(_592, _460, _596);
    float _610 = _598 * _606;
    float _612 = _608 * 0.15915493667125701904296875;
    float _614 = _600 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _620 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _622 = _570 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _624 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = fma(_582, _618, _322);
    float _628 = fma(_584, _618, _324);
    float _630 = _600 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(_586, _618, _326);
    float _636 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _638 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _644 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _634);
    float _648 = _612 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _636 * _640;
    float _654 = _638 * _642;
    float _656 = _644 * _646;
    float _658 = _604 * _616;
    float _660 = _590 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _604 * _632;
    float _666 = _612 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _604 * _650;
    float _672 = _632 * _650;
    float _674 = _662 * _632;
    float _676 = _662 * _650;
    float _678 = _662 * _616;
    float _680 = _616 * _650;
    float _682 = _676 * _654;
    float _684 = fma(_668, _674, _658);
    float _686 = fma(_668, _658, _674);
    float _688 = -_678;
    float _690 = fma(_668, _664, _688);
    float _692 = -_664;
    float _694 = fma(_668, _678, _692);
    float _696 = -_654;
    float _698 = _668 * _696;
    float _700 = fma(_684, _652, _682);
    float _702 = _670 * _654;
    float _704 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_672, _652, _698);
    float _708 = fma(_694, _656, _700);
    float _710 = fma(_690, _652, _702);
    float _712 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _714 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = fma(_680, _656, _706);
    float _718 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _720 = fma(_686, _656, _710);
    float _722 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _724 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _712);
    float _726 = _708 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _718);
    float _730 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _738 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].z, _734);
    float _742 = _732 + _736;
    float _744 = _738 + _740;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _748 = _742 + _746;
    float _750 = _708 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _744 + _752;
    float _756 = _748 * _748;
    float _758 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _750);
    float _760 = fma(_754, _754, _756);
    float _762 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].z, _758);
    float _766 = sqrt(_760);
    float _768 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _762);
    float _770 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _772 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _774 = _772 + _764;
    bool _776 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = _762;
    float _780 = _764;
    float _782 = _750;
    float _784 = _774;
    float _786 = _584;
    float _788 = _582;
    float _790 = _586;
    if (!_776)
    {
        _778 = _744;
    }
    float _792 = _778;
    float _794 = _792;
    if (!_776)
    {
        _780 = _742;
    }
    float _796 = _780;
    float _798 = _796;
    if (!_776)
    {
        _782 = _774;
    }
    float _800 = _782;
    bool _802 = !_776;
    float _804 = _800;
    if (!_802)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _810 = _766 + _808;
        float _812 = rsqrt(_760);
        float _814 = _810 * _806;
        float _816 = _774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = _814 * 0.15915493667125701904296875;
        float _820 = _818 * 6.283185482025146484375;
        float _822 = cos(_820);
        float _824 = _818 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = _822 + (-1.0);
        float _830 = _828 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _834 = fma(_774, _822, _830);
        float _836 = _812 * _832;
        float _838 = fma(_754, _836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _840 = fma(_748, _836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _804 = _834;
        _794 = _838;
        _798 = _840;
    }
    float _842 = _804;
    float _844 = _794;
    float _846 = _798;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _842 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _844 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _854 * _870;
    float _874 = _858 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _862;
    float _892 = _866;
    float _894 = _888;
    float _896 = _850;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    float _912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_884)
    {
        float _914 = _910 * 0.15915493667125701904296875;
        _784 = _914;
    }
    float _916 = _784;
    float _918 = _858;
    float _920 = _916;
    if (_884)
    {
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        _918 = _924;
    }
    float _926 = _918;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _930 = precise::max(0.0, _928);
    float _932 = _900;
    float _934 = _930;
    if (_884)
    {
        float _936 = _916 * 6.283185482025146484375;
        float _938 = cos(_936);
        _932 = _938;
    }
    float _940 = _932;
    float _942 = -_870;
    float _944 = -_930;
    float _946 = fma(_850, _942, _944);
    if (_884)
    {
        float _948 = _946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _896 = _948;
    }
    float _950 = _896;
    float _952 = _950;
    float _954 = _926;
    if (_884)
    {
        float _956 = fma(_926, _950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = _958;
    if (!_884)
    {
        _954 = _946;
    }
    float _962 = _954;
    float _964 = _962;
    float _966 = _940;
    if (_884)
    {
        float _968 = _940 + (-1.0);
        _934 = _968;
    }
    float _970 = _934;
    float _972 = 0.0;
    float _974 = _970;
    if (_884)
    {
        float _976 = _904 * _958;
        _972 = _976;
    }
    float _978 = _972;
    if (!_884)
    {
        _906 = _872;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _920 = _984;
    }
    float _986 = _920;
    if (_884)
    {
        float _988 = _872 * _978;
        _982 = _988;
    }
    float _990 = _982;
    if (!_884)
    {
        _974 = _874;
    }
    float _992 = _974;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _978;
        _994 = _996;
    }
    float _998 = _994;
    if (!_884)
    {
        _960 = _876;
    }
    float _1000 = _960;
    float _1002 = _1000;
    if (_884)
    {
        float _1004 = fma(_946, _940, _986);
        _964 = _1004;
    }
    float _1006 = _964;
    if (_884)
    {
        float _1008 = _990 * _990;
        _1002 = _1008;
    }
    float _1010 = _1002;
    if (!_884)
    {
        _966 = _878;
    }
    float _1012 = _966;
    float _1014 = _1012;
    if (_884)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = _842 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1022 = fma(_1006, _1006, _1010);
    float _1024 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1020);
    float _1026 = _1022 + _1018;
    float _1028 = _842 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1032 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1030);
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1038 = rsqrt(_1026);
    float _1040 = _842 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1044 = -_1034;
    float _1046 = _1044 + 1.0;
    float _1048 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1042);
    float _1054 = _842 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = abs(_1046);
    float _1064 = log2(_1062);
    float _1066 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1054);
    float _1068 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1072 = -_1056;
    float _1074 = fma(_1072, _912, 1.0);
    float _1076 = _1038 * _990;
    float _1078 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1066);
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1070);
    float _1082 = _1038 * _1006;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1086 = _1038 * _998;
    float _1088 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1080);
    float _1092 = -_1084;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1092);
    float _1096 = log2(_1074);
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1100 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1102 = -_1086;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1094);
    float _1106 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1090);
    float _1108 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1110 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1098);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = exp2(_1100);
    float _1116 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1108);
    float _1118 = fma(_1104, 0.5, 0.5);
    float _1120 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1122 = _1082 + 1.0;
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1126 = 1.0 / _1106;
    float _1128 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1116);
    float _1130 = fma(_1118, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1132 = _1096 * 0.693147182464599609375;
    float _1134 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1128);
    float _1136 = fma(_1118, _1130, -0.212114393711090087890625);
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1140 = sqrt(_1112);
    float _1142 = -_1082;
    float _1144 = fma(_1114, _1122, _1142);
    float _1146 = fma(_1118, _1136, 1.570728778839111328125);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * _1126;
    float _1152 = _1124 * _1126;
    float _1154 = fma(_1150, 0.5, 0.5);
    float _1156 = fma(_1152, -0.5, 0.5);
    float _1158 = _1140 * 0.636619746685028076171875;
    float _1160 = -_1146;
    float _1162 = fma(_1158, _1160, 1.0);
    float3 _3143 = float3(_1154, _1156, _1138);
    float _1164 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3143, float3(0.0), isnan(_3143)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3143, float3(0.0), isnan(_3143)), level(0.0)).x;
    float3 _3154 = float3(_1154, _1156, _1138);
    float4 _1167 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3154, float3(0.0), isnan(_3154)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3154, float3(0.0), isnan(_3154)), level(0.0)).xyzw;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float _1175 = _1167.w;
    float2 _3171 = float2(_1162, _1148);
    float3 _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3171, float2(0.0), isnan(_3171)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3171, float2(0.0), isnan(_3171)), level(0.0)).xyz;
    float _1181 = _1179.x;
    float _1183 = _1179.y;
    float _1185 = _1179.z;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1189 = _298 + _1187;
    bool _1191 = _628 != 0.0;
    bool _1193 = isnan(_628);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1203 = _298 + _1201;
    bool _1205 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1207 = isnan(_298);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1225 = _626 == 0.0;
    bool _1227 = !_1199;
    bool _1229 = _1225 && _1227;
    float _1231 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _368;
    float _1233 = 1.0 / _1219;
    bool _1235 = _634 == 0.0;
    bool _1237 = _1235 && _1229;
    out.m_49.x = 1.0;
    out.m_67.y = _628;
    float _1239 = 1.0 / _1223;
    bool _1241 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1243 = isnan(_298);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    bool _1253 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1255 = isnan(_298);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    out.m_69.x = _844;
    out.m_69.y = _842;
    out.m_69.z = _846;
    if (!_1237)
    {
        float _1265 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _584);
        _786 = _1265;
    }
    float _1267 = _786;
    if (!_1237)
    {
        float _1269 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _582);
        _788 = _1269;
    }
    float _1271 = _788;
    float _1273 = _1189 * _1233;
    float _1275 = -_1215;
    float _1277 = _1275 + 1.0;
    float _1279 = _676 * _1267;
    float _1281 = exp2(_1231);
    float _1283 = -_1251;
    float _1285 = _1283 + 1.0;
    float _1287 = _1251 * _1277;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1289;
    float _1293 = -_1267;
    float _1295 = _668 * _1293;
    float _1297 = _1203 * _1239;
    float _1299 = _670 * _1267;
    if (!_1237)
    {
        float _1301 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[17].y, _586);
        _790 = _1301;
    }
    float _1303 = _790;
    float _1305 = fma(_684, _1271, _1279);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1307;
    float _1311 = _1263 * _1285;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1313;
    float _1317 = fma(_1291, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1319 = fma(_1309, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1321 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = fma(_1315, _1273, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1325 = fma(_672, _1271, _1295);
    float _1327 = fma(_690, _1271, _1299);
    float _1329 = fma(_694, _1303, _1305);
    float _1331 = _1319 * _1311;
    float _1333 = _1323 * _1311;
    float _1335 = _1317 * _1311;
    float _1337 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1347 = -_1263;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_680, _1303, _1325);
    float _1353 = fma(_686, _1303, _1327);
    float _1355 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1361 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1337);
    float _1365 = fma(_1341, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1367 = fma(_1345, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1369 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1331);
    float _1371 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1333);
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1375 = -_1281;
    float _1377 = _1375 + 1.0;
    float _1379 = fma(_1359, _1297, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1381 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1335);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1361);
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1387 = _1329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1393 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1395 = fma(_1365, _1287, _1369);
    float _1397 = fma(_1367, _1287, _1371);
    float _1399 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1401 = fma(_1379, _1287, _1381);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1387);
    float _1405 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1411 = _1393 + _1106;
    float _1413 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1395);
    float _1415 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1397);
    float _1417 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1401);
    float _1419 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1383);
    out.m_71.x = _1405;
    out.m_71.y = _1407;
    out.m_71.z = _1409;
    float _1421 = _1411 * 0.5;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1373);
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1437 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1439 = -_1399;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1429;
    out.m_73.y = _1433;
    out.m_73.z = _1435;
    out.m_75.x = _1431;
    out.m_75.y = _1419;
    out.m_75.z = _1437;
    out.gl_Position.x = _1134;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1106;
    out.m_77.z = _1421;
    out.m_77.w = _1106;
    out.m_79.w = _1443;
    float _1445 = _1399 * _1164;
    float _1447 = _1175 * _1441;
    float _1449 = _1175 * _1445;
    float _1451 = _1185 * _1445;
    float _1453 = fma(_1181, _1449, _1169);
    float _1455 = fma(_1183, _1449, _1171);
    float _1457 = fma(_1175, _1451, _1173);
    out.m_81.x = _1453;
    out.m_81.y = _1455;
    out.m_81.z = _1457;
    out.m_81.w = _1447;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

