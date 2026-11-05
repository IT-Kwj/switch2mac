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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1775 = as_type<float>(_122);
        out.gl_Position.z = _1775;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_158);
        out.gl_Position.z = _1844;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = in.m_51.w;
    float _168 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_49.x;
    float _188 = in.m_49.y;
    float _190 = in.m_49.z;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = 0.0;
    if (!_184)
    {
        float _200 = _168 * _168;
        float _202 = _200 * 0.5;
        _198 = _202;
    }
    float _204 = _198;
    float _206 = _204;
    if (!_184)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _218 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _224 = _218 * _216;
    float _226 = _218;
    float _228 = _210;
    float _230 = _170;
    if (!_184)
    {
        _226 = _168;
    }
    float _232 = _226;
    float _234 = _222 * _220;
    bool _236 = !_184;
    float _238 = _232;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _168 * _242;
        float _252 = exp2(_250);
        float _254 = _248 * 0.693147182464599609375;
        float _256 = 1.0 / _254;
        float _258 = 1.0 / _246;
        float _260 = _252 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _256, _168);
        float _266 = _264 * _258;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _268;
    }
    float _270 = _228;
    bool _272 = !_184;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _168 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _238 = _292;
    }
    float _294 = _238;
    float _296 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _298 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = fma(_294, _188, _296);
    float _306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _308 = fma(_294, _186, _300);
    float _310 = fma(_294, _190, _302);
    float _312 = fma(_304, _166, _194);
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _316 = fma(_308, _166, _192);
    float _318 = fma(_310, _166, _196);
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _330 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _314 * _306;
    float _334 = _224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _338 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _340 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _342 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _344 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _346 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _348 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _352 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _340);
    float _354 = _342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].z, _344);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _354 + _352;
    float _366 = _360 + _356;
    float _368 = _362 + _358;
    float _370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _372 = _364 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _376 = _364 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _380 = _366 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = _368 + _382;
    float _386 = _372 * _372;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _368 + _388;
    float _392 = _384 * _384;
    float _394 = fma(_380, _380, _386);
    float _396 = _390 * _390;
    float _398 = in.m_55.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[193].y + _400;
    float _404 = _392 + _394;
    float _406 = fma(_376, _376, _396);
    float _408 = 1.0 / _402;
    float _410 = sqrt(_404);
    float _412 = sqrt(_406);
    float _414 = abs(_410);
    float _416 = precise::max(_414, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _418 = -_398;
    float _420 = _418 + 1.0;
    float _422 = precise::min(_416, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    bool _424 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _428 = _422 + _426;
    float _430 = _428 * _408;
    float _432 = _430 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _434 = -_420;
    float _436 = fma(_434, _432, _366);
    float _438 = _408;
    float _440 = _398;
    float _442 = _402;
    float _444 = _366;
    float _446 = _432;
    float _448 = _420;
    float _450 = _386;
    float _452 = _392;
    float _454 = _406;
    if (!_424)
    {
        _438 = _392;
    }
    float _456 = _438;
    float _458 = _456;
    if (!_424)
    {
        _440 = _384;
    }
    float _460 = _440;
    float _462 = _460;
    if (!_424)
    {
        _442 = _372;
    }
    float _464 = _442;
    float _466 = _464;
    if (!_424)
    {
        _444 = _364;
    }
    float _468 = _444;
    float _470 = _468;
    if (!_424)
    {
        _446 = _368;
    }
    float _472 = _446;
    float _474 = _472;
    if (!_424)
    {
        _448 = _436;
    }
    float _476 = _448;
    bool _478 = !_424;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _412 + _484;
        float _488 = rsqrt(_406);
        float _490 = _486 * _482;
        float _492 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = _490 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _488 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_376, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_390, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _518 = _510 + _516;
        float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _522 = _512 + _520;
        float _524 = fma(_436, _502, _514);
        float _526 = _518 * _518;
        float _528 = _522 * _522;
        _480 = _524;
        _450 = _526;
        _458 = _528;
        _466 = _518;
        _462 = _522;
        _470 = _510;
        _474 = _512;
    }
    float _530 = _480;
    float _532 = _450;
    float _534 = _458;
    float _536 = _466;
    float _538 = _462;
    float _540 = _470;
    float _542 = _474;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _530 + _544;
    float _548 = fma(_546, _546, _532);
    float _550 = _548 + _534;
    float _552 = rsqrt(_550);
    float _554 = sqrt(_550);
    float _556 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _536 * _556;
    float _560 = _538 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _364;
    float _578 = _566;
    float _580 = _574;
    float _582 = _558;
    float _584 = _538;
    float _586 = _546;
    float _588 = _536;
    if (_570)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _590;
    }
    float _592 = _576;
    if (_570)
    {
        float _594 = rsqrt(_566);
        _578 = _594;
    }
    float _596 = _578;
    float _598 = _596;
    if (_570)
    {
        float _600 = _574 * _592;
        _580 = _600;
    }
    float _602 = _580;
    if (_570)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _452 = _604;
    }
    float _606 = _452;
    float _608 = _592;
    float _610 = _606;
    if (_570)
    {
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        _608 = _614;
    }
    float _616 = _608;
    float _618 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _620 = precise::max(0.0, _618);
    float _622 = _384;
    float _624 = _620;
    if (_570)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = -_556;
    float _634 = -_620;
    float _636 = fma(_546, _632, _634);
    if (_570)
    {
        float _638 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _638;
    }
    float _640 = _624;
    float _642 = _616;
    float _644 = _640;
    if (_570)
    {
        float _646 = fma(_616, _640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _642 = _646;
    }
    float _648 = _642;
    float _650 = _648;
    float _652 = _630;
    if (_570)
    {
        float _654 = _630 + (-1.0);
        _644 = _654;
    }
    float _656 = _644;
    float _658 = _656;
    if (_570)
    {
        float _660 = _596 * _648;
        _454 = _660;
    }
    float _662 = _454;
    if (!_570)
    {
        _650 = _636;
    }
    float _664 = _650;
    float _666 = _664;
    if (_570)
    {
        float _668 = _656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _610 = _668;
    }
    float _670 = _610;
    if (_570)
    {
        float _672 = _558 * _662;
        _582 = _672;
    }
    float _674 = _582;
    if (!_570)
    {
        _658 = _560;
    }
    float _676 = _658;
    float _678 = _676;
    if (_570)
    {
        float _680 = _560 * _662;
        _678 = _680;
    }
    float _682 = _678;
    if (!_570)
    {
        _598 = _562;
    }
    float _684 = _598;
    float _686 = _684;
    if (_570)
    {
        float _688 = fma(_636, _630, _670);
        _666 = _688;
    }
    float _690 = _666;
    if (_570)
    {
        float _692 = _674 * _674;
        _686 = _692;
    }
    float _694 = _686;
    if (!_570)
    {
        _652 = _564;
    }
    float _696 = _652;
    float _698 = _696;
    if (_570)
    {
        float _700 = _682 * _682;
        _698 = _700;
    }
    float _702 = _698;
    float _704 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = fma(_690, _690, _694);
    float _708 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _710 = _706 + _702;
    float _712 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _714 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _718 = fma(_554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = rsqrt(_710);
    float _724 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _712);
    float _726 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _736 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _738 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _728);
    float _740 = abs(_732);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _746 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _736);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _752 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _708);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _722 * _674;
    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _760 = _722 * _690;
    float _762 = -_750;
    float _764 = fma(_762, _744, 1.0);
    float _766 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _758);
    float _770 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _772 = _722 * _682;
    float _774 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = _766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = -_770;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _778);
    float _782 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _784 = exp2(_774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = -_772;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _780);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _798 = fma(_790, -0.5, 0.5);
    float _800 = fma(_790, 0.5, 0.5);
    float _802 = log2(_764);
    float _804 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _806 = _760 + 1.0;
    float _808 = fma(_800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _810 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _812 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _804);
    float _814 = fma(_800, _808, -0.212114393711090087890625);
    float _816 = 1.0 / _792;
    float _818 = -_760;
    float _820 = fma(_784, _806, _818);
    float _822 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _826 = fma(_800, _814, 1.570728778839111328125);
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = sqrt(_798);
    float _832 = _802 * 0.693147182464599609375;
    float _834 = _822 * _816;
    float _836 = _824 * _816;
    float _838 = _832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = fma(_834, 0.5, 0.5);
    float _842 = fma(_836, -0.5, 0.5);
    float _844 = _830 * 0.636619746685028076171875;
    float3 _2955 = float3(_840, _842, _838);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2955, float3(0.0), isnan(_2955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2955, float3(0.0), isnan(_2955)), level(0.0)).x;
    float3 _2966 = float3(_840, _842, _838);
    float4 _849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2966, float3(0.0), isnan(_2966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2966, float3(0.0), isnan(_2966)), level(0.0)).xyzw;
    float _851 = _849.x;
    float _853 = _849.y;
    float _855 = _849.z;
    float _857 = _849.w;
    float _859 = -_826;
    float _861 = fma(_844, _859, 1.0);
    float2 _2988 = float2(_861, _828);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = in.m_57.w;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _877 = in.m_59.z;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _881 = _879 != 0;
    float _883 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _887 = _885 != 0;
    float _889 = in.m_57.y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _895 = in.m_59.y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _905 = _903 != 0;
    float _907 = in.m_57.z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _911 = _875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _915 = in.m_59.x;
    float _917 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _919 = -_873;
    float _921 = _919 + 1.0;
    float _923 = in.m_59.w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _927 = in.m_57.x;
    bool _929 = _877 > 0.5;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_889;
    float _935 = _933 + 1.0;
    out.m_61.w = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _939 = _895 > 0.5;
    float _941 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _945 = _939 ? as_type<int>(_935) : as_type<int>(_889);
    float _947 = exp2(_883);
    float _949 = _873;
    float _951 = _907;
    float _953 = _889;
    float _955 = _877;
    float _957 = _895;
    float _959 = _792;
    float _961 = _822;
    float _963 = _824;
    if (_881)
    {
        float _965 = _929 ? _921 : _873;
        _949 = _965;
    }
    float _967 = _949;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _973 = _971 != 0;
    float _975 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[78].z, _937);
    float _977 = _887 ? as_type<float>(_945) : _889;
    float _979 = _915 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _981 = _895 > 0.5;
    bool _983 = _981 && _973;
    float _985 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = -_891;
    float _989 = fma(_979, 2.0, _987);
    bool _991 = _923 > 0.5;
    float _993 = fma(_911, _967, -0.5);
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1001 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[88].z, _943);
    float _1003 = 0.0;
    float _1005 = _999;
    if (_973)
    {
        _1003 = _907;
    }
    float _1007 = _1003;
    float _1009 = fma(_999, -2.0, _909);
    float _1011 = _1007;
    if (!_899)
    {
        _1005 = _927;
    }
    float _1013 = _1005;
    float _1015 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _1017 = _1013;
    if (_983)
    {
        float _1019 = -_1007;
        float _1021 = _1019 + 1.0;
        _1011 = _1021;
    }
    float _1023 = _1011;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1027 = _1025 != 0;
    float _1029 = -_140;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[76].x, _989);
    float _1033 = in.m_63.x;
    float _1035 = in.m_63.y;
    float _1037 = in.m_63.z;
    float _1039 = 0.0;
    if (!_899)
    {
        _1039 = _1013;
    }
    float _1041 = _1039;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1045 = _1041;
    if (_973)
    {
        _951 = _1023;
    }
    float _1047 = _951;
    float _1049 = -_947;
    float _1051 = _1049 + 1.0;
    bool _1053 = _172 != 0.0;
    bool _1055 = isnan(_172);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _941);
    if (_899)
    {
        _1017 = _927;
    }
    float _1065 = _1017;
    float _1067 = fma(_985, _977, -0.5);
    bool _1069 = _170 == 0.0;
    bool _1071 = !_1061;
    bool _1073 = _1069 && _1071;
    float _1075 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1079 = _174 == 0.0;
    bool _1081 = _1079 && _1073;
    float _1083 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1085 = _1077;
    bool _1087 = _1081;
    float _1089 = _1065;
    if (_997)
    {
        float _1091 = _991 ? _935 : _889;
        _953 = _1091;
    }
    float _1093 = _953;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1097 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    if (!_1027)
    {
        _1085 = _895;
    }
    float _1099 = _1085;
    out.m_65.x = _540;
    out.m_65.y = _530;
    out.m_65.z = _542;
    float _1101 = _1099;
    if (_1027)
    {
        _1101 = _915;
    }
    float _1103 = _1101;
    float _1105 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1097);
    float _1107 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1095);
    float _1109 = -_1075;
    float _1111 = fma(_1105, _1067, _1109);
    float _1113 = _1033;
    float _1115 = _1037;
    float _1117 = _1035;
    int _1119 = as_type<int>(_1103);
    if (!_1081)
    {
        float _1121 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1113 = _1121;
    }
    float _1123 = _1113;
    if (_1027)
    {
        _230 = _915;
    }
    float _1125 = _230;
    float _1127 = _1125;
    if (!_1081)
    {
        float _1129 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1037);
        _1115 = _1129;
    }
    float _1131 = _1115;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1081)
    {
        float _1135 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1117 = _1135;
    }
    float _1137 = _1117;
    if (!_1027)
    {
        _1127 = _877;
    }
    float _1139 = _1127;
    float _1141 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1145 = _1141;
    if (_899)
    {
        float _1147 = -_1065;
        float _1149 = _1147 + 1.0;
        _1133 = as_type<int>(_1149);
    }
    int _1151 = _1133;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_899)
    {
        bool _1155 = _915 > 0.5;
        _1087 = _1155;
    }
    bool _1157 = _1087;
    float _1159 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1161 = fma(_1141, _1093, -0.5);
    float _1163 = -_1143;
    float _1165 = fma(_1153, 2.0, _1163);
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1027)
    {
        _1145 = _877;
    }
    float _1169 = _1145;
    float _1171 = fma(_1159, _1047, -0.5);
    float _1173 = _1169;
    if (_1027)
    {
        _1173 = _895;
    }
    float _1175 = _1173;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1179 = _1175;
    if (_899)
    {
        float _1181 = _1157 ? as_type<float>(_1151) : _1065;
        _1045 = _1181;
    }
    float _1183 = _1045;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = in.m_55.x;
    float _1189 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1177);
    float _1191 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _925);
    if (!_1027)
    {
        _1179 = _877;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_905)
    {
        float _1199 = -_1065;
        float _1201 = _1199 + 1.0;
        _1119 = as_type<int>(_1201);
    }
    int _1203 = _1119;
    float _1205 = -_1167;
    float _1207 = fma(_1191, 2.0, _1205);
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    if (!_1027)
    {
        _955 = _895;
    }
    float _1213 = _955;
    float _1215 = -_140;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    if (_1027)
    {
        _1197 = _895;
    }
    float _1219 = _1197;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1027)
    {
        _957 = _915;
    }
    float _1223 = _957;
    float _1225 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_905)
    {
        float _1227 = _929 ? as_type<float>(_1203) : _1065;
        _1089 = _1227;
    }
    float _1229 = _1089;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1239 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1231);
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1225);
    float _1249 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1251 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1253 = _1239 * (-0.15915493667125701904296875);
    float _1255 = fma(_1243, _1229, -0.5);
    float _1257 = fma(_1237, _1183, -0.5);
    float _1259 = fma(_1241, -2.0, _1043);
    float _1261 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1247);
    float _1263 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1249);
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = fma(_1211, _1255, _1217);
    float _1273 = fma(_1015, _1257, _1031);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1277 = _1253 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1299 = in.m_55.y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1303 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1193);
    float _1305 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1307 = in.m_55.w;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1291;
    out.m_67.w = _1285;
    float _1315 = fma(_1297, -2.0, _1301);
    float _1317 = -_140;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1165);
    bool _1321 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_554);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_69.x = _1245;
    out.m_69.y = _1311;
    out.m_69.z = _1313;
    out.m_69.w = _1309;
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1315);
    out.m_71.x = _1187;
    out.m_73.x = _1261;
    out.m_73.y = _1263;
    out.m_73.z = _1265;
    float _1333 = _1269 * _993;
    float _1335 = -_1305;
    float _1337 = fma(_1303, _1161, _1335);
    float _1339 = _1279 * _993;
    float _1341 = _1273 + 0.5;
    float _1343 = -_1333;
    float _1345 = fma(_1279, _1171, _1343);
    float _1347 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1001);
    float _1349 = _1111 + 0.5;
    float _1351 = _1271 + 0.5;
    float _1353 = _1337 + 0.5;
    float _1355 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1107);
    float _1357 = fma(_1269, _1171, _1339);
    float _1359 = fma(_1347, _1345, _1319);
    float _1361 = _1063 + _792;
    out.m_75.x = _1341;
    out.m_75.y = _1349;
    out.m_75.z = _1351;
    out.m_75.w = _1353;
    float _1363 = -_1331;
    float _1365 = fma(_1355, _1357, _1363);
    float _1367 = _1359 + 0.5;
    float _1369 = _1361 * 0.5;
    out.m_71.y = _1299;
    float _1371 = _1365 + 0.5;
    out.m_71.w = _1307;
    out.m_77.x = _1367;
    out.m_77.y = _1371;
    float _1373 = -_1083;
    float _1375 = _1373 + 1.0;
    out.m_79.z = _1369;
    out.m_79.w = _792;
    out.m_81.x = _536;
    out.m_81.y = _546;
    out.m_81.z = _538;
    out.gl_Position.x = _822;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1063;
    out.gl_Position.w = _792;
    if (!_1329)
    {
        _584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1377 = _584;
    float _1379 = _1377;
    float _1381 = _1377;
    if (!_1329)
    {
        _586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1383 = _586;
    float _1385 = _1383;
    float _1387 = _1383;
    if (!_1329)
    {
        _588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1389 = _588;
    float _1391 = _1389;
    float _1393 = _1389;
    if (!_1329)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1395 = _959;
    float _1397 = _1395;
    float _1399 = _1395;
    if (!_1329)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1401 = _961;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1329)
    {
        _963 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _963;
    float _1409 = _1083 * _846;
    float _1411 = _857 * _1375;
    float _1413 = _857 * _1409;
    float _1415 = _871 * _1409;
    float _1417 = fma(_867, _1413, _851);
    float _1419 = fma(_869, _1413, _853);
    float _1421 = fma(_857, _1415, _855);
    out.m_83.x = _1417;
    out.m_83.y = _1419;
    out.m_83.z = _1421;
    out.m_83.w = _1411;
    bool _1423 = !_1329;
    float _1425 = _1407;
    float _1427 = _1407;
    if (!_1423)
    {
        bool _1429 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1431 = isnan(_554);
        bool _1433 = _1429 || _1431;
        bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1437 = _1433 || _1435;
        if (!_1437)
        {
            float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1441 = _554 + _1439;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1443;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1451 = 1.0 / _1445;
            float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1459 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1469 = _1441 * _1451;
            float _1471 = precise::clamp(_1469, 0.0, 1.0);
            float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1477 = fma(_1471, _1449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1479 = fma(_1471, _1475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1481 = fma(_1471, _1455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1483 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1485 = fma(_1471, _1463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1487 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1405 = _1481;
            _1387 = _1485;
            _1399 = _1477;
            _1381 = _1483;
            _1427 = _1479;
            _1393 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1493 = isnan(_554);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1501 = _1397;
            _1399 = _1501;
            if (!_1499)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1503 = _1403;
            _1405 = _1503;
            if (!_1499)
            {
                _1425 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1505 = _1425;
            _1427 = _1505;
            if (!_1499)
            {
                _1379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1507 = _1379;
            _1381 = _1507;
            if (!_1499)
            {
                _1385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1509 = _1385;
            _1387 = _1509;
            if (!_1499)
            {
                _1391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1511 = _1391;
            bool _1513 = !_1499;
            _1393 = _1511;
            if (!_1513)
            {
                bool _1515 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1517 = isnan(_554);
                bool _1519 = _1515 || _1517;
                bool _1521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1523 = _1519 || _1521;
                if (!_1523)
                {
                    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1527 = _554 + _1525;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1529;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1537 = 1.0 / _1531;
                    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1555 = _1527 * _1537;
                    float _1557 = precise::clamp(_1555, 0.0, 1.0);
                    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1563 = fma(_1557, _1535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1565 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1567 = fma(_1557, _1541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1569 = fma(_1557, _1545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1571 = fma(_1557, _1549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1573 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1405 = _1567;
                    _1387 = _1571;
                    _1399 = _1563;
                    _1381 = _1569;
                    _1427 = _1565;
                    _1393 = _1573;
                    _1489 = true;
                }
                else
                {
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1427 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1489 = false;
    float _1575 = _1405;
    float _1577 = _1387;
    float _1579 = _1399;
    float _1581 = _1381;
    float _1583 = _1427;
    float _1585 = _1393;
    float _1587 = fma(_1263, -0.5, 0.5);
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = -_1575;
    float _1593 = _1591 + _1577;
    float _1595 = -_1579;
    float _1597 = _1595 + _1581;
    float _1599 = -_1583;
    float _1601 = _1599 + _1585;
    bool _1603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1605 = fma(_1589, _1593, _1575);
    float _1607 = fma(_1589, _1597, _1579);
    float _1609 = fma(_1589, _1601, _1583);
    float _1611 = _1605 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1613 = fma(_1607, 0.298911988735198974609375, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1617 = fma(_1609, 0.114477999508380889892578125, _1613);
    out.m_47.x = _1615;
    float _1619 = -_1617;
    float _1621 = _1607 + _1619;
    float _1623 = -_1617;
    float _1625 = _1605 + _1623;
    float _1627 = -_1617;
    float _1629 = _1609 + _1627;
    float _1631 = fma(_1621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1635 = fma(_1629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    out.m_87.x = _1631;
    out.m_87.y = _1633;
    out.m_87.z = _1635;
    if (!_1603)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1637 = -_530;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1641 = -_540;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1645 = -_542;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = sqrt(_1653);
    float _1657 = rsqrt(_1653);
    float _1659 = -_1655;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1643 * _1657;
    float _1669 = _1639 * _1657;
    float _1671 = abs(_1665);
    float _1673 = log2(_1671);
    float _1675 = _1647 * _1657;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1679 = _1263 * _1669;
    float _1681 = -_1669;
    float _1683 = -_1677;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1683);
    float _1687 = fma(_1261, _1667, _1679);
    float _1689 = -_1675;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1685);
    float _1693 = fma(_1265, _1675, _1687);
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1699 = _1691 + _1697;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = exp2(_1701);
    float _1709 = _1707 * _1705;
    float _1711 = _1695 * _1709;
    float _1713 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1715 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1717 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1713;
    out.m_85.y = _1715;
    out.m_85.z = _1717;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1775 = as_type<float>(_122);
        out.gl_Position.z = _1775;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_158);
        out.gl_Position.z = _1844;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = in.m_51.w;
    float _168 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_49.x;
    float _188 = in.m_49.y;
    float _190 = in.m_49.z;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = 0.0;
    if (!_184)
    {
        float _200 = _168 * _168;
        float _202 = _200 * 0.5;
        _198 = _202;
    }
    float _204 = _198;
    float _206 = _204;
    if (!_184)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _218 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _224 = _218 * _216;
    float _226 = _218;
    float _228 = _210;
    float _230 = _170;
    if (!_184)
    {
        _226 = _168;
    }
    float _232 = _226;
    float _234 = _222 * _220;
    bool _236 = !_184;
    float _238 = _232;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _168 * _242;
        float _252 = exp2(_250);
        float _254 = _248 * 0.693147182464599609375;
        float _256 = 1.0 / _254;
        float _258 = 1.0 / _246;
        float _260 = _252 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _256, _168);
        float _266 = _264 * _258;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _268;
    }
    float _270 = _228;
    bool _272 = !_184;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _168 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _238 = _292;
    }
    float _294 = _238;
    float _296 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _298 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = fma(_294, _188, _296);
    float _306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _308 = fma(_294, _186, _300);
    float _310 = fma(_294, _190, _302);
    float _312 = fma(_304, _166, _194);
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _316 = fma(_308, _166, _192);
    float _318 = fma(_310, _166, _196);
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _330 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _314 * _306;
    float _334 = _224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _338 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _340 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _342 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _344 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _346 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _348 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _352 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _340);
    float _354 = _342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].z, _344);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _354 + _352;
    float _366 = _360 + _356;
    float _368 = _362 + _358;
    float _370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _372 = _364 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _376 = _364 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _380 = _366 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = _368 + _382;
    float _386 = _372 * _372;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _368 + _388;
    float _392 = _384 * _384;
    float _394 = fma(_380, _380, _386);
    float _396 = _390 * _390;
    float _398 = in.m_55.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[193].y + _400;
    float _404 = _392 + _394;
    float _406 = fma(_376, _376, _396);
    float _408 = 1.0 / _402;
    float _410 = sqrt(_404);
    float _412 = sqrt(_406);
    float _414 = abs(_410);
    float _416 = precise::max(_414, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _418 = -_398;
    float _420 = _418 + 1.0;
    float _422 = precise::min(_416, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    bool _424 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _428 = _422 + _426;
    float _430 = _428 * _408;
    float _432 = _430 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _434 = -_420;
    float _436 = fma(_434, _432, _366);
    float _438 = _408;
    float _440 = _398;
    float _442 = _402;
    float _444 = _366;
    float _446 = _432;
    float _448 = _420;
    float _450 = _386;
    float _452 = _392;
    float _454 = _406;
    if (!_424)
    {
        _438 = _392;
    }
    float _456 = _438;
    float _458 = _456;
    if (!_424)
    {
        _440 = _384;
    }
    float _460 = _440;
    float _462 = _460;
    if (!_424)
    {
        _442 = _372;
    }
    float _464 = _442;
    float _466 = _464;
    if (!_424)
    {
        _444 = _364;
    }
    float _468 = _444;
    float _470 = _468;
    if (!_424)
    {
        _446 = _368;
    }
    float _472 = _446;
    float _474 = _472;
    if (!_424)
    {
        _448 = _436;
    }
    float _476 = _448;
    bool _478 = !_424;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _412 + _484;
        float _488 = rsqrt(_406);
        float _490 = _486 * _482;
        float _492 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = _490 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _488 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_376, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_390, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _518 = _510 + _516;
        float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _522 = _512 + _520;
        float _524 = fma(_436, _502, _514);
        float _526 = _518 * _518;
        float _528 = _522 * _522;
        _480 = _524;
        _450 = _526;
        _458 = _528;
        _466 = _518;
        _462 = _522;
        _470 = _510;
        _474 = _512;
    }
    float _530 = _480;
    float _532 = _450;
    float _534 = _458;
    float _536 = _466;
    float _538 = _462;
    float _540 = _470;
    float _542 = _474;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _530 + _544;
    float _548 = fma(_546, _546, _532);
    float _550 = _548 + _534;
    float _552 = rsqrt(_550);
    float _554 = sqrt(_550);
    float _556 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _536 * _556;
    float _560 = _538 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _364;
    float _578 = _566;
    float _580 = _574;
    float _582 = _558;
    float _584 = _538;
    float _586 = _546;
    float _588 = _536;
    if (_570)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _590;
    }
    float _592 = _576;
    if (_570)
    {
        float _594 = rsqrt(_566);
        _578 = _594;
    }
    float _596 = _578;
    float _598 = _596;
    if (_570)
    {
        float _600 = _574 * _592;
        _580 = _600;
    }
    float _602 = _580;
    if (_570)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _452 = _604;
    }
    float _606 = _452;
    float _608 = _592;
    float _610 = _606;
    if (_570)
    {
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        _608 = _614;
    }
    float _616 = _608;
    float _618 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _620 = precise::max(0.0, _618);
    float _622 = _384;
    float _624 = _620;
    if (_570)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = -_556;
    float _634 = -_620;
    float _636 = fma(_546, _632, _634);
    if (_570)
    {
        float _638 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _638;
    }
    float _640 = _624;
    float _642 = _616;
    float _644 = _640;
    if (_570)
    {
        float _646 = fma(_616, _640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _642 = _646;
    }
    float _648 = _642;
    float _650 = _648;
    float _652 = _630;
    if (_570)
    {
        float _654 = _630 + (-1.0);
        _644 = _654;
    }
    float _656 = _644;
    float _658 = _656;
    if (_570)
    {
        float _660 = _596 * _648;
        _454 = _660;
    }
    float _662 = _454;
    if (!_570)
    {
        _650 = _636;
    }
    float _664 = _650;
    float _666 = _664;
    if (_570)
    {
        float _668 = _656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _610 = _668;
    }
    float _670 = _610;
    if (_570)
    {
        float _672 = _558 * _662;
        _582 = _672;
    }
    float _674 = _582;
    if (!_570)
    {
        _658 = _560;
    }
    float _676 = _658;
    float _678 = _676;
    if (_570)
    {
        float _680 = _560 * _662;
        _678 = _680;
    }
    float _682 = _678;
    if (!_570)
    {
        _598 = _562;
    }
    float _684 = _598;
    float _686 = _684;
    if (_570)
    {
        float _688 = fma(_636, _630, _670);
        _666 = _688;
    }
    float _690 = _666;
    if (_570)
    {
        float _692 = _674 * _674;
        _686 = _692;
    }
    float _694 = _686;
    if (!_570)
    {
        _652 = _564;
    }
    float _696 = _652;
    float _698 = _696;
    if (_570)
    {
        float _700 = _682 * _682;
        _698 = _700;
    }
    float _702 = _698;
    float _704 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = fma(_690, _690, _694);
    float _708 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _710 = _706 + _702;
    float _712 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _714 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _718 = fma(_554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = rsqrt(_710);
    float _724 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _712);
    float _726 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _736 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _738 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _728);
    float _740 = abs(_732);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _746 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _736);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _752 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _708);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _722 * _674;
    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _760 = _722 * _690;
    float _762 = -_750;
    float _764 = fma(_762, _744, 1.0);
    float _766 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _758);
    float _770 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _772 = _722 * _682;
    float _774 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = _766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = -_770;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _778);
    float _782 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _784 = exp2(_774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = -_772;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _780);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _798 = fma(_790, -0.5, 0.5);
    float _800 = fma(_790, 0.5, 0.5);
    float _802 = log2(_764);
    float _804 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _806 = _760 + 1.0;
    float _808 = fma(_800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _810 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _812 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _804);
    float _814 = fma(_800, _808, -0.212114393711090087890625);
    float _816 = 1.0 / _792;
    float _818 = -_760;
    float _820 = fma(_784, _806, _818);
    float _822 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _826 = fma(_800, _814, 1.570728778839111328125);
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = sqrt(_798);
    float _832 = _802 * 0.693147182464599609375;
    float _834 = _822 * _816;
    float _836 = _824 * _816;
    float _838 = _832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = fma(_834, 0.5, 0.5);
    float _842 = fma(_836, -0.5, 0.5);
    float _844 = _830 * 0.636619746685028076171875;
    float3 _2955 = float3(_840, _842, _838);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2955, float3(0.0), isnan(_2955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2955, float3(0.0), isnan(_2955)), level(0.0)).x;
    float3 _2966 = float3(_840, _842, _838);
    float4 _849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2966, float3(0.0), isnan(_2966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2966, float3(0.0), isnan(_2966)), level(0.0)).xyzw;
    float _851 = _849.x;
    float _853 = _849.y;
    float _855 = _849.z;
    float _857 = _849.w;
    float _859 = -_826;
    float _861 = fma(_844, _859, 1.0);
    float2 _2988 = float2(_861, _828);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = in.m_57.w;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _877 = in.m_59.z;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _881 = _879 != 0;
    float _883 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _887 = _885 != 0;
    float _889 = in.m_57.y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _895 = in.m_59.y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _905 = _903 != 0;
    float _907 = in.m_57.z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _911 = _875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _915 = in.m_59.x;
    float _917 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _919 = -_873;
    float _921 = _919 + 1.0;
    float _923 = in.m_59.w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _927 = in.m_57.x;
    bool _929 = _877 > 0.5;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_889;
    float _935 = _933 + 1.0;
    out.m_61.w = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _939 = _895 > 0.5;
    float _941 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _945 = _939 ? as_type<int>(_935) : as_type<int>(_889);
    float _947 = exp2(_883);
    float _949 = _873;
    float _951 = _907;
    float _953 = _889;
    float _955 = _877;
    float _957 = _895;
    float _959 = _792;
    float _961 = _822;
    float _963 = _824;
    if (_881)
    {
        float _965 = _929 ? _921 : _873;
        _949 = _965;
    }
    float _967 = _949;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _973 = _971 != 0;
    float _975 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[78].z, _937);
    float _977 = _887 ? as_type<float>(_945) : _889;
    float _979 = _915 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _981 = _895 > 0.5;
    bool _983 = _981 && _973;
    float _985 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = -_891;
    float _989 = fma(_979, 2.0, _987);
    bool _991 = _923 > 0.5;
    float _993 = fma(_911, _967, -0.5);
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1001 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[88].z, _943);
    float _1003 = 0.0;
    float _1005 = _999;
    if (_973)
    {
        _1003 = _907;
    }
    float _1007 = _1003;
    float _1009 = fma(_999, -2.0, _909);
    float _1011 = _1007;
    if (!_899)
    {
        _1005 = _927;
    }
    float _1013 = _1005;
    float _1015 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _1017 = _1013;
    if (_983)
    {
        float _1019 = -_1007;
        float _1021 = _1019 + 1.0;
        _1011 = _1021;
    }
    float _1023 = _1011;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1027 = _1025 != 0;
    float _1029 = -_140;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[76].x, _989);
    float _1033 = in.m_63.x;
    float _1035 = in.m_63.y;
    float _1037 = in.m_63.z;
    float _1039 = 0.0;
    if (!_899)
    {
        _1039 = _1013;
    }
    float _1041 = _1039;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1045 = _1041;
    if (_973)
    {
        _951 = _1023;
    }
    float _1047 = _951;
    float _1049 = -_947;
    float _1051 = _1049 + 1.0;
    bool _1053 = _172 != 0.0;
    bool _1055 = isnan(_172);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _941);
    if (_899)
    {
        _1017 = _927;
    }
    float _1065 = _1017;
    float _1067 = fma(_985, _977, -0.5);
    bool _1069 = _170 == 0.0;
    bool _1071 = !_1061;
    bool _1073 = _1069 && _1071;
    float _1075 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1079 = _174 == 0.0;
    bool _1081 = _1079 && _1073;
    float _1083 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1085 = _1077;
    bool _1087 = _1081;
    float _1089 = _1065;
    if (_997)
    {
        float _1091 = _991 ? _935 : _889;
        _953 = _1091;
    }
    float _1093 = _953;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1097 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    if (!_1027)
    {
        _1085 = _895;
    }
    float _1099 = _1085;
    out.m_65.x = _540;
    out.m_65.y = _530;
    out.m_65.z = _542;
    float _1101 = _1099;
    if (_1027)
    {
        _1101 = _915;
    }
    float _1103 = _1101;
    float _1105 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1097);
    float _1107 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1095);
    float _1109 = -_1075;
    float _1111 = fma(_1105, _1067, _1109);
    float _1113 = _1033;
    float _1115 = _1037;
    float _1117 = _1035;
    int _1119 = as_type<int>(_1103);
    if (!_1081)
    {
        float _1121 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1113 = _1121;
    }
    float _1123 = _1113;
    if (_1027)
    {
        _230 = _915;
    }
    float _1125 = _230;
    float _1127 = _1125;
    if (!_1081)
    {
        float _1129 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1037);
        _1115 = _1129;
    }
    float _1131 = _1115;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1081)
    {
        float _1135 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1117 = _1135;
    }
    float _1137 = _1117;
    if (!_1027)
    {
        _1127 = _877;
    }
    float _1139 = _1127;
    float _1141 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1145 = _1141;
    if (_899)
    {
        float _1147 = -_1065;
        float _1149 = _1147 + 1.0;
        _1133 = as_type<int>(_1149);
    }
    int _1151 = _1133;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_899)
    {
        bool _1155 = _915 > 0.5;
        _1087 = _1155;
    }
    bool _1157 = _1087;
    float _1159 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1161 = fma(_1141, _1093, -0.5);
    float _1163 = -_1143;
    float _1165 = fma(_1153, 2.0, _1163);
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1027)
    {
        _1145 = _877;
    }
    float _1169 = _1145;
    float _1171 = fma(_1159, _1047, -0.5);
    float _1173 = _1169;
    if (_1027)
    {
        _1173 = _895;
    }
    float _1175 = _1173;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1179 = _1175;
    if (_899)
    {
        float _1181 = _1157 ? as_type<float>(_1151) : _1065;
        _1045 = _1181;
    }
    float _1183 = _1045;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = in.m_55.x;
    float _1189 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1177);
    float _1191 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _925);
    if (!_1027)
    {
        _1179 = _877;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_905)
    {
        float _1199 = -_1065;
        float _1201 = _1199 + 1.0;
        _1119 = as_type<int>(_1201);
    }
    int _1203 = _1119;
    float _1205 = -_1167;
    float _1207 = fma(_1191, 2.0, _1205);
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    if (!_1027)
    {
        _955 = _895;
    }
    float _1213 = _955;
    float _1215 = -_140;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    if (_1027)
    {
        _1197 = _895;
    }
    float _1219 = _1197;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1027)
    {
        _957 = _915;
    }
    float _1223 = _957;
    float _1225 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_905)
    {
        float _1227 = _929 ? as_type<float>(_1203) : _1065;
        _1089 = _1227;
    }
    float _1229 = _1089;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1239 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1231);
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1225);
    float _1249 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1251 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1253 = _1239 * (-0.15915493667125701904296875);
    float _1255 = fma(_1243, _1229, -0.5);
    float _1257 = fma(_1237, _1183, -0.5);
    float _1259 = fma(_1241, -2.0, _1043);
    float _1261 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1247);
    float _1263 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1249);
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = fma(_1211, _1255, _1217);
    float _1273 = fma(_1015, _1257, _1031);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1277 = _1253 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1299 = in.m_55.y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1303 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1193);
    float _1305 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1307 = in.m_55.w;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1291;
    out.m_67.w = _1285;
    float _1315 = fma(_1297, -2.0, _1301);
    float _1317 = -_140;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1165);
    bool _1321 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_554);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_69.x = _1245;
    out.m_69.y = _1311;
    out.m_69.z = _1313;
    out.m_69.w = _1309;
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1315);
    out.m_71.x = _1187;
    out.m_73.x = _1261;
    out.m_73.y = _1263;
    out.m_73.z = _1265;
    float _1333 = _1269 * _993;
    float _1335 = -_1305;
    float _1337 = fma(_1303, _1161, _1335);
    float _1339 = _1279 * _993;
    float _1341 = _1273 + 0.5;
    float _1343 = -_1333;
    float _1345 = fma(_1279, _1171, _1343);
    float _1347 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1001);
    float _1349 = _1111 + 0.5;
    float _1351 = _1271 + 0.5;
    float _1353 = _1337 + 0.5;
    float _1355 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1107);
    float _1357 = fma(_1269, _1171, _1339);
    float _1359 = fma(_1347, _1345, _1319);
    float _1361 = _1063 + _792;
    out.m_75.x = _1341;
    out.m_75.y = _1349;
    out.m_75.z = _1351;
    out.m_75.w = _1353;
    float _1363 = -_1331;
    float _1365 = fma(_1355, _1357, _1363);
    float _1367 = _1359 + 0.5;
    float _1369 = _1361 * 0.5;
    out.m_71.y = _1299;
    float _1371 = _1365 + 0.5;
    out.m_71.w = _1307;
    out.m_77.x = _1367;
    out.m_77.y = _1371;
    float _1373 = -_1083;
    float _1375 = _1373 + 1.0;
    out.m_79.z = _1369;
    out.m_79.w = _792;
    out.m_81.x = _536;
    out.m_81.y = _546;
    out.m_81.z = _538;
    out.gl_Position.x = _822;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1063;
    out.gl_Position.w = _792;
    if (!_1329)
    {
        _584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1377 = _584;
    float _1379 = _1377;
    float _1381 = _1377;
    if (!_1329)
    {
        _586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1383 = _586;
    float _1385 = _1383;
    float _1387 = _1383;
    if (!_1329)
    {
        _588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1389 = _588;
    float _1391 = _1389;
    float _1393 = _1389;
    if (!_1329)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1395 = _959;
    float _1397 = _1395;
    float _1399 = _1395;
    if (!_1329)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1401 = _961;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1329)
    {
        _963 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _963;
    float _1409 = _1083 * _846;
    float _1411 = _857 * _1375;
    float _1413 = _857 * _1409;
    float _1415 = _871 * _1409;
    float _1417 = fma(_867, _1413, _851);
    float _1419 = fma(_869, _1413, _853);
    float _1421 = fma(_857, _1415, _855);
    out.m_83.x = _1417;
    out.m_83.y = _1419;
    out.m_83.z = _1421;
    out.m_83.w = _1411;
    bool _1423 = !_1329;
    float _1425 = _1407;
    float _1427 = _1407;
    if (!_1423)
    {
        bool _1429 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1431 = isnan(_554);
        bool _1433 = _1429 || _1431;
        bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1437 = _1433 || _1435;
        if (!_1437)
        {
            float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1441 = _554 + _1439;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1443;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1451 = 1.0 / _1445;
            float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1459 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1469 = _1441 * _1451;
            float _1471 = precise::clamp(_1469, 0.0, 1.0);
            float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1477 = fma(_1471, _1449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1479 = fma(_1471, _1475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1481 = fma(_1471, _1455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1483 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1485 = fma(_1471, _1463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1487 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1405 = _1481;
            _1387 = _1485;
            _1399 = _1477;
            _1381 = _1483;
            _1427 = _1479;
            _1393 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1493 = isnan(_554);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1501 = _1397;
            _1399 = _1501;
            if (!_1499)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1503 = _1403;
            _1405 = _1503;
            if (!_1499)
            {
                _1425 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1505 = _1425;
            _1427 = _1505;
            if (!_1499)
            {
                _1379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1507 = _1379;
            _1381 = _1507;
            if (!_1499)
            {
                _1385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1509 = _1385;
            _1387 = _1509;
            if (!_1499)
            {
                _1391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1511 = _1391;
            bool _1513 = !_1499;
            _1393 = _1511;
            if (!_1513)
            {
                bool _1515 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1517 = isnan(_554);
                bool _1519 = _1515 || _1517;
                bool _1521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1523 = _1519 || _1521;
                if (!_1523)
                {
                    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1527 = _554 + _1525;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1529;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1537 = 1.0 / _1531;
                    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1555 = _1527 * _1537;
                    float _1557 = precise::clamp(_1555, 0.0, 1.0);
                    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1563 = fma(_1557, _1535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1565 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1567 = fma(_1557, _1541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1569 = fma(_1557, _1545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1571 = fma(_1557, _1549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1573 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1405 = _1567;
                    _1387 = _1571;
                    _1399 = _1563;
                    _1381 = _1569;
                    _1427 = _1565;
                    _1393 = _1573;
                    _1489 = true;
                }
                else
                {
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1427 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1489 = false;
    float _1575 = _1405;
    float _1577 = _1387;
    float _1579 = _1399;
    float _1581 = _1381;
    float _1583 = _1427;
    float _1585 = _1393;
    float _1587 = fma(_1263, -0.5, 0.5);
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = -_1575;
    float _1593 = _1591 + _1577;
    float _1595 = -_1579;
    float _1597 = _1595 + _1581;
    float _1599 = -_1583;
    float _1601 = _1599 + _1585;
    bool _1603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1605 = fma(_1589, _1593, _1575);
    float _1607 = fma(_1589, _1597, _1579);
    float _1609 = fma(_1589, _1601, _1583);
    float _1611 = _1605 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1613 = fma(_1607, 0.298911988735198974609375, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1617 = fma(_1609, 0.114477999508380889892578125, _1613);
    out.m_47.x = _1615;
    float _1619 = -_1617;
    float _1621 = _1607 + _1619;
    float _1623 = -_1617;
    float _1625 = _1605 + _1623;
    float _1627 = -_1617;
    float _1629 = _1609 + _1627;
    float _1631 = fma(_1621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1635 = fma(_1629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    out.m_87.x = _1631;
    out.m_87.y = _1633;
    out.m_87.z = _1635;
    if (!_1603)
    {
        return out;
    }
    float _1637 = -_530;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1641 = -_540;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1645 = -_542;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = sqrt(_1653);
    float _1657 = rsqrt(_1653);
    float _1659 = -_1655;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1643 * _1657;
    float _1669 = _1639 * _1657;
    float _1671 = abs(_1665);
    float _1673 = log2(_1671);
    float _1675 = _1647 * _1657;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1679 = _1263 * _1669;
    float _1681 = -_1669;
    float _1683 = -_1677;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1683);
    float _1687 = fma(_1261, _1667, _1679);
    float _1689 = -_1675;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1685);
    float _1693 = fma(_1265, _1675, _1687);
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1699 = _1691 + _1697;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = exp2(_1701);
    float _1709 = _1707 * _1705;
    float _1711 = _1695 * _1709;
    float _1713 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1715 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1717 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1713;
    out.m_85.y = _1715;
    out.m_85.z = _1717;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1775 = as_type<float>(_122);
        out.gl_Position.z = _1775;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_158);
        out.gl_Position.z = _1844;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = in.m_51.w;
    float _168 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_49.x;
    float _188 = in.m_49.y;
    float _190 = in.m_49.z;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = 0.0;
    if (!_184)
    {
        float _200 = _168 * _168;
        float _202 = _200 * 0.5;
        _198 = _202;
    }
    float _204 = _198;
    float _206 = _204;
    if (!_184)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _218 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _170);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _224 = _218 * _216;
    float _226 = _218;
    float _228 = _210;
    float _230 = _170;
    if (!_184)
    {
        _226 = _168;
    }
    float _232 = _226;
    float _234 = _222 * _220;
    bool _236 = !_184;
    float _238 = _232;
    if (!_236)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _168 * _242;
        float _252 = exp2(_250);
        float _254 = _248 * 0.693147182464599609375;
        float _256 = 1.0 / _254;
        float _258 = 1.0 / _246;
        float _260 = _252 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _256, _168);
        float _266 = _264 * _258;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _268;
    }
    float _270 = _228;
    bool _272 = !_184;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _168 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _238 = _292;
    }
    float _294 = _238;
    float _296 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _298 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = fma(_294, _188, _296);
    float _306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _308 = fma(_294, _186, _300);
    float _310 = fma(_294, _190, _302);
    float _312 = fma(_304, _166, _194);
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _316 = fma(_308, _166, _192);
    float _318 = fma(_310, _166, _196);
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    float _330 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _314 * _306;
    float _334 = _224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _336 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _338 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _340 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _342 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _344 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _346 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _334);
    float _348 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].z, _338);
    float _352 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _340);
    float _354 = _342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].z, _344);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _350 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _354 + _352;
    float _366 = _360 + _356;
    float _368 = _362 + _358;
    float _370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _372 = _364 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _376 = _364 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _380 = _366 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = _368 + _382;
    float _386 = _372 * _372;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _368 + _388;
    float _392 = _384 * _384;
    float _394 = fma(_380, _380, _386);
    float _396 = _390 * _390;
    float _398 = in.m_55.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[193].y + _400;
    float _404 = _392 + _394;
    float _406 = fma(_376, _376, _396);
    float _408 = 1.0 / _402;
    float _410 = sqrt(_404);
    float _412 = sqrt(_406);
    float _414 = abs(_410);
    float _416 = precise::max(_414, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _418 = -_398;
    float _420 = _418 + 1.0;
    float _422 = precise::min(_416, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    bool _424 = _412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _428 = _422 + _426;
    float _430 = _428 * _408;
    float _432 = _430 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _434 = -_420;
    float _436 = fma(_434, _432, _366);
    float _438 = _408;
    float _440 = _398;
    float _442 = _402;
    float _444 = _366;
    float _446 = _432;
    float _448 = _420;
    float _450 = _386;
    float _452 = _392;
    float _454 = _406;
    if (!_424)
    {
        _438 = _392;
    }
    float _456 = _438;
    float _458 = _456;
    if (!_424)
    {
        _440 = _384;
    }
    float _460 = _440;
    float _462 = _460;
    if (!_424)
    {
        _442 = _372;
    }
    float _464 = _442;
    float _466 = _464;
    if (!_424)
    {
        _444 = _364;
    }
    float _468 = _444;
    float _470 = _468;
    if (!_424)
    {
        _446 = _368;
    }
    float _472 = _446;
    float _474 = _472;
    if (!_424)
    {
        _448 = _436;
    }
    float _476 = _448;
    bool _478 = !_424;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _412 + _484;
        float _488 = rsqrt(_406);
        float _490 = _486 * _482;
        float _492 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = _490 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _488 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_376, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_390, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _518 = _510 + _516;
        float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _522 = _512 + _520;
        float _524 = fma(_436, _502, _514);
        float _526 = _518 * _518;
        float _528 = _522 * _522;
        _480 = _524;
        _450 = _526;
        _458 = _528;
        _466 = _518;
        _462 = _522;
        _470 = _510;
        _474 = _512;
    }
    float _530 = _480;
    float _532 = _450;
    float _534 = _458;
    float _536 = _466;
    float _538 = _462;
    float _540 = _470;
    float _542 = _474;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _530 + _544;
    float _548 = fma(_546, _546, _532);
    float _550 = _548 + _534;
    float _552 = rsqrt(_550);
    float _554 = sqrt(_550);
    float _556 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _536 * _556;
    float _560 = _538 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _364;
    float _578 = _566;
    float _580 = _574;
    float _582 = _558;
    float _584 = _538;
    float _586 = _546;
    float _588 = _536;
    if (_570)
    {
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _590;
    }
    float _592 = _576;
    if (_570)
    {
        float _594 = rsqrt(_566);
        _578 = _594;
    }
    float _596 = _578;
    float _598 = _596;
    if (_570)
    {
        float _600 = _574 * _592;
        _580 = _600;
    }
    float _602 = _580;
    if (_570)
    {
        float _604 = _602 * 0.15915493667125701904296875;
        _452 = _604;
    }
    float _606 = _452;
    float _608 = _592;
    float _610 = _606;
    if (_570)
    {
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        _608 = _614;
    }
    float _616 = _608;
    float _618 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _620 = precise::max(0.0, _618);
    float _622 = _384;
    float _624 = _620;
    if (_570)
    {
        float _626 = _606 * 6.283185482025146484375;
        float _628 = cos(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = -_556;
    float _634 = -_620;
    float _636 = fma(_546, _632, _634);
    if (_570)
    {
        float _638 = _636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _624 = _638;
    }
    float _640 = _624;
    float _642 = _616;
    float _644 = _640;
    if (_570)
    {
        float _646 = fma(_616, _640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _642 = _646;
    }
    float _648 = _642;
    float _650 = _648;
    float _652 = _630;
    if (_570)
    {
        float _654 = _630 + (-1.0);
        _644 = _654;
    }
    float _656 = _644;
    float _658 = _656;
    if (_570)
    {
        float _660 = _596 * _648;
        _454 = _660;
    }
    float _662 = _454;
    if (!_570)
    {
        _650 = _636;
    }
    float _664 = _650;
    float _666 = _664;
    if (_570)
    {
        float _668 = _656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _610 = _668;
    }
    float _670 = _610;
    if (_570)
    {
        float _672 = _558 * _662;
        _582 = _672;
    }
    float _674 = _582;
    if (!_570)
    {
        _658 = _560;
    }
    float _676 = _658;
    float _678 = _676;
    if (_570)
    {
        float _680 = _560 * _662;
        _678 = _680;
    }
    float _682 = _678;
    if (!_570)
    {
        _598 = _562;
    }
    float _684 = _598;
    float _686 = _684;
    if (_570)
    {
        float _688 = fma(_636, _630, _670);
        _666 = _688;
    }
    float _690 = _666;
    if (_570)
    {
        float _692 = _674 * _674;
        _686 = _692;
    }
    float _694 = _686;
    if (!_570)
    {
        _652 = _564;
    }
    float _696 = _652;
    float _698 = _696;
    if (_570)
    {
        float _700 = _682 * _682;
        _698 = _700;
    }
    float _702 = _698;
    float _704 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = fma(_690, _690, _694);
    float _708 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _710 = _706 + _702;
    float _712 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _714 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _718 = fma(_554, (*spvDescriptorSet0.vp_c15)._m0[23].w, _716);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = rsqrt(_710);
    float _724 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _712);
    float _726 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _714);
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _736 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _738 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _728);
    float _740 = abs(_732);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _746 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _736);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _752 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _708);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _722 * _674;
    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _760 = _722 * _690;
    float _762 = -_750;
    float _764 = fma(_762, _744, 1.0);
    float _766 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _758);
    float _770 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _772 = _722 * _682;
    float _774 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = _766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = -_770;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _778);
    float _782 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _784 = exp2(_774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _788 = -_772;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _780);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _786);
    float _798 = fma(_790, -0.5, 0.5);
    float _800 = fma(_790, 0.5, 0.5);
    float _802 = log2(_764);
    float _804 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _806 = _760 + 1.0;
    float _808 = fma(_800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _810 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _812 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _804);
    float _814 = fma(_800, _808, -0.212114393711090087890625);
    float _816 = 1.0 / _792;
    float _818 = -_760;
    float _820 = fma(_784, _806, _818);
    float _822 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _826 = fma(_800, _814, 1.570728778839111328125);
    float _828 = fma(_820, 0.5, 0.5);
    float _830 = sqrt(_798);
    float _832 = _802 * 0.693147182464599609375;
    float _834 = _822 * _816;
    float _836 = _824 * _816;
    float _838 = _832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _840 = fma(_834, 0.5, 0.5);
    float _842 = fma(_836, -0.5, 0.5);
    float _844 = _830 * 0.636619746685028076171875;
    float3 _2955 = float3(_840, _842, _838);
    float _846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2955, float3(0.0), isnan(_2955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2955, float3(0.0), isnan(_2955)), level(0.0)).x;
    float3 _2966 = float3(_840, _842, _838);
    float4 _849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2966, float3(0.0), isnan(_2966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2966, float3(0.0), isnan(_2966)), level(0.0)).xyzw;
    float _851 = _849.x;
    float _853 = _849.y;
    float _855 = _849.z;
    float _857 = _849.w;
    float _859 = -_826;
    float _861 = fma(_844, _859, 1.0);
    float2 _2988 = float2(_861, _828);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = in.m_57.w;
    float _875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _877 = in.m_59.z;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _881 = _879 != 0;
    float _883 = _742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _887 = _885 != 0;
    float _889 = in.m_57.y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _895 = in.m_59.y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _905 = _903 != 0;
    float _907 = in.m_57.z;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _911 = _875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _915 = in.m_59.x;
    float _917 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _919 = -_873;
    float _921 = _919 + 1.0;
    float _923 = in.m_59.w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _927 = in.m_57.x;
    bool _929 = _877 > 0.5;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _933 = -_889;
    float _935 = _933 + 1.0;
    out.m_61.w = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _939 = _895 > 0.5;
    float _941 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _917);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _945 = _939 ? as_type<int>(_935) : as_type<int>(_889);
    float _947 = exp2(_883);
    float _949 = _873;
    float _951 = _907;
    float _953 = _889;
    float _955 = _877;
    float _957 = _895;
    float _959 = _792;
    float _961 = _822;
    float _963 = _824;
    if (_881)
    {
        float _965 = _929 ? _921 : _873;
        _949 = _965;
    }
    float _967 = _949;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _973 = _971 != 0;
    float _975 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[78].z, _937);
    float _977 = _887 ? as_type<float>(_945) : _889;
    float _979 = _915 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _981 = _895 > 0.5;
    bool _983 = _981 && _973;
    float _985 = _931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = -_891;
    float _989 = fma(_979, 2.0, _987);
    bool _991 = _923 > 0.5;
    float _993 = fma(_911, _967, -0.5);
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _997 = _995 != 0;
    float _999 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1001 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[88].z, _943);
    float _1003 = 0.0;
    float _1005 = _999;
    if (_973)
    {
        _1003 = _907;
    }
    float _1007 = _1003;
    float _1009 = fma(_999, -2.0, _909);
    float _1011 = _1007;
    if (!_899)
    {
        _1005 = _927;
    }
    float _1013 = _1005;
    float _1015 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _1017 = _1013;
    if (_983)
    {
        float _1019 = -_1007;
        float _1021 = _1019 + 1.0;
        _1011 = _1021;
    }
    float _1023 = _1011;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1027 = _1025 != 0;
    float _1029 = -_140;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[76].x, _989);
    float _1033 = in.m_63.x;
    float _1035 = in.m_63.y;
    float _1037 = in.m_63.z;
    float _1039 = 0.0;
    if (!_899)
    {
        _1039 = _1013;
    }
    float _1041 = _1039;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1045 = _1041;
    if (_973)
    {
        _951 = _1023;
    }
    float _1047 = _951;
    float _1049 = -_947;
    float _1051 = _1049 + 1.0;
    bool _1053 = _172 != 0.0;
    bool _1055 = isnan(_172);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _941);
    if (_899)
    {
        _1017 = _927;
    }
    float _1065 = _1017;
    float _1067 = fma(_985, _977, -0.5);
    bool _1069 = _170 == 0.0;
    bool _1071 = !_1061;
    bool _1073 = _1069 && _1071;
    float _1075 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1079 = _174 == 0.0;
    bool _1081 = _1079 && _1073;
    float _1083 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1085 = _1077;
    bool _1087 = _1081;
    float _1089 = _1065;
    if (_997)
    {
        float _1091 = _991 ? _935 : _889;
        _953 = _1091;
    }
    float _1093 = _953;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1097 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1077);
    if (!_1027)
    {
        _1085 = _895;
    }
    float _1099 = _1085;
    out.m_65.x = _540;
    out.m_65.y = _530;
    out.m_65.z = _542;
    float _1101 = _1099;
    if (_1027)
    {
        _1101 = _915;
    }
    float _1103 = _1101;
    float _1105 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1097);
    float _1107 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1095);
    float _1109 = -_1075;
    float _1111 = fma(_1105, _1067, _1109);
    float _1113 = _1033;
    float _1115 = _1037;
    float _1117 = _1035;
    int _1119 = as_type<int>(_1103);
    if (!_1081)
    {
        float _1121 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1113 = _1121;
    }
    float _1123 = _1113;
    if (_1027)
    {
        _230 = _915;
    }
    float _1125 = _230;
    float _1127 = _1125;
    if (!_1081)
    {
        float _1129 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1037);
        _1115 = _1129;
    }
    float _1131 = _1115;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1081)
    {
        float _1135 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1117 = _1135;
    }
    float _1137 = _1117;
    if (!_1027)
    {
        _1127 = _877;
    }
    float _1139 = _1127;
    float _1141 = _893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1145 = _1141;
    if (_899)
    {
        float _1147 = -_1065;
        float _1149 = _1147 + 1.0;
        _1133 = as_type<int>(_1149);
    }
    int _1151 = _1133;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_899)
    {
        bool _1155 = _915 > 0.5;
        _1087 = _1155;
    }
    bool _1157 = _1087;
    float _1159 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1161 = fma(_1141, _1093, -0.5);
    float _1163 = -_1143;
    float _1165 = fma(_1153, 2.0, _1163);
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1027)
    {
        _1145 = _877;
    }
    float _1169 = _1145;
    float _1171 = fma(_1159, _1047, -0.5);
    float _1173 = _1169;
    if (_1027)
    {
        _1173 = _895;
    }
    float _1175 = _1173;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1179 = _1175;
    if (_899)
    {
        float _1181 = _1157 ? as_type<float>(_1151) : _1065;
        _1045 = _1181;
    }
    float _1183 = _1045;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = in.m_55.x;
    float _1189 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1177);
    float _1191 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _925);
    if (!_1027)
    {
        _1179 = _877;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_905)
    {
        float _1199 = -_1065;
        float _1201 = _1199 + 1.0;
        _1119 = as_type<int>(_1201);
    }
    int _1203 = _1119;
    float _1205 = -_1167;
    float _1207 = fma(_1191, 2.0, _1205);
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    if (!_1027)
    {
        _955 = _895;
    }
    float _1213 = _955;
    float _1215 = -_140;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    if (_1027)
    {
        _1197 = _895;
    }
    float _1219 = _1197;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (!_1027)
    {
        _957 = _915;
    }
    float _1223 = _957;
    float _1225 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_905)
    {
        float _1227 = _929 ? as_type<float>(_1203) : _1065;
        _1089 = _1227;
    }
    float _1229 = _1089;
    float _1231 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1235 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1239 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1231);
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1225);
    float _1249 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1233);
    float _1251 = fma(_1123, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1253 = _1239 * (-0.15915493667125701904296875);
    float _1255 = fma(_1243, _1229, -0.5);
    float _1257 = fma(_1237, _1183, -0.5);
    float _1259 = fma(_1241, -2.0, _1043);
    float _1261 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1247);
    float _1263 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1249);
    float _1265 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1267 = _1253 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = fma(_1211, _1255, _1217);
    float _1273 = fma(_1015, _1257, _1031);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1277 = _1253 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1299 = in.m_55.y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1303 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1193);
    float _1305 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1259);
    float _1307 = in.m_55.w;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1311 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1291;
    out.m_67.w = _1285;
    float _1315 = fma(_1297, -2.0, _1301);
    float _1317 = -_140;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1165);
    bool _1321 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_554);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_69.x = _1245;
    out.m_69.y = _1311;
    out.m_69.z = _1313;
    out.m_69.w = _1309;
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1315);
    out.m_71.x = _1187;
    out.m_73.x = _1261;
    out.m_73.y = _1263;
    out.m_73.z = _1265;
    float _1333 = _1269 * _993;
    float _1335 = -_1305;
    float _1337 = fma(_1303, _1161, _1335);
    float _1339 = _1279 * _993;
    float _1341 = _1273 + 0.5;
    float _1343 = -_1333;
    float _1345 = fma(_1279, _1171, _1343);
    float _1347 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1001);
    float _1349 = _1111 + 0.5;
    float _1351 = _1271 + 0.5;
    float _1353 = _1337 + 0.5;
    float _1355 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1107);
    float _1357 = fma(_1269, _1171, _1339);
    float _1359 = fma(_1347, _1345, _1319);
    float _1361 = _1063 + _792;
    out.m_75.x = _1341;
    out.m_75.y = _1349;
    out.m_75.z = _1351;
    out.m_75.w = _1353;
    float _1363 = -_1331;
    float _1365 = fma(_1355, _1357, _1363);
    float _1367 = _1359 + 0.5;
    float _1369 = _1361 * 0.5;
    out.m_71.y = _1299;
    float _1371 = _1365 + 0.5;
    out.m_71.w = _1307;
    out.m_77.x = _1367;
    out.m_77.y = _1371;
    float _1373 = -_1083;
    float _1375 = _1373 + 1.0;
    out.m_79.z = _1369;
    out.m_79.w = _792;
    out.m_81.x = _536;
    out.m_81.y = _546;
    out.m_81.z = _538;
    out.gl_Position.x = _822;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1063;
    out.gl_Position.w = _792;
    if (!_1329)
    {
        _584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1377 = _584;
    float _1379 = _1377;
    float _1381 = _1377;
    if (!_1329)
    {
        _586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1383 = _586;
    float _1385 = _1383;
    float _1387 = _1383;
    if (!_1329)
    {
        _588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1389 = _588;
    float _1391 = _1389;
    float _1393 = _1389;
    if (!_1329)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1395 = _959;
    float _1397 = _1395;
    float _1399 = _1395;
    if (!_1329)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1401 = _961;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1329)
    {
        _963 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _963;
    float _1409 = _1083 * _846;
    float _1411 = _857 * _1375;
    float _1413 = _857 * _1409;
    float _1415 = _871 * _1409;
    float _1417 = fma(_867, _1413, _851);
    float _1419 = fma(_869, _1413, _853);
    float _1421 = fma(_857, _1415, _855);
    out.m_83.x = _1417;
    out.m_83.y = _1419;
    out.m_83.z = _1421;
    out.m_83.w = _1411;
    bool _1423 = !_1329;
    float _1425 = _1407;
    float _1427 = _1407;
    if (!_1423)
    {
        bool _1429 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1431 = isnan(_554);
        bool _1433 = _1429 || _1431;
        bool _1435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1437 = _1433 || _1435;
        if (!_1437)
        {
            float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1441 = _554 + _1439;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1445 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1443;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1451 = 1.0 / _1445;
            float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1459 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1467 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1469 = _1441 * _1451;
            float _1471 = precise::clamp(_1469, 0.0, 1.0);
            float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1475 = _1473 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1477 = fma(_1471, _1449, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1479 = fma(_1471, _1475, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1481 = fma(_1471, _1455, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1483 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1485 = fma(_1471, _1463, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1487 = fma(_1471, _1467, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1405 = _1481;
            _1387 = _1485;
            _1399 = _1477;
            _1381 = _1483;
            _1427 = _1479;
            _1393 = _1487;
            _1489 = true;
        }
        else
        {
            bool _1491 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1493 = isnan(_554);
            bool _1495 = _1491 || _1493;
            bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1499 = _1495 || _1497;
            if (!_1499)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1501 = _1397;
            _1399 = _1501;
            if (!_1499)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1503 = _1403;
            _1405 = _1503;
            if (!_1499)
            {
                _1425 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1505 = _1425;
            _1427 = _1505;
            if (!_1499)
            {
                _1379 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1507 = _1379;
            _1381 = _1507;
            if (!_1499)
            {
                _1385 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1509 = _1385;
            _1387 = _1509;
            if (!_1499)
            {
                _1391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1511 = _1391;
            bool _1513 = !_1499;
            _1393 = _1511;
            if (!_1513)
            {
                bool _1515 = _554 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1517 = isnan(_554);
                bool _1519 = _1515 || _1517;
                bool _1521 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1523 = _1519 || _1521;
                if (!_1523)
                {
                    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1527 = _554 + _1525;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1531 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1529;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1537 = 1.0 / _1531;
                    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1555 = _1527 * _1537;
                    float _1557 = precise::clamp(_1555, 0.0, 1.0);
                    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1561 = _1559 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1563 = fma(_1557, _1535, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1565 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1567 = fma(_1557, _1541, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1569 = fma(_1557, _1545, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1571 = fma(_1557, _1549, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1573 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1405 = _1567;
                    _1387 = _1571;
                    _1399 = _1563;
                    _1381 = _1569;
                    _1427 = _1565;
                    _1393 = _1573;
                    _1489 = true;
                }
                else
                {
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1387 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1381 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1427 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1489 = false;
    float _1575 = _1405;
    float _1577 = _1387;
    float _1579 = _1399;
    float _1581 = _1381;
    float _1583 = _1427;
    float _1585 = _1393;
    float _1587 = fma(_1263, -0.5, 0.5);
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = -_1575;
    float _1593 = _1591 + _1577;
    float _1595 = -_1579;
    float _1597 = _1595 + _1581;
    float _1599 = -_1583;
    float _1601 = _1599 + _1585;
    bool _1603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1605 = fma(_1589, _1593, _1575);
    float _1607 = fma(_1589, _1597, _1579);
    float _1609 = fma(_1589, _1601, _1583);
    float _1611 = _1605 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1613 = fma(_1607, 0.298911988735198974609375, _1611);
    float _1615 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1617 = fma(_1609, 0.114477999508380889892578125, _1613);
    out.m_47.x = _1615;
    float _1619 = -_1617;
    float _1621 = _1607 + _1619;
    float _1623 = -_1617;
    float _1625 = _1605 + _1623;
    float _1627 = -_1617;
    float _1629 = _1609 + _1627;
    float _1631 = fma(_1621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    float _1635 = fma(_1629, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1617);
    out.m_87.x = _1631;
    out.m_87.y = _1633;
    out.m_87.z = _1635;
    if (!_1603)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1637 = -_530;
    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1641 = -_540;
    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1645 = -_542;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1649 = _1639 * _1639;
    float _1651 = fma(_1643, _1643, _1649);
    float _1653 = fma(_1647, _1647, _1651);
    float _1655 = sqrt(_1653);
    float _1657 = rsqrt(_1653);
    float _1659 = -_1655;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1665 = precise::clamp(_1663, 0.0, 1.0);
    float _1667 = _1643 * _1657;
    float _1669 = _1639 * _1657;
    float _1671 = abs(_1665);
    float _1673 = log2(_1671);
    float _1675 = _1647 * _1657;
    float _1677 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1679 = _1263 * _1669;
    float _1681 = -_1669;
    float _1683 = -_1677;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1683);
    float _1687 = fma(_1261, _1667, _1679);
    float _1689 = -_1675;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1685);
    float _1693 = fma(_1265, _1675, _1687);
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1699 = _1691 + _1697;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1703 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    float _1707 = exp2(_1701);
    float _1709 = _1707 * _1705;
    float _1711 = _1695 * _1709;
    float _1713 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1715 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1717 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1713;
    out.m_85.y = _1715;
    out.m_85.z = _1717;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

