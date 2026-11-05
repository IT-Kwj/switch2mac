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
    float4 m_53 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
    float4 m_63 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2463 = false;
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_124);
        out.gl_Position.z = _2767;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_160);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_51.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _170 = _168 != 0;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _174 = _172 != 0;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = 1.0 / _130;
    float _182 = _166 * _164;
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = _184 * 6.283185482025146484375;
    float _188 = floor(_184);
    float _190 = _134 * _180;
    float _192 = _186 * 0.15915493667125701904296875;
    bool _194 = !_170;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_196);
    float _200 = _192 * 6.283185482025146484375;
    float _202 = cos(_200);
    bool _204 = !_178;
    int _206 = _204 ? 0 : 1;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _210 = abs(_206);
    float _212 = -_188;
    float _214 = _184 + _212;
    bool _216 = !_174;
    int _218 = _216 ? 0 : 1;
    float _220 = float(_198);
    int _222 = abs(_218);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _228 = _214 < 0.5;
    float _230 = float(_228);
    float _232 = fma(_202, 0.5, 0.5);
    float _234 = float(_210);
    float _236 = abs(_226);
    float _238 = _220 * _236;
    float _240 = float(_222);
    float _242 = -_232;
    float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _246 = -_230;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _250 = fma(_234, _244, _238);
    float _252 = abs(_248);
    float _254 = fma(_240, _252, _250);
    bool _256 = !_208;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _190;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _300 = 1.0 / _296;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    bool _306 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_276);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    out.m_53.w = _298;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _316 * _304;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    float _338 = _280 * _300;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = fma(_320, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_330, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_324, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _346 * _332;
    float _354 = _348 * _332;
    float _356 = _350 * _332;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _362);
    float _370 = _364 * _344;
    float _372 = _366 * _342;
    float _374 = _368 * _340;
    bool _376 = !_326;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _190;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_44.x;
    float _400 = in.m_44.y;
    float _402 = in.m_44.z;
    float _404 = _162 * 2.0;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = in.m_57.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_59.x;
    float _432 = in.m_59.y;
    float _434 = in.m_59.z;
    float _436 = in.m_59.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = 1.0 / _416;
    float _448 = in.m_61.x;
    float _450 = in.m_61.y;
    float _452 = in.m_61.z;
    float _454 = in.m_61.w;
    float _456 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _460 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _462 = isnan(_396);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = 1.0 / _440;
    float _476 = in.m_51.y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _482 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _484 = isnan(_396);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _496 = isnan(_396);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _508 = isnan(_396);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _444;
    float _520 = _400 * _408;
    float _522 = _400 * _432;
    float _524 = floor(_404);
    float _526 = _400 * _450;
    float _528 = fma(_398, _406, _520);
    float _530 = fma(_398, _430, _522);
    float _532 = fma(_398, _448, _526);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _542 = fma(_402, _434, _530);
    float _544 = in.m_51.z;
    float _546 = 1.0 / _540;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _548;
    float _552 = fma(_402, _410, _528);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _558 = _550 * _446;
    float _560 = fma(_402, _452, _532);
    float _562 = 1.0 / _536;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _564;
    float _568 = _476 * 2.0;
    bool _570 = _524 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _572;
    bool _576 = _524 >= 0.0;
    bool _578 = isnan(_524);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _588 = _396 + _586;
    float _590 = 1.0 / _480;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _596 = _552 + _412;
    float _598 = _594 * _474;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _608 = 1.0 / _556;
    float _610 = _602 * _518;
    float _612 = _606 * _546;
    float _614 = _162 + _476;
    float _616 = _574 * _562;
    bool _618 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _620 = isnan(_396);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = floor(_568);
    float _632 = _614 + (-1.0);
    float _634 = _544 * 2.0;
    float _636 = _566 * _590;
    float _638 = _476 + _544;
    float _640 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = floor(_634);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _648;
    float _652 = _638 + (-1.0);
    int _654 = _584 ? 0 : 1;
    float _656 = _650 * _608;
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _396 + _660;
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _670 = ~_654;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_558, _662, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _678 = _674;
    bool _680 = _424;
    int _682 = as_type<int>(_544);
    if (!_570)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _678 = _686;
    }
    int _688 = _678;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    bool _696 = _630 > 0.0;
    bool _698 = _646 > 0.0;
    bool _700 = _646 >= 0.0;
    bool _702 = isnan(_646);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _712 = _396 + _710;
    bool _714 = _630 >= 0.0;
    bool _716 = isnan(_630);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _726 = _396 + _724;
    bool _728 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _730 = isnan(_396);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_636, _712, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _742 = _666 * _134;
    bool _744 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _746 = isnan(_396);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_598, _726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _758 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _760 = isnan(_396);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_738;
    float _772 = _770 + 1.0;
    int _774 = _708 ? 0 : 1;
    float _776 = exp2(_742);
    float _778 = -_754;
    float _780 = _778 + 1.0;
    float _782 = _768 * _772;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _796 = _792 || _794;
    float _798 = _628 * _780;
    float _800 = _470 * _644;
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = _694 * 12.98980045318603515625;
    float _808 = _754 * _786;
    float _810 = _492 * _804;
    float _812 = fma(_476, 78.233001708984375, _806);
    float _814 = -_492;
    float _816 = _814 + 1.0;
    float _818 = fma(_162, 78.233001708984375, _806);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = -_776;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _396 + _828;
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = _504 * _816;
    float _836 = -_504;
    float _838 = _836 + 1.0;
    float _840 = _796 ? _826 : 0.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _844 = _396 + _842;
    float _846 = fma(_616, _830, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _850 = _396 + _848;
    float _852 = 1.0 / _822;
    float _854 = fma(_612, _844, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _856 = _542 + _436;
    bool _858 = !_424;
    int _860 = _858 ? 0 : 1;
    float _862 = _516 * _838;
    float _864 = fma(_656, _850, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _866 = _560 + _454;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = _832 * 6.283185482025146484375;
    float _880 = sin(_878);
    int _882 = abs(_860);
    float _884 = _818 * 0.15915493667125701904296875;
    float _886 = in.m_65.x;
    float _888 = in.m_65.y;
    float _890 = in.m_65.z;
    bool _892 = !_420;
    int _894 = _892 ? 0 : 1;
    float _896 = _676 * _862;
    float _898 = -_516;
    float _900 = _898 + 1.0;
    float _902 = float(_688);
    float _904 = float(_882);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _896);
    float _908 = _866;
    if (_876)
    {
        float _910 = _840 * _852;
        _154 = _910;
    }
    float _912 = _154;
    int _914 = ~_774;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    int _920 = _918;
    if (!_698)
    {
        int _922 = ~_774;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _880 * 43758.546875;
    int _930 = abs(_894);
    float _932 = _904 * _902;
    float _934 = float(_926);
    float _936 = floor(_928);
    float _938 = float(_930);
    float _940 = fma(_756, _834, _906);
    float _942 = _932 * (-2.0);
    int _944 = _722 ? 0 : 1;
    float _946 = fma(_740, _810, _940);
    float _948 = _938 * _934;
    float _950 = _884 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _476 + (-0.5);
    float _956 = fma(_942, _888, _888);
    float _958 = fma(_668, _942, _668);
    float _960 = _948 * (-2.0);
    float _962 = fma(_640, _800, _946);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    int _966 = ~_944;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_658, _960, _658);
    float _974 = fma(_960, _886, _886);
    float _976 = fma(_958, _912, _964);
    float _978 = -_936;
    float _980 = _928 + _978;
    float _982 = fma(_846, _798, _962);
    bool _984 = !_428;
    int _986 = _984 ? 0 : 1;
    float _988 = _162 + (-0.5);
    float _990 = -_596;
    float _992 = _990 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _994 = _970;
    if (!_696)
    {
        int _996 = ~_944;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_854, _808, _982);
    int _1004 = abs(_986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    float _1008 = -_856;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _992 * _992;
    float _1014 = _952 * 43758.546875;
    float _1016 = float(_1004);
    float _1018 = fma(_864, _782, _1002);
    float _1020 = -_866;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = float(_1000);
    float _1028 = fma(_972, _912, _1006);
    float _1030 = floor(_1014);
    float _1032 = in.m_67.x;
    float _1034 = in.m_67.y;
    float _1036 = in.m_67.z;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1016 * _1026;
    float _1042 = _162 + _544;
    float _1044 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1018);
    float _1046 = _1028 * 0.15915493667125701904296875;
    float _1048 = rsqrt(_1038);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_980, 4.0, -2.0);
    float _1054 = _1040 * (-2.0);
    float _1056 = _976 * 0.15915493667125701904296875;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = _1044 * _1052;
    float _1062 = fma(_1054, _890, _890);
    float _1064 = _544 + (-0.5);
    float _1066 = -_1030;
    float _1068 = _1014 + _1066;
    float _1070 = fma(_1058, _1054, _1058);
    float _1072 = _1060 * 0.15915493667125701904296875;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _190 * _190;
    float _1078 = _1068 * 0.5;
    float _1080 = _1072 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma(_1070, _912, _1074);
    float _1086 = -_1036;
    float _1088 = _694 + _1086;
    float _1090 = -_1078;
    float _1092 = fma(_1076, 1.5, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _1010 * _1048;
    float _1098 = _1044 * _1068;
    float _1100 = _1098 * 4.0;
    float _1102 = _1022 * _1048;
    float _1104 = fma(_1094, _1088, _1036);
    float _1106 = _1072 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1112 = _1096 * _1110;
    float _1114 = _992 * _1048;
    float _1116 = fma(_1100, _694, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _1102 * _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1124 = -_1112;
    float _1126 = fma(_1102, _1122, _1124);
    float _1128 = -_692;
    float _1130 = _1128 + _1034;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1134 = _1114 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1138 = -_1120;
    float _1140 = fma(_1114, _1136, _1138);
    float _1142 = _1126 * _1126;
    float _1144 = _1082 * _1130;
    float _1146 = -_690;
    float _1148 = _1146 + _1032;
    float _1150 = _1084 * 0.15915493667125701904296875;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = -_1134;
    float _1156 = fma(_1096, _1152, _1154);
    float _1158 = fma(_1140, _1140, _1142);
    float _1160 = _1046 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1108 * _1130;
    float _1166 = -_1144;
    float _1168 = fma(_1108, _1148, _1166);
    float _1170 = fma(_1156, _1156, _1158);
    bool _1172 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1174 = isnan(0.5);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1082, _1148, _1164);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1056 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1182 + _692;
    float _1200 = -_1182;
    float _1202 = fma(_1200, _1094, _1198);
    float _1204 = _1168 + _690;
    float _1206 = _1056 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = fma(_1100, _692, _1202);
    float _1212 = -_1168;
    float _1214 = fma(_1212, _1094, _1204);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1210);
    float _1218 = fma(_1100, _690, _1214);
    float _1220 = _1150 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _1216 * _456;
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = _1162 * _1196;
    float _1230 = _1226 * _458;
    float _1232 = _1046 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1162 * _1208;
    float _1238 = rsqrt(_1170);
    float _1240 = _1162 * _1222;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1244 = _1240 * _1224;
    float _1246 = _1242 * _472;
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1234 * _1196;
    float _1254 = _1234 * _1208;
    float _1256 = _1234 * _1222;
    float _1258 = _1208 * _1222;
    float _1260 = _1196 * _1222;
    float _1262 = _1140 * _1238;
    float _1264 = _1126 * _1238;
    float _1266 = _1156 * _1238;
    float _1268 = _1114 * _1262;
    float _1270 = _1102 * _1264;
    float _1272 = fma(_1250, _1236, _1252);
    float _1274 = -_1228;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1228, _1278);
    float _1282 = -_1224;
    float _1284 = _1250 * _1282;
    float _1286 = fma(_1272, _1230, _1244);
    float _1288 = -_1268;
    float _1290 = fma(_1096, _1264, _1288);
    float _1292 = _1256 * _1224;
    float _1294 = fma(_1258, _1230, _1284);
    float _1296 = fma(_1280, _1246, _1286);
    float _1298 = -_1270;
    float _1300 = fma(_1114, _1266, _1298);
    float _1302 = fma(_1250, _1252, _1236);
    float _1304 = fma(_1276, _1230, _1292);
    float _1306 = fma(_1260, _1246, _1294);
    float _1308 = _1290 * _1296;
    float _1310 = _1300 * _1296;
    float _1312 = fma(_1302, _1246, _1304);
    float _1314 = _596 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = fma(_1266, _1306, _1308);
    float _1318 = fma(_1262, _1306, _1310);
    float _1320 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1322 = fma(_1102, _1312, _1316);
    float _1324 = fma(_1096, _1312, _1318);
    float _1326 = _596 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1328 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1320);
    float _1330 = _866 + _1322;
    float _1332 = _856 + _1324;
    float _1334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1334);
    float _1348 = 1.0 / _1336;
    float _1350 = _1340 * _1340;
    float _1352 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1354 = fma(_1344, _1344, _1350);
    float _1356 = _1096 * _1266;
    float _1358 = _1352 + _1336;
    float _1360 = sqrt(_1354);
    float _1362 = -_1356;
    float _1364 = fma(_1102, _1262, _1362);
    float _1366 = _1358 * _1348;
    float _1368 = _1366 * 0.5;
    float _1370 = _1364 * _1296;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = fma(_1264, _1306, _1370);
    bool _1378 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = 1.0 / _1374;
    float _1382 = fma(_1114, _1312, _1376);
    float _1384 = _596 + _1382;
    float _1386 = _1382;
    float _1388 = _1370;
    float _1390 = _1312;
    float _1392 = _1306;
    float _1394 = _1344;
    float _1396 = _1340;
    float _1398 = _1048;
    float _1400 = _1384;
    float _1402 = _1082;
    if (!_1378)
    {
        _1386 = _1332;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    if (!_1378)
    {
        _1388 = _1330;
    }
    float _1408 = _1388;
    float _1410 = _1408;
    if (!_1378)
    {
        _1390 = _1384;
    }
    float _1412 = _1390;
    bool _1414 = !_1378;
    float _1416 = _1412;
    if (!_1414)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1422 = _1360 + _1420;
        float _1424 = rsqrt(_1354);
        float _1426 = _1422 * _1418;
        float _1428 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = _1426 * 0.15915493667125701904296875;
        float _1432 = _1430 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1430 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1442 = _1424 * _1440;
        float _1444 = _1438 + (-1.0);
        float _1446 = fma(_1344, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1448 = fma(_1340, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1450 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = fma(_1384, _1438, _1450);
        _1416 = _1452;
        _1410 = _1448;
        _1406 = _1446;
        _1392 = _1450;
    }
    float _1454 = _1416;
    float _1456 = _1410;
    float _1458 = _1406;
    float _1460 = _1392;
    float _1462 = _1460;
    float _1464 = _1456;
    float _1466 = _1458;
    if (_1192)
    {
        _1462 = 1.0;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1180)
    {
        _1394 = _1454;
    }
    float _1472 = _1394;
    float _1474 = _1472;
    if (_1180)
    {
        _1396 = _1456;
    }
    float _1476 = _1396;
    float _1478 = _1476;
    if (!_1180)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _596 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _856 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = -_856;
        float _1492 = _1490 + _1458;
        float _1494 = _1482 * _1482;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1498 = _866 + _1496;
        float _1500 = -_596;
        float _1502 = _1500 + _1454;
        float _1504 = -_866;
        float _1506 = _1504 + _1456;
        float _1508 = fma(_1486, _1486, _1494);
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1512 = fma(_1498, _1498, _1508);
        float _1514 = sqrt(_1512);
        float _1516 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = precise::min(_1514, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1520 = _1518 * _1510;
        float _1522 = _1516 * _1520;
        float _1524 = fma(_1492, _1522, _856);
        float _1526 = fma(_1502, _1522, _596);
        float _1528 = fma(_1506, _1522, _866);
        _1464 = _1506;
        _1474 = _1526;
        _1466 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1464;
    float _1532 = _1474;
    float _1534 = _1466;
    float _1536 = _1478;
    float _1538 = _1530;
    if (_1192)
    {
        _1398 = 1.0;
    }
    float _1540 = _1398;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1544 = _1380 * _1542;
    float _1546 = _1540;
    if (!_1192)
    {
        float _1548 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = _1548 * 0.15915493667125701904296875;
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1554 = _1550 * 6.283185482025146484375;
        float _1556 = cos(_1554);
        float _1558 = _1552 * 0.15915493667125701904296875;
        float _1560 = _1550 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = 1.0 / _1556;
        float _1566 = _1558 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1562 * _1564;
        float _1572 = _1558 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1578 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1576;
        float _1580 = _1568 * _1570;
        float _1582 = 1.0 / _1578;
        float _1584 = 1.0 / _1580;
        float _1586 = _1574 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1544, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1538 = _1550;
        _1400 = _1582;
        _1470 = _1594;
    }
    float _1596 = _1538;
    float _1598 = _1400;
    float _1600 = _1470;
    float _1602 = _1596;
    if (!_1192)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = fma(_1544, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + 1.0;
        _1602 = _1620;
        _1546 = _1654;
    }
    float _1656 = _1602;
    float _1658 = _1546;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1532 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1534 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1536 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1656;
    float _1704 = _1692;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1684;
    float _1712 = _1686;
    float _1714 = _1688;
    float _1716 = _1690;
    if (_1696)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1696)
    {
        float _1722 = rsqrt(_1692);
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1696)
    {
        float _1726 = _1700 * _1720;
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1696)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _908 = _1730;
    }
    float _1732 = _908;
    float _1734 = _1598;
    if (_1696)
    {
        float _1736 = _1732 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1734 = _1738;
    }
    float _1740 = _1734;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1720;
    float _1748 = _1744;
    if (_1696)
    {
        float _1750 = _1732 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        _1746 = _1752;
    }
    float _1754 = _1746;
    float _1756 = -_1682;
    float _1758 = -_1744;
    float _1760 = fma(_1662, _1756, _1758);
    if (_1696)
    {
        float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1762;
    }
    float _1764 = _1708;
    float _1766 = _1740;
    float _1768 = _1764;
    if (_1696)
    {
        float _1770 = fma(_1740, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = _1772;
    if (!_1696)
    {
        _1768 = _1760;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    if (_1696)
    {
        float _1780 = _1754 + (-1.0);
        _1748 = _1780;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1696)
    {
        float _1786 = _1724 * _1772;
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1792 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1696)
    {
        float _1794 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1696)
    {
        float _1798 = _1684 * _1788;
        _1710 = _1798;
    }
    float _1800 = _1710;
    if (_1696)
    {
        float _1802 = _1686 * _1788;
        _1712 = _1802;
    }
    float _1804 = _1712;
    float _1806 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1792);
    if (_1696)
    {
        float _1808 = fma(_1760, _1754, _1796);
        _1778 = _1808;
    }
    float _1810 = _1778;
    if (_1696)
    {
        float _1812 = _1800 * _1800;
        _1714 = _1812;
    }
    float _1814 = _1714;
    if (_1696)
    {
        float _1816 = _1804 * _1804;
        _1716 = _1816;
    }
    float _1818 = _1716;
    float _1820 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1822 = fma(_1810, _1810, _1814);
    float _1824 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1822 + _1818;
    float _1834 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1824);
    float _1836 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1830;
    float _1840 = _1838 + 1.0;
    float _1842 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1834);
    float _1846 = rsqrt(_1832);
    float _1848 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1850 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1848);
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = abs(_1840);
    float _1860 = log2(_1858);
    float _1862 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1864 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1866 = -_1856;
    float _1868 = fma(_1866, _1790, 1.0);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1872 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1864);
    float _1874 = _1846 * _1800;
    float _1876 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1870);
    float _1878 = _1846 * _1810;
    float _1880 = _1846 * _1804;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1884 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1886 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = log2(_1868);
    float _1890 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1892 = -_1882;
    float _1894 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1892);
    float _1896 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1884);
    float _1898 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1900 = -_1880;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1894);
    float _1904 = _1878 + 1.0;
    float _1906 = exp2(_1890);
    float _1908 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1902, -0.5, 0.5);
    float _1912 = fma(_1902, 0.5, 0.5);
    float _1914 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1898);
    float _1916 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1918 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = 1.0 / _1896;
    float _1922 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1914);
    float _1924 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1916);
    float _1926 = fma(_1912, _1918, -0.212114393711090087890625);
    float _1928 = fma(_1912, _1926, 1.570728778839111328125);
    float _1930 = sqrt(_1910);
    float _1932 = -_1878;
    float _1934 = fma(_1906, _1904, _1932);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1922);
    float _1938 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1924);
    float _1940 = _1888 * 0.693147182464599609375;
    float _1942 = fma(_1934, 0.5, 0.5);
    float _1944 = _1936 * _1920;
    float _1946 = _1938 * _1920;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1950 = fma(_1944, 0.5, 0.5);
    float _1952 = fma(_1946, -0.5, 0.5);
    float _1954 = _1930 * 0.636619746685028076171875;
    float3 _5503 = float3(_1950, _1952, _1948);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5503, float3(0.0), isnan(_5503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5503, float3(0.0), isnan(_5503)), level(0.0)).x;
    float _1958 = -_1928;
    float _1960 = fma(_1954, _1958, 1.0);
    float3 _5519 = float3(_1950, _1952, _1948);
    float4 _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5519, float3(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5519, float3(0.0), isnan(_5519)), level(0.0)).xyzw;
    float _1965 = _1963.x;
    float _1967 = _1963.y;
    float _1969 = _1963.z;
    float _1971 = _1963.w;
    float2 _5536 = float2(_1960, _1942);
    float3 _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1977 = _1975.x;
    float _1979 = _1975.y;
    float _1981 = _1975.z;
    float _1983 = in.m_69.y;
    float _1985 = _1272 * _1290;
    bool _1987 = _476 > 0.5;
    float _1989 = in.m_51.w;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = _1272 * _1364;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = in.m_69.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2005 = _2003 != 0;
    float _2007 = _1280 * _1300;
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2011 = _2009 != 0;
    float _2013 = _1240 * _1290;
    float _2015 = fma(_1258, _1264, _1995);
    float _2017 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1534;
    out.m_71.y = _1532;
    out.m_71.z = _1536;
    float _2019 = -_1250;
    float _2021 = fma(_2019, _1266, _2013);
    int _2023 = as_type<int>(_1950);
    float _2025 = _1896;
    float _2027 = _1938;
    if (_1993)
    {
        bool _2029 = _162 > 0.5;
        _680 = _2029;
    }
    bool _2031 = _680;
    float _2033 = exp2(_2017);
    float _2035 = -_1983;
    float _2037 = _2035 + 1.0;
    bool _2039 = _1989 > 0.5;
    float _2041 = _1989;
    float _2043 = _1983;
    bool _2045 = _2039;
    float _2047 = _2001;
    if (_1993)
    {
        float _2049 = -_2001;
        float _2051 = _2049 + 1.0;
        _2023 = as_type<int>(_2051);
    }
    int _2053 = _2023;
    int _2055 = _2039 ? as_type<int>(_2037) : as_type<int>(_1983);
    if (!_1993)
    {
        _2041 = _2001;
    }
    float _2057 = _2041;
    float _2059 = -_2033;
    float _2061 = _2059 + 1.0;
    float _2063 = _2005 ? as_type<float>(_2055) : _1983;
    float _2065 = _1272 * _1300;
    float _2067 = _2057;
    if (_1993)
    {
        float _2069 = _2031 ? as_type<float>(_2053) : _2001;
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _1240 * _1300;
    if (_2011)
    {
        float _2075 = _1987 ? _2037 : _1983;
        _2043 = _2075;
    }
    float _2077 = _2043;
    float _2079 = _1280 * _1290;
    float _2081 = _1240 * _1364;
    float _2083 = fma(_1258, _1262, _2065);
    float _2085 = -_1250;
    float _2087 = fma(_2085, _1262, _2073);
    float _2089 = _1280 * _1364;
    float _2091 = fma(_1260, _1262, _2007);
    float _2093 = -_1250;
    float _2095 = fma(_2093, _1264, _2081);
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    float _2103 = in.m_73.w;
    float _2105 = fma(_1260, _1264, _2089);
    float _2107 = fma(_1258, _1266, _1985);
    float _2109 = fma(_1260, _1266, _2079);
    if (_1999)
    {
        bool _2111 = _544 > 0.5;
        _2045 = _2111;
    }
    bool _2113 = _2045;
    float _2115 = in.m_75.x;
    float _2117 = in.m_75.y;
    if (_1999)
    {
        float _2119 = -_2001;
        float _2121 = _2119 + 1.0;
        _682 = as_type<int>(_2121);
    }
    int _2123 = _682;
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2127 = fma(_1276, _1096, _2083);
    float _2129 = fma(_1276, _1114, _2015);
    float _2131 = fma(_1276, _1102, _2107);
    if (_1999)
    {
        float _2133 = _2113 ? as_type<float>(_2123) : _2001;
        _2047 = _2133;
    }
    float _2135 = _2047;
    float _2137 = fma(_1256, _1096, _2087);
    float _2139 = fma(_1256, _1114, _2095);
    float _2141 = fma(_1256, _1102, _2021);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2149 = in.m_75.z;
    float _2151 = fma(_1302, _1096, _2091);
    float _2153 = fma(_1302, _1114, _2105);
    float _2155 = fma(_1302, _1102, _2109);
    float _2157 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2147 * _2125;
    float _2163 = _2139 * _2099;
    float _2165 = _2141 * _2099;
    bool _2167 = _1210 != 0.0;
    bool _2169 = isnan(_1210);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    float _2177 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2179 = fma(_2129, _2097, _2163);
    float _2181 = fma(_2131, _2097, _2165);
    float _2183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2185 = _2157 * _2143;
    float _2187 = _1082 * _2117;
    bool _2189 = _1218 == 0.0;
    bool _2191 = !_2175;
    bool _2193 = _2189 && _2191;
    float _2195 = _1108 * _2117;
    float _2197 = _2137 * _2099;
    float _2199 = -_2187;
    float _2201 = fma(_1108, _2115, _2199);
    bool _2203 = _1116 == 0.0;
    bool _2205 = _2203 && _2193;
    float _2207 = _2177 * _2159;
    float _2209 = fma(_2153, _2101, _2179);
    float _2211 = fma(_2155, _2101, _2181);
    float _2213 = fma(_1082, _2115, _2195);
    float _2215 = fma(_2127, _2097, _2197);
    float _2217 = _2213 * _2097;
    float _2219 = _2145 * _2183;
    float _2221 = fma(_2151, _2101, _2215);
    float _2223 = -_2217;
    float _2225 = fma(_2201, _2099, _2223);
    float _2227 = _2099 * _2149;
    out.m_77.x = _2185;
    out.m_77.y = _2161;
    out.m_77.z = _2207;
    out.m_77.w = _2219;
    float _2229 = _2195;
    float _2231 = _2115;
    if (_2205)
    {
        _2229 = _2213;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (!_2205)
    {
        float _2237 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2213);
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2205)
    {
        _1402 = _2201;
    }
    float _2241 = _1402;
    float _2243 = _2241;
    if (!_2205)
    {
        float _2245 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2201);
        _2243 = _2245;
    }
    float _2247 = _2243;
    out.m_79.x = _2221;
    out.m_79.y = _2209;
    out.m_79.z = _2211;
    if (_2205)
    {
        _2231 = _2149;
    }
    float _2249 = _2231;
    float _2251 = _2249;
    if (!_2205)
    {
        float _2253 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2149);
        _2251 = _2253;
    }
    float _2255 = _2251;
    bool _2257 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1680);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = _2201 * _2101;
    float _2269 = -_2227;
    float _2271 = fma(_2213, _2101, _2269);
    float _2273 = _2225 * _2103;
    float _2275 = _2137 * _2239;
    float _2277 = -_2267;
    float _2279 = fma(_2097, _2149, _2277);
    float _2281 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * _2103;
    float _2285 = _2141 * _2239;
    float _2287 = _2279 * _2103;
    float _2289 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2291 = _2139 * _2239;
    float _2293 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2287 * _2137;
    float _2297 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2289);
    float _2299 = _2287 * _2139;
    float _2301 = _2287 * _2141;
    float _2303 = fma(_2127, _2247, _2275);
    float _2305 = fma(_2283, _2127, _2295);
    float _2307 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2297);
    float _2309 = fma(_2129, _2247, _2291);
    float _2311 = fma(_2283, _2129, _2299);
    float _2313 = fma(_2283, _2131, _2301);
    float _2315 = fma(_2273, _2151, _2305);
    float _2317 = _2307 + _1896;
    float _2319 = fma(_2273, _2153, _2311);
    float _2321 = fma(_2273, _2155, _2313);
    float _2323 = fma(_2131, _2247, _2285);
    float _2325 = _2317 * 0.5;
    float _2327 = fma(_2151, _2255, _2303);
    float _2329 = fma(_2153, _2255, _2309);
    float _2331 = fma(_2155, _2255, _2323);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _1896;
    out.m_81.z = _2325;
    out.m_81.w = _1896;
    out.m_83.x = _2327;
    out.m_83.y = _2329;
    out.m_83.z = _2331;
    out.m_85.x = _2315;
    out.m_85.y = _2319;
    out.m_85.z = _2321;
    float _2333 = _1600 * _1658;
    float _2335 = _2307;
    float _2337 = _2319;
    float _2339 = _2315;
    if (!_2265)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2341 = _2025;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2265)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2335;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2349;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2265)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2027;
    float _2359 = _254 * _2349;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2265)
    {
        _2351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2365 = _2351;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2265)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2371 = _2337;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2265)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2377 = _2339;
    float _2379 = _2293 * _1956;
    float _2381 = -_2293;
    float _2383 = _2381 + 1.0;
    float _2385 = _1971 * _2379;
    float _2387 = _1971 * _2383;
    float _2389 = _1981 * _2379;
    float _2391 = fma(_1977, _2385, _1965);
    float _2393 = fma(_1979, _2385, _1967);
    float _2395 = fma(_1971, _2389, _1969);
    out.m_87.x = _2391;
    out.m_87.y = _2393;
    out.m_87.z = _2395;
    out.m_87.w = _2387;
    bool _2397 = !_2265;
    float _2399 = _2377;
    float _2401 = _2377;
    if (!_2397)
    {
        bool _2403 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2405 = isnan(_1680);
        bool _2407 = _2403 || _2405;
        bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2411 = _2407 || _2409;
        if (!_2411)
        {
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2415 = _1680 + _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = 1.0 / _2419;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2443 = _2415 * _2425;
            float _2445 = precise::clamp(_2443, 0.0, 1.0);
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2451 = fma(_2445, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2401 = _2455;
            _2363 = _2459;
            _2375 = _2451;
            _2355 = _2457;
            _2345 = _2453;
            _2369 = _2461;
            _2463 = true;
        }
        else
        {
            bool _2465 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2467 = isnan(_1680);
            bool _2469 = _2465 || _2467;
            bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2473 = _2469 || _2471;
            if (!_2473)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2475 = _2373;
            _2375 = _2475;
            if (!_2473)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2477 = _2399;
            _2401 = _2477;
            if (!_2473)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2479 = _2343;
            _2345 = _2479;
            if (!_2473)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2481 = _2353;
            _2355 = _2481;
            if (!_2473)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2483 = _2361;
            _2363 = _2483;
            if (!_2473)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2485 = _2367;
            bool _2487 = !_2473;
            _2369 = _2485;
            if (!_2487)
            {
                bool _2489 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2491 = isnan(_1680);
                bool _2493 = _2489 || _2491;
                bool _2495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2497 = _2493 || _2495;
                if (!_2497)
                {
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2501 = _1680 + _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = 1.0 / _2505;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2529 = _2501 * _2511;
                    float _2531 = precise::clamp(_2529, 0.0, 1.0);
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2537 = fma(_2531, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2539 = fma(_2531, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2531, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2543 = fma(_2531, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2545 = fma(_2531, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2547 = fma(_2531, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2401 = _2541;
                    _2363 = _2545;
                    _2375 = _2537;
                    _2355 = _2543;
                    _2345 = _2539;
                    _2369 = _2547;
                    _2463 = true;
                }
                else
                {
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2463 = false;
    float _2549 = _2401;
    float _2551 = _2363;
    float _2553 = _2375;
    float _2555 = _2355;
    float _2557 = _2345;
    float _2559 = _2369;
    float _2561 = fma(_2329, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2549;
    float _2567 = _2565 + _2551;
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    out.m_89.x = 0.0;
    float _2573 = fma(_2563, _2567, _2549);
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    float _2579 = fma(_2563, _2571, _2553);
    float _2581 = _2573 * 0.586610972881317138671875;
    bool _2583 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2585 = fma(_2563, _2577, _2557);
    float _2587 = _2359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = fma(_2579, 0.298911988735198974609375, _2581);
    bool _2591 = _1600 > 0.0;
    bool _2593 = isnan(_1600);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2585, 0.114477999508380889892578125, _2589);
    out.m_47.x = _2587;
    bool _2603 = _1658 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = -_2601;
    float _2611 = _2579 + _2609;
    float _2613 = -_2601;
    float _2615 = _2573 + _2613;
    float _2617 = -_2601;
    float _2619 = _2585 + _2617;
    float _2621 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2623 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2625 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    bool _2627 = !_2583;
    if (!_2627)
    {
        float _2629 = -_1532;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2633 = -_1534;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2637 = -_1536;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2641 = _2631 * _2631;
        float _2643 = fma(_2635, _2635, _2641);
        float _2645 = fma(_2639, _2639, _2643);
        float _2647 = sqrt(_2645);
        float _2649 = rsqrt(_2645);
        float _2651 = -_2647;
        float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2655 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = _2635 * _2649;
        float _2661 = _2631 * _2649;
        float _2663 = abs(_2657);
        float _2665 = log2(_2663);
        float _2667 = _2639 * _2649;
        float _2669 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2671 = _2329 * _2661;
        float _2673 = -_2661;
        float _2675 = -_2669;
        float _2677 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2675);
        float _2679 = fma(_2327, _2659, _2671);
        float _2681 = -_2667;
        float _2683 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2677);
        float _2685 = fma(_2331, _2667, _2679);
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2691 = _2683 + _2689;
        float _2693 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2695 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = exp2(_2693);
        float _2701 = _2699 * _2697;
        float _2703 = _2687 * _2701;
        float _2705 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2709 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2705;
        out.m_89.y = _2707;
        out.m_89.z = _2709;
    }
    out.m_91.x = _2621;
    out.m_91.y = _2623;
    out.m_91.z = _2625;
    if (!_2607)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2711;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2463 = false;
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_124);
        out.gl_Position.z = _2767;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_160);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        return out;
    }
    float _162 = in.m_51.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _170 = _168 != 0;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _174 = _172 != 0;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = 1.0 / _130;
    float _182 = _166 * _164;
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = _184 * 6.283185482025146484375;
    float _188 = floor(_184);
    float _190 = _134 * _180;
    float _192 = _186 * 0.15915493667125701904296875;
    bool _194 = !_170;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_196);
    float _200 = _192 * 6.283185482025146484375;
    float _202 = cos(_200);
    bool _204 = !_178;
    int _206 = _204 ? 0 : 1;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _210 = abs(_206);
    float _212 = -_188;
    float _214 = _184 + _212;
    bool _216 = !_174;
    int _218 = _216 ? 0 : 1;
    float _220 = float(_198);
    int _222 = abs(_218);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _228 = _214 < 0.5;
    float _230 = float(_228);
    float _232 = fma(_202, 0.5, 0.5);
    float _234 = float(_210);
    float _236 = abs(_226);
    float _238 = _220 * _236;
    float _240 = float(_222);
    float _242 = -_232;
    float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _246 = -_230;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _250 = fma(_234, _244, _238);
    float _252 = abs(_248);
    float _254 = fma(_240, _252, _250);
    bool _256 = !_208;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _190;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _300 = 1.0 / _296;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    bool _306 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_276);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    out.m_53.w = _298;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _316 * _304;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    float _338 = _280 * _300;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = fma(_320, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_330, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_324, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _346 * _332;
    float _354 = _348 * _332;
    float _356 = _350 * _332;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _362);
    float _370 = _364 * _344;
    float _372 = _366 * _342;
    float _374 = _368 * _340;
    bool _376 = !_326;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _190;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_44.x;
    float _400 = in.m_44.y;
    float _402 = in.m_44.z;
    float _404 = _162 * 2.0;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = in.m_57.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_59.x;
    float _432 = in.m_59.y;
    float _434 = in.m_59.z;
    float _436 = in.m_59.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = 1.0 / _416;
    float _448 = in.m_61.x;
    float _450 = in.m_61.y;
    float _452 = in.m_61.z;
    float _454 = in.m_61.w;
    float _456 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _460 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _462 = isnan(_396);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = 1.0 / _440;
    float _476 = in.m_51.y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _482 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _484 = isnan(_396);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _496 = isnan(_396);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _508 = isnan(_396);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _444;
    float _520 = _400 * _408;
    float _522 = _400 * _432;
    float _524 = floor(_404);
    float _526 = _400 * _450;
    float _528 = fma(_398, _406, _520);
    float _530 = fma(_398, _430, _522);
    float _532 = fma(_398, _448, _526);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _542 = fma(_402, _434, _530);
    float _544 = in.m_51.z;
    float _546 = 1.0 / _540;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _548;
    float _552 = fma(_402, _410, _528);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _558 = _550 * _446;
    float _560 = fma(_402, _452, _532);
    float _562 = 1.0 / _536;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _564;
    float _568 = _476 * 2.0;
    bool _570 = _524 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _572;
    bool _576 = _524 >= 0.0;
    bool _578 = isnan(_524);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _588 = _396 + _586;
    float _590 = 1.0 / _480;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _596 = _552 + _412;
    float _598 = _594 * _474;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _608 = 1.0 / _556;
    float _610 = _602 * _518;
    float _612 = _606 * _546;
    float _614 = _162 + _476;
    float _616 = _574 * _562;
    bool _618 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _620 = isnan(_396);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = floor(_568);
    float _632 = _614 + (-1.0);
    float _634 = _544 * 2.0;
    float _636 = _566 * _590;
    float _638 = _476 + _544;
    float _640 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = floor(_634);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _648;
    float _652 = _638 + (-1.0);
    int _654 = _584 ? 0 : 1;
    float _656 = _650 * _608;
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _396 + _660;
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _670 = ~_654;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_558, _662, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _678 = _674;
    bool _680 = _424;
    int _682 = as_type<int>(_544);
    if (!_570)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _678 = _686;
    }
    int _688 = _678;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    bool _696 = _630 > 0.0;
    bool _698 = _646 > 0.0;
    bool _700 = _646 >= 0.0;
    bool _702 = isnan(_646);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _712 = _396 + _710;
    bool _714 = _630 >= 0.0;
    bool _716 = isnan(_630);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _726 = _396 + _724;
    bool _728 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _730 = isnan(_396);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_636, _712, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _742 = _666 * _134;
    bool _744 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _746 = isnan(_396);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_598, _726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _758 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _760 = isnan(_396);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_738;
    float _772 = _770 + 1.0;
    int _774 = _708 ? 0 : 1;
    float _776 = exp2(_742);
    float _778 = -_754;
    float _780 = _778 + 1.0;
    float _782 = _768 * _772;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _796 = _792 || _794;
    float _798 = _628 * _780;
    float _800 = _470 * _644;
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = _694 * 12.98980045318603515625;
    float _808 = _754 * _786;
    float _810 = _492 * _804;
    float _812 = fma(_476, 78.233001708984375, _806);
    float _814 = -_492;
    float _816 = _814 + 1.0;
    float _818 = fma(_162, 78.233001708984375, _806);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = -_776;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _396 + _828;
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = _504 * _816;
    float _836 = -_504;
    float _838 = _836 + 1.0;
    float _840 = _796 ? _826 : 0.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _844 = _396 + _842;
    float _846 = fma(_616, _830, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _850 = _396 + _848;
    float _852 = 1.0 / _822;
    float _854 = fma(_612, _844, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _856 = _542 + _436;
    bool _858 = !_424;
    int _860 = _858 ? 0 : 1;
    float _862 = _516 * _838;
    float _864 = fma(_656, _850, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _866 = _560 + _454;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = _832 * 6.283185482025146484375;
    float _880 = sin(_878);
    int _882 = abs(_860);
    float _884 = _818 * 0.15915493667125701904296875;
    float _886 = in.m_65.x;
    float _888 = in.m_65.y;
    float _890 = in.m_65.z;
    bool _892 = !_420;
    int _894 = _892 ? 0 : 1;
    float _896 = _676 * _862;
    float _898 = -_516;
    float _900 = _898 + 1.0;
    float _902 = float(_688);
    float _904 = float(_882);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _896);
    float _908 = _866;
    if (_876)
    {
        float _910 = _840 * _852;
        _154 = _910;
    }
    float _912 = _154;
    int _914 = ~_774;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    int _920 = _918;
    if (!_698)
    {
        int _922 = ~_774;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _880 * 43758.546875;
    int _930 = abs(_894);
    float _932 = _904 * _902;
    float _934 = float(_926);
    float _936 = floor(_928);
    float _938 = float(_930);
    float _940 = fma(_756, _834, _906);
    float _942 = _932 * (-2.0);
    int _944 = _722 ? 0 : 1;
    float _946 = fma(_740, _810, _940);
    float _948 = _938 * _934;
    float _950 = _884 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _476 + (-0.5);
    float _956 = fma(_942, _888, _888);
    float _958 = fma(_668, _942, _668);
    float _960 = _948 * (-2.0);
    float _962 = fma(_640, _800, _946);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    int _966 = ~_944;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_658, _960, _658);
    float _974 = fma(_960, _886, _886);
    float _976 = fma(_958, _912, _964);
    float _978 = -_936;
    float _980 = _928 + _978;
    float _982 = fma(_846, _798, _962);
    bool _984 = !_428;
    int _986 = _984 ? 0 : 1;
    float _988 = _162 + (-0.5);
    float _990 = -_596;
    float _992 = _990 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _994 = _970;
    if (!_696)
    {
        int _996 = ~_944;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_854, _808, _982);
    int _1004 = abs(_986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    float _1008 = -_856;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _992 * _992;
    float _1014 = _952 * 43758.546875;
    float _1016 = float(_1004);
    float _1018 = fma(_864, _782, _1002);
    float _1020 = -_866;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = float(_1000);
    float _1028 = fma(_972, _912, _1006);
    float _1030 = floor(_1014);
    float _1032 = in.m_67.x;
    float _1034 = in.m_67.y;
    float _1036 = in.m_67.z;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1016 * _1026;
    float _1042 = _162 + _544;
    float _1044 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1018);
    float _1046 = _1028 * 0.15915493667125701904296875;
    float _1048 = rsqrt(_1038);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_980, 4.0, -2.0);
    float _1054 = _1040 * (-2.0);
    float _1056 = _976 * 0.15915493667125701904296875;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = _1044 * _1052;
    float _1062 = fma(_1054, _890, _890);
    float _1064 = _544 + (-0.5);
    float _1066 = -_1030;
    float _1068 = _1014 + _1066;
    float _1070 = fma(_1058, _1054, _1058);
    float _1072 = _1060 * 0.15915493667125701904296875;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _190 * _190;
    float _1078 = _1068 * 0.5;
    float _1080 = _1072 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma(_1070, _912, _1074);
    float _1086 = -_1036;
    float _1088 = _694 + _1086;
    float _1090 = -_1078;
    float _1092 = fma(_1076, 1.5, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _1010 * _1048;
    float _1098 = _1044 * _1068;
    float _1100 = _1098 * 4.0;
    float _1102 = _1022 * _1048;
    float _1104 = fma(_1094, _1088, _1036);
    float _1106 = _1072 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1112 = _1096 * _1110;
    float _1114 = _992 * _1048;
    float _1116 = fma(_1100, _694, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _1102 * _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1124 = -_1112;
    float _1126 = fma(_1102, _1122, _1124);
    float _1128 = -_692;
    float _1130 = _1128 + _1034;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1134 = _1114 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1138 = -_1120;
    float _1140 = fma(_1114, _1136, _1138);
    float _1142 = _1126 * _1126;
    float _1144 = _1082 * _1130;
    float _1146 = -_690;
    float _1148 = _1146 + _1032;
    float _1150 = _1084 * 0.15915493667125701904296875;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = -_1134;
    float _1156 = fma(_1096, _1152, _1154);
    float _1158 = fma(_1140, _1140, _1142);
    float _1160 = _1046 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1108 * _1130;
    float _1166 = -_1144;
    float _1168 = fma(_1108, _1148, _1166);
    float _1170 = fma(_1156, _1156, _1158);
    bool _1172 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1174 = isnan(0.5);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1082, _1148, _1164);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1056 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1182 + _692;
    float _1200 = -_1182;
    float _1202 = fma(_1200, _1094, _1198);
    float _1204 = _1168 + _690;
    float _1206 = _1056 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = fma(_1100, _692, _1202);
    float _1212 = -_1168;
    float _1214 = fma(_1212, _1094, _1204);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1210);
    float _1218 = fma(_1100, _690, _1214);
    float _1220 = _1150 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _1216 * _456;
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = _1162 * _1196;
    float _1230 = _1226 * _458;
    float _1232 = _1046 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1162 * _1208;
    float _1238 = rsqrt(_1170);
    float _1240 = _1162 * _1222;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1244 = _1240 * _1224;
    float _1246 = _1242 * _472;
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1234 * _1196;
    float _1254 = _1234 * _1208;
    float _1256 = _1234 * _1222;
    float _1258 = _1208 * _1222;
    float _1260 = _1196 * _1222;
    float _1262 = _1140 * _1238;
    float _1264 = _1126 * _1238;
    float _1266 = _1156 * _1238;
    float _1268 = _1114 * _1262;
    float _1270 = _1102 * _1264;
    float _1272 = fma(_1250, _1236, _1252);
    float _1274 = -_1228;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1228, _1278);
    float _1282 = -_1224;
    float _1284 = _1250 * _1282;
    float _1286 = fma(_1272, _1230, _1244);
    float _1288 = -_1268;
    float _1290 = fma(_1096, _1264, _1288);
    float _1292 = _1256 * _1224;
    float _1294 = fma(_1258, _1230, _1284);
    float _1296 = fma(_1280, _1246, _1286);
    float _1298 = -_1270;
    float _1300 = fma(_1114, _1266, _1298);
    float _1302 = fma(_1250, _1252, _1236);
    float _1304 = fma(_1276, _1230, _1292);
    float _1306 = fma(_1260, _1246, _1294);
    float _1308 = _1290 * _1296;
    float _1310 = _1300 * _1296;
    float _1312 = fma(_1302, _1246, _1304);
    float _1314 = _596 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = fma(_1266, _1306, _1308);
    float _1318 = fma(_1262, _1306, _1310);
    float _1320 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1322 = fma(_1102, _1312, _1316);
    float _1324 = fma(_1096, _1312, _1318);
    float _1326 = _596 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1328 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1320);
    float _1330 = _866 + _1322;
    float _1332 = _856 + _1324;
    float _1334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1334);
    float _1348 = 1.0 / _1336;
    float _1350 = _1340 * _1340;
    float _1352 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1354 = fma(_1344, _1344, _1350);
    float _1356 = _1096 * _1266;
    float _1358 = _1352 + _1336;
    float _1360 = sqrt(_1354);
    float _1362 = -_1356;
    float _1364 = fma(_1102, _1262, _1362);
    float _1366 = _1358 * _1348;
    float _1368 = _1366 * 0.5;
    float _1370 = _1364 * _1296;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = fma(_1264, _1306, _1370);
    bool _1378 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = 1.0 / _1374;
    float _1382 = fma(_1114, _1312, _1376);
    float _1384 = _596 + _1382;
    float _1386 = _1382;
    float _1388 = _1370;
    float _1390 = _1312;
    float _1392 = _1306;
    float _1394 = _1344;
    float _1396 = _1340;
    float _1398 = _1048;
    float _1400 = _1384;
    float _1402 = _1082;
    if (!_1378)
    {
        _1386 = _1332;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    if (!_1378)
    {
        _1388 = _1330;
    }
    float _1408 = _1388;
    float _1410 = _1408;
    if (!_1378)
    {
        _1390 = _1384;
    }
    float _1412 = _1390;
    bool _1414 = !_1378;
    float _1416 = _1412;
    if (!_1414)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1422 = _1360 + _1420;
        float _1424 = rsqrt(_1354);
        float _1426 = _1422 * _1418;
        float _1428 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = _1426 * 0.15915493667125701904296875;
        float _1432 = _1430 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1430 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1442 = _1424 * _1440;
        float _1444 = _1438 + (-1.0);
        float _1446 = fma(_1344, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1448 = fma(_1340, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1450 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = fma(_1384, _1438, _1450);
        _1416 = _1452;
        _1410 = _1448;
        _1406 = _1446;
        _1392 = _1450;
    }
    float _1454 = _1416;
    float _1456 = _1410;
    float _1458 = _1406;
    float _1460 = _1392;
    float _1462 = _1460;
    float _1464 = _1456;
    float _1466 = _1458;
    if (_1192)
    {
        _1462 = 1.0;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1180)
    {
        _1394 = _1454;
    }
    float _1472 = _1394;
    float _1474 = _1472;
    if (_1180)
    {
        _1396 = _1456;
    }
    float _1476 = _1396;
    float _1478 = _1476;
    if (!_1180)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _596 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _856 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = -_856;
        float _1492 = _1490 + _1458;
        float _1494 = _1482 * _1482;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1498 = _866 + _1496;
        float _1500 = -_596;
        float _1502 = _1500 + _1454;
        float _1504 = -_866;
        float _1506 = _1504 + _1456;
        float _1508 = fma(_1486, _1486, _1494);
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1512 = fma(_1498, _1498, _1508);
        float _1514 = sqrt(_1512);
        float _1516 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = precise::min(_1514, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1520 = _1518 * _1510;
        float _1522 = _1516 * _1520;
        float _1524 = fma(_1492, _1522, _856);
        float _1526 = fma(_1502, _1522, _596);
        float _1528 = fma(_1506, _1522, _866);
        _1464 = _1506;
        _1474 = _1526;
        _1466 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1464;
    float _1532 = _1474;
    float _1534 = _1466;
    float _1536 = _1478;
    float _1538 = _1530;
    if (_1192)
    {
        _1398 = 1.0;
    }
    float _1540 = _1398;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1544 = _1380 * _1542;
    float _1546 = _1540;
    if (!_1192)
    {
        float _1548 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = _1548 * 0.15915493667125701904296875;
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1554 = _1550 * 6.283185482025146484375;
        float _1556 = cos(_1554);
        float _1558 = _1552 * 0.15915493667125701904296875;
        float _1560 = _1550 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = 1.0 / _1556;
        float _1566 = _1558 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1562 * _1564;
        float _1572 = _1558 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1578 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1576;
        float _1580 = _1568 * _1570;
        float _1582 = 1.0 / _1578;
        float _1584 = 1.0 / _1580;
        float _1586 = _1574 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1544, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1538 = _1550;
        _1400 = _1582;
        _1470 = _1594;
    }
    float _1596 = _1538;
    float _1598 = _1400;
    float _1600 = _1470;
    float _1602 = _1596;
    if (!_1192)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = fma(_1544, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + 1.0;
        _1602 = _1620;
        _1546 = _1654;
    }
    float _1656 = _1602;
    float _1658 = _1546;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1532 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1534 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1536 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1656;
    float _1704 = _1692;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1684;
    float _1712 = _1686;
    float _1714 = _1688;
    float _1716 = _1690;
    if (_1696)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1696)
    {
        float _1722 = rsqrt(_1692);
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1696)
    {
        float _1726 = _1700 * _1720;
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1696)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _908 = _1730;
    }
    float _1732 = _908;
    float _1734 = _1598;
    if (_1696)
    {
        float _1736 = _1732 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1734 = _1738;
    }
    float _1740 = _1734;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1720;
    float _1748 = _1744;
    if (_1696)
    {
        float _1750 = _1732 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        _1746 = _1752;
    }
    float _1754 = _1746;
    float _1756 = -_1682;
    float _1758 = -_1744;
    float _1760 = fma(_1662, _1756, _1758);
    if (_1696)
    {
        float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1762;
    }
    float _1764 = _1708;
    float _1766 = _1740;
    float _1768 = _1764;
    if (_1696)
    {
        float _1770 = fma(_1740, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = _1772;
    if (!_1696)
    {
        _1768 = _1760;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    if (_1696)
    {
        float _1780 = _1754 + (-1.0);
        _1748 = _1780;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1696)
    {
        float _1786 = _1724 * _1772;
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1792 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1696)
    {
        float _1794 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1696)
    {
        float _1798 = _1684 * _1788;
        _1710 = _1798;
    }
    float _1800 = _1710;
    if (_1696)
    {
        float _1802 = _1686 * _1788;
        _1712 = _1802;
    }
    float _1804 = _1712;
    float _1806 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1792);
    if (_1696)
    {
        float _1808 = fma(_1760, _1754, _1796);
        _1778 = _1808;
    }
    float _1810 = _1778;
    if (_1696)
    {
        float _1812 = _1800 * _1800;
        _1714 = _1812;
    }
    float _1814 = _1714;
    if (_1696)
    {
        float _1816 = _1804 * _1804;
        _1716 = _1816;
    }
    float _1818 = _1716;
    float _1820 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1822 = fma(_1810, _1810, _1814);
    float _1824 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1822 + _1818;
    float _1834 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1824);
    float _1836 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1830;
    float _1840 = _1838 + 1.0;
    float _1842 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1834);
    float _1846 = rsqrt(_1832);
    float _1848 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1850 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1848);
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = abs(_1840);
    float _1860 = log2(_1858);
    float _1862 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1864 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1866 = -_1856;
    float _1868 = fma(_1866, _1790, 1.0);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1872 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1864);
    float _1874 = _1846 * _1800;
    float _1876 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1870);
    float _1878 = _1846 * _1810;
    float _1880 = _1846 * _1804;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1884 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1886 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = log2(_1868);
    float _1890 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1892 = -_1882;
    float _1894 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1892);
    float _1896 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1884);
    float _1898 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1900 = -_1880;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1894);
    float _1904 = _1878 + 1.0;
    float _1906 = exp2(_1890);
    float _1908 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1902, -0.5, 0.5);
    float _1912 = fma(_1902, 0.5, 0.5);
    float _1914 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1898);
    float _1916 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1918 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = 1.0 / _1896;
    float _1922 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1914);
    float _1924 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1916);
    float _1926 = fma(_1912, _1918, -0.212114393711090087890625);
    float _1928 = fma(_1912, _1926, 1.570728778839111328125);
    float _1930 = sqrt(_1910);
    float _1932 = -_1878;
    float _1934 = fma(_1906, _1904, _1932);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1922);
    float _1938 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1924);
    float _1940 = _1888 * 0.693147182464599609375;
    float _1942 = fma(_1934, 0.5, 0.5);
    float _1944 = _1936 * _1920;
    float _1946 = _1938 * _1920;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1950 = fma(_1944, 0.5, 0.5);
    float _1952 = fma(_1946, -0.5, 0.5);
    float _1954 = _1930 * 0.636619746685028076171875;
    float3 _5503 = float3(_1950, _1952, _1948);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5503, float3(0.0), isnan(_5503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5503, float3(0.0), isnan(_5503)), level(0.0)).x;
    float _1958 = -_1928;
    float _1960 = fma(_1954, _1958, 1.0);
    float3 _5519 = float3(_1950, _1952, _1948);
    float4 _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5519, float3(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5519, float3(0.0), isnan(_5519)), level(0.0)).xyzw;
    float _1965 = _1963.x;
    float _1967 = _1963.y;
    float _1969 = _1963.z;
    float _1971 = _1963.w;
    float2 _5536 = float2(_1960, _1942);
    float3 _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1977 = _1975.x;
    float _1979 = _1975.y;
    float _1981 = _1975.z;
    float _1983 = in.m_69.y;
    float _1985 = _1272 * _1290;
    bool _1987 = _476 > 0.5;
    float _1989 = in.m_51.w;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = _1272 * _1364;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = in.m_69.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2005 = _2003 != 0;
    float _2007 = _1280 * _1300;
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2011 = _2009 != 0;
    float _2013 = _1240 * _1290;
    float _2015 = fma(_1258, _1264, _1995);
    float _2017 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1534;
    out.m_71.y = _1532;
    out.m_71.z = _1536;
    float _2019 = -_1250;
    float _2021 = fma(_2019, _1266, _2013);
    int _2023 = as_type<int>(_1950);
    float _2025 = _1896;
    float _2027 = _1938;
    if (_1993)
    {
        bool _2029 = _162 > 0.5;
        _680 = _2029;
    }
    bool _2031 = _680;
    float _2033 = exp2(_2017);
    float _2035 = -_1983;
    float _2037 = _2035 + 1.0;
    bool _2039 = _1989 > 0.5;
    float _2041 = _1989;
    float _2043 = _1983;
    bool _2045 = _2039;
    float _2047 = _2001;
    if (_1993)
    {
        float _2049 = -_2001;
        float _2051 = _2049 + 1.0;
        _2023 = as_type<int>(_2051);
    }
    int _2053 = _2023;
    int _2055 = _2039 ? as_type<int>(_2037) : as_type<int>(_1983);
    if (!_1993)
    {
        _2041 = _2001;
    }
    float _2057 = _2041;
    float _2059 = -_2033;
    float _2061 = _2059 + 1.0;
    float _2063 = _2005 ? as_type<float>(_2055) : _1983;
    float _2065 = _1272 * _1300;
    float _2067 = _2057;
    if (_1993)
    {
        float _2069 = _2031 ? as_type<float>(_2053) : _2001;
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _1240 * _1300;
    if (_2011)
    {
        float _2075 = _1987 ? _2037 : _1983;
        _2043 = _2075;
    }
    float _2077 = _2043;
    float _2079 = _1280 * _1290;
    float _2081 = _1240 * _1364;
    float _2083 = fma(_1258, _1262, _2065);
    float _2085 = -_1250;
    float _2087 = fma(_2085, _1262, _2073);
    float _2089 = _1280 * _1364;
    float _2091 = fma(_1260, _1262, _2007);
    float _2093 = -_1250;
    float _2095 = fma(_2093, _1264, _2081);
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    float _2103 = in.m_73.w;
    float _2105 = fma(_1260, _1264, _2089);
    float _2107 = fma(_1258, _1266, _1985);
    float _2109 = fma(_1260, _1266, _2079);
    if (_1999)
    {
        bool _2111 = _544 > 0.5;
        _2045 = _2111;
    }
    bool _2113 = _2045;
    float _2115 = in.m_75.x;
    float _2117 = in.m_75.y;
    if (_1999)
    {
        float _2119 = -_2001;
        float _2121 = _2119 + 1.0;
        _682 = as_type<int>(_2121);
    }
    int _2123 = _682;
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2127 = fma(_1276, _1096, _2083);
    float _2129 = fma(_1276, _1114, _2015);
    float _2131 = fma(_1276, _1102, _2107);
    if (_1999)
    {
        float _2133 = _2113 ? as_type<float>(_2123) : _2001;
        _2047 = _2133;
    }
    float _2135 = _2047;
    float _2137 = fma(_1256, _1096, _2087);
    float _2139 = fma(_1256, _1114, _2095);
    float _2141 = fma(_1256, _1102, _2021);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2149 = in.m_75.z;
    float _2151 = fma(_1302, _1096, _2091);
    float _2153 = fma(_1302, _1114, _2105);
    float _2155 = fma(_1302, _1102, _2109);
    float _2157 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2147 * _2125;
    float _2163 = _2139 * _2099;
    float _2165 = _2141 * _2099;
    bool _2167 = _1210 != 0.0;
    bool _2169 = isnan(_1210);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    float _2177 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2179 = fma(_2129, _2097, _2163);
    float _2181 = fma(_2131, _2097, _2165);
    float _2183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2185 = _2157 * _2143;
    float _2187 = _1082 * _2117;
    bool _2189 = _1218 == 0.0;
    bool _2191 = !_2175;
    bool _2193 = _2189 && _2191;
    float _2195 = _1108 * _2117;
    float _2197 = _2137 * _2099;
    float _2199 = -_2187;
    float _2201 = fma(_1108, _2115, _2199);
    bool _2203 = _1116 == 0.0;
    bool _2205 = _2203 && _2193;
    float _2207 = _2177 * _2159;
    float _2209 = fma(_2153, _2101, _2179);
    float _2211 = fma(_2155, _2101, _2181);
    float _2213 = fma(_1082, _2115, _2195);
    float _2215 = fma(_2127, _2097, _2197);
    float _2217 = _2213 * _2097;
    float _2219 = _2145 * _2183;
    float _2221 = fma(_2151, _2101, _2215);
    float _2223 = -_2217;
    float _2225 = fma(_2201, _2099, _2223);
    float _2227 = _2099 * _2149;
    out.m_77.x = _2185;
    out.m_77.y = _2161;
    out.m_77.z = _2207;
    out.m_77.w = _2219;
    float _2229 = _2195;
    float _2231 = _2115;
    if (_2205)
    {
        _2229 = _2213;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (!_2205)
    {
        float _2237 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2213);
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2205)
    {
        _1402 = _2201;
    }
    float _2241 = _1402;
    float _2243 = _2241;
    if (!_2205)
    {
        float _2245 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2201);
        _2243 = _2245;
    }
    float _2247 = _2243;
    out.m_79.x = _2221;
    out.m_79.y = _2209;
    out.m_79.z = _2211;
    if (_2205)
    {
        _2231 = _2149;
    }
    float _2249 = _2231;
    float _2251 = _2249;
    if (!_2205)
    {
        float _2253 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2149);
        _2251 = _2253;
    }
    float _2255 = _2251;
    bool _2257 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1680);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = _2201 * _2101;
    float _2269 = -_2227;
    float _2271 = fma(_2213, _2101, _2269);
    float _2273 = _2225 * _2103;
    float _2275 = _2137 * _2239;
    float _2277 = -_2267;
    float _2279 = fma(_2097, _2149, _2277);
    float _2281 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * _2103;
    float _2285 = _2141 * _2239;
    float _2287 = _2279 * _2103;
    float _2289 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2291 = _2139 * _2239;
    float _2293 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2287 * _2137;
    float _2297 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2289);
    float _2299 = _2287 * _2139;
    float _2301 = _2287 * _2141;
    float _2303 = fma(_2127, _2247, _2275);
    float _2305 = fma(_2283, _2127, _2295);
    float _2307 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2297);
    float _2309 = fma(_2129, _2247, _2291);
    float _2311 = fma(_2283, _2129, _2299);
    float _2313 = fma(_2283, _2131, _2301);
    float _2315 = fma(_2273, _2151, _2305);
    float _2317 = _2307 + _1896;
    float _2319 = fma(_2273, _2153, _2311);
    float _2321 = fma(_2273, _2155, _2313);
    float _2323 = fma(_2131, _2247, _2285);
    float _2325 = _2317 * 0.5;
    float _2327 = fma(_2151, _2255, _2303);
    float _2329 = fma(_2153, _2255, _2309);
    float _2331 = fma(_2155, _2255, _2323);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _1896;
    out.m_81.z = _2325;
    out.m_81.w = _1896;
    out.m_83.x = _2327;
    out.m_83.y = _2329;
    out.m_83.z = _2331;
    out.m_85.x = _2315;
    out.m_85.y = _2319;
    out.m_85.z = _2321;
    float _2333 = _1600 * _1658;
    float _2335 = _2307;
    float _2337 = _2319;
    float _2339 = _2315;
    if (!_2265)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2341 = _2025;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2265)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2335;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2349;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2265)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2027;
    float _2359 = _254 * _2349;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2265)
    {
        _2351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2365 = _2351;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2265)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2371 = _2337;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2265)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2377 = _2339;
    float _2379 = _2293 * _1956;
    float _2381 = -_2293;
    float _2383 = _2381 + 1.0;
    float _2385 = _1971 * _2379;
    float _2387 = _1971 * _2383;
    float _2389 = _1981 * _2379;
    float _2391 = fma(_1977, _2385, _1965);
    float _2393 = fma(_1979, _2385, _1967);
    float _2395 = fma(_1971, _2389, _1969);
    out.m_87.x = _2391;
    out.m_87.y = _2393;
    out.m_87.z = _2395;
    out.m_87.w = _2387;
    bool _2397 = !_2265;
    float _2399 = _2377;
    float _2401 = _2377;
    if (!_2397)
    {
        bool _2403 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2405 = isnan(_1680);
        bool _2407 = _2403 || _2405;
        bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2411 = _2407 || _2409;
        if (!_2411)
        {
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2415 = _1680 + _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = 1.0 / _2419;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2443 = _2415 * _2425;
            float _2445 = precise::clamp(_2443, 0.0, 1.0);
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2451 = fma(_2445, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2401 = _2455;
            _2363 = _2459;
            _2375 = _2451;
            _2355 = _2457;
            _2345 = _2453;
            _2369 = _2461;
            _2463 = true;
        }
        else
        {
            bool _2465 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2467 = isnan(_1680);
            bool _2469 = _2465 || _2467;
            bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2473 = _2469 || _2471;
            if (!_2473)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2475 = _2373;
            _2375 = _2475;
            if (!_2473)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2477 = _2399;
            _2401 = _2477;
            if (!_2473)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2479 = _2343;
            _2345 = _2479;
            if (!_2473)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2481 = _2353;
            _2355 = _2481;
            if (!_2473)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2483 = _2361;
            _2363 = _2483;
            if (!_2473)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2485 = _2367;
            bool _2487 = !_2473;
            _2369 = _2485;
            if (!_2487)
            {
                bool _2489 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2491 = isnan(_1680);
                bool _2493 = _2489 || _2491;
                bool _2495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2497 = _2493 || _2495;
                if (!_2497)
                {
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2501 = _1680 + _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = 1.0 / _2505;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2529 = _2501 * _2511;
                    float _2531 = precise::clamp(_2529, 0.0, 1.0);
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2537 = fma(_2531, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2539 = fma(_2531, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2531, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2543 = fma(_2531, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2545 = fma(_2531, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2547 = fma(_2531, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2401 = _2541;
                    _2363 = _2545;
                    _2375 = _2537;
                    _2355 = _2543;
                    _2345 = _2539;
                    _2369 = _2547;
                    _2463 = true;
                }
                else
                {
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2463 = false;
    float _2549 = _2401;
    float _2551 = _2363;
    float _2553 = _2375;
    float _2555 = _2355;
    float _2557 = _2345;
    float _2559 = _2369;
    float _2561 = fma(_2329, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2549;
    float _2567 = _2565 + _2551;
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    out.m_89.x = 0.0;
    float _2573 = fma(_2563, _2567, _2549);
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    float _2579 = fma(_2563, _2571, _2553);
    float _2581 = _2573 * 0.586610972881317138671875;
    bool _2583 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2585 = fma(_2563, _2577, _2557);
    float _2587 = _2359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = fma(_2579, 0.298911988735198974609375, _2581);
    bool _2591 = _1600 > 0.0;
    bool _2593 = isnan(_1600);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2585, 0.114477999508380889892578125, _2589);
    out.m_47.x = _2587;
    bool _2603 = _1658 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = -_2601;
    float _2611 = _2579 + _2609;
    float _2613 = -_2601;
    float _2615 = _2573 + _2613;
    float _2617 = -_2601;
    float _2619 = _2585 + _2617;
    float _2621 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2623 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2625 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    bool _2627 = !_2583;
    if (!_2627)
    {
        float _2629 = -_1532;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2633 = -_1534;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2637 = -_1536;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2641 = _2631 * _2631;
        float _2643 = fma(_2635, _2635, _2641);
        float _2645 = fma(_2639, _2639, _2643);
        float _2647 = sqrt(_2645);
        float _2649 = rsqrt(_2645);
        float _2651 = -_2647;
        float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2655 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = _2635 * _2649;
        float _2661 = _2631 * _2649;
        float _2663 = abs(_2657);
        float _2665 = log2(_2663);
        float _2667 = _2639 * _2649;
        float _2669 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2671 = _2329 * _2661;
        float _2673 = -_2661;
        float _2675 = -_2669;
        float _2677 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2675);
        float _2679 = fma(_2327, _2659, _2671);
        float _2681 = -_2667;
        float _2683 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2677);
        float _2685 = fma(_2331, _2667, _2679);
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2691 = _2683 + _2689;
        float _2693 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2695 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = exp2(_2693);
        float _2701 = _2699 * _2697;
        float _2703 = _2687 * _2701;
        float _2705 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2709 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2705;
        out.m_89.y = _2707;
        out.m_89.z = _2709;
    }
    out.m_91.x = _2621;
    out.m_91.y = _2623;
    out.m_91.z = _2625;
    if (!_2607)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2711;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2463 = false;
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2767 = as_type<float>(_124);
        out.gl_Position.z = _2767;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_160);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_51.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _170 = _168 != 0;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _174 = _172 != 0;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = 1.0 / _130;
    float _182 = _166 * _164;
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = _184 * 6.283185482025146484375;
    float _188 = floor(_184);
    float _190 = _134 * _180;
    float _192 = _186 * 0.15915493667125701904296875;
    bool _194 = !_170;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_196);
    float _200 = _192 * 6.283185482025146484375;
    float _202 = cos(_200);
    bool _204 = !_178;
    int _206 = _204 ? 0 : 1;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _210 = abs(_206);
    float _212 = -_188;
    float _214 = _184 + _212;
    bool _216 = !_174;
    int _218 = _216 ? 0 : 1;
    float _220 = float(_198);
    int _222 = abs(_218);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _228 = _214 < 0.5;
    float _230 = float(_228);
    float _232 = fma(_202, 0.5, 0.5);
    float _234 = float(_210);
    float _236 = abs(_226);
    float _238 = _220 * _236;
    float _240 = float(_222);
    float _242 = -_232;
    float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _246 = -_230;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _250 = fma(_234, _244, _238);
    float _252 = abs(_248);
    float _254 = fma(_240, _252, _250);
    bool _256 = !_208;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _190;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _300 = 1.0 / _296;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    bool _306 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_276);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    out.m_53.w = _298;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = _316 * _304;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    float _338 = _280 * _300;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = fma(_320, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = fma(_330, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_324, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = _346 * _332;
    float _354 = _348 * _332;
    float _356 = _350 * _332;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _362);
    float _370 = _364 * _344;
    float _372 = _366 * _342;
    float _374 = _368 * _340;
    bool _376 = !_326;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _190;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_44.x;
    float _400 = in.m_44.y;
    float _402 = in.m_44.z;
    float _404 = _162 * 2.0;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = in.m_57.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_59.x;
    float _432 = in.m_59.y;
    float _434 = in.m_59.z;
    float _436 = in.m_59.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = 1.0 / _416;
    float _448 = in.m_61.x;
    float _450 = in.m_61.y;
    float _452 = in.m_61.z;
    float _454 = in.m_61.w;
    float _456 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _460 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _462 = isnan(_396);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = 1.0 / _440;
    float _476 = in.m_51.y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _482 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _484 = isnan(_396);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _496 = isnan(_396);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _508 = isnan(_396);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _444;
    float _520 = _400 * _408;
    float _522 = _400 * _432;
    float _524 = floor(_404);
    float _526 = _400 * _450;
    float _528 = fma(_398, _406, _520);
    float _530 = fma(_398, _430, _522);
    float _532 = fma(_398, _448, _526);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _542 = fma(_402, _434, _530);
    float _544 = in.m_51.z;
    float _546 = 1.0 / _540;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _548;
    float _552 = fma(_402, _410, _528);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _558 = _550 * _446;
    float _560 = fma(_402, _452, _532);
    float _562 = 1.0 / _536;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _564;
    float _568 = _476 * 2.0;
    bool _570 = _524 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _572;
    bool _576 = _524 >= 0.0;
    bool _578 = isnan(_524);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _588 = _396 + _586;
    float _590 = 1.0 / _480;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _596 = _552 + _412;
    float _598 = _594 * _474;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _608 = 1.0 / _556;
    float _610 = _602 * _518;
    float _612 = _606 * _546;
    float _614 = _162 + _476;
    float _616 = _574 * _562;
    bool _618 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _620 = isnan(_396);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = floor(_568);
    float _632 = _614 + (-1.0);
    float _634 = _544 * 2.0;
    float _636 = _566 * _590;
    float _638 = _476 + _544;
    float _640 = fma(_610, _588, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = floor(_634);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _648;
    float _652 = _638 + (-1.0);
    int _654 = _584 ? 0 : 1;
    float _656 = _650 * _608;
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _662 = _396 + _660;
    float _664 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _666 = log2(_664);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _670 = ~_654;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_558, _662, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _678 = _674;
    bool _680 = _424;
    int _682 = as_type<int>(_544);
    if (!_570)
    {
        int _684 = ~_654;
        int _686 = _684 + 1;
        _678 = _686;
    }
    int _688 = _678;
    float _690 = in.m_63.x;
    float _692 = in.m_63.y;
    float _694 = in.m_63.z;
    bool _696 = _630 > 0.0;
    bool _698 = _646 > 0.0;
    bool _700 = _646 >= 0.0;
    bool _702 = isnan(_646);
    bool _704 = _700 || _702;
    bool _706 = isnan(0.0);
    bool _708 = _704 || _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _712 = _396 + _710;
    bool _714 = _630 >= 0.0;
    bool _716 = isnan(_630);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _726 = _396 + _724;
    bool _728 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _730 = isnan(_396);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_636, _712, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _742 = _666 * _134;
    bool _744 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _746 = isnan(_396);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_598, _726, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _758 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _760 = isnan(_396);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -_738;
    float _772 = _770 + 1.0;
    int _774 = _708 ? 0 : 1;
    float _776 = exp2(_742);
    float _778 = -_754;
    float _780 = _778 + 1.0;
    float _782 = _768 * _772;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _796 = _792 || _794;
    float _798 = _628 * _780;
    float _800 = _470 * _644;
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = _694 * 12.98980045318603515625;
    float _808 = _754 * _786;
    float _810 = _492 * _804;
    float _812 = fma(_476, 78.233001708984375, _806);
    float _814 = -_492;
    float _816 = _814 + 1.0;
    float _818 = fma(_162, 78.233001708984375, _806);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = -_776;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _830 = _396 + _828;
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = _504 * _816;
    float _836 = -_504;
    float _838 = _836 + 1.0;
    float _840 = _796 ? _826 : 0.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _844 = _396 + _842;
    float _846 = fma(_616, _830, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _850 = _396 + _848;
    float _852 = 1.0 / _822;
    float _854 = fma(_612, _844, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _856 = _542 + _436;
    bool _858 = !_424;
    int _860 = _858 ? 0 : 1;
    float _862 = _516 * _838;
    float _864 = fma(_656, _850, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _866 = _560 + _454;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = _832 * 6.283185482025146484375;
    float _880 = sin(_878);
    int _882 = abs(_860);
    float _884 = _818 * 0.15915493667125701904296875;
    float _886 = in.m_65.x;
    float _888 = in.m_65.y;
    float _890 = in.m_65.z;
    bool _892 = !_420;
    int _894 = _892 ? 0 : 1;
    float _896 = _676 * _862;
    float _898 = -_516;
    float _900 = _898 + 1.0;
    float _902 = float(_688);
    float _904 = float(_882);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[159].x, _896);
    float _908 = _866;
    if (_876)
    {
        float _910 = _840 * _852;
        _154 = _910;
    }
    float _912 = _154;
    int _914 = ~_774;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    int _920 = _918;
    if (!_698)
    {
        int _922 = ~_774;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _880 * 43758.546875;
    int _930 = abs(_894);
    float _932 = _904 * _902;
    float _934 = float(_926);
    float _936 = floor(_928);
    float _938 = float(_930);
    float _940 = fma(_756, _834, _906);
    float _942 = _932 * (-2.0);
    int _944 = _722 ? 0 : 1;
    float _946 = fma(_740, _810, _940);
    float _948 = _938 * _934;
    float _950 = _884 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = _476 + (-0.5);
    float _956 = fma(_942, _888, _888);
    float _958 = fma(_668, _942, _668);
    float _960 = _948 * (-2.0);
    float _962 = fma(_640, _800, _946);
    float _964 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    int _966 = ~_944;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = fma(_658, _960, _658);
    float _974 = fma(_960, _886, _886);
    float _976 = fma(_958, _912, _964);
    float _978 = -_936;
    float _980 = _928 + _978;
    float _982 = fma(_846, _798, _962);
    bool _984 = !_428;
    int _986 = _984 ? 0 : 1;
    float _988 = _162 + (-0.5);
    float _990 = -_596;
    float _992 = _990 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _994 = _970;
    if (!_696)
    {
        int _996 = ~_944;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_854, _808, _982);
    int _1004 = abs(_986);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _974);
    float _1008 = -_856;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1012 = _992 * _992;
    float _1014 = _952 * 43758.546875;
    float _1016 = float(_1004);
    float _1018 = fma(_864, _782, _1002);
    float _1020 = -_866;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1024 = fma(_1010, _1010, _1012);
    float _1026 = float(_1000);
    float _1028 = fma(_972, _912, _1006);
    float _1030 = floor(_1014);
    float _1032 = in.m_67.x;
    float _1034 = in.m_67.y;
    float _1036 = in.m_67.z;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1016 * _1026;
    float _1042 = _162 + _544;
    float _1044 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1018);
    float _1046 = _1028 * 0.15915493667125701904296875;
    float _1048 = rsqrt(_1038);
    float _1050 = _1042 + (-1.0);
    float _1052 = fma(_980, 4.0, -2.0);
    float _1054 = _1040 * (-2.0);
    float _1056 = _976 * 0.15915493667125701904296875;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = _1044 * _1052;
    float _1062 = fma(_1054, _890, _890);
    float _1064 = _544 + (-0.5);
    float _1066 = -_1030;
    float _1068 = _1014 + _1066;
    float _1070 = fma(_1058, _1054, _1058);
    float _1072 = _1060 * 0.15915493667125701904296875;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _190 * _190;
    float _1078 = _1068 * 0.5;
    float _1080 = _1072 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = fma(_1070, _912, _1074);
    float _1086 = -_1036;
    float _1088 = _694 + _1086;
    float _1090 = -_1078;
    float _1092 = fma(_1076, 1.5, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _1010 * _1048;
    float _1098 = _1044 * _1068;
    float _1100 = _1098 * 4.0;
    float _1102 = _1022 * _1048;
    float _1104 = fma(_1094, _1088, _1036);
    float _1106 = _1072 * 6.283185482025146484375;
    float _1108 = cos(_1106);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1112 = _1096 * _1110;
    float _1114 = _992 * _1048;
    float _1116 = fma(_1100, _694, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = _1102 * _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1124 = -_1112;
    float _1126 = fma(_1102, _1122, _1124);
    float _1128 = -_692;
    float _1130 = _1128 + _1034;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1134 = _1114 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1138 = -_1120;
    float _1140 = fma(_1114, _1136, _1138);
    float _1142 = _1126 * _1126;
    float _1144 = _1082 * _1130;
    float _1146 = -_690;
    float _1148 = _1146 + _1032;
    float _1150 = _1084 * 0.15915493667125701904296875;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = -_1134;
    float _1156 = fma(_1096, _1152, _1154);
    float _1158 = fma(_1140, _1140, _1142);
    float _1160 = _1046 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1108 * _1130;
    float _1166 = -_1144;
    float _1168 = fma(_1108, _1148, _1166);
    float _1170 = fma(_1156, _1156, _1158);
    bool _1172 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1174 = isnan(0.5);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1082, _1148, _1164);
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1056 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1182 + _692;
    float _1200 = -_1182;
    float _1202 = fma(_1200, _1094, _1198);
    float _1204 = _1168 + _690;
    float _1206 = _1056 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = fma(_1100, _692, _1202);
    float _1212 = -_1168;
    float _1214 = fma(_1212, _1094, _1204);
    float _1216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1210);
    float _1218 = fma(_1100, _690, _1214);
    float _1220 = _1150 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _1216 * _456;
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = _1162 * _1196;
    float _1230 = _1226 * _458;
    float _1232 = _1046 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1162 * _1208;
    float _1238 = rsqrt(_1170);
    float _1240 = _1162 * _1222;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1244 = _1240 * _1224;
    float _1246 = _1242 * _472;
    float _1248 = _1150 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1234 * _1196;
    float _1254 = _1234 * _1208;
    float _1256 = _1234 * _1222;
    float _1258 = _1208 * _1222;
    float _1260 = _1196 * _1222;
    float _1262 = _1140 * _1238;
    float _1264 = _1126 * _1238;
    float _1266 = _1156 * _1238;
    float _1268 = _1114 * _1262;
    float _1270 = _1102 * _1264;
    float _1272 = fma(_1250, _1236, _1252);
    float _1274 = -_1228;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1228, _1278);
    float _1282 = -_1224;
    float _1284 = _1250 * _1282;
    float _1286 = fma(_1272, _1230, _1244);
    float _1288 = -_1268;
    float _1290 = fma(_1096, _1264, _1288);
    float _1292 = _1256 * _1224;
    float _1294 = fma(_1258, _1230, _1284);
    float _1296 = fma(_1280, _1246, _1286);
    float _1298 = -_1270;
    float _1300 = fma(_1114, _1266, _1298);
    float _1302 = fma(_1250, _1252, _1236);
    float _1304 = fma(_1276, _1230, _1292);
    float _1306 = fma(_1260, _1246, _1294);
    float _1308 = _1290 * _1296;
    float _1310 = _1300 * _1296;
    float _1312 = fma(_1302, _1246, _1304);
    float _1314 = _596 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1316 = fma(_1266, _1306, _1308);
    float _1318 = fma(_1262, _1306, _1310);
    float _1320 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1314);
    float _1322 = fma(_1102, _1312, _1316);
    float _1324 = fma(_1096, _1312, _1318);
    float _1326 = _596 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1328 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1320);
    float _1330 = _866 + _1322;
    float _1332 = _856 + _1324;
    float _1334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1334);
    float _1348 = 1.0 / _1336;
    float _1350 = _1340 * _1340;
    float _1352 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1354 = fma(_1344, _1344, _1350);
    float _1356 = _1096 * _1266;
    float _1358 = _1352 + _1336;
    float _1360 = sqrt(_1354);
    float _1362 = -_1356;
    float _1364 = fma(_1102, _1262, _1362);
    float _1366 = _1358 * _1348;
    float _1368 = _1366 * 0.5;
    float _1370 = _1364 * _1296;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1374 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1372);
    float _1376 = fma(_1264, _1306, _1370);
    bool _1378 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = 1.0 / _1374;
    float _1382 = fma(_1114, _1312, _1376);
    float _1384 = _596 + _1382;
    float _1386 = _1382;
    float _1388 = _1370;
    float _1390 = _1312;
    float _1392 = _1306;
    float _1394 = _1344;
    float _1396 = _1340;
    float _1398 = _1048;
    float _1400 = _1384;
    float _1402 = _1082;
    if (!_1378)
    {
        _1386 = _1332;
    }
    float _1404 = _1386;
    float _1406 = _1404;
    if (!_1378)
    {
        _1388 = _1330;
    }
    float _1408 = _1388;
    float _1410 = _1408;
    if (!_1378)
    {
        _1390 = _1384;
    }
    float _1412 = _1390;
    bool _1414 = !_1378;
    float _1416 = _1412;
    if (!_1414)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1422 = _1360 + _1420;
        float _1424 = rsqrt(_1354);
        float _1426 = _1422 * _1418;
        float _1428 = _1384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1430 = _1426 * 0.15915493667125701904296875;
        float _1432 = _1430 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1430 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1442 = _1424 * _1440;
        float _1444 = _1438 + (-1.0);
        float _1446 = fma(_1344, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1448 = fma(_1340, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1450 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = fma(_1384, _1438, _1450);
        _1416 = _1452;
        _1410 = _1448;
        _1406 = _1446;
        _1392 = _1450;
    }
    float _1454 = _1416;
    float _1456 = _1410;
    float _1458 = _1406;
    float _1460 = _1392;
    float _1462 = _1460;
    float _1464 = _1456;
    float _1466 = _1458;
    if (_1192)
    {
        _1462 = 1.0;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1180)
    {
        _1394 = _1454;
    }
    float _1472 = _1394;
    float _1474 = _1472;
    if (_1180)
    {
        _1396 = _1456;
    }
    float _1476 = _1396;
    float _1478 = _1476;
    if (!_1180)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _596 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _856 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = -_856;
        float _1492 = _1490 + _1458;
        float _1494 = _1482 * _1482;
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1498 = _866 + _1496;
        float _1500 = -_596;
        float _1502 = _1500 + _1454;
        float _1504 = -_866;
        float _1506 = _1504 + _1456;
        float _1508 = fma(_1486, _1486, _1494);
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1512 = fma(_1498, _1498, _1508);
        float _1514 = sqrt(_1512);
        float _1516 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = precise::min(_1514, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1520 = _1518 * _1510;
        float _1522 = _1516 * _1520;
        float _1524 = fma(_1492, _1522, _856);
        float _1526 = fma(_1502, _1522, _596);
        float _1528 = fma(_1506, _1522, _866);
        _1464 = _1506;
        _1474 = _1526;
        _1466 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1464;
    float _1532 = _1474;
    float _1534 = _1466;
    float _1536 = _1478;
    float _1538 = _1530;
    if (_1192)
    {
        _1398 = 1.0;
    }
    float _1540 = _1398;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1544 = _1380 * _1542;
    float _1546 = _1540;
    if (!_1192)
    {
        float _1548 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1550 = _1548 * 0.15915493667125701904296875;
        float _1552 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1554 = _1550 * 6.283185482025146484375;
        float _1556 = cos(_1554);
        float _1558 = _1552 * 0.15915493667125701904296875;
        float _1560 = _1550 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = 1.0 / _1556;
        float _1566 = _1558 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = _1562 * _1564;
        float _1572 = _1558 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1578 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1576;
        float _1580 = _1568 * _1570;
        float _1582 = 1.0 / _1578;
        float _1584 = 1.0 / _1580;
        float _1586 = _1574 * _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1590 = fma(_1544, _1586, _1588);
        float _1592 = _1590 * _1582;
        float _1594 = precise::clamp(_1592, 0.0, 1.0);
        _1538 = _1550;
        _1400 = _1582;
        _1470 = _1594;
    }
    float _1596 = _1538;
    float _1598 = _1400;
    float _1600 = _1470;
    float _1602 = _1596;
    if (!_1192)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = _1624 * _1626;
        float _1634 = 1.0 / _1632;
        float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1636;
        float _1640 = 1.0 / _1638;
        float _1642 = _1630 * _1634;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = fma(_1544, _1642, _1644);
        float _1648 = _1646 * _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + 1.0;
        _1602 = _1620;
        _1546 = _1654;
    }
    float _1656 = _1602;
    float _1658 = _1546;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1662 = _1532 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1666 = _1534 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1670 = _1536 + _1668;
    float _1672 = _1662 * _1662;
    float _1674 = fma(_1666, _1666, _1672);
    float _1676 = fma(_1670, _1670, _1674);
    float _1678 = rsqrt(_1676);
    float _1680 = sqrt(_1676);
    float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1684 = _1666 * _1682;
    float _1686 = _1670 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 * _1686;
    float _1692 = _1688 + _1690;
    float _1694 = sqrt(_1692);
    bool _1696 = _1694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = _1694 + _1698;
    float _1702 = _1656;
    float _1704 = _1692;
    float _1706 = _1700;
    float _1708 = _1662;
    float _1710 = _1684;
    float _1712 = _1686;
    float _1714 = _1688;
    float _1716 = _1690;
    if (_1696)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1696)
    {
        float _1722 = rsqrt(_1692);
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1696)
    {
        float _1726 = _1700 * _1720;
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1696)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _908 = _1730;
    }
    float _1732 = _908;
    float _1734 = _1598;
    if (_1696)
    {
        float _1736 = _1732 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        _1734 = _1738;
    }
    float _1740 = _1734;
    float _1742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1744 = precise::max(0.0, _1742);
    float _1746 = _1720;
    float _1748 = _1744;
    if (_1696)
    {
        float _1750 = _1732 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        _1746 = _1752;
    }
    float _1754 = _1746;
    float _1756 = -_1682;
    float _1758 = -_1744;
    float _1760 = fma(_1662, _1756, _1758);
    if (_1696)
    {
        float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1762;
    }
    float _1764 = _1708;
    float _1766 = _1740;
    float _1768 = _1764;
    if (_1696)
    {
        float _1770 = fma(_1740, _1764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = _1772;
    if (!_1696)
    {
        _1768 = _1760;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    if (_1696)
    {
        float _1780 = _1754 + (-1.0);
        _1748 = _1780;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1696)
    {
        float _1786 = _1724 * _1772;
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1792 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1696)
    {
        float _1794 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1696)
    {
        float _1798 = _1684 * _1788;
        _1710 = _1798;
    }
    float _1800 = _1710;
    if (_1696)
    {
        float _1802 = _1686 * _1788;
        _1712 = _1802;
    }
    float _1804 = _1712;
    float _1806 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1792);
    if (_1696)
    {
        float _1808 = fma(_1760, _1754, _1796);
        _1778 = _1808;
    }
    float _1810 = _1778;
    if (_1696)
    {
        float _1812 = _1800 * _1800;
        _1714 = _1812;
    }
    float _1814 = _1714;
    if (_1696)
    {
        float _1816 = _1804 * _1804;
        _1716 = _1816;
    }
    float _1818 = _1716;
    float _1820 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1806);
    float _1822 = fma(_1810, _1810, _1814);
    float _1824 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1822 + _1818;
    float _1834 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1824);
    float _1836 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1830;
    float _1840 = _1838 + 1.0;
    float _1842 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1834);
    float _1846 = rsqrt(_1832);
    float _1848 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1836);
    float _1850 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1848);
    float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = abs(_1840);
    float _1860 = log2(_1858);
    float _1862 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1864 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1866 = -_1856;
    float _1868 = fma(_1866, _1790, 1.0);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1872 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1864);
    float _1874 = _1846 * _1800;
    float _1876 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1870);
    float _1878 = _1846 * _1810;
    float _1880 = _1846 * _1804;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1884 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1886 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = log2(_1868);
    float _1890 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1892 = -_1882;
    float _1894 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1892);
    float _1896 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1884);
    float _1898 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1900 = -_1880;
    float _1902 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1894);
    float _1904 = _1878 + 1.0;
    float _1906 = exp2(_1890);
    float _1908 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1902, -0.5, 0.5);
    float _1912 = fma(_1902, 0.5, 0.5);
    float _1914 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1898);
    float _1916 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1918 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = 1.0 / _1896;
    float _1922 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1914);
    float _1924 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1916);
    float _1926 = fma(_1912, _1918, -0.212114393711090087890625);
    float _1928 = fma(_1912, _1926, 1.570728778839111328125);
    float _1930 = sqrt(_1910);
    float _1932 = -_1878;
    float _1934 = fma(_1906, _1904, _1932);
    float _1936 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1922);
    float _1938 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1924);
    float _1940 = _1888 * 0.693147182464599609375;
    float _1942 = fma(_1934, 0.5, 0.5);
    float _1944 = _1936 * _1920;
    float _1946 = _1938 * _1920;
    float _1948 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1950 = fma(_1944, 0.5, 0.5);
    float _1952 = fma(_1946, -0.5, 0.5);
    float _1954 = _1930 * 0.636619746685028076171875;
    float3 _5503 = float3(_1950, _1952, _1948);
    float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5503, float3(0.0), isnan(_5503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5503, float3(0.0), isnan(_5503)), level(0.0)).x;
    float _1958 = -_1928;
    float _1960 = fma(_1954, _1958, 1.0);
    float3 _5519 = float3(_1950, _1952, _1948);
    float4 _1963 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5519, float3(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5519, float3(0.0), isnan(_5519)), level(0.0)).xyzw;
    float _1965 = _1963.x;
    float _1967 = _1963.y;
    float _1969 = _1963.z;
    float _1971 = _1963.w;
    float2 _5536 = float2(_1960, _1942);
    float3 _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1977 = _1975.x;
    float _1979 = _1975.y;
    float _1981 = _1975.z;
    float _1983 = in.m_69.y;
    float _1985 = _1272 * _1290;
    bool _1987 = _476 > 0.5;
    float _1989 = in.m_51.w;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = _1272 * _1364;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1999 = _1997 != 0;
    float _2001 = in.m_69.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2005 = _2003 != 0;
    float _2007 = _1280 * _1300;
    int _2009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2011 = _2009 != 0;
    float _2013 = _1240 * _1290;
    float _2015 = fma(_1258, _1264, _1995);
    float _2017 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1534;
    out.m_71.y = _1532;
    out.m_71.z = _1536;
    float _2019 = -_1250;
    float _2021 = fma(_2019, _1266, _2013);
    int _2023 = as_type<int>(_1950);
    float _2025 = _1896;
    float _2027 = _1938;
    if (_1993)
    {
        bool _2029 = _162 > 0.5;
        _680 = _2029;
    }
    bool _2031 = _680;
    float _2033 = exp2(_2017);
    float _2035 = -_1983;
    float _2037 = _2035 + 1.0;
    bool _2039 = _1989 > 0.5;
    float _2041 = _1989;
    float _2043 = _1983;
    bool _2045 = _2039;
    float _2047 = _2001;
    if (_1993)
    {
        float _2049 = -_2001;
        float _2051 = _2049 + 1.0;
        _2023 = as_type<int>(_2051);
    }
    int _2053 = _2023;
    int _2055 = _2039 ? as_type<int>(_2037) : as_type<int>(_1983);
    if (!_1993)
    {
        _2041 = _2001;
    }
    float _2057 = _2041;
    float _2059 = -_2033;
    float _2061 = _2059 + 1.0;
    float _2063 = _2005 ? as_type<float>(_2055) : _1983;
    float _2065 = _1272 * _1300;
    float _2067 = _2057;
    if (_1993)
    {
        float _2069 = _2031 ? as_type<float>(_2053) : _2001;
        _2067 = _2069;
    }
    float _2071 = _2067;
    float _2073 = _1240 * _1300;
    if (_2011)
    {
        float _2075 = _1987 ? _2037 : _1983;
        _2043 = _2075;
    }
    float _2077 = _2043;
    float _2079 = _1280 * _1290;
    float _2081 = _1240 * _1364;
    float _2083 = fma(_1258, _1262, _2065);
    float _2085 = -_1250;
    float _2087 = fma(_2085, _1262, _2073);
    float _2089 = _1280 * _1364;
    float _2091 = fma(_1260, _1262, _2007);
    float _2093 = -_1250;
    float _2095 = fma(_2093, _1264, _2081);
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    float _2103 = in.m_73.w;
    float _2105 = fma(_1260, _1264, _2089);
    float _2107 = fma(_1258, _1266, _1985);
    float _2109 = fma(_1260, _1266, _2079);
    if (_1999)
    {
        bool _2111 = _544 > 0.5;
        _2045 = _2111;
    }
    bool _2113 = _2045;
    float _2115 = in.m_75.x;
    float _2117 = in.m_75.y;
    if (_1999)
    {
        float _2119 = -_2001;
        float _2121 = _2119 + 1.0;
        _682 = as_type<int>(_2121);
    }
    int _2123 = _682;
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2127 = fma(_1276, _1096, _2083);
    float _2129 = fma(_1276, _1114, _2015);
    float _2131 = fma(_1276, _1102, _2107);
    if (_1999)
    {
        float _2133 = _2113 ? as_type<float>(_2123) : _2001;
        _2047 = _2133;
    }
    float _2135 = _2047;
    float _2137 = fma(_1256, _1096, _2087);
    float _2139 = fma(_1256, _1114, _2095);
    float _2141 = fma(_1256, _1102, _2021);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2149 = in.m_75.z;
    float _2151 = fma(_1302, _1096, _2091);
    float _2153 = fma(_1302, _1114, _2105);
    float _2155 = fma(_1302, _1102, _2109);
    float _2157 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2147 * _2125;
    float _2163 = _2139 * _2099;
    float _2165 = _2141 * _2099;
    bool _2167 = _1210 != 0.0;
    bool _2169 = isnan(_1210);
    bool _2171 = _2167 || _2169;
    bool _2173 = isnan(0.0);
    bool _2175 = _2171 || _2173;
    float _2177 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2179 = fma(_2129, _2097, _2163);
    float _2181 = fma(_2131, _2097, _2165);
    float _2183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2185 = _2157 * _2143;
    float _2187 = _1082 * _2117;
    bool _2189 = _1218 == 0.0;
    bool _2191 = !_2175;
    bool _2193 = _2189 && _2191;
    float _2195 = _1108 * _2117;
    float _2197 = _2137 * _2099;
    float _2199 = -_2187;
    float _2201 = fma(_1108, _2115, _2199);
    bool _2203 = _1116 == 0.0;
    bool _2205 = _2203 && _2193;
    float _2207 = _2177 * _2159;
    float _2209 = fma(_2153, _2101, _2179);
    float _2211 = fma(_2155, _2101, _2181);
    float _2213 = fma(_1082, _2115, _2195);
    float _2215 = fma(_2127, _2097, _2197);
    float _2217 = _2213 * _2097;
    float _2219 = _2145 * _2183;
    float _2221 = fma(_2151, _2101, _2215);
    float _2223 = -_2217;
    float _2225 = fma(_2201, _2099, _2223);
    float _2227 = _2099 * _2149;
    out.m_77.x = _2185;
    out.m_77.y = _2161;
    out.m_77.z = _2207;
    out.m_77.w = _2219;
    float _2229 = _2195;
    float _2231 = _2115;
    if (_2205)
    {
        _2229 = _2213;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (!_2205)
    {
        float _2237 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2213);
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2205)
    {
        _1402 = _2201;
    }
    float _2241 = _1402;
    float _2243 = _2241;
    if (!_2205)
    {
        float _2245 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2201);
        _2243 = _2245;
    }
    float _2247 = _2243;
    out.m_79.x = _2221;
    out.m_79.y = _2209;
    out.m_79.z = _2211;
    if (_2205)
    {
        _2231 = _2149;
    }
    float _2249 = _2231;
    float _2251 = _2249;
    if (!_2205)
    {
        float _2253 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2149);
        _2251 = _2253;
    }
    float _2255 = _2251;
    bool _2257 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1680);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = _2201 * _2101;
    float _2269 = -_2227;
    float _2271 = fma(_2213, _2101, _2269);
    float _2273 = _2225 * _2103;
    float _2275 = _2137 * _2239;
    float _2277 = -_2267;
    float _2279 = fma(_2097, _2149, _2277);
    float _2281 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2283 = _2271 * _2103;
    float _2285 = _2141 * _2239;
    float _2287 = _2279 * _2103;
    float _2289 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2281);
    float _2291 = _2139 * _2239;
    float _2293 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2287 * _2137;
    float _2297 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2289);
    float _2299 = _2287 * _2139;
    float _2301 = _2287 * _2141;
    float _2303 = fma(_2127, _2247, _2275);
    float _2305 = fma(_2283, _2127, _2295);
    float _2307 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2297);
    float _2309 = fma(_2129, _2247, _2291);
    float _2311 = fma(_2283, _2129, _2299);
    float _2313 = fma(_2283, _2131, _2301);
    float _2315 = fma(_2273, _2151, _2305);
    float _2317 = _2307 + _1896;
    float _2319 = fma(_2273, _2153, _2311);
    float _2321 = fma(_2273, _2155, _2313);
    float _2323 = fma(_2131, _2247, _2285);
    float _2325 = _2317 * 0.5;
    float _2327 = fma(_2151, _2255, _2303);
    float _2329 = fma(_2153, _2255, _2309);
    float _2331 = fma(_2155, _2255, _2323);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _1896;
    out.m_81.z = _2325;
    out.m_81.w = _1896;
    out.m_83.x = _2327;
    out.m_83.y = _2329;
    out.m_83.z = _2331;
    out.m_85.x = _2315;
    out.m_85.y = _2319;
    out.m_85.z = _2321;
    float _2333 = _1600 * _1658;
    float _2335 = _2307;
    float _2337 = _2319;
    float _2339 = _2315;
    if (!_2265)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2341 = _2025;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2265)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2335;
    float _2349 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2351 = _2349;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2265)
    {
        _2027 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2027;
    float _2359 = _254 * _2349;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2265)
    {
        _2351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2365 = _2351;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2265)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2371 = _2337;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2265)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2377 = _2339;
    float _2379 = _2293 * _1956;
    float _2381 = -_2293;
    float _2383 = _2381 + 1.0;
    float _2385 = _1971 * _2379;
    float _2387 = _1971 * _2383;
    float _2389 = _1981 * _2379;
    float _2391 = fma(_1977, _2385, _1965);
    float _2393 = fma(_1979, _2385, _1967);
    float _2395 = fma(_1971, _2389, _1969);
    out.m_87.x = _2391;
    out.m_87.y = _2393;
    out.m_87.z = _2395;
    out.m_87.w = _2387;
    bool _2397 = !_2265;
    float _2399 = _2377;
    float _2401 = _2377;
    if (!_2397)
    {
        bool _2403 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2405 = isnan(_1680);
        bool _2407 = _2403 || _2405;
        bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2411 = _2407 || _2409;
        if (!_2411)
        {
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2415 = _1680 + _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2417;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2425 = 1.0 / _2419;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2443 = _2415 * _2425;
            float _2445 = precise::clamp(_2443, 0.0, 1.0);
            float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2451 = fma(_2445, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2401 = _2455;
            _2363 = _2459;
            _2375 = _2451;
            _2355 = _2457;
            _2345 = _2453;
            _2369 = _2461;
            _2463 = true;
        }
        else
        {
            bool _2465 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2467 = isnan(_1680);
            bool _2469 = _2465 || _2467;
            bool _2471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2473 = _2469 || _2471;
            if (!_2473)
            {
                _2373 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2475 = _2373;
            _2375 = _2475;
            if (!_2473)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2477 = _2399;
            _2401 = _2477;
            if (!_2473)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2479 = _2343;
            _2345 = _2479;
            if (!_2473)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2481 = _2353;
            _2355 = _2481;
            if (!_2473)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2483 = _2361;
            _2363 = _2483;
            if (!_2473)
            {
                _2367 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2485 = _2367;
            bool _2487 = !_2473;
            _2369 = _2485;
            if (!_2487)
            {
                bool _2489 = _1680 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2491 = isnan(_1680);
                bool _2493 = _2489 || _2491;
                bool _2495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2497 = _2493 || _2495;
                if (!_2497)
                {
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2501 = _1680 + _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2511 = 1.0 / _2505;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2523 = _2521 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2529 = _2501 * _2511;
                    float _2531 = precise::clamp(_2529, 0.0, 1.0);
                    float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2537 = fma(_2531, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2539 = fma(_2531, _2535, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2541 = fma(_2531, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2543 = fma(_2531, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2545 = fma(_2531, _2523, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2547 = fma(_2531, _2527, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2401 = _2541;
                    _2363 = _2545;
                    _2375 = _2537;
                    _2355 = _2543;
                    _2345 = _2539;
                    _2369 = _2547;
                    _2463 = true;
                }
                else
                {
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2375 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2369 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2463 = false;
    float _2549 = _2401;
    float _2551 = _2363;
    float _2553 = _2375;
    float _2555 = _2355;
    float _2557 = _2345;
    float _2559 = _2369;
    float _2561 = fma(_2329, -0.5, 0.5);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = -_2549;
    float _2567 = _2565 + _2551;
    float _2569 = -_2553;
    float _2571 = _2569 + _2555;
    out.m_89.x = 0.0;
    float _2573 = fma(_2563, _2567, _2549);
    float _2575 = -_2557;
    float _2577 = _2575 + _2559;
    float _2579 = fma(_2563, _2571, _2553);
    float _2581 = _2573 * 0.586610972881317138671875;
    bool _2583 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2585 = fma(_2563, _2577, _2557);
    float _2587 = _2359 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = fma(_2579, 0.298911988735198974609375, _2581);
    bool _2591 = _1600 > 0.0;
    bool _2593 = isnan(_1600);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2585, 0.114477999508380889892578125, _2589);
    out.m_47.x = _2587;
    bool _2603 = _1658 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = -_2601;
    float _2611 = _2579 + _2609;
    float _2613 = -_2601;
    float _2615 = _2573 + _2613;
    float _2617 = -_2601;
    float _2619 = _2585 + _2617;
    float _2621 = fma(_2611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2623 = fma(_2615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    float _2625 = fma(_2619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2601);
    bool _2627 = !_2583;
    if (!_2627)
    {
        float _2629 = -_1532;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2633 = -_1534;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2637 = -_1536;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2641 = _2631 * _2631;
        float _2643 = fma(_2635, _2635, _2641);
        float _2645 = fma(_2639, _2639, _2643);
        float _2647 = sqrt(_2645);
        float _2649 = rsqrt(_2645);
        float _2651 = -_2647;
        float _2653 = _2651 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2655 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = _2635 * _2649;
        float _2661 = _2631 * _2649;
        float _2663 = abs(_2657);
        float _2665 = log2(_2663);
        float _2667 = _2639 * _2649;
        float _2669 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2671 = _2329 * _2661;
        float _2673 = -_2661;
        float _2675 = -_2669;
        float _2677 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2675);
        float _2679 = fma(_2327, _2659, _2671);
        float _2681 = -_2667;
        float _2683 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2677);
        float _2685 = fma(_2331, _2667, _2679);
        float _2687 = precise::clamp(_2685, 0.0, 1.0);
        float _2689 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2691 = _2683 + _2689;
        float _2693 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2695 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = exp2(_2693);
        float _2701 = _2699 * _2697;
        float _2703 = _2687 * _2701;
        float _2705 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2709 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2705;
        out.m_89.y = _2707;
        out.m_89.z = _2709;
    }
    out.m_91.x = _2621;
    out.m_91.y = _2623;
    out.m_91.z = _2625;
    if (!_2607)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2711;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

