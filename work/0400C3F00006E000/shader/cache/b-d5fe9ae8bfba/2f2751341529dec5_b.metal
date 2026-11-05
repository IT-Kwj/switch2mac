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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1908 = as_type<float>(_106);
        out.gl_Position.z = _1908;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_144);
        out.gl_Position.z = _1978;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _280;
        _294 = _290;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_51.z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = in.m_51.y;
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _324 = in.m_51.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _346 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _350 = !_334;
    int _352 = _350 ? 0 : 1;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _356 = _346 + _354;
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _366 = _362 || _364;
    float _368 = _308 * 2.0;
    int _370 = abs(_352);
    float _372 = floor(_368);
    float _374 = _316 * 2.0;
    float _376 = _316 + _308;
    float _378 = float(_370);
    float _380 = _324 * 2.0;
    float _382 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = floor(_374);
    float _386 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = -_348;
    float _390 = fma(_382, 2.0, _388);
    float _392 = _324 + _316;
    float _394 = fma(_386, -2.0, _344);
    float _396 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _398 = _392 + (-1.0);
    bool _400 = _372 > 0.0;
    float _402 = floor(_380);
    bool _404 = _372 >= 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _416 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _376 + (-1.0);
    int _420 = _412 ? 0 : 1;
    float _422 = _414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _424 = _384 >= 0.0;
    bool _426 = isnan(_384);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _416 + _434;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _446 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _448 = _442;
    float _450 = _416;
    bool _452 = _338;
    if (!_400)
    {
        int _454 = ~_420;
        int _456 = _454 + 1;
        _448 = _456;
    }
    int _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _422 + _460;
    bool _464 = _384 > 0.0;
    float _466 = _328 * _124;
    float _468 = _436 * _436;
    bool _470 = _402 > 0.0;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = exp2(_466);
    float _484 = in.m_53.x;
    float _486 = in.m_53.y;
    float _488 = in.m_53.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    float _494 = fma(_462, _462, _468);
    float _496 = float(_458);
    float _498 = 1.0 / _492;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _504 = _432 ? 0 : 1;
    float _506 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _502);
    int _508 = ~_504;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = -_482;
    float _516 = _514 + 1.0;
    float _518 = -_124;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    int _522 = _480 ? 0 : 1;
    int _524 = _512;
    if (!_464)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _366 ? _516 : 0.0;
    float _534 = fma(_356, _356, _494);
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _500);
    float _548 = _378 * _496;
    float _550 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    bool _552 = !_338;
    int _554 = _552 ? 0 : 1;
    float _556 = rsqrt(_534);
    float _558 = _548 * (-2.0);
    int _560 = ~_522;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _568 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _506);
    int _570 = _564;
    if (!_470)
    {
        int _572 = ~_522;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = fma(_558, _484, _484);
    int _580 = abs(_554);
    if (_544)
    {
        float _582 = _532 * _498;
        _126 = _582;
    }
    float _584 = _126;
    float _586 = fma(_446, _558, _446);
    float _588 = _324 + (-0.5);
    bool _590 = !_342;
    int _592 = _590 ? 0 : 1;
    float _594 = float(_580);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].x, _578);
    float _598 = float(_576);
    float _600 = _436 * _556;
    int _602 = abs(_592);
    float _604 = fma(_586, _584, _596);
    float _606 = _462 * _556;
    float _608 = _594 * _598;
    float _610 = -_600;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _436);
    float _614 = _316 + (-0.5);
    float _616 = _608 * (-2.0);
    float _618 = float(_602);
    float _620 = -_606;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _624 = _612 * _612;
    float _626 = fma(_616, _486, _486);
    float _628 = float(_530);
    float _630 = fma(_444, _616, _444);
    float _632 = _324 + _308;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _626);
    float _636 = _356 * _556;
    float _638 = _618 * _628;
    float _640 = fma(_622, _622, _624);
    float _642 = fma(_630, _584, _634);
    float _644 = _632 + (-1.0);
    float _646 = _638 * (-2.0);
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _652 = in.m_49.x;
    float _654 = in.m_49.y;
    float _656 = in.m_49.z;
    float _658 = fma(_646, _488, _488);
    float _660 = fma(_650, _650, _640);
    float _662 = _642 * 0.15915493667125701904296875;
    float _664 = _308 + (-0.5);
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = _604 * 0.15915493667125701904296875;
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = sqrt(_660);
    float _678 = fma(_666, _646, _666);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _658);
    float _682 = fma(_678, _584, _680);
    float _684 = _668 * 6.283185482025146484375;
    float _686 = sin(_684);
    float _688 = _682 * 0.15915493667125701904296875;
    float _690 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = _668 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _698 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = _556 * _676;
    float _702 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _710 = _662 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _700 * _702;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _718 = _700 * _704;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _722 = _708 * _714;
    float _724 = _716 * _718;
    float _726 = _662 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _688 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = _686 * _712;
    float _736 = _700 * _706;
    float _738 = _694 * _712;
    float _740 = _720 * _736;
    float _742 = _688 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _694 * _728;
    float _748 = _732 * _722;
    float _750 = _712 * _732;
    float _752 = _728 * _732;
    float _754 = _686 * _728;
    float _756 = _694 * _748;
    float _758 = _686 * _748;
    float _760 = fma(_744, _746, _734);
    float _762 = -_722;
    float _764 = _744 * _762;
    float _766 = fma(_760, _724, _756);
    float _768 = -_754;
    float _770 = fma(_744, _738, _768);
    float _772 = -_738;
    float _774 = fma(_744, _754, _772);
    float _776 = fma(_752, _724, _764);
    float _778 = fma(_744, _734, _746);
    float _780 = fma(_770, _740, _766);
    float _782 = fma(_774, _724, _758);
    float _784 = fma(_750, _740, _776);
    float _786 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _788 = fma(_778, _740, _782);
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _786);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _790);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _800 = _346 + _796;
    float _802 = _422 + _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _800 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _802 + _808;
    float _812 = _806 * _806;
    float _814 = fma(_810, _810, _812);
    float _816 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _818 = sqrt(_814);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _816);
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _820);
    float _824 = _416 + _822;
    bool _826 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _820;
    float _830 = _822;
    float _832 = _802;
    float _834 = _800;
    if (!_826)
    {
        _828 = _800;
    }
    float _836 = _828;
    float _838 = _836;
    if (!_826)
    {
        _830 = _824;
    }
    float _840 = _830;
    bool _842 = !_826;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _818 + _848;
        float _852 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_814);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_824, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_810, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_806, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _832 = _878;
        _838 = _880;
        _450 = _854;
    }
    float _882 = _844;
    float _884 = _832;
    float _886 = _838;
    float _888 = _450;
    float _890 = -_600;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_606;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_636;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _912;
    float _946 = _916;
    float _948 = _942;
    float _950 = _904;
    float _952 = _924;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = _920;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _888;
    float _986 = _980;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    float _1000 = _998;
    if (!_938)
    {
        _950 = _930;
    }
    float _1002 = _950;
    float _1004 = _1002;
    if (_938)
    {
        float _1006 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1006;
    }
    float _1008 = _986;
    float _1010 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _978;
    float _1014 = _1008;
    if (_938)
    {
        float _1016 = fma(_978, _1008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1012 = _1016;
    }
    float _1018 = _1012;
    float _1020 = _1018;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _1014 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _960 * _1018;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1020 = _926;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (_938)
    {
        float _1038 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _1038;
    }
    float _1040 = _962;
    if (_938)
    {
        float _1042 = _926 * _1032;
        _1036 = _1042;
    }
    float _1044 = _1036;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1046 = _1028;
    float _1048 = _1046;
    if (_938)
    {
        float _1050 = _928 * _1032;
        _1048 = _1050;
    }
    float _1052 = _1048;
    if (_938)
    {
        float _1054 = fma(_998, _992, _1040);
        _1000 = _1054;
    }
    float _1056 = _1000;
    if (_938)
    {
        float _1058 = _1044 * _1044;
        _1004 = _1058;
    }
    float _1060 = _1004;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1062 = _1022;
    float _1064 = _1062;
    if (_938)
    {
        float _1066 = _1052 * _1052;
        _1064 = _1066;
    }
    float _1068 = _1064;
    float _1070 = fma(_1056, _1056, _1060);
    float _1072 = _1070 + _1068;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = rsqrt(_1072);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1092 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1094 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1096 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1100 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1092);
    float _1102 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1094);
    float _1104 = abs(_1088);
    float _1106 = log2(_1104);
    float _1108 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1110 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1100);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1120 = _1084 * _1044;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1084 * _1056;
    float _1126 = -_1114;
    float _1128 = fma(_1126, _1108, 1.0);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1132 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1136 = _1084 * _1052;
    float _1138 = -_1130;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1144 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1134);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1148 = -_1136;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1140);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1144);
    float _1156 = exp2(_1146);
    float _1158 = fma(_1150, -0.5, 0.5);
    float _1160 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1162 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1152);
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = _1124 + 1.0;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1160);
    float _1170 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1162);
    float _1172 = log2(_1128);
    float _1174 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1176 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1168);
    float _1178 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1170);
    float _1180 = fma(_1164, _1174, -0.212114393711090087890625);
    float _1182 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1176);
    float _1184 = 1.0 / _1154;
    float _1186 = -_1124;
    float _1188 = fma(_1156, _1166, _1186);
    float _1190 = fma(_1164, _1180, 1.570728778839111328125);
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = sqrt(_1158);
    float _1196 = _1172 * 0.693147182464599609375;
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1200 = _1178 * _1184;
    float _1202 = _1182 * _1184;
    float _1204 = fma(_1200, 0.5, 0.5);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = _1194 * 0.636619746685028076171875;
    float3 _3642 = float3(_1204, _1206, _1198);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3642, float3(0.0), isnan(_3642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3642, float3(0.0), isnan(_3642)), level(0.0)).x;
    float _1212 = -_1190;
    float _1214 = fma(_1208, _1212, 1.0);
    float3 _3658 = float3(_1204, _1206, _1198);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3658, float3(0.0), isnan(_3658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3658, float3(0.0), isnan(_3658)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3675 = float2(_1214, _1192);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3675, float2(0.0), isnan(_3675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3675, float2(0.0), isnan(_3675)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = in.m_57.y;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1241 = _304 + _1239;
    float _1243 = in.m_51.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1257 = 1.0 / _1247;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = in.m_57.x;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1251;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1285 = _1283 != 0;
    bool _1287 = _316 > 0.5;
    float _1289 = 1.0 / _1255;
    bool _1291 = _1243 > 0.5;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _306 + _1293;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1297 = _1291;
    float _1299 = _1237;
    if (_1265)
    {
        bool _1301 = _324 > 0.5;
        _452 = _1301;
    }
    bool _1303 = _452;
    float _1305 = 1.0 / _1261;
    float _1307 = _1295 * _1257;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1311 = _306 + _1309;
    bool _1313 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1315 = isnan(_304);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = 0;
    float _1327 = _1267;
    if (_1271)
    {
        float _1329 = -_1267;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1339 = _1311 * _1281;
    float _1341 = 1.0 / _1275;
    bool _1343 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1345 = isnan(_306);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1359 = -_1237;
    float _1361 = _1359 + 1.0;
    bool _1363 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1365 = isnan(_306);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1379 = 1.0 / _1357;
    int _1381 = _1291 ? as_type<int>(_1361) : as_type<int>(_1237);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1383;
    if (_1271)
    {
        bool _1387 = _308 > 0.5;
        _1297 = _1387;
    }
    bool _1389 = _1297;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1395 = _1385 * _1289;
    float _1397 = 1.0 / _1377;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1407 = _1393 * _1305;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = fma(_1407, _1241, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1415 = 1.0 / _1337;
    float _1417 = _1401 * _1379;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1419;
    bool _1423 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1425 = isnan(_304);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    bool _1435 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1437 = isnan(_306);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1447;
    float _1451 = 1.0 / _1405;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1453;
    float _1457 = _1411 * _1397;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1459;
    float _1463 = fma(_1421, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1465 = _1455 * _1341;
    float _1467 = fma(_1449, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1475 = _304 + _1473;
    bool _1477 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1479 = isnan(_304);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1489;
    float _1493 = _1471 * _1415;
    float _1495 = fma(_1395, _1475, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1499 = _304 + _1497;
    float _1501 = fma(_1491, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1507 = _1461 * _1451;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1515 = _304 + _1513;
    float _1517 = fma(_1505, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1521 = _304 + _1519;
    bool _1523 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1525 = isnan(_304);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1465, _1515, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1537 = fma(_1493, _1499, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1541 = _304 + _1539;
    float _1543 = fma(_1417, _1521, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1545 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1547 = isnan(_304);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = -_1533;
    float _1559 = _1557 + 1.0;
    float _1561 = fma(_1457, _1541, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1565 = _1563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = _1555 * _1559;
    float _1571 = -_1555;
    float _1573 = _1571 + 1.0;
    bool _1575 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1577 = isnan(_304);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1445;
    float _1589 = _1587 + 1.0;
    bool _1591 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1593 = isnan(_304);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1433 * _1573;
    float _1605 = -_1433;
    float _1607 = _1605 + 1.0;
    float _1609 = -_1585;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1487;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1565, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1619 = _1585 * _1607;
    float _1621 = _1323 * _1611;
    float _1623 = -_1323;
    float _1625 = _1623 + 1.0;
    float _1627 = fma(_1511, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _304 + _1629;
    bool _1633 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1635 = isnan(_304);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1487 * _1625;
    float _1647 = _1373 * _1589;
    float _1649 = _1601 * _1615;
    float _1651 = -_1373;
    float _1653 = _1651 + 1.0;
    float _1655 = -_1601;
    float _1657 = _1655 + 1.0;
    float _1659 = _1279 ? as_type<float>(_1381) : _1237;
    float _1661 = fma(_1507, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1663 = _1631;
    if (_1285)
    {
        float _1665 = _1287 ? _1361 : _1237;
        _1299 = _1665;
    }
    float _1667 = _1299;
    float _1669 = _1353 * _1653;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1673 = _1643 * _1657;
    float _1675 = -_1643;
    float _1677 = _1675 + 1.0;
    float _1679 = _1463 * _1669;
    float _1681 = _1467 * _1669;
    float _1683 = _1501 * _1669;
    float _1685 = _1495 * _1673;
    float _1687 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1689 = as_type<int>(_1567);
    if (_1265)
    {
        float _1691 = -_1267;
        float _1693 = _1691 + 1.0;
        _1689 = as_type<int>(_1693);
    }
    int _1695 = _1689;
    if (!_1265)
    {
        _1663 = _1267;
    }
    float _1697 = _1663;
    float _1699 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1685);
    float _1701 = fma(_1687, _1667, -0.5);
    float _1703 = -_1353;
    float _1705 = _1703 + 1.0;
    float _1707 = _1697;
    if (_1265)
    {
        float _1709 = _1303 ? as_type<float>(_1695) : _1267;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = fma(_1413, _1649, _1699);
    float _1715 = -_550;
    float _1717 = fma(_568, _1701, _1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = fma(_1535, _1645, _1713);
    float _1725 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1683);
    float _1727 = fma(_1719, _1711, -0.5);
    if (_1271)
    {
        float _1729 = _1389 ? as_type<float>(_1333) : _1267;
        _1327 = _1729;
    }
    float _1731 = _1327;
    float _1733 = fma(_1537, _1621, _1723);
    float _1735 = fma(_1627, _1647, _1725);
    float _1737 = fma(_566, _1727, _520);
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1741 = fma(_1543, _1619, _1733);
    float _1743 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1745 = _1737 + 0.5;
    float _1747 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1561, _1603, _1741);
    float _1751 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1735);
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1679);
    float _1755 = exp2(_1743);
    float _1757 = fma(_1661, _1569, _1749);
    float _1759 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1761 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1763 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1757);
    float _1767 = _1178 + _1154;
    float _1769 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1759);
    float _1771 = _1761 * _1721;
    float _1773 = _1751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1517, _1647, _1753);
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1779 = _1767 * 0.5;
    float _1781 = fma(_1617, _1647, _1763);
    float _1783 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1775);
    float _1785 = _1777 * _1739;
    float _1787 = -_1755;
    float _1789 = _1787 + 1.0;
    float _1791 = _1154 * 0.5;
    float _1793 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1781);
    float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1769);
    float _1799 = _1717 + 0.5;
    float _1801 = fma(_1182, -0.5, _1791);
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1811 = _1783 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1813 = _1797 + _1154;
    out.m_61.x = _1765;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1819 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1813 * 0.5;
    float _1833 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1819;
    out.m_63.y = _1821;
    out.m_63.z = _1823;
    out.m_63.w = _1817;
    out.m_65.x = _1745;
    out.m_65.y = _1799;
    out.m_65.z = _1785;
    out.m_65.w = _1771;
    out.m_67.x = _1825;
    out.m_67.y = _1827;
    out.m_67.z = _1829;
    out.m_67.w = _1815;
    out.gl_Position.x = _1178;
    out.gl_Position.y = _1182;
    out.gl_Position.z = _1797;
    out.gl_Position.w = _1154;
    out.m_69.x = _1779;
    out.m_69.y = _1801;
    out.m_69.z = _1831;
    out.m_69.w = _1154;
    out.m_45.x = _1833;
    float _1835 = _1795 * _1210;
    float _1837 = -_1795;
    float _1839 = _1837 + 1.0;
    float _1841 = _1225 * _1835;
    float _1843 = _1235 * _1835;
    float _1845 = fma(_1231, _1841, _1219);
    float _1847 = fma(_1233, _1841, _1221);
    float _1849 = _1225 * _1839;
    float _1851 = fma(_1225, _1843, _1223);
    out.m_71.x = _1845;
    out.m_71.y = _1847;
    out.m_71.z = _1851;
    out.m_71.w = _1849;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1908 = as_type<float>(_106);
        out.gl_Position.z = _1908;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_144);
        out.gl_Position.z = _1978;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _280;
        _294 = _290;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_51.z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = in.m_51.y;
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _324 = in.m_51.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _346 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _350 = !_334;
    int _352 = _350 ? 0 : 1;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _356 = _346 + _354;
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _366 = _362 || _364;
    float _368 = _308 * 2.0;
    int _370 = abs(_352);
    float _372 = floor(_368);
    float _374 = _316 * 2.0;
    float _376 = _316 + _308;
    float _378 = float(_370);
    float _380 = _324 * 2.0;
    float _382 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = floor(_374);
    float _386 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = -_348;
    float _390 = fma(_382, 2.0, _388);
    float _392 = _324 + _316;
    float _394 = fma(_386, -2.0, _344);
    float _396 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _398 = _392 + (-1.0);
    bool _400 = _372 > 0.0;
    float _402 = floor(_380);
    bool _404 = _372 >= 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _416 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _376 + (-1.0);
    int _420 = _412 ? 0 : 1;
    float _422 = _414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _424 = _384 >= 0.0;
    bool _426 = isnan(_384);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _416 + _434;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _446 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _448 = _442;
    float _450 = _416;
    bool _452 = _338;
    if (!_400)
    {
        int _454 = ~_420;
        int _456 = _454 + 1;
        _448 = _456;
    }
    int _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _422 + _460;
    bool _464 = _384 > 0.0;
    float _466 = _328 * _124;
    float _468 = _436 * _436;
    bool _470 = _402 > 0.0;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = exp2(_466);
    float _484 = in.m_53.x;
    float _486 = in.m_53.y;
    float _488 = in.m_53.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    float _494 = fma(_462, _462, _468);
    float _496 = float(_458);
    float _498 = 1.0 / _492;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _504 = _432 ? 0 : 1;
    float _506 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _502);
    int _508 = ~_504;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = -_482;
    float _516 = _514 + 1.0;
    float _518 = -_124;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    int _522 = _480 ? 0 : 1;
    int _524 = _512;
    if (!_464)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _366 ? _516 : 0.0;
    float _534 = fma(_356, _356, _494);
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _500);
    float _548 = _378 * _496;
    float _550 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    bool _552 = !_338;
    int _554 = _552 ? 0 : 1;
    float _556 = rsqrt(_534);
    float _558 = _548 * (-2.0);
    int _560 = ~_522;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _568 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _506);
    int _570 = _564;
    if (!_470)
    {
        int _572 = ~_522;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = fma(_558, _484, _484);
    int _580 = abs(_554);
    if (_544)
    {
        float _582 = _532 * _498;
        _126 = _582;
    }
    float _584 = _126;
    float _586 = fma(_446, _558, _446);
    float _588 = _324 + (-0.5);
    bool _590 = !_342;
    int _592 = _590 ? 0 : 1;
    float _594 = float(_580);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].x, _578);
    float _598 = float(_576);
    float _600 = _436 * _556;
    int _602 = abs(_592);
    float _604 = fma(_586, _584, _596);
    float _606 = _462 * _556;
    float _608 = _594 * _598;
    float _610 = -_600;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _436);
    float _614 = _316 + (-0.5);
    float _616 = _608 * (-2.0);
    float _618 = float(_602);
    float _620 = -_606;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _624 = _612 * _612;
    float _626 = fma(_616, _486, _486);
    float _628 = float(_530);
    float _630 = fma(_444, _616, _444);
    float _632 = _324 + _308;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _626);
    float _636 = _356 * _556;
    float _638 = _618 * _628;
    float _640 = fma(_622, _622, _624);
    float _642 = fma(_630, _584, _634);
    float _644 = _632 + (-1.0);
    float _646 = _638 * (-2.0);
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _652 = in.m_49.x;
    float _654 = in.m_49.y;
    float _656 = in.m_49.z;
    float _658 = fma(_646, _488, _488);
    float _660 = fma(_650, _650, _640);
    float _662 = _642 * 0.15915493667125701904296875;
    float _664 = _308 + (-0.5);
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = _604 * 0.15915493667125701904296875;
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = sqrt(_660);
    float _678 = fma(_666, _646, _666);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _658);
    float _682 = fma(_678, _584, _680);
    float _684 = _668 * 6.283185482025146484375;
    float _686 = sin(_684);
    float _688 = _682 * 0.15915493667125701904296875;
    float _690 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = _668 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _698 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = _556 * _676;
    float _702 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _710 = _662 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _700 * _702;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _718 = _700 * _704;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _722 = _708 * _714;
    float _724 = _716 * _718;
    float _726 = _662 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _688 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = _686 * _712;
    float _736 = _700 * _706;
    float _738 = _694 * _712;
    float _740 = _720 * _736;
    float _742 = _688 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _694 * _728;
    float _748 = _732 * _722;
    float _750 = _712 * _732;
    float _752 = _728 * _732;
    float _754 = _686 * _728;
    float _756 = _694 * _748;
    float _758 = _686 * _748;
    float _760 = fma(_744, _746, _734);
    float _762 = -_722;
    float _764 = _744 * _762;
    float _766 = fma(_760, _724, _756);
    float _768 = -_754;
    float _770 = fma(_744, _738, _768);
    float _772 = -_738;
    float _774 = fma(_744, _754, _772);
    float _776 = fma(_752, _724, _764);
    float _778 = fma(_744, _734, _746);
    float _780 = fma(_770, _740, _766);
    float _782 = fma(_774, _724, _758);
    float _784 = fma(_750, _740, _776);
    float _786 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _788 = fma(_778, _740, _782);
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _786);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _790);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _800 = _346 + _796;
    float _802 = _422 + _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _800 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _802 + _808;
    float _812 = _806 * _806;
    float _814 = fma(_810, _810, _812);
    float _816 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _818 = sqrt(_814);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _816);
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _820);
    float _824 = _416 + _822;
    bool _826 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _820;
    float _830 = _822;
    float _832 = _802;
    float _834 = _800;
    if (!_826)
    {
        _828 = _800;
    }
    float _836 = _828;
    float _838 = _836;
    if (!_826)
    {
        _830 = _824;
    }
    float _840 = _830;
    bool _842 = !_826;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _818 + _848;
        float _852 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_814);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_824, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_810, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_806, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _832 = _878;
        _838 = _880;
        _450 = _854;
    }
    float _882 = _844;
    float _884 = _832;
    float _886 = _838;
    float _888 = _450;
    float _890 = -_600;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_606;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_636;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _912;
    float _946 = _916;
    float _948 = _942;
    float _950 = _904;
    float _952 = _924;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = _920;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _888;
    float _986 = _980;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    float _1000 = _998;
    if (!_938)
    {
        _950 = _930;
    }
    float _1002 = _950;
    float _1004 = _1002;
    if (_938)
    {
        float _1006 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1006;
    }
    float _1008 = _986;
    float _1010 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _978;
    float _1014 = _1008;
    if (_938)
    {
        float _1016 = fma(_978, _1008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1012 = _1016;
    }
    float _1018 = _1012;
    float _1020 = _1018;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _1014 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _960 * _1018;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1020 = _926;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (_938)
    {
        float _1038 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _1038;
    }
    float _1040 = _962;
    if (_938)
    {
        float _1042 = _926 * _1032;
        _1036 = _1042;
    }
    float _1044 = _1036;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1046 = _1028;
    float _1048 = _1046;
    if (_938)
    {
        float _1050 = _928 * _1032;
        _1048 = _1050;
    }
    float _1052 = _1048;
    if (_938)
    {
        float _1054 = fma(_998, _992, _1040);
        _1000 = _1054;
    }
    float _1056 = _1000;
    if (_938)
    {
        float _1058 = _1044 * _1044;
        _1004 = _1058;
    }
    float _1060 = _1004;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1062 = _1022;
    float _1064 = _1062;
    if (_938)
    {
        float _1066 = _1052 * _1052;
        _1064 = _1066;
    }
    float _1068 = _1064;
    float _1070 = fma(_1056, _1056, _1060);
    float _1072 = _1070 + _1068;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = rsqrt(_1072);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1092 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1094 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1096 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1100 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1092);
    float _1102 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1094);
    float _1104 = abs(_1088);
    float _1106 = log2(_1104);
    float _1108 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1110 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1100);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1120 = _1084 * _1044;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1084 * _1056;
    float _1126 = -_1114;
    float _1128 = fma(_1126, _1108, 1.0);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1132 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1136 = _1084 * _1052;
    float _1138 = -_1130;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1144 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1134);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1148 = -_1136;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1140);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1144);
    float _1156 = exp2(_1146);
    float _1158 = fma(_1150, -0.5, 0.5);
    float _1160 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1162 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1152);
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = _1124 + 1.0;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1160);
    float _1170 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1162);
    float _1172 = log2(_1128);
    float _1174 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1176 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1168);
    float _1178 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1170);
    float _1180 = fma(_1164, _1174, -0.212114393711090087890625);
    float _1182 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1176);
    float _1184 = 1.0 / _1154;
    float _1186 = -_1124;
    float _1188 = fma(_1156, _1166, _1186);
    float _1190 = fma(_1164, _1180, 1.570728778839111328125);
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = sqrt(_1158);
    float _1196 = _1172 * 0.693147182464599609375;
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1200 = _1178 * _1184;
    float _1202 = _1182 * _1184;
    float _1204 = fma(_1200, 0.5, 0.5);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = _1194 * 0.636619746685028076171875;
    float3 _3642 = float3(_1204, _1206, _1198);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3642, float3(0.0), isnan(_3642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3642, float3(0.0), isnan(_3642)), level(0.0)).x;
    float _1212 = -_1190;
    float _1214 = fma(_1208, _1212, 1.0);
    float3 _3658 = float3(_1204, _1206, _1198);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3658, float3(0.0), isnan(_3658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3658, float3(0.0), isnan(_3658)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3675 = float2(_1214, _1192);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3675, float2(0.0), isnan(_3675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3675, float2(0.0), isnan(_3675)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = in.m_57.y;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1241 = _304 + _1239;
    float _1243 = in.m_51.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1257 = 1.0 / _1247;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = in.m_57.x;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1251;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1285 = _1283 != 0;
    bool _1287 = _316 > 0.5;
    float _1289 = 1.0 / _1255;
    bool _1291 = _1243 > 0.5;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _306 + _1293;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1297 = _1291;
    float _1299 = _1237;
    if (_1265)
    {
        bool _1301 = _324 > 0.5;
        _452 = _1301;
    }
    bool _1303 = _452;
    float _1305 = 1.0 / _1261;
    float _1307 = _1295 * _1257;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1311 = _306 + _1309;
    bool _1313 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1315 = isnan(_304);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = 0;
    float _1327 = _1267;
    if (_1271)
    {
        float _1329 = -_1267;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1339 = _1311 * _1281;
    float _1341 = 1.0 / _1275;
    bool _1343 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1345 = isnan(_306);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1359 = -_1237;
    float _1361 = _1359 + 1.0;
    bool _1363 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1365 = isnan(_306);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1379 = 1.0 / _1357;
    int _1381 = _1291 ? as_type<int>(_1361) : as_type<int>(_1237);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1383;
    if (_1271)
    {
        bool _1387 = _308 > 0.5;
        _1297 = _1387;
    }
    bool _1389 = _1297;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1395 = _1385 * _1289;
    float _1397 = 1.0 / _1377;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1407 = _1393 * _1305;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = fma(_1407, _1241, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1415 = 1.0 / _1337;
    float _1417 = _1401 * _1379;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1419;
    bool _1423 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1425 = isnan(_304);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    bool _1435 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1437 = isnan(_306);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1447;
    float _1451 = 1.0 / _1405;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1453;
    float _1457 = _1411 * _1397;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1459;
    float _1463 = fma(_1421, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1465 = _1455 * _1341;
    float _1467 = fma(_1449, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1475 = _304 + _1473;
    bool _1477 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1479 = isnan(_304);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1489;
    float _1493 = _1471 * _1415;
    float _1495 = fma(_1395, _1475, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1499 = _304 + _1497;
    float _1501 = fma(_1491, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1507 = _1461 * _1451;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1515 = _304 + _1513;
    float _1517 = fma(_1505, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1521 = _304 + _1519;
    bool _1523 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1525 = isnan(_304);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1465, _1515, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1537 = fma(_1493, _1499, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1541 = _304 + _1539;
    float _1543 = fma(_1417, _1521, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1545 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1547 = isnan(_304);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = -_1533;
    float _1559 = _1557 + 1.0;
    float _1561 = fma(_1457, _1541, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1565 = _1563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = _1555 * _1559;
    float _1571 = -_1555;
    float _1573 = _1571 + 1.0;
    bool _1575 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1577 = isnan(_304);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1445;
    float _1589 = _1587 + 1.0;
    bool _1591 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1593 = isnan(_304);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1433 * _1573;
    float _1605 = -_1433;
    float _1607 = _1605 + 1.0;
    float _1609 = -_1585;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1487;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1565, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1619 = _1585 * _1607;
    float _1621 = _1323 * _1611;
    float _1623 = -_1323;
    float _1625 = _1623 + 1.0;
    float _1627 = fma(_1511, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _304 + _1629;
    bool _1633 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1635 = isnan(_304);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1487 * _1625;
    float _1647 = _1373 * _1589;
    float _1649 = _1601 * _1615;
    float _1651 = -_1373;
    float _1653 = _1651 + 1.0;
    float _1655 = -_1601;
    float _1657 = _1655 + 1.0;
    float _1659 = _1279 ? as_type<float>(_1381) : _1237;
    float _1661 = fma(_1507, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1663 = _1631;
    if (_1285)
    {
        float _1665 = _1287 ? _1361 : _1237;
        _1299 = _1665;
    }
    float _1667 = _1299;
    float _1669 = _1353 * _1653;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1673 = _1643 * _1657;
    float _1675 = -_1643;
    float _1677 = _1675 + 1.0;
    float _1679 = _1463 * _1669;
    float _1681 = _1467 * _1669;
    float _1683 = _1501 * _1669;
    float _1685 = _1495 * _1673;
    float _1687 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1689 = as_type<int>(_1567);
    if (_1265)
    {
        float _1691 = -_1267;
        float _1693 = _1691 + 1.0;
        _1689 = as_type<int>(_1693);
    }
    int _1695 = _1689;
    if (!_1265)
    {
        _1663 = _1267;
    }
    float _1697 = _1663;
    float _1699 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1685);
    float _1701 = fma(_1687, _1667, -0.5);
    float _1703 = -_1353;
    float _1705 = _1703 + 1.0;
    float _1707 = _1697;
    if (_1265)
    {
        float _1709 = _1303 ? as_type<float>(_1695) : _1267;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = fma(_1413, _1649, _1699);
    float _1715 = -_550;
    float _1717 = fma(_568, _1701, _1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = fma(_1535, _1645, _1713);
    float _1725 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1683);
    float _1727 = fma(_1719, _1711, -0.5);
    if (_1271)
    {
        float _1729 = _1389 ? as_type<float>(_1333) : _1267;
        _1327 = _1729;
    }
    float _1731 = _1327;
    float _1733 = fma(_1537, _1621, _1723);
    float _1735 = fma(_1627, _1647, _1725);
    float _1737 = fma(_566, _1727, _520);
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1741 = fma(_1543, _1619, _1733);
    float _1743 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1745 = _1737 + 0.5;
    float _1747 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1561, _1603, _1741);
    float _1751 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1735);
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1679);
    float _1755 = exp2(_1743);
    float _1757 = fma(_1661, _1569, _1749);
    float _1759 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1761 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1763 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1757);
    float _1767 = _1178 + _1154;
    float _1769 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1759);
    float _1771 = _1761 * _1721;
    float _1773 = _1751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1517, _1647, _1753);
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1779 = _1767 * 0.5;
    float _1781 = fma(_1617, _1647, _1763);
    float _1783 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1775);
    float _1785 = _1777 * _1739;
    float _1787 = -_1755;
    float _1789 = _1787 + 1.0;
    float _1791 = _1154 * 0.5;
    float _1793 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1781);
    float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1769);
    float _1799 = _1717 + 0.5;
    float _1801 = fma(_1182, -0.5, _1791);
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1811 = _1783 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1813 = _1797 + _1154;
    out.m_61.x = _1765;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1819 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1813 * 0.5;
    float _1833 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1819;
    out.m_63.y = _1821;
    out.m_63.z = _1823;
    out.m_63.w = _1817;
    out.m_65.x = _1745;
    out.m_65.y = _1799;
    out.m_65.z = _1785;
    out.m_65.w = _1771;
    out.m_67.x = _1825;
    out.m_67.y = _1827;
    out.m_67.z = _1829;
    out.m_67.w = _1815;
    out.gl_Position.x = _1178;
    out.gl_Position.y = _1182;
    out.gl_Position.z = _1797;
    out.gl_Position.w = _1154;
    out.m_69.x = _1779;
    out.m_69.y = _1801;
    out.m_69.z = _1831;
    out.m_69.w = _1154;
    out.m_45.x = _1833;
    float _1835 = _1795 * _1210;
    float _1837 = -_1795;
    float _1839 = _1837 + 1.0;
    float _1841 = _1225 * _1835;
    float _1843 = _1235 * _1835;
    float _1845 = fma(_1231, _1841, _1219);
    float _1847 = fma(_1233, _1841, _1221);
    float _1849 = _1225 * _1839;
    float _1851 = fma(_1225, _1843, _1223);
    out.m_71.x = _1845;
    out.m_71.y = _1847;
    out.m_71.z = _1851;
    out.m_71.w = _1849;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1908 = as_type<float>(_106);
        out.gl_Position.z = _1908;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_144);
        out.gl_Position.z = _1978;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _280;
        _294 = _290;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_51.z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = in.m_51.y;
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _322 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _324 = in.m_51.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _342 = _340 != 0;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _346 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _350 = !_334;
    int _352 = _350 ? 0 : 1;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _356 = _346 + _354;
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _366 = _362 || _364;
    float _368 = _308 * 2.0;
    int _370 = abs(_352);
    float _372 = floor(_368);
    float _374 = _316 * 2.0;
    float _376 = _316 + _308;
    float _378 = float(_370);
    float _380 = _324 * 2.0;
    float _382 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = floor(_374);
    float _386 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = -_348;
    float _390 = fma(_382, 2.0, _388);
    float _392 = _324 + _316;
    float _394 = fma(_386, -2.0, _344);
    float _396 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _398 = _392 + (-1.0);
    bool _400 = _372 > 0.0;
    float _402 = floor(_380);
    bool _404 = _372 >= 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _416 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = _376 + (-1.0);
    int _420 = _412 ? 0 : 1;
    float _422 = _414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _424 = _384 >= 0.0;
    bool _426 = isnan(_384);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _416 + _434;
    int _438 = ~_420;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _446 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _448 = _442;
    float _450 = _416;
    bool _452 = _338;
    if (!_400)
    {
        int _454 = ~_420;
        int _456 = _454 + 1;
        _448 = _456;
    }
    int _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _462 = _422 + _460;
    bool _464 = _384 > 0.0;
    float _466 = _328 * _124;
    float _468 = _436 * _436;
    bool _470 = _402 > 0.0;
    bool _472 = _402 >= 0.0;
    bool _474 = isnan(_402);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = exp2(_466);
    float _484 = in.m_53.x;
    float _486 = in.m_53.y;
    float _488 = in.m_53.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    float _494 = fma(_462, _462, _468);
    float _496 = float(_458);
    float _498 = 1.0 / _492;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _504 = _432 ? 0 : 1;
    float _506 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _502);
    int _508 = ~_504;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = -_482;
    float _516 = _514 + 1.0;
    float _518 = -_124;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    int _522 = _480 ? 0 : 1;
    int _524 = _512;
    if (!_464)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = _366 ? _516 : 0.0;
    float _534 = fma(_356, _356, _494);
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _500);
    float _548 = _378 * _496;
    float _550 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    bool _552 = !_338;
    int _554 = _552 ? 0 : 1;
    float _556 = rsqrt(_534);
    float _558 = _548 * (-2.0);
    int _560 = ~_522;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _568 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _506);
    int _570 = _564;
    if (!_470)
    {
        int _572 = ~_522;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = fma(_558, _484, _484);
    int _580 = abs(_554);
    if (_544)
    {
        float _582 = _532 * _498;
        _126 = _582;
    }
    float _584 = _126;
    float _586 = fma(_446, _558, _446);
    float _588 = _324 + (-0.5);
    bool _590 = !_342;
    int _592 = _590 ? 0 : 1;
    float _594 = float(_580);
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[196].x, _578);
    float _598 = float(_576);
    float _600 = _436 * _556;
    int _602 = abs(_592);
    float _604 = fma(_586, _584, _596);
    float _606 = _462 * _556;
    float _608 = _594 * _598;
    float _610 = -_600;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _436);
    float _614 = _316 + (-0.5);
    float _616 = _608 * (-2.0);
    float _618 = float(_602);
    float _620 = -_606;
    float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _462);
    float _624 = _612 * _612;
    float _626 = fma(_616, _486, _486);
    float _628 = float(_530);
    float _630 = fma(_444, _616, _444);
    float _632 = _324 + _308;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _626);
    float _636 = _356 * _556;
    float _638 = _618 * _628;
    float _640 = fma(_622, _622, _624);
    float _642 = fma(_630, _584, _634);
    float _644 = _632 + (-1.0);
    float _646 = _638 * (-2.0);
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _652 = in.m_49.x;
    float _654 = in.m_49.y;
    float _656 = in.m_49.z;
    float _658 = fma(_646, _488, _488);
    float _660 = fma(_650, _650, _640);
    float _662 = _642 * 0.15915493667125701904296875;
    float _664 = _308 + (-0.5);
    float _666 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = _604 * 0.15915493667125701904296875;
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = sqrt(_660);
    float _678 = fma(_666, _646, _666);
    float _680 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _658);
    float _682 = fma(_678, _584, _680);
    float _684 = _668 * 6.283185482025146484375;
    float _686 = sin(_684);
    float _688 = _682 * 0.15915493667125701904296875;
    float _690 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _692 = _668 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _698 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = _556 * _676;
    float _702 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _710 = _662 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _700 * _702;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _718 = _700 * _704;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _722 = _708 * _714;
    float _724 = _716 * _718;
    float _726 = _662 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _688 * 6.283185482025146484375;
    float _732 = cos(_730);
    float _734 = _686 * _712;
    float _736 = _700 * _706;
    float _738 = _694 * _712;
    float _740 = _720 * _736;
    float _742 = _688 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = _694 * _728;
    float _748 = _732 * _722;
    float _750 = _712 * _732;
    float _752 = _728 * _732;
    float _754 = _686 * _728;
    float _756 = _694 * _748;
    float _758 = _686 * _748;
    float _760 = fma(_744, _746, _734);
    float _762 = -_722;
    float _764 = _744 * _762;
    float _766 = fma(_760, _724, _756);
    float _768 = -_754;
    float _770 = fma(_744, _738, _768);
    float _772 = -_738;
    float _774 = fma(_744, _754, _772);
    float _776 = fma(_752, _724, _764);
    float _778 = fma(_744, _734, _746);
    float _780 = fma(_770, _740, _766);
    float _782 = fma(_774, _724, _758);
    float _784 = fma(_750, _740, _776);
    float _786 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _788 = fma(_778, _740, _782);
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _786);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _790);
    float _796 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _792);
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _800 = _346 + _796;
    float _802 = _422 + _798;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _800 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _802 + _808;
    float _812 = _806 * _806;
    float _814 = fma(_810, _810, _812);
    float _816 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _818 = sqrt(_814);
    float _820 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _816);
    float _822 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _820);
    float _824 = _416 + _822;
    bool _826 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _820;
    float _830 = _822;
    float _832 = _802;
    float _834 = _800;
    if (!_826)
    {
        _828 = _800;
    }
    float _836 = _828;
    float _838 = _836;
    if (!_826)
    {
        _830 = _824;
    }
    float _840 = _830;
    bool _842 = !_826;
    float _844 = _840;
    if (!_842)
    {
        float _846 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _850 = _818 + _848;
        float _852 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = rsqrt(_814);
        float _856 = _850 * _846;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _858 * 6.283185482025146484375;
        float _862 = cos(_860);
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 + (-1.0);
        float _870 = _868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = fma(_866, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _874 = fma(_824, _862, _870);
        float _876 = _854 * _872;
        float _878 = fma(_810, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _880 = fma(_806, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _844 = _874;
        _832 = _878;
        _838 = _880;
        _450 = _854;
    }
    float _882 = _844;
    float _884 = _832;
    float _886 = _838;
    float _888 = _450;
    float _890 = -_600;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _882);
    float _894 = -_606;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _898 = -_636;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _892 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _912;
    float _946 = _916;
    float _948 = _942;
    float _950 = _904;
    float _952 = _924;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _834 = _968;
    }
    float _970 = _834;
    float _972 = _920;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _888;
    float _986 = _980;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    float _1000 = _998;
    if (!_938)
    {
        _950 = _930;
    }
    float _1002 = _950;
    float _1004 = _1002;
    if (_938)
    {
        float _1006 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1006;
    }
    float _1008 = _986;
    float _1010 = _892 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _978;
    float _1014 = _1008;
    if (_938)
    {
        float _1016 = fma(_978, _1008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1012 = _1016;
    }
    float _1018 = _1012;
    float _1020 = _1018;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _1014 = _1024;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _960 * _1018;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1020 = _926;
    }
    float _1034 = _1020;
    float _1036 = _1034;
    if (_938)
    {
        float _1038 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _1038;
    }
    float _1040 = _962;
    if (_938)
    {
        float _1042 = _926 * _1032;
        _1036 = _1042;
    }
    float _1044 = _1036;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1046 = _1028;
    float _1048 = _1046;
    if (_938)
    {
        float _1050 = _928 * _1032;
        _1048 = _1050;
    }
    float _1052 = _1048;
    if (_938)
    {
        float _1054 = fma(_998, _992, _1040);
        _1000 = _1054;
    }
    float _1056 = _1000;
    if (_938)
    {
        float _1058 = _1044 * _1044;
        _1004 = _1058;
    }
    float _1060 = _1004;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1062 = _1022;
    float _1064 = _1062;
    if (_938)
    {
        float _1066 = _1052 * _1052;
        _1064 = _1066;
    }
    float _1068 = _1064;
    float _1070 = fma(_1056, _1056, _1060);
    float _1072 = _1070 + _1068;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1076 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1074);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1082 = _892 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = rsqrt(_1072);
    float _1086 = -_1078;
    float _1088 = _1086 + 1.0;
    float _1090 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1080);
    float _1092 = _892 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1094 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1082);
    float _1096 = _892 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1100 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1092);
    float _1102 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1094);
    float _1104 = abs(_1088);
    float _1106 = log2(_1104);
    float _1108 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1110 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1100);
    float _1112 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1120 = _1084 * _1044;
    float _1122 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1084 * _1056;
    float _1126 = -_1114;
    float _1128 = fma(_1126, _1108, 1.0);
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1132 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1134 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1136 = _1084 * _1052;
    float _1138 = -_1130;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1144 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1134);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1148 = -_1136;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1140);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1144);
    float _1156 = exp2(_1146);
    float _1158 = fma(_1150, -0.5, 0.5);
    float _1160 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1162 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1152);
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = _1124 + 1.0;
    float _1168 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1160);
    float _1170 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1162);
    float _1172 = log2(_1128);
    float _1174 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1176 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1168);
    float _1178 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1170);
    float _1180 = fma(_1164, _1174, -0.212114393711090087890625);
    float _1182 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1176);
    float _1184 = 1.0 / _1154;
    float _1186 = -_1124;
    float _1188 = fma(_1156, _1166, _1186);
    float _1190 = fma(_1164, _1180, 1.570728778839111328125);
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = sqrt(_1158);
    float _1196 = _1172 * 0.693147182464599609375;
    float _1198 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1200 = _1178 * _1184;
    float _1202 = _1182 * _1184;
    float _1204 = fma(_1200, 0.5, 0.5);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = _1194 * 0.636619746685028076171875;
    float3 _3642 = float3(_1204, _1206, _1198);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3642, float3(0.0), isnan(_3642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3642, float3(0.0), isnan(_3642)), level(0.0)).x;
    float _1212 = -_1190;
    float _1214 = fma(_1208, _1212, 1.0);
    float3 _3658 = float3(_1204, _1206, _1198);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3658, float3(0.0), isnan(_3658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3658, float3(0.0), isnan(_3658)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float2 _3675 = float2(_1214, _1192);
    float3 _1229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3675, float2(0.0), isnan(_3675)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3675, float2(0.0), isnan(_3675)), level(0.0)).xyz;
    float _1231 = _1229.x;
    float _1233 = _1229.y;
    float _1235 = _1229.z;
    float _1237 = in.m_57.y;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1241 = _304 + _1239;
    float _1243 = in.m_51.w;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1257 = 1.0 / _1247;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = in.m_57.x;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1251;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1285 = _1283 != 0;
    bool _1287 = _316 > 0.5;
    float _1289 = 1.0 / _1255;
    bool _1291 = _1243 > 0.5;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _306 + _1293;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1297 = _1291;
    float _1299 = _1237;
    if (_1265)
    {
        bool _1301 = _324 > 0.5;
        _452 = _1301;
    }
    bool _1303 = _452;
    float _1305 = 1.0 / _1261;
    float _1307 = _1295 * _1257;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1311 = _306 + _1309;
    bool _1313 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1315 = isnan(_304);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    int _1325 = 0;
    float _1327 = _1267;
    if (_1271)
    {
        float _1329 = -_1267;
        float _1331 = _1329 + 1.0;
        _1325 = as_type<int>(_1331);
    }
    int _1333 = _1325;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1339 = _1311 * _1281;
    float _1341 = 1.0 / _1275;
    bool _1343 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1345 = isnan(_306);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1359 = -_1237;
    float _1361 = _1359 + 1.0;
    bool _1363 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1365 = isnan(_306);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1371 = _1367 || _1369;
    float _1373 = float(_1371);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1379 = 1.0 / _1357;
    int _1381 = _1291 ? as_type<int>(_1361) : as_type<int>(_1237);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1383;
    if (_1271)
    {
        bool _1387 = _308 > 0.5;
        _1297 = _1387;
    }
    bool _1389 = _1297;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1395 = _1385 * _1289;
    float _1397 = 1.0 / _1377;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1407 = _1393 * _1305;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = fma(_1407, _1241, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1415 = 1.0 / _1337;
    float _1417 = _1401 * _1379;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1419;
    bool _1423 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1425 = isnan(_304);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    bool _1435 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1437 = isnan(_306);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1447;
    float _1451 = 1.0 / _1405;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1453;
    float _1457 = _1411 * _1397;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1459;
    float _1463 = fma(_1421, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1465 = _1455 * _1341;
    float _1467 = fma(_1449, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1475 = _304 + _1473;
    bool _1477 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1479 = isnan(_304);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1489;
    float _1493 = _1471 * _1415;
    float _1495 = fma(_1395, _1475, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1499 = _304 + _1497;
    float _1501 = fma(_1491, _1307, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1505 = _1503 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1507 = _1461 * _1451;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1515 = _304 + _1513;
    float _1517 = fma(_1505, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1521 = _304 + _1519;
    bool _1523 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1525 = isnan(_304);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1465, _1515, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1537 = fma(_1493, _1499, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1541 = _304 + _1539;
    float _1543 = fma(_1417, _1521, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1545 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1547 = isnan(_304);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1553 = _1549 || _1551;
    float _1555 = float(_1553);
    float _1557 = -_1533;
    float _1559 = _1557 + 1.0;
    float _1561 = fma(_1457, _1541, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1565 = _1563 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = _1555 * _1559;
    float _1571 = -_1555;
    float _1573 = _1571 + 1.0;
    bool _1575 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1577 = isnan(_304);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1445;
    float _1589 = _1587 + 1.0;
    bool _1591 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1593 = isnan(_304);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = _1433 * _1573;
    float _1605 = -_1433;
    float _1607 = _1605 + 1.0;
    float _1609 = -_1585;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1487;
    float _1615 = _1613 + 1.0;
    float _1617 = fma(_1565, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1619 = _1585 * _1607;
    float _1621 = _1323 * _1611;
    float _1623 = -_1323;
    float _1625 = _1623 + 1.0;
    float _1627 = fma(_1511, _1339, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _304 + _1629;
    bool _1633 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1635 = isnan(_304);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1487 * _1625;
    float _1647 = _1373 * _1589;
    float _1649 = _1601 * _1615;
    float _1651 = -_1373;
    float _1653 = _1651 + 1.0;
    float _1655 = -_1601;
    float _1657 = _1655 + 1.0;
    float _1659 = _1279 ? as_type<float>(_1381) : _1237;
    float _1661 = fma(_1507, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1663 = _1631;
    if (_1285)
    {
        float _1665 = _1287 ? _1361 : _1237;
        _1299 = _1665;
    }
    float _1667 = _1299;
    float _1669 = _1353 * _1653;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1673 = _1643 * _1657;
    float _1675 = -_1643;
    float _1677 = _1675 + 1.0;
    float _1679 = _1463 * _1669;
    float _1681 = _1467 * _1669;
    float _1683 = _1501 * _1669;
    float _1685 = _1495 * _1673;
    float _1687 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1689 = as_type<int>(_1567);
    if (_1265)
    {
        float _1691 = -_1267;
        float _1693 = _1691 + 1.0;
        _1689 = as_type<int>(_1693);
    }
    int _1695 = _1689;
    if (!_1265)
    {
        _1663 = _1267;
    }
    float _1697 = _1663;
    float _1699 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1685);
    float _1701 = fma(_1687, _1667, -0.5);
    float _1703 = -_1353;
    float _1705 = _1703 + 1.0;
    float _1707 = _1697;
    if (_1265)
    {
        float _1709 = _1303 ? as_type<float>(_1695) : _1267;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = fma(_1413, _1649, _1699);
    float _1715 = -_550;
    float _1717 = fma(_568, _1701, _1715);
    float _1719 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1723 = fma(_1535, _1645, _1713);
    float _1725 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1683);
    float _1727 = fma(_1719, _1711, -0.5);
    if (_1271)
    {
        float _1729 = _1389 ? as_type<float>(_1333) : _1267;
        _1327 = _1729;
    }
    float _1731 = _1327;
    float _1733 = fma(_1537, _1621, _1723);
    float _1735 = fma(_1627, _1647, _1725);
    float _1737 = fma(_566, _1727, _520);
    float _1739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1741 = fma(_1543, _1619, _1733);
    float _1743 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1745 = _1737 + 0.5;
    float _1747 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1561, _1603, _1741);
    float _1751 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1735);
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1679);
    float _1755 = exp2(_1743);
    float _1757 = fma(_1661, _1569, _1749);
    float _1759 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1761 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1763 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1757);
    float _1767 = _1178 + _1154;
    float _1769 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1759);
    float _1771 = _1761 * _1721;
    float _1773 = _1751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1517, _1647, _1753);
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1779 = _1767 * 0.5;
    float _1781 = fma(_1617, _1647, _1763);
    float _1783 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1775);
    float _1785 = _1777 * _1739;
    float _1787 = -_1755;
    float _1789 = _1787 + 1.0;
    float _1791 = _1154 * 0.5;
    float _1793 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1781);
    float _1795 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1769);
    float _1799 = _1717 + 0.5;
    float _1801 = fma(_1182, -0.5, _1791);
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1811 = _1783 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1813 = _1797 + _1154;
    out.m_61.x = _1765;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1819 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1813 * 0.5;
    float _1833 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1819;
    out.m_63.y = _1821;
    out.m_63.z = _1823;
    out.m_63.w = _1817;
    out.m_65.x = _1745;
    out.m_65.y = _1799;
    out.m_65.z = _1785;
    out.m_65.w = _1771;
    out.m_67.x = _1825;
    out.m_67.y = _1827;
    out.m_67.z = _1829;
    out.m_67.w = _1815;
    out.gl_Position.x = _1178;
    out.gl_Position.y = _1182;
    out.gl_Position.z = _1797;
    out.gl_Position.w = _1154;
    out.m_69.x = _1779;
    out.m_69.y = _1801;
    out.m_69.z = _1831;
    out.m_69.w = _1154;
    out.m_45.x = _1833;
    float _1835 = _1795 * _1210;
    float _1837 = -_1795;
    float _1839 = _1837 + 1.0;
    float _1841 = _1225 * _1835;
    float _1843 = _1235 * _1835;
    float _1845 = fma(_1231, _1841, _1219);
    float _1847 = fma(_1233, _1841, _1221);
    float _1849 = _1225 * _1839;
    float _1851 = fma(_1225, _1843, _1223);
    out.m_71.x = _1845;
    out.m_71.y = _1847;
    out.m_71.z = _1851;
    out.m_71.w = _1849;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

