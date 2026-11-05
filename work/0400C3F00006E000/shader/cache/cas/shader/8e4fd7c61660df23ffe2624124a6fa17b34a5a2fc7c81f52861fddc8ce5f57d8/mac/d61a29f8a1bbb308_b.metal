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
    float4 m_63 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1519 = as_type<float>(_112);
        out.gl_Position.z = _1519;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1587 = as_type<float>(_146);
        out.gl_Position.z = _1587;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _154;
    float _158 = in.m_51.z;
    float _160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _160;
    float _164 = _156 * _156;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = fma(_162, _162, _164);
    float _176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = fma(_178, _178, _174);
    float _198 = in.m_42.x;
    float _200 = in.m_42.y;
    float _202 = in.m_42.z;
    float _204 = sqrt(_196);
    float _206 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _148);
    float _208 = in.m_53.w;
    float _210 = _150 * 0.15915493667125701904296875;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _218 = floor(_206);
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _222 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = _210 * 6.283185482025146484375;
    float _230 = sin(_228);
    float _232 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _234 = _232 * _220;
    float _236 = _210 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = -_218;
    float _242 = _206 + _240;
    float _244 = precise::max(_204, 50.0);
    float _246 = _204;
    float _248 = _216;
    float _250 = _234;
    if (!_194)
    {
        float _252 = _216 * _216;
        float _254 = _252 * 0.5;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = precise::min(_244, 100.0);
    float _260 = _256;
    if (!_194)
    {
        float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _262;
    }
    float _264 = _260;
    bool _266 = !_194;
    float _268 = _264;
    if (!_266)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _216 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _216);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _298;
    }
    float _300 = _268;
    bool _302 = !_194;
    if (!_302)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _216 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _248 = _322;
    }
    float _324 = _248;
    float _326 = fma(_258, 0.0240000002086162567138671875, -0.900000035762786865234375);
    float _328 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_326, _152, _242);
    float _336 = fma(_324, _182, _328);
    float _338 = fma(_324, _180, _330);
    float _340 = fma(_324, _184, _332);
    float _342 = _334 * _238;
    float _344 = fma(_336, _208, _200);
    float _346 = _334 * _230;
    float _348 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _352 = fma(_338, _208, _198);
    float _354 = fma(_340, _208, _202);
    float _356 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _360 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _348 * _350;
    float _364 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _366 = _356 * _358;
    float _368 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _362 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _364);
    float _374 = _362 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _376 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[8].x, _374);
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _386 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _394 = _384 + _386;
    float _396 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _398 = in.m_55.w;
    float _400 = _390 + _392;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _394 + _402;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _408 = in.m_55.z;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _400 + _410;
    float _414 = _404 * _404;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = in.m_55.y;
    float _420 = _362 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_412, _412, _414);
    float _424 = _416 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _426 = in.m_57.y;
    float _428 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = sqrt(_422);
    float _432 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _424);
    float _434 = 0.0;
    float _436 = _394;
    if (_214)
    {
        float _438 = in.m_55.x;
        _434 = _438;
    }
    float _440 = _434;
    float _442 = _416 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _446 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _432);
    bool _448 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _450 = isnan(0.5);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _456 = _452 || _454;
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _442);
    float _460 = _416 + _444;
    float _462 = _446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _464 = _398 > 0.5;
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _458);
    float _468 = 1.0 / _462;
    bool _470 = _408 > 0.5;
    float _472 = _466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _474 = _430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = 0.0;
    float _478 = _398;
    float _480 = _408;
    if (_214)
    {
        _476 = _418;
    }
    float _482 = _476;
    float _484 = _472 + _462;
    int _486 = 0;
    float _488 = _482;
    float _490 = _484;
    if (_214)
    {
        _486 = 0;
    }
    int _492 = _486;
    float _494 = -_426;
    float _496 = _494 + 1.0;
    float _498 = 0.0;
    int _500 = _492;
    float _502 = _440;
    if (_214)
    {
        _498 = _440;
    }
    float _504 = _498;
    float _506 = _504;
    if (!_214)
    {
        float _508 = in.m_55.x;
        float _510 = _418 * 3.1415927410125732421875;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _508 * 3.1415927410125732421875;
        float _520 = _518 * 0.15915493667125701904296875;
        float _522 = _520 * 6.283185482025146484375;
        float _524 = sin(_522);
        _250 = _520;
        _500 = 1;
        _502 = _508;
        _506 = _524;
        _488 = _516;
    }
    float _526 = _250;
    int _528 = _500;
    float _530 = _502;
    float _532 = _506;
    float _534 = _488;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _542 = _540 != 0;
    float _544 = _464 ? _496 : _426;
    float _546 = _484 * _468;
    float _548 = _546 * 0.5;
    int _550 = _470 ? as_type<int>(_496) : as_type<int>(_426);
    float _552 = _538 ? _544 : _426;
    float _554 = _544;
    float _556 = _526;
    if (_456)
    {
        _478 = 1.0;
    }
    float _558 = _478;
    float _560 = _542 ? as_type<float>(_550) : _426;
    float _562 = _558;
    if (!_474)
    {
        _554 = _400;
    }
    float _564 = _554;
    float _566 = _564;
    if (!_474)
    {
        _556 = _394;
    }
    float _568 = _556;
    float _570 = _568;
    if (!_474)
    {
        _490 = _460;
    }
    float _572 = _490;
    bool _574 = !_474;
    float _576 = _572;
    if (!_574)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _582 = _430 + _580;
        float _584 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = rsqrt(_422);
        float _588 = _582 * _578;
        float _590 = _588 * 0.15915493667125701904296875;
        float _592 = _590 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = _590 * 6.283185482025146484375;
        float _598 = sin(_596);
        float _600 = _594 + (-1.0);
        float _602 = fma(_598, _584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _604 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = _586 * _602;
        float _608 = fma(_460, _594, _604);
        float _610 = fma(_412, _606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _612 = fma(_404, _606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _608;
        _566 = _610;
        _570 = _612;
    }
    float _614 = _576;
    float _616 = _566;
    float _618 = _570;
    if (!_456)
    {
        float _620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _626);
        float _630 = _622 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = _624 * 0.15915493667125701904296875;
        float _636 = _622 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = 1.0 / _632;
        float _642 = _634 * 6.283185482025146484375;
        float _644 = cos(_642);
        float _646 = _638 * _640;
        float _648 = _634 * 6.283185482025146484375;
        float _650 = sin(_648);
        float _652 = _644 * _646;
        float _654 = 1.0 / _628;
        float _656 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _658 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _656;
        float _660 = 1.0 / _652;
        float _662 = 1.0 / _658;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _666 = _654 * _664;
        float _668 = _650 * _660;
        float _670 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _672 = fma(_668, _666, _670);
        float _674 = _672 * _662;
        float _676 = precise::clamp(_674, 0.0, 1.0);
        float _678 = -_676;
        float _680 = _678 + 1.0;
        _562 = _680;
    }
    float _682 = _562;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _614 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _616 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _618 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _706 = _690 * _704;
    float _708 = _694 * _704;
    float _710 = _706 * _706;
    float _712 = _708 * _708;
    float _714 = _710 + _712;
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _716 + _720;
    float _724 = _694;
    float _726 = _714;
    float _728 = _722;
    float _730 = _704;
    if (_718)
    {
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _724 = _732;
    }
    float _734 = _724;
    if (_718)
    {
        float _736 = rsqrt(_714);
        _726 = _736;
    }
    float _738 = _726;
    if (_718)
    {
        float _740 = _722 * _734;
        _728 = _740;
    }
    float _742 = _728;
    if (_718)
    {
        float _744 = _742 * 0.15915493667125701904296875;
        _436 = _744;
    }
    float _746 = _436;
    float _748 = _696;
    float _750 = _746;
    if (_718)
    {
        float _752 = _746 * 6.283185482025146484375;
        float _754 = sin(_752);
        _748 = _754;
    }
    float _756 = _748;
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _760 = precise::max(0.0, _758);
    float _762 = _702;
    float _764 = _760;
    float _766 = _758;
    if (_718)
    {
        float _768 = _746 * 6.283185482025146484375;
        float _770 = cos(_768);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = -_704;
    float _776 = -_760;
    float _778 = fma(_686, _774, _776);
    float _780 = _778;
    if (!_718)
    {
        _764 = _706;
    }
    float _782 = _764;
    float _784 = _782;
    if (_718)
    {
        float _786 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _786;
    }
    float _788 = _766;
    float _790 = _756;
    float _792 = _788;
    if (_718)
    {
        float _794 = fma(_756, _788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _772;
    if (_718)
    {
        float _802 = _772 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = _804;
    if (_718)
    {
        float _808 = _738 * _796;
        _730 = _808;
    }
    float _810 = _730;
    if (!_718)
    {
        _798 = _710;
    }
    float _812 = _798;
    float _814 = sqrt(_700);
    float _816 = _812;
    if (_718)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _750 = _818;
    }
    float _820 = _750;
    if (_718)
    {
        float _822 = _706 * _810;
        _784 = _822;
    }
    float _824 = _784;
    if (!_718)
    {
        _806 = _708;
    }
    float _826 = _806;
    float _828 = _826;
    if (_718)
    {
        float _830 = _708 * _810;
        _828 = _830;
    }
    float _832 = _828;
    if (_718)
    {
        float _834 = fma(_778, _772, _820);
        _780 = _834;
    }
    float _836 = _780;
    if (_718)
    {
        float _838 = _824 * _824;
        _816 = _838;
    }
    float _840 = _816;
    if (!_718)
    {
        _800 = _712;
    }
    float _842 = _800;
    float _844 = _842;
    if (_718)
    {
        float _846 = _832 * _832;
        _844 = _846;
    }
    float _848 = _844;
    float _850 = fma(_836, _836, _840);
    float _852 = _850 + _848;
    float _854 = _614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _858 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _856);
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = rsqrt(_852);
    float _866 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _854);
    float _868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _870 = _614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _872 = -_860;
    float _874 = _872 + 1.0;
    float _876 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _878 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _880 = _614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _882 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _870);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _886 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _878);
    float _888 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _880);
    float _890 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _882);
    float _892 = abs(_874);
    float _894 = log2(_892);
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _898 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _888);
    float _900 = _864 * _824;
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _904 = _896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _906 = _864 * _836;
    float _908 = _900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _910 = _864 * _832;
    float _912 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _904);
    float _914 = _884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _916 = -_908;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[21].y, _916);
    float _920 = _898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _922 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _912);
    float _924 = -_914;
    float _926 = fma(_924, _868, 1.0);
    float _928 = -_910;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _918);
    float _932 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _922);
    float _936 = _896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_930, -0.5, 0.5);
    float _940 = log2(_926);
    float _942 = _896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _946 = fma(_930, 0.5, 0.5);
    float _948 = _906 + 1.0;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _942);
    float _952 = fma(_946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _954 = 1.0 / _934;
    float _956 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _950);
    float _958 = fma(_946, _952, -0.212114393711090087890625);
    float _960 = fma(_946, _958, 1.570728778839111328125);
    float _962 = sqrt(_938);
    float _964 = _940 * 0.693147182464599609375;
    float _966 = _964 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _968 = exp2(_932);
    float _970 = _962 * 0.636619746685028076171875;
    float _972 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _944);
    float _974 = -_960;
    float _976 = fma(_970, _974, 1.0);
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _972);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _956);
    float _982 = -_906;
    float _984 = fma(_968, _948, _982);
    float _986 = _978 * _954;
    float _988 = _980 * _954;
    float _990 = fma(_984, 0.5, 0.5);
    float _992 = fma(_986, 0.5, 0.5);
    float _994 = fma(_988, -0.5, 0.5);
    float3 _2931 = float3(_992, _994, _966);
    float _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2931, float3(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2931, float3(0.0), isnan(_2931)), level(0.0)).x;
    float3 _2942 = float3(_992, _994, _966);
    float4 _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float2 _2959 = float2(_976, _990);
    float3 _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2959, float2(0.0), isnan(_2959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2959, float2(0.0), isnan(_2959)), level(0.0)).xyz;
    float _1013 = _1011.x;
    float _1015 = _1011.y;
    float _1017 = _1011.z;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_57.x;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1027 = _1025 != 0;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1031 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1033 = _418 > 0.5;
    float _1035 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1045 = _1043 != 0;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1051 = _1049 != 0;
    float _1053 = 0.0;
    bool _1055 = _1039;
    int _1057 = as_type<int>(_994);
    if (_1021)
    {
        float _1059 = in.m_55.x;
        _1053 = _1059;
    }
    float _1061 = _1053;
    int _1063 = _1033 ? as_type<int>(_496) : as_type<int>(_426);
    float _1065 = fma(_1031, -2.0, _1041);
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1069 = _1067 != 0;
    float _1071 = 0.0;
    bool _1073 = _1069;
    if (_1027)
    {
        float _1075 = in.m_55.z;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1081 = _1039 ? as_type<float>(_1063) : _426;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1085 = _1069 ? as_type<float>(_550) : _426;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1089 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1065);
    float _1091 = in.m_49.w;
    float _1093 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = fma(_1079, _1085, -0.5);
    float _1101 = fma(_1093, _1081, -0.5);
    float _1103 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1105 = precise::max(_242, 0.89999997615814208984375);
    float _1107 = precise::max(0.0, _242);
    float _1109 = -_1089;
    float _1111 = fma(_1103, _1101, _1109);
    float _1113 = _1061;
    float _1115 = _1029;
    int _1117 = as_type<int>(_1093);
    int _1119 = as_type<int>(_1089);
    float _1121 = _1047;
    if (_1021)
    {
        bool _1123 = _1061 > 0.5;
        _1055 = _1123;
    }
    bool _1125 = _1055;
    float _1127 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1021)
    {
        _1113 = _1023;
    }
    float _1129 = _1113;
    float _1131 = exp2(_1035);
    float _1133 = precise::min(_1105, 1.0);
    float _1135 = _1111 + 0.5;
    float _1137 = _1129;
    int _1139 = as_type<int>(_1133);
    if (!_1021)
    {
        _1115 = _1129;
    }
    float _1141 = _1115;
    float _1143 = _1141;
    if (_1021)
    {
        _1137 = _1023;
    }
    float _1145 = _1137;
    float _1147 = _1145;
    if (_1027)
    {
        bool _1149 = _1077 > 0.5;
        _1073 = _1149;
    }
    bool _1151 = _1073;
    if (_1021)
    {
        float _1153 = -_1145;
        float _1155 = _1153 + 1.0;
        _1117 = as_type<int>(_1155);
    }
    int _1157 = _1117;
    if (_1027)
    {
        float _1159 = -_1145;
        float _1161 = _1159 + 1.0;
        _1057 = as_type<int>(_1161);
    }
    int _1163 = _1057;
    float _1165 = fma(_1133, -9.9999980926513671875, 9.9999980926513671875);
    float _1167 = as_type<float>(_1163);
    if (_1045)
    {
        float _1169 = -_1145;
        float _1171 = _1169 + 1.0;
        _1139 = as_type<int>(_1171);
    }
    int _1173 = _1139;
    if (_1051)
    {
        float _1175 = -_1145;
        float _1177 = _1175 + 1.0;
        _1119 = as_type<int>(_1177);
    }
    int _1179 = _1119;
    if (_1021)
    {
        float _1181 = _1125 ? as_type<float>(_1157) : _1145;
        _1143 = _1181;
    }
    float _1183 = _1143;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1187 = precise::min(_1107, 0.20000000298023223876953125);
    float _1189 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1027)
    {
        _1121 = _1145;
    }
    float _1191 = _1121;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    float _1197 = _1191;
    if (_1027)
    {
        float _1199 = _1151 ? as_type<float>(_1163) : _1145;
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = _1187 * 5.0;
    float _1205 = fma(_1189, _1183, -0.5);
    out.m_59.w = _1091;
    float _1207 = _1203 * _1165;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1045)
    {
        _1167 = _1145;
    }
    float _1211 = _1167;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = _1211;
    if (_1045)
    {
        float _1217 = _1033 ? as_type<float>(_1173) : _1145;
        _1215 = _1217;
    }
    float _1219 = _1215;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1051)
    {
        float _1223 = _1033 ? as_type<float>(_1179) : _1145;
        _1147 = _1223;
    }
    float _1225 = _1147;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1231 = _528 != 1;
    float _1233 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = fma(_1127, _1225, -0.5);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_61.x = _1227;
    out.m_61.y = _1229;
    out.m_61.z = _1233;
    out.m_61.w = _1237;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1239, _1201, -0.5);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1263 = _530 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1267 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1243);
    float _1269 = _532 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1271 = -_1261;
    float _1273 = fma(_1263, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_63.x = _1251;
    out.m_63.y = _1253;
    out.m_63.z = _1257;
    float _1277 = -_1265;
    float _1279 = fma(_1269, 2.0, _1277);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1287 = _1265;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1291 = _1285;
    if (!_1231)
    {
        _1287 = _418;
    }
    float _1293 = _1287;
    float _1295 = -_130;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1279);
    float _1299 = _1293;
    if (!_1231)
    {
        _1289 = _418;
    }
    float _1301 = _1289;
    float _1303 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1305 = _1301;
    if (_1231)
    {
        _1299 = _530;
    }
    float _1307 = _1299;
    float _1309 = _1207 * _1207;
    if (_1231)
    {
        _1305 = _530;
    }
    float _1311 = _1305;
    float _1313 = _534 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1315 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1285);
    if (!_1231)
    {
        _1291 = _408;
    }
    float _1317 = _1291;
    float _1319 = fma(_1303, _552, -0.5);
    float _1321 = fma(_1313, -2.0, _1283);
    float _1323 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1325 = -_130;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1273);
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1331 = _1317;
    if (_1231)
    {
        _480 = _418;
    }
    float _1333 = _480;
    float _1335 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = fma(_1323, _1205, _1327);
    float _1339 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1267);
    if (_1231)
    {
        _1331 = _418;
    }
    float _1341 = _1331;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1349 = fma(_1339, _1235, _1297);
    float _1351 = _560 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1353 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1347);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1357 = _1351 * _1329;
    float _1359 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1281);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1367 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1321);
    bool _1369 = _682 > 0.0;
    bool _1371 = isnan(_682);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(0.0);
    bool _1377 = _1373 || _1375;
    float _1379 = _1241 * _1345;
    float _1381 = fma(_1343, -2.0, _1365);
    float _1383 = _896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1385 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1361);
    float _1387 = -_1363;
    float _1389 = fma(_1335, 2.0, _1387);
    float _1391 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1381);
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1397 = -_130;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1389);
    float _1401 = -_1391;
    float _1403 = fma(_1385, _1319, _1401);
    float _1405 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1407 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1393);
    float _1409 = -_1367;
    float _1411 = fma(_1359, _1099, _1409);
    float _1413 = _1403 + 0.5;
    float _1415 = fma(_1395, _1255, _1399);
    float _1417 = _934 * 0.5;
    float _1419 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1407);
    out.m_65.x = _1379;
    out.m_65.y = _1357;
    float _1421 = _1411 + 0.5;
    float _1423 = _1415 + 0.5;
    float _1425 = fma(_980, -0.5, _1417);
    float _1427 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = _978 + _934;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    out.gl_Position.x = _978;
    out.gl_Position.y = _980;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _934;
    float _1435 = _1349 + 0.5;
    float _1437 = _1337 + 0.5;
    float _1439 = _1419 + _934;
    float _1441 = _1429 * 0.5;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1445 = _1439 * 0.5;
    out.m_67.w = _1309;
    out.m_69.x = _1435;
    out.m_69.y = _1421;
    out.m_71.x = _1437;
    out.m_71.y = _1135;
    out.m_71.z = _1423;
    out.m_71.w = _1413;
    out.m_73.x = _1441;
    out.m_73.y = _1425;
    out.m_73.z = _1445;
    out.m_73.w = _934;
    out.m_45.x = _1443;
    float _1447 = _1405 * _996;
    float _1449 = _1007 * _1447;
    float _1451 = _1017 * _1447;
    float _1453 = fma(_1013, _1449, _1001);
    float _1455 = fma(_1015, _1449, _1003);
    float _1457 = _1007 * _1433;
    float _1459 = fma(_1007, _1451, _1005);
    out.m_75.x = _1453;
    out.m_75.y = _1455;
    out.m_75.z = _1459;
    out.m_75.w = _1457;
    if (_1377)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1461;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1519 = as_type<float>(_112);
        out.gl_Position.z = _1519;
    }
    if (!_98)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1587 = as_type<float>(_146);
        out.gl_Position.z = _1587;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _154;
    float _158 = in.m_51.z;
    float _160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _160;
    float _164 = _156 * _156;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = fma(_162, _162, _164);
    float _176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = fma(_178, _178, _174);
    float _198 = in.m_42.x;
    float _200 = in.m_42.y;
    float _202 = in.m_42.z;
    float _204 = sqrt(_196);
    float _206 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _148);
    float _208 = in.m_53.w;
    float _210 = _150 * 0.15915493667125701904296875;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _218 = floor(_206);
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _222 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = _210 * 6.283185482025146484375;
    float _230 = sin(_228);
    float _232 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _234 = _232 * _220;
    float _236 = _210 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = -_218;
    float _242 = _206 + _240;
    float _244 = precise::max(_204, 50.0);
    float _246 = _204;
    float _248 = _216;
    float _250 = _234;
    if (!_194)
    {
        float _252 = _216 * _216;
        float _254 = _252 * 0.5;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = precise::min(_244, 100.0);
    float _260 = _256;
    if (!_194)
    {
        float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _262;
    }
    float _264 = _260;
    bool _266 = !_194;
    float _268 = _264;
    if (!_266)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _216 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _216);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _298;
    }
    float _300 = _268;
    bool _302 = !_194;
    if (!_302)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _216 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _248 = _322;
    }
    float _324 = _248;
    float _326 = fma(_258, 0.0240000002086162567138671875, -0.900000035762786865234375);
    float _328 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_326, _152, _242);
    float _336 = fma(_324, _182, _328);
    float _338 = fma(_324, _180, _330);
    float _340 = fma(_324, _184, _332);
    float _342 = _334 * _238;
    float _344 = fma(_336, _208, _200);
    float _346 = _334 * _230;
    float _348 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _352 = fma(_338, _208, _198);
    float _354 = fma(_340, _208, _202);
    float _356 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _360 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _348 * _350;
    float _364 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _366 = _356 * _358;
    float _368 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _362 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _364);
    float _374 = _362 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _376 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[8].x, _374);
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _386 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _394 = _384 + _386;
    float _396 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _398 = in.m_55.w;
    float _400 = _390 + _392;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _394 + _402;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _408 = in.m_55.z;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _400 + _410;
    float _414 = _404 * _404;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = in.m_55.y;
    float _420 = _362 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_412, _412, _414);
    float _424 = _416 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _426 = in.m_57.y;
    float _428 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = sqrt(_422);
    float _432 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _424);
    float _434 = 0.0;
    float _436 = _394;
    if (_214)
    {
        float _438 = in.m_55.x;
        _434 = _438;
    }
    float _440 = _434;
    float _442 = _416 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _446 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _432);
    bool _448 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _450 = isnan(0.5);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _456 = _452 || _454;
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _442);
    float _460 = _416 + _444;
    float _462 = _446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _464 = _398 > 0.5;
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _458);
    float _468 = 1.0 / _462;
    bool _470 = _408 > 0.5;
    float _472 = _466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _474 = _430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = 0.0;
    float _478 = _398;
    float _480 = _408;
    if (_214)
    {
        _476 = _418;
    }
    float _482 = _476;
    float _484 = _472 + _462;
    int _486 = 0;
    float _488 = _482;
    float _490 = _484;
    if (_214)
    {
        _486 = 0;
    }
    int _492 = _486;
    float _494 = -_426;
    float _496 = _494 + 1.0;
    float _498 = 0.0;
    int _500 = _492;
    float _502 = _440;
    if (_214)
    {
        _498 = _440;
    }
    float _504 = _498;
    float _506 = _504;
    if (!_214)
    {
        float _508 = in.m_55.x;
        float _510 = _418 * 3.1415927410125732421875;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _508 * 3.1415927410125732421875;
        float _520 = _518 * 0.15915493667125701904296875;
        float _522 = _520 * 6.283185482025146484375;
        float _524 = sin(_522);
        _250 = _520;
        _500 = 1;
        _502 = _508;
        _506 = _524;
        _488 = _516;
    }
    float _526 = _250;
    int _528 = _500;
    float _530 = _502;
    float _532 = _506;
    float _534 = _488;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _542 = _540 != 0;
    float _544 = _464 ? _496 : _426;
    float _546 = _484 * _468;
    float _548 = _546 * 0.5;
    int _550 = _470 ? as_type<int>(_496) : as_type<int>(_426);
    float _552 = _538 ? _544 : _426;
    float _554 = _544;
    float _556 = _526;
    if (_456)
    {
        _478 = 1.0;
    }
    float _558 = _478;
    float _560 = _542 ? as_type<float>(_550) : _426;
    float _562 = _558;
    if (!_474)
    {
        _554 = _400;
    }
    float _564 = _554;
    float _566 = _564;
    if (!_474)
    {
        _556 = _394;
    }
    float _568 = _556;
    float _570 = _568;
    if (!_474)
    {
        _490 = _460;
    }
    float _572 = _490;
    bool _574 = !_474;
    float _576 = _572;
    if (!_574)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _582 = _430 + _580;
        float _584 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = rsqrt(_422);
        float _588 = _582 * _578;
        float _590 = _588 * 0.15915493667125701904296875;
        float _592 = _590 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = _590 * 6.283185482025146484375;
        float _598 = sin(_596);
        float _600 = _594 + (-1.0);
        float _602 = fma(_598, _584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _604 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = _586 * _602;
        float _608 = fma(_460, _594, _604);
        float _610 = fma(_412, _606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _612 = fma(_404, _606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _608;
        _566 = _610;
        _570 = _612;
    }
    float _614 = _576;
    float _616 = _566;
    float _618 = _570;
    if (!_456)
    {
        float _620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _626);
        float _630 = _622 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = _624 * 0.15915493667125701904296875;
        float _636 = _622 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = 1.0 / _632;
        float _642 = _634 * 6.283185482025146484375;
        float _644 = cos(_642);
        float _646 = _638 * _640;
        float _648 = _634 * 6.283185482025146484375;
        float _650 = sin(_648);
        float _652 = _644 * _646;
        float _654 = 1.0 / _628;
        float _656 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _658 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _656;
        float _660 = 1.0 / _652;
        float _662 = 1.0 / _658;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _666 = _654 * _664;
        float _668 = _650 * _660;
        float _670 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _672 = fma(_668, _666, _670);
        float _674 = _672 * _662;
        float _676 = precise::clamp(_674, 0.0, 1.0);
        float _678 = -_676;
        float _680 = _678 + 1.0;
        _562 = _680;
    }
    float _682 = _562;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _614 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _616 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _618 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _706 = _690 * _704;
    float _708 = _694 * _704;
    float _710 = _706 * _706;
    float _712 = _708 * _708;
    float _714 = _710 + _712;
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _716 + _720;
    float _724 = _694;
    float _726 = _714;
    float _728 = _722;
    float _730 = _704;
    if (_718)
    {
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _724 = _732;
    }
    float _734 = _724;
    if (_718)
    {
        float _736 = rsqrt(_714);
        _726 = _736;
    }
    float _738 = _726;
    if (_718)
    {
        float _740 = _722 * _734;
        _728 = _740;
    }
    float _742 = _728;
    if (_718)
    {
        float _744 = _742 * 0.15915493667125701904296875;
        _436 = _744;
    }
    float _746 = _436;
    float _748 = _696;
    float _750 = _746;
    if (_718)
    {
        float _752 = _746 * 6.283185482025146484375;
        float _754 = sin(_752);
        _748 = _754;
    }
    float _756 = _748;
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _760 = precise::max(0.0, _758);
    float _762 = _702;
    float _764 = _760;
    float _766 = _758;
    if (_718)
    {
        float _768 = _746 * 6.283185482025146484375;
        float _770 = cos(_768);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = -_704;
    float _776 = -_760;
    float _778 = fma(_686, _774, _776);
    float _780 = _778;
    if (!_718)
    {
        _764 = _706;
    }
    float _782 = _764;
    float _784 = _782;
    if (_718)
    {
        float _786 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _786;
    }
    float _788 = _766;
    float _790 = _756;
    float _792 = _788;
    if (_718)
    {
        float _794 = fma(_756, _788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _772;
    if (_718)
    {
        float _802 = _772 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = _804;
    if (_718)
    {
        float _808 = _738 * _796;
        _730 = _808;
    }
    float _810 = _730;
    if (!_718)
    {
        _798 = _710;
    }
    float _812 = _798;
    float _814 = sqrt(_700);
    float _816 = _812;
    if (_718)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _750 = _818;
    }
    float _820 = _750;
    if (_718)
    {
        float _822 = _706 * _810;
        _784 = _822;
    }
    float _824 = _784;
    if (!_718)
    {
        _806 = _708;
    }
    float _826 = _806;
    float _828 = _826;
    if (_718)
    {
        float _830 = _708 * _810;
        _828 = _830;
    }
    float _832 = _828;
    if (_718)
    {
        float _834 = fma(_778, _772, _820);
        _780 = _834;
    }
    float _836 = _780;
    if (_718)
    {
        float _838 = _824 * _824;
        _816 = _838;
    }
    float _840 = _816;
    if (!_718)
    {
        _800 = _712;
    }
    float _842 = _800;
    float _844 = _842;
    if (_718)
    {
        float _846 = _832 * _832;
        _844 = _846;
    }
    float _848 = _844;
    float _850 = fma(_836, _836, _840);
    float _852 = _850 + _848;
    float _854 = _614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _858 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _856);
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = rsqrt(_852);
    float _866 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _854);
    float _868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _870 = _614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _872 = -_860;
    float _874 = _872 + 1.0;
    float _876 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _878 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _880 = _614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _882 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _870);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _886 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _878);
    float _888 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _880);
    float _890 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _882);
    float _892 = abs(_874);
    float _894 = log2(_892);
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _898 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _888);
    float _900 = _864 * _824;
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _904 = _896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _906 = _864 * _836;
    float _908 = _900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _910 = _864 * _832;
    float _912 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _904);
    float _914 = _884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _916 = -_908;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[21].y, _916);
    float _920 = _898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _922 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _912);
    float _924 = -_914;
    float _926 = fma(_924, _868, 1.0);
    float _928 = -_910;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _918);
    float _932 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _922);
    float _936 = _896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_930, -0.5, 0.5);
    float _940 = log2(_926);
    float _942 = _896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _946 = fma(_930, 0.5, 0.5);
    float _948 = _906 + 1.0;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _942);
    float _952 = fma(_946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _954 = 1.0 / _934;
    float _956 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _950);
    float _958 = fma(_946, _952, -0.212114393711090087890625);
    float _960 = fma(_946, _958, 1.570728778839111328125);
    float _962 = sqrt(_938);
    float _964 = _940 * 0.693147182464599609375;
    float _966 = _964 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _968 = exp2(_932);
    float _970 = _962 * 0.636619746685028076171875;
    float _972 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _944);
    float _974 = -_960;
    float _976 = fma(_970, _974, 1.0);
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _972);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _956);
    float _982 = -_906;
    float _984 = fma(_968, _948, _982);
    float _986 = _978 * _954;
    float _988 = _980 * _954;
    float _990 = fma(_984, 0.5, 0.5);
    float _992 = fma(_986, 0.5, 0.5);
    float _994 = fma(_988, -0.5, 0.5);
    float3 _2931 = float3(_992, _994, _966);
    float _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2931, float3(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2931, float3(0.0), isnan(_2931)), level(0.0)).x;
    float3 _2942 = float3(_992, _994, _966);
    float4 _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float2 _2959 = float2(_976, _990);
    float3 _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2959, float2(0.0), isnan(_2959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2959, float2(0.0), isnan(_2959)), level(0.0)).xyz;
    float _1013 = _1011.x;
    float _1015 = _1011.y;
    float _1017 = _1011.z;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_57.x;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1027 = _1025 != 0;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1031 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1033 = _418 > 0.5;
    float _1035 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1045 = _1043 != 0;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1051 = _1049 != 0;
    float _1053 = 0.0;
    bool _1055 = _1039;
    int _1057 = as_type<int>(_994);
    if (_1021)
    {
        float _1059 = in.m_55.x;
        _1053 = _1059;
    }
    float _1061 = _1053;
    int _1063 = _1033 ? as_type<int>(_496) : as_type<int>(_426);
    float _1065 = fma(_1031, -2.0, _1041);
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1069 = _1067 != 0;
    float _1071 = 0.0;
    bool _1073 = _1069;
    if (_1027)
    {
        float _1075 = in.m_55.z;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1081 = _1039 ? as_type<float>(_1063) : _426;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1085 = _1069 ? as_type<float>(_550) : _426;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1089 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1065);
    float _1091 = in.m_49.w;
    float _1093 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = fma(_1079, _1085, -0.5);
    float _1101 = fma(_1093, _1081, -0.5);
    float _1103 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1105 = precise::max(_242, 0.89999997615814208984375);
    float _1107 = precise::max(0.0, _242);
    float _1109 = -_1089;
    float _1111 = fma(_1103, _1101, _1109);
    float _1113 = _1061;
    float _1115 = _1029;
    int _1117 = as_type<int>(_1093);
    int _1119 = as_type<int>(_1089);
    float _1121 = _1047;
    if (_1021)
    {
        bool _1123 = _1061 > 0.5;
        _1055 = _1123;
    }
    bool _1125 = _1055;
    float _1127 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1021)
    {
        _1113 = _1023;
    }
    float _1129 = _1113;
    float _1131 = exp2(_1035);
    float _1133 = precise::min(_1105, 1.0);
    float _1135 = _1111 + 0.5;
    float _1137 = _1129;
    int _1139 = as_type<int>(_1133);
    if (!_1021)
    {
        _1115 = _1129;
    }
    float _1141 = _1115;
    float _1143 = _1141;
    if (_1021)
    {
        _1137 = _1023;
    }
    float _1145 = _1137;
    float _1147 = _1145;
    if (_1027)
    {
        bool _1149 = _1077 > 0.5;
        _1073 = _1149;
    }
    bool _1151 = _1073;
    if (_1021)
    {
        float _1153 = -_1145;
        float _1155 = _1153 + 1.0;
        _1117 = as_type<int>(_1155);
    }
    int _1157 = _1117;
    if (_1027)
    {
        float _1159 = -_1145;
        float _1161 = _1159 + 1.0;
        _1057 = as_type<int>(_1161);
    }
    int _1163 = _1057;
    float _1165 = fma(_1133, -9.9999980926513671875, 9.9999980926513671875);
    float _1167 = as_type<float>(_1163);
    if (_1045)
    {
        float _1169 = -_1145;
        float _1171 = _1169 + 1.0;
        _1139 = as_type<int>(_1171);
    }
    int _1173 = _1139;
    if (_1051)
    {
        float _1175 = -_1145;
        float _1177 = _1175 + 1.0;
        _1119 = as_type<int>(_1177);
    }
    int _1179 = _1119;
    if (_1021)
    {
        float _1181 = _1125 ? as_type<float>(_1157) : _1145;
        _1143 = _1181;
    }
    float _1183 = _1143;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1187 = precise::min(_1107, 0.20000000298023223876953125);
    float _1189 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1027)
    {
        _1121 = _1145;
    }
    float _1191 = _1121;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    float _1197 = _1191;
    if (_1027)
    {
        float _1199 = _1151 ? as_type<float>(_1163) : _1145;
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = _1187 * 5.0;
    float _1205 = fma(_1189, _1183, -0.5);
    out.m_59.w = _1091;
    float _1207 = _1203 * _1165;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1045)
    {
        _1167 = _1145;
    }
    float _1211 = _1167;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = _1211;
    if (_1045)
    {
        float _1217 = _1033 ? as_type<float>(_1173) : _1145;
        _1215 = _1217;
    }
    float _1219 = _1215;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1051)
    {
        float _1223 = _1033 ? as_type<float>(_1179) : _1145;
        _1147 = _1223;
    }
    float _1225 = _1147;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1231 = _528 != 1;
    float _1233 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = fma(_1127, _1225, -0.5);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_61.x = _1227;
    out.m_61.y = _1229;
    out.m_61.z = _1233;
    out.m_61.w = _1237;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1239, _1201, -0.5);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1263 = _530 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1267 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1243);
    float _1269 = _532 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1271 = -_1261;
    float _1273 = fma(_1263, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_63.x = _1251;
    out.m_63.y = _1253;
    out.m_63.z = _1257;
    float _1277 = -_1265;
    float _1279 = fma(_1269, 2.0, _1277);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1287 = _1265;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1291 = _1285;
    if (!_1231)
    {
        _1287 = _418;
    }
    float _1293 = _1287;
    float _1295 = -_130;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1279);
    float _1299 = _1293;
    if (!_1231)
    {
        _1289 = _418;
    }
    float _1301 = _1289;
    float _1303 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1305 = _1301;
    if (_1231)
    {
        _1299 = _530;
    }
    float _1307 = _1299;
    float _1309 = _1207 * _1207;
    if (_1231)
    {
        _1305 = _530;
    }
    float _1311 = _1305;
    float _1313 = _534 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1315 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1285);
    if (!_1231)
    {
        _1291 = _408;
    }
    float _1317 = _1291;
    float _1319 = fma(_1303, _552, -0.5);
    float _1321 = fma(_1313, -2.0, _1283);
    float _1323 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1325 = -_130;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1273);
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1331 = _1317;
    if (_1231)
    {
        _480 = _418;
    }
    float _1333 = _480;
    float _1335 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = fma(_1323, _1205, _1327);
    float _1339 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1267);
    if (_1231)
    {
        _1331 = _418;
    }
    float _1341 = _1331;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1349 = fma(_1339, _1235, _1297);
    float _1351 = _560 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1353 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1347);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1357 = _1351 * _1329;
    float _1359 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1281);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1367 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1321);
    bool _1369 = _682 > 0.0;
    bool _1371 = isnan(_682);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(0.0);
    bool _1377 = _1373 || _1375;
    float _1379 = _1241 * _1345;
    float _1381 = fma(_1343, -2.0, _1365);
    float _1383 = _896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1385 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1361);
    float _1387 = -_1363;
    float _1389 = fma(_1335, 2.0, _1387);
    float _1391 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1381);
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1397 = -_130;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1389);
    float _1401 = -_1391;
    float _1403 = fma(_1385, _1319, _1401);
    float _1405 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1407 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1393);
    float _1409 = -_1367;
    float _1411 = fma(_1359, _1099, _1409);
    float _1413 = _1403 + 0.5;
    float _1415 = fma(_1395, _1255, _1399);
    float _1417 = _934 * 0.5;
    float _1419 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1407);
    out.m_65.x = _1379;
    out.m_65.y = _1357;
    float _1421 = _1411 + 0.5;
    float _1423 = _1415 + 0.5;
    float _1425 = fma(_980, -0.5, _1417);
    float _1427 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = _978 + _934;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    out.gl_Position.x = _978;
    out.gl_Position.y = _980;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _934;
    float _1435 = _1349 + 0.5;
    float _1437 = _1337 + 0.5;
    float _1439 = _1419 + _934;
    float _1441 = _1429 * 0.5;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1445 = _1439 * 0.5;
    out.m_67.w = _1309;
    out.m_69.x = _1435;
    out.m_69.y = _1421;
    out.m_71.x = _1437;
    out.m_71.y = _1135;
    out.m_71.z = _1423;
    out.m_71.w = _1413;
    out.m_73.x = _1441;
    out.m_73.y = _1425;
    out.m_73.z = _1445;
    out.m_73.w = _934;
    out.m_45.x = _1443;
    float _1447 = _1405 * _996;
    float _1449 = _1007 * _1447;
    float _1451 = _1017 * _1447;
    float _1453 = fma(_1013, _1449, _1001);
    float _1455 = fma(_1015, _1449, _1003);
    float _1457 = _1007 * _1433;
    float _1459 = fma(_1007, _1451, _1005);
    out.m_75.x = _1453;
    out.m_75.y = _1455;
    out.m_75.z = _1459;
    out.m_75.w = _1457;
    if (_1377)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1461;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    float _106 = _104;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1519 = as_type<float>(_112);
        out.gl_Position.z = _1519;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_94);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _114 = as_type<int>(_144);
    }
    int _146 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1587 = as_type<float>(_146);
        out.gl_Position.z = _1587;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _154;
    float _158 = in.m_51.z;
    float _160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _160;
    float _164 = _156 * _156;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = fma(_162, _162, _164);
    float _176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _176;
    float _180 = in.m_47.x;
    float _182 = in.m_47.y;
    float _184 = in.m_47.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = fma(_178, _178, _174);
    float _198 = in.m_42.x;
    float _200 = in.m_42.y;
    float _202 = in.m_42.z;
    float _204 = sqrt(_196);
    float _206 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _148);
    float _208 = in.m_53.w;
    float _210 = _150 * 0.15915493667125701904296875;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _218 = floor(_206);
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _222 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = _210 * 6.283185482025146484375;
    float _230 = sin(_228);
    float _232 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _234 = _232 * _220;
    float _236 = _210 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = -_218;
    float _242 = _206 + _240;
    float _244 = precise::max(_204, 50.0);
    float _246 = _204;
    float _248 = _216;
    float _250 = _234;
    if (!_194)
    {
        float _252 = _216 * _216;
        float _254 = _252 * 0.5;
        _246 = _254;
    }
    float _256 = _246;
    float _258 = precise::min(_244, 100.0);
    float _260 = _256;
    if (!_194)
    {
        float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _262;
    }
    float _264 = _260;
    bool _266 = !_194;
    float _268 = _264;
    if (!_266)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _216 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _216);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _298;
    }
    float _300 = _268;
    bool _302 = !_194;
    if (!_302)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = 1.0 / _310;
        float _314 = _216 * _306;
        float _316 = exp2(_314);
        float _318 = -_316;
        float _320 = _318 + 1.0;
        float _322 = _320 * _312;
        _248 = _322;
    }
    float _324 = _248;
    float _326 = fma(_258, 0.0240000002086162567138671875, -0.900000035762786865234375);
    float _328 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _300 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = fma(_326, _152, _242);
    float _336 = fma(_324, _182, _328);
    float _338 = fma(_324, _180, _330);
    float _340 = fma(_324, _184, _332);
    float _342 = _334 * _238;
    float _344 = fma(_336, _208, _200);
    float _346 = _334 * _230;
    float _348 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _352 = fma(_338, _208, _198);
    float _354 = fma(_340, _208, _202);
    float _356 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _360 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _348 * _350;
    float _364 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _366 = _356 * _358;
    float _368 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _362 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _364);
    float _374 = _362 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _376 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _378 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[8].x, _374);
    float _384 = _376 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _386 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _392 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _394 = _384 + _386;
    float _396 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _398 = in.m_55.w;
    float _400 = _390 + _392;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _394 + _402;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _408 = in.m_55.z;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _400 + _410;
    float _414 = _404 * _404;
    float _416 = _406 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _418 = in.m_55.y;
    float _420 = _362 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_412, _412, _414);
    float _424 = _416 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _426 = in.m_57.y;
    float _428 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _430 = sqrt(_422);
    float _432 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _424);
    float _434 = 0.0;
    float _436 = _394;
    if (_214)
    {
        float _438 = in.m_55.x;
        _434 = _438;
    }
    float _440 = _434;
    float _442 = _416 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _444 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _446 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _432);
    bool _448 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _450 = isnan(0.5);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _456 = _452 || _454;
    float _458 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _442);
    float _460 = _416 + _444;
    float _462 = _446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _464 = _398 > 0.5;
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _458);
    float _468 = 1.0 / _462;
    bool _470 = _408 > 0.5;
    float _472 = _466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _474 = _430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _476 = 0.0;
    float _478 = _398;
    float _480 = _408;
    if (_214)
    {
        _476 = _418;
    }
    float _482 = _476;
    float _484 = _472 + _462;
    int _486 = 0;
    float _488 = _482;
    float _490 = _484;
    if (_214)
    {
        _486 = 0;
    }
    int _492 = _486;
    float _494 = -_426;
    float _496 = _494 + 1.0;
    float _498 = 0.0;
    int _500 = _492;
    float _502 = _440;
    if (_214)
    {
        _498 = _440;
    }
    float _504 = _498;
    float _506 = _504;
    if (!_214)
    {
        float _508 = in.m_55.x;
        float _510 = _418 * 3.1415927410125732421875;
        float _512 = _510 * 0.15915493667125701904296875;
        float _514 = _512 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _508 * 3.1415927410125732421875;
        float _520 = _518 * 0.15915493667125701904296875;
        float _522 = _520 * 6.283185482025146484375;
        float _524 = sin(_522);
        _250 = _520;
        _500 = 1;
        _502 = _508;
        _506 = _524;
        _488 = _516;
    }
    float _526 = _250;
    int _528 = _500;
    float _530 = _502;
    float _532 = _506;
    float _534 = _488;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _542 = _540 != 0;
    float _544 = _464 ? _496 : _426;
    float _546 = _484 * _468;
    float _548 = _546 * 0.5;
    int _550 = _470 ? as_type<int>(_496) : as_type<int>(_426);
    float _552 = _538 ? _544 : _426;
    float _554 = _544;
    float _556 = _526;
    if (_456)
    {
        _478 = 1.0;
    }
    float _558 = _478;
    float _560 = _542 ? as_type<float>(_550) : _426;
    float _562 = _558;
    if (!_474)
    {
        _554 = _400;
    }
    float _564 = _554;
    float _566 = _564;
    if (!_474)
    {
        _556 = _394;
    }
    float _568 = _556;
    float _570 = _568;
    if (!_474)
    {
        _490 = _460;
    }
    float _572 = _490;
    bool _574 = !_474;
    float _576 = _572;
    if (!_574)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _582 = _430 + _580;
        float _584 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = rsqrt(_422);
        float _588 = _582 * _578;
        float _590 = _588 * 0.15915493667125701904296875;
        float _592 = _590 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = _590 * 6.283185482025146484375;
        float _598 = sin(_596);
        float _600 = _594 + (-1.0);
        float _602 = fma(_598, _584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _604 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = _586 * _602;
        float _608 = fma(_460, _594, _604);
        float _610 = fma(_412, _606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _612 = fma(_404, _606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _608;
        _566 = _610;
        _570 = _612;
    }
    float _614 = _576;
    float _616 = _566;
    float _618 = _570;
    if (!_456)
    {
        float _620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _626 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _626);
        float _630 = _622 * 6.283185482025146484375;
        float _632 = cos(_630);
        float _634 = _624 * 0.15915493667125701904296875;
        float _636 = _622 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = 1.0 / _632;
        float _642 = _634 * 6.283185482025146484375;
        float _644 = cos(_642);
        float _646 = _638 * _640;
        float _648 = _634 * 6.283185482025146484375;
        float _650 = sin(_648);
        float _652 = _644 * _646;
        float _654 = 1.0 / _628;
        float _656 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _658 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _656;
        float _660 = 1.0 / _652;
        float _662 = 1.0 / _658;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _666 = _654 * _664;
        float _668 = _650 * _660;
        float _670 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _672 = fma(_668, _666, _670);
        float _674 = _672 * _662;
        float _676 = precise::clamp(_674, 0.0, 1.0);
        float _678 = -_676;
        float _680 = _678 + 1.0;
        _562 = _680;
    }
    float _682 = _562;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _686 = _614 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _616 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _618 + _692;
    float _696 = _686 * _686;
    float _698 = fma(_690, _690, _696);
    float _700 = fma(_694, _694, _698);
    float _702 = rsqrt(_700);
    float _704 = _702 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _706 = _690 * _704;
    float _708 = _694 * _704;
    float _710 = _706 * _706;
    float _712 = _708 * _708;
    float _714 = _710 + _712;
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _722 = _716 + _720;
    float _724 = _694;
    float _726 = _714;
    float _728 = _722;
    float _730 = _704;
    if (_718)
    {
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _724 = _732;
    }
    float _734 = _724;
    if (_718)
    {
        float _736 = rsqrt(_714);
        _726 = _736;
    }
    float _738 = _726;
    if (_718)
    {
        float _740 = _722 * _734;
        _728 = _740;
    }
    float _742 = _728;
    if (_718)
    {
        float _744 = _742 * 0.15915493667125701904296875;
        _436 = _744;
    }
    float _746 = _436;
    float _748 = _696;
    float _750 = _746;
    if (_718)
    {
        float _752 = _746 * 6.283185482025146484375;
        float _754 = sin(_752);
        _748 = _754;
    }
    float _756 = _748;
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _760 = precise::max(0.0, _758);
    float _762 = _702;
    float _764 = _760;
    float _766 = _758;
    if (_718)
    {
        float _768 = _746 * 6.283185482025146484375;
        float _770 = cos(_768);
        _762 = _770;
    }
    float _772 = _762;
    float _774 = -_704;
    float _776 = -_760;
    float _778 = fma(_686, _774, _776);
    float _780 = _778;
    if (!_718)
    {
        _764 = _706;
    }
    float _782 = _764;
    float _784 = _782;
    if (_718)
    {
        float _786 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _766 = _786;
    }
    float _788 = _766;
    float _790 = _756;
    float _792 = _788;
    if (_718)
    {
        float _794 = fma(_756, _788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _790 = _794;
    }
    float _796 = _790;
    float _798 = _796;
    float _800 = _772;
    if (_718)
    {
        float _802 = _772 + (-1.0);
        _792 = _802;
    }
    float _804 = _792;
    float _806 = _804;
    if (_718)
    {
        float _808 = _738 * _796;
        _730 = _808;
    }
    float _810 = _730;
    if (!_718)
    {
        _798 = _710;
    }
    float _812 = _798;
    float _814 = sqrt(_700);
    float _816 = _812;
    if (_718)
    {
        float _818 = _804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _750 = _818;
    }
    float _820 = _750;
    if (_718)
    {
        float _822 = _706 * _810;
        _784 = _822;
    }
    float _824 = _784;
    if (!_718)
    {
        _806 = _708;
    }
    float _826 = _806;
    float _828 = _826;
    if (_718)
    {
        float _830 = _708 * _810;
        _828 = _830;
    }
    float _832 = _828;
    if (_718)
    {
        float _834 = fma(_778, _772, _820);
        _780 = _834;
    }
    float _836 = _780;
    if (_718)
    {
        float _838 = _824 * _824;
        _816 = _838;
    }
    float _840 = _816;
    if (!_718)
    {
        _800 = _712;
    }
    float _842 = _800;
    float _844 = _842;
    if (_718)
    {
        float _846 = _832 * _832;
        _844 = _846;
    }
    float _848 = _844;
    float _850 = fma(_836, _836, _840);
    float _852 = _850 + _848;
    float _854 = _614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _858 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _856);
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = rsqrt(_852);
    float _866 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _854);
    float _868 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _870 = _614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _872 = -_860;
    float _874 = _872 + 1.0;
    float _876 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _866);
    float _878 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _880 = _614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _882 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _870);
    float _884 = _876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _886 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _878);
    float _888 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _880);
    float _890 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _882);
    float _892 = abs(_874);
    float _894 = log2(_892);
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _898 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _888);
    float _900 = _864 * _824;
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _904 = _896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _906 = _864 * _836;
    float _908 = _900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _910 = _864 * _832;
    float _912 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _904);
    float _914 = _884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _916 = -_908;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[21].y, _916);
    float _920 = _898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _922 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _912);
    float _924 = -_914;
    float _926 = fma(_924, _868, 1.0);
    float _928 = -_910;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _918);
    float _932 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _922);
    float _936 = _896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _938 = fma(_930, -0.5, 0.5);
    float _940 = log2(_926);
    float _942 = _896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _944 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _936);
    float _946 = fma(_930, 0.5, 0.5);
    float _948 = _906 + 1.0;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _942);
    float _952 = fma(_946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _954 = 1.0 / _934;
    float _956 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _950);
    float _958 = fma(_946, _952, -0.212114393711090087890625);
    float _960 = fma(_946, _958, 1.570728778839111328125);
    float _962 = sqrt(_938);
    float _964 = _940 * 0.693147182464599609375;
    float _966 = _964 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _968 = exp2(_932);
    float _970 = _962 * 0.636619746685028076171875;
    float _972 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _944);
    float _974 = -_960;
    float _976 = fma(_970, _974, 1.0);
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _972);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _956);
    float _982 = -_906;
    float _984 = fma(_968, _948, _982);
    float _986 = _978 * _954;
    float _988 = _980 * _954;
    float _990 = fma(_984, 0.5, 0.5);
    float _992 = fma(_986, 0.5, 0.5);
    float _994 = fma(_988, -0.5, 0.5);
    float3 _2931 = float3(_992, _994, _966);
    float _996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2931, float3(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2931, float3(0.0), isnan(_2931)), level(0.0)).x;
    float3 _2942 = float3(_992, _994, _966);
    float4 _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).xyzw;
    float _1001 = _999.x;
    float _1003 = _999.y;
    float _1005 = _999.z;
    float _1007 = _999.w;
    float2 _2959 = float2(_976, _990);
    float3 _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2959, float2(0.0), isnan(_2959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2959, float2(0.0), isnan(_2959)), level(0.0)).xyz;
    float _1013 = _1011.x;
    float _1015 = _1011.y;
    float _1017 = _1011.z;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1021 = _1019 != 0;
    float _1023 = in.m_57.x;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1027 = _1025 != 0;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1031 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1033 = _418 > 0.5;
    float _1035 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1039 = _1037 != 0;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1045 = _1043 != 0;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1051 = _1049 != 0;
    float _1053 = 0.0;
    bool _1055 = _1039;
    int _1057 = as_type<int>(_994);
    if (_1021)
    {
        float _1059 = in.m_55.x;
        _1053 = _1059;
    }
    float _1061 = _1053;
    int _1063 = _1033 ? as_type<int>(_496) : as_type<int>(_426);
    float _1065 = fma(_1031, -2.0, _1041);
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1069 = _1067 != 0;
    float _1071 = 0.0;
    bool _1073 = _1069;
    if (_1027)
    {
        float _1075 = in.m_55.z;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1081 = _1039 ? as_type<float>(_1063) : _426;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1085 = _1069 ? as_type<float>(_550) : _426;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1089 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1065);
    float _1091 = in.m_49.w;
    float _1093 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1095 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = fma(_1079, _1085, -0.5);
    float _1101 = fma(_1093, _1081, -0.5);
    float _1103 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1105 = precise::max(_242, 0.89999997615814208984375);
    float _1107 = precise::max(0.0, _242);
    float _1109 = -_1089;
    float _1111 = fma(_1103, _1101, _1109);
    float _1113 = _1061;
    float _1115 = _1029;
    int _1117 = as_type<int>(_1093);
    int _1119 = as_type<int>(_1089);
    float _1121 = _1047;
    if (_1021)
    {
        bool _1123 = _1061 > 0.5;
        _1055 = _1123;
    }
    bool _1125 = _1055;
    float _1127 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1021)
    {
        _1113 = _1023;
    }
    float _1129 = _1113;
    float _1131 = exp2(_1035);
    float _1133 = precise::min(_1105, 1.0);
    float _1135 = _1111 + 0.5;
    float _1137 = _1129;
    int _1139 = as_type<int>(_1133);
    if (!_1021)
    {
        _1115 = _1129;
    }
    float _1141 = _1115;
    float _1143 = _1141;
    if (_1021)
    {
        _1137 = _1023;
    }
    float _1145 = _1137;
    float _1147 = _1145;
    if (_1027)
    {
        bool _1149 = _1077 > 0.5;
        _1073 = _1149;
    }
    bool _1151 = _1073;
    if (_1021)
    {
        float _1153 = -_1145;
        float _1155 = _1153 + 1.0;
        _1117 = as_type<int>(_1155);
    }
    int _1157 = _1117;
    if (_1027)
    {
        float _1159 = -_1145;
        float _1161 = _1159 + 1.0;
        _1057 = as_type<int>(_1161);
    }
    int _1163 = _1057;
    float _1165 = fma(_1133, -9.9999980926513671875, 9.9999980926513671875);
    float _1167 = as_type<float>(_1163);
    if (_1045)
    {
        float _1169 = -_1145;
        float _1171 = _1169 + 1.0;
        _1139 = as_type<int>(_1171);
    }
    int _1173 = _1139;
    if (_1051)
    {
        float _1175 = -_1145;
        float _1177 = _1175 + 1.0;
        _1119 = as_type<int>(_1177);
    }
    int _1179 = _1119;
    if (_1021)
    {
        float _1181 = _1125 ? as_type<float>(_1157) : _1145;
        _1143 = _1181;
    }
    float _1183 = _1143;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1187 = precise::min(_1107, 0.20000000298023223876953125);
    float _1189 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1027)
    {
        _1121 = _1145;
    }
    float _1191 = _1121;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    float _1197 = _1191;
    if (_1027)
    {
        float _1199 = _1151 ? as_type<float>(_1163) : _1145;
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = _1187 * 5.0;
    float _1205 = fma(_1189, _1183, -0.5);
    out.m_59.w = _1091;
    float _1207 = _1203 * _1165;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1045)
    {
        _1167 = _1145;
    }
    float _1211 = _1167;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = _1211;
    if (_1045)
    {
        float _1217 = _1033 ? as_type<float>(_1173) : _1145;
        _1215 = _1217;
    }
    float _1219 = _1215;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1051)
    {
        float _1223 = _1033 ? as_type<float>(_1179) : _1145;
        _1147 = _1223;
    }
    float _1225 = _1147;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1231 = _528 != 1;
    float _1233 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = fma(_1127, _1225, -0.5);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_61.x = _1227;
    out.m_61.y = _1229;
    out.m_61.z = _1233;
    out.m_61.w = _1237;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = fma(_1239, _1201, -0.5);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1263 = _530 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1267 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1243);
    float _1269 = _532 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1271 = -_1261;
    float _1273 = fma(_1263, 2.0, _1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_63.x = _1251;
    out.m_63.y = _1253;
    out.m_63.z = _1257;
    float _1277 = -_1265;
    float _1279 = fma(_1269, 2.0, _1277);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1275);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1287 = _1265;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1291 = _1285;
    if (!_1231)
    {
        _1287 = _418;
    }
    float _1293 = _1287;
    float _1295 = -_130;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1279);
    float _1299 = _1293;
    if (!_1231)
    {
        _1289 = _418;
    }
    float _1301 = _1289;
    float _1303 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1305 = _1301;
    if (_1231)
    {
        _1299 = _530;
    }
    float _1307 = _1299;
    float _1309 = _1207 * _1207;
    if (_1231)
    {
        _1305 = _530;
    }
    float _1311 = _1305;
    float _1313 = _534 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1315 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1285);
    if (!_1231)
    {
        _1291 = _408;
    }
    float _1317 = _1291;
    float _1319 = fma(_1303, _552, -0.5);
    float _1321 = fma(_1313, -2.0, _1283);
    float _1323 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1315);
    float _1325 = -_130;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1273);
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1331 = _1317;
    if (_1231)
    {
        _480 = _418;
    }
    float _1333 = _480;
    float _1335 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = fma(_1323, _1205, _1327);
    float _1339 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1267);
    if (_1231)
    {
        _1331 = _418;
    }
    float _1341 = _1331;
    float _1343 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1349 = fma(_1339, _1235, _1297);
    float _1351 = _560 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1353 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1347);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1357 = _1351 * _1329;
    float _1359 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1281);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1367 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1321);
    bool _1369 = _682 > 0.0;
    bool _1371 = isnan(_682);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan(0.0);
    bool _1377 = _1373 || _1375;
    float _1379 = _1241 * _1345;
    float _1381 = fma(_1343, -2.0, _1365);
    float _1383 = _896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1385 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1361);
    float _1387 = -_1363;
    float _1389 = fma(_1335, 2.0, _1387);
    float _1391 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1381);
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1395 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1397 = -_130;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1389);
    float _1401 = -_1391;
    float _1403 = fma(_1385, _1319, _1401);
    float _1405 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1407 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1393);
    float _1409 = -_1367;
    float _1411 = fma(_1359, _1099, _1409);
    float _1413 = _1403 + 0.5;
    float _1415 = fma(_1395, _1255, _1399);
    float _1417 = _934 * 0.5;
    float _1419 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1407);
    out.m_65.x = _1379;
    out.m_65.y = _1357;
    float _1421 = _1411 + 0.5;
    float _1423 = _1415 + 0.5;
    float _1425 = fma(_980, -0.5, _1417);
    float _1427 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = _978 + _934;
    float _1431 = -_1405;
    float _1433 = _1431 + 1.0;
    out.gl_Position.x = _978;
    out.gl_Position.y = _980;
    out.gl_Position.z = _1419;
    out.gl_Position.w = _934;
    float _1435 = _1349 + 0.5;
    float _1437 = _1337 + 0.5;
    float _1439 = _1419 + _934;
    float _1441 = _1429 * 0.5;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1445 = _1439 * 0.5;
    out.m_67.w = _1309;
    out.m_69.x = _1435;
    out.m_69.y = _1421;
    out.m_71.x = _1437;
    out.m_71.y = _1135;
    out.m_71.z = _1423;
    out.m_71.w = _1413;
    out.m_73.x = _1441;
    out.m_73.y = _1425;
    out.m_73.z = _1445;
    out.m_73.w = _934;
    out.m_45.x = _1443;
    float _1447 = _1405 * _996;
    float _1449 = _1007 * _1447;
    float _1451 = _1017 * _1447;
    float _1453 = fma(_1013, _1449, _1001);
    float _1455 = fma(_1015, _1449, _1003);
    float _1457 = _1007 * _1433;
    float _1459 = fma(_1007, _1451, _1005);
    out.m_75.x = _1453;
    out.m_75.y = _1455;
    out.m_75.z = _1459;
    out.m_75.w = _1457;
    if (_1377)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1461;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

