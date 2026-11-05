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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_61 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1960 = false;
    bool _614 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_120);
        out.gl_Position.z = _2518;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_158);
        out.gl_Position.z = _2587;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = _296;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_104);
        float _398 = 1.0 / _396;
        float _400 = _138 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _528 = _480 * _504;
    float _530 = _522 * _520;
    float _532 = _524 * _520;
    float _534 = _526 * _520;
    float _536 = -_496;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _550 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _562;
    float _566 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _528, _548);
    float _574 = fma(_554, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = fma(_564, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _578 = fma(_558, _528, _550);
    float _580 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _582 = fma(_566, _528, _560);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _578);
    float _588 = fma(_580, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    bool _596 = !_442;
    float _612;
    if (!_596)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_104);
        float _618 = 1.0 / _616;
        float _620 = _138 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = in.m_51.w;
    float _626 = _160 * 2.0;
    float _628 = in.m_55.x;
    float _630 = in.m_55.y;
    float _632 = in.m_55.z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _636 = _634 != 0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _642 = _640 != 0;
    float _644 = in.m_57.x;
    float _646 = in.m_57.y;
    float _648 = in.m_57.z;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _652 = _650 != 0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_59.x;
    float _664 = in.m_59.y;
    float _666 = in.m_59.z;
    float _668 = floor(_626);
    float _670 = in.m_61.x;
    if (_636)
    {
        bool _672 = _160 > 0.5;
        _376 = _672;
    }
    bool _674 = _376;
    float _676 = in.m_63.x;
    float _678 = in.m_63.y;
    float _680 = 1.0 / _656;
    bool _682 = _624 > 0.5;
    float _684 = 0.0;
    bool _686 = _682;
    if (_642)
    {
        float _688 = in.m_51.z;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _356 * _630;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_51.y;
    float _698 = _356 * _646;
    float _700 = _356 * _664;
    float _702 = fma(_352, _644, _698);
    float _704 = _630;
    float _706 = _646;
    int _708 = as_type<int>(_644);
    if (!_636)
    {
        _704 = _670;
    }
    float _710 = _704;
    float _712 = fma(_352, _662, _700);
    float _714 = in.m_61.y;
    float _716 = _710;
    if (!_636)
    {
        _706 = _710;
    }
    float _718 = _706;
    float _720 = _718;
    if (_636)
    {
        _716 = _670;
    }
    float _722 = _716;
    float _724 = fma(_352, _628, _692);
    float _726 = abs(_676);
    float _728 = abs(_678);
    float _730 = precise::max(_726, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = _722;
    if (_636)
    {
        float _736 = -_722;
        float _738 = _736 + 1.0;
        _708 = as_type<int>(_738);
    }
    int _740 = _708;
    float _742 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _744 = _730 >= 16.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _746;
    if (_636)
    {
        float _750 = _674 ? as_type<float>(_740) : _722;
        _720 = _750;
    }
    float _752 = _720;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _756 = _668 > 0.0;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _760 = _668 >= 0.0;
    bool _762 = isnan(_668);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _772 = _622 + _770;
    bool _774 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _776 = isnan(_622);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _748 * _680;
    float _788 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _790 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _792 = isnan(_622);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_784;
    float _804 = _802 + 1.0;
    float _806 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _810 = fma(_368, _632, _724);
    float _812 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _814 = _800 * _804;
    float _816 = -_714;
    float _818 = _816 + 1.0;
    out.m_65.x = _742;
    out.m_65.y = _788;
    out.m_65.z = _806;
    out.m_65.w = _808;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _812 * _814;
    float _824 = fma(_368, _648, _702);
    float _826 = fma(_368, _666, _712);
    float _828 = -_800;
    float _830 = _828 + 1.0;
    int _832 = _682 ? as_type<int>(_818) : as_type<int>(_714);
    float _834 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _836 = as_type<int>(_806);
    float _838 = _714;
    if (_642)
    {
        bool _840 = _690 > 0.5;
        _686 = _840;
    }
    bool _842 = _686;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[115].x, _822);
    float _846 = _652 ? as_type<float>(_832) : _714;
    float _848 = in.m_51.z;
    float _850 = _160 + _696;
    bool _852 = _696 > 0.5;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = _846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _858 = _842;
    if (_642)
    {
        float _860 = -_722;
        float _862 = _860 + 1.0;
        _836 = as_type<int>(_862);
    }
    int _864 = _836;
    float _866 = _850 + (-1.0);
    if (_660)
    {
        float _868 = _852 ? _818 : _714;
        _838 = _868;
    }
    float _870 = _838;
    float _872 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[116].x, _844);
    if (_642)
    {
        float _874 = _842 ? as_type<float>(_864) : _722;
        _734 = _874;
    }
    float _876 = _734;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _880 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = _880 * _694;
    float _888 = _856 * _854;
    float _890 = _834 * _820;
    float _892 = _696 * 2.0;
    float _894 = _678 * 0.0625;
    float _896 = _884 * _638;
    float _898 = _676 * 0.0625;
    float _900 = _848 * 2.0;
    float _902 = _824 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _904 = floor(_892);
    float _906 = _744 ? _894 : _678;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = _744 ? _898 : _676;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _914 = abs(_906);
    bool _916 = _914 != 0.0;
    bool _918 = isnan(_914);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = floor(_900);
    float _932 = abs(_910);
    bool _934 = _932 == 0.0;
    bool _936 = !_924;
    bool _938 = _934 && _936;
    float _940 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_67.x = _890;
    out.m_67.y = _886;
    out.m_67.z = _896;
    out.m_67.w = _888;
    bool _946 = _904 > 0.0;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _944 + _948;
    bool _952 = _904 >= 0.0;
    bool _954 = isnan(_904);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _902 + _964;
    out.m_69.x = _928;
    out.m_69.y = _940;
    out.m_69.z = _942;
    out.m_69.w = _882;
    int _968 = as_type<int>(_900);
    int _970 = _938 ? (-1) : 0;
    float _972 = _882;
    int _974 = as_type<int>(_966);
    if (_938)
    {
        bool _976 = as_type<int>(_910) >= 0;
        _858 = _976;
    }
    bool _978 = _858;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _962 + _980;
    float _984 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _986 = _966 * _966;
    if (_938)
    {
        int _988 = _978 ? 0 : 1078530011;
        _968 = _988;
    }
    int _990 = _968;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _984);
    float _994 = fma(_982, _982, _986);
    bool _996 = _930 > 0.0;
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].z, _992);
    float _1000 = fma(_950, _950, _994);
    int _1002 = _960 ? 0 : 1;
    int _1004 = _768 ? 0 : 1;
    bool _1006 = _930 >= 0.0;
    bool _1008 = isnan(_930);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = rsqrt(_1000);
    float _1018 = _696 + _848;
    bool _1020 = _998 >= 0.0;
    int _1022 = _1014 ? 0 : 1;
    float _1024 = _1018 + (-1.0);
    float _1026 = abs(_910);
    bool _1028 = _1026 == 0.0;
    int _1030 = ~_1004;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = ~_1002;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    int _1050 = _1034;
    int _1052 = _1040;
    int _1054 = _1048;
    float _1056 = _1024;
    int _1058 = _990;
    if (!_756)
    {
        int _1060 = ~_1004;
        int _1062 = _1060 + 1;
        _1050 = _1062;
    }
    int _1064 = _1050;
    if (!_946)
    {
        int _1066 = ~_1002;
        int _1068 = _1066 + 1;
        _1052 = _1068;
    }
    int _1070 = _1052;
    if (!_996)
    {
        int _1072 = ~_1022;
        int _1074 = _1072 + 1;
        _1054 = _1074;
    }
    int _1076 = _1054;
    if (_938)
    {
        int _1078 = int(0x80000000) & as_type<int>(_906);
        int _1080 = _990 | _1078;
        _1056 = as_type<float>(_1080);
    }
    float _1082 = _1056;
    bool _1084 = !_924;
    bool _1086 = _1084 && _1028;
    float _1088 = _1082;
    float _1090 = _1082;
    if (!_1086)
    {
        float _1092 = abs(_906);
        bool _1094 = _1092 != as_type<float>(0x7f800000u /* inf */);
        bool _1096 = isnan(_1092);
        bool _1098 = _1094 || _1096;
        bool _1100 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1102 = _1098 || _1100;
        float _1104 = abs(_910);
        bool _1106 = _1104 == as_type<float>(0x7f800000u /* inf */);
        float _1108 = abs(_910);
        bool _1110 = _1108 == as_type<float>(0x7f800000u /* inf */);
        bool _1112 = !_1102;
        bool _1114 = _1110 && _1112;
        if (_1114)
        {
            bool _1116 = as_type<int>(_910) >= 0;
            _970 = _1116 ? (-1) : 0;
        }
        int _1118 = _970;
        if (_1114)
        {
            _1058 = 1075235812;
        }
        int _1120 = _1058;
        int _1122 = _1120;
        if (_1114)
        {
            int _1124 = ~_1118;
            int _1126 = (_1124 != 0) ? _1120 : 1061752795;
            _1122 = _1126;
        }
        int _1128 = _1122;
        if (_1114)
        {
            int _1130 = int(0x80000000) & as_type<int>(_906);
            int _1132 = _1128 | _1130;
            _1088 = as_type<float>(_1132);
        }
        float _1134 = _1088;
        bool _1136 = !_1102;
        bool _1138 = _1136 && _1106;
        _1090 = _1134;
        if (!_1138)
        {
            float _1140 = abs(_906);
            float _1142 = abs(_910);
            float _1144 = precise::max(_1140, _1142);
            float _1146 = abs(_906);
            float _1148 = abs(_910);
            float _1150 = precise::min(_1146, _1148);
            float _1152 = 1.0 / _1144;
            float _1154 = abs(_906);
            float _1156 = abs(_910);
            bool _1158 = _1154 > _1156;
            bool _1160 = as_type<int>(_910) >= 0;
            float _1162 = _1150 * _1152;
            float _1164 = abs(_906);
            float _1166 = abs(_910);
            float _1168 = _1164 + _1166;
            int _1170 = as_type<int>(_906) & int(0x80000000);
            float _1172 = _1162 * _1162;
            bool _1174 = _1168 > as_type<float>(0x7f800000u /* inf */);
            bool _1176 = isnan(_1168);
            bool _1178 = _1174 || _1176;
            bool _1180 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1182 = _1178 || _1180;
            float _1184 = _1172 + 11.33538818359375;
            float _1186 = fma(_1172, _1184, 28.84246826171875);
            float _1188 = fma(_1172, _1186, 19.6966705322265625);
            float _1190 = fma(_1172, -0.82336294651031494140625, -5.674867153167724609375);
            float _1192 = fma(_1172, _1190, -6.565555095672607421875);
            float _1194 = 1.0 / _1188;
            float _1196 = _1172 * _1192;
            float _1198 = _1162 * _1196;
            float _1200 = fma(_1198, _1194, _1162);
            float _1202 = _1200;
            _1090 = _1168;
            if (_1158)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 1.57079637050628662109375;
                _1202 = _1206;
            }
            float _1208 = _1202;
            int _1210 = as_type<int>(_1208);
            if (!_1160)
            {
                float _1212 = -_1208;
                float _1214 = _1212 + 3.1415927410125732421875;
                _1210 = as_type<int>(_1214);
            }
            int _1216 = _1210;
            if (!_1182)
            {
                int _1218 = _1170 | _1216;
                _1090 = as_type<float>(_1218);
            }
        }
    }
    float _1220 = _1090;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    float _1226 = _966 * _1016;
    float _1228 = _982 * _1016;
    float _1230 = precise::max(_1220, -3.1415927410125732421875);
    float _1232 = _950 * _1016;
    float _1234 = -_1226;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    if (_1020)
    {
        _972 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _972;
    float _1244 = _1236 * _1236;
    if (_1020)
    {
        out.m_47.x = 0.0;
    }
    if (_1020)
    {
        float _1246 = _1242 * 5.0;
        _974 = as_type<int>(_1246);
    }
    int _1248 = _974;
    float _1250 = fma(_1240, _1240, _1244);
    float _1252 = -_1232;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1256 = _1224 * _138;
    float _1258 = precise::min(_1230, 3.1415927410125732421875);
    float _1260 = fma(_1254, _1254, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1272 = _1270 != 0;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    if (_1020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_1248);
        out.gl_Position.z = _4331;
    }
    float _1278 = exp2(_1256);
    float _1280 = fma(_1258, 0.15915493667125701904296875, 0.5);
    bool _1282 = !_1264;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = in.m_71.x;
    float _1288 = in.m_71.y;
    float _1290 = in.m_71.z;
    bool _1292 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(1.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = fma(_138, 0.06666667759418487548828125, _1280);
    bool _1304 = !_1268;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = 1.0 / _1276;
    int _1310 = abs(_1284);
    float _1312 = _1302 * 6.283185482025146484375;
    bool _1314 = !_1272;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = abs(_1306);
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1278;
    float _1332 = _1330 + 1.0;
    float _1334 = float(_1076);
    float _1336 = sqrt(_1260);
    int _1338 = abs(_1316);
    float _1340 = float(_1310);
    float _1342 = float(_1064);
    float _1344 = _1340 * _1334;
    float _1346 = float(_1318);
    float _1348 = _1328 ? _1332 : 0.0;
    float _1350 = float(_1070);
    float _1352 = _1346 * _1342;
    float _1354 = float(_1338);
    if (_1300)
    {
        float _1356 = _1348 * _1308;
        _142 = _1356;
    }
    float _1358 = _142;
    float _1360 = _1344 * (-2.0);
    float _1362 = _1352 * (-2.0);
    float _1364 = _1354 * _1350;
    float _1366 = _160 + (-0.5);
    float _1368 = fma(_1360, _1286, _1286);
    float _1370 = fma(_878, _1360, _878);
    float _1372 = fma(_1042, _1362, _1042);
    float _1374 = fma(_1362, _1288, _1288);
    float _1376 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1368);
    if (_1020)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1378 = -_1226;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1382 = fma(_1370, _1358, _1376);
    float _1384 = -_1228;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1388 = -_1232;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1380 + _1392;
    float _1396 = _696 + (-0.5);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1400 = _1386 + _1398;
    float _1402 = _1312 * 0.15915493667125701904296875;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1406 = _160 + _848;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1410 = _1390 + _1408;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1404);
    float _1416 = _1406 + (-1.0);
    float _1418 = _1364 * (-2.0);
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1414);
    float _1422 = fma(_1372, _1358, _1412);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1418, _1290, _1290);
    float _1428 = _848 + (-0.5);
    bool _1430 = _1420 >= 0.0;
    float _1432 = fma(_1424, _1418, _1424);
    float _1434 = _1382 * 0.15915493667125701904296875;
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1438 = in.m_53.x;
    float _1440 = in.m_53.y;
    float _1442 = in.m_53.z;
    float _1444 = _1422 * 0.15915493667125701904296875;
    float _1446 = _1434 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = fma(_1432, _1358, _1436);
    float _1452 = in.m_63.z;
    float _1454 = _1450 * 0.15915493667125701904296875;
    float _1456 = _1422;
    if (_1430)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1456;
    float _1460 = _1434 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    int _1464 = as_type<int>(_1458);
    if (_1430)
    {
        out.m_47.x = 0.0;
    }
    if (_1430)
    {
        float _1466 = _1458 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1402 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1430)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4623 = as_type<float>(_1468);
        out.gl_Position.z = _4623;
    }
    float _1474 = _1444 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1444 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1454 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    if (_1430)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1486 = _1454 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = _592 * _1440;
    float _1492 = _590 * _1438;
    float _1494 = fma(_1472, 0.5, 1.5);
    float _1496 = _594 * _1442;
    float _1498 = _1016 * _1336;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1502 = _1494 * _676;
    float _1504 = _1494 * _678;
    float _1506 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = _1494 * _1452;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1512 = _1448 * _1476;
    float _1514 = _1462 * _1480;
    float _1516 = _1462 * _1476;
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1502);
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1522 = _1498 * _1500;
    float _1524 = _1498 * _1506;
    float _1526 = _1462 * _1488;
    float _1528 = _1448 * _1480;
    float _1530 = _1498 * _1510;
    float _1532 = fma(_1484, _1514, _1512);
    float _1534 = _1518 * _1522;
    float _1536 = _1520 * _1524;
    float _1538 = fma(_1484, _1512, _1514);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1544 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1546 = _1480 * _1488;
    float _1548 = _1448 * _1488;
    float _1550 = _1476 * _1488;
    float _1552 = -_1516;
    float _1554 = fma(_1484, _1528, _1552);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = -_1528;
    float _1560 = fma(_1484, _1516, _1558);
    float _1562 = _1526 * _1536;
    float _1564 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1566 = -_1484;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    float _1570 = -_1484;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1542);
    float _1574 = -_1484;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1544);
    float _1578 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1580 = -_1536;
    float _1582 = _1484 * _1580;
    float _1584 = _1548 * _1536;
    float _1586 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = _1556 * _1530;
    float _1590 = fma(_1532, _1534, _1562);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1564);
    float _1594 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1578);
    float _1596 = fma(_1546, _1534, _1582);
    float _1598 = fma(_1554, _1534, _1584);
    float _1600 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1602 = fma(_1560, _1588, _1590);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1606 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1608 = fma(_1550, _1588, _1596);
    float _1610 = fma(_1538, _1588, _1598);
    float _1612 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1614 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1616 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1618 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1620 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1614);
    float _1626 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1616);
    float _1628 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1620);
    float _1630 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1632 = in.m_73.x;
    float _1634 = in.m_73.y;
    float _1636 = in.m_73.z;
    bool _1638 = _1504 != 0.0;
    bool _1640 = isnan(_1504);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1650 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1652 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1618);
    bool _1654 = _1502 == 0.0;
    bool _1656 = !_1646;
    bool _1658 = _1654 && _1656;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1664 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1568);
    float _1666 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1668 = _962 + _1660;
    float _1670 = _944 + _1662;
    float _1672 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1576);
    bool _1674 = _1508 == 0.0;
    bool _1676 = _1674 && _1658;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1684 = _1670 + _1682;
    float _1686 = in.m_75.x;
    float _1688 = in.m_75.y;
    float _1690 = in.m_75.z;
    float _1692 = in.m_75.w;
    float _1694 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1624);
    float _1696 = _1680 * _1680;
    float _1698 = _1684 * _1684;
    float _1700 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1626);
    float _1702 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1652);
    float _1704 = _1696 + _1698;
    float _1706 = _1660;
    float _1708 = _1520;
    float _1710 = _1650;
    float _1712 = _1696;
    float _1714 = _1698;
    float _1716 = _1668;
    float _1718 = _1670;
    float _1720 = _1606;
    if (_1676)
    {
        _1706 = _1636;
    }
    float _1722 = _1706;
    float _1724 = sqrt(_1704);
    float _1726 = _1722;
    if (!_1676)
    {
        float _1728 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1636);
        _1726 = _1728;
    }
    float _1730 = _1726;
    float _1732 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1676)
    {
        _1708 = _1632;
    }
    float _1734 = _1708;
    float _1736 = _1734;
    if (!_1676)
    {
        float _1738 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1736 = _1738;
    }
    float _1740 = _1736;
    if (_1676)
    {
        _1710 = _1634;
    }
    float _1742 = _1710;
    float _1744 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1732);
    float _1746 = _1742;
    if (!_1676)
    {
        float _1748 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1634);
        _1746 = _1748;
    }
    float _1750 = _1746;
    float _1752 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1744);
    float _1754 = _1664 * _1688;
    float _1756 = _1666 * _1688;
    float _1758 = _1672 * _1688;
    bool _1760 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = fma(_1604, _1686, _1754);
    float _1764 = _1690 * _1632;
    float _1766 = _1686 * _1634;
    float _1768 = _1688 * _1636;
    float _1770 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1772 = fma(_1606, _1686, _1756);
    float _1774 = fma(_1612, _1686, _1758);
    float _1776 = -_1764;
    float _1778 = fma(_1686, _1636, _1776);
    float _1780 = -_1766;
    float _1782 = fma(_1688, _1632, _1780);
    float _1784 = -_1768;
    float _1786 = fma(_1690, _1634, _1784);
    float _1788 = _902 + _1770;
    float _1790 = _1778 * _1692;
    float _1792 = _1782 * _1692;
    float _1794 = _1786 * _1692;
    float _1796 = fma(_1694, _1690, _1762);
    float _1798 = fma(_1700, _1690, _1772);
    float _1800 = fma(_1702, _1690, _1774);
    float _1802 = _1692;
    if (!_1760)
    {
        _1802 = _1788;
    }
    float _1804 = _1802;
    bool _1806 = !_1760;
    float _1808 = _1804;
    if (!_1806)
    {
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1814 = _1724 + _1812;
        float _1816 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1818 = rsqrt(_1704);
        float _1820 = _1814 * _1810;
        float _1822 = _1820 * 0.15915493667125701904296875;
        float _1824 = _1822 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1822 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = fma(_1826, _1816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1834 = _1818 * _1832;
        float _1836 = fma(_1680, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = _1830 + (-1.0);
        float _1840 = fma(_1684, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1850 = _1840 + _1848;
        float _1852 = _1844 * _1844;
        float _1854 = fma(_1788, _1830, _1846);
        float _1856 = _1850 * _1850;
        _1808 = _1854;
        _1712 = _1852;
        _1714 = _1856;
        _1716 = _1836;
        _1718 = _1840;
    }
    float _1858 = _1808;
    float _1860 = _1712;
    float _1862 = _1714;
    float _1864 = _1716;
    float _1866 = _1718;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1858 + _1868;
    float _1872 = _1664 * _1750;
    float _1874 = _1666 * _1750;
    float _1876 = _1672 * _1750;
    float _1878 = fma(_1870, _1870, _1860);
    float _1880 = _1790 * _1664;
    float _1882 = _1790 * _1666;
    float _1884 = _1790 * _1672;
    float _1886 = _1878 + _1862;
    float _1888 = fma(_1604, _1740, _1872);
    float _1890 = fma(_1606, _1740, _1874);
    float _1892 = fma(_1612, _1740, _1876);
    float _1894 = fma(_1794, _1604, _1880);
    float _1896 = fma(_1794, _1606, _1882);
    float _1898 = sqrt(_1886);
    float _1900 = fma(_1794, _1612, _1884);
    float _1902 = fma(_1694, _1730, _1888);
    float _1904 = fma(_1700, _1730, _1890);
    float _1906 = fma(_1702, _1730, _1892);
    float _1908 = fma(_1792, _1694, _1894);
    float _1910 = fma(_1792, _1700, _1896);
    float _1912 = fma(_1792, _1702, _1900);
    out.m_77.x = _1796;
    out.m_77.y = _1798;
    out.m_77.z = _1800;
    out.m_79.x = _1902;
    out.m_79.y = _1904;
    out.m_79.z = _1906;
    out.m_81.x = _1908;
    out.m_81.y = _1910;
    out.m_81.z = _1912;
    bool _1914 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1916 = isnan(_1898);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1922 = _1918 || _1920;
    float _1924 = _1910;
    if (!_1922)
    {
        _1720 = 1.0;
    }
    float _1926 = _1720;
    bool _1928 = !_1922;
    float _1930 = _1926;
    if (!_1928)
    {
        bool _1932 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1934 = isnan(_1898);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1944 = _1898 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1952 = _1950 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1954 = 1.0 / _1948;
            float _1956 = _1944 * _1954;
            float _1958 = fma(_1956, _1952, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1930 = _1958;
            _1960 = true;
        }
        else
        {
            bool _1962 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1964 = isnan(_1898);
            bool _1966 = _1962 || _1964;
            bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1970 = _1966 || _1968;
            if (!_1970)
            {
                float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1974 = _1898 + _1972;
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1976 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1984 = 1.0 / _1978;
                float _1986 = _1974 * _1984;
                float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1930 = _1988;
                _1960 = true;
            }
            else
            {
                _1930 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1960 = false;
    float _1990 = _1930;
    float _1992 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1994 = _1864 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1998 = _1858 + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2002 = _1866 + _2000;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = fma(_1994, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2016 = fma(_1998, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2018 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2020 = -_1228;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2024 = -_1226;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2016);
    float _2028 = -_1232;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2032 = _2026;
    float _2034 = _2022;
    float _2036 = _2030;
    if (!_2012)
    {
        float _2038 = _1394 * _1394;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_962;
        float _2044 = _2042 + _2014;
        float _2046 = -_944;
        float _2048 = _2046 + _2018;
        float _2050 = fma(_1400, _1400, _2038);
        float _2052 = fma(_1410, _1410, _2050);
        float _2054 = 1.0 / _1498;
        float _2056 = sqrt(_2052);
        float _2058 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = -_902;
        float _2064 = _2062 + _2016;
        float _2066 = _2060 * _2054;
        float _2068 = fma(_2044, _2066, _1386);
        float _2070 = fma(_2064, _2066, _1380);
        float _2072 = fma(_2048, _2066, _1390);
        _2032 = _2070;
        _2034 = _2068;
        _2036 = _2072;
    }
    float _2074 = _2032;
    float _2076 = _2034;
    float _2078 = _2036;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2074 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2078 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2098;
    float _2122 = _2110;
    float _2124 = _2118;
    float _2126 = _2082;
    float _2128 = _2100;
    float _2130 = _2102;
    if (_2114)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2132;
    }
    float _2134 = _2120;
    if (_2114)
    {
        float _2136 = rsqrt(_2110);
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = _2118 * _2134;
        _2124 = _2140;
    }
    float _2142 = _2124;
    if (_2114)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _1924 = _2144;
    }
    float _2146 = _1924;
    float _2148 = _2134;
    float _2150 = _2146;
    if (_2114)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2090;
    float _2164 = _2160;
    if (_2114)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2100;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = _2176;
    if (!_2114)
    {
        _2126 = _2106;
    }
    float _2180 = _2126;
    float _2182 = _2180;
    if (_2114)
    {
        float _2184 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2184;
    }
    float _2186 = _2164;
    float _2188 = _2156;
    float _2190 = _2186;
    if (_2114)
    {
        float _2192 = fma(_2156, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2198 = _2194;
    if (_2114)
    {
        float _2200 = _2170 + (-1.0);
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _2202;
    if (_2114)
    {
        float _2206 = _2138 * _2194;
        _2128 = _2206;
    }
    float _2208 = _2128;
    if (!_2114)
    {
        _2198 = _2104;
    }
    float _2210 = _2198;
    float _2212 = sqrt(_2096);
    float _2214 = _2210;
    if (_2114)
    {
        float _2216 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2216;
    }
    float _2218 = _2150;
    if (_2114)
    {
        float _2220 = _2102 * _2208;
        _2130 = _2220;
    }
    float _2222 = _2130;
    if (_2114)
    {
        float _2224 = _2104 * _2208;
        _2214 = _2224;
    }
    float _2226 = _2214;
    if (!_2114)
    {
        _2204 = _2108;
    }
    float _2228 = _2204;
    float _2230 = _2228;
    if (_2114)
    {
        float _2232 = fma(_2176, _2170, _2218);
        _2178 = _2232;
    }
    float _2234 = _2178;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2182 = _2236;
    }
    float _2238 = _2182;
    if (_2114)
    {
        float _2240 = _2226 * _2226;
        _2230 = _2240;
    }
    float _2242 = _2230;
    float _2244 = fma(_2234, _2234, _2238);
    float _2246 = _2244 + _2242;
    float _2248 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = rsqrt(_2246);
    float _2258 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2248);
    float _2260 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -_2254;
    float _2264 = _2262 + 1.0;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2268 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2270 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2272 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2276 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2268);
    float _2278 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2270);
    float _2280 = abs(_2264);
    float _2282 = log2(_2280);
    float _2284 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2286 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2294 = _2256 * _2222;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2196, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2306 = _2256 * _2234;
    float _2308 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2310 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2298);
    float _2312 = _2256 * _2226;
    float _2314 = log2(_2302);
    float _2316 = -_2308;
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2310);
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2332 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2334 = exp2(_2322);
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2324);
    float _2340 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2332);
    float _2342 = _2306 + 1.0;
    float _2344 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2338);
    float _2346 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2340);
    float _2348 = 1.0 / _2330;
    float _2350 = fma(_2328, 0.5, 0.5);
    float _2352 = _2314 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2346);
    float _2356 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2344);
    float _2358 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2360 = sqrt(_2336);
    float _2362 = -_2306;
    float _2364 = fma(_2334, _2342, _2362);
    float _2366 = fma(_2350, _2358, -0.212114393711090087890625);
    float _2368 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2370 = fma(_2350, _2366, 1.570728778839111328125);
    float _2372 = _2354 * _2348;
    float _2374 = _2356 * _2348;
    float _2376 = fma(_2372, 0.5, 0.5);
    float _2378 = fma(_2374, -0.5, 0.5);
    float _2380 = fma(_2364, 0.5, 0.5);
    float _2382 = _2360 * 0.636619746685028076171875;
    float3 _6150 = float3(_2376, _2378, _2368);
    float _2384 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6150, float3(0.0), isnan(_6150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6150, float3(0.0), isnan(_6150)), level(0.0)).x;
    float3 _6161 = float3(_2376, _2378, _2368);
    float4 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).xyzw;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = _2387.w;
    float _2397 = -_2370;
    float _2399 = fma(_2382, _2397, 1.0);
    float2 _6183 = float2(_2399, _2380);
    float3 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).xyz;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2413 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2415 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2413);
    float _2419 = exp2(_2411);
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2354 + _2330;
    float _2427 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2429 = _2425 * 0.5;
    float _2431 = _2330 * 0.5;
    out.m_47.x = _2421;
    float _2433 = _2427 + _2330;
    out.gl_Position.x = _2354;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _2427;
    out.gl_Position.w = _2330;
    float _2435 = _2433 * 0.5;
    float _2437 = -_2419;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2443 = fma(_2356, -0.5, _2431);
    out.m_83.x = _2429;
    out.m_83.y = _2443;
    out.m_83.z = _2435;
    out.m_83.w = _2330;
    float _2445 = _2441 * _2384;
    float _2447 = -_2441;
    float _2449 = _2447 + 1.0;
    float _2451 = _2395 * _2445;
    float _2453 = _2409 * _2445;
    float _2455 = fma(_2405, _2451, _2389);
    float _2457 = fma(_2407, _2451, _2391);
    float _2459 = _2395 * _2449;
    float _2461 = fma(_2395, _2453, _2393);
    out.m_85.x = _2455;
    out.m_85.y = _2457;
    out.m_85.z = _2461;
    out.m_85.w = _2459;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1960 = false;
    bool _614 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_120);
        out.gl_Position.z = _2518;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_158);
        out.gl_Position.z = _2587;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = _296;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_104);
        float _398 = 1.0 / _396;
        float _400 = _138 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _528 = _480 * _504;
    float _530 = _522 * _520;
    float _532 = _524 * _520;
    float _534 = _526 * _520;
    float _536 = -_496;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _550 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _562;
    float _566 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _528, _548);
    float _574 = fma(_554, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = fma(_564, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _578 = fma(_558, _528, _550);
    float _580 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _582 = fma(_566, _528, _560);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _578);
    float _588 = fma(_580, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    bool _596 = !_442;
    float _612;
    if (!_596)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_104);
        float _618 = 1.0 / _616;
        float _620 = _138 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = in.m_51.w;
    float _626 = _160 * 2.0;
    float _628 = in.m_55.x;
    float _630 = in.m_55.y;
    float _632 = in.m_55.z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _636 = _634 != 0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _642 = _640 != 0;
    float _644 = in.m_57.x;
    float _646 = in.m_57.y;
    float _648 = in.m_57.z;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _652 = _650 != 0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_59.x;
    float _664 = in.m_59.y;
    float _666 = in.m_59.z;
    float _668 = floor(_626);
    float _670 = in.m_61.x;
    if (_636)
    {
        bool _672 = _160 > 0.5;
        _376 = _672;
    }
    bool _674 = _376;
    float _676 = in.m_63.x;
    float _678 = in.m_63.y;
    float _680 = 1.0 / _656;
    bool _682 = _624 > 0.5;
    float _684 = 0.0;
    bool _686 = _682;
    if (_642)
    {
        float _688 = in.m_51.z;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _356 * _630;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_51.y;
    float _698 = _356 * _646;
    float _700 = _356 * _664;
    float _702 = fma(_352, _644, _698);
    float _704 = _630;
    float _706 = _646;
    int _708 = as_type<int>(_644);
    if (!_636)
    {
        _704 = _670;
    }
    float _710 = _704;
    float _712 = fma(_352, _662, _700);
    float _714 = in.m_61.y;
    float _716 = _710;
    if (!_636)
    {
        _706 = _710;
    }
    float _718 = _706;
    float _720 = _718;
    if (_636)
    {
        _716 = _670;
    }
    float _722 = _716;
    float _724 = fma(_352, _628, _692);
    float _726 = abs(_676);
    float _728 = abs(_678);
    float _730 = precise::max(_726, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = _722;
    if (_636)
    {
        float _736 = -_722;
        float _738 = _736 + 1.0;
        _708 = as_type<int>(_738);
    }
    int _740 = _708;
    float _742 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _744 = _730 >= 16.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _746;
    if (_636)
    {
        float _750 = _674 ? as_type<float>(_740) : _722;
        _720 = _750;
    }
    float _752 = _720;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _756 = _668 > 0.0;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _760 = _668 >= 0.0;
    bool _762 = isnan(_668);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _772 = _622 + _770;
    bool _774 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _776 = isnan(_622);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _748 * _680;
    float _788 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _790 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _792 = isnan(_622);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_784;
    float _804 = _802 + 1.0;
    float _806 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _810 = fma(_368, _632, _724);
    float _812 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _814 = _800 * _804;
    float _816 = -_714;
    float _818 = _816 + 1.0;
    out.m_65.x = _742;
    out.m_65.y = _788;
    out.m_65.z = _806;
    out.m_65.w = _808;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _812 * _814;
    float _824 = fma(_368, _648, _702);
    float _826 = fma(_368, _666, _712);
    float _828 = -_800;
    float _830 = _828 + 1.0;
    int _832 = _682 ? as_type<int>(_818) : as_type<int>(_714);
    float _834 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _836 = as_type<int>(_806);
    float _838 = _714;
    if (_642)
    {
        bool _840 = _690 > 0.5;
        _686 = _840;
    }
    bool _842 = _686;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[115].x, _822);
    float _846 = _652 ? as_type<float>(_832) : _714;
    float _848 = in.m_51.z;
    float _850 = _160 + _696;
    bool _852 = _696 > 0.5;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = _846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _858 = _842;
    if (_642)
    {
        float _860 = -_722;
        float _862 = _860 + 1.0;
        _836 = as_type<int>(_862);
    }
    int _864 = _836;
    float _866 = _850 + (-1.0);
    if (_660)
    {
        float _868 = _852 ? _818 : _714;
        _838 = _868;
    }
    float _870 = _838;
    float _872 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[116].x, _844);
    if (_642)
    {
        float _874 = _842 ? as_type<float>(_864) : _722;
        _734 = _874;
    }
    float _876 = _734;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _880 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = _880 * _694;
    float _888 = _856 * _854;
    float _890 = _834 * _820;
    float _892 = _696 * 2.0;
    float _894 = _678 * 0.0625;
    float _896 = _884 * _638;
    float _898 = _676 * 0.0625;
    float _900 = _848 * 2.0;
    float _902 = _824 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _904 = floor(_892);
    float _906 = _744 ? _894 : _678;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = _744 ? _898 : _676;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _914 = abs(_906);
    bool _916 = _914 != 0.0;
    bool _918 = isnan(_914);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = floor(_900);
    float _932 = abs(_910);
    bool _934 = _932 == 0.0;
    bool _936 = !_924;
    bool _938 = _934 && _936;
    float _940 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_67.x = _890;
    out.m_67.y = _886;
    out.m_67.z = _896;
    out.m_67.w = _888;
    bool _946 = _904 > 0.0;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _944 + _948;
    bool _952 = _904 >= 0.0;
    bool _954 = isnan(_904);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _902 + _964;
    out.m_69.x = _928;
    out.m_69.y = _940;
    out.m_69.z = _942;
    out.m_69.w = _882;
    int _968 = as_type<int>(_900);
    int _970 = _938 ? (-1) : 0;
    float _972 = _882;
    int _974 = as_type<int>(_966);
    if (_938)
    {
        bool _976 = as_type<int>(_910) >= 0;
        _858 = _976;
    }
    bool _978 = _858;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _962 + _980;
    float _984 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _986 = _966 * _966;
    if (_938)
    {
        int _988 = _978 ? 0 : 1078530011;
        _968 = _988;
    }
    int _990 = _968;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _984);
    float _994 = fma(_982, _982, _986);
    bool _996 = _930 > 0.0;
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].z, _992);
    float _1000 = fma(_950, _950, _994);
    int _1002 = _960 ? 0 : 1;
    int _1004 = _768 ? 0 : 1;
    bool _1006 = _930 >= 0.0;
    bool _1008 = isnan(_930);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = rsqrt(_1000);
    float _1018 = _696 + _848;
    bool _1020 = _998 >= 0.0;
    int _1022 = _1014 ? 0 : 1;
    float _1024 = _1018 + (-1.0);
    float _1026 = abs(_910);
    bool _1028 = _1026 == 0.0;
    int _1030 = ~_1004;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = ~_1002;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    int _1050 = _1034;
    int _1052 = _1040;
    int _1054 = _1048;
    float _1056 = _1024;
    int _1058 = _990;
    if (!_756)
    {
        int _1060 = ~_1004;
        int _1062 = _1060 + 1;
        _1050 = _1062;
    }
    int _1064 = _1050;
    if (!_946)
    {
        int _1066 = ~_1002;
        int _1068 = _1066 + 1;
        _1052 = _1068;
    }
    int _1070 = _1052;
    if (!_996)
    {
        int _1072 = ~_1022;
        int _1074 = _1072 + 1;
        _1054 = _1074;
    }
    int _1076 = _1054;
    if (_938)
    {
        int _1078 = int(0x80000000) & as_type<int>(_906);
        int _1080 = _990 | _1078;
        _1056 = as_type<float>(_1080);
    }
    float _1082 = _1056;
    bool _1084 = !_924;
    bool _1086 = _1084 && _1028;
    float _1088 = _1082;
    float _1090 = _1082;
    if (!_1086)
    {
        float _1092 = abs(_906);
        bool _1094 = _1092 != as_type<float>(0x7f800000u /* inf */);
        bool _1096 = isnan(_1092);
        bool _1098 = _1094 || _1096;
        bool _1100 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1102 = _1098 || _1100;
        float _1104 = abs(_910);
        bool _1106 = _1104 == as_type<float>(0x7f800000u /* inf */);
        float _1108 = abs(_910);
        bool _1110 = _1108 == as_type<float>(0x7f800000u /* inf */);
        bool _1112 = !_1102;
        bool _1114 = _1110 && _1112;
        if (_1114)
        {
            bool _1116 = as_type<int>(_910) >= 0;
            _970 = _1116 ? (-1) : 0;
        }
        int _1118 = _970;
        if (_1114)
        {
            _1058 = 1075235812;
        }
        int _1120 = _1058;
        int _1122 = _1120;
        if (_1114)
        {
            int _1124 = ~_1118;
            int _1126 = (_1124 != 0) ? _1120 : 1061752795;
            _1122 = _1126;
        }
        int _1128 = _1122;
        if (_1114)
        {
            int _1130 = int(0x80000000) & as_type<int>(_906);
            int _1132 = _1128 | _1130;
            _1088 = as_type<float>(_1132);
        }
        float _1134 = _1088;
        bool _1136 = !_1102;
        bool _1138 = _1136 && _1106;
        _1090 = _1134;
        if (!_1138)
        {
            float _1140 = abs(_906);
            float _1142 = abs(_910);
            float _1144 = precise::max(_1140, _1142);
            float _1146 = abs(_906);
            float _1148 = abs(_910);
            float _1150 = precise::min(_1146, _1148);
            float _1152 = 1.0 / _1144;
            float _1154 = abs(_906);
            float _1156 = abs(_910);
            bool _1158 = _1154 > _1156;
            bool _1160 = as_type<int>(_910) >= 0;
            float _1162 = _1150 * _1152;
            float _1164 = abs(_906);
            float _1166 = abs(_910);
            float _1168 = _1164 + _1166;
            int _1170 = as_type<int>(_906) & int(0x80000000);
            float _1172 = _1162 * _1162;
            bool _1174 = _1168 > as_type<float>(0x7f800000u /* inf */);
            bool _1176 = isnan(_1168);
            bool _1178 = _1174 || _1176;
            bool _1180 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1182 = _1178 || _1180;
            float _1184 = _1172 + 11.33538818359375;
            float _1186 = fma(_1172, _1184, 28.84246826171875);
            float _1188 = fma(_1172, _1186, 19.6966705322265625);
            float _1190 = fma(_1172, -0.82336294651031494140625, -5.674867153167724609375);
            float _1192 = fma(_1172, _1190, -6.565555095672607421875);
            float _1194 = 1.0 / _1188;
            float _1196 = _1172 * _1192;
            float _1198 = _1162 * _1196;
            float _1200 = fma(_1198, _1194, _1162);
            float _1202 = _1200;
            _1090 = _1168;
            if (_1158)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 1.57079637050628662109375;
                _1202 = _1206;
            }
            float _1208 = _1202;
            int _1210 = as_type<int>(_1208);
            if (!_1160)
            {
                float _1212 = -_1208;
                float _1214 = _1212 + 3.1415927410125732421875;
                _1210 = as_type<int>(_1214);
            }
            int _1216 = _1210;
            if (!_1182)
            {
                int _1218 = _1170 | _1216;
                _1090 = as_type<float>(_1218);
            }
        }
    }
    float _1220 = _1090;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    float _1226 = _966 * _1016;
    float _1228 = _982 * _1016;
    float _1230 = precise::max(_1220, -3.1415927410125732421875);
    float _1232 = _950 * _1016;
    float _1234 = -_1226;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    if (_1020)
    {
        _972 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _972;
    float _1244 = _1236 * _1236;
    if (_1020)
    {
        out.m_47.x = 0.0;
    }
    if (_1020)
    {
        float _1246 = _1242 * 5.0;
        _974 = as_type<int>(_1246);
    }
    int _1248 = _974;
    float _1250 = fma(_1240, _1240, _1244);
    float _1252 = -_1232;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1256 = _1224 * _138;
    float _1258 = precise::min(_1230, 3.1415927410125732421875);
    float _1260 = fma(_1254, _1254, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1272 = _1270 != 0;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    if (_1020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_1248);
        out.gl_Position.z = _4331;
    }
    float _1278 = exp2(_1256);
    float _1280 = fma(_1258, 0.15915493667125701904296875, 0.5);
    bool _1282 = !_1264;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = in.m_71.x;
    float _1288 = in.m_71.y;
    float _1290 = in.m_71.z;
    bool _1292 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(1.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = fma(_138, 0.06666667759418487548828125, _1280);
    bool _1304 = !_1268;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = 1.0 / _1276;
    int _1310 = abs(_1284);
    float _1312 = _1302 * 6.283185482025146484375;
    bool _1314 = !_1272;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = abs(_1306);
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1278;
    float _1332 = _1330 + 1.0;
    float _1334 = float(_1076);
    float _1336 = sqrt(_1260);
    int _1338 = abs(_1316);
    float _1340 = float(_1310);
    float _1342 = float(_1064);
    float _1344 = _1340 * _1334;
    float _1346 = float(_1318);
    float _1348 = _1328 ? _1332 : 0.0;
    float _1350 = float(_1070);
    float _1352 = _1346 * _1342;
    float _1354 = float(_1338);
    if (_1300)
    {
        float _1356 = _1348 * _1308;
        _142 = _1356;
    }
    float _1358 = _142;
    float _1360 = _1344 * (-2.0);
    float _1362 = _1352 * (-2.0);
    float _1364 = _1354 * _1350;
    float _1366 = _160 + (-0.5);
    float _1368 = fma(_1360, _1286, _1286);
    float _1370 = fma(_878, _1360, _878);
    float _1372 = fma(_1042, _1362, _1042);
    float _1374 = fma(_1362, _1288, _1288);
    float _1376 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1368);
    if (_1020)
    {
        return out;
    }
    float _1378 = -_1226;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1382 = fma(_1370, _1358, _1376);
    float _1384 = -_1228;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1388 = -_1232;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1380 + _1392;
    float _1396 = _696 + (-0.5);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1400 = _1386 + _1398;
    float _1402 = _1312 * 0.15915493667125701904296875;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1406 = _160 + _848;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1410 = _1390 + _1408;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1404);
    float _1416 = _1406 + (-1.0);
    float _1418 = _1364 * (-2.0);
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1414);
    float _1422 = fma(_1372, _1358, _1412);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1418, _1290, _1290);
    float _1428 = _848 + (-0.5);
    bool _1430 = _1420 >= 0.0;
    float _1432 = fma(_1424, _1418, _1424);
    float _1434 = _1382 * 0.15915493667125701904296875;
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1438 = in.m_53.x;
    float _1440 = in.m_53.y;
    float _1442 = in.m_53.z;
    float _1444 = _1422 * 0.15915493667125701904296875;
    float _1446 = _1434 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = fma(_1432, _1358, _1436);
    float _1452 = in.m_63.z;
    float _1454 = _1450 * 0.15915493667125701904296875;
    float _1456 = _1422;
    if (_1430)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1456;
    float _1460 = _1434 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    int _1464 = as_type<int>(_1458);
    if (_1430)
    {
        out.m_47.x = 0.0;
    }
    if (_1430)
    {
        float _1466 = _1458 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1402 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1430)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4623 = as_type<float>(_1468);
        out.gl_Position.z = _4623;
    }
    float _1474 = _1444 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1444 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1454 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    if (_1430)
    {
        return out;
    }
    float _1486 = _1454 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = _592 * _1440;
    float _1492 = _590 * _1438;
    float _1494 = fma(_1472, 0.5, 1.5);
    float _1496 = _594 * _1442;
    float _1498 = _1016 * _1336;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1502 = _1494 * _676;
    float _1504 = _1494 * _678;
    float _1506 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = _1494 * _1452;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1512 = _1448 * _1476;
    float _1514 = _1462 * _1480;
    float _1516 = _1462 * _1476;
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1502);
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1522 = _1498 * _1500;
    float _1524 = _1498 * _1506;
    float _1526 = _1462 * _1488;
    float _1528 = _1448 * _1480;
    float _1530 = _1498 * _1510;
    float _1532 = fma(_1484, _1514, _1512);
    float _1534 = _1518 * _1522;
    float _1536 = _1520 * _1524;
    float _1538 = fma(_1484, _1512, _1514);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1544 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1546 = _1480 * _1488;
    float _1548 = _1448 * _1488;
    float _1550 = _1476 * _1488;
    float _1552 = -_1516;
    float _1554 = fma(_1484, _1528, _1552);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = -_1528;
    float _1560 = fma(_1484, _1516, _1558);
    float _1562 = _1526 * _1536;
    float _1564 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1566 = -_1484;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    float _1570 = -_1484;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1542);
    float _1574 = -_1484;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1544);
    float _1578 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1580 = -_1536;
    float _1582 = _1484 * _1580;
    float _1584 = _1548 * _1536;
    float _1586 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = _1556 * _1530;
    float _1590 = fma(_1532, _1534, _1562);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1564);
    float _1594 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1578);
    float _1596 = fma(_1546, _1534, _1582);
    float _1598 = fma(_1554, _1534, _1584);
    float _1600 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1602 = fma(_1560, _1588, _1590);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1606 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1608 = fma(_1550, _1588, _1596);
    float _1610 = fma(_1538, _1588, _1598);
    float _1612 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1614 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1616 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1618 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1620 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1614);
    float _1626 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1616);
    float _1628 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1620);
    float _1630 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1632 = in.m_73.x;
    float _1634 = in.m_73.y;
    float _1636 = in.m_73.z;
    bool _1638 = _1504 != 0.0;
    bool _1640 = isnan(_1504);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1650 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1652 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1618);
    bool _1654 = _1502 == 0.0;
    bool _1656 = !_1646;
    bool _1658 = _1654 && _1656;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1664 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1568);
    float _1666 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1668 = _962 + _1660;
    float _1670 = _944 + _1662;
    float _1672 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1576);
    bool _1674 = _1508 == 0.0;
    bool _1676 = _1674 && _1658;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1684 = _1670 + _1682;
    float _1686 = in.m_75.x;
    float _1688 = in.m_75.y;
    float _1690 = in.m_75.z;
    float _1692 = in.m_75.w;
    float _1694 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1624);
    float _1696 = _1680 * _1680;
    float _1698 = _1684 * _1684;
    float _1700 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1626);
    float _1702 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1652);
    float _1704 = _1696 + _1698;
    float _1706 = _1660;
    float _1708 = _1520;
    float _1710 = _1650;
    float _1712 = _1696;
    float _1714 = _1698;
    float _1716 = _1668;
    float _1718 = _1670;
    float _1720 = _1606;
    if (_1676)
    {
        _1706 = _1636;
    }
    float _1722 = _1706;
    float _1724 = sqrt(_1704);
    float _1726 = _1722;
    if (!_1676)
    {
        float _1728 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1636);
        _1726 = _1728;
    }
    float _1730 = _1726;
    float _1732 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1676)
    {
        _1708 = _1632;
    }
    float _1734 = _1708;
    float _1736 = _1734;
    if (!_1676)
    {
        float _1738 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1736 = _1738;
    }
    float _1740 = _1736;
    if (_1676)
    {
        _1710 = _1634;
    }
    float _1742 = _1710;
    float _1744 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1732);
    float _1746 = _1742;
    if (!_1676)
    {
        float _1748 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1634);
        _1746 = _1748;
    }
    float _1750 = _1746;
    float _1752 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1744);
    float _1754 = _1664 * _1688;
    float _1756 = _1666 * _1688;
    float _1758 = _1672 * _1688;
    bool _1760 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = fma(_1604, _1686, _1754);
    float _1764 = _1690 * _1632;
    float _1766 = _1686 * _1634;
    float _1768 = _1688 * _1636;
    float _1770 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1772 = fma(_1606, _1686, _1756);
    float _1774 = fma(_1612, _1686, _1758);
    float _1776 = -_1764;
    float _1778 = fma(_1686, _1636, _1776);
    float _1780 = -_1766;
    float _1782 = fma(_1688, _1632, _1780);
    float _1784 = -_1768;
    float _1786 = fma(_1690, _1634, _1784);
    float _1788 = _902 + _1770;
    float _1790 = _1778 * _1692;
    float _1792 = _1782 * _1692;
    float _1794 = _1786 * _1692;
    float _1796 = fma(_1694, _1690, _1762);
    float _1798 = fma(_1700, _1690, _1772);
    float _1800 = fma(_1702, _1690, _1774);
    float _1802 = _1692;
    if (!_1760)
    {
        _1802 = _1788;
    }
    float _1804 = _1802;
    bool _1806 = !_1760;
    float _1808 = _1804;
    if (!_1806)
    {
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1814 = _1724 + _1812;
        float _1816 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1818 = rsqrt(_1704);
        float _1820 = _1814 * _1810;
        float _1822 = _1820 * 0.15915493667125701904296875;
        float _1824 = _1822 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1822 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = fma(_1826, _1816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1834 = _1818 * _1832;
        float _1836 = fma(_1680, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = _1830 + (-1.0);
        float _1840 = fma(_1684, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1850 = _1840 + _1848;
        float _1852 = _1844 * _1844;
        float _1854 = fma(_1788, _1830, _1846);
        float _1856 = _1850 * _1850;
        _1808 = _1854;
        _1712 = _1852;
        _1714 = _1856;
        _1716 = _1836;
        _1718 = _1840;
    }
    float _1858 = _1808;
    float _1860 = _1712;
    float _1862 = _1714;
    float _1864 = _1716;
    float _1866 = _1718;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1858 + _1868;
    float _1872 = _1664 * _1750;
    float _1874 = _1666 * _1750;
    float _1876 = _1672 * _1750;
    float _1878 = fma(_1870, _1870, _1860);
    float _1880 = _1790 * _1664;
    float _1882 = _1790 * _1666;
    float _1884 = _1790 * _1672;
    float _1886 = _1878 + _1862;
    float _1888 = fma(_1604, _1740, _1872);
    float _1890 = fma(_1606, _1740, _1874);
    float _1892 = fma(_1612, _1740, _1876);
    float _1894 = fma(_1794, _1604, _1880);
    float _1896 = fma(_1794, _1606, _1882);
    float _1898 = sqrt(_1886);
    float _1900 = fma(_1794, _1612, _1884);
    float _1902 = fma(_1694, _1730, _1888);
    float _1904 = fma(_1700, _1730, _1890);
    float _1906 = fma(_1702, _1730, _1892);
    float _1908 = fma(_1792, _1694, _1894);
    float _1910 = fma(_1792, _1700, _1896);
    float _1912 = fma(_1792, _1702, _1900);
    out.m_77.x = _1796;
    out.m_77.y = _1798;
    out.m_77.z = _1800;
    out.m_79.x = _1902;
    out.m_79.y = _1904;
    out.m_79.z = _1906;
    out.m_81.x = _1908;
    out.m_81.y = _1910;
    out.m_81.z = _1912;
    bool _1914 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1916 = isnan(_1898);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1922 = _1918 || _1920;
    float _1924 = _1910;
    if (!_1922)
    {
        _1720 = 1.0;
    }
    float _1926 = _1720;
    bool _1928 = !_1922;
    float _1930 = _1926;
    if (!_1928)
    {
        bool _1932 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1934 = isnan(_1898);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1944 = _1898 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1952 = _1950 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1954 = 1.0 / _1948;
            float _1956 = _1944 * _1954;
            float _1958 = fma(_1956, _1952, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1930 = _1958;
            _1960 = true;
        }
        else
        {
            bool _1962 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1964 = isnan(_1898);
            bool _1966 = _1962 || _1964;
            bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1970 = _1966 || _1968;
            if (!_1970)
            {
                float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1974 = _1898 + _1972;
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1976 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1984 = 1.0 / _1978;
                float _1986 = _1974 * _1984;
                float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1930 = _1988;
                _1960 = true;
            }
            else
            {
                _1930 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1960 = false;
    float _1990 = _1930;
    float _1992 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1994 = _1864 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1998 = _1858 + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2002 = _1866 + _2000;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = fma(_1994, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2016 = fma(_1998, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2018 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2020 = -_1228;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2024 = -_1226;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2016);
    float _2028 = -_1232;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2032 = _2026;
    float _2034 = _2022;
    float _2036 = _2030;
    if (!_2012)
    {
        float _2038 = _1394 * _1394;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_962;
        float _2044 = _2042 + _2014;
        float _2046 = -_944;
        float _2048 = _2046 + _2018;
        float _2050 = fma(_1400, _1400, _2038);
        float _2052 = fma(_1410, _1410, _2050);
        float _2054 = 1.0 / _1498;
        float _2056 = sqrt(_2052);
        float _2058 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = -_902;
        float _2064 = _2062 + _2016;
        float _2066 = _2060 * _2054;
        float _2068 = fma(_2044, _2066, _1386);
        float _2070 = fma(_2064, _2066, _1380);
        float _2072 = fma(_2048, _2066, _1390);
        _2032 = _2070;
        _2034 = _2068;
        _2036 = _2072;
    }
    float _2074 = _2032;
    float _2076 = _2034;
    float _2078 = _2036;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2074 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2078 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2098;
    float _2122 = _2110;
    float _2124 = _2118;
    float _2126 = _2082;
    float _2128 = _2100;
    float _2130 = _2102;
    if (_2114)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2132;
    }
    float _2134 = _2120;
    if (_2114)
    {
        float _2136 = rsqrt(_2110);
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = _2118 * _2134;
        _2124 = _2140;
    }
    float _2142 = _2124;
    if (_2114)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _1924 = _2144;
    }
    float _2146 = _1924;
    float _2148 = _2134;
    float _2150 = _2146;
    if (_2114)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2090;
    float _2164 = _2160;
    if (_2114)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2100;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = _2176;
    if (!_2114)
    {
        _2126 = _2106;
    }
    float _2180 = _2126;
    float _2182 = _2180;
    if (_2114)
    {
        float _2184 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2184;
    }
    float _2186 = _2164;
    float _2188 = _2156;
    float _2190 = _2186;
    if (_2114)
    {
        float _2192 = fma(_2156, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2198 = _2194;
    if (_2114)
    {
        float _2200 = _2170 + (-1.0);
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _2202;
    if (_2114)
    {
        float _2206 = _2138 * _2194;
        _2128 = _2206;
    }
    float _2208 = _2128;
    if (!_2114)
    {
        _2198 = _2104;
    }
    float _2210 = _2198;
    float _2212 = sqrt(_2096);
    float _2214 = _2210;
    if (_2114)
    {
        float _2216 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2216;
    }
    float _2218 = _2150;
    if (_2114)
    {
        float _2220 = _2102 * _2208;
        _2130 = _2220;
    }
    float _2222 = _2130;
    if (_2114)
    {
        float _2224 = _2104 * _2208;
        _2214 = _2224;
    }
    float _2226 = _2214;
    if (!_2114)
    {
        _2204 = _2108;
    }
    float _2228 = _2204;
    float _2230 = _2228;
    if (_2114)
    {
        float _2232 = fma(_2176, _2170, _2218);
        _2178 = _2232;
    }
    float _2234 = _2178;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2182 = _2236;
    }
    float _2238 = _2182;
    if (_2114)
    {
        float _2240 = _2226 * _2226;
        _2230 = _2240;
    }
    float _2242 = _2230;
    float _2244 = fma(_2234, _2234, _2238);
    float _2246 = _2244 + _2242;
    float _2248 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = rsqrt(_2246);
    float _2258 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2248);
    float _2260 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -_2254;
    float _2264 = _2262 + 1.0;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2268 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2270 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2272 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2276 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2268);
    float _2278 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2270);
    float _2280 = abs(_2264);
    float _2282 = log2(_2280);
    float _2284 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2286 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2294 = _2256 * _2222;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2196, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2306 = _2256 * _2234;
    float _2308 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2310 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2298);
    float _2312 = _2256 * _2226;
    float _2314 = log2(_2302);
    float _2316 = -_2308;
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2310);
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2332 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2334 = exp2(_2322);
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2324);
    float _2340 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2332);
    float _2342 = _2306 + 1.0;
    float _2344 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2338);
    float _2346 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2340);
    float _2348 = 1.0 / _2330;
    float _2350 = fma(_2328, 0.5, 0.5);
    float _2352 = _2314 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2346);
    float _2356 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2344);
    float _2358 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2360 = sqrt(_2336);
    float _2362 = -_2306;
    float _2364 = fma(_2334, _2342, _2362);
    float _2366 = fma(_2350, _2358, -0.212114393711090087890625);
    float _2368 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2370 = fma(_2350, _2366, 1.570728778839111328125);
    float _2372 = _2354 * _2348;
    float _2374 = _2356 * _2348;
    float _2376 = fma(_2372, 0.5, 0.5);
    float _2378 = fma(_2374, -0.5, 0.5);
    float _2380 = fma(_2364, 0.5, 0.5);
    float _2382 = _2360 * 0.636619746685028076171875;
    float3 _6150 = float3(_2376, _2378, _2368);
    float _2384 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6150, float3(0.0), isnan(_6150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6150, float3(0.0), isnan(_6150)), level(0.0)).x;
    float3 _6161 = float3(_2376, _2378, _2368);
    float4 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).xyzw;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = _2387.w;
    float _2397 = -_2370;
    float _2399 = fma(_2382, _2397, 1.0);
    float2 _6183 = float2(_2399, _2380);
    float3 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).xyz;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2413 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2415 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2413);
    float _2419 = exp2(_2411);
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2354 + _2330;
    float _2427 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2429 = _2425 * 0.5;
    float _2431 = _2330 * 0.5;
    out.m_47.x = _2421;
    float _2433 = _2427 + _2330;
    out.gl_Position.x = _2354;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _2427;
    out.gl_Position.w = _2330;
    float _2435 = _2433 * 0.5;
    float _2437 = -_2419;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2443 = fma(_2356, -0.5, _2431);
    out.m_83.x = _2429;
    out.m_83.y = _2443;
    out.m_83.z = _2435;
    out.m_83.w = _2330;
    float _2445 = _2441 * _2384;
    float _2447 = -_2441;
    float _2449 = _2447 + 1.0;
    float _2451 = _2395 * _2445;
    float _2453 = _2409 * _2445;
    float _2455 = fma(_2405, _2451, _2389);
    float _2457 = fma(_2407, _2451, _2391);
    float _2459 = _2395 * _2449;
    float _2461 = fma(_2395, _2453, _2393);
    out.m_85.x = _2455;
    out.m_85.y = _2457;
    out.m_85.z = _2461;
    out.m_85.w = _2459;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1960 = false;
    bool _614 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_120);
        out.gl_Position.z = _2518;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2587 = as_type<float>(_158);
        out.gl_Position.z = _2587;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _164 * _162;
    float _180 = 0.0;
    if (!_176)
    {
        float _182 = _166 * _166;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_176)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _210 = _208 != 0;
    float _212 = _206 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = 1.4012984643248170709237295832899e-45;
    float _218 = _194;
    if (!_176)
    {
        _216 = _166;
    }
    float _220 = _216;
    float _222 = -_204;
    float _224 = _188 + _222;
    bool _226 = !_176;
    float _228 = _220;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _166 * _232;
        float _242 = 1.0 / _236;
        float _244 = _238 * 0.693147182464599609375;
        float _246 = exp2(_240);
        float _248 = 1.0 / _244;
        float _250 = _246 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _248, _166);
        float _256 = _254 * _242;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _258;
    }
    float _260 = _218;
    bool _262 = !_176;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _166 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _228 = _282;
    }
    float _284 = _228;
    float _286 = in.m_53.w;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _300 = _298 != 0;
    float _302 = fma(_214, 0.5, 0.5);
    bool _304 = _224 < 0.5;
    float _306 = float(_304);
    float _308 = -_224;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _312 = !_210;
    int _314 = _312 ? 0 : 1;
    float _316 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _318 = !_296;
    int _320 = _318 ? 0 : 1;
    float _322 = -_306;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _326 = -_302;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = fma(_284, _196, _316);
    int _332 = abs(_320);
    float _334 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _336 = abs(_314);
    bool _338 = !_300;
    int _340 = _338 ? 0 : 1;
    float _342 = fma(_284, _198, _334);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _346 = abs(_340);
    float _348 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = float(_332);
    float _352 = fma(_330, _286, _288);
    float _354 = float(_336);
    float _356 = fma(_342, _286, _290);
    float _358 = abs(_310);
    float _360 = _350 * _358;
    float _362 = fma(_284, _200, _348);
    float _364 = float(_346);
    float _366 = fma(_354, _328, _360);
    float _368 = fma(_362, _286, _292);
    float _370 = abs(_324);
    float _372 = fma(_364, _370, _366);
    bool _374 = !_344;
    bool _376 = _296;
    float _392;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_104);
        float _398 = 1.0 / _396;
        float _400 = _138 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _528 = _480 * _504;
    float _530 = _522 * _520;
    float _532 = _524 * _520;
    float _534 = _526 * _520;
    float _536 = -_496;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _550 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _562;
    float _566 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = fma(_556, _528, _548);
    float _574 = fma(_554, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _576 = fma(_564, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _578 = fma(_558, _528, _550);
    float _580 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _582 = fma(_566, _528, _560);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _578);
    float _588 = fma(_580, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    bool _596 = !_442;
    float _612;
    if (!_596)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_104);
        float _618 = 1.0 / _616;
        float _620 = _138 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = in.m_51.w;
    float _626 = _160 * 2.0;
    float _628 = in.m_55.x;
    float _630 = in.m_55.y;
    float _632 = in.m_55.z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _636 = _634 != 0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _642 = _640 != 0;
    float _644 = in.m_57.x;
    float _646 = in.m_57.y;
    float _648 = in.m_57.z;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _652 = _650 != 0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_59.x;
    float _664 = in.m_59.y;
    float _666 = in.m_59.z;
    float _668 = floor(_626);
    float _670 = in.m_61.x;
    if (_636)
    {
        bool _672 = _160 > 0.5;
        _376 = _672;
    }
    bool _674 = _376;
    float _676 = in.m_63.x;
    float _678 = in.m_63.y;
    float _680 = 1.0 / _656;
    bool _682 = _624 > 0.5;
    float _684 = 0.0;
    bool _686 = _682;
    if (_642)
    {
        float _688 = in.m_51.z;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _356 * _630;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _696 = in.m_51.y;
    float _698 = _356 * _646;
    float _700 = _356 * _664;
    float _702 = fma(_352, _644, _698);
    float _704 = _630;
    float _706 = _646;
    int _708 = as_type<int>(_644);
    if (!_636)
    {
        _704 = _670;
    }
    float _710 = _704;
    float _712 = fma(_352, _662, _700);
    float _714 = in.m_61.y;
    float _716 = _710;
    if (!_636)
    {
        _706 = _710;
    }
    float _718 = _706;
    float _720 = _718;
    if (_636)
    {
        _716 = _670;
    }
    float _722 = _716;
    float _724 = fma(_352, _628, _692);
    float _726 = abs(_676);
    float _728 = abs(_678);
    float _730 = precise::max(_726, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = _722;
    if (_636)
    {
        float _736 = -_722;
        float _738 = _736 + 1.0;
        _708 = as_type<int>(_738);
    }
    int _740 = _708;
    float _742 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _744 = _730 >= 16.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _746;
    if (_636)
    {
        float _750 = _674 ? as_type<float>(_740) : _722;
        _720 = _750;
    }
    float _752 = _720;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _756 = _668 > 0.0;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _760 = _668 >= 0.0;
    bool _762 = isnan(_668);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _772 = _622 + _770;
    bool _774 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _776 = isnan(_622);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _748 * _680;
    float _788 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _790 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _792 = isnan(_622);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_784;
    float _804 = _802 + 1.0;
    float _806 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _810 = fma(_368, _632, _724);
    float _812 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _814 = _800 * _804;
    float _816 = -_714;
    float _818 = _816 + 1.0;
    out.m_65.x = _742;
    out.m_65.y = _788;
    out.m_65.z = _806;
    out.m_65.w = _808;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _812 * _814;
    float _824 = fma(_368, _648, _702);
    float _826 = fma(_368, _666, _712);
    float _828 = -_800;
    float _830 = _828 + 1.0;
    int _832 = _682 ? as_type<int>(_818) : as_type<int>(_714);
    float _834 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _836 = as_type<int>(_806);
    float _838 = _714;
    if (_642)
    {
        bool _840 = _690 > 0.5;
        _686 = _840;
    }
    bool _842 = _686;
    float _844 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[115].x, _822);
    float _846 = _652 ? as_type<float>(_832) : _714;
    float _848 = in.m_51.z;
    float _850 = _160 + _696;
    bool _852 = _696 > 0.5;
    float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _856 = _846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _858 = _842;
    if (_642)
    {
        float _860 = -_722;
        float _862 = _860 + 1.0;
        _836 = as_type<int>(_862);
    }
    int _864 = _836;
    float _866 = _850 + (-1.0);
    if (_660)
    {
        float _868 = _852 ? _818 : _714;
        _838 = _868;
    }
    float _870 = _838;
    float _872 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[116].x, _844);
    if (_642)
    {
        float _874 = _842 ? as_type<float>(_864) : _722;
        _734 = _874;
    }
    float _876 = _734;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _880 = _870 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = _880 * _694;
    float _888 = _856 * _854;
    float _890 = _834 * _820;
    float _892 = _696 * 2.0;
    float _894 = _678 * 0.0625;
    float _896 = _884 * _638;
    float _898 = _676 * 0.0625;
    float _900 = _848 * 2.0;
    float _902 = _824 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _904 = floor(_892);
    float _906 = _744 ? _894 : _678;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _910 = _744 ? _898 : _676;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _914 = abs(_906);
    bool _916 = _914 != 0.0;
    bool _918 = isnan(_914);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _928 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = floor(_900);
    float _932 = abs(_910);
    bool _934 = _932 == 0.0;
    bool _936 = !_924;
    bool _938 = _934 && _936;
    float _940 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _826 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_67.x = _890;
    out.m_67.y = _886;
    out.m_67.z = _896;
    out.m_67.w = _888;
    bool _946 = _904 > 0.0;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _944 + _948;
    bool _952 = _904 >= 0.0;
    bool _954 = isnan(_904);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _902 + _964;
    out.m_69.x = _928;
    out.m_69.y = _940;
    out.m_69.z = _942;
    out.m_69.w = _882;
    int _968 = as_type<int>(_900);
    int _970 = _938 ? (-1) : 0;
    float _972 = _882;
    int _974 = as_type<int>(_966);
    if (_938)
    {
        bool _976 = as_type<int>(_910) >= 0;
        _858 = _976;
    }
    bool _978 = _858;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _962 + _980;
    float _984 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _986 = _966 * _966;
    if (_938)
    {
        int _988 = _978 ? 0 : 1078530011;
        _968 = _988;
    }
    int _990 = _968;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[28].x, _984);
    float _994 = fma(_982, _982, _986);
    bool _996 = _930 > 0.0;
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[28].z, _992);
    float _1000 = fma(_950, _950, _994);
    int _1002 = _960 ? 0 : 1;
    int _1004 = _768 ? 0 : 1;
    bool _1006 = _930 >= 0.0;
    bool _1008 = isnan(_930);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = rsqrt(_1000);
    float _1018 = _696 + _848;
    bool _1020 = _998 >= 0.0;
    int _1022 = _1014 ? 0 : 1;
    float _1024 = _1018 + (-1.0);
    float _1026 = abs(_910);
    bool _1028 = _1026 == 0.0;
    int _1030 = ~_1004;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = ~_1002;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    int _1050 = _1034;
    int _1052 = _1040;
    int _1054 = _1048;
    float _1056 = _1024;
    int _1058 = _990;
    if (!_756)
    {
        int _1060 = ~_1004;
        int _1062 = _1060 + 1;
        _1050 = _1062;
    }
    int _1064 = _1050;
    if (!_946)
    {
        int _1066 = ~_1002;
        int _1068 = _1066 + 1;
        _1052 = _1068;
    }
    int _1070 = _1052;
    if (!_996)
    {
        int _1072 = ~_1022;
        int _1074 = _1072 + 1;
        _1054 = _1074;
    }
    int _1076 = _1054;
    if (_938)
    {
        int _1078 = int(0x80000000) & as_type<int>(_906);
        int _1080 = _990 | _1078;
        _1056 = as_type<float>(_1080);
    }
    float _1082 = _1056;
    bool _1084 = !_924;
    bool _1086 = _1084 && _1028;
    float _1088 = _1082;
    float _1090 = _1082;
    if (!_1086)
    {
        float _1092 = abs(_906);
        bool _1094 = _1092 != as_type<float>(0x7f800000u /* inf */);
        bool _1096 = isnan(_1092);
        bool _1098 = _1094 || _1096;
        bool _1100 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1102 = _1098 || _1100;
        float _1104 = abs(_910);
        bool _1106 = _1104 == as_type<float>(0x7f800000u /* inf */);
        float _1108 = abs(_910);
        bool _1110 = _1108 == as_type<float>(0x7f800000u /* inf */);
        bool _1112 = !_1102;
        bool _1114 = _1110 && _1112;
        if (_1114)
        {
            bool _1116 = as_type<int>(_910) >= 0;
            _970 = _1116 ? (-1) : 0;
        }
        int _1118 = _970;
        if (_1114)
        {
            _1058 = 1075235812;
        }
        int _1120 = _1058;
        int _1122 = _1120;
        if (_1114)
        {
            int _1124 = ~_1118;
            int _1126 = (_1124 != 0) ? _1120 : 1061752795;
            _1122 = _1126;
        }
        int _1128 = _1122;
        if (_1114)
        {
            int _1130 = int(0x80000000) & as_type<int>(_906);
            int _1132 = _1128 | _1130;
            _1088 = as_type<float>(_1132);
        }
        float _1134 = _1088;
        bool _1136 = !_1102;
        bool _1138 = _1136 && _1106;
        _1090 = _1134;
        if (!_1138)
        {
            float _1140 = abs(_906);
            float _1142 = abs(_910);
            float _1144 = precise::max(_1140, _1142);
            float _1146 = abs(_906);
            float _1148 = abs(_910);
            float _1150 = precise::min(_1146, _1148);
            float _1152 = 1.0 / _1144;
            float _1154 = abs(_906);
            float _1156 = abs(_910);
            bool _1158 = _1154 > _1156;
            bool _1160 = as_type<int>(_910) >= 0;
            float _1162 = _1150 * _1152;
            float _1164 = abs(_906);
            float _1166 = abs(_910);
            float _1168 = _1164 + _1166;
            int _1170 = as_type<int>(_906) & int(0x80000000);
            float _1172 = _1162 * _1162;
            bool _1174 = _1168 > as_type<float>(0x7f800000u /* inf */);
            bool _1176 = isnan(_1168);
            bool _1178 = _1174 || _1176;
            bool _1180 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1182 = _1178 || _1180;
            float _1184 = _1172 + 11.33538818359375;
            float _1186 = fma(_1172, _1184, 28.84246826171875);
            float _1188 = fma(_1172, _1186, 19.6966705322265625);
            float _1190 = fma(_1172, -0.82336294651031494140625, -5.674867153167724609375);
            float _1192 = fma(_1172, _1190, -6.565555095672607421875);
            float _1194 = 1.0 / _1188;
            float _1196 = _1172 * _1192;
            float _1198 = _1162 * _1196;
            float _1200 = fma(_1198, _1194, _1162);
            float _1202 = _1200;
            _1090 = _1168;
            if (_1158)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 1.57079637050628662109375;
                _1202 = _1206;
            }
            float _1208 = _1202;
            int _1210 = as_type<int>(_1208);
            if (!_1160)
            {
                float _1212 = -_1208;
                float _1214 = _1212 + 3.1415927410125732421875;
                _1210 = as_type<int>(_1214);
            }
            int _1216 = _1210;
            if (!_1182)
            {
                int _1218 = _1170 | _1216;
                _1090 = as_type<float>(_1218);
            }
        }
    }
    float _1220 = _1090;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    float _1226 = _966 * _1016;
    float _1228 = _982 * _1016;
    float _1230 = precise::max(_1220, -3.1415927410125732421875);
    float _1232 = _950 * _1016;
    float _1234 = -_1226;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    if (_1020)
    {
        _972 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1242 = _972;
    float _1244 = _1236 * _1236;
    if (_1020)
    {
        out.m_47.x = 0.0;
    }
    if (_1020)
    {
        float _1246 = _1242 * 5.0;
        _974 = as_type<int>(_1246);
    }
    int _1248 = _974;
    float _1250 = fma(_1240, _1240, _1244);
    float _1252 = -_1232;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1256 = _1224 * _138;
    float _1258 = precise::min(_1230, 3.1415927410125732421875);
    float _1260 = fma(_1254, _1254, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1272 = _1270 != 0;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1276 = 1.0 + _1274;
    if (_1020)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4331 = as_type<float>(_1248);
        out.gl_Position.z = _4331;
    }
    float _1278 = exp2(_1256);
    float _1280 = fma(_1258, 0.15915493667125701904296875, 0.5);
    bool _1282 = !_1264;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = in.m_71.x;
    float _1288 = in.m_71.y;
    float _1290 = in.m_71.z;
    bool _1292 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(1.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = fma(_138, 0.06666667759418487548828125, _1280);
    bool _1304 = !_1268;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = 1.0 / _1276;
    int _1310 = abs(_1284);
    float _1312 = _1302 * 6.283185482025146484375;
    bool _1314 = !_1272;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = abs(_1306);
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1278;
    float _1332 = _1330 + 1.0;
    float _1334 = float(_1076);
    float _1336 = sqrt(_1260);
    int _1338 = abs(_1316);
    float _1340 = float(_1310);
    float _1342 = float(_1064);
    float _1344 = _1340 * _1334;
    float _1346 = float(_1318);
    float _1348 = _1328 ? _1332 : 0.0;
    float _1350 = float(_1070);
    float _1352 = _1346 * _1342;
    float _1354 = float(_1338);
    if (_1300)
    {
        float _1356 = _1348 * _1308;
        _142 = _1356;
    }
    float _1358 = _142;
    float _1360 = _1344 * (-2.0);
    float _1362 = _1352 * (-2.0);
    float _1364 = _1354 * _1350;
    float _1366 = _160 + (-0.5);
    float _1368 = fma(_1360, _1286, _1286);
    float _1370 = fma(_878, _1360, _878);
    float _1372 = fma(_1042, _1362, _1042);
    float _1374 = fma(_1362, _1288, _1288);
    float _1376 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1368);
    if (_1020)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1378 = -_1226;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1382 = fma(_1370, _1358, _1376);
    float _1384 = -_1228;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1388 = -_1232;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1380 + _1392;
    float _1396 = _696 + (-0.5);
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1400 = _1386 + _1398;
    float _1402 = _1312 * 0.15915493667125701904296875;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1406 = _160 + _848;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1410 = _1390 + _1408;
    float _1412 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1414 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1404);
    float _1416 = _1406 + (-1.0);
    float _1418 = _1364 * (-2.0);
    float _1420 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1414);
    float _1422 = fma(_1372, _1358, _1412);
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1418, _1290, _1290);
    float _1428 = _848 + (-0.5);
    bool _1430 = _1420 >= 0.0;
    float _1432 = fma(_1424, _1418, _1424);
    float _1434 = _1382 * 0.15915493667125701904296875;
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1438 = in.m_53.x;
    float _1440 = in.m_53.y;
    float _1442 = in.m_53.z;
    float _1444 = _1422 * 0.15915493667125701904296875;
    float _1446 = _1434 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = fma(_1432, _1358, _1436);
    float _1452 = in.m_63.z;
    float _1454 = _1450 * 0.15915493667125701904296875;
    float _1456 = _1422;
    if (_1430)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1458 = _1456;
    float _1460 = _1434 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    int _1464 = as_type<int>(_1458);
    if (_1430)
    {
        out.m_47.x = 0.0;
    }
    if (_1430)
    {
        float _1466 = _1458 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1402 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1430)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4623 = as_type<float>(_1468);
        out.gl_Position.z = _4623;
    }
    float _1474 = _1444 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = _1444 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _1454 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    if (_1430)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1486 = _1454 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = _592 * _1440;
    float _1492 = _590 * _1438;
    float _1494 = fma(_1472, 0.5, 1.5);
    float _1496 = _594 * _1442;
    float _1498 = _1016 * _1336;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1502 = _1494 * _676;
    float _1504 = _1494 * _678;
    float _1506 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1508 = _1494 * _1452;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1512 = _1448 * _1476;
    float _1514 = _1462 * _1480;
    float _1516 = _1462 * _1476;
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1502);
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1522 = _1498 * _1500;
    float _1524 = _1498 * _1506;
    float _1526 = _1462 * _1488;
    float _1528 = _1448 * _1480;
    float _1530 = _1498 * _1510;
    float _1532 = fma(_1484, _1514, _1512);
    float _1534 = _1518 * _1522;
    float _1536 = _1520 * _1524;
    float _1538 = fma(_1484, _1512, _1514);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1544 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1546 = _1480 * _1488;
    float _1548 = _1448 * _1488;
    float _1550 = _1476 * _1488;
    float _1552 = -_1516;
    float _1554 = fma(_1484, _1528, _1552);
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = -_1528;
    float _1560 = fma(_1484, _1516, _1558);
    float _1562 = _1526 * _1536;
    float _1564 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1566 = -_1484;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    float _1570 = -_1484;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1542);
    float _1574 = -_1484;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1544);
    float _1578 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1580 = -_1536;
    float _1582 = _1484 * _1580;
    float _1584 = _1548 * _1536;
    float _1586 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1588 = _1556 * _1530;
    float _1590 = fma(_1532, _1534, _1562);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1564);
    float _1594 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1578);
    float _1596 = fma(_1546, _1534, _1582);
    float _1598 = fma(_1554, _1534, _1584);
    float _1600 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1586);
    float _1602 = fma(_1560, _1588, _1590);
    float _1604 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1592);
    float _1606 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1608 = fma(_1550, _1588, _1596);
    float _1610 = fma(_1538, _1588, _1598);
    float _1612 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1614 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1616 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1618 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1620 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1614);
    float _1626 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1616);
    float _1628 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1620);
    float _1630 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1632 = in.m_73.x;
    float _1634 = in.m_73.y;
    float _1636 = in.m_73.z;
    bool _1638 = _1504 != 0.0;
    bool _1640 = isnan(_1504);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1628);
    float _1650 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1652 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1618);
    bool _1654 = _1502 == 0.0;
    bool _1656 = !_1646;
    bool _1658 = _1654 && _1656;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1662 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1664 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1568);
    float _1666 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1572);
    float _1668 = _962 + _1660;
    float _1670 = _944 + _1662;
    float _1672 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1576);
    bool _1674 = _1508 == 0.0;
    bool _1676 = _1674 && _1658;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1684 = _1670 + _1682;
    float _1686 = in.m_75.x;
    float _1688 = in.m_75.y;
    float _1690 = in.m_75.z;
    float _1692 = in.m_75.w;
    float _1694 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1624);
    float _1696 = _1680 * _1680;
    float _1698 = _1684 * _1684;
    float _1700 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1626);
    float _1702 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1652);
    float _1704 = _1696 + _1698;
    float _1706 = _1660;
    float _1708 = _1520;
    float _1710 = _1650;
    float _1712 = _1696;
    float _1714 = _1698;
    float _1716 = _1668;
    float _1718 = _1670;
    float _1720 = _1606;
    if (_1676)
    {
        _1706 = _1636;
    }
    float _1722 = _1706;
    float _1724 = sqrt(_1704);
    float _1726 = _1722;
    if (!_1676)
    {
        float _1728 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1636);
        _1726 = _1728;
    }
    float _1730 = _1726;
    float _1732 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1676)
    {
        _1708 = _1632;
    }
    float _1734 = _1708;
    float _1736 = _1734;
    if (!_1676)
    {
        float _1738 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1736 = _1738;
    }
    float _1740 = _1736;
    if (_1676)
    {
        _1710 = _1634;
    }
    float _1742 = _1710;
    float _1744 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1732);
    float _1746 = _1742;
    if (!_1676)
    {
        float _1748 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1634);
        _1746 = _1748;
    }
    float _1750 = _1746;
    float _1752 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1744);
    float _1754 = _1664 * _1688;
    float _1756 = _1666 * _1688;
    float _1758 = _1672 * _1688;
    bool _1760 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = fma(_1604, _1686, _1754);
    float _1764 = _1690 * _1632;
    float _1766 = _1686 * _1634;
    float _1768 = _1688 * _1636;
    float _1770 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1772 = fma(_1606, _1686, _1756);
    float _1774 = fma(_1612, _1686, _1758);
    float _1776 = -_1764;
    float _1778 = fma(_1686, _1636, _1776);
    float _1780 = -_1766;
    float _1782 = fma(_1688, _1632, _1780);
    float _1784 = -_1768;
    float _1786 = fma(_1690, _1634, _1784);
    float _1788 = _902 + _1770;
    float _1790 = _1778 * _1692;
    float _1792 = _1782 * _1692;
    float _1794 = _1786 * _1692;
    float _1796 = fma(_1694, _1690, _1762);
    float _1798 = fma(_1700, _1690, _1772);
    float _1800 = fma(_1702, _1690, _1774);
    float _1802 = _1692;
    if (!_1760)
    {
        _1802 = _1788;
    }
    float _1804 = _1802;
    bool _1806 = !_1760;
    float _1808 = _1804;
    if (!_1806)
    {
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1814 = _1724 + _1812;
        float _1816 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1818 = rsqrt(_1704);
        float _1820 = _1814 * _1810;
        float _1822 = _1820 * 0.15915493667125701904296875;
        float _1824 = _1822 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1822 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        float _1832 = fma(_1826, _1816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1834 = _1818 * _1832;
        float _1836 = fma(_1680, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = _1830 + (-1.0);
        float _1840 = fma(_1684, _1834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1850 = _1840 + _1848;
        float _1852 = _1844 * _1844;
        float _1854 = fma(_1788, _1830, _1846);
        float _1856 = _1850 * _1850;
        _1808 = _1854;
        _1712 = _1852;
        _1714 = _1856;
        _1716 = _1836;
        _1718 = _1840;
    }
    float _1858 = _1808;
    float _1860 = _1712;
    float _1862 = _1714;
    float _1864 = _1716;
    float _1866 = _1718;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1858 + _1868;
    float _1872 = _1664 * _1750;
    float _1874 = _1666 * _1750;
    float _1876 = _1672 * _1750;
    float _1878 = fma(_1870, _1870, _1860);
    float _1880 = _1790 * _1664;
    float _1882 = _1790 * _1666;
    float _1884 = _1790 * _1672;
    float _1886 = _1878 + _1862;
    float _1888 = fma(_1604, _1740, _1872);
    float _1890 = fma(_1606, _1740, _1874);
    float _1892 = fma(_1612, _1740, _1876);
    float _1894 = fma(_1794, _1604, _1880);
    float _1896 = fma(_1794, _1606, _1882);
    float _1898 = sqrt(_1886);
    float _1900 = fma(_1794, _1612, _1884);
    float _1902 = fma(_1694, _1730, _1888);
    float _1904 = fma(_1700, _1730, _1890);
    float _1906 = fma(_1702, _1730, _1892);
    float _1908 = fma(_1792, _1694, _1894);
    float _1910 = fma(_1792, _1700, _1896);
    float _1912 = fma(_1792, _1702, _1900);
    out.m_77.x = _1796;
    out.m_77.y = _1798;
    out.m_77.z = _1800;
    out.m_79.x = _1902;
    out.m_79.y = _1904;
    out.m_79.z = _1906;
    out.m_81.x = _1908;
    out.m_81.y = _1910;
    out.m_81.z = _1912;
    bool _1914 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1916 = isnan(_1898);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1922 = _1918 || _1920;
    float _1924 = _1910;
    if (!_1922)
    {
        _1720 = 1.0;
    }
    float _1926 = _1720;
    bool _1928 = !_1922;
    float _1930 = _1926;
    if (!_1928)
    {
        bool _1932 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1934 = isnan(_1898);
        bool _1936 = _1932 || _1934;
        bool _1938 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1940 = _1936 || _1938;
        if (!_1940)
        {
            float _1942 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1944 = _1898 + _1942;
            float _1946 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1948 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1946;
            float _1950 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1952 = _1950 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1954 = 1.0 / _1948;
            float _1956 = _1944 * _1954;
            float _1958 = fma(_1956, _1952, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1930 = _1958;
            _1960 = true;
        }
        else
        {
            bool _1962 = _1898 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1964 = isnan(_1898);
            bool _1966 = _1962 || _1964;
            bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1970 = _1966 || _1968;
            if (!_1970)
            {
                float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1974 = _1898 + _1972;
                float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1978 = _1976 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1984 = 1.0 / _1978;
                float _1986 = _1974 * _1984;
                float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1930 = _1988;
                _1960 = true;
            }
            else
            {
                _1930 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1960 = false;
    float _1990 = _1930;
    float _1992 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1994 = _1864 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1998 = _1858 + _1996;
    float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2002 = _1866 + _2000;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    float _2014 = fma(_1994, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2016 = fma(_1998, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2018 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2020 = -_1228;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2014);
    float _2024 = -_1226;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2016);
    float _2028 = -_1232;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2018);
    float _2032 = _2026;
    float _2034 = _2022;
    float _2036 = _2030;
    if (!_2012)
    {
        float _2038 = _1394 * _1394;
        float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2042 = -_962;
        float _2044 = _2042 + _2014;
        float _2046 = -_944;
        float _2048 = _2046 + _2018;
        float _2050 = fma(_1400, _1400, _2038);
        float _2052 = fma(_1410, _1410, _2050);
        float _2054 = 1.0 / _1498;
        float _2056 = sqrt(_2052);
        float _2058 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2060 = _2058 * _2040;
        float _2062 = -_902;
        float _2064 = _2062 + _2016;
        float _2066 = _2060 * _2054;
        float _2068 = fma(_2044, _2066, _1386);
        float _2070 = fma(_2064, _2066, _1380);
        float _2072 = fma(_2048, _2066, _1390);
        _2032 = _2070;
        _2034 = _2068;
        _2036 = _2072;
    }
    float _2074 = _2032;
    float _2076 = _2034;
    float _2078 = _2036;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2074 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2076 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2078 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2098;
    float _2122 = _2110;
    float _2124 = _2118;
    float _2126 = _2082;
    float _2128 = _2100;
    float _2130 = _2102;
    if (_2114)
    {
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2132;
    }
    float _2134 = _2120;
    if (_2114)
    {
        float _2136 = rsqrt(_2110);
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = _2118 * _2134;
        _2124 = _2140;
    }
    float _2142 = _2124;
    if (_2114)
    {
        float _2144 = _2142 * 0.15915493667125701904296875;
        _1924 = _2144;
    }
    float _2146 = _1924;
    float _2148 = _2134;
    float _2150 = _2146;
    if (_2114)
    {
        float _2152 = _2146 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        _2148 = _2154;
    }
    float _2156 = _2148;
    float _2158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2160 = precise::max(0.0, _2158);
    float _2162 = _2090;
    float _2164 = _2160;
    if (_2114)
    {
        float _2166 = _2146 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2162 = _2168;
    }
    float _2170 = _2162;
    float _2172 = -_2100;
    float _2174 = -_2160;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = _2176;
    if (!_2114)
    {
        _2126 = _2106;
    }
    float _2180 = _2126;
    float _2182 = _2180;
    if (_2114)
    {
        float _2184 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2164 = _2184;
    }
    float _2186 = _2164;
    float _2188 = _2156;
    float _2190 = _2186;
    if (_2114)
    {
        float _2192 = fma(_2156, _2186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2198 = _2194;
    if (_2114)
    {
        float _2200 = _2170 + (-1.0);
        _2190 = _2200;
    }
    float _2202 = _2190;
    float _2204 = _2202;
    if (_2114)
    {
        float _2206 = _2138 * _2194;
        _2128 = _2206;
    }
    float _2208 = _2128;
    if (!_2114)
    {
        _2198 = _2104;
    }
    float _2210 = _2198;
    float _2212 = sqrt(_2096);
    float _2214 = _2210;
    if (_2114)
    {
        float _2216 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2216;
    }
    float _2218 = _2150;
    if (_2114)
    {
        float _2220 = _2102 * _2208;
        _2130 = _2220;
    }
    float _2222 = _2130;
    if (_2114)
    {
        float _2224 = _2104 * _2208;
        _2214 = _2224;
    }
    float _2226 = _2214;
    if (!_2114)
    {
        _2204 = _2108;
    }
    float _2228 = _2204;
    float _2230 = _2228;
    if (_2114)
    {
        float _2232 = fma(_2176, _2170, _2218);
        _2178 = _2232;
    }
    float _2234 = _2178;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2182 = _2236;
    }
    float _2238 = _2182;
    if (_2114)
    {
        float _2240 = _2226 * _2226;
        _2230 = _2240;
    }
    float _2242 = _2230;
    float _2244 = fma(_2234, _2234, _2238);
    float _2246 = _2244 + _2242;
    float _2248 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2252 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2250);
    float _2254 = precise::clamp(_2252, 0.0, 1.0);
    float _2256 = rsqrt(_2246);
    float _2258 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2248);
    float _2260 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -_2254;
    float _2264 = _2262 + 1.0;
    float _2266 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2268 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2270 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2272 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2274 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2276 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2268);
    float _2278 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2270);
    float _2280 = abs(_2264);
    float _2282 = log2(_2280);
    float _2284 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2272);
    float _2286 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2276);
    float _2288 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2284);
    float _2294 = _2256 * _2222;
    float _2296 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2196, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2306 = _2256 * _2234;
    float _2308 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2310 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2298);
    float _2312 = _2256 * _2226;
    float _2314 = log2(_2302);
    float _2316 = -_2308;
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2310);
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2324 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2320);
    float _2332 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2334 = exp2(_2322);
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2324);
    float _2340 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2332);
    float _2342 = _2306 + 1.0;
    float _2344 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2338);
    float _2346 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2340);
    float _2348 = 1.0 / _2330;
    float _2350 = fma(_2328, 0.5, 0.5);
    float _2352 = _2314 * 0.693147182464599609375;
    float _2354 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2346);
    float _2356 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2344);
    float _2358 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2360 = sqrt(_2336);
    float _2362 = -_2306;
    float _2364 = fma(_2334, _2342, _2362);
    float _2366 = fma(_2350, _2358, -0.212114393711090087890625);
    float _2368 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2370 = fma(_2350, _2366, 1.570728778839111328125);
    float _2372 = _2354 * _2348;
    float _2374 = _2356 * _2348;
    float _2376 = fma(_2372, 0.5, 0.5);
    float _2378 = fma(_2374, -0.5, 0.5);
    float _2380 = fma(_2364, 0.5, 0.5);
    float _2382 = _2360 * 0.636619746685028076171875;
    float3 _6150 = float3(_2376, _2378, _2368);
    float _2384 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6150, float3(0.0), isnan(_6150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6150, float3(0.0), isnan(_6150)), level(0.0)).x;
    float3 _6161 = float3(_2376, _2378, _2368);
    float4 _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).xyzw;
    float _2389 = _2387.x;
    float _2391 = _2387.y;
    float _2393 = _2387.z;
    float _2395 = _2387.w;
    float _2397 = -_2370;
    float _2399 = fma(_2382, _2397, 1.0);
    float2 _6183 = float2(_2399, _2380);
    float3 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6183, float2(0.0), isnan(_6183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6183, float2(0.0), isnan(_6183)), level(0.0)).xyz;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2413 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2415 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2413);
    float _2419 = exp2(_2411);
    float _2421 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2423 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2417);
    float _2425 = _2354 + _2330;
    float _2427 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2423);
    float _2429 = _2425 * 0.5;
    float _2431 = _2330 * 0.5;
    out.m_47.x = _2421;
    float _2433 = _2427 + _2330;
    out.gl_Position.x = _2354;
    out.gl_Position.y = _2356;
    out.gl_Position.z = _2427;
    out.gl_Position.w = _2330;
    float _2435 = _2433 * 0.5;
    float _2437 = -_2419;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2443 = fma(_2356, -0.5, _2431);
    out.m_83.x = _2429;
    out.m_83.y = _2443;
    out.m_83.z = _2435;
    out.m_83.w = _2330;
    float _2445 = _2441 * _2384;
    float _2447 = -_2441;
    float _2449 = _2447 + 1.0;
    float _2451 = _2395 * _2445;
    float _2453 = _2409 * _2445;
    float _2455 = fma(_2405, _2451, _2389);
    float _2457 = fma(_2407, _2451, _2391);
    float _2459 = _2395 * _2449;
    float _2461 = fma(_2395, _2453, _2393);
    out.m_85.x = _2455;
    out.m_85.y = _2457;
    out.m_85.z = _2461;
    out.m_85.w = _2459;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

