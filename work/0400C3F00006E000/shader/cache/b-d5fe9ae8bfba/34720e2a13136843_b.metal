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
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1645 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_114);
        out.gl_Position.z = _1930;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1999 = as_type<float>(_150);
        out.gl_Position.z = _1999;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _170 = in.m_53.w;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _154;
    if (!_166)
    {
        float _188 = _154 * _154;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_166)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_166;
    float _202 = _198;
    float _204 = _152;
    float _206 = _156;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    out.m_55.w = _168;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.x = _152;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    out.m_57.y = _156;
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_59.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_98);
        float _308 = 1.0 / _306;
        float _310 = _132 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _330 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _332 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _336 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _338 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _350 = _340 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _354 = _342 + _352;
    float _356 = _346 * _346;
    float _358 = fma(_350, _350, _356);
    float _360 = fma(_354, _354, _358);
    float _362 = rsqrt(_360);
    float _364 = _346 * _362;
    float _366 = _350 * _362;
    float _368 = _354 * _362;
    float _370 = -_364;
    float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _346);
    float _374 = -_366;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _378 = -_368;
    float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _382 = _372 * _372;
    float _384 = in.m_53.x;
    float _386 = in.m_53.y;
    float _388 = in.m_53.z;
    float _390 = fma(_376, _376, _382);
    float _392 = fma(_380, _380, _390);
    float _394 = sqrt(_392);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _320);
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _362 * _394;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _322);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _406 * _402;
    float _416 = _410 * _402;
    float _418 = _412 * _402;
    float _420 = _414 * _408;
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _324);
    float _424 = _416 * _396;
    float _426 = _420 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _418 * _422;
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _426);
    float _434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _432);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _434);
    float _440 = _342 + _436;
    float _442 = _340 + _438;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _446 = _440 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _450 = _442 + _448;
    float _452 = _446 * _446;
    float _454 = fma(_450, _450, _452);
    float _456 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _458 = sqrt(_454);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _456);
    float _462 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _460);
    float _464 = _338 + _462;
    bool _466 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _428;
    float _470 = _462;
    float _472 = _418;
    float _474 = _442;
    if (!_466)
    {
        _468 = _442;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_466)
    {
        _470 = _440;
    }
    float _480 = _470;
    float _482 = _480;
    if (!_466)
    {
        _472 = _464;
    }
    float _484 = _472;
    bool _486 = !_466;
    float _488 = _484;
    if (!_486)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _494 = _458 + _492;
        float _496 = rsqrt(_454);
        float _498 = _494 * _490;
        float _500 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = _498 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _502 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _506 + (-1.0);
        float _514 = fma(_510, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _516 = _512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _518 = _496 * _514;
        float _520 = fma(_464, _506, _516);
        float _522 = fma(_450, _518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _524 = fma(_446, _518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _488 = _520;
        _478 = _522;
        _482 = _524;
    }
    float _526 = _488;
    float _528 = _478;
    float _530 = _482;
    float _532 = -_364;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _536 = -_366;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _540 = -_368;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _538 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _542 + _552;
    float _556 = _546 * _546;
    float _558 = fma(_550, _550, _556);
    float _560 = fma(_554, _554, _558);
    float _562 = rsqrt(_560);
    float _564 = sqrt(_560);
    float _566 = _562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _568 = _550 * _566;
    float _570 = _554 * _566;
    float _572 = _568 * _568;
    float _574 = _570 * _570;
    float _576 = _572 + _574;
    float _578 = sqrt(_576);
    bool _580 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578 + _582;
    float _586 = _558;
    float _588 = _576;
    float _590 = _584;
    float _592 = _566;
    float _594 = _568;
    float _596 = _554;
    float _598 = _546;
    float _600 = _550;
    if (_580)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _586 = _602;
    }
    float _604 = _586;
    if (_580)
    {
        float _606 = rsqrt(_576);
        _588 = _606;
    }
    float _608 = _588;
    float _610 = _608;
    if (_580)
    {
        float _612 = _584 * _604;
        _590 = _612;
    }
    float _614 = _590;
    if (_580)
    {
        float _616 = _614 * 0.15915493667125701904296875;
        _474 = _616;
    }
    float _618 = _474;
    float _620 = _604;
    float _622 = _618;
    if (_580)
    {
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        _620 = _626;
    }
    float _628 = _620;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _632 = precise::max(0.0, _630);
    float _634 = _464;
    float _636 = _632;
    if (_580)
    {
        float _638 = _618 * 6.283185482025146484375;
        float _640 = cos(_638);
        _634 = _640;
    }
    float _642 = _634;
    float _644 = -_566;
    float _646 = -_632;
    float _648 = fma(_546, _644, _646);
    if (_580)
    {
        float _650 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _636 = _650;
    }
    float _652 = _636;
    float _654 = _628;
    float _656 = _652;
    if (_580)
    {
        float _658 = fma(_628, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _654 = _658;
    }
    float _660 = _654;
    float _662 = _660;
    float _664 = _642;
    if (_580)
    {
        float _666 = _642 + (-1.0);
        _656 = _666;
    }
    float _668 = _656;
    float _670 = _668;
    if (_580)
    {
        float _672 = _608 * _660;
        _592 = _672;
    }
    float _674 = _592;
    if (!_580)
    {
        _662 = _648;
    }
    float _676 = _662;
    float _678 = _676;
    if (_580)
    {
        float _680 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _680;
    }
    float _682 = _622;
    if (_580)
    {
        float _684 = _568 * _674;
        _594 = _684;
    }
    float _686 = _594;
    if (!_580)
    {
        _670 = _570;
    }
    float _688 = _670;
    float _690 = _688;
    if (_580)
    {
        float _692 = _570 * _674;
        _690 = _692;
    }
    float _694 = _690;
    if (!_580)
    {
        _610 = _572;
    }
    float _696 = _610;
    float _698 = _696;
    if (_580)
    {
        float _700 = fma(_648, _642, _682);
        _678 = _700;
    }
    float _702 = _678;
    if (_580)
    {
        float _704 = _686 * _686;
        _698 = _704;
    }
    float _706 = _698;
    if (!_580)
    {
        _664 = _574;
    }
    float _708 = _664;
    float _710 = _708;
    if (_580)
    {
        float _712 = _694 * _694;
        _710 = _712;
    }
    float _714 = _710;
    float _716 = fma(_702, _702, _706);
    float _718 = _534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = _716 + _714;
    float _722 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _726 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _724);
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = _534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = rsqrt(_720);
    float _734 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _722);
    float _736 = -_728;
    float _738 = _736 + 1.0;
    float _740 = _534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _744 = _534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _748 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = abs(_738);
    float _752 = log2(_750);
    float _754 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _758 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _732 * _702;
    float _770 = _762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = _732 * _686;
    float _774 = _764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _732 * _694;
    float _778 = _746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _780 = _772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _782 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _786 = -_778;
    float _788 = fma(_786, _760, 1.0);
    float _790 = -_780;
    float _792 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[21].y, _790);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _796 = exp2(_784);
    float _798 = _764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _800 = -_776;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[21].z, _792);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _794);
    float _806 = _764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = log2(_788);
    float _814 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = _768 + 1.0;
    float _818 = fma(_810, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _820 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _822 = fma(_810, _818, -0.212114393711090087890625);
    float _824 = 1.0 / _804;
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _798);
    float _828 = -_768;
    float _830 = fma(_796, _816, _828);
    float _832 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _820);
    float _834 = fma(_810, _822, 1.570728778839111328125);
    float _836 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _826);
    float _838 = fma(_830, 0.5, 0.5);
    float _840 = sqrt(_808);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _836);
    float _844 = _812 * 0.693147182464599609375;
    float _846 = _844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _848 = _832 * _824;
    float _850 = _842 * _824;
    float _852 = fma(_848, 0.5, 0.5);
    float _854 = fma(_850, -0.5, 0.5);
    float _856 = _840 * 0.636619746685028076171875;
    float3 _3161 = float3(_852, _854, _846);
    float _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3161, float3(0.0), isnan(_3161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3161, float3(0.0), isnan(_3161)), level(0.0)).x;
    float _860 = -_834;
    float _862 = fma(_856, _860, 1.0);
    float3 _3177 = float3(_852, _854, _846);
    float4 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3177, float3(0.0), isnan(_3177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3177, float3(0.0), isnan(_3177)), level(0.0)).xyzw;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = _865.w;
    float2 _3194 = float2(_862, _838);
    float3 _877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3194, float2(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3194, float2(0.0), isnan(_3194)), level(0.0)).xyz;
    float _879 = _877.x;
    float _881 = _877.y;
    float _883 = _877.z;
    float _885 = in.m_59.w;
    float _887 = -_156;
    float _889 = _887 + 1.0;
    float _891 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _893 = _764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _917 = _915 != 0;
    float _919 = 1.0 / _905;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _921;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _312 + _929;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _939 = _854;
    float _941 = _804;
    float _943 = _832;
    float _945 = _842;
    if (_897)
    {
        float _947 = in.m_59.x;
        _939 = _947;
    }
    float _949 = _939;
    float _951 = 1.0 / _909;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _957 = _885 > 0.5;
    float _959 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _961 = 0.0;
    if (_917)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _967;
    float _971 = 1.0 / _955;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _975 = _312 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _989;
    float _993 = 1.0 / _901;
    float _995 = _975 * _951;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _999 = _312 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1013 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1015 = fma(_987, _995, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1017 = 1.0 / _913;
    float _1019 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1027 = _312 + _1025;
    bool _1029 = false;
    if (_897)
    {
        bool _1031 = _949 > 0.5;
        _1029 = _1031;
    }
    bool _1033 = _1029;
    float _1035 = 1.0 / _923;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1043 = _312 + _1041;
    float _1045 = _1027 * _993;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1049 = _312 + _1047;
    bool _1051 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1053 = isnan(_312);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1043 * _971;
    float _1065 = _999 * _1017;
    float _1067 = 1.0 / _1039;
    float _1069 = _1049 * _919;
    float _1071 = fma(_969, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1073 = fma(_1007, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1075 = fma(_1011, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1077;
    float _1081 = fma(_979, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1083 = _931 * _1035;
    float _1085 = fma(_991, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1087 = _1035;
    float _1089 = _1017;
    if (!_1023)
    {
        float _1091 = in.m_59.y;
        _1087 = _1091;
    }
    float _1093 = _1087;
    int _1095 = _957 ? as_type<int>(_889) : as_type<int>(_156);
    float _1097 = fma(_1003, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1101;
    float _1105 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1107 = _927 ? as_type<float>(_1095) : _156;
    float _1109 = in.m_63.x;
    float _1111 = in.m_63.y;
    float _1113 = in.m_63.z;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1119 = fma(_1103, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1121 = _322 != 0.0;
    bool _1123 = isnan(_322);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1133 = _312 + _1131;
    bool _1135 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1137 = isnan(_312);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1151 = _965 > 0.5;
    bool _1153 = _1151 && _917;
    float _1155 = fma(_1117, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1157 = _320 == 0.0;
    bool _1159 = !_1129;
    bool _1161 = _1157 && _1159;
    float _1163 = _1133 * _1067;
    bool _1165 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1167 = isnan(_312);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = -_1145;
    float _1179 = _1177 + 1.0;
    bool _1181 = _324 == 0.0;
    bool _1183 = _1181 && _1161;
    float _1185 = fma(_1149, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1187 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1189 = isnan(_312);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    int _1199 = as_type<int>(_1149);
    float _1201 = _1197;
    if (_897)
    {
        float _1203 = -_152;
        float _1205 = _1203 + 1.0;
        _1199 = as_type<int>(_1205);
    }
    int _1207 = _1199;
    float _1209 = _1175 * _1179;
    float _1211 = -_1175;
    float _1213 = _1211 + 1.0;
    float _1215 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_897)
    {
        _1089 = _152;
    }
    float _1217 = _1089;
    float _1219 = -_1197;
    float _1221 = _1219 + 1.0;
    float _1223 = _1217;
    if (_897)
    {
        float _1225 = _1033 ? as_type<float>(_1207) : _152;
        _1223 = _1225;
    }
    float _1227 = _1223;
    float _1229 = _1197 * _1213;
    float _1231 = fma(_1215, _1107, -0.5);
    if (!_1023)
    {
        _1201 = _1093;
    }
    float _1233 = _1201;
    float _1235 = -_1061;
    float _1237 = _1235 + 1.0;
    bool _1239 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1241 = isnan(_312);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = 0.0;
    if (!_1023)
    {
        float _1253 = in.m_59.z;
        _1251 = _1253;
    }
    float _1255 = _1251;
    float _1257 = _1061 * _1221;
    float _1259 = _1109;
    float _1261 = _1113;
    float _1263 = _1111;
    if (!_1183)
    {
        float _1265 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1259 = _1265;
    }
    float _1267 = _1259;
    bool _1269 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1271 = isnan(_312);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1233;
    float _1283 = _1093;
    if (_1023)
    {
        float _1285 = in.m_59.x;
        float _1287 = in.m_59.y;
        _1281 = _1285;
        _1283 = _1287;
    }
    float _1289 = _1281;
    float _1291 = _1283;
    float _1293 = _1249 * _1237;
    float _1295 = -_1249;
    float _1297 = _1295 + 1.0;
    if (!_1183)
    {
        float _1299 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1261 = _1299;
    }
    float _1301 = _1261;
    if (!_1183)
    {
        float _1303 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1111);
        _1263 = _1303;
    }
    float _1305 = _1263;
    bool _1307 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1309 = isnan(_312);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1279 * _1297;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = exp2(_891);
    float _1327 = _1317 * _1323;
    bool _1329 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1331 = isnan(_312);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = -_1317;
    float _1343 = _1341 + 1.0;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1349;
    float _1353 = _1339 * _1343;
    float _1355 = fma(_1347, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1357 = fma(_1351, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1359 = _1071 * _1353;
    float _1361 = _1081 * _1353;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1367 = _1347;
    float _1369 = _1255;
    float _1371 = _1363;
    if (!_1023)
    {
        _1367 = _1255;
    }
    float _1373 = _1367;
    float _1375 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    float _1377 = _1373;
    if (_1023)
    {
        _1377 = _1291;
    }
    float _1379 = _1377;
    float _1381 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1023)
    {
        _1369 = _1291;
    }
    float _1383 = _1369;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1387 = _1291 > 0.5;
    float _1389 = -_1339;
    float _1391 = _1389 + 1.0;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_917)
    {
        _1371 = _152;
    }
    float _1395 = _1371;
    float _1397 = _1395;
    if (_1153)
    {
        float _1399 = -_152;
        float _1401 = _1399 + 1.0;
        _204 = _1401;
    }
    float _1403 = _204;
    float _1405 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1359);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1361);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1385);
    float _1411 = -_1393;
    float _1413 = fma(_1381, 2.0, _1411);
    float _1415 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1417 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1421 = fma(_1013, _1327, _1405);
    float _1423 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1415);
    if (_917)
    {
        _1397 = _1403;
    }
    float _1425 = _1397;
    float _1427 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1429 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1419);
    float _1431 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1433 = fma(_1085, _1319, _1421);
    float _1435 = fma(_1015, _1327, _1407);
    float _1437 = fma(_1431, _1425, -0.5);
    float _1439 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1445 = fma(_1073, _1293, _1433);
    float _1447 = fma(_1097, _1319, _1435);
    float _1449 = fma(_1439, -2.0, _1441);
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1409);
    if (_935)
    {
        float _1453 = _1387 ? _889 : _156;
        _206 = _1453;
    }
    float _1455 = _206;
    float _1457 = fma(_1075, _1293, _1447);
    float _1459 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1449);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1465 = -_132;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1469 = fma(_1105, _1257, _1445);
    float _1471 = fma(_1119, _1257, _1457);
    float _1473 = -_1325;
    float _1475 = _1473 + 1.0;
    float _1477 = -_1459;
    float _1479 = fma(_1451, _1231, _1477);
    float _1481 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1483 = fma(_1463, _1437, _1467);
    float _1485 = fma(_1155, _1229, _1469);
    float _1487 = fma(_1185, _1229, _1471);
    float _1489 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1493 = _1481 * _1443;
    float _1495 = _1483 + 0.5;
    float _1497 = _1479 + 0.5;
    float _1499 = _1489 * _1461;
    float _1501 = fma(_1355, _1209, _1485);
    float _1503 = fma(_1357, _1209, _1487);
    float _1505 = _1019 + _804;
    float _1507 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1427);
    float _1509 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1501);
    float _1511 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1503);
    out.m_65.x = _1493;
    out.m_65.y = _1499;
    out.m_65.z = _1495;
    out.m_65.w = _1497;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1423);
    float _1515 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1429);
    float _1517 = _1505 * 0.5;
    out.m_67.x = _1509;
    out.m_67.y = _1511;
    bool _1519 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_564);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_69.z = _1517;
    out.m_69.w = _804;
    out.m_71.x = _1507;
    out.m_71.y = _1513;
    out.m_71.z = _1515;
    float _1529 = -_1491;
    float _1531 = _1529 + 1.0;
    out.m_73.x = _550;
    out.m_73.y = _546;
    out.m_73.z = _554;
    out.gl_Position.x = _832;
    out.gl_Position.y = _842;
    out.gl_Position.z = _1019;
    out.gl_Position.w = _804;
    if (!_1527)
    {
        _596 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _596;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1527)
    {
        _598 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1539 = _598;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1527)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1545 = _600;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1527)
    {
        _941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1551 = _941;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1527)
    {
        _943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1557 = _943;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1527)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1563 = _945;
    float _1565 = _1491 * _858;
    float _1567 = _873 * _1565;
    float _1569 = _873 * _1531;
    float _1571 = _883 * _1565;
    float _1573 = fma(_879, _1567, _867);
    float _1575 = fma(_881, _1567, _869);
    float _1577 = fma(_873, _1571, _871);
    out.m_75.x = _1573;
    out.m_75.y = _1575;
    out.m_75.z = _1577;
    out.m_75.w = _1569;
    bool _1579 = !_1527;
    float _1581 = _1563;
    float _1583 = _1563;
    if (!_1579)
    {
        bool _1585 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_564);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _564 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1625 = _1597 * _1603;
            float _1627 = precise::clamp(_1625, 0.0, 1.0);
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1633 = fma(_1627, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1635 = fma(_1627, _1631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1637 = fma(_1627, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1639 = fma(_1627, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1641 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1643 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1561 = _1635;
            _1543 = _1641;
            _1555 = _1633;
            _1537 = _1639;
            _1583 = _1637;
            _1549 = _1643;
            _1645 = true;
        }
        else
        {
            bool _1647 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1649 = isnan(_564);
            bool _1651 = _1647 || _1649;
            bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1655 = _1651 || _1653;
            if (!_1655)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1657 = _1553;
            _1555 = _1657;
            if (!_1655)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1655)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1661 = _1581;
            _1583 = _1661;
            if (!_1655)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1663 = _1535;
            _1537 = _1663;
            if (!_1655)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1665 = _1541;
            _1543 = _1665;
            if (!_1655)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1667 = _1547;
            bool _1669 = !_1655;
            _1549 = _1667;
            if (!_1669)
            {
                bool _1671 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1673 = isnan(_564);
                bool _1675 = _1671 || _1673;
                bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1679 = _1675 || _1677;
                if (!_1679)
                {
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1683 = _564 + _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1685;
                    float _1689 = 1.0 / _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1711 = _1683 * _1689;
                    float _1713 = precise::clamp(_1711, 0.0, 1.0);
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1719 = fma(_1713, _1693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1721 = fma(_1713, _1717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1723 = fma(_1713, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1725 = fma(_1713, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1727 = fma(_1713, _1705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1729 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1561 = _1721;
                    _1543 = _1727;
                    _1555 = _1719;
                    _1537 = _1725;
                    _1583 = _1723;
                    _1549 = _1729;
                    _1645 = true;
                }
                else
                {
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1645 = false;
    float _1731 = _1561;
    float _1733 = _1543;
    float _1735 = _1555;
    float _1737 = _1537;
    float _1739 = _1583;
    float _1741 = _1549;
    float _1743 = fma(_1513, -0.5, 0.5);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = -_1731;
    float _1749 = _1747 + _1733;
    float _1751 = -_1735;
    float _1753 = _1751 + _1737;
    float _1755 = -_1739;
    float _1757 = _1755 + _1741;
    bool _1759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1761 = fma(_1745, _1749, _1731);
    float _1763 = fma(_1745, _1753, _1735);
    float _1765 = fma(_1745, _1757, _1739);
    float _1767 = _1761 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1769 = fma(_1763, 0.298911988735198974609375, _1767);
    float _1771 = fma(_1765, 0.114477999508380889892578125, _1769);
    float _1773 = -_1771;
    float _1775 = _1763 + _1773;
    float _1777 = -_1771;
    float _1779 = _1761 + _1777;
    float _1781 = -_1771;
    float _1783 = _1765 + _1781;
    float _1785 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1787 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    out.m_47.x = _1785;
    out.m_79.x = _1787;
    out.m_79.y = _1789;
    out.m_79.z = _1791;
    if (!_1759)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1793 = -_534;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1797 = -_538;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1801 = -_542;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1805 = _1795 * _1795;
    float _1807 = fma(_1799, _1799, _1805);
    float _1809 = fma(_1803, _1803, _1807);
    float _1811 = sqrt(_1809);
    float _1813 = rsqrt(_1809);
    float _1815 = -_1811;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = _1799 * _1813;
    float _1825 = _1795 * _1813;
    float _1827 = abs(_1821);
    float _1829 = log2(_1827);
    float _1831 = _1803 * _1813;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1835 = _1513 * _1825;
    float _1837 = -_1825;
    float _1839 = -_1833;
    float _1841 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1839);
    float _1843 = fma(_1507, _1823, _1835);
    float _1845 = -_1831;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1841);
    float _1849 = fma(_1515, _1831, _1843);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1855 = _1847 + _1853;
    float _1857 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = exp2(_1857);
    float _1865 = _1863 * _1861;
    float _1867 = _1851 * _1865;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1869;
    out.m_77.y = _1871;
    out.m_77.z = _1873;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1645 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_114);
        out.gl_Position.z = _1930;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1999 = as_type<float>(_150);
        out.gl_Position.z = _1999;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _170 = in.m_53.w;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _154;
    if (!_166)
    {
        float _188 = _154 * _154;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_166)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_166;
    float _202 = _198;
    float _204 = _152;
    float _206 = _156;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    out.m_55.w = _168;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.x = _152;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    out.m_57.y = _156;
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_59.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_98);
        float _308 = 1.0 / _306;
        float _310 = _132 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _330 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _332 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _336 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _338 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _350 = _340 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _354 = _342 + _352;
    float _356 = _346 * _346;
    float _358 = fma(_350, _350, _356);
    float _360 = fma(_354, _354, _358);
    float _362 = rsqrt(_360);
    float _364 = _346 * _362;
    float _366 = _350 * _362;
    float _368 = _354 * _362;
    float _370 = -_364;
    float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _346);
    float _374 = -_366;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _378 = -_368;
    float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _382 = _372 * _372;
    float _384 = in.m_53.x;
    float _386 = in.m_53.y;
    float _388 = in.m_53.z;
    float _390 = fma(_376, _376, _382);
    float _392 = fma(_380, _380, _390);
    float _394 = sqrt(_392);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _320);
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _362 * _394;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _322);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _406 * _402;
    float _416 = _410 * _402;
    float _418 = _412 * _402;
    float _420 = _414 * _408;
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _324);
    float _424 = _416 * _396;
    float _426 = _420 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _418 * _422;
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _426);
    float _434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _432);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _434);
    float _440 = _342 + _436;
    float _442 = _340 + _438;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _446 = _440 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _450 = _442 + _448;
    float _452 = _446 * _446;
    float _454 = fma(_450, _450, _452);
    float _456 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _458 = sqrt(_454);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _456);
    float _462 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _460);
    float _464 = _338 + _462;
    bool _466 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _428;
    float _470 = _462;
    float _472 = _418;
    float _474 = _442;
    if (!_466)
    {
        _468 = _442;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_466)
    {
        _470 = _440;
    }
    float _480 = _470;
    float _482 = _480;
    if (!_466)
    {
        _472 = _464;
    }
    float _484 = _472;
    bool _486 = !_466;
    float _488 = _484;
    if (!_486)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _494 = _458 + _492;
        float _496 = rsqrt(_454);
        float _498 = _494 * _490;
        float _500 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = _498 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _502 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _506 + (-1.0);
        float _514 = fma(_510, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _516 = _512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _518 = _496 * _514;
        float _520 = fma(_464, _506, _516);
        float _522 = fma(_450, _518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _524 = fma(_446, _518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _488 = _520;
        _478 = _522;
        _482 = _524;
    }
    float _526 = _488;
    float _528 = _478;
    float _530 = _482;
    float _532 = -_364;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _536 = -_366;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _540 = -_368;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _538 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _542 + _552;
    float _556 = _546 * _546;
    float _558 = fma(_550, _550, _556);
    float _560 = fma(_554, _554, _558);
    float _562 = rsqrt(_560);
    float _564 = sqrt(_560);
    float _566 = _562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _568 = _550 * _566;
    float _570 = _554 * _566;
    float _572 = _568 * _568;
    float _574 = _570 * _570;
    float _576 = _572 + _574;
    float _578 = sqrt(_576);
    bool _580 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578 + _582;
    float _586 = _558;
    float _588 = _576;
    float _590 = _584;
    float _592 = _566;
    float _594 = _568;
    float _596 = _554;
    float _598 = _546;
    float _600 = _550;
    if (_580)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _586 = _602;
    }
    float _604 = _586;
    if (_580)
    {
        float _606 = rsqrt(_576);
        _588 = _606;
    }
    float _608 = _588;
    float _610 = _608;
    if (_580)
    {
        float _612 = _584 * _604;
        _590 = _612;
    }
    float _614 = _590;
    if (_580)
    {
        float _616 = _614 * 0.15915493667125701904296875;
        _474 = _616;
    }
    float _618 = _474;
    float _620 = _604;
    float _622 = _618;
    if (_580)
    {
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        _620 = _626;
    }
    float _628 = _620;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _632 = precise::max(0.0, _630);
    float _634 = _464;
    float _636 = _632;
    if (_580)
    {
        float _638 = _618 * 6.283185482025146484375;
        float _640 = cos(_638);
        _634 = _640;
    }
    float _642 = _634;
    float _644 = -_566;
    float _646 = -_632;
    float _648 = fma(_546, _644, _646);
    if (_580)
    {
        float _650 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _636 = _650;
    }
    float _652 = _636;
    float _654 = _628;
    float _656 = _652;
    if (_580)
    {
        float _658 = fma(_628, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _654 = _658;
    }
    float _660 = _654;
    float _662 = _660;
    float _664 = _642;
    if (_580)
    {
        float _666 = _642 + (-1.0);
        _656 = _666;
    }
    float _668 = _656;
    float _670 = _668;
    if (_580)
    {
        float _672 = _608 * _660;
        _592 = _672;
    }
    float _674 = _592;
    if (!_580)
    {
        _662 = _648;
    }
    float _676 = _662;
    float _678 = _676;
    if (_580)
    {
        float _680 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _680;
    }
    float _682 = _622;
    if (_580)
    {
        float _684 = _568 * _674;
        _594 = _684;
    }
    float _686 = _594;
    if (!_580)
    {
        _670 = _570;
    }
    float _688 = _670;
    float _690 = _688;
    if (_580)
    {
        float _692 = _570 * _674;
        _690 = _692;
    }
    float _694 = _690;
    if (!_580)
    {
        _610 = _572;
    }
    float _696 = _610;
    float _698 = _696;
    if (_580)
    {
        float _700 = fma(_648, _642, _682);
        _678 = _700;
    }
    float _702 = _678;
    if (_580)
    {
        float _704 = _686 * _686;
        _698 = _704;
    }
    float _706 = _698;
    if (!_580)
    {
        _664 = _574;
    }
    float _708 = _664;
    float _710 = _708;
    if (_580)
    {
        float _712 = _694 * _694;
        _710 = _712;
    }
    float _714 = _710;
    float _716 = fma(_702, _702, _706);
    float _718 = _534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = _716 + _714;
    float _722 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _726 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _724);
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = _534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = rsqrt(_720);
    float _734 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _722);
    float _736 = -_728;
    float _738 = _736 + 1.0;
    float _740 = _534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _744 = _534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _748 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = abs(_738);
    float _752 = log2(_750);
    float _754 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _758 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _732 * _702;
    float _770 = _762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = _732 * _686;
    float _774 = _764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _732 * _694;
    float _778 = _746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _780 = _772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _782 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _786 = -_778;
    float _788 = fma(_786, _760, 1.0);
    float _790 = -_780;
    float _792 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[21].y, _790);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _796 = exp2(_784);
    float _798 = _764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _800 = -_776;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[21].z, _792);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _794);
    float _806 = _764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = log2(_788);
    float _814 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = _768 + 1.0;
    float _818 = fma(_810, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _820 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _822 = fma(_810, _818, -0.212114393711090087890625);
    float _824 = 1.0 / _804;
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _798);
    float _828 = -_768;
    float _830 = fma(_796, _816, _828);
    float _832 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _820);
    float _834 = fma(_810, _822, 1.570728778839111328125);
    float _836 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _826);
    float _838 = fma(_830, 0.5, 0.5);
    float _840 = sqrt(_808);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _836);
    float _844 = _812 * 0.693147182464599609375;
    float _846 = _844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _848 = _832 * _824;
    float _850 = _842 * _824;
    float _852 = fma(_848, 0.5, 0.5);
    float _854 = fma(_850, -0.5, 0.5);
    float _856 = _840 * 0.636619746685028076171875;
    float3 _3161 = float3(_852, _854, _846);
    float _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3161, float3(0.0), isnan(_3161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3161, float3(0.0), isnan(_3161)), level(0.0)).x;
    float _860 = -_834;
    float _862 = fma(_856, _860, 1.0);
    float3 _3177 = float3(_852, _854, _846);
    float4 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3177, float3(0.0), isnan(_3177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3177, float3(0.0), isnan(_3177)), level(0.0)).xyzw;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = _865.w;
    float2 _3194 = float2(_862, _838);
    float3 _877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3194, float2(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3194, float2(0.0), isnan(_3194)), level(0.0)).xyz;
    float _879 = _877.x;
    float _881 = _877.y;
    float _883 = _877.z;
    float _885 = in.m_59.w;
    float _887 = -_156;
    float _889 = _887 + 1.0;
    float _891 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _893 = _764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _917 = _915 != 0;
    float _919 = 1.0 / _905;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _921;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _312 + _929;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _939 = _854;
    float _941 = _804;
    float _943 = _832;
    float _945 = _842;
    if (_897)
    {
        float _947 = in.m_59.x;
        _939 = _947;
    }
    float _949 = _939;
    float _951 = 1.0 / _909;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _957 = _885 > 0.5;
    float _959 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _961 = 0.0;
    if (_917)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _967;
    float _971 = 1.0 / _955;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _975 = _312 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _989;
    float _993 = 1.0 / _901;
    float _995 = _975 * _951;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _999 = _312 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1013 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1015 = fma(_987, _995, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1017 = 1.0 / _913;
    float _1019 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1027 = _312 + _1025;
    bool _1029 = false;
    if (_897)
    {
        bool _1031 = _949 > 0.5;
        _1029 = _1031;
    }
    bool _1033 = _1029;
    float _1035 = 1.0 / _923;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1043 = _312 + _1041;
    float _1045 = _1027 * _993;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1049 = _312 + _1047;
    bool _1051 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1053 = isnan(_312);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1043 * _971;
    float _1065 = _999 * _1017;
    float _1067 = 1.0 / _1039;
    float _1069 = _1049 * _919;
    float _1071 = fma(_969, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1073 = fma(_1007, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1075 = fma(_1011, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1077;
    float _1081 = fma(_979, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1083 = _931 * _1035;
    float _1085 = fma(_991, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1087 = _1035;
    float _1089 = _1017;
    if (!_1023)
    {
        float _1091 = in.m_59.y;
        _1087 = _1091;
    }
    float _1093 = _1087;
    int _1095 = _957 ? as_type<int>(_889) : as_type<int>(_156);
    float _1097 = fma(_1003, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1101;
    float _1105 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1107 = _927 ? as_type<float>(_1095) : _156;
    float _1109 = in.m_63.x;
    float _1111 = in.m_63.y;
    float _1113 = in.m_63.z;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1119 = fma(_1103, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1121 = _322 != 0.0;
    bool _1123 = isnan(_322);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1133 = _312 + _1131;
    bool _1135 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1137 = isnan(_312);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1151 = _965 > 0.5;
    bool _1153 = _1151 && _917;
    float _1155 = fma(_1117, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1157 = _320 == 0.0;
    bool _1159 = !_1129;
    bool _1161 = _1157 && _1159;
    float _1163 = _1133 * _1067;
    bool _1165 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1167 = isnan(_312);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = -_1145;
    float _1179 = _1177 + 1.0;
    bool _1181 = _324 == 0.0;
    bool _1183 = _1181 && _1161;
    float _1185 = fma(_1149, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1187 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1189 = isnan(_312);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    int _1199 = as_type<int>(_1149);
    float _1201 = _1197;
    if (_897)
    {
        float _1203 = -_152;
        float _1205 = _1203 + 1.0;
        _1199 = as_type<int>(_1205);
    }
    int _1207 = _1199;
    float _1209 = _1175 * _1179;
    float _1211 = -_1175;
    float _1213 = _1211 + 1.0;
    float _1215 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_897)
    {
        _1089 = _152;
    }
    float _1217 = _1089;
    float _1219 = -_1197;
    float _1221 = _1219 + 1.0;
    float _1223 = _1217;
    if (_897)
    {
        float _1225 = _1033 ? as_type<float>(_1207) : _152;
        _1223 = _1225;
    }
    float _1227 = _1223;
    float _1229 = _1197 * _1213;
    float _1231 = fma(_1215, _1107, -0.5);
    if (!_1023)
    {
        _1201 = _1093;
    }
    float _1233 = _1201;
    float _1235 = -_1061;
    float _1237 = _1235 + 1.0;
    bool _1239 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1241 = isnan(_312);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = 0.0;
    if (!_1023)
    {
        float _1253 = in.m_59.z;
        _1251 = _1253;
    }
    float _1255 = _1251;
    float _1257 = _1061 * _1221;
    float _1259 = _1109;
    float _1261 = _1113;
    float _1263 = _1111;
    if (!_1183)
    {
        float _1265 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1259 = _1265;
    }
    float _1267 = _1259;
    bool _1269 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1271 = isnan(_312);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1233;
    float _1283 = _1093;
    if (_1023)
    {
        float _1285 = in.m_59.x;
        float _1287 = in.m_59.y;
        _1281 = _1285;
        _1283 = _1287;
    }
    float _1289 = _1281;
    float _1291 = _1283;
    float _1293 = _1249 * _1237;
    float _1295 = -_1249;
    float _1297 = _1295 + 1.0;
    if (!_1183)
    {
        float _1299 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1261 = _1299;
    }
    float _1301 = _1261;
    if (!_1183)
    {
        float _1303 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1111);
        _1263 = _1303;
    }
    float _1305 = _1263;
    bool _1307 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1309 = isnan(_312);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1279 * _1297;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = exp2(_891);
    float _1327 = _1317 * _1323;
    bool _1329 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1331 = isnan(_312);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = -_1317;
    float _1343 = _1341 + 1.0;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1349;
    float _1353 = _1339 * _1343;
    float _1355 = fma(_1347, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1357 = fma(_1351, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1359 = _1071 * _1353;
    float _1361 = _1081 * _1353;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1367 = _1347;
    float _1369 = _1255;
    float _1371 = _1363;
    if (!_1023)
    {
        _1367 = _1255;
    }
    float _1373 = _1367;
    float _1375 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    float _1377 = _1373;
    if (_1023)
    {
        _1377 = _1291;
    }
    float _1379 = _1377;
    float _1381 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1023)
    {
        _1369 = _1291;
    }
    float _1383 = _1369;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1387 = _1291 > 0.5;
    float _1389 = -_1339;
    float _1391 = _1389 + 1.0;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_917)
    {
        _1371 = _152;
    }
    float _1395 = _1371;
    float _1397 = _1395;
    if (_1153)
    {
        float _1399 = -_152;
        float _1401 = _1399 + 1.0;
        _204 = _1401;
    }
    float _1403 = _204;
    float _1405 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1359);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1361);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1385);
    float _1411 = -_1393;
    float _1413 = fma(_1381, 2.0, _1411);
    float _1415 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1417 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1421 = fma(_1013, _1327, _1405);
    float _1423 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1415);
    if (_917)
    {
        _1397 = _1403;
    }
    float _1425 = _1397;
    float _1427 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1429 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1419);
    float _1431 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1433 = fma(_1085, _1319, _1421);
    float _1435 = fma(_1015, _1327, _1407);
    float _1437 = fma(_1431, _1425, -0.5);
    float _1439 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1445 = fma(_1073, _1293, _1433);
    float _1447 = fma(_1097, _1319, _1435);
    float _1449 = fma(_1439, -2.0, _1441);
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1409);
    if (_935)
    {
        float _1453 = _1387 ? _889 : _156;
        _206 = _1453;
    }
    float _1455 = _206;
    float _1457 = fma(_1075, _1293, _1447);
    float _1459 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1449);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1465 = -_132;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1469 = fma(_1105, _1257, _1445);
    float _1471 = fma(_1119, _1257, _1457);
    float _1473 = -_1325;
    float _1475 = _1473 + 1.0;
    float _1477 = -_1459;
    float _1479 = fma(_1451, _1231, _1477);
    float _1481 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1483 = fma(_1463, _1437, _1467);
    float _1485 = fma(_1155, _1229, _1469);
    float _1487 = fma(_1185, _1229, _1471);
    float _1489 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1493 = _1481 * _1443;
    float _1495 = _1483 + 0.5;
    float _1497 = _1479 + 0.5;
    float _1499 = _1489 * _1461;
    float _1501 = fma(_1355, _1209, _1485);
    float _1503 = fma(_1357, _1209, _1487);
    float _1505 = _1019 + _804;
    float _1507 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1427);
    float _1509 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1501);
    float _1511 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1503);
    out.m_65.x = _1493;
    out.m_65.y = _1499;
    out.m_65.z = _1495;
    out.m_65.w = _1497;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1423);
    float _1515 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1429);
    float _1517 = _1505 * 0.5;
    out.m_67.x = _1509;
    out.m_67.y = _1511;
    bool _1519 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_564);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_69.z = _1517;
    out.m_69.w = _804;
    out.m_71.x = _1507;
    out.m_71.y = _1513;
    out.m_71.z = _1515;
    float _1529 = -_1491;
    float _1531 = _1529 + 1.0;
    out.m_73.x = _550;
    out.m_73.y = _546;
    out.m_73.z = _554;
    out.gl_Position.x = _832;
    out.gl_Position.y = _842;
    out.gl_Position.z = _1019;
    out.gl_Position.w = _804;
    if (!_1527)
    {
        _596 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _596;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1527)
    {
        _598 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1539 = _598;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1527)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1545 = _600;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1527)
    {
        _941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1551 = _941;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1527)
    {
        _943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1557 = _943;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1527)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1563 = _945;
    float _1565 = _1491 * _858;
    float _1567 = _873 * _1565;
    float _1569 = _873 * _1531;
    float _1571 = _883 * _1565;
    float _1573 = fma(_879, _1567, _867);
    float _1575 = fma(_881, _1567, _869);
    float _1577 = fma(_873, _1571, _871);
    out.m_75.x = _1573;
    out.m_75.y = _1575;
    out.m_75.z = _1577;
    out.m_75.w = _1569;
    bool _1579 = !_1527;
    float _1581 = _1563;
    float _1583 = _1563;
    if (!_1579)
    {
        bool _1585 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_564);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _564 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1625 = _1597 * _1603;
            float _1627 = precise::clamp(_1625, 0.0, 1.0);
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1633 = fma(_1627, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1635 = fma(_1627, _1631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1637 = fma(_1627, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1639 = fma(_1627, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1641 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1643 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1561 = _1635;
            _1543 = _1641;
            _1555 = _1633;
            _1537 = _1639;
            _1583 = _1637;
            _1549 = _1643;
            _1645 = true;
        }
        else
        {
            bool _1647 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1649 = isnan(_564);
            bool _1651 = _1647 || _1649;
            bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1655 = _1651 || _1653;
            if (!_1655)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1657 = _1553;
            _1555 = _1657;
            if (!_1655)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1655)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1661 = _1581;
            _1583 = _1661;
            if (!_1655)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1663 = _1535;
            _1537 = _1663;
            if (!_1655)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1665 = _1541;
            _1543 = _1665;
            if (!_1655)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1667 = _1547;
            bool _1669 = !_1655;
            _1549 = _1667;
            if (!_1669)
            {
                bool _1671 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1673 = isnan(_564);
                bool _1675 = _1671 || _1673;
                bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1679 = _1675 || _1677;
                if (!_1679)
                {
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1683 = _564 + _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1685;
                    float _1689 = 1.0 / _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1711 = _1683 * _1689;
                    float _1713 = precise::clamp(_1711, 0.0, 1.0);
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1719 = fma(_1713, _1693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1721 = fma(_1713, _1717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1723 = fma(_1713, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1725 = fma(_1713, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1727 = fma(_1713, _1705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1729 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1561 = _1721;
                    _1543 = _1727;
                    _1555 = _1719;
                    _1537 = _1725;
                    _1583 = _1723;
                    _1549 = _1729;
                    _1645 = true;
                }
                else
                {
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1645 = false;
    float _1731 = _1561;
    float _1733 = _1543;
    float _1735 = _1555;
    float _1737 = _1537;
    float _1739 = _1583;
    float _1741 = _1549;
    float _1743 = fma(_1513, -0.5, 0.5);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = -_1731;
    float _1749 = _1747 + _1733;
    float _1751 = -_1735;
    float _1753 = _1751 + _1737;
    float _1755 = -_1739;
    float _1757 = _1755 + _1741;
    bool _1759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1761 = fma(_1745, _1749, _1731);
    float _1763 = fma(_1745, _1753, _1735);
    float _1765 = fma(_1745, _1757, _1739);
    float _1767 = _1761 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1769 = fma(_1763, 0.298911988735198974609375, _1767);
    float _1771 = fma(_1765, 0.114477999508380889892578125, _1769);
    float _1773 = -_1771;
    float _1775 = _1763 + _1773;
    float _1777 = -_1771;
    float _1779 = _1761 + _1777;
    float _1781 = -_1771;
    float _1783 = _1765 + _1781;
    float _1785 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1787 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    out.m_47.x = _1785;
    out.m_79.x = _1787;
    out.m_79.y = _1789;
    out.m_79.z = _1791;
    if (!_1759)
    {
        return out;
    }
    float _1793 = -_534;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1797 = -_538;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1801 = -_542;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1805 = _1795 * _1795;
    float _1807 = fma(_1799, _1799, _1805);
    float _1809 = fma(_1803, _1803, _1807);
    float _1811 = sqrt(_1809);
    float _1813 = rsqrt(_1809);
    float _1815 = -_1811;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = _1799 * _1813;
    float _1825 = _1795 * _1813;
    float _1827 = abs(_1821);
    float _1829 = log2(_1827);
    float _1831 = _1803 * _1813;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1835 = _1513 * _1825;
    float _1837 = -_1825;
    float _1839 = -_1833;
    float _1841 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1839);
    float _1843 = fma(_1507, _1823, _1835);
    float _1845 = -_1831;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1841);
    float _1849 = fma(_1515, _1831, _1843);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1855 = _1847 + _1853;
    float _1857 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = exp2(_1857);
    float _1865 = _1863 * _1861;
    float _1867 = _1851 * _1865;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1869;
    out.m_77.y = _1871;
    out.m_77.z = _1873;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1645 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_114);
        out.gl_Position.z = _1930;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1999 = as_type<float>(_150);
        out.gl_Position.z = _1999;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _170 = in.m_53.w;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _154;
    if (!_166)
    {
        float _188 = _154 * _154;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_166)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_166;
    float _202 = _198;
    float _204 = _152;
    float _206 = _156;
    if (!_200)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _236;
    }
    float _238 = _202;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _186 = _260;
    }
    float _262 = _186;
    out.m_55.w = _168;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_57.x = _152;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _172, _266);
    float _274 = fma(_262, _174, _268);
    out.m_57.y = _156;
    float _276 = fma(_262, _176, _270);
    float _278 = fma(_272, _170, _178);
    float _280 = fma(_274, _170, _180);
    float _282 = fma(_276, _170, _182);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_59.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[14].x, _132);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_98);
        float _308 = 1.0 / _306;
        float _310 = _132 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _318 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _320 = in.m_61.x;
    float _322 = in.m_61.y;
    float _324 = in.m_61.z;
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _316);
    float _330 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _318);
    float _332 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _336 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _338 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _340 = _334 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _350 = _340 + _348;
    float _352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _354 = _342 + _352;
    float _356 = _346 * _346;
    float _358 = fma(_350, _350, _356);
    float _360 = fma(_354, _354, _358);
    float _362 = rsqrt(_360);
    float _364 = _346 * _362;
    float _366 = _350 * _362;
    float _368 = _354 * _362;
    float _370 = -_364;
    float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _346);
    float _374 = -_366;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _378 = -_368;
    float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _382 = _372 * _372;
    float _384 = in.m_53.x;
    float _386 = in.m_53.y;
    float _388 = in.m_53.z;
    float _390 = fma(_376, _376, _382);
    float _392 = fma(_380, _380, _390);
    float _394 = sqrt(_392);
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _320);
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = _384 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _402 = _362 * _394;
    float _404 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _322);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _406 * _402;
    float _416 = _410 * _402;
    float _418 = _412 * _402;
    float _420 = _414 * _408;
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _324);
    float _424 = _416 * _396;
    float _426 = _420 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _418 * _422;
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[10].x, _426);
    float _434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _432);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _434);
    float _440 = _342 + _436;
    float _442 = _340 + _438;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _446 = _440 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _450 = _442 + _448;
    float _452 = _446 * _446;
    float _454 = fma(_450, _450, _452);
    float _456 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _458 = sqrt(_454);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[9].x, _456);
    float _462 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _460);
    float _464 = _338 + _462;
    bool _466 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = _428;
    float _470 = _462;
    float _472 = _418;
    float _474 = _442;
    if (!_466)
    {
        _468 = _442;
    }
    float _476 = _468;
    float _478 = _476;
    if (!_466)
    {
        _470 = _440;
    }
    float _480 = _470;
    float _482 = _480;
    if (!_466)
    {
        _472 = _464;
    }
    float _484 = _472;
    bool _486 = !_466;
    float _488 = _484;
    if (!_486)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _494 = _458 + _492;
        float _496 = rsqrt(_454);
        float _498 = _494 * _490;
        float _500 = _464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = _498 * 0.15915493667125701904296875;
        float _504 = _502 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _502 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _506 + (-1.0);
        float _514 = fma(_510, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _516 = _512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _518 = _496 * _514;
        float _520 = fma(_464, _506, _516);
        float _522 = fma(_450, _518, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _524 = fma(_446, _518, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _488 = _520;
        _478 = _522;
        _482 = _524;
    }
    float _526 = _488;
    float _528 = _478;
    float _530 = _482;
    float _532 = -_364;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _526);
    float _536 = -_366;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _540 = -_368;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _538 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _542 + _552;
    float _556 = _546 * _546;
    float _558 = fma(_550, _550, _556);
    float _560 = fma(_554, _554, _558);
    float _562 = rsqrt(_560);
    float _564 = sqrt(_560);
    float _566 = _562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _568 = _550 * _566;
    float _570 = _554 * _566;
    float _572 = _568 * _568;
    float _574 = _570 * _570;
    float _576 = _572 + _574;
    float _578 = sqrt(_576);
    bool _580 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578 + _582;
    float _586 = _558;
    float _588 = _576;
    float _590 = _584;
    float _592 = _566;
    float _594 = _568;
    float _596 = _554;
    float _598 = _546;
    float _600 = _550;
    if (_580)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _586 = _602;
    }
    float _604 = _586;
    if (_580)
    {
        float _606 = rsqrt(_576);
        _588 = _606;
    }
    float _608 = _588;
    float _610 = _608;
    if (_580)
    {
        float _612 = _584 * _604;
        _590 = _612;
    }
    float _614 = _590;
    if (_580)
    {
        float _616 = _614 * 0.15915493667125701904296875;
        _474 = _616;
    }
    float _618 = _474;
    float _620 = _604;
    float _622 = _618;
    if (_580)
    {
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        _620 = _626;
    }
    float _628 = _620;
    float _630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _632 = precise::max(0.0, _630);
    float _634 = _464;
    float _636 = _632;
    if (_580)
    {
        float _638 = _618 * 6.283185482025146484375;
        float _640 = cos(_638);
        _634 = _640;
    }
    float _642 = _634;
    float _644 = -_566;
    float _646 = -_632;
    float _648 = fma(_546, _644, _646);
    if (_580)
    {
        float _650 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _636 = _650;
    }
    float _652 = _636;
    float _654 = _628;
    float _656 = _652;
    if (_580)
    {
        float _658 = fma(_628, _652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _654 = _658;
    }
    float _660 = _654;
    float _662 = _660;
    float _664 = _642;
    if (_580)
    {
        float _666 = _642 + (-1.0);
        _656 = _666;
    }
    float _668 = _656;
    float _670 = _668;
    if (_580)
    {
        float _672 = _608 * _660;
        _592 = _672;
    }
    float _674 = _592;
    if (!_580)
    {
        _662 = _648;
    }
    float _676 = _662;
    float _678 = _676;
    if (_580)
    {
        float _680 = _668 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _622 = _680;
    }
    float _682 = _622;
    if (_580)
    {
        float _684 = _568 * _674;
        _594 = _684;
    }
    float _686 = _594;
    if (!_580)
    {
        _670 = _570;
    }
    float _688 = _670;
    float _690 = _688;
    if (_580)
    {
        float _692 = _570 * _674;
        _690 = _692;
    }
    float _694 = _690;
    if (!_580)
    {
        _610 = _572;
    }
    float _696 = _610;
    float _698 = _696;
    if (_580)
    {
        float _700 = fma(_648, _642, _682);
        _678 = _700;
    }
    float _702 = _678;
    if (_580)
    {
        float _704 = _686 * _686;
        _698 = _704;
    }
    float _706 = _698;
    if (!_580)
    {
        _664 = _574;
    }
    float _708 = _664;
    float _710 = _708;
    if (_580)
    {
        float _712 = _694 * _694;
        _710 = _712;
    }
    float _714 = _710;
    float _716 = fma(_702, _702, _706);
    float _718 = _534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = _716 + _714;
    float _722 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _726 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _724);
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = _534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = rsqrt(_720);
    float _734 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _722);
    float _736 = -_728;
    float _738 = _736 + 1.0;
    float _740 = _534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _744 = _534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _748 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = abs(_738);
    float _752 = log2(_750);
    float _754 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _756 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _742);
    float _758 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _762 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _754);
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _732 * _702;
    float _770 = _762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = _732 * _686;
    float _774 = _764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _732 * _694;
    float _778 = _746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _780 = _772 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _782 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _786 = -_778;
    float _788 = fma(_786, _760, 1.0);
    float _790 = -_780;
    float _792 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[21].y, _790);
    float _794 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _796 = exp2(_784);
    float _798 = _764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _800 = -_776;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[21].z, _792);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _794);
    float _806 = _764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = log2(_788);
    float _814 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _806);
    float _816 = _768 + 1.0;
    float _818 = fma(_810, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _820 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _814);
    float _822 = fma(_810, _818, -0.212114393711090087890625);
    float _824 = 1.0 / _804;
    float _826 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _798);
    float _828 = -_768;
    float _830 = fma(_796, _816, _828);
    float _832 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _820);
    float _834 = fma(_810, _822, 1.570728778839111328125);
    float _836 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _826);
    float _838 = fma(_830, 0.5, 0.5);
    float _840 = sqrt(_808);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _836);
    float _844 = _812 * 0.693147182464599609375;
    float _846 = _844 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _848 = _832 * _824;
    float _850 = _842 * _824;
    float _852 = fma(_848, 0.5, 0.5);
    float _854 = fma(_850, -0.5, 0.5);
    float _856 = _840 * 0.636619746685028076171875;
    float3 _3161 = float3(_852, _854, _846);
    float _858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3161, float3(0.0), isnan(_3161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3161, float3(0.0), isnan(_3161)), level(0.0)).x;
    float _860 = -_834;
    float _862 = fma(_856, _860, 1.0);
    float3 _3177 = float3(_852, _854, _846);
    float4 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3177, float3(0.0), isnan(_3177)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3177, float3(0.0), isnan(_3177)), level(0.0)).xyzw;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = _865.w;
    float2 _3194 = float2(_862, _838);
    float3 _877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3194, float2(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3194, float2(0.0), isnan(_3194)), level(0.0)).xyz;
    float _879 = _877.x;
    float _881 = _877.y;
    float _883 = _877.z;
    float _885 = in.m_59.w;
    float _887 = -_156;
    float _889 = _887 + 1.0;
    float _891 = _752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _893 = _764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _897 = _895 != 0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _917 = _915 != 0;
    float _919 = 1.0 / _905;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _921;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _927 = _925 != 0;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _312 + _929;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _939 = _854;
    float _941 = _804;
    float _943 = _832;
    float _945 = _842;
    if (_897)
    {
        float _947 = in.m_59.x;
        _939 = _947;
    }
    float _949 = _939;
    float _951 = 1.0 / _909;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _957 = _885 > 0.5;
    float _959 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _937);
    float _961 = 0.0;
    if (_917)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _967;
    float _971 = 1.0 / _955;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _975 = _312 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _977;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _989;
    float _993 = 1.0 / _901;
    float _995 = _975 * _951;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _999 = _312 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1013 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1015 = fma(_987, _995, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1017 = 1.0 / _913;
    float _1019 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _959);
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1027 = _312 + _1025;
    bool _1029 = false;
    if (_897)
    {
        bool _1031 = _949 > 0.5;
        _1029 = _1031;
    }
    bool _1033 = _1029;
    float _1035 = 1.0 / _923;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1043 = _312 + _1041;
    float _1045 = _1027 * _993;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1049 = _312 + _1047;
    bool _1051 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1053 = isnan(_312);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1043 * _971;
    float _1065 = _999 * _1017;
    float _1067 = 1.0 / _1039;
    float _1069 = _1049 * _919;
    float _1071 = fma(_969, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1073 = fma(_1007, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1075 = fma(_1011, _1065, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1077;
    float _1081 = fma(_979, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1083 = _931 * _1035;
    float _1085 = fma(_991, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1087 = _1035;
    float _1089 = _1017;
    if (!_1023)
    {
        float _1091 = in.m_59.y;
        _1087 = _1091;
    }
    float _1093 = _1087;
    int _1095 = _957 ? as_type<int>(_889) : as_type<int>(_156);
    float _1097 = fma(_1003, _1069, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1101;
    float _1105 = fma(_1079, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1107 = _927 ? as_type<float>(_1095) : _156;
    float _1109 = in.m_63.x;
    float _1111 = in.m_63.y;
    float _1113 = in.m_63.z;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1119 = fma(_1103, _1083, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1121 = _322 != 0.0;
    bool _1123 = isnan(_322);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1133 = _312 + _1131;
    bool _1135 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1137 = isnan(_312);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1151 = _965 > 0.5;
    bool _1153 = _1151 && _917;
    float _1155 = fma(_1117, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1157 = _320 == 0.0;
    bool _1159 = !_1129;
    bool _1161 = _1157 && _1159;
    float _1163 = _1133 * _1067;
    bool _1165 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1167 = isnan(_312);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1173 = _1169 || _1171;
    float _1175 = float(_1173);
    float _1177 = -_1145;
    float _1179 = _1177 + 1.0;
    bool _1181 = _324 == 0.0;
    bool _1183 = _1181 && _1161;
    float _1185 = fma(_1149, _1063, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1187 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1189 = isnan(_312);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1195 = _1191 || _1193;
    float _1197 = float(_1195);
    int _1199 = as_type<int>(_1149);
    float _1201 = _1197;
    if (_897)
    {
        float _1203 = -_152;
        float _1205 = _1203 + 1.0;
        _1199 = as_type<int>(_1205);
    }
    int _1207 = _1199;
    float _1209 = _1175 * _1179;
    float _1211 = -_1175;
    float _1213 = _1211 + 1.0;
    float _1215 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_897)
    {
        _1089 = _152;
    }
    float _1217 = _1089;
    float _1219 = -_1197;
    float _1221 = _1219 + 1.0;
    float _1223 = _1217;
    if (_897)
    {
        float _1225 = _1033 ? as_type<float>(_1207) : _152;
        _1223 = _1225;
    }
    float _1227 = _1223;
    float _1229 = _1197 * _1213;
    float _1231 = fma(_1215, _1107, -0.5);
    if (!_1023)
    {
        _1201 = _1093;
    }
    float _1233 = _1201;
    float _1235 = -_1061;
    float _1237 = _1235 + 1.0;
    bool _1239 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1241 = isnan(_312);
    bool _1243 = _1239 || _1241;
    bool _1245 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1247 = _1243 || _1245;
    float _1249 = float(_1247);
    float _1251 = 0.0;
    if (!_1023)
    {
        float _1253 = in.m_59.z;
        _1251 = _1253;
    }
    float _1255 = _1251;
    float _1257 = _1061 * _1221;
    float _1259 = _1109;
    float _1261 = _1113;
    float _1263 = _1111;
    if (!_1183)
    {
        float _1265 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1109);
        _1259 = _1265;
    }
    float _1267 = _1259;
    bool _1269 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1271 = isnan(_312);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1233;
    float _1283 = _1093;
    if (_1023)
    {
        float _1285 = in.m_59.x;
        float _1287 = in.m_59.y;
        _1281 = _1285;
        _1283 = _1287;
    }
    float _1289 = _1281;
    float _1291 = _1283;
    float _1293 = _1249 * _1237;
    float _1295 = -_1249;
    float _1297 = _1295 + 1.0;
    if (!_1183)
    {
        float _1299 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1113);
        _1261 = _1299;
    }
    float _1301 = _1261;
    if (!_1183)
    {
        float _1303 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1111);
        _1263 = _1303;
    }
    float _1305 = _1263;
    bool _1307 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1309 = isnan(_312);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1279 * _1297;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = exp2(_891);
    float _1327 = _1317 * _1323;
    bool _1329 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1331 = isnan(_312);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1337 = _1333 || _1335;
    float _1339 = float(_1337);
    float _1341 = -_1317;
    float _1343 = _1341 + 1.0;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1349;
    float _1353 = _1339 * _1343;
    float _1355 = fma(_1347, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1357 = fma(_1351, _1163, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1359 = _1071 * _1353;
    float _1361 = _1081 * _1353;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1367 = _1347;
    float _1369 = _1255;
    float _1371 = _1363;
    if (!_1023)
    {
        _1367 = _1255;
    }
    float _1373 = _1367;
    float _1375 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    float _1377 = _1373;
    if (_1023)
    {
        _1377 = _1291;
    }
    float _1379 = _1377;
    float _1381 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1023)
    {
        _1369 = _1291;
    }
    float _1383 = _1369;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1387 = _1291 > 0.5;
    float _1389 = -_1339;
    float _1391 = _1389 + 1.0;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_917)
    {
        _1371 = _152;
    }
    float _1395 = _1371;
    float _1397 = _1395;
    if (_1153)
    {
        float _1399 = -_152;
        float _1401 = _1399 + 1.0;
        _204 = _1401;
    }
    float _1403 = _204;
    float _1405 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1359);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1361);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1385);
    float _1411 = -_1393;
    float _1413 = fma(_1381, 2.0, _1411);
    float _1415 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1417 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1421 = fma(_1013, _1327, _1405);
    float _1423 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1415);
    if (_917)
    {
        _1397 = _1403;
    }
    float _1425 = _1397;
    float _1427 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1429 = fma(_1267, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1419);
    float _1431 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1433 = fma(_1085, _1319, _1421);
    float _1435 = fma(_1015, _1327, _1407);
    float _1437 = fma(_1431, _1425, -0.5);
    float _1439 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1445 = fma(_1073, _1293, _1433);
    float _1447 = fma(_1097, _1319, _1435);
    float _1449 = fma(_1439, -2.0, _1441);
    float _1451 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1409);
    if (_935)
    {
        float _1453 = _1387 ? _889 : _156;
        _206 = _1453;
    }
    float _1455 = _206;
    float _1457 = fma(_1075, _1293, _1447);
    float _1459 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1449);
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1375);
    float _1465 = -_132;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1469 = fma(_1105, _1257, _1445);
    float _1471 = fma(_1119, _1257, _1457);
    float _1473 = -_1325;
    float _1475 = _1473 + 1.0;
    float _1477 = -_1459;
    float _1479 = fma(_1451, _1231, _1477);
    float _1481 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1483 = fma(_1463, _1437, _1467);
    float _1485 = fma(_1155, _1229, _1469);
    float _1487 = fma(_1185, _1229, _1471);
    float _1489 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1493 = _1481 * _1443;
    float _1495 = _1483 + 0.5;
    float _1497 = _1479 + 0.5;
    float _1499 = _1489 * _1461;
    float _1501 = fma(_1355, _1209, _1485);
    float _1503 = fma(_1357, _1209, _1487);
    float _1505 = _1019 + _804;
    float _1507 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1427);
    float _1509 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1501);
    float _1511 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1503);
    out.m_65.x = _1493;
    out.m_65.y = _1499;
    out.m_65.z = _1495;
    out.m_65.w = _1497;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1423);
    float _1515 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1429);
    float _1517 = _1505 * 0.5;
    out.m_67.x = _1509;
    out.m_67.y = _1511;
    bool _1519 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_564);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_69.z = _1517;
    out.m_69.w = _804;
    out.m_71.x = _1507;
    out.m_71.y = _1513;
    out.m_71.z = _1515;
    float _1529 = -_1491;
    float _1531 = _1529 + 1.0;
    out.m_73.x = _550;
    out.m_73.y = _546;
    out.m_73.z = _554;
    out.gl_Position.x = _832;
    out.gl_Position.y = _842;
    out.gl_Position.z = _1019;
    out.gl_Position.w = _804;
    if (!_1527)
    {
        _596 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _596;
    float _1535 = _1533;
    float _1537 = _1533;
    if (!_1527)
    {
        _598 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1539 = _598;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1527)
    {
        _600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1545 = _600;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1527)
    {
        _941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1551 = _941;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1527)
    {
        _943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1557 = _943;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1527)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1563 = _945;
    float _1565 = _1491 * _858;
    float _1567 = _873 * _1565;
    float _1569 = _873 * _1531;
    float _1571 = _883 * _1565;
    float _1573 = fma(_879, _1567, _867);
    float _1575 = fma(_881, _1567, _869);
    float _1577 = fma(_873, _1571, _871);
    out.m_75.x = _1573;
    out.m_75.y = _1575;
    out.m_75.z = _1577;
    out.m_75.w = _1569;
    bool _1579 = !_1527;
    float _1581 = _1563;
    float _1583 = _1563;
    if (!_1579)
    {
        bool _1585 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_564);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _564 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1625 = _1597 * _1603;
            float _1627 = precise::clamp(_1625, 0.0, 1.0);
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1633 = fma(_1627, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1635 = fma(_1627, _1631, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1637 = fma(_1627, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1639 = fma(_1627, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1641 = fma(_1627, _1619, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1643 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1561 = _1635;
            _1543 = _1641;
            _1555 = _1633;
            _1537 = _1639;
            _1583 = _1637;
            _1549 = _1643;
            _1645 = true;
        }
        else
        {
            bool _1647 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1649 = isnan(_564);
            bool _1651 = _1647 || _1649;
            bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1655 = _1651 || _1653;
            if (!_1655)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1657 = _1553;
            _1555 = _1657;
            if (!_1655)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1655)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1661 = _1581;
            _1583 = _1661;
            if (!_1655)
            {
                _1535 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1663 = _1535;
            _1537 = _1663;
            if (!_1655)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1665 = _1541;
            _1543 = _1665;
            if (!_1655)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1667 = _1547;
            bool _1669 = !_1655;
            _1549 = _1667;
            if (!_1669)
            {
                bool _1671 = _564 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1673 = isnan(_564);
                bool _1675 = _1671 || _1673;
                bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1679 = _1675 || _1677;
                if (!_1679)
                {
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1683 = _564 + _1681;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1685;
                    float _1689 = 1.0 / _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1711 = _1683 * _1689;
                    float _1713 = precise::clamp(_1711, 0.0, 1.0);
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1719 = fma(_1713, _1693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1721 = fma(_1713, _1717, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1723 = fma(_1713, _1697, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1725 = fma(_1713, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1727 = fma(_1713, _1705, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1729 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1561 = _1721;
                    _1543 = _1727;
                    _1555 = _1719;
                    _1537 = _1725;
                    _1583 = _1723;
                    _1549 = _1729;
                    _1645 = true;
                }
                else
                {
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1537 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1645 = false;
    float _1731 = _1561;
    float _1733 = _1543;
    float _1735 = _1555;
    float _1737 = _1537;
    float _1739 = _1583;
    float _1741 = _1549;
    float _1743 = fma(_1513, -0.5, 0.5);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = -_1731;
    float _1749 = _1747 + _1733;
    float _1751 = -_1735;
    float _1753 = _1751 + _1737;
    float _1755 = -_1739;
    float _1757 = _1755 + _1741;
    bool _1759 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1761 = fma(_1745, _1749, _1731);
    float _1763 = fma(_1745, _1753, _1735);
    float _1765 = fma(_1745, _1757, _1739);
    float _1767 = _1761 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1769 = fma(_1763, 0.298911988735198974609375, _1767);
    float _1771 = fma(_1765, 0.114477999508380889892578125, _1769);
    float _1773 = -_1771;
    float _1775 = _1763 + _1773;
    float _1777 = -_1771;
    float _1779 = _1761 + _1777;
    float _1781 = -_1771;
    float _1783 = _1765 + _1781;
    float _1785 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1787 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1771);
    out.m_47.x = _1785;
    out.m_79.x = _1787;
    out.m_79.y = _1789;
    out.m_79.z = _1791;
    if (!_1759)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1793 = -_534;
    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1797 = -_538;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1801 = -_542;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1805 = _1795 * _1795;
    float _1807 = fma(_1799, _1799, _1805);
    float _1809 = fma(_1803, _1803, _1807);
    float _1811 = sqrt(_1809);
    float _1813 = rsqrt(_1809);
    float _1815 = -_1811;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = _1799 * _1813;
    float _1825 = _1795 * _1813;
    float _1827 = abs(_1821);
    float _1829 = log2(_1827);
    float _1831 = _1803 * _1813;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1835 = _1513 * _1825;
    float _1837 = -_1825;
    float _1839 = -_1833;
    float _1841 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1839);
    float _1843 = fma(_1507, _1823, _1835);
    float _1845 = -_1831;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1841);
    float _1849 = fma(_1515, _1831, _1843);
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1855 = _1847 + _1853;
    float _1857 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1859 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = exp2(_1857);
    float _1865 = _1863 * _1861;
    float _1867 = _1851 * _1865;
    float _1869 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1873 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1869;
    out.m_77.y = _1871;
    out.m_77.z = _1873;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

