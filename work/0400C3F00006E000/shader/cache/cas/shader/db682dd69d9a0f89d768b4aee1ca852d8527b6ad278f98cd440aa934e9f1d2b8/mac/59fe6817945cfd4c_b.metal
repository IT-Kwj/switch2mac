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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_108);
        out.gl_Position.z = _2147;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_94);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2217 = as_type<float>(_148);
        out.gl_Position.z = _2217;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _296;
    float _298;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = float(_94);
        float _280 = 1.0 / _278;
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _284 = _126 * _280;
        float _286 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _288 = _286 * _276;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = _284;
        _300 = true;
    }
    else
    {
        float _302 = float(_94);
        float _304 = 1.0 / _302;
        float _306 = _126 * _304;
        _296 = _306;
        _298 = _306;
    }
    _300 = false;
    float _308 = _296;
    float _310 = _298;
    float _312 = in.m_51.z;
    float _314 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_51.x;
    float _320 = in.m_51.y;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    float _326 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _328 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _326);
    float _332 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _342 = _340 != 0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _346 = _344 != 0;
    float _348 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _358 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _312 * 2.0;
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _366 = !_342;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _372 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _374 = floor(_362);
    float _376 = _320 * 2.0;
    float _378 = _320 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _318 * 2.0;
    float _382 = -_334;
    float _384 = fma(_372, 2.0, _382);
    float _386 = _320 + _312;
    float _388 = fma(_378, -2.0, _350);
    float _390 = _318 + _312;
    float _392 = floor(_380);
    float _394 = _386 + (-1.0);
    float _396 = _354 * _126;
    float _398 = _390 + (-1.0);
    float _400 = _390;
    float _402 = _380;
    bool _404 = _346;
    float _406 = _310;
    if (!_324)
    {
        _400 = _312;
    }
    float _408 = _400;
    float _410 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = _320 + _318;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = floor(_376);
    bool _418 = _374 > 0.0;
    float _420 = -_126;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _384);
    bool _424 = _374 >= 0.0;
    bool _426 = isnan(_374);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = _412 + (-1.0);
    float _436 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _438 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _440 = _412;
    float _442 = _408;
    int _444 = as_type<int>(_436);
    if (!_324)
    {
        _402 = _320;
    }
    float _446 = _402;
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _446;
    if (!_324)
    {
        _440 = _312;
    }
    float _452 = _440;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _432 ? 0 : 1;
    float _468 = _452;
    if (_324)
    {
        _450 = _318;
    }
    float _470 = _450;
    if (_324)
    {
        _442 = _320;
    }
    float _472 = _442;
    if (_324)
    {
        _468 = _320;
    }
    float _474 = _468;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    bool _478 = _416 > 0.0;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _482 = _392 > 0.0;
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[83].w, _370);
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _488 = _464 ? 0 : 1;
    float _490 = exp2(_396);
    bool _492 = _416 >= 0.0;
    bool _494 = isnan(_416);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _476);
    int _506 = _500 ? 0 : 1;
    float _508 = -_502;
    float _510 = fma(_480, 2.0, _508);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    int _522 = _518;
    if (!_478)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = fma(_486, -2.0, _512);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _534 = 1.0 + _532;
    int _536 = ~_466;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -_490;
    float _544 = _542 + 1.0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _548 = 1.0 / _534;
    int _550 = _540;
    if (!_418)
    {
        int _552 = ~_466;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _560 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[78].w, _546);
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _574 = !_338;
    int _576 = _574 ? 0 : 1;
    float _578 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].z, _572);
    int _588 = _584;
    if (!_482)
    {
        int _590 = ~_488;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _364 + _596;
    bool _600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _612 = abs(_576);
    float _614 = -_126;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    float _618 = _608 ? _544 : 0.0;
    float _620 = in.m_53.x;
    float _622 = in.m_53.y;
    float _624 = in.m_53.z;
    float _626 = float(_612);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _360 + _628;
    float _632 = float(_556);
    if (_570)
    {
        float _634 = _618 * _548;
        _130 = _634;
    }
    float _636 = _130;
    int _638 = abs(_368);
    float _640 = _598 * _598;
    bool _642 = !_346;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _632;
    float _648 = float(_638);
    float _650 = in.m_49.x;
    float _652 = in.m_49.y;
    float _654 = in.m_49.z;
    float _656 = float(_594);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _660 = _438 + _658;
    int _662 = abs(_644);
    float _664 = fma(_630, _630, _640);
    float _666 = float(_528);
    float _668 = _648 * _656;
    float _670 = fma(_660, _660, _664);
    float _672 = _318 + (-0.5);
    float _674 = _668 * (-2.0);
    float _676 = float(_662);
    float _678 = rsqrt(_670);
    float _680 = _320 + (-0.5);
    float _682 = fma(_674, _622, _622);
    float _684 = fma(_410, _674, _410);
    float _686 = _646 * (-2.0);
    float _688 = _676 * _666;
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _682);
    float _692 = fma(_448, _686, _448);
    float _694 = fma(_686, _620, _620);
    float _696 = _688 * (-2.0);
    float _698 = fma(_684, _636, _690);
    float _700 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    float _704 = fma(_414, _696, _414);
    float _706 = fma(_696, _624, _624);
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _312 + (-0.5);
    float _712 = fma(_692, _636, _702);
    float _714 = _698 * 0.15915493667125701904296875;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _720 = _712 * 0.15915493667125701904296875;
    float _722 = _714 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _716 * _678;
    float _728 = fma(_704, _636, _718);
    float _730 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = in.m_55.x;
    float _734 = in.m_55.y;
    float _736 = in.m_55.z;
    float _738 = _598 * _726;
    float _740 = _630 * _726;
    float _742 = _660 * _726;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -_738;
    float _748 = _598 + _746;
    float _750 = -_740;
    float _752 = _630 + _750;
    float _754 = -_742;
    float _756 = _660 + _754;
    float _758 = _714 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _748 * _748;
    float _764 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = fma(_752, _752, _762);
    float _770 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _720 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_756, _756, _768);
    float _778 = sqrt(_776);
    float _780 = _744 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _774 * _724;
    float _786 = _720 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _678 * _778;
    float _792 = _774 * _760;
    float _794 = _764 * _790;
    float _796 = _708 * _790;
    float _798 = _770 * _790;
    float _800 = _744 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _806 = _774 * _782;
    float _808 = _794 * _804;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _812 = _788 * _760;
    float _814 = _788 * _724;
    float _816 = _788 * _782;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _820 = _760 * _782;
    float _822 = _724 * _782;
    float _824 = _816 * _808;
    float _826 = _796 * _818;
    float _828 = fma(_802, _812, _784);
    float _830 = _798 * _810;
    float _832 = -_792;
    float _834 = fma(_802, _814, _832);
    float _836 = -_808;
    float _838 = _802 * _836;
    float _840 = fma(_828, _826, _824);
    float _842 = -_814;
    float _844 = fma(_802, _792, _842);
    float _846 = _806 * _808;
    float _848 = fma(_820, _826, _838);
    float _850 = -_830;
    float _852 = fma(_834, _850, _840);
    float _854 = fma(_802, _784, _812);
    float _856 = fma(_844, _826, _846);
    float _858 = -_830;
    float _860 = fma(_822, _858, _848);
    float _862 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _866 = -_830;
    float _868 = fma(_854, _866, _856);
    float _870 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _862);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _864);
    float _876 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _870);
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _872);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _874);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _438 + _878;
    float _886 = _360 + _880;
    float _888 = _364 + _882;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _886 + _894;
    float _898 = _892 * _892;
    float _900 = fma(_896, _896, _898);
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = _870;
    float _908 = _862;
    float _910 = _886;
    float _912 = _682;
    float _914 = _674;
    if (!_904)
    {
        _906 = _884;
    }
    float _916 = _906;
    float _918 = _916;
    if (!_904)
    {
        _908 = _888;
    }
    float _920 = _908;
    bool _922 = !_904;
    float _924 = _920;
    if (!_922)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _928 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _930 = _902 + _928;
        float _932 = rsqrt(_900);
        float _934 = _930 * _926;
        float _936 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = _934 * 0.15915493667125701904296875;
        float _940 = _938 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = _938 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 + (-1.0);
        float _950 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _952 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _932 * _950;
        float _956 = fma(_888, _942, _952);
        float _958 = fma(_896, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_892, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _924 = _956;
        _910 = _958;
        _918 = _960;
    }
    float _962 = _924;
    float _964 = _910;
    float _966 = _918;
    float _968 = -_738;
    float _970 = _968 + _962;
    float _972 = -_740;
    float _974 = _972 + _964;
    float _976 = -_742;
    float _978 = _976 + _966;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _970 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _978 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _892;
    float _1024 = _1020;
    float _1026 = _1004;
    float _1028 = _1006;
    float _1030 = _1008;
    float _1032 = _1010;
    if (_1016)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1034;
    }
    float _1036 = _1022;
    if (_1016)
    {
        float _1038 = _1020 * _1036;
        _1024 = _1038;
    }
    float _1040 = _1024;
    if (_1016)
    {
        float _1042 = _1040 * 0.15915493667125701904296875;
        _912 = _1042;
    }
    float _1044 = _912;
    float _1046 = _696;
    if (_1016)
    {
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        _1046 = _1050;
    }
    float _1052 = _1046;
    float _1054 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1056 = precise::max(0.0, _1054);
    float _1058 = _1036;
    float _1060 = _1056;
    if (_1016)
    {
        float _1062 = _1044 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = -_1002;
    float _1070 = -_1056;
    float _1072 = fma(_982, _1068, _1070);
    float _1074 = _1054;
    if (_1016)
    {
        float _1076 = rsqrt(_1012);
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_1016)
    {
        float _1080 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1080;
    }
    float _1082 = _1060;
    float _1084 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1086 = _1082;
    float _1088 = _1052;
    if (_1016)
    {
        float _1090 = fma(_1052, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _914 = _1090;
    }
    float _1092 = _914;
    float _1094 = _1092;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1086 = _1096;
    }
    float _1098 = _1086;
    if (_1016)
    {
        float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1100;
    }
    float _1102 = _1088;
    float _1104 = _970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1078;
    if (_1016)
    {
        float _1108 = _1078 * _1092;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (!_1016)
    {
        _1106 = _1072;
    }
    float _1112 = _1106;
    float _1114 = _1112;
    if (_1016)
    {
        float _1116 = fma(_1072, _1066, _1102);
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1016)
    {
        float _1122 = _1004 * _1110;
        _1026 = _1122;
    }
    float _1124 = _1026;
    if (_1016)
    {
        float _1126 = _1006 * _1110;
        _1028 = _1126;
    }
    float _1128 = _1028;
    if (_1016)
    {
        float _1130 = _1124 * _1124;
        _1030 = _1130;
    }
    float _1132 = _1030;
    if (_1016)
    {
        float _1134 = _1128 * _1128;
        _1032 = _1134;
    }
    float _1136 = _1032;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1140 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1138);
    float _1142 = precise::clamp(_1140, 0.0, 1.0);
    float _1144 = fma(_1118, _1118, _1132);
    float _1146 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1144 + _1136;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1156 = _970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1158 = _970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1150);
    float _1162 = log2(_1160);
    float _1164 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1146);
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1170 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1174 = rsqrt(_1152);
    float _1176 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = -_1182;
    float _1192 = fma(_1190, _1084, 1.0);
    float _1194 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1198 = log2(_1192);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = _1174 * _1124;
    float _1204 = _1174 * _1118;
    float _1206 = _1174 * _1128;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1212 = exp2(_1194);
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1216 = -_1210;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1216);
    float _1220 = -_1206;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1218);
    float _1224 = 1.0 / _1214;
    float _1226 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1228 = fma(_1222, -0.5, 0.5);
    float _1230 = fma(_1222, 0.5, 0.5);
    float _1232 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1226);
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1236 = _1204 + 1.0;
    float _1238 = fma(_1230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1240 = sqrt(_1228);
    float _1242 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1232);
    float _1244 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1246 = -_1204;
    float _1248 = fma(_1212, _1236, _1246);
    float _1250 = _1198 * 0.693147182464599609375;
    float _1252 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1242);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1244);
    float _1256 = fma(_1230, _1238, -0.212114393711090087890625);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1260 = _1252 * _1224;
    float _1262 = _1254 * _1224;
    float _1264 = fma(_1230, _1256, 1.570728778839111328125);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = fma(_1260, 0.5, 0.5);
    float _1270 = _1240 * 0.636619746685028076171875;
    float _1272 = fma(_1262, -0.5, 0.5);
    float _1274 = -_1264;
    float _1276 = fma(_1270, _1274, 1.0);
    float3 _3985 = float3(_1268, _1272, _1258);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3985, float3(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3985, float3(0.0), isnan(_3985)), level(0.0)).x;
    float3 _3996 = float3(_1268, _1272, _1258);
    float4 _1281 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).xyzw;
    float _1283 = _1281.x;
    float _1285 = _1281.y;
    float _1287 = _1281.z;
    float _1289 = _1281.w;
    float2 _4013 = float2(_1276, _1266);
    float3 _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4013, float2(0.0), isnan(_4013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4013, float2(0.0), isnan(_4013)), level(0.0)).xyz;
    float _1295 = _1293.x;
    float _1297 = _1293.y;
    float _1299 = _1293.z;
    float _1301 = in.m_57.y;
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1305 = _320 > 0.5;
    float _1307 = in.m_51.w;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1317 = _1315 != 0;
    float _1319 = -_738;
    float _1321 = _364 + _1319;
    float _1323 = in.m_57.x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1327 = _1325 != 0;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1333 = _1331 != 0;
    float _1335 = -_740;
    float _1337 = _360 + _1335;
    float _1339 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_742;
    float _1343 = _438 + _1341;
    float _1345 = 0.0;
    bool _1347 = _1305;
    if (_1311)
    {
        float _1349 = in.m_51.x;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1355 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].w);
    if (_1317)
    {
        bool _1359 = _312 > 0.5;
        _404 = _1359;
    }
    bool _1361 = _404;
    float _1363 = -_1301;
    float _1365 = _1363 + 1.0;
    bool _1367 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1369 = isnan(_308);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1385 = _1307 > 0.5;
    float _1387 = _732 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1389 = _1305 ? as_type<int>(_1365) : as_type<int>(_1301);
    float _1391 = _816 * _1313;
    bool _1393 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1395 = isnan(_308);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1301;
    float _1407 = _1323;
    if (_1317)
    {
        float _1409 = -_1323;
        float _1411 = _1409 + 1.0;
        _1357 = as_type<int>(_1411);
    }
    int _1413 = _1357;
    float _1415 = _1333 ? as_type<float>(_1389) : _1301;
    float _1417 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1419 = 1.0 / _1381;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1327)
    {
        float _1423 = _1385 ? _1365 : _1301;
        _1405 = _1423;
    }
    float _1425 = _1405;
    float _1427 = fma(_1355, _1415, -0.5);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1311)
    {
        bool _1433 = _1351 > 0.5;
        _1347 = _1433;
    }
    bool _1435 = _1347;
    float _1437 = -_436;
    float _1439 = fma(_578, _1427, _1437);
    if (_1311)
    {
        float _1441 = -_1323;
        float _1443 = _1441 + 1.0;
        _444 = as_type<int>(_1443);
    }
    int _1445 = _444;
    if (!_1311)
    {
        _1421 = _1323;
    }
    float _1447 = _1421;
    float _1449 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1451 = fma(_1417, _1425, -0.5);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1457 = _1447;
    if (_1311)
    {
        float _1459 = _1435 ? as_type<float>(_1445) : _1323;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = -_558;
    float _1465 = fma(_520, _1451, _1463);
    if (_1317)
    {
        float _1467 = _1361 ? as_type<float>(_1413) : _1323;
        _1407 = _1467;
    }
    float _1469 = _1407;
    float _1471 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = 1.0 / _1455;
    float _1475 = fma(_1449, _1461, -0.5);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1481 = fma(_1471, _1469, -0.5);
    float _1483 = fma(_610, _1475, _422);
    float _1485 = fma(_504, _1481, _616);
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = 1.0 / _1479;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1439 + 0.5;
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1465 + 0.5;
    float _1509 = _1485 + 0.5;
    float _1511 = _1483 + 0.5;
    float _1513 = 1.0 / _1431;
    out.m_61.x = _1499;
    out.m_61.y = _1505;
    out.m_61.z = _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    out.m_63.x = _1511;
    out.m_63.y = _1503;
    out.m_63.z = _1509;
    out.m_63.w = _1507;
    bool _1519 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1521 = isnan(0.5);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1527 = _1523 || _1525;
    float _1529 = 1.0 / _1495;
    float _1531 = _734 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = _1535 * _1419;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1563 = _1539 * _1513;
    float _1565 = 1.0 / _1547;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1583 = _1569 * _1491;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1589 = 1.0 / _1543;
    float _1591 = _1573 * _1529;
    bool _1593 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1595 = isnan(_310);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1601 = _1597 || _1599;
    float _1603 = float(_1601);
    float _1605 = _1581 * _1553;
    bool _1607 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1609 = isnan(_310);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1623;
    float _1627 = 1.0 / _1561;
    float _1629 = -_1603;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1565;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1641 = _308 + _1639;
    float _1643 = _1617 * _1631;
    float _1645 = -_1617;
    float _1647 = _1645 + 1.0;
    bool _1649 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1651 = isnan(_310);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1587;
    float _1663 = _1577 * _1589;
    bool _1665 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1667 = isnan(_310);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1679 = _310 + _1677;
    float _1681 = -_1659;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1687 = _310 + _1685;
    float _1689 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1691 = -_1675;
    float _1693 = _1691 + 1.0;
    float _1695 = _1637 * _1627;
    float _1697 = _1675 * _1647;
    bool _1699 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1701 = isnan(_310);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1659 * _1693;
    float _1713 = fma(_1563, _1641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1717 = _310 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1721 = _308 + _1719;
    float _1723 = _1709 * _1683;
    float _1725 = _1625 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1729 = _308 + _1727;
    float _1731 = -_1709;
    float _1733 = _1731 + 1.0;
    bool _1735 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1737 = isnan(_310);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1583, _1717, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1749 = fma(_1555, _1729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1751 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1753 = isnan(_310);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = fma(_1557, _1721, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1765 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1767 = isnan(_310);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = -_1745;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1605, _1687, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1783 = _1761 * _1733;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = _1775 * _1779;
    float _1791 = -_1377;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1797 = _1745 * _1787;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1801 = _310 + _1799;
    float _1803 = _1403 * _1793;
    float _1805 = -_1775;
    float _1807 = _1805 + 1.0;
    float _1809 = _806 * _1313;
    float _1811 = fma(_1591, _1801, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1813 = fma(_1663, _1679, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1815 = _1747 * _1789;
    float _1817 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_308);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -_1403;
    float _1833 = _1831 + 1.0;
    float _1835 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1815);
    float _1837 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    bool _1839 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1841 = isnan(_308);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1829 * _1833;
    float _1853 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = -_1829;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1837);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1863 = _310 + _1861;
    float _1865 = 1.0 / _1853;
    float _1867 = _1849 * _1857;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1633, _1863, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1877 = _1749 * _1867;
    float _1879 = _1633;
    float _1881 = _1803;
    float _1883 = _1603;
    if (!_1527)
    {
        _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1885 = _1879;
    float _1887 = _1873 + _1853;
    float _1889 = fma(_1811, _1797, _1835);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1877);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1895 = _310 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1899 = _310 + _1897;
    float _1901 = fma(_1813, _1783, _1889);
    float _1903 = fma(_1713, _1851, _1891);
    float _1905 = fma(_1695, _1895, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1907 = fma(_1725, _1899, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1909 = _1887 * _1865;
    float _1911 = _1909 * 0.5;
    float _1913 = fma(_1763, _1803, _1903);
    float _1915 = _1885;
    if (!_1527)
    {
        _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1917 = _1881;
    float _1919 = fma(_1781, _1723, _1901);
    if (!_1527)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1911, _1885, _1921);
        _406 = _1923;
    }
    float _1925 = _406;
    float _1927 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1913);
    float _1929 = -_1313;
    float _1931 = _802 * _1929;
    if (!_1527)
    {
        float _1933 = -_1917;
        float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1915 = _1935;
    }
    float _1937 = _1915;
    float _1939 = fma(_1875, _1711, _1919);
    float _1941 = fma(_828, _1387, _1391);
    float _1943 = _1925;
    if (!_1527)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = fma(_1905, _1697, _1939);
    float _1953 = fma(_820, _1387, _1931);
    float _1955 = fma(_844, _1387, _1809);
    float _1957 = -_1531;
    float _1959 = fma(_834, _1957, _1941);
    float _1961 = fma(_1907, _1643, _1951);
    float _1963 = -_1531;
    float _1965 = fma(_822, _1963, _1953);
    float _1967 = _1937;
    float _1969 = _1965;
    if (!_1527)
    {
        float _1971 = 1.0 / _1937;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = -_1531;
    float _1977 = fma(_854, _1975, _1955);
    float _1979 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1961);
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1985 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1989 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1991 = _1947;
    if (!_1527)
    {
        float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1995 = -_1917;
        float _1997 = fma(_1947, _1993, _1995);
        _1883 = _1997;
    }
    float _1999 = _1883;
    float _2001 = exp2(_1949);
    float _2003 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1983);
    float _2005 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2007 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2009 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1987);
    if (!_1527)
    {
        float _2011 = _1999 * _1973;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1991 = _2013;
    }
    float _2015 = _1991;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1527)
    {
        _1969 = 1.0;
    }
    float _2021 = _1969;
    float _2023 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = -_2001;
    float _2033 = _2031 + 1.0;
    float _2035 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2021;
    if (!_1527)
    {
        float _2039 = -_2015;
        float _2041 = _2039 + 1.0;
        _2037 = _2041;
    }
    float _2043 = _2037;
    float _2045 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2047 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _2049 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2003);
    out.m_65.x = _2027;
    out.m_65.y = _2035;
    out.m_65.z = _2029;
    out.m_65.w = _2005;
    bool _2051 = _2043 > 0.0;
    bool _2053 = isnan(_2043);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.0);
    bool _2059 = _2055 || _2057;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2009);
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2065 = _2045 + _1214;
    out.m_67.x = _1979;
    float _2067 = _2065 * 0.5;
    out.m_69.x = _2047;
    out.m_69.y = _2049;
    out.m_69.z = _2061;
    float _2069 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _986;
    out.m_71.y = _982;
    out.m_71.z = _990;
    float _2073 = -_2069;
    float _2075 = _2073 + 1.0;
    out.gl_Position.x = _1252;
    out.gl_Position.y = _1254;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1214;
    out.m_73.z = _2067;
    out.m_73.w = _1214;
    out.m_45.x = _2071;
    float _2077 = _2069 * _1278;
    float _2079 = _1289 * _2075;
    float _2081 = _1289 * _2077;
    float _2083 = _1299 * _2077;
    float _2085 = fma(_1295, _2081, _1283);
    float _2087 = fma(_1297, _2081, _1285);
    float _2089 = fma(_1289, _2083, _1287);
    out.m_75.x = _2085;
    out.m_75.y = _2087;
    out.m_75.z = _2089;
    out.m_75.w = _2079;
    if (_2059)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2091;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_108);
        out.gl_Position.z = _2147;
    }
    if (!_98)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_94);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2217 = as_type<float>(_148);
        out.gl_Position.z = _2217;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _296;
    float _298;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = float(_94);
        float _280 = 1.0 / _278;
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _284 = _126 * _280;
        float _286 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _288 = _286 * _276;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = _284;
        _300 = true;
    }
    else
    {
        float _302 = float(_94);
        float _304 = 1.0 / _302;
        float _306 = _126 * _304;
        _296 = _306;
        _298 = _306;
    }
    _300 = false;
    float _308 = _296;
    float _310 = _298;
    float _312 = in.m_51.z;
    float _314 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_51.x;
    float _320 = in.m_51.y;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    float _326 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _328 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _326);
    float _332 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _342 = _340 != 0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _346 = _344 != 0;
    float _348 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _358 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _312 * 2.0;
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _366 = !_342;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _372 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _374 = floor(_362);
    float _376 = _320 * 2.0;
    float _378 = _320 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _318 * 2.0;
    float _382 = -_334;
    float _384 = fma(_372, 2.0, _382);
    float _386 = _320 + _312;
    float _388 = fma(_378, -2.0, _350);
    float _390 = _318 + _312;
    float _392 = floor(_380);
    float _394 = _386 + (-1.0);
    float _396 = _354 * _126;
    float _398 = _390 + (-1.0);
    float _400 = _390;
    float _402 = _380;
    bool _404 = _346;
    float _406 = _310;
    if (!_324)
    {
        _400 = _312;
    }
    float _408 = _400;
    float _410 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = _320 + _318;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = floor(_376);
    bool _418 = _374 > 0.0;
    float _420 = -_126;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _384);
    bool _424 = _374 >= 0.0;
    bool _426 = isnan(_374);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = _412 + (-1.0);
    float _436 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _438 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _440 = _412;
    float _442 = _408;
    int _444 = as_type<int>(_436);
    if (!_324)
    {
        _402 = _320;
    }
    float _446 = _402;
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _446;
    if (!_324)
    {
        _440 = _312;
    }
    float _452 = _440;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _432 ? 0 : 1;
    float _468 = _452;
    if (_324)
    {
        _450 = _318;
    }
    float _470 = _450;
    if (_324)
    {
        _442 = _320;
    }
    float _472 = _442;
    if (_324)
    {
        _468 = _320;
    }
    float _474 = _468;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    bool _478 = _416 > 0.0;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _482 = _392 > 0.0;
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[83].w, _370);
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _488 = _464 ? 0 : 1;
    float _490 = exp2(_396);
    bool _492 = _416 >= 0.0;
    bool _494 = isnan(_416);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _476);
    int _506 = _500 ? 0 : 1;
    float _508 = -_502;
    float _510 = fma(_480, 2.0, _508);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    int _522 = _518;
    if (!_478)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = fma(_486, -2.0, _512);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _534 = 1.0 + _532;
    int _536 = ~_466;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -_490;
    float _544 = _542 + 1.0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _548 = 1.0 / _534;
    int _550 = _540;
    if (!_418)
    {
        int _552 = ~_466;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _560 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[78].w, _546);
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _574 = !_338;
    int _576 = _574 ? 0 : 1;
    float _578 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].z, _572);
    int _588 = _584;
    if (!_482)
    {
        int _590 = ~_488;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _364 + _596;
    bool _600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _612 = abs(_576);
    float _614 = -_126;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    float _618 = _608 ? _544 : 0.0;
    float _620 = in.m_53.x;
    float _622 = in.m_53.y;
    float _624 = in.m_53.z;
    float _626 = float(_612);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _360 + _628;
    float _632 = float(_556);
    if (_570)
    {
        float _634 = _618 * _548;
        _130 = _634;
    }
    float _636 = _130;
    int _638 = abs(_368);
    float _640 = _598 * _598;
    bool _642 = !_346;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _632;
    float _648 = float(_638);
    float _650 = in.m_49.x;
    float _652 = in.m_49.y;
    float _654 = in.m_49.z;
    float _656 = float(_594);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _660 = _438 + _658;
    int _662 = abs(_644);
    float _664 = fma(_630, _630, _640);
    float _666 = float(_528);
    float _668 = _648 * _656;
    float _670 = fma(_660, _660, _664);
    float _672 = _318 + (-0.5);
    float _674 = _668 * (-2.0);
    float _676 = float(_662);
    float _678 = rsqrt(_670);
    float _680 = _320 + (-0.5);
    float _682 = fma(_674, _622, _622);
    float _684 = fma(_410, _674, _410);
    float _686 = _646 * (-2.0);
    float _688 = _676 * _666;
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _682);
    float _692 = fma(_448, _686, _448);
    float _694 = fma(_686, _620, _620);
    float _696 = _688 * (-2.0);
    float _698 = fma(_684, _636, _690);
    float _700 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    float _704 = fma(_414, _696, _414);
    float _706 = fma(_696, _624, _624);
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _312 + (-0.5);
    float _712 = fma(_692, _636, _702);
    float _714 = _698 * 0.15915493667125701904296875;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _720 = _712 * 0.15915493667125701904296875;
    float _722 = _714 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _716 * _678;
    float _728 = fma(_704, _636, _718);
    float _730 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = in.m_55.x;
    float _734 = in.m_55.y;
    float _736 = in.m_55.z;
    float _738 = _598 * _726;
    float _740 = _630 * _726;
    float _742 = _660 * _726;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -_738;
    float _748 = _598 + _746;
    float _750 = -_740;
    float _752 = _630 + _750;
    float _754 = -_742;
    float _756 = _660 + _754;
    float _758 = _714 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _748 * _748;
    float _764 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = fma(_752, _752, _762);
    float _770 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _720 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_756, _756, _768);
    float _778 = sqrt(_776);
    float _780 = _744 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _774 * _724;
    float _786 = _720 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _678 * _778;
    float _792 = _774 * _760;
    float _794 = _764 * _790;
    float _796 = _708 * _790;
    float _798 = _770 * _790;
    float _800 = _744 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _806 = _774 * _782;
    float _808 = _794 * _804;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _812 = _788 * _760;
    float _814 = _788 * _724;
    float _816 = _788 * _782;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _820 = _760 * _782;
    float _822 = _724 * _782;
    float _824 = _816 * _808;
    float _826 = _796 * _818;
    float _828 = fma(_802, _812, _784);
    float _830 = _798 * _810;
    float _832 = -_792;
    float _834 = fma(_802, _814, _832);
    float _836 = -_808;
    float _838 = _802 * _836;
    float _840 = fma(_828, _826, _824);
    float _842 = -_814;
    float _844 = fma(_802, _792, _842);
    float _846 = _806 * _808;
    float _848 = fma(_820, _826, _838);
    float _850 = -_830;
    float _852 = fma(_834, _850, _840);
    float _854 = fma(_802, _784, _812);
    float _856 = fma(_844, _826, _846);
    float _858 = -_830;
    float _860 = fma(_822, _858, _848);
    float _862 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _866 = -_830;
    float _868 = fma(_854, _866, _856);
    float _870 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _862);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _864);
    float _876 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _870);
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _872);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _874);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _438 + _878;
    float _886 = _360 + _880;
    float _888 = _364 + _882;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _886 + _894;
    float _898 = _892 * _892;
    float _900 = fma(_896, _896, _898);
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = _870;
    float _908 = _862;
    float _910 = _886;
    float _912 = _682;
    float _914 = _674;
    if (!_904)
    {
        _906 = _884;
    }
    float _916 = _906;
    float _918 = _916;
    if (!_904)
    {
        _908 = _888;
    }
    float _920 = _908;
    bool _922 = !_904;
    float _924 = _920;
    if (!_922)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _928 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _930 = _902 + _928;
        float _932 = rsqrt(_900);
        float _934 = _930 * _926;
        float _936 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = _934 * 0.15915493667125701904296875;
        float _940 = _938 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = _938 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 + (-1.0);
        float _950 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _952 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _932 * _950;
        float _956 = fma(_888, _942, _952);
        float _958 = fma(_896, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_892, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _924 = _956;
        _910 = _958;
        _918 = _960;
    }
    float _962 = _924;
    float _964 = _910;
    float _966 = _918;
    float _968 = -_738;
    float _970 = _968 + _962;
    float _972 = -_740;
    float _974 = _972 + _964;
    float _976 = -_742;
    float _978 = _976 + _966;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _970 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _978 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _892;
    float _1024 = _1020;
    float _1026 = _1004;
    float _1028 = _1006;
    float _1030 = _1008;
    float _1032 = _1010;
    if (_1016)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1034;
    }
    float _1036 = _1022;
    if (_1016)
    {
        float _1038 = _1020 * _1036;
        _1024 = _1038;
    }
    float _1040 = _1024;
    if (_1016)
    {
        float _1042 = _1040 * 0.15915493667125701904296875;
        _912 = _1042;
    }
    float _1044 = _912;
    float _1046 = _696;
    if (_1016)
    {
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        _1046 = _1050;
    }
    float _1052 = _1046;
    float _1054 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1056 = precise::max(0.0, _1054);
    float _1058 = _1036;
    float _1060 = _1056;
    if (_1016)
    {
        float _1062 = _1044 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = -_1002;
    float _1070 = -_1056;
    float _1072 = fma(_982, _1068, _1070);
    float _1074 = _1054;
    if (_1016)
    {
        float _1076 = rsqrt(_1012);
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_1016)
    {
        float _1080 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1080;
    }
    float _1082 = _1060;
    float _1084 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1086 = _1082;
    float _1088 = _1052;
    if (_1016)
    {
        float _1090 = fma(_1052, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _914 = _1090;
    }
    float _1092 = _914;
    float _1094 = _1092;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1086 = _1096;
    }
    float _1098 = _1086;
    if (_1016)
    {
        float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1100;
    }
    float _1102 = _1088;
    float _1104 = _970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1078;
    if (_1016)
    {
        float _1108 = _1078 * _1092;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (!_1016)
    {
        _1106 = _1072;
    }
    float _1112 = _1106;
    float _1114 = _1112;
    if (_1016)
    {
        float _1116 = fma(_1072, _1066, _1102);
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1016)
    {
        float _1122 = _1004 * _1110;
        _1026 = _1122;
    }
    float _1124 = _1026;
    if (_1016)
    {
        float _1126 = _1006 * _1110;
        _1028 = _1126;
    }
    float _1128 = _1028;
    if (_1016)
    {
        float _1130 = _1124 * _1124;
        _1030 = _1130;
    }
    float _1132 = _1030;
    if (_1016)
    {
        float _1134 = _1128 * _1128;
        _1032 = _1134;
    }
    float _1136 = _1032;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1140 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1138);
    float _1142 = precise::clamp(_1140, 0.0, 1.0);
    float _1144 = fma(_1118, _1118, _1132);
    float _1146 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1144 + _1136;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1156 = _970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1158 = _970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1150);
    float _1162 = log2(_1160);
    float _1164 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1146);
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1170 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1174 = rsqrt(_1152);
    float _1176 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = -_1182;
    float _1192 = fma(_1190, _1084, 1.0);
    float _1194 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1198 = log2(_1192);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = _1174 * _1124;
    float _1204 = _1174 * _1118;
    float _1206 = _1174 * _1128;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1212 = exp2(_1194);
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1216 = -_1210;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1216);
    float _1220 = -_1206;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1218);
    float _1224 = 1.0 / _1214;
    float _1226 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1228 = fma(_1222, -0.5, 0.5);
    float _1230 = fma(_1222, 0.5, 0.5);
    float _1232 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1226);
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1236 = _1204 + 1.0;
    float _1238 = fma(_1230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1240 = sqrt(_1228);
    float _1242 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1232);
    float _1244 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1246 = -_1204;
    float _1248 = fma(_1212, _1236, _1246);
    float _1250 = _1198 * 0.693147182464599609375;
    float _1252 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1242);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1244);
    float _1256 = fma(_1230, _1238, -0.212114393711090087890625);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1260 = _1252 * _1224;
    float _1262 = _1254 * _1224;
    float _1264 = fma(_1230, _1256, 1.570728778839111328125);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = fma(_1260, 0.5, 0.5);
    float _1270 = _1240 * 0.636619746685028076171875;
    float _1272 = fma(_1262, -0.5, 0.5);
    float _1274 = -_1264;
    float _1276 = fma(_1270, _1274, 1.0);
    float3 _3985 = float3(_1268, _1272, _1258);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3985, float3(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3985, float3(0.0), isnan(_3985)), level(0.0)).x;
    float3 _3996 = float3(_1268, _1272, _1258);
    float4 _1281 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).xyzw;
    float _1283 = _1281.x;
    float _1285 = _1281.y;
    float _1287 = _1281.z;
    float _1289 = _1281.w;
    float2 _4013 = float2(_1276, _1266);
    float3 _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4013, float2(0.0), isnan(_4013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4013, float2(0.0), isnan(_4013)), level(0.0)).xyz;
    float _1295 = _1293.x;
    float _1297 = _1293.y;
    float _1299 = _1293.z;
    float _1301 = in.m_57.y;
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1305 = _320 > 0.5;
    float _1307 = in.m_51.w;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1317 = _1315 != 0;
    float _1319 = -_738;
    float _1321 = _364 + _1319;
    float _1323 = in.m_57.x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1327 = _1325 != 0;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1333 = _1331 != 0;
    float _1335 = -_740;
    float _1337 = _360 + _1335;
    float _1339 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_742;
    float _1343 = _438 + _1341;
    float _1345 = 0.0;
    bool _1347 = _1305;
    if (_1311)
    {
        float _1349 = in.m_51.x;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1355 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].w);
    if (_1317)
    {
        bool _1359 = _312 > 0.5;
        _404 = _1359;
    }
    bool _1361 = _404;
    float _1363 = -_1301;
    float _1365 = _1363 + 1.0;
    bool _1367 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1369 = isnan(_308);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1385 = _1307 > 0.5;
    float _1387 = _732 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1389 = _1305 ? as_type<int>(_1365) : as_type<int>(_1301);
    float _1391 = _816 * _1313;
    bool _1393 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1395 = isnan(_308);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1301;
    float _1407 = _1323;
    if (_1317)
    {
        float _1409 = -_1323;
        float _1411 = _1409 + 1.0;
        _1357 = as_type<int>(_1411);
    }
    int _1413 = _1357;
    float _1415 = _1333 ? as_type<float>(_1389) : _1301;
    float _1417 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1419 = 1.0 / _1381;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1327)
    {
        float _1423 = _1385 ? _1365 : _1301;
        _1405 = _1423;
    }
    float _1425 = _1405;
    float _1427 = fma(_1355, _1415, -0.5);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1311)
    {
        bool _1433 = _1351 > 0.5;
        _1347 = _1433;
    }
    bool _1435 = _1347;
    float _1437 = -_436;
    float _1439 = fma(_578, _1427, _1437);
    if (_1311)
    {
        float _1441 = -_1323;
        float _1443 = _1441 + 1.0;
        _444 = as_type<int>(_1443);
    }
    int _1445 = _444;
    if (!_1311)
    {
        _1421 = _1323;
    }
    float _1447 = _1421;
    float _1449 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1451 = fma(_1417, _1425, -0.5);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1457 = _1447;
    if (_1311)
    {
        float _1459 = _1435 ? as_type<float>(_1445) : _1323;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = -_558;
    float _1465 = fma(_520, _1451, _1463);
    if (_1317)
    {
        float _1467 = _1361 ? as_type<float>(_1413) : _1323;
        _1407 = _1467;
    }
    float _1469 = _1407;
    float _1471 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = 1.0 / _1455;
    float _1475 = fma(_1449, _1461, -0.5);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1481 = fma(_1471, _1469, -0.5);
    float _1483 = fma(_610, _1475, _422);
    float _1485 = fma(_504, _1481, _616);
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = 1.0 / _1479;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1439 + 0.5;
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1465 + 0.5;
    float _1509 = _1485 + 0.5;
    float _1511 = _1483 + 0.5;
    float _1513 = 1.0 / _1431;
    out.m_61.x = _1499;
    out.m_61.y = _1505;
    out.m_61.z = _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    out.m_63.x = _1511;
    out.m_63.y = _1503;
    out.m_63.z = _1509;
    out.m_63.w = _1507;
    bool _1519 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1521 = isnan(0.5);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1527 = _1523 || _1525;
    float _1529 = 1.0 / _1495;
    float _1531 = _734 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = _1535 * _1419;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1563 = _1539 * _1513;
    float _1565 = 1.0 / _1547;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1583 = _1569 * _1491;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1589 = 1.0 / _1543;
    float _1591 = _1573 * _1529;
    bool _1593 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1595 = isnan(_310);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1601 = _1597 || _1599;
    float _1603 = float(_1601);
    float _1605 = _1581 * _1553;
    bool _1607 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1609 = isnan(_310);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1623;
    float _1627 = 1.0 / _1561;
    float _1629 = -_1603;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1565;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1641 = _308 + _1639;
    float _1643 = _1617 * _1631;
    float _1645 = -_1617;
    float _1647 = _1645 + 1.0;
    bool _1649 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1651 = isnan(_310);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1587;
    float _1663 = _1577 * _1589;
    bool _1665 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1667 = isnan(_310);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1679 = _310 + _1677;
    float _1681 = -_1659;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1687 = _310 + _1685;
    float _1689 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1691 = -_1675;
    float _1693 = _1691 + 1.0;
    float _1695 = _1637 * _1627;
    float _1697 = _1675 * _1647;
    bool _1699 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1701 = isnan(_310);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1659 * _1693;
    float _1713 = fma(_1563, _1641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1717 = _310 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1721 = _308 + _1719;
    float _1723 = _1709 * _1683;
    float _1725 = _1625 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1729 = _308 + _1727;
    float _1731 = -_1709;
    float _1733 = _1731 + 1.0;
    bool _1735 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1737 = isnan(_310);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1583, _1717, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1749 = fma(_1555, _1729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1751 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1753 = isnan(_310);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = fma(_1557, _1721, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1765 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1767 = isnan(_310);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = -_1745;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1605, _1687, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1783 = _1761 * _1733;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = _1775 * _1779;
    float _1791 = -_1377;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1797 = _1745 * _1787;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1801 = _310 + _1799;
    float _1803 = _1403 * _1793;
    float _1805 = -_1775;
    float _1807 = _1805 + 1.0;
    float _1809 = _806 * _1313;
    float _1811 = fma(_1591, _1801, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1813 = fma(_1663, _1679, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1815 = _1747 * _1789;
    float _1817 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_308);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -_1403;
    float _1833 = _1831 + 1.0;
    float _1835 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1815);
    float _1837 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    bool _1839 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1841 = isnan(_308);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1829 * _1833;
    float _1853 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = -_1829;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1837);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1863 = _310 + _1861;
    float _1865 = 1.0 / _1853;
    float _1867 = _1849 * _1857;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1633, _1863, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1877 = _1749 * _1867;
    float _1879 = _1633;
    float _1881 = _1803;
    float _1883 = _1603;
    if (!_1527)
    {
        _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1885 = _1879;
    float _1887 = _1873 + _1853;
    float _1889 = fma(_1811, _1797, _1835);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1877);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1895 = _310 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1899 = _310 + _1897;
    float _1901 = fma(_1813, _1783, _1889);
    float _1903 = fma(_1713, _1851, _1891);
    float _1905 = fma(_1695, _1895, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1907 = fma(_1725, _1899, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1909 = _1887 * _1865;
    float _1911 = _1909 * 0.5;
    float _1913 = fma(_1763, _1803, _1903);
    float _1915 = _1885;
    if (!_1527)
    {
        _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1917 = _1881;
    float _1919 = fma(_1781, _1723, _1901);
    if (!_1527)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1911, _1885, _1921);
        _406 = _1923;
    }
    float _1925 = _406;
    float _1927 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1913);
    float _1929 = -_1313;
    float _1931 = _802 * _1929;
    if (!_1527)
    {
        float _1933 = -_1917;
        float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1915 = _1935;
    }
    float _1937 = _1915;
    float _1939 = fma(_1875, _1711, _1919);
    float _1941 = fma(_828, _1387, _1391);
    float _1943 = _1925;
    if (!_1527)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = fma(_1905, _1697, _1939);
    float _1953 = fma(_820, _1387, _1931);
    float _1955 = fma(_844, _1387, _1809);
    float _1957 = -_1531;
    float _1959 = fma(_834, _1957, _1941);
    float _1961 = fma(_1907, _1643, _1951);
    float _1963 = -_1531;
    float _1965 = fma(_822, _1963, _1953);
    float _1967 = _1937;
    float _1969 = _1965;
    if (!_1527)
    {
        float _1971 = 1.0 / _1937;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = -_1531;
    float _1977 = fma(_854, _1975, _1955);
    float _1979 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1961);
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1985 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1989 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1991 = _1947;
    if (!_1527)
    {
        float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1995 = -_1917;
        float _1997 = fma(_1947, _1993, _1995);
        _1883 = _1997;
    }
    float _1999 = _1883;
    float _2001 = exp2(_1949);
    float _2003 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1983);
    float _2005 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2007 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2009 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1987);
    if (!_1527)
    {
        float _2011 = _1999 * _1973;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1991 = _2013;
    }
    float _2015 = _1991;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1527)
    {
        _1969 = 1.0;
    }
    float _2021 = _1969;
    float _2023 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = -_2001;
    float _2033 = _2031 + 1.0;
    float _2035 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2021;
    if (!_1527)
    {
        float _2039 = -_2015;
        float _2041 = _2039 + 1.0;
        _2037 = _2041;
    }
    float _2043 = _2037;
    float _2045 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2047 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _2049 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2003);
    out.m_65.x = _2027;
    out.m_65.y = _2035;
    out.m_65.z = _2029;
    out.m_65.w = _2005;
    bool _2051 = _2043 > 0.0;
    bool _2053 = isnan(_2043);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.0);
    bool _2059 = _2055 || _2057;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2009);
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2065 = _2045 + _1214;
    out.m_67.x = _1979;
    float _2067 = _2065 * 0.5;
    out.m_69.x = _2047;
    out.m_69.y = _2049;
    out.m_69.z = _2061;
    float _2069 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _986;
    out.m_71.y = _982;
    out.m_71.z = _990;
    float _2073 = -_2069;
    float _2075 = _2073 + 1.0;
    out.gl_Position.x = _1252;
    out.gl_Position.y = _1254;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1214;
    out.m_73.z = _2067;
    out.m_73.w = _1214;
    out.m_45.x = _2071;
    float _2077 = _2069 * _1278;
    float _2079 = _1289 * _2075;
    float _2081 = _1289 * _2077;
    float _2083 = _1299 * _2077;
    float _2085 = fma(_1295, _2081, _1283);
    float _2087 = fma(_1297, _2081, _1285);
    float _2089 = fma(_1289, _2083, _1287);
    out.m_75.x = _2085;
    out.m_75.y = _2087;
    out.m_75.z = _2089;
    out.m_75.w = _2079;
    if (_2059)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2091;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
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
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_108);
        out.gl_Position.z = _2147;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_94);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2217 = as_type<float>(_148);
        out.gl_Position.z = _2217;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _296;
    float _298;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _278 = float(_94);
        float _280 = 1.0 / _278;
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _284 = _126 * _280;
        float _286 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _288 = _286 * _276;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = _284;
        _300 = true;
    }
    else
    {
        float _302 = float(_94);
        float _304 = 1.0 / _302;
        float _306 = _126 * _304;
        _296 = _306;
        _298 = _306;
    }
    _300 = false;
    float _308 = _296;
    float _310 = _298;
    float _312 = in.m_51.z;
    float _314 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _318 = in.m_51.x;
    float _320 = in.m_51.y;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    float _326 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _328 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _330 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _326);
    float _332 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _316);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _338 = _336 != 0;
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _342 = _340 != 0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _346 = _344 != 0;
    float _348 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _330);
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    float _356 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _328);
    float _358 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _332);
    float _360 = _348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _312 * 2.0;
    float _364 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _366 = !_342;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _372 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _374 = floor(_362);
    float _376 = _320 * 2.0;
    float _378 = _320 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _318 * 2.0;
    float _382 = -_334;
    float _384 = fma(_372, 2.0, _382);
    float _386 = _320 + _312;
    float _388 = fma(_378, -2.0, _350);
    float _390 = _318 + _312;
    float _392 = floor(_380);
    float _394 = _386 + (-1.0);
    float _396 = _354 * _126;
    float _398 = _390 + (-1.0);
    float _400 = _390;
    float _402 = _380;
    bool _404 = _346;
    float _406 = _310;
    if (!_324)
    {
        _400 = _312;
    }
    float _408 = _400;
    float _410 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _412 = _320 + _318;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = floor(_376);
    bool _418 = _374 > 0.0;
    float _420 = -_126;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _384);
    bool _424 = _374 >= 0.0;
    bool _426 = isnan(_374);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = _412 + (-1.0);
    float _436 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _438 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _440 = _412;
    float _442 = _408;
    int _444 = as_type<int>(_436);
    if (!_324)
    {
        _402 = _320;
    }
    float _446 = _402;
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _446;
    if (!_324)
    {
        _440 = _312;
    }
    float _452 = _440;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    int _466 = _432 ? 0 : 1;
    float _468 = _452;
    if (_324)
    {
        _450 = _318;
    }
    float _470 = _450;
    if (_324)
    {
        _442 = _320;
    }
    float _472 = _442;
    if (_324)
    {
        _468 = _320;
    }
    float _474 = _468;
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    bool _478 = _416 > 0.0;
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _482 = _392 > 0.0;
    float _484 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[83].w, _370);
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _488 = _464 ? 0 : 1;
    float _490 = exp2(_396);
    bool _492 = _416 >= 0.0;
    bool _494 = isnan(_416);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _476);
    int _506 = _500 ? 0 : 1;
    float _508 = -_502;
    float _510 = fma(_480, 2.0, _508);
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    int _522 = _518;
    if (!_478)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = fma(_486, -2.0, _512);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _534 = 1.0 + _532;
    int _536 = ~_466;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -_490;
    float _544 = _542 + 1.0;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _548 = 1.0 / _534;
    int _550 = _540;
    if (!_418)
    {
        int _552 = ~_466;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _560 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[78].w, _546);
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _574 = !_338;
    int _576 = _574 ? 0 : 1;
    float _578 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    int _580 = ~_488;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].z, _572);
    int _588 = _584;
    if (!_482)
    {
        int _590 = ~_488;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _364 + _596;
    bool _600 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _612 = abs(_576);
    float _614 = -_126;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    float _618 = _608 ? _544 : 0.0;
    float _620 = in.m_53.x;
    float _622 = in.m_53.y;
    float _624 = in.m_53.z;
    float _626 = float(_612);
    float _628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _630 = _360 + _628;
    float _632 = float(_556);
    if (_570)
    {
        float _634 = _618 * _548;
        _130 = _634;
    }
    float _636 = _130;
    int _638 = abs(_368);
    float _640 = _598 * _598;
    bool _642 = !_346;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * _632;
    float _648 = float(_638);
    float _650 = in.m_49.x;
    float _652 = in.m_49.y;
    float _654 = in.m_49.z;
    float _656 = float(_594);
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _660 = _438 + _658;
    int _662 = abs(_644);
    float _664 = fma(_630, _630, _640);
    float _666 = float(_528);
    float _668 = _648 * _656;
    float _670 = fma(_660, _660, _664);
    float _672 = _318 + (-0.5);
    float _674 = _668 * (-2.0);
    float _676 = float(_662);
    float _678 = rsqrt(_670);
    float _680 = _320 + (-0.5);
    float _682 = fma(_674, _622, _622);
    float _684 = fma(_410, _674, _410);
    float _686 = _646 * (-2.0);
    float _688 = _676 * _666;
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _682);
    float _692 = fma(_448, _686, _448);
    float _694 = fma(_686, _620, _620);
    float _696 = _688 * (-2.0);
    float _698 = fma(_684, _636, _690);
    float _700 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    float _704 = fma(_414, _696, _414);
    float _706 = fma(_696, _624, _624);
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _312 + (-0.5);
    float _712 = fma(_692, _636, _702);
    float _714 = _698 * 0.15915493667125701904296875;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    float _720 = _712 * 0.15915493667125701904296875;
    float _722 = _714 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = _716 * _678;
    float _728 = fma(_704, _636, _718);
    float _730 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = in.m_55.x;
    float _734 = in.m_55.y;
    float _736 = in.m_55.z;
    float _738 = _598 * _726;
    float _740 = _630 * _726;
    float _742 = _660 * _726;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -_738;
    float _748 = _598 + _746;
    float _750 = -_740;
    float _752 = _630 + _750;
    float _754 = -_742;
    float _756 = _660 + _754;
    float _758 = _714 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _748 * _748;
    float _764 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = _652 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = fma(_752, _752, _762);
    float _770 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _720 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_756, _756, _768);
    float _778 = sqrt(_776);
    float _780 = _744 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _774 * _724;
    float _786 = _720 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _678 * _778;
    float _792 = _774 * _760;
    float _794 = _764 * _790;
    float _796 = _708 * _790;
    float _798 = _770 * _790;
    float _800 = _744 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _806 = _774 * _782;
    float _808 = _794 * _804;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _812 = _788 * _760;
    float _814 = _788 * _724;
    float _816 = _788 * _782;
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _820 = _760 * _782;
    float _822 = _724 * _782;
    float _824 = _816 * _808;
    float _826 = _796 * _818;
    float _828 = fma(_802, _812, _784);
    float _830 = _798 * _810;
    float _832 = -_792;
    float _834 = fma(_802, _814, _832);
    float _836 = -_808;
    float _838 = _802 * _836;
    float _840 = fma(_828, _826, _824);
    float _842 = -_814;
    float _844 = fma(_802, _792, _842);
    float _846 = _806 * _808;
    float _848 = fma(_820, _826, _838);
    float _850 = -_830;
    float _852 = fma(_834, _850, _840);
    float _854 = fma(_802, _784, _812);
    float _856 = fma(_844, _826, _846);
    float _858 = -_830;
    float _860 = fma(_822, _858, _848);
    float _862 = _852 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _864 = _852 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _866 = -_830;
    float _868 = fma(_854, _866, _856);
    float _870 = _852 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].x, _862);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].x, _864);
    float _876 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].x, _870);
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].z, _872);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].z, _874);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _438 + _878;
    float _886 = _360 + _880;
    float _888 = _364 + _882;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _884 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _886 + _894;
    float _898 = _892 * _892;
    float _900 = fma(_896, _896, _898);
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = _870;
    float _908 = _862;
    float _910 = _886;
    float _912 = _682;
    float _914 = _674;
    if (!_904)
    {
        _906 = _884;
    }
    float _916 = _906;
    float _918 = _916;
    if (!_904)
    {
        _908 = _888;
    }
    float _920 = _908;
    bool _922 = !_904;
    float _924 = _920;
    if (!_922)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _928 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _930 = _902 + _928;
        float _932 = rsqrt(_900);
        float _934 = _930 * _926;
        float _936 = _888 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = _934 * 0.15915493667125701904296875;
        float _940 = _938 * 6.283185482025146484375;
        float _942 = cos(_940);
        float _944 = _938 * 6.283185482025146484375;
        float _946 = sin(_944);
        float _948 = _942 + (-1.0);
        float _950 = fma(_946, _936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _952 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = _932 * _950;
        float _956 = fma(_888, _942, _952);
        float _958 = fma(_896, _954, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _960 = fma(_892, _954, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _924 = _956;
        _910 = _958;
        _918 = _960;
    }
    float _962 = _924;
    float _964 = _910;
    float _966 = _918;
    float _968 = -_738;
    float _970 = _968 + _962;
    float _972 = -_740;
    float _974 = _972 + _964;
    float _976 = -_742;
    float _978 = _976 + _966;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _982 = _970 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _986 = _974 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _978 + _988;
    float _992 = _982 * _982;
    float _994 = fma(_986, _986, _992);
    float _996 = fma(_990, _990, _994);
    float _998 = rsqrt(_996);
    float _1000 = sqrt(_996);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1004 = _986 * _1002;
    float _1006 = _990 * _1002;
    float _1008 = _1004 * _1004;
    float _1010 = _1006 * _1006;
    float _1012 = _1008 + _1010;
    float _1014 = sqrt(_1012);
    bool _1016 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = _1014 + _1018;
    float _1022 = _892;
    float _1024 = _1020;
    float _1026 = _1004;
    float _1028 = _1006;
    float _1030 = _1008;
    float _1032 = _1010;
    if (_1016)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1034;
    }
    float _1036 = _1022;
    if (_1016)
    {
        float _1038 = _1020 * _1036;
        _1024 = _1038;
    }
    float _1040 = _1024;
    if (_1016)
    {
        float _1042 = _1040 * 0.15915493667125701904296875;
        _912 = _1042;
    }
    float _1044 = _912;
    float _1046 = _696;
    if (_1016)
    {
        float _1048 = _1044 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        _1046 = _1050;
    }
    float _1052 = _1046;
    float _1054 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1056 = precise::max(0.0, _1054);
    float _1058 = _1036;
    float _1060 = _1056;
    if (_1016)
    {
        float _1062 = _1044 * 6.283185482025146484375;
        float _1064 = cos(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = -_1002;
    float _1070 = -_1056;
    float _1072 = fma(_982, _1068, _1070);
    float _1074 = _1054;
    if (_1016)
    {
        float _1076 = rsqrt(_1012);
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_1016)
    {
        float _1080 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1080;
    }
    float _1082 = _1060;
    float _1084 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1086 = _1082;
    float _1088 = _1052;
    if (_1016)
    {
        float _1090 = fma(_1052, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _914 = _1090;
    }
    float _1092 = _914;
    float _1094 = _1092;
    if (_1016)
    {
        float _1096 = _1066 + (-1.0);
        _1086 = _1096;
    }
    float _1098 = _1086;
    if (_1016)
    {
        float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1088 = _1100;
    }
    float _1102 = _1088;
    float _1104 = _970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1078;
    if (_1016)
    {
        float _1108 = _1078 * _1092;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (!_1016)
    {
        _1106 = _1072;
    }
    float _1112 = _1106;
    float _1114 = _1112;
    if (_1016)
    {
        float _1116 = fma(_1072, _1066, _1102);
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1016)
    {
        float _1122 = _1004 * _1110;
        _1026 = _1122;
    }
    float _1124 = _1026;
    if (_1016)
    {
        float _1126 = _1006 * _1110;
        _1028 = _1126;
    }
    float _1128 = _1028;
    if (_1016)
    {
        float _1130 = _1124 * _1124;
        _1030 = _1130;
    }
    float _1132 = _1030;
    if (_1016)
    {
        float _1134 = _1128 * _1128;
        _1032 = _1134;
    }
    float _1136 = _1032;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1140 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1138);
    float _1142 = precise::clamp(_1140, 0.0, 1.0);
    float _1144 = fma(_1118, _1118, _1132);
    float _1146 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1144 + _1136;
    float _1154 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1156 = _970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1158 = _970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1150);
    float _1162 = log2(_1160);
    float _1164 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1146);
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1170 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1156);
    float _1172 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1174 = rsqrt(_1152);
    float _1176 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1178 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1172);
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1188 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1190 = -_1182;
    float _1192 = fma(_1190, _1084, 1.0);
    float _1194 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1188);
    float _1198 = log2(_1192);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = _1174 * _1124;
    float _1204 = _1174 * _1118;
    float _1206 = _1174 * _1128;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1212 = exp2(_1194);
    float _1214 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1208);
    float _1216 = -_1210;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1216);
    float _1220 = -_1206;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1218);
    float _1224 = 1.0 / _1214;
    float _1226 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1228 = fma(_1222, -0.5, 0.5);
    float _1230 = fma(_1222, 0.5, 0.5);
    float _1232 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1226);
    float _1234 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1236 = _1204 + 1.0;
    float _1238 = fma(_1230, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1240 = sqrt(_1228);
    float _1242 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1232);
    float _1244 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1246 = -_1204;
    float _1248 = fma(_1212, _1236, _1246);
    float _1250 = _1198 * 0.693147182464599609375;
    float _1252 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1242);
    float _1254 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1244);
    float _1256 = fma(_1230, _1238, -0.212114393711090087890625);
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1260 = _1252 * _1224;
    float _1262 = _1254 * _1224;
    float _1264 = fma(_1230, _1256, 1.570728778839111328125);
    float _1266 = fma(_1248, 0.5, 0.5);
    float _1268 = fma(_1260, 0.5, 0.5);
    float _1270 = _1240 * 0.636619746685028076171875;
    float _1272 = fma(_1262, -0.5, 0.5);
    float _1274 = -_1264;
    float _1276 = fma(_1270, _1274, 1.0);
    float3 _3985 = float3(_1268, _1272, _1258);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3985, float3(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3985, float3(0.0), isnan(_3985)), level(0.0)).x;
    float3 _3996 = float3(_1268, _1272, _1258);
    float4 _1281 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).xyzw;
    float _1283 = _1281.x;
    float _1285 = _1281.y;
    float _1287 = _1281.z;
    float _1289 = _1281.w;
    float2 _4013 = float2(_1276, _1266);
    float3 _1293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4013, float2(0.0), isnan(_4013)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4013, float2(0.0), isnan(_4013)), level(0.0)).xyz;
    float _1295 = _1293.x;
    float _1297 = _1293.y;
    float _1299 = _1293.z;
    float _1301 = in.m_57.y;
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1305 = _320 > 0.5;
    float _1307 = in.m_51.w;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1317 = _1315 != 0;
    float _1319 = -_738;
    float _1321 = _364 + _1319;
    float _1323 = in.m_57.x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1327 = _1325 != 0;
    float _1329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1333 = _1331 != 0;
    float _1335 = -_740;
    float _1337 = _360 + _1335;
    float _1339 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_742;
    float _1343 = _438 + _1341;
    float _1345 = 0.0;
    bool _1347 = _1305;
    if (_1311)
    {
        float _1349 = in.m_51.x;
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1355 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].w);
    if (_1317)
    {
        bool _1359 = _312 > 0.5;
        _404 = _1359;
    }
    bool _1361 = _404;
    float _1363 = -_1301;
    float _1365 = _1363 + 1.0;
    bool _1367 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1369 = isnan(_308);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1385 = _1307 > 0.5;
    float _1387 = _732 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1389 = _1305 ? as_type<int>(_1365) : as_type<int>(_1301);
    float _1391 = _816 * _1313;
    bool _1393 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1395 = isnan(_308);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1301;
    float _1407 = _1323;
    if (_1317)
    {
        float _1409 = -_1323;
        float _1411 = _1409 + 1.0;
        _1357 = as_type<int>(_1411);
    }
    int _1413 = _1357;
    float _1415 = _1333 ? as_type<float>(_1389) : _1301;
    float _1417 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1419 = 1.0 / _1381;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1327)
    {
        float _1423 = _1385 ? _1365 : _1301;
        _1405 = _1423;
    }
    float _1425 = _1405;
    float _1427 = fma(_1355, _1415, -0.5);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1311)
    {
        bool _1433 = _1351 > 0.5;
        _1347 = _1433;
    }
    bool _1435 = _1347;
    float _1437 = -_436;
    float _1439 = fma(_578, _1427, _1437);
    if (_1311)
    {
        float _1441 = -_1323;
        float _1443 = _1441 + 1.0;
        _444 = as_type<int>(_1443);
    }
    int _1445 = _444;
    if (!_1311)
    {
        _1421 = _1323;
    }
    float _1447 = _1421;
    float _1449 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1451 = fma(_1417, _1425, -0.5);
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1457 = _1447;
    if (_1311)
    {
        float _1459 = _1435 ? as_type<float>(_1445) : _1323;
        _1457 = _1459;
    }
    float _1461 = _1457;
    float _1463 = -_558;
    float _1465 = fma(_520, _1451, _1463);
    if (_1317)
    {
        float _1467 = _1361 ? as_type<float>(_1413) : _1323;
        _1407 = _1467;
    }
    float _1469 = _1407;
    float _1471 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = 1.0 / _1455;
    float _1475 = fma(_1449, _1461, -0.5);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1481 = fma(_1471, _1469, -0.5);
    float _1483 = fma(_610, _1475, _422);
    float _1485 = fma(_504, _1481, _616);
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = 1.0 / _1479;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1503 = _1439 + 0.5;
    float _1505 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1465 + 0.5;
    float _1509 = _1485 + 0.5;
    float _1511 = _1483 + 0.5;
    float _1513 = 1.0 / _1431;
    out.m_61.x = _1499;
    out.m_61.y = _1505;
    out.m_61.z = _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    out.m_63.x = _1511;
    out.m_63.y = _1503;
    out.m_63.z = _1509;
    out.m_63.w = _1507;
    bool _1519 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1521 = isnan(0.5);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1527 = _1523 || _1525;
    float _1529 = 1.0 / _1495;
    float _1531 = _734 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1533;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = _1535 * _1419;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1563 = _1539 * _1513;
    float _1565 = 1.0 / _1547;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1583 = _1569 * _1491;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1589 = 1.0 / _1543;
    float _1591 = _1573 * _1529;
    bool _1593 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1595 = isnan(_310);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1601 = _1597 || _1599;
    float _1603 = float(_1601);
    float _1605 = _1581 * _1553;
    bool _1607 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1609 = isnan(_310);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1623;
    float _1627 = 1.0 / _1561;
    float _1629 = -_1603;
    float _1631 = _1629 + 1.0;
    float _1633 = _1621 * _1565;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1641 = _308 + _1639;
    float _1643 = _1617 * _1631;
    float _1645 = -_1617;
    float _1647 = _1645 + 1.0;
    bool _1649 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1651 = isnan(_310);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1587;
    float _1663 = _1577 * _1589;
    bool _1665 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1667 = isnan(_310);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1679 = _310 + _1677;
    float _1681 = -_1659;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1687 = _310 + _1685;
    float _1689 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1691 = -_1675;
    float _1693 = _1691 + 1.0;
    float _1695 = _1637 * _1627;
    float _1697 = _1675 * _1647;
    bool _1699 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1701 = isnan(_310);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1659 * _1693;
    float _1713 = fma(_1563, _1641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1717 = _310 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1721 = _308 + _1719;
    float _1723 = _1709 * _1683;
    float _1725 = _1625 * _1661;
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1729 = _308 + _1727;
    float _1731 = -_1709;
    float _1733 = _1731 + 1.0;
    bool _1735 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1737 = isnan(_310);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1583, _1717, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1749 = fma(_1555, _1729, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1751 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1753 = isnan(_310);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = fma(_1557, _1721, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1765 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1767 = isnan(_310);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = -_1745;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1605, _1687, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1783 = _1761 * _1733;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = _1775 * _1779;
    float _1791 = -_1377;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1797 = _1745 * _1787;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1801 = _310 + _1799;
    float _1803 = _1403 * _1793;
    float _1805 = -_1775;
    float _1807 = _1805 + 1.0;
    float _1809 = _806 * _1313;
    float _1811 = fma(_1591, _1801, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1813 = fma(_1663, _1679, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1815 = _1747 * _1789;
    float _1817 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1821 = isnan(_308);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = -_1403;
    float _1833 = _1831 + 1.0;
    float _1835 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1815);
    float _1837 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    bool _1839 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1841 = isnan(_308);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    float _1851 = _1829 * _1833;
    float _1853 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = -_1829;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1837);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1863 = _310 + _1861;
    float _1865 = 1.0 / _1853;
    float _1867 = _1849 * _1857;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = fma(_1633, _1863, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1877 = _1749 * _1867;
    float _1879 = _1633;
    float _1881 = _1803;
    float _1883 = _1603;
    if (!_1527)
    {
        _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1885 = _1879;
    float _1887 = _1873 + _1853;
    float _1889 = fma(_1811, _1797, _1835);
    float _1891 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1877);
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1895 = _310 + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1899 = _310 + _1897;
    float _1901 = fma(_1813, _1783, _1889);
    float _1903 = fma(_1713, _1851, _1891);
    float _1905 = fma(_1695, _1895, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1907 = fma(_1725, _1899, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1909 = _1887 * _1865;
    float _1911 = _1909 * 0.5;
    float _1913 = fma(_1763, _1803, _1903);
    float _1915 = _1885;
    if (!_1527)
    {
        _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1917 = _1881;
    float _1919 = fma(_1781, _1723, _1901);
    if (!_1527)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1911, _1885, _1921);
        _406 = _1923;
    }
    float _1925 = _406;
    float _1927 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1913);
    float _1929 = -_1313;
    float _1931 = _802 * _1929;
    if (!_1527)
    {
        float _1933 = -_1917;
        float _1935 = _1933 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1915 = _1935;
    }
    float _1937 = _1915;
    float _1939 = fma(_1875, _1711, _1919);
    float _1941 = fma(_828, _1387, _1391);
    float _1943 = _1925;
    if (!_1527)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1951 = fma(_1905, _1697, _1939);
    float _1953 = fma(_820, _1387, _1931);
    float _1955 = fma(_844, _1387, _1809);
    float _1957 = -_1531;
    float _1959 = fma(_834, _1957, _1941);
    float _1961 = fma(_1907, _1643, _1951);
    float _1963 = -_1531;
    float _1965 = fma(_822, _1963, _1953);
    float _1967 = _1937;
    float _1969 = _1965;
    if (!_1527)
    {
        float _1971 = 1.0 / _1937;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = -_1531;
    float _1977 = fma(_854, _1975, _1955);
    float _1979 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1961);
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1983 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1985 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1989 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1981);
    float _1991 = _1947;
    if (!_1527)
    {
        float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1995 = -_1917;
        float _1997 = fma(_1947, _1993, _1995);
        _1883 = _1997;
    }
    float _1999 = _1883;
    float _2001 = exp2(_1949);
    float _2003 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1983);
    float _2005 = _1927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2007 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2009 = fma(_1965, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1987);
    if (!_1527)
    {
        float _2011 = _1999 * _1973;
        float _2013 = precise::clamp(_2011, 0.0, 1.0);
        _1991 = _2013;
    }
    float _2015 = _1991;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1527)
    {
        _1969 = 1.0;
    }
    float _2021 = _1969;
    float _2023 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = -_2001;
    float _2033 = _2031 + 1.0;
    float _2035 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2021;
    if (!_1527)
    {
        float _2039 = -_2015;
        float _2041 = _2039 + 1.0;
        _2037 = _2041;
    }
    float _2043 = _2037;
    float _2045 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2047 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1989);
    float _2049 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2003);
    out.m_65.x = _2027;
    out.m_65.y = _2035;
    out.m_65.z = _2029;
    out.m_65.w = _2005;
    bool _2051 = _2043 > 0.0;
    bool _2053 = isnan(_2043);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.0);
    bool _2059 = _2055 || _2057;
    float _2061 = fma(_1977, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2009);
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2065 = _2045 + _1214;
    out.m_67.x = _1979;
    float _2067 = _2065 * 0.5;
    out.m_69.x = _2047;
    out.m_69.y = _2049;
    out.m_69.z = _2061;
    float _2069 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _986;
    out.m_71.y = _982;
    out.m_71.z = _990;
    float _2073 = -_2069;
    float _2075 = _2073 + 1.0;
    out.gl_Position.x = _1252;
    out.gl_Position.y = _1254;
    out.gl_Position.z = _2045;
    out.gl_Position.w = _1214;
    out.m_73.z = _2067;
    out.m_73.w = _1214;
    out.m_45.x = _2071;
    float _2077 = _2069 * _1278;
    float _2079 = _1289 * _2075;
    float _2081 = _1289 * _2077;
    float _2083 = _1299 * _2077;
    float _2085 = fma(_1295, _2081, _1283);
    float _2087 = fma(_1297, _2081, _1285);
    float _2089 = fma(_1289, _2083, _1287);
    out.m_75.x = _2085;
    out.m_75.y = _2087;
    out.m_75.z = _2089;
    out.m_75.w = _2079;
    if (_2059)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2091;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

