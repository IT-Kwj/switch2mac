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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_63 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_118);
        out.gl_Position.z = _1618;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_132)
    {
        float _138 = float(_100);
        _112 = _138;
    }
    float _140 = _112;
    bool _142 = _136 >= _140;
    bool _144 = !_132;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1686 = as_type<float>(_152);
        out.gl_Position.z = _1686;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_51.w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _180 * 0.15915493667125701904296875;
    float _190 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = sin(_198);
    float _202 = _190 * 0.15915493667125701904296875;
    float _204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _206 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = _188 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _162 + (-0.5);
    float _214 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = _202 * 6.283185482025146484375;
    float _220 = sin(_218);
    float _222 = abs(_212);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _216 * _214;
    float _230 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = _200 * _160;
    float _234 = fma(_226, -2.0, 3.0);
    float _236 = _226 * _226;
    float _238 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _240 = _202 * 6.283185482025146484375;
    float _242 = cos(_240);
    float _244 = _210 * _160;
    float _246 = _234 * _236;
    float _248 = _246 * 0.125;
    float _250 = _160;
    float _252 = _238;
    if (!_178)
    {
        float _254 = _238 * _238;
        float _256 = _254 * 0.5;
        _250 = _256;
    }
    float _258 = _250;
    float _260 = -_232;
    float _262 = fma(_210, _164, _260);
    float _264 = fma(_200, _164, _244);
    float _266 = _258;
    if (!_178)
    {
        float _268 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _268;
    }
    float _270 = _266;
    bool _272 = !_178;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _238 * _278;
        float _288 = 1.0 / _282;
        float _290 = _284 * 0.693147182464599609375;
        float _292 = exp2(_286);
        float _294 = 1.0 / _290;
        float _296 = _292 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _294, _238);
        float _302 = _300 * _288;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_178;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _238 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _252 = _328;
    }
    float _330 = _252;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_220, _248, _264);
    float _338 = fma(_248, _242, _262);
    float _340 = fma(_330, _194, _332);
    float _342 = fma(_330, _192, _334);
    float _344 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    float _348 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _168, _184);
    float _352 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _356 = _346 * _344;
    float _358 = fma(_330, _196, _348);
    float _360 = fma(_342, _168, _182);
    float _362 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = _354 * _352;
    float _366 = _228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_358, _168, _186);
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = _382 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + _386;
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _402 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _404 = isnan(0.5);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _410 = _406 || _408;
    float _412 = _396 + _394;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _416 = _398 + _414;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _422 = _412 + _420;
    float _424 = _416 * _416;
    float _426 = _418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _428 = fma(_422, _422, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _426);
    float _432 = sqrt(_428);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _438 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _440 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _436);
    float _442 = 1.0 / _438;
    float _444 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _440);
    float _446 = _228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _448 = _444 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _450 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    bool _452 = _432 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _448 + _438;
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _450);
    float _458 = _418 + _456;
    float _460 = _456;
    float _462 = _454;
    float _464 = _412;
    float _466 = _364;
    float _468 = _458;
    float _470 = _416;
    if (_410)
    {
        _460 = 1.0;
    }
    float _472 = _460;
    float _474 = _454 * _442;
    float _476 = _474 * 0.5;
    float _478 = _442;
    float _480 = _472;
    if (!_452)
    {
        _462 = _412;
    }
    float _482 = _462;
    float _484 = _482;
    if (!_452)
    {
        _464 = _398;
    }
    float _486 = _464;
    float _488 = _486;
    if (!_452)
    {
        _466 = _458;
    }
    float _490 = _466;
    bool _492 = !_452;
    float _494 = _490;
    if (!_492)
    {
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _500 = _432 + _498;
        float _502 = rsqrt(_428);
        float _504 = _500 * _496;
        float _506 = _458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = _504 * 0.15915493667125701904296875;
        float _510 = _508 * 6.283185482025146484375;
        float _512 = cos(_510);
        float _514 = _508 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _512 + (-1.0);
        float _520 = _518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = fma(_516, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _524 = fma(_458, _512, _520);
        float _526 = _502 * _522;
        float _528 = fma(_422, _526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _530 = fma(_416, _526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _494 = _524;
        _484 = _528;
        _488 = _530;
    }
    float _532 = _494;
    float _534 = _484;
    float _536 = _488;
    if (!_410)
    {
        float _538 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _540 = _538 * 0.15915493667125701904296875;
        float _542 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _546 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
        float _548 = _540 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _542 * 0.15915493667125701904296875;
        float _554 = _540 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = 1.0 / _550;
        float _560 = _552 * 6.283185482025146484375;
        float _562 = cos(_560);
        float _564 = _556 * _558;
        float _566 = _552 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _562 * _564;
        float _572 = 1.0 / _546;
        float _574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _574;
        float _578 = 1.0 / _570;
        float _580 = 1.0 / _576;
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _584 = _572 * _582;
        float _586 = _568 * _578;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _590 = fma(_586, _584, _588);
        float _592 = _590 * _580;
        float _594 = precise::clamp(_592, 0.0, 1.0);
        _478 = _578;
        _468 = _580;
        _470 = _552;
        _480 = _594;
    }
    float _596 = _478;
    float _598 = _468;
    float _600 = _470;
    float _602 = _480;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _532 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _534 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = _536 + _612;
    float _616 = _606 * _606;
    float _618 = fma(_610, _610, _616);
    float _620 = fma(_614, _614, _618);
    float _622 = rsqrt(_620);
    float _624 = sqrt(_620);
    float _626 = _622 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _610 * _626;
    float _630 = _614 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _596;
    float _648 = _644;
    float _650 = _598;
    float _652 = _606;
    float _654 = _626;
    float _656 = _628;
    if (_640)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _658;
    }
    float _660 = _646;
    float _662 = _660;
    if (_640)
    {
        float _664 = _644 * _660;
        _648 = _664;
    }
    float _666 = _648;
    if (_640)
    {
        float _668 = rsqrt(_636);
        _662 = _668;
    }
    float _670 = _662;
    float _672 = _670;
    if (_640)
    {
        float _674 = _666 * 0.15915493667125701904296875;
        _650 = _674;
    }
    float _676 = _650;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _680 = _614;
    if (_640)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = precise::max(0.0, _678);
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = _600;
    float _694 = _688;
    if (_640)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_626;
    float _704 = -_688;
    float _706 = fma(_606, _702, _704);
    if (_640)
    {
        float _708 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _708;
    }
    float _710 = _652;
    float _712 = _686;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_686, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _706;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _670 * _718;
        _654 = _726;
    }
    float _728 = _654;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _730;
    float _734 = _700;
    if (_640)
    {
        float _736 = _700 + (-1.0);
        _694 = _736;
    }
    float _738 = _694;
    float _740 = _738;
    if (_640)
    {
        float _742 = _628 * _728;
        _656 = _742;
    }
    float _744 = _656;
    if (_640)
    {
        float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _746;
    }
    float _748 = _672;
    if (!_640)
    {
        _740 = _630;
    }
    float _750 = _740;
    float _752 = _750;
    if (_640)
    {
        float _754 = _630 * _728;
        _752 = _754;
    }
    float _756 = _752;
    if (_640)
    {
        float _758 = _744 * _744;
        _732 = _758;
    }
    float _760 = _732;
    if (_640)
    {
        float _762 = fma(_706, _700, _748);
        _724 = _762;
    }
    float _764 = _724;
    if (!_640)
    {
        _734 = _634;
    }
    float _766 = _734;
    float _768 = _766;
    if (_640)
    {
        float _770 = _756 * _756;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = _532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _776 = fma(_764, _764, _760);
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _774);
    float _786 = _776 + _772;
    float _788 = _532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = -_782;
    float _792 = _790 + 1.0;
    float _794 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _784);
    float _796 = rsqrt(_786);
    float _798 = _532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_792);
    float _812 = log2(_810);
    float _814 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _804);
    float _822 = _814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _826 = -_818;
    float _828 = fma(_826, _690, 1.0);
    float _830 = _796 * _744;
    float _832 = _796 * _764;
    float _834 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _820);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _824);
    float _838 = _830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _840 = _796 * _756;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _836);
    float _846 = -_838;
    float _848 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _846);
    float _850 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _852 = log2(_828);
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = -_840;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = _832 + 1.0;
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = exp2(_850);
    float _872 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    float _874 = fma(_858, 0.5, 0.5);
    float _876 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _880 = fma(_874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = 1.0 / _854;
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _878);
    float _888 = fma(_874, _880, -0.212114393711090087890625);
    float _890 = _852 * 0.693147182464599609375;
    float _892 = fma(_874, _888, 1.570728778839111328125);
    float _894 = _890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _896 = sqrt(_866);
    float _898 = -_832;
    float _900 = fma(_870, _864, _898);
    float _902 = fma(_900, 0.5, 0.5);
    float _904 = _882 * _884;
    float _906 = _886 * _884;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _896 * 0.636619746685028076171875;
    float3 _2912 = float3(_908, _910, _894);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2912, float3(0.0), isnan(_2912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2912, float3(0.0), isnan(_2912)), level(0.0)).x;
    float _916 = -_892;
    float _918 = fma(_912, _916, 1.0);
    float3 _2928 = float3(_908, _910, _894);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2945 = float2(_918, _902);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2945, float2(0.0), isnan(_2945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2945, float2(0.0), isnan(_2945)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _949 = _947 != 0;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _957 = _955 != 0;
    float _959 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _961 = in.m_55.x;
    float _963 = exp2(_945);
    float _965 = in.m_59.x;
    float _967 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _959);
    float _969 = 0.0;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_949)
    {
        float _973 = in.m_57.x;
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _979 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _967);
    out.m_61.x = _534;
    out.m_61.y = _532;
    out.m_61.z = _536;
    float _981 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    float _983 = -_941;
    float _985 = _983 + 1.0;
    float _987 = -_963;
    float _989 = _987 + 1.0;
    out.gl_Position.x = _882;
    out.gl_Position.y = _886;
    out.gl_Position.z = _981;
    out.gl_Position.w = _854;
    bool _991 = _953 > 0.5;
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _977);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _999 = _941;
    float _1001 = _882;
    float _1003 = _981;
    if (_957)
    {
        float _1005 = _991 ? _985 : _941;
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1013 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_949)
    {
        _971 = _961;
    }
    float _1015 = _971;
    float _1017 = -_1009;
    float _1019 = fma(_993, 2.0, _1017);
    float _1021 = _943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = fma(_1013, -2.0, _1011);
    bool _1025 = _975 > 0.5;
    bool _1027 = _1025 && _949;
    float _1029 = in.m_59.z;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1033 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    float _1035 = fma(_1021, _1007, -0.5);
    float _1037 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1039 = _1021;
    float _1041 = _1015;
    if (!_949)
    {
        _1039 = _961;
    }
    float _1043 = _1039;
    float _1045 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1033);
    float _1047 = in.m_59.y;
    float _1049 = -_136;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1019);
    float _1053 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _995);
    float _1055 = -_1037;
    float _1057 = fma(_1045, _1035, _1055);
    float _1059 = _1043;
    if (_1027)
    {
        float _1061 = -_1015;
        float _1063 = _1061 + 1.0;
        _1041 = _1063;
    }
    float _1065 = _1041;
    float _1067 = _989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1069 = _1057 + 0.5;
    if (_949)
    {
        _1059 = _1065;
    }
    float _1071 = _1059;
    float _1073 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1075 = _162 != 0.0;
    bool _1077 = isnan(_162);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1073, _1071, -0.5);
    bool _1087 = _336 == 0.0;
    bool _1089 = !_1083;
    bool _1091 = _1087 && _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1101 = _200 * _965;
    float _1103 = _210 * _965;
    bool _1105 = _338 == 0.0;
    bool _1107 = _1105 && _1091;
    float _1109 = fma(_1053, _1085, _1051);
    float _1111 = -_1101;
    float _1113 = fma(_210, _1029, _1111);
    float _1115 = fma(_200, _1029, _1103);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1117;
    out.m_63.y = _1119;
    out.m_63.z = _1121;
    out.m_63.w = _1099;
    float _1129 = _1047;
    float _1131 = _1115;
    float _1133 = _1113;
    if (!_1107)
    {
        float _1135 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1047);
        _1129 = _1135;
    }
    float _1137 = _1129;
    if (!_1107)
    {
        float _1139 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1115);
        _1131 = _1139;
    }
    float _1141 = _1131;
    if (!_1107)
    {
        float _1143 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1133 = _1143;
    }
    float _1145 = _1133;
    float _1147 = in.m_65.w;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1109 + 0.5;
    bool _1153 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1155 = isnan(_624);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1161 = _1157 || _1159;
    float _1163 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    out.m_67.x = _1151;
    out.m_67.y = _1069;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1167 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1175 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1161)
    {
        _1001 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1177 = _1001;
    out.m_69.x = _1167;
    out.m_69.y = _1169;
    out.m_69.z = _1171;
    out.m_69.w = _1165;
    float _1179 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1173);
    out.m_71.w = _1147;
    float _1181 = _981 + _854;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1185 = _1177;
    float _1187 = _1177;
    if (!_1161)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _1003;
    float _1191 = _1181 * 0.5;
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1195 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1183);
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1179);
    out.m_73.z = _1191;
    out.m_73.w = _854;
    float _1199 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1195);
    out.m_75.x = _1193;
    out.m_75.y = _1197;
    out.m_75.z = _1199;
    float _1201 = _1067 * _914;
    float _1203 = -_1067;
    float _1205 = _1203 + 1.0;
    float _1207 = _929 * _1201;
    float _1209 = _939 * _1201;
    float _1211 = fma(_935, _1207, _923);
    float _1213 = fma(_937, _1207, _925);
    float _1215 = _929 * _1205;
    float _1217 = fma(_929, _1209, _927);
    float _1219 = _1207;
    float _1221 = _929;
    float _1223 = _927;
    float _1225 = _1201;
    float _1227 = _1189;
    float _1229 = _1189;
    if (!_1161)
    {
        _1219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1231 = _1219;
    float _1233 = _1231;
    float _1235 = _1231;
    if (!_1161)
    {
        _1221 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1237 = _1221;
    out.m_77.x = _1211;
    out.m_77.y = _1213;
    out.m_77.z = _1217;
    out.m_77.w = _1215;
    float _1239 = _1237;
    float _1241 = _1237;
    if (!_1161)
    {
        _1223 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1243 = _1223;
    float _1245 = _1243;
    float _1247 = _1243;
    if (!_1161)
    {
        _1225 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1249 = _1225;
    bool _1251 = !_1161;
    float _1253 = _1249;
    float _1255 = _1249;
    if (!_1251)
    {
        bool _1257 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1259 = isnan(_624);
        bool _1261 = _1257 || _1259;
        bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1265 = _1261 || _1263;
        if (!_1265)
        {
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1269 = _624 + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1271;
            float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1277 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1279 = 1.0 / _1273;
            float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1287 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1291 = _1289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1297 = _1269 * _1279;
            float _1299 = precise::clamp(_1297, 0.0, 1.0);
            float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1305 = fma(_1299, _1277, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1307 = fma(_1299, _1303, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1309 = fma(_1299, _1283, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1311 = fma(_1299, _1287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1313 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1315 = fma(_1299, _1295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1235 = _1309;
            _1247 = _1313;
            _1229 = _1305;
            _1241 = _1311;
            _1187 = _1307;
            _1255 = _1315;
            _1317 = true;
        }
        else
        {
            bool _1319 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1321 = isnan(_624);
            bool _1323 = _1319 || _1321;
            bool _1325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1327 = _1323 || _1325;
            if (!_1327)
            {
                _1227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1329 = _1227;
            _1229 = _1329;
            if (!_1327)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1331 = _1233;
            _1235 = _1331;
            if (!_1327)
            {
                _1185 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1333 = _1185;
            _1187 = _1333;
            if (!_1327)
            {
                _1239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1335 = _1239;
            _1241 = _1335;
            if (!_1327)
            {
                _1245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1337 = _1245;
            _1247 = _1337;
            if (!_1327)
            {
                _1253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1339 = _1253;
            bool _1341 = !_1327;
            _1255 = _1339;
            if (!_1341)
            {
                bool _1343 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1345 = isnan(_624);
                bool _1347 = _1343 || _1345;
                bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1351 = _1347 || _1349;
                if (!_1351)
                {
                    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1355 = _624 + _1353;
                    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1357;
                    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1363 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1365 = 1.0 / _1359;
                    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1373 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1381 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1383 = _1355 * _1365;
                    float _1385 = precise::clamp(_1383, 0.0, 1.0);
                    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1391 = fma(_1385, _1363, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1393 = fma(_1385, _1389, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1395 = fma(_1385, _1369, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1397 = fma(_1385, _1373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1399 = fma(_1385, _1377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1401 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1235 = _1395;
                    _1247 = _1399;
                    _1229 = _1391;
                    _1241 = _1397;
                    _1187 = _1393;
                    _1255 = _1401;
                    _1317 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1187 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1317 = false;
    float _1403 = _1235;
    float _1405 = _1247;
    float _1407 = _1229;
    float _1409 = _1241;
    float _1411 = _1187;
    float _1413 = _1255;
    float _1415 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = fma(_1197, -0.5, 0.5);
    float _1419 = precise::clamp(_1417, 0.0, 1.0);
    float _1421 = -_1403;
    float _1423 = _1421 + _1405;
    float _1425 = -_1407;
    float _1427 = _1425 + _1409;
    out.m_47.x = _1415;
    float _1429 = -_1411;
    float _1431 = _1429 + _1413;
    float _1433 = fma(_1419, _1423, _1403);
    float _1435 = fma(_1419, _1427, _1407);
    bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1439 = _1433 * 0.586610972881317138671875;
    float _1441 = fma(_1419, _1431, _1411);
    out.m_79.x = 0.0;
    bool _1443 = _602 > 0.0;
    bool _1445 = isnan(_602);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1435, 0.298911988735198974609375, _1439);
    float _1455 = fma(_1441, 0.114477999508380889892578125, _1453);
    float _1457 = -_1455;
    float _1459 = _1435 + _1457;
    float _1461 = -_1455;
    float _1463 = _1433 + _1461;
    float _1465 = -_1455;
    float _1467 = _1441 + _1465;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1471 = fma(_1463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1473 = fma(_1467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    bool _1475 = !_1437;
    if (!_1475)
    {
        float _1477 = -_532;
        float _1479 = _1477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1481 = -_534;
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1485 = -_536;
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1489 = _1479 * _1479;
        float _1491 = fma(_1483, _1483, _1489);
        float _1493 = fma(_1487, _1487, _1491);
        float _1495 = sqrt(_1493);
        float _1497 = rsqrt(_1493);
        float _1499 = -_1495;
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1503 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        float _1507 = _1483 * _1497;
        float _1509 = _1479 * _1497;
        float _1511 = abs(_1505);
        float _1513 = log2(_1511);
        float _1515 = _1487 * _1497;
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1519 = _1197 * _1509;
        float _1521 = -_1509;
        float _1523 = -_1517;
        float _1525 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1523);
        float _1527 = fma(_1193, _1507, _1519);
        float _1529 = -_1515;
        float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1525);
        float _1533 = fma(_1199, _1515, _1527);
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1539 = _1531 + _1537;
        float _1541 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1543 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = exp2(_1541);
        float _1549 = _1547 * _1545;
        float _1551 = _1535 * _1549;
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1555 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1553;
        out.m_79.y = _1555;
        out.m_79.z = _1557;
    }
    out.m_81.x = _1469;
    out.m_81.y = _1471;
    out.m_81.z = _1473;
    if (_1451)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1559;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_118);
        out.gl_Position.z = _1618;
    }
    if (!_104)
    {
        return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_132)
    {
        float _138 = float(_100);
        _112 = _138;
    }
    float _140 = _112;
    bool _142 = _136 >= _140;
    bool _144 = !_132;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1686 = as_type<float>(_152);
        out.gl_Position.z = _1686;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_51.w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _180 * 0.15915493667125701904296875;
    float _190 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = sin(_198);
    float _202 = _190 * 0.15915493667125701904296875;
    float _204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _206 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = _188 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _162 + (-0.5);
    float _214 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = _202 * 6.283185482025146484375;
    float _220 = sin(_218);
    float _222 = abs(_212);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _216 * _214;
    float _230 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = _200 * _160;
    float _234 = fma(_226, -2.0, 3.0);
    float _236 = _226 * _226;
    float _238 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _240 = _202 * 6.283185482025146484375;
    float _242 = cos(_240);
    float _244 = _210 * _160;
    float _246 = _234 * _236;
    float _248 = _246 * 0.125;
    float _250 = _160;
    float _252 = _238;
    if (!_178)
    {
        float _254 = _238 * _238;
        float _256 = _254 * 0.5;
        _250 = _256;
    }
    float _258 = _250;
    float _260 = -_232;
    float _262 = fma(_210, _164, _260);
    float _264 = fma(_200, _164, _244);
    float _266 = _258;
    if (!_178)
    {
        float _268 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _268;
    }
    float _270 = _266;
    bool _272 = !_178;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _238 * _278;
        float _288 = 1.0 / _282;
        float _290 = _284 * 0.693147182464599609375;
        float _292 = exp2(_286);
        float _294 = 1.0 / _290;
        float _296 = _292 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _294, _238);
        float _302 = _300 * _288;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_178;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _238 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _252 = _328;
    }
    float _330 = _252;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_220, _248, _264);
    float _338 = fma(_248, _242, _262);
    float _340 = fma(_330, _194, _332);
    float _342 = fma(_330, _192, _334);
    float _344 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    float _348 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _168, _184);
    float _352 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _356 = _346 * _344;
    float _358 = fma(_330, _196, _348);
    float _360 = fma(_342, _168, _182);
    float _362 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = _354 * _352;
    float _366 = _228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_358, _168, _186);
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = _382 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + _386;
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _402 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _404 = isnan(0.5);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _410 = _406 || _408;
    float _412 = _396 + _394;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _416 = _398 + _414;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _422 = _412 + _420;
    float _424 = _416 * _416;
    float _426 = _418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _428 = fma(_422, _422, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _426);
    float _432 = sqrt(_428);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _438 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _440 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _436);
    float _442 = 1.0 / _438;
    float _444 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _440);
    float _446 = _228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _448 = _444 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _450 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    bool _452 = _432 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _448 + _438;
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _450);
    float _458 = _418 + _456;
    float _460 = _456;
    float _462 = _454;
    float _464 = _412;
    float _466 = _364;
    float _468 = _458;
    float _470 = _416;
    if (_410)
    {
        _460 = 1.0;
    }
    float _472 = _460;
    float _474 = _454 * _442;
    float _476 = _474 * 0.5;
    float _478 = _442;
    float _480 = _472;
    if (!_452)
    {
        _462 = _412;
    }
    float _482 = _462;
    float _484 = _482;
    if (!_452)
    {
        _464 = _398;
    }
    float _486 = _464;
    float _488 = _486;
    if (!_452)
    {
        _466 = _458;
    }
    float _490 = _466;
    bool _492 = !_452;
    float _494 = _490;
    if (!_492)
    {
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _500 = _432 + _498;
        float _502 = rsqrt(_428);
        float _504 = _500 * _496;
        float _506 = _458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = _504 * 0.15915493667125701904296875;
        float _510 = _508 * 6.283185482025146484375;
        float _512 = cos(_510);
        float _514 = _508 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _512 + (-1.0);
        float _520 = _518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = fma(_516, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _524 = fma(_458, _512, _520);
        float _526 = _502 * _522;
        float _528 = fma(_422, _526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _530 = fma(_416, _526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _494 = _524;
        _484 = _528;
        _488 = _530;
    }
    float _532 = _494;
    float _534 = _484;
    float _536 = _488;
    if (!_410)
    {
        float _538 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _540 = _538 * 0.15915493667125701904296875;
        float _542 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _546 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
        float _548 = _540 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _542 * 0.15915493667125701904296875;
        float _554 = _540 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = 1.0 / _550;
        float _560 = _552 * 6.283185482025146484375;
        float _562 = cos(_560);
        float _564 = _556 * _558;
        float _566 = _552 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _562 * _564;
        float _572 = 1.0 / _546;
        float _574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _574;
        float _578 = 1.0 / _570;
        float _580 = 1.0 / _576;
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _584 = _572 * _582;
        float _586 = _568 * _578;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _590 = fma(_586, _584, _588);
        float _592 = _590 * _580;
        float _594 = precise::clamp(_592, 0.0, 1.0);
        _478 = _578;
        _468 = _580;
        _470 = _552;
        _480 = _594;
    }
    float _596 = _478;
    float _598 = _468;
    float _600 = _470;
    float _602 = _480;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _532 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _534 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = _536 + _612;
    float _616 = _606 * _606;
    float _618 = fma(_610, _610, _616);
    float _620 = fma(_614, _614, _618);
    float _622 = rsqrt(_620);
    float _624 = sqrt(_620);
    float _626 = _622 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _610 * _626;
    float _630 = _614 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _596;
    float _648 = _644;
    float _650 = _598;
    float _652 = _606;
    float _654 = _626;
    float _656 = _628;
    if (_640)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _658;
    }
    float _660 = _646;
    float _662 = _660;
    if (_640)
    {
        float _664 = _644 * _660;
        _648 = _664;
    }
    float _666 = _648;
    if (_640)
    {
        float _668 = rsqrt(_636);
        _662 = _668;
    }
    float _670 = _662;
    float _672 = _670;
    if (_640)
    {
        float _674 = _666 * 0.15915493667125701904296875;
        _650 = _674;
    }
    float _676 = _650;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _680 = _614;
    if (_640)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = precise::max(0.0, _678);
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = _600;
    float _694 = _688;
    if (_640)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_626;
    float _704 = -_688;
    float _706 = fma(_606, _702, _704);
    if (_640)
    {
        float _708 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _708;
    }
    float _710 = _652;
    float _712 = _686;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_686, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _706;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _670 * _718;
        _654 = _726;
    }
    float _728 = _654;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _730;
    float _734 = _700;
    if (_640)
    {
        float _736 = _700 + (-1.0);
        _694 = _736;
    }
    float _738 = _694;
    float _740 = _738;
    if (_640)
    {
        float _742 = _628 * _728;
        _656 = _742;
    }
    float _744 = _656;
    if (_640)
    {
        float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _746;
    }
    float _748 = _672;
    if (!_640)
    {
        _740 = _630;
    }
    float _750 = _740;
    float _752 = _750;
    if (_640)
    {
        float _754 = _630 * _728;
        _752 = _754;
    }
    float _756 = _752;
    if (_640)
    {
        float _758 = _744 * _744;
        _732 = _758;
    }
    float _760 = _732;
    if (_640)
    {
        float _762 = fma(_706, _700, _748);
        _724 = _762;
    }
    float _764 = _724;
    if (!_640)
    {
        _734 = _634;
    }
    float _766 = _734;
    float _768 = _766;
    if (_640)
    {
        float _770 = _756 * _756;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = _532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _776 = fma(_764, _764, _760);
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _774);
    float _786 = _776 + _772;
    float _788 = _532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = -_782;
    float _792 = _790 + 1.0;
    float _794 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _784);
    float _796 = rsqrt(_786);
    float _798 = _532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_792);
    float _812 = log2(_810);
    float _814 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _804);
    float _822 = _814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _826 = -_818;
    float _828 = fma(_826, _690, 1.0);
    float _830 = _796 * _744;
    float _832 = _796 * _764;
    float _834 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _820);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _824);
    float _838 = _830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _840 = _796 * _756;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _836);
    float _846 = -_838;
    float _848 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _846);
    float _850 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _852 = log2(_828);
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = -_840;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = _832 + 1.0;
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = exp2(_850);
    float _872 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    float _874 = fma(_858, 0.5, 0.5);
    float _876 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _880 = fma(_874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = 1.0 / _854;
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _878);
    float _888 = fma(_874, _880, -0.212114393711090087890625);
    float _890 = _852 * 0.693147182464599609375;
    float _892 = fma(_874, _888, 1.570728778839111328125);
    float _894 = _890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _896 = sqrt(_866);
    float _898 = -_832;
    float _900 = fma(_870, _864, _898);
    float _902 = fma(_900, 0.5, 0.5);
    float _904 = _882 * _884;
    float _906 = _886 * _884;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _896 * 0.636619746685028076171875;
    float3 _2912 = float3(_908, _910, _894);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2912, float3(0.0), isnan(_2912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2912, float3(0.0), isnan(_2912)), level(0.0)).x;
    float _916 = -_892;
    float _918 = fma(_912, _916, 1.0);
    float3 _2928 = float3(_908, _910, _894);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2945 = float2(_918, _902);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2945, float2(0.0), isnan(_2945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2945, float2(0.0), isnan(_2945)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _949 = _947 != 0;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _957 = _955 != 0;
    float _959 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _961 = in.m_55.x;
    float _963 = exp2(_945);
    float _965 = in.m_59.x;
    float _967 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _959);
    float _969 = 0.0;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_949)
    {
        float _973 = in.m_57.x;
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _979 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _967);
    out.m_61.x = _534;
    out.m_61.y = _532;
    out.m_61.z = _536;
    float _981 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    float _983 = -_941;
    float _985 = _983 + 1.0;
    float _987 = -_963;
    float _989 = _987 + 1.0;
    out.gl_Position.x = _882;
    out.gl_Position.y = _886;
    out.gl_Position.z = _981;
    out.gl_Position.w = _854;
    bool _991 = _953 > 0.5;
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _977);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _999 = _941;
    float _1001 = _882;
    float _1003 = _981;
    if (_957)
    {
        float _1005 = _991 ? _985 : _941;
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1013 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_949)
    {
        _971 = _961;
    }
    float _1015 = _971;
    float _1017 = -_1009;
    float _1019 = fma(_993, 2.0, _1017);
    float _1021 = _943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = fma(_1013, -2.0, _1011);
    bool _1025 = _975 > 0.5;
    bool _1027 = _1025 && _949;
    float _1029 = in.m_59.z;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1033 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    float _1035 = fma(_1021, _1007, -0.5);
    float _1037 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1039 = _1021;
    float _1041 = _1015;
    if (!_949)
    {
        _1039 = _961;
    }
    float _1043 = _1039;
    float _1045 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1033);
    float _1047 = in.m_59.y;
    float _1049 = -_136;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1019);
    float _1053 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _995);
    float _1055 = -_1037;
    float _1057 = fma(_1045, _1035, _1055);
    float _1059 = _1043;
    if (_1027)
    {
        float _1061 = -_1015;
        float _1063 = _1061 + 1.0;
        _1041 = _1063;
    }
    float _1065 = _1041;
    float _1067 = _989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1069 = _1057 + 0.5;
    if (_949)
    {
        _1059 = _1065;
    }
    float _1071 = _1059;
    float _1073 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1075 = _162 != 0.0;
    bool _1077 = isnan(_162);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1073, _1071, -0.5);
    bool _1087 = _336 == 0.0;
    bool _1089 = !_1083;
    bool _1091 = _1087 && _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1101 = _200 * _965;
    float _1103 = _210 * _965;
    bool _1105 = _338 == 0.0;
    bool _1107 = _1105 && _1091;
    float _1109 = fma(_1053, _1085, _1051);
    float _1111 = -_1101;
    float _1113 = fma(_210, _1029, _1111);
    float _1115 = fma(_200, _1029, _1103);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1117;
    out.m_63.y = _1119;
    out.m_63.z = _1121;
    out.m_63.w = _1099;
    float _1129 = _1047;
    float _1131 = _1115;
    float _1133 = _1113;
    if (!_1107)
    {
        float _1135 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1047);
        _1129 = _1135;
    }
    float _1137 = _1129;
    if (!_1107)
    {
        float _1139 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1115);
        _1131 = _1139;
    }
    float _1141 = _1131;
    if (!_1107)
    {
        float _1143 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1133 = _1143;
    }
    float _1145 = _1133;
    float _1147 = in.m_65.w;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1109 + 0.5;
    bool _1153 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1155 = isnan(_624);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1161 = _1157 || _1159;
    float _1163 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    out.m_67.x = _1151;
    out.m_67.y = _1069;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1167 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1175 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1161)
    {
        _1001 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1177 = _1001;
    out.m_69.x = _1167;
    out.m_69.y = _1169;
    out.m_69.z = _1171;
    out.m_69.w = _1165;
    float _1179 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1173);
    out.m_71.w = _1147;
    float _1181 = _981 + _854;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1185 = _1177;
    float _1187 = _1177;
    if (!_1161)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _1003;
    float _1191 = _1181 * 0.5;
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1195 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1183);
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1179);
    out.m_73.z = _1191;
    out.m_73.w = _854;
    float _1199 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1195);
    out.m_75.x = _1193;
    out.m_75.y = _1197;
    out.m_75.z = _1199;
    float _1201 = _1067 * _914;
    float _1203 = -_1067;
    float _1205 = _1203 + 1.0;
    float _1207 = _929 * _1201;
    float _1209 = _939 * _1201;
    float _1211 = fma(_935, _1207, _923);
    float _1213 = fma(_937, _1207, _925);
    float _1215 = _929 * _1205;
    float _1217 = fma(_929, _1209, _927);
    float _1219 = _1207;
    float _1221 = _929;
    float _1223 = _927;
    float _1225 = _1201;
    float _1227 = _1189;
    float _1229 = _1189;
    if (!_1161)
    {
        _1219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1231 = _1219;
    float _1233 = _1231;
    float _1235 = _1231;
    if (!_1161)
    {
        _1221 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1237 = _1221;
    out.m_77.x = _1211;
    out.m_77.y = _1213;
    out.m_77.z = _1217;
    out.m_77.w = _1215;
    float _1239 = _1237;
    float _1241 = _1237;
    if (!_1161)
    {
        _1223 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1243 = _1223;
    float _1245 = _1243;
    float _1247 = _1243;
    if (!_1161)
    {
        _1225 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1249 = _1225;
    bool _1251 = !_1161;
    float _1253 = _1249;
    float _1255 = _1249;
    if (!_1251)
    {
        bool _1257 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1259 = isnan(_624);
        bool _1261 = _1257 || _1259;
        bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1265 = _1261 || _1263;
        if (!_1265)
        {
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1269 = _624 + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1271;
            float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1277 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1279 = 1.0 / _1273;
            float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1287 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1291 = _1289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1297 = _1269 * _1279;
            float _1299 = precise::clamp(_1297, 0.0, 1.0);
            float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1305 = fma(_1299, _1277, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1307 = fma(_1299, _1303, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1309 = fma(_1299, _1283, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1311 = fma(_1299, _1287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1313 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1315 = fma(_1299, _1295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1235 = _1309;
            _1247 = _1313;
            _1229 = _1305;
            _1241 = _1311;
            _1187 = _1307;
            _1255 = _1315;
            _1317 = true;
        }
        else
        {
            bool _1319 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1321 = isnan(_624);
            bool _1323 = _1319 || _1321;
            bool _1325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1327 = _1323 || _1325;
            if (!_1327)
            {
                _1227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1329 = _1227;
            _1229 = _1329;
            if (!_1327)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1331 = _1233;
            _1235 = _1331;
            if (!_1327)
            {
                _1185 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1333 = _1185;
            _1187 = _1333;
            if (!_1327)
            {
                _1239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1335 = _1239;
            _1241 = _1335;
            if (!_1327)
            {
                _1245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1337 = _1245;
            _1247 = _1337;
            if (!_1327)
            {
                _1253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1339 = _1253;
            bool _1341 = !_1327;
            _1255 = _1339;
            if (!_1341)
            {
                bool _1343 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1345 = isnan(_624);
                bool _1347 = _1343 || _1345;
                bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1351 = _1347 || _1349;
                if (!_1351)
                {
                    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1355 = _624 + _1353;
                    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1357;
                    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1363 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1365 = 1.0 / _1359;
                    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1373 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1381 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1383 = _1355 * _1365;
                    float _1385 = precise::clamp(_1383, 0.0, 1.0);
                    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1391 = fma(_1385, _1363, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1393 = fma(_1385, _1389, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1395 = fma(_1385, _1369, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1397 = fma(_1385, _1373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1399 = fma(_1385, _1377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1401 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1235 = _1395;
                    _1247 = _1399;
                    _1229 = _1391;
                    _1241 = _1397;
                    _1187 = _1393;
                    _1255 = _1401;
                    _1317 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1187 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1317 = false;
    float _1403 = _1235;
    float _1405 = _1247;
    float _1407 = _1229;
    float _1409 = _1241;
    float _1411 = _1187;
    float _1413 = _1255;
    float _1415 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = fma(_1197, -0.5, 0.5);
    float _1419 = precise::clamp(_1417, 0.0, 1.0);
    float _1421 = -_1403;
    float _1423 = _1421 + _1405;
    float _1425 = -_1407;
    float _1427 = _1425 + _1409;
    out.m_47.x = _1415;
    float _1429 = -_1411;
    float _1431 = _1429 + _1413;
    float _1433 = fma(_1419, _1423, _1403);
    float _1435 = fma(_1419, _1427, _1407);
    bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1439 = _1433 * 0.586610972881317138671875;
    float _1441 = fma(_1419, _1431, _1411);
    out.m_79.x = 0.0;
    bool _1443 = _602 > 0.0;
    bool _1445 = isnan(_602);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1435, 0.298911988735198974609375, _1439);
    float _1455 = fma(_1441, 0.114477999508380889892578125, _1453);
    float _1457 = -_1455;
    float _1459 = _1435 + _1457;
    float _1461 = -_1455;
    float _1463 = _1433 + _1461;
    float _1465 = -_1455;
    float _1467 = _1441 + _1465;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1471 = fma(_1463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1473 = fma(_1467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    bool _1475 = !_1437;
    if (!_1475)
    {
        float _1477 = -_532;
        float _1479 = _1477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1481 = -_534;
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1485 = -_536;
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1489 = _1479 * _1479;
        float _1491 = fma(_1483, _1483, _1489);
        float _1493 = fma(_1487, _1487, _1491);
        float _1495 = sqrt(_1493);
        float _1497 = rsqrt(_1493);
        float _1499 = -_1495;
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1503 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        float _1507 = _1483 * _1497;
        float _1509 = _1479 * _1497;
        float _1511 = abs(_1505);
        float _1513 = log2(_1511);
        float _1515 = _1487 * _1497;
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1519 = _1197 * _1509;
        float _1521 = -_1509;
        float _1523 = -_1517;
        float _1525 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1523);
        float _1527 = fma(_1193, _1507, _1519);
        float _1529 = -_1515;
        float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1525);
        float _1533 = fma(_1199, _1515, _1527);
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1539 = _1531 + _1537;
        float _1541 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1543 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = exp2(_1541);
        float _1549 = _1547 * _1545;
        float _1551 = _1535 * _1549;
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1555 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1553;
        out.m_79.y = _1555;
        out.m_79.z = _1557;
    }
    out.m_81.x = _1469;
    out.m_81.y = _1471;
    out.m_81.z = _1473;
    if (_1451)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1559;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1618 = as_type<float>(_118);
        out.gl_Position.z = _1618;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_132)
    {
        float _138 = float(_100);
        _112 = _138;
    }
    float _140 = _112;
    bool _142 = _136 >= _140;
    bool _144 = !_132;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1686 = as_type<float>(_152);
        out.gl_Position.z = _1686;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = in.m_51.w;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _180 * 0.15915493667125701904296875;
    float _190 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    float _198 = _188 * 6.283185482025146484375;
    float _200 = sin(_198);
    float _202 = _190 * 0.15915493667125701904296875;
    float _204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _206 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = _188 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = _162 + (-0.5);
    float _214 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _218 = _202 * 6.283185482025146484375;
    float _220 = sin(_218);
    float _222 = abs(_212);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _216 * _214;
    float _230 = _158 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = _200 * _160;
    float _234 = fma(_226, -2.0, 3.0);
    float _236 = _226 * _226;
    float _238 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _240 = _202 * 6.283185482025146484375;
    float _242 = cos(_240);
    float _244 = _210 * _160;
    float _246 = _234 * _236;
    float _248 = _246 * 0.125;
    float _250 = _160;
    float _252 = _238;
    if (!_178)
    {
        float _254 = _238 * _238;
        float _256 = _254 * 0.5;
        _250 = _256;
    }
    float _258 = _250;
    float _260 = -_232;
    float _262 = fma(_210, _164, _260);
    float _264 = fma(_200, _164, _244);
    float _266 = _258;
    if (!_178)
    {
        float _268 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _268;
    }
    float _270 = _266;
    bool _272 = !_178;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _238 * _278;
        float _288 = 1.0 / _282;
        float _290 = _284 * 0.693147182464599609375;
        float _292 = exp2(_286);
        float _294 = 1.0 / _290;
        float _296 = _292 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _294, _238);
        float _302 = _300 * _288;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_178;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _238 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _252 = _328;
    }
    float _330 = _252;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_220, _248, _264);
    float _338 = fma(_248, _242, _262);
    float _340 = fma(_330, _194, _332);
    float _342 = fma(_330, _192, _334);
    float _344 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    float _348 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _168, _184);
    float _352 = _230 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _356 = _346 * _344;
    float _358 = fma(_330, _196, _348);
    float _360 = fma(_342, _168, _182);
    float _362 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = _354 * _352;
    float _366 = _228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_358, _168, _186);
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _376 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _374);
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = _382 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _376);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + _386;
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _402 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _404 = isnan(0.5);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _410 = _406 || _408;
    float _412 = _396 + _394;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _416 = _398 + _414;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _422 = _412 + _420;
    float _424 = _416 * _416;
    float _426 = _418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _428 = fma(_422, _422, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _426);
    float _432 = sqrt(_428);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _438 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _440 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _436);
    float _442 = 1.0 / _438;
    float _444 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _440);
    float _446 = _228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _448 = _444 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _450 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _446);
    bool _452 = _432 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _448 + _438;
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _450);
    float _458 = _418 + _456;
    float _460 = _456;
    float _462 = _454;
    float _464 = _412;
    float _466 = _364;
    float _468 = _458;
    float _470 = _416;
    if (_410)
    {
        _460 = 1.0;
    }
    float _472 = _460;
    float _474 = _454 * _442;
    float _476 = _474 * 0.5;
    float _478 = _442;
    float _480 = _472;
    if (!_452)
    {
        _462 = _412;
    }
    float _482 = _462;
    float _484 = _482;
    if (!_452)
    {
        _464 = _398;
    }
    float _486 = _464;
    float _488 = _486;
    if (!_452)
    {
        _466 = _458;
    }
    float _490 = _466;
    bool _492 = !_452;
    float _494 = _490;
    if (!_492)
    {
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _500 = _432 + _498;
        float _502 = rsqrt(_428);
        float _504 = _500 * _496;
        float _506 = _458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _508 = _504 * 0.15915493667125701904296875;
        float _510 = _508 * 6.283185482025146484375;
        float _512 = cos(_510);
        float _514 = _508 * 6.283185482025146484375;
        float _516 = sin(_514);
        float _518 = _512 + (-1.0);
        float _520 = _518 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = fma(_516, _506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _524 = fma(_458, _512, _520);
        float _526 = _502 * _522;
        float _528 = fma(_422, _526, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _530 = fma(_416, _526, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _494 = _524;
        _484 = _528;
        _488 = _530;
    }
    float _532 = _494;
    float _534 = _484;
    float _536 = _488;
    if (!_410)
    {
        float _538 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _540 = _538 * 0.15915493667125701904296875;
        float _542 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _546 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
        float _548 = _540 * 6.283185482025146484375;
        float _550 = cos(_548);
        float _552 = _542 * 0.15915493667125701904296875;
        float _554 = _540 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = 1.0 / _550;
        float _560 = _552 * 6.283185482025146484375;
        float _562 = cos(_560);
        float _564 = _556 * _558;
        float _566 = _552 * 6.283185482025146484375;
        float _568 = sin(_566);
        float _570 = _562 * _564;
        float _572 = 1.0 / _546;
        float _574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _574;
        float _578 = 1.0 / _570;
        float _580 = 1.0 / _576;
        float _582 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _584 = _572 * _582;
        float _586 = _568 * _578;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _590 = fma(_586, _584, _588);
        float _592 = _590 * _580;
        float _594 = precise::clamp(_592, 0.0, 1.0);
        _478 = _578;
        _468 = _580;
        _470 = _552;
        _480 = _594;
    }
    float _596 = _478;
    float _598 = _468;
    float _600 = _470;
    float _602 = _480;
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _532 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _534 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = _536 + _612;
    float _616 = _606 * _606;
    float _618 = fma(_610, _610, _616);
    float _620 = fma(_614, _614, _618);
    float _622 = rsqrt(_620);
    float _624 = sqrt(_620);
    float _626 = _622 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _610 * _626;
    float _630 = _614 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _596;
    float _648 = _644;
    float _650 = _598;
    float _652 = _606;
    float _654 = _626;
    float _656 = _628;
    if (_640)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _658;
    }
    float _660 = _646;
    float _662 = _660;
    if (_640)
    {
        float _664 = _644 * _660;
        _648 = _664;
    }
    float _666 = _648;
    if (_640)
    {
        float _668 = rsqrt(_636);
        _662 = _668;
    }
    float _670 = _662;
    float _672 = _670;
    if (_640)
    {
        float _674 = _666 * 0.15915493667125701904296875;
        _650 = _674;
    }
    float _676 = _650;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _680 = _614;
    if (_640)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = precise::max(0.0, _678);
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = _600;
    float _694 = _688;
    if (_640)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_626;
    float _704 = -_688;
    float _706 = fma(_606, _702, _704);
    if (_640)
    {
        float _708 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _708;
    }
    float _710 = _652;
    float _712 = _686;
    float _714 = _710;
    if (_640)
    {
        float _716 = fma(_686, _710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _706;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _670 * _718;
        _654 = _726;
    }
    float _728 = _654;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _730;
    float _734 = _700;
    if (_640)
    {
        float _736 = _700 + (-1.0);
        _694 = _736;
    }
    float _738 = _694;
    float _740 = _738;
    if (_640)
    {
        float _742 = _628 * _728;
        _656 = _742;
    }
    float _744 = _656;
    if (_640)
    {
        float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _746;
    }
    float _748 = _672;
    if (!_640)
    {
        _740 = _630;
    }
    float _750 = _740;
    float _752 = _750;
    if (_640)
    {
        float _754 = _630 * _728;
        _752 = _754;
    }
    float _756 = _752;
    if (_640)
    {
        float _758 = _744 * _744;
        _732 = _758;
    }
    float _760 = _732;
    if (_640)
    {
        float _762 = fma(_706, _700, _748);
        _724 = _762;
    }
    float _764 = _724;
    if (!_640)
    {
        _734 = _634;
    }
    float _766 = _734;
    float _768 = _766;
    if (_640)
    {
        float _770 = _756 * _756;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = _532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _776 = fma(_764, _764, _760);
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _780 = fma(_624, (*spvDescriptorSet0.vp_c15)._m0[23].w, _778);
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _774);
    float _786 = _776 + _772;
    float _788 = _532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = -_782;
    float _792 = _790 + 1.0;
    float _794 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _784);
    float _796 = rsqrt(_786);
    float _798 = _532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _800 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _804 = _532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _798);
    float _808 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _810 = abs(_792);
    float _812 = log2(_810);
    float _814 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _806);
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _804);
    float _822 = _814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _826 = -_818;
    float _828 = fma(_826, _690, 1.0);
    float _830 = _796 * _744;
    float _832 = _796 * _764;
    float _834 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _820);
    float _836 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _824);
    float _838 = _830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _840 = _796 * _756;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _836);
    float _846 = -_838;
    float _848 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _846);
    float _850 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _852 = log2(_828);
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = -_840;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c15)._m0[21].z, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = _832 + 1.0;
    float _866 = fma(_858, -0.5, 0.5);
    float _868 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _870 = exp2(_850);
    float _872 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    float _874 = fma(_858, 0.5, 0.5);
    float _876 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _868);
    float _878 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _880 = fma(_874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _876);
    float _884 = 1.0 / _854;
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _878);
    float _888 = fma(_874, _880, -0.212114393711090087890625);
    float _890 = _852 * 0.693147182464599609375;
    float _892 = fma(_874, _888, 1.570728778839111328125);
    float _894 = _890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _896 = sqrt(_866);
    float _898 = -_832;
    float _900 = fma(_870, _864, _898);
    float _902 = fma(_900, 0.5, 0.5);
    float _904 = _882 * _884;
    float _906 = _886 * _884;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = fma(_906, -0.5, 0.5);
    float _912 = _896 * 0.636619746685028076171875;
    float3 _2912 = float3(_908, _910, _894);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2912, float3(0.0), isnan(_2912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2912, float3(0.0), isnan(_2912)), level(0.0)).x;
    float _916 = -_892;
    float _918 = fma(_912, _916, 1.0);
    float3 _2928 = float3(_908, _910, _894);
    float4 _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).xyzw;
    float _923 = _921.x;
    float _925 = _921.y;
    float _927 = _921.z;
    float _929 = _921.w;
    float2 _2945 = float2(_918, _902);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2945, float2(0.0), isnan(_2945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2945, float2(0.0), isnan(_2945)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _812 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _949 = _947 != 0;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _957 = _955 != 0;
    float _959 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _961 = in.m_55.x;
    float _963 = exp2(_945);
    float _965 = in.m_59.x;
    float _967 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _959);
    float _969 = 0.0;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_949)
    {
        float _973 = in.m_57.x;
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _979 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _967);
    out.m_61.x = _534;
    out.m_61.y = _532;
    out.m_61.z = _536;
    float _981 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    float _983 = -_941;
    float _985 = _983 + 1.0;
    float _987 = -_963;
    float _989 = _987 + 1.0;
    out.gl_Position.x = _882;
    out.gl_Position.y = _886;
    out.gl_Position.z = _981;
    out.gl_Position.w = _854;
    bool _991 = _953 > 0.5;
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _995 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _977);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _999 = _941;
    float _1001 = _882;
    float _1003 = _981;
    if (_957)
    {
        float _1005 = _991 ? _985 : _941;
        _999 = _1005;
    }
    float _1007 = _999;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1013 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_949)
    {
        _971 = _961;
    }
    float _1015 = _971;
    float _1017 = -_1009;
    float _1019 = fma(_993, 2.0, _1017);
    float _1021 = _943 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1023 = fma(_1013, -2.0, _1011);
    bool _1025 = _975 > 0.5;
    bool _1027 = _1025 && _949;
    float _1029 = in.m_59.z;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1033 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _997);
    float _1035 = fma(_1021, _1007, -0.5);
    float _1037 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1039 = _1021;
    float _1041 = _1015;
    if (!_949)
    {
        _1039 = _961;
    }
    float _1043 = _1039;
    float _1045 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1033);
    float _1047 = in.m_59.y;
    float _1049 = -_136;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1019);
    float _1053 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _995);
    float _1055 = -_1037;
    float _1057 = fma(_1045, _1035, _1055);
    float _1059 = _1043;
    if (_1027)
    {
        float _1061 = -_1015;
        float _1063 = _1061 + 1.0;
        _1041 = _1063;
    }
    float _1065 = _1041;
    float _1067 = _989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1069 = _1057 + 0.5;
    if (_949)
    {
        _1059 = _1065;
    }
    float _1071 = _1059;
    float _1073 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1075 = _162 != 0.0;
    bool _1077 = isnan(_162);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    float _1085 = fma(_1073, _1071, -0.5);
    bool _1087 = _336 == 0.0;
    bool _1089 = !_1083;
    bool _1091 = _1087 && _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1101 = _200 * _965;
    float _1103 = _210 * _965;
    bool _1105 = _338 == 0.0;
    bool _1107 = _1105 && _1091;
    float _1109 = fma(_1053, _1085, _1051);
    float _1111 = -_1101;
    float _1113 = fma(_210, _1029, _1111);
    float _1115 = fma(_200, _1029, _1103);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1117;
    out.m_63.y = _1119;
    out.m_63.z = _1121;
    out.m_63.w = _1099;
    float _1129 = _1047;
    float _1131 = _1115;
    float _1133 = _1113;
    if (!_1107)
    {
        float _1135 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1047);
        _1129 = _1135;
    }
    float _1137 = _1129;
    if (!_1107)
    {
        float _1139 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1115);
        _1131 = _1139;
    }
    float _1141 = _1131;
    if (!_1107)
    {
        float _1143 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1133 = _1143;
    }
    float _1145 = _1133;
    float _1147 = in.m_65.w;
    float _1149 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1109 + 0.5;
    bool _1153 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1155 = isnan(_624);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1161 = _1157 || _1159;
    float _1163 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    out.m_67.x = _1151;
    out.m_67.y = _1069;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1167 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1175 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_1161)
    {
        _1001 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1177 = _1001;
    out.m_69.x = _1167;
    out.m_69.y = _1169;
    out.m_69.z = _1171;
    out.m_69.w = _1165;
    float _1179 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1173);
    out.m_71.w = _1147;
    float _1181 = _981 + _854;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1185 = _1177;
    float _1187 = _1177;
    if (!_1161)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _1003;
    float _1191 = _1181 * 0.5;
    float _1193 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1163);
    float _1195 = fma(_1141, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1183);
    float _1197 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1179);
    out.m_73.z = _1191;
    out.m_73.w = _854;
    float _1199 = fma(_1145, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1195);
    out.m_75.x = _1193;
    out.m_75.y = _1197;
    out.m_75.z = _1199;
    float _1201 = _1067 * _914;
    float _1203 = -_1067;
    float _1205 = _1203 + 1.0;
    float _1207 = _929 * _1201;
    float _1209 = _939 * _1201;
    float _1211 = fma(_935, _1207, _923);
    float _1213 = fma(_937, _1207, _925);
    float _1215 = _929 * _1205;
    float _1217 = fma(_929, _1209, _927);
    float _1219 = _1207;
    float _1221 = _929;
    float _1223 = _927;
    float _1225 = _1201;
    float _1227 = _1189;
    float _1229 = _1189;
    if (!_1161)
    {
        _1219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1231 = _1219;
    float _1233 = _1231;
    float _1235 = _1231;
    if (!_1161)
    {
        _1221 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1237 = _1221;
    out.m_77.x = _1211;
    out.m_77.y = _1213;
    out.m_77.z = _1217;
    out.m_77.w = _1215;
    float _1239 = _1237;
    float _1241 = _1237;
    if (!_1161)
    {
        _1223 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1243 = _1223;
    float _1245 = _1243;
    float _1247 = _1243;
    if (!_1161)
    {
        _1225 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1249 = _1225;
    bool _1251 = !_1161;
    float _1253 = _1249;
    float _1255 = _1249;
    if (!_1251)
    {
        bool _1257 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1259 = isnan(_624);
        bool _1261 = _1257 || _1259;
        bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1265 = _1261 || _1263;
        if (!_1265)
        {
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1269 = _624 + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1271;
            float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1277 = _1275 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1279 = 1.0 / _1273;
            float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1287 = _1285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1291 = _1289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1295 = _1293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1297 = _1269 * _1279;
            float _1299 = precise::clamp(_1297, 0.0, 1.0);
            float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1305 = fma(_1299, _1277, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1307 = fma(_1299, _1303, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1309 = fma(_1299, _1283, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1311 = fma(_1299, _1287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1313 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1315 = fma(_1299, _1295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1235 = _1309;
            _1247 = _1313;
            _1229 = _1305;
            _1241 = _1311;
            _1187 = _1307;
            _1255 = _1315;
            _1317 = true;
        }
        else
        {
            bool _1319 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1321 = isnan(_624);
            bool _1323 = _1319 || _1321;
            bool _1325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1327 = _1323 || _1325;
            if (!_1327)
            {
                _1227 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1329 = _1227;
            _1229 = _1329;
            if (!_1327)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1331 = _1233;
            _1235 = _1331;
            if (!_1327)
            {
                _1185 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1333 = _1185;
            _1187 = _1333;
            if (!_1327)
            {
                _1239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1335 = _1239;
            _1241 = _1335;
            if (!_1327)
            {
                _1245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1337 = _1245;
            _1247 = _1337;
            if (!_1327)
            {
                _1253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1339 = _1253;
            bool _1341 = !_1327;
            _1255 = _1339;
            if (!_1341)
            {
                bool _1343 = _624 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1345 = isnan(_624);
                bool _1347 = _1343 || _1345;
                bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1351 = _1347 || _1349;
                if (!_1351)
                {
                    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1355 = _624 + _1353;
                    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1357;
                    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1363 = _1361 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1365 = 1.0 / _1359;
                    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1373 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1381 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1383 = _1355 * _1365;
                    float _1385 = precise::clamp(_1383, 0.0, 1.0);
                    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1389 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1391 = fma(_1385, _1363, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1393 = fma(_1385, _1389, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1395 = fma(_1385, _1369, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1397 = fma(_1385, _1373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1399 = fma(_1385, _1377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1401 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1235 = _1395;
                    _1247 = _1399;
                    _1229 = _1391;
                    _1241 = _1397;
                    _1187 = _1393;
                    _1255 = _1401;
                    _1317 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1229 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1187 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1317 = false;
    float _1403 = _1235;
    float _1405 = _1247;
    float _1407 = _1229;
    float _1409 = _1241;
    float _1411 = _1187;
    float _1413 = _1255;
    float _1415 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = fma(_1197, -0.5, 0.5);
    float _1419 = precise::clamp(_1417, 0.0, 1.0);
    float _1421 = -_1403;
    float _1423 = _1421 + _1405;
    float _1425 = -_1407;
    float _1427 = _1425 + _1409;
    out.m_47.x = _1415;
    float _1429 = -_1411;
    float _1431 = _1429 + _1413;
    float _1433 = fma(_1419, _1423, _1403);
    float _1435 = fma(_1419, _1427, _1407);
    bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1439 = _1433 * 0.586610972881317138671875;
    float _1441 = fma(_1419, _1431, _1411);
    out.m_79.x = 0.0;
    bool _1443 = _602 > 0.0;
    bool _1445 = isnan(_602);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan(0.0);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1435, 0.298911988735198974609375, _1439);
    float _1455 = fma(_1441, 0.114477999508380889892578125, _1453);
    float _1457 = -_1455;
    float _1459 = _1435 + _1457;
    float _1461 = -_1455;
    float _1463 = _1433 + _1461;
    float _1465 = -_1455;
    float _1467 = _1441 + _1465;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1471 = fma(_1463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    float _1473 = fma(_1467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1455);
    bool _1475 = !_1437;
    if (!_1475)
    {
        float _1477 = -_532;
        float _1479 = _1477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1481 = -_534;
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1485 = -_536;
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1489 = _1479 * _1479;
        float _1491 = fma(_1483, _1483, _1489);
        float _1493 = fma(_1487, _1487, _1491);
        float _1495 = sqrt(_1493);
        float _1497 = rsqrt(_1493);
        float _1499 = -_1495;
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1503 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        float _1507 = _1483 * _1497;
        float _1509 = _1479 * _1497;
        float _1511 = abs(_1505);
        float _1513 = log2(_1511);
        float _1515 = _1487 * _1497;
        float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1519 = _1197 * _1509;
        float _1521 = -_1509;
        float _1523 = -_1517;
        float _1525 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1523);
        float _1527 = fma(_1193, _1507, _1519);
        float _1529 = -_1515;
        float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1525);
        float _1533 = fma(_1199, _1515, _1527);
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1539 = _1531 + _1537;
        float _1541 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1543 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        float _1547 = exp2(_1541);
        float _1549 = _1547 * _1545;
        float _1551 = _1535 * _1549;
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1555 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1553;
        out.m_79.y = _1555;
        out.m_79.z = _1557;
    }
    out.m_81.x = _1469;
    out.m_81.y = _1471;
    out.m_81.z = _1473;
    if (_1451)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1559;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

