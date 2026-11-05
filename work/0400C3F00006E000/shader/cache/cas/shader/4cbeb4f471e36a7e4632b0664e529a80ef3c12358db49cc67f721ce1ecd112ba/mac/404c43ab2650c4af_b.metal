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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_112);
        out.gl_Position.z = _1194;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _106 = _130;
    }
    float _132 = _106;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_146);
        out.gl_Position.z = _1262;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_162)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _182;
    if (!_162)
    {
        float _192 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    bool _202 = !_162;
    float _204 = _194;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _150 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _150);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_162;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _150 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _176 = _258;
    }
    float _260 = _176;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _164);
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _268 * _270;
    float _280 = fma(_260, _170, _272);
    float _282 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _266 * _274;
    float _288 = fma(_280, _148, _186);
    float _290 = fma(_260, _168, _282);
    float _292 = fma(_260, _172, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _166);
    float _296 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _148, _184);
    float _300 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_292, _148, _188);
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = _294 * _296;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _322 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _322 + _326;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _328 + _332;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _344 + _362;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _360;
    float _370 = _338;
    float _372 = _362;
    float _374 = _282;
    float _376 = _312;
    if (!_366)
    {
        _368 = _338;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_366)
    {
        _370 = _334;
    }
    float _382 = _370;
    float _384 = _382;
    if (!_366)
    {
        _372 = _364;
    }
    float _386 = _372;
    bool _388 = !_366;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_352);
        float _400 = _396 * _392;
        float _402 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_364, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_348, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_342, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _374 = _484;
    }
    float _486 = _374;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _376 = _494;
    }
    float _496 = _376;
    float _498 = _446;
    if (_468)
    {
        float _500 = _496 * 6.283185482025146484375;
        float _502 = sin(_500);
        _498 = _502;
    }
    float _504 = _498;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _452;
    float _512 = _508;
    float _514 = _506;
    if (_468)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _510 = _518;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_508;
    float _526 = fma(_436, _522, _524);
    if (!_468)
    {
        _512 = _456;
    }
    float _528 = _512;
    float _530 = _528;
    if (_468)
    {
        float _532 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    float _536 = sqrt(_450);
    float _538 = _504;
    float _540 = _534;
    if (_468)
    {
        float _542 = fma(_504, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _478 = _542;
    }
    float _544 = _478;
    float _546 = _544;
    if (!_468)
    {
        _538 = _460;
    }
    float _548 = _538;
    float _550 = _548;
    float _552 = _520;
    if (_468)
    {
        float _554 = _520 + (-1.0);
        _540 = _554;
    }
    float _556 = _540;
    float _558 = 0.0;
    float _560 = _556;
    if (_468)
    {
        float _562 = _486 * _544;
        _558 = _562;
    }
    float _564 = _558;
    if (!_468)
    {
        _546 = _526;
    }
    float _566 = _546;
    float _568 = _566;
    if (_468)
    {
        float _570 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _570;
    }
    float _572 = _488;
    if (_468)
    {
        float _574 = _456 * _564;
        _530 = _574;
    }
    float _576 = _530;
    if (!_468)
    {
        _560 = _458;
    }
    float _578 = _560;
    float _580 = _578;
    if (_468)
    {
        float _582 = _458 * _564;
        _580 = _582;
    }
    float _584 = _580;
    if (_468)
    {
        float _586 = fma(_526, _520, _572);
        _568 = _586;
    }
    float _588 = _568;
    if (_468)
    {
        float _590 = _576 * _576;
        _550 = _590;
    }
    float _592 = _550;
    if (!_468)
    {
        _552 = _462;
    }
    float _594 = _552;
    float _596 = _594;
    if (_468)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _606 = _602 + _600;
    float _608 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _618 = rsqrt(_606);
    float _620 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _608);
    float _622 = -_614;
    float _624 = _622 + 1.0;
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _616);
    float _628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _630 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _620);
    float _632 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _626);
    float _636 = abs(_624);
    float _638 = log2(_636);
    float _640 = _630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = _634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _604);
    float _648 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _618 * _576;
    float _654 = -_648;
    float _656 = fma(_654, _628, 1.0);
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _660 = _644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _662 = _618 * _588;
    float _664 = _652 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _666 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].x, _660);
    float _670 = _618 * _584;
    float _672 = -_664;
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _672);
    float _676 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _666 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _668);
    float _682 = -_670;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _674);
    float _686 = exp2(_676);
    float _688 = _644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _680);
    float _692 = fma(_684, -0.5, 0.5);
    float _694 = _644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _696 = fma(_684, 0.5, 0.5);
    float _698 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _700 = log2(_656);
    float _702 = _662 + 1.0;
    float _704 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _706 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _708 = fma(_696, _704, -0.212114393711090087890625);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _712 = 1.0 / _690;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].x, _694);
    float _716 = -_662;
    float _718 = fma(_686, _702, _716);
    float _720 = fma(_696, _708, 1.570728778839111328125);
    float _722 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = sqrt(_692);
    float _728 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _730 = _700 * 0.693147182464599609375;
    float _732 = _730 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = _710 * _712;
    float _736 = _728 * _712;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _726 * 0.636619746685028076171875;
    float3 _2255 = float3(_738, _740, _732);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2255, float3(0.0), isnan(_2255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2255, float3(0.0), isnan(_2255)), level(0.0)).x;
    float _746 = -_720;
    float _748 = fma(_742, _746, 1.0);
    float3 _2271 = float3(_738, _740, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2271, float3(0.0), isnan(_2271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2271, float3(0.0), isnan(_2271)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2288 = float2(_748, _724);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2288, float2(0.0), isnan(_2288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2288, float2(0.0), isnan(_2288)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.w;
    float _773 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _775 = in.m_53.x;
    float _777 = in.m_53.y;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = in.m_55.x;
    float _791 = in.m_55.y;
    float _793 = in.m_55.z;
    float _795 = exp2(_773);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    float _801 = in.m_57.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    float _815 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].x, _783);
    float _817 = _738;
    bool _819 = _781;
    float _821 = _813;
    if (!_781)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = 0.0;
    if (_787)
    {
        float _831 = in.m_53.x;
        _829 = _831;
    }
    float _833 = _829;
    bool _835 = _771 > 0.5;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _839 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = 0.0;
    if (!_781)
    {
        _841 = _777;
    }
    float _843 = _841;
    float _845 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _847 = _843;
    if (_781)
    {
        _847 = _775;
    }
    float _849 = _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _853 = -_807;
    float _855 = fma(_839, 2.0, _853);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _861 = _791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = _791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _869 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = -_801;
    float _873 = _871 + 1.0;
    float _875 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _879 = _777 > 0.5;
    float _881 = fma(_845, -2.0, _827);
    float _883 = 0.0;
    float _885 = _825;
    float _887 = _801;
    bool _889 = _879;
    if (!_781)
    {
        _883 = _825;
    }
    float _891 = _883;
    float _893 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _895 = _891;
    if (_781)
    {
        _895 = _777;
    }
    float _897 = _895;
    float _899 = _845;
    if (_799)
    {
        float _901 = in.m_53.z;
        _899 = _901;
    }
    float _903 = _899;
    if (_781)
    {
        _885 = _777;
    }
    float _905 = _885;
    float _907 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    int _909 = _879 ? as_type<int>(_873) : as_type<int>(_801);
    float _911 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _913 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _875);
    float _917 = _805 ? as_type<float>(_909) : _801;
    float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _921 = _164 != 0.0;
    bool _923 = isnan(_164);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    if (_787)
    {
        bool _933 = _833 > 0.5;
        _819 = _933;
    }
    bool _935 = _819;
    float _937 = fma(_911, _917, -0.5);
    float _939 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    float _941 = in.m_59.x;
    float _943 = in.m_59.y;
    float _945 = in.m_59.z;
    bool _947 = _152 == 0.0;
    bool _949 = !_929;
    bool _951 = _947 && _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _955 = -_931;
    float _957 = fma(_939, _937, _955);
    int _959 = as_type<int>(_937);
    if (_787)
    {
        float _961 = -_813;
        float _963 = _961 + 1.0;
        _959 = as_type<int>(_963);
    }
    int _965 = _959;
    bool _967 = _166 == 0.0;
    bool _969 = _967 && _951;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_811)
    {
        float _973 = _835 ? _873 : _801;
        _887 = _973;
    }
    float _975 = _887;
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _953);
    float _979 = _919 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _981 = _903;
    int _983 = as_type<int>(_979);
    if (_799)
    {
        bool _985 = _903 > 0.5;
        _889 = _985;
    }
    bool _987 = _889;
    float _989 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _837);
    if (!_787)
    {
        _981 = _813;
    }
    float _991 = _981;
    float _993 = fma(_979, _975, -0.5);
    float _995 = _991;
    if (_787)
    {
        float _997 = _935 ? as_type<float>(_965) : _813;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_799)
    {
        float _1003 = -_813;
        float _1005 = _1003 + 1.0;
        _983 = as_type<int>(_1005);
    }
    int _1007 = _983;
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1015 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_799)
    {
        float _1017 = _987 ? as_type<float>(_1007) : _813;
        _821 = _1017;
    }
    float _1019 = _821;
    float _1021 = fma(_1001, -2.0, _1011);
    float _1023 = _943;
    float _1025 = _945;
    float _1027 = _941;
    if (!_969)
    {
        float _1029 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _943);
        _1023 = _1029;
    }
    float _1031 = _1023;
    if (!_969)
    {
        float _1033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _945);
        _1025 = _1033;
    }
    float _1035 = _1025;
    if (!_969)
    {
        float _1037 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _941);
        _1027 = _1037;
    }
    float _1039 = _1027;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1049 = fma(_1041, _999, -0.5);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1043);
    float _1053 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _859);
    float _1055 = -_128;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1047);
    float _1067 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1051);
    out.m_61.x = _907;
    out.m_61.y = _913;
    out.m_61.z = _915;
    float _1069 = -_1013;
    float _1071 = fma(_1015, 2.0, _1069);
    float _1073 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1075 = fma(_1053, _1049, _1057);
    float _1077 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1063);
    float _1079 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1065);
    float _1083 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _989);
    float _1085 = -_128;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1071);
    float _1089 = fma(_1073, _1019, -0.5);
    float _1091 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _977);
    float _1093 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1021);
    float _1095 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1097 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1079);
    out.m_63.x = _1067;
    out.m_63.y = _1077;
    out.m_63.z = _1081;
    float _1099 = fma(_1083, _1089, _1087);
    float _1101 = -_1093;
    float _1103 = fma(_1091, _993, _1101);
    float _1105 = -_1095;
    float _1107 = _1105 + 1.0;
    float _1109 = _1099 + 0.5;
    out.m_65.x = _152;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1113 = _957 + 0.5;
    float _1115 = _1103 + 0.5;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    float _1117 = _1097 + _690;
    float _1119 = _1075 + 0.5;
    out.m_69.w = _1111;
    float _1121 = _1117 * 0.5;
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1119;
    out.m_71.y = _1113;
    out.m_71.z = _1109;
    out.m_71.w = _1115;
    out.gl_Position.x = _710;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1097;
    out.gl_Position.w = _690;
    out.m_73.z = _1121;
    out.m_73.w = _690;
    out.m_45.x = _1123;
    float _1125 = _1095 * _744;
    float _1127 = _759 * _1125;
    float _1129 = _759 * _1107;
    float _1131 = _769 * _1125;
    float _1133 = fma(_765, _1127, _753);
    float _1135 = fma(_767, _1127, _755);
    float _1137 = fma(_759, _1131, _757);
    out.m_75.x = _1133;
    out.m_75.y = _1135;
    out.m_75.z = _1137;
    out.m_75.w = _1129;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_112);
        out.gl_Position.z = _1194;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _106 = _130;
    }
    float _132 = _106;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_146);
        out.gl_Position.z = _1262;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_162)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _182;
    if (!_162)
    {
        float _192 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    bool _202 = !_162;
    float _204 = _194;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _150 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _150);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_162;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _150 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _176 = _258;
    }
    float _260 = _176;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _164);
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _268 * _270;
    float _280 = fma(_260, _170, _272);
    float _282 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _266 * _274;
    float _288 = fma(_280, _148, _186);
    float _290 = fma(_260, _168, _282);
    float _292 = fma(_260, _172, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _166);
    float _296 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _148, _184);
    float _300 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_292, _148, _188);
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = _294 * _296;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _322 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _322 + _326;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _328 + _332;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _344 + _362;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _360;
    float _370 = _338;
    float _372 = _362;
    float _374 = _282;
    float _376 = _312;
    if (!_366)
    {
        _368 = _338;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_366)
    {
        _370 = _334;
    }
    float _382 = _370;
    float _384 = _382;
    if (!_366)
    {
        _372 = _364;
    }
    float _386 = _372;
    bool _388 = !_366;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_352);
        float _400 = _396 * _392;
        float _402 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_364, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_348, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_342, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _374 = _484;
    }
    float _486 = _374;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _376 = _494;
    }
    float _496 = _376;
    float _498 = _446;
    if (_468)
    {
        float _500 = _496 * 6.283185482025146484375;
        float _502 = sin(_500);
        _498 = _502;
    }
    float _504 = _498;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _452;
    float _512 = _508;
    float _514 = _506;
    if (_468)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _510 = _518;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_508;
    float _526 = fma(_436, _522, _524);
    if (!_468)
    {
        _512 = _456;
    }
    float _528 = _512;
    float _530 = _528;
    if (_468)
    {
        float _532 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    float _536 = sqrt(_450);
    float _538 = _504;
    float _540 = _534;
    if (_468)
    {
        float _542 = fma(_504, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _478 = _542;
    }
    float _544 = _478;
    float _546 = _544;
    if (!_468)
    {
        _538 = _460;
    }
    float _548 = _538;
    float _550 = _548;
    float _552 = _520;
    if (_468)
    {
        float _554 = _520 + (-1.0);
        _540 = _554;
    }
    float _556 = _540;
    float _558 = 0.0;
    float _560 = _556;
    if (_468)
    {
        float _562 = _486 * _544;
        _558 = _562;
    }
    float _564 = _558;
    if (!_468)
    {
        _546 = _526;
    }
    float _566 = _546;
    float _568 = _566;
    if (_468)
    {
        float _570 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _570;
    }
    float _572 = _488;
    if (_468)
    {
        float _574 = _456 * _564;
        _530 = _574;
    }
    float _576 = _530;
    if (!_468)
    {
        _560 = _458;
    }
    float _578 = _560;
    float _580 = _578;
    if (_468)
    {
        float _582 = _458 * _564;
        _580 = _582;
    }
    float _584 = _580;
    if (_468)
    {
        float _586 = fma(_526, _520, _572);
        _568 = _586;
    }
    float _588 = _568;
    if (_468)
    {
        float _590 = _576 * _576;
        _550 = _590;
    }
    float _592 = _550;
    if (!_468)
    {
        _552 = _462;
    }
    float _594 = _552;
    float _596 = _594;
    if (_468)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _606 = _602 + _600;
    float _608 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _618 = rsqrt(_606);
    float _620 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _608);
    float _622 = -_614;
    float _624 = _622 + 1.0;
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _616);
    float _628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _630 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _620);
    float _632 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _626);
    float _636 = abs(_624);
    float _638 = log2(_636);
    float _640 = _630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = _634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _604);
    float _648 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _618 * _576;
    float _654 = -_648;
    float _656 = fma(_654, _628, 1.0);
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _660 = _644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _662 = _618 * _588;
    float _664 = _652 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _666 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].x, _660);
    float _670 = _618 * _584;
    float _672 = -_664;
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _672);
    float _676 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _666 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _668);
    float _682 = -_670;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _674);
    float _686 = exp2(_676);
    float _688 = _644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _680);
    float _692 = fma(_684, -0.5, 0.5);
    float _694 = _644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _696 = fma(_684, 0.5, 0.5);
    float _698 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _700 = log2(_656);
    float _702 = _662 + 1.0;
    float _704 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _706 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _708 = fma(_696, _704, -0.212114393711090087890625);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _712 = 1.0 / _690;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].x, _694);
    float _716 = -_662;
    float _718 = fma(_686, _702, _716);
    float _720 = fma(_696, _708, 1.570728778839111328125);
    float _722 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = sqrt(_692);
    float _728 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _730 = _700 * 0.693147182464599609375;
    float _732 = _730 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = _710 * _712;
    float _736 = _728 * _712;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _726 * 0.636619746685028076171875;
    float3 _2255 = float3(_738, _740, _732);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2255, float3(0.0), isnan(_2255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2255, float3(0.0), isnan(_2255)), level(0.0)).x;
    float _746 = -_720;
    float _748 = fma(_742, _746, 1.0);
    float3 _2271 = float3(_738, _740, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2271, float3(0.0), isnan(_2271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2271, float3(0.0), isnan(_2271)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2288 = float2(_748, _724);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2288, float2(0.0), isnan(_2288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2288, float2(0.0), isnan(_2288)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.w;
    float _773 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _775 = in.m_53.x;
    float _777 = in.m_53.y;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = in.m_55.x;
    float _791 = in.m_55.y;
    float _793 = in.m_55.z;
    float _795 = exp2(_773);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    float _801 = in.m_57.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    float _815 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].x, _783);
    float _817 = _738;
    bool _819 = _781;
    float _821 = _813;
    if (!_781)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = 0.0;
    if (_787)
    {
        float _831 = in.m_53.x;
        _829 = _831;
    }
    float _833 = _829;
    bool _835 = _771 > 0.5;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _839 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = 0.0;
    if (!_781)
    {
        _841 = _777;
    }
    float _843 = _841;
    float _845 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _847 = _843;
    if (_781)
    {
        _847 = _775;
    }
    float _849 = _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _853 = -_807;
    float _855 = fma(_839, 2.0, _853);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _861 = _791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = _791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _869 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = -_801;
    float _873 = _871 + 1.0;
    float _875 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _879 = _777 > 0.5;
    float _881 = fma(_845, -2.0, _827);
    float _883 = 0.0;
    float _885 = _825;
    float _887 = _801;
    bool _889 = _879;
    if (!_781)
    {
        _883 = _825;
    }
    float _891 = _883;
    float _893 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _895 = _891;
    if (_781)
    {
        _895 = _777;
    }
    float _897 = _895;
    float _899 = _845;
    if (_799)
    {
        float _901 = in.m_53.z;
        _899 = _901;
    }
    float _903 = _899;
    if (_781)
    {
        _885 = _777;
    }
    float _905 = _885;
    float _907 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    int _909 = _879 ? as_type<int>(_873) : as_type<int>(_801);
    float _911 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _913 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _875);
    float _917 = _805 ? as_type<float>(_909) : _801;
    float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _921 = _164 != 0.0;
    bool _923 = isnan(_164);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    if (_787)
    {
        bool _933 = _833 > 0.5;
        _819 = _933;
    }
    bool _935 = _819;
    float _937 = fma(_911, _917, -0.5);
    float _939 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    float _941 = in.m_59.x;
    float _943 = in.m_59.y;
    float _945 = in.m_59.z;
    bool _947 = _152 == 0.0;
    bool _949 = !_929;
    bool _951 = _947 && _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _955 = -_931;
    float _957 = fma(_939, _937, _955);
    int _959 = as_type<int>(_937);
    if (_787)
    {
        float _961 = -_813;
        float _963 = _961 + 1.0;
        _959 = as_type<int>(_963);
    }
    int _965 = _959;
    bool _967 = _166 == 0.0;
    bool _969 = _967 && _951;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_811)
    {
        float _973 = _835 ? _873 : _801;
        _887 = _973;
    }
    float _975 = _887;
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _953);
    float _979 = _919 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _981 = _903;
    int _983 = as_type<int>(_979);
    if (_799)
    {
        bool _985 = _903 > 0.5;
        _889 = _985;
    }
    bool _987 = _889;
    float _989 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _837);
    if (!_787)
    {
        _981 = _813;
    }
    float _991 = _981;
    float _993 = fma(_979, _975, -0.5);
    float _995 = _991;
    if (_787)
    {
        float _997 = _935 ? as_type<float>(_965) : _813;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_799)
    {
        float _1003 = -_813;
        float _1005 = _1003 + 1.0;
        _983 = as_type<int>(_1005);
    }
    int _1007 = _983;
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1015 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_799)
    {
        float _1017 = _987 ? as_type<float>(_1007) : _813;
        _821 = _1017;
    }
    float _1019 = _821;
    float _1021 = fma(_1001, -2.0, _1011);
    float _1023 = _943;
    float _1025 = _945;
    float _1027 = _941;
    if (!_969)
    {
        float _1029 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _943);
        _1023 = _1029;
    }
    float _1031 = _1023;
    if (!_969)
    {
        float _1033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _945);
        _1025 = _1033;
    }
    float _1035 = _1025;
    if (!_969)
    {
        float _1037 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _941);
        _1027 = _1037;
    }
    float _1039 = _1027;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1049 = fma(_1041, _999, -0.5);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1043);
    float _1053 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _859);
    float _1055 = -_128;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1047);
    float _1067 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1051);
    out.m_61.x = _907;
    out.m_61.y = _913;
    out.m_61.z = _915;
    float _1069 = -_1013;
    float _1071 = fma(_1015, 2.0, _1069);
    float _1073 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1075 = fma(_1053, _1049, _1057);
    float _1077 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1063);
    float _1079 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1065);
    float _1083 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _989);
    float _1085 = -_128;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1071);
    float _1089 = fma(_1073, _1019, -0.5);
    float _1091 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _977);
    float _1093 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1021);
    float _1095 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1097 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1079);
    out.m_63.x = _1067;
    out.m_63.y = _1077;
    out.m_63.z = _1081;
    float _1099 = fma(_1083, _1089, _1087);
    float _1101 = -_1093;
    float _1103 = fma(_1091, _993, _1101);
    float _1105 = -_1095;
    float _1107 = _1105 + 1.0;
    float _1109 = _1099 + 0.5;
    out.m_65.x = _152;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1113 = _957 + 0.5;
    float _1115 = _1103 + 0.5;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    float _1117 = _1097 + _690;
    float _1119 = _1075 + 0.5;
    out.m_69.w = _1111;
    float _1121 = _1117 * 0.5;
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1119;
    out.m_71.y = _1113;
    out.m_71.z = _1109;
    out.m_71.w = _1115;
    out.gl_Position.x = _710;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1097;
    out.gl_Position.w = _690;
    out.m_73.z = _1121;
    out.m_73.w = _690;
    out.m_45.x = _1123;
    float _1125 = _1095 * _744;
    float _1127 = _759 * _1125;
    float _1129 = _759 * _1107;
    float _1131 = _769 * _1125;
    float _1133 = fma(_765, _1127, _753);
    float _1135 = fma(_767, _1127, _755);
    float _1137 = fma(_759, _1131, _757);
    out.m_75.x = _1133;
    out.m_75.y = _1135;
    out.m_75.z = _1137;
    out.m_75.w = _1129;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_112);
        out.gl_Position.z = _1194;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _106 = _130;
    }
    float _132 = _106;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1262 = as_type<float>(_146);
        out.gl_Position.z = _1262;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_162)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _182;
    if (!_162)
    {
        float _192 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    bool _202 = !_162;
    float _204 = _194;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _150 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _150);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_162;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _150 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _176 = _258;
    }
    float _260 = _176;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _164);
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _270 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _272 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _276 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = _268 * _270;
    float _280 = fma(_260, _170, _272);
    float _282 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = _266 * _274;
    float _288 = fma(_280, _148, _186);
    float _290 = fma(_260, _168, _282);
    float _292 = fma(_260, _172, _284);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _166);
    float _296 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _148, _184);
    float _300 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_292, _148, _188);
    float _304 = _286 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _286 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = _294 * _296;
    float _314 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _318 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _320 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _322 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _324 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _326 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _320);
    float _330 = _286 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _334 = _322 + _326;
    float _336 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _338 = _328 + _332;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _342 = _334 + _340;
    float _344 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _336);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _338 + _346;
    float _350 = _342 * _342;
    float _352 = fma(_348, _348, _350);
    float _354 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = sqrt(_352);
    float _358 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _360 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _362 = _360 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _344 + _362;
    bool _366 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _368 = _360;
    float _370 = _338;
    float _372 = _362;
    float _374 = _282;
    float _376 = _312;
    if (!_366)
    {
        _368 = _338;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_366)
    {
        _370 = _334;
    }
    float _382 = _370;
    float _384 = _382;
    if (!_366)
    {
        _372 = _364;
    }
    float _386 = _372;
    bool _388 = !_366;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_352);
        float _400 = _396 * _392;
        float _402 = _364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_364, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_348, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_342, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _374 = _484;
    }
    float _486 = _374;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _376 = _494;
    }
    float _496 = _376;
    float _498 = _446;
    if (_468)
    {
        float _500 = _496 * 6.283185482025146484375;
        float _502 = sin(_500);
        _498 = _502;
    }
    float _504 = _498;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _452;
    float _512 = _508;
    float _514 = _506;
    if (_468)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _510 = _518;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_508;
    float _526 = fma(_436, _522, _524);
    if (!_468)
    {
        _512 = _456;
    }
    float _528 = _512;
    float _530 = _528;
    if (_468)
    {
        float _532 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    float _536 = sqrt(_450);
    float _538 = _504;
    float _540 = _534;
    if (_468)
    {
        float _542 = fma(_504, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _478 = _542;
    }
    float _544 = _478;
    float _546 = _544;
    if (!_468)
    {
        _538 = _460;
    }
    float _548 = _538;
    float _550 = _548;
    float _552 = _520;
    if (_468)
    {
        float _554 = _520 + (-1.0);
        _540 = _554;
    }
    float _556 = _540;
    float _558 = 0.0;
    float _560 = _556;
    if (_468)
    {
        float _562 = _486 * _544;
        _558 = _562;
    }
    float _564 = _558;
    if (!_468)
    {
        _546 = _526;
    }
    float _566 = _546;
    float _568 = _566;
    if (_468)
    {
        float _570 = _556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _570;
    }
    float _572 = _488;
    if (_468)
    {
        float _574 = _456 * _564;
        _530 = _574;
    }
    float _576 = _530;
    if (!_468)
    {
        _560 = _458;
    }
    float _578 = _560;
    float _580 = _578;
    if (_468)
    {
        float _582 = _458 * _564;
        _580 = _582;
    }
    float _584 = _580;
    if (_468)
    {
        float _586 = fma(_526, _520, _572);
        _568 = _586;
    }
    float _588 = _568;
    if (_468)
    {
        float _590 = _576 * _576;
        _550 = _590;
    }
    float _592 = _550;
    if (!_468)
    {
        _552 = _462;
    }
    float _594 = _552;
    float _596 = _594;
    if (_468)
    {
        float _598 = _584 * _584;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_588, _588, _592);
    float _604 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _606 = _602 + _600;
    float _608 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _618 = rsqrt(_606);
    float _620 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _608);
    float _622 = -_614;
    float _624 = _622 + 1.0;
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _616);
    float _628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _630 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _620);
    float _632 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _634 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _626);
    float _636 = abs(_624);
    float _638 = log2(_636);
    float _640 = _630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _632);
    float _644 = _634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _604);
    float _648 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _650 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _642);
    float _652 = _618 * _576;
    float _654 = -_648;
    float _656 = fma(_654, _628, 1.0);
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _660 = _644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _662 = _618 * _588;
    float _664 = _652 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _666 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].x, _660);
    float _670 = _618 * _584;
    float _672 = -_664;
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _672);
    float _676 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _666 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _668);
    float _682 = -_670;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _674);
    float _686 = exp2(_676);
    float _688 = _644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _680);
    float _692 = fma(_684, -0.5, 0.5);
    float _694 = _644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _696 = fma(_684, 0.5, 0.5);
    float _698 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _700 = log2(_656);
    float _702 = _662 + 1.0;
    float _704 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _706 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _708 = fma(_696, _704, -0.212114393711090087890625);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _712 = 1.0 / _690;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].x, _694);
    float _716 = -_662;
    float _718 = fma(_686, _702, _716);
    float _720 = fma(_696, _708, 1.570728778839111328125);
    float _722 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = sqrt(_692);
    float _728 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _730 = _700 * 0.693147182464599609375;
    float _732 = _730 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = _710 * _712;
    float _736 = _728 * _712;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _726 * 0.636619746685028076171875;
    float3 _2255 = float3(_738, _740, _732);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2255, float3(0.0), isnan(_2255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2255, float3(0.0), isnan(_2255)), level(0.0)).x;
    float _746 = -_720;
    float _748 = fma(_742, _746, 1.0);
    float3 _2271 = float3(_738, _740, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2271, float3(0.0), isnan(_2271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2271, float3(0.0), isnan(_2271)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2288 = float2(_748, _724);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2288, float2(0.0), isnan(_2288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2288, float2(0.0), isnan(_2288)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.w;
    float _773 = _638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _775 = in.m_53.x;
    float _777 = in.m_53.y;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _781 = _779 != 0;
    float _783 = _644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = in.m_55.x;
    float _791 = in.m_55.y;
    float _793 = in.m_55.z;
    float _795 = exp2(_773);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _799 = _797 != 0;
    float _801 = in.m_57.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _805 = _803 != 0;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    float _815 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].x, _783);
    float _817 = _738;
    bool _819 = _781;
    float _821 = _813;
    if (!_781)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = 0.0;
    if (_787)
    {
        float _831 = in.m_53.x;
        _829 = _831;
    }
    float _833 = _829;
    bool _835 = _771 > 0.5;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _839 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = 0.0;
    if (!_781)
    {
        _841 = _777;
    }
    float _843 = _841;
    float _845 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _847 = _843;
    if (_781)
    {
        _847 = _775;
    }
    float _849 = _847;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _853 = -_807;
    float _855 = fma(_839, 2.0, _853);
    float _857 = _791 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _851);
    float _861 = _791 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = _791 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _869 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = -_801;
    float _873 = _871 + 1.0;
    float _875 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _879 = _777 > 0.5;
    float _881 = fma(_845, -2.0, _827);
    float _883 = 0.0;
    float _885 = _825;
    float _887 = _801;
    bool _889 = _879;
    if (!_781)
    {
        _883 = _825;
    }
    float _891 = _883;
    float _893 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _895 = _891;
    if (_781)
    {
        _895 = _777;
    }
    float _897 = _895;
    float _899 = _845;
    if (_799)
    {
        float _901 = in.m_53.z;
        _899 = _901;
    }
    float _903 = _899;
    if (_781)
    {
        _885 = _777;
    }
    float _905 = _885;
    float _907 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    int _909 = _879 ? as_type<int>(_873) : as_type<int>(_801);
    float _911 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _913 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _915 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _875);
    float _917 = _805 ? as_type<float>(_909) : _801;
    float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _921 = _164 != 0.0;
    bool _923 = isnan(_164);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    if (_787)
    {
        bool _933 = _833 > 0.5;
        _819 = _933;
    }
    bool _935 = _819;
    float _937 = fma(_911, _917, -0.5);
    float _939 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    float _941 = in.m_59.x;
    float _943 = in.m_59.y;
    float _945 = in.m_59.z;
    bool _947 = _152 == 0.0;
    bool _949 = !_929;
    bool _951 = _947 && _949;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _955 = -_931;
    float _957 = fma(_939, _937, _955);
    int _959 = as_type<int>(_937);
    if (_787)
    {
        float _961 = -_813;
        float _963 = _961 + 1.0;
        _959 = as_type<int>(_963);
    }
    int _965 = _959;
    bool _967 = _166 == 0.0;
    bool _969 = _967 && _951;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_811)
    {
        float _973 = _835 ? _873 : _801;
        _887 = _973;
    }
    float _975 = _887;
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _953);
    float _979 = _919 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _981 = _903;
    int _983 = as_type<int>(_979);
    if (_799)
    {
        bool _985 = _903 > 0.5;
        _889 = _985;
    }
    bool _987 = _889;
    float _989 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[83].z, _837);
    if (!_787)
    {
        _981 = _813;
    }
    float _991 = _981;
    float _993 = fma(_979, _975, -0.5);
    float _995 = _991;
    if (_787)
    {
        float _997 = _935 ? as_type<float>(_965) : _813;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_799)
    {
        float _1003 = -_813;
        float _1005 = _1003 + 1.0;
        _983 = as_type<int>(_1005);
    }
    int _1007 = _983;
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1015 = _849 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_799)
    {
        float _1017 = _987 ? as_type<float>(_1007) : _813;
        _821 = _1017;
    }
    float _1019 = _821;
    float _1021 = fma(_1001, -2.0, _1011);
    float _1023 = _943;
    float _1025 = _945;
    float _1027 = _941;
    if (!_969)
    {
        float _1029 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _943);
        _1023 = _1029;
    }
    float _1031 = _1023;
    if (!_969)
    {
        float _1033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _945);
        _1025 = _1033;
    }
    float _1035 = _1025;
    if (!_969)
    {
        float _1037 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _941);
        _1027 = _1037;
    }
    float _1039 = _1027;
    float _1041 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1045 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1049 = fma(_1041, _999, -0.5);
    float _1051 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1043);
    float _1053 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _859);
    float _1055 = -_128;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1065 = fma(_1039, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1047);
    float _1067 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1051);
    out.m_61.x = _907;
    out.m_61.y = _913;
    out.m_61.z = _915;
    float _1069 = -_1013;
    float _1071 = fma(_1015, 2.0, _1069);
    float _1073 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1075 = fma(_1053, _1049, _1057);
    float _1077 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1063);
    float _1079 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1081 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1065);
    float _1083 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _989);
    float _1085 = -_128;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1071);
    float _1089 = fma(_1073, _1019, -0.5);
    float _1091 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _977);
    float _1093 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1021);
    float _1095 = _1061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1097 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1079);
    out.m_63.x = _1067;
    out.m_63.y = _1077;
    out.m_63.z = _1081;
    float _1099 = fma(_1083, _1089, _1087);
    float _1101 = -_1093;
    float _1103 = fma(_1091, _993, _1101);
    float _1105 = -_1095;
    float _1107 = _1105 + 1.0;
    float _1109 = _1099 + 0.5;
    out.m_65.x = _152;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1113 = _957 + 0.5;
    float _1115 = _1103 + 0.5;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    float _1117 = _1097 + _690;
    float _1119 = _1075 + 0.5;
    out.m_69.w = _1111;
    float _1121 = _1117 * 0.5;
    float _1123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1119;
    out.m_71.y = _1113;
    out.m_71.z = _1109;
    out.m_71.w = _1115;
    out.gl_Position.x = _710;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1097;
    out.gl_Position.w = _690;
    out.m_73.z = _1121;
    out.m_73.w = _690;
    out.m_45.x = _1123;
    float _1125 = _1095 * _744;
    float _1127 = _759 * _1125;
    float _1129 = _759 * _1107;
    float _1131 = _769 * _1125;
    float _1133 = fma(_765, _1127, _753);
    float _1135 = fma(_767, _1127, _755);
    float _1137 = fma(_759, _1131, _757);
    out.m_75.x = _1133;
    out.m_75.y = _1135;
    out.m_75.z = _1137;
    out.m_75.w = _1129;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

