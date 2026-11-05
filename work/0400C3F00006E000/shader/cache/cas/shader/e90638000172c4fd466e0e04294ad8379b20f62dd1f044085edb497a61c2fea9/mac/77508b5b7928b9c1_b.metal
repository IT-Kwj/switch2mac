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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    sampler vp_t_tcb_24Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_39 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1672 = false;
    bool _1308 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1957 = as_type<float>(_104);
        out.gl_Position.z = _1957;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_44.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_42.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_142);
        out.gl_Position.z = _2026;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = as_type<float>(int(gl_VertexIndex));
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _148 = as_type<int>(_144) & 1;
    bool _150 = _148 != 0;
    int _152 = as_type<int>(_144) & 2;
    bool _154 = _152 != 0;
    bool _156 = !_150;
    float _158 = _156 ? (-0.5) : 0.5;
    bool _160 = !_154;
    float _162 = _160 ? (-0.5) : 0.5;
    bool _164 = !_146;
    float _182;
    if (!_164)
    {
        float _166 = in.m_49.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_88);
        float _188 = 1.0 / _186;
        float _190 = _122 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_49.x;
    float _196 = in.m_49.y;
    float _198 = in.m_49.z;
    float _200 = in.m_49.w;
    float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _204 = log2(_202);
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _214 = _204 * _122;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _220 = _198 * 2.0;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _224 = _196 > 0.5;
    float _226 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _228 = _198 > 0.5;
    float _230 = fma(_222, -2.0, _206);
    float _232 = floor(_220);
    float _234 = _196 * 2.0;
    float _236 = -_158;
    int _238 = _224 ? as_type<int>(_236) : as_type<int>(_158);
    float _240 = _194 * 2.0;
    float _242 = -_212;
    float _244 = fma(_226, 2.0, _242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _248 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _250 = floor(_234);
    bool _252 = _232 > 0.0;
    float _254 = floor(_240);
    bool _256 = _232 >= 0.0;
    bool _258 = isnan(_232);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = -_162;
    int _268 = _228 ? as_type<int>(_266) : as_type<int>(_162);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    int _278 = _264 ? 0 : 1;
    float _280 = exp2(_214);
    bool _282 = !_272;
    float _284 = _282 ? _158 : as_type<float>(_238);
    bool _286 = !_276;
    float _288 = _286 ? _162 : as_type<float>(_268);
    float _290 = _196 + _194;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _302 = _300 != 0;
    int _304 = ~_278;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    float _310 = _290 + (-1.0);
    int _312 = _308;
    float _314 = _290;
    bool _316 = _298;
    int _318 = as_type<int>(_200);
    if (!_252)
    {
        int _320 = ~_278;
        int _322 = _320 + 1;
        _312 = _322;
    }
    int _324 = _312;
    float _326 = _198 + _194;
    bool _328 = !_294;
    int _330 = _328 ? 0 : 1;
    bool _332 = _250 > 0.0;
    float _334 = _326 + (-1.0);
    bool _336 = _250 >= 0.0;
    bool _338 = isnan(_250);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = -_280;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_210)
    {
        _314 = _198;
    }
    float _354 = _314;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _358 = _354;
    if (_210)
    {
        _358 = _196;
    }
    float _360 = _358;
    float _362 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _364 = _344 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _366 = !_302;
    int _368 = _366 ? 0 : 1;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _356);
    bool _372 = _254 > 0.0;
    bool _374 = _254 >= 0.0;
    bool _376 = isnan(_254);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = in.m_39.x;
    float _386 = in.m_39.y;
    float _388 = in.m_39.z;
    int _390 = ~as_type<int>(_364);
    int _392 = _390 + 1;
    int _394 = _392 + 1;
    int _396 = _394;
    float _398 = _364;
    if (!_332)
    {
        int _400 = ~as_type<int>(_364);
        int _402 = _400 + 1;
        _396 = _402;
    }
    int _404 = _396;
    if (!_210)
    {
        _398 = _196;
    }
    float _406 = _398;
    float _408 = _406;
    if (!_210)
    {
        _352 = _198;
    }
    float _410 = _352;
    float _412 = _410;
    if (_210)
    {
        _408 = _194;
    }
    float _414 = _408;
    if (_210)
    {
        _412 = _196;
    }
    float _416 = _412;
    int _418 = abs(_330);
    float _420 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[83].z, _216);
    int _422 = abs(_368);
    float _424 = _414 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _426 = _416 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = -_218;
    float _430 = fma(_424, 2.0, _428);
    float _432 = float(_324);
    float _434 = fma(_426, -2.0, _246);
    float _436 = float(_404);
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = float(_418);
    float _442 = -_122;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _244);
    float _446 = float(_422);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _450 = _440 * _432;
    float _452 = _446 * _436;
    float _454 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _460 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
    float _462 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _458);
    float _470 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _472 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _456);
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = _470 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _468);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _492 = _482 ? _348 : 0.0;
    float _494 = 1.0 / _466;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _486 + _496;
    float _500 = -_484;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _370);
    float _516 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _434);
    float _518 = _452 * (-2.0);
    float _520 = abs(_498);
    float _522 = abs(_502);
    float _524 = precise::max(_520, _522);
    float _526 = _450 * (-2.0);
    float _528 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _420);
    float _530 = fma(_350, _518, _350);
    bool _532 = _524 >= 16.0;
    float _534 = _194 + (-0.5);
    float _536 = -_122;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[81].x, _430);
    float _540 = fma(_362, _526, _362);
    int _542 = _382 ? 0 : 1;
    float _544 = _498;
    float _546 = _502;
    if (_512)
    {
        float _548 = _492 * _494;
        _126 = _548;
    }
    float _550 = _126;
    float _552 = _198 + (-0.5);
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _556 = ~_542;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = _196 + _198;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _566 = fma(_540, _550, _554);
    bool _568 = !_298;
    int _570 = _568 ? 0 : 1;
    int _572 = _560;
    if (_532)
    {
        float _574 = _498 * 0.0625;
        _544 = _574;
    }
    float _576 = _544;
    float _578 = fma(_530, _550, _564);
    if (!_372)
    {
        int _580 = ~_542;
        int _582 = _580 + 1;
        _572 = _582;
    }
    int _584 = _572;
    if (_532)
    {
        float _586 = _502 * 0.0625;
        _546 = _586;
    }
    float _588 = _546;
    int _590 = abs(_570);
    float _592 = _566 * 0.15915493667125701904296875;
    float _594 = abs(_576);
    bool _596 = _594 != 0.0;
    bool _598 = isnan(_594);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _562 + (-1.0);
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _610 = float(_584);
    float _612 = _196 + (-0.5);
    float _614 = float(_590);
    float _616 = in.m_51.x;
    float _618 = in.m_51.y;
    float _620 = abs(_588);
    bool _622 = _620 == 0.0;
    bool _624 = !_604;
    bool _626 = _622 && _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = abs(_588);
    bool _634 = _632 == 0.0;
    float _636 = _614 * _610;
    float _638 = _578 * 0.15915493667125701904296875;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = _636 * (-2.0);
    bool _646 = _200 > 0.5;
    float _648 = _612 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _650 = fma(_640, _644, _640);
    int _652 = as_type<int>(_648);
    if (_626)
    {
        bool _654 = as_type<int>(_588) >= 0;
        _316 = _654;
    }
    bool _656 = _316;
    float _658 = 1.0 / _630;
    float _660 = fma(_650, _550, _648);
    int _662 = _656 ? (-1) : 0;
    if (_626)
    {
        int _664 = _656 ? 0 : 1078530011;
        _318 = _664;
    }
    int _666 = _318;
    if (_626)
    {
        int _668 = int(0x80000000) & as_type<int>(_576);
        int _670 = _666 | _668;
        _652 = _670;
    }
    int _672 = _652;
    float _674 = _592 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _592 * 6.283185482025146484375;
    float _680 = cos(_678);
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    bool _686 = !_604;
    bool _688 = _686 && _634;
    int _690 = _672;
    float _692 = as_type<float>(_672);
    if (!_688)
    {
        float _694 = abs(_576);
        bool _696 = _694 != as_type<float>(0x7f800000u /* inf */);
        bool _698 = isnan(_694);
        bool _700 = _696 || _698;
        bool _702 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _704 = _700 || _702;
        float _706 = abs(_588);
        bool _708 = _706 == as_type<float>(0x7f800000u /* inf */);
        float _710 = abs(_588);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        bool _714 = !_704;
        bool _716 = _712 && _714;
        if (_716)
        {
            bool _718 = as_type<int>(_588) >= 0;
            _662 = _718 ? (-1) : 0;
        }
        int _720 = _662;
        if (_716)
        {
            _690 = 1075235812;
        }
        int _722 = _690;
        int _724 = _722;
        if (_716)
        {
            int _726 = ~_720;
            int _728 = (_726 != 0) ? _722 : 1061752795;
            _724 = _728;
        }
        int _730 = _724;
        float _732 = as_type<float>(_730);
        if (_716)
        {
            int _734 = int(0x80000000) & as_type<int>(_576);
            int _736 = _730 | _734;
            _732 = as_type<float>(_736);
        }
        float _738 = _732;
        bool _740 = !_704;
        bool _742 = _740 && _708;
        _692 = _738;
        if (!_742)
        {
            float _744 = abs(_576);
            float _746 = abs(_588);
            float _748 = precise::max(_744, _746);
            float _750 = abs(_576);
            float _752 = abs(_588);
            float _754 = precise::min(_750, _752);
            float _756 = 1.0 / _748;
            float _758 = abs(_576);
            float _760 = abs(_588);
            bool _762 = _758 > _760;
            bool _764 = as_type<int>(_588) >= 0;
            float _766 = _754 * _756;
            float _768 = _766 * _766;
            float _770 = _768 + 11.33538818359375;
            float _772 = fma(_768, _770, 28.84246826171875);
            float _774 = fma(_768, _772, 19.6966705322265625);
            float _776 = fma(_768, -0.82336294651031494140625, -5.674867153167724609375);
            float _778 = fma(_768, _776, -6.565555095672607421875);
            float _780 = 1.0 / _774;
            float _782 = _768 * _778;
            float _784 = abs(_576);
            float _786 = abs(_588);
            float _788 = _784 + _786;
            int _790 = as_type<int>(_576) & int(0x80000000);
            float _792 = _766 * _782;
            bool _794 = _788 > as_type<float>(0x7f800000u /* inf */);
            bool _796 = isnan(_788);
            bool _798 = _794 || _796;
            bool _800 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _802 = _798 || _800;
            float _804 = fma(_792, _780, _766);
            float _806 = _804;
            _692 = _788;
            if (_762)
            {
                float _808 = -_804;
                float _810 = _808 + 1.57079637050628662109375;
                _806 = _810;
            }
            float _812 = _806;
            int _814 = as_type<int>(_812);
            if (!_764)
            {
                float _816 = -_812;
                float _818 = _816 + 3.1415927410125732421875;
                _814 = as_type<int>(_818);
            }
            int _820 = _814;
            if (!_802)
            {
                int _822 = _790 | _820;
                _692 = as_type<float>(_822);
            }
        }
    }
    float _824 = _692;
    float _826 = _638 * 6.283185482025146484375;
    float _828 = cos(_826);
    bool _830 = _194 > 0.5;
    float _832 = -_824;
    float _834 = _660 + _832;
    float _836 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _844 = _834 * 0.15915493667125701904296875;
    float _846 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = _840 * _658;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _158);
    float _852 = _844 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _858 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = -_158;
    int _864 = _830 ? as_type<int>(_862) : as_type<int>(_158);
    float _866 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = _858 * _850;
    float _874 = _844 * 6.283185482025146484375;
    float _876 = sin(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = _860 * _856;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _890 = _192 + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _676 * _828;
    float _898 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _900 = _676 * _854;
    float _902 = -_882;
    float _904 = _684 * _902;
    float _906 = _854 * _828;
    float _908 = _896 * _882;
    float _910 = _680 * _854;
    bool _912 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_192);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_848, _890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _926 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_192);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _680 * _876;
    float _940 = _676 * _876;
    float _942 = _876 * _828;
    float _944 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _946 = -_938;
    float _948 = fma(_684, _900, _946);
    bool _950 = !_870;
    float _952 = _950 ? _158 : as_type<float>(_864);
    float _954 = fma(_906, _872, _904);
    float _956 = fma(_684, _940, _910);
    float _958 = fma(_948, _872, _908);
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = fma(_942, _944, _954);
    float _966 = _608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_956, _944, _958);
    float _970 = _922 * _962;
    float _972 = _486 + _964;
    float _974 = _952 + 0.5;
    float _976 = _484 + _968;
    float _978 = _924 * _970;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _972 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _976 + _986;
    float _990 = fma(_966, _974, _444);
    float _992 = -_162;
    int _994 = _224 ? as_type<int>(_992) : as_type<int>(_162);
    float _996 = _984 * _984;
    float _998 = _988 * _988;
    float _1000 = -_158;
    int _1002 = _228 ? as_type<int>(_1000) : as_type<int>(_158);
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1006 = !_880;
    float _1008 = _1006 ? _162 : as_type<float>(_994);
    float _1010 = _996 + _998;
    float _1012 = -_922;
    float _1014 = _1012 + 1.0;
    bool _1016 = !_894;
    float _1018 = _1016 ? _158 : as_type<float>(_1002);
    float _1020 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1022 = _1008 + (-0.5);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    float _1026 = sqrt(_1010);
    float _1028 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1030 = _1018 + 0.5;
    float _1032 = -_1020;
    float _1034 = -_248;
    float _1036 = fma(_1032, _1022, _1034);
    float _1038 = -_162;
    int _1040 = _646 ? as_type<int>(_1038) : as_type<int>(_162);
    float _1042 = _680 * _828;
    float _1044 = fma(_1028, _1030, _538);
    float _1046 = fma(_684, _910, _940);
    bool _1048 = !_886;
    float _1050 = _1048 ? _162 : as_type<float>(_1040);
    float _1052 = _1042 * _882;
    float _1054 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1056 = -_900;
    float _1058 = fma(_684, _938, _1056);
    float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1062 = _1050 + (-0.5);
    float _1064 = fma(_1046, _872, _1052);
    float _1066 = _898 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1068 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -_1054;
    float _1072 = -_516;
    float _1074 = fma(_1070, _1062, _1072);
    float _1076 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1024);
    float _1078 = fma(_1058, _944, _1064);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1082 = _162 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1084 = _158 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1086 = _1066 + _1078;
    float _1088 = -_1082;
    float _1090 = _684 * _1088;
    float _1092 = _896 * _1082;
    float _1094 = _1042 * _1082;
    float _1096 = fma(_906, _1084, _1090);
    float _1098 = _896;
    float _1100 = _996;
    float _1102 = _998;
    float _1104 = _972;
    float _1106 = _976;
    float _1108 = _956;
    if (!_1068)
    {
        _1098 = _1086;
    }
    float _1110 = _1098;
    bool _1112 = !_1068;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1026 + _1118;
        float _1122 = rsqrt(_1010);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1122 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_984, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_988, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1156 = _1146 + _1154;
        float _1158 = fma(_1086, _1136, _1148);
        float _1160 = _1152 * _1152;
        float _1162 = _1156 * _1156;
        _1114 = _1158;
        _1100 = _1160;
        _1102 = _1162;
        _1104 = _1144;
        _1106 = _1146;
    }
    float _1164 = _1114;
    float _1166 = _1100;
    float _1168 = _1102;
    float _1170 = _1104;
    float _1172 = _1106;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1176 = _1164 + _1174;
    float _1178 = _284 + 0.5;
    float _1180 = -_288;
    float _1182 = _1180 + 0.5;
    float _1184 = -_490;
    float _1186 = _1184 + 1.0;
    float _1188 = fma(_1176, _1176, _1166);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = -_514;
    float _1196 = _1194 + 1.0;
    float _1198 = _1188 + _1168;
    float _1200 = fma(_948, _1084, _1092);
    float _1202 = _1190 * _1060;
    float _1204 = _1192 * _1080;
    float _1206 = fma(_1008, _1186, _1036);
    float _1208 = fma(_1050, _1196, _1074);
    float _1210 = sqrt(_1198);
    float _1212 = -_488;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1046, _1084, _1094);
    float _1218 = -_528;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1234 = -_1214;
    float _1236 = fma(_952, _1234, _990);
    float _1238 = -_1220;
    float _1240 = fma(_1018, _1238, _1044);
    float _1242 = _942 + _1096;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1246 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1260 = _1058 + _1216;
    float _1262 = _956 + _1200;
    out.m_53.x = _1250;
    out.m_53.y = _1252;
    out.m_53.z = _1254;
    out.m_53.w = _1244;
    bool _1264 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1266 = isnan(_1210);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1272 = _1268 || _1270;
    out.m_55.x = _1202;
    out.m_55.y = _1204;
    out.m_57.x = _1246;
    out.m_57.y = _1248;
    out.m_57.z = _1256;
    out.m_57.w = _1258;
    out.m_59.x = _1236;
    out.m_59.y = _1206;
    out.m_59.z = _1240;
    out.m_59.w = _1208;
    if (!_1272)
    {
        _1108 = 1.0;
    }
    float _1274 = _1108;
    out.m_61.x = _1242;
    out.m_61.y = _1260;
    out.m_61.z = _1262;
    bool _1276 = !_1272;
    float _1278 = _1274;
    if (!_1276)
    {
        bool _1280 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1282 = isnan(_1210);
        bool _1284 = _1280 || _1282;
        bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1288 = _1284 || _1286;
        if (!_1288)
        {
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = _1210 + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1294;
            float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1302 = 1.0 / _1296;
            float _1304 = _1292 * _1302;
            float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1278 = _1306;
            _1308 = true;
        }
        else
        {
            bool _1310 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1312 = isnan(_1210);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1318 = _1314 || _1316;
            if (!_1318)
            {
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1210 + _1320;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1332 = 1.0 / _1326;
                float _1334 = _1322 * _1332;
                float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1278 = _1336;
                _1308 = true;
            }
            else
            {
                _1278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1308 = false;
    float _1338 = _1278;
    float _1340 = fma(_486, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = floor(_1340);
    float _1346 = floor(_1342);
    float _1348 = -_1344;
    float _1350 = _1340 + _1348;
    float _1352 = -_1346;
    float _1354 = _1342 + _1352;
    float2 _3954 = float2(_1350, _1354);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3954, float2(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3954, float2(0.0), isnan(_3954)), level(0.0)).x;
    float _1358 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1362 = _1170 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1366 = _1172 + _1364;
    float _1368 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1370 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = fma(_1366, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1374 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1368);
    float _1376 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1376);
    float _1382 = 1.0 / _1378;
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1386 = _1384 + _1378;
    float _1388 = _1386 * _1382;
    float _1390 = _1388 * 0.5;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1394 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1392);
    float _1396 = 1.0 / _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1400 = _1396 * _1398;
    float _1402 = abs(_1400);
    float _1404 = log2(_1402);
    bool _1406 = _1400 <= 8000.0;
    bool _1408 = isnan(_1400);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(8000.0);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1164 + _1420;
    float _1424 = fma(_1422, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1426 = exp2(_1418);
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1430 = precise::clamp(_1428, 0.0, 1.0);
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1430, -2.0, 3.0);
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1362, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1440 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1442 = _1436 * _1434;
    float _1444 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1440);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1444);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1446);
    float _1456 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1470);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
    float _1486 = -_1442;
    float _1488 = _1486 + 1.0;
    float _1490 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1494 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1482);
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1484);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1442);
    float _1502 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1508 = in.m_63.x;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1424 + _1510;
    float _1514 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1518 = _1438 + _1516;
    float _1520 = _1416 * _1500;
    float _1522 = _1512 * _1512;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1372 + _1524;
    out.gl_Position.x = _1502;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1514;
    out.gl_Position.w = _1506;
    float _1528 = fma(_1518, _1518, _1522);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1532 = fma(_1526, _1526, _1528);
    float _1534 = sqrt(_1532);
    bool _1536 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1538 = isnan(_1534);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1544 = _1540 || _1542;
    float _1546 = _1514;
    float _1548 = _1506;
    float _1550 = _1504;
    float _1552 = _1502;
    if (!_1544)
    {
        _1546 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1554 = _1546;
    float _1556 = _1554;
    float _1558 = _1554;
    if (!_1544)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1560 = _1548;
    float _1562 = _1560;
    float _1564 = _1560;
    if (!_1544)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    float _1570 = _1566;
    if (!_1544)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1572 = _1552;
    float _1574 = -_1356;
    float _1576 = _1574 + 1.0;
    float _1578 = _1576 * _1530;
    float _1580 = precise::clamp(_1578, 0.0, 1.0);
    float _1582 = -_1580;
    float _1584 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1588 = _1572;
    float _1590 = _1572;
    if (!_1544)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1592 = _1586;
    float _1594 = _1584 * _1508;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1598 = _1594;
    float _1600 = _1592;
    float _1602 = _1592;
    if (!_1544)
    {
        _1598 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1604 = _1598;
    out.m_65.x = _1596;
    bool _1606 = !_1544;
    float _1608 = _1604;
    float _1610 = _1604;
    if (!_1606)
    {
        bool _1612 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1614 = isnan(_1534);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1620 = _1616 || _1618;
        if (!_1620)
        {
            float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1624 = _1534 + _1622;
            float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1626;
            float _1630 = 1.0 / _1628;
            float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1634 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1652 = _1624 * _1630;
            float _1654 = precise::clamp(_1652, 0.0, 1.0);
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1660 = fma(_1654, _1634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1662 = fma(_1654, _1658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1664 = fma(_1654, _1638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1666 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1668 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1670 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1602 = _1660;
            _1590 = _1668;
            _1558 = _1662;
            _1570 = _1666;
            _1564 = _1664;
            _1610 = _1670;
            _1672 = true;
        }
        else
        {
            bool _1674 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1676 = isnan(_1534);
            bool _1678 = _1674 || _1676;
            bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1682 = _1678 || _1680;
            if (!_1682)
            {
                _1556 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1684 = _1556;
            _1558 = _1684;
            if (!_1682)
            {
                _1600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1686 = _1600;
            _1602 = _1686;
            if (!_1682)
            {
                _1562 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1688 = _1562;
            _1564 = _1688;
            if (!_1682)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1690 = _1568;
            _1570 = _1690;
            if (!_1682)
            {
                _1588 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1692 = _1588;
            _1590 = _1692;
            if (!_1682)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1694 = _1608;
            bool _1696 = !_1682;
            _1610 = _1694;
            if (!_1696)
            {
                bool _1698 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1700 = isnan(_1534);
                bool _1702 = _1698 || _1700;
                bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1706 = _1702 || _1704;
                if (!_1706)
                {
                    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1710 = _1534 + _1708;
                    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1712;
                    float _1716 = 1.0 / _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1738 = _1710 * _1716;
                    float _1740 = precise::clamp(_1738, 0.0, 1.0);
                    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1744 = _1742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1746 = fma(_1740, _1720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1748 = fma(_1740, _1744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1750 = fma(_1740, _1724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1752 = fma(_1740, _1728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1754 = fma(_1740, _1732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1756 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1602 = _1746;
                    _1590 = _1754;
                    _1558 = _1748;
                    _1570 = _1752;
                    _1564 = _1750;
                    _1610 = _1756;
                    _1672 = true;
                }
                else
                {
                    _1602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1590 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1558 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1564 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1672 = false;
    float _1758 = _1602;
    float _1760 = _1590;
    float _1762 = _1558;
    float _1764 = _1570;
    float _1766 = _1564;
    float _1768 = _1610;
    float _1770 = fma(_1260, -0.5, 0.5);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -_1758;
    float _1776 = _1774 + _1760;
    float _1778 = -_1762;
    float _1780 = _1778 + _1764;
    float _1782 = -_1766;
    float _1784 = _1782 + _1768;
    bool _1786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1788 = fma(_1772, _1776, _1758);
    float _1790 = fma(_1772, _1780, _1762);
    float _1792 = fma(_1772, _1784, _1766);
    float _1794 = _1788 * 0.586610972881317138671875;
    out.m_42.x = 1.0;
    float _1796 = fma(_1790, 0.298911988735198974609375, _1794);
    float _1798 = fma(_1792, 0.114477999508380889892578125, _1796);
    out.m_67.x = 0.0;
    float _1800 = -_1798;
    float _1802 = _1790 + _1800;
    float _1804 = -_1798;
    float _1806 = _1788 + _1804;
    float _1808 = -_1798;
    float _1810 = _1792 + _1808;
    float _1812 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1816 = fma(_1806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    out.m_65.w = _1812;
    out.m_69.x = _1814;
    out.m_69.y = _1816;
    out.m_69.z = _1818;
    if (!_1786)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1820 = -_1424;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1824 = -_1438;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1828 = -_1372;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = sqrt(_1836);
    float _1840 = rsqrt(_1836);
    float _1842 = -_1838;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = _1826 * _1840;
    float _1852 = _1822 * _1840;
    float _1854 = abs(_1848);
    float _1856 = log2(_1854);
    float _1858 = _1830 * _1840;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1862 = _1260 * _1852;
    float _1864 = -_1852;
    float _1866 = -_1860;
    float _1868 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1866);
    float _1870 = fma(_1242, _1850, _1862);
    float _1872 = -_1858;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1868);
    float _1876 = fma(_1262, _1858, _1870);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1882 = _1874 + _1880;
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1886 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = exp2(_1884);
    float _1892 = _1890 * _1888;
    float _1894 = _1878 * _1892;
    float _1896 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1898 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1896;
    out.m_67.y = _1898;
    out.m_67.z = _1900;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1672 = false;
    bool _1308 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1957 = as_type<float>(_104);
        out.gl_Position.z = _1957;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_44.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_42.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_142);
        out.gl_Position.z = _2026;
    }
    if (_136)
    {
        return out;
    }
    float _144 = as_type<float>(int(gl_VertexIndex));
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _148 = as_type<int>(_144) & 1;
    bool _150 = _148 != 0;
    int _152 = as_type<int>(_144) & 2;
    bool _154 = _152 != 0;
    bool _156 = !_150;
    float _158 = _156 ? (-0.5) : 0.5;
    bool _160 = !_154;
    float _162 = _160 ? (-0.5) : 0.5;
    bool _164 = !_146;
    float _182;
    if (!_164)
    {
        float _166 = in.m_49.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_88);
        float _188 = 1.0 / _186;
        float _190 = _122 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_49.x;
    float _196 = in.m_49.y;
    float _198 = in.m_49.z;
    float _200 = in.m_49.w;
    float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _204 = log2(_202);
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _214 = _204 * _122;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _220 = _198 * 2.0;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _224 = _196 > 0.5;
    float _226 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _228 = _198 > 0.5;
    float _230 = fma(_222, -2.0, _206);
    float _232 = floor(_220);
    float _234 = _196 * 2.0;
    float _236 = -_158;
    int _238 = _224 ? as_type<int>(_236) : as_type<int>(_158);
    float _240 = _194 * 2.0;
    float _242 = -_212;
    float _244 = fma(_226, 2.0, _242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _248 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _250 = floor(_234);
    bool _252 = _232 > 0.0;
    float _254 = floor(_240);
    bool _256 = _232 >= 0.0;
    bool _258 = isnan(_232);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = -_162;
    int _268 = _228 ? as_type<int>(_266) : as_type<int>(_162);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    int _278 = _264 ? 0 : 1;
    float _280 = exp2(_214);
    bool _282 = !_272;
    float _284 = _282 ? _158 : as_type<float>(_238);
    bool _286 = !_276;
    float _288 = _286 ? _162 : as_type<float>(_268);
    float _290 = _196 + _194;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _302 = _300 != 0;
    int _304 = ~_278;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    float _310 = _290 + (-1.0);
    int _312 = _308;
    float _314 = _290;
    bool _316 = _298;
    int _318 = as_type<int>(_200);
    if (!_252)
    {
        int _320 = ~_278;
        int _322 = _320 + 1;
        _312 = _322;
    }
    int _324 = _312;
    float _326 = _198 + _194;
    bool _328 = !_294;
    int _330 = _328 ? 0 : 1;
    bool _332 = _250 > 0.0;
    float _334 = _326 + (-1.0);
    bool _336 = _250 >= 0.0;
    bool _338 = isnan(_250);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = -_280;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_210)
    {
        _314 = _198;
    }
    float _354 = _314;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _358 = _354;
    if (_210)
    {
        _358 = _196;
    }
    float _360 = _358;
    float _362 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _364 = _344 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _366 = !_302;
    int _368 = _366 ? 0 : 1;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _356);
    bool _372 = _254 > 0.0;
    bool _374 = _254 >= 0.0;
    bool _376 = isnan(_254);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = in.m_39.x;
    float _386 = in.m_39.y;
    float _388 = in.m_39.z;
    int _390 = ~as_type<int>(_364);
    int _392 = _390 + 1;
    int _394 = _392 + 1;
    int _396 = _394;
    float _398 = _364;
    if (!_332)
    {
        int _400 = ~as_type<int>(_364);
        int _402 = _400 + 1;
        _396 = _402;
    }
    int _404 = _396;
    if (!_210)
    {
        _398 = _196;
    }
    float _406 = _398;
    float _408 = _406;
    if (!_210)
    {
        _352 = _198;
    }
    float _410 = _352;
    float _412 = _410;
    if (_210)
    {
        _408 = _194;
    }
    float _414 = _408;
    if (_210)
    {
        _412 = _196;
    }
    float _416 = _412;
    int _418 = abs(_330);
    float _420 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[83].z, _216);
    int _422 = abs(_368);
    float _424 = _414 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _426 = _416 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = -_218;
    float _430 = fma(_424, 2.0, _428);
    float _432 = float(_324);
    float _434 = fma(_426, -2.0, _246);
    float _436 = float(_404);
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = float(_418);
    float _442 = -_122;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _244);
    float _446 = float(_422);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _450 = _440 * _432;
    float _452 = _446 * _436;
    float _454 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _460 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
    float _462 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _458);
    float _470 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _472 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _456);
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = _470 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _468);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _492 = _482 ? _348 : 0.0;
    float _494 = 1.0 / _466;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _486 + _496;
    float _500 = -_484;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _370);
    float _516 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _434);
    float _518 = _452 * (-2.0);
    float _520 = abs(_498);
    float _522 = abs(_502);
    float _524 = precise::max(_520, _522);
    float _526 = _450 * (-2.0);
    float _528 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _420);
    float _530 = fma(_350, _518, _350);
    bool _532 = _524 >= 16.0;
    float _534 = _194 + (-0.5);
    float _536 = -_122;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[81].x, _430);
    float _540 = fma(_362, _526, _362);
    int _542 = _382 ? 0 : 1;
    float _544 = _498;
    float _546 = _502;
    if (_512)
    {
        float _548 = _492 * _494;
        _126 = _548;
    }
    float _550 = _126;
    float _552 = _198 + (-0.5);
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _556 = ~_542;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = _196 + _198;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _566 = fma(_540, _550, _554);
    bool _568 = !_298;
    int _570 = _568 ? 0 : 1;
    int _572 = _560;
    if (_532)
    {
        float _574 = _498 * 0.0625;
        _544 = _574;
    }
    float _576 = _544;
    float _578 = fma(_530, _550, _564);
    if (!_372)
    {
        int _580 = ~_542;
        int _582 = _580 + 1;
        _572 = _582;
    }
    int _584 = _572;
    if (_532)
    {
        float _586 = _502 * 0.0625;
        _546 = _586;
    }
    float _588 = _546;
    int _590 = abs(_570);
    float _592 = _566 * 0.15915493667125701904296875;
    float _594 = abs(_576);
    bool _596 = _594 != 0.0;
    bool _598 = isnan(_594);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _562 + (-1.0);
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _610 = float(_584);
    float _612 = _196 + (-0.5);
    float _614 = float(_590);
    float _616 = in.m_51.x;
    float _618 = in.m_51.y;
    float _620 = abs(_588);
    bool _622 = _620 == 0.0;
    bool _624 = !_604;
    bool _626 = _622 && _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = abs(_588);
    bool _634 = _632 == 0.0;
    float _636 = _614 * _610;
    float _638 = _578 * 0.15915493667125701904296875;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = _636 * (-2.0);
    bool _646 = _200 > 0.5;
    float _648 = _612 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _650 = fma(_640, _644, _640);
    int _652 = as_type<int>(_648);
    if (_626)
    {
        bool _654 = as_type<int>(_588) >= 0;
        _316 = _654;
    }
    bool _656 = _316;
    float _658 = 1.0 / _630;
    float _660 = fma(_650, _550, _648);
    int _662 = _656 ? (-1) : 0;
    if (_626)
    {
        int _664 = _656 ? 0 : 1078530011;
        _318 = _664;
    }
    int _666 = _318;
    if (_626)
    {
        int _668 = int(0x80000000) & as_type<int>(_576);
        int _670 = _666 | _668;
        _652 = _670;
    }
    int _672 = _652;
    float _674 = _592 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _592 * 6.283185482025146484375;
    float _680 = cos(_678);
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    bool _686 = !_604;
    bool _688 = _686 && _634;
    int _690 = _672;
    float _692 = as_type<float>(_672);
    if (!_688)
    {
        float _694 = abs(_576);
        bool _696 = _694 != as_type<float>(0x7f800000u /* inf */);
        bool _698 = isnan(_694);
        bool _700 = _696 || _698;
        bool _702 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _704 = _700 || _702;
        float _706 = abs(_588);
        bool _708 = _706 == as_type<float>(0x7f800000u /* inf */);
        float _710 = abs(_588);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        bool _714 = !_704;
        bool _716 = _712 && _714;
        if (_716)
        {
            bool _718 = as_type<int>(_588) >= 0;
            _662 = _718 ? (-1) : 0;
        }
        int _720 = _662;
        if (_716)
        {
            _690 = 1075235812;
        }
        int _722 = _690;
        int _724 = _722;
        if (_716)
        {
            int _726 = ~_720;
            int _728 = (_726 != 0) ? _722 : 1061752795;
            _724 = _728;
        }
        int _730 = _724;
        float _732 = as_type<float>(_730);
        if (_716)
        {
            int _734 = int(0x80000000) & as_type<int>(_576);
            int _736 = _730 | _734;
            _732 = as_type<float>(_736);
        }
        float _738 = _732;
        bool _740 = !_704;
        bool _742 = _740 && _708;
        _692 = _738;
        if (!_742)
        {
            float _744 = abs(_576);
            float _746 = abs(_588);
            float _748 = precise::max(_744, _746);
            float _750 = abs(_576);
            float _752 = abs(_588);
            float _754 = precise::min(_750, _752);
            float _756 = 1.0 / _748;
            float _758 = abs(_576);
            float _760 = abs(_588);
            bool _762 = _758 > _760;
            bool _764 = as_type<int>(_588) >= 0;
            float _766 = _754 * _756;
            float _768 = _766 * _766;
            float _770 = _768 + 11.33538818359375;
            float _772 = fma(_768, _770, 28.84246826171875);
            float _774 = fma(_768, _772, 19.6966705322265625);
            float _776 = fma(_768, -0.82336294651031494140625, -5.674867153167724609375);
            float _778 = fma(_768, _776, -6.565555095672607421875);
            float _780 = 1.0 / _774;
            float _782 = _768 * _778;
            float _784 = abs(_576);
            float _786 = abs(_588);
            float _788 = _784 + _786;
            int _790 = as_type<int>(_576) & int(0x80000000);
            float _792 = _766 * _782;
            bool _794 = _788 > as_type<float>(0x7f800000u /* inf */);
            bool _796 = isnan(_788);
            bool _798 = _794 || _796;
            bool _800 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _802 = _798 || _800;
            float _804 = fma(_792, _780, _766);
            float _806 = _804;
            _692 = _788;
            if (_762)
            {
                float _808 = -_804;
                float _810 = _808 + 1.57079637050628662109375;
                _806 = _810;
            }
            float _812 = _806;
            int _814 = as_type<int>(_812);
            if (!_764)
            {
                float _816 = -_812;
                float _818 = _816 + 3.1415927410125732421875;
                _814 = as_type<int>(_818);
            }
            int _820 = _814;
            if (!_802)
            {
                int _822 = _790 | _820;
                _692 = as_type<float>(_822);
            }
        }
    }
    float _824 = _692;
    float _826 = _638 * 6.283185482025146484375;
    float _828 = cos(_826);
    bool _830 = _194 > 0.5;
    float _832 = -_824;
    float _834 = _660 + _832;
    float _836 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _844 = _834 * 0.15915493667125701904296875;
    float _846 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = _840 * _658;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _158);
    float _852 = _844 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _858 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = -_158;
    int _864 = _830 ? as_type<int>(_862) : as_type<int>(_158);
    float _866 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = _858 * _850;
    float _874 = _844 * 6.283185482025146484375;
    float _876 = sin(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = _860 * _856;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _890 = _192 + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _676 * _828;
    float _898 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _900 = _676 * _854;
    float _902 = -_882;
    float _904 = _684 * _902;
    float _906 = _854 * _828;
    float _908 = _896 * _882;
    float _910 = _680 * _854;
    bool _912 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_192);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_848, _890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _926 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_192);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _680 * _876;
    float _940 = _676 * _876;
    float _942 = _876 * _828;
    float _944 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _946 = -_938;
    float _948 = fma(_684, _900, _946);
    bool _950 = !_870;
    float _952 = _950 ? _158 : as_type<float>(_864);
    float _954 = fma(_906, _872, _904);
    float _956 = fma(_684, _940, _910);
    float _958 = fma(_948, _872, _908);
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = fma(_942, _944, _954);
    float _966 = _608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_956, _944, _958);
    float _970 = _922 * _962;
    float _972 = _486 + _964;
    float _974 = _952 + 0.5;
    float _976 = _484 + _968;
    float _978 = _924 * _970;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _972 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _976 + _986;
    float _990 = fma(_966, _974, _444);
    float _992 = -_162;
    int _994 = _224 ? as_type<int>(_992) : as_type<int>(_162);
    float _996 = _984 * _984;
    float _998 = _988 * _988;
    float _1000 = -_158;
    int _1002 = _228 ? as_type<int>(_1000) : as_type<int>(_158);
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1006 = !_880;
    float _1008 = _1006 ? _162 : as_type<float>(_994);
    float _1010 = _996 + _998;
    float _1012 = -_922;
    float _1014 = _1012 + 1.0;
    bool _1016 = !_894;
    float _1018 = _1016 ? _158 : as_type<float>(_1002);
    float _1020 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1022 = _1008 + (-0.5);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    float _1026 = sqrt(_1010);
    float _1028 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1030 = _1018 + 0.5;
    float _1032 = -_1020;
    float _1034 = -_248;
    float _1036 = fma(_1032, _1022, _1034);
    float _1038 = -_162;
    int _1040 = _646 ? as_type<int>(_1038) : as_type<int>(_162);
    float _1042 = _680 * _828;
    float _1044 = fma(_1028, _1030, _538);
    float _1046 = fma(_684, _910, _940);
    bool _1048 = !_886;
    float _1050 = _1048 ? _162 : as_type<float>(_1040);
    float _1052 = _1042 * _882;
    float _1054 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1056 = -_900;
    float _1058 = fma(_684, _938, _1056);
    float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1062 = _1050 + (-0.5);
    float _1064 = fma(_1046, _872, _1052);
    float _1066 = _898 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1068 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -_1054;
    float _1072 = -_516;
    float _1074 = fma(_1070, _1062, _1072);
    float _1076 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1024);
    float _1078 = fma(_1058, _944, _1064);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1082 = _162 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1084 = _158 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1086 = _1066 + _1078;
    float _1088 = -_1082;
    float _1090 = _684 * _1088;
    float _1092 = _896 * _1082;
    float _1094 = _1042 * _1082;
    float _1096 = fma(_906, _1084, _1090);
    float _1098 = _896;
    float _1100 = _996;
    float _1102 = _998;
    float _1104 = _972;
    float _1106 = _976;
    float _1108 = _956;
    if (!_1068)
    {
        _1098 = _1086;
    }
    float _1110 = _1098;
    bool _1112 = !_1068;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1026 + _1118;
        float _1122 = rsqrt(_1010);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1122 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_984, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_988, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1156 = _1146 + _1154;
        float _1158 = fma(_1086, _1136, _1148);
        float _1160 = _1152 * _1152;
        float _1162 = _1156 * _1156;
        _1114 = _1158;
        _1100 = _1160;
        _1102 = _1162;
        _1104 = _1144;
        _1106 = _1146;
    }
    float _1164 = _1114;
    float _1166 = _1100;
    float _1168 = _1102;
    float _1170 = _1104;
    float _1172 = _1106;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1176 = _1164 + _1174;
    float _1178 = _284 + 0.5;
    float _1180 = -_288;
    float _1182 = _1180 + 0.5;
    float _1184 = -_490;
    float _1186 = _1184 + 1.0;
    float _1188 = fma(_1176, _1176, _1166);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = -_514;
    float _1196 = _1194 + 1.0;
    float _1198 = _1188 + _1168;
    float _1200 = fma(_948, _1084, _1092);
    float _1202 = _1190 * _1060;
    float _1204 = _1192 * _1080;
    float _1206 = fma(_1008, _1186, _1036);
    float _1208 = fma(_1050, _1196, _1074);
    float _1210 = sqrt(_1198);
    float _1212 = -_488;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1046, _1084, _1094);
    float _1218 = -_528;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1234 = -_1214;
    float _1236 = fma(_952, _1234, _990);
    float _1238 = -_1220;
    float _1240 = fma(_1018, _1238, _1044);
    float _1242 = _942 + _1096;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1246 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1260 = _1058 + _1216;
    float _1262 = _956 + _1200;
    out.m_53.x = _1250;
    out.m_53.y = _1252;
    out.m_53.z = _1254;
    out.m_53.w = _1244;
    bool _1264 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1266 = isnan(_1210);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1272 = _1268 || _1270;
    out.m_55.x = _1202;
    out.m_55.y = _1204;
    out.m_57.x = _1246;
    out.m_57.y = _1248;
    out.m_57.z = _1256;
    out.m_57.w = _1258;
    out.m_59.x = _1236;
    out.m_59.y = _1206;
    out.m_59.z = _1240;
    out.m_59.w = _1208;
    if (!_1272)
    {
        _1108 = 1.0;
    }
    float _1274 = _1108;
    out.m_61.x = _1242;
    out.m_61.y = _1260;
    out.m_61.z = _1262;
    bool _1276 = !_1272;
    float _1278 = _1274;
    if (!_1276)
    {
        bool _1280 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1282 = isnan(_1210);
        bool _1284 = _1280 || _1282;
        bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1288 = _1284 || _1286;
        if (!_1288)
        {
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = _1210 + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1294;
            float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1302 = 1.0 / _1296;
            float _1304 = _1292 * _1302;
            float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1278 = _1306;
            _1308 = true;
        }
        else
        {
            bool _1310 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1312 = isnan(_1210);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1318 = _1314 || _1316;
            if (!_1318)
            {
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1210 + _1320;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1332 = 1.0 / _1326;
                float _1334 = _1322 * _1332;
                float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1278 = _1336;
                _1308 = true;
            }
            else
            {
                _1278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1308 = false;
    float _1338 = _1278;
    float _1340 = fma(_486, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = floor(_1340);
    float _1346 = floor(_1342);
    float _1348 = -_1344;
    float _1350 = _1340 + _1348;
    float _1352 = -_1346;
    float _1354 = _1342 + _1352;
    float2 _3954 = float2(_1350, _1354);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3954, float2(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3954, float2(0.0), isnan(_3954)), level(0.0)).x;
    float _1358 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1362 = _1170 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1366 = _1172 + _1364;
    float _1368 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1370 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = fma(_1366, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1374 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1368);
    float _1376 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1376);
    float _1382 = 1.0 / _1378;
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1386 = _1384 + _1378;
    float _1388 = _1386 * _1382;
    float _1390 = _1388 * 0.5;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1394 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1392);
    float _1396 = 1.0 / _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1400 = _1396 * _1398;
    float _1402 = abs(_1400);
    float _1404 = log2(_1402);
    bool _1406 = _1400 <= 8000.0;
    bool _1408 = isnan(_1400);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(8000.0);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1164 + _1420;
    float _1424 = fma(_1422, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1426 = exp2(_1418);
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1430 = precise::clamp(_1428, 0.0, 1.0);
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1430, -2.0, 3.0);
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1362, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1440 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1442 = _1436 * _1434;
    float _1444 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1440);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1444);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1446);
    float _1456 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1470);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
    float _1486 = -_1442;
    float _1488 = _1486 + 1.0;
    float _1490 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1494 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1482);
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1484);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1442);
    float _1502 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1508 = in.m_63.x;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1424 + _1510;
    float _1514 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1518 = _1438 + _1516;
    float _1520 = _1416 * _1500;
    float _1522 = _1512 * _1512;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1372 + _1524;
    out.gl_Position.x = _1502;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1514;
    out.gl_Position.w = _1506;
    float _1528 = fma(_1518, _1518, _1522);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1532 = fma(_1526, _1526, _1528);
    float _1534 = sqrt(_1532);
    bool _1536 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1538 = isnan(_1534);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1544 = _1540 || _1542;
    float _1546 = _1514;
    float _1548 = _1506;
    float _1550 = _1504;
    float _1552 = _1502;
    if (!_1544)
    {
        _1546 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1554 = _1546;
    float _1556 = _1554;
    float _1558 = _1554;
    if (!_1544)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1560 = _1548;
    float _1562 = _1560;
    float _1564 = _1560;
    if (!_1544)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    float _1570 = _1566;
    if (!_1544)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1572 = _1552;
    float _1574 = -_1356;
    float _1576 = _1574 + 1.0;
    float _1578 = _1576 * _1530;
    float _1580 = precise::clamp(_1578, 0.0, 1.0);
    float _1582 = -_1580;
    float _1584 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1588 = _1572;
    float _1590 = _1572;
    if (!_1544)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1592 = _1586;
    float _1594 = _1584 * _1508;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1598 = _1594;
    float _1600 = _1592;
    float _1602 = _1592;
    if (!_1544)
    {
        _1598 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1604 = _1598;
    out.m_65.x = _1596;
    bool _1606 = !_1544;
    float _1608 = _1604;
    float _1610 = _1604;
    if (!_1606)
    {
        bool _1612 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1614 = isnan(_1534);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1620 = _1616 || _1618;
        if (!_1620)
        {
            float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1624 = _1534 + _1622;
            float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1626;
            float _1630 = 1.0 / _1628;
            float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1634 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1652 = _1624 * _1630;
            float _1654 = precise::clamp(_1652, 0.0, 1.0);
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1660 = fma(_1654, _1634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1662 = fma(_1654, _1658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1664 = fma(_1654, _1638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1666 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1668 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1670 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1602 = _1660;
            _1590 = _1668;
            _1558 = _1662;
            _1570 = _1666;
            _1564 = _1664;
            _1610 = _1670;
            _1672 = true;
        }
        else
        {
            bool _1674 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1676 = isnan(_1534);
            bool _1678 = _1674 || _1676;
            bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1682 = _1678 || _1680;
            if (!_1682)
            {
                _1556 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1684 = _1556;
            _1558 = _1684;
            if (!_1682)
            {
                _1600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1686 = _1600;
            _1602 = _1686;
            if (!_1682)
            {
                _1562 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1688 = _1562;
            _1564 = _1688;
            if (!_1682)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1690 = _1568;
            _1570 = _1690;
            if (!_1682)
            {
                _1588 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1692 = _1588;
            _1590 = _1692;
            if (!_1682)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1694 = _1608;
            bool _1696 = !_1682;
            _1610 = _1694;
            if (!_1696)
            {
                bool _1698 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1700 = isnan(_1534);
                bool _1702 = _1698 || _1700;
                bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1706 = _1702 || _1704;
                if (!_1706)
                {
                    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1710 = _1534 + _1708;
                    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1712;
                    float _1716 = 1.0 / _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1738 = _1710 * _1716;
                    float _1740 = precise::clamp(_1738, 0.0, 1.0);
                    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1744 = _1742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1746 = fma(_1740, _1720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1748 = fma(_1740, _1744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1750 = fma(_1740, _1724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1752 = fma(_1740, _1728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1754 = fma(_1740, _1732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1756 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1602 = _1746;
                    _1590 = _1754;
                    _1558 = _1748;
                    _1570 = _1752;
                    _1564 = _1750;
                    _1610 = _1756;
                    _1672 = true;
                }
                else
                {
                    _1602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1590 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1558 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1564 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1672 = false;
    float _1758 = _1602;
    float _1760 = _1590;
    float _1762 = _1558;
    float _1764 = _1570;
    float _1766 = _1564;
    float _1768 = _1610;
    float _1770 = fma(_1260, -0.5, 0.5);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -_1758;
    float _1776 = _1774 + _1760;
    float _1778 = -_1762;
    float _1780 = _1778 + _1764;
    float _1782 = -_1766;
    float _1784 = _1782 + _1768;
    bool _1786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1788 = fma(_1772, _1776, _1758);
    float _1790 = fma(_1772, _1780, _1762);
    float _1792 = fma(_1772, _1784, _1766);
    float _1794 = _1788 * 0.586610972881317138671875;
    out.m_42.x = 1.0;
    float _1796 = fma(_1790, 0.298911988735198974609375, _1794);
    float _1798 = fma(_1792, 0.114477999508380889892578125, _1796);
    out.m_67.x = 0.0;
    float _1800 = -_1798;
    float _1802 = _1790 + _1800;
    float _1804 = -_1798;
    float _1806 = _1788 + _1804;
    float _1808 = -_1798;
    float _1810 = _1792 + _1808;
    float _1812 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1816 = fma(_1806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    out.m_65.w = _1812;
    out.m_69.x = _1814;
    out.m_69.y = _1816;
    out.m_69.z = _1818;
    if (!_1786)
    {
        return out;
    }
    float _1820 = -_1424;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1824 = -_1438;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1828 = -_1372;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = sqrt(_1836);
    float _1840 = rsqrt(_1836);
    float _1842 = -_1838;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = _1826 * _1840;
    float _1852 = _1822 * _1840;
    float _1854 = abs(_1848);
    float _1856 = log2(_1854);
    float _1858 = _1830 * _1840;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1862 = _1260 * _1852;
    float _1864 = -_1852;
    float _1866 = -_1860;
    float _1868 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1866);
    float _1870 = fma(_1242, _1850, _1862);
    float _1872 = -_1858;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1868);
    float _1876 = fma(_1262, _1858, _1870);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1882 = _1874 + _1880;
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1886 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = exp2(_1884);
    float _1892 = _1890 * _1888;
    float _1894 = _1878 * _1892;
    float _1896 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1898 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1896;
    out.m_67.y = _1898;
    out.m_67.z = _1900;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1672 = false;
    bool _1308 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1957 = as_type<float>(_104);
        out.gl_Position.z = _1957;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_44.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_42.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2026 = as_type<float>(_142);
        out.gl_Position.z = _2026;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = as_type<float>(int(gl_VertexIndex));
    bool _146 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _148 = as_type<int>(_144) & 1;
    bool _150 = _148 != 0;
    int _152 = as_type<int>(_144) & 2;
    bool _154 = _152 != 0;
    bool _156 = !_150;
    float _158 = _156 ? (-0.5) : 0.5;
    bool _160 = !_154;
    float _162 = _160 ? (-0.5) : 0.5;
    bool _164 = !_146;
    float _182;
    if (!_164)
    {
        float _166 = in.m_49.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_88);
        float _188 = 1.0 / _186;
        float _190 = _122 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_49.x;
    float _196 = in.m_49.y;
    float _198 = in.m_49.z;
    float _200 = in.m_49.w;
    float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _204 = log2(_202);
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _214 = _204 * _122;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _220 = _198 * 2.0;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _224 = _196 > 0.5;
    float _226 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _228 = _198 > 0.5;
    float _230 = fma(_222, -2.0, _206);
    float _232 = floor(_220);
    float _234 = _196 * 2.0;
    float _236 = -_158;
    int _238 = _224 ? as_type<int>(_236) : as_type<int>(_158);
    float _240 = _194 * 2.0;
    float _242 = -_212;
    float _244 = fma(_226, 2.0, _242);
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _248 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _230);
    float _250 = floor(_234);
    bool _252 = _232 > 0.0;
    float _254 = floor(_240);
    bool _256 = _232 >= 0.0;
    bool _258 = isnan(_232);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = -_162;
    int _268 = _228 ? as_type<int>(_266) : as_type<int>(_162);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    int _278 = _264 ? 0 : 1;
    float _280 = exp2(_214);
    bool _282 = !_272;
    float _284 = _282 ? _158 : as_type<float>(_238);
    bool _286 = !_276;
    float _288 = _286 ? _162 : as_type<float>(_268);
    float _290 = _196 + _194;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _302 = _300 != 0;
    int _304 = ~_278;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    float _310 = _290 + (-1.0);
    int _312 = _308;
    float _314 = _290;
    bool _316 = _298;
    int _318 = as_type<int>(_200);
    if (!_252)
    {
        int _320 = ~_278;
        int _322 = _320 + 1;
        _312 = _322;
    }
    int _324 = _312;
    float _326 = _198 + _194;
    bool _328 = !_294;
    int _330 = _328 ? 0 : 1;
    bool _332 = _250 > 0.0;
    float _334 = _326 + (-1.0);
    bool _336 = _250 >= 0.0;
    bool _338 = isnan(_250);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    float _346 = -_280;
    float _348 = _346 + 1.0;
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_210)
    {
        _314 = _198;
    }
    float _354 = _314;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _358 = _354;
    if (_210)
    {
        _358 = _196;
    }
    float _360 = _358;
    float _362 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _364 = _344 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _366 = !_302;
    int _368 = _366 ? 0 : 1;
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _356);
    bool _372 = _254 > 0.0;
    bool _374 = _254 >= 0.0;
    bool _376 = isnan(_254);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = in.m_39.x;
    float _386 = in.m_39.y;
    float _388 = in.m_39.z;
    int _390 = ~as_type<int>(_364);
    int _392 = _390 + 1;
    int _394 = _392 + 1;
    int _396 = _394;
    float _398 = _364;
    if (!_332)
    {
        int _400 = ~as_type<int>(_364);
        int _402 = _400 + 1;
        _396 = _402;
    }
    int _404 = _396;
    if (!_210)
    {
        _398 = _196;
    }
    float _406 = _398;
    float _408 = _406;
    if (!_210)
    {
        _352 = _198;
    }
    float _410 = _352;
    float _412 = _410;
    if (_210)
    {
        _408 = _194;
    }
    float _414 = _408;
    if (_210)
    {
        _412 = _196;
    }
    float _416 = _412;
    int _418 = abs(_330);
    float _420 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[83].z, _216);
    int _422 = abs(_368);
    float _424 = _414 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _426 = _416 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = -_218;
    float _430 = fma(_424, 2.0, _428);
    float _432 = float(_324);
    float _434 = fma(_426, -2.0, _246);
    float _436 = float(_404);
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = float(_418);
    float _442 = -_122;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _244);
    float _446 = float(_422);
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _450 = _440 * _432;
    float _452 = _446 * _436;
    float _454 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _460 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
    float _462 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _458);
    float _470 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _472 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _456);
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _486 = _470 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _468);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _492 = _482 ? _348 : 0.0;
    float _494 = 1.0 / _466;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _486 + _496;
    float _500 = -_484;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _370);
    float _516 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _434);
    float _518 = _452 * (-2.0);
    float _520 = abs(_498);
    float _522 = abs(_502);
    float _524 = precise::max(_520, _522);
    float _526 = _450 * (-2.0);
    float _528 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _420);
    float _530 = fma(_350, _518, _350);
    bool _532 = _524 >= 16.0;
    float _534 = _194 + (-0.5);
    float _536 = -_122;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[81].x, _430);
    float _540 = fma(_362, _526, _362);
    int _542 = _382 ? 0 : 1;
    float _544 = _498;
    float _546 = _502;
    if (_512)
    {
        float _548 = _492 * _494;
        _126 = _548;
    }
    float _550 = _126;
    float _552 = _198 + (-0.5);
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _556 = ~_542;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    float _562 = _196 + _198;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _566 = fma(_540, _550, _554);
    bool _568 = !_298;
    int _570 = _568 ? 0 : 1;
    int _572 = _560;
    if (_532)
    {
        float _574 = _498 * 0.0625;
        _544 = _574;
    }
    float _576 = _544;
    float _578 = fma(_530, _550, _564);
    if (!_372)
    {
        int _580 = ~_542;
        int _582 = _580 + 1;
        _572 = _582;
    }
    int _584 = _572;
    if (_532)
    {
        float _586 = _502 * 0.0625;
        _546 = _586;
    }
    float _588 = _546;
    int _590 = abs(_570);
    float _592 = _566 * 0.15915493667125701904296875;
    float _594 = abs(_576);
    bool _596 = _594 != 0.0;
    bool _598 = isnan(_594);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _562 + (-1.0);
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _610 = float(_584);
    float _612 = _196 + (-0.5);
    float _614 = float(_590);
    float _616 = in.m_51.x;
    float _618 = in.m_51.y;
    float _620 = abs(_588);
    bool _622 = _620 == 0.0;
    bool _624 = !_604;
    bool _626 = _622 && _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = abs(_588);
    bool _634 = _632 == 0.0;
    float _636 = _614 * _610;
    float _638 = _578 * 0.15915493667125701904296875;
    float _640 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = _636 * (-2.0);
    bool _646 = _200 > 0.5;
    float _648 = _612 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _650 = fma(_640, _644, _640);
    int _652 = as_type<int>(_648);
    if (_626)
    {
        bool _654 = as_type<int>(_588) >= 0;
        _316 = _654;
    }
    bool _656 = _316;
    float _658 = 1.0 / _630;
    float _660 = fma(_650, _550, _648);
    int _662 = _656 ? (-1) : 0;
    if (_626)
    {
        int _664 = _656 ? 0 : 1078530011;
        _318 = _664;
    }
    int _666 = _318;
    if (_626)
    {
        int _668 = int(0x80000000) & as_type<int>(_576);
        int _670 = _666 | _668;
        _652 = _670;
    }
    int _672 = _652;
    float _674 = _592 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _592 * 6.283185482025146484375;
    float _680 = cos(_678);
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    bool _686 = !_604;
    bool _688 = _686 && _634;
    int _690 = _672;
    float _692 = as_type<float>(_672);
    if (!_688)
    {
        float _694 = abs(_576);
        bool _696 = _694 != as_type<float>(0x7f800000u /* inf */);
        bool _698 = isnan(_694);
        bool _700 = _696 || _698;
        bool _702 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _704 = _700 || _702;
        float _706 = abs(_588);
        bool _708 = _706 == as_type<float>(0x7f800000u /* inf */);
        float _710 = abs(_588);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        bool _714 = !_704;
        bool _716 = _712 && _714;
        if (_716)
        {
            bool _718 = as_type<int>(_588) >= 0;
            _662 = _718 ? (-1) : 0;
        }
        int _720 = _662;
        if (_716)
        {
            _690 = 1075235812;
        }
        int _722 = _690;
        int _724 = _722;
        if (_716)
        {
            int _726 = ~_720;
            int _728 = (_726 != 0) ? _722 : 1061752795;
            _724 = _728;
        }
        int _730 = _724;
        float _732 = as_type<float>(_730);
        if (_716)
        {
            int _734 = int(0x80000000) & as_type<int>(_576);
            int _736 = _730 | _734;
            _732 = as_type<float>(_736);
        }
        float _738 = _732;
        bool _740 = !_704;
        bool _742 = _740 && _708;
        _692 = _738;
        if (!_742)
        {
            float _744 = abs(_576);
            float _746 = abs(_588);
            float _748 = precise::max(_744, _746);
            float _750 = abs(_576);
            float _752 = abs(_588);
            float _754 = precise::min(_750, _752);
            float _756 = 1.0 / _748;
            float _758 = abs(_576);
            float _760 = abs(_588);
            bool _762 = _758 > _760;
            bool _764 = as_type<int>(_588) >= 0;
            float _766 = _754 * _756;
            float _768 = _766 * _766;
            float _770 = _768 + 11.33538818359375;
            float _772 = fma(_768, _770, 28.84246826171875);
            float _774 = fma(_768, _772, 19.6966705322265625);
            float _776 = fma(_768, -0.82336294651031494140625, -5.674867153167724609375);
            float _778 = fma(_768, _776, -6.565555095672607421875);
            float _780 = 1.0 / _774;
            float _782 = _768 * _778;
            float _784 = abs(_576);
            float _786 = abs(_588);
            float _788 = _784 + _786;
            int _790 = as_type<int>(_576) & int(0x80000000);
            float _792 = _766 * _782;
            bool _794 = _788 > as_type<float>(0x7f800000u /* inf */);
            bool _796 = isnan(_788);
            bool _798 = _794 || _796;
            bool _800 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _802 = _798 || _800;
            float _804 = fma(_792, _780, _766);
            float _806 = _804;
            _692 = _788;
            if (_762)
            {
                float _808 = -_804;
                float _810 = _808 + 1.57079637050628662109375;
                _806 = _810;
            }
            float _812 = _806;
            int _814 = as_type<int>(_812);
            if (!_764)
            {
                float _816 = -_812;
                float _818 = _816 + 3.1415927410125732421875;
                _814 = as_type<int>(_818);
            }
            int _820 = _814;
            if (!_802)
            {
                int _822 = _790 | _820;
                _692 = as_type<float>(_822);
            }
        }
    }
    float _824 = _692;
    float _826 = _638 * 6.283185482025146484375;
    float _828 = cos(_826);
    bool _830 = _194 > 0.5;
    float _832 = -_824;
    float _834 = _660 + _832;
    float _836 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _844 = _834 * 0.15915493667125701904296875;
    float _846 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = _840 * _658;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _158);
    float _852 = _844 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _858 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _860 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = -_158;
    int _864 = _830 ? as_type<int>(_862) : as_type<int>(_158);
    float _866 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    float _872 = _858 * _850;
    float _874 = _844 * 6.283185482025146484375;
    float _876 = sin(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = _860 * _856;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _890 = _192 + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _676 * _828;
    float _898 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _866);
    float _900 = _676 * _854;
    float _902 = -_882;
    float _904 = _684 * _902;
    float _906 = _854 * _828;
    float _908 = _896 * _882;
    float _910 = _680 * _854;
    bool _912 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_192);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_848, _890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _926 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_192);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _680 * _876;
    float _940 = _676 * _876;
    float _942 = _876 * _828;
    float _944 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _946 = -_938;
    float _948 = fma(_684, _900, _946);
    bool _950 = !_870;
    float _952 = _950 ? _158 : as_type<float>(_864);
    float _954 = fma(_906, _872, _904);
    float _956 = fma(_684, _940, _910);
    float _958 = fma(_948, _872, _908);
    float _960 = -_936;
    float _962 = _960 + 1.0;
    float _964 = fma(_942, _944, _954);
    float _966 = _608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_956, _944, _958);
    float _970 = _922 * _962;
    float _972 = _486 + _964;
    float _974 = _952 + 0.5;
    float _976 = _484 + _968;
    float _978 = _924 * _970;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _972 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _976 + _986;
    float _990 = fma(_966, _974, _444);
    float _992 = -_162;
    int _994 = _224 ? as_type<int>(_992) : as_type<int>(_162);
    float _996 = _984 * _984;
    float _998 = _988 * _988;
    float _1000 = -_158;
    int _1002 = _228 ? as_type<int>(_1000) : as_type<int>(_158);
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1006 = !_880;
    float _1008 = _1006 ? _162 : as_type<float>(_994);
    float _1010 = _996 + _998;
    float _1012 = -_922;
    float _1014 = _1012 + 1.0;
    bool _1016 = !_894;
    float _1018 = _1016 ? _158 : as_type<float>(_1002);
    float _1020 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1022 = _1008 + (-0.5);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    float _1026 = sqrt(_1010);
    float _1028 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1030 = _1018 + 0.5;
    float _1032 = -_1020;
    float _1034 = -_248;
    float _1036 = fma(_1032, _1022, _1034);
    float _1038 = -_162;
    int _1040 = _646 ? as_type<int>(_1038) : as_type<int>(_162);
    float _1042 = _680 * _828;
    float _1044 = fma(_1028, _1030, _538);
    float _1046 = fma(_684, _910, _940);
    bool _1048 = !_886;
    float _1050 = _1048 ? _162 : as_type<float>(_1040);
    float _1052 = _1042 * _882;
    float _1054 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1056 = -_900;
    float _1058 = fma(_684, _938, _1056);
    float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1062 = _1050 + (-0.5);
    float _1064 = fma(_1046, _872, _1052);
    float _1066 = _898 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1068 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -_1054;
    float _1072 = -_516;
    float _1074 = fma(_1070, _1062, _1072);
    float _1076 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1024);
    float _1078 = fma(_1058, _944, _1064);
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1082 = _162 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1084 = _158 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1086 = _1066 + _1078;
    float _1088 = -_1082;
    float _1090 = _684 * _1088;
    float _1092 = _896 * _1082;
    float _1094 = _1042 * _1082;
    float _1096 = fma(_906, _1084, _1090);
    float _1098 = _896;
    float _1100 = _996;
    float _1102 = _998;
    float _1104 = _972;
    float _1106 = _976;
    float _1108 = _956;
    if (!_1068)
    {
        _1098 = _1086;
    }
    float _1110 = _1098;
    bool _1112 = !_1068;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1026 + _1118;
        float _1122 = rsqrt(_1010);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = fma(_1132, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1140 = _1122 * _1138;
        float _1142 = _1136 + (-1.0);
        float _1144 = fma(_984, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = fma(_988, _1140, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1148 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1156 = _1146 + _1154;
        float _1158 = fma(_1086, _1136, _1148);
        float _1160 = _1152 * _1152;
        float _1162 = _1156 * _1156;
        _1114 = _1158;
        _1100 = _1160;
        _1102 = _1162;
        _1104 = _1144;
        _1106 = _1146;
    }
    float _1164 = _1114;
    float _1166 = _1100;
    float _1168 = _1102;
    float _1170 = _1104;
    float _1172 = _1106;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1176 = _1164 + _1174;
    float _1178 = _284 + 0.5;
    float _1180 = -_288;
    float _1182 = _1180 + 0.5;
    float _1184 = -_490;
    float _1186 = _1184 + 1.0;
    float _1188 = fma(_1176, _1176, _1166);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1192 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1194 = -_514;
    float _1196 = _1194 + 1.0;
    float _1198 = _1188 + _1168;
    float _1200 = fma(_948, _1084, _1092);
    float _1202 = _1190 * _1060;
    float _1204 = _1192 * _1080;
    float _1206 = fma(_1008, _1186, _1036);
    float _1208 = fma(_1050, _1196, _1074);
    float _1210 = sqrt(_1198);
    float _1212 = -_488;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1046, _1084, _1094);
    float _1218 = -_528;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1234 = -_1214;
    float _1236 = fma(_952, _1234, _990);
    float _1238 = -_1220;
    float _1240 = fma(_1018, _1238, _1044);
    float _1242 = _942 + _1096;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1246 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1254 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1258 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1260 = _1058 + _1216;
    float _1262 = _956 + _1200;
    out.m_53.x = _1250;
    out.m_53.y = _1252;
    out.m_53.z = _1254;
    out.m_53.w = _1244;
    bool _1264 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1266 = isnan(_1210);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1272 = _1268 || _1270;
    out.m_55.x = _1202;
    out.m_55.y = _1204;
    out.m_57.x = _1246;
    out.m_57.y = _1248;
    out.m_57.z = _1256;
    out.m_57.w = _1258;
    out.m_59.x = _1236;
    out.m_59.y = _1206;
    out.m_59.z = _1240;
    out.m_59.w = _1208;
    if (!_1272)
    {
        _1108 = 1.0;
    }
    float _1274 = _1108;
    out.m_61.x = _1242;
    out.m_61.y = _1260;
    out.m_61.z = _1262;
    bool _1276 = !_1272;
    float _1278 = _1274;
    if (!_1276)
    {
        bool _1280 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1282 = isnan(_1210);
        bool _1284 = _1280 || _1282;
        bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1288 = _1284 || _1286;
        if (!_1288)
        {
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = _1210 + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1294;
            float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1302 = 1.0 / _1296;
            float _1304 = _1292 * _1302;
            float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1278 = _1306;
            _1308 = true;
        }
        else
        {
            bool _1310 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1312 = isnan(_1210);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1318 = _1314 || _1316;
            if (!_1318)
            {
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1210 + _1320;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1330 = _1328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1332 = 1.0 / _1326;
                float _1334 = _1322 * _1332;
                float _1336 = fma(_1334, _1330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1278 = _1336;
                _1308 = true;
            }
            else
            {
                _1278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1308 = false;
    float _1338 = _1278;
    float _1340 = fma(_486, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1342 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = floor(_1340);
    float _1346 = floor(_1342);
    float _1348 = -_1344;
    float _1350 = _1340 + _1348;
    float _1352 = -_1346;
    float _1354 = _1342 + _1352;
    float2 _3954 = float2(_1350, _1354);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3954, float2(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3954, float2(0.0), isnan(_3954)), level(0.0)).x;
    float _1358 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1362 = _1170 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1366 = _1172 + _1364;
    float _1368 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1358);
    float _1370 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = fma(_1366, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1374 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1368);
    float _1376 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1380 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1376);
    float _1382 = 1.0 / _1378;
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1386 = _1384 + _1378;
    float _1388 = _1386 * _1382;
    float _1390 = _1388 * 0.5;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1394 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1392);
    float _1396 = 1.0 / _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1400 = _1396 * _1398;
    float _1402 = abs(_1400);
    float _1404 = log2(_1402);
    bool _1406 = _1400 <= 8000.0;
    bool _1408 = isnan(_1400);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(8000.0);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1422 = _1164 + _1420;
    float _1424 = fma(_1422, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1426 = exp2(_1418);
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1430 = precise::clamp(_1428, 0.0, 1.0);
    float _1432 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1430, -2.0, 3.0);
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1362, _1338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1440 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1442 = _1436 * _1434;
    float _1444 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1440);
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1444);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1446);
    float _1456 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1450);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1468 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1470);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1476);
    float _1486 = -_1442;
    float _1488 = _1486 + 1.0;
    float _1490 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1492 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1478);
    float _1494 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1496 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1482);
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1484);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1442);
    float _1502 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1498);
    float _1508 = in.m_63.x;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1424 + _1510;
    float _1514 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1496);
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1518 = _1438 + _1516;
    float _1520 = _1416 * _1500;
    float _1522 = _1512 * _1512;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1372 + _1524;
    out.gl_Position.x = _1502;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1514;
    out.gl_Position.w = _1506;
    float _1528 = fma(_1518, _1518, _1522);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1532 = fma(_1526, _1526, _1528);
    float _1534 = sqrt(_1532);
    bool _1536 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1538 = isnan(_1534);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1544 = _1540 || _1542;
    float _1546 = _1514;
    float _1548 = _1506;
    float _1550 = _1504;
    float _1552 = _1502;
    if (!_1544)
    {
        _1546 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1554 = _1546;
    float _1556 = _1554;
    float _1558 = _1554;
    if (!_1544)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1560 = _1548;
    float _1562 = _1560;
    float _1564 = _1560;
    if (!_1544)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    float _1570 = _1566;
    if (!_1544)
    {
        _1552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1572 = _1552;
    float _1574 = -_1356;
    float _1576 = _1574 + 1.0;
    float _1578 = _1576 * _1530;
    float _1580 = precise::clamp(_1578, 0.0, 1.0);
    float _1582 = -_1580;
    float _1584 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1588 = _1572;
    float _1590 = _1572;
    if (!_1544)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1592 = _1586;
    float _1594 = _1584 * _1508;
    float _1596 = _1594 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1598 = _1594;
    float _1600 = _1592;
    float _1602 = _1592;
    if (!_1544)
    {
        _1598 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1604 = _1598;
    out.m_65.x = _1596;
    bool _1606 = !_1544;
    float _1608 = _1604;
    float _1610 = _1604;
    if (!_1606)
    {
        bool _1612 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1614 = isnan(_1534);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1620 = _1616 || _1618;
        if (!_1620)
        {
            float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1624 = _1534 + _1622;
            float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1626;
            float _1630 = 1.0 / _1628;
            float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1634 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1652 = _1624 * _1630;
            float _1654 = precise::clamp(_1652, 0.0, 1.0);
            float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1658 = _1656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1660 = fma(_1654, _1634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1662 = fma(_1654, _1658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1664 = fma(_1654, _1638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1666 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1668 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1670 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1602 = _1660;
            _1590 = _1668;
            _1558 = _1662;
            _1570 = _1666;
            _1564 = _1664;
            _1610 = _1670;
            _1672 = true;
        }
        else
        {
            bool _1674 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1676 = isnan(_1534);
            bool _1678 = _1674 || _1676;
            bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1682 = _1678 || _1680;
            if (!_1682)
            {
                _1556 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1684 = _1556;
            _1558 = _1684;
            if (!_1682)
            {
                _1600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1686 = _1600;
            _1602 = _1686;
            if (!_1682)
            {
                _1562 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1688 = _1562;
            _1564 = _1688;
            if (!_1682)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1690 = _1568;
            _1570 = _1690;
            if (!_1682)
            {
                _1588 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1692 = _1588;
            _1590 = _1692;
            if (!_1682)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1694 = _1608;
            bool _1696 = !_1682;
            _1610 = _1694;
            if (!_1696)
            {
                bool _1698 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1700 = isnan(_1534);
                bool _1702 = _1698 || _1700;
                bool _1704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1706 = _1702 || _1704;
                if (!_1706)
                {
                    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1710 = _1534 + _1708;
                    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1712;
                    float _1716 = 1.0 / _1714;
                    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1736 = _1734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1738 = _1710 * _1716;
                    float _1740 = precise::clamp(_1738, 0.0, 1.0);
                    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1744 = _1742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1746 = fma(_1740, _1720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1748 = fma(_1740, _1744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1750 = fma(_1740, _1724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1752 = fma(_1740, _1728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1754 = fma(_1740, _1732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1756 = fma(_1740, _1736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1602 = _1746;
                    _1590 = _1754;
                    _1558 = _1748;
                    _1570 = _1752;
                    _1564 = _1750;
                    _1610 = _1756;
                    _1672 = true;
                }
                else
                {
                    _1602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1590 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1558 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1564 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1672 = false;
    float _1758 = _1602;
    float _1760 = _1590;
    float _1762 = _1558;
    float _1764 = _1570;
    float _1766 = _1564;
    float _1768 = _1610;
    float _1770 = fma(_1260, -0.5, 0.5);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = -_1758;
    float _1776 = _1774 + _1760;
    float _1778 = -_1762;
    float _1780 = _1778 + _1764;
    float _1782 = -_1766;
    float _1784 = _1782 + _1768;
    bool _1786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1788 = fma(_1772, _1776, _1758);
    float _1790 = fma(_1772, _1780, _1762);
    float _1792 = fma(_1772, _1784, _1766);
    float _1794 = _1788 * 0.586610972881317138671875;
    out.m_42.x = 1.0;
    float _1796 = fma(_1790, 0.298911988735198974609375, _1794);
    float _1798 = fma(_1792, 0.114477999508380889892578125, _1796);
    out.m_67.x = 0.0;
    float _1800 = -_1798;
    float _1802 = _1790 + _1800;
    float _1804 = -_1798;
    float _1806 = _1788 + _1804;
    float _1808 = -_1798;
    float _1810 = _1792 + _1808;
    float _1812 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1816 = fma(_1806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1798);
    out.m_65.w = _1812;
    out.m_69.x = _1814;
    out.m_69.y = _1816;
    out.m_69.z = _1818;
    if (!_1786)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1820 = -_1424;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1824 = -_1438;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1828 = -_1372;
    float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = sqrt(_1836);
    float _1840 = rsqrt(_1836);
    float _1842 = -_1838;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1848 = precise::clamp(_1846, 0.0, 1.0);
    float _1850 = _1826 * _1840;
    float _1852 = _1822 * _1840;
    float _1854 = abs(_1848);
    float _1856 = log2(_1854);
    float _1858 = _1830 * _1840;
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1862 = _1260 * _1852;
    float _1864 = -_1852;
    float _1866 = -_1860;
    float _1868 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1866);
    float _1870 = fma(_1242, _1850, _1862);
    float _1872 = -_1858;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1868);
    float _1876 = fma(_1262, _1858, _1870);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1882 = _1874 + _1880;
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1886 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = exp2(_1884);
    float _1892 = _1890 * _1888;
    float _1894 = _1878 * _1892;
    float _1896 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1898 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1896;
    out.m_67.y = _1898;
    out.m_67.z = _1900;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

