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
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _370 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1354 = as_type<float>(_102);
        out.gl_Position.z = _1354;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1422 = as_type<float>(_138);
        out.gl_Position.z = _1422;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _144 * _142;
    float _164 = 0.0;
    float _166 = _146;
    if (!_156)
    {
        float _168 = _146 * _146;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _176 = _172;
    if (!_156)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    float _194 = _192 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = -_190;
    float _200 = _174 + _198;
    bool _202 = !_156;
    float _204 = _180;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _146 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _146);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _146 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _166 = _258;
    }
    float _260 = _166;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = -_200;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_264;
    int _288 = _286 ? 0 : 1;
    float _290 = fma(_196, 0.5, 0.5);
    float _292 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_160;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_288);
    float _308 = fma(_260, _182, _292);
    bool _310 = !_268;
    int _312 = _310 ? 0 : 1;
    float _314 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _320 = abs(_300);
    float _322 = fma(_260, _184, _314);
    int _324 = abs(_312);
    float _326 = fma(_260, _186, _318);
    float _328 = float(_306);
    float _330 = float(_320);
    float _332 = abs(_284);
    float _334 = _328 * _332;
    float _336 = fma(_322, _270, _274);
    float _338 = float(_324);
    float _340 = fma(_330, _304, _334);
    float _342 = fma(_308, _270, _272);
    float _344 = fma(_326, _270, _276);
    float _346 = abs(_296);
    float _348 = fma(_338, _346, _340);
    bool _350 = !_316;
    float _352 = _344;
    float _368;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _140 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_86);
        float _374 = 1.0 / _372;
        float _376 = _120 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_51.x;
    float _382 = in.m_51.y;
    float _384 = in.m_51.z;
    bool _386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _388 = isnan(0.5);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _394 = _390 || _392;
    float _396 = in.m_53.x;
    float _398 = in.m_53.y;
    float _400 = in.m_53.z;
    float _402 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _396);
    float _410 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _398);
    float _414 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _400);
    float _418 = _410 * _408;
    float _420 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _422 = _414 * _412;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _426 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = _424 * _416;
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _428);
    float _438 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _442 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _444 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _452 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _442);
    float _454 = _444 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _448);
    float _458 = _446 + _450;
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
    float _462 = _432;
    if (_394)
    {
        _352 = 1.0;
    }
    float _464 = _352;
    float _466 = _454 + _456;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _476 = _466 + _474;
    float _478 = _470 * _470;
    float _480 = _472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _480);
    float _486 = sqrt(_482);
    float _488 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _484);
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _492 = _488 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _494 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _490);
    float _496 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = 1.0 / _492;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _494);
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _506 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _502);
    bool _508 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _492;
    float _512 = _472 + _506;
    float _514 = _510 * _498;
    float _516 = _514 * 0.5;
    float _518 = _496;
    float _520 = _506;
    float _522 = _464;
    float _524 = _512;
    if (!_508)
    {
        _462 = _466;
    }
    float _526 = _462;
    float _528 = _526;
    if (!_508)
    {
        _518 = _458;
    }
    float _530 = _518;
    float _532 = _530;
    if (!_508)
    {
        _520 = _512;
    }
    float _534 = _520;
    bool _536 = !_508;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _486 + _542;
        float _546 = rsqrt(_482);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_512, _556, _564);
        float _570 = _546 * _566;
        float _572 = fma(_476, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_470, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    if (!_394)
    {
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _584 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _590 = 1.0 / _584;
        float _592 = 1.0 / _588;
        float _594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _598 = fma(_590, _594, _596);
        float _600 = _598 * _592;
        float _602 = precise::clamp(_600, 0.0, 1.0);
        _522 = _602;
    }
    float _604 = _522;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _576 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _578 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _580 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _458;
    float _648 = _636;
    float _650 = _644;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    if (_640)
    {
        float _660 = rsqrt(_636);
        _648 = _660;
    }
    float _662 = _648;
    float _664 = _658;
    float _666 = _662;
    if (_640)
    {
        float _668 = _644 * _658;
        _650 = _668;
    }
    float _670 = _650;
    if (_640)
    {
        float _672 = _670 * 0.15915493667125701904296875;
        _524 = _672;
    }
    float _674 = _524;
    float _676 = _616;
    if (_640)
    {
        float _678 = _674 * 6.283185482025146484375;
        float _680 = sin(_678);
        _676 = _680;
    }
    float _682 = _676;
    float _684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _686 = precise::max(0.0, _684);
    float _688 = _498;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = sqrt(_622);
    float _710 = _682;
    float _712 = _706;
    if (_640)
    {
        float _714 = fma(_682, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _710 = _714;
    }
    float _716 = _710;
    float _718 = _716;
    if (!_640)
    {
        _712 = _630;
    }
    float _720 = _712;
    float _722 = _720;
    if (_640)
    {
        float _724 = _696 + (-1.0);
        _690 = _724;
    }
    float _726 = _690;
    float _728 = 0.0;
    float _730 = _726;
    if (_640)
    {
        float _732 = _662 * _716;
        _728 = _732;
    }
    float _734 = _728;
    if (!_640)
    {
        _718 = _702;
    }
    float _736 = _718;
    float _738 = _736;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _740;
    }
    float _742 = _664;
    if (_640)
    {
        float _744 = _628 * _734;
        _654 = _744;
    }
    float _746 = _654;
    if (!_640)
    {
        _666 = _632;
    }
    float _748 = _666;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _734;
        _722 = _752;
    }
    float _754 = _722;
    if (_640)
    {
        float _756 = fma(_702, _696, _742);
        _738 = _756;
    }
    float _758 = _738;
    if (_640)
    {
        float _760 = _746 * _746;
        _750 = _760;
    }
    float _762 = _750;
    if (!_640)
    {
        _730 = _634;
    }
    float _764 = _730;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _772 + _770;
    float _776 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = rsqrt(_774);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _776);
    float _788 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _792 = -_782;
    float _794 = _792 + 1.0;
    float _796 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _798 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _806 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_794);
    float _812 = log2(_810);
    float _814 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _816 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _818 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _820 = _784 * _746;
    float _822 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _814);
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _830 = _822 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _832 = _784 * _754;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _784 * _758;
    float _838 = _804 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _842 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _844 = -_828;
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _844);
    float _848 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _850 = -_838;
    float _852 = fma(_850, _790, 1.0);
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].w, _842);
    float _856 = -_832;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _846);
    float _860 = _818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _840);
    float _864 = exp2(_848);
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = fma(_858, 0.5, 0.5);
    float _872 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].z, _862);
    float _874 = _836 + 1.0;
    float _876 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = log2(_852);
    float _882 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _886 = fma(_870, _878, -0.212114393711090087890625);
    float _888 = 1.0 / _854;
    float _890 = -_836;
    float _892 = fma(_864, _874, _890);
    float _894 = fma(_870, _886, 1.570728778839111328125);
    float _896 = fma(_892, 0.5, 0.5);
    float _898 = sqrt(_866);
    float _900 = _880 * 0.693147182464599609375;
    float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _882 * _888;
    float _906 = _884 * _888;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _898 * 0.636619746685028076171875;
    float3 _2673 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2673, float3(0.0), isnan(_2673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2673, float3(0.0), isnan(_2673)), level(0.0)).x;
    float _916 = -_894;
    float _918 = fma(_912, _916, 1.0);
    float3 _2689 = float3(_908, _910, _902);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2689, float3(0.0), isnan(_2689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2706 = float2(_918, _896);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2706, float2(0.0), isnan(_2706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2706, float2(0.0), isnan(_2706)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_49.y;
    float _943 = in.m_55.y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _955 = _953 != 0;
    float _957 = 1.0 / _947;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _961 = _959 != 0;
    out.m_57.x = _454;
    out.m_57.y = _472;
    out.m_57.z = _446;
    bool _963 = _140 > 0.5;
    bool _965 = _963 && _961;
    float _967 = 1.0 / _951;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _981 = _941 > 0.5;
    float _983 = 1.0 / _971;
    bool _985 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _987 = isnan(_378);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_943;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1005 = _943;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[119].w;
    if (_955)
    {
        float _1009 = _981 ? _999 : _943;
        _1005 = _1009;
    }
    float _1011 = _1005;
    float _1013 = _975 * _957;
    bool _1015 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1017 = isnan(_378);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _979 * _967;
    bool _1029 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1031 = isnan(_378);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = 1.0 / _1003;
    bool _1043 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_378);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -_1025;
    float _1057 = _1055 + 1.0;
    float _1059 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1061 = -_1039;
    float _1063 = _1061 + 1.0;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1067 = _1039 * _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    float _1073 = -_1053;
    float _1075 = _1073 + 1.0;
    float _1077 = _1053 * _1063;
    float _1079 = in.m_55.x;
    float _1081 = _1071 * _983;
    bool _1083 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1085 = isnan(_378);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _995 * _1075;
    float _1097 = -_995;
    float _1099 = _1097 + 1.0;
    bool _1101 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1103 = isnan(_378);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _378 + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    float _1121 = _1093 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1127 = fma(_1013, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1133 = _1111 * _1119;
    float _1135 = 1.0 / _1125;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _378 + _1137;
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = _1127 * _1133;
    float _1147 = _1131 * _1041;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _378 + _1149;
    float _1153 = fma(_1027, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1161 = _1027;
    if (_961)
    {
        _1007 = _1079;
    }
    float _1163 = _1007;
    float _1165 = fma(_1153, _1121, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1167;
    float _1171 = _1163;
    if (!_961)
    {
        _1161 = _1079;
    }
    float _1173 = _1161;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1177 = _378 + _1175;
    float _1179 = fma(_1159, _1095, _1165);
    float _1181 = _1169 * _1135;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1185 = _378 + _1183;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = fma(_1147, _1177, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1199 = _1059 * _1157;
    float _1201 = _818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1203 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = fma(_1181, _1185, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1211 = fma(_1191, _1077, _1179);
    float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1215 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1201);
    out.m_59.x = _1195;
    out.m_59.y = _1205;
    out.m_59.z = _1207;
    out.m_59.w = _1197;
    float _1217 = _1173;
    if (_965)
    {
        float _1219 = -_1163;
        float _1221 = _1219 + 1.0;
        _1171 = _1221;
    }
    float _1223 = _1171;
    float _1225 = fma(_1209, _1067, _1211);
    float _1227 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1215);
    float _1229 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1231 = exp2(_1203);
    float _1233 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_961)
    {
        _1217 = _1223;
    }
    float _1237 = _1217;
    float _1239 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1241 = _604 > 0.0;
    bool _1243 = isnan(_604);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _348 * _1229;
    float _1257 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1263 = _1239 + _854;
    float _1265 = _1259 * _1213;
    float _1267 = -_1231;
    float _1269 = _1267 + 1.0;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1263 * 0.5;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1277 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1251;
    out.m_61.y = _1271;
    out.m_61.z = _1253;
    out.m_61.w = _1257;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    out.m_63.x = _1265;
    out.m_63.y = _1199;
    out.gl_Position.x = _882;
    out.gl_Position.y = _884;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _854;
    out.m_65.z = _1273;
    out.m_65.w = _854;
    out.m_45.x = _1277;
    float _1283 = _1275 * _914;
    float _1285 = _929 * _1283;
    float _1287 = _939 * _1283;
    float _1289 = fma(_935, _1285, _923);
    float _1291 = fma(_937, _1285, _925);
    float _1293 = _929 * _1281;
    float _1295 = fma(_929, _1287, _927);
    out.m_67.x = _1289;
    out.m_67.y = _1291;
    out.m_67.z = _1295;
    out.m_67.w = _1293;
    if (_1249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _370 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1354 = as_type<float>(_102);
        out.gl_Position.z = _1354;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1422 = as_type<float>(_138);
        out.gl_Position.z = _1422;
    }
    if (_132)
    {
        return out;
    }
    float _140 = in.m_49.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _144 * _142;
    float _164 = 0.0;
    float _166 = _146;
    if (!_156)
    {
        float _168 = _146 * _146;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _176 = _172;
    if (!_156)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    float _194 = _192 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = -_190;
    float _200 = _174 + _198;
    bool _202 = !_156;
    float _204 = _180;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _146 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _146);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _146 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _166 = _258;
    }
    float _260 = _166;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = -_200;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_264;
    int _288 = _286 ? 0 : 1;
    float _290 = fma(_196, 0.5, 0.5);
    float _292 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_160;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_288);
    float _308 = fma(_260, _182, _292);
    bool _310 = !_268;
    int _312 = _310 ? 0 : 1;
    float _314 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _320 = abs(_300);
    float _322 = fma(_260, _184, _314);
    int _324 = abs(_312);
    float _326 = fma(_260, _186, _318);
    float _328 = float(_306);
    float _330 = float(_320);
    float _332 = abs(_284);
    float _334 = _328 * _332;
    float _336 = fma(_322, _270, _274);
    float _338 = float(_324);
    float _340 = fma(_330, _304, _334);
    float _342 = fma(_308, _270, _272);
    float _344 = fma(_326, _270, _276);
    float _346 = abs(_296);
    float _348 = fma(_338, _346, _340);
    bool _350 = !_316;
    float _352 = _344;
    float _368;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _140 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_86);
        float _374 = 1.0 / _372;
        float _376 = _120 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_51.x;
    float _382 = in.m_51.y;
    float _384 = in.m_51.z;
    bool _386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _388 = isnan(0.5);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _394 = _390 || _392;
    float _396 = in.m_53.x;
    float _398 = in.m_53.y;
    float _400 = in.m_53.z;
    float _402 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _396);
    float _410 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _398);
    float _414 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _400);
    float _418 = _410 * _408;
    float _420 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _422 = _414 * _412;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _426 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = _424 * _416;
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _428);
    float _438 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _442 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _444 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _452 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _442);
    float _454 = _444 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _448);
    float _458 = _446 + _450;
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
    float _462 = _432;
    if (_394)
    {
        _352 = 1.0;
    }
    float _464 = _352;
    float _466 = _454 + _456;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _476 = _466 + _474;
    float _478 = _470 * _470;
    float _480 = _472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _480);
    float _486 = sqrt(_482);
    float _488 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _484);
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _492 = _488 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _494 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _490);
    float _496 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = 1.0 / _492;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _494);
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _506 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _502);
    bool _508 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _492;
    float _512 = _472 + _506;
    float _514 = _510 * _498;
    float _516 = _514 * 0.5;
    float _518 = _496;
    float _520 = _506;
    float _522 = _464;
    float _524 = _512;
    if (!_508)
    {
        _462 = _466;
    }
    float _526 = _462;
    float _528 = _526;
    if (!_508)
    {
        _518 = _458;
    }
    float _530 = _518;
    float _532 = _530;
    if (!_508)
    {
        _520 = _512;
    }
    float _534 = _520;
    bool _536 = !_508;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _486 + _542;
        float _546 = rsqrt(_482);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_512, _556, _564);
        float _570 = _546 * _566;
        float _572 = fma(_476, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_470, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    if (!_394)
    {
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _584 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _590 = 1.0 / _584;
        float _592 = 1.0 / _588;
        float _594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _598 = fma(_590, _594, _596);
        float _600 = _598 * _592;
        float _602 = precise::clamp(_600, 0.0, 1.0);
        _522 = _602;
    }
    float _604 = _522;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _576 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _578 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _580 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _458;
    float _648 = _636;
    float _650 = _644;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    if (_640)
    {
        float _660 = rsqrt(_636);
        _648 = _660;
    }
    float _662 = _648;
    float _664 = _658;
    float _666 = _662;
    if (_640)
    {
        float _668 = _644 * _658;
        _650 = _668;
    }
    float _670 = _650;
    if (_640)
    {
        float _672 = _670 * 0.15915493667125701904296875;
        _524 = _672;
    }
    float _674 = _524;
    float _676 = _616;
    if (_640)
    {
        float _678 = _674 * 6.283185482025146484375;
        float _680 = sin(_678);
        _676 = _680;
    }
    float _682 = _676;
    float _684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _686 = precise::max(0.0, _684);
    float _688 = _498;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = sqrt(_622);
    float _710 = _682;
    float _712 = _706;
    if (_640)
    {
        float _714 = fma(_682, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _710 = _714;
    }
    float _716 = _710;
    float _718 = _716;
    if (!_640)
    {
        _712 = _630;
    }
    float _720 = _712;
    float _722 = _720;
    if (_640)
    {
        float _724 = _696 + (-1.0);
        _690 = _724;
    }
    float _726 = _690;
    float _728 = 0.0;
    float _730 = _726;
    if (_640)
    {
        float _732 = _662 * _716;
        _728 = _732;
    }
    float _734 = _728;
    if (!_640)
    {
        _718 = _702;
    }
    float _736 = _718;
    float _738 = _736;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _740;
    }
    float _742 = _664;
    if (_640)
    {
        float _744 = _628 * _734;
        _654 = _744;
    }
    float _746 = _654;
    if (!_640)
    {
        _666 = _632;
    }
    float _748 = _666;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _734;
        _722 = _752;
    }
    float _754 = _722;
    if (_640)
    {
        float _756 = fma(_702, _696, _742);
        _738 = _756;
    }
    float _758 = _738;
    if (_640)
    {
        float _760 = _746 * _746;
        _750 = _760;
    }
    float _762 = _750;
    if (!_640)
    {
        _730 = _634;
    }
    float _764 = _730;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _772 + _770;
    float _776 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = rsqrt(_774);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _776);
    float _788 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _792 = -_782;
    float _794 = _792 + 1.0;
    float _796 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _798 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _806 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_794);
    float _812 = log2(_810);
    float _814 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _816 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _818 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _820 = _784 * _746;
    float _822 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _814);
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _830 = _822 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _832 = _784 * _754;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _784 * _758;
    float _838 = _804 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _842 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _844 = -_828;
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _844);
    float _848 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _850 = -_838;
    float _852 = fma(_850, _790, 1.0);
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].w, _842);
    float _856 = -_832;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _846);
    float _860 = _818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _840);
    float _864 = exp2(_848);
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = fma(_858, 0.5, 0.5);
    float _872 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].z, _862);
    float _874 = _836 + 1.0;
    float _876 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = log2(_852);
    float _882 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _886 = fma(_870, _878, -0.212114393711090087890625);
    float _888 = 1.0 / _854;
    float _890 = -_836;
    float _892 = fma(_864, _874, _890);
    float _894 = fma(_870, _886, 1.570728778839111328125);
    float _896 = fma(_892, 0.5, 0.5);
    float _898 = sqrt(_866);
    float _900 = _880 * 0.693147182464599609375;
    float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _882 * _888;
    float _906 = _884 * _888;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _898 * 0.636619746685028076171875;
    float3 _2673 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2673, float3(0.0), isnan(_2673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2673, float3(0.0), isnan(_2673)), level(0.0)).x;
    float _916 = -_894;
    float _918 = fma(_912, _916, 1.0);
    float3 _2689 = float3(_908, _910, _902);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2689, float3(0.0), isnan(_2689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2706 = float2(_918, _896);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2706, float2(0.0), isnan(_2706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2706, float2(0.0), isnan(_2706)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_49.y;
    float _943 = in.m_55.y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _955 = _953 != 0;
    float _957 = 1.0 / _947;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _961 = _959 != 0;
    out.m_57.x = _454;
    out.m_57.y = _472;
    out.m_57.z = _446;
    bool _963 = _140 > 0.5;
    bool _965 = _963 && _961;
    float _967 = 1.0 / _951;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _981 = _941 > 0.5;
    float _983 = 1.0 / _971;
    bool _985 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _987 = isnan(_378);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_943;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1005 = _943;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[119].w;
    if (_955)
    {
        float _1009 = _981 ? _999 : _943;
        _1005 = _1009;
    }
    float _1011 = _1005;
    float _1013 = _975 * _957;
    bool _1015 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1017 = isnan(_378);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _979 * _967;
    bool _1029 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1031 = isnan(_378);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = 1.0 / _1003;
    bool _1043 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_378);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -_1025;
    float _1057 = _1055 + 1.0;
    float _1059 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1061 = -_1039;
    float _1063 = _1061 + 1.0;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1067 = _1039 * _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    float _1073 = -_1053;
    float _1075 = _1073 + 1.0;
    float _1077 = _1053 * _1063;
    float _1079 = in.m_55.x;
    float _1081 = _1071 * _983;
    bool _1083 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1085 = isnan(_378);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _995 * _1075;
    float _1097 = -_995;
    float _1099 = _1097 + 1.0;
    bool _1101 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1103 = isnan(_378);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _378 + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    float _1121 = _1093 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1127 = fma(_1013, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1133 = _1111 * _1119;
    float _1135 = 1.0 / _1125;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _378 + _1137;
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = _1127 * _1133;
    float _1147 = _1131 * _1041;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _378 + _1149;
    float _1153 = fma(_1027, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1161 = _1027;
    if (_961)
    {
        _1007 = _1079;
    }
    float _1163 = _1007;
    float _1165 = fma(_1153, _1121, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1167;
    float _1171 = _1163;
    if (!_961)
    {
        _1161 = _1079;
    }
    float _1173 = _1161;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1177 = _378 + _1175;
    float _1179 = fma(_1159, _1095, _1165);
    float _1181 = _1169 * _1135;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1185 = _378 + _1183;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = fma(_1147, _1177, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1199 = _1059 * _1157;
    float _1201 = _818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1203 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = fma(_1181, _1185, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1211 = fma(_1191, _1077, _1179);
    float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1215 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1201);
    out.m_59.x = _1195;
    out.m_59.y = _1205;
    out.m_59.z = _1207;
    out.m_59.w = _1197;
    float _1217 = _1173;
    if (_965)
    {
        float _1219 = -_1163;
        float _1221 = _1219 + 1.0;
        _1171 = _1221;
    }
    float _1223 = _1171;
    float _1225 = fma(_1209, _1067, _1211);
    float _1227 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1215);
    float _1229 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1231 = exp2(_1203);
    float _1233 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_961)
    {
        _1217 = _1223;
    }
    float _1237 = _1217;
    float _1239 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1241 = _604 > 0.0;
    bool _1243 = isnan(_604);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _348 * _1229;
    float _1257 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1263 = _1239 + _854;
    float _1265 = _1259 * _1213;
    float _1267 = -_1231;
    float _1269 = _1267 + 1.0;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1263 * 0.5;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1277 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1251;
    out.m_61.y = _1271;
    out.m_61.z = _1253;
    out.m_61.w = _1257;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    out.m_63.x = _1265;
    out.m_63.y = _1199;
    out.gl_Position.x = _882;
    out.gl_Position.y = _884;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _854;
    out.m_65.z = _1273;
    out.m_65.w = _854;
    out.m_45.x = _1277;
    float _1283 = _1275 * _914;
    float _1285 = _929 * _1283;
    float _1287 = _939 * _1283;
    float _1289 = fma(_935, _1285, _923);
    float _1291 = fma(_937, _1285, _925);
    float _1293 = _929 * _1281;
    float _1295 = fma(_929, _1287, _927);
    out.m_67.x = _1289;
    out.m_67.y = _1291;
    out.m_67.z = _1295;
    out.m_67.w = _1293;
    if (_1249)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _370 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1354 = as_type<float>(_102);
        out.gl_Position.z = _1354;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1422 = as_type<float>(_138);
        out.gl_Position.z = _1422;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.x;
    float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _144 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _146 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _144 * _142;
    float _164 = 0.0;
    float _166 = _146;
    if (!_156)
    {
        float _168 = _146 * _146;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _176 = _172;
    if (!_156)
    {
        float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = in.m_47.x;
    float _184 = in.m_47.y;
    float _186 = in.m_47.z;
    float _188 = _174 * 6.283185482025146484375;
    float _190 = floor(_174);
    float _192 = _188 * 0.15915493667125701904296875;
    float _194 = _192 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = -_190;
    float _200 = _174 + _198;
    bool _202 = !_156;
    float _204 = _180;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _146 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _146);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_156;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _146 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _166 = _258;
    }
    float _260 = _166;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = -_200;
    float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _286 = !_264;
    int _288 = _286 ? 0 : 1;
    float _290 = fma(_196, 0.5, 0.5);
    float _292 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = !_160;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_288);
    float _308 = fma(_260, _182, _292);
    bool _310 = !_268;
    int _312 = _310 ? 0 : 1;
    float _314 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _320 = abs(_300);
    float _322 = fma(_260, _184, _314);
    int _324 = abs(_312);
    float _326 = fma(_260, _186, _318);
    float _328 = float(_306);
    float _330 = float(_320);
    float _332 = abs(_284);
    float _334 = _328 * _332;
    float _336 = fma(_322, _270, _274);
    float _338 = float(_324);
    float _340 = fma(_330, _304, _334);
    float _342 = fma(_308, _270, _272);
    float _344 = fma(_326, _270, _276);
    float _346 = abs(_296);
    float _348 = fma(_338, _346, _340);
    bool _350 = !_316;
    float _352 = _344;
    float _368;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _140 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_86);
        float _374 = 1.0 / _372;
        float _376 = _120 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_51.x;
    float _382 = in.m_51.y;
    float _384 = in.m_51.z;
    bool _386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _388 = isnan(0.5);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _394 = _390 || _392;
    float _396 = in.m_53.x;
    float _398 = in.m_53.y;
    float _400 = in.m_53.z;
    float _402 = _380 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = _382 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _396);
    float _410 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _398);
    float _414 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _400);
    float _418 = _410 * _408;
    float _420 = _336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _422 = _414 * _412;
    float _424 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _426 = _336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = _424 * _416;
    float _434 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _428);
    float _438 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _442 = _336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _444 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[10].z, _440);
    float _452 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _442);
    float _454 = _444 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[8].z, _448);
    float _458 = _446 + _450;
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
    float _462 = _432;
    if (_394)
    {
        _352 = 1.0;
    }
    float _464 = _352;
    float _466 = _454 + _456;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _460 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _476 = _466 + _474;
    float _478 = _470 * _470;
    float _480 = _472 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[11].x, _480);
    float _486 = sqrt(_482);
    float _488 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _484);
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _492 = _488 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _494 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[10].x, _490);
    float _496 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = 1.0 / _492;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _494);
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _506 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[9].z, _502);
    bool _508 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _492;
    float _512 = _472 + _506;
    float _514 = _510 * _498;
    float _516 = _514 * 0.5;
    float _518 = _496;
    float _520 = _506;
    float _522 = _464;
    float _524 = _512;
    if (!_508)
    {
        _462 = _466;
    }
    float _526 = _462;
    float _528 = _526;
    if (!_508)
    {
        _518 = _458;
    }
    float _530 = _518;
    float _532 = _530;
    if (!_508)
    {
        _520 = _512;
    }
    float _534 = _520;
    bool _536 = !_508;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _486 + _542;
        float _546 = rsqrt(_482);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_512, _556, _564);
        float _570 = _546 * _566;
        float _572 = fma(_476, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_470, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    if (!_394)
    {
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _584 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _582);
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _590 = 1.0 / _584;
        float _592 = 1.0 / _588;
        float _594 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _598 = fma(_590, _594, _596);
        float _600 = _598 * _592;
        float _602 = precise::clamp(_600, 0.0, 1.0);
        _522 = _602;
    }
    float _604 = _522;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _576 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _578 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _580 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _458;
    float _648 = _636;
    float _650 = _644;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    if (_640)
    {
        float _660 = rsqrt(_636);
        _648 = _660;
    }
    float _662 = _648;
    float _664 = _658;
    float _666 = _662;
    if (_640)
    {
        float _668 = _644 * _658;
        _650 = _668;
    }
    float _670 = _650;
    if (_640)
    {
        float _672 = _670 * 0.15915493667125701904296875;
        _524 = _672;
    }
    float _674 = _524;
    float _676 = _616;
    if (_640)
    {
        float _678 = _674 * 6.283185482025146484375;
        float _680 = sin(_678);
        _676 = _680;
    }
    float _682 = _676;
    float _684 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _686 = precise::max(0.0, _684);
    float _688 = _498;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = sqrt(_622);
    float _710 = _682;
    float _712 = _706;
    if (_640)
    {
        float _714 = fma(_682, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _710 = _714;
    }
    float _716 = _710;
    float _718 = _716;
    if (!_640)
    {
        _712 = _630;
    }
    float _720 = _712;
    float _722 = _720;
    if (_640)
    {
        float _724 = _696 + (-1.0);
        _690 = _724;
    }
    float _726 = _690;
    float _728 = 0.0;
    float _730 = _726;
    if (_640)
    {
        float _732 = _662 * _716;
        _728 = _732;
    }
    float _734 = _728;
    if (!_640)
    {
        _718 = _702;
    }
    float _736 = _718;
    float _738 = _736;
    if (_640)
    {
        float _740 = _726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _740;
    }
    float _742 = _664;
    if (_640)
    {
        float _744 = _628 * _734;
        _654 = _744;
    }
    float _746 = _654;
    if (!_640)
    {
        _666 = _632;
    }
    float _748 = _666;
    float _750 = _748;
    if (_640)
    {
        float _752 = _630 * _734;
        _722 = _752;
    }
    float _754 = _722;
    if (_640)
    {
        float _756 = fma(_702, _696, _742);
        _738 = _756;
    }
    float _758 = _738;
    if (_640)
    {
        float _760 = _746 * _746;
        _750 = _760;
    }
    float _762 = _750;
    if (!_640)
    {
        _730 = _634;
    }
    float _764 = _730;
    float _766 = _764;
    if (_640)
    {
        float _768 = _754 * _754;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = fma(_758, _758, _762);
    float _774 = _772 + _770;
    float _776 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = rsqrt(_774);
    float _786 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _776);
    float _788 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _792 = -_782;
    float _794 = _792 + 1.0;
    float _796 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _786);
    float _798 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _806 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_794);
    float _812 = log2(_810);
    float _814 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _816 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _818 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _820 = _784 * _746;
    float _822 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _814);
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _830 = _822 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _832 = _784 * _754;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = _784 * _758;
    float _838 = _804 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _842 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _844 = -_828;
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _844);
    float _848 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _850 = -_838;
    float _852 = fma(_850, _790, 1.0);
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].w, _842);
    float _856 = -_832;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _846);
    float _860 = _818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _840);
    float _864 = exp2(_848);
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = fma(_858, 0.5, 0.5);
    float _872 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[5].z, _862);
    float _874 = _836 + 1.0;
    float _876 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _880 = log2(_852);
    float _882 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _886 = fma(_870, _878, -0.212114393711090087890625);
    float _888 = 1.0 / _854;
    float _890 = -_836;
    float _892 = fma(_864, _874, _890);
    float _894 = fma(_870, _886, 1.570728778839111328125);
    float _896 = fma(_892, 0.5, 0.5);
    float _898 = sqrt(_866);
    float _900 = _880 * 0.693147182464599609375;
    float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _904 = _882 * _888;
    float _906 = _884 * _888;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _898 * 0.636619746685028076171875;
    float3 _2673 = float3(_908, _910, _902);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2673, float3(0.0), isnan(_2673)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2673, float3(0.0), isnan(_2673)), level(0.0)).x;
    float _916 = -_894;
    float _918 = fma(_912, _916, 1.0);
    float3 _2689 = float3(_908, _910, _902);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2689, float3(0.0), isnan(_2689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2706 = float2(_918, _896);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2706, float2(0.0), isnan(_2706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2706, float2(0.0), isnan(_2706)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_49.y;
    float _943 = in.m_55.y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _955 = _953 != 0;
    float _957 = 1.0 / _947;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _961 = _959 != 0;
    out.m_57.x = _454;
    out.m_57.y = _472;
    out.m_57.z = _446;
    bool _963 = _140 > 0.5;
    bool _965 = _963 && _961;
    float _967 = 1.0 / _951;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _981 = _941 > 0.5;
    float _983 = 1.0 / _971;
    bool _985 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _987 = isnan(_378);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_943;
    float _999 = _997 + 1.0;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1005 = _943;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[119].w;
    if (_955)
    {
        float _1009 = _981 ? _999 : _943;
        _1005 = _1009;
    }
    float _1011 = _1005;
    float _1013 = _975 * _957;
    bool _1015 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1017 = isnan(_378);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _979 * _967;
    bool _1029 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1031 = isnan(_378);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = 1.0 / _1003;
    bool _1043 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_378);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -_1025;
    float _1057 = _1055 + 1.0;
    float _1059 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1061 = -_1039;
    float _1063 = _1061 + 1.0;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1067 = _1039 * _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    float _1073 = -_1053;
    float _1075 = _1073 + 1.0;
    float _1077 = _1053 * _1063;
    float _1079 = in.m_55.x;
    float _1081 = _1071 * _983;
    bool _1083 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1085 = isnan(_378);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = _995 * _1075;
    float _1097 = -_995;
    float _1099 = _1097 + 1.0;
    bool _1101 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1103 = isnan(_378);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _378 + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    float _1121 = _1093 * _1099;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1127 = fma(_1013, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1133 = _1111 * _1119;
    float _1135 = 1.0 / _1125;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _378 + _1137;
    float _1141 = -_1111;
    float _1143 = _1141 + 1.0;
    float _1145 = _1127 * _1133;
    float _1147 = _1131 * _1041;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _378 + _1149;
    float _1153 = fma(_1027, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1159 = fma(_1081, _1151, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1161 = _1027;
    if (_961)
    {
        _1007 = _1079;
    }
    float _1163 = _1007;
    float _1165 = fma(_1153, _1121, _1155);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1167;
    float _1171 = _1163;
    if (!_961)
    {
        _1161 = _1079;
    }
    float _1173 = _1161;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1177 = _378 + _1175;
    float _1179 = fma(_1159, _1095, _1165);
    float _1181 = _1169 * _1135;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1185 = _378 + _1183;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = fma(_1147, _1177, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1199 = _1059 * _1157;
    float _1201 = _818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1203 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1205 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = fma(_1181, _1185, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1211 = fma(_1191, _1077, _1179);
    float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1215 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1201);
    out.m_59.x = _1195;
    out.m_59.y = _1205;
    out.m_59.z = _1207;
    out.m_59.w = _1197;
    float _1217 = _1173;
    if (_965)
    {
        float _1219 = -_1163;
        float _1221 = _1219 + 1.0;
        _1171 = _1221;
    }
    float _1223 = _1171;
    float _1225 = fma(_1209, _1067, _1211);
    float _1227 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1215);
    float _1229 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1231 = exp2(_1203);
    float _1233 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_961)
    {
        _1217 = _1223;
    }
    float _1237 = _1217;
    float _1239 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1241 = _604 > 0.0;
    bool _1243 = isnan(_604);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _348 * _1229;
    float _1257 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1263 = _1239 + _854;
    float _1265 = _1259 * _1213;
    float _1267 = -_1231;
    float _1269 = _1267 + 1.0;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1263 * 0.5;
    float _1275 = _1269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1277 = _1255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1251;
    out.m_61.y = _1271;
    out.m_61.z = _1253;
    out.m_61.w = _1257;
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    out.m_63.x = _1265;
    out.m_63.y = _1199;
    out.gl_Position.x = _882;
    out.gl_Position.y = _884;
    out.gl_Position.z = _1239;
    out.gl_Position.w = _854;
    out.m_65.z = _1273;
    out.m_65.w = _854;
    out.m_45.x = _1277;
    float _1283 = _1275 * _914;
    float _1285 = _929 * _1283;
    float _1287 = _939 * _1283;
    float _1289 = fma(_935, _1285, _923);
    float _1291 = fma(_937, _1285, _925);
    float _1293 = _929 * _1281;
    float _1295 = fma(_929, _1287, _927);
    out.m_67.x = _1289;
    out.m_67.y = _1291;
    out.m_67.z = _1295;
    out.m_67.w = _1293;
    if (_1249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

