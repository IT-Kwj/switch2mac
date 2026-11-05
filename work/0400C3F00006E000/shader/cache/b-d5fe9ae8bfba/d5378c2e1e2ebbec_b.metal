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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1845 = as_type<float>(_124);
        out.gl_Position.z = _1845;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1915 = as_type<float>(_162);
        out.gl_Position.z = _1915;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _184 = _182 != 0;
    bool _186 = !_180;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _164 * 2.0;
    float _194 = floor(_192);
    float _196 = _166 * 2.0;
    float _198 = _168 * 2.0;
    float _200 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = -_170;
    float _204 = fma(_200, 2.0, _202);
    float _206 = floor(_196);
    float _208 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _168 + _164;
    float _212 = _168 + _166;
    float _214 = -_142;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[76].x, _204);
    float _218 = fma(_208, -2.0, _172);
    float _220 = _210 + (-1.0);
    float _222 = floor(_198);
    bool _224 = _194 > 0.0;
    float _226 = _212 + (-1.0);
    bool _228 = _194 >= 0.0;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _218);
    int _242 = _236 ? 0 : 1;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    bool _248 = _206 > 0.0;
    bool _250 = _206 >= 0.0;
    bool _252 = isnan(_206);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_242;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    int _268 = _266;
    if (!_224)
    {
        int _270 = ~_242;
        int _272 = _270 + 1;
        _268 = _272;
    }
    int _274 = _268;
    int _276 = _258 ? 0 : 1;
    bool _278 = _222 > 0.0;
    bool _280 = _222 >= 0.0;
    bool _282 = isnan(_222);
    bool _284 = _280 || _282;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = !_176;
    int _292 = _290 ? 0 : 1;
    float _294 = _246 * _142;
    float _296 = float(_274);
    int _298 = ~_276;
    int _300 = _298 + 1;
    int _302 = _300 + 1;
    float _304 = in.m_55.x;
    float _306 = in.m_55.y;
    float _308 = in.m_55.z;
    int _310 = _302;
    if (!_248)
    {
        int _312 = ~_276;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = exp2(_294);
    int _320 = abs(_292);
    bool _322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _324 = isnan(1.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _330 = _326 || _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    float _336 = float(_320);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _342 = 1.0 / _334;
    float _344 = float(_316);
    float _346 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    float _348 = _336 * _296;
    bool _350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _358 = _354 || _356;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = float(_190);
    float _366 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _340);
    float _368 = _348 * (-2.0);
    int _370 = _288 ? 0 : 1;
    float _372 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _346);
    float _374 = _358 ? _362 : 0.0;
    float _376 = _364 * _344;
    float _378 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _366);
    float _380 = _166 + (-0.5);
    float _382 = fma(_368, _304, _304);
    bool _384 = !_184;
    int _386 = _384 ? 0 : 1;
    if (_330)
    {
        float _388 = _374 * _342;
        _144 = _388;
    }
    float _390 = _144;
    float _392 = fma(_260, _368, _260);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[196].x, _382);
    int _396 = abs(_386);
    float _398 = _376 * (-2.0);
    int _400 = ~_370;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = fma(_392, _390, _394);
    int _408 = _404;
    if (!_278)
    {
        int _410 = ~_370;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _168 + (-0.5);
    float _418 = float(_396);
    float _420 = fma(_398, _306, _306);
    float _422 = float(_414);
    float _424 = fma(_238, _398, _238);
    float _426 = _164 + _166;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _420);
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = _418 * _422;
    float _438 = _426 + (-1.0);
    float _440 = fma(_424, _390, _428);
    float _442 = _436 * (-2.0);
    float _444 = _406 * 0.15915493667125701904296875;
    float _446 = _164 + (-0.5);
    float _448 = _440 * 0.15915493667125701904296875;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _452 = fma(_442, _308, _308);
    float _454 = in.m_59.x;
    float _456 = in.m_59.y;
    float _458 = in.m_59.z;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = fma(_450, _442, _450);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _452);
    float _468 = fma(_464, _390, _466);
    float _470 = _444 * 6.283185482025146484375;
    float _472 = cos(_470);
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = in.m_46.x;
    float _478 = in.m_46.y;
    float _480 = in.m_46.z;
    float _482 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = _448 * 6.283185482025146484375;
    float _490 = sin(_488);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _454);
    float _494 = _448 * 6.283185482025146484375;
    float _496 = cos(_494);
    float _498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _456);
    float _500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _458);
    float _502 = _474 * 6.283185482025146484375;
    float _504 = cos(_502);
    float _506 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _508 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _510 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = _472 * _490;
    float _514 = _492 * _506;
    float _516 = _498 * _508;
    float _518 = _462 * _490;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = _462 * _496;
    float _526 = _472 * _496;
    float _528 = _500 * _510;
    float _530 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _532 = _472 * _504;
    float _534 = _496 * _504;
    float _536 = _462 * _504;
    float _538 = _490 * _504;
    float _540 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
    float _542 = _536 * _516;
    float _544 = -_512;
    float _546 = fma(_522, _524, _544);
    float _548 = -_524;
    float _550 = fma(_522, _512, _548);
    float _552 = fma(_522, _526, _518);
    float _554 = _532 * _516;
    float _556 = fma(_522, _518, _526);
    float _558 = -_516;
    float _560 = _522 * _558;
    float _562 = fma(_546, _514, _542);
    float _564 = fma(_552, _514, _554);
    float _566 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = fma(_534, _514, _560);
    float _570 = fma(_556, _528, _562);
    float _572 = fma(_550, _528, _564);
    float _574 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _576 = fma(_538, _528, _568);
    float _578 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _580 = _572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _586 = _578 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _592 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _598 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _600 = _572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _602 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _604 = _586 + _596;
    float _606 = _592 + _598;
    float _608 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _600);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _614 = _604 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _618 = _606 + _616;
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _614 * _614;
    float _626 = _622 + _620;
    float _628 = fma(_618, _618, _624);
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = 0.0;
    float _636 = _606;
    float _638 = _604;
    float _640 = _578;
    float _642 = _628;
    float _644 = _626;
    if (!_632)
    {
        _634 = _626;
    }
    float _646 = _634;
    bool _648 = !_632;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _630 + _654;
        float _658 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = _656 * _652;
        float _662 = rsqrt(_628);
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = cos(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        float _674 = _668 + (-1.0);
        float _676 = fma(_672, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _678 = _674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _680 = _662 * _676;
        float _682 = fma(_626, _668, _678);
        float _684 = fma(_618, _680, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _686 = fma(_614, _680, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _650 = _682;
        _636 = _684;
        _638 = _686;
        _640 = _664;
    }
    float _688 = _650;
    float _690 = _636;
    float _692 = _638;
    float _694 = _640;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _702 = _690 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _706 = _692 + _704;
    float _708 = _698 * _698;
    float _710 = fma(_702, _702, _708);
    float _712 = fma(_706, _706, _710);
    float _714 = rsqrt(_712);
    float _716 = sqrt(_712);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = _720 * _720;
    float _726 = _722 * _722;
    float _728 = _724 + _726;
    float _730 = sqrt(_728);
    bool _732 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _736 = _730 + _734;
    float _738 = _576;
    float _740 = _728;
    float _742 = _736;
    float _744 = _718;
    float _746 = _702;
    if (_732)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _748;
    }
    float _750 = _738;
    if (_732)
    {
        float _752 = rsqrt(_728);
        _740 = _752;
    }
    float _754 = _740;
    float _756 = _754;
    if (_732)
    {
        float _758 = _736 * _750;
        _742 = _758;
    }
    float _760 = _742;
    if (_732)
    {
        float _762 = _760 * 0.15915493667125701904296875;
        _642 = _762;
    }
    float _764 = _642;
    float _766 = _694;
    if (_732)
    {
        float _768 = _764 * 6.283185482025146484375;
        float _770 = sin(_768);
        _766 = _770;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _776 = precise::max(0.0, _774);
    float _778 = _608;
    float _780 = _776;
    float _782 = _774;
    if (_732)
    {
        float _784 = _764 * 6.283185482025146484375;
        float _786 = cos(_784);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = -_718;
    float _792 = -_776;
    float _794 = fma(_698, _790, _792);
    float _796 = _794;
    if (_732)
    {
        float _798 = _794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _798;
    }
    float _800 = _780;
    float _802 = _772;
    float _804 = _800;
    if (_732)
    {
        float _806 = fma(_772, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _644 = _806;
    }
    float _808 = _644;
    float _810 = _808;
    if (!_732)
    {
        _802 = _720;
    }
    float _812 = _802;
    float _814 = _812;
    float _816 = _788;
    if (_732)
    {
        float _818 = _788 + (-1.0);
        _782 = _818;
    }
    float _820 = _782;
    if (_732)
    {
        float _822 = _754 * _808;
        _744 = _822;
    }
    float _824 = _744;
    if (!_732)
    {
        _756 = _722;
    }
    float _826 = _756;
    float _828 = _826;
    if (_732)
    {
        float _830 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _830;
    }
    float _832 = _804;
    if (_732)
    {
        float _834 = _720 * _824;
        _814 = _834;
    }
    float _836 = _814;
    if (_732)
    {
        float _838 = _722 * _824;
        _828 = _838;
    }
    float _840 = _828;
    if (!_732)
    {
        _810 = _726;
    }
    float _842 = _810;
    float _844 = _842;
    if (_732)
    {
        float _846 = fma(_794, _788, _832);
        _796 = _846;
    }
    float _848 = _796;
    if (!_732)
    {
        _816 = _724;
    }
    float _850 = _816;
    float _852 = _850;
    if (_732)
    {
        float _854 = _836 * _836;
        _852 = _854;
    }
    float _856 = _852;
    if (_732)
    {
        float _858 = _840 * _840;
        _844 = _858;
    }
    float _860 = _844;
    float _862 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _864 = fma(_848, _848, _856);
    float _866 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _862);
    float _870 = _864 + _860;
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _876 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _874);
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _872);
    float _884 = rsqrt(_870);
    float _886 = -_878;
    float _888 = _886 + 1.0;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _880);
    float _896 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _898 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _900 = abs(_888);
    float _902 = log2(_900);
    float _904 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _906 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _908 = -_898;
    float _910 = fma(_908, _890, 1.0);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _868);
    float _918 = _884 * _836;
    float _920 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _912);
    float _922 = _884 * _848;
    float _924 = floor(_896);
    float _926 = _918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _928 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _920);
    float _930 = _884 * _840;
    float _932 = _916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = -_926;
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _934);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = floor(_906);
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _936);
    float _948 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _956 = log2(_910);
    float _958 = -_924;
    float _960 = _896 + _958;
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _966 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _968 = _922 + 1.0;
    float _970 = exp2(_948);
    float _972 = fma(_946, -0.5, 0.5);
    float _974 = fma(_946, 0.5, 0.5);
    float _976 = -_942;
    float _978 = _906 + _976;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _952);
    float _982 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _966);
    float _984 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _986 = sqrt(_972);
    float _988 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _980);
    float _990 = fma(_974, _984, -0.212114393711090087890625);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _994 = _956 * 0.693147182464599609375;
    float _996 = 1.0 / _964;
    float _998 = -_922;
    float _1000 = fma(_970, _968, _998);
    float _1002 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1004 = fma(_974, _990, 1.570728778839111328125);
    float2 _3252 = float2(_960, _978);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3252, float2(0.0), isnan(_3252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3252, float2(0.0), isnan(_3252)), level(0.0)).x;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = fma(_1000, 0.5, 0.5);
    float _1012 = _986 * 0.636619746685028076171875;
    float _1014 = -_1004;
    float _1016 = fma(_1012, _1014, 1.0);
    float _1018 = _992 * _996;
    float _1020 = _1002 * _996;
    float _1022 = fma(_1018, 0.5, 0.5);
    float _1024 = fma(_1020, -0.5, 0.5);
    float3 _3287 = float3(_1022, _1024, _1008);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).x;
    float3 _3298 = float3(_1022, _1024, _1008);
    float4 _1029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3298, float3(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3298, float3(0.0), isnan(_3298)), level(0.0)).xyzw;
    float _1031 = _1029.x;
    float _1033 = _1029.y;
    float _1035 = _1029.z;
    float _1037 = _1029.w;
    float2 _3314 = float2(_1016, _1010);
    float3 _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).xyz;
    float _1043 = _1041.x;
    float _1045 = _1041.y;
    float _1047 = _1041.z;
    float _1049 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1051 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1053 = in.m_61.x;
    float _1055 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1049);
    float _1057 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1051);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1061 = _1059 != 0;
    float _1063 = in.m_63.z;
    float _1065 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1067 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    bool _1069 = _168 > 0.5;
    float _1071 = in.m_61.y;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1077 = in.m_63.x;
    float _1079 = 1.0 / _1073;
    float _1081 = _1075 + _1073;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _1065;
    float _1089 = _964;
    float _1091 = _1002;
    if (_1061)
    {
        float _1093 = in.m_53.x;
        _1087 = _1093;
    }
    float _1095 = _1087;
    float _1097 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1099 = in.m_63.y;
    float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1103 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1105 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1097);
    float _1107 = in.m_63.w;
    float _1109 = _1081 * _1079;
    float _1111 = _1109 * 0.5;
    float _1113 = _1079;
    float _1115 = _1053;
    if (_1061)
    {
        _1113 = _1053;
    }
    float _1117 = _1113;
    out.m_65.z = _1063;
    float _1119 = -_1071;
    float _1121 = _1119 + 1.0;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1123);
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1129 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1105);
    out.m_65.x = _1077;
    float _1131 = _1071;
    float _1133 = _1117;
    if (_1085)
    {
        float _1135 = _1069 ? _1121 : _1071;
        _1131 = _1135;
    }
    float _1137 = _1131;
    float _1139 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1143 = _1095 > 0.5;
    bool _1145 = _1143 && _1061;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = 1.0 / _1125;
    bool _1151 = _456 != 0.0;
    bool _1153 = isnan(_456);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    out.m_65.y = _1099;
    float _1161 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1163 = _454 == 0.0;
    bool _1165 = !_1159;
    bool _1167 = _1163 && _1165;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _702;
    out.m_67.y = _698;
    out.m_67.z = _706;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1173 = _458 == 0.0;
    bool _1175 = _1173 && _1167;
    float _1177 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1145)
    {
        float _1179 = -_1117;
        float _1181 = _1179 + 1.0;
        _1133 = _1181;
    }
    float _1183 = _1133;
    float _1185 = exp2(_1103);
    float _1187 = fma(_1177, _1137, -0.5);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1193 = _1149 * _1191;
    float _1195 = _1193;
    if (_1061)
    {
        _1115 = _1183;
    }
    float _1197 = _1115;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = in.m_69.x;
    float _1203 = in.m_69.y;
    float _1205 = in.m_69.z;
    float _1207 = abs(_1193);
    float _1209 = log2(_1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = fma(_1139, _1197, -0.5);
    float _1217 = -_240;
    float _1219 = fma(_378, _1187, _1217);
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_71.x = _1161;
    out.m_71.y = _1213;
    out.m_71.z = _1169;
    out.m_71.w = _1171;
    float _1223 = fma(_372, _1215, _216);
    float _1225 = -_1185;
    float _1227 = _1225 + 1.0;
    float _1229 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1107;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1235 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1237 = isnan(_716);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1243 = _1239 || _1241;
    float _1245 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = exp2(_1245);
    out.m_73.x = _1247;
    out.m_73.y = _1229;
    out.m_73.z = _1231;
    float _1251 = _1203;
    float _1253 = _1201;
    float _1255 = _1205;
    if (!_1175)
    {
        float _1257 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1251 = _1257;
    }
    float _1259 = _1251;
    if (!_1175)
    {
        float _1261 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1201);
        _1253 = _1261;
    }
    float _1263 = _1253;
    float _1265 = _1219 + 0.5;
    float _1267 = _1223 + 0.5;
    float _1269 = _532 * _1259;
    float _1271 = -_1259;
    float _1273 = _522 * _1271;
    float _1275 = _536 * _1259;
    if (!_1175)
    {
        float _1277 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1205);
        _1255 = _1277;
    }
    float _1279 = _1255;
    float _1281 = fma(_552, _1263, _1269);
    float _1283 = fma(_534, _1263, _1273);
    float _1285 = fma(_546, _1263, _1275);
    out.m_75.x = _1267;
    out.m_75.y = _1265;
    float _1287 = fma(_550, _1279, _1281);
    float _1289 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    float _1293 = fma(_538, _1279, _1283);
    float _1295 = fma(_556, _1279, _1285);
    float _1297 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1129);
    float _1299 = fma(_1291, -2.0, 3.0);
    float _1301 = _1291 * _1291;
    float _1303 = in.m_77.x;
    bool _1305 = _1193 <= 8000.0;
    bool _1307 = isnan(_1193);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(8000.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1319 = _1301 * _1299;
    float _1321 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1317);
    float _1335 = -_1319;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1321);
    float _1341 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1319);
    float _1345 = _1297 + _964;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1349 = _1315 * _1343;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1355 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1339);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1359 = _1349;
    if (!_1331)
    {
        _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1361 = _1359;
    float _1363 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    out.m_79.z = _1351;
    out.m_79.w = _964;
    if (!_1331)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1367 = _1193 + _1365;
        _1195 = _1367;
    }
    float _1369 = _1195;
    float _1371 = _992;
    float _1373 = _1369;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = _1361 + _1375;
        _746 = _1377;
    }
    float _1379 = _746;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1363;
    out.gl_Position.x = _992;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _964;
    float _1381 = _1379;
    if (!_1331)
    {
        float _1383 = 1.0 / _1379;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (!_1243)
    {
        _1089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1387 = _1089;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1243)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1393 = _1371;
    float _1395 = _1385;
    float _1397 = _1393;
    float _1399 = _1393;
    if (!_1331)
    {
        float _1401 = _1369 * _1385;
        float _1403 = precise::clamp(_1401, 0.0, 1.0);
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = _1405;
    if (_1331)
    {
        _1373 = 1.0;
    }
    float _1409 = _1373;
    float _1411 = _1409;
    if (!_1243)
    {
        _1091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1413 = _1091;
    float _1415 = _1413;
    float _1417 = _1413;
    if (!_1331)
    {
        float _1419 = -_1405;
        float _1421 = _1419 + 1.0;
        _1411 = _1421;
    }
    float _1423 = _1411;
    if (!_1243)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1425 = _1407;
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = -_1006;
    float _1431 = _1429 + 1.0;
    float _1433 = _1431 * _1357;
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = -_1435;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1441 = _1439 * _1303;
    float _1443 = _1441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1445 = _1233 * _1026;
    float _1447 = -_1233;
    float _1449 = _1447 + 1.0;
    out.m_83.x = _1443;
    float _1451 = _1037 * _1445;
    float _1453 = _1047 * _1445;
    float _1455 = _1037 * _1449;
    float _1457 = _1449;
    float _1459 = _1451;
    float _1461 = _1425;
    float _1463 = _1425;
    if (!_1243)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1465 = _1457;
    float _1467 = fma(_1043, _1451, _1031);
    float _1469 = fma(_1045, _1451, _1033);
    float _1471 = fma(_1037, _1453, _1035);
    float _1473 = _1465;
    float _1475 = _1465;
    if (!_1243)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _1459;
    out.m_85.x = _1467;
    out.m_85.y = _1469;
    out.m_85.z = _1471;
    out.m_85.w = _1455;
    bool _1479 = !_1243;
    float _1481 = _1477;
    float _1483 = _1477;
    if (!_1479)
    {
        bool _1485 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1487 = isnan(_716);
        bool _1489 = _1485 || _1487;
        bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1493 = _1489 || _1491;
        if (!_1493)
        {
            float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1497 = _716 + _1495;
            float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1501 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1499;
            float _1503 = 1.0 / _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1511 = _1509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1515 = _1513 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1523 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1525 = _1497 * _1503;
            float _1527 = precise::clamp(_1525, 0.0, 1.0);
            float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1533 = fma(_1527, _1507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1535 = fma(_1527, _1531, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1537 = fma(_1527, _1511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1539 = fma(_1527, _1515, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1541 = fma(_1527, _1519, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1543 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1399 = _1535;
            _1483 = _1541;
            _1391 = _1533;
            _1475 = _1539;
            _1417 = _1537;
            _1463 = _1543;
            _1545 = true;
        }
        else
        {
            bool _1547 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1549 = isnan(_716);
            bool _1551 = _1547 || _1549;
            bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1555 = _1551 || _1553;
            if (!_1555)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1557 = _1389;
            _1391 = _1557;
            if (!_1555)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1559 = _1397;
            _1399 = _1559;
            if (!_1555)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1561 = _1415;
            _1417 = _1561;
            if (!_1555)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1563 = _1473;
            _1475 = _1563;
            if (!_1555)
            {
                _1481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1565 = _1481;
            _1483 = _1565;
            if (!_1555)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1567 = _1461;
            bool _1569 = !_1555;
            _1463 = _1567;
            if (!_1569)
            {
                bool _1571 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1573 = isnan(_716);
                bool _1575 = _1571 || _1573;
                bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1579 = _1575 || _1577;
                if (!_1579)
                {
                    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1583 = _716 + _1581;
                    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1585;
                    float _1589 = 1.0 / _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1611 = _1583 * _1589;
                    float _1613 = precise::clamp(_1611, 0.0, 1.0);
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1619 = fma(_1613, _1593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1621 = fma(_1613, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1623 = fma(_1613, _1597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1625 = fma(_1613, _1601, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1627 = fma(_1613, _1605, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1629 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1399 = _1621;
                    _1483 = _1627;
                    _1391 = _1619;
                    _1475 = _1625;
                    _1417 = _1623;
                    _1463 = _1629;
                    _1545 = true;
                }
                else
                {
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1545 = false;
    float _1631 = _1399;
    float _1633 = _1483;
    float _1635 = _1391;
    float _1637 = _1475;
    float _1639 = _1417;
    float _1641 = _1463;
    float _1643 = fma(_1355, -0.5, 0.5);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = -_1631;
    float _1649 = _1647 + _1633;
    float _1651 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1653 = -_1635;
    float _1655 = _1653 + _1637;
    float _1657 = fma(_1645, _1649, _1631);
    out.m_87.x = 0.0;
    float _1659 = -_1639;
    float _1661 = _1659 + _1641;
    float _1663 = fma(_1645, _1655, _1635);
    float _1665 = _1657 * 0.586610972881317138671875;
    out.m_49.x = _1651;
    bool _1667 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1669 = fma(_1645, _1661, _1639);
    float _1671 = fma(_1663, 0.298911988735198974609375, _1665);
    bool _1673 = _1423 > 0.0;
    bool _1675 = isnan(_1423);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = fma(_1669, 0.114477999508380889892578125, _1671);
    float _1685 = -_1683;
    float _1687 = _1663 + _1685;
    float _1689 = -_1683;
    float _1691 = _1657 + _1689;
    float _1693 = -_1683;
    float _1695 = _1669 + _1693;
    float _1697 = fma(_1687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1701 = fma(_1695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    bool _1703 = !_1667;
    if (!_1703)
    {
        float _1705 = -_688;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1709 = -_690;
        float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1713 = -_692;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1717 = _1707 * _1707;
        float _1719 = fma(_1711, _1711, _1717);
        float _1721 = fma(_1715, _1715, _1719);
        float _1723 = sqrt(_1721);
        float _1725 = rsqrt(_1721);
        float _1727 = -_1723;
        float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1731 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1733 = precise::clamp(_1731, 0.0, 1.0);
        float _1735 = _1711 * _1725;
        float _1737 = _1707 * _1725;
        float _1739 = abs(_1733);
        float _1741 = log2(_1739);
        float _1743 = _1715 * _1725;
        float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1747 = _1355 * _1737;
        float _1749 = -_1737;
        float _1751 = -_1745;
        float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1751);
        float _1755 = fma(_1353, _1735, _1747);
        float _1757 = -_1743;
        float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1753);
        float _1761 = fma(_1363, _1743, _1755);
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1767 = _1759 + _1765;
        float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        float _1775 = exp2(_1769);
        float _1777 = _1775 * _1773;
        float _1779 = _1763 * _1777;
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1783 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1781;
        out.m_87.y = _1783;
        out.m_87.z = _1785;
    }
    out.m_89.x = _1697;
    out.m_89.y = _1699;
    out.m_89.z = _1701;
    if (_1681)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1845 = as_type<float>(_124);
        out.gl_Position.z = _1845;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1915 = as_type<float>(_162);
        out.gl_Position.z = _1915;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _184 = _182 != 0;
    bool _186 = !_180;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _164 * 2.0;
    float _194 = floor(_192);
    float _196 = _166 * 2.0;
    float _198 = _168 * 2.0;
    float _200 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = -_170;
    float _204 = fma(_200, 2.0, _202);
    float _206 = floor(_196);
    float _208 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _168 + _164;
    float _212 = _168 + _166;
    float _214 = -_142;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[76].x, _204);
    float _218 = fma(_208, -2.0, _172);
    float _220 = _210 + (-1.0);
    float _222 = floor(_198);
    bool _224 = _194 > 0.0;
    float _226 = _212 + (-1.0);
    bool _228 = _194 >= 0.0;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _218);
    int _242 = _236 ? 0 : 1;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    bool _248 = _206 > 0.0;
    bool _250 = _206 >= 0.0;
    bool _252 = isnan(_206);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_242;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    int _268 = _266;
    if (!_224)
    {
        int _270 = ~_242;
        int _272 = _270 + 1;
        _268 = _272;
    }
    int _274 = _268;
    int _276 = _258 ? 0 : 1;
    bool _278 = _222 > 0.0;
    bool _280 = _222 >= 0.0;
    bool _282 = isnan(_222);
    bool _284 = _280 || _282;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = !_176;
    int _292 = _290 ? 0 : 1;
    float _294 = _246 * _142;
    float _296 = float(_274);
    int _298 = ~_276;
    int _300 = _298 + 1;
    int _302 = _300 + 1;
    float _304 = in.m_55.x;
    float _306 = in.m_55.y;
    float _308 = in.m_55.z;
    int _310 = _302;
    if (!_248)
    {
        int _312 = ~_276;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = exp2(_294);
    int _320 = abs(_292);
    bool _322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _324 = isnan(1.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _330 = _326 || _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    float _336 = float(_320);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _342 = 1.0 / _334;
    float _344 = float(_316);
    float _346 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    float _348 = _336 * _296;
    bool _350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _358 = _354 || _356;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = float(_190);
    float _366 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _340);
    float _368 = _348 * (-2.0);
    int _370 = _288 ? 0 : 1;
    float _372 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _346);
    float _374 = _358 ? _362 : 0.0;
    float _376 = _364 * _344;
    float _378 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _366);
    float _380 = _166 + (-0.5);
    float _382 = fma(_368, _304, _304);
    bool _384 = !_184;
    int _386 = _384 ? 0 : 1;
    if (_330)
    {
        float _388 = _374 * _342;
        _144 = _388;
    }
    float _390 = _144;
    float _392 = fma(_260, _368, _260);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[196].x, _382);
    int _396 = abs(_386);
    float _398 = _376 * (-2.0);
    int _400 = ~_370;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = fma(_392, _390, _394);
    int _408 = _404;
    if (!_278)
    {
        int _410 = ~_370;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _168 + (-0.5);
    float _418 = float(_396);
    float _420 = fma(_398, _306, _306);
    float _422 = float(_414);
    float _424 = fma(_238, _398, _238);
    float _426 = _164 + _166;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _420);
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = _418 * _422;
    float _438 = _426 + (-1.0);
    float _440 = fma(_424, _390, _428);
    float _442 = _436 * (-2.0);
    float _444 = _406 * 0.15915493667125701904296875;
    float _446 = _164 + (-0.5);
    float _448 = _440 * 0.15915493667125701904296875;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _452 = fma(_442, _308, _308);
    float _454 = in.m_59.x;
    float _456 = in.m_59.y;
    float _458 = in.m_59.z;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = fma(_450, _442, _450);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _452);
    float _468 = fma(_464, _390, _466);
    float _470 = _444 * 6.283185482025146484375;
    float _472 = cos(_470);
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = in.m_46.x;
    float _478 = in.m_46.y;
    float _480 = in.m_46.z;
    float _482 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = _448 * 6.283185482025146484375;
    float _490 = sin(_488);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _454);
    float _494 = _448 * 6.283185482025146484375;
    float _496 = cos(_494);
    float _498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _456);
    float _500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _458);
    float _502 = _474 * 6.283185482025146484375;
    float _504 = cos(_502);
    float _506 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _508 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _510 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = _472 * _490;
    float _514 = _492 * _506;
    float _516 = _498 * _508;
    float _518 = _462 * _490;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = _462 * _496;
    float _526 = _472 * _496;
    float _528 = _500 * _510;
    float _530 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _532 = _472 * _504;
    float _534 = _496 * _504;
    float _536 = _462 * _504;
    float _538 = _490 * _504;
    float _540 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
    float _542 = _536 * _516;
    float _544 = -_512;
    float _546 = fma(_522, _524, _544);
    float _548 = -_524;
    float _550 = fma(_522, _512, _548);
    float _552 = fma(_522, _526, _518);
    float _554 = _532 * _516;
    float _556 = fma(_522, _518, _526);
    float _558 = -_516;
    float _560 = _522 * _558;
    float _562 = fma(_546, _514, _542);
    float _564 = fma(_552, _514, _554);
    float _566 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = fma(_534, _514, _560);
    float _570 = fma(_556, _528, _562);
    float _572 = fma(_550, _528, _564);
    float _574 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _576 = fma(_538, _528, _568);
    float _578 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _580 = _572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _586 = _578 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _592 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _598 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _600 = _572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _602 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _604 = _586 + _596;
    float _606 = _592 + _598;
    float _608 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _600);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _614 = _604 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _618 = _606 + _616;
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _614 * _614;
    float _626 = _622 + _620;
    float _628 = fma(_618, _618, _624);
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = 0.0;
    float _636 = _606;
    float _638 = _604;
    float _640 = _578;
    float _642 = _628;
    float _644 = _626;
    if (!_632)
    {
        _634 = _626;
    }
    float _646 = _634;
    bool _648 = !_632;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _630 + _654;
        float _658 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = _656 * _652;
        float _662 = rsqrt(_628);
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = cos(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        float _674 = _668 + (-1.0);
        float _676 = fma(_672, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _678 = _674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _680 = _662 * _676;
        float _682 = fma(_626, _668, _678);
        float _684 = fma(_618, _680, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _686 = fma(_614, _680, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _650 = _682;
        _636 = _684;
        _638 = _686;
        _640 = _664;
    }
    float _688 = _650;
    float _690 = _636;
    float _692 = _638;
    float _694 = _640;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _702 = _690 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _706 = _692 + _704;
    float _708 = _698 * _698;
    float _710 = fma(_702, _702, _708);
    float _712 = fma(_706, _706, _710);
    float _714 = rsqrt(_712);
    float _716 = sqrt(_712);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = _720 * _720;
    float _726 = _722 * _722;
    float _728 = _724 + _726;
    float _730 = sqrt(_728);
    bool _732 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _736 = _730 + _734;
    float _738 = _576;
    float _740 = _728;
    float _742 = _736;
    float _744 = _718;
    float _746 = _702;
    if (_732)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _748;
    }
    float _750 = _738;
    if (_732)
    {
        float _752 = rsqrt(_728);
        _740 = _752;
    }
    float _754 = _740;
    float _756 = _754;
    if (_732)
    {
        float _758 = _736 * _750;
        _742 = _758;
    }
    float _760 = _742;
    if (_732)
    {
        float _762 = _760 * 0.15915493667125701904296875;
        _642 = _762;
    }
    float _764 = _642;
    float _766 = _694;
    if (_732)
    {
        float _768 = _764 * 6.283185482025146484375;
        float _770 = sin(_768);
        _766 = _770;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _776 = precise::max(0.0, _774);
    float _778 = _608;
    float _780 = _776;
    float _782 = _774;
    if (_732)
    {
        float _784 = _764 * 6.283185482025146484375;
        float _786 = cos(_784);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = -_718;
    float _792 = -_776;
    float _794 = fma(_698, _790, _792);
    float _796 = _794;
    if (_732)
    {
        float _798 = _794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _798;
    }
    float _800 = _780;
    float _802 = _772;
    float _804 = _800;
    if (_732)
    {
        float _806 = fma(_772, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _644 = _806;
    }
    float _808 = _644;
    float _810 = _808;
    if (!_732)
    {
        _802 = _720;
    }
    float _812 = _802;
    float _814 = _812;
    float _816 = _788;
    if (_732)
    {
        float _818 = _788 + (-1.0);
        _782 = _818;
    }
    float _820 = _782;
    if (_732)
    {
        float _822 = _754 * _808;
        _744 = _822;
    }
    float _824 = _744;
    if (!_732)
    {
        _756 = _722;
    }
    float _826 = _756;
    float _828 = _826;
    if (_732)
    {
        float _830 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _830;
    }
    float _832 = _804;
    if (_732)
    {
        float _834 = _720 * _824;
        _814 = _834;
    }
    float _836 = _814;
    if (_732)
    {
        float _838 = _722 * _824;
        _828 = _838;
    }
    float _840 = _828;
    if (!_732)
    {
        _810 = _726;
    }
    float _842 = _810;
    float _844 = _842;
    if (_732)
    {
        float _846 = fma(_794, _788, _832);
        _796 = _846;
    }
    float _848 = _796;
    if (!_732)
    {
        _816 = _724;
    }
    float _850 = _816;
    float _852 = _850;
    if (_732)
    {
        float _854 = _836 * _836;
        _852 = _854;
    }
    float _856 = _852;
    if (_732)
    {
        float _858 = _840 * _840;
        _844 = _858;
    }
    float _860 = _844;
    float _862 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _864 = fma(_848, _848, _856);
    float _866 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _862);
    float _870 = _864 + _860;
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _876 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _874);
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _872);
    float _884 = rsqrt(_870);
    float _886 = -_878;
    float _888 = _886 + 1.0;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _880);
    float _896 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _898 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _900 = abs(_888);
    float _902 = log2(_900);
    float _904 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _906 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _908 = -_898;
    float _910 = fma(_908, _890, 1.0);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _868);
    float _918 = _884 * _836;
    float _920 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _912);
    float _922 = _884 * _848;
    float _924 = floor(_896);
    float _926 = _918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _928 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _920);
    float _930 = _884 * _840;
    float _932 = _916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = -_926;
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _934);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = floor(_906);
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _936);
    float _948 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _956 = log2(_910);
    float _958 = -_924;
    float _960 = _896 + _958;
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _966 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _968 = _922 + 1.0;
    float _970 = exp2(_948);
    float _972 = fma(_946, -0.5, 0.5);
    float _974 = fma(_946, 0.5, 0.5);
    float _976 = -_942;
    float _978 = _906 + _976;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _952);
    float _982 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _966);
    float _984 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _986 = sqrt(_972);
    float _988 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _980);
    float _990 = fma(_974, _984, -0.212114393711090087890625);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _994 = _956 * 0.693147182464599609375;
    float _996 = 1.0 / _964;
    float _998 = -_922;
    float _1000 = fma(_970, _968, _998);
    float _1002 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1004 = fma(_974, _990, 1.570728778839111328125);
    float2 _3252 = float2(_960, _978);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3252, float2(0.0), isnan(_3252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3252, float2(0.0), isnan(_3252)), level(0.0)).x;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = fma(_1000, 0.5, 0.5);
    float _1012 = _986 * 0.636619746685028076171875;
    float _1014 = -_1004;
    float _1016 = fma(_1012, _1014, 1.0);
    float _1018 = _992 * _996;
    float _1020 = _1002 * _996;
    float _1022 = fma(_1018, 0.5, 0.5);
    float _1024 = fma(_1020, -0.5, 0.5);
    float3 _3287 = float3(_1022, _1024, _1008);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).x;
    float3 _3298 = float3(_1022, _1024, _1008);
    float4 _1029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3298, float3(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3298, float3(0.0), isnan(_3298)), level(0.0)).xyzw;
    float _1031 = _1029.x;
    float _1033 = _1029.y;
    float _1035 = _1029.z;
    float _1037 = _1029.w;
    float2 _3314 = float2(_1016, _1010);
    float3 _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).xyz;
    float _1043 = _1041.x;
    float _1045 = _1041.y;
    float _1047 = _1041.z;
    float _1049 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1051 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1053 = in.m_61.x;
    float _1055 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1049);
    float _1057 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1051);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1061 = _1059 != 0;
    float _1063 = in.m_63.z;
    float _1065 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1067 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    bool _1069 = _168 > 0.5;
    float _1071 = in.m_61.y;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1077 = in.m_63.x;
    float _1079 = 1.0 / _1073;
    float _1081 = _1075 + _1073;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _1065;
    float _1089 = _964;
    float _1091 = _1002;
    if (_1061)
    {
        float _1093 = in.m_53.x;
        _1087 = _1093;
    }
    float _1095 = _1087;
    float _1097 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1099 = in.m_63.y;
    float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1103 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1105 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1097);
    float _1107 = in.m_63.w;
    float _1109 = _1081 * _1079;
    float _1111 = _1109 * 0.5;
    float _1113 = _1079;
    float _1115 = _1053;
    if (_1061)
    {
        _1113 = _1053;
    }
    float _1117 = _1113;
    out.m_65.z = _1063;
    float _1119 = -_1071;
    float _1121 = _1119 + 1.0;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1123);
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1129 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1105);
    out.m_65.x = _1077;
    float _1131 = _1071;
    float _1133 = _1117;
    if (_1085)
    {
        float _1135 = _1069 ? _1121 : _1071;
        _1131 = _1135;
    }
    float _1137 = _1131;
    float _1139 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1143 = _1095 > 0.5;
    bool _1145 = _1143 && _1061;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = 1.0 / _1125;
    bool _1151 = _456 != 0.0;
    bool _1153 = isnan(_456);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    out.m_65.y = _1099;
    float _1161 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1163 = _454 == 0.0;
    bool _1165 = !_1159;
    bool _1167 = _1163 && _1165;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _702;
    out.m_67.y = _698;
    out.m_67.z = _706;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1173 = _458 == 0.0;
    bool _1175 = _1173 && _1167;
    float _1177 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1145)
    {
        float _1179 = -_1117;
        float _1181 = _1179 + 1.0;
        _1133 = _1181;
    }
    float _1183 = _1133;
    float _1185 = exp2(_1103);
    float _1187 = fma(_1177, _1137, -0.5);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1193 = _1149 * _1191;
    float _1195 = _1193;
    if (_1061)
    {
        _1115 = _1183;
    }
    float _1197 = _1115;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = in.m_69.x;
    float _1203 = in.m_69.y;
    float _1205 = in.m_69.z;
    float _1207 = abs(_1193);
    float _1209 = log2(_1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = fma(_1139, _1197, -0.5);
    float _1217 = -_240;
    float _1219 = fma(_378, _1187, _1217);
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_71.x = _1161;
    out.m_71.y = _1213;
    out.m_71.z = _1169;
    out.m_71.w = _1171;
    float _1223 = fma(_372, _1215, _216);
    float _1225 = -_1185;
    float _1227 = _1225 + 1.0;
    float _1229 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1107;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1235 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1237 = isnan(_716);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1243 = _1239 || _1241;
    float _1245 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = exp2(_1245);
    out.m_73.x = _1247;
    out.m_73.y = _1229;
    out.m_73.z = _1231;
    float _1251 = _1203;
    float _1253 = _1201;
    float _1255 = _1205;
    if (!_1175)
    {
        float _1257 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1251 = _1257;
    }
    float _1259 = _1251;
    if (!_1175)
    {
        float _1261 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1201);
        _1253 = _1261;
    }
    float _1263 = _1253;
    float _1265 = _1219 + 0.5;
    float _1267 = _1223 + 0.5;
    float _1269 = _532 * _1259;
    float _1271 = -_1259;
    float _1273 = _522 * _1271;
    float _1275 = _536 * _1259;
    if (!_1175)
    {
        float _1277 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1205);
        _1255 = _1277;
    }
    float _1279 = _1255;
    float _1281 = fma(_552, _1263, _1269);
    float _1283 = fma(_534, _1263, _1273);
    float _1285 = fma(_546, _1263, _1275);
    out.m_75.x = _1267;
    out.m_75.y = _1265;
    float _1287 = fma(_550, _1279, _1281);
    float _1289 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    float _1293 = fma(_538, _1279, _1283);
    float _1295 = fma(_556, _1279, _1285);
    float _1297 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1129);
    float _1299 = fma(_1291, -2.0, 3.0);
    float _1301 = _1291 * _1291;
    float _1303 = in.m_77.x;
    bool _1305 = _1193 <= 8000.0;
    bool _1307 = isnan(_1193);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(8000.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1319 = _1301 * _1299;
    float _1321 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1317);
    float _1335 = -_1319;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1321);
    float _1341 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1319);
    float _1345 = _1297 + _964;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1349 = _1315 * _1343;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1355 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1339);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1359 = _1349;
    if (!_1331)
    {
        _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1361 = _1359;
    float _1363 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    out.m_79.z = _1351;
    out.m_79.w = _964;
    if (!_1331)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1367 = _1193 + _1365;
        _1195 = _1367;
    }
    float _1369 = _1195;
    float _1371 = _992;
    float _1373 = _1369;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = _1361 + _1375;
        _746 = _1377;
    }
    float _1379 = _746;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1363;
    out.gl_Position.x = _992;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _964;
    float _1381 = _1379;
    if (!_1331)
    {
        float _1383 = 1.0 / _1379;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (!_1243)
    {
        _1089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1387 = _1089;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1243)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1393 = _1371;
    float _1395 = _1385;
    float _1397 = _1393;
    float _1399 = _1393;
    if (!_1331)
    {
        float _1401 = _1369 * _1385;
        float _1403 = precise::clamp(_1401, 0.0, 1.0);
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = _1405;
    if (_1331)
    {
        _1373 = 1.0;
    }
    float _1409 = _1373;
    float _1411 = _1409;
    if (!_1243)
    {
        _1091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1413 = _1091;
    float _1415 = _1413;
    float _1417 = _1413;
    if (!_1331)
    {
        float _1419 = -_1405;
        float _1421 = _1419 + 1.0;
        _1411 = _1421;
    }
    float _1423 = _1411;
    if (!_1243)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1425 = _1407;
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = -_1006;
    float _1431 = _1429 + 1.0;
    float _1433 = _1431 * _1357;
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = -_1435;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1441 = _1439 * _1303;
    float _1443 = _1441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1445 = _1233 * _1026;
    float _1447 = -_1233;
    float _1449 = _1447 + 1.0;
    out.m_83.x = _1443;
    float _1451 = _1037 * _1445;
    float _1453 = _1047 * _1445;
    float _1455 = _1037 * _1449;
    float _1457 = _1449;
    float _1459 = _1451;
    float _1461 = _1425;
    float _1463 = _1425;
    if (!_1243)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1465 = _1457;
    float _1467 = fma(_1043, _1451, _1031);
    float _1469 = fma(_1045, _1451, _1033);
    float _1471 = fma(_1037, _1453, _1035);
    float _1473 = _1465;
    float _1475 = _1465;
    if (!_1243)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _1459;
    out.m_85.x = _1467;
    out.m_85.y = _1469;
    out.m_85.z = _1471;
    out.m_85.w = _1455;
    bool _1479 = !_1243;
    float _1481 = _1477;
    float _1483 = _1477;
    if (!_1479)
    {
        bool _1485 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1487 = isnan(_716);
        bool _1489 = _1485 || _1487;
        bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1493 = _1489 || _1491;
        if (!_1493)
        {
            float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1497 = _716 + _1495;
            float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1501 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1499;
            float _1503 = 1.0 / _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1511 = _1509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1515 = _1513 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1523 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1525 = _1497 * _1503;
            float _1527 = precise::clamp(_1525, 0.0, 1.0);
            float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1533 = fma(_1527, _1507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1535 = fma(_1527, _1531, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1537 = fma(_1527, _1511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1539 = fma(_1527, _1515, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1541 = fma(_1527, _1519, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1543 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1399 = _1535;
            _1483 = _1541;
            _1391 = _1533;
            _1475 = _1539;
            _1417 = _1537;
            _1463 = _1543;
            _1545 = true;
        }
        else
        {
            bool _1547 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1549 = isnan(_716);
            bool _1551 = _1547 || _1549;
            bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1555 = _1551 || _1553;
            if (!_1555)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1557 = _1389;
            _1391 = _1557;
            if (!_1555)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1559 = _1397;
            _1399 = _1559;
            if (!_1555)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1561 = _1415;
            _1417 = _1561;
            if (!_1555)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1563 = _1473;
            _1475 = _1563;
            if (!_1555)
            {
                _1481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1565 = _1481;
            _1483 = _1565;
            if (!_1555)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1567 = _1461;
            bool _1569 = !_1555;
            _1463 = _1567;
            if (!_1569)
            {
                bool _1571 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1573 = isnan(_716);
                bool _1575 = _1571 || _1573;
                bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1579 = _1575 || _1577;
                if (!_1579)
                {
                    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1583 = _716 + _1581;
                    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1585;
                    float _1589 = 1.0 / _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1611 = _1583 * _1589;
                    float _1613 = precise::clamp(_1611, 0.0, 1.0);
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1619 = fma(_1613, _1593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1621 = fma(_1613, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1623 = fma(_1613, _1597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1625 = fma(_1613, _1601, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1627 = fma(_1613, _1605, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1629 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1399 = _1621;
                    _1483 = _1627;
                    _1391 = _1619;
                    _1475 = _1625;
                    _1417 = _1623;
                    _1463 = _1629;
                    _1545 = true;
                }
                else
                {
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1545 = false;
    float _1631 = _1399;
    float _1633 = _1483;
    float _1635 = _1391;
    float _1637 = _1475;
    float _1639 = _1417;
    float _1641 = _1463;
    float _1643 = fma(_1355, -0.5, 0.5);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = -_1631;
    float _1649 = _1647 + _1633;
    float _1651 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1653 = -_1635;
    float _1655 = _1653 + _1637;
    float _1657 = fma(_1645, _1649, _1631);
    out.m_87.x = 0.0;
    float _1659 = -_1639;
    float _1661 = _1659 + _1641;
    float _1663 = fma(_1645, _1655, _1635);
    float _1665 = _1657 * 0.586610972881317138671875;
    out.m_49.x = _1651;
    bool _1667 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1669 = fma(_1645, _1661, _1639);
    float _1671 = fma(_1663, 0.298911988735198974609375, _1665);
    bool _1673 = _1423 > 0.0;
    bool _1675 = isnan(_1423);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = fma(_1669, 0.114477999508380889892578125, _1671);
    float _1685 = -_1683;
    float _1687 = _1663 + _1685;
    float _1689 = -_1683;
    float _1691 = _1657 + _1689;
    float _1693 = -_1683;
    float _1695 = _1669 + _1693;
    float _1697 = fma(_1687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1701 = fma(_1695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    bool _1703 = !_1667;
    if (!_1703)
    {
        float _1705 = -_688;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1709 = -_690;
        float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1713 = -_692;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1717 = _1707 * _1707;
        float _1719 = fma(_1711, _1711, _1717);
        float _1721 = fma(_1715, _1715, _1719);
        float _1723 = sqrt(_1721);
        float _1725 = rsqrt(_1721);
        float _1727 = -_1723;
        float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1731 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1733 = precise::clamp(_1731, 0.0, 1.0);
        float _1735 = _1711 * _1725;
        float _1737 = _1707 * _1725;
        float _1739 = abs(_1733);
        float _1741 = log2(_1739);
        float _1743 = _1715 * _1725;
        float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1747 = _1355 * _1737;
        float _1749 = -_1737;
        float _1751 = -_1745;
        float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1751);
        float _1755 = fma(_1353, _1735, _1747);
        float _1757 = -_1743;
        float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1753);
        float _1761 = fma(_1363, _1743, _1755);
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1767 = _1759 + _1765;
        float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        float _1775 = exp2(_1769);
        float _1777 = _1775 * _1773;
        float _1779 = _1763 * _1777;
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1783 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1781;
        out.m_87.y = _1783;
        out.m_87.z = _1785;
    }
    out.m_89.x = _1697;
    out.m_89.y = _1699;
    out.m_89.z = _1701;
    if (_1681)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1845 = as_type<float>(_124);
        out.gl_Position.z = _1845;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1915 = as_type<float>(_162);
        out.gl_Position.z = _1915;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _180 = _178 != 0;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _184 = _182 != 0;
    bool _186 = !_180;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _164 * 2.0;
    float _194 = floor(_192);
    float _196 = _166 * 2.0;
    float _198 = _168 * 2.0;
    float _200 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = -_170;
    float _204 = fma(_200, 2.0, _202);
    float _206 = floor(_196);
    float _208 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _168 + _164;
    float _212 = _168 + _166;
    float _214 = -_142;
    float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[76].x, _204);
    float _218 = fma(_208, -2.0, _172);
    float _220 = _210 + (-1.0);
    float _222 = floor(_198);
    bool _224 = _194 > 0.0;
    float _226 = _212 + (-1.0);
    bool _228 = _194 >= 0.0;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _240 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _218);
    int _242 = _236 ? 0 : 1;
    float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _246 = log2(_244);
    bool _248 = _206 > 0.0;
    bool _250 = _206 >= 0.0;
    bool _252 = isnan(_206);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _262 = ~_242;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    int _268 = _266;
    if (!_224)
    {
        int _270 = ~_242;
        int _272 = _270 + 1;
        _268 = _272;
    }
    int _274 = _268;
    int _276 = _258 ? 0 : 1;
    bool _278 = _222 > 0.0;
    bool _280 = _222 >= 0.0;
    bool _282 = isnan(_222);
    bool _284 = _280 || _282;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    bool _290 = !_176;
    int _292 = _290 ? 0 : 1;
    float _294 = _246 * _142;
    float _296 = float(_274);
    int _298 = ~_276;
    int _300 = _298 + 1;
    int _302 = _300 + 1;
    float _304 = in.m_55.x;
    float _306 = in.m_55.y;
    float _308 = in.m_55.z;
    int _310 = _302;
    if (!_248)
    {
        int _312 = ~_276;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = exp2(_294);
    int _320 = abs(_292);
    bool _322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _324 = isnan(1.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _330 = _326 || _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    float _336 = float(_320);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _342 = 1.0 / _334;
    float _344 = float(_316);
    float _346 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    float _348 = _336 * _296;
    bool _350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _358 = _354 || _356;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = float(_190);
    float _366 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _340);
    float _368 = _348 * (-2.0);
    int _370 = _288 ? 0 : 1;
    float _372 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _346);
    float _374 = _358 ? _362 : 0.0;
    float _376 = _364 * _344;
    float _378 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _366);
    float _380 = _166 + (-0.5);
    float _382 = fma(_368, _304, _304);
    bool _384 = !_184;
    int _386 = _384 ? 0 : 1;
    if (_330)
    {
        float _388 = _374 * _342;
        _144 = _388;
    }
    float _390 = _144;
    float _392 = fma(_260, _368, _260);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[196].x, _382);
    int _396 = abs(_386);
    float _398 = _376 * (-2.0);
    int _400 = ~_370;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = fma(_392, _390, _394);
    int _408 = _404;
    if (!_278)
    {
        int _410 = ~_370;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _168 + (-0.5);
    float _418 = float(_396);
    float _420 = fma(_398, _306, _306);
    float _422 = float(_414);
    float _424 = fma(_238, _398, _238);
    float _426 = _164 + _166;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _420);
    float _430 = in.m_57.x;
    float _432 = in.m_57.y;
    float _434 = in.m_57.z;
    float _436 = _418 * _422;
    float _438 = _426 + (-1.0);
    float _440 = fma(_424, _390, _428);
    float _442 = _436 * (-2.0);
    float _444 = _406 * 0.15915493667125701904296875;
    float _446 = _164 + (-0.5);
    float _448 = _440 * 0.15915493667125701904296875;
    float _450 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _452 = fma(_442, _308, _308);
    float _454 = in.m_59.x;
    float _456 = in.m_59.y;
    float _458 = in.m_59.z;
    float _460 = _444 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = fma(_450, _442, _450);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _452);
    float _468 = fma(_464, _390, _466);
    float _470 = _444 * 6.283185482025146484375;
    float _472 = cos(_470);
    float _474 = _468 * 0.15915493667125701904296875;
    float _476 = in.m_46.x;
    float _478 = in.m_46.y;
    float _480 = in.m_46.z;
    float _482 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _488 = _448 * 6.283185482025146484375;
    float _490 = sin(_488);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _454);
    float _494 = _448 * 6.283185482025146484375;
    float _496 = cos(_494);
    float _498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _456);
    float _500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _458);
    float _502 = _474 * 6.283185482025146484375;
    float _504 = cos(_502);
    float _506 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _508 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _510 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _512 = _472 * _490;
    float _514 = _492 * _506;
    float _516 = _498 * _508;
    float _518 = _462 * _490;
    float _520 = _474 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = _462 * _496;
    float _526 = _472 * _496;
    float _528 = _500 * _510;
    float _530 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _532 = _472 * _504;
    float _534 = _496 * _504;
    float _536 = _462 * _504;
    float _538 = _490 * _504;
    float _540 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _530);
    float _542 = _536 * _516;
    float _544 = -_512;
    float _546 = fma(_522, _524, _544);
    float _548 = -_524;
    float _550 = fma(_522, _512, _548);
    float _552 = fma(_522, _526, _518);
    float _554 = _532 * _516;
    float _556 = fma(_522, _518, _526);
    float _558 = -_516;
    float _560 = _522 * _558;
    float _562 = fma(_546, _514, _542);
    float _564 = fma(_552, _514, _554);
    float _566 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = fma(_534, _514, _560);
    float _570 = fma(_556, _528, _562);
    float _572 = fma(_550, _528, _564);
    float _574 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _576 = fma(_538, _528, _568);
    float _578 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _580 = _572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
    float _586 = _578 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _592 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _594 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _598 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _590);
    float _600 = _572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _602 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _604 = _586 + _596;
    float _606 = _592 + _598;
    float _608 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _600);
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _614 = _604 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _618 = _606 + _616;
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = _614 * _614;
    float _626 = _622 + _620;
    float _628 = fma(_618, _618, _624);
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = 0.0;
    float _636 = _606;
    float _638 = _604;
    float _640 = _578;
    float _642 = _628;
    float _644 = _626;
    if (!_632)
    {
        _634 = _626;
    }
    float _646 = _634;
    bool _648 = !_632;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _630 + _654;
        float _658 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = _656 * _652;
        float _662 = rsqrt(_628);
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = cos(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = sin(_670);
        float _674 = _668 + (-1.0);
        float _676 = fma(_672, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _678 = _674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _680 = _662 * _676;
        float _682 = fma(_626, _668, _678);
        float _684 = fma(_618, _680, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _686 = fma(_614, _680, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _650 = _682;
        _636 = _684;
        _638 = _686;
        _640 = _664;
    }
    float _688 = _650;
    float _690 = _636;
    float _692 = _638;
    float _694 = _640;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _688 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _702 = _690 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _706 = _692 + _704;
    float _708 = _698 * _698;
    float _710 = fma(_702, _702, _708);
    float _712 = fma(_706, _706, _710);
    float _714 = rsqrt(_712);
    float _716 = sqrt(_712);
    float _718 = _714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = _720 * _720;
    float _726 = _722 * _722;
    float _728 = _724 + _726;
    float _730 = sqrt(_728);
    bool _732 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _736 = _730 + _734;
    float _738 = _576;
    float _740 = _728;
    float _742 = _736;
    float _744 = _718;
    float _746 = _702;
    if (_732)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _738 = _748;
    }
    float _750 = _738;
    if (_732)
    {
        float _752 = rsqrt(_728);
        _740 = _752;
    }
    float _754 = _740;
    float _756 = _754;
    if (_732)
    {
        float _758 = _736 * _750;
        _742 = _758;
    }
    float _760 = _742;
    if (_732)
    {
        float _762 = _760 * 0.15915493667125701904296875;
        _642 = _762;
    }
    float _764 = _642;
    float _766 = _694;
    if (_732)
    {
        float _768 = _764 * 6.283185482025146484375;
        float _770 = sin(_768);
        _766 = _770;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _776 = precise::max(0.0, _774);
    float _778 = _608;
    float _780 = _776;
    float _782 = _774;
    if (_732)
    {
        float _784 = _764 * 6.283185482025146484375;
        float _786 = cos(_784);
        _778 = _786;
    }
    float _788 = _778;
    float _790 = -_718;
    float _792 = -_776;
    float _794 = fma(_698, _790, _792);
    float _796 = _794;
    if (_732)
    {
        float _798 = _794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _798;
    }
    float _800 = _780;
    float _802 = _772;
    float _804 = _800;
    if (_732)
    {
        float _806 = fma(_772, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _644 = _806;
    }
    float _808 = _644;
    float _810 = _808;
    if (!_732)
    {
        _802 = _720;
    }
    float _812 = _802;
    float _814 = _812;
    float _816 = _788;
    if (_732)
    {
        float _818 = _788 + (-1.0);
        _782 = _818;
    }
    float _820 = _782;
    if (_732)
    {
        float _822 = _754 * _808;
        _744 = _822;
    }
    float _824 = _744;
    if (!_732)
    {
        _756 = _722;
    }
    float _826 = _756;
    float _828 = _826;
    if (_732)
    {
        float _830 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _830;
    }
    float _832 = _804;
    if (_732)
    {
        float _834 = _720 * _824;
        _814 = _834;
    }
    float _836 = _814;
    if (_732)
    {
        float _838 = _722 * _824;
        _828 = _838;
    }
    float _840 = _828;
    if (!_732)
    {
        _810 = _726;
    }
    float _842 = _810;
    float _844 = _842;
    if (_732)
    {
        float _846 = fma(_794, _788, _832);
        _796 = _846;
    }
    float _848 = _796;
    if (!_732)
    {
        _816 = _724;
    }
    float _850 = _816;
    float _852 = _850;
    if (_732)
    {
        float _854 = _836 * _836;
        _852 = _854;
    }
    float _856 = _852;
    if (_732)
    {
        float _858 = _840 * _840;
        _844 = _858;
    }
    float _860 = _844;
    float _862 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _864 = fma(_848, _848, _856);
    float _866 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _862);
    float _870 = _864 + _860;
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _876 = fma(_716, (*spvDescriptorSet0.vp_c15)._m0[23].w, _874);
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _882 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _872);
    float _884 = rsqrt(_870);
    float _886 = -_878;
    float _888 = _886 + 1.0;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _894 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _880);
    float _896 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _898 = _892 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _900 = abs(_888);
    float _902 = log2(_900);
    float _904 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _906 = fma(_586, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _908 = -_898;
    float _910 = fma(_908, _890, 1.0);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _868);
    float _918 = _884 * _836;
    float _920 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _912);
    float _922 = _884 * _848;
    float _924 = floor(_896);
    float _926 = _918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _928 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _920);
    float _930 = _884 * _840;
    float _932 = _916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = -_926;
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _934);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = floor(_906);
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[21].z, _936);
    float _948 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _954 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _956 = log2(_910);
    float _958 = -_924;
    float _960 = _896 + _958;
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _954);
    float _966 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _968 = _922 + 1.0;
    float _970 = exp2(_948);
    float _972 = fma(_946, -0.5, 0.5);
    float _974 = fma(_946, 0.5, 0.5);
    float _976 = -_942;
    float _978 = _906 + _976;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _952);
    float _982 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[4].z, _966);
    float _984 = fma(_974, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _986 = sqrt(_972);
    float _988 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[5].z, _980);
    float _990 = fma(_974, _984, -0.212114393711090087890625);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _994 = _956 * 0.693147182464599609375;
    float _996 = 1.0 / _964;
    float _998 = -_922;
    float _1000 = fma(_970, _968, _998);
    float _1002 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1004 = fma(_974, _990, 1.570728778839111328125);
    float2 _3252 = float2(_960, _978);
    float _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3252, float2(0.0), isnan(_3252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3252, float2(0.0), isnan(_3252)), level(0.0)).x;
    float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = fma(_1000, 0.5, 0.5);
    float _1012 = _986 * 0.636619746685028076171875;
    float _1014 = -_1004;
    float _1016 = fma(_1012, _1014, 1.0);
    float _1018 = _992 * _996;
    float _1020 = _1002 * _996;
    float _1022 = fma(_1018, 0.5, 0.5);
    float _1024 = fma(_1020, -0.5, 0.5);
    float3 _3287 = float3(_1022, _1024, _1008);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).x;
    float3 _3298 = float3(_1022, _1024, _1008);
    float4 _1029 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3298, float3(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3298, float3(0.0), isnan(_3298)), level(0.0)).xyzw;
    float _1031 = _1029.x;
    float _1033 = _1029.y;
    float _1035 = _1029.z;
    float _1037 = _1029.w;
    float2 _3314 = float2(_1016, _1010);
    float3 _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).xyz;
    float _1043 = _1041.x;
    float _1045 = _1041.y;
    float _1047 = _1041.z;
    float _1049 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1051 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1053 = in.m_61.x;
    float _1055 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1049);
    float _1057 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1051);
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1061 = _1059 != 0;
    float _1063 = in.m_63.z;
    float _1065 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1067 = fma(_586, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1057);
    bool _1069 = _168 > 0.5;
    float _1071 = in.m_61.y;
    float _1073 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1075 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1077 = in.m_63.x;
    float _1079 = 1.0 / _1073;
    float _1081 = _1075 + _1073;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _1065;
    float _1089 = _964;
    float _1091 = _1002;
    if (_1061)
    {
        float _1093 = in.m_53.x;
        _1087 = _1093;
    }
    float _1095 = _1087;
    float _1097 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1099 = in.m_63.y;
    float _1101 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1103 = _902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1105 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1097);
    float _1107 = in.m_63.w;
    float _1109 = _1081 * _1079;
    float _1111 = _1109 * 0.5;
    float _1113 = _1079;
    float _1115 = _1053;
    if (_1061)
    {
        _1113 = _1053;
    }
    float _1117 = _1113;
    out.m_65.z = _1063;
    float _1119 = -_1071;
    float _1121 = _1119 + 1.0;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1123);
    float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1129 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1105);
    out.m_65.x = _1077;
    float _1131 = _1071;
    float _1133 = _1117;
    if (_1085)
    {
        float _1135 = _1069 ? _1121 : _1071;
        _1131 = _1135;
    }
    float _1137 = _1131;
    float _1139 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1143 = _1095 > 0.5;
    bool _1145 = _1143 && _1061;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = 1.0 / _1125;
    bool _1151 = _456 != 0.0;
    bool _1153 = isnan(_456);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    out.m_65.y = _1099;
    float _1161 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1163 = _454 == 0.0;
    bool _1165 = !_1159;
    bool _1167 = _1163 && _1165;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _702;
    out.m_67.y = _698;
    out.m_67.z = _706;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1173 = _458 == 0.0;
    bool _1175 = _1173 && _1167;
    float _1177 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1145)
    {
        float _1179 = -_1117;
        float _1181 = _1179 + 1.0;
        _1133 = _1181;
    }
    float _1183 = _1133;
    float _1185 = exp2(_1103);
    float _1187 = fma(_1177, _1137, -0.5);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1193 = _1149 * _1191;
    float _1195 = _1193;
    if (_1061)
    {
        _1115 = _1183;
    }
    float _1197 = _1115;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = in.m_69.x;
    float _1203 = in.m_69.y;
    float _1205 = in.m_69.z;
    float _1207 = abs(_1193);
    float _1209 = log2(_1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = fma(_1139, _1197, -0.5);
    float _1217 = -_240;
    float _1219 = fma(_378, _1187, _1217);
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_71.x = _1161;
    out.m_71.y = _1213;
    out.m_71.z = _1169;
    out.m_71.w = _1171;
    float _1223 = fma(_372, _1215, _216);
    float _1225 = -_1185;
    float _1227 = _1225 + 1.0;
    float _1229 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1107;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1235 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1237 = isnan(_716);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1243 = _1239 || _1241;
    float _1245 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = exp2(_1245);
    out.m_73.x = _1247;
    out.m_73.y = _1229;
    out.m_73.z = _1231;
    float _1251 = _1203;
    float _1253 = _1201;
    float _1255 = _1205;
    if (!_1175)
    {
        float _1257 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1203);
        _1251 = _1257;
    }
    float _1259 = _1251;
    if (!_1175)
    {
        float _1261 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1201);
        _1253 = _1261;
    }
    float _1263 = _1253;
    float _1265 = _1219 + 0.5;
    float _1267 = _1223 + 0.5;
    float _1269 = _532 * _1259;
    float _1271 = -_1259;
    float _1273 = _522 * _1271;
    float _1275 = _536 * _1259;
    if (!_1175)
    {
        float _1277 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1205);
        _1255 = _1277;
    }
    float _1279 = _1255;
    float _1281 = fma(_552, _1263, _1269);
    float _1283 = fma(_534, _1263, _1273);
    float _1285 = fma(_546, _1263, _1275);
    out.m_75.x = _1267;
    out.m_75.y = _1265;
    float _1287 = fma(_550, _1279, _1281);
    float _1289 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    float _1293 = fma(_538, _1279, _1283);
    float _1295 = fma(_556, _1279, _1285);
    float _1297 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1129);
    float _1299 = fma(_1291, -2.0, 3.0);
    float _1301 = _1291 * _1291;
    float _1303 = in.m_77.x;
    bool _1305 = _1193 <= 8000.0;
    bool _1307 = isnan(_1193);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(8000.0);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1319 = _1301 * _1299;
    float _1321 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1317);
    float _1335 = -_1319;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1321);
    float _1341 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1343 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1319);
    float _1345 = _1297 + _964;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1341);
    float _1349 = _1315 * _1343;
    float _1351 = _1345 * 0.5;
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1355 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1339);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1359 = _1349;
    if (!_1331)
    {
        _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1361 = _1359;
    float _1363 = fma(_1295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    out.m_79.z = _1351;
    out.m_79.w = _964;
    if (!_1331)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1367 = _1193 + _1365;
        _1195 = _1367;
    }
    float _1369 = _1195;
    float _1371 = _992;
    float _1373 = _1369;
    if (!_1331)
    {
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = _1361 + _1375;
        _746 = _1377;
    }
    float _1379 = _746;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1363;
    out.gl_Position.x = _992;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _1297;
    out.gl_Position.w = _964;
    float _1381 = _1379;
    if (!_1331)
    {
        float _1383 = 1.0 / _1379;
        _1381 = _1383;
    }
    float _1385 = _1381;
    if (!_1243)
    {
        _1089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1387 = _1089;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1243)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1393 = _1371;
    float _1395 = _1385;
    float _1397 = _1393;
    float _1399 = _1393;
    if (!_1331)
    {
        float _1401 = _1369 * _1385;
        float _1403 = precise::clamp(_1401, 0.0, 1.0);
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = _1405;
    if (_1331)
    {
        _1373 = 1.0;
    }
    float _1409 = _1373;
    float _1411 = _1409;
    if (!_1243)
    {
        _1091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1413 = _1091;
    float _1415 = _1413;
    float _1417 = _1413;
    if (!_1331)
    {
        float _1419 = -_1405;
        float _1421 = _1419 + 1.0;
        _1411 = _1421;
    }
    float _1423 = _1411;
    if (!_1243)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1425 = _1407;
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1429 = -_1006;
    float _1431 = _1429 + 1.0;
    float _1433 = _1431 * _1357;
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = -_1435;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1441 = _1439 * _1303;
    float _1443 = _1441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1445 = _1233 * _1026;
    float _1447 = -_1233;
    float _1449 = _1447 + 1.0;
    out.m_83.x = _1443;
    float _1451 = _1037 * _1445;
    float _1453 = _1047 * _1445;
    float _1455 = _1037 * _1449;
    float _1457 = _1449;
    float _1459 = _1451;
    float _1461 = _1425;
    float _1463 = _1425;
    if (!_1243)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1465 = _1457;
    float _1467 = fma(_1043, _1451, _1031);
    float _1469 = fma(_1045, _1451, _1033);
    float _1471 = fma(_1037, _1453, _1035);
    float _1473 = _1465;
    float _1475 = _1465;
    if (!_1243)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _1459;
    out.m_85.x = _1467;
    out.m_85.y = _1469;
    out.m_85.z = _1471;
    out.m_85.w = _1455;
    bool _1479 = !_1243;
    float _1481 = _1477;
    float _1483 = _1477;
    if (!_1479)
    {
        bool _1485 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1487 = isnan(_716);
        bool _1489 = _1485 || _1487;
        bool _1491 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1493 = _1489 || _1491;
        if (!_1493)
        {
            float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1497 = _716 + _1495;
            float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1501 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1499;
            float _1503 = 1.0 / _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1507 = _1505 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1511 = _1509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1515 = _1513 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1519 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1523 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1525 = _1497 * _1503;
            float _1527 = precise::clamp(_1525, 0.0, 1.0);
            float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1533 = fma(_1527, _1507, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1535 = fma(_1527, _1531, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1537 = fma(_1527, _1511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1539 = fma(_1527, _1515, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1541 = fma(_1527, _1519, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1543 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1399 = _1535;
            _1483 = _1541;
            _1391 = _1533;
            _1475 = _1539;
            _1417 = _1537;
            _1463 = _1543;
            _1545 = true;
        }
        else
        {
            bool _1547 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1549 = isnan(_716);
            bool _1551 = _1547 || _1549;
            bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1555 = _1551 || _1553;
            if (!_1555)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1557 = _1389;
            _1391 = _1557;
            if (!_1555)
            {
                _1397 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1559 = _1397;
            _1399 = _1559;
            if (!_1555)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1561 = _1415;
            _1417 = _1561;
            if (!_1555)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1563 = _1473;
            _1475 = _1563;
            if (!_1555)
            {
                _1481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1565 = _1481;
            _1483 = _1565;
            if (!_1555)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1567 = _1461;
            bool _1569 = !_1555;
            _1463 = _1567;
            if (!_1569)
            {
                bool _1571 = _716 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1573 = isnan(_716);
                bool _1575 = _1571 || _1573;
                bool _1577 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1579 = _1575 || _1577;
                if (!_1579)
                {
                    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1583 = _716 + _1581;
                    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1585;
                    float _1589 = 1.0 / _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1611 = _1583 * _1589;
                    float _1613 = precise::clamp(_1611, 0.0, 1.0);
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1619 = fma(_1613, _1593, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1621 = fma(_1613, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1623 = fma(_1613, _1597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1625 = fma(_1613, _1601, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1627 = fma(_1613, _1605, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1629 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1399 = _1621;
                    _1483 = _1627;
                    _1391 = _1619;
                    _1475 = _1625;
                    _1417 = _1623;
                    _1463 = _1629;
                    _1545 = true;
                }
                else
                {
                    _1399 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1545 = false;
    float _1631 = _1399;
    float _1633 = _1483;
    float _1635 = _1391;
    float _1637 = _1475;
    float _1639 = _1417;
    float _1641 = _1463;
    float _1643 = fma(_1355, -0.5, 0.5);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = -_1631;
    float _1649 = _1647 + _1633;
    float _1651 = _1427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1653 = -_1635;
    float _1655 = _1653 + _1637;
    float _1657 = fma(_1645, _1649, _1631);
    out.m_87.x = 0.0;
    float _1659 = -_1639;
    float _1661 = _1659 + _1641;
    float _1663 = fma(_1645, _1655, _1635);
    float _1665 = _1657 * 0.586610972881317138671875;
    out.m_49.x = _1651;
    bool _1667 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1669 = fma(_1645, _1661, _1639);
    float _1671 = fma(_1663, 0.298911988735198974609375, _1665);
    bool _1673 = _1423 > 0.0;
    bool _1675 = isnan(_1423);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = fma(_1669, 0.114477999508380889892578125, _1671);
    float _1685 = -_1683;
    float _1687 = _1663 + _1685;
    float _1689 = -_1683;
    float _1691 = _1657 + _1689;
    float _1693 = -_1683;
    float _1695 = _1669 + _1693;
    float _1697 = fma(_1687, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    float _1701 = fma(_1695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1683);
    bool _1703 = !_1667;
    if (!_1703)
    {
        float _1705 = -_688;
        float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1709 = -_690;
        float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1713 = -_692;
        float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1717 = _1707 * _1707;
        float _1719 = fma(_1711, _1711, _1717);
        float _1721 = fma(_1715, _1715, _1719);
        float _1723 = sqrt(_1721);
        float _1725 = rsqrt(_1721);
        float _1727 = -_1723;
        float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1731 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1733 = precise::clamp(_1731, 0.0, 1.0);
        float _1735 = _1711 * _1725;
        float _1737 = _1707 * _1725;
        float _1739 = abs(_1733);
        float _1741 = log2(_1739);
        float _1743 = _1715 * _1725;
        float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1747 = _1355 * _1737;
        float _1749 = -_1737;
        float _1751 = -_1745;
        float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1751);
        float _1755 = fma(_1353, _1735, _1747);
        float _1757 = -_1743;
        float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1753);
        float _1761 = fma(_1363, _1743, _1755);
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1767 = _1759 + _1765;
        float _1769 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1771 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        float _1775 = exp2(_1769);
        float _1777 = _1775 * _1773;
        float _1779 = _1763 * _1777;
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1783 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1781;
        out.m_87.y = _1783;
        out.m_87.z = _1785;
    }
    out.m_89.x = _1697;
    out.m_89.y = _1699;
    out.m_89.z = _1701;
    if (_1681)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

