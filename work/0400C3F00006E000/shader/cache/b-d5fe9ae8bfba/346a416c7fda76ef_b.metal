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
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_106);
        out.gl_Position.z = _1106;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1175 = as_type<float>(_142);
        out.gl_Position.z = _1175;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_51.x;
    float _162 = in.m_51.z;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_158)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_158)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_158;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _146 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _146);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_158;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _146 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _148);
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _166, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _270 * _272;
    float _284 = fma(_276, _144, _182);
    float _286 = fma(_256, _164, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _162);
    float _290 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _168, _280);
    float _294 = fma(_286, _144, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = fma(_292, _144, _184);
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _284;
    float _366 = _320;
    float _368 = _330;
    float _370 = _334;
    float _372 = _348;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = rsqrt(_348);
        float _392 = _388 * _384;
        float _394 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = _392 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = fma(_400, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = _390 * _406;
        float _410 = _404 + (-1.0);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_338, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _416 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_360, _404, _416);
        _382 = _418;
        _376 = _412;
        _368 = _414;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _440;
    float _468 = _464;
    float _470 = _446;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _476;
    float _484 = _480;
    if (_460)
    {
        float _486 = _464 * _476;
        _468 = _486;
    }
    float _488 = _468;
    if (_460)
    {
        float _490 = _488 * 0.15915493667125701904296875;
        _372 = _490;
    }
    float _492 = _372;
    float _494 = _340;
    if (_460)
    {
        float _496 = _492 * 6.283185482025146484375;
        float _498 = sin(_496);
        _494 = _498;
    }
    float _500 = _494;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _274;
    float _508 = _504;
    if (_460)
    {
        float _510 = _492 * 6.283185482025146484375;
        float _512 = cos(_510);
        _506 = _512;
    }
    float _514 = _506;
    float _516 = -_446;
    float _518 = -_504;
    float _520 = fma(_428, _516, _518);
    if (_460)
    {
        float _522 = _520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _522;
    }
    float _524 = _482;
    float _526 = sqrt(_442);
    float _528 = _500;
    float _530 = _524;
    if (_460)
    {
        float _532 = fma(_500, _524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_460)
    {
        _530 = _520;
    }
    float _538 = _530;
    float _540 = _538;
    float _542 = _514;
    if (_460)
    {
        float _544 = _514 + (-1.0);
        _508 = _544;
    }
    float _546 = _508;
    float _548 = _546;
    if (_460)
    {
        float _550 = _480 * _534;
        _470 = _550;
    }
    float _552 = _470;
    if (!_460)
    {
        _536 = _450;
    }
    float _554 = _536;
    float _556 = _554;
    if (_460)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _558;
    }
    float _560 = _484;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _556 = _570;
    }
    float _572 = _556;
    if (_460)
    {
        float _574 = fma(_520, _514, _560);
        _540 = _574;
    }
    float _576 = _540;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _542 = _454;
    }
    float _582 = _542;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _594 = _590 + _588;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _598 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _596);
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float _602 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _592);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = -_600;
    float _610 = _608 + 1.0;
    float _612 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _620 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _624 = abs(_610);
    float _626 = log2(_624);
    float _628 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _630 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _632 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _622);
    float _634 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _632);
    float _642 = _606 * _564;
    float _644 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _646 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _648 = _606 * _576;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _640 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _646);
    float _656 = _606 * _572;
    float _658 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = -_650;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _660);
    float _664 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _666 = -_634;
    float _668 = fma(_666, _618, 1.0);
    float _670 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _672 = -_656;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _662);
    float _676 = exp2(_658);
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_674, 0.5, 0.5);
    float _686 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _670);
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _690 = log2(_668);
    float _692 = _648 + 1.0;
    float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _686);
    float _696 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _688);
    float _698 = fma(_684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = 1.0 / _678;
    float _702 = -_648;
    float _704 = fma(_676, _692, _702);
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _694);
    float _708 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _696);
    float _710 = fma(_684, _698, -0.212114393711090087890625);
    float _712 = fma(_704, 0.5, 0.5);
    float _714 = sqrt(_682);
    float _716 = _690 * 0.693147182464599609375;
    float _718 = fma(_684, _710, 1.570728778839111328125);
    float _720 = _716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _722 = _706 * _700;
    float _724 = _708 * _700;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2155 = float3(_726, _728, _720);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2155, float3(0.0), isnan(_2155)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2155, float3(0.0), isnan(_2155)), level(0.0)).x;
    float _734 = -_718;
    float _736 = fma(_730, _734, 1.0);
    float3 _2171 = float3(_726, _728, _720);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2171, float3(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2171, float3(0.0), isnan(_2171)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2188 = float2(_736, _712);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2188, float2(0.0), isnan(_2188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2188, float2(0.0), isnan(_2188)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _761 = in.m_53.x;
    float _763 = in.m_53.y;
    float _765 = in.m_53.z;
    bool _767 = _148 != 0.0;
    bool _769 = isnan(_148);
    bool _771 = _767 || _769;
    bool _773 = isnan(0.0);
    bool _775 = _771 || _773;
    float _777 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _759);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _793 = _160 == 0.0;
    bool _795 = !_775;
    bool _797 = _793 && _795;
    float _799 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _803 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _807 = _162 == 0.0;
    bool _809 = _807 && _797;
    float _811 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = exp2(_791);
    float _815 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _817 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _819 = 0.0;
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _823 = _726;
    if (!_789)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _825 = _819;
    out.m_55.z = _162;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _817 + _805;
    float _831 = 1.0 / _805;
    float _833 = 0.0;
    if (!_789)
    {
        float _835 = -_825;
        float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _763;
    float _843 = _761;
    float _845 = _765;
    float _847 = _839;
    if (!_809)
    {
        float _849 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _763);
        _841 = _849;
    }
    float _851 = _841;
    if (!_809)
    {
        float _853 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _761);
        _843 = _853;
    }
    float _855 = _843;
    if (!_809)
    {
        float _857 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _845 = _857;
    }
    float _859 = _845;
    float _861 = _851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = 0.0;
    if (!_789)
    {
        float _869 = 1.0 / _839;
        _867 = _869;
    }
    float _871 = _867;
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _879 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _829 * _831;
    float _883 = _881 * 0.5;
    float _885 = in.m_57.w;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
    float _893 = _875;
    float _895 = _877;
    if (!_789)
    {
        _821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _897 = _821;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _901 = 1.0 / _891;
    float _903 = _897;
    if (!_789)
    {
        float _905 = -_897;
        float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _823 = _907;
    }
    float _909 = _823;
    float _911 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_789)
    {
        _847 = 1.0;
    }
    float _915 = _847;
    float _917 = -_813;
    float _919 = _917 + 1.0;
    float _921 = _909;
    float _923 = _915;
    if (!_789)
    {
        float _925 = 1.0 / _909;
        _921 = _925;
    }
    float _927 = _921;
    float _929 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[8].z, _873);
    float _931 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[9].z, _875);
    float _933 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[10].z, _877);
    float _935 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_789)
    {
        _893 = 1.0;
    }
    float _937 = _893;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _943 = _937;
    if (!_789)
    {
        float _945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _947 = -_897;
        float _949 = fma(_901, _945, _947);
        _903 = _949;
    }
    float _951 = _903;
    if (!_789)
    {
        float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _955 = -_825;
        float _957 = fma(_901, _953, _955);
        _895 = _957;
    }
    float _959 = _895;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _879;
    out.m_59.y = _911;
    out.m_59.z = _935;
    out.m_59.w = _899;
    float _963 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    if (!_789)
    {
        float _965 = _959 * _871;
        float _967 = precise::clamp(_965, 0.0, 1.0);
        _923 = _967;
    }
    float _969 = _923;
    float _971 = _919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = _927;
    if (!_789)
    {
        float _977 = _951 * _927;
        float _979 = precise::clamp(_977, 0.0, 1.0);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_789)
    {
        float _989 = -_981;
        float _991 = _989 + 1.0;
        _943 = _991;
    }
    float _993 = _943;
    bool _995 = _969 > 0.0;
    bool _997 = isnan(_969);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    out.m_61.x = _929;
    out.m_61.y = _931;
    out.m_61.z = _933;
    float _1005 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _963);
    float _1007 = _969 * _993;
    bool _1009 = _993 <= 0.0;
    bool _1011 = !_1003;
    bool _1013 = _1009 || _1011;
    out.m_63.x = _983;
    out.m_63.y = _985;
    out.m_63.z = _987;
    out.m_63.w = _973;
    float _1015 = _1005 + _678;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_55.y = _148;
    float _1019 = _1015 * 0.5;
    float _1021 = _678 * 0.5;
    out.m_65.x = _432;
    out.m_65.y = _428;
    out.m_65.z = _436;
    float _1023 = fma(_708, -0.5, _1021);
    float _1025 = -_971;
    float _1027 = _1025 + 1.0;
    out.m_55.x = _160;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1031 = _706 + _678;
    out.m_67.w = _885;
    float _1033 = _1031 * 0.5;
    out.m_45.x = _1029;
    out.gl_Position.x = _706;
    out.gl_Position.y = _708;
    out.gl_Position.z = _1005;
    out.gl_Position.w = _678;
    out.m_69.x = _1033;
    out.m_69.y = _1023;
    out.m_69.z = _1019;
    out.m_69.w = _678;
    float _1035 = _971 * _732;
    float _1037 = _747 * _1035;
    float _1039 = _747 * _1027;
    float _1041 = _757 * _1035;
    float _1043 = fma(_753, _1037, _741);
    float _1045 = fma(_755, _1037, _743);
    float _1047 = fma(_747, _1041, _745);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1047;
    out.m_71.w = _1039;
    if (!_1013)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1049;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_106);
        out.gl_Position.z = _1106;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1175 = as_type<float>(_142);
        out.gl_Position.z = _1175;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_51.x;
    float _162 = in.m_51.z;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_158)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_158)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_158;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _146 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _146);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_158;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _146 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _148);
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _166, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _270 * _272;
    float _284 = fma(_276, _144, _182);
    float _286 = fma(_256, _164, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _162);
    float _290 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _168, _280);
    float _294 = fma(_286, _144, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = fma(_292, _144, _184);
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _284;
    float _366 = _320;
    float _368 = _330;
    float _370 = _334;
    float _372 = _348;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = rsqrt(_348);
        float _392 = _388 * _384;
        float _394 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = _392 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = fma(_400, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = _390 * _406;
        float _410 = _404 + (-1.0);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_338, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _416 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_360, _404, _416);
        _382 = _418;
        _376 = _412;
        _368 = _414;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _440;
    float _468 = _464;
    float _470 = _446;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _476;
    float _484 = _480;
    if (_460)
    {
        float _486 = _464 * _476;
        _468 = _486;
    }
    float _488 = _468;
    if (_460)
    {
        float _490 = _488 * 0.15915493667125701904296875;
        _372 = _490;
    }
    float _492 = _372;
    float _494 = _340;
    if (_460)
    {
        float _496 = _492 * 6.283185482025146484375;
        float _498 = sin(_496);
        _494 = _498;
    }
    float _500 = _494;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _274;
    float _508 = _504;
    if (_460)
    {
        float _510 = _492 * 6.283185482025146484375;
        float _512 = cos(_510);
        _506 = _512;
    }
    float _514 = _506;
    float _516 = -_446;
    float _518 = -_504;
    float _520 = fma(_428, _516, _518);
    if (_460)
    {
        float _522 = _520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _522;
    }
    float _524 = _482;
    float _526 = sqrt(_442);
    float _528 = _500;
    float _530 = _524;
    if (_460)
    {
        float _532 = fma(_500, _524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_460)
    {
        _530 = _520;
    }
    float _538 = _530;
    float _540 = _538;
    float _542 = _514;
    if (_460)
    {
        float _544 = _514 + (-1.0);
        _508 = _544;
    }
    float _546 = _508;
    float _548 = _546;
    if (_460)
    {
        float _550 = _480 * _534;
        _470 = _550;
    }
    float _552 = _470;
    if (!_460)
    {
        _536 = _450;
    }
    float _554 = _536;
    float _556 = _554;
    if (_460)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _558;
    }
    float _560 = _484;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _556 = _570;
    }
    float _572 = _556;
    if (_460)
    {
        float _574 = fma(_520, _514, _560);
        _540 = _574;
    }
    float _576 = _540;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _542 = _454;
    }
    float _582 = _542;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _594 = _590 + _588;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _598 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _596);
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float _602 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _592);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = -_600;
    float _610 = _608 + 1.0;
    float _612 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _620 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _624 = abs(_610);
    float _626 = log2(_624);
    float _628 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _630 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _632 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _622);
    float _634 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _632);
    float _642 = _606 * _564;
    float _644 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _646 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _648 = _606 * _576;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _640 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _646);
    float _656 = _606 * _572;
    float _658 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = -_650;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _660);
    float _664 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _666 = -_634;
    float _668 = fma(_666, _618, 1.0);
    float _670 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _672 = -_656;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _662);
    float _676 = exp2(_658);
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_674, 0.5, 0.5);
    float _686 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _670);
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _690 = log2(_668);
    float _692 = _648 + 1.0;
    float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _686);
    float _696 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _688);
    float _698 = fma(_684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = 1.0 / _678;
    float _702 = -_648;
    float _704 = fma(_676, _692, _702);
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _694);
    float _708 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _696);
    float _710 = fma(_684, _698, -0.212114393711090087890625);
    float _712 = fma(_704, 0.5, 0.5);
    float _714 = sqrt(_682);
    float _716 = _690 * 0.693147182464599609375;
    float _718 = fma(_684, _710, 1.570728778839111328125);
    float _720 = _716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _722 = _706 * _700;
    float _724 = _708 * _700;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2155 = float3(_726, _728, _720);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2155, float3(0.0), isnan(_2155)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2155, float3(0.0), isnan(_2155)), level(0.0)).x;
    float _734 = -_718;
    float _736 = fma(_730, _734, 1.0);
    float3 _2171 = float3(_726, _728, _720);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2171, float3(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2171, float3(0.0), isnan(_2171)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2188 = float2(_736, _712);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2188, float2(0.0), isnan(_2188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2188, float2(0.0), isnan(_2188)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _761 = in.m_53.x;
    float _763 = in.m_53.y;
    float _765 = in.m_53.z;
    bool _767 = _148 != 0.0;
    bool _769 = isnan(_148);
    bool _771 = _767 || _769;
    bool _773 = isnan(0.0);
    bool _775 = _771 || _773;
    float _777 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _759);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _793 = _160 == 0.0;
    bool _795 = !_775;
    bool _797 = _793 && _795;
    float _799 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _803 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _807 = _162 == 0.0;
    bool _809 = _807 && _797;
    float _811 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = exp2(_791);
    float _815 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _817 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _819 = 0.0;
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _823 = _726;
    if (!_789)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _825 = _819;
    out.m_55.z = _162;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _817 + _805;
    float _831 = 1.0 / _805;
    float _833 = 0.0;
    if (!_789)
    {
        float _835 = -_825;
        float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _763;
    float _843 = _761;
    float _845 = _765;
    float _847 = _839;
    if (!_809)
    {
        float _849 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _763);
        _841 = _849;
    }
    float _851 = _841;
    if (!_809)
    {
        float _853 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _761);
        _843 = _853;
    }
    float _855 = _843;
    if (!_809)
    {
        float _857 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _845 = _857;
    }
    float _859 = _845;
    float _861 = _851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = 0.0;
    if (!_789)
    {
        float _869 = 1.0 / _839;
        _867 = _869;
    }
    float _871 = _867;
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _879 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _829 * _831;
    float _883 = _881 * 0.5;
    float _885 = in.m_57.w;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
    float _893 = _875;
    float _895 = _877;
    if (!_789)
    {
        _821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _897 = _821;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _901 = 1.0 / _891;
    float _903 = _897;
    if (!_789)
    {
        float _905 = -_897;
        float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _823 = _907;
    }
    float _909 = _823;
    float _911 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_789)
    {
        _847 = 1.0;
    }
    float _915 = _847;
    float _917 = -_813;
    float _919 = _917 + 1.0;
    float _921 = _909;
    float _923 = _915;
    if (!_789)
    {
        float _925 = 1.0 / _909;
        _921 = _925;
    }
    float _927 = _921;
    float _929 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[8].z, _873);
    float _931 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[9].z, _875);
    float _933 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[10].z, _877);
    float _935 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_789)
    {
        _893 = 1.0;
    }
    float _937 = _893;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _943 = _937;
    if (!_789)
    {
        float _945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _947 = -_897;
        float _949 = fma(_901, _945, _947);
        _903 = _949;
    }
    float _951 = _903;
    if (!_789)
    {
        float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _955 = -_825;
        float _957 = fma(_901, _953, _955);
        _895 = _957;
    }
    float _959 = _895;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _879;
    out.m_59.y = _911;
    out.m_59.z = _935;
    out.m_59.w = _899;
    float _963 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    if (!_789)
    {
        float _965 = _959 * _871;
        float _967 = precise::clamp(_965, 0.0, 1.0);
        _923 = _967;
    }
    float _969 = _923;
    float _971 = _919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = _927;
    if (!_789)
    {
        float _977 = _951 * _927;
        float _979 = precise::clamp(_977, 0.0, 1.0);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_789)
    {
        float _989 = -_981;
        float _991 = _989 + 1.0;
        _943 = _991;
    }
    float _993 = _943;
    bool _995 = _969 > 0.0;
    bool _997 = isnan(_969);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    out.m_61.x = _929;
    out.m_61.y = _931;
    out.m_61.z = _933;
    float _1005 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _963);
    float _1007 = _969 * _993;
    bool _1009 = _993 <= 0.0;
    bool _1011 = !_1003;
    bool _1013 = _1009 || _1011;
    out.m_63.x = _983;
    out.m_63.y = _985;
    out.m_63.z = _987;
    out.m_63.w = _973;
    float _1015 = _1005 + _678;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_55.y = _148;
    float _1019 = _1015 * 0.5;
    float _1021 = _678 * 0.5;
    out.m_65.x = _432;
    out.m_65.y = _428;
    out.m_65.z = _436;
    float _1023 = fma(_708, -0.5, _1021);
    float _1025 = -_971;
    float _1027 = _1025 + 1.0;
    out.m_55.x = _160;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1031 = _706 + _678;
    out.m_67.w = _885;
    float _1033 = _1031 * 0.5;
    out.m_45.x = _1029;
    out.gl_Position.x = _706;
    out.gl_Position.y = _708;
    out.gl_Position.z = _1005;
    out.gl_Position.w = _678;
    out.m_69.x = _1033;
    out.m_69.y = _1023;
    out.m_69.z = _1019;
    out.m_69.w = _678;
    float _1035 = _971 * _732;
    float _1037 = _747 * _1035;
    float _1039 = _747 * _1027;
    float _1041 = _757 * _1035;
    float _1043 = fma(_753, _1037, _741);
    float _1045 = fma(_755, _1037, _743);
    float _1047 = fma(_747, _1041, _745);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1047;
    out.m_71.w = _1039;
    if (!_1013)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1049;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_106);
        out.gl_Position.z = _1106;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1175 = as_type<float>(_142);
        out.gl_Position.z = _1175;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_51.x;
    float _162 = in.m_51.z;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_158)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_158)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_158;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _146 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _146);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_158;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _146 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _148);
    float _272 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _166, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _270 * _272;
    float _284 = fma(_276, _144, _182);
    float _286 = fma(_256, _164, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _162);
    float _290 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _168, _280);
    float _294 = fma(_286, _144, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = fma(_292, _144, _184);
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _284;
    float _366 = _320;
    float _368 = _330;
    float _370 = _334;
    float _372 = _348;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = rsqrt(_348);
        float _392 = _388 * _384;
        float _394 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = _392 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = fma(_400, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = _390 * _406;
        float _410 = _404 + (-1.0);
        float _412 = fma(_344, _408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_338, _408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _416 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_360, _404, _416);
        _382 = _418;
        _376 = _412;
        _368 = _414;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _440;
    float _468 = _464;
    float _470 = _446;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _476;
    float _484 = _480;
    if (_460)
    {
        float _486 = _464 * _476;
        _468 = _486;
    }
    float _488 = _468;
    if (_460)
    {
        float _490 = _488 * 0.15915493667125701904296875;
        _372 = _490;
    }
    float _492 = _372;
    float _494 = _340;
    if (_460)
    {
        float _496 = _492 * 6.283185482025146484375;
        float _498 = sin(_496);
        _494 = _498;
    }
    float _500 = _494;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _274;
    float _508 = _504;
    if (_460)
    {
        float _510 = _492 * 6.283185482025146484375;
        float _512 = cos(_510);
        _506 = _512;
    }
    float _514 = _506;
    float _516 = -_446;
    float _518 = -_504;
    float _520 = fma(_428, _516, _518);
    if (_460)
    {
        float _522 = _520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _522;
    }
    float _524 = _482;
    float _526 = sqrt(_442);
    float _528 = _500;
    float _530 = _524;
    if (_460)
    {
        float _532 = fma(_500, _524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_460)
    {
        _530 = _520;
    }
    float _538 = _530;
    float _540 = _538;
    float _542 = _514;
    if (_460)
    {
        float _544 = _514 + (-1.0);
        _508 = _544;
    }
    float _546 = _508;
    float _548 = _546;
    if (_460)
    {
        float _550 = _480 * _534;
        _470 = _550;
    }
    float _552 = _470;
    if (!_460)
    {
        _536 = _450;
    }
    float _554 = _536;
    float _556 = _554;
    if (_460)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _484 = _558;
    }
    float _560 = _484;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _556 = _570;
    }
    float _572 = _556;
    if (_460)
    {
        float _574 = fma(_520, _514, _560);
        _540 = _574;
    }
    float _576 = _540;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _542 = _454;
    }
    float _582 = _542;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _594 = _590 + _588;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _598 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _596);
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float _602 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _592);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = -_600;
    float _610 = _608 + 1.0;
    float _612 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _620 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _622 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _624 = abs(_610);
    float _626 = log2(_624);
    float _628 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _614);
    float _630 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _616);
    float _632 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _622);
    float _634 = _620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _632);
    float _642 = _606 * _564;
    float _644 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _646 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _648 = _606 * _576;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _640 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _646);
    float _656 = _606 * _572;
    float _658 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = -_650;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _660);
    float _664 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _666 = -_634;
    float _668 = fma(_666, _618, 1.0);
    float _670 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _672 = -_656;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].z, _662);
    float _676 = exp2(_658);
    float _678 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_674, -0.5, 0.5);
    float _684 = fma(_674, 0.5, 0.5);
    float _686 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _670);
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _690 = log2(_668);
    float _692 = _648 + 1.0;
    float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _686);
    float _696 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _688);
    float _698 = fma(_684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = 1.0 / _678;
    float _702 = -_648;
    float _704 = fma(_676, _692, _702);
    float _706 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _694);
    float _708 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _696);
    float _710 = fma(_684, _698, -0.212114393711090087890625);
    float _712 = fma(_704, 0.5, 0.5);
    float _714 = sqrt(_682);
    float _716 = _690 * 0.693147182464599609375;
    float _718 = fma(_684, _710, 1.570728778839111328125);
    float _720 = _716 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _722 = _706 * _700;
    float _724 = _708 * _700;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2155 = float3(_726, _728, _720);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2155, float3(0.0), isnan(_2155)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2155, float3(0.0), isnan(_2155)), level(0.0)).x;
    float _734 = -_718;
    float _736 = fma(_730, _734, 1.0);
    float3 _2171 = float3(_726, _728, _720);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2171, float3(0.0), isnan(_2171)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2171, float3(0.0), isnan(_2171)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2188 = float2(_736, _712);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2188, float2(0.0), isnan(_2188)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2188, float2(0.0), isnan(_2188)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _761 = in.m_53.x;
    float _763 = in.m_53.y;
    float _765 = in.m_53.z;
    bool _767 = _148 != 0.0;
    bool _769 = isnan(_148);
    bool _771 = _767 || _769;
    bool _773 = isnan(0.0);
    bool _775 = _771 || _773;
    float _777 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _759);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _793 = _160 == 0.0;
    bool _795 = !_775;
    bool _797 = _793 && _795;
    float _799 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _803 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _799 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _807 = _162 == 0.0;
    bool _809 = _807 && _797;
    float _811 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = exp2(_791);
    float _815 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _817 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _819 = 0.0;
    float _821 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _823 = _726;
    if (!_789)
    {
        _819 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _825 = _819;
    out.m_55.z = _162;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _817 + _805;
    float _831 = 1.0 / _805;
    float _833 = 0.0;
    if (!_789)
    {
        float _835 = -_825;
        float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _763;
    float _843 = _761;
    float _845 = _765;
    float _847 = _839;
    if (!_809)
    {
        float _849 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[17].y, _763);
        _841 = _849;
    }
    float _851 = _841;
    if (!_809)
    {
        float _853 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _761);
        _843 = _853;
    }
    float _855 = _843;
    if (!_809)
    {
        float _857 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _765);
        _845 = _857;
    }
    float _859 = _845;
    float _861 = _851 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = 0.0;
    if (!_789)
    {
        float _869 = 1.0 / _839;
        _867 = _869;
    }
    float _871 = _867;
    float _873 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _875 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _879 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _829 * _831;
    float _883 = _881 * 0.5;
    float _885 = in.m_57.w;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _889);
    float _893 = _875;
    float _895 = _877;
    if (!_789)
    {
        _821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _897 = _821;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _901 = 1.0 / _891;
    float _903 = _897;
    if (!_789)
    {
        float _905 = -_897;
        float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _823 = _907;
    }
    float _909 = _823;
    float _911 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_789)
    {
        _847 = 1.0;
    }
    float _915 = _847;
    float _917 = -_813;
    float _919 = _917 + 1.0;
    float _921 = _909;
    float _923 = _915;
    if (!_789)
    {
        float _925 = 1.0 / _909;
        _921 = _925;
    }
    float _927 = _921;
    float _929 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[8].z, _873);
    float _931 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[9].z, _875);
    float _933 = fma(_859, (*spvDescriptorSet0.vp_c10)._m0[10].z, _877);
    float _935 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_789)
    {
        _893 = 1.0;
    }
    float _937 = _893;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _943 = _937;
    if (!_789)
    {
        float _945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _947 = -_897;
        float _949 = fma(_901, _945, _947);
        _903 = _949;
    }
    float _951 = _903;
    if (!_789)
    {
        float _953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _955 = -_825;
        float _957 = fma(_901, _953, _955);
        _895 = _957;
    }
    float _959 = _895;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_59.x = _879;
    out.m_59.y = _911;
    out.m_59.z = _935;
    out.m_59.w = _899;
    float _963 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    if (!_789)
    {
        float _965 = _959 * _871;
        float _967 = precise::clamp(_965, 0.0, 1.0);
        _923 = _967;
    }
    float _969 = _923;
    float _971 = _919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _975 = _927;
    if (!_789)
    {
        float _977 = _951 * _927;
        float _979 = precise::clamp(_977, 0.0, 1.0);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _985 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_789)
    {
        float _989 = -_981;
        float _991 = _989 + 1.0;
        _943 = _991;
    }
    float _993 = _943;
    bool _995 = _969 > 0.0;
    bool _997 = isnan(_969);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    out.m_61.x = _929;
    out.m_61.y = _931;
    out.m_61.z = _933;
    float _1005 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _963);
    float _1007 = _969 * _993;
    bool _1009 = _993 <= 0.0;
    bool _1011 = !_1003;
    bool _1013 = _1009 || _1011;
    out.m_63.x = _983;
    out.m_63.y = _985;
    out.m_63.z = _987;
    out.m_63.w = _973;
    float _1015 = _1005 + _678;
    float _1017 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_55.y = _148;
    float _1019 = _1015 * 0.5;
    float _1021 = _678 * 0.5;
    out.m_65.x = _432;
    out.m_65.y = _428;
    out.m_65.z = _436;
    float _1023 = fma(_708, -0.5, _1021);
    float _1025 = -_971;
    float _1027 = _1025 + 1.0;
    out.m_55.x = _160;
    float _1029 = _1017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1031 = _706 + _678;
    out.m_67.w = _885;
    float _1033 = _1031 * 0.5;
    out.m_45.x = _1029;
    out.gl_Position.x = _706;
    out.gl_Position.y = _708;
    out.gl_Position.z = _1005;
    out.gl_Position.w = _678;
    out.m_69.x = _1033;
    out.m_69.y = _1023;
    out.m_69.z = _1019;
    out.m_69.w = _678;
    float _1035 = _971 * _732;
    float _1037 = _747 * _1035;
    float _1039 = _747 * _1027;
    float _1041 = _757 * _1035;
    float _1043 = fma(_753, _1037, _741);
    float _1045 = fma(_755, _1037, _743);
    float _1047 = fma(_747, _1041, _745);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1047;
    out.m_71.w = _1039;
    if (!_1013)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1049;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

