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
        float _1724 = as_type<float>(_106);
        out.gl_Position.z = _1724;
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
        float _1794 = as_type<float>(_144);
        out.gl_Position.z = _1794;
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
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _316);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _312);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _342 = _300 + _302;
    float _344 = _302 + _298;
    float _346 = _302 + (-0.5);
    float _348 = _302 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _350;
    float _354 = _300 + _298;
    float _356 = _298 + (-0.5);
    float _358 = floor(_348);
    float _360 = _298 * 2.0;
    float _362 = _300 + (-0.5);
    float _364 = _300 * 2.0;
    float _366 = _344 + (-1.0);
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _370 = 1.0 / _352;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _374 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _368);
    float _376 = _342 + (-1.0);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _372);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = _296 + _380;
    bool _384 = _358 > 0.0;
    float _386 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _388 = _358 >= 0.0;
    bool _390 = isnan(_358);
    bool _392 = _388 || _390;
    bool _394 = isnan(0.0);
    bool _396 = _392 || _394;
    float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _400 = log2(_398);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _374);
    float _404 = _354 + (-1.0);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _386);
    float _408 = _382 * _370;
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _412 = floor(_364);
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _378);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _406);
    bool _418 = !_324;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _428 = 1.0 + _426;
    float _430 = _400 * _124;
    float _432 = floor(_360);
    int _434 = _396 ? 0 : 1;
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    int _448 = ~_434;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = exp2(_430);
    int _456 = _452;
    if (!_384)
    {
        int _458 = ~_434;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _466 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_296);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_296);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _428;
    bool _492 = _412 > 0.0;
    bool _494 = _432 > 0.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    bool _500 = _432 >= 0.0;
    bool _502 = isnan(_432);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_454;
    float _512 = _510 + 1.0;
    float _514 = float(_462);
    float _516 = fma(_498, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _518 = _412 >= 0.0;
    bool _520 = isnan(_412);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = -_488;
    float _530 = _528 + 1.0;
    float _532 = _446 ? _512 : 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    int _538 = abs(_420);
    float _540 = _476 * _530;
    float _542 = in.m_55.x;
    float _544 = in.m_55.y;
    float _546 = in.m_55.z;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = fma(_536, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _560 = float(_538);
    float _562 = fma(_424, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _564 = !_332;
    int _566 = _564 ? 0 : 1;
    float _568 = _516 * _540;
    float _570 = _558 * _540;
    float _572 = _560 * _514;
    int _574 = _526 ? 0 : 1;
    float _576 = _562 * _540;
    int _578 = abs(_566);
    float _580 = _572 * (-2.0);
    float _582 = sqrt(_414);
    if (_556)
    {
        float _584 = _532 * _490;
        _126 = _584;
    }
    float _586 = _126;
    int _588 = ~_574;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _592;
    if (!_492)
    {
        int _596 = ~_574;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = fma(_410, _580, _410);
    float _604 = float(_578);
    float _606 = float(_600);
    float _608 = sqrt(_402);
    int _610 = _508 ? 0 : 1;
    float _612 = fma(_580, _542, _542);
    bool _614 = !_328;
    int _616 = _614 ? 0 : 1;
    float _618 = _604 * _606;
    int _620 = ~_610;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _612);
    int _628 = abs(_616);
    float _630 = _618 * (-2.0);
    int _632 = _624;
    if (!_494)
    {
        int _634 = ~_610;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = fma(_602, _586, _626);
    float _642 = fma(_630, _546, _546);
    float _644 = sqrt(_416);
    float _646 = float(_638);
    float _648 = fma(_436, _630, _436);
    float _650 = float(_628);
    float _652 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _654 = _608 * _340;
    float _656 = _640 * 0.15915493667125701904296875;
    float _658 = _650 * _646;
    float _660 = in.m_51.x;
    float _662 = in.m_51.y;
    float _664 = in.m_51.z;
    float _666 = fma(_648, _586, _652);
    float _668 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _670 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _672 = _658 * (-2.0);
    float _674 = in.m_57.x;
    float _676 = in.m_57.y;
    float _678 = in.m_57.z;
    float _680 = _582 * _668;
    float _682 = _644 * _670;
    float _684 = fma(_672, _544, _544);
    float _686 = -_476;
    float _688 = _686 + 1.0;
    float _690 = fma(_464, _672, _464);
    float _692 = _666 * 0.15915493667125701904296875;
    float _694 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _702 = fma(_690, _586, _694);
    float _704 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _706 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _698);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _700);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _656 * 6.283185482025146484375;
    float _714 = sin(_712);
    float _716 = _680 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = _704 * _660;
    float _720 = _680 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _708 * _664;
    float _724 = _706 * _662;
    float _726 = _680 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _728 = _656 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _678);
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _674);
    float _742 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    float _746 = _692 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _726);
    float _752 = _736 * _732;
    float _754 = _738 * _734;
    bool _756 = _676 != 0.0;
    bool _758 = isnan(_676);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
    float _768 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
    float _770 = _692 * 6.283185482025146484375;
    float _772 = cos(_770);
    bool _774 = _674 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    bool _780 = _678 == 0.0;
    bool _782 = _780 && _778;
    float _784 = _710 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _790 = _742 * _740;
    float _792 = _714 * _748;
    float _794 = _730 * _748;
    float _796 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[24].z, _788);
    float _798 = _710 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _730 * _772;
    float _804 = _714 * _786;
    float _806 = _714 * _772;
    float _808 = _786 * _748;
    float _810 = _786 * _772;
    float _812 = _730 * _786;
    float _814 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _816 = fma(_800, _792, _802);
    float _818 = -_794;
    float _820 = fma(_800, _806, _818);
    float _822 = fma(_800, _802, _792);
    float _824 = _804 * _752;
    float _826 = -_806;
    float _828 = fma(_800, _794, _826);
    float _830 = _816 * _752;
    float _832 = _820 * _752;
    float _834 = -_800;
    float _836 = fma(_834, _790, _824);
    float _838 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _840 = fma(_808, _790, _830);
    float _842 = fma(_810, _790, _832);
    float _844 = fma(_812, _754, _836);
    float _846 = in.m_59.x;
    float _848 = in.m_59.y;
    float _850 = in.m_59.z;
    float _852 = fma(_828, _754, _840);
    float _854 = fma(_822, _754, _842);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[24].w, _796);
    float _858 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _814);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _860);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[26].w, _766);
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _868);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _880 = _872 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _882 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _890 = _864 + _884;
    float _892 = _880 + _886;
    float _894 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = _846;
    float _898 = _848;
    float _900 = _850;
    float _902 = _804;
    float _904 = _812;
    float _906 = _890;
    float _908 = _892;
    float _910 = _880;
    if (!_782)
    {
        float _912 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _846);
        _896 = _912;
    }
    float _914 = _896;
    if (!_782)
    {
        float _916 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _848);
        _898 = _916;
    }
    float _918 = _898;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _890 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _892 + _924;
    if (!_782)
    {
        float _928 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _850);
        _900 = _928;
    }
    float _930 = _900;
    float _932 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[25].w, _768);
    float _934 = _922 * _922;
    float _936 = _926 * _926;
    float _938 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _858);
    float _944 = _934 + _936;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _948 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _950 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _952 = sqrt(_944);
    float _954 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _956 = -_800;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _946);
    float _960 = -_800;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _964 = -_800;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _968 = _828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _972 = _828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _976 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _970);
    float _980 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _984 = _932 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _986 = _974 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _950);
    bool _990 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _994 = _984 + _986;
    float _996 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _1000 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1002 = _968;
    if (!_990)
    {
        _902 = _936;
    }
    float _1004 = _902;
    float _1006 = _1004;
    if (!_990)
    {
        _904 = _934;
    }
    float _1008 = _904;
    float _1010 = _1008;
    if (!_990)
    {
        _1002 = _994;
    }
    float _1012 = _1002;
    bool _1014 = !_990;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _952 + _1020;
        float _1024 = _994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_944);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_922, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_926, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1054 = _1046 + _1052;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1058 = _1048 + _1056;
        float _1060 = fma(_994, _1038, _1050);
        float _1062 = _1054 * _1054;
        float _1064 = _1058 * _1058;
        _1016 = _1060;
        _1010 = _1062;
        _1006 = _1064;
        _906 = _1046;
        _908 = _1048;
    }
    float _1066 = _1016;
    float _1068 = _1010;
    float _1070 = _1006;
    float _1072 = _906;
    float _1074 = _908;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1078 = _1066 + _1076;
    float _1080 = _988 * _918;
    float _1082 = _982 * _918;
    float _1084 = _992 * _918;
    float _1086 = fma(_1078, _1078, _1068);
    float _1088 = fma(_962, _914, _1080);
    float _1090 = fma(_958, _914, _1082);
    float _1092 = _1086 + _1070;
    float _1094 = fma(_966, _914, _1084);
    float _1096 = sqrt(_1092);
    float _1098 = fma(_996, _930, _1090);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1106 = fma(_998, _930, _1088);
    float _1108 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_1000, _930, _1094);
    out.m_61.x = _1108;
    out.m_61.y = _1110;
    out.m_61.z = _1112;
    bool _1116 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1118 = isnan(_1096);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1124 = _1120 || _1122;
    out.m_63.x = _1098;
    out.m_63.y = _1106;
    out.m_63.z = _1114;
    float _1126 = _1102;
    float _1128 = _1114;
    float _1130 = _1112;
    if (!_1124)
    {
        _1126 = 1.0;
    }
    float _1132 = _1126;
    bool _1134 = !_1124;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1096);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1096 + _1148;
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
            bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1096);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1096 + _1178;
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
    float _1200 = _1072 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1066 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1074 + _1206;
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
        _1128 = _1224;
    }
    float _1238 = _1128;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _984 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _864 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _880 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1270 = _1268 * _1260;
        float _1272 = -_864;
        float _1274 = _1272 + _1220;
        float _1276 = -_880;
        float _1278 = _1276 + _1224;
        float _1280 = _1266 * _1270;
        float _1282 = -_984;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1274, _1280, _864);
        float _1288 = fma(_1284, _1280, _984);
        float _1290 = fma(_1278, _1280, _880);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1292 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1294 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1308 = _1296 + _1306;
    float _1310 = _1300 * _1300;
    float _1312 = fma(_1304, _1304, _1310);
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1316 = fma(_1308, _1308, _1312);
    float _1318 = rsqrt(_1316);
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1322 = _1304 * _1320;
    float _1324 = _1308 * _1320;
    float _1326 = _1322 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = _1332 + _1336;
    float _1340 = _1312;
    float _1342 = _1338;
    float _1344 = _1300;
    float _1346 = _1322;
    if (_1334)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1348;
    }
    float _1350 = _1340;
    float _1352 = _1350;
    if (_1334)
    {
        float _1354 = _1338 * _1350;
        _1342 = _1354;
    }
    float _1356 = _1342;
    if (_1334)
    {
        float _1358 = rsqrt(_1330);
        _1352 = _1358;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (_1334)
    {
        float _1364 = _1356 * 0.15915493667125701904296875;
        _910 = _1364;
    }
    float _1366 = _910;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = _1318;
    if (_1334)
    {
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = precise::max(0.0, _1368);
    float _1382 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1384 = _1308;
    float _1386 = _1380;
    if (_1334)
    {
        float _1388 = _1366 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1320;
    float _1396 = -_1380;
    float _1398 = fma(_1300, _1394, _1396);
    float _1400 = _1398;
    if (_1334)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1402;
    }
    float _1404 = _1344;
    float _1406 = _1376;
    float _1408 = _1404;
    if (_1334)
    {
        float _1410 = fma(_1376, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1410;
    }
    float _1412 = _1406;
    if (_1334)
    {
        float _1414 = _1360 * _1412;
        _1130 = _1414;
    }
    float _1416 = _1130;
    if (!_1334)
    {
        _1362 = _1324;
    }
    float _1418 = _1362;
    float _1420 = sqrt(_1316);
    float _1422 = _1418;
    if (_1334)
    {
        float _1424 = _1392 + (-1.0);
        _1386 = _1424;
    }
    float _1426 = _1386;
    float _1428 = _1426;
    if (_1334)
    {
        float _1430 = _1322 * _1416;
        _1346 = _1430;
    }
    float _1432 = _1346;
    if (_1334)
    {
        float _1434 = _1324 * _1416;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1334)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1438;
    }
    float _1440 = _1408;
    float _1442 = _1440;
    if (!_1334)
    {
        _1428 = _1326;
    }
    float _1444 = _1428;
    float _1446 = _1444;
    if (_1334)
    {
        float _1448 = _1432 * _1432;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1334)
    {
        float _1452 = fma(_1398, _1392, _1440);
        _1400 = _1452;
    }
    float _1454 = _1400;
    if (!_1334)
    {
        _1442 = _1328;
    }
    float _1456 = _1442;
    float _1458 = _1456;
    if (_1334)
    {
        float _1460 = _1436 * _1436;
        _1458 = _1460;
    }
    float _1462 = _1458;
    float _1464 = fma(_1454, _1454, _1450);
    float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1468 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1466);
    float _1470 = precise::clamp(_1468, 0.0, 1.0);
    float _1472 = _1464 + _1462;
    float _1474 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1476 = -_1470;
    float _1478 = _1476 + 1.0;
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1484 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1482);
    float _1488 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1490 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1500 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = _1480 * _1432;
    float _1510 = _1480 * _1454;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1518 = -_1502;
    float _1520 = fma(_1518, _1314, 1.0);
    float _1522 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1526 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1528 = _1480 * _1436;
    float _1530 = -_1516;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1538 = log2(_1520);
    float _1540 = -_1528;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1544 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1536);
    float _1548 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1550 = fma(_1542, -0.5, 0.5);
    float _1552 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1544);
    float _1554 = fma(_1542, 0.5, 0.5);
    float _1556 = exp2(_1526);
    float _1558 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1548);
    float _1560 = _1510 + 1.0;
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1552);
    float _1564 = fma(_1554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1558);
    float _1568 = 1.0 / _1546;
    float _1570 = fma(_1554, _1564, -0.212114393711090087890625);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = fma(_1554, _1570, 1.570728778839111328125);
    float _1576 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1550);
    float _1580 = -_1510;
    float _1582 = fma(_1556, _1560, _1580);
    float _1584 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1566);
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = _1584 * _1568;
    float _1592 = _1586 * _1568;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1578 * 0.636619746685028076171875;
    float3 _4174 = float3(_1594, _1596, _1576);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4174, float3(0.0), isnan(_4174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4174, float3(0.0), isnan(_4174)), level(0.0)).x;
    float3 _4185 = float3(_1594, _1596, _1576);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1574;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4207 = float2(_1615, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4207, float2(0.0), isnan(_4207)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4207, float2(0.0), isnan(_4207)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1631 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1633 = exp2(_1627);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1635 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1637 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1639 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1635);
    float _1641 = _1639 + _1546;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1546;
    float _1643 = -_1633;
    float _1645 = _1643 + 1.0;
    float _1647 = _1641 * 0.5;
    out.m_67.w = _1637;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1647;
    out.m_69.w = _1546;
    float _1651 = _1649 * _1600;
    float _1653 = -_1649;
    float _1655 = _1653 + 1.0;
    float _1657 = _1611 * _1651;
    float _1659 = _1611 * _1655;
    float _1661 = _1625 * _1651;
    float _1663 = fma(_1621, _1657, _1605);
    float _1665 = fma(_1623, _1657, _1607);
    float _1667 = fma(_1611, _1661, _1609);
    out.m_71.x = _1663;
    out.m_71.y = _1665;
    out.m_71.z = _1667;
    out.m_71.w = _1659;
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
        float _1724 = as_type<float>(_106);
        out.gl_Position.z = _1724;
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
        float _1794 = as_type<float>(_144);
        out.gl_Position.z = _1794;
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
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _316);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _312);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _342 = _300 + _302;
    float _344 = _302 + _298;
    float _346 = _302 + (-0.5);
    float _348 = _302 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _350;
    float _354 = _300 + _298;
    float _356 = _298 + (-0.5);
    float _358 = floor(_348);
    float _360 = _298 * 2.0;
    float _362 = _300 + (-0.5);
    float _364 = _300 * 2.0;
    float _366 = _344 + (-1.0);
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _370 = 1.0 / _352;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _374 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _368);
    float _376 = _342 + (-1.0);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _372);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = _296 + _380;
    bool _384 = _358 > 0.0;
    float _386 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _388 = _358 >= 0.0;
    bool _390 = isnan(_358);
    bool _392 = _388 || _390;
    bool _394 = isnan(0.0);
    bool _396 = _392 || _394;
    float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _400 = log2(_398);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _374);
    float _404 = _354 + (-1.0);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _386);
    float _408 = _382 * _370;
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _412 = floor(_364);
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _378);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _406);
    bool _418 = !_324;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _428 = 1.0 + _426;
    float _430 = _400 * _124;
    float _432 = floor(_360);
    int _434 = _396 ? 0 : 1;
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    int _448 = ~_434;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = exp2(_430);
    int _456 = _452;
    if (!_384)
    {
        int _458 = ~_434;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _466 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_296);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_296);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _428;
    bool _492 = _412 > 0.0;
    bool _494 = _432 > 0.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    bool _500 = _432 >= 0.0;
    bool _502 = isnan(_432);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_454;
    float _512 = _510 + 1.0;
    float _514 = float(_462);
    float _516 = fma(_498, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _518 = _412 >= 0.0;
    bool _520 = isnan(_412);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = -_488;
    float _530 = _528 + 1.0;
    float _532 = _446 ? _512 : 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    int _538 = abs(_420);
    float _540 = _476 * _530;
    float _542 = in.m_55.x;
    float _544 = in.m_55.y;
    float _546 = in.m_55.z;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = fma(_536, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _560 = float(_538);
    float _562 = fma(_424, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _564 = !_332;
    int _566 = _564 ? 0 : 1;
    float _568 = _516 * _540;
    float _570 = _558 * _540;
    float _572 = _560 * _514;
    int _574 = _526 ? 0 : 1;
    float _576 = _562 * _540;
    int _578 = abs(_566);
    float _580 = _572 * (-2.0);
    float _582 = sqrt(_414);
    if (_556)
    {
        float _584 = _532 * _490;
        _126 = _584;
    }
    float _586 = _126;
    int _588 = ~_574;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _592;
    if (!_492)
    {
        int _596 = ~_574;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = fma(_410, _580, _410);
    float _604 = float(_578);
    float _606 = float(_600);
    float _608 = sqrt(_402);
    int _610 = _508 ? 0 : 1;
    float _612 = fma(_580, _542, _542);
    bool _614 = !_328;
    int _616 = _614 ? 0 : 1;
    float _618 = _604 * _606;
    int _620 = ~_610;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _612);
    int _628 = abs(_616);
    float _630 = _618 * (-2.0);
    int _632 = _624;
    if (!_494)
    {
        int _634 = ~_610;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = fma(_602, _586, _626);
    float _642 = fma(_630, _546, _546);
    float _644 = sqrt(_416);
    float _646 = float(_638);
    float _648 = fma(_436, _630, _436);
    float _650 = float(_628);
    float _652 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _654 = _608 * _340;
    float _656 = _640 * 0.15915493667125701904296875;
    float _658 = _650 * _646;
    float _660 = in.m_51.x;
    float _662 = in.m_51.y;
    float _664 = in.m_51.z;
    float _666 = fma(_648, _586, _652);
    float _668 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _670 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _672 = _658 * (-2.0);
    float _674 = in.m_57.x;
    float _676 = in.m_57.y;
    float _678 = in.m_57.z;
    float _680 = _582 * _668;
    float _682 = _644 * _670;
    float _684 = fma(_672, _544, _544);
    float _686 = -_476;
    float _688 = _686 + 1.0;
    float _690 = fma(_464, _672, _464);
    float _692 = _666 * 0.15915493667125701904296875;
    float _694 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _702 = fma(_690, _586, _694);
    float _704 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _706 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _698);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _700);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _656 * 6.283185482025146484375;
    float _714 = sin(_712);
    float _716 = _680 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = _704 * _660;
    float _720 = _680 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _708 * _664;
    float _724 = _706 * _662;
    float _726 = _680 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _728 = _656 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _678);
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _674);
    float _742 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    float _746 = _692 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _726);
    float _752 = _736 * _732;
    float _754 = _738 * _734;
    bool _756 = _676 != 0.0;
    bool _758 = isnan(_676);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
    float _768 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
    float _770 = _692 * 6.283185482025146484375;
    float _772 = cos(_770);
    bool _774 = _674 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    bool _780 = _678 == 0.0;
    bool _782 = _780 && _778;
    float _784 = _710 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _790 = _742 * _740;
    float _792 = _714 * _748;
    float _794 = _730 * _748;
    float _796 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[24].z, _788);
    float _798 = _710 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _730 * _772;
    float _804 = _714 * _786;
    float _806 = _714 * _772;
    float _808 = _786 * _748;
    float _810 = _786 * _772;
    float _812 = _730 * _786;
    float _814 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _816 = fma(_800, _792, _802);
    float _818 = -_794;
    float _820 = fma(_800, _806, _818);
    float _822 = fma(_800, _802, _792);
    float _824 = _804 * _752;
    float _826 = -_806;
    float _828 = fma(_800, _794, _826);
    float _830 = _816 * _752;
    float _832 = _820 * _752;
    float _834 = -_800;
    float _836 = fma(_834, _790, _824);
    float _838 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _840 = fma(_808, _790, _830);
    float _842 = fma(_810, _790, _832);
    float _844 = fma(_812, _754, _836);
    float _846 = in.m_59.x;
    float _848 = in.m_59.y;
    float _850 = in.m_59.z;
    float _852 = fma(_828, _754, _840);
    float _854 = fma(_822, _754, _842);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[24].w, _796);
    float _858 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _814);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _860);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[26].w, _766);
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _868);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _880 = _872 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _882 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _890 = _864 + _884;
    float _892 = _880 + _886;
    float _894 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = _846;
    float _898 = _848;
    float _900 = _850;
    float _902 = _804;
    float _904 = _812;
    float _906 = _890;
    float _908 = _892;
    float _910 = _880;
    if (!_782)
    {
        float _912 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _846);
        _896 = _912;
    }
    float _914 = _896;
    if (!_782)
    {
        float _916 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _848);
        _898 = _916;
    }
    float _918 = _898;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _890 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _892 + _924;
    if (!_782)
    {
        float _928 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _850);
        _900 = _928;
    }
    float _930 = _900;
    float _932 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[25].w, _768);
    float _934 = _922 * _922;
    float _936 = _926 * _926;
    float _938 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _858);
    float _944 = _934 + _936;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _948 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _950 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _952 = sqrt(_944);
    float _954 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _956 = -_800;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _946);
    float _960 = -_800;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _964 = -_800;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _968 = _828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _972 = _828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _976 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _970);
    float _980 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _984 = _932 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _986 = _974 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _950);
    bool _990 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _994 = _984 + _986;
    float _996 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _1000 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1002 = _968;
    if (!_990)
    {
        _902 = _936;
    }
    float _1004 = _902;
    float _1006 = _1004;
    if (!_990)
    {
        _904 = _934;
    }
    float _1008 = _904;
    float _1010 = _1008;
    if (!_990)
    {
        _1002 = _994;
    }
    float _1012 = _1002;
    bool _1014 = !_990;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _952 + _1020;
        float _1024 = _994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_944);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_922, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_926, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1054 = _1046 + _1052;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1058 = _1048 + _1056;
        float _1060 = fma(_994, _1038, _1050);
        float _1062 = _1054 * _1054;
        float _1064 = _1058 * _1058;
        _1016 = _1060;
        _1010 = _1062;
        _1006 = _1064;
        _906 = _1046;
        _908 = _1048;
    }
    float _1066 = _1016;
    float _1068 = _1010;
    float _1070 = _1006;
    float _1072 = _906;
    float _1074 = _908;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1078 = _1066 + _1076;
    float _1080 = _988 * _918;
    float _1082 = _982 * _918;
    float _1084 = _992 * _918;
    float _1086 = fma(_1078, _1078, _1068);
    float _1088 = fma(_962, _914, _1080);
    float _1090 = fma(_958, _914, _1082);
    float _1092 = _1086 + _1070;
    float _1094 = fma(_966, _914, _1084);
    float _1096 = sqrt(_1092);
    float _1098 = fma(_996, _930, _1090);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1106 = fma(_998, _930, _1088);
    float _1108 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_1000, _930, _1094);
    out.m_61.x = _1108;
    out.m_61.y = _1110;
    out.m_61.z = _1112;
    bool _1116 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1118 = isnan(_1096);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1124 = _1120 || _1122;
    out.m_63.x = _1098;
    out.m_63.y = _1106;
    out.m_63.z = _1114;
    float _1126 = _1102;
    float _1128 = _1114;
    float _1130 = _1112;
    if (!_1124)
    {
        _1126 = 1.0;
    }
    float _1132 = _1126;
    bool _1134 = !_1124;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1096);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1096 + _1148;
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
            bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1096);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1096 + _1178;
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
    float _1200 = _1072 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1066 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1074 + _1206;
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
        _1128 = _1224;
    }
    float _1238 = _1128;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _984 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _864 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _880 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1270 = _1268 * _1260;
        float _1272 = -_864;
        float _1274 = _1272 + _1220;
        float _1276 = -_880;
        float _1278 = _1276 + _1224;
        float _1280 = _1266 * _1270;
        float _1282 = -_984;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1274, _1280, _864);
        float _1288 = fma(_1284, _1280, _984);
        float _1290 = fma(_1278, _1280, _880);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1292 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1294 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1308 = _1296 + _1306;
    float _1310 = _1300 * _1300;
    float _1312 = fma(_1304, _1304, _1310);
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1316 = fma(_1308, _1308, _1312);
    float _1318 = rsqrt(_1316);
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1322 = _1304 * _1320;
    float _1324 = _1308 * _1320;
    float _1326 = _1322 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = _1332 + _1336;
    float _1340 = _1312;
    float _1342 = _1338;
    float _1344 = _1300;
    float _1346 = _1322;
    if (_1334)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1348;
    }
    float _1350 = _1340;
    float _1352 = _1350;
    if (_1334)
    {
        float _1354 = _1338 * _1350;
        _1342 = _1354;
    }
    float _1356 = _1342;
    if (_1334)
    {
        float _1358 = rsqrt(_1330);
        _1352 = _1358;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (_1334)
    {
        float _1364 = _1356 * 0.15915493667125701904296875;
        _910 = _1364;
    }
    float _1366 = _910;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = _1318;
    if (_1334)
    {
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = precise::max(0.0, _1368);
    float _1382 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1384 = _1308;
    float _1386 = _1380;
    if (_1334)
    {
        float _1388 = _1366 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1320;
    float _1396 = -_1380;
    float _1398 = fma(_1300, _1394, _1396);
    float _1400 = _1398;
    if (_1334)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1402;
    }
    float _1404 = _1344;
    float _1406 = _1376;
    float _1408 = _1404;
    if (_1334)
    {
        float _1410 = fma(_1376, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1410;
    }
    float _1412 = _1406;
    if (_1334)
    {
        float _1414 = _1360 * _1412;
        _1130 = _1414;
    }
    float _1416 = _1130;
    if (!_1334)
    {
        _1362 = _1324;
    }
    float _1418 = _1362;
    float _1420 = sqrt(_1316);
    float _1422 = _1418;
    if (_1334)
    {
        float _1424 = _1392 + (-1.0);
        _1386 = _1424;
    }
    float _1426 = _1386;
    float _1428 = _1426;
    if (_1334)
    {
        float _1430 = _1322 * _1416;
        _1346 = _1430;
    }
    float _1432 = _1346;
    if (_1334)
    {
        float _1434 = _1324 * _1416;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1334)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1438;
    }
    float _1440 = _1408;
    float _1442 = _1440;
    if (!_1334)
    {
        _1428 = _1326;
    }
    float _1444 = _1428;
    float _1446 = _1444;
    if (_1334)
    {
        float _1448 = _1432 * _1432;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1334)
    {
        float _1452 = fma(_1398, _1392, _1440);
        _1400 = _1452;
    }
    float _1454 = _1400;
    if (!_1334)
    {
        _1442 = _1328;
    }
    float _1456 = _1442;
    float _1458 = _1456;
    if (_1334)
    {
        float _1460 = _1436 * _1436;
        _1458 = _1460;
    }
    float _1462 = _1458;
    float _1464 = fma(_1454, _1454, _1450);
    float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1468 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1466);
    float _1470 = precise::clamp(_1468, 0.0, 1.0);
    float _1472 = _1464 + _1462;
    float _1474 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1476 = -_1470;
    float _1478 = _1476 + 1.0;
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1484 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1482);
    float _1488 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1490 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1500 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = _1480 * _1432;
    float _1510 = _1480 * _1454;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1518 = -_1502;
    float _1520 = fma(_1518, _1314, 1.0);
    float _1522 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1526 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1528 = _1480 * _1436;
    float _1530 = -_1516;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1538 = log2(_1520);
    float _1540 = -_1528;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1544 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1536);
    float _1548 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1550 = fma(_1542, -0.5, 0.5);
    float _1552 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1544);
    float _1554 = fma(_1542, 0.5, 0.5);
    float _1556 = exp2(_1526);
    float _1558 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1548);
    float _1560 = _1510 + 1.0;
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1552);
    float _1564 = fma(_1554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1558);
    float _1568 = 1.0 / _1546;
    float _1570 = fma(_1554, _1564, -0.212114393711090087890625);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = fma(_1554, _1570, 1.570728778839111328125);
    float _1576 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1550);
    float _1580 = -_1510;
    float _1582 = fma(_1556, _1560, _1580);
    float _1584 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1566);
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = _1584 * _1568;
    float _1592 = _1586 * _1568;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1578 * 0.636619746685028076171875;
    float3 _4174 = float3(_1594, _1596, _1576);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4174, float3(0.0), isnan(_4174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4174, float3(0.0), isnan(_4174)), level(0.0)).x;
    float3 _4185 = float3(_1594, _1596, _1576);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1574;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4207 = float2(_1615, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4207, float2(0.0), isnan(_4207)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4207, float2(0.0), isnan(_4207)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1631 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1633 = exp2(_1627);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1635 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1637 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1639 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1635);
    float _1641 = _1639 + _1546;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1546;
    float _1643 = -_1633;
    float _1645 = _1643 + 1.0;
    float _1647 = _1641 * 0.5;
    out.m_67.w = _1637;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1647;
    out.m_69.w = _1546;
    float _1651 = _1649 * _1600;
    float _1653 = -_1649;
    float _1655 = _1653 + 1.0;
    float _1657 = _1611 * _1651;
    float _1659 = _1611 * _1655;
    float _1661 = _1625 * _1651;
    float _1663 = fma(_1621, _1657, _1605);
    float _1665 = fma(_1623, _1657, _1607);
    float _1667 = fma(_1611, _1661, _1609);
    out.m_71.x = _1663;
    out.m_71.y = _1665;
    out.m_71.z = _1667;
    out.m_71.w = _1659;
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
        float _1724 = as_type<float>(_106);
        out.gl_Position.z = _1724;
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
        float _1794 = as_type<float>(_144);
        out.gl_Position.z = _1794;
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
    float _304 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _306 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _308 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = _264 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _312 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].z, _304);
    float _314 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].x, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    float _318 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[14].w, _310);
    float _320 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].x, _314);
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].y, _316);
    float _336 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].z, _312);
    float _338 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[16].w, _318);
    float _340 = _320 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _342 = _300 + _302;
    float _344 = _302 + _298;
    float _346 = _302 + (-0.5);
    float _348 = _302 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _350;
    float _354 = _300 + _298;
    float _356 = _298 + (-0.5);
    float _358 = floor(_348);
    float _360 = _298 * 2.0;
    float _362 = _300 + (-0.5);
    float _364 = _300 * 2.0;
    float _366 = _344 + (-1.0);
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _370 = 1.0 / _352;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _374 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _368);
    float _376 = _342 + (-1.0);
    float _378 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _372);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = _296 + _380;
    bool _384 = _358 > 0.0;
    float _386 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _388 = _358 >= 0.0;
    bool _390 = isnan(_358);
    bool _392 = _388 || _390;
    bool _394 = isnan(0.0);
    bool _396 = _392 || _394;
    float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _400 = log2(_398);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _374);
    float _404 = _354 + (-1.0);
    float _406 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _386);
    float _408 = _382 * _370;
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _412 = floor(_364);
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _378);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _406);
    bool _418 = !_324;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _428 = 1.0 + _426;
    float _430 = _400 * _124;
    float _432 = floor(_360);
    int _434 = _396 ? 0 : 1;
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    int _448 = ~_434;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = exp2(_430);
    int _456 = _452;
    if (!_384)
    {
        int _458 = ~_434;
        int _460 = _458 + 1;
        _456 = _460;
    }
    int _462 = _456;
    float _464 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _466 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_296);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_296);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _428;
    bool _492 = _412 > 0.0;
    bool _494 = _432 > 0.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    bool _500 = _432 >= 0.0;
    bool _502 = isnan(_432);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_454;
    float _512 = _510 + 1.0;
    float _514 = float(_462);
    float _516 = fma(_498, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _518 = _412 >= 0.0;
    bool _520 = isnan(_412);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = -_488;
    float _530 = _528 + 1.0;
    float _532 = _446 ? _512 : 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    int _538 = abs(_420);
    float _540 = _476 * _530;
    float _542 = in.m_55.x;
    float _544 = in.m_55.y;
    float _546 = in.m_55.z;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = fma(_536, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _560 = float(_538);
    float _562 = fma(_424, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _564 = !_332;
    int _566 = _564 ? 0 : 1;
    float _568 = _516 * _540;
    float _570 = _558 * _540;
    float _572 = _560 * _514;
    int _574 = _526 ? 0 : 1;
    float _576 = _562 * _540;
    int _578 = abs(_566);
    float _580 = _572 * (-2.0);
    float _582 = sqrt(_414);
    if (_556)
    {
        float _584 = _532 * _490;
        _126 = _584;
    }
    float _586 = _126;
    int _588 = ~_574;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _592;
    if (!_492)
    {
        int _596 = ~_574;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = fma(_410, _580, _410);
    float _604 = float(_578);
    float _606 = float(_600);
    float _608 = sqrt(_402);
    int _610 = _508 ? 0 : 1;
    float _612 = fma(_580, _542, _542);
    bool _614 = !_328;
    int _616 = _614 ? 0 : 1;
    float _618 = _604 * _606;
    int _620 = ~_610;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[196].x, _612);
    int _628 = abs(_616);
    float _630 = _618 * (-2.0);
    int _632 = _624;
    if (!_494)
    {
        int _634 = ~_610;
        int _636 = _634 + 1;
        _632 = _636;
    }
    int _638 = _632;
    float _640 = fma(_602, _586, _626);
    float _642 = fma(_630, _546, _546);
    float _644 = sqrt(_416);
    float _646 = float(_638);
    float _648 = fma(_436, _630, _436);
    float _650 = float(_628);
    float _652 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _654 = _608 * _340;
    float _656 = _640 * 0.15915493667125701904296875;
    float _658 = _650 * _646;
    float _660 = in.m_51.x;
    float _662 = in.m_51.y;
    float _664 = in.m_51.z;
    float _666 = fma(_648, _586, _652);
    float _668 = _334 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _670 = _336 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _672 = _658 * (-2.0);
    float _674 = in.m_57.x;
    float _676 = in.m_57.y;
    float _678 = in.m_57.z;
    float _680 = _582 * _668;
    float _682 = _644 * _670;
    float _684 = fma(_672, _544, _544);
    float _686 = -_476;
    float _688 = _686 + 1.0;
    float _690 = fma(_464, _672, _464);
    float _692 = _666 * 0.15915493667125701904296875;
    float _694 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _702 = fma(_690, _586, _694);
    float _704 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _706 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _698);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _700);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _656 * 6.283185482025146484375;
    float _714 = sin(_712);
    float _716 = _680 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = _704 * _660;
    float _720 = _680 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _722 = _708 * _664;
    float _724 = _706 * _662;
    float _726 = _680 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _728 = _656 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _676);
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _678);
    float _736 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _674);
    float _742 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    float _746 = _692 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _726);
    float _752 = _736 * _732;
    float _754 = _738 * _734;
    bool _756 = _676 != 0.0;
    bool _758 = isnan(_676);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
    float _768 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[25].z, _744);
    float _770 = _692 * 6.283185482025146484375;
    float _772 = cos(_770);
    bool _774 = _674 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    bool _780 = _678 == 0.0;
    bool _782 = _780 && _778;
    float _784 = _710 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _720);
    float _790 = _742 * _740;
    float _792 = _714 * _748;
    float _794 = _730 * _748;
    float _796 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[24].z, _788);
    float _798 = _710 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _730 * _772;
    float _804 = _714 * _786;
    float _806 = _714 * _772;
    float _808 = _786 * _748;
    float _810 = _786 * _772;
    float _812 = _730 * _786;
    float _814 = _808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _816 = fma(_800, _792, _802);
    float _818 = -_794;
    float _820 = fma(_800, _806, _818);
    float _822 = fma(_800, _802, _792);
    float _824 = _804 * _752;
    float _826 = -_806;
    float _828 = fma(_800, _794, _826);
    float _830 = _816 * _752;
    float _832 = _820 * _752;
    float _834 = -_800;
    float _836 = fma(_834, _790, _824);
    float _838 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _840 = fma(_808, _790, _830);
    float _842 = fma(_810, _790, _832);
    float _844 = fma(_812, _754, _836);
    float _846 = in.m_59.x;
    float _848 = in.m_59.y;
    float _850 = in.m_59.z;
    float _852 = fma(_828, _754, _840);
    float _854 = fma(_822, _754, _842);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[24].w, _796);
    float _858 = _808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _860 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _862 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _814);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _860);
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[26].w, _766);
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _868);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _880 = _872 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _882 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _888 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _890 = _864 + _884;
    float _892 = _880 + _886;
    float _894 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = _846;
    float _898 = _848;
    float _900 = _850;
    float _902 = _804;
    float _904 = _812;
    float _906 = _890;
    float _908 = _892;
    float _910 = _880;
    if (!_782)
    {
        float _912 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _846);
        _896 = _912;
    }
    float _914 = _896;
    if (!_782)
    {
        float _916 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[17].y, _848);
        _898 = _916;
    }
    float _918 = _898;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _890 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _892 + _924;
    if (!_782)
    {
        float _928 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _850);
        _900 = _928;
    }
    float _930 = _900;
    float _932 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[25].w, _768);
    float _934 = _922 * _922;
    float _936 = _926 * _926;
    float _938 = _808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _858);
    float _944 = _934 + _936;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _948 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _950 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _952 = sqrt(_944);
    float _954 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _956 = -_800;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[24].z, _946);
    float _960 = -_800;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _964 = -_800;
    float _966 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _968 = _828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _972 = _828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _976 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _970);
    float _980 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _984 = _932 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _986 = _974 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].z, _950);
    bool _990 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _994 = _984 + _986;
    float _996 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _998 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _1000 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1002 = _968;
    if (!_990)
    {
        _902 = _936;
    }
    float _1004 = _902;
    float _1006 = _1004;
    if (!_990)
    {
        _904 = _934;
    }
    float _1008 = _904;
    float _1010 = _1008;
    if (!_990)
    {
        _1002 = _994;
    }
    float _1012 = _1002;
    bool _1014 = !_990;
    float _1016 = _1012;
    if (!_1014)
    {
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1022 = _952 + _1020;
        float _1024 = _994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = rsqrt(_944);
        float _1028 = _1022 * _1018;
        float _1030 = _1028 * 0.15915493667125701904296875;
        float _1032 = _1030 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        float _1040 = fma(_1034, _1024, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1042 = _1026 * _1040;
        float _1044 = _1038 + (-1.0);
        float _1046 = fma(_922, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1048 = fma(_926, _1042, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1050 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1054 = _1046 + _1052;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1058 = _1048 + _1056;
        float _1060 = fma(_994, _1038, _1050);
        float _1062 = _1054 * _1054;
        float _1064 = _1058 * _1058;
        _1016 = _1060;
        _1010 = _1062;
        _1006 = _1064;
        _906 = _1046;
        _908 = _1048;
    }
    float _1066 = _1016;
    float _1068 = _1010;
    float _1070 = _1006;
    float _1072 = _906;
    float _1074 = _908;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1078 = _1066 + _1076;
    float _1080 = _988 * _918;
    float _1082 = _982 * _918;
    float _1084 = _992 * _918;
    float _1086 = fma(_1078, _1078, _1068);
    float _1088 = fma(_962, _914, _1080);
    float _1090 = fma(_958, _914, _1082);
    float _1092 = _1086 + _1070;
    float _1094 = fma(_966, _914, _1084);
    float _1096 = sqrt(_1092);
    float _1098 = fma(_996, _930, _1090);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1106 = fma(_998, _930, _1088);
    float _1108 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1114 = fma(_1000, _930, _1094);
    out.m_61.x = _1108;
    out.m_61.y = _1110;
    out.m_61.z = _1112;
    bool _1116 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1118 = isnan(_1096);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1124 = _1120 || _1122;
    out.m_63.x = _1098;
    out.m_63.y = _1106;
    out.m_63.z = _1114;
    float _1126 = _1102;
    float _1128 = _1114;
    float _1130 = _1112;
    if (!_1124)
    {
        _1126 = 1.0;
    }
    float _1132 = _1126;
    bool _1134 = !_1124;
    float _1136 = _1132;
    if (!_1134)
    {
        bool _1138 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1140 = isnan(_1096);
        bool _1142 = _1138 || _1140;
        bool _1144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1146 = _1142 || _1144;
        if (!_1146)
        {
            float _1148 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1150 = _1096 + _1148;
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
            bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1170 = isnan(_1096);
            bool _1172 = _1168 || _1170;
            bool _1174 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1176 = _1172 || _1174;
            if (!_1176)
            {
                float _1178 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1180 = _1096 + _1178;
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
    float _1200 = _1072 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1204 = _1066 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1208 = _1074 + _1206;
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
        _1128 = _1224;
    }
    float _1238 = _1128;
    float _1240 = _1238;
    if (!_1218)
    {
        float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1244 = _984 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1248 = _864 + _1246;
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1244 * _1244;
        float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1256 = _880 + _1254;
        float _1258 = fma(_1248, _1248, _1252);
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1262 = fma(_1256, _1256, _1258);
        float _1264 = sqrt(_1262);
        float _1266 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = precise::min(_1264, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1270 = _1268 * _1260;
        float _1272 = -_864;
        float _1274 = _1272 + _1220;
        float _1276 = -_880;
        float _1278 = _1276 + _1224;
        float _1280 = _1266 * _1270;
        float _1282 = -_984;
        float _1284 = _1282 + _1222;
        float _1286 = fma(_1274, _1280, _864);
        float _1288 = fma(_1284, _1280, _984);
        float _1290 = fma(_1278, _1280, _880);
        _1236 = _1288;
        _1232 = _1286;
        _1240 = _1290;
    }
    float _1292 = _1236;
    float _1294 = _1232;
    float _1296 = _1240;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1292 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1294 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1308 = _1296 + _1306;
    float _1310 = _1300 * _1300;
    float _1312 = fma(_1304, _1304, _1310);
    float _1314 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1316 = fma(_1308, _1308, _1312);
    float _1318 = rsqrt(_1316);
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1322 = _1304 * _1320;
    float _1324 = _1308 * _1320;
    float _1326 = _1322 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 + _1328;
    float _1332 = sqrt(_1330);
    bool _1334 = _1332 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = _1332 + _1336;
    float _1340 = _1312;
    float _1342 = _1338;
    float _1344 = _1300;
    float _1346 = _1322;
    if (_1334)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1348;
    }
    float _1350 = _1340;
    float _1352 = _1350;
    if (_1334)
    {
        float _1354 = _1338 * _1350;
        _1342 = _1354;
    }
    float _1356 = _1342;
    if (_1334)
    {
        float _1358 = rsqrt(_1330);
        _1352 = _1358;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (_1334)
    {
        float _1364 = _1356 * 0.15915493667125701904296875;
        _910 = _1364;
    }
    float _1366 = _910;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = _1318;
    if (_1334)
    {
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1380 = precise::max(0.0, _1368);
    float _1382 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1378);
    float _1384 = _1308;
    float _1386 = _1380;
    if (_1334)
    {
        float _1388 = _1366 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1320;
    float _1396 = -_1380;
    float _1398 = fma(_1300, _1394, _1396);
    float _1400 = _1398;
    if (_1334)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1402;
    }
    float _1404 = _1344;
    float _1406 = _1376;
    float _1408 = _1404;
    if (_1334)
    {
        float _1410 = fma(_1376, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1410;
    }
    float _1412 = _1406;
    if (_1334)
    {
        float _1414 = _1360 * _1412;
        _1130 = _1414;
    }
    float _1416 = _1130;
    if (!_1334)
    {
        _1362 = _1324;
    }
    float _1418 = _1362;
    float _1420 = sqrt(_1316);
    float _1422 = _1418;
    if (_1334)
    {
        float _1424 = _1392 + (-1.0);
        _1386 = _1424;
    }
    float _1426 = _1386;
    float _1428 = _1426;
    if (_1334)
    {
        float _1430 = _1322 * _1416;
        _1346 = _1430;
    }
    float _1432 = _1346;
    if (_1334)
    {
        float _1434 = _1324 * _1416;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1334)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1438;
    }
    float _1440 = _1408;
    float _1442 = _1440;
    if (!_1334)
    {
        _1428 = _1326;
    }
    float _1444 = _1428;
    float _1446 = _1444;
    if (_1334)
    {
        float _1448 = _1432 * _1432;
        _1446 = _1448;
    }
    float _1450 = _1446;
    if (_1334)
    {
        float _1452 = fma(_1398, _1392, _1440);
        _1400 = _1452;
    }
    float _1454 = _1400;
    if (!_1334)
    {
        _1442 = _1328;
    }
    float _1456 = _1442;
    float _1458 = _1456;
    if (_1334)
    {
        float _1460 = _1436 * _1436;
        _1458 = _1460;
    }
    float _1462 = _1458;
    float _1464 = fma(_1454, _1454, _1450);
    float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1468 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1466);
    float _1470 = precise::clamp(_1468, 0.0, 1.0);
    float _1472 = _1464 + _1462;
    float _1474 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1476 = -_1470;
    float _1478 = _1476 + 1.0;
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1484 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1486 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1482);
    float _1488 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1484);
    float _1490 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1500 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1490);
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = _1480 * _1432;
    float _1510 = _1480 * _1454;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1518 = -_1502;
    float _1520 = fma(_1518, _1314, 1.0);
    float _1522 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1382);
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1526 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1528 = _1480 * _1436;
    float _1530 = -_1516;
    float _1532 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1538 = log2(_1520);
    float _1540 = -_1528;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1544 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1536);
    float _1548 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1550 = fma(_1542, -0.5, 0.5);
    float _1552 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1544);
    float _1554 = fma(_1542, 0.5, 0.5);
    float _1556 = exp2(_1526);
    float _1558 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1548);
    float _1560 = _1510 + 1.0;
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1552);
    float _1564 = fma(_1554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1558);
    float _1568 = 1.0 / _1546;
    float _1570 = fma(_1554, _1564, -0.212114393711090087890625);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = fma(_1554, _1570, 1.570728778839111328125);
    float _1576 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1550);
    float _1580 = -_1510;
    float _1582 = fma(_1556, _1560, _1580);
    float _1584 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1566);
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = _1584 * _1568;
    float _1592 = _1586 * _1568;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1578 * 0.636619746685028076171875;
    float3 _4174 = float3(_1594, _1596, _1576);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4174, float3(0.0), isnan(_4174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4174, float3(0.0), isnan(_4174)), level(0.0)).x;
    float3 _4185 = float3(_1594, _1596, _1576);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1574;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4207 = float2(_1615, _1588);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4207, float2(0.0), isnan(_4207)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4207, float2(0.0), isnan(_4207)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1631 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1633 = exp2(_1627);
    out.m_65.x = _1294;
    out.m_65.y = _1292;
    out.m_65.z = _1296;
    float _1635 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1637 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1639 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1635);
    float _1641 = _1639 + _1546;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _1639;
    out.gl_Position.w = _1546;
    float _1643 = -_1633;
    float _1645 = _1643 + 1.0;
    float _1647 = _1641 * 0.5;
    out.m_67.w = _1637;
    float _1649 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1647;
    out.m_69.w = _1546;
    float _1651 = _1649 * _1600;
    float _1653 = -_1649;
    float _1655 = _1653 + 1.0;
    float _1657 = _1611 * _1651;
    float _1659 = _1611 * _1655;
    float _1661 = _1625 * _1651;
    float _1663 = fma(_1621, _1657, _1605);
    float _1665 = fma(_1623, _1657, _1607);
    float _1667 = fma(_1611, _1661, _1609);
    out.m_71.x = _1663;
    out.m_71.y = _1665;
    out.m_71.z = _1667;
    out.m_71.w = _1659;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

