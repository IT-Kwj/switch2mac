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
    float4 m_75 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_49 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_81 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _466 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
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
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1465 = as_type<float>(_116);
        out.gl_Position.z = _1465;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    float _122 = float(_100);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_49.x = _140;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1535 = as_type<float>(_152);
        out.gl_Position.z = _1535;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_53.w;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = 0.0;
    float _186 = _156;
    if (!_168)
    {
        float _188 = _156 * _156;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    out.m_55.x = _154;
    out.m_55.y = _158;
    bool _200 = !_168;
    float _202 = _198;
    float _204 = _158;
    float _206 = _154;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_168;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        _302 = _140;
    }
    _304 = false;
    float _306 = _302;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _318 = isnan(_306);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _336 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _338 = isnan(_306);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _314;
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _360 = isnan(_306);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _346 * _352;
    float _372 = -_346;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _378 = 1.0 / _330;
    float _380 = _368 * _374;
    float _382 = -_368;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _334;
    float _388 = _356 * _348;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _310, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = _392 * _378;
    bool _398 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_306);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _416 = _306 + _414;
    float _418 = _394 * _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _422 = _306 + _420;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_396, _416, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _430 = _412 * _386;
    float _432 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _418);
    float _434 = _326 * _426;
    float _436 = fma(_430, _422, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _438 = fma(_428, _370, _432);
    float _440 = fma(_436, _434, _438);
    float _442 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _440);
    float _444 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _444;
    bool _446 = !_376;
    float _464;
    if (!_446)
    {
        float _448 = in.m_57.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _140;
    }
    _466 = false;
    float _468 = _464;
    float _470 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _476 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _472);
    float _480 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _474);
    float _482 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _480);
    float _488 = _482 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _496 * _512;
    float _516 = _500 * _512;
    float _518 = _504 * _512;
    float _520 = -_514;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = -_516;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _528 = -_518;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _532 = _522 * _522;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = in.m_53.z;
    float _540 = fma(_526, _526, _532);
    float _542 = in.m_61.x;
    float _544 = in.m_61.y;
    float _546 = in.m_61.z;
    float _548 = fma(_530, _530, _540);
    float _550 = sqrt(_548);
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = _512 * _550;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _564 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _568 = _556 * _560;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _572 = _556 * _564;
    float _574 = _562 * _568;
    float _576 = _556 * _570;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _580 = _566 * _572;
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _586 = _578 * _576;
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[10].x, _582);
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[8].x, _584);
    float _592 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[9].x, _592);
    float _600 = _492 + _594;
    float _602 = _490 + _596;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _602 + _610;
    float _614 = _488 + _604;
    float _616 = _608 * _608;
    float _618 = fma(_612, _612, _616);
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = _574;
    float _626 = _592;
    float _628 = _598;
    float _630 = _620;
    float _632 = _618;
    float _634 = _468;
    if (!_622)
    {
        _624 = _602;
    }
    float _636 = _624;
    float _638 = _636;
    if (!_622)
    {
        _626 = _600;
    }
    float _640 = _626;
    float _642 = _640;
    if (!_622)
    {
        _628 = _614;
    }
    float _644 = _628;
    bool _646 = !_622;
    float _648 = _644;
    if (!_646)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _654 = _620 + _652;
        float _656 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _658 = rsqrt(_618);
        float _660 = _654 * _650;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 * 6.283185482025146484375;
        float _670 = cos(_668);
        float _672 = fma(_666, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = _658 * _672;
        float _676 = _670 + (-1.0);
        float _678 = fma(_612, _674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_608, _674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = fma(_614, _670, _682);
        _648 = _684;
        _638 = _678;
        _642 = _680;
        _630 = _658;
    }
    float _686 = _648;
    float _688 = _638;
    float _690 = _642;
    float _692 = _630;
    float _694 = -_514;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _698 = -_516;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _702 = -_518;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _696 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _736;
    float _750 = _744;
    float _752 = _718;
    float _754 = _708;
    if (_740)
    {
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _756;
    }
    float _758 = _746;
    if (_740)
    {
        float _760 = rsqrt(_736);
        _748 = _760;
    }
    float _762 = _748;
    float _764 = _762;
    if (_740)
    {
        float _766 = _744 * _758;
        _750 = _766;
    }
    float _768 = _750;
    if (_740)
    {
        float _770 = _768 * 0.15915493667125701904296875;
        _752 = _770;
    }
    float _772 = _752;
    float _774 = _758;
    float _776 = _772;
    if (_740)
    {
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _786 = precise::max(0.0, _784);
    float _788 = _692;
    float _790 = _786;
    if (_740)
    {
        float _792 = _772 * 6.283185482025146484375;
        float _794 = cos(_792);
        _788 = _794;
    }
    float _796 = _788;
    float _798 = -_726;
    float _800 = -_786;
    float _802 = fma(_708, _798, _800);
    if (_740)
    {
        float _804 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _804;
    }
    float _806 = _790;
    float _808 = _782;
    float _810 = _806;
    if (_740)
    {
        float _812 = fma(_782, _806, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _754 = _812;
    }
    float _814 = _754;
    float _816 = _814;
    if (!_740)
    {
        _808 = _728;
    }
    float _818 = _808;
    float _820 = _818;
    float _822 = _796;
    if (_740)
    {
        float _824 = _796 + (-1.0);
        _810 = _824;
    }
    float _826 = _810;
    float _828 = _826;
    if (_740)
    {
        float _830 = _762 * _814;
        _632 = _830;
    }
    float _832 = _632;
    if (!_740)
    {
        _816 = _802;
    }
    float _834 = _816;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _838;
    }
    float _840 = _776;
    if (_740)
    {
        float _842 = _728 * _832;
        _820 = _842;
    }
    float _844 = _820;
    if (!_740)
    {
        _828 = _730;
    }
    float _846 = _828;
    float _848 = sqrt(_722);
    float _850 = _846;
    if (!_740)
    {
        _764 = _732;
    }
    float _852 = _764;
    float _854 = _852;
    if (_740)
    {
        float _856 = fma(_802, _796, _840);
        _836 = _856;
    }
    float _858 = _836;
    if (_740)
    {
        float _860 = _730 * _832;
        _850 = _860;
    }
    float _862 = _850;
    if (_740)
    {
        float _864 = _844 * _844;
        _854 = _864;
    }
    float _866 = _854;
    if (!_740)
    {
        _822 = _734;
    }
    float _868 = _822;
    float _870 = _696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _872 = _868;
    if (_740)
    {
        float _874 = _862 * _862;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_858, _858, _866);
    float _880 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _870);
    float _882 = _878 + _876;
    float _884 = _696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _880);
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _888);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _896 = rsqrt(_882);
    float _898 = _696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = -_892;
    float _902 = _900 + 1.0;
    float _904 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _894);
    float _906 = _696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _908);
    float _918 = abs(_902);
    float _920 = log2(_918);
    float _922 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _924 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = _886 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _930 = -_922;
    float _932 = fma(_930, _910, 1.0);
    float _934 = _924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _936 = _896 * _844;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _940 = _896 * _858;
    float _942 = _896 * _862;
    float _944 = _936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[7].x, _938);
    float _948 = log2(_932);
    float _950 = -_944;
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _950);
    float _954 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _946);
    float _956 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _958 = -_942;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _952);
    float _962 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _964 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _966 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _968 = fma(_960, -0.5, 0.5);
    float _970 = exp2(_956);
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[4].x, _964);
    float _974 = fma(_960, 0.5, 0.5);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[5].x, _966);
    float _978 = _940 + 1.0;
    float _980 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _972);
    float _982 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _984 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _986 = 1.0 / _962;
    float _988 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _980);
    float _990 = fma(_974, _982, -0.212114393711090087890625);
    float _992 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _994 = _948 * 0.693147182464599609375;
    float _996 = fma(_974, _990, 1.570728778839111328125);
    float _998 = sqrt(_968);
    float _1000 = -_940;
    float _1002 = fma(_970, _978, _1000);
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1006 = fma(_1002, 0.5, 0.5);
    float _1008 = _988 * _986;
    float _1010 = _992 * _986;
    float _1012 = fma(_1008, 0.5, 0.5);
    float _1014 = fma(_1010, -0.5, 0.5);
    float _1016 = _998 * 0.636619746685028076171875;
    float3 _2942 = float3(_1012, _1014, _1004);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).x;
    float3 _2953 = float3(_1012, _1014, _1004);
    float4 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2953, float3(0.0), isnan(_2953)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2953, float3(0.0), isnan(_2953)), level(0.0)).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = -_996;
    float _1033 = fma(_1016, _1031, 1.0);
    float2 _2975 = float2(_1033, _1006);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2975, float2(0.0), isnan(_2975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2975, float2(0.0), isnan(_2975)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = in.m_57.y;
    float _1047 = -_158;
    float _1049 = _1047 + 1.0;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1055 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1057 = isnan(_468);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1073 = _1071 != 0;
    float _1075 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1079 = _1077 != 0;
    float _1081 = 1.0 / _1053;
    float _1083 = in.m_63.x;
    float _1085 = in.m_63.y;
    float _1087 = in.m_63.z;
    float _1089 = in.m_63.w;
    bool _1091 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1093 = isnan(_468);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1105;
    out.m_65.x = _700;
    out.m_65.y = _696;
    out.m_65.z = _704;
    float _1109 = 1.0 / _1069;
    float _1111 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1103);
    float _1113 = 0.0;
    if (_1073)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    bool _1121 = _1045 > 0.5;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1127 = _1107 * _1081;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1131 = _468 + _1129;
    if (_1079)
    {
        float _1133 = _1121 ? _1049 : _158;
        _204 = _1133;
    }
    float _1135 = _204;
    float _1137 = -_1065;
    float _1139 = _1137 + 1.0;
    bool _1141 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1143 = isnan(_468);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1155 = _544 != 0.0;
    bool _1157 = isnan(_544);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = exp2(_1075);
    float _1167 = _1125 * _1109;
    float _1169 = _1151 * _1139;
    float _1171 = in.m_67.x;
    float _1173 = in.m_67.y;
    float _1175 = in.m_67.z;
    bool _1177 = _542 == 0.0;
    bool _1179 = !_1163;
    bool _1181 = _1177 && _1179;
    float _1183 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1185 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1187 = -_1151;
    float _1189 = _1187 + 1.0;
    bool _1191 = _546 == 0.0;
    bool _1193 = _1191 && _1181;
    float _1195 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1183);
    float _1197 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1185);
    float _1199 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1201 = _1117 > 0.5;
    bool _1203 = _1201 && _1073;
    float _1205 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1195);
    float _1207 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1197);
    float _1209 = _1101 * _1189;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _468 + _1211;
    float _1215 = -_1101;
    float _1217 = _1215 + 1.0;
    float _1219 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1199);
    float _1221 = _1153 * _1209;
    float _1223 = fma(_1167, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1225 = _1209;
    float _1227 = _1189;
    float _1229 = _1221;
    if (!_1073)
    {
        _634 = _154;
    }
    float _1231 = _634;
    float _1233 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1219);
    float _1235 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1221);
    float _1237 = -_1165;
    float _1239 = _1237 + 1.0;
    float _1241 = _1231;
    if (_1203)
    {
        float _1243 = -_154;
        float _1245 = _1243 + 1.0;
        _206 = _1245;
    }
    float _1247 = _206;
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1251 = _1171;
    float _1253 = _1247;
    if (_1193)
    {
        _1225 = _1171;
    }
    float _1255 = _1225;
    out.m_69.x = _1205;
    out.m_69.y = _1207;
    out.m_69.z = _1233;
    float _1257 = _1255;
    if (_1193)
    {
        _1227 = _1173;
    }
    float _1259 = _1227;
    float _1261 = fma(_1223, _1169, _1235);
    float _1263 = _1259;
    if (_1193)
    {
        _1229 = _1255;
    }
    float _1265 = _1229;
    float _1267 = _1265;
    if (!_1193)
    {
        _1257 = _1171;
    }
    float _1269 = _1257;
    float _1271 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1261);
    if (_1193)
    {
        _1251 = _1259;
    }
    float _1273 = _1251;
    float _1275 = _1273;
    if (!_1193)
    {
        _1263 = _1173;
    }
    float _1277 = _1263;
    float _1279 = _1087 * _1269;
    if (!_1193)
    {
        float _1281 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1267 = _1281;
    }
    float _1283 = _1267;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1073)
    {
        _1241 = _1247;
    }
    float _1287 = _1241;
    if (!_1193)
    {
        float _1289 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1277);
        _1275 = _1289;
    }
    float _1291 = _1275;
    float _1293 = _1085 * _1175;
    float _1295 = _1083 * _1277;
    float _1297 = -_1279;
    float _1299 = fma(_1083, _1175, _1297);
    if (_1193)
    {
        _1253 = _1175;
    }
    float _1301 = _1253;
    float _1303 = -_1293;
    float _1305 = fma(_1087, _1277, _1303);
    float _1307 = -_1295;
    float _1309 = fma(_1085, _1269, _1307);
    float _1311 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = _1299 * _1089;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1321 = _1301;
    if (!_1193)
    {
        float _1323 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1175);
        _1321 = _1323;
    }
    float _1325 = _1321;
    float _1327 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1311);
    float _1329 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1331 = _1305 * _1089;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1319);
    float _1337 = _1309 * _1089;
    float _1339 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1347 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1329);
    float _1349 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1335);
    float _1351 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1353 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1339);
    float _1355 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1357 = _1249 * _1313;
    float _1359 = _1351 * _1285;
    out.m_71.x = _1345;
    out.m_71.y = _1347;
    out.m_71.z = _1349;
    float _1361 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1119);
    float _1363 = _988 + _962;
    float _1365 = _962 * 0.5;
    float _1367 = _1271 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1371 = _1361 + _1369;
    float _1373 = _1363 * 0.5;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1343);
    float _1377 = _962 + _1371;
    float _1379 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1355);
    float _1383 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1385 = fma(_992, -0.5, _1365);
    float _1387 = _1377 * 0.5;
    float _1389 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1359;
    out.m_73.y = _1357;
    out.m_75.w = _1367;
    out.m_77.x = _1375;
    out.m_77.y = _1379;
    out.m_77.z = _1381;
    out.gl_Position.x = _988;
    out.gl_Position.y = _992;
    out.gl_Position.z = _1371;
    out.gl_Position.w = _962;
    out.m_79.x = _1373;
    out.m_79.y = _1385;
    out.m_79.z = _1387;
    out.m_79.w = _962;
    out.m_45.x = _1389;
    float _1391 = _1383 * _1018;
    float _1393 = -_1383;
    float _1395 = _1393 + 1.0;
    float _1397 = _1029 * _1391;
    float _1399 = _1029 * _1395;
    float _1401 = _1043 * _1391;
    float _1403 = fma(_1039, _1397, _1023);
    float _1405 = fma(_1041, _1397, _1025);
    float _1407 = fma(_1029, _1401, _1027);
    out.m_81.x = _1403;
    out.m_81.y = _1405;
    out.m_81.z = _1407;
    out.m_81.w = _1399;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _466 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
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
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1465 = as_type<float>(_116);
        out.gl_Position.z = _1465;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    float _122 = float(_100);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_49.x = _140;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1535 = as_type<float>(_152);
        out.gl_Position.z = _1535;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_53.w;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = 0.0;
    float _186 = _156;
    if (!_168)
    {
        float _188 = _156 * _156;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    out.m_55.x = _154;
    out.m_55.y = _158;
    bool _200 = !_168;
    float _202 = _198;
    float _204 = _158;
    float _206 = _154;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_168;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        _302 = _140;
    }
    _304 = false;
    float _306 = _302;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _318 = isnan(_306);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _336 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _338 = isnan(_306);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _314;
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _360 = isnan(_306);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _346 * _352;
    float _372 = -_346;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _378 = 1.0 / _330;
    float _380 = _368 * _374;
    float _382 = -_368;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _334;
    float _388 = _356 * _348;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _310, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = _392 * _378;
    bool _398 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_306);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _416 = _306 + _414;
    float _418 = _394 * _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _422 = _306 + _420;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_396, _416, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _430 = _412 * _386;
    float _432 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _418);
    float _434 = _326 * _426;
    float _436 = fma(_430, _422, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _438 = fma(_428, _370, _432);
    float _440 = fma(_436, _434, _438);
    float _442 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _440);
    float _444 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _444;
    bool _446 = !_376;
    float _464;
    if (!_446)
    {
        float _448 = in.m_57.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _140;
    }
    _466 = false;
    float _468 = _464;
    float _470 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _476 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _472);
    float _480 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _474);
    float _482 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _480);
    float _488 = _482 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _496 * _512;
    float _516 = _500 * _512;
    float _518 = _504 * _512;
    float _520 = -_514;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = -_516;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _528 = -_518;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _532 = _522 * _522;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = in.m_53.z;
    float _540 = fma(_526, _526, _532);
    float _542 = in.m_61.x;
    float _544 = in.m_61.y;
    float _546 = in.m_61.z;
    float _548 = fma(_530, _530, _540);
    float _550 = sqrt(_548);
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = _512 * _550;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _564 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _568 = _556 * _560;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _572 = _556 * _564;
    float _574 = _562 * _568;
    float _576 = _556 * _570;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _580 = _566 * _572;
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _586 = _578 * _576;
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[10].x, _582);
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[8].x, _584);
    float _592 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[9].x, _592);
    float _600 = _492 + _594;
    float _602 = _490 + _596;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _602 + _610;
    float _614 = _488 + _604;
    float _616 = _608 * _608;
    float _618 = fma(_612, _612, _616);
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = _574;
    float _626 = _592;
    float _628 = _598;
    float _630 = _620;
    float _632 = _618;
    float _634 = _468;
    if (!_622)
    {
        _624 = _602;
    }
    float _636 = _624;
    float _638 = _636;
    if (!_622)
    {
        _626 = _600;
    }
    float _640 = _626;
    float _642 = _640;
    if (!_622)
    {
        _628 = _614;
    }
    float _644 = _628;
    bool _646 = !_622;
    float _648 = _644;
    if (!_646)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _654 = _620 + _652;
        float _656 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _658 = rsqrt(_618);
        float _660 = _654 * _650;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 * 6.283185482025146484375;
        float _670 = cos(_668);
        float _672 = fma(_666, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = _658 * _672;
        float _676 = _670 + (-1.0);
        float _678 = fma(_612, _674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_608, _674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = fma(_614, _670, _682);
        _648 = _684;
        _638 = _678;
        _642 = _680;
        _630 = _658;
    }
    float _686 = _648;
    float _688 = _638;
    float _690 = _642;
    float _692 = _630;
    float _694 = -_514;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _698 = -_516;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _702 = -_518;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _696 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _736;
    float _750 = _744;
    float _752 = _718;
    float _754 = _708;
    if (_740)
    {
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _756;
    }
    float _758 = _746;
    if (_740)
    {
        float _760 = rsqrt(_736);
        _748 = _760;
    }
    float _762 = _748;
    float _764 = _762;
    if (_740)
    {
        float _766 = _744 * _758;
        _750 = _766;
    }
    float _768 = _750;
    if (_740)
    {
        float _770 = _768 * 0.15915493667125701904296875;
        _752 = _770;
    }
    float _772 = _752;
    float _774 = _758;
    float _776 = _772;
    if (_740)
    {
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _786 = precise::max(0.0, _784);
    float _788 = _692;
    float _790 = _786;
    if (_740)
    {
        float _792 = _772 * 6.283185482025146484375;
        float _794 = cos(_792);
        _788 = _794;
    }
    float _796 = _788;
    float _798 = -_726;
    float _800 = -_786;
    float _802 = fma(_708, _798, _800);
    if (_740)
    {
        float _804 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _804;
    }
    float _806 = _790;
    float _808 = _782;
    float _810 = _806;
    if (_740)
    {
        float _812 = fma(_782, _806, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _754 = _812;
    }
    float _814 = _754;
    float _816 = _814;
    if (!_740)
    {
        _808 = _728;
    }
    float _818 = _808;
    float _820 = _818;
    float _822 = _796;
    if (_740)
    {
        float _824 = _796 + (-1.0);
        _810 = _824;
    }
    float _826 = _810;
    float _828 = _826;
    if (_740)
    {
        float _830 = _762 * _814;
        _632 = _830;
    }
    float _832 = _632;
    if (!_740)
    {
        _816 = _802;
    }
    float _834 = _816;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _838;
    }
    float _840 = _776;
    if (_740)
    {
        float _842 = _728 * _832;
        _820 = _842;
    }
    float _844 = _820;
    if (!_740)
    {
        _828 = _730;
    }
    float _846 = _828;
    float _848 = sqrt(_722);
    float _850 = _846;
    if (!_740)
    {
        _764 = _732;
    }
    float _852 = _764;
    float _854 = _852;
    if (_740)
    {
        float _856 = fma(_802, _796, _840);
        _836 = _856;
    }
    float _858 = _836;
    if (_740)
    {
        float _860 = _730 * _832;
        _850 = _860;
    }
    float _862 = _850;
    if (_740)
    {
        float _864 = _844 * _844;
        _854 = _864;
    }
    float _866 = _854;
    if (!_740)
    {
        _822 = _734;
    }
    float _868 = _822;
    float _870 = _696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _872 = _868;
    if (_740)
    {
        float _874 = _862 * _862;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_858, _858, _866);
    float _880 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _870);
    float _882 = _878 + _876;
    float _884 = _696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _880);
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _888);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _896 = rsqrt(_882);
    float _898 = _696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = -_892;
    float _902 = _900 + 1.0;
    float _904 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _894);
    float _906 = _696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _908);
    float _918 = abs(_902);
    float _920 = log2(_918);
    float _922 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _924 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = _886 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _930 = -_922;
    float _932 = fma(_930, _910, 1.0);
    float _934 = _924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _936 = _896 * _844;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _940 = _896 * _858;
    float _942 = _896 * _862;
    float _944 = _936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[7].x, _938);
    float _948 = log2(_932);
    float _950 = -_944;
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _950);
    float _954 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _946);
    float _956 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _958 = -_942;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _952);
    float _962 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _964 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _966 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _968 = fma(_960, -0.5, 0.5);
    float _970 = exp2(_956);
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[4].x, _964);
    float _974 = fma(_960, 0.5, 0.5);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[5].x, _966);
    float _978 = _940 + 1.0;
    float _980 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _972);
    float _982 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _984 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _986 = 1.0 / _962;
    float _988 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _980);
    float _990 = fma(_974, _982, -0.212114393711090087890625);
    float _992 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _994 = _948 * 0.693147182464599609375;
    float _996 = fma(_974, _990, 1.570728778839111328125);
    float _998 = sqrt(_968);
    float _1000 = -_940;
    float _1002 = fma(_970, _978, _1000);
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1006 = fma(_1002, 0.5, 0.5);
    float _1008 = _988 * _986;
    float _1010 = _992 * _986;
    float _1012 = fma(_1008, 0.5, 0.5);
    float _1014 = fma(_1010, -0.5, 0.5);
    float _1016 = _998 * 0.636619746685028076171875;
    float3 _2942 = float3(_1012, _1014, _1004);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).x;
    float3 _2953 = float3(_1012, _1014, _1004);
    float4 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2953, float3(0.0), isnan(_2953)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2953, float3(0.0), isnan(_2953)), level(0.0)).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = -_996;
    float _1033 = fma(_1016, _1031, 1.0);
    float2 _2975 = float2(_1033, _1006);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2975, float2(0.0), isnan(_2975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2975, float2(0.0), isnan(_2975)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = in.m_57.y;
    float _1047 = -_158;
    float _1049 = _1047 + 1.0;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1055 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1057 = isnan(_468);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1073 = _1071 != 0;
    float _1075 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1079 = _1077 != 0;
    float _1081 = 1.0 / _1053;
    float _1083 = in.m_63.x;
    float _1085 = in.m_63.y;
    float _1087 = in.m_63.z;
    float _1089 = in.m_63.w;
    bool _1091 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1093 = isnan(_468);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1105;
    out.m_65.x = _700;
    out.m_65.y = _696;
    out.m_65.z = _704;
    float _1109 = 1.0 / _1069;
    float _1111 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1103);
    float _1113 = 0.0;
    if (_1073)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    bool _1121 = _1045 > 0.5;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1127 = _1107 * _1081;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1131 = _468 + _1129;
    if (_1079)
    {
        float _1133 = _1121 ? _1049 : _158;
        _204 = _1133;
    }
    float _1135 = _204;
    float _1137 = -_1065;
    float _1139 = _1137 + 1.0;
    bool _1141 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1143 = isnan(_468);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1155 = _544 != 0.0;
    bool _1157 = isnan(_544);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = exp2(_1075);
    float _1167 = _1125 * _1109;
    float _1169 = _1151 * _1139;
    float _1171 = in.m_67.x;
    float _1173 = in.m_67.y;
    float _1175 = in.m_67.z;
    bool _1177 = _542 == 0.0;
    bool _1179 = !_1163;
    bool _1181 = _1177 && _1179;
    float _1183 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1185 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1187 = -_1151;
    float _1189 = _1187 + 1.0;
    bool _1191 = _546 == 0.0;
    bool _1193 = _1191 && _1181;
    float _1195 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1183);
    float _1197 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1185);
    float _1199 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1201 = _1117 > 0.5;
    bool _1203 = _1201 && _1073;
    float _1205 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1195);
    float _1207 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1197);
    float _1209 = _1101 * _1189;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _468 + _1211;
    float _1215 = -_1101;
    float _1217 = _1215 + 1.0;
    float _1219 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1199);
    float _1221 = _1153 * _1209;
    float _1223 = fma(_1167, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1225 = _1209;
    float _1227 = _1189;
    float _1229 = _1221;
    if (!_1073)
    {
        _634 = _154;
    }
    float _1231 = _634;
    float _1233 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1219);
    float _1235 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1221);
    float _1237 = -_1165;
    float _1239 = _1237 + 1.0;
    float _1241 = _1231;
    if (_1203)
    {
        float _1243 = -_154;
        float _1245 = _1243 + 1.0;
        _206 = _1245;
    }
    float _1247 = _206;
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1251 = _1171;
    float _1253 = _1247;
    if (_1193)
    {
        _1225 = _1171;
    }
    float _1255 = _1225;
    out.m_69.x = _1205;
    out.m_69.y = _1207;
    out.m_69.z = _1233;
    float _1257 = _1255;
    if (_1193)
    {
        _1227 = _1173;
    }
    float _1259 = _1227;
    float _1261 = fma(_1223, _1169, _1235);
    float _1263 = _1259;
    if (_1193)
    {
        _1229 = _1255;
    }
    float _1265 = _1229;
    float _1267 = _1265;
    if (!_1193)
    {
        _1257 = _1171;
    }
    float _1269 = _1257;
    float _1271 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1261);
    if (_1193)
    {
        _1251 = _1259;
    }
    float _1273 = _1251;
    float _1275 = _1273;
    if (!_1193)
    {
        _1263 = _1173;
    }
    float _1277 = _1263;
    float _1279 = _1087 * _1269;
    if (!_1193)
    {
        float _1281 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1267 = _1281;
    }
    float _1283 = _1267;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1073)
    {
        _1241 = _1247;
    }
    float _1287 = _1241;
    if (!_1193)
    {
        float _1289 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1277);
        _1275 = _1289;
    }
    float _1291 = _1275;
    float _1293 = _1085 * _1175;
    float _1295 = _1083 * _1277;
    float _1297 = -_1279;
    float _1299 = fma(_1083, _1175, _1297);
    if (_1193)
    {
        _1253 = _1175;
    }
    float _1301 = _1253;
    float _1303 = -_1293;
    float _1305 = fma(_1087, _1277, _1303);
    float _1307 = -_1295;
    float _1309 = fma(_1085, _1269, _1307);
    float _1311 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = _1299 * _1089;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1321 = _1301;
    if (!_1193)
    {
        float _1323 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1175);
        _1321 = _1323;
    }
    float _1325 = _1321;
    float _1327 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1311);
    float _1329 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1331 = _1305 * _1089;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1319);
    float _1337 = _1309 * _1089;
    float _1339 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1347 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1329);
    float _1349 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1335);
    float _1351 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1353 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1339);
    float _1355 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1357 = _1249 * _1313;
    float _1359 = _1351 * _1285;
    out.m_71.x = _1345;
    out.m_71.y = _1347;
    out.m_71.z = _1349;
    float _1361 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1119);
    float _1363 = _988 + _962;
    float _1365 = _962 * 0.5;
    float _1367 = _1271 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1371 = _1361 + _1369;
    float _1373 = _1363 * 0.5;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1343);
    float _1377 = _962 + _1371;
    float _1379 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1355);
    float _1383 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1385 = fma(_992, -0.5, _1365);
    float _1387 = _1377 * 0.5;
    float _1389 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1359;
    out.m_73.y = _1357;
    out.m_75.w = _1367;
    out.m_77.x = _1375;
    out.m_77.y = _1379;
    out.m_77.z = _1381;
    out.gl_Position.x = _988;
    out.gl_Position.y = _992;
    out.gl_Position.z = _1371;
    out.gl_Position.w = _962;
    out.m_79.x = _1373;
    out.m_79.y = _1385;
    out.m_79.z = _1387;
    out.m_79.w = _962;
    out.m_45.x = _1389;
    float _1391 = _1383 * _1018;
    float _1393 = -_1383;
    float _1395 = _1393 + 1.0;
    float _1397 = _1029 * _1391;
    float _1399 = _1029 * _1395;
    float _1401 = _1043 * _1391;
    float _1403 = fma(_1039, _1397, _1023);
    float _1405 = fma(_1041, _1397, _1025);
    float _1407 = fma(_1029, _1401, _1027);
    out.m_81.x = _1403;
    out.m_81.y = _1405;
    out.m_81.z = _1407;
    out.m_81.w = _1399;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _466 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
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
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1465 = as_type<float>(_116);
        out.gl_Position.z = _1465;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    float _122 = float(_100);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_49.x = _140;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1535 = as_type<float>(_152);
        out.gl_Position.z = _1535;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_53.w;
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = in.m_42.x;
    float _180 = in.m_42.y;
    float _182 = in.m_42.z;
    float _184 = 0.0;
    float _186 = _156;
    if (!_168)
    {
        float _188 = _156 * _156;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    out.m_55.x = _154;
    out.m_55.y = _158;
    bool _200 = !_168;
    float _202 = _198;
    float _204 = _158;
    float _206 = _154;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_168;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        _302 = _140;
    }
    _304 = false;
    float _306 = _302;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _316 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _318 = isnan(_306);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _336 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _338 = isnan(_306);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _314;
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _360 = isnan(_306);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _346 * _352;
    float _372 = -_346;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _378 = 1.0 / _330;
    float _380 = _368 * _374;
    float _382 = -_368;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _334;
    float _388 = _356 * _348;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _310, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = _392 * _378;
    bool _398 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_306);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _416 = _306 + _414;
    float _418 = _394 * _380;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _422 = _306 + _420;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_396, _416, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _430 = _412 * _386;
    float _432 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[115].x, _418);
    float _434 = _326 * _426;
    float _436 = fma(_430, _422, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _438 = fma(_428, _370, _432);
    float _440 = fma(_436, _434, _438);
    float _442 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _440);
    float _444 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _444;
    bool _446 = !_376;
    float _464;
    if (!_446)
    {
        float _448 = in.m_57.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _140;
    }
    _466 = false;
    float _468 = _464;
    float _470 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _474 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _476 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    float _478 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _472);
    float _480 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _474);
    float _482 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _480);
    float _488 = _482 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _496 * _512;
    float _516 = _500 * _512;
    float _518 = _504 * _512;
    float _520 = -_514;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _524 = -_516;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _528 = -_518;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _532 = _522 * _522;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = in.m_53.z;
    float _540 = fma(_526, _526, _532);
    float _542 = in.m_61.x;
    float _544 = in.m_61.y;
    float _546 = in.m_61.z;
    float _548 = fma(_530, _530, _540);
    float _550 = sqrt(_548);
    float _552 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _534 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = _512 * _550;
    float _558 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _564 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _568 = _556 * _560;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _572 = _556 * _564;
    float _574 = _562 * _568;
    float _576 = _556 * _570;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _580 = _566 * _572;
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _586 = _578 * _576;
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[10].x, _582);
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[8].x, _584);
    float _592 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[9].x, _592);
    float _600 = _492 + _594;
    float _602 = _490 + _596;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _598);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _608 = _600 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _612 = _602 + _610;
    float _614 = _488 + _604;
    float _616 = _608 * _608;
    float _618 = fma(_612, _612, _616);
    float _620 = sqrt(_618);
    bool _622 = _620 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _624 = _574;
    float _626 = _592;
    float _628 = _598;
    float _630 = _620;
    float _632 = _618;
    float _634 = _468;
    if (!_622)
    {
        _624 = _602;
    }
    float _636 = _624;
    float _638 = _636;
    if (!_622)
    {
        _626 = _600;
    }
    float _640 = _626;
    float _642 = _640;
    if (!_622)
    {
        _628 = _614;
    }
    float _644 = _628;
    bool _646 = !_622;
    float _648 = _644;
    if (!_646)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _654 = _620 + _652;
        float _656 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _658 = rsqrt(_618);
        float _660 = _654 * _650;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _662 * 6.283185482025146484375;
        float _670 = cos(_668);
        float _672 = fma(_666, _656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _674 = _658 * _672;
        float _676 = _670 + (-1.0);
        float _678 = fma(_612, _674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _680 = fma(_608, _674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _684 = fma(_614, _670, _682);
        _648 = _684;
        _638 = _678;
        _642 = _680;
        _630 = _658;
    }
    float _686 = _648;
    float _688 = _638;
    float _690 = _642;
    float _692 = _630;
    float _694 = -_514;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _698 = -_516;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
    float _702 = -_518;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _690);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _696 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _700 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _736;
    float _750 = _744;
    float _752 = _718;
    float _754 = _708;
    if (_740)
    {
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _756;
    }
    float _758 = _746;
    if (_740)
    {
        float _760 = rsqrt(_736);
        _748 = _760;
    }
    float _762 = _748;
    float _764 = _762;
    if (_740)
    {
        float _766 = _744 * _758;
        _750 = _766;
    }
    float _768 = _750;
    if (_740)
    {
        float _770 = _768 * 0.15915493667125701904296875;
        _752 = _770;
    }
    float _772 = _752;
    float _774 = _758;
    float _776 = _772;
    if (_740)
    {
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        _774 = _780;
    }
    float _782 = _774;
    float _784 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _786 = precise::max(0.0, _784);
    float _788 = _692;
    float _790 = _786;
    if (_740)
    {
        float _792 = _772 * 6.283185482025146484375;
        float _794 = cos(_792);
        _788 = _794;
    }
    float _796 = _788;
    float _798 = -_726;
    float _800 = -_786;
    float _802 = fma(_708, _798, _800);
    if (_740)
    {
        float _804 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _804;
    }
    float _806 = _790;
    float _808 = _782;
    float _810 = _806;
    if (_740)
    {
        float _812 = fma(_782, _806, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _754 = _812;
    }
    float _814 = _754;
    float _816 = _814;
    if (!_740)
    {
        _808 = _728;
    }
    float _818 = _808;
    float _820 = _818;
    float _822 = _796;
    if (_740)
    {
        float _824 = _796 + (-1.0);
        _810 = _824;
    }
    float _826 = _810;
    float _828 = _826;
    if (_740)
    {
        float _830 = _762 * _814;
        _632 = _830;
    }
    float _832 = _632;
    if (!_740)
    {
        _816 = _802;
    }
    float _834 = _816;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _838;
    }
    float _840 = _776;
    if (_740)
    {
        float _842 = _728 * _832;
        _820 = _842;
    }
    float _844 = _820;
    if (!_740)
    {
        _828 = _730;
    }
    float _846 = _828;
    float _848 = sqrt(_722);
    float _850 = _846;
    if (!_740)
    {
        _764 = _732;
    }
    float _852 = _764;
    float _854 = _852;
    if (_740)
    {
        float _856 = fma(_802, _796, _840);
        _836 = _856;
    }
    float _858 = _836;
    if (_740)
    {
        float _860 = _730 * _832;
        _850 = _860;
    }
    float _862 = _850;
    if (_740)
    {
        float _864 = _844 * _844;
        _854 = _864;
    }
    float _866 = _854;
    if (!_740)
    {
        _822 = _734;
    }
    float _868 = _822;
    float _870 = _696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _872 = _868;
    if (_740)
    {
        float _874 = _862 * _862;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_858, _858, _866);
    float _880 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _870);
    float _882 = _878 + _876;
    float _884 = _696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _880);
    float _888 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _890 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _888);
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _896 = rsqrt(_882);
    float _898 = _696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = -_892;
    float _902 = _900 + 1.0;
    float _904 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _894);
    float _906 = _696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _908);
    float _918 = abs(_902);
    float _920 = log2(_918);
    float _922 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _924 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _914);
    float _926 = _916 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _928 = _886 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _930 = -_922;
    float _932 = fma(_930, _910, 1.0);
    float _934 = _924 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _936 = _896 * _844;
    float _938 = _926 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _940 = _896 * _858;
    float _942 = _896 * _862;
    float _944 = _936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[7].x, _938);
    float _948 = log2(_932);
    float _950 = -_944;
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _950);
    float _954 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _946);
    float _956 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _958 = -_942;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].z, _952);
    float _962 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _964 = _926 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _966 = _926 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _968 = fma(_960, -0.5, 0.5);
    float _970 = exp2(_956);
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[4].x, _964);
    float _974 = fma(_960, 0.5, 0.5);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[5].x, _966);
    float _978 = _940 + 1.0;
    float _980 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _972);
    float _982 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _984 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _986 = 1.0 / _962;
    float _988 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _980);
    float _990 = fma(_974, _982, -0.212114393711090087890625);
    float _992 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _994 = _948 * 0.693147182464599609375;
    float _996 = fma(_974, _990, 1.570728778839111328125);
    float _998 = sqrt(_968);
    float _1000 = -_940;
    float _1002 = fma(_970, _978, _1000);
    float _1004 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1006 = fma(_1002, 0.5, 0.5);
    float _1008 = _988 * _986;
    float _1010 = _992 * _986;
    float _1012 = fma(_1008, 0.5, 0.5);
    float _1014 = fma(_1010, -0.5, 0.5);
    float _1016 = _998 * 0.636619746685028076171875;
    float3 _2942 = float3(_1012, _1014, _1004);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2942, float3(0.0), isnan(_2942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2942, float3(0.0), isnan(_2942)), level(0.0)).x;
    float3 _2953 = float3(_1012, _1014, _1004);
    float4 _1021 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2953, float3(0.0), isnan(_2953)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2953, float3(0.0), isnan(_2953)), level(0.0)).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = -_996;
    float _1033 = fma(_1016, _1031, 1.0);
    float2 _2975 = float2(_1033, _1006);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2975, float2(0.0), isnan(_2975)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2975, float2(0.0), isnan(_2975)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = in.m_57.y;
    float _1047 = -_158;
    float _1049 = _1047 + 1.0;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1055 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1057 = isnan(_468);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1073 = _1071 != 0;
    float _1075 = _920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1079 = _1077 != 0;
    float _1081 = 1.0 / _1053;
    float _1083 = in.m_63.x;
    float _1085 = in.m_63.y;
    float _1087 = in.m_63.z;
    float _1089 = in.m_63.w;
    bool _1091 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1093 = isnan(_468);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _926 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1105;
    out.m_65.x = _700;
    out.m_65.y = _696;
    out.m_65.z = _704;
    float _1109 = 1.0 / _1069;
    float _1111 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1103);
    float _1113 = 0.0;
    if (_1073)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    bool _1121 = _1045 > 0.5;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1127 = _1107 * _1081;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1131 = _468 + _1129;
    if (_1079)
    {
        float _1133 = _1121 ? _1049 : _158;
        _204 = _1133;
    }
    float _1135 = _204;
    float _1137 = -_1065;
    float _1139 = _1137 + 1.0;
    bool _1141 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1143 = isnan(_468);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1155 = _544 != 0.0;
    bool _1157 = isnan(_544);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = exp2(_1075);
    float _1167 = _1125 * _1109;
    float _1169 = _1151 * _1139;
    float _1171 = in.m_67.x;
    float _1173 = in.m_67.y;
    float _1175 = in.m_67.z;
    bool _1177 = _542 == 0.0;
    bool _1179 = !_1163;
    bool _1181 = _1177 && _1179;
    float _1183 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1185 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1187 = -_1151;
    float _1189 = _1187 + 1.0;
    bool _1191 = _546 == 0.0;
    bool _1193 = _1191 && _1181;
    float _1195 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1183);
    float _1197 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1185);
    float _1199 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1201 = _1117 > 0.5;
    bool _1203 = _1201 && _1073;
    float _1205 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1195);
    float _1207 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1197);
    float _1209 = _1101 * _1189;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _468 + _1211;
    float _1215 = -_1101;
    float _1217 = _1215 + 1.0;
    float _1219 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1199);
    float _1221 = _1153 * _1209;
    float _1223 = fma(_1167, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1225 = _1209;
    float _1227 = _1189;
    float _1229 = _1221;
    if (!_1073)
    {
        _634 = _154;
    }
    float _1231 = _634;
    float _1233 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1219);
    float _1235 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1221);
    float _1237 = -_1165;
    float _1239 = _1237 + 1.0;
    float _1241 = _1231;
    if (_1203)
    {
        float _1243 = -_154;
        float _1245 = _1243 + 1.0;
        _206 = _1245;
    }
    float _1247 = _206;
    float _1249 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1251 = _1171;
    float _1253 = _1247;
    if (_1193)
    {
        _1225 = _1171;
    }
    float _1255 = _1225;
    out.m_69.x = _1205;
    out.m_69.y = _1207;
    out.m_69.z = _1233;
    float _1257 = _1255;
    if (_1193)
    {
        _1227 = _1173;
    }
    float _1259 = _1227;
    float _1261 = fma(_1223, _1169, _1235);
    float _1263 = _1259;
    if (_1193)
    {
        _1229 = _1255;
    }
    float _1265 = _1229;
    float _1267 = _1265;
    if (!_1193)
    {
        _1257 = _1171;
    }
    float _1269 = _1257;
    float _1271 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1261);
    if (_1193)
    {
        _1251 = _1259;
    }
    float _1273 = _1251;
    float _1275 = _1273;
    if (!_1193)
    {
        _1263 = _1173;
    }
    float _1277 = _1263;
    float _1279 = _1087 * _1269;
    if (!_1193)
    {
        float _1281 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1267 = _1281;
    }
    float _1283 = _1267;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1073)
    {
        _1241 = _1247;
    }
    float _1287 = _1241;
    if (!_1193)
    {
        float _1289 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1277);
        _1275 = _1289;
    }
    float _1291 = _1275;
    float _1293 = _1085 * _1175;
    float _1295 = _1083 * _1277;
    float _1297 = -_1279;
    float _1299 = fma(_1083, _1175, _1297);
    if (_1193)
    {
        _1253 = _1175;
    }
    float _1301 = _1253;
    float _1303 = -_1293;
    float _1305 = fma(_1087, _1277, _1303);
    float _1307 = -_1295;
    float _1309 = fma(_1085, _1269, _1307);
    float _1311 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = _1299 * _1089;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1321 = _1301;
    if (!_1193)
    {
        float _1323 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1175);
        _1321 = _1323;
    }
    float _1325 = _1321;
    float _1327 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1311);
    float _1329 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1331 = _1305 * _1089;
    float _1333 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1319);
    float _1337 = _1309 * _1089;
    float _1339 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1341 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1327);
    float _1347 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1329);
    float _1349 = fma(_1325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1335);
    float _1351 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1353 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1339);
    float _1355 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1357 = _1249 * _1313;
    float _1359 = _1351 * _1285;
    out.m_71.x = _1345;
    out.m_71.y = _1347;
    out.m_71.z = _1349;
    float _1361 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1119);
    float _1363 = _988 + _962;
    float _1365 = _962 * 0.5;
    float _1367 = _1271 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1371 = _1361 + _1369;
    float _1373 = _1363 * 0.5;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1343);
    float _1377 = _962 + _1371;
    float _1379 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1355);
    float _1383 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1385 = fma(_992, -0.5, _1365);
    float _1387 = _1377 * 0.5;
    float _1389 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1359;
    out.m_73.y = _1357;
    out.m_75.w = _1367;
    out.m_77.x = _1375;
    out.m_77.y = _1379;
    out.m_77.z = _1381;
    out.gl_Position.x = _988;
    out.gl_Position.y = _992;
    out.gl_Position.z = _1371;
    out.gl_Position.w = _962;
    out.m_79.x = _1373;
    out.m_79.y = _1385;
    out.m_79.z = _1387;
    out.m_79.w = _962;
    out.m_45.x = _1389;
    float _1391 = _1383 * _1018;
    float _1393 = -_1383;
    float _1395 = _1393 + 1.0;
    float _1397 = _1029 * _1391;
    float _1399 = _1029 * _1395;
    float _1401 = _1043 * _1391;
    float _1403 = fma(_1039, _1397, _1023);
    float _1405 = fma(_1041, _1397, _1025);
    float _1407 = fma(_1029, _1401, _1027);
    out.m_81.x = _1403;
    out.m_81.y = _1405;
    out.m_81.z = _1407;
    out.m_81.w = _1399;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

