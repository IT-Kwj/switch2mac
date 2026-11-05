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
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(0)]];
    float4 m_39 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_46 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1138 = false;
    bool _774 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_39.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_42.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_102);
        out.gl_Position.z = _1423;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    if (_116)
    {
        float _124 = float(_86);
        _122 = _124;
    }
    float _126 = _122;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    if (_132)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_132)
    {
        out.m_42.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1491 = as_type<float>(_138);
        out.gl_Position.z = _1491;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_46.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _148 = _146 != 0;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _152 = _150 != 0;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _144 * _142;
    float _160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _162 = _160 * 6.283185482025146484375;
    float _164 = floor(_160);
    float _166 = _162 * 0.15915493667125701904296875;
    bool _168 = !_148;
    int _170 = _168 ? 0 : 1;
    int _172 = abs(_170);
    float _174 = _166 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_156;
    int _180 = _178 ? 0 : 1;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _184 = abs(_180);
    float _186 = -_164;
    float _188 = _160 + _186;
    bool _190 = !_152;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = -_188;
    float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _200 = float(_172);
    float _202 = fma(_176, 0.5, 0.5);
    bool _204 = _188 < 0.5;
    float _206 = float(_204);
    float _208 = abs(_198);
    float _210 = _200 * _208;
    float _212 = float(_184);
    float _214 = -_202;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _218 = float(_194);
    float _220 = -_206;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = fma(_212, _216, _210);
    float _226 = abs(_222);
    float _228 = fma(_218, _226, _224);
    bool _230 = !_182;
    float _246;
    if (!_230)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _140 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_86);
        float _252 = 1.0 / _250;
        float _254 = _120 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = in.m_39.x;
    float _260 = in.m_39.y;
    float _262 = in.m_39.z;
    float _264 = as_type<float>(int(gl_VertexIndex));
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _276 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_256);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _290 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _292 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    int _294 = as_type<int>(_264) & 1;
    bool _296 = _294 != 0;
    int _298 = as_type<int>(_264) & 2;
    bool _300 = _298 != 0;
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _304 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _306 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    bool _308 = _140 > 0.5;
    float _310 = _302 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _312 = _304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = 1.0 / _268;
    float _318 = -_310;
    float _320 = _318 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _322 = -_312;
    float _324 = _322 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _326 = -_314;
    float _328 = _326 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _256 + _330;
    float _334 = _320 * _320;
    float _336 = fma(_324, _324, _334);
    float _338 = fma(_328, _328, _336);
    float _340 = _332 * _316;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = rsqrt(_338);
    float _356 = in.m_51.x;
    float _358 = in.m_51.y;
    float _360 = _324 * _354;
    float _362 = _320 * _354;
    float _364 = _328 * _354;
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _368 = _360 * _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _376 = _364 * _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _380 = _362 * _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _384 = -_368;
    float _386 = fma(_364, _382, _384);
    float _388 = -_352;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _394 = -_376;
    float _396 = fma(_362, _392, _394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = _386 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _406 = -_380;
    float _408 = fma(_360, _404, _406);
    float _410 = fma(_372, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _286 * _390;
    float _414 = fma(_396, _396, _402);
    float _416 = fma(_400, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -_286;
    float _420 = _418 + 1.0;
    float _422 = _410 * _412;
    float _424 = fma(_408, _408, _414);
    float _426 = _416 * _412;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _432 = rsqrt(_424);
    float _434 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _436 = !_300;
    float _438 = _436 ? (-0.5) : 0.5;
    float _440 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _430);
    float _442 = _434 * _358;
    float _444 = _440 * _356;
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _438);
    float _448 = _228 * _442;
    float _450 = _228 * _444;
    float _452 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _454 = !_296;
    float _456 = _454 ? (-0.5) : 0.5;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _386 * _432;
    float _462 = _396 * _432;
    float _464 = _452 * _446;
    float _466 = _408 * _432;
    float _468 = _364 * _460;
    float _470 = _362 * _462;
    float _472 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _456);
    float _474 = -_468;
    float _476 = fma(_362, _466, _474);
    float _478 = -_470;
    float _480 = fma(_360, _460, _478);
    float _482 = _458 * _472;
    float _484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _486 = _464 * _476;
    float _488 = _464 * _480;
    float _490 = in.m_46.y;
    float _492 = fma(_482, _462, _486);
    float _494 = fma(_482, _466, _488);
    float _496 = fma(_484, _360, _492);
    float _498 = fma(_484, _364, _494);
    float _500 = _360 * _466;
    float _502 = _312 + _496;
    float _504 = _314 + _498;
    float _506 = -_500;
    float _508 = fma(_364, _462, _506);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _512 = _502 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _516 = _504 + _514;
    float _518 = _464 * _508;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _522 = _520 != 0;
    float _524 = _512 * _512;
    float _526 = _516 * _516;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_482, _460, _518);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _536 = _524 + _526;
    bool _538 = _490 > 0.5;
    float _540 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _542 = fma(_484, _362, _532);
    float _544 = -_456;
    float _546 = _308 ? _544 : _456;
    float _548 = _456 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _550 = -_438;
    int _552 = _538 ? as_type<int>(_550) : as_type<int>(_438);
    float _554 = sqrt(_536);
    float _556 = _540 * _476;
    float _558 = _310 + _542;
    bool _560 = !_530;
    float _562 = _560 ? _438 : as_type<float>(_552);
    float _564 = _540 * _508;
    bool _566 = !_522;
    float _568 = _566 ? _456 : _546;
    float _570 = _540 * _480;
    float _572 = fma(_548, _462, _556);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _576 = _554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = _456;
    float _580 = _546;
    float _582 = _540;
    float _584 = _462;
    float _586 = _532;
    float _588 = _572;
    if (!_576)
    {
        _578 = _526;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_576)
    {
        _580 = _524;
    }
    float _594 = _580;
    float _596 = _594;
    if (!_576)
    {
        _582 = _502;
    }
    float _598 = _582;
    float _600 = _598;
    if (!_576)
    {
        _584 = _504;
    }
    float _602 = _584;
    float _604 = _602;
    if (!_576)
    {
        _586 = _558;
    }
    float _606 = _586;
    bool _608 = !_576;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _554 + _614;
        float _618 = _558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = rsqrt(_536);
        float _622 = _616 * _612;
        float _624 = _622 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = sin(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = fma(_628, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _620 * _634;
        float _638 = _632 + (-1.0);
        float _640 = fma(_512, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _642 = fma(_516, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _644 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _648 = _640 + _646;
        float _650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _652 = _642 + _650;
        float _654 = fma(_558, _632, _644);
        float _656 = _648 * _648;
        float _658 = _652 * _652;
        _610 = _654;
        _596 = _656;
        _592 = _658;
        _604 = _642;
        _600 = _640;
    }
    float _660 = _610;
    float _662 = _596;
    float _664 = _592;
    float _666 = _604;
    float _668 = _600;
    float _670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _672 = _660 + _670;
    float _674 = -_562;
    float _676 = _674 + 0.5;
    float _678 = _568 + 0.5;
    float _680 = fma(_548, _460, _564);
    float _682 = fma(_672, _672, _662);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _688 = fma(_548, _466, _570);
    float _690 = _682 + _664;
    float _692 = _684 * _534;
    float _694 = _360 + _572;
    float _696 = _686 * _574;
    float _698 = sqrt(_690);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _362 + _680;
    float _728 = _364 + _688;
    out.m_53.x = _712;
    out.m_53.y = _716;
    out.m_53.z = _718;
    out.m_53.w = _714;
    bool _730 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _732 = isnan(_698);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _738 = _734 || _736;
    out.m_55.x = _720;
    out.m_55.y = _722;
    out.m_55.z = _724;
    out.m_57.x = _696;
    out.m_57.y = _692;
    out.m_59.x = _694;
    out.m_59.y = _726;
    out.m_59.z = _728;
    if (!_738)
    {
        _588 = 1.0;
    }
    float _740 = _588;
    bool _742 = !_738;
    float _744 = _740;
    if (!_742)
    {
        bool _746 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _748 = isnan(_698);
        bool _750 = _746 || _748;
        bool _752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _754 = _750 || _752;
        if (!_754)
        {
            float _756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _758 = _698 + _756;
            float _760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _760;
            float _764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _766 = _764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _768 = 1.0 / _762;
            float _770 = _758 * _768;
            float _772 = fma(_770, _766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _744 = _772;
            _774 = true;
        }
        else
        {
            bool _776 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _778 = isnan(_698);
            bool _780 = _776 || _778;
            bool _782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _784 = _780 || _782;
            if (!_784)
            {
                float _786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _788 = _698 + _786;
                float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _792 = _790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _796 = _794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _798 = 1.0 / _792;
                float _800 = _788 * _798;
                float _802 = fma(_800, _796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _744 = _802;
                _774 = true;
            }
            else
            {
                _744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _774 = false;
    float _804 = _744;
    float _806 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _808 = fma(_314, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _810 = floor(_806);
    float _812 = floor(_808);
    float _814 = -_810;
    float _816 = _806 + _814;
    float _818 = -_812;
    float _820 = _808 + _818;
    float2 _2613 = float2(_816, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2613, float2(0.0), isnan(_2613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2613, float2(0.0), isnan(_2613)), level(0.0)).x;
    float _824 = _310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _826 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _824);
    float _828 = _310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _830 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _828);
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _840 = _666 + _838;
    float _842 = 1.0 / _834;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _834;
    float _848 = _846 * _842;
    float _850 = _848 * 0.5;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _852);
    float _856 = 1.0 / _854;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _860 = _856 * _858;
    float _862 = fma(_840, _804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _864 = abs(_860);
    float _866 = log2(_864);
    bool _868 = _860 <= 8000.0;
    bool _870 = isnan(_860);
    bool _872 = _868 || _870;
    bool _874 = isnan(8000.0);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _866 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _884 = _660 + _882;
    float _886 = fma(_884, _804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _888 = exp2(_880);
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _896 = _668 + _894;
    float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = fma(_892, -2.0, 3.0);
    float _902 = _892 * _892;
    float _904 = fma(_896, _804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _908 = _902 * _900;
    float _910 = _886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _906);
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _916 = _886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _910);
    float _922 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _916);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[2].z, _920);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _932 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _942 = _928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].x, _934);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].x, _938);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].x, _940);
    float _952 = -_908;
    float _954 = _952 + 1.0;
    float _956 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].z, _944);
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].z, _948);
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].z, _950);
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[654].w, _908);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _958);
    float _970 = in.m_61.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _886 + _972;
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _962);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _960);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _964);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _904 + _982;
    float _986 = _974 * _974;
    float _988 = _878 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _862 + _990;
    out.gl_Position.x = _978;
    out.gl_Position.y = _976;
    out.gl_Position.z = _980;
    out.gl_Position.w = _968;
    float _994 = fma(_984, _984, _986);
    float _996 = _988 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _998 = fma(_992, _992, _994);
    float _1000 = sqrt(_998);
    bool _1002 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1004 = isnan(_1000);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1010 = _1006 || _1008;
    float _1012 = _968;
    float _1014 = _980;
    float _1016 = _976;
    float _1018 = _978;
    if (!_1010)
    {
        _1012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    float _1024 = _1020;
    if (!_1010)
    {
        _1014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    float _1030 = _1026;
    if (!_1010)
    {
        _1016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1032 = _1016;
    float _1034 = _1032;
    float _1036 = _1032;
    if (!_1010)
    {
        _1018 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1038 = _1018;
    float _1040 = -_822;
    float _1042 = _1040 + 1.0;
    float _1044 = _1042 * _996;
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = -_1046;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1054 = _1038;
    float _1056 = _1038;
    if (!_1010)
    {
        _1052 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1058 = _1052;
    float _1060 = _1050 * _970;
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1058;
    if (!_1010)
    {
        _1064 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1070 = _1064;
    out.m_63.x = _1062;
    bool _1072 = !_1010;
    float _1074 = _1070;
    float _1076 = _1070;
    if (!_1072)
    {
        bool _1078 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1080 = isnan(_1000);
        bool _1082 = _1078 || _1080;
        bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1086 = _1082 || _1084;
        if (!_1086)
        {
            float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1090 = _1000 + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1092;
            float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1098 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1100 = 1.0 / _1094;
            float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1108 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1112 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1118 = _1090 * _1100;
            float _1120 = precise::clamp(_1118, 0.0, 1.0);
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1126 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1128 = fma(_1120, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1130 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1132 = fma(_1120, _1108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1134 = fma(_1120, _1112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1136 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1024 = _1126;
            _1056 = _1134;
            _1068 = _1130;
            _1036 = _1132;
            _1030 = _1128;
            _1076 = _1136;
            _1138 = true;
        }
        else
        {
            bool _1140 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1142 = isnan(_1000);
            bool _1144 = _1140 || _1142;
            bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1148 = _1144 || _1146;
            if (!_1148)
            {
                _1066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1150 = _1066;
            _1068 = _1150;
            if (!_1148)
            {
                _1022 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1152 = _1022;
            _1024 = _1152;
            if (!_1148)
            {
                _1028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1154 = _1028;
            _1030 = _1154;
            if (!_1148)
            {
                _1034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1156 = _1034;
            _1036 = _1156;
            if (!_1148)
            {
                _1054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1158 = _1054;
            _1056 = _1158;
            if (!_1148)
            {
                _1074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1160 = _1074;
            bool _1162 = !_1148;
            _1076 = _1160;
            if (!_1162)
            {
                bool _1164 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1166 = isnan(_1000);
                bool _1168 = _1164 || _1166;
                bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1172 = _1168 || _1170;
                if (!_1172)
                {
                    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1176 = _1000 + _1174;
                    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1178;
                    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1186 = 1.0 / _1180;
                    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1190 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1198 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1204 = _1176 * _1186;
                    float _1206 = precise::clamp(_1204, 0.0, 1.0);
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1212 = fma(_1206, _1184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1214 = fma(_1206, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1216 = fma(_1206, _1190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1218 = fma(_1206, _1194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1220 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1222 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1024 = _1212;
                    _1056 = _1220;
                    _1068 = _1216;
                    _1036 = _1218;
                    _1030 = _1214;
                    _1076 = _1222;
                    _1138 = true;
                }
                else
                {
                    _1024 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1138 = false;
    float _1224 = _1024;
    float _1226 = _1056;
    float _1228 = _1068;
    float _1230 = _1036;
    float _1232 = _1030;
    float _1234 = _1076;
    float _1236 = fma(_726, -0.5, 0.5);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1224;
    float _1242 = _1240 + _1226;
    float _1244 = -_1228;
    float _1246 = _1244 + _1230;
    float _1248 = -_1232;
    float _1250 = _1248 + _1234;
    bool _1252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1254 = fma(_1238, _1242, _1224);
    float _1256 = fma(_1238, _1246, _1228);
    float _1258 = fma(_1238, _1250, _1232);
    float _1260 = _1254 * 0.586610972881317138671875;
    out.m_65.x = 0.0;
    float _1262 = fma(_1256, 0.298911988735198974609375, _1260);
    float _1264 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _1266 = fma(_1258, 0.114477999508380889892578125, _1262);
    float _1268 = -_1266;
    float _1270 = _1256 + _1268;
    float _1272 = -_1266;
    float _1274 = _1254 + _1272;
    float _1276 = -_1266;
    float _1278 = _1258 + _1276;
    out.m_63.w = _1264;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1284 = fma(_1278, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    out.m_67.x = _1280;
    out.m_67.y = _1282;
    out.m_67.z = _1284;
    if (!_1252)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1286 = -_886;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1290 = -_904;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1294 = -_862;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1298 = _1288 * _1288;
    float _1300 = fma(_1292, _1292, _1298);
    float _1302 = fma(_1296, _1296, _1300);
    float _1304 = sqrt(_1302);
    float _1306 = rsqrt(_1302);
    float _1308 = -_1304;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = _1292 * _1306;
    float _1318 = _1288 * _1306;
    float _1320 = abs(_1314);
    float _1322 = log2(_1320);
    float _1324 = _1296 * _1306;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1328 = _726 * _1318;
    float _1330 = -_1318;
    float _1332 = -_1326;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1332);
    float _1336 = fma(_694, _1316, _1328);
    float _1338 = -_1324;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1334);
    float _1342 = fma(_728, _1324, _1336);
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1348 = _1340 + _1346;
    float _1350 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1354 = precise::clamp(_1352, 0.0, 1.0);
    float _1356 = exp2(_1350);
    float _1358 = _1356 * _1354;
    float _1360 = _1344 * _1358;
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_65.x = _1362;
    out.m_65.y = _1364;
    out.m_65.z = _1366;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1138 = false;
    bool _774 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_39.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_42.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_102);
        out.gl_Position.z = _1423;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    if (_116)
    {
        float _124 = float(_86);
        _122 = _124;
    }
    float _126 = _122;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    if (_132)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_132)
    {
        out.m_42.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1491 = as_type<float>(_138);
        out.gl_Position.z = _1491;
    }
    if (_132)
    {
        return out;
    }
    float _140 = in.m_46.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _148 = _146 != 0;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _152 = _150 != 0;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _144 * _142;
    float _160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _162 = _160 * 6.283185482025146484375;
    float _164 = floor(_160);
    float _166 = _162 * 0.15915493667125701904296875;
    bool _168 = !_148;
    int _170 = _168 ? 0 : 1;
    int _172 = abs(_170);
    float _174 = _166 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_156;
    int _180 = _178 ? 0 : 1;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _184 = abs(_180);
    float _186 = -_164;
    float _188 = _160 + _186;
    bool _190 = !_152;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = -_188;
    float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _200 = float(_172);
    float _202 = fma(_176, 0.5, 0.5);
    bool _204 = _188 < 0.5;
    float _206 = float(_204);
    float _208 = abs(_198);
    float _210 = _200 * _208;
    float _212 = float(_184);
    float _214 = -_202;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _218 = float(_194);
    float _220 = -_206;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = fma(_212, _216, _210);
    float _226 = abs(_222);
    float _228 = fma(_218, _226, _224);
    bool _230 = !_182;
    float _246;
    if (!_230)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _140 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_86);
        float _252 = 1.0 / _250;
        float _254 = _120 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = in.m_39.x;
    float _260 = in.m_39.y;
    float _262 = in.m_39.z;
    float _264 = as_type<float>(int(gl_VertexIndex));
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _276 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_256);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _290 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _292 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    int _294 = as_type<int>(_264) & 1;
    bool _296 = _294 != 0;
    int _298 = as_type<int>(_264) & 2;
    bool _300 = _298 != 0;
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _304 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _306 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    bool _308 = _140 > 0.5;
    float _310 = _302 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _312 = _304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = 1.0 / _268;
    float _318 = -_310;
    float _320 = _318 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _322 = -_312;
    float _324 = _322 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _326 = -_314;
    float _328 = _326 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _256 + _330;
    float _334 = _320 * _320;
    float _336 = fma(_324, _324, _334);
    float _338 = fma(_328, _328, _336);
    float _340 = _332 * _316;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = rsqrt(_338);
    float _356 = in.m_51.x;
    float _358 = in.m_51.y;
    float _360 = _324 * _354;
    float _362 = _320 * _354;
    float _364 = _328 * _354;
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _368 = _360 * _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _376 = _364 * _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _380 = _362 * _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _384 = -_368;
    float _386 = fma(_364, _382, _384);
    float _388 = -_352;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _394 = -_376;
    float _396 = fma(_362, _392, _394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = _386 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _406 = -_380;
    float _408 = fma(_360, _404, _406);
    float _410 = fma(_372, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _286 * _390;
    float _414 = fma(_396, _396, _402);
    float _416 = fma(_400, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -_286;
    float _420 = _418 + 1.0;
    float _422 = _410 * _412;
    float _424 = fma(_408, _408, _414);
    float _426 = _416 * _412;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _432 = rsqrt(_424);
    float _434 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _436 = !_300;
    float _438 = _436 ? (-0.5) : 0.5;
    float _440 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _430);
    float _442 = _434 * _358;
    float _444 = _440 * _356;
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _438);
    float _448 = _228 * _442;
    float _450 = _228 * _444;
    float _452 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _454 = !_296;
    float _456 = _454 ? (-0.5) : 0.5;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _386 * _432;
    float _462 = _396 * _432;
    float _464 = _452 * _446;
    float _466 = _408 * _432;
    float _468 = _364 * _460;
    float _470 = _362 * _462;
    float _472 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _456);
    float _474 = -_468;
    float _476 = fma(_362, _466, _474);
    float _478 = -_470;
    float _480 = fma(_360, _460, _478);
    float _482 = _458 * _472;
    float _484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _486 = _464 * _476;
    float _488 = _464 * _480;
    float _490 = in.m_46.y;
    float _492 = fma(_482, _462, _486);
    float _494 = fma(_482, _466, _488);
    float _496 = fma(_484, _360, _492);
    float _498 = fma(_484, _364, _494);
    float _500 = _360 * _466;
    float _502 = _312 + _496;
    float _504 = _314 + _498;
    float _506 = -_500;
    float _508 = fma(_364, _462, _506);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _512 = _502 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _516 = _504 + _514;
    float _518 = _464 * _508;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _522 = _520 != 0;
    float _524 = _512 * _512;
    float _526 = _516 * _516;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_482, _460, _518);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _536 = _524 + _526;
    bool _538 = _490 > 0.5;
    float _540 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _542 = fma(_484, _362, _532);
    float _544 = -_456;
    float _546 = _308 ? _544 : _456;
    float _548 = _456 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _550 = -_438;
    int _552 = _538 ? as_type<int>(_550) : as_type<int>(_438);
    float _554 = sqrt(_536);
    float _556 = _540 * _476;
    float _558 = _310 + _542;
    bool _560 = !_530;
    float _562 = _560 ? _438 : as_type<float>(_552);
    float _564 = _540 * _508;
    bool _566 = !_522;
    float _568 = _566 ? _456 : _546;
    float _570 = _540 * _480;
    float _572 = fma(_548, _462, _556);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _576 = _554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = _456;
    float _580 = _546;
    float _582 = _540;
    float _584 = _462;
    float _586 = _532;
    float _588 = _572;
    if (!_576)
    {
        _578 = _526;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_576)
    {
        _580 = _524;
    }
    float _594 = _580;
    float _596 = _594;
    if (!_576)
    {
        _582 = _502;
    }
    float _598 = _582;
    float _600 = _598;
    if (!_576)
    {
        _584 = _504;
    }
    float _602 = _584;
    float _604 = _602;
    if (!_576)
    {
        _586 = _558;
    }
    float _606 = _586;
    bool _608 = !_576;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _554 + _614;
        float _618 = _558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = rsqrt(_536);
        float _622 = _616 * _612;
        float _624 = _622 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = sin(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = fma(_628, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _620 * _634;
        float _638 = _632 + (-1.0);
        float _640 = fma(_512, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _642 = fma(_516, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _644 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _648 = _640 + _646;
        float _650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _652 = _642 + _650;
        float _654 = fma(_558, _632, _644);
        float _656 = _648 * _648;
        float _658 = _652 * _652;
        _610 = _654;
        _596 = _656;
        _592 = _658;
        _604 = _642;
        _600 = _640;
    }
    float _660 = _610;
    float _662 = _596;
    float _664 = _592;
    float _666 = _604;
    float _668 = _600;
    float _670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _672 = _660 + _670;
    float _674 = -_562;
    float _676 = _674 + 0.5;
    float _678 = _568 + 0.5;
    float _680 = fma(_548, _460, _564);
    float _682 = fma(_672, _672, _662);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _688 = fma(_548, _466, _570);
    float _690 = _682 + _664;
    float _692 = _684 * _534;
    float _694 = _360 + _572;
    float _696 = _686 * _574;
    float _698 = sqrt(_690);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _362 + _680;
    float _728 = _364 + _688;
    out.m_53.x = _712;
    out.m_53.y = _716;
    out.m_53.z = _718;
    out.m_53.w = _714;
    bool _730 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _732 = isnan(_698);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _738 = _734 || _736;
    out.m_55.x = _720;
    out.m_55.y = _722;
    out.m_55.z = _724;
    out.m_57.x = _696;
    out.m_57.y = _692;
    out.m_59.x = _694;
    out.m_59.y = _726;
    out.m_59.z = _728;
    if (!_738)
    {
        _588 = 1.0;
    }
    float _740 = _588;
    bool _742 = !_738;
    float _744 = _740;
    if (!_742)
    {
        bool _746 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _748 = isnan(_698);
        bool _750 = _746 || _748;
        bool _752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _754 = _750 || _752;
        if (!_754)
        {
            float _756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _758 = _698 + _756;
            float _760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _760;
            float _764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _766 = _764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _768 = 1.0 / _762;
            float _770 = _758 * _768;
            float _772 = fma(_770, _766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _744 = _772;
            _774 = true;
        }
        else
        {
            bool _776 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _778 = isnan(_698);
            bool _780 = _776 || _778;
            bool _782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _784 = _780 || _782;
            if (!_784)
            {
                float _786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _788 = _698 + _786;
                float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _792 = _790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _796 = _794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _798 = 1.0 / _792;
                float _800 = _788 * _798;
                float _802 = fma(_800, _796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _744 = _802;
                _774 = true;
            }
            else
            {
                _744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _774 = false;
    float _804 = _744;
    float _806 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _808 = fma(_314, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _810 = floor(_806);
    float _812 = floor(_808);
    float _814 = -_810;
    float _816 = _806 + _814;
    float _818 = -_812;
    float _820 = _808 + _818;
    float2 _2613 = float2(_816, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2613, float2(0.0), isnan(_2613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2613, float2(0.0), isnan(_2613)), level(0.0)).x;
    float _824 = _310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _826 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _824);
    float _828 = _310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _830 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _828);
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _840 = _666 + _838;
    float _842 = 1.0 / _834;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _834;
    float _848 = _846 * _842;
    float _850 = _848 * 0.5;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _852);
    float _856 = 1.0 / _854;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _860 = _856 * _858;
    float _862 = fma(_840, _804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _864 = abs(_860);
    float _866 = log2(_864);
    bool _868 = _860 <= 8000.0;
    bool _870 = isnan(_860);
    bool _872 = _868 || _870;
    bool _874 = isnan(8000.0);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _866 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _884 = _660 + _882;
    float _886 = fma(_884, _804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _888 = exp2(_880);
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _896 = _668 + _894;
    float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = fma(_892, -2.0, 3.0);
    float _902 = _892 * _892;
    float _904 = fma(_896, _804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _908 = _902 * _900;
    float _910 = _886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _906);
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _916 = _886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _910);
    float _922 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _916);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[2].z, _920);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _932 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _942 = _928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].x, _934);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].x, _938);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].x, _940);
    float _952 = -_908;
    float _954 = _952 + 1.0;
    float _956 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].z, _944);
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].z, _948);
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].z, _950);
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[654].w, _908);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _958);
    float _970 = in.m_61.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _886 + _972;
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _962);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _960);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _964);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _904 + _982;
    float _986 = _974 * _974;
    float _988 = _878 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _862 + _990;
    out.gl_Position.x = _978;
    out.gl_Position.y = _976;
    out.gl_Position.z = _980;
    out.gl_Position.w = _968;
    float _994 = fma(_984, _984, _986);
    float _996 = _988 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _998 = fma(_992, _992, _994);
    float _1000 = sqrt(_998);
    bool _1002 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1004 = isnan(_1000);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1010 = _1006 || _1008;
    float _1012 = _968;
    float _1014 = _980;
    float _1016 = _976;
    float _1018 = _978;
    if (!_1010)
    {
        _1012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    float _1024 = _1020;
    if (!_1010)
    {
        _1014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    float _1030 = _1026;
    if (!_1010)
    {
        _1016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1032 = _1016;
    float _1034 = _1032;
    float _1036 = _1032;
    if (!_1010)
    {
        _1018 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1038 = _1018;
    float _1040 = -_822;
    float _1042 = _1040 + 1.0;
    float _1044 = _1042 * _996;
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = -_1046;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1054 = _1038;
    float _1056 = _1038;
    if (!_1010)
    {
        _1052 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1058 = _1052;
    float _1060 = _1050 * _970;
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1058;
    if (!_1010)
    {
        _1064 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1070 = _1064;
    out.m_63.x = _1062;
    bool _1072 = !_1010;
    float _1074 = _1070;
    float _1076 = _1070;
    if (!_1072)
    {
        bool _1078 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1080 = isnan(_1000);
        bool _1082 = _1078 || _1080;
        bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1086 = _1082 || _1084;
        if (!_1086)
        {
            float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1090 = _1000 + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1092;
            float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1098 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1100 = 1.0 / _1094;
            float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1108 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1112 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1118 = _1090 * _1100;
            float _1120 = precise::clamp(_1118, 0.0, 1.0);
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1126 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1128 = fma(_1120, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1130 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1132 = fma(_1120, _1108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1134 = fma(_1120, _1112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1136 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1024 = _1126;
            _1056 = _1134;
            _1068 = _1130;
            _1036 = _1132;
            _1030 = _1128;
            _1076 = _1136;
            _1138 = true;
        }
        else
        {
            bool _1140 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1142 = isnan(_1000);
            bool _1144 = _1140 || _1142;
            bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1148 = _1144 || _1146;
            if (!_1148)
            {
                _1066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1150 = _1066;
            _1068 = _1150;
            if (!_1148)
            {
                _1022 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1152 = _1022;
            _1024 = _1152;
            if (!_1148)
            {
                _1028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1154 = _1028;
            _1030 = _1154;
            if (!_1148)
            {
                _1034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1156 = _1034;
            _1036 = _1156;
            if (!_1148)
            {
                _1054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1158 = _1054;
            _1056 = _1158;
            if (!_1148)
            {
                _1074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1160 = _1074;
            bool _1162 = !_1148;
            _1076 = _1160;
            if (!_1162)
            {
                bool _1164 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1166 = isnan(_1000);
                bool _1168 = _1164 || _1166;
                bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1172 = _1168 || _1170;
                if (!_1172)
                {
                    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1176 = _1000 + _1174;
                    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1178;
                    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1186 = 1.0 / _1180;
                    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1190 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1198 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1204 = _1176 * _1186;
                    float _1206 = precise::clamp(_1204, 0.0, 1.0);
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1212 = fma(_1206, _1184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1214 = fma(_1206, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1216 = fma(_1206, _1190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1218 = fma(_1206, _1194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1220 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1222 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1024 = _1212;
                    _1056 = _1220;
                    _1068 = _1216;
                    _1036 = _1218;
                    _1030 = _1214;
                    _1076 = _1222;
                    _1138 = true;
                }
                else
                {
                    _1024 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1138 = false;
    float _1224 = _1024;
    float _1226 = _1056;
    float _1228 = _1068;
    float _1230 = _1036;
    float _1232 = _1030;
    float _1234 = _1076;
    float _1236 = fma(_726, -0.5, 0.5);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1224;
    float _1242 = _1240 + _1226;
    float _1244 = -_1228;
    float _1246 = _1244 + _1230;
    float _1248 = -_1232;
    float _1250 = _1248 + _1234;
    bool _1252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1254 = fma(_1238, _1242, _1224);
    float _1256 = fma(_1238, _1246, _1228);
    float _1258 = fma(_1238, _1250, _1232);
    float _1260 = _1254 * 0.586610972881317138671875;
    out.m_65.x = 0.0;
    float _1262 = fma(_1256, 0.298911988735198974609375, _1260);
    float _1264 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _1266 = fma(_1258, 0.114477999508380889892578125, _1262);
    float _1268 = -_1266;
    float _1270 = _1256 + _1268;
    float _1272 = -_1266;
    float _1274 = _1254 + _1272;
    float _1276 = -_1266;
    float _1278 = _1258 + _1276;
    out.m_63.w = _1264;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1284 = fma(_1278, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    out.m_67.x = _1280;
    out.m_67.y = _1282;
    out.m_67.z = _1284;
    if (!_1252)
    {
        return out;
    }
    float _1286 = -_886;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1290 = -_904;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1294 = -_862;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1298 = _1288 * _1288;
    float _1300 = fma(_1292, _1292, _1298);
    float _1302 = fma(_1296, _1296, _1300);
    float _1304 = sqrt(_1302);
    float _1306 = rsqrt(_1302);
    float _1308 = -_1304;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = _1292 * _1306;
    float _1318 = _1288 * _1306;
    float _1320 = abs(_1314);
    float _1322 = log2(_1320);
    float _1324 = _1296 * _1306;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1328 = _726 * _1318;
    float _1330 = -_1318;
    float _1332 = -_1326;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1332);
    float _1336 = fma(_694, _1316, _1328);
    float _1338 = -_1324;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1334);
    float _1342 = fma(_728, _1324, _1336);
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1348 = _1340 + _1346;
    float _1350 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1354 = precise::clamp(_1352, 0.0, 1.0);
    float _1356 = exp2(_1350);
    float _1358 = _1356 * _1354;
    float _1360 = _1344 * _1358;
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_65.x = _1362;
    out.m_65.y = _1364;
    out.m_65.z = _1366;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1138 = false;
    bool _774 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_39.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_42.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_102);
        out.gl_Position.z = _1423;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    if (_116)
    {
        float _124 = float(_86);
        _122 = _124;
    }
    float _126 = _122;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    if (_132)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_132)
    {
        out.m_42.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1491 = as_type<float>(_138);
        out.gl_Position.z = _1491;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_46.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _148 = _146 != 0;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _152 = _150 != 0;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _144 * _142;
    float _160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _162 = _160 * 6.283185482025146484375;
    float _164 = floor(_160);
    float _166 = _162 * 0.15915493667125701904296875;
    bool _168 = !_148;
    int _170 = _168 ? 0 : 1;
    int _172 = abs(_170);
    float _174 = _166 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_156;
    int _180 = _178 ? 0 : 1;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _184 = abs(_180);
    float _186 = -_164;
    float _188 = _160 + _186;
    bool _190 = !_152;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = -_188;
    float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _200 = float(_172);
    float _202 = fma(_176, 0.5, 0.5);
    bool _204 = _188 < 0.5;
    float _206 = float(_204);
    float _208 = abs(_198);
    float _210 = _200 * _208;
    float _212 = float(_184);
    float _214 = -_202;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _218 = float(_194);
    float _220 = -_206;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = fma(_212, _216, _210);
    float _226 = abs(_222);
    float _228 = fma(_218, _226, _224);
    bool _230 = !_182;
    float _246;
    if (!_230)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _140 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_86);
        float _252 = 1.0 / _250;
        float _254 = _120 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = in.m_39.x;
    float _260 = in.m_39.y;
    float _262 = in.m_39.z;
    float _264 = as_type<float>(int(gl_VertexIndex));
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _274 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _276 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_256);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _270);
    float _290 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _272);
    float _292 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _274);
    int _294 = as_type<int>(_264) & 1;
    bool _296 = _294 != 0;
    int _298 = as_type<int>(_264) & 2;
    bool _300 = _298 != 0;
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _304 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _306 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    bool _308 = _140 > 0.5;
    float _310 = _302 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _312 = _304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = 1.0 / _268;
    float _318 = -_310;
    float _320 = _318 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _322 = -_312;
    float _324 = _322 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _326 = -_314;
    float _328 = _326 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _256 + _330;
    float _334 = _320 * _320;
    float _336 = fma(_324, _324, _334);
    float _338 = fma(_328, _328, _336);
    float _340 = _332 * _316;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = rsqrt(_338);
    float _356 = in.m_51.x;
    float _358 = in.m_51.y;
    float _360 = _324 * _354;
    float _362 = _320 * _354;
    float _364 = _328 * _354;
    float _366 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _368 = _360 * _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _376 = _364 * _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _380 = _362 * _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _384 = -_368;
    float _386 = fma(_364, _382, _384);
    float _388 = -_352;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _394 = -_376;
    float _396 = fma(_362, _392, _394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = _386 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _406 = -_380;
    float _408 = fma(_360, _404, _406);
    float _410 = fma(_372, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _286 * _390;
    float _414 = fma(_396, _396, _402);
    float _416 = fma(_400, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = -_286;
    float _420 = _418 + 1.0;
    float _422 = _410 * _412;
    float _424 = fma(_408, _408, _414);
    float _426 = _416 * _412;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _432 = rsqrt(_424);
    float _434 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    bool _436 = !_300;
    float _438 = _436 ? (-0.5) : 0.5;
    float _440 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _430);
    float _442 = _434 * _358;
    float _444 = _440 * _356;
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _438);
    float _448 = _228 * _442;
    float _450 = _228 * _444;
    float _452 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _454 = !_296;
    float _456 = _454 ? (-0.5) : 0.5;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _386 * _432;
    float _462 = _396 * _432;
    float _464 = _452 * _446;
    float _466 = _408 * _432;
    float _468 = _364 * _460;
    float _470 = _362 * _462;
    float _472 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _456);
    float _474 = -_468;
    float _476 = fma(_362, _466, _474);
    float _478 = -_470;
    float _480 = fma(_360, _460, _478);
    float _482 = _458 * _472;
    float _484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _486 = _464 * _476;
    float _488 = _464 * _480;
    float _490 = in.m_46.y;
    float _492 = fma(_482, _462, _486);
    float _494 = fma(_482, _466, _488);
    float _496 = fma(_484, _360, _492);
    float _498 = fma(_484, _364, _494);
    float _500 = _360 * _466;
    float _502 = _312 + _496;
    float _504 = _314 + _498;
    float _506 = -_500;
    float _508 = fma(_364, _462, _506);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _512 = _502 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _516 = _504 + _514;
    float _518 = _464 * _508;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _522 = _520 != 0;
    float _524 = _512 * _512;
    float _526 = _516 * _516;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _530 = _528 != 0;
    float _532 = fma(_482, _460, _518);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _536 = _524 + _526;
    bool _538 = _490 > 0.5;
    float _540 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _542 = fma(_484, _362, _532);
    float _544 = -_456;
    float _546 = _308 ? _544 : _456;
    float _548 = _456 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _550 = -_438;
    int _552 = _538 ? as_type<int>(_550) : as_type<int>(_438);
    float _554 = sqrt(_536);
    float _556 = _540 * _476;
    float _558 = _310 + _542;
    bool _560 = !_530;
    float _562 = _560 ? _438 : as_type<float>(_552);
    float _564 = _540 * _508;
    bool _566 = !_522;
    float _568 = _566 ? _456 : _546;
    float _570 = _540 * _480;
    float _572 = fma(_548, _462, _556);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _576 = _554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _578 = _456;
    float _580 = _546;
    float _582 = _540;
    float _584 = _462;
    float _586 = _532;
    float _588 = _572;
    if (!_576)
    {
        _578 = _526;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_576)
    {
        _580 = _524;
    }
    float _594 = _580;
    float _596 = _594;
    if (!_576)
    {
        _582 = _502;
    }
    float _598 = _582;
    float _600 = _598;
    if (!_576)
    {
        _584 = _504;
    }
    float _602 = _584;
    float _604 = _602;
    if (!_576)
    {
        _586 = _558;
    }
    float _606 = _586;
    bool _608 = !_576;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _554 + _614;
        float _618 = _558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = rsqrt(_536);
        float _622 = _616 * _612;
        float _624 = _622 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = sin(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = fma(_628, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _620 * _634;
        float _638 = _632 + (-1.0);
        float _640 = fma(_512, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _642 = fma(_516, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _644 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _648 = _640 + _646;
        float _650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _652 = _642 + _650;
        float _654 = fma(_558, _632, _644);
        float _656 = _648 * _648;
        float _658 = _652 * _652;
        _610 = _654;
        _596 = _656;
        _592 = _658;
        _604 = _642;
        _600 = _640;
    }
    float _660 = _610;
    float _662 = _596;
    float _664 = _592;
    float _666 = _604;
    float _668 = _600;
    float _670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _672 = _660 + _670;
    float _674 = -_562;
    float _676 = _674 + 0.5;
    float _678 = _568 + 0.5;
    float _680 = fma(_548, _460, _564);
    float _682 = fma(_672, _672, _662);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _688 = fma(_548, _466, _570);
    float _690 = _682 + _664;
    float _692 = _684 * _534;
    float _694 = _360 + _572;
    float _696 = _686 * _574;
    float _698 = sqrt(_690);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _362 + _680;
    float _728 = _364 + _688;
    out.m_53.x = _712;
    out.m_53.y = _716;
    out.m_53.z = _718;
    out.m_53.w = _714;
    bool _730 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _732 = isnan(_698);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _738 = _734 || _736;
    out.m_55.x = _720;
    out.m_55.y = _722;
    out.m_55.z = _724;
    out.m_57.x = _696;
    out.m_57.y = _692;
    out.m_59.x = _694;
    out.m_59.y = _726;
    out.m_59.z = _728;
    if (!_738)
    {
        _588 = 1.0;
    }
    float _740 = _588;
    bool _742 = !_738;
    float _744 = _740;
    if (!_742)
    {
        bool _746 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _748 = isnan(_698);
        bool _750 = _746 || _748;
        bool _752 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _754 = _750 || _752;
        if (!_754)
        {
            float _756 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _758 = _698 + _756;
            float _760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _762 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _760;
            float _764 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _766 = _764 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _768 = 1.0 / _762;
            float _770 = _758 * _768;
            float _772 = fma(_770, _766, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _744 = _772;
            _774 = true;
        }
        else
        {
            bool _776 = _698 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _778 = isnan(_698);
            bool _780 = _776 || _778;
            bool _782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _784 = _780 || _782;
            if (!_784)
            {
                float _786 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _788 = _698 + _786;
                float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _792 = _790 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _794 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _796 = _794 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _798 = 1.0 / _792;
                float _800 = _788 * _798;
                float _802 = fma(_800, _796, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _744 = _802;
                _774 = true;
            }
            else
            {
                _744 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _774 = false;
    float _804 = _744;
    float _806 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _808 = fma(_314, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _810 = floor(_806);
    float _812 = floor(_808);
    float _814 = -_810;
    float _816 = _806 + _814;
    float _818 = -_812;
    float _820 = _808 + _818;
    float2 _2613 = float2(_816, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2613, float2(0.0), isnan(_2613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2613, float2(0.0), isnan(_2613)), level(0.0)).x;
    float _824 = _310 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _826 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _824);
    float _828 = _310 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _830 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _828);
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_314, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _840 = _666 + _838;
    float _842 = 1.0 / _834;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _844 + _834;
    float _848 = _846 * _842;
    float _850 = _848 * 0.5;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[30].w, _852);
    float _856 = 1.0 / _854;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _860 = _856 * _858;
    float _862 = fma(_840, _804, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _864 = abs(_860);
    float _866 = log2(_864);
    bool _868 = _860 <= 8000.0;
    bool _870 = isnan(_860);
    bool _872 = _868 || _870;
    bool _874 = isnan(8000.0);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _866 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _882 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _884 = _660 + _882;
    float _886 = fma(_884, _804, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _888 = exp2(_880);
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _896 = _668 + _894;
    float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = fma(_892, -2.0, 3.0);
    float _902 = _892 * _892;
    float _904 = fma(_896, _804, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _908 = _902 * _900;
    float _910 = _886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _912 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _906);
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _916 = _886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _918 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _910);
    float _922 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _916);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[2].z, _920);
    float _930 = _922 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _932 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _934 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _936 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _942 = _928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[7].x, _934);
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[5].x, _938);
    float _950 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[6].x, _940);
    float _952 = -_908;
    float _954 = _952 + 1.0;
    float _956 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].z, _944);
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].z, _946);
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].z, _948);
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].z, _950);
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[654].w, _908);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _958);
    float _970 = in.m_61.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _886 + _972;
    float _976 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _962);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _960);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _964);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _904 + _982;
    float _986 = _974 * _974;
    float _988 = _878 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _992 = _862 + _990;
    out.gl_Position.x = _978;
    out.gl_Position.y = _976;
    out.gl_Position.z = _980;
    out.gl_Position.w = _968;
    float _994 = fma(_984, _984, _986);
    float _996 = _988 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _998 = fma(_992, _992, _994);
    float _1000 = sqrt(_998);
    bool _1002 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1004 = isnan(_1000);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1010 = _1006 || _1008;
    float _1012 = _968;
    float _1014 = _980;
    float _1016 = _976;
    float _1018 = _978;
    if (!_1010)
    {
        _1012 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1020 = _1012;
    float _1022 = _1020;
    float _1024 = _1020;
    if (!_1010)
    {
        _1014 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1026 = _1014;
    float _1028 = _1026;
    float _1030 = _1026;
    if (!_1010)
    {
        _1016 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1032 = _1016;
    float _1034 = _1032;
    float _1036 = _1032;
    if (!_1010)
    {
        _1018 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1038 = _1018;
    float _1040 = -_822;
    float _1042 = _1040 + 1.0;
    float _1044 = _1042 * _996;
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = -_1046;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1054 = _1038;
    float _1056 = _1038;
    if (!_1010)
    {
        _1052 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1058 = _1052;
    float _1060 = _1050 * _970;
    float _1062 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1064 = _1060;
    float _1066 = _1058;
    float _1068 = _1058;
    if (!_1010)
    {
        _1064 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1070 = _1064;
    out.m_63.x = _1062;
    bool _1072 = !_1010;
    float _1074 = _1070;
    float _1076 = _1070;
    if (!_1072)
    {
        bool _1078 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1080 = isnan(_1000);
        bool _1082 = _1078 || _1080;
        bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1086 = _1082 || _1084;
        if (!_1086)
        {
            float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1090 = _1000 + _1088;
            float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1092;
            float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1098 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1100 = 1.0 / _1094;
            float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1104 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1108 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1112 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1118 = _1090 * _1100;
            float _1120 = precise::clamp(_1118, 0.0, 1.0);
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1126 = fma(_1120, _1098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1128 = fma(_1120, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1130 = fma(_1120, _1104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1132 = fma(_1120, _1108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1134 = fma(_1120, _1112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1136 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1024 = _1126;
            _1056 = _1134;
            _1068 = _1130;
            _1036 = _1132;
            _1030 = _1128;
            _1076 = _1136;
            _1138 = true;
        }
        else
        {
            bool _1140 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1142 = isnan(_1000);
            bool _1144 = _1140 || _1142;
            bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1148 = _1144 || _1146;
            if (!_1148)
            {
                _1066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1150 = _1066;
            _1068 = _1150;
            if (!_1148)
            {
                _1022 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1152 = _1022;
            _1024 = _1152;
            if (!_1148)
            {
                _1028 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1154 = _1028;
            _1030 = _1154;
            if (!_1148)
            {
                _1034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1156 = _1034;
            _1036 = _1156;
            if (!_1148)
            {
                _1054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1158 = _1054;
            _1056 = _1158;
            if (!_1148)
            {
                _1074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1160 = _1074;
            bool _1162 = !_1148;
            _1076 = _1160;
            if (!_1162)
            {
                bool _1164 = _1000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1166 = isnan(_1000);
                bool _1168 = _1164 || _1166;
                bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1172 = _1168 || _1170;
                if (!_1172)
                {
                    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1176 = _1000 + _1174;
                    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1178;
                    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1184 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1186 = 1.0 / _1180;
                    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1190 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1194 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1198 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1204 = _1176 * _1186;
                    float _1206 = precise::clamp(_1204, 0.0, 1.0);
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1212 = fma(_1206, _1184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1214 = fma(_1206, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1216 = fma(_1206, _1190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1218 = fma(_1206, _1194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1220 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1222 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1024 = _1212;
                    _1056 = _1220;
                    _1068 = _1216;
                    _1036 = _1218;
                    _1030 = _1214;
                    _1076 = _1222;
                    _1138 = true;
                }
                else
                {
                    _1024 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1030 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1138 = false;
    float _1224 = _1024;
    float _1226 = _1056;
    float _1228 = _1068;
    float _1230 = _1036;
    float _1232 = _1030;
    float _1234 = _1076;
    float _1236 = fma(_726, -0.5, 0.5);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1224;
    float _1242 = _1240 + _1226;
    float _1244 = -_1228;
    float _1246 = _1244 + _1230;
    float _1248 = -_1232;
    float _1250 = _1248 + _1234;
    bool _1252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1254 = fma(_1238, _1242, _1224);
    float _1256 = fma(_1238, _1246, _1228);
    float _1258 = fma(_1238, _1250, _1232);
    float _1260 = _1254 * 0.586610972881317138671875;
    out.m_65.x = 0.0;
    float _1262 = fma(_1256, 0.298911988735198974609375, _1260);
    float _1264 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _1266 = fma(_1258, 0.114477999508380889892578125, _1262);
    float _1268 = -_1266;
    float _1270 = _1256 + _1268;
    float _1272 = -_1266;
    float _1274 = _1254 + _1272;
    float _1276 = -_1266;
    float _1278 = _1258 + _1276;
    out.m_63.w = _1264;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    float _1284 = fma(_1278, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1266);
    out.m_67.x = _1280;
    out.m_67.y = _1282;
    out.m_67.z = _1284;
    if (!_1252)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1286 = -_886;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1290 = -_904;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1294 = -_862;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1298 = _1288 * _1288;
    float _1300 = fma(_1292, _1292, _1298);
    float _1302 = fma(_1296, _1296, _1300);
    float _1304 = sqrt(_1302);
    float _1306 = rsqrt(_1302);
    float _1308 = -_1304;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = _1292 * _1306;
    float _1318 = _1288 * _1306;
    float _1320 = abs(_1314);
    float _1322 = log2(_1320);
    float _1324 = _1296 * _1306;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1328 = _726 * _1318;
    float _1330 = -_1318;
    float _1332 = -_1326;
    float _1334 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1332);
    float _1336 = fma(_694, _1316, _1328);
    float _1338 = -_1324;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1334);
    float _1342 = fma(_728, _1324, _1336);
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1348 = _1340 + _1346;
    float _1350 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1354 = precise::clamp(_1352, 0.0, 1.0);
    float _1356 = exp2(_1350);
    float _1358 = _1356 * _1354;
    float _1360 = _1344 * _1358;
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_65.x = _1362;
    out.m_65.y = _1364;
    out.m_65.z = _1366;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

