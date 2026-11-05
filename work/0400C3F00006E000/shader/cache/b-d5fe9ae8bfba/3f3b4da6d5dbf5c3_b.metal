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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_108);
        out.gl_Position.z = _1645;
    }
    if (!_94)
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
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_144);
        out.gl_Position.z = _1714;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.z;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _154 = _152 != 0;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_154)
    {
        float _170 = in.m_49.x;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _146 * 2.0;
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _150 * 2.0;
    float _192 = floor(_182);
    float _194 = floor(_190);
    bool _196 = _192 > 0.0;
    bool _198 = _192 >= 0.0;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan(0.0);
    bool _206 = _202 || _204;
    float _208 = _206 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _210 = _194 > 0.0;
    bool _212 = _194 >= 0.0;
    bool _214 = isnan(_194);
    bool _216 = _212 || _214;
    bool _218 = isnan(0.0);
    bool _220 = _216 || _218;
    float _222 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _224 = ~as_type<int>(_208);
    int _226 = _224 + 1;
    int _228 = _226 + 1;
    int _230 = _220 ? 0 : 1;
    float _232 = fma(_222, -2.0, _166);
    int _234 = _228;
    float _236 = _208;
    int _238 = as_type<int>(_222);
    float _240 = as_type<float>(_230);
    float _242 = _188;
    if (!_196)
    {
        int _244 = ~as_type<int>(_208);
        int _246 = _244 + 1;
        _234 = _246;
    }
    int _248 = _234;
    int _250 = ~_230;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    if (!_164)
    {
        _236 = _148;
    }
    float _258 = _236;
    float _260 = _258;
    if (!_210)
    {
        int _262 = ~_230;
        int _264 = _262 + 1;
        _256 = _264;
    }
    int _266 = _256;
    bool _268 = !_164;
    float _270 = 0.0;
    float _272 = _172;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = _148 * _276;
        float _286 = 1.0 / _280;
        float _288 = _282 * 0.693147182464599609375;
        float _290 = exp2(_284);
        float _292 = 1.0 / _288;
        float _294 = _290 + (-1.0);
        float _296 = -_294;
        float _298 = fma(_296, _292, _148);
        float _300 = _298 * _286;
        float _302 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = as_type<int>(_288);
        _270 = _286;
        _240 = _290;
        _242 = _302;
    }
    int _304 = _238;
    float _306 = _270;
    float _308 = _240;
    float _310 = _242;
    bool _312 = !_164;
    int _314 = _304;
    float _316 = _308;
    float _318 = _306;
    if (!_312)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _148 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _314 = as_type<int>(_332);
        _260 = _338;
    }
    int _340 = _314;
    float _342 = _260;
    int _344 = _340;
    if (_154)
    {
        _316 = _150;
    }
    float _346 = _316;
    float _348 = _346;
    if (_154)
    {
        _344 = 0;
    }
    int _350 = _344;
    int _352 = _350;
    if (_154)
    {
        _318 = _172;
    }
    float _354 = _318;
    float _356 = _354;
    if (!_154)
    {
        float _358 = in.m_49.x;
        float _360 = _150 * 3.1415927410125732421875;
        float _362 = _360 * 0.15915493667125701904296875;
        float _364 = _362 * 6.283185482025146484375;
        float _366 = sin(_364);
        float _368 = _358 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        _352 = 2;
        _272 = _358;
        _356 = _374;
        _348 = _366;
    }
    int _376 = _352;
    float _378 = _272;
    float _380 = _356;
    float _382 = _348;
    bool _384 = _376 != 2;
    float _386 = _378 * 2.0;
    float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _390 = log2(_388);
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _380 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _408 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[93].z, _406);
    float _412 = floor(_386);
    float _414 = _150 + _378;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _414 + (-1.0);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _424 = -_416;
    float _426 = fma(_418, 2.0, _424);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _430 = !_394;
    int _432 = _430 ? 0 : 1;
    float _434 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[93].w, _422);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _442 = abs(_432);
    float _444 = -_436;
    float _446 = fma(_404, 2.0, _444);
    bool _448 = _412 > 0.0;
    float _450 = fma(_440, -2.0, _438);
    bool _452 = _412 >= 0.0;
    bool _454 = isnan(_412);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _390 * _126;
    float _464 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _450);
    float _466 = exp2(_462);
    float _468 = _420;
    float _470 = _440;
    if (_384)
    {
        _468 = _378;
    }
    float _472 = _468;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (_384)
    {
        _470 = _150;
    }
    float _478 = _470;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _482 = float(_248);
    float _484 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _410);
    float _486 = float(_442);
    float _488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _434);
    float _490 = _478;
    if (!_384)
    {
        _476 = _146;
    }
    float _492 = _476;
    float _494 = -_126;
    float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[91].x, _446);
    if (!_384)
    {
        _490 = _378;
    }
    float _498 = _490;
    float _500 = _486 * _482;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _504 = _460 ? 0 : 1;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = -_474;
    float _510 = fma(_502, 2.0, _508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _514 = 1.0 + _512;
    float _516 = fma(_506, -2.0, _480);
    int _518 = ~_504;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = in.m_51.x;
    float _526 = in.m_51.y;
    float _528 = in.m_51.z;
    float _530 = 1.0 / _514;
    int _532 = _522;
    if (!_448)
    {
        int _534 = ~_504;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _542 = -_466;
    float _544 = _542 + 1.0;
    float _546 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _540);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _562 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _574 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _546);
    float _576 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _578 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[88].z, _560);
    float _580 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _572);
    float _582 = _570 ? _544 : 0.0;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    bool _586 = !_402;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _580);
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _594 = -_126;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _426);
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[86].x, _510);
    float _602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _516);
    int _604 = abs(_588);
    if (_558)
    {
        float _606 = _582 * _530;
        _128 = _606;
    }
    float _608 = _128;
    float _610 = _500 * (-2.0);
    bool _612 = !_398;
    int _614 = _612 ? 0 : 1;
    float _616 = in.m_53.w;
    float _618 = float(_266);
    float _620 = _378 + _146;
    float _622 = float(_604);
    float _624 = _378 + (-0.5);
    float _626 = fma(_610, _524, _524);
    int _628 = abs(_614);
    float _630 = _620 + (-1.0);
    float _632 = fma(_428, _610, _428);
    float _634 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _626);
    float _636 = _622 * _618;
    float _638 = float(_628);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _642 = float(_538);
    float _644 = fma(_632, _608, _634);
    float _646 = _636 * (-2.0);
    float _648 = _150 + _146;
    float _650 = _638 * _642;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = _146 + (-0.5);
    float _660 = fma(_646, _528, _528);
    float _662 = _648 + (-1.0);
    float _664 = _650 * (-2.0);
    float _666 = fma(_640, _646, _640);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _676 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _678 = fma(_664, _526, _526);
    float _680 = _150 + (-0.5);
    float _682 = fma(_666, _608, _674);
    float _684 = fma(_676, _664, _676);
    float _686 = _644 * 0.15915493667125701904296875;
    float _688 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _686 * 6.283185482025146484375;
    float _694 = sin(_692);
    float _696 = fma(_684, _608, _688);
    float _698 = in.m_47.x;
    float _700 = in.m_47.y;
    float _702 = in.m_47.z;
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = in.m_42.x;
    float _708 = in.m_42.y;
    float _710 = in.m_42.z;
    float _712 = _686 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _718 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _726 = _690 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _734 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _722 * _720;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = _734 * _724;
    float _742 = _704 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _738 * _732;
    float _748 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _752 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _754 = fma(_342, _698, _748);
    float _756 = fma(_342, _700, _750);
    float _758 = _704 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_342, _702, _752);
    float _764 = _728 * _740;
    float _766 = fma(_756, _616, _708);
    float _768 = fma(_754, _616, _706);
    float _770 = fma(_762, _616, _710);
    float _772 = _714 * _764;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = _694 * _764;
    float _780 = _694 * _744;
    float _782 = _714 * _744;
    float _784 = _744 * _728;
    float _786 = _694 * _760;
    float _788 = _714 * _760;
    float _790 = _760 * _728;
    float _792 = fma(_776, _782, _786);
    float _794 = -_740;
    float _796 = _776 * _794;
    float _798 = -_780;
    float _800 = fma(_776, _788, _798);
    float _802 = -_788;
    float _804 = fma(_776, _780, _802);
    float _806 = fma(_792, _736, _772);
    float _808 = fma(_784, _736, _796);
    float _810 = _766 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = fma(_776, _786, _782);
    float _814 = fma(_800, _746, _806);
    float _816 = fma(_804, _736, _778);
    float _818 = fma(_790, _746, _808);
    float _820 = _766 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _826 = fma(_812, _746, _816);
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _830 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _824);
    float _836 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _766 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _848 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _850 = _838 + _842;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _854 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[5].x, _846);
    float _856 = _844 + _848;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _850 + _858;
    float _862 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _852);
    float _864 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _862);
    float _874 = _864 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = fma(_868, _868, _870);
    float _878 = _874 + _872;
    float _880 = sqrt(_876);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _844;
    float _886 = _850;
    float _888 = _856;
    float _890 = _768;
    float _892 = _772;
    if (!_882)
    {
        _884 = _850;
    }
    float _894 = _884;
    float _896 = _894;
    if (!_882)
    {
        _886 = _878;
    }
    float _898 = _886;
    bool _900 = !_882;
    float _902 = _898;
    if (!_900)
    {
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _908 = _880 + _906;
        float _910 = rsqrt(_876);
        float _912 = _908 * _904;
        float _914 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = _912 * 0.15915493667125701904296875;
        float _918 = _916 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        float _926 = _920 + (-1.0);
        float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = fma(_924, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _932 = fma(_878, _920, _928);
        float _934 = _910 * _930;
        float _936 = fma(_868, _934, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _938 = fma(_860, _934, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _902 = _932;
        _888 = _936;
        _896 = _938;
    }
    float _940 = _902;
    float _942 = _888;
    float _944 = _896;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _940 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _942 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _960 = _948 * _948;
    float _962 = fma(_952, _952, _960);
    float _964 = fma(_956, _956, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _952 * _970;
    float _974 = _956 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _956;
    float _992 = _960;
    float _994 = _988;
    float _996 = _948;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (_984)
    {
        float _1002 = rsqrt(_980);
        _992 = _1002;
    }
    float _1004 = _992;
    float _1006 = _1004;
    if (_984)
    {
        float _1008 = _988 * _1000;
        _994 = _1008;
    }
    float _1010 = _994;
    if (_984)
    {
        float _1012 = _1010 * 0.15915493667125701904296875;
        _890 = _1012;
    }
    float _1014 = _890;
    float _1016 = _966;
    if (_984)
    {
        float _1018 = _1014 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1026 = precise::max(0.0, _1024);
    float _1028 = _852;
    float _1030 = _1026;
    float _1032 = _1024;
    if (_984)
    {
        float _1034 = _1014 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1028 = _1036;
    }
    float _1038 = _1028;
    float _1040 = -_970;
    float _1042 = -_1026;
    float _1044 = fma(_948, _1040, _1042);
    if (!_984)
    {
        _996 = _974;
    }
    float _1046 = _996;
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1050;
    }
    float _1052 = _1030;
    float _1054 = _1022;
    float _1056 = _1052;
    if (_984)
    {
        float _1058 = fma(_1022, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_984)
    {
        _1056 = _1044;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    float _1068 = _1038;
    if (_984)
    {
        float _1070 = _1038 + (-1.0);
        _1032 = _1070;
    }
    float _1072 = _1032;
    float _1074 = _1072;
    if (_984)
    {
        float _1076 = _1004 * _1060;
        _892 = _1076;
    }
    float _1078 = _892;
    if (!_984)
    {
        _1062 = _972;
    }
    float _1080 = _1062;
    float _1082 = _1080;
    if (_984)
    {
        float _1084 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1006 = _1084;
    }
    float _1086 = _1006;
    if (_984)
    {
        float _1088 = _972 * _1078;
        _1082 = _1088;
    }
    float _1090 = _1082;
    if (!_984)
    {
        _1074 = _976;
    }
    float _1092 = _1074;
    float _1094 = _1092;
    if (_984)
    {
        float _1096 = _974 * _1078;
        _1048 = _1096;
    }
    float _1098 = _1048;
    if (_984)
    {
        float _1100 = fma(_1044, _1038, _1086);
        _1066 = _1100;
    }
    float _1102 = _1066;
    if (_984)
    {
        float _1104 = _1090 * _1090;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (!_984)
    {
        _1068 = _978;
    }
    float _1108 = _1068;
    float _1110 = _1108;
    if (_984)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = fma(_1102, _1102, _1106);
    float _1118 = _940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1116 + _1114;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = _940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1130 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1132 = rsqrt(_1120);
    float _1134 = -_1126;
    float _1136 = _1134 + 1.0;
    float _1138 = _940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1128);
    float _1142 = _940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1150 = abs(_1136);
    float _1152 = log2(_1150);
    float _1154 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1142);
    float _1156 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1154);
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1132 * _1090;
    float _1170 = _1132 * _1102;
    float _1172 = _1132 * _1098;
    float _1174 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1178 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1180 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1184);
    float _1188 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1178;
    float _1192 = fma(_1190, _958, 1.0);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1196 = -_1172;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1186);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1202 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = exp2(_1188);
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1200);
    float _1210 = fma(_1198, 0.5, 0.5);
    float _1212 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = _1170 + 1.0;
    float _1216 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1208);
    float _1218 = log2(_1192);
    float _1220 = fma(_1210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1210, _1220, -0.212114393711090087890625);
    float _1228 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = 1.0 / _1194;
    float _1232 = -_1170;
    float _1234 = fma(_1204, _1214, _1232);
    float _1236 = fma(_1210, _1226, 1.570728778839111328125);
    float _1238 = sqrt(_1206);
    float _1240 = _1218 * 0.693147182464599609375;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1230;
    float _1246 = _1228 * _1230;
    float _1248 = fma(_1244, 0.5, 0.5);
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1234, 0.5, 0.5);
    float _1254 = _1238 * 0.636619746685028076171875;
    float3 _3476 = float3(_1248, _1250, _1242);
    float _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3476, float3(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3476, float3(0.0), isnan(_3476)), level(0.0)).x;
    float _1258 = -_1236;
    float _1260 = fma(_1254, _1258, 1.0);
    float3 _3492 = float3(_1248, _1250, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3492, float3(0.0), isnan(_3492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3492, float3(0.0), isnan(_3492)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3509 = float2(_1260, _1252);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3509, float2(0.0), isnan(_3509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3509, float2(0.0), isnan(_3509)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = in.m_57.y;
    bool _1285 = _146 > 0.5;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1291 = _1289 != 0;
    float _1293 = in.m_49.w;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1303 = _1301 != 0;
    float _1305 = in.m_57.x;
    bool _1307 = _150 > 0.5;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1313 = _1311 != 0;
    float _1315 = _690;
    float _1317 = _1309;
    if (_1291)
    {
        float _1319 = in.m_49.z;
        _1315 = _1319;
    }
    float _1321 = _1315;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1327 = _778;
    if (_1297)
    {
        float _1329 = in.m_49.x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _1293 > 0.5;
    int _1339 = _1285 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1341 = _1337 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1343 = _1303 ? _1339 : as_type<int>(_1283);
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>(_1323);
    int _1353 = _1343;
    if (_1313)
    {
        float _1355 = -_1305;
        float _1357 = _1355 + 1.0;
        _1351 = as_type<int>(_1357);
    }
    int _1359 = _1351;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1325, as_type<float>(_1343), -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1369 = _1367 != 0;
    bool _1371 = _1363;
    bool _1373 = _1369;
    float _1375 = as_type<float>(_1359);
    if (_1291)
    {
        float _1377 = -_1305;
        float _1379 = _1377 + 1.0;
        _1353 = as_type<int>(_1379);
    }
    int _1381 = _1353;
    int _1383 = _1307 ? as_type<int>(_1335) : as_type<int>(_1283);
    float _1385 = -_602;
    float _1387 = fma(_574, _1365, _1385);
    float _1389 = _1349 ? as_type<float>(_1339) : _1283;
    float _1391 = _1363 ? as_type<float>(_1341) : _1283;
    float _1393 = _1369 ? as_type<float>(_1383) : _1283;
    float _1395 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1397 = _1389;
    if (_1291)
    {
        bool _1399 = _1321 > 0.5;
        _1371 = _1399;
    }
    bool _1401 = _1371;
    float _1403 = fma(_1345, _1389, -0.5);
    float _1405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1407 = fma(_1395, _1393, -0.5);
    int _1409 = as_type<int>(_1407);
    float _1411 = _1331;
    if (_1297)
    {
        bool _1413 = _1331 > 0.5;
        _1373 = _1413;
    }
    bool _1415 = _1373;
    float _1417 = -_464;
    float _1419 = fma(_488, _1403, _1417);
    if (!_1297)
    {
        _1317 = _1305;
    }
    float _1421 = _1317;
    float _1423 = -_408;
    float _1425 = fma(_590, _1407, _1423);
    float _1427 = _1421;
    if (_1297)
    {
        float _1429 = -_1305;
        float _1431 = _1429 + 1.0;
        _1409 = as_type<int>(_1431);
    }
    int _1433 = _1409;
    if (!_1291)
    {
        _1397 = _1305;
    }
    float _1435 = _1397;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1439 = _1435;
    if (_1291)
    {
        float _1441 = _1401 ? as_type<float>(_1381) : _1305;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1419 + 0.5;
    if (_1297)
    {
        float _1447 = _1415 ? as_type<float>(_1433) : _1305;
        _1427 = _1447;
    }
    float _1449 = _1427;
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1457 = fma(_1451, _1449, -0.5);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1463 = _1461 != 0;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = fma(_584, _1457, _596);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1313)
    {
        _1411 = _1305;
    }
    float _1477 = _1411;
    out.m_59.x = _1467;
    out.m_59.y = _1469;
    out.m_59.z = _1471;
    out.m_59.w = _1465;
    float _1479 = _1477;
    if (_1313)
    {
        float _1481 = _1307 ? as_type<float>(_1359) : _1305;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _1487 = 0;
    if (_1463)
    {
        float _1489 = -_1305;
        float _1491 = _1489 + 1.0;
        _1487 = as_type<int>(_1491);
    }
    int _1493 = _1487;
    if (!_1463)
    {
        _1375 = _1305;
    }
    float _1495 = _1375;
    float _1497 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1499 = _1495;
    if (_1463)
    {
        float _1501 = _1307 ? as_type<float>(_1493) : _1305;
        _1499 = _1501;
    }
    float _1503 = _1499;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1509 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1511 = fma(_1485, _1503, -0.5);
    float _1513 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1517 = fma(_484, _1511, _496);
    float _1519 = exp2(_1509);
    float _1521 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1523 = fma(_1513, _1483, -0.5);
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1527 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1529 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = fma(_592, _1523, _600);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1527);
    float _1543 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1537 + 0.5;
    float _1547 = _1387 + 0.5;
    float _1549 = -_1519;
    float _1551 = _1549 + 1.0;
    out.m_61.x = _1539;
    out.m_61.y = _1529;
    out.m_61.z = _1535;
    out.m_61.w = _1525;
    float _1553 = _1497 * _1505;
    float _1555 = _1473 + 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1545;
    out.m_63.y = _1547;
    float _1559 = _1517 + 0.5;
    float _1561 = _1543 * _1533;
    float _1563 = _1425 + 0.5;
    out.m_65.x = _1559;
    out.m_65.y = _1445;
    float _1565 = _1541 + _1194;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1561;
    out.m_67.w = _1553;
    float _1567 = _1565 * 0.5;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1541;
    out.gl_Position.w = _1194;
    out.m_69.z = _1567;
    out.m_69.w = _1194;
    out.m_45.x = _1569;
    float _1571 = _1557 * _1256;
    float _1573 = -_1557;
    float _1575 = _1573 + 1.0;
    float _1577 = _1271 * _1571;
    float _1579 = _1271 * _1575;
    float _1581 = _1281 * _1571;
    float _1583 = fma(_1277, _1577, _1265);
    float _1585 = fma(_1279, _1577, _1267);
    float _1587 = fma(_1271, _1581, _1269);
    out.m_71.x = _1583;
    out.m_71.y = _1585;
    out.m_71.z = _1587;
    out.m_71.w = _1579;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_108);
        out.gl_Position.z = _1645;
    }
    if (!_94)
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
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_144);
        out.gl_Position.z = _1714;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.z;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _154 = _152 != 0;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_154)
    {
        float _170 = in.m_49.x;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _146 * 2.0;
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _150 * 2.0;
    float _192 = floor(_182);
    float _194 = floor(_190);
    bool _196 = _192 > 0.0;
    bool _198 = _192 >= 0.0;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan(0.0);
    bool _206 = _202 || _204;
    float _208 = _206 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _210 = _194 > 0.0;
    bool _212 = _194 >= 0.0;
    bool _214 = isnan(_194);
    bool _216 = _212 || _214;
    bool _218 = isnan(0.0);
    bool _220 = _216 || _218;
    float _222 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _224 = ~as_type<int>(_208);
    int _226 = _224 + 1;
    int _228 = _226 + 1;
    int _230 = _220 ? 0 : 1;
    float _232 = fma(_222, -2.0, _166);
    int _234 = _228;
    float _236 = _208;
    int _238 = as_type<int>(_222);
    float _240 = as_type<float>(_230);
    float _242 = _188;
    if (!_196)
    {
        int _244 = ~as_type<int>(_208);
        int _246 = _244 + 1;
        _234 = _246;
    }
    int _248 = _234;
    int _250 = ~_230;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    if (!_164)
    {
        _236 = _148;
    }
    float _258 = _236;
    float _260 = _258;
    if (!_210)
    {
        int _262 = ~_230;
        int _264 = _262 + 1;
        _256 = _264;
    }
    int _266 = _256;
    bool _268 = !_164;
    float _270 = 0.0;
    float _272 = _172;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = _148 * _276;
        float _286 = 1.0 / _280;
        float _288 = _282 * 0.693147182464599609375;
        float _290 = exp2(_284);
        float _292 = 1.0 / _288;
        float _294 = _290 + (-1.0);
        float _296 = -_294;
        float _298 = fma(_296, _292, _148);
        float _300 = _298 * _286;
        float _302 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = as_type<int>(_288);
        _270 = _286;
        _240 = _290;
        _242 = _302;
    }
    int _304 = _238;
    float _306 = _270;
    float _308 = _240;
    float _310 = _242;
    bool _312 = !_164;
    int _314 = _304;
    float _316 = _308;
    float _318 = _306;
    if (!_312)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _148 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _314 = as_type<int>(_332);
        _260 = _338;
    }
    int _340 = _314;
    float _342 = _260;
    int _344 = _340;
    if (_154)
    {
        _316 = _150;
    }
    float _346 = _316;
    float _348 = _346;
    if (_154)
    {
        _344 = 0;
    }
    int _350 = _344;
    int _352 = _350;
    if (_154)
    {
        _318 = _172;
    }
    float _354 = _318;
    float _356 = _354;
    if (!_154)
    {
        float _358 = in.m_49.x;
        float _360 = _150 * 3.1415927410125732421875;
        float _362 = _360 * 0.15915493667125701904296875;
        float _364 = _362 * 6.283185482025146484375;
        float _366 = sin(_364);
        float _368 = _358 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        _352 = 2;
        _272 = _358;
        _356 = _374;
        _348 = _366;
    }
    int _376 = _352;
    float _378 = _272;
    float _380 = _356;
    float _382 = _348;
    bool _384 = _376 != 2;
    float _386 = _378 * 2.0;
    float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _390 = log2(_388);
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _380 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _408 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[93].z, _406);
    float _412 = floor(_386);
    float _414 = _150 + _378;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _414 + (-1.0);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _424 = -_416;
    float _426 = fma(_418, 2.0, _424);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _430 = !_394;
    int _432 = _430 ? 0 : 1;
    float _434 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[93].w, _422);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _442 = abs(_432);
    float _444 = -_436;
    float _446 = fma(_404, 2.0, _444);
    bool _448 = _412 > 0.0;
    float _450 = fma(_440, -2.0, _438);
    bool _452 = _412 >= 0.0;
    bool _454 = isnan(_412);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _390 * _126;
    float _464 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _450);
    float _466 = exp2(_462);
    float _468 = _420;
    float _470 = _440;
    if (_384)
    {
        _468 = _378;
    }
    float _472 = _468;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (_384)
    {
        _470 = _150;
    }
    float _478 = _470;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _482 = float(_248);
    float _484 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _410);
    float _486 = float(_442);
    float _488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _434);
    float _490 = _478;
    if (!_384)
    {
        _476 = _146;
    }
    float _492 = _476;
    float _494 = -_126;
    float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[91].x, _446);
    if (!_384)
    {
        _490 = _378;
    }
    float _498 = _490;
    float _500 = _486 * _482;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _504 = _460 ? 0 : 1;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = -_474;
    float _510 = fma(_502, 2.0, _508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _514 = 1.0 + _512;
    float _516 = fma(_506, -2.0, _480);
    int _518 = ~_504;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = in.m_51.x;
    float _526 = in.m_51.y;
    float _528 = in.m_51.z;
    float _530 = 1.0 / _514;
    int _532 = _522;
    if (!_448)
    {
        int _534 = ~_504;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _542 = -_466;
    float _544 = _542 + 1.0;
    float _546 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _540);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _562 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _574 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _546);
    float _576 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _578 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[88].z, _560);
    float _580 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _572);
    float _582 = _570 ? _544 : 0.0;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    bool _586 = !_402;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _580);
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _594 = -_126;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _426);
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[86].x, _510);
    float _602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _516);
    int _604 = abs(_588);
    if (_558)
    {
        float _606 = _582 * _530;
        _128 = _606;
    }
    float _608 = _128;
    float _610 = _500 * (-2.0);
    bool _612 = !_398;
    int _614 = _612 ? 0 : 1;
    float _616 = in.m_53.w;
    float _618 = float(_266);
    float _620 = _378 + _146;
    float _622 = float(_604);
    float _624 = _378 + (-0.5);
    float _626 = fma(_610, _524, _524);
    int _628 = abs(_614);
    float _630 = _620 + (-1.0);
    float _632 = fma(_428, _610, _428);
    float _634 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _626);
    float _636 = _622 * _618;
    float _638 = float(_628);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _642 = float(_538);
    float _644 = fma(_632, _608, _634);
    float _646 = _636 * (-2.0);
    float _648 = _150 + _146;
    float _650 = _638 * _642;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = _146 + (-0.5);
    float _660 = fma(_646, _528, _528);
    float _662 = _648 + (-1.0);
    float _664 = _650 * (-2.0);
    float _666 = fma(_640, _646, _640);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _676 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _678 = fma(_664, _526, _526);
    float _680 = _150 + (-0.5);
    float _682 = fma(_666, _608, _674);
    float _684 = fma(_676, _664, _676);
    float _686 = _644 * 0.15915493667125701904296875;
    float _688 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _686 * 6.283185482025146484375;
    float _694 = sin(_692);
    float _696 = fma(_684, _608, _688);
    float _698 = in.m_47.x;
    float _700 = in.m_47.y;
    float _702 = in.m_47.z;
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = in.m_42.x;
    float _708 = in.m_42.y;
    float _710 = in.m_42.z;
    float _712 = _686 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _718 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _726 = _690 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _734 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _722 * _720;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = _734 * _724;
    float _742 = _704 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _738 * _732;
    float _748 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _752 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _754 = fma(_342, _698, _748);
    float _756 = fma(_342, _700, _750);
    float _758 = _704 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_342, _702, _752);
    float _764 = _728 * _740;
    float _766 = fma(_756, _616, _708);
    float _768 = fma(_754, _616, _706);
    float _770 = fma(_762, _616, _710);
    float _772 = _714 * _764;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = _694 * _764;
    float _780 = _694 * _744;
    float _782 = _714 * _744;
    float _784 = _744 * _728;
    float _786 = _694 * _760;
    float _788 = _714 * _760;
    float _790 = _760 * _728;
    float _792 = fma(_776, _782, _786);
    float _794 = -_740;
    float _796 = _776 * _794;
    float _798 = -_780;
    float _800 = fma(_776, _788, _798);
    float _802 = -_788;
    float _804 = fma(_776, _780, _802);
    float _806 = fma(_792, _736, _772);
    float _808 = fma(_784, _736, _796);
    float _810 = _766 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = fma(_776, _786, _782);
    float _814 = fma(_800, _746, _806);
    float _816 = fma(_804, _736, _778);
    float _818 = fma(_790, _746, _808);
    float _820 = _766 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _826 = fma(_812, _746, _816);
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _830 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _824);
    float _836 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _766 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _848 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _850 = _838 + _842;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _854 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[5].x, _846);
    float _856 = _844 + _848;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _850 + _858;
    float _862 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _852);
    float _864 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _862);
    float _874 = _864 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = fma(_868, _868, _870);
    float _878 = _874 + _872;
    float _880 = sqrt(_876);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _844;
    float _886 = _850;
    float _888 = _856;
    float _890 = _768;
    float _892 = _772;
    if (!_882)
    {
        _884 = _850;
    }
    float _894 = _884;
    float _896 = _894;
    if (!_882)
    {
        _886 = _878;
    }
    float _898 = _886;
    bool _900 = !_882;
    float _902 = _898;
    if (!_900)
    {
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _908 = _880 + _906;
        float _910 = rsqrt(_876);
        float _912 = _908 * _904;
        float _914 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = _912 * 0.15915493667125701904296875;
        float _918 = _916 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        float _926 = _920 + (-1.0);
        float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = fma(_924, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _932 = fma(_878, _920, _928);
        float _934 = _910 * _930;
        float _936 = fma(_868, _934, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _938 = fma(_860, _934, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _902 = _932;
        _888 = _936;
        _896 = _938;
    }
    float _940 = _902;
    float _942 = _888;
    float _944 = _896;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _940 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _942 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _960 = _948 * _948;
    float _962 = fma(_952, _952, _960);
    float _964 = fma(_956, _956, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _952 * _970;
    float _974 = _956 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _956;
    float _992 = _960;
    float _994 = _988;
    float _996 = _948;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (_984)
    {
        float _1002 = rsqrt(_980);
        _992 = _1002;
    }
    float _1004 = _992;
    float _1006 = _1004;
    if (_984)
    {
        float _1008 = _988 * _1000;
        _994 = _1008;
    }
    float _1010 = _994;
    if (_984)
    {
        float _1012 = _1010 * 0.15915493667125701904296875;
        _890 = _1012;
    }
    float _1014 = _890;
    float _1016 = _966;
    if (_984)
    {
        float _1018 = _1014 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1026 = precise::max(0.0, _1024);
    float _1028 = _852;
    float _1030 = _1026;
    float _1032 = _1024;
    if (_984)
    {
        float _1034 = _1014 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1028 = _1036;
    }
    float _1038 = _1028;
    float _1040 = -_970;
    float _1042 = -_1026;
    float _1044 = fma(_948, _1040, _1042);
    if (!_984)
    {
        _996 = _974;
    }
    float _1046 = _996;
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1050;
    }
    float _1052 = _1030;
    float _1054 = _1022;
    float _1056 = _1052;
    if (_984)
    {
        float _1058 = fma(_1022, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_984)
    {
        _1056 = _1044;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    float _1068 = _1038;
    if (_984)
    {
        float _1070 = _1038 + (-1.0);
        _1032 = _1070;
    }
    float _1072 = _1032;
    float _1074 = _1072;
    if (_984)
    {
        float _1076 = _1004 * _1060;
        _892 = _1076;
    }
    float _1078 = _892;
    if (!_984)
    {
        _1062 = _972;
    }
    float _1080 = _1062;
    float _1082 = _1080;
    if (_984)
    {
        float _1084 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1006 = _1084;
    }
    float _1086 = _1006;
    if (_984)
    {
        float _1088 = _972 * _1078;
        _1082 = _1088;
    }
    float _1090 = _1082;
    if (!_984)
    {
        _1074 = _976;
    }
    float _1092 = _1074;
    float _1094 = _1092;
    if (_984)
    {
        float _1096 = _974 * _1078;
        _1048 = _1096;
    }
    float _1098 = _1048;
    if (_984)
    {
        float _1100 = fma(_1044, _1038, _1086);
        _1066 = _1100;
    }
    float _1102 = _1066;
    if (_984)
    {
        float _1104 = _1090 * _1090;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (!_984)
    {
        _1068 = _978;
    }
    float _1108 = _1068;
    float _1110 = _1108;
    if (_984)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = fma(_1102, _1102, _1106);
    float _1118 = _940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1116 + _1114;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = _940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1130 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1132 = rsqrt(_1120);
    float _1134 = -_1126;
    float _1136 = _1134 + 1.0;
    float _1138 = _940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1128);
    float _1142 = _940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1150 = abs(_1136);
    float _1152 = log2(_1150);
    float _1154 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1142);
    float _1156 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1154);
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1132 * _1090;
    float _1170 = _1132 * _1102;
    float _1172 = _1132 * _1098;
    float _1174 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1178 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1180 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1184);
    float _1188 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1178;
    float _1192 = fma(_1190, _958, 1.0);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1196 = -_1172;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1186);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1202 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = exp2(_1188);
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1200);
    float _1210 = fma(_1198, 0.5, 0.5);
    float _1212 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = _1170 + 1.0;
    float _1216 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1208);
    float _1218 = log2(_1192);
    float _1220 = fma(_1210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1210, _1220, -0.212114393711090087890625);
    float _1228 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = 1.0 / _1194;
    float _1232 = -_1170;
    float _1234 = fma(_1204, _1214, _1232);
    float _1236 = fma(_1210, _1226, 1.570728778839111328125);
    float _1238 = sqrt(_1206);
    float _1240 = _1218 * 0.693147182464599609375;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1230;
    float _1246 = _1228 * _1230;
    float _1248 = fma(_1244, 0.5, 0.5);
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1234, 0.5, 0.5);
    float _1254 = _1238 * 0.636619746685028076171875;
    float3 _3476 = float3(_1248, _1250, _1242);
    float _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3476, float3(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3476, float3(0.0), isnan(_3476)), level(0.0)).x;
    float _1258 = -_1236;
    float _1260 = fma(_1254, _1258, 1.0);
    float3 _3492 = float3(_1248, _1250, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3492, float3(0.0), isnan(_3492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3492, float3(0.0), isnan(_3492)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3509 = float2(_1260, _1252);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3509, float2(0.0), isnan(_3509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3509, float2(0.0), isnan(_3509)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = in.m_57.y;
    bool _1285 = _146 > 0.5;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1291 = _1289 != 0;
    float _1293 = in.m_49.w;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1303 = _1301 != 0;
    float _1305 = in.m_57.x;
    bool _1307 = _150 > 0.5;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1313 = _1311 != 0;
    float _1315 = _690;
    float _1317 = _1309;
    if (_1291)
    {
        float _1319 = in.m_49.z;
        _1315 = _1319;
    }
    float _1321 = _1315;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1327 = _778;
    if (_1297)
    {
        float _1329 = in.m_49.x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _1293 > 0.5;
    int _1339 = _1285 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1341 = _1337 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1343 = _1303 ? _1339 : as_type<int>(_1283);
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>(_1323);
    int _1353 = _1343;
    if (_1313)
    {
        float _1355 = -_1305;
        float _1357 = _1355 + 1.0;
        _1351 = as_type<int>(_1357);
    }
    int _1359 = _1351;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1325, as_type<float>(_1343), -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1369 = _1367 != 0;
    bool _1371 = _1363;
    bool _1373 = _1369;
    float _1375 = as_type<float>(_1359);
    if (_1291)
    {
        float _1377 = -_1305;
        float _1379 = _1377 + 1.0;
        _1353 = as_type<int>(_1379);
    }
    int _1381 = _1353;
    int _1383 = _1307 ? as_type<int>(_1335) : as_type<int>(_1283);
    float _1385 = -_602;
    float _1387 = fma(_574, _1365, _1385);
    float _1389 = _1349 ? as_type<float>(_1339) : _1283;
    float _1391 = _1363 ? as_type<float>(_1341) : _1283;
    float _1393 = _1369 ? as_type<float>(_1383) : _1283;
    float _1395 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1397 = _1389;
    if (_1291)
    {
        bool _1399 = _1321 > 0.5;
        _1371 = _1399;
    }
    bool _1401 = _1371;
    float _1403 = fma(_1345, _1389, -0.5);
    float _1405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1407 = fma(_1395, _1393, -0.5);
    int _1409 = as_type<int>(_1407);
    float _1411 = _1331;
    if (_1297)
    {
        bool _1413 = _1331 > 0.5;
        _1373 = _1413;
    }
    bool _1415 = _1373;
    float _1417 = -_464;
    float _1419 = fma(_488, _1403, _1417);
    if (!_1297)
    {
        _1317 = _1305;
    }
    float _1421 = _1317;
    float _1423 = -_408;
    float _1425 = fma(_590, _1407, _1423);
    float _1427 = _1421;
    if (_1297)
    {
        float _1429 = -_1305;
        float _1431 = _1429 + 1.0;
        _1409 = as_type<int>(_1431);
    }
    int _1433 = _1409;
    if (!_1291)
    {
        _1397 = _1305;
    }
    float _1435 = _1397;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1439 = _1435;
    if (_1291)
    {
        float _1441 = _1401 ? as_type<float>(_1381) : _1305;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1419 + 0.5;
    if (_1297)
    {
        float _1447 = _1415 ? as_type<float>(_1433) : _1305;
        _1427 = _1447;
    }
    float _1449 = _1427;
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1457 = fma(_1451, _1449, -0.5);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1463 = _1461 != 0;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = fma(_584, _1457, _596);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1313)
    {
        _1411 = _1305;
    }
    float _1477 = _1411;
    out.m_59.x = _1467;
    out.m_59.y = _1469;
    out.m_59.z = _1471;
    out.m_59.w = _1465;
    float _1479 = _1477;
    if (_1313)
    {
        float _1481 = _1307 ? as_type<float>(_1359) : _1305;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _1487 = 0;
    if (_1463)
    {
        float _1489 = -_1305;
        float _1491 = _1489 + 1.0;
        _1487 = as_type<int>(_1491);
    }
    int _1493 = _1487;
    if (!_1463)
    {
        _1375 = _1305;
    }
    float _1495 = _1375;
    float _1497 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1499 = _1495;
    if (_1463)
    {
        float _1501 = _1307 ? as_type<float>(_1493) : _1305;
        _1499 = _1501;
    }
    float _1503 = _1499;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1509 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1511 = fma(_1485, _1503, -0.5);
    float _1513 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1517 = fma(_484, _1511, _496);
    float _1519 = exp2(_1509);
    float _1521 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1523 = fma(_1513, _1483, -0.5);
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1527 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1529 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = fma(_592, _1523, _600);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1527);
    float _1543 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1537 + 0.5;
    float _1547 = _1387 + 0.5;
    float _1549 = -_1519;
    float _1551 = _1549 + 1.0;
    out.m_61.x = _1539;
    out.m_61.y = _1529;
    out.m_61.z = _1535;
    out.m_61.w = _1525;
    float _1553 = _1497 * _1505;
    float _1555 = _1473 + 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1545;
    out.m_63.y = _1547;
    float _1559 = _1517 + 0.5;
    float _1561 = _1543 * _1533;
    float _1563 = _1425 + 0.5;
    out.m_65.x = _1559;
    out.m_65.y = _1445;
    float _1565 = _1541 + _1194;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1561;
    out.m_67.w = _1553;
    float _1567 = _1565 * 0.5;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1541;
    out.gl_Position.w = _1194;
    out.m_69.z = _1567;
    out.m_69.w = _1194;
    out.m_45.x = _1569;
    float _1571 = _1557 * _1256;
    float _1573 = -_1557;
    float _1575 = _1573 + 1.0;
    float _1577 = _1271 * _1571;
    float _1579 = _1271 * _1575;
    float _1581 = _1281 * _1571;
    float _1583 = fma(_1277, _1577, _1265);
    float _1585 = fma(_1279, _1577, _1267);
    float _1587 = fma(_1271, _1581, _1269);
    out.m_71.x = _1583;
    out.m_71.y = _1585;
    out.m_71.z = _1587;
    out.m_71.w = _1579;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1645 = as_type<float>(_108);
        out.gl_Position.z = _1645;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1714 = as_type<float>(_144);
        out.gl_Position.z = _1714;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.z;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _154 = _152 != 0;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_154)
    {
        float _170 = in.m_49.x;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _146 * 2.0;
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _150 * 2.0;
    float _192 = floor(_182);
    float _194 = floor(_190);
    bool _196 = _192 > 0.0;
    bool _198 = _192 >= 0.0;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan(0.0);
    bool _206 = _202 || _204;
    float _208 = _206 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _210 = _194 > 0.0;
    bool _212 = _194 >= 0.0;
    bool _214 = isnan(_194);
    bool _216 = _212 || _214;
    bool _218 = isnan(0.0);
    bool _220 = _216 || _218;
    float _222 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _224 = ~as_type<int>(_208);
    int _226 = _224 + 1;
    int _228 = _226 + 1;
    int _230 = _220 ? 0 : 1;
    float _232 = fma(_222, -2.0, _166);
    int _234 = _228;
    float _236 = _208;
    int _238 = as_type<int>(_222);
    float _240 = as_type<float>(_230);
    float _242 = _188;
    if (!_196)
    {
        int _244 = ~as_type<int>(_208);
        int _246 = _244 + 1;
        _234 = _246;
    }
    int _248 = _234;
    int _250 = ~_230;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    if (!_164)
    {
        _236 = _148;
    }
    float _258 = _236;
    float _260 = _258;
    if (!_210)
    {
        int _262 = ~_230;
        int _264 = _262 + 1;
        _256 = _264;
    }
    int _266 = _256;
    bool _268 = !_164;
    float _270 = 0.0;
    float _272 = _172;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = _148 * _276;
        float _286 = 1.0 / _280;
        float _288 = _282 * 0.693147182464599609375;
        float _290 = exp2(_284);
        float _292 = 1.0 / _288;
        float _294 = _290 + (-1.0);
        float _296 = -_294;
        float _298 = fma(_296, _292, _148);
        float _300 = _298 * _286;
        float _302 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = as_type<int>(_288);
        _270 = _286;
        _240 = _290;
        _242 = _302;
    }
    int _304 = _238;
    float _306 = _270;
    float _308 = _240;
    float _310 = _242;
    bool _312 = !_164;
    int _314 = _304;
    float _316 = _308;
    float _318 = _306;
    if (!_312)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _148 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _314 = as_type<int>(_332);
        _260 = _338;
    }
    int _340 = _314;
    float _342 = _260;
    int _344 = _340;
    if (_154)
    {
        _316 = _150;
    }
    float _346 = _316;
    float _348 = _346;
    if (_154)
    {
        _344 = 0;
    }
    int _350 = _344;
    int _352 = _350;
    if (_154)
    {
        _318 = _172;
    }
    float _354 = _318;
    float _356 = _354;
    if (!_154)
    {
        float _358 = in.m_49.x;
        float _360 = _150 * 3.1415927410125732421875;
        float _362 = _360 * 0.15915493667125701904296875;
        float _364 = _362 * 6.283185482025146484375;
        float _366 = sin(_364);
        float _368 = _358 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        _352 = 2;
        _272 = _358;
        _356 = _374;
        _348 = _366;
    }
    int _376 = _352;
    float _378 = _272;
    float _380 = _356;
    float _382 = _348;
    bool _384 = _376 != 2;
    float _386 = _378 * 2.0;
    float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _390 = log2(_388);
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _380 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _408 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[93].z, _406);
    float _412 = floor(_386);
    float _414 = _150 + _378;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _414 + (-1.0);
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _424 = -_416;
    float _426 = fma(_418, 2.0, _424);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _430 = !_394;
    int _432 = _430 ? 0 : 1;
    float _434 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[93].w, _422);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _442 = abs(_432);
    float _444 = -_436;
    float _446 = fma(_404, 2.0, _444);
    bool _448 = _412 > 0.0;
    float _450 = fma(_440, -2.0, _438);
    bool _452 = _412 >= 0.0;
    bool _454 = isnan(_412);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _390 * _126;
    float _464 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _450);
    float _466 = exp2(_462);
    float _468 = _420;
    float _470 = _440;
    if (_384)
    {
        _468 = _378;
    }
    float _472 = _468;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (_384)
    {
        _470 = _150;
    }
    float _478 = _470;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _482 = float(_248);
    float _484 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _410);
    float _486 = float(_442);
    float _488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _434);
    float _490 = _478;
    if (!_384)
    {
        _476 = _146;
    }
    float _492 = _476;
    float _494 = -_126;
    float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[91].x, _446);
    if (!_384)
    {
        _490 = _378;
    }
    float _498 = _490;
    float _500 = _486 * _482;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _504 = _460 ? 0 : 1;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = -_474;
    float _510 = fma(_502, 2.0, _508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _514 = 1.0 + _512;
    float _516 = fma(_506, -2.0, _480);
    int _518 = ~_504;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = in.m_51.x;
    float _526 = in.m_51.y;
    float _528 = in.m_51.z;
    float _530 = 1.0 / _514;
    int _532 = _522;
    if (!_448)
    {
        int _534 = ~_504;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _542 = -_466;
    float _544 = _542 + 1.0;
    float _546 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _540);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _562 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _574 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _546);
    float _576 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _578 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[88].z, _560);
    float _580 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _572);
    float _582 = _570 ? _544 : 0.0;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    bool _586 = !_402;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _580);
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _594 = -_126;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _426);
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[86].x, _510);
    float _602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _516);
    int _604 = abs(_588);
    if (_558)
    {
        float _606 = _582 * _530;
        _128 = _606;
    }
    float _608 = _128;
    float _610 = _500 * (-2.0);
    bool _612 = !_398;
    int _614 = _612 ? 0 : 1;
    float _616 = in.m_53.w;
    float _618 = float(_266);
    float _620 = _378 + _146;
    float _622 = float(_604);
    float _624 = _378 + (-0.5);
    float _626 = fma(_610, _524, _524);
    int _628 = abs(_614);
    float _630 = _620 + (-1.0);
    float _632 = fma(_428, _610, _428);
    float _634 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].x, _626);
    float _636 = _622 * _618;
    float _638 = float(_628);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _642 = float(_538);
    float _644 = fma(_632, _608, _634);
    float _646 = _636 * (-2.0);
    float _648 = _150 + _146;
    float _650 = _638 * _642;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = _146 + (-0.5);
    float _660 = fma(_646, _528, _528);
    float _662 = _648 + (-1.0);
    float _664 = _650 * (-2.0);
    float _666 = fma(_640, _646, _640);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _676 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _678 = fma(_664, _526, _526);
    float _680 = _150 + (-0.5);
    float _682 = fma(_666, _608, _674);
    float _684 = fma(_676, _664, _676);
    float _686 = _644 * 0.15915493667125701904296875;
    float _688 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _686 * 6.283185482025146484375;
    float _694 = sin(_692);
    float _696 = fma(_684, _608, _688);
    float _698 = in.m_47.x;
    float _700 = in.m_47.y;
    float _702 = in.m_47.z;
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = in.m_42.x;
    float _708 = in.m_42.y;
    float _710 = in.m_42.z;
    float _712 = _686 * 6.283185482025146484375;
    float _714 = cos(_712);
    float _716 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _718 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _726 = _690 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _734 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _722 * _720;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = _734 * _724;
    float _742 = _704 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _738 * _732;
    float _748 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _752 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _754 = fma(_342, _698, _748);
    float _756 = fma(_342, _700, _750);
    float _758 = _704 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_342, _702, _752);
    float _764 = _728 * _740;
    float _766 = fma(_756, _616, _708);
    float _768 = fma(_754, _616, _706);
    float _770 = fma(_762, _616, _710);
    float _772 = _714 * _764;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = _694 * _764;
    float _780 = _694 * _744;
    float _782 = _714 * _744;
    float _784 = _744 * _728;
    float _786 = _694 * _760;
    float _788 = _714 * _760;
    float _790 = _760 * _728;
    float _792 = fma(_776, _782, _786);
    float _794 = -_740;
    float _796 = _776 * _794;
    float _798 = -_780;
    float _800 = fma(_776, _788, _798);
    float _802 = -_788;
    float _804 = fma(_776, _780, _802);
    float _806 = fma(_792, _736, _772);
    float _808 = fma(_784, _736, _796);
    float _810 = _766 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = fma(_776, _786, _782);
    float _814 = fma(_800, _746, _806);
    float _816 = fma(_804, _736, _778);
    float _818 = fma(_790, _746, _808);
    float _820 = _766 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _824 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _826 = fma(_812, _746, _816);
    float _828 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _830 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _824);
    float _836 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[4].z, _828);
    float _838 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _766 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _848 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _850 = _838 + _842;
    float _852 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _854 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[5].x, _846);
    float _856 = _844 + _848;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _850 + _858;
    float _862 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _852);
    float _864 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[5].z, _854);
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _862);
    float _874 = _864 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _876 = fma(_868, _868, _870);
    float _878 = _874 + _872;
    float _880 = sqrt(_876);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _844;
    float _886 = _850;
    float _888 = _856;
    float _890 = _768;
    float _892 = _772;
    if (!_882)
    {
        _884 = _850;
    }
    float _894 = _884;
    float _896 = _894;
    if (!_882)
    {
        _886 = _878;
    }
    float _898 = _886;
    bool _900 = !_882;
    float _902 = _898;
    if (!_900)
    {
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _908 = _880 + _906;
        float _910 = rsqrt(_876);
        float _912 = _908 * _904;
        float _914 = _878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = _912 * 0.15915493667125701904296875;
        float _918 = _916 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = _916 * 6.283185482025146484375;
        float _924 = sin(_922);
        float _926 = _920 + (-1.0);
        float _928 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = fma(_924, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _932 = fma(_878, _920, _928);
        float _934 = _910 * _930;
        float _936 = fma(_868, _934, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _938 = fma(_860, _934, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _902 = _932;
        _888 = _936;
        _896 = _938;
    }
    float _940 = _902;
    float _942 = _888;
    float _944 = _896;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _940 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _942 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _960 = _948 * _948;
    float _962 = fma(_952, _952, _960);
    float _964 = fma(_956, _956, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _952 * _970;
    float _974 = _956 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _956;
    float _992 = _960;
    float _994 = _988;
    float _996 = _948;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (_984)
    {
        float _1002 = rsqrt(_980);
        _992 = _1002;
    }
    float _1004 = _992;
    float _1006 = _1004;
    if (_984)
    {
        float _1008 = _988 * _1000;
        _994 = _1008;
    }
    float _1010 = _994;
    if (_984)
    {
        float _1012 = _1010 * 0.15915493667125701904296875;
        _890 = _1012;
    }
    float _1014 = _890;
    float _1016 = _966;
    if (_984)
    {
        float _1018 = _1014 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1026 = precise::max(0.0, _1024);
    float _1028 = _852;
    float _1030 = _1026;
    float _1032 = _1024;
    if (_984)
    {
        float _1034 = _1014 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1028 = _1036;
    }
    float _1038 = _1028;
    float _1040 = -_970;
    float _1042 = -_1026;
    float _1044 = fma(_948, _1040, _1042);
    if (!_984)
    {
        _996 = _974;
    }
    float _1046 = _996;
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1050;
    }
    float _1052 = _1030;
    float _1054 = _1022;
    float _1056 = _1052;
    if (_984)
    {
        float _1058 = fma(_1022, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_984)
    {
        _1056 = _1044;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    float _1068 = _1038;
    if (_984)
    {
        float _1070 = _1038 + (-1.0);
        _1032 = _1070;
    }
    float _1072 = _1032;
    float _1074 = _1072;
    if (_984)
    {
        float _1076 = _1004 * _1060;
        _892 = _1076;
    }
    float _1078 = _892;
    if (!_984)
    {
        _1062 = _972;
    }
    float _1080 = _1062;
    float _1082 = _1080;
    if (_984)
    {
        float _1084 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1006 = _1084;
    }
    float _1086 = _1006;
    if (_984)
    {
        float _1088 = _972 * _1078;
        _1082 = _1088;
    }
    float _1090 = _1082;
    if (!_984)
    {
        _1074 = _976;
    }
    float _1092 = _1074;
    float _1094 = _1092;
    if (_984)
    {
        float _1096 = _974 * _1078;
        _1048 = _1096;
    }
    float _1098 = _1048;
    if (_984)
    {
        float _1100 = fma(_1044, _1038, _1086);
        _1066 = _1100;
    }
    float _1102 = _1066;
    if (_984)
    {
        float _1104 = _1090 * _1090;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (!_984)
    {
        _1068 = _978;
    }
    float _1108 = _1068;
    float _1110 = _1108;
    if (_984)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = fma(_1102, _1102, _1106);
    float _1118 = _940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1116 + _1114;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = _940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1130 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1132 = rsqrt(_1120);
    float _1134 = -_1126;
    float _1136 = _1134 + 1.0;
    float _1138 = _940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1128);
    float _1142 = _940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1150 = abs(_1136);
    float _1152 = log2(_1150);
    float _1154 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1142);
    float _1156 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1146);
    float _1158 = _1148 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1154);
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1168 = _1132 * _1090;
    float _1170 = _1132 * _1102;
    float _1172 = _1132 * _1098;
    float _1174 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1166);
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1178 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1180 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1174);
    float _1184 = -_1176;
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1184);
    float _1188 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1178;
    float _1192 = fma(_1190, _958, 1.0);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1196 = -_1172;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1186);
    float _1200 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1202 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = exp2(_1188);
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1200);
    float _1210 = fma(_1198, 0.5, 0.5);
    float _1212 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1214 = _1170 + 1.0;
    float _1216 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1208);
    float _1218 = log2(_1192);
    float _1220 = fma(_1210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = fma(_1210, _1220, -0.212114393711090087890625);
    float _1228 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = 1.0 / _1194;
    float _1232 = -_1170;
    float _1234 = fma(_1204, _1214, _1232);
    float _1236 = fma(_1210, _1226, 1.570728778839111328125);
    float _1238 = sqrt(_1206);
    float _1240 = _1218 * 0.693147182464599609375;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1230;
    float _1246 = _1228 * _1230;
    float _1248 = fma(_1244, 0.5, 0.5);
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1234, 0.5, 0.5);
    float _1254 = _1238 * 0.636619746685028076171875;
    float3 _3476 = float3(_1248, _1250, _1242);
    float _1256 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3476, float3(0.0), isnan(_3476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3476, float3(0.0), isnan(_3476)), level(0.0)).x;
    float _1258 = -_1236;
    float _1260 = fma(_1254, _1258, 1.0);
    float3 _3492 = float3(_1248, _1250, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3492, float3(0.0), isnan(_3492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3492, float3(0.0), isnan(_3492)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3509 = float2(_1260, _1252);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3509, float2(0.0), isnan(_3509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3509, float2(0.0), isnan(_3509)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = in.m_57.y;
    bool _1285 = _146 > 0.5;
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1291 = _1289 != 0;
    float _1293 = in.m_49.w;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1303 = _1301 != 0;
    float _1305 = in.m_57.x;
    bool _1307 = _150 > 0.5;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1313 = _1311 != 0;
    float _1315 = _690;
    float _1317 = _1309;
    if (_1291)
    {
        float _1319 = in.m_49.z;
        _1315 = _1319;
    }
    float _1321 = _1315;
    float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1325 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1327 = _778;
    if (_1297)
    {
        float _1329 = in.m_49.x;
        _1327 = _1329;
    }
    float _1331 = _1327;
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _1293 > 0.5;
    int _1339 = _1285 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1341 = _1337 ? as_type<int>(_1335) : as_type<int>(_1283);
    int _1343 = _1303 ? _1339 : as_type<int>(_1283);
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>(_1323);
    int _1353 = _1343;
    if (_1313)
    {
        float _1355 = -_1305;
        float _1357 = _1355 + 1.0;
        _1351 = as_type<int>(_1357);
    }
    int _1359 = _1351;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1325, as_type<float>(_1343), -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1369 = _1367 != 0;
    bool _1371 = _1363;
    bool _1373 = _1369;
    float _1375 = as_type<float>(_1359);
    if (_1291)
    {
        float _1377 = -_1305;
        float _1379 = _1377 + 1.0;
        _1353 = as_type<int>(_1379);
    }
    int _1381 = _1353;
    int _1383 = _1307 ? as_type<int>(_1335) : as_type<int>(_1283);
    float _1385 = -_602;
    float _1387 = fma(_574, _1365, _1385);
    float _1389 = _1349 ? as_type<float>(_1339) : _1283;
    float _1391 = _1363 ? as_type<float>(_1341) : _1283;
    float _1393 = _1369 ? as_type<float>(_1383) : _1283;
    float _1395 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1397 = _1389;
    if (_1291)
    {
        bool _1399 = _1321 > 0.5;
        _1371 = _1399;
    }
    bool _1401 = _1371;
    float _1403 = fma(_1345, _1389, -0.5);
    float _1405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1407 = fma(_1395, _1393, -0.5);
    int _1409 = as_type<int>(_1407);
    float _1411 = _1331;
    if (_1297)
    {
        bool _1413 = _1331 > 0.5;
        _1373 = _1413;
    }
    bool _1415 = _1373;
    float _1417 = -_464;
    float _1419 = fma(_488, _1403, _1417);
    if (!_1297)
    {
        _1317 = _1305;
    }
    float _1421 = _1317;
    float _1423 = -_408;
    float _1425 = fma(_590, _1407, _1423);
    float _1427 = _1421;
    if (_1297)
    {
        float _1429 = -_1305;
        float _1431 = _1429 + 1.0;
        _1409 = as_type<int>(_1431);
    }
    int _1433 = _1409;
    if (!_1291)
    {
        _1397 = _1305;
    }
    float _1435 = _1397;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1439 = _1435;
    if (_1291)
    {
        float _1441 = _1401 ? as_type<float>(_1381) : _1305;
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1419 + 0.5;
    if (_1297)
    {
        float _1447 = _1415 ? as_type<float>(_1433) : _1305;
        _1427 = _1447;
    }
    float _1449 = _1427;
    float _1451 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1457 = fma(_1451, _1449, -0.5);
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1463 = _1461 != 0;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = fma(_584, _1457, _596);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1313)
    {
        _1411 = _1305;
    }
    float _1477 = _1411;
    out.m_59.x = _1467;
    out.m_59.y = _1469;
    out.m_59.z = _1471;
    out.m_59.w = _1465;
    float _1479 = _1477;
    if (_1313)
    {
        float _1481 = _1307 ? as_type<float>(_1359) : _1305;
        _1479 = _1481;
    }
    float _1483 = _1479;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _1487 = 0;
    if (_1463)
    {
        float _1489 = -_1305;
        float _1491 = _1489 + 1.0;
        _1487 = as_type<int>(_1491);
    }
    int _1493 = _1487;
    if (!_1463)
    {
        _1375 = _1305;
    }
    float _1495 = _1375;
    float _1497 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1499 = _1495;
    if (_1463)
    {
        float _1501 = _1307 ? as_type<float>(_1493) : _1305;
        _1499 = _1501;
    }
    float _1503 = _1499;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1509 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1511 = fma(_1485, _1503, -0.5);
    float _1513 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1517 = fma(_484, _1511, _496);
    float _1519 = exp2(_1509);
    float _1521 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    float _1523 = fma(_1513, _1483, -0.5);
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1527 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1521);
    float _1529 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1537 = fma(_592, _1523, _600);
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1527);
    float _1543 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = _1537 + 0.5;
    float _1547 = _1387 + 0.5;
    float _1549 = -_1519;
    float _1551 = _1549 + 1.0;
    out.m_61.x = _1539;
    out.m_61.y = _1529;
    out.m_61.z = _1535;
    out.m_61.w = _1525;
    float _1553 = _1497 * _1505;
    float _1555 = _1473 + 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_63.x = _1545;
    out.m_63.y = _1547;
    float _1559 = _1517 + 0.5;
    float _1561 = _1543 * _1533;
    float _1563 = _1425 + 0.5;
    out.m_65.x = _1559;
    out.m_65.y = _1445;
    float _1565 = _1541 + _1194;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1561;
    out.m_67.w = _1553;
    float _1567 = _1565 * 0.5;
    float _1569 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1541;
    out.gl_Position.w = _1194;
    out.m_69.z = _1567;
    out.m_69.w = _1194;
    out.m_45.x = _1569;
    float _1571 = _1557 * _1256;
    float _1573 = -_1557;
    float _1575 = _1573 + 1.0;
    float _1577 = _1271 * _1571;
    float _1579 = _1271 * _1575;
    float _1581 = _1281 * _1571;
    float _1583 = fma(_1277, _1577, _1265);
    float _1585 = fma(_1279, _1577, _1267);
    float _1587 = fma(_1271, _1581, _1269);
    out.m_71.x = _1583;
    out.m_71.y = _1585;
    out.m_71.z = _1587;
    out.m_71.w = _1579;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

