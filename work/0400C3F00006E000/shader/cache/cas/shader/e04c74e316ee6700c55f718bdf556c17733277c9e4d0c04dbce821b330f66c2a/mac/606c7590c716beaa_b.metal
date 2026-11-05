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
    float4 m_79 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_65 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2173 = false;
    bool _302 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_124);
        out.gl_Position.z = _2477;
    }
    if (!_112)
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
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_162);
        out.gl_Position.z = _2546;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -_210;
    float _230 = _228 + 1.0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _232;
    float _236 = 1.0 / _214;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = _198 * _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _242;
    float _246 = _226 * _230;
    float _248 = fma(_234, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = -_226;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_244, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _260 = _248 * _246;
    float _262 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _258 * _246;
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _260);
    float _268 = _262 * _246;
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _264);
    float _272 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _266);
    float _276 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _278 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _270);
    bool _280 = !_238;
    float _282 = _272;
    float _300;
    if (!_280)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_108);
        float _306 = 1.0 / _304;
        float _308 = _140 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _316 = _314 != 0;
    float _318 = in.m_44.x;
    float _320 = in.m_44.y;
    float _322 = in.m_44.z;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _334 = _332 != 0;
    float _336 = in.m_53.x;
    float _338 = in.m_53.y;
    float _340 = in.m_53.z;
    float _342 = in.m_53.w;
    float _344 = in.m_55.x;
    float _346 = in.m_55.y;
    float _348 = in.m_55.z;
    float _350 = in.m_55.w;
    float _352 = _258;
    bool _354 = _330;
    bool _356 = _326;
    if (!_316)
    {
        float _358 = in.m_51.y;
        _352 = _358;
    }
    float _360 = _352;
    float _362 = in.m_51.x;
    float _364 = _312 * 2.0;
    float _366 = in.m_57.x;
    float _368 = in.m_57.y;
    float _370 = in.m_57.z;
    float _372 = in.m_57.w;
    float _374 = floor(_364);
    float _376 = _320 * _338;
    float _378 = _320 * _346;
    float _380 = fma(_318, _336, _376);
    if (!_316)
    {
        _282 = _360;
    }
    float _382 = _282;
    float _384 = fma(_318, _344, _378);
    float _386 = fma(_322, _340, _380);
    float _388 = _362 + _312;
    bool _390 = _374 > 0.0;
    float _392 = _382;
    float _394 = _360;
    if (_316)
    {
        float _396 = in.m_51.x;
        float _398 = in.m_51.y;
        _392 = _396;
        _394 = _398;
    }
    float _400 = _392;
    float _402 = _394;
    float _404 = _362 * 2.0;
    bool _406 = _374 >= 0.0;
    bool _408 = isnan(_374);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _388 + (-1.0);
    float _418 = fma(_322, _348, _384);
    float _420 = _386 + _342;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _424 = _414 ? 0 : 1;
    float _426 = floor(_404);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _430 = _416;
    if (!_316)
    {
        _430 = _312;
    }
    float _432 = _430;
    float _434 = _418 + _350;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _438 = ~_424;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _448 = log2(_446);
    int _450 = _442;
    float _452 = _432;
    if (!_390)
    {
        int _454 = ~_424;
        int _456 = _454 + 1;
        _450 = _456;
    }
    int _458 = _450;
    float _460 = _320 * _368;
    bool _462 = !_330;
    int _464 = _462 ? 0 : 1;
    float _466 = -_434;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = -_420;
    float _472 = _470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = fma(_318, _366, _460);
    if (_316)
    {
        _452 = _402;
    }
    float _476 = _452;
    float _478 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _422);
    float _480 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _482 = _402 * 2.0;
    bool _484 = _426 > 0.0;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[83].w, _436);
    float _488 = -_444;
    float _490 = fma(_480, 2.0, _488);
    float _492 = _476;
    if (!_316)
    {
        _492 = _312;
    }
    float _494 = _492;
    float _496 = floor(_482);
    float _498 = _362 + _402;
    float _500 = _494;
    if (_316)
    {
        _500 = _402;
    }
    float _502 = _500;
    float _504 = fma(_322, _370, _474);
    bool _506 = _426 >= 0.0;
    bool _508 = isnan(_426);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _518 = _502 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _520 = !_326;
    int _522 = _520 ? 0 : 1;
    float _524 = _498 + (-1.0);
    int _526 = _514 ? 0 : 1;
    float _528 = fma(_518, -2.0, _516);
    float _530 = _448 * _140;
    int _532 = abs(_522);
    float _534 = _504 + _372;
    bool _536 = _496 > 0.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _540 = _496 >= 0.0;
    bool _542 = isnan(_496);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = exp2(_530);
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    int _558 = abs(_464);
    float _560 = -_534;
    float _562 = _560 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _564 = ~_526;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    int _574 = _568;
    if (!_484)
    {
        int _576 = ~_526;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = _312 + _402;
    float _584 = 1.0 / _572;
    float _586 = _582 + (-1.0);
    float _588 = float(_458);
    float _590 = -_550;
    float _592 = _590 + 1.0;
    float _594 = float(_558);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _598 = float(_580);
    float _600 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _486);
    float _602 = float(_532);
    bool _604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _594 * _598;
    float _616 = _468 * _468;
    bool _618 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _602 * _588;
    float _630 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _478);
    float _632 = fma(_562, _562, _616);
    float _634 = _626 ? _592 : 0.0;
    float _636 = _628 * (-2.0);
    float _638 = -_140;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _642 = fma(_472, _472, _632);
    float _644 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _528);
    float _646 = fma(_538, _636, _538);
    if (_612)
    {
        float _648 = _634 * _584;
        _144 = _648;
    }
    float _650 = _144;
    float _652 = fma(_636, _552, _552);
    float _654 = _362 + (-0.5);
    float _656 = rsqrt(_642);
    int _658 = _548 ? 0 : 1;
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = _614 * (-2.0);
    bool _664 = !_334;
    int _666 = _664 ? 0 : 1;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = fma(_596, _662, _596);
    float _676 = fma(_662, _554, _554);
    int _678 = abs(_666);
    float _680 = _402 + (-0.5);
    int _682 = _672;
    if (!_536)
    {
        int _684 = ~_658;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_646, _650, _660);
    float _692 = float(_678);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _696 = float(_688);
    float _698 = _690 * 0.15915493667125701904296875;
    float _700 = _562 * _656;
    float _702 = _468 * _656;
    float _704 = _472 * _656;
    float _706 = fma(_674, _650, _694);
    float _708 = _692 * _696;
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _718 = _700 * _716;
    float _720 = _706 * 0.15915493667125701904296875;
    float _722 = _708 * (-2.0);
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _732 = -_718;
    float _734 = fma(_704, _730, _732);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = _704 * _736;
    float _740 = fma(_428, _722, _428);
    float _742 = fma(_722, _556, _556);
    float _744 = _312 + (-0.5);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _752 = -_738;
    float _754 = fma(_702, _750, _752);
    float _756 = _734 * _734;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _760 = fma(_754, _754, _756);
    float _762 = fma(_740, _650, _758);
    float _764 = _698 * 6.283185482025146484375;
    float _766 = cos(_764);
    bool _768 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _770 = isnan(0.5);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _776 = _772 || _774;
    float _778 = _762 * 0.15915493667125701904296875;
    float _780 = _276 * _712;
    float _782 = _274 * _710;
    float _784 = _720 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _790 = _702 * _788;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _794 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_790;
    float _802 = fma(_700, _798, _800);
    float _804 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _794 * _792;
    float _808 = _720 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = fma(_802, _802, _760);
    float _814 = _278 * _714;
    float _816 = _804 * _796;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _778 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _766 * _786;
    float _828 = _748 * _786;
    float _830 = _820 * _818;
    float _832 = _778 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _748 * _810;
    float _838 = _766 * _810;
    float _840 = rsqrt(_812);
    float _842 = _766 * _824;
    float _844 = _748 * _824;
    float _846 = _810 * _824;
    float _848 = _786 * _824;
    float _850 = _844 * _806;
    float _852 = -_826;
    float _854 = fma(_834, _836, _852);
    float _856 = -_836;
    float _858 = fma(_834, _826, _856);
    float _860 = fma(_834, _838, _828);
    float _862 = _842 * _806;
    float _864 = -_806;
    float _866 = _834 * _864;
    float _868 = fma(_834, _828, _838);
    float _870 = fma(_854, _816, _850);
    float _872 = fma(_860, _816, _862);
    float _874 = _754 * _840;
    float _876 = _734 * _840;
    float _878 = fma(_846, _816, _866);
    float _880 = _802 * _840;
    float _882 = _702 * _874;
    float _884 = _704 * _876;
    float _886 = fma(_858, _830, _872);
    float _888 = fma(_848, _830, _878);
    float _890 = -_882;
    float _892 = fma(_700, _876, _890);
    float _894 = -_884;
    float _896 = fma(_702, _880, _894);
    float _898 = fma(_868, _830, _870);
    float _900 = _700 * _880;
    float _902 = _892 * _886;
    float _904 = _896 * _886;
    float _906 = -_900;
    float _908 = fma(_704, _874, _906);
    float _910 = fma(_880, _888, _902);
    float _912 = fma(_874, _888, _904);
    float _914 = _908 * _886;
    float _916 = fma(_704, _898, _910);
    float _918 = fma(_700, _898, _912);
    float _920 = fma(_876, _888, _914);
    float _922 = _420 + _916;
    float _924 = _534 + _918;
    float _926 = fma(_702, _898, _920);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _922 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _924 + _932;
    float _936 = _434 + _926;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    bool _944 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = 0.0;
    float _948 = _924;
    float _950 = _922;
    float _952 = _778;
    float _954 = _802;
    if (!_944)
    {
        _946 = _936;
    }
    float _956 = _946;
    bool _958 = !_944;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _942 + _964;
        float _968 = rsqrt(_940);
        float _970 = _966 * _962;
        float _972 = _936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 + (-1.0);
        float _986 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_982, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = fma(_936, _978, _986);
        float _992 = _968 * _988;
        float _994 = fma(_934, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _996 = fma(_930, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _994;
        _960 = _990;
        _950 = _996;
    }
    float _998 = _948;
    float _1000 = _960;
    float _1002 = _950;
    float _1004 = _1000;
    float _1006 = _998;
    float _1008 = _1002;
    if (!_776)
    {
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1012 = _434 + _1010;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1016 = _534 + _1014;
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1020 = -_534;
        float _1022 = _1020 + _998;
        float _1024 = _1012 * _1012;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1028 = _420 + _1026;
        float _1030 = fma(_1016, _1016, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1028, _1028, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = _1038 * _1042;
        float _1046 = -_434;
        float _1048 = _1046 + _1000;
        float _1050 = -_420;
        float _1052 = _1050 + _1002;
        float _1054 = fma(_1022, _1044, _534);
        float _1056 = fma(_1048, _1044, _434);
        float _1058 = fma(_1052, _1044, _420);
        _1004 = _1056;
        _1006 = _1054;
        _1008 = _1058;
    }
    float _1060 = _1004;
    float _1062 = _1006;
    float _1064 = _1008;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1060 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1062 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1080;
    float _1110 = _1098;
    float _1112 = _1106;
    float _1114 = _1088;
    float _1116 = _1090;
    if (_1102)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1118;
    }
    float _1120 = _1108;
    if (_1102)
    {
        float _1122 = rsqrt(_1098);
        _1110 = _1122;
    }
    float _1124 = _1110;
    if (_1102)
    {
        float _1126 = _1106 * _1120;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1102)
    {
        float _1130 = _1128 * 0.15915493667125701904296875;
        _952 = _1130;
    }
    float _1132 = _952;
    float _1134 = _1120;
    if (_1102)
    {
        float _1136 = _1132 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        _1134 = _1138;
    }
    float _1140 = _1134;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1144 = precise::max(0.0, _1142);
    float _1146 = _930;
    float _1148 = _1144;
    if (_1102)
    {
        float _1150 = _1132 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = -_1088;
    float _1158 = -_1144;
    float _1160 = fma(_1068, _1156, _1158);
    if (_1102)
    {
        float _1162 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1162;
    }
    float _1164 = _1148;
    float _1166 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1164;
    float _1170 = _1140;
    if (_1102)
    {
        float _1172 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1174;
    if (!_1102)
    {
        _1168 = _1160;
    }
    float _1178 = _1168;
    float _1180 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1182 = _1178;
    float _1184 = _1154;
    if (_1102)
    {
        float _1186 = _1154 + (-1.0);
        _1170 = _1186;
    }
    float _1188 = _1170;
    float _1190 = 0.0;
    float _1192 = _1188;
    if (_1102)
    {
        float _1194 = _1124 * _1174;
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (!_1102)
    {
        _1176 = _1094;
    }
    float _1198 = _1176;
    float _1200 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1198;
    if (_1102)
    {
        float _1204 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _954 = _1204;
    }
    float _1206 = _954;
    if (_1102)
    {
        float _1208 = _1090 * _1196;
        _1116 = _1208;
    }
    float _1210 = _1116;
    if (!_1102)
    {
        _1192 = _1092;
    }
    float _1212 = _1192;
    float _1214 = _1212;
    if (_1102)
    {
        float _1216 = _1092 * _1196;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1102)
    {
        float _1220 = fma(_1160, _1154, _1206);
        _1182 = _1220;
    }
    float _1222 = _1182;
    if (_1102)
    {
        float _1224 = _1210 * _1210;
        _1202 = _1224;
    }
    float _1226 = _1202;
    if (!_1102)
    {
        _1184 = _1096;
    }
    float _1228 = _1184;
    float _1230 = _1228;
    if (_1102)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1200);
    float _1238 = fma(_1222, _1222, _1226);
    float _1240 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1244 = _1238 + _1234;
    float _1246 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1248 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = rsqrt(_1244);
    float _1258 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1246);
    float _1260 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = abs(_1266);
    float _1280 = log2(_1278);
    float _1282 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1272);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1286 = -_1276;
    float _1288 = fma(_1286, _1248, 1.0);
    float _1290 = _1256 * _1222;
    float _1292 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1282);
    float _1300 = log2(_1288);
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1290 + 1.0;
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = -_1302;
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1314 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1316 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1318 = -_1296;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1322 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1312);
    float _1328 = fma(_1320, -0.5, 0.5);
    float _1330 = fma(_1320, 0.5, 0.5);
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1322);
    float _1334 = _1300 * 0.693147182464599609375;
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1316);
    float _1340 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = fma(_1330, _1344, 1.570728778839111328125);
    float _1350 = sqrt(_1328);
    float _1352 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1326);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1352);
    float _1356 = _1346 * _1324;
    float _1358 = -_1290;
    float _1360 = fma(_1338, _1304, _1358);
    float _1362 = _1354 * _1324;
    float _1364 = fma(_1356, 0.5, 0.5);
    float _1366 = fma(_1362, -0.5, 0.5);
    float _1368 = _1350 * 0.636619746685028076171875;
    float _1370 = -_1348;
    float _1372 = fma(_1368, _1370, 1.0);
    float _1374 = fma(_1360, 0.5, 0.5);
    float3 _4404 = float3(_1364, _1366, _1342);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4404, float3(0.0), isnan(_4404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4404, float3(0.0), isnan(_4404)), level(0.0)).x;
    float3 _4415 = float3(_1364, _1366, _1342);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4415, float3(0.0), isnan(_4415)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4415, float3(0.0), isnan(_4415)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _4432 = float2(_1372, _1374);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4432, float2(0.0), isnan(_4432)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4432, float2(0.0), isnan(_4432)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_51.w;
    float _1401 = _434 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1403 = in.m_65.x;
    float _1405 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_65.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = in.m_65.w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = in.m_65.z;
    float _1435 = 1.0 / _1419;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1441 = as_type<int>(_1401);
    float _1443 = _1354;
    float _1445 = _1346;
    if (_1409)
    {
        bool _1447 = _362 > 0.5;
        _354 = _1447;
    }
    bool _1449 = _354;
    float _1451 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    out.m_67.x = _1072;
    out.m_67.y = _1068;
    out.m_67.z = _1076;
    bool _1453 = _1399 > 0.5;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1459 = 1.0 / _1439;
    out.m_69.x = _1403;
    if (_1415)
    {
        bool _1461 = _312 > 0.5;
        _356 = _1461;
    }
    bool _1463 = _356;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.y = _1411;
    bool _1469 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1471 = isnan(_310);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / _1457;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_69.w = _1425;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1493;
    out.m_69.z = _1433;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = 1.0 / _1485;
    float _1501 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1495 * _1435;
    float _1507 = in.m_71.x;
    bool _1509 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_310);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1467 * _1481;
    float _1523 = -_1479;
    float _1525 = _1523 + 1.0;
    float _1527 = in.m_71.y;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    out.m_73.x = _1497;
    out.m_73.y = _1501;
    out.m_73.z = _1503;
    float _1541 = _1531 * _1459;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1545 = _310 + _1543;
    float _1547 = exp2(_1405);
    float _1549 = _1535 * _1499;
    float _1551 = _1314 * 0.5;
    bool _1553 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1555 = isnan(_310);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    float _1565 = fma(_1505, _1545, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _310 + _1567;
    bool _1571 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1573 = isnan(_310);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = -_1563;
    float _1585 = _1583 + 1.0;
    float _1587 = fma(_1521, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1589 = _1563 * _1539;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = _1581 * _1585;
    bool _1597 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1599 = isnan(_310);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1605 = _1601 || _1603;
    int _1607 = _1605 ? 1065353216 : 0;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _310 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1617 = _310 + _1615;
    float _1619 = -_1527;
    float _1621 = _1619 + 1.0;
    float _1623 = _1479 * _1593;
    float _1625 = as_type<float>(_1607) * _1525;
    float _1627 = -as_type<float>(_1607);
    float _1629 = _1627 + 1.0;
    int _1631 = _1607;
    float _1633 = _1617;
    float _1635 = _1507;
    float _1637 = _1527;
    if (_1409)
    {
        float _1639 = -_1507;
        float _1641 = _1639 + 1.0;
        _1631 = as_type<int>(_1641);
    }
    int _1643 = _1631;
    int _1645 = _1453 ? as_type<int>(_1621) : as_type<int>(_1527);
    float _1647 = _1565 * _1625;
    float _1649 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1401);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1653 = _1423 ? as_type<float>(_1645) : _1527;
    float _1655 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1647);
    float _1657 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1649);
    float _1659 = fma(_1541, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1661 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1663 = fma(_1549, _1617, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_1409)
    {
        _1633 = _1507;
    }
    float _1665 = _1633;
    float _1667 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = fma(_1661, _1653, -0.5);
    float _1671 = _1665;
    if (_1409)
    {
        float _1673 = _1449 ? as_type<float>(_1643) : _1507;
        _1671 = _1673;
    }
    float _1675 = _1671;
    float _1677 = _434 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = in.m_75.x;
    float _1681 = in.m_75.y;
    float _1683 = in.m_75.z;
    bool _1685 = _726 != 0.0;
    bool _1687 = isnan(_726);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    if (_1415)
    {
        float _1695 = -_1507;
        float _1697 = _1695 + 1.0;
        _1441 = as_type<int>(_1697);
    }
    int _1699 = _1441;
    float _1701 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1703 = 1.0 / _1667;
    bool _1705 = _724 == 0.0;
    bool _1707 = !_1693;
    bool _1709 = _1705 && _1707;
    float _1711 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1713 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1701);
    bool _1715 = _402 > 0.5;
    float _1717 = fma(_1587, _1623, _1655);
    if (_1415)
    {
        float _1719 = _1463 ? as_type<float>(_1699) : _1507;
        _1635 = _1719;
    }
    float _1721 = _1635;
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1727 = _728 == 0.0;
    bool _1729 = _1727 && _1709;
    float _1731 = fma(_1659, _1595, _1717);
    float _1733 = fma(_1711, _1721, -0.5);
    if (_1429)
    {
        float _1735 = _1715 ? _1621 : _1527;
        _1637 = _1735;
    }
    float _1737 = _1637;
    float _1739 = _1723 + _1667;
    float _1741 = -_644;
    float _1743 = fma(_600, _1669, _1741);
    float _1745 = fma(_630, _1733, _640);
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1749 = fma(_1663, _1589, _1731);
    float _1751 = _1739 * _1703;
    float _1753 = _1751 * 0.5;
    float _1755 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1757 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1759 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1749);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = _1755 * _1725;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1769 = _1681;
    float _1771 = _1679;
    float _1773 = _1683;
    if (!_1729)
    {
        float _1775 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1681);
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1745 + 0.5;
    float _1781 = _1743 + 0.5;
    float _1783 = _1757 * _1747;
    float _1785 = _842 * _896;
    float _1787 = _842 * _908;
    float _1789 = _842 * _892;
    float _1791 = _860 * _908;
    if (!_1729)
    {
        float _1793 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1679);
        _1771 = _1793;
    }
    float _1795 = _1771;
    float _1797 = _858 * _908;
    float _1799 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1729)
    {
        float _1807 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1683);
        _1773 = _1807;
    }
    float _1809 = _1773;
    out.m_77.x = _1783;
    out.m_77.y = _1763;
    out.m_77.z = _1779;
    out.m_77.w = _1781;
    float _1811 = _860 * _896;
    float _1813 = _860 * _892;
    float _1815 = -_834;
    float _1817 = fma(_1815, _876, _1787);
    float _1819 = fma(_846, _876, _1791);
    float _1821 = _858 * _892;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1825 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1823);
    out.m_79.x = _1799;
    out.m_79.y = _1801;
    out.m_79.z = _1803;
    out.m_79.w = _1805;
    float _1827 = -_834;
    float _1829 = fma(_1827, _874, _1785);
    float _1831 = -_834;
    float _1833 = fma(_1831, _880, _1789);
    float _1835 = fma(_846, _874, _1811);
    float _1837 = fma(_844, _702, _1817);
    float _1839 = fma(_854, _702, _1819);
    float _1841 = fma(_846, _880, _1813);
    float _1843 = fma(_848, _876, _1797);
    float _1845 = fma(_848, _880, _1821);
    float _1847 = fma(_844, _700, _1829);
    float _1849 = fma(_844, _704, _1833);
    float _1851 = fma(_868, _702, _1843);
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1825;
    float _1865 = _858 * _896;
    float _1867 = fma(_854, _700, _1835);
    float _1869 = fma(_854, _704, _1841);
    float _1871 = fma(_868, _704, _1845);
    float _1873 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1875 = _1847 * _1777;
    float _1877 = fma(_848, _874, _1865);
    float _1879 = _1837 * _1777;
    float _1881 = _1849 * _1777;
    float _1883 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1873);
    float _1885 = fma(_1867, _1795, _1875);
    float _1887 = fma(_868, _700, _1877);
    float _1889 = fma(_1839, _1795, _1879);
    float _1891 = _1346 + _1314;
    float _1893 = fma(_1869, _1795, _1881);
    float _1895 = _1883 + _1314;
    float _1897 = -_1547;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1887, _1809, _1885);
    float _1903 = fma(_1851, _1809, _1889);
    float _1905 = _1891 * 0.5;
    float _1907 = fma(_1871, _1809, _1893);
    float _1909 = fma(_1354, -0.5, _1551);
    float _1911 = _1893;
    float _1913 = _1851;
    float _1915 = _1909;
    if (_1861)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = _1895 * 0.5;
    float _1921 = _1917;
    float _1923 = _1919;
    if (_1861)
    {
        _1913 = 1.0;
    }
    float _1925 = _1913;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1863 * _1929;
    float _1933 = _1925;
    float _1935 = _1314;
    if (!_1861)
    {
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = _1937 * 0.15915493667125701904296875;
        float _1941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = _1939 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1941 * 0.15915493667125701904296875;
        float _1953 = _1939 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1949;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1945;
        float _1973 = 1.0 / _1969;
        float _1975 = _1967 * _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = fma(_1931, _1975, _1977);
        float _1981 = _1979 * _1971;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1921 = _1983;
    }
    float _1985 = _1921;
    if (!_1861)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1931, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1933 = _2037;
    }
    float _2039 = _1933;
    float _2041 = _1927 * _1376;
    float _2043 = -_1927;
    float _2045 = _2043 + 1.0;
    out.m_81.x = _1901;
    out.m_81.y = _1903;
    out.m_81.z = _1907;
    bool _2047 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1086);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _1387 * _2041;
    float _2059 = _1397 * _2041;
    float _2061 = _1387 * _2045;
    out.m_83.x = _1905;
    out.m_83.y = _1909;
    out.m_83.z = _1919;
    out.m_83.w = _1314;
    float _2063 = fma(_1393, _2057, _1381);
    float _2065 = fma(_1395, _2057, _1383);
    float _2067 = fma(_1387, _2059, _1385);
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1883;
    out.gl_Position.w = _1314;
    out.m_85.x = _2063;
    out.m_85.y = _2065;
    out.m_85.z = _2067;
    out.m_85.w = _2061;
    float _2069 = _1985 * _2039;
    float _2071 = _2069;
    if (!_2055)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2073 = _1935;
    float _2075 = _2073;
    float _2077 = _2073;
    if (!_2055)
    {
        _1923 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2079 = _1923;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2083 = _2079;
    float _2085 = _2079;
    if (!_2055)
    {
        _1443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1443;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2055)
    {
        _1445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1445;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2055)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1915;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2055)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _2071;
    bool _2107 = !_2055;
    float _2109 = _2105;
    float _2111 = _2105;
    if (!_2107)
    {
        bool _2113 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2115 = isnan(_1086);
        bool _2117 = _2113 || _2115;
        bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2121 = _2117 || _2119;
        if (!_2121)
        {
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = _1086 + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2129 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2127;
            float _2131 = 1.0 / _2129;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2153 = _2125 * _2131;
            float _2155 = precise::clamp(_2153, 0.0, 1.0);
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2161 = fma(_2155, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2163 = fma(_2155, _2159, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2165 = fma(_2155, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2167 = fma(_2155, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2169 = fma(_2155, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2171 = fma(_2155, _2151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2163;
            _2103 = _2169;
            _2091 = _2161;
            _2085 = _2167;
            _2077 = _2165;
            _2111 = _2171;
            _2173 = true;
        }
        else
        {
            bool _2175 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2177 = isnan(_1086);
            bool _2179 = _2175 || _2177;
            bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2183 = _2179 || _2181;
            if (!_2183)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2185 = _2089;
            _2091 = _2185;
            if (!_2183)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2187 = _2095;
            _2097 = _2187;
            if (!_2183)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2189 = _2075;
            _2077 = _2189;
            if (!_2183)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2191 = _2083;
            _2085 = _2191;
            if (!_2183)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2193 = _2101;
            _2103 = _2193;
            if (!_2183)
            {
                _2109 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2195 = _2109;
            bool _2197 = !_2183;
            _2111 = _2195;
            if (!_2197)
            {
                bool _2199 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1086);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1086 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = 1.0 / _2215;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2239 = _2211 * _2217;
                    float _2241 = precise::clamp(_2239, 0.0, 1.0);
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2247 = fma(_2241, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2249;
                    _2103 = _2255;
                    _2091 = _2247;
                    _2085 = _2253;
                    _2077 = _2251;
                    _2111 = _2257;
                    _2173 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2111 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2173 = false;
    float _2259 = _2097;
    float _2261 = _2103;
    float _2263 = _2091;
    float _2265 = _2085;
    float _2267 = _2077;
    float _2269 = _2111;
    float _2271 = _2081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2273 = fma(_1903, -0.5, 0.5);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2259;
    float _2279 = _2277 + _2261;
    float _2281 = -_2263;
    float _2283 = _2281 + _2265;
    out.m_47.x = _2271;
    float _2285 = fma(_2275, _2279, _2259);
    float _2287 = -_2267;
    float _2289 = _2287 + _2269;
    float _2291 = fma(_2275, _2283, _2263);
    float _2293 = _2285 * 0.586610972881317138671875;
    bool _2295 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2297 = fma(_2275, _2289, _2267);
    out.m_87.x = 0.0;
    float _2299 = fma(_2291, 0.298911988735198974609375, _2293);
    bool _2301 = _1985 > 0.0;
    bool _2303 = isnan(_1985);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2297, 0.114477999508380889892578125, _2299);
    bool _2313 = _2039 <= 0.0;
    bool _2315 = !_2309;
    bool _2317 = _2313 || _2315;
    float _2319 = -_2311;
    float _2321 = _2291 + _2319;
    float _2323 = -_2311;
    float _2325 = _2285 + _2323;
    float _2327 = -_2311;
    float _2329 = _2297 + _2327;
    float _2331 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2335 = fma(_2329, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    bool _2337 = !_2295;
    if (!_2337)
    {
        float _2339 = -_1060;
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2343 = -_1062;
        float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2347 = -_1064;
        float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2351 = _2341 * _2341;
        float _2353 = fma(_2345, _2345, _2351);
        float _2355 = fma(_2349, _2349, _2353);
        float _2357 = sqrt(_2355);
        float _2359 = rsqrt(_2355);
        float _2361 = -_2357;
        float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = _2345 * _2359;
        float _2371 = _2341 * _2359;
        float _2373 = abs(_2367);
        float _2375 = log2(_2373);
        float _2377 = _2349 * _2359;
        float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2381 = _1903 * _2371;
        float _2383 = -_2371;
        float _2385 = -_2379;
        float _2387 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2385);
        float _2389 = fma(_1901, _2369, _2381);
        float _2391 = -_2377;
        float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2387);
        float _2395 = fma(_1907, _2377, _2389);
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2401 = _2393 + _2399;
        float _2403 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2407 = precise::clamp(_2405, 0.0, 1.0);
        float _2409 = exp2(_2403);
        float _2411 = _2409 * _2407;
        float _2413 = _2397 * _2411;
        float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2417 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2415;
        out.m_87.y = _2417;
        out.m_87.z = _2419;
    }
    out.m_89.x = _2331;
    out.m_89.y = _2333;
    out.m_89.z = _2335;
    if (!_2317)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2173 = false;
    bool _302 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_124);
        out.gl_Position.z = _2477;
    }
    if (!_112)
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
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_162);
        out.gl_Position.z = _2546;
    }
    if (_154)
    {
        return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -_210;
    float _230 = _228 + 1.0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _232;
    float _236 = 1.0 / _214;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = _198 * _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _242;
    float _246 = _226 * _230;
    float _248 = fma(_234, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = -_226;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_244, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _260 = _248 * _246;
    float _262 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _258 * _246;
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _260);
    float _268 = _262 * _246;
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _264);
    float _272 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _266);
    float _276 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _278 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _270);
    bool _280 = !_238;
    float _282 = _272;
    float _300;
    if (!_280)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_108);
        float _306 = 1.0 / _304;
        float _308 = _140 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _316 = _314 != 0;
    float _318 = in.m_44.x;
    float _320 = in.m_44.y;
    float _322 = in.m_44.z;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _334 = _332 != 0;
    float _336 = in.m_53.x;
    float _338 = in.m_53.y;
    float _340 = in.m_53.z;
    float _342 = in.m_53.w;
    float _344 = in.m_55.x;
    float _346 = in.m_55.y;
    float _348 = in.m_55.z;
    float _350 = in.m_55.w;
    float _352 = _258;
    bool _354 = _330;
    bool _356 = _326;
    if (!_316)
    {
        float _358 = in.m_51.y;
        _352 = _358;
    }
    float _360 = _352;
    float _362 = in.m_51.x;
    float _364 = _312 * 2.0;
    float _366 = in.m_57.x;
    float _368 = in.m_57.y;
    float _370 = in.m_57.z;
    float _372 = in.m_57.w;
    float _374 = floor(_364);
    float _376 = _320 * _338;
    float _378 = _320 * _346;
    float _380 = fma(_318, _336, _376);
    if (!_316)
    {
        _282 = _360;
    }
    float _382 = _282;
    float _384 = fma(_318, _344, _378);
    float _386 = fma(_322, _340, _380);
    float _388 = _362 + _312;
    bool _390 = _374 > 0.0;
    float _392 = _382;
    float _394 = _360;
    if (_316)
    {
        float _396 = in.m_51.x;
        float _398 = in.m_51.y;
        _392 = _396;
        _394 = _398;
    }
    float _400 = _392;
    float _402 = _394;
    float _404 = _362 * 2.0;
    bool _406 = _374 >= 0.0;
    bool _408 = isnan(_374);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _388 + (-1.0);
    float _418 = fma(_322, _348, _384);
    float _420 = _386 + _342;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _424 = _414 ? 0 : 1;
    float _426 = floor(_404);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _430 = _416;
    if (!_316)
    {
        _430 = _312;
    }
    float _432 = _430;
    float _434 = _418 + _350;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _438 = ~_424;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _448 = log2(_446);
    int _450 = _442;
    float _452 = _432;
    if (!_390)
    {
        int _454 = ~_424;
        int _456 = _454 + 1;
        _450 = _456;
    }
    int _458 = _450;
    float _460 = _320 * _368;
    bool _462 = !_330;
    int _464 = _462 ? 0 : 1;
    float _466 = -_434;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = -_420;
    float _472 = _470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = fma(_318, _366, _460);
    if (_316)
    {
        _452 = _402;
    }
    float _476 = _452;
    float _478 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _422);
    float _480 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _482 = _402 * 2.0;
    bool _484 = _426 > 0.0;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[83].w, _436);
    float _488 = -_444;
    float _490 = fma(_480, 2.0, _488);
    float _492 = _476;
    if (!_316)
    {
        _492 = _312;
    }
    float _494 = _492;
    float _496 = floor(_482);
    float _498 = _362 + _402;
    float _500 = _494;
    if (_316)
    {
        _500 = _402;
    }
    float _502 = _500;
    float _504 = fma(_322, _370, _474);
    bool _506 = _426 >= 0.0;
    bool _508 = isnan(_426);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _518 = _502 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _520 = !_326;
    int _522 = _520 ? 0 : 1;
    float _524 = _498 + (-1.0);
    int _526 = _514 ? 0 : 1;
    float _528 = fma(_518, -2.0, _516);
    float _530 = _448 * _140;
    int _532 = abs(_522);
    float _534 = _504 + _372;
    bool _536 = _496 > 0.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _540 = _496 >= 0.0;
    bool _542 = isnan(_496);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = exp2(_530);
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    int _558 = abs(_464);
    float _560 = -_534;
    float _562 = _560 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _564 = ~_526;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    int _574 = _568;
    if (!_484)
    {
        int _576 = ~_526;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = _312 + _402;
    float _584 = 1.0 / _572;
    float _586 = _582 + (-1.0);
    float _588 = float(_458);
    float _590 = -_550;
    float _592 = _590 + 1.0;
    float _594 = float(_558);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _598 = float(_580);
    float _600 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _486);
    float _602 = float(_532);
    bool _604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _594 * _598;
    float _616 = _468 * _468;
    bool _618 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _602 * _588;
    float _630 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _478);
    float _632 = fma(_562, _562, _616);
    float _634 = _626 ? _592 : 0.0;
    float _636 = _628 * (-2.0);
    float _638 = -_140;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _642 = fma(_472, _472, _632);
    float _644 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _528);
    float _646 = fma(_538, _636, _538);
    if (_612)
    {
        float _648 = _634 * _584;
        _144 = _648;
    }
    float _650 = _144;
    float _652 = fma(_636, _552, _552);
    float _654 = _362 + (-0.5);
    float _656 = rsqrt(_642);
    int _658 = _548 ? 0 : 1;
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = _614 * (-2.0);
    bool _664 = !_334;
    int _666 = _664 ? 0 : 1;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = fma(_596, _662, _596);
    float _676 = fma(_662, _554, _554);
    int _678 = abs(_666);
    float _680 = _402 + (-0.5);
    int _682 = _672;
    if (!_536)
    {
        int _684 = ~_658;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_646, _650, _660);
    float _692 = float(_678);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _696 = float(_688);
    float _698 = _690 * 0.15915493667125701904296875;
    float _700 = _562 * _656;
    float _702 = _468 * _656;
    float _704 = _472 * _656;
    float _706 = fma(_674, _650, _694);
    float _708 = _692 * _696;
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _718 = _700 * _716;
    float _720 = _706 * 0.15915493667125701904296875;
    float _722 = _708 * (-2.0);
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _732 = -_718;
    float _734 = fma(_704, _730, _732);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = _704 * _736;
    float _740 = fma(_428, _722, _428);
    float _742 = fma(_722, _556, _556);
    float _744 = _312 + (-0.5);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _752 = -_738;
    float _754 = fma(_702, _750, _752);
    float _756 = _734 * _734;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _760 = fma(_754, _754, _756);
    float _762 = fma(_740, _650, _758);
    float _764 = _698 * 6.283185482025146484375;
    float _766 = cos(_764);
    bool _768 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _770 = isnan(0.5);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _776 = _772 || _774;
    float _778 = _762 * 0.15915493667125701904296875;
    float _780 = _276 * _712;
    float _782 = _274 * _710;
    float _784 = _720 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _790 = _702 * _788;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _794 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_790;
    float _802 = fma(_700, _798, _800);
    float _804 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _794 * _792;
    float _808 = _720 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = fma(_802, _802, _760);
    float _814 = _278 * _714;
    float _816 = _804 * _796;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _778 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _766 * _786;
    float _828 = _748 * _786;
    float _830 = _820 * _818;
    float _832 = _778 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _748 * _810;
    float _838 = _766 * _810;
    float _840 = rsqrt(_812);
    float _842 = _766 * _824;
    float _844 = _748 * _824;
    float _846 = _810 * _824;
    float _848 = _786 * _824;
    float _850 = _844 * _806;
    float _852 = -_826;
    float _854 = fma(_834, _836, _852);
    float _856 = -_836;
    float _858 = fma(_834, _826, _856);
    float _860 = fma(_834, _838, _828);
    float _862 = _842 * _806;
    float _864 = -_806;
    float _866 = _834 * _864;
    float _868 = fma(_834, _828, _838);
    float _870 = fma(_854, _816, _850);
    float _872 = fma(_860, _816, _862);
    float _874 = _754 * _840;
    float _876 = _734 * _840;
    float _878 = fma(_846, _816, _866);
    float _880 = _802 * _840;
    float _882 = _702 * _874;
    float _884 = _704 * _876;
    float _886 = fma(_858, _830, _872);
    float _888 = fma(_848, _830, _878);
    float _890 = -_882;
    float _892 = fma(_700, _876, _890);
    float _894 = -_884;
    float _896 = fma(_702, _880, _894);
    float _898 = fma(_868, _830, _870);
    float _900 = _700 * _880;
    float _902 = _892 * _886;
    float _904 = _896 * _886;
    float _906 = -_900;
    float _908 = fma(_704, _874, _906);
    float _910 = fma(_880, _888, _902);
    float _912 = fma(_874, _888, _904);
    float _914 = _908 * _886;
    float _916 = fma(_704, _898, _910);
    float _918 = fma(_700, _898, _912);
    float _920 = fma(_876, _888, _914);
    float _922 = _420 + _916;
    float _924 = _534 + _918;
    float _926 = fma(_702, _898, _920);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _922 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _924 + _932;
    float _936 = _434 + _926;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    bool _944 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = 0.0;
    float _948 = _924;
    float _950 = _922;
    float _952 = _778;
    float _954 = _802;
    if (!_944)
    {
        _946 = _936;
    }
    float _956 = _946;
    bool _958 = !_944;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _942 + _964;
        float _968 = rsqrt(_940);
        float _970 = _966 * _962;
        float _972 = _936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 + (-1.0);
        float _986 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_982, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = fma(_936, _978, _986);
        float _992 = _968 * _988;
        float _994 = fma(_934, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _996 = fma(_930, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _994;
        _960 = _990;
        _950 = _996;
    }
    float _998 = _948;
    float _1000 = _960;
    float _1002 = _950;
    float _1004 = _1000;
    float _1006 = _998;
    float _1008 = _1002;
    if (!_776)
    {
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1012 = _434 + _1010;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1016 = _534 + _1014;
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1020 = -_534;
        float _1022 = _1020 + _998;
        float _1024 = _1012 * _1012;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1028 = _420 + _1026;
        float _1030 = fma(_1016, _1016, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1028, _1028, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = _1038 * _1042;
        float _1046 = -_434;
        float _1048 = _1046 + _1000;
        float _1050 = -_420;
        float _1052 = _1050 + _1002;
        float _1054 = fma(_1022, _1044, _534);
        float _1056 = fma(_1048, _1044, _434);
        float _1058 = fma(_1052, _1044, _420);
        _1004 = _1056;
        _1006 = _1054;
        _1008 = _1058;
    }
    float _1060 = _1004;
    float _1062 = _1006;
    float _1064 = _1008;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1060 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1062 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1080;
    float _1110 = _1098;
    float _1112 = _1106;
    float _1114 = _1088;
    float _1116 = _1090;
    if (_1102)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1118;
    }
    float _1120 = _1108;
    if (_1102)
    {
        float _1122 = rsqrt(_1098);
        _1110 = _1122;
    }
    float _1124 = _1110;
    if (_1102)
    {
        float _1126 = _1106 * _1120;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1102)
    {
        float _1130 = _1128 * 0.15915493667125701904296875;
        _952 = _1130;
    }
    float _1132 = _952;
    float _1134 = _1120;
    if (_1102)
    {
        float _1136 = _1132 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        _1134 = _1138;
    }
    float _1140 = _1134;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1144 = precise::max(0.0, _1142);
    float _1146 = _930;
    float _1148 = _1144;
    if (_1102)
    {
        float _1150 = _1132 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = -_1088;
    float _1158 = -_1144;
    float _1160 = fma(_1068, _1156, _1158);
    if (_1102)
    {
        float _1162 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1162;
    }
    float _1164 = _1148;
    float _1166 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1164;
    float _1170 = _1140;
    if (_1102)
    {
        float _1172 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1174;
    if (!_1102)
    {
        _1168 = _1160;
    }
    float _1178 = _1168;
    float _1180 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1182 = _1178;
    float _1184 = _1154;
    if (_1102)
    {
        float _1186 = _1154 + (-1.0);
        _1170 = _1186;
    }
    float _1188 = _1170;
    float _1190 = 0.0;
    float _1192 = _1188;
    if (_1102)
    {
        float _1194 = _1124 * _1174;
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (!_1102)
    {
        _1176 = _1094;
    }
    float _1198 = _1176;
    float _1200 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1198;
    if (_1102)
    {
        float _1204 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _954 = _1204;
    }
    float _1206 = _954;
    if (_1102)
    {
        float _1208 = _1090 * _1196;
        _1116 = _1208;
    }
    float _1210 = _1116;
    if (!_1102)
    {
        _1192 = _1092;
    }
    float _1212 = _1192;
    float _1214 = _1212;
    if (_1102)
    {
        float _1216 = _1092 * _1196;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1102)
    {
        float _1220 = fma(_1160, _1154, _1206);
        _1182 = _1220;
    }
    float _1222 = _1182;
    if (_1102)
    {
        float _1224 = _1210 * _1210;
        _1202 = _1224;
    }
    float _1226 = _1202;
    if (!_1102)
    {
        _1184 = _1096;
    }
    float _1228 = _1184;
    float _1230 = _1228;
    if (_1102)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1200);
    float _1238 = fma(_1222, _1222, _1226);
    float _1240 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1244 = _1238 + _1234;
    float _1246 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1248 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = rsqrt(_1244);
    float _1258 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1246);
    float _1260 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = abs(_1266);
    float _1280 = log2(_1278);
    float _1282 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1272);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1286 = -_1276;
    float _1288 = fma(_1286, _1248, 1.0);
    float _1290 = _1256 * _1222;
    float _1292 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1282);
    float _1300 = log2(_1288);
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1290 + 1.0;
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = -_1302;
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1314 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1316 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1318 = -_1296;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1322 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1312);
    float _1328 = fma(_1320, -0.5, 0.5);
    float _1330 = fma(_1320, 0.5, 0.5);
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1322);
    float _1334 = _1300 * 0.693147182464599609375;
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1316);
    float _1340 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = fma(_1330, _1344, 1.570728778839111328125);
    float _1350 = sqrt(_1328);
    float _1352 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1326);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1352);
    float _1356 = _1346 * _1324;
    float _1358 = -_1290;
    float _1360 = fma(_1338, _1304, _1358);
    float _1362 = _1354 * _1324;
    float _1364 = fma(_1356, 0.5, 0.5);
    float _1366 = fma(_1362, -0.5, 0.5);
    float _1368 = _1350 * 0.636619746685028076171875;
    float _1370 = -_1348;
    float _1372 = fma(_1368, _1370, 1.0);
    float _1374 = fma(_1360, 0.5, 0.5);
    float3 _4404 = float3(_1364, _1366, _1342);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4404, float3(0.0), isnan(_4404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4404, float3(0.0), isnan(_4404)), level(0.0)).x;
    float3 _4415 = float3(_1364, _1366, _1342);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4415, float3(0.0), isnan(_4415)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4415, float3(0.0), isnan(_4415)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _4432 = float2(_1372, _1374);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4432, float2(0.0), isnan(_4432)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4432, float2(0.0), isnan(_4432)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_51.w;
    float _1401 = _434 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1403 = in.m_65.x;
    float _1405 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_65.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = in.m_65.w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = in.m_65.z;
    float _1435 = 1.0 / _1419;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1441 = as_type<int>(_1401);
    float _1443 = _1354;
    float _1445 = _1346;
    if (_1409)
    {
        bool _1447 = _362 > 0.5;
        _354 = _1447;
    }
    bool _1449 = _354;
    float _1451 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    out.m_67.x = _1072;
    out.m_67.y = _1068;
    out.m_67.z = _1076;
    bool _1453 = _1399 > 0.5;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1459 = 1.0 / _1439;
    out.m_69.x = _1403;
    if (_1415)
    {
        bool _1461 = _312 > 0.5;
        _356 = _1461;
    }
    bool _1463 = _356;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.y = _1411;
    bool _1469 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1471 = isnan(_310);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / _1457;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_69.w = _1425;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1493;
    out.m_69.z = _1433;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = 1.0 / _1485;
    float _1501 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1495 * _1435;
    float _1507 = in.m_71.x;
    bool _1509 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_310);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1467 * _1481;
    float _1523 = -_1479;
    float _1525 = _1523 + 1.0;
    float _1527 = in.m_71.y;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    out.m_73.x = _1497;
    out.m_73.y = _1501;
    out.m_73.z = _1503;
    float _1541 = _1531 * _1459;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1545 = _310 + _1543;
    float _1547 = exp2(_1405);
    float _1549 = _1535 * _1499;
    float _1551 = _1314 * 0.5;
    bool _1553 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1555 = isnan(_310);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    float _1565 = fma(_1505, _1545, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _310 + _1567;
    bool _1571 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1573 = isnan(_310);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = -_1563;
    float _1585 = _1583 + 1.0;
    float _1587 = fma(_1521, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1589 = _1563 * _1539;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = _1581 * _1585;
    bool _1597 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1599 = isnan(_310);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1605 = _1601 || _1603;
    int _1607 = _1605 ? 1065353216 : 0;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _310 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1617 = _310 + _1615;
    float _1619 = -_1527;
    float _1621 = _1619 + 1.0;
    float _1623 = _1479 * _1593;
    float _1625 = as_type<float>(_1607) * _1525;
    float _1627 = -as_type<float>(_1607);
    float _1629 = _1627 + 1.0;
    int _1631 = _1607;
    float _1633 = _1617;
    float _1635 = _1507;
    float _1637 = _1527;
    if (_1409)
    {
        float _1639 = -_1507;
        float _1641 = _1639 + 1.0;
        _1631 = as_type<int>(_1641);
    }
    int _1643 = _1631;
    int _1645 = _1453 ? as_type<int>(_1621) : as_type<int>(_1527);
    float _1647 = _1565 * _1625;
    float _1649 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1401);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1653 = _1423 ? as_type<float>(_1645) : _1527;
    float _1655 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1647);
    float _1657 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1649);
    float _1659 = fma(_1541, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1661 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1663 = fma(_1549, _1617, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_1409)
    {
        _1633 = _1507;
    }
    float _1665 = _1633;
    float _1667 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = fma(_1661, _1653, -0.5);
    float _1671 = _1665;
    if (_1409)
    {
        float _1673 = _1449 ? as_type<float>(_1643) : _1507;
        _1671 = _1673;
    }
    float _1675 = _1671;
    float _1677 = _434 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = in.m_75.x;
    float _1681 = in.m_75.y;
    float _1683 = in.m_75.z;
    bool _1685 = _726 != 0.0;
    bool _1687 = isnan(_726);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    if (_1415)
    {
        float _1695 = -_1507;
        float _1697 = _1695 + 1.0;
        _1441 = as_type<int>(_1697);
    }
    int _1699 = _1441;
    float _1701 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1703 = 1.0 / _1667;
    bool _1705 = _724 == 0.0;
    bool _1707 = !_1693;
    bool _1709 = _1705 && _1707;
    float _1711 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1713 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1701);
    bool _1715 = _402 > 0.5;
    float _1717 = fma(_1587, _1623, _1655);
    if (_1415)
    {
        float _1719 = _1463 ? as_type<float>(_1699) : _1507;
        _1635 = _1719;
    }
    float _1721 = _1635;
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1727 = _728 == 0.0;
    bool _1729 = _1727 && _1709;
    float _1731 = fma(_1659, _1595, _1717);
    float _1733 = fma(_1711, _1721, -0.5);
    if (_1429)
    {
        float _1735 = _1715 ? _1621 : _1527;
        _1637 = _1735;
    }
    float _1737 = _1637;
    float _1739 = _1723 + _1667;
    float _1741 = -_644;
    float _1743 = fma(_600, _1669, _1741);
    float _1745 = fma(_630, _1733, _640);
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1749 = fma(_1663, _1589, _1731);
    float _1751 = _1739 * _1703;
    float _1753 = _1751 * 0.5;
    float _1755 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1757 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1759 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1749);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = _1755 * _1725;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1769 = _1681;
    float _1771 = _1679;
    float _1773 = _1683;
    if (!_1729)
    {
        float _1775 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1681);
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1745 + 0.5;
    float _1781 = _1743 + 0.5;
    float _1783 = _1757 * _1747;
    float _1785 = _842 * _896;
    float _1787 = _842 * _908;
    float _1789 = _842 * _892;
    float _1791 = _860 * _908;
    if (!_1729)
    {
        float _1793 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1679);
        _1771 = _1793;
    }
    float _1795 = _1771;
    float _1797 = _858 * _908;
    float _1799 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1729)
    {
        float _1807 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1683);
        _1773 = _1807;
    }
    float _1809 = _1773;
    out.m_77.x = _1783;
    out.m_77.y = _1763;
    out.m_77.z = _1779;
    out.m_77.w = _1781;
    float _1811 = _860 * _896;
    float _1813 = _860 * _892;
    float _1815 = -_834;
    float _1817 = fma(_1815, _876, _1787);
    float _1819 = fma(_846, _876, _1791);
    float _1821 = _858 * _892;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1825 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1823);
    out.m_79.x = _1799;
    out.m_79.y = _1801;
    out.m_79.z = _1803;
    out.m_79.w = _1805;
    float _1827 = -_834;
    float _1829 = fma(_1827, _874, _1785);
    float _1831 = -_834;
    float _1833 = fma(_1831, _880, _1789);
    float _1835 = fma(_846, _874, _1811);
    float _1837 = fma(_844, _702, _1817);
    float _1839 = fma(_854, _702, _1819);
    float _1841 = fma(_846, _880, _1813);
    float _1843 = fma(_848, _876, _1797);
    float _1845 = fma(_848, _880, _1821);
    float _1847 = fma(_844, _700, _1829);
    float _1849 = fma(_844, _704, _1833);
    float _1851 = fma(_868, _702, _1843);
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1825;
    float _1865 = _858 * _896;
    float _1867 = fma(_854, _700, _1835);
    float _1869 = fma(_854, _704, _1841);
    float _1871 = fma(_868, _704, _1845);
    float _1873 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1875 = _1847 * _1777;
    float _1877 = fma(_848, _874, _1865);
    float _1879 = _1837 * _1777;
    float _1881 = _1849 * _1777;
    float _1883 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1873);
    float _1885 = fma(_1867, _1795, _1875);
    float _1887 = fma(_868, _700, _1877);
    float _1889 = fma(_1839, _1795, _1879);
    float _1891 = _1346 + _1314;
    float _1893 = fma(_1869, _1795, _1881);
    float _1895 = _1883 + _1314;
    float _1897 = -_1547;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1887, _1809, _1885);
    float _1903 = fma(_1851, _1809, _1889);
    float _1905 = _1891 * 0.5;
    float _1907 = fma(_1871, _1809, _1893);
    float _1909 = fma(_1354, -0.5, _1551);
    float _1911 = _1893;
    float _1913 = _1851;
    float _1915 = _1909;
    if (_1861)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = _1895 * 0.5;
    float _1921 = _1917;
    float _1923 = _1919;
    if (_1861)
    {
        _1913 = 1.0;
    }
    float _1925 = _1913;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1863 * _1929;
    float _1933 = _1925;
    float _1935 = _1314;
    if (!_1861)
    {
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = _1937 * 0.15915493667125701904296875;
        float _1941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = _1939 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1941 * 0.15915493667125701904296875;
        float _1953 = _1939 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1949;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1945;
        float _1973 = 1.0 / _1969;
        float _1975 = _1967 * _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = fma(_1931, _1975, _1977);
        float _1981 = _1979 * _1971;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1921 = _1983;
    }
    float _1985 = _1921;
    if (!_1861)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1931, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1933 = _2037;
    }
    float _2039 = _1933;
    float _2041 = _1927 * _1376;
    float _2043 = -_1927;
    float _2045 = _2043 + 1.0;
    out.m_81.x = _1901;
    out.m_81.y = _1903;
    out.m_81.z = _1907;
    bool _2047 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1086);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _1387 * _2041;
    float _2059 = _1397 * _2041;
    float _2061 = _1387 * _2045;
    out.m_83.x = _1905;
    out.m_83.y = _1909;
    out.m_83.z = _1919;
    out.m_83.w = _1314;
    float _2063 = fma(_1393, _2057, _1381);
    float _2065 = fma(_1395, _2057, _1383);
    float _2067 = fma(_1387, _2059, _1385);
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1883;
    out.gl_Position.w = _1314;
    out.m_85.x = _2063;
    out.m_85.y = _2065;
    out.m_85.z = _2067;
    out.m_85.w = _2061;
    float _2069 = _1985 * _2039;
    float _2071 = _2069;
    if (!_2055)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2073 = _1935;
    float _2075 = _2073;
    float _2077 = _2073;
    if (!_2055)
    {
        _1923 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2079 = _1923;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2083 = _2079;
    float _2085 = _2079;
    if (!_2055)
    {
        _1443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1443;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2055)
    {
        _1445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1445;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2055)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1915;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2055)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _2071;
    bool _2107 = !_2055;
    float _2109 = _2105;
    float _2111 = _2105;
    if (!_2107)
    {
        bool _2113 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2115 = isnan(_1086);
        bool _2117 = _2113 || _2115;
        bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2121 = _2117 || _2119;
        if (!_2121)
        {
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = _1086 + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2129 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2127;
            float _2131 = 1.0 / _2129;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2153 = _2125 * _2131;
            float _2155 = precise::clamp(_2153, 0.0, 1.0);
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2161 = fma(_2155, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2163 = fma(_2155, _2159, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2165 = fma(_2155, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2167 = fma(_2155, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2169 = fma(_2155, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2171 = fma(_2155, _2151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2163;
            _2103 = _2169;
            _2091 = _2161;
            _2085 = _2167;
            _2077 = _2165;
            _2111 = _2171;
            _2173 = true;
        }
        else
        {
            bool _2175 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2177 = isnan(_1086);
            bool _2179 = _2175 || _2177;
            bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2183 = _2179 || _2181;
            if (!_2183)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2185 = _2089;
            _2091 = _2185;
            if (!_2183)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2187 = _2095;
            _2097 = _2187;
            if (!_2183)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2189 = _2075;
            _2077 = _2189;
            if (!_2183)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2191 = _2083;
            _2085 = _2191;
            if (!_2183)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2193 = _2101;
            _2103 = _2193;
            if (!_2183)
            {
                _2109 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2195 = _2109;
            bool _2197 = !_2183;
            _2111 = _2195;
            if (!_2197)
            {
                bool _2199 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1086);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1086 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = 1.0 / _2215;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2239 = _2211 * _2217;
                    float _2241 = precise::clamp(_2239, 0.0, 1.0);
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2247 = fma(_2241, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2249;
                    _2103 = _2255;
                    _2091 = _2247;
                    _2085 = _2253;
                    _2077 = _2251;
                    _2111 = _2257;
                    _2173 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2111 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2173 = false;
    float _2259 = _2097;
    float _2261 = _2103;
    float _2263 = _2091;
    float _2265 = _2085;
    float _2267 = _2077;
    float _2269 = _2111;
    float _2271 = _2081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2273 = fma(_1903, -0.5, 0.5);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2259;
    float _2279 = _2277 + _2261;
    float _2281 = -_2263;
    float _2283 = _2281 + _2265;
    out.m_47.x = _2271;
    float _2285 = fma(_2275, _2279, _2259);
    float _2287 = -_2267;
    float _2289 = _2287 + _2269;
    float _2291 = fma(_2275, _2283, _2263);
    float _2293 = _2285 * 0.586610972881317138671875;
    bool _2295 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2297 = fma(_2275, _2289, _2267);
    out.m_87.x = 0.0;
    float _2299 = fma(_2291, 0.298911988735198974609375, _2293);
    bool _2301 = _1985 > 0.0;
    bool _2303 = isnan(_1985);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2297, 0.114477999508380889892578125, _2299);
    bool _2313 = _2039 <= 0.0;
    bool _2315 = !_2309;
    bool _2317 = _2313 || _2315;
    float _2319 = -_2311;
    float _2321 = _2291 + _2319;
    float _2323 = -_2311;
    float _2325 = _2285 + _2323;
    float _2327 = -_2311;
    float _2329 = _2297 + _2327;
    float _2331 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2335 = fma(_2329, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    bool _2337 = !_2295;
    if (!_2337)
    {
        float _2339 = -_1060;
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2343 = -_1062;
        float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2347 = -_1064;
        float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2351 = _2341 * _2341;
        float _2353 = fma(_2345, _2345, _2351);
        float _2355 = fma(_2349, _2349, _2353);
        float _2357 = sqrt(_2355);
        float _2359 = rsqrt(_2355);
        float _2361 = -_2357;
        float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = _2345 * _2359;
        float _2371 = _2341 * _2359;
        float _2373 = abs(_2367);
        float _2375 = log2(_2373);
        float _2377 = _2349 * _2359;
        float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2381 = _1903 * _2371;
        float _2383 = -_2371;
        float _2385 = -_2379;
        float _2387 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2385);
        float _2389 = fma(_1901, _2369, _2381);
        float _2391 = -_2377;
        float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2387);
        float _2395 = fma(_1907, _2377, _2389);
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2401 = _2393 + _2399;
        float _2403 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2407 = precise::clamp(_2405, 0.0, 1.0);
        float _2409 = exp2(_2403);
        float _2411 = _2409 * _2407;
        float _2413 = _2397 * _2411;
        float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2417 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2415;
        out.m_87.y = _2417;
        out.m_87.z = _2419;
    }
    out.m_89.x = _2331;
    out.m_89.y = _2333;
    out.m_89.z = _2335;
    if (!_2317)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2173 = false;
    bool _302 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2477 = as_type<float>(_124);
        out.gl_Position.z = _2477;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_108);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _118;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    int _158 = 0;
    if (_154)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_162);
        out.gl_Position.z = _2546;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_51.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _140 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -_210;
    float _230 = _228 + 1.0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _232;
    float _236 = 1.0 / _214;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = _198 * _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _242;
    float _246 = _226 * _230;
    float _248 = fma(_234, _240, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = -_226;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = fma(_244, _240, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _260 = _248 * _246;
    float _262 = fma(_256, _240, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _258 * _246;
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _260);
    float _268 = _262 * _246;
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _264);
    float _272 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _268);
    float _274 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].x, _266);
    float _276 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _278 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[144].z, _270);
    bool _280 = !_238;
    float _282 = _272;
    float _300;
    if (!_280)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_108);
        float _306 = 1.0 / _304;
        float _308 = _140 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _316 = _314 != 0;
    float _318 = in.m_44.x;
    float _320 = in.m_44.y;
    float _322 = in.m_44.z;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _334 = _332 != 0;
    float _336 = in.m_53.x;
    float _338 = in.m_53.y;
    float _340 = in.m_53.z;
    float _342 = in.m_53.w;
    float _344 = in.m_55.x;
    float _346 = in.m_55.y;
    float _348 = in.m_55.z;
    float _350 = in.m_55.w;
    float _352 = _258;
    bool _354 = _330;
    bool _356 = _326;
    if (!_316)
    {
        float _358 = in.m_51.y;
        _352 = _358;
    }
    float _360 = _352;
    float _362 = in.m_51.x;
    float _364 = _312 * 2.0;
    float _366 = in.m_57.x;
    float _368 = in.m_57.y;
    float _370 = in.m_57.z;
    float _372 = in.m_57.w;
    float _374 = floor(_364);
    float _376 = _320 * _338;
    float _378 = _320 * _346;
    float _380 = fma(_318, _336, _376);
    if (!_316)
    {
        _282 = _360;
    }
    float _382 = _282;
    float _384 = fma(_318, _344, _378);
    float _386 = fma(_322, _340, _380);
    float _388 = _362 + _312;
    bool _390 = _374 > 0.0;
    float _392 = _382;
    float _394 = _360;
    if (_316)
    {
        float _396 = in.m_51.x;
        float _398 = in.m_51.y;
        _392 = _396;
        _394 = _398;
    }
    float _400 = _392;
    float _402 = _394;
    float _404 = _362 * 2.0;
    bool _406 = _374 >= 0.0;
    bool _408 = isnan(_374);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = _388 + (-1.0);
    float _418 = fma(_322, _348, _384);
    float _420 = _386 + _342;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _424 = _414 ? 0 : 1;
    float _426 = floor(_404);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _430 = _416;
    if (!_316)
    {
        _430 = _312;
    }
    float _432 = _430;
    float _434 = _418 + _350;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _438 = ~_424;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _448 = log2(_446);
    int _450 = _442;
    float _452 = _432;
    if (!_390)
    {
        int _454 = ~_424;
        int _456 = _454 + 1;
        _450 = _456;
    }
    int _458 = _450;
    float _460 = _320 * _368;
    bool _462 = !_330;
    int _464 = _462 ? 0 : 1;
    float _466 = -_434;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = -_420;
    float _472 = _470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = fma(_318, _366, _460);
    if (_316)
    {
        _452 = _402;
    }
    float _476 = _452;
    float _478 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _422);
    float _480 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _482 = _402 * 2.0;
    bool _484 = _426 > 0.0;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[83].w, _436);
    float _488 = -_444;
    float _490 = fma(_480, 2.0, _488);
    float _492 = _476;
    if (!_316)
    {
        _492 = _312;
    }
    float _494 = _492;
    float _496 = floor(_482);
    float _498 = _362 + _402;
    float _500 = _494;
    if (_316)
    {
        _500 = _402;
    }
    float _502 = _500;
    float _504 = fma(_322, _370, _474);
    bool _506 = _426 >= 0.0;
    bool _508 = isnan(_426);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _518 = _502 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _520 = !_326;
    int _522 = _520 ? 0 : 1;
    float _524 = _498 + (-1.0);
    int _526 = _514 ? 0 : 1;
    float _528 = fma(_518, -2.0, _516);
    float _530 = _448 * _140;
    int _532 = abs(_522);
    float _534 = _504 + _372;
    bool _536 = _496 > 0.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _540 = _496 >= 0.0;
    bool _542 = isnan(_496);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = exp2(_530);
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    int _558 = abs(_464);
    float _560 = -_534;
    float _562 = _560 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _564 = ~_526;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _572 = 1.0 + _570;
    int _574 = _568;
    if (!_484)
    {
        int _576 = ~_526;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = _312 + _402;
    float _584 = 1.0 / _572;
    float _586 = _582 + (-1.0);
    float _588 = float(_458);
    float _590 = -_550;
    float _592 = _590 + 1.0;
    float _594 = float(_558);
    float _596 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _598 = float(_580);
    float _600 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _486);
    float _602 = float(_532);
    bool _604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _594 * _598;
    float _616 = _468 * _468;
    bool _618 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _602 * _588;
    float _630 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _478);
    float _632 = fma(_562, _562, _616);
    float _634 = _626 ? _592 : 0.0;
    float _636 = _628 * (-2.0);
    float _638 = -_140;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _642 = fma(_472, _472, _632);
    float _644 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _528);
    float _646 = fma(_538, _636, _538);
    if (_612)
    {
        float _648 = _634 * _584;
        _144 = _648;
    }
    float _650 = _144;
    float _652 = fma(_636, _552, _552);
    float _654 = _362 + (-0.5);
    float _656 = rsqrt(_642);
    int _658 = _548 ? 0 : 1;
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = _614 * (-2.0);
    bool _664 = !_334;
    int _666 = _664 ? 0 : 1;
    int _668 = ~_658;
    int _670 = _668 + 1;
    int _672 = _670 + 1;
    float _674 = fma(_596, _662, _596);
    float _676 = fma(_662, _554, _554);
    int _678 = abs(_666);
    float _680 = _402 + (-0.5);
    int _682 = _672;
    if (!_536)
    {
        int _684 = ~_658;
        int _686 = _684 + 1;
        _682 = _686;
    }
    int _688 = _682;
    float _690 = fma(_646, _650, _660);
    float _692 = float(_678);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _696 = float(_688);
    float _698 = _690 * 0.15915493667125701904296875;
    float _700 = _562 * _656;
    float _702 = _468 * _656;
    float _704 = _472 * _656;
    float _706 = fma(_674, _650, _694);
    float _708 = _692 * _696;
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _718 = _700 * _716;
    float _720 = _706 * 0.15915493667125701904296875;
    float _722 = _708 * (-2.0);
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _732 = -_718;
    float _734 = fma(_704, _730, _732);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _738 = _704 * _736;
    float _740 = fma(_428, _722, _428);
    float _742 = fma(_722, _556, _556);
    float _744 = _312 + (-0.5);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _752 = -_738;
    float _754 = fma(_702, _750, _752);
    float _756 = _734 * _734;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _760 = fma(_754, _754, _756);
    float _762 = fma(_740, _650, _758);
    float _764 = _698 * 6.283185482025146484375;
    float _766 = cos(_764);
    bool _768 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _770 = isnan(0.5);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _776 = _772 || _774;
    float _778 = _762 * 0.15915493667125701904296875;
    float _780 = _276 * _712;
    float _782 = _274 * _710;
    float _784 = _720 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _790 = _702 * _788;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _794 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = -_790;
    float _802 = fma(_700, _798, _800);
    float _804 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _794 * _792;
    float _808 = _720 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = fma(_802, _802, _760);
    float _814 = _278 * _714;
    float _816 = _804 * _796;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _778 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _766 * _786;
    float _828 = _748 * _786;
    float _830 = _820 * _818;
    float _832 = _778 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _748 * _810;
    float _838 = _766 * _810;
    float _840 = rsqrt(_812);
    float _842 = _766 * _824;
    float _844 = _748 * _824;
    float _846 = _810 * _824;
    float _848 = _786 * _824;
    float _850 = _844 * _806;
    float _852 = -_826;
    float _854 = fma(_834, _836, _852);
    float _856 = -_836;
    float _858 = fma(_834, _826, _856);
    float _860 = fma(_834, _838, _828);
    float _862 = _842 * _806;
    float _864 = -_806;
    float _866 = _834 * _864;
    float _868 = fma(_834, _828, _838);
    float _870 = fma(_854, _816, _850);
    float _872 = fma(_860, _816, _862);
    float _874 = _754 * _840;
    float _876 = _734 * _840;
    float _878 = fma(_846, _816, _866);
    float _880 = _802 * _840;
    float _882 = _702 * _874;
    float _884 = _704 * _876;
    float _886 = fma(_858, _830, _872);
    float _888 = fma(_848, _830, _878);
    float _890 = -_882;
    float _892 = fma(_700, _876, _890);
    float _894 = -_884;
    float _896 = fma(_702, _880, _894);
    float _898 = fma(_868, _830, _870);
    float _900 = _700 * _880;
    float _902 = _892 * _886;
    float _904 = _896 * _886;
    float _906 = -_900;
    float _908 = fma(_704, _874, _906);
    float _910 = fma(_880, _888, _902);
    float _912 = fma(_874, _888, _904);
    float _914 = _908 * _886;
    float _916 = fma(_704, _898, _910);
    float _918 = fma(_700, _898, _912);
    float _920 = fma(_876, _888, _914);
    float _922 = _420 + _916;
    float _924 = _534 + _918;
    float _926 = fma(_702, _898, _920);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _922 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _924 + _932;
    float _936 = _434 + _926;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    bool _944 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = 0.0;
    float _948 = _924;
    float _950 = _922;
    float _952 = _778;
    float _954 = _802;
    if (!_944)
    {
        _946 = _936;
    }
    float _956 = _946;
    bool _958 = !_944;
    float _960 = _956;
    if (!_958)
    {
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _966 = _942 + _964;
        float _968 = rsqrt(_940);
        float _970 = _966 * _962;
        float _972 = _936 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = _970 * 0.15915493667125701904296875;
        float _976 = _974 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        float _984 = _978 + (-1.0);
        float _986 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_982, _972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _990 = fma(_936, _978, _986);
        float _992 = _968 * _988;
        float _994 = fma(_934, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _996 = fma(_930, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _994;
        _960 = _990;
        _950 = _996;
    }
    float _998 = _948;
    float _1000 = _960;
    float _1002 = _950;
    float _1004 = _1000;
    float _1006 = _998;
    float _1008 = _1002;
    if (!_776)
    {
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1012 = _434 + _1010;
        float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1016 = _534 + _1014;
        float _1018 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1020 = -_534;
        float _1022 = _1020 + _998;
        float _1024 = _1012 * _1012;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1028 = _420 + _1026;
        float _1030 = fma(_1016, _1016, _1024);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1028, _1028, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = _1038 * _1042;
        float _1046 = -_434;
        float _1048 = _1046 + _1000;
        float _1050 = -_420;
        float _1052 = _1050 + _1002;
        float _1054 = fma(_1022, _1044, _534);
        float _1056 = fma(_1048, _1044, _434);
        float _1058 = fma(_1052, _1044, _420);
        _1004 = _1056;
        _1006 = _1054;
        _1008 = _1058;
    }
    float _1060 = _1004;
    float _1062 = _1006;
    float _1064 = _1008;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1060 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1062 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1080;
    float _1110 = _1098;
    float _1112 = _1106;
    float _1114 = _1088;
    float _1116 = _1090;
    if (_1102)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1118;
    }
    float _1120 = _1108;
    if (_1102)
    {
        float _1122 = rsqrt(_1098);
        _1110 = _1122;
    }
    float _1124 = _1110;
    if (_1102)
    {
        float _1126 = _1106 * _1120;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1102)
    {
        float _1130 = _1128 * 0.15915493667125701904296875;
        _952 = _1130;
    }
    float _1132 = _952;
    float _1134 = _1120;
    if (_1102)
    {
        float _1136 = _1132 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        _1134 = _1138;
    }
    float _1140 = _1134;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1144 = precise::max(0.0, _1142);
    float _1146 = _930;
    float _1148 = _1144;
    if (_1102)
    {
        float _1150 = _1132 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = -_1088;
    float _1158 = -_1144;
    float _1160 = fma(_1068, _1156, _1158);
    if (_1102)
    {
        float _1162 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1162;
    }
    float _1164 = _1148;
    float _1166 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1164;
    float _1170 = _1140;
    if (_1102)
    {
        float _1172 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1114 = _1172;
    }
    float _1174 = _1114;
    float _1176 = _1174;
    if (!_1102)
    {
        _1168 = _1160;
    }
    float _1178 = _1168;
    float _1180 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1182 = _1178;
    float _1184 = _1154;
    if (_1102)
    {
        float _1186 = _1154 + (-1.0);
        _1170 = _1186;
    }
    float _1188 = _1170;
    float _1190 = 0.0;
    float _1192 = _1188;
    if (_1102)
    {
        float _1194 = _1124 * _1174;
        _1190 = _1194;
    }
    float _1196 = _1190;
    if (!_1102)
    {
        _1176 = _1094;
    }
    float _1198 = _1176;
    float _1200 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1202 = _1198;
    if (_1102)
    {
        float _1204 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _954 = _1204;
    }
    float _1206 = _954;
    if (_1102)
    {
        float _1208 = _1090 * _1196;
        _1116 = _1208;
    }
    float _1210 = _1116;
    if (!_1102)
    {
        _1192 = _1092;
    }
    float _1212 = _1192;
    float _1214 = _1212;
    if (_1102)
    {
        float _1216 = _1092 * _1196;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (_1102)
    {
        float _1220 = fma(_1160, _1154, _1206);
        _1182 = _1220;
    }
    float _1222 = _1182;
    if (_1102)
    {
        float _1224 = _1210 * _1210;
        _1202 = _1224;
    }
    float _1226 = _1202;
    if (!_1102)
    {
        _1184 = _1096;
    }
    float _1228 = _1184;
    float _1230 = _1228;
    if (_1102)
    {
        float _1232 = _1218 * _1218;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1200);
    float _1238 = fma(_1222, _1222, _1226);
    float _1240 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1180);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1244 = _1238 + _1234;
    float _1246 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1248 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = rsqrt(_1244);
    float _1258 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1246);
    float _1260 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1258);
    float _1270 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = abs(_1266);
    float _1280 = log2(_1278);
    float _1282 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1272);
    float _1284 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1286 = -_1276;
    float _1288 = fma(_1286, _1248, 1.0);
    float _1290 = _1256 * _1222;
    float _1292 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1256 * _1210;
    float _1296 = _1256 * _1218;
    float _1298 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1282);
    float _1300 = log2(_1288);
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1304 = _1290 + 1.0;
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = -_1302;
    float _1310 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1314 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1316 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1318 = -_1296;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1322 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1312);
    float _1328 = fma(_1320, -0.5, 0.5);
    float _1330 = fma(_1320, 0.5, 0.5);
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1322);
    float _1334 = _1300 * 0.693147182464599609375;
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1316);
    float _1340 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = fma(_1330, _1344, 1.570728778839111328125);
    float _1350 = sqrt(_1328);
    float _1352 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1326);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1352);
    float _1356 = _1346 * _1324;
    float _1358 = -_1290;
    float _1360 = fma(_1338, _1304, _1358);
    float _1362 = _1354 * _1324;
    float _1364 = fma(_1356, 0.5, 0.5);
    float _1366 = fma(_1362, -0.5, 0.5);
    float _1368 = _1350 * 0.636619746685028076171875;
    float _1370 = -_1348;
    float _1372 = fma(_1368, _1370, 1.0);
    float _1374 = fma(_1360, 0.5, 0.5);
    float3 _4404 = float3(_1364, _1366, _1342);
    float _1376 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4404, float3(0.0), isnan(_4404)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4404, float3(0.0), isnan(_4404)), level(0.0)).x;
    float3 _4415 = float3(_1364, _1366, _1342);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4415, float3(0.0), isnan(_4415)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4415, float3(0.0), isnan(_4415)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _4432 = float2(_1372, _1374);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4432, float2(0.0), isnan(_4432)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4432, float2(0.0), isnan(_4432)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_51.w;
    float _1401 = _434 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1403 = in.m_65.x;
    float _1405 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1409 = _1407 != 0;
    float _1411 = in.m_65.y;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = in.m_65.w;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1429 = _1427 != 0;
    float _1431 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = in.m_65.z;
    float _1435 = 1.0 / _1419;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1441 = as_type<int>(_1401);
    float _1443 = _1354;
    float _1445 = _1346;
    if (_1409)
    {
        bool _1447 = _362 > 0.5;
        _354 = _1447;
    }
    bool _1449 = _354;
    float _1451 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    out.m_67.x = _1072;
    out.m_67.y = _1068;
    out.m_67.z = _1076;
    bool _1453 = _1399 > 0.5;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1459 = 1.0 / _1439;
    out.m_69.x = _1403;
    if (_1415)
    {
        bool _1461 = _312 > 0.5;
        _356 = _1461;
    }
    bool _1463 = _356;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_69.y = _1411;
    bool _1469 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1471 = isnan(_310);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = 1.0 / _1457;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_69.w = _1425;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1493;
    out.m_69.z = _1433;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = 1.0 / _1485;
    float _1501 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1505 = _1495 * _1435;
    float _1507 = in.m_71.x;
    bool _1509 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_310);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1467 * _1481;
    float _1523 = -_1479;
    float _1525 = _1523 + 1.0;
    float _1527 = in.m_71.y;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1529;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1537 = -_1519;
    float _1539 = _1537 + 1.0;
    out.m_73.x = _1497;
    out.m_73.y = _1501;
    out.m_73.z = _1503;
    float _1541 = _1531 * _1459;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1545 = _310 + _1543;
    float _1547 = exp2(_1405);
    float _1549 = _1535 * _1499;
    float _1551 = _1314 * 0.5;
    bool _1553 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1555 = isnan(_310);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    float _1565 = fma(_1505, _1545, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _310 + _1567;
    bool _1571 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1573 = isnan(_310);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = -_1563;
    float _1585 = _1583 + 1.0;
    float _1587 = fma(_1521, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1589 = _1563 * _1539;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = _1581 * _1585;
    bool _1597 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1599 = isnan(_310);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1605 = _1601 || _1603;
    int _1607 = _1605 ? 1065353216 : 0;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _310 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1617 = _310 + _1615;
    float _1619 = -_1527;
    float _1621 = _1619 + 1.0;
    float _1623 = _1479 * _1593;
    float _1625 = as_type<float>(_1607) * _1525;
    float _1627 = -as_type<float>(_1607);
    float _1629 = _1627 + 1.0;
    int _1631 = _1607;
    float _1633 = _1617;
    float _1635 = _1507;
    float _1637 = _1527;
    if (_1409)
    {
        float _1639 = -_1507;
        float _1641 = _1639 + 1.0;
        _1631 = as_type<int>(_1641);
    }
    int _1643 = _1631;
    int _1645 = _1453 ? as_type<int>(_1621) : as_type<int>(_1527);
    float _1647 = _1565 * _1625;
    float _1649 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1401);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1653 = _1423 ? as_type<float>(_1645) : _1527;
    float _1655 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1647);
    float _1657 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1649);
    float _1659 = fma(_1541, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1661 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1663 = fma(_1549, _1617, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (!_1409)
    {
        _1633 = _1507;
    }
    float _1665 = _1633;
    float _1667 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = fma(_1661, _1653, -0.5);
    float _1671 = _1665;
    if (_1409)
    {
        float _1673 = _1449 ? as_type<float>(_1643) : _1507;
        _1671 = _1673;
    }
    float _1675 = _1671;
    float _1677 = _434 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1679 = in.m_75.x;
    float _1681 = in.m_75.y;
    float _1683 = in.m_75.z;
    bool _1685 = _726 != 0.0;
    bool _1687 = isnan(_726);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.0);
    bool _1693 = _1689 || _1691;
    if (_1415)
    {
        float _1695 = -_1507;
        float _1697 = _1695 + 1.0;
        _1441 = as_type<int>(_1697);
    }
    int _1699 = _1441;
    float _1701 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1677);
    float _1703 = 1.0 / _1667;
    bool _1705 = _724 == 0.0;
    bool _1707 = !_1693;
    bool _1709 = _1705 && _1707;
    float _1711 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1713 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1701);
    bool _1715 = _402 > 0.5;
    float _1717 = fma(_1587, _1623, _1655);
    if (_1415)
    {
        float _1719 = _1463 ? as_type<float>(_1699) : _1507;
        _1635 = _1719;
    }
    float _1721 = _1635;
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1727 = _728 == 0.0;
    bool _1729 = _1727 && _1709;
    float _1731 = fma(_1659, _1595, _1717);
    float _1733 = fma(_1711, _1721, -0.5);
    if (_1429)
    {
        float _1735 = _1715 ? _1621 : _1527;
        _1637 = _1735;
    }
    float _1737 = _1637;
    float _1739 = _1723 + _1667;
    float _1741 = -_644;
    float _1743 = fma(_600, _1669, _1741);
    float _1745 = fma(_630, _1733, _640);
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1749 = fma(_1663, _1589, _1731);
    float _1751 = _1739 * _1703;
    float _1753 = _1751 * 0.5;
    float _1755 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1757 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1759 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1749);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = _1755 * _1725;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1769 = _1681;
    float _1771 = _1679;
    float _1773 = _1683;
    if (!_1729)
    {
        float _1775 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1681);
        _1769 = _1775;
    }
    float _1777 = _1769;
    float _1779 = _1745 + 0.5;
    float _1781 = _1743 + 0.5;
    float _1783 = _1757 * _1747;
    float _1785 = _842 * _896;
    float _1787 = _842 * _908;
    float _1789 = _842 * _892;
    float _1791 = _860 * _908;
    if (!_1729)
    {
        float _1793 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1679);
        _1771 = _1793;
    }
    float _1795 = _1771;
    float _1797 = _858 * _908;
    float _1799 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1729)
    {
        float _1807 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1683);
        _1773 = _1807;
    }
    float _1809 = _1773;
    out.m_77.x = _1783;
    out.m_77.y = _1763;
    out.m_77.z = _1779;
    out.m_77.w = _1781;
    float _1811 = _860 * _896;
    float _1813 = _860 * _892;
    float _1815 = -_834;
    float _1817 = fma(_1815, _876, _1787);
    float _1819 = fma(_846, _876, _1791);
    float _1821 = _858 * _892;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1825 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1823);
    out.m_79.x = _1799;
    out.m_79.y = _1801;
    out.m_79.z = _1803;
    out.m_79.w = _1805;
    float _1827 = -_834;
    float _1829 = fma(_1827, _874, _1785);
    float _1831 = -_834;
    float _1833 = fma(_1831, _880, _1789);
    float _1835 = fma(_846, _874, _1811);
    float _1837 = fma(_844, _702, _1817);
    float _1839 = fma(_854, _702, _1819);
    float _1841 = fma(_846, _880, _1813);
    float _1843 = fma(_848, _876, _1797);
    float _1845 = fma(_848, _880, _1821);
    float _1847 = fma(_844, _700, _1829);
    float _1849 = fma(_844, _704, _1833);
    float _1851 = fma(_868, _702, _1843);
    bool _1853 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1855 = isnan(0.5);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1861 = _1857 || _1859;
    float _1863 = 1.0 / _1825;
    float _1865 = _858 * _896;
    float _1867 = fma(_854, _700, _1835);
    float _1869 = fma(_854, _704, _1841);
    float _1871 = fma(_868, _704, _1845);
    float _1873 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1875 = _1847 * _1777;
    float _1877 = fma(_848, _874, _1865);
    float _1879 = _1837 * _1777;
    float _1881 = _1849 * _1777;
    float _1883 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1873);
    float _1885 = fma(_1867, _1795, _1875);
    float _1887 = fma(_868, _700, _1877);
    float _1889 = fma(_1839, _1795, _1879);
    float _1891 = _1346 + _1314;
    float _1893 = fma(_1869, _1795, _1881);
    float _1895 = _1883 + _1314;
    float _1897 = -_1547;
    float _1899 = _1897 + 1.0;
    float _1901 = fma(_1887, _1809, _1885);
    float _1903 = fma(_1851, _1809, _1889);
    float _1905 = _1891 * 0.5;
    float _1907 = fma(_1871, _1809, _1893);
    float _1909 = fma(_1354, -0.5, _1551);
    float _1911 = _1893;
    float _1913 = _1851;
    float _1915 = _1909;
    if (_1861)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = _1895 * 0.5;
    float _1921 = _1917;
    float _1923 = _1919;
    if (_1861)
    {
        _1913 = 1.0;
    }
    float _1925 = _1913;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1931 = _1863 * _1929;
    float _1933 = _1925;
    float _1935 = _1314;
    if (!_1861)
    {
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1939 = _1937 * 0.15915493667125701904296875;
        float _1941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = _1939 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1941 * 0.15915493667125701904296875;
        float _1953 = _1939 * 6.283185482025146484375;
        float _1955 = sin(_1953);
        float _1957 = 1.0 / _1949;
        float _1959 = _1951 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        float _1963 = _1955 * _1957;
        float _1965 = _1951 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1961 * _1963;
        float _1971 = 1.0 / _1945;
        float _1973 = 1.0 / _1969;
        float _1975 = _1967 * _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = fma(_1931, _1975, _1977);
        float _1981 = _1979 * _1971;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1921 = _1983;
    }
    float _1985 = _1921;
    if (!_1861)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1931, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1933 = _2037;
    }
    float _2039 = _1933;
    float _2041 = _1927 * _1376;
    float _2043 = -_1927;
    float _2045 = _2043 + 1.0;
    out.m_81.x = _1901;
    out.m_81.y = _1903;
    out.m_81.z = _1907;
    bool _2047 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2049 = isnan(_1086);
    bool _2051 = _2047 || _2049;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2055 = _2051 || _2053;
    float _2057 = _1387 * _2041;
    float _2059 = _1397 * _2041;
    float _2061 = _1387 * _2045;
    out.m_83.x = _1905;
    out.m_83.y = _1909;
    out.m_83.z = _1919;
    out.m_83.w = _1314;
    float _2063 = fma(_1393, _2057, _1381);
    float _2065 = fma(_1395, _2057, _1383);
    float _2067 = fma(_1387, _2059, _1385);
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1883;
    out.gl_Position.w = _1314;
    out.m_85.x = _2063;
    out.m_85.y = _2065;
    out.m_85.z = _2067;
    out.m_85.w = _2061;
    float _2069 = _1985 * _2039;
    float _2071 = _2069;
    if (!_2055)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2073 = _1935;
    float _2075 = _2073;
    float _2077 = _2073;
    if (!_2055)
    {
        _1923 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2079 = _1923;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2083 = _2079;
    float _2085 = _2079;
    if (!_2055)
    {
        _1443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1443;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2055)
    {
        _1445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1445;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2055)
    {
        _1915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1915;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2055)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _2071;
    bool _2107 = !_2055;
    float _2109 = _2105;
    float _2111 = _2105;
    if (!_2107)
    {
        bool _2113 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2115 = isnan(_1086);
        bool _2117 = _2113 || _2115;
        bool _2119 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2121 = _2117 || _2119;
        if (!_2121)
        {
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = _1086 + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2129 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2127;
            float _2131 = 1.0 / _2129;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2153 = _2125 * _2131;
            float _2155 = precise::clamp(_2153, 0.0, 1.0);
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2161 = fma(_2155, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2163 = fma(_2155, _2159, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2165 = fma(_2155, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2167 = fma(_2155, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2169 = fma(_2155, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2171 = fma(_2155, _2151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2163;
            _2103 = _2169;
            _2091 = _2161;
            _2085 = _2167;
            _2077 = _2165;
            _2111 = _2171;
            _2173 = true;
        }
        else
        {
            bool _2175 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2177 = isnan(_1086);
            bool _2179 = _2175 || _2177;
            bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2183 = _2179 || _2181;
            if (!_2183)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2185 = _2089;
            _2091 = _2185;
            if (!_2183)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2187 = _2095;
            _2097 = _2187;
            if (!_2183)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2189 = _2075;
            _2077 = _2189;
            if (!_2183)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2191 = _2083;
            _2085 = _2191;
            if (!_2183)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2193 = _2101;
            _2103 = _2193;
            if (!_2183)
            {
                _2109 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2195 = _2109;
            bool _2197 = !_2183;
            _2111 = _2195;
            if (!_2197)
            {
                bool _2199 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2201 = isnan(_1086);
                bool _2203 = _2199 || _2201;
                bool _2205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2207 = _2203 || _2205;
                if (!_2207)
                {
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = _1086 + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2215 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2213;
                    float _2217 = 1.0 / _2215;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2239 = _2211 * _2217;
                    float _2241 = precise::clamp(_2239, 0.0, 1.0);
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2247 = fma(_2241, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2249 = fma(_2241, _2245, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2251 = fma(_2241, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2253 = fma(_2241, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2255 = fma(_2241, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2257 = fma(_2241, _2237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2249;
                    _2103 = _2255;
                    _2091 = _2247;
                    _2085 = _2253;
                    _2077 = _2251;
                    _2111 = _2257;
                    _2173 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2111 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2173 = false;
    float _2259 = _2097;
    float _2261 = _2103;
    float _2263 = _2091;
    float _2265 = _2085;
    float _2267 = _2077;
    float _2269 = _2111;
    float _2271 = _2081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2273 = fma(_1903, -0.5, 0.5);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_2259;
    float _2279 = _2277 + _2261;
    float _2281 = -_2263;
    float _2283 = _2281 + _2265;
    out.m_47.x = _2271;
    float _2285 = fma(_2275, _2279, _2259);
    float _2287 = -_2267;
    float _2289 = _2287 + _2269;
    float _2291 = fma(_2275, _2283, _2263);
    float _2293 = _2285 * 0.586610972881317138671875;
    bool _2295 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2297 = fma(_2275, _2289, _2267);
    out.m_87.x = 0.0;
    float _2299 = fma(_2291, 0.298911988735198974609375, _2293);
    bool _2301 = _1985 > 0.0;
    bool _2303 = isnan(_1985);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2297, 0.114477999508380889892578125, _2299);
    bool _2313 = _2039 <= 0.0;
    bool _2315 = !_2309;
    bool _2317 = _2313 || _2315;
    float _2319 = -_2311;
    float _2321 = _2291 + _2319;
    float _2323 = -_2311;
    float _2325 = _2285 + _2323;
    float _2327 = -_2311;
    float _2329 = _2297 + _2327;
    float _2331 = fma(_2321, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    float _2335 = fma(_2329, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2311);
    bool _2337 = !_2295;
    if (!_2337)
    {
        float _2339 = -_1060;
        float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2343 = -_1062;
        float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2347 = -_1064;
        float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2351 = _2341 * _2341;
        float _2353 = fma(_2345, _2345, _2351);
        float _2355 = fma(_2349, _2349, _2353);
        float _2357 = sqrt(_2355);
        float _2359 = rsqrt(_2355);
        float _2361 = -_2357;
        float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = _2345 * _2359;
        float _2371 = _2341 * _2359;
        float _2373 = abs(_2367);
        float _2375 = log2(_2373);
        float _2377 = _2349 * _2359;
        float _2379 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2381 = _1903 * _2371;
        float _2383 = -_2371;
        float _2385 = -_2379;
        float _2387 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2385);
        float _2389 = fma(_1901, _2369, _2381);
        float _2391 = -_2377;
        float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2387);
        float _2395 = fma(_1907, _2377, _2389);
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2401 = _2393 + _2399;
        float _2403 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2407 = precise::clamp(_2405, 0.0, 1.0);
        float _2409 = exp2(_2403);
        float _2411 = _2409 * _2407;
        float _2413 = _2397 * _2411;
        float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2417 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2415;
        out.m_87.y = _2417;
        out.m_87.z = _2419;
    }
    out.m_89.x = _2331;
    out.m_89.y = _2333;
    out.m_89.z = _2335;
    if (!_2317)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2421 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2421;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

