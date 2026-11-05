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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1166 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1728 = as_type<float>(_106);
        out.gl_Position.z = _1728;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1798 = as_type<float>(_144);
        out.gl_Position.z = _1798;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = in.m_53.x;
    float _300 = in.m_53.y;
    float _302 = in.m_53.z;
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _316);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _344 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _346 = _300 + _302;
    float _348 = _302 + _298;
    float _350 = _302 + (-0.5);
    float _352 = _302 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = _300 + _298;
    float _360 = _298 + (-0.5);
    float _362 = floor(_352);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _300 * 2.0;
    float _370 = _346 + (-1.0);
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = 1.0 / _356;
    float _376 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _380 = _348 + (-1.0);
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _296 + _384;
    bool _388 = _362 > 0.0;
    float _390 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _392 = _362 >= 0.0;
    bool _394 = isnan(_362);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _404 = log2(_402);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _378);
    float _408 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _390);
    float _410 = _358 + (-1.0);
    float _412 = _386 * _374;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _382);
    float _416 = floor(_364);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _408);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    bool _426 = !_324;
    int _428 = _426 ? 0 : 1;
    float _430 = _404 * _124;
    int _432 = _400 ? 0 : 1;
    float _434 = floor(_368);
    bool _436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _448 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _450 = ~_432;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    int _456 = _454;
    if (!_388)
    {
        int _458 = ~_432;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = exp2(_430);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    bool _470 = _416 > 0.0;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    bool _482 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_296);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _468;
    bool _496 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_296);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = float(_462);
    float _510 = -_464;
    float _512 = _510 + 1.0;
    bool _514 = _434 > 0.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    bool _520 = _434 >= 0.0;
    bool _522 = isnan(_434);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    float _534 = _444 ? _512 : 0.0;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    int _540 = abs(_428);
    float _542 = fma(_518, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = in.m_55.x;
    float _546 = in.m_55.y;
    float _548 = in.m_55.z;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_532, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = float(_540);
    float _564 = fma(_424, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _566 = _492 * _538;
    bool _568 = !_328;
    int _570 = _568 ? 0 : 1;
    float _572 = sqrt(_406);
    float _574 = _562 * _508;
    int _576 = _480 ? 0 : 1;
    float _578 = _542 * _566;
    float _580 = _560 * _566;
    float _582 = _574 * (-2.0);
    float _584 = _564 * _566;
    if (_558)
    {
        float _586 = _534 * _494;
        _126 = _586;
    }
    float _588 = _126;
    int _590 = ~_576;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    int _596 = abs(_570);
    int _598 = _594;
    if (!_470)
    {
        int _600 = ~_576;
        int _602 = _600 + 1;
        _598 = _602;
    }
    int _604 = _598;
    float _606 = fma(_420, _582, _420);
    bool _608 = !_332;
    int _610 = _608 ? 0 : 1;
    float _612 = float(_604);
    float _614 = fma(_582, _544, _544);
    float _616 = float(_596);
    float _618 = _572 * _344;
    int _620 = abs(_610);
    float _622 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _614);
    int _624 = _528 ? 0 : 1;
    float _626 = _616 * _612;
    float _628 = sqrt(_414);
    float _630 = fma(_606, _588, _622);
    int _632 = ~_624;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * (-2.0);
    float _640 = _630 * 0.15915493667125701904296875;
    int _642 = _636;
    if (!_514)
    {
        int _644 = ~_624;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = fma(_446, _638, _446);
    float _652 = sqrt(_418);
    float _654 = float(_620);
    float _656 = fma(_638, _546, _546);
    float _658 = float(_648);
    float _660 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _662 = _654 * _658;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    float _670 = _628 * _340;
    float _672 = fma(_650, _588, _660);
    float _674 = _662 * (-2.0);
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = in.m_57.z;
    float _682 = _640 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = _672 * 0.15915493667125701904296875;
    float _688 = _652 * _342;
    float _690 = fma(_674, _548, _548);
    float _692 = -_492;
    float _694 = _692 + 1.0;
    float _696 = fma(_448, _674, _448);
    float _698 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _690);
    float _700 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _706 = fma(_696, _588, _698);
    float _708 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _712 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = _640 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _724 = _712 * _668;
    float _726 = _670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _710 * _666;
    float _730 = _708 * _664;
    float _732 = _686 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _742 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _746 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].x, _722);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _750 = _686 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = _742 * _740;
    float _756 = _738 * _744;
    float _758 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _760 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _762 = _678 != 0.0;
    bool _764 = isnan(_678);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _746);
    float _774 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _776 = _714 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _684 * _734;
    float _782 = _718 * _734;
    float _784 = _760 * _748;
    bool _786 = _676 == 0.0;
    bool _788 = !_770;
    bool _790 = _786 && _788;
    float _792 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _794 = _714 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _718 * _752;
    float _800 = _684 * _752;
    bool _802 = _680 == 0.0;
    bool _804 = _802 && _790;
    float _806 = _684 * _778;
    float _808 = _718 * _778;
    float _810 = _752 * _778;
    float _812 = _734 * _778;
    float _814 = _808 * _756;
    float _816 = fma(_796, _798, _780);
    float _818 = -_756;
    float _820 = _796 * _818;
    float _822 = fma(_796, _780, _798);
    float _824 = -_800;
    float _826 = fma(_796, _782, _824);
    float _828 = fma(_816, _754, _814);
    float _830 = -_782;
    float _832 = fma(_796, _800, _830);
    float _834 = _806 * _756;
    float _836 = fma(_810, _754, _820);
    float _838 = fma(_826, _784, _828);
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = fma(_832, _754, _834);
    float _848 = fma(_812, _784, _836);
    float _850 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = fma(_822, _784, _846);
    float _856 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].w, _774);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _868 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].w, _772);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _860);
    float _872 = _864 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _874 = _866 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _876 = _868 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _882 = _872 + _874;
    float _884 = _876 + _878;
    float _886 = -_796;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _880);
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _892 = _840;
    float _894 = _842;
    float _896 = _844;
    float _898 = _832;
    float _900 = _882;
    float _902 = _884;
    if (!_804)
    {
        float _904 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _904;
    }
    float _906 = _892;
    if (!_804)
    {
        float _908 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _908;
    }
    float _910 = _894;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _882 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _884 + _916;
    float _920 = _910;
    if (!_804)
    {
        float _922 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _844);
        _896 = _922;
    }
    float _924 = _896;
    float _926 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].w, _792);
    float _928 = _914 * _914;
    float _930 = _918 * _918;
    float _932 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _934 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _936 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _938 = _928 + _930;
    float _940 = -_796;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _932);
    float _944 = -_796;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].x, _934);
    float _948 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _950 = sqrt(_938);
    float _952 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _954 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _956 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _958 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _960 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _962 = _926 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _966 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _956);
    float _968 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _958);
    float _970 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _960);
    float _972 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _976 = _962 + _964;
    float _978 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    bool _982 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _974);
    float _986 = _952 * _910;
    float _988 = _936 * _910;
    float _990 = _954 * _910;
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _966);
    float _994 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _968);
    float _996 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _970);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _1000 = _954;
    if (!_982)
    {
        _898 = _930;
    }
    float _1002 = _898;
    float _1004 = _1002;
    if (!_982)
    {
        _920 = _928;
    }
    float _1006 = _920;
    float _1008 = _1006;
    if (!_982)
    {
        _1000 = _976;
    }
    float _1010 = _1000;
    bool _1012 = !_982;
    float _1014 = _1010;
    if (!_1012)
    {
        float _1016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1020 = _950 + _1018;
        float _1022 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = rsqrt(_938);
        float _1026 = _1020 * _1016;
        float _1028 = _1026 * 0.15915493667125701904296875;
        float _1030 = _1028 * 6.283185482025146484375;
        float _1032 = sin(_1030);
        float _1034 = _1028 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = fma(_1032, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1040 = _1024 * _1038;
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_914, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1046 = fma(_918, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1048 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1052 = _1044 + _1050;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1056 = _1046 + _1054;
        float _1058 = fma(_976, _1036, _1048);
        float _1060 = _1052 * _1052;
        float _1062 = _1056 * _1056;
        _1014 = _1058;
        _1008 = _1060;
        _1004 = _1062;
        _900 = _1044;
        _902 = _1046;
    }
    float _1064 = _1014;
    float _1066 = _1008;
    float _1068 = _1004;
    float _1070 = _900;
    float _1072 = _902;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1076 = _1064 + _1074;
    float _1078 = fma(_994, _906, _988);
    float _1080 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _980);
    float _1082 = fma(_1076, _1076, _1066);
    float _1084 = fma(_996, _906, _990);
    float _1086 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _984);
    float _1088 = _1082 + _1068;
    float _1090 = fma(_992, _906, _986);
    float _1092 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = sqrt(_1088);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1102 = fma(_1080, _924, _1090);
    float _1104 = fma(_1086, _924, _1078);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = fma(_1092, _924, _1084);
    out.m_61.x = _1106;
    out.m_61.y = _1108;
    out.m_61.z = _1110;
    out.m_63.x = _1102;
    out.m_63.y = _1104;
    out.m_63.z = _1112;
    bool _1114 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1116 = isnan(_1098);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1122 = _1118 || _1120;
    float _1124 = _1084;
    float _1126 = _1112;
    float _1128 = _1064;
    float _1130 = _1110;
    if (!_1122)
    {
        _1124 = 1.0;
    }
    float _1132 = _1124;
    bool _1134 = !_1122;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1098);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1098 + _1148;
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1158 = _1156 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1160 = 1.0 / _1154;
            float _1162 = _1150 * _1160;
            float _1164 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1136 = _1164;
            _1166 = true;
        }
        else
        {
            bool _1168 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1098);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1098 + _1178;
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1182 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1190 = 1.0 / _1184;
                float _1192 = _1180 * _1190;
                float _1194 = fma(_1192, _1188, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1136 = _1194;
                _1166 = true;
            }
            else
            {
                _1136 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1166 = false;
    float _1196 = _1136;
    float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1200 = _1070 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1064 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1072 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = fma(_1200, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1222 = fma(_1204, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1208, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1228 = _1204;
    if (_1218)
    {
        _1226 = _1220;
    }
    float _1230 = _1226;
    float _1232 = _1230;
    if (_1218)
    {
        _1228 = _1222;
    }
    float _1234 = _1228;
    float _1236 = _1234;
    if (_1218)
    {
        _1126 = _1224;
    }
    float _1238 = _1126;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _962 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _872 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _876 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -_876;
        float _1270 = _1268 + _1224;
        float _1272 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1274 = _1272 * _1260;
        float _1276 = -_872;
        float _1278 = _1276 + _1220;
        float _1280 = _1266 * _1274;
        float _1282 = -_962;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1278, _1280, _872);
        float _1288 = fma(_1284, _1280, _962);
        float _1290 = fma(_1270, _1280, _876);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
        _1128 = _1280;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = _1128;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1294 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1296 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1306 * _1322;
    float _1326 = _1310 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1340;
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    float _1356 = _1354;
    if (_1336)
    {
        float _1358 = _1340 * _1354;
        _1344 = _1358;
    }
    float _1360 = _1344;
    if (_1336)
    {
        float _1362 = rsqrt(_1332);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (_1336)
    {
        float _1368 = _1360 * 0.15915493667125701904296875;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1374 = _1320;
    if (_1336)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = precise::max(0.0, _1372);
    float _1386 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1388 = _1310;
    float _1390 = _1384;
    if (_1336)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1388 = _1394;
    }
    float _1396 = _1388;
    float _1398 = -_1322;
    float _1400 = -_1384;
    float _1402 = fma(_1302, _1398, _1400);
    float _1404 = _1402;
    if (_1336)
    {
        float _1406 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1380;
    float _1412 = _1408;
    if (_1336)
    {
        float _1414 = fma(_1380, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1410 = _1414;
    }
    float _1416 = _1410;
    if (_1336)
    {
        float _1418 = _1364 * _1416;
        _1130 = _1418;
    }
    float _1420 = _1130;
    if (!_1336)
    {
        _1366 = _1326;
    }
    float _1422 = _1366;
    float _1424 = sqrt(_1318);
    float _1426 = _1422;
    if (_1336)
    {
        float _1428 = _1396 + (-1.0);
        _1390 = _1428;
    }
    float _1430 = _1390;
    float _1432 = _1430;
    if (_1336)
    {
        float _1434 = _1324 * _1420;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1336)
    {
        float _1438 = _1326 * _1420;
        _1426 = _1438;
    }
    float _1440 = _1426;
    if (_1336)
    {
        float _1442 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1442;
    }
    float _1444 = _1412;
    float _1446 = _1444;
    if (!_1336)
    {
        _1432 = _1328;
    }
    float _1448 = _1432;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1436 * _1436;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1402, _1396, _1444);
        _1404 = _1456;
    }
    float _1458 = _1404;
    if (!_1336)
    {
        _1446 = _1330;
    }
    float _1460 = _1446;
    float _1462 = _1460;
    if (_1336)
    {
        float _1464 = _1440 * _1440;
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = fma(_1458, _1458, _1454);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1466;
    float _1478 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = -_1474;
    float _1482 = _1480 + 1.0;
    float _1484 = rsqrt(_1476);
    float _1486 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1492 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1494 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = abs(_1482);
    float _1498 = log2(_1496);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1504 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1504);
    float _1512 = _1484 * _1436;
    float _1514 = _1484 * _1458;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1522 = -_1506;
    float _1524 = fma(_1522, _1316, 1.0);
    float _1526 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = _1484 * _1440;
    float _1534 = -_1520;
    float _1536 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1542 = log2(_1524);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1552 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1546, 0.5, 0.5);
    float _1560 = exp2(_1530);
    float _1562 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1552);
    float _1564 = _1514 + 1.0;
    float _1566 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1568 = fma(_1558, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1562);
    float _1572 = 1.0 / _1550;
    float _1574 = fma(_1558, _1568, -0.212114393711090087890625);
    float _1576 = _1542 * 0.693147182464599609375;
    float _1578 = fma(_1558, _1574, 1.570728778839111328125);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = sqrt(_1554);
    float _1584 = -_1514;
    float _1586 = fma(_1560, _1564, _1584);
    float _1588 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1570);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = _1588 * _1572;
    float _1596 = _1590 * _1572;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1582 * 0.636619746685028076171875;
    float3 _4181 = float3(_1598, _1600, _1580);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1598, _1600, _1580);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float _1617 = -_1578;
    float _1619 = fma(_1602, _1617, 1.0);
    float2 _4214 = float2(_1619, _1592);
    float3 _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1625 = _1623.x;
    float _1627 = _1623.y;
    float _1629 = _1623.z;
    float _1631 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1633 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1635 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1633);
    float _1637 = exp2(_1631);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1639 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1645 = _1643 + _1550;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1590;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1550;
    float _1647 = -_1637;
    float _1649 = _1647 + 1.0;
    float _1651 = _1645 * 0.5;
    out.m_67.w = _1641;
    float _1653 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1651;
    out.m_69.w = _1550;
    float _1655 = _1653 * _1604;
    float _1657 = -_1653;
    float _1659 = _1657 + 1.0;
    float _1661 = _1615 * _1655;
    float _1663 = _1615 * _1659;
    float _1665 = _1629 * _1655;
    float _1667 = fma(_1625, _1661, _1609);
    float _1669 = fma(_1627, _1661, _1611);
    float _1671 = fma(_1615, _1665, _1613);
    out.m_71.x = _1667;
    out.m_71.y = _1669;
    out.m_71.z = _1671;
    out.m_71.w = _1663;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1166 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1728 = as_type<float>(_106);
        out.gl_Position.z = _1728;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1798 = as_type<float>(_144);
        out.gl_Position.z = _1798;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = in.m_53.x;
    float _300 = in.m_53.y;
    float _302 = in.m_53.z;
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _316);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _344 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _346 = _300 + _302;
    float _348 = _302 + _298;
    float _350 = _302 + (-0.5);
    float _352 = _302 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = _300 + _298;
    float _360 = _298 + (-0.5);
    float _362 = floor(_352);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _300 * 2.0;
    float _370 = _346 + (-1.0);
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = 1.0 / _356;
    float _376 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _380 = _348 + (-1.0);
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _296 + _384;
    bool _388 = _362 > 0.0;
    float _390 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _392 = _362 >= 0.0;
    bool _394 = isnan(_362);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _404 = log2(_402);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _378);
    float _408 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _390);
    float _410 = _358 + (-1.0);
    float _412 = _386 * _374;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _382);
    float _416 = floor(_364);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _408);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    bool _426 = !_324;
    int _428 = _426 ? 0 : 1;
    float _430 = _404 * _124;
    int _432 = _400 ? 0 : 1;
    float _434 = floor(_368);
    bool _436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _448 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _450 = ~_432;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    int _456 = _454;
    if (!_388)
    {
        int _458 = ~_432;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = exp2(_430);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    bool _470 = _416 > 0.0;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    bool _482 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_296);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _468;
    bool _496 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_296);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = float(_462);
    float _510 = -_464;
    float _512 = _510 + 1.0;
    bool _514 = _434 > 0.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    bool _520 = _434 >= 0.0;
    bool _522 = isnan(_434);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    float _534 = _444 ? _512 : 0.0;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    int _540 = abs(_428);
    float _542 = fma(_518, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = in.m_55.x;
    float _546 = in.m_55.y;
    float _548 = in.m_55.z;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_532, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = float(_540);
    float _564 = fma(_424, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _566 = _492 * _538;
    bool _568 = !_328;
    int _570 = _568 ? 0 : 1;
    float _572 = sqrt(_406);
    float _574 = _562 * _508;
    int _576 = _480 ? 0 : 1;
    float _578 = _542 * _566;
    float _580 = _560 * _566;
    float _582 = _574 * (-2.0);
    float _584 = _564 * _566;
    if (_558)
    {
        float _586 = _534 * _494;
        _126 = _586;
    }
    float _588 = _126;
    int _590 = ~_576;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    int _596 = abs(_570);
    int _598 = _594;
    if (!_470)
    {
        int _600 = ~_576;
        int _602 = _600 + 1;
        _598 = _602;
    }
    int _604 = _598;
    float _606 = fma(_420, _582, _420);
    bool _608 = !_332;
    int _610 = _608 ? 0 : 1;
    float _612 = float(_604);
    float _614 = fma(_582, _544, _544);
    float _616 = float(_596);
    float _618 = _572 * _344;
    int _620 = abs(_610);
    float _622 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _614);
    int _624 = _528 ? 0 : 1;
    float _626 = _616 * _612;
    float _628 = sqrt(_414);
    float _630 = fma(_606, _588, _622);
    int _632 = ~_624;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * (-2.0);
    float _640 = _630 * 0.15915493667125701904296875;
    int _642 = _636;
    if (!_514)
    {
        int _644 = ~_624;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = fma(_446, _638, _446);
    float _652 = sqrt(_418);
    float _654 = float(_620);
    float _656 = fma(_638, _546, _546);
    float _658 = float(_648);
    float _660 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _662 = _654 * _658;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    float _670 = _628 * _340;
    float _672 = fma(_650, _588, _660);
    float _674 = _662 * (-2.0);
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = in.m_57.z;
    float _682 = _640 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = _672 * 0.15915493667125701904296875;
    float _688 = _652 * _342;
    float _690 = fma(_674, _548, _548);
    float _692 = -_492;
    float _694 = _692 + 1.0;
    float _696 = fma(_448, _674, _448);
    float _698 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _690);
    float _700 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _706 = fma(_696, _588, _698);
    float _708 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _712 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = _640 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _724 = _712 * _668;
    float _726 = _670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _710 * _666;
    float _730 = _708 * _664;
    float _732 = _686 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _742 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _746 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].x, _722);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _750 = _686 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = _742 * _740;
    float _756 = _738 * _744;
    float _758 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _760 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _762 = _678 != 0.0;
    bool _764 = isnan(_678);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _746);
    float _774 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _776 = _714 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _684 * _734;
    float _782 = _718 * _734;
    float _784 = _760 * _748;
    bool _786 = _676 == 0.0;
    bool _788 = !_770;
    bool _790 = _786 && _788;
    float _792 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _794 = _714 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _718 * _752;
    float _800 = _684 * _752;
    bool _802 = _680 == 0.0;
    bool _804 = _802 && _790;
    float _806 = _684 * _778;
    float _808 = _718 * _778;
    float _810 = _752 * _778;
    float _812 = _734 * _778;
    float _814 = _808 * _756;
    float _816 = fma(_796, _798, _780);
    float _818 = -_756;
    float _820 = _796 * _818;
    float _822 = fma(_796, _780, _798);
    float _824 = -_800;
    float _826 = fma(_796, _782, _824);
    float _828 = fma(_816, _754, _814);
    float _830 = -_782;
    float _832 = fma(_796, _800, _830);
    float _834 = _806 * _756;
    float _836 = fma(_810, _754, _820);
    float _838 = fma(_826, _784, _828);
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = fma(_832, _754, _834);
    float _848 = fma(_812, _784, _836);
    float _850 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = fma(_822, _784, _846);
    float _856 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].w, _774);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _868 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].w, _772);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _860);
    float _872 = _864 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _874 = _866 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _876 = _868 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _882 = _872 + _874;
    float _884 = _876 + _878;
    float _886 = -_796;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _880);
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _892 = _840;
    float _894 = _842;
    float _896 = _844;
    float _898 = _832;
    float _900 = _882;
    float _902 = _884;
    if (!_804)
    {
        float _904 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _904;
    }
    float _906 = _892;
    if (!_804)
    {
        float _908 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _908;
    }
    float _910 = _894;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _882 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _884 + _916;
    float _920 = _910;
    if (!_804)
    {
        float _922 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _844);
        _896 = _922;
    }
    float _924 = _896;
    float _926 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].w, _792);
    float _928 = _914 * _914;
    float _930 = _918 * _918;
    float _932 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _934 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _936 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _938 = _928 + _930;
    float _940 = -_796;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _932);
    float _944 = -_796;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].x, _934);
    float _948 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _950 = sqrt(_938);
    float _952 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _954 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _956 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _958 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _960 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _962 = _926 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _966 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _956);
    float _968 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _958);
    float _970 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _960);
    float _972 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _976 = _962 + _964;
    float _978 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    bool _982 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _974);
    float _986 = _952 * _910;
    float _988 = _936 * _910;
    float _990 = _954 * _910;
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _966);
    float _994 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _968);
    float _996 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _970);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _1000 = _954;
    if (!_982)
    {
        _898 = _930;
    }
    float _1002 = _898;
    float _1004 = _1002;
    if (!_982)
    {
        _920 = _928;
    }
    float _1006 = _920;
    float _1008 = _1006;
    if (!_982)
    {
        _1000 = _976;
    }
    float _1010 = _1000;
    bool _1012 = !_982;
    float _1014 = _1010;
    if (!_1012)
    {
        float _1016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1020 = _950 + _1018;
        float _1022 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = rsqrt(_938);
        float _1026 = _1020 * _1016;
        float _1028 = _1026 * 0.15915493667125701904296875;
        float _1030 = _1028 * 6.283185482025146484375;
        float _1032 = sin(_1030);
        float _1034 = _1028 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = fma(_1032, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1040 = _1024 * _1038;
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_914, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1046 = fma(_918, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1048 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1052 = _1044 + _1050;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1056 = _1046 + _1054;
        float _1058 = fma(_976, _1036, _1048);
        float _1060 = _1052 * _1052;
        float _1062 = _1056 * _1056;
        _1014 = _1058;
        _1008 = _1060;
        _1004 = _1062;
        _900 = _1044;
        _902 = _1046;
    }
    float _1064 = _1014;
    float _1066 = _1008;
    float _1068 = _1004;
    float _1070 = _900;
    float _1072 = _902;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1076 = _1064 + _1074;
    float _1078 = fma(_994, _906, _988);
    float _1080 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _980);
    float _1082 = fma(_1076, _1076, _1066);
    float _1084 = fma(_996, _906, _990);
    float _1086 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _984);
    float _1088 = _1082 + _1068;
    float _1090 = fma(_992, _906, _986);
    float _1092 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = sqrt(_1088);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1102 = fma(_1080, _924, _1090);
    float _1104 = fma(_1086, _924, _1078);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = fma(_1092, _924, _1084);
    out.m_61.x = _1106;
    out.m_61.y = _1108;
    out.m_61.z = _1110;
    out.m_63.x = _1102;
    out.m_63.y = _1104;
    out.m_63.z = _1112;
    bool _1114 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1116 = isnan(_1098);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1122 = _1118 || _1120;
    float _1124 = _1084;
    float _1126 = _1112;
    float _1128 = _1064;
    float _1130 = _1110;
    if (!_1122)
    {
        _1124 = 1.0;
    }
    float _1132 = _1124;
    bool _1134 = !_1122;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1098);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1098 + _1148;
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1158 = _1156 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1160 = 1.0 / _1154;
            float _1162 = _1150 * _1160;
            float _1164 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1136 = _1164;
            _1166 = true;
        }
        else
        {
            bool _1168 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1098);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1098 + _1178;
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1182 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1190 = 1.0 / _1184;
                float _1192 = _1180 * _1190;
                float _1194 = fma(_1192, _1188, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1136 = _1194;
                _1166 = true;
            }
            else
            {
                _1136 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1166 = false;
    float _1196 = _1136;
    float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1200 = _1070 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1064 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1072 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = fma(_1200, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1222 = fma(_1204, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1208, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1228 = _1204;
    if (_1218)
    {
        _1226 = _1220;
    }
    float _1230 = _1226;
    float _1232 = _1230;
    if (_1218)
    {
        _1228 = _1222;
    }
    float _1234 = _1228;
    float _1236 = _1234;
    if (_1218)
    {
        _1126 = _1224;
    }
    float _1238 = _1126;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _962 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _872 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _876 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -_876;
        float _1270 = _1268 + _1224;
        float _1272 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1274 = _1272 * _1260;
        float _1276 = -_872;
        float _1278 = _1276 + _1220;
        float _1280 = _1266 * _1274;
        float _1282 = -_962;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1278, _1280, _872);
        float _1288 = fma(_1284, _1280, _962);
        float _1290 = fma(_1270, _1280, _876);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
        _1128 = _1280;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = _1128;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1294 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1296 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1306 * _1322;
    float _1326 = _1310 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1340;
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    float _1356 = _1354;
    if (_1336)
    {
        float _1358 = _1340 * _1354;
        _1344 = _1358;
    }
    float _1360 = _1344;
    if (_1336)
    {
        float _1362 = rsqrt(_1332);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (_1336)
    {
        float _1368 = _1360 * 0.15915493667125701904296875;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1374 = _1320;
    if (_1336)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = precise::max(0.0, _1372);
    float _1386 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1388 = _1310;
    float _1390 = _1384;
    if (_1336)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1388 = _1394;
    }
    float _1396 = _1388;
    float _1398 = -_1322;
    float _1400 = -_1384;
    float _1402 = fma(_1302, _1398, _1400);
    float _1404 = _1402;
    if (_1336)
    {
        float _1406 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1380;
    float _1412 = _1408;
    if (_1336)
    {
        float _1414 = fma(_1380, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1410 = _1414;
    }
    float _1416 = _1410;
    if (_1336)
    {
        float _1418 = _1364 * _1416;
        _1130 = _1418;
    }
    float _1420 = _1130;
    if (!_1336)
    {
        _1366 = _1326;
    }
    float _1422 = _1366;
    float _1424 = sqrt(_1318);
    float _1426 = _1422;
    if (_1336)
    {
        float _1428 = _1396 + (-1.0);
        _1390 = _1428;
    }
    float _1430 = _1390;
    float _1432 = _1430;
    if (_1336)
    {
        float _1434 = _1324 * _1420;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1336)
    {
        float _1438 = _1326 * _1420;
        _1426 = _1438;
    }
    float _1440 = _1426;
    if (_1336)
    {
        float _1442 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1442;
    }
    float _1444 = _1412;
    float _1446 = _1444;
    if (!_1336)
    {
        _1432 = _1328;
    }
    float _1448 = _1432;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1436 * _1436;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1402, _1396, _1444);
        _1404 = _1456;
    }
    float _1458 = _1404;
    if (!_1336)
    {
        _1446 = _1330;
    }
    float _1460 = _1446;
    float _1462 = _1460;
    if (_1336)
    {
        float _1464 = _1440 * _1440;
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = fma(_1458, _1458, _1454);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1466;
    float _1478 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = -_1474;
    float _1482 = _1480 + 1.0;
    float _1484 = rsqrt(_1476);
    float _1486 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1492 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1494 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = abs(_1482);
    float _1498 = log2(_1496);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1504 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1504);
    float _1512 = _1484 * _1436;
    float _1514 = _1484 * _1458;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1522 = -_1506;
    float _1524 = fma(_1522, _1316, 1.0);
    float _1526 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = _1484 * _1440;
    float _1534 = -_1520;
    float _1536 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1542 = log2(_1524);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1552 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1546, 0.5, 0.5);
    float _1560 = exp2(_1530);
    float _1562 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1552);
    float _1564 = _1514 + 1.0;
    float _1566 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1568 = fma(_1558, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1562);
    float _1572 = 1.0 / _1550;
    float _1574 = fma(_1558, _1568, -0.212114393711090087890625);
    float _1576 = _1542 * 0.693147182464599609375;
    float _1578 = fma(_1558, _1574, 1.570728778839111328125);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = sqrt(_1554);
    float _1584 = -_1514;
    float _1586 = fma(_1560, _1564, _1584);
    float _1588 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1570);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = _1588 * _1572;
    float _1596 = _1590 * _1572;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1582 * 0.636619746685028076171875;
    float3 _4181 = float3(_1598, _1600, _1580);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1598, _1600, _1580);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float _1617 = -_1578;
    float _1619 = fma(_1602, _1617, 1.0);
    float2 _4214 = float2(_1619, _1592);
    float3 _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1625 = _1623.x;
    float _1627 = _1623.y;
    float _1629 = _1623.z;
    float _1631 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1633 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1635 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1633);
    float _1637 = exp2(_1631);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1639 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1645 = _1643 + _1550;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1590;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1550;
    float _1647 = -_1637;
    float _1649 = _1647 + 1.0;
    float _1651 = _1645 * 0.5;
    out.m_67.w = _1641;
    float _1653 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1651;
    out.m_69.w = _1550;
    float _1655 = _1653 * _1604;
    float _1657 = -_1653;
    float _1659 = _1657 + 1.0;
    float _1661 = _1615 * _1655;
    float _1663 = _1615 * _1659;
    float _1665 = _1629 * _1655;
    float _1667 = fma(_1625, _1661, _1609);
    float _1669 = fma(_1627, _1661, _1611);
    float _1671 = fma(_1615, _1665, _1613);
    out.m_71.x = _1667;
    out.m_71.y = _1669;
    out.m_71.z = _1671;
    out.m_71.w = _1663;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1166 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1728 = as_type<float>(_106);
        out.gl_Position.z = _1728;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1798 = as_type<float>(_144);
        out.gl_Position.z = _1798;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = in.m_53.x;
    float _300 = in.m_53.y;
    float _302 = in.m_53.z;
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _316);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _344 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _346 = _300 + _302;
    float _348 = _302 + _298;
    float _350 = _302 + (-0.5);
    float _352 = _302 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = _300 + _298;
    float _360 = _298 + (-0.5);
    float _362 = floor(_352);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _300 * 2.0;
    float _370 = _346 + (-1.0);
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = 1.0 / _356;
    float _376 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _380 = _348 + (-1.0);
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _296 + _384;
    bool _388 = _362 > 0.0;
    float _390 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _392 = _362 >= 0.0;
    bool _394 = isnan(_362);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _404 = log2(_402);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _378);
    float _408 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _390);
    float _410 = _358 + (-1.0);
    float _412 = _386 * _374;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _382);
    float _416 = floor(_364);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _408);
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    bool _426 = !_324;
    int _428 = _426 ? 0 : 1;
    float _430 = _404 * _124;
    int _432 = _400 ? 0 : 1;
    float _434 = floor(_368);
    bool _436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _448 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _450 = ~_432;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    int _456 = _454;
    if (!_388)
    {
        int _458 = ~_432;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = exp2(_430);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    bool _470 = _416 > 0.0;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    bool _482 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_296);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _468;
    bool _496 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_296);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = float(_462);
    float _510 = -_464;
    float _512 = _510 + 1.0;
    bool _514 = _434 > 0.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    bool _520 = _434 >= 0.0;
    bool _522 = isnan(_434);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    float _534 = _444 ? _512 : 0.0;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    int _540 = abs(_428);
    float _542 = fma(_518, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = in.m_55.x;
    float _546 = in.m_55.y;
    float _548 = in.m_55.z;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_532, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = float(_540);
    float _564 = fma(_424, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _566 = _492 * _538;
    bool _568 = !_328;
    int _570 = _568 ? 0 : 1;
    float _572 = sqrt(_406);
    float _574 = _562 * _508;
    int _576 = _480 ? 0 : 1;
    float _578 = _542 * _566;
    float _580 = _560 * _566;
    float _582 = _574 * (-2.0);
    float _584 = _564 * _566;
    if (_558)
    {
        float _586 = _534 * _494;
        _126 = _586;
    }
    float _588 = _126;
    int _590 = ~_576;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    int _596 = abs(_570);
    int _598 = _594;
    if (!_470)
    {
        int _600 = ~_576;
        int _602 = _600 + 1;
        _598 = _602;
    }
    int _604 = _598;
    float _606 = fma(_420, _582, _420);
    bool _608 = !_332;
    int _610 = _608 ? 0 : 1;
    float _612 = float(_604);
    float _614 = fma(_582, _544, _544);
    float _616 = float(_596);
    float _618 = _572 * _344;
    int _620 = abs(_610);
    float _622 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _614);
    int _624 = _528 ? 0 : 1;
    float _626 = _616 * _612;
    float _628 = sqrt(_414);
    float _630 = fma(_606, _588, _622);
    int _632 = ~_624;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _626 * (-2.0);
    float _640 = _630 * 0.15915493667125701904296875;
    int _642 = _636;
    if (!_514)
    {
        int _644 = ~_624;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = fma(_446, _638, _446);
    float _652 = sqrt(_418);
    float _654 = float(_620);
    float _656 = fma(_638, _546, _546);
    float _658 = float(_648);
    float _660 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].y, _656);
    float _662 = _654 * _658;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    float _670 = _628 * _340;
    float _672 = fma(_650, _588, _660);
    float _674 = _662 * (-2.0);
    float _676 = in.m_57.x;
    float _678 = in.m_57.y;
    float _680 = in.m_57.z;
    float _682 = _640 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = _672 * 0.15915493667125701904296875;
    float _688 = _652 * _342;
    float _690 = fma(_674, _548, _548);
    float _692 = -_492;
    float _694 = _692 + 1.0;
    float _696 = fma(_448, _674, _448);
    float _698 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].z, _690);
    float _700 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[143].z, _584);
    float _706 = fma(_696, _588, _698);
    float _708 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _712 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = _640 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _724 = _712 * _668;
    float _726 = _670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _710 * _666;
    float _730 = _708 * _664;
    float _732 = _686 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _742 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _746 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].x, _722);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _750 = _686 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = _742 * _740;
    float _756 = _738 * _744;
    float _758 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _760 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _762 = _678 != 0.0;
    bool _764 = isnan(_678);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _746);
    float _774 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _776 = _714 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _684 * _734;
    float _782 = _718 * _734;
    float _784 = _760 * _748;
    bool _786 = _676 == 0.0;
    bool _788 = !_770;
    bool _790 = _786 && _788;
    float _792 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _794 = _714 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _718 * _752;
    float _800 = _684 * _752;
    bool _802 = _680 == 0.0;
    bool _804 = _802 && _790;
    float _806 = _684 * _778;
    float _808 = _718 * _778;
    float _810 = _752 * _778;
    float _812 = _734 * _778;
    float _814 = _808 * _756;
    float _816 = fma(_796, _798, _780);
    float _818 = -_756;
    float _820 = _796 * _818;
    float _822 = fma(_796, _780, _798);
    float _824 = -_800;
    float _826 = fma(_796, _782, _824);
    float _828 = fma(_816, _754, _814);
    float _830 = -_782;
    float _832 = fma(_796, _800, _830);
    float _834 = _806 * _756;
    float _836 = fma(_810, _754, _820);
    float _838 = fma(_826, _784, _828);
    float _840 = in.m_59.x;
    float _842 = in.m_59.y;
    float _844 = in.m_59.z;
    float _846 = fma(_832, _754, _834);
    float _848 = fma(_812, _784, _836);
    float _850 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = fma(_822, _784, _846);
    float _856 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _864 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].w, _774);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _868 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].w, _772);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _860);
    float _872 = _864 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _874 = _866 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _876 = _868 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _882 = _872 + _874;
    float _884 = _876 + _878;
    float _886 = -_796;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _880);
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _862);
    float _892 = _840;
    float _894 = _842;
    float _896 = _844;
    float _898 = _832;
    float _900 = _882;
    float _902 = _884;
    if (!_804)
    {
        float _904 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _904;
    }
    float _906 = _892;
    if (!_804)
    {
        float _908 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _908;
    }
    float _910 = _894;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _882 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _884 + _916;
    float _920 = _910;
    if (!_804)
    {
        float _922 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _844);
        _896 = _922;
    }
    float _924 = _896;
    float _926 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].w, _792);
    float _928 = _914 * _914;
    float _930 = _918 * _918;
    float _932 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _934 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _936 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _938 = _928 + _930;
    float _940 = -_796;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _932);
    float _944 = -_796;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].x, _934);
    float _948 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _950 = sqrt(_938);
    float _952 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _954 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _956 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _958 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _960 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _962 = _926 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _966 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _956);
    float _968 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _958);
    float _970 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _960);
    float _972 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _976 = _962 + _964;
    float _978 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _980 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    bool _982 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _974);
    float _986 = _952 * _910;
    float _988 = _936 * _910;
    float _990 = _954 * _910;
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _966);
    float _994 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _968);
    float _996 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _970);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _1000 = _954;
    if (!_982)
    {
        _898 = _930;
    }
    float _1002 = _898;
    float _1004 = _1002;
    if (!_982)
    {
        _920 = _928;
    }
    float _1006 = _920;
    float _1008 = _1006;
    if (!_982)
    {
        _1000 = _976;
    }
    float _1010 = _1000;
    bool _1012 = !_982;
    float _1014 = _1010;
    if (!_1012)
    {
        float _1016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1020 = _950 + _1018;
        float _1022 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = rsqrt(_938);
        float _1026 = _1020 * _1016;
        float _1028 = _1026 * 0.15915493667125701904296875;
        float _1030 = _1028 * 6.283185482025146484375;
        float _1032 = sin(_1030);
        float _1034 = _1028 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = fma(_1032, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1040 = _1024 * _1038;
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_914, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1046 = fma(_918, _1040, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1048 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1052 = _1044 + _1050;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1056 = _1046 + _1054;
        float _1058 = fma(_976, _1036, _1048);
        float _1060 = _1052 * _1052;
        float _1062 = _1056 * _1056;
        _1014 = _1058;
        _1008 = _1060;
        _1004 = _1062;
        _900 = _1044;
        _902 = _1046;
    }
    float _1064 = _1014;
    float _1066 = _1008;
    float _1068 = _1004;
    float _1070 = _900;
    float _1072 = _902;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1076 = _1064 + _1074;
    float _1078 = fma(_994, _906, _988);
    float _1080 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _980);
    float _1082 = fma(_1076, _1076, _1066);
    float _1084 = fma(_996, _906, _990);
    float _1086 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _984);
    float _1088 = _1082 + _1068;
    float _1090 = fma(_992, _906, _986);
    float _1092 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _998);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1098 = sqrt(_1088);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1102 = fma(_1080, _924, _1090);
    float _1104 = fma(_1086, _924, _1078);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = fma(_1092, _924, _1084);
    out.m_61.x = _1106;
    out.m_61.y = _1108;
    out.m_61.z = _1110;
    out.m_63.x = _1102;
    out.m_63.y = _1104;
    out.m_63.z = _1112;
    bool _1114 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1116 = isnan(_1098);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1122 = _1118 || _1120;
    float _1124 = _1084;
    float _1126 = _1112;
    float _1128 = _1064;
    float _1130 = _1110;
    if (!_1122)
    {
        _1124 = 1.0;
    }
    float _1132 = _1124;
    bool _1134 = !_1122;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1098);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1098 + _1148;
            float _1152 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1154 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1152;
            float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1158 = _1156 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1160 = 1.0 / _1154;
            float _1162 = _1150 * _1160;
            float _1164 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1136 = _1164;
            _1166 = true;
        }
        else
        {
            bool _1168 = _1098 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1098);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1098 + _1178;
                float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1184 = _1182 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1188 = _1186 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1190 = 1.0 / _1184;
                float _1192 = _1180 * _1190;
                float _1194 = fma(_1192, _1188, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1136 = _1194;
                _1166 = true;
            }
            else
            {
                _1136 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1166 = false;
    float _1196 = _1136;
    float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1200 = _1070 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1064 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1072 + _1206;
    bool _1210 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.5);
    bool _1218 = _1214 || _1216;
    float _1220 = fma(_1200, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1222 = fma(_1204, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1208, _1196, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1228 = _1204;
    if (_1218)
    {
        _1226 = _1220;
    }
    float _1230 = _1226;
    float _1232 = _1230;
    if (_1218)
    {
        _1228 = _1222;
    }
    float _1234 = _1228;
    float _1236 = _1234;
    if (_1218)
    {
        _1126 = _1224;
    }
    float _1238 = _1126;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _962 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _872 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _876 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -_876;
        float _1270 = _1268 + _1224;
        float _1272 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1274 = _1272 * _1260;
        float _1276 = -_872;
        float _1278 = _1276 + _1220;
        float _1280 = _1266 * _1274;
        float _1282 = -_962;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1278, _1280, _872);
        float _1288 = fma(_1284, _1280, _962);
        float _1290 = fma(_1270, _1280, _876);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
        _1128 = _1280;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = _1128;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1306 = _1294 + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1296 + _1308;
    float _1312 = _1302 * _1302;
    float _1314 = fma(_1306, _1306, _1312);
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1318 = fma(_1310, _1310, _1314);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1306 * _1322;
    float _1326 = _1310 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1340;
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    float _1356 = _1354;
    if (_1336)
    {
        float _1358 = _1340 * _1354;
        _1344 = _1358;
    }
    float _1360 = _1344;
    if (_1336)
    {
        float _1362 = rsqrt(_1332);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = _1364;
    if (_1336)
    {
        float _1368 = _1360 * 0.15915493667125701904296875;
        _1346 = _1368;
    }
    float _1370 = _1346;
    float _1372 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1374 = _1320;
    if (_1336)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1374 = _1378;
    }
    float _1380 = _1374;
    float _1382 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = precise::max(0.0, _1372);
    float _1386 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1388 = _1310;
    float _1390 = _1384;
    if (_1336)
    {
        float _1392 = _1370 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        _1388 = _1394;
    }
    float _1396 = _1388;
    float _1398 = -_1322;
    float _1400 = -_1384;
    float _1402 = fma(_1302, _1398, _1400);
    float _1404 = _1402;
    if (_1336)
    {
        float _1406 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1348 = _1406;
    }
    float _1408 = _1348;
    float _1410 = _1380;
    float _1412 = _1408;
    if (_1336)
    {
        float _1414 = fma(_1380, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1410 = _1414;
    }
    float _1416 = _1410;
    if (_1336)
    {
        float _1418 = _1364 * _1416;
        _1130 = _1418;
    }
    float _1420 = _1130;
    if (!_1336)
    {
        _1366 = _1326;
    }
    float _1422 = _1366;
    float _1424 = sqrt(_1318);
    float _1426 = _1422;
    if (_1336)
    {
        float _1428 = _1396 + (-1.0);
        _1390 = _1428;
    }
    float _1430 = _1390;
    float _1432 = _1430;
    if (_1336)
    {
        float _1434 = _1324 * _1420;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1336)
    {
        float _1438 = _1326 * _1420;
        _1426 = _1438;
    }
    float _1440 = _1426;
    if (_1336)
    {
        float _1442 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1442;
    }
    float _1444 = _1412;
    float _1446 = _1444;
    if (!_1336)
    {
        _1432 = _1328;
    }
    float _1448 = _1432;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1436 * _1436;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1402, _1396, _1444);
        _1404 = _1456;
    }
    float _1458 = _1404;
    if (!_1336)
    {
        _1446 = _1330;
    }
    float _1460 = _1446;
    float _1462 = _1460;
    if (_1336)
    {
        float _1464 = _1440 * _1440;
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = fma(_1458, _1458, _1454);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1466;
    float _1478 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = -_1474;
    float _1482 = _1480 + 1.0;
    float _1484 = rsqrt(_1476);
    float _1486 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1492 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1494 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = abs(_1482);
    float _1498 = log2(_1496);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1504 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1508 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1504);
    float _1512 = _1484 * _1436;
    float _1514 = _1484 * _1458;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1522 = -_1506;
    float _1524 = fma(_1522, _1316, 1.0);
    float _1526 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1386);
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1530 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = _1484 * _1440;
    float _1534 = -_1520;
    float _1536 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1528);
    float _1542 = log2(_1524);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1540);
    float _1552 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1548);
    float _1558 = fma(_1546, 0.5, 0.5);
    float _1560 = exp2(_1530);
    float _1562 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1552);
    float _1564 = _1514 + 1.0;
    float _1566 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1568 = fma(_1558, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1562);
    float _1572 = 1.0 / _1550;
    float _1574 = fma(_1558, _1568, -0.212114393711090087890625);
    float _1576 = _1542 * 0.693147182464599609375;
    float _1578 = fma(_1558, _1574, 1.570728778839111328125);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = sqrt(_1554);
    float _1584 = -_1514;
    float _1586 = fma(_1560, _1564, _1584);
    float _1588 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1570);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = _1588 * _1572;
    float _1596 = _1590 * _1572;
    float _1598 = fma(_1594, 0.5, 0.5);
    float _1600 = fma(_1596, -0.5, 0.5);
    float _1602 = _1582 * 0.636619746685028076171875;
    float3 _4181 = float3(_1598, _1600, _1580);
    float _1604 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4181, float3(0.0), isnan(_4181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4181, float3(0.0), isnan(_4181)), level(0.0)).x;
    float3 _4192 = float3(_1598, _1600, _1580);
    float4 _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4192, float3(0.0), isnan(_4192)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4192, float3(0.0), isnan(_4192)), level(0.0)).xyzw;
    float _1609 = _1607.x;
    float _1611 = _1607.y;
    float _1613 = _1607.z;
    float _1615 = _1607.w;
    float _1617 = -_1578;
    float _1619 = fma(_1602, _1617, 1.0);
    float2 _4214 = float2(_1619, _1592);
    float3 _1623 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1625 = _1623.x;
    float _1627 = _1623.y;
    float _1629 = _1623.z;
    float _1631 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1633 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1635 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1633);
    float _1637 = exp2(_1631);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1639 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1641 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1643 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1645 = _1643 + _1550;
    out.gl_Position.x = _1588;
    out.gl_Position.y = _1590;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1550;
    float _1647 = -_1637;
    float _1649 = _1647 + 1.0;
    float _1651 = _1645 * 0.5;
    out.m_67.w = _1641;
    float _1653 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1651;
    out.m_69.w = _1550;
    float _1655 = _1653 * _1604;
    float _1657 = -_1653;
    float _1659 = _1657 + 1.0;
    float _1661 = _1615 * _1655;
    float _1663 = _1615 * _1659;
    float _1665 = _1629 * _1655;
    float _1667 = fma(_1625, _1661, _1609);
    float _1669 = fma(_1627, _1661, _1611);
    float _1671 = fma(_1615, _1665, _1613);
    out.m_71.x = _1667;
    out.m_71.y = _1669;
    out.m_71.z = _1671;
    out.m_71.w = _1663;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

