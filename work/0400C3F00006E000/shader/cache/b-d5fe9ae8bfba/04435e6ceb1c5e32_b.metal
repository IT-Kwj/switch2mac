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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_71 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1370 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_110);
        out.gl_Position.z = _2144;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2214 = as_type<float>(_148);
        out.gl_Position.z = _2214;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _336;
    float _356 = -_352;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = _332 * _358;
    float _364 = -_332;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _340;
    float _370 = _304 * _354;
    float _372 = -_316;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = _352 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _320 * _368;
    float _394 = fma(_384, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _390 * _362;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _362;
    float _406 = _396 * _362;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _428 = fma(_420, _380, _418);
    float _430 = fma(_416, _380, _422);
    float _432 = fma(_424, _380, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_360;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _480 = in.m_53.y;
    float _482 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _484 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _486 = in.m_53.x;
    float _488 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _478);
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _482);
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _502 = _500 != 0;
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _510 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _512 = _474 * _128;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _520 = _510 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _524 = _514 + _522;
    float _526 = exp2(_512);
    float _528 = _470 * 2.0;
    float _530 = _520 * _520;
    float _532 = in.m_55.x;
    float _534 = _480 * 2.0;
    float _536 = _480 + _470;
    float _538 = fma(_524, _524, _530);
    float _540 = floor(_528);
    float _542 = _486 * 2.0;
    float _544 = _536 + (-1.0);
    float _546 = _486 + _480;
    bool _548 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_468);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _546 + (-1.0);
    float _562 = floor(_534);
    float _564 = -_526;
    float _566 = _564 + 1.0;
    bool _568 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = isnan(_468);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _582 = -_578;
    float _584 = _582 + 1.0;
    bool _586 = _540 > 0.0;
    float _588 = floor(_542);
    bool _590 = _540 >= 0.0;
    bool _592 = isnan(_540);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _602;
    int _606 = _598 ? 0 : 1;
    float _608 = _558 * _584;
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_606;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -_558;
    float _632 = _630 + 1.0;
    int _634 = _628;
    float _636 = _480;
    if (!_586)
    {
        int _638 = ~_606;
        int _640 = _638 + 1;
        _634 = _640;
    }
    int _642 = _634;
    float _644 = 1.0 / _622;
    bool _646 = _562 > 0.0;
    float _648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _650 = _516 + _648;
    bool _652 = _588 >= 0.0;
    bool _654 = isnan(_588);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_650, _650, _538);
    bool _668 = _588 > 0.0;
    bool _670 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(1.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = _660 ? 0 : 1;
    float _682 = rsqrt(_666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    int _694 = abs(_664);
    float _696 = _692 ? _566 : 0.0;
    float _698 = float(_694);
    float _700 = float(_642);
    if (_678)
    {
        float _702 = _696 * _644;
        _130 = _702;
    }
    float _704 = _130;
    int _706 = ~_680;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    int _712 = _710;
    if (!_668)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _698 * _700;
    int _722 = _618 ? 0 : 1;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = _520 * _682;
    bool _732 = !_498;
    int _734 = _732 ? 0 : 1;
    float _736 = _720 * (-2.0);
    int _738 = ~_722;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_730;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    int _748 = _742;
    if (!_646)
    {
        int _750 = ~_722;
        int _752 = _750 + 1;
        _748 = _752;
    }
    int _754 = _748;
    float _756 = _524 * _682;
    int _758 = abs(_734);
    float _760 = _746 * _746;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _762;
    float _766 = _604 * _604;
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _524);
    float _772 = float(_758);
    float _774 = _650 * _682;
    float _776 = fma(_764, _764, _766);
    bool _778 = !_502;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_770, _770, _760);
    float _784 = _486 + (-0.5);
    float _786 = -_774;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _650);
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _792;
    float _796 = fma(_580, _736, _580);
    float _798 = fma(_788, _788, _782);
    float _800 = fma(_736, _724, _724);
    float _802 = float(_718);
    float _804 = _480 + (-0.5);
    float _806 = fma(_794, _794, _776);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _810 = float(_754);
    float _812 = _772 * _802;
    float _814 = sqrt(_806);
    float _816 = _812 * (-2.0);
    float _818 = float(_790);
    float _820 = fma(_796, _704, _808);
    bool _822 = _480 > 0.5;
    float _824 = fma(_816, _726, _726);
    float _826 = fma(_600, _816, _600);
    float _828 = _486 + _470;
    float _830 = _818 * _810;
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    float _834 = _470 + (-0.5);
    float _836 = _828 + (-1.0);
    float _838 = _830 * (-2.0);
    float _840 = fma(_826, _704, _832);
    float _842 = sqrt(_798);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _846 = fma(_838, _728, _728);
    float _848 = in.m_51.x;
    float _850 = in.m_51.y;
    float _852 = in.m_51.z;
    float _854 = _820 * 0.15915493667125701904296875;
    float _856 = fma(_844, _838, _844);
    float _858 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _846);
    float _860 = _854 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_856, _704, _858);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    float _876 = _866 * 0.15915493667125701904296875;
    float _878 = precise::max(_814, 10.0);
    float _880 = in.m_59.x;
    float _882 = in.m_59.y;
    float _884 = in.m_59.z;
    float _886 = _854 * 6.283185482025146484375;
    float _888 = cos(_886);
    bool _890 = _486 > 0.5;
    bool _892 = _890 && _870;
    float _894 = _814 * 0.039999999105930328369140625;
    float _896 = precise::min(_878, 50.0);
    float _898 = precise::max(_894, 1.0);
    float _900 = _864 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = 0.0;
    if (_870)
    {
        _904 = _532;
    }
    float _906 = _904;
    float _908 = _438 * _852;
    float _910 = _436 * _850;
    float _912 = _434 * _848;
    float _914 = _682 * _842;
    float _916 = precise::min(_898, 2.0);
    float _918 = _864 * 6.283185482025146484375;
    float _920 = cos(_918);
    float _922 = fma(_896, 0.25, -2.5);
    float _924 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _906;
    float _928 = _914;
    if (_892)
    {
        float _930 = -_906;
        float _932 = _930 + 1.0;
        _926 = _932;
    }
    float _934 = _926;
    if (!_870)
    {
        _636 = _532;
    }
    float _936 = _636;
    bool _938 = _882 != 0.0;
    bool _940 = isnan(_882);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = _876 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _888 * _902;
    float _954 = _862 * _902;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    bool _958 = _880 == 0.0;
    bool _960 = !_946;
    bool _962 = _958 && _960;
    float _964 = _936;
    if (_870)
    {
        _964 = _934;
    }
    float _966 = _964;
    float _968 = _876 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _862 * _920;
    bool _974 = _884 == 0.0;
    bool _976 = _974 && _962;
    float _978 = _862 * _950;
    float _980 = _888 * _920;
    float _982 = _888 * _950;
    float _984 = _920 * _950;
    float _986 = _902 * _950;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _990 = _924 * _914;
    float _992 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -_952;
    float _996 = fma(_970, _972, _994);
    float _998 = -_972;
    float _1000 = fma(_970, _952, _998);
    float _1002 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _1006 = _990 * _988;
    float _1008 = _992 * _914;
    float _1010 = _1002 * _914;
    float _1012 = fma(_970, _980, _954);
    float _1014 = _982 * _1006;
    float _1016 = _1008 * _956;
    float _1018 = _1010 * _1004;
    float _1020 = -_1006;
    float _1022 = _970 * _1020;
    float _1024 = _978 * _1006;
    float _1026 = fma(_970, _954, _980);
    float _1028 = fma(_1012, _1018, _1014);
    float _1030 = fma(_984, _1018, _1022);
    float _1032 = fma(_996, _1018, _1024);
    float _1034 = rsqrt(_806);
    float _1036 = fma(_1000, _1016, _1028);
    float _1038 = fma(_986, _1016, _1030);
    float _1040 = fma(_1026, _1016, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1046 = in.m_55.y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1042);
    float _1052 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1044);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1050);
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1064 = _514 + _1058;
    float _1066 = _516 + _1060;
    float _1068 = 1.0 / _1056;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1078 = _1066 + _1076;
    float _1080 = _1034 * _922;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1082;
    float _1086 = fma(_1074, _916, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1088 = fma(_1078, _916, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1090 = _510 + _1070;
    float _1092 = -_1080;
    float _1094 = fma(_764, _1092, _1086);
    float _1096 = -_1080;
    float _1098 = fma(_794, _1096, _1088);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _468 + _1100;
    float _1104 = -_1046;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1110 = _1094 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1114 = _1098 + _1112;
    float _1116 = _1084 * _1068;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = _1090 + _1118;
    float _1122 = _1110 * _1110;
    float _1124 = _1114 * _1114;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1134 = _1046;
    float _1136 = _1122;
    float _1138 = _1124;
    float _1140 = _1094;
    float _1142 = _1098;
    if (_874)
    {
        float _1144 = _822 ? _1106 : _1046;
        _1134 = _1144;
    }
    float _1146 = _1134;
    float _1148 = _1122 + _1124;
    float _1150 = fma(_1120, _916, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1152 = _1132 * _608;
    float _1154 = sqrt(_1148);
    float _1156 = -_1080;
    float _1158 = fma(_604, _1156, _1150);
    float _1160 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1152);
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1128;
    float _1166 = _1126;
    float _1168 = _1130;
    if (!_976)
    {
        float _1170 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_976)
    {
        float _1174 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1126);
        _1166 = _1174;
    }
    float _1176 = _1166;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1180 = _1176;
    if (!_976)
    {
        float _1182 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1168 = _1182;
    }
    float _1184 = _1168;
    float _1186 = -_1172;
    float _1188 = _970 * _1186;
    float _1190 = _982 * _1172;
    float _1192 = _978 * _1172;
    float _1194 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1160);
    float _1196 = fma(_984, _1176, _1188);
    float _1198 = fma(_1012, _1176, _1190);
    float _1200 = fma(_996, _1176, _1192);
    if (!_1162)
    {
        _1180 = _1158;
    }
    float _1202 = _1180;
    bool _1204 = !_1162;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1154 + _1210;
        float _1214 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1148);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1114, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1158, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1136 = _1252;
        _1138 = _1254;
        _1140 = _1236;
        _1142 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1136;
    float _1260 = _1138;
    float _1262 = _1140;
    float _1264 = _1142;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1268 = _1256 + _1266;
    float _1270 = fma(_1000, _1184, _1198);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = fma(_986, _1184, _1196);
    float _1276 = fma(_1268, _1268, _1258);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1280 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = fma(_1026, _1184, _1200);
    float _1284 = _1276 + _1260;
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1278);
    float _1288 = _1280 * _1178;
    float _1290 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1292 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1294 = sqrt(_1284);
    float _1296 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1290);
    float _1300 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1292);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1296 * _1272;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1298);
    float _1314 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1300);
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1286);
    out.m_63.x = _1310;
    out.m_63.y = _1288;
    bool _1324 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1326 = isnan(_1294);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1332 = _1328 || _1330;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1316;
    out.m_67.y = _1318;
    out.m_67.z = _1320;
    out.m_67.w = _1308;
    out.m_69.x = _1312;
    out.m_69.y = _1314;
    out.m_69.z = _1322;
    float _1334 = _1298;
    if (!_1332)
    {
        _1334 = 1.0;
    }
    float _1336 = _1334;
    bool _1338 = !_1332;
    float _1340 = _1336;
    if (!_1338)
    {
        bool _1342 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1344 = isnan(_1294);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1350 = _1346 || _1348;
        if (!_1350)
        {
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = _1294 + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1364 = 1.0 / _1358;
            float _1366 = _1354 * _1364;
            float _1368 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1340 = _1368;
            _1370 = true;
        }
        else
        {
            bool _1372 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1374 = isnan(_1294);
            bool _1376 = _1372 || _1374;
            bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1380 = _1376 || _1378;
            if (!_1380)
            {
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1294 + _1382;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1394 = 1.0 / _1388;
                float _1396 = _1384 * _1394;
                float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1340 = _1398;
                _1370 = true;
            }
            else
            {
                _1340 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1370 = false;
    float _1400 = _1340;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1262 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1408 = _1256 + _1406;
    float _1410 = -_756;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _514);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1264 + _1424;
    float _1428 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1408, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1432 = fma(_1426, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = -_756;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1428);
    float _1438 = -_730;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1442 = -_730;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _510);
    float _1446 = -_774;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1432);
    float _1450 = -_774;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1454 = _1440;
    float _1456 = _1436;
    float _1458 = _1448;
    if (!_1422)
    {
        float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1462 = _1444 + _1460;
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1466 = _1412 + _1464;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_516;
        float _1472 = _1470 + _1432;
        float _1474 = _1462 * _1462;
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1478 = _1452 + _1476;
        float _1480 = -_510;
        float _1482 = _1480 + _1430;
        float _1484 = fma(_1466, _1466, _1474);
        float _1486 = -_514;
        float _1488 = _1486 + _1428;
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1492 = fma(_1478, _1478, _1484);
        float _1494 = sqrt(_1492);
        float _1496 = 1.0 / _914;
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1502 = _1500 * _1468;
        float _1504 = _1502 * _1496;
        float _1506 = _1498 * _1504;
        float _1508 = _1472 * _1504;
        float _1510 = fma(_1488, _1506, _1412);
        float _1512 = fma(_1482, _1506, _1444);
        float _1514 = fma(_1498, _1508, _1452);
        _1454 = _1512;
        _1456 = _1510;
        _1458 = _1514;
    }
    float _1516 = _1454;
    float _1518 = _1456;
    float _1520 = _1458;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1516 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1518 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1520 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1536;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1544;
    float _1572 = _1546;
    if (_1558)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (_1558)
    {
        float _1578 = rsqrt(_1554);
        _1566 = _1578;
    }
    float _1580 = _1566;
    float _1582 = _1580;
    if (_1558)
    {
        float _1584 = _1562 * _1576;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _928 = _1588;
    }
    float _1590 = _928;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1558)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _514;
    float _1608 = _1604;
    if (_1558)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1544;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1558)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1558)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    float _1636 = _1614;
    if (_1558)
    {
        float _1638 = _1614 + (-1.0);
        _1628 = _1638;
    }
    float _1640 = _1628;
    float _1642 = _1640;
    if (_1558)
    {
        float _1644 = _1580 * _1632;
        _1570 = _1644;
    }
    float _1646 = _1570;
    if (!_1558)
    {
        _1634 = _1620;
    }
    float _1648 = _1634;
    float _1650 = _1648;
    if (_1558)
    {
        float _1652 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1652;
    }
    float _1654 = _1594;
    if (_1558)
    {
        float _1656 = _1546 * _1646;
        _1572 = _1656;
    }
    float _1658 = _1572;
    if (!_1558)
    {
        _1642 = _1548;
    }
    float _1660 = _1642;
    float _1662 = _1660;
    if (_1558)
    {
        float _1664 = _1548 * _1646;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (!_1558)
    {
        _1582 = _1550;
    }
    float _1668 = _1582;
    float _1670 = _1668;
    if (_1558)
    {
        float _1672 = fma(_1620, _1614, _1654);
        _1650 = _1672;
    }
    float _1674 = _1650;
    if (_1558)
    {
        float _1676 = _1658 * _1658;
        _1670 = _1676;
    }
    float _1678 = _1670;
    if (!_1558)
    {
        _1636 = _1552;
    }
    float _1680 = _1636;
    float _1682 = _1680;
    if (_1558)
    {
        float _1684 = _1666 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1692 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = _1688 + _1686;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1690);
    float _1704 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = rsqrt(_1694);
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1714 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1716 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    float _1724 = abs(_1710);
    float _1726 = log2(_1724);
    float _1728 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1730 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1732 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1738, _1718, 1.0);
    float _1742 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1744 = _1706 * _1658;
    float _1746 = _1706 * _1674;
    float _1748 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1750 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1706 * _1666;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = log2(_1740);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1770 = -_1754;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1774 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = fma(_1772, -0.5, 0.5);
    float _1782 = fma(_1772, 0.5, 0.5);
    float _1784 = exp2(_1764);
    float _1786 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1788 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1798 = 1.0 / _1778;
    float _1800 = fma(_1782, _1792, -0.212114393711090087890625);
    float _1802 = _1766 * 0.693147182464599609375;
    float _1804 = fma(_1782, _1800, 1.570728778839111328125);
    float _1806 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1780);
    float _1810 = -_1746;
    float _1812 = fma(_1784, _1790, _1810);
    float _1814 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1816 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = _1814 * _1798;
    float _1822 = _1816 * _1798;
    float _1824 = fma(_1820, 0.5, 0.5);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = _1808 * 0.636619746685028076171875;
    float _1830 = -_1804;
    float _1832 = fma(_1828, _1830, 1.0);
    float3 _4888 = float3(_1824, _1826, _1806);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4888, float3(0.0), isnan(_4888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4888, float3(0.0), isnan(_4888)), level(0.0)).x;
    float3 _4899 = float3(_1824, _1826, _1806);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4899, float3(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4899, float3(0.0), isnan(_4899)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float2 _4916 = float2(_1832, _1818);
    float3 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4916, float2(0.0), isnan(_4916)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4916, float2(0.0), isnan(_4916)), level(0.0)).xyz;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1861 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    float _1863 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1859);
    float _1865 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1861);
    float _1867 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1863);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1873 = 1.0 / _1869;
    float _1875 = _1871 + _1869;
    float _1877 = _1875 * _1873;
    float _1879 = _1877 * 0.5;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1883 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1881);
    float _1885 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = 1.0 / _1883;
    float _1901 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1885);
    float _1903 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    float _1905 = exp2(_1897);
    float _1907 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1909 = _1873;
    float _1911 = _1720;
    if (_1895)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = _1913;
    if (_1895)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1921 = _1899 * _1919;
    float _1923 = _1917;
    if (!_1895)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = fma(_1921, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        _1915 = _1971;
    }
    float _1973 = _1915;
    if (!_1895)
    {
        float _1975 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1977 = _1975 * 0.15915493667125701904296875;
        float _1979 = _1977 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1985 = _1983 * 0.15915493667125701904296875;
        float _1987 = _1977 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = 1.0 / _1981;
        float _1993 = _1985 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = _1985 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1995 * _1997;
        float _2005 = 1.0 / _2003;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2007;
        float _2011 = 1.0 / _2009;
        float _2013 = _2001 * _2005;
        float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2017 = fma(_1921, _2013, _2015);
        float _2019 = _2017 * _2011;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        float _2023 = -_2021;
        float _2025 = _2023 + 1.0;
        _1923 = _2025;
    }
    float _2027 = _1923;
    float _2029 = -_1905;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1973 > 0.0;
    bool _2035 = isnan(_1973);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    float _2043 = _1973 * _2027;
    float _2045 = _1778 * 0.5;
    float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2049 = _2027 <= 0.0;
    bool _2051 = !_2041;
    bool _2053 = _2049 || _2051;
    float _2055 = _1907 + _1778;
    float _2057 = _1814 + _1778;
    float _2059 = _2047 * _1834;
    float _2061 = -_2047;
    float _2063 = _2061 + 1.0;
    float _2065 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2067 = fma(_1816, -0.5, _2045);
    float _2069 = _1845 * _2059;
    float _2071 = _1855 * _2059;
    out.m_71.x = _1528;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    float _2073 = fma(_1851, _2069, _1839);
    float _2075 = fma(_1853, _2069, _1841);
    float _2077 = _1845 * _2063;
    float _2079 = _2055 * 0.5;
    float _2081 = _2057 * 0.5;
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2085 = fma(_1845, _2071, _1843);
    out.gl_Position.x = _1814;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1907;
    out.gl_Position.w = _1778;
    out.m_73.x = _2081;
    out.m_73.y = _2067;
    out.m_73.z = _2079;
    out.m_73.w = _1778;
    out.m_47.x = _2083;
    out.m_75.x = _2073;
    out.m_75.y = _2075;
    out.m_75.z = _2085;
    out.m_75.w = _2077;
    if (!_2053)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1370 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_110);
        out.gl_Position.z = _2144;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2214 = as_type<float>(_148);
        out.gl_Position.z = _2214;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _336;
    float _356 = -_352;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = _332 * _358;
    float _364 = -_332;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _340;
    float _370 = _304 * _354;
    float _372 = -_316;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = _352 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _320 * _368;
    float _394 = fma(_384, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _390 * _362;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _362;
    float _406 = _396 * _362;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _428 = fma(_420, _380, _418);
    float _430 = fma(_416, _380, _422);
    float _432 = fma(_424, _380, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_360;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _480 = in.m_53.y;
    float _482 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _484 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _486 = in.m_53.x;
    float _488 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _478);
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _482);
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _502 = _500 != 0;
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _510 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _512 = _474 * _128;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _520 = _510 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _524 = _514 + _522;
    float _526 = exp2(_512);
    float _528 = _470 * 2.0;
    float _530 = _520 * _520;
    float _532 = in.m_55.x;
    float _534 = _480 * 2.0;
    float _536 = _480 + _470;
    float _538 = fma(_524, _524, _530);
    float _540 = floor(_528);
    float _542 = _486 * 2.0;
    float _544 = _536 + (-1.0);
    float _546 = _486 + _480;
    bool _548 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_468);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _546 + (-1.0);
    float _562 = floor(_534);
    float _564 = -_526;
    float _566 = _564 + 1.0;
    bool _568 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = isnan(_468);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _582 = -_578;
    float _584 = _582 + 1.0;
    bool _586 = _540 > 0.0;
    float _588 = floor(_542);
    bool _590 = _540 >= 0.0;
    bool _592 = isnan(_540);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _602;
    int _606 = _598 ? 0 : 1;
    float _608 = _558 * _584;
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_606;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -_558;
    float _632 = _630 + 1.0;
    int _634 = _628;
    float _636 = _480;
    if (!_586)
    {
        int _638 = ~_606;
        int _640 = _638 + 1;
        _634 = _640;
    }
    int _642 = _634;
    float _644 = 1.0 / _622;
    bool _646 = _562 > 0.0;
    float _648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _650 = _516 + _648;
    bool _652 = _588 >= 0.0;
    bool _654 = isnan(_588);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_650, _650, _538);
    bool _668 = _588 > 0.0;
    bool _670 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(1.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = _660 ? 0 : 1;
    float _682 = rsqrt(_666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    int _694 = abs(_664);
    float _696 = _692 ? _566 : 0.0;
    float _698 = float(_694);
    float _700 = float(_642);
    if (_678)
    {
        float _702 = _696 * _644;
        _130 = _702;
    }
    float _704 = _130;
    int _706 = ~_680;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    int _712 = _710;
    if (!_668)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _698 * _700;
    int _722 = _618 ? 0 : 1;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = _520 * _682;
    bool _732 = !_498;
    int _734 = _732 ? 0 : 1;
    float _736 = _720 * (-2.0);
    int _738 = ~_722;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_730;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    int _748 = _742;
    if (!_646)
    {
        int _750 = ~_722;
        int _752 = _750 + 1;
        _748 = _752;
    }
    int _754 = _748;
    float _756 = _524 * _682;
    int _758 = abs(_734);
    float _760 = _746 * _746;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _762;
    float _766 = _604 * _604;
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _524);
    float _772 = float(_758);
    float _774 = _650 * _682;
    float _776 = fma(_764, _764, _766);
    bool _778 = !_502;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_770, _770, _760);
    float _784 = _486 + (-0.5);
    float _786 = -_774;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _650);
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _792;
    float _796 = fma(_580, _736, _580);
    float _798 = fma(_788, _788, _782);
    float _800 = fma(_736, _724, _724);
    float _802 = float(_718);
    float _804 = _480 + (-0.5);
    float _806 = fma(_794, _794, _776);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _810 = float(_754);
    float _812 = _772 * _802;
    float _814 = sqrt(_806);
    float _816 = _812 * (-2.0);
    float _818 = float(_790);
    float _820 = fma(_796, _704, _808);
    bool _822 = _480 > 0.5;
    float _824 = fma(_816, _726, _726);
    float _826 = fma(_600, _816, _600);
    float _828 = _486 + _470;
    float _830 = _818 * _810;
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    float _834 = _470 + (-0.5);
    float _836 = _828 + (-1.0);
    float _838 = _830 * (-2.0);
    float _840 = fma(_826, _704, _832);
    float _842 = sqrt(_798);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _846 = fma(_838, _728, _728);
    float _848 = in.m_51.x;
    float _850 = in.m_51.y;
    float _852 = in.m_51.z;
    float _854 = _820 * 0.15915493667125701904296875;
    float _856 = fma(_844, _838, _844);
    float _858 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _846);
    float _860 = _854 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_856, _704, _858);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    float _876 = _866 * 0.15915493667125701904296875;
    float _878 = precise::max(_814, 10.0);
    float _880 = in.m_59.x;
    float _882 = in.m_59.y;
    float _884 = in.m_59.z;
    float _886 = _854 * 6.283185482025146484375;
    float _888 = cos(_886);
    bool _890 = _486 > 0.5;
    bool _892 = _890 && _870;
    float _894 = _814 * 0.039999999105930328369140625;
    float _896 = precise::min(_878, 50.0);
    float _898 = precise::max(_894, 1.0);
    float _900 = _864 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = 0.0;
    if (_870)
    {
        _904 = _532;
    }
    float _906 = _904;
    float _908 = _438 * _852;
    float _910 = _436 * _850;
    float _912 = _434 * _848;
    float _914 = _682 * _842;
    float _916 = precise::min(_898, 2.0);
    float _918 = _864 * 6.283185482025146484375;
    float _920 = cos(_918);
    float _922 = fma(_896, 0.25, -2.5);
    float _924 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _906;
    float _928 = _914;
    if (_892)
    {
        float _930 = -_906;
        float _932 = _930 + 1.0;
        _926 = _932;
    }
    float _934 = _926;
    if (!_870)
    {
        _636 = _532;
    }
    float _936 = _636;
    bool _938 = _882 != 0.0;
    bool _940 = isnan(_882);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = _876 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _888 * _902;
    float _954 = _862 * _902;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    bool _958 = _880 == 0.0;
    bool _960 = !_946;
    bool _962 = _958 && _960;
    float _964 = _936;
    if (_870)
    {
        _964 = _934;
    }
    float _966 = _964;
    float _968 = _876 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _862 * _920;
    bool _974 = _884 == 0.0;
    bool _976 = _974 && _962;
    float _978 = _862 * _950;
    float _980 = _888 * _920;
    float _982 = _888 * _950;
    float _984 = _920 * _950;
    float _986 = _902 * _950;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _990 = _924 * _914;
    float _992 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -_952;
    float _996 = fma(_970, _972, _994);
    float _998 = -_972;
    float _1000 = fma(_970, _952, _998);
    float _1002 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _1006 = _990 * _988;
    float _1008 = _992 * _914;
    float _1010 = _1002 * _914;
    float _1012 = fma(_970, _980, _954);
    float _1014 = _982 * _1006;
    float _1016 = _1008 * _956;
    float _1018 = _1010 * _1004;
    float _1020 = -_1006;
    float _1022 = _970 * _1020;
    float _1024 = _978 * _1006;
    float _1026 = fma(_970, _954, _980);
    float _1028 = fma(_1012, _1018, _1014);
    float _1030 = fma(_984, _1018, _1022);
    float _1032 = fma(_996, _1018, _1024);
    float _1034 = rsqrt(_806);
    float _1036 = fma(_1000, _1016, _1028);
    float _1038 = fma(_986, _1016, _1030);
    float _1040 = fma(_1026, _1016, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1046 = in.m_55.y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1042);
    float _1052 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1044);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1050);
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1064 = _514 + _1058;
    float _1066 = _516 + _1060;
    float _1068 = 1.0 / _1056;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1078 = _1066 + _1076;
    float _1080 = _1034 * _922;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1082;
    float _1086 = fma(_1074, _916, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1088 = fma(_1078, _916, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1090 = _510 + _1070;
    float _1092 = -_1080;
    float _1094 = fma(_764, _1092, _1086);
    float _1096 = -_1080;
    float _1098 = fma(_794, _1096, _1088);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _468 + _1100;
    float _1104 = -_1046;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1110 = _1094 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1114 = _1098 + _1112;
    float _1116 = _1084 * _1068;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = _1090 + _1118;
    float _1122 = _1110 * _1110;
    float _1124 = _1114 * _1114;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1134 = _1046;
    float _1136 = _1122;
    float _1138 = _1124;
    float _1140 = _1094;
    float _1142 = _1098;
    if (_874)
    {
        float _1144 = _822 ? _1106 : _1046;
        _1134 = _1144;
    }
    float _1146 = _1134;
    float _1148 = _1122 + _1124;
    float _1150 = fma(_1120, _916, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1152 = _1132 * _608;
    float _1154 = sqrt(_1148);
    float _1156 = -_1080;
    float _1158 = fma(_604, _1156, _1150);
    float _1160 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1152);
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1128;
    float _1166 = _1126;
    float _1168 = _1130;
    if (!_976)
    {
        float _1170 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_976)
    {
        float _1174 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1126);
        _1166 = _1174;
    }
    float _1176 = _1166;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1180 = _1176;
    if (!_976)
    {
        float _1182 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1168 = _1182;
    }
    float _1184 = _1168;
    float _1186 = -_1172;
    float _1188 = _970 * _1186;
    float _1190 = _982 * _1172;
    float _1192 = _978 * _1172;
    float _1194 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1160);
    float _1196 = fma(_984, _1176, _1188);
    float _1198 = fma(_1012, _1176, _1190);
    float _1200 = fma(_996, _1176, _1192);
    if (!_1162)
    {
        _1180 = _1158;
    }
    float _1202 = _1180;
    bool _1204 = !_1162;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1154 + _1210;
        float _1214 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1148);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1114, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1158, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1136 = _1252;
        _1138 = _1254;
        _1140 = _1236;
        _1142 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1136;
    float _1260 = _1138;
    float _1262 = _1140;
    float _1264 = _1142;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1268 = _1256 + _1266;
    float _1270 = fma(_1000, _1184, _1198);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = fma(_986, _1184, _1196);
    float _1276 = fma(_1268, _1268, _1258);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1280 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = fma(_1026, _1184, _1200);
    float _1284 = _1276 + _1260;
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1278);
    float _1288 = _1280 * _1178;
    float _1290 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1292 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1294 = sqrt(_1284);
    float _1296 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1290);
    float _1300 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1292);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1296 * _1272;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1298);
    float _1314 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1300);
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1286);
    out.m_63.x = _1310;
    out.m_63.y = _1288;
    bool _1324 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1326 = isnan(_1294);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1332 = _1328 || _1330;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1316;
    out.m_67.y = _1318;
    out.m_67.z = _1320;
    out.m_67.w = _1308;
    out.m_69.x = _1312;
    out.m_69.y = _1314;
    out.m_69.z = _1322;
    float _1334 = _1298;
    if (!_1332)
    {
        _1334 = 1.0;
    }
    float _1336 = _1334;
    bool _1338 = !_1332;
    float _1340 = _1336;
    if (!_1338)
    {
        bool _1342 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1344 = isnan(_1294);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1350 = _1346 || _1348;
        if (!_1350)
        {
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = _1294 + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1364 = 1.0 / _1358;
            float _1366 = _1354 * _1364;
            float _1368 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1340 = _1368;
            _1370 = true;
        }
        else
        {
            bool _1372 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1374 = isnan(_1294);
            bool _1376 = _1372 || _1374;
            bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1380 = _1376 || _1378;
            if (!_1380)
            {
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1294 + _1382;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1394 = 1.0 / _1388;
                float _1396 = _1384 * _1394;
                float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1340 = _1398;
                _1370 = true;
            }
            else
            {
                _1340 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1370 = false;
    float _1400 = _1340;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1262 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1408 = _1256 + _1406;
    float _1410 = -_756;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _514);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1264 + _1424;
    float _1428 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1408, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1432 = fma(_1426, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = -_756;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1428);
    float _1438 = -_730;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1442 = -_730;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _510);
    float _1446 = -_774;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1432);
    float _1450 = -_774;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1454 = _1440;
    float _1456 = _1436;
    float _1458 = _1448;
    if (!_1422)
    {
        float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1462 = _1444 + _1460;
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1466 = _1412 + _1464;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_516;
        float _1472 = _1470 + _1432;
        float _1474 = _1462 * _1462;
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1478 = _1452 + _1476;
        float _1480 = -_510;
        float _1482 = _1480 + _1430;
        float _1484 = fma(_1466, _1466, _1474);
        float _1486 = -_514;
        float _1488 = _1486 + _1428;
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1492 = fma(_1478, _1478, _1484);
        float _1494 = sqrt(_1492);
        float _1496 = 1.0 / _914;
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1502 = _1500 * _1468;
        float _1504 = _1502 * _1496;
        float _1506 = _1498 * _1504;
        float _1508 = _1472 * _1504;
        float _1510 = fma(_1488, _1506, _1412);
        float _1512 = fma(_1482, _1506, _1444);
        float _1514 = fma(_1498, _1508, _1452);
        _1454 = _1512;
        _1456 = _1510;
        _1458 = _1514;
    }
    float _1516 = _1454;
    float _1518 = _1456;
    float _1520 = _1458;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1516 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1518 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1520 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1536;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1544;
    float _1572 = _1546;
    if (_1558)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (_1558)
    {
        float _1578 = rsqrt(_1554);
        _1566 = _1578;
    }
    float _1580 = _1566;
    float _1582 = _1580;
    if (_1558)
    {
        float _1584 = _1562 * _1576;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _928 = _1588;
    }
    float _1590 = _928;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1558)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _514;
    float _1608 = _1604;
    if (_1558)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1544;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1558)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1558)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    float _1636 = _1614;
    if (_1558)
    {
        float _1638 = _1614 + (-1.0);
        _1628 = _1638;
    }
    float _1640 = _1628;
    float _1642 = _1640;
    if (_1558)
    {
        float _1644 = _1580 * _1632;
        _1570 = _1644;
    }
    float _1646 = _1570;
    if (!_1558)
    {
        _1634 = _1620;
    }
    float _1648 = _1634;
    float _1650 = _1648;
    if (_1558)
    {
        float _1652 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1652;
    }
    float _1654 = _1594;
    if (_1558)
    {
        float _1656 = _1546 * _1646;
        _1572 = _1656;
    }
    float _1658 = _1572;
    if (!_1558)
    {
        _1642 = _1548;
    }
    float _1660 = _1642;
    float _1662 = _1660;
    if (_1558)
    {
        float _1664 = _1548 * _1646;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (!_1558)
    {
        _1582 = _1550;
    }
    float _1668 = _1582;
    float _1670 = _1668;
    if (_1558)
    {
        float _1672 = fma(_1620, _1614, _1654);
        _1650 = _1672;
    }
    float _1674 = _1650;
    if (_1558)
    {
        float _1676 = _1658 * _1658;
        _1670 = _1676;
    }
    float _1678 = _1670;
    if (!_1558)
    {
        _1636 = _1552;
    }
    float _1680 = _1636;
    float _1682 = _1680;
    if (_1558)
    {
        float _1684 = _1666 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1692 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = _1688 + _1686;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1690);
    float _1704 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = rsqrt(_1694);
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1714 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1716 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    float _1724 = abs(_1710);
    float _1726 = log2(_1724);
    float _1728 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1730 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1732 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1738, _1718, 1.0);
    float _1742 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1744 = _1706 * _1658;
    float _1746 = _1706 * _1674;
    float _1748 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1750 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1706 * _1666;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = log2(_1740);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1770 = -_1754;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1774 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = fma(_1772, -0.5, 0.5);
    float _1782 = fma(_1772, 0.5, 0.5);
    float _1784 = exp2(_1764);
    float _1786 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1788 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1798 = 1.0 / _1778;
    float _1800 = fma(_1782, _1792, -0.212114393711090087890625);
    float _1802 = _1766 * 0.693147182464599609375;
    float _1804 = fma(_1782, _1800, 1.570728778839111328125);
    float _1806 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1780);
    float _1810 = -_1746;
    float _1812 = fma(_1784, _1790, _1810);
    float _1814 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1816 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = _1814 * _1798;
    float _1822 = _1816 * _1798;
    float _1824 = fma(_1820, 0.5, 0.5);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = _1808 * 0.636619746685028076171875;
    float _1830 = -_1804;
    float _1832 = fma(_1828, _1830, 1.0);
    float3 _4888 = float3(_1824, _1826, _1806);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4888, float3(0.0), isnan(_4888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4888, float3(0.0), isnan(_4888)), level(0.0)).x;
    float3 _4899 = float3(_1824, _1826, _1806);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4899, float3(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4899, float3(0.0), isnan(_4899)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float2 _4916 = float2(_1832, _1818);
    float3 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4916, float2(0.0), isnan(_4916)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4916, float2(0.0), isnan(_4916)), level(0.0)).xyz;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1861 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    float _1863 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1859);
    float _1865 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1861);
    float _1867 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1863);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1873 = 1.0 / _1869;
    float _1875 = _1871 + _1869;
    float _1877 = _1875 * _1873;
    float _1879 = _1877 * 0.5;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1883 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1881);
    float _1885 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = 1.0 / _1883;
    float _1901 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1885);
    float _1903 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    float _1905 = exp2(_1897);
    float _1907 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1909 = _1873;
    float _1911 = _1720;
    if (_1895)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = _1913;
    if (_1895)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1921 = _1899 * _1919;
    float _1923 = _1917;
    if (!_1895)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = fma(_1921, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        _1915 = _1971;
    }
    float _1973 = _1915;
    if (!_1895)
    {
        float _1975 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1977 = _1975 * 0.15915493667125701904296875;
        float _1979 = _1977 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1985 = _1983 * 0.15915493667125701904296875;
        float _1987 = _1977 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = 1.0 / _1981;
        float _1993 = _1985 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = _1985 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1995 * _1997;
        float _2005 = 1.0 / _2003;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2007;
        float _2011 = 1.0 / _2009;
        float _2013 = _2001 * _2005;
        float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2017 = fma(_1921, _2013, _2015);
        float _2019 = _2017 * _2011;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        float _2023 = -_2021;
        float _2025 = _2023 + 1.0;
        _1923 = _2025;
    }
    float _2027 = _1923;
    float _2029 = -_1905;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1973 > 0.0;
    bool _2035 = isnan(_1973);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    float _2043 = _1973 * _2027;
    float _2045 = _1778 * 0.5;
    float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2049 = _2027 <= 0.0;
    bool _2051 = !_2041;
    bool _2053 = _2049 || _2051;
    float _2055 = _1907 + _1778;
    float _2057 = _1814 + _1778;
    float _2059 = _2047 * _1834;
    float _2061 = -_2047;
    float _2063 = _2061 + 1.0;
    float _2065 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2067 = fma(_1816, -0.5, _2045);
    float _2069 = _1845 * _2059;
    float _2071 = _1855 * _2059;
    out.m_71.x = _1528;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    float _2073 = fma(_1851, _2069, _1839);
    float _2075 = fma(_1853, _2069, _1841);
    float _2077 = _1845 * _2063;
    float _2079 = _2055 * 0.5;
    float _2081 = _2057 * 0.5;
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2085 = fma(_1845, _2071, _1843);
    out.gl_Position.x = _1814;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1907;
    out.gl_Position.w = _1778;
    out.m_73.x = _2081;
    out.m_73.y = _2067;
    out.m_73.z = _2079;
    out.m_73.w = _1778;
    out.m_47.x = _2083;
    out.m_75.x = _2073;
    out.m_75.y = _2075;
    out.m_75.z = _2085;
    out.m_75.w = _2077;
    if (!_2053)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1370 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_110);
        out.gl_Position.z = _2144;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2214 = as_type<float>(_148);
        out.gl_Position.z = _2214;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.w;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
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
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
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
    float _290;
    if (!_272)
    {
        float _274 = in.m_53.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_94);
        float _296 = 1.0 / _294;
        float _298 = _128 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _336;
    float _356 = -_352;
    float _358 = _356 + 1.0;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = _332 * _358;
    float _364 = -_332;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _340;
    float _370 = _304 * _354;
    float _372 = -_316;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = _352 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = _320 * _368;
    float _394 = fma(_384, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = _390 * _362;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = _394 * _362;
    float _406 = _396 * _362;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_402, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _420 = fma(_410, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _424 = fma(_414, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _428 = fma(_420, _380, _418);
    float _430 = fma(_416, _380, _422);
    float _432 = fma(_424, _380, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    bool _440 = !_360;
    float _458;
    if (!_440)
    {
        float _442 = in.m_53.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_94);
        float _464 = 1.0 / _462;
        float _466 = _128 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = in.m_53.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _478 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _480 = in.m_53.y;
    float _482 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _484 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _476);
    float _486 = in.m_53.x;
    float _488 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _478);
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _482);
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _502 = _500 != 0;
    float _504 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _506 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _508 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _510 = _504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _512 = _474 * _128;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _520 = _510 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _524 = _514 + _522;
    float _526 = exp2(_512);
    float _528 = _470 * 2.0;
    float _530 = _520 * _520;
    float _532 = in.m_55.x;
    float _534 = _480 * 2.0;
    float _536 = _480 + _470;
    float _538 = fma(_524, _524, _530);
    float _540 = floor(_528);
    float _542 = _486 * 2.0;
    float _544 = _536 + (-1.0);
    float _546 = _486 + _480;
    bool _548 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_468);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _546 + (-1.0);
    float _562 = floor(_534);
    float _564 = -_526;
    float _566 = _564 + 1.0;
    bool _568 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _570 = isnan(_468);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _582 = -_578;
    float _584 = _582 + 1.0;
    bool _586 = _540 > 0.0;
    float _588 = floor(_542);
    bool _590 = _540 >= 0.0;
    bool _592 = isnan(_540);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _602;
    int _606 = _598 ? 0 : 1;
    float _608 = _558 * _584;
    bool _610 = _562 >= 0.0;
    bool _612 = isnan(_562);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.0);
    bool _618 = _614 || _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    int _624 = ~_606;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -_558;
    float _632 = _630 + 1.0;
    int _634 = _628;
    float _636 = _480;
    if (!_586)
    {
        int _638 = ~_606;
        int _640 = _638 + 1;
        _634 = _640;
    }
    int _642 = _634;
    float _644 = 1.0 / _622;
    bool _646 = _562 > 0.0;
    float _648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _650 = _516 + _648;
    bool _652 = _588 >= 0.0;
    bool _654 = isnan(_588);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_650, _650, _538);
    bool _668 = _588 > 0.0;
    bool _670 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _672 = isnan(1.0);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _678 = _674 || _676;
    int _680 = _660 ? 0 : 1;
    float _682 = rsqrt(_666);
    bool _684 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _692 = _688 || _690;
    int _694 = abs(_664);
    float _696 = _692 ? _566 : 0.0;
    float _698 = float(_694);
    float _700 = float(_642);
    if (_678)
    {
        float _702 = _696 * _644;
        _130 = _702;
    }
    float _704 = _130;
    int _706 = ~_680;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    int _712 = _710;
    if (!_668)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _698 * _700;
    int _722 = _618 ? 0 : 1;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = _520 * _682;
    bool _732 = !_498;
    int _734 = _732 ? 0 : 1;
    float _736 = _720 * (-2.0);
    int _738 = ~_722;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_730;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    int _748 = _742;
    if (!_646)
    {
        int _750 = ~_722;
        int _752 = _750 + 1;
        _748 = _752;
    }
    int _754 = _748;
    float _756 = _524 * _682;
    int _758 = abs(_734);
    float _760 = _746 * _746;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _762;
    float _766 = _604 * _604;
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _524);
    float _772 = float(_758);
    float _774 = _650 * _682;
    float _776 = fma(_764, _764, _766);
    bool _778 = !_502;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_770, _770, _760);
    float _784 = _486 + (-0.5);
    float _786 = -_774;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _650);
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _792;
    float _796 = fma(_580, _736, _580);
    float _798 = fma(_788, _788, _782);
    float _800 = fma(_736, _724, _724);
    float _802 = float(_718);
    float _804 = _480 + (-0.5);
    float _806 = fma(_794, _794, _776);
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _800);
    float _810 = float(_754);
    float _812 = _772 * _802;
    float _814 = sqrt(_806);
    float _816 = _812 * (-2.0);
    float _818 = float(_790);
    float _820 = fma(_796, _704, _808);
    bool _822 = _480 > 0.5;
    float _824 = fma(_816, _726, _726);
    float _826 = fma(_600, _816, _600);
    float _828 = _486 + _470;
    float _830 = _818 * _810;
    float _832 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[196].y, _824);
    float _834 = _470 + (-0.5);
    float _836 = _828 + (-1.0);
    float _838 = _830 * (-2.0);
    float _840 = fma(_826, _704, _832);
    float _842 = sqrt(_798);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _846 = fma(_838, _728, _728);
    float _848 = in.m_51.x;
    float _850 = in.m_51.y;
    float _852 = in.m_51.z;
    float _854 = _820 * 0.15915493667125701904296875;
    float _856 = fma(_844, _838, _844);
    float _858 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].z, _846);
    float _860 = _854 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = _840 * 0.15915493667125701904296875;
    float _866 = fma(_856, _704, _858);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    float _876 = _866 * 0.15915493667125701904296875;
    float _878 = precise::max(_814, 10.0);
    float _880 = in.m_59.x;
    float _882 = in.m_59.y;
    float _884 = in.m_59.z;
    float _886 = _854 * 6.283185482025146484375;
    float _888 = cos(_886);
    bool _890 = _486 > 0.5;
    bool _892 = _890 && _870;
    float _894 = _814 * 0.039999999105930328369140625;
    float _896 = precise::min(_878, 50.0);
    float _898 = precise::max(_894, 1.0);
    float _900 = _864 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = 0.0;
    if (_870)
    {
        _904 = _532;
    }
    float _906 = _904;
    float _908 = _438 * _852;
    float _910 = _436 * _850;
    float _912 = _434 * _848;
    float _914 = _682 * _842;
    float _916 = precise::min(_898, 2.0);
    float _918 = _864 * 6.283185482025146484375;
    float _920 = cos(_918);
    float _922 = fma(_896, 0.25, -2.5);
    float _924 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _906;
    float _928 = _914;
    if (_892)
    {
        float _930 = -_906;
        float _932 = _930 + 1.0;
        _926 = _932;
    }
    float _934 = _926;
    if (!_870)
    {
        _636 = _532;
    }
    float _936 = _636;
    bool _938 = _882 != 0.0;
    bool _940 = isnan(_882);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = _876 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _888 * _902;
    float _954 = _862 * _902;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    bool _958 = _880 == 0.0;
    bool _960 = !_946;
    bool _962 = _958 && _960;
    float _964 = _936;
    if (_870)
    {
        _964 = _934;
    }
    float _966 = _964;
    float _968 = _876 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _862 * _920;
    bool _974 = _884 == 0.0;
    bool _976 = _974 && _962;
    float _978 = _862 * _950;
    float _980 = _888 * _920;
    float _982 = _888 * _950;
    float _984 = _920 * _950;
    float _986 = _902 * _950;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _990 = _924 * _914;
    float _992 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = -_952;
    float _996 = fma(_970, _972, _994);
    float _998 = -_972;
    float _1000 = fma(_970, _952, _998);
    float _1002 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _1006 = _990 * _988;
    float _1008 = _992 * _914;
    float _1010 = _1002 * _914;
    float _1012 = fma(_970, _980, _954);
    float _1014 = _982 * _1006;
    float _1016 = _1008 * _956;
    float _1018 = _1010 * _1004;
    float _1020 = -_1006;
    float _1022 = _970 * _1020;
    float _1024 = _978 * _1006;
    float _1026 = fma(_970, _954, _980);
    float _1028 = fma(_1012, _1018, _1014);
    float _1030 = fma(_984, _1018, _1022);
    float _1032 = fma(_996, _1018, _1024);
    float _1034 = rsqrt(_806);
    float _1036 = fma(_1000, _1016, _1028);
    float _1038 = fma(_986, _1016, _1030);
    float _1040 = fma(_1026, _1016, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1046 = in.m_55.y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1042);
    float _1052 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1044);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1058 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1050);
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1048);
    float _1064 = _514 + _1058;
    float _1066 = _516 + _1060;
    float _1068 = 1.0 / _1056;
    float _1070 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1072 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1078 = _1066 + _1076;
    float _1080 = _1034 * _922;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1082;
    float _1086 = fma(_1074, _916, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1088 = fma(_1078, _916, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1090 = _510 + _1070;
    float _1092 = -_1080;
    float _1094 = fma(_764, _1092, _1086);
    float _1096 = -_1080;
    float _1098 = fma(_794, _1096, _1088);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _468 + _1100;
    float _1104 = -_1046;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1110 = _1094 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1114 = _1098 + _1112;
    float _1116 = _1084 * _1068;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = _1090 + _1118;
    float _1122 = _1110 * _1110;
    float _1124 = _1114 * _1114;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1134 = _1046;
    float _1136 = _1122;
    float _1138 = _1124;
    float _1140 = _1094;
    float _1142 = _1098;
    if (_874)
    {
        float _1144 = _822 ? _1106 : _1046;
        _1134 = _1144;
    }
    float _1146 = _1134;
    float _1148 = _1122 + _1124;
    float _1150 = fma(_1120, _916, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1152 = _1132 * _608;
    float _1154 = sqrt(_1148);
    float _1156 = -_1080;
    float _1158 = fma(_604, _1156, _1150);
    float _1160 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1152);
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1128;
    float _1166 = _1126;
    float _1168 = _1130;
    if (!_976)
    {
        float _1170 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_976)
    {
        float _1174 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1126);
        _1166 = _1174;
    }
    float _1176 = _1166;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1180 = _1176;
    if (!_976)
    {
        float _1182 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1168 = _1182;
    }
    float _1184 = _1168;
    float _1186 = -_1172;
    float _1188 = _970 * _1186;
    float _1190 = _982 * _1172;
    float _1192 = _978 * _1172;
    float _1194 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1160);
    float _1196 = fma(_984, _1176, _1188);
    float _1198 = fma(_1012, _1176, _1190);
    float _1200 = fma(_996, _1176, _1192);
    if (!_1162)
    {
        _1180 = _1158;
    }
    float _1202 = _1180;
    bool _1204 = !_1162;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1154 + _1210;
        float _1214 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1148);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1110, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1114, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1158, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1136 = _1252;
        _1138 = _1254;
        _1140 = _1236;
        _1142 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1136;
    float _1260 = _1138;
    float _1262 = _1140;
    float _1264 = _1142;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1268 = _1256 + _1266;
    float _1270 = fma(_1000, _1184, _1198);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1274 = fma(_986, _1184, _1196);
    float _1276 = fma(_1268, _1268, _1258);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1280 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1282 = fma(_1026, _1184, _1200);
    float _1284 = _1276 + _1260;
    float _1286 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1278);
    float _1288 = _1280 * _1178;
    float _1290 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1292 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1294 = sqrt(_1284);
    float _1296 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1298 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1290);
    float _1300 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1292);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1308 = _1194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1296 * _1272;
    float _1312 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1298);
    float _1314 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1300);
    float _1316 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1286);
    out.m_63.x = _1310;
    out.m_63.y = _1288;
    bool _1324 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1326 = isnan(_1294);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1332 = _1328 || _1330;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1316;
    out.m_67.y = _1318;
    out.m_67.z = _1320;
    out.m_67.w = _1308;
    out.m_69.x = _1312;
    out.m_69.y = _1314;
    out.m_69.z = _1322;
    float _1334 = _1298;
    if (!_1332)
    {
        _1334 = 1.0;
    }
    float _1336 = _1334;
    bool _1338 = !_1332;
    float _1340 = _1336;
    if (!_1338)
    {
        bool _1342 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1344 = isnan(_1294);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1350 = _1346 || _1348;
        if (!_1350)
        {
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = _1294 + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1362 = _1360 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1364 = 1.0 / _1358;
            float _1366 = _1354 * _1364;
            float _1368 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1340 = _1368;
            _1370 = true;
        }
        else
        {
            bool _1372 = _1294 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1374 = isnan(_1294);
            bool _1376 = _1372 || _1374;
            bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1380 = _1376 || _1378;
            if (!_1380)
            {
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1294 + _1382;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1394 = 1.0 / _1388;
                float _1396 = _1384 * _1394;
                float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1340 = _1398;
                _1370 = true;
            }
            else
            {
                _1340 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1370 = false;
    float _1400 = _1340;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1262 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1408 = _1256 + _1406;
    float _1410 = -_756;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _514);
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1264 + _1424;
    float _1428 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1408, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1432 = fma(_1426, _1400, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1434 = -_756;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1428);
    float _1438 = -_730;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1430);
    float _1442 = -_730;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _510);
    float _1446 = -_774;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1432);
    float _1450 = -_774;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _1454 = _1440;
    float _1456 = _1436;
    float _1458 = _1448;
    if (!_1422)
    {
        float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1462 = _1444 + _1460;
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1466 = _1412 + _1464;
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1470 = -_516;
        float _1472 = _1470 + _1432;
        float _1474 = _1462 * _1462;
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1478 = _1452 + _1476;
        float _1480 = -_510;
        float _1482 = _1480 + _1430;
        float _1484 = fma(_1466, _1466, _1474);
        float _1486 = -_514;
        float _1488 = _1486 + _1428;
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1492 = fma(_1478, _1478, _1484);
        float _1494 = sqrt(_1492);
        float _1496 = 1.0 / _914;
        float _1498 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1500 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1502 = _1500 * _1468;
        float _1504 = _1502 * _1496;
        float _1506 = _1498 * _1504;
        float _1508 = _1472 * _1504;
        float _1510 = fma(_1488, _1506, _1412);
        float _1512 = fma(_1482, _1506, _1444);
        float _1514 = fma(_1498, _1508, _1452);
        _1454 = _1512;
        _1456 = _1510;
        _1458 = _1514;
    }
    float _1516 = _1454;
    float _1518 = _1456;
    float _1520 = _1458;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1516 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1518 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1520 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1536;
    float _1566 = _1554;
    float _1568 = _1562;
    float _1570 = _1544;
    float _1572 = _1546;
    if (_1558)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (_1558)
    {
        float _1578 = rsqrt(_1554);
        _1566 = _1578;
    }
    float _1580 = _1566;
    float _1582 = _1580;
    if (_1558)
    {
        float _1584 = _1562 * _1576;
        _1568 = _1584;
    }
    float _1586 = _1568;
    if (_1558)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _928 = _1588;
    }
    float _1590 = _928;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1558)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _514;
    float _1608 = _1604;
    if (_1558)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1544;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1558)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1558)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = _1632;
    float _1636 = _1614;
    if (_1558)
    {
        float _1638 = _1614 + (-1.0);
        _1628 = _1638;
    }
    float _1640 = _1628;
    float _1642 = _1640;
    if (_1558)
    {
        float _1644 = _1580 * _1632;
        _1570 = _1644;
    }
    float _1646 = _1570;
    if (!_1558)
    {
        _1634 = _1620;
    }
    float _1648 = _1634;
    float _1650 = _1648;
    if (_1558)
    {
        float _1652 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1652;
    }
    float _1654 = _1594;
    if (_1558)
    {
        float _1656 = _1546 * _1646;
        _1572 = _1656;
    }
    float _1658 = _1572;
    if (!_1558)
    {
        _1642 = _1548;
    }
    float _1660 = _1642;
    float _1662 = _1660;
    if (_1558)
    {
        float _1664 = _1548 * _1646;
        _1662 = _1664;
    }
    float _1666 = _1662;
    if (!_1558)
    {
        _1582 = _1550;
    }
    float _1668 = _1582;
    float _1670 = _1668;
    if (_1558)
    {
        float _1672 = fma(_1620, _1614, _1654);
        _1650 = _1672;
    }
    float _1674 = _1650;
    if (_1558)
    {
        float _1676 = _1658 * _1658;
        _1670 = _1676;
    }
    float _1678 = _1670;
    if (!_1558)
    {
        _1636 = _1552;
    }
    float _1680 = _1636;
    float _1682 = _1680;
    if (_1558)
    {
        float _1684 = _1666 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1692 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = _1688 + _1686;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1690);
    float _1704 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = rsqrt(_1694);
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1714 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1716 = _1516 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    float _1724 = abs(_1710);
    float _1726 = log2(_1724);
    float _1728 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1730 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1732 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1738, _1718, 1.0);
    float _1742 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1744 = _1706 * _1658;
    float _1746 = _1706 * _1674;
    float _1748 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1750 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1706 * _1666;
    float _1756 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = log2(_1740);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1770 = -_1754;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1774 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1776 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = fma(_1772, -0.5, 0.5);
    float _1782 = fma(_1772, 0.5, 0.5);
    float _1784 = exp2(_1764);
    float _1786 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1774);
    float _1788 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = _1746 + 1.0;
    float _1792 = fma(_1782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1798 = 1.0 / _1778;
    float _1800 = fma(_1782, _1792, -0.212114393711090087890625);
    float _1802 = _1766 * 0.693147182464599609375;
    float _1804 = fma(_1782, _1800, 1.570728778839111328125);
    float _1806 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1780);
    float _1810 = -_1746;
    float _1812 = fma(_1784, _1790, _1810);
    float _1814 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1816 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1818 = fma(_1812, 0.5, 0.5);
    float _1820 = _1814 * _1798;
    float _1822 = _1816 * _1798;
    float _1824 = fma(_1820, 0.5, 0.5);
    float _1826 = fma(_1822, -0.5, 0.5);
    float _1828 = _1808 * 0.636619746685028076171875;
    float _1830 = -_1804;
    float _1832 = fma(_1828, _1830, 1.0);
    float3 _4888 = float3(_1824, _1826, _1806);
    float _1834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4888, float3(0.0), isnan(_4888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4888, float3(0.0), isnan(_4888)), level(0.0)).x;
    float3 _4899 = float3(_1824, _1826, _1806);
    float4 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4899, float3(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4899, float3(0.0), isnan(_4899)), level(0.0)).xyzw;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1837.w;
    float2 _4916 = float2(_1832, _1818);
    float3 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4916, float2(0.0), isnan(_4916)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4916, float2(0.0), isnan(_4916)), level(0.0)).xyz;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1859 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1861 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1857);
    float _1863 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1859);
    float _1865 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1861);
    float _1867 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1863);
    float _1869 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1871 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1873 = 1.0 / _1869;
    float _1875 = _1871 + _1869;
    float _1877 = _1875 * _1873;
    float _1879 = _1877 * 0.5;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1883 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1881);
    float _1885 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = 1.0 / _1883;
    float _1901 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1885);
    float _1903 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    float _1905 = exp2(_1897);
    float _1907 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1903);
    float _1909 = _1873;
    float _1911 = _1720;
    if (_1895)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = _1913;
    if (_1895)
    {
        _1911 = 1.0;
    }
    float _1917 = _1911;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1921 = _1899 * _1919;
    float _1923 = _1917;
    if (!_1895)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = fma(_1921, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        _1915 = _1971;
    }
    float _1973 = _1915;
    if (!_1895)
    {
        float _1975 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1977 = _1975 * 0.15915493667125701904296875;
        float _1979 = _1977 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1985 = _1983 * 0.15915493667125701904296875;
        float _1987 = _1977 * 6.283185482025146484375;
        float _1989 = sin(_1987);
        float _1991 = 1.0 / _1981;
        float _1993 = _1985 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = _1985 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1995 * _1997;
        float _2005 = 1.0 / _2003;
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2009 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2007;
        float _2011 = 1.0 / _2009;
        float _2013 = _2001 * _2005;
        float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2017 = fma(_1921, _2013, _2015);
        float _2019 = _2017 * _2011;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        float _2023 = -_2021;
        float _2025 = _2023 + 1.0;
        _1923 = _2025;
    }
    float _2027 = _1923;
    float _2029 = -_1905;
    float _2031 = _2029 + 1.0;
    bool _2033 = _1973 > 0.0;
    bool _2035 = isnan(_1973);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    float _2043 = _1973 * _2027;
    float _2045 = _1778 * 0.5;
    float _2047 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2049 = _2027 <= 0.0;
    bool _2051 = !_2041;
    bool _2053 = _2049 || _2051;
    float _2055 = _1907 + _1778;
    float _2057 = _1814 + _1778;
    float _2059 = _2047 * _1834;
    float _2061 = -_2047;
    float _2063 = _2061 + 1.0;
    float _2065 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2067 = fma(_1816, -0.5, _2045);
    float _2069 = _1845 * _2059;
    float _2071 = _1855 * _2059;
    out.m_71.x = _1528;
    out.m_71.y = _1524;
    out.m_71.z = _1532;
    float _2073 = fma(_1851, _2069, _1839);
    float _2075 = fma(_1853, _2069, _1841);
    float _2077 = _1845 * _2063;
    float _2079 = _2055 * 0.5;
    float _2081 = _2057 * 0.5;
    float _2083 = _2065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2085 = fma(_1845, _2071, _1843);
    out.gl_Position.x = _1814;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1907;
    out.gl_Position.w = _1778;
    out.m_73.x = _2081;
    out.m_73.y = _2067;
    out.m_73.z = _2079;
    out.m_73.w = _1778;
    out.m_47.x = _2083;
    out.m_75.x = _2073;
    out.m_75.y = _2075;
    out.m_75.z = _2085;
    out.m_75.w = _2077;
    if (!_2053)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

