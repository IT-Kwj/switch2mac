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
    float4 m_69 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1843 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_120);
        out.gl_Position.z = _2127;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
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
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2198 = as_type<float>(_160);
        out.gl_Position.z = _2198;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.z;
    float _164 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _180 = _162 * 2.0;
    float _182 = floor(_180);
    float _184 = _166 * 2.0;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _166 + _162;
    float _190 = _170 * 2.0;
    float _192 = -_168;
    float _194 = fma(_186, 2.0, _192);
    float _196 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _198 = floor(_184);
    float _200 = _170 + _166;
    float _202 = _188 + (-1.0);
    float _204 = fma(_196, -2.0, _176);
    float _206 = _200 + (-1.0);
    float _208 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _210 = _202;
    float _212 = _164;
    if (_174)
    {
        _210 = _166;
    }
    float _214 = _210;
    float _216 = floor(_190);
    bool _218 = _182 >= 0.0;
    bool _220 = isnan(_182);
    bool _222 = _218 || _220;
    bool _224 = isnan(0.0);
    bool _226 = _222 || _224;
    float _228 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _182 > 0.0;
    int _232 = _226 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    bool _244 = _198 > 0.0;
    bool _246 = _198 >= 0.0;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan(0.0);
    bool _254 = _250 || _252;
    float _256 = _198;
    float _258 = _214;
    if (!_174)
    {
        _256 = _170;
    }
    float _260 = _256;
    float _262 = _260;
    if (!_174)
    {
        _258 = _162;
    }
    float _264 = _258;
    bool _266 = _216 > 0.0;
    bool _268 = _216 >= 0.0;
    bool _270 = isnan(_216);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _280 = 0.0;
    float _282 = _278;
    if (!_242)
    {
        float _284 = _164 * _164;
        float _286 = _284 * 0.5;
        _280 = _286;
    }
    float _288 = _280;
    float _290 = _288;
    if (_174)
    {
        _262 = _166;
    }
    float _292 = _262;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _296 = ~_232;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _304 = _300;
    float _306 = _292;
    if (!_230)
    {
        int _308 = ~_232;
        int _310 = _308 + 1;
        _304 = _310;
    }
    int _312 = _304;
    float _314 = _292 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[83].z, _294);
    float _318 = -_302;
    float _320 = fma(_278, 2.0, _318);
    float _322 = _314;
    if (!_242)
    {
        float _324 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = -_178;
    float _330 = fma(_314, 2.0, _328);
    bool _332 = !_242;
    float _334 = _326;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _164 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _164);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _348;
        _322 = _354;
        _306 = _352;
        _334 = _364;
    }
    float _366 = _282;
    float _368 = _322;
    float _370 = _306;
    float _372 = _334;
    bool _374 = !_242;
    float _376 = _366;
    float _378 = _368;
    float _380 = _370;
    if (!_374)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _164 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _212 = _400;
    }
    float _402 = _212;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    int _408 = _276 ? 0 : 1;
    float _410 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = -_132;
    float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (!_174)
    {
        _376 = _162;
    }
    float _428 = _376;
    float _430 = -_132;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[81].x, _330);
    float _434 = in.m_55.w;
    float _436 = _428;
    if (_174)
    {
        _436 = _170;
    }
    float _438 = _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_174)
    {
        _378 = _170;
    }
    float _450 = _378;
    float _452 = fma(_442, -2.0, _440);
    float _454 = _450;
    if (!_174)
    {
        _454 = _166;
    }
    float _456 = _454;
    float _458 = _406 * _132;
    if (!_174)
    {
        _380 = _162;
    }
    float _460 = _380;
    float _462 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _452);
    int _464 = abs(_446);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _460;
    if (_174)
    {
        _468 = _170;
    }
    float _470 = _468;
    float _472 = _456 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _474 = exp2(_458);
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _478 = fma(_472, -2.0, _448);
    float _480 = float(_312);
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = float(_464);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    int _494 = ~_408;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _204);
    int _502 = _498;
    if (!_266)
    {
        int _504 = ~_408;
        int _506 = _504 + 1;
        _502 = _506;
    }
    int _508 = _502;
    float _510 = 1.0 / _492;
    float _512 = _488 * _480;
    float _514 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _476);
    bool _516 = !_422;
    int _518 = _516 ? 0 : 1;
    float _520 = -_474;
    float _522 = _520 + 1.0;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = _512 * (-2.0);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _542 = abs(_518);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _558 = float(_508);
    float _560 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _562 = float(_542);
    float _564 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _540);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _544);
    float _568 = _554 ? _522 : 0.0;
    float _570 = _166 + (-0.5);
    float _572 = fma(_526, _482, _482);
    float _574 = _562 * _558;
    float _576 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _578 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _580 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    float _582 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _584 = -_132;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[86].x, _320);
    float _588 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _478);
    int _590 = as_type<int>(_578);
    if (_538)
    {
        float _592 = _568 * _510;
        _154 = _592;
    }
    float _594 = _154;
    int _596 = _254 ? 0 : 1;
    float _598 = fma(_228, _526, _228);
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _572);
    bool _602 = !_418;
    int _604 = _602 ? 0 : 1;
    float _606 = _574 * (-2.0);
    int _608 = ~_596;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_598, _594, _600);
    int _616 = _612;
    if (!_244)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_208, _606, _208);
    int _626 = abs(_604);
    float _628 = fma(_606, _486, _486);
    float _630 = _162 + (-0.5);
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = in.m_55.z;
    float _638 = _614 * 0.15915493667125701904296875;
    float _640 = float(_622);
    float _642 = _170 + _162;
    float _644 = float(_626);
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _628);
    float _648 = in.m_59.x;
    float _650 = in.m_59.y;
    float _652 = in.m_59.z;
    float _654 = _642 + (-1.0);
    float _656 = _644 * _640;
    float _658 = fma(_624, _594, _646);
    float _660 = _638 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = _656 * (-2.0);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = _170 + (-0.5);
    float _672 = fma(_664, _484, _484);
    float _674 = fma(_666, _664, _666);
    float _676 = _638 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = in.m_49.x;
    float _682 = in.m_49.y;
    float _684 = in.m_49.z;
    float _686 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _672);
    float _688 = _634 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = fma(_674, _594, _686);
    float _692 = _636 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _668 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = in.m_44.x;
    float _700 = in.m_44.y;
    float _702 = in.m_44.z;
    float _704 = _690 * 0.15915493667125701904296875;
    float _706 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _708 * _706;
    float _722 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _726 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _704 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_402, _680, _722);
    float _734 = fma(_402, _682, _714);
    float _736 = _678 * _696;
    float _738 = _724 * _726;
    float _740 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _744 = _704 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = fma(_732, _434, _698);
    float _750 = _662 * _696;
    float _752 = _678 * _718;
    float _754 = _662 * _718;
    float _756 = fma(_402, _684, _740);
    float _758 = _742 * _710;
    float _760 = fma(_734, _434, _700);
    float _762 = fma(_730, _750, _752);
    float _764 = -_736;
    float _766 = fma(_730, _754, _764);
    float _768 = -_754;
    float _770 = fma(_730, _736, _768);
    float _772 = fma(_756, _434, _702);
    float _774 = _762 * _720;
    float _776 = fma(_730, _752, _750);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _662 * _746;
    float _784 = _696 * _746;
    float _786 = _718 * _746;
    float _788 = _678 * _746;
    float _790 = _782 * _720;
    float _792 = _766 * _720;
    float _794 = fma(_784, _738, _774);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _798 = -_730;
    float _800 = fma(_798, _738, _790);
    float _802 = fma(_786, _738, _792);
    float _804 = -_758;
    float _806 = fma(_770, _804, _794);
    float _808 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _810 = -_758;
    float _812 = fma(_788, _810, _800);
    float _814 = -_758;
    float _816 = fma(_776, _814, _802);
    float _818 = _806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _820 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _822 = _806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _824 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[4].z, _808);
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[10].x, _818);
    float _828 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].x, _822);
    float _832 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[10].z, _826);
    float _836 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[8].z, _830);
    float _840 = _834 + _828;
    float _842 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _844 = _838 + _832;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _840 + _846;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _854 = _844 + _852;
    float _856 = _848 * _848;
    float _858 = _850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _860 = fma(_854, _854, _856);
    float _862 = _806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _864 = sqrt(_860);
    float _866 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[9].x, _862);
    float _868 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _870 = _868 + _858;
    bool _872 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _874 = _868;
    float _876 = _844;
    float _878 = _858;
    float _880 = _842;
    if (!_872)
    {
        _874 = _844;
    }
    float _882 = _874;
    float _884 = _882;
    if (!_872)
    {
        _876 = _840;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_872)
    {
        _878 = _870;
    }
    float _890 = _878;
    bool _892 = !_872;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _864 + _898;
        float _902 = _870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = rsqrt(_860);
        float _906 = _900 * _896;
        float _908 = _906 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _922 = fma(_916, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = fma(_870, _912, _920);
        float _926 = _904 * _922;
        float _928 = fma(_854, _926, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_848, _926, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _924;
        _884 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _884;
    float _936 = _888;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _940 = _932 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _934 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _936 + _946;
    float _950 = _940 * _940;
    float _952 = fma(_944, _944, _950);
    float _954 = fma(_948, _948, _952);
    float _956 = rsqrt(_954);
    float _958 = sqrt(_954);
    float _960 = _956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _944 * _960;
    float _964 = _948 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _956;
    float _982 = _978;
    float _984 = _940;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (_974)
    {
        float _994 = _978 * _990;
        _982 = _994;
    }
    float _996 = _982;
    if (_974)
    {
        float _998 = rsqrt(_970);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _1000;
    if (_974)
    {
        float _1004 = _996 * 0.15915493667125701904296875;
        _880 = _1004;
    }
    float _1006 = _880;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = _948;
    float _1012 = _1006;
    if (_974)
    {
        float _1014 = _1006 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = precise::max(0.0, _1008);
    float _1024 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1020);
    float _1026 = _748;
    float _1028 = _1022;
    if (_974)
    {
        float _1030 = _1006 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_960;
    float _1038 = -_1022;
    float _1040 = fma(_940, _1036, _1038);
    float _1042 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    if (_974)
    {
        float _1044 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1044;
    }
    float _1046 = _984;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1050 = _1018;
    float _1052 = _1046;
    if (_974)
    {
        float _1054 = fma(_1018, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    if (!_974)
    {
        _1052 = _1040;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (_974)
    {
        float _1064 = _1000 * _1056;
        _986 = _1064;
    }
    float _1066 = _986;
    if (!_974)
    {
        _1002 = _962;
    }
    float _1068 = _1002;
    float _1070 = _1068;
    float _1072 = _1034;
    if (_974)
    {
        float _1074 = _1034 + (-1.0);
        _1028 = _1074;
    }
    float _1076 = _1028;
    float _1078 = _1076;
    if (_974)
    {
        float _1080 = _962 * _1066;
        _1070 = _1080;
    }
    float _1082 = _1070;
    if (!_974)
    {
        _1058 = _966;
    }
    float _1084 = _1058;
    float _1086 = _1084;
    if (_974)
    {
        float _1088 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1088;
    }
    float _1090 = _1012;
    if (!_974)
    {
        _1078 = _964;
    }
    float _1092 = _1078;
    float _1094 = _1092;
    if (_974)
    {
        float _1096 = _964 * _1066;
        _1094 = _1096;
    }
    float _1098 = _1094;
    if (_974)
    {
        float _1100 = _1082 * _1082;
        _1086 = _1100;
    }
    float _1102 = _1086;
    if (_974)
    {
        float _1104 = fma(_1040, _1034, _1090);
        _1062 = _1104;
    }
    float _1106 = _1062;
    if (!_974)
    {
        _1072 = _968;
    }
    float _1108 = _1072;
    float _1110 = _1108;
    if (_974)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = _932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1118 = fma(_1106, _1106, _1102);
    float _1120 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1116);
    float _1124 = _1118 + _1114;
    float _1126 = _932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1136 = rsqrt(_1124);
    float _1138 = _932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1126);
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1150 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1152 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1154 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = abs(_1144);
    float _1158 = log2(_1156);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1136 * _1082;
    float _1168 = _1136 * _1106;
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1172 = _1136 * _1098;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1176 = -_1160;
    float _1178 = fma(_1176, _1120, 1.0);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = -_1174;
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1182);
    float _1186 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1188 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1172;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1184);
    float _1194 = log2(_1178);
    float _1196 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = fma(_1192, 0.5, 0.5);
    float _1204 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = _1168 + 1.0;
    float _1210 = 1.0 / _1186;
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1218 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1220 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = fma(_1202, _1216, -0.212114393711090087890625);
    float _1224 = sqrt(_1200);
    float _1226 = _1194 * 0.693147182464599609375;
    float _1228 = fma(_1202, _1222, 1.570728778839111328125);
    float _1230 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = exp2(_1188);
    float _1234 = _1218 * _1210;
    float _1236 = _1220 * _1210;
    float _1238 = fma(_1234, 0.5, 0.5);
    float _1240 = fma(_1236, -0.5, 0.5);
    float _1242 = _1224 * 0.636619746685028076171875;
    float3 _3933 = float3(_1238, _1240, _1230);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3933, float3(0.0), isnan(_3933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3933, float3(0.0), isnan(_3933)), level(0.0)).x;
    float _1246 = -_1228;
    float _1248 = fma(_1242, _1246, 1.0);
    float _1250 = -_1168;
    float _1252 = fma(_1232, _1208, _1250);
    float _1254 = fma(_1252, 0.5, 0.5);
    float3 _3957 = float3(_1238, _1240, _1230);
    float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3957, float3(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3957, float3(0.0), isnan(_3957)), level(0.0)).xyzw;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1257.w;
    float2 _3974 = float2(_1248, _1254);
    float3 _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3974, float2(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3974, float2(0.0), isnan(_3974)), level(0.0)).xyz;
    float _1271 = _1269.x;
    float _1273 = _1269.y;
    float _1275 = _1269.z;
    float _1277 = in.m_61.y;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1281 = _170 > 0.5;
    float _1283 = in.m_53.w;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_61.x;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1305 = _1303 != 0;
    float _1307 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1309 = _162 > 0.5;
    out.m_63.x = _934;
    out.m_63.y = _932;
    out.m_63.z = _936;
    float _1311 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    bool _1319 = _1283 > 0.5;
    float _1321 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1323 = _1281 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1327 = _1283;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1331 = _1277;
    int _1333 = as_type<int>(_1321);
    bool _1335 = _1293;
    float _1337 = _1301;
    float _1339 = _1186;
    float _1341 = _1220;
    float _1343 = _1218;
    if (!_1287)
    {
        _1327 = _1295;
    }
    float _1345 = _1327;
    float _1347 = in.m_65.x;
    float _1349 = in.m_65.y;
    float _1351 = in.m_65.z;
    float _1353 = _1299 ? as_type<float>(_1323) : _1277;
    float _1355 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1357 = _1319 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1321, _1353, -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1311);
    float _1373 = _1345;
    if (!_1287)
    {
        _1329 = _1345;
    }
    float _1375 = _1329;
    float _1377 = _1375;
    if (_1287)
    {
        _1373 = _1295;
    }
    float _1379 = _1373;
    float _1381 = exp2(_1289);
    float _1383 = _1369 ? as_type<float>(_1357) : _1277;
    float _1385 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1371);
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1385;
    if (_1293)
    {
        float _1393 = _1309 ? _1317 : _1277;
        _1331 = _1393;
    }
    float _1395 = _1331;
    if (_1287)
    {
        float _1397 = -_1379;
        float _1399 = _1397 + 1.0;
        _1333 = as_type<int>(_1399);
    }
    int _1401 = _1333;
    if (_1287)
    {
        bool _1403 = _166 > 0.5;
        _1335 = _1403;
    }
    bool _1405 = _1335;
    float _1407 = fma(_1383, _1325, -0.5);
    float _1409 = -_500;
    float _1411 = fma(_578, _1365, _1409);
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1287)
    {
        float _1415 = _1405 ? as_type<float>(_1401) : _1379;
        _1377 = _1415;
    }
    float _1417 = _1377;
    float _1419 = fma(_1355, _1395, -0.5);
    float _1421 = in.m_67.x;
    float _1423 = in.m_67.y;
    float _1425 = in.m_67.z;
    float _1427 = in.m_67.w;
    bool _1429 = _650 != 0.0;
    bool _1431 = isnan(_650);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(0.0);
    bool _1437 = _1433 || _1435;
    if (_1305)
    {
        float _1439 = -_1379;
        float _1441 = _1439 + 1.0;
        _590 = as_type<int>(_1441);
    }
    int _1443 = _590;
    int _1445 = 0;
    float _1447 = as_type<float>(_1443);
    if (_1363)
    {
        float _1449 = -_1379;
        float _1451 = _1449 + 1.0;
        _1445 = as_type<int>(_1451);
    }
    int _1453 = _1445;
    if (!_1305)
    {
        _1387 = _1379;
    }
    float _1455 = _1387;
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1459 = _648 == 0.0;
    bool _1461 = !_1437;
    bool _1463 = _1459 && _1461;
    float _1465 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1467 = _1455;
    if (!_1363)
    {
        _1337 = _1379;
    }
    float _1469 = _1337;
    float _1471 = -_462;
    float _1473 = fma(_514, _1407, _1471);
    bool _1475 = _652 == 0.0;
    bool _1477 = _1475 && _1463;
    float _1479 = fma(_1465, _1417, -0.5);
    float _1481 = _1469;
    if (_1305)
    {
        float _1483 = _1309 ? as_type<float>(_1443) : _1379;
        _1467 = _1483;
    }
    float _1485 = _1467;
    float _1487 = -_1381;
    float _1489 = _1487 + 1.0;
    if (_1363)
    {
        float _1491 = _1281 ? as_type<float>(_1453) : _1379;
        _1481 = _1491;
    }
    float _1493 = _1481;
    float _1495 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1497 = fma(_576, _1479, _426);
    out.gl_Position.x = _1218;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1186;
    float _1499 = fma(_1495, _1485, -0.5);
    float _1501 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1503 = _1413;
    if (_1477)
    {
        _1447 = _1347;
    }
    float _1505 = _1447;
    float _1507 = _1505;
    if (!_1477)
    {
        float _1509 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1347);
        _1507 = _1509;
    }
    float _1511 = _1507;
    if (_1477)
    {
        _1503 = _1351;
    }
    float _1513 = _1503;
    float _1515 = fma(_1501, _1493, -0.5);
    float _1517 = _1513;
    if (!_1477)
    {
        float _1519 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1351);
        _1517 = _1519;
    }
    float _1521 = _1517;
    float _1523 = fma(_410, _1499, _432);
    float _1525 = _1421 * _1349;
    if (_1477)
    {
        _1389 = _1349;
    }
    float _1527 = _1389;
    float _1529 = _1425 * _1347;
    float _1531 = _1527;
    if (!_1477)
    {
        float _1533 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1349);
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = _1423 * _1351;
    float _1539 = fma(_580, _1515, _586);
    float _1541 = -_1525;
    float _1543 = fma(_1423, _1347, _1541);
    float _1545 = -_1529;
    float _1547 = fma(_1421, _1351, _1545);
    float _1549 = -_1537;
    float _1551 = fma(_1425, _1349, _1549);
    float _1553 = _1539 + 0.5;
    float _1555 = -_588;
    float _1557 = fma(_582, _1419, _1555);
    float _1559 = _1473 + 0.5;
    float _1561 = _1543 * _1427;
    float _1563 = _1411 + 0.5;
    float _1565 = _1497 + 0.5;
    float _1567 = _1523 + 0.5;
    float _1569 = _1547 * _1427;
    float _1571 = _782 * _1425;
    float _1573 = _766 * _1425;
    float _1575 = _762 * _1425;
    float _1577 = _782 * _1521;
    float _1579 = _766 * _1521;
    float _1581 = _762 * _1521;
    float _1583 = _782 * _1561;
    float _1585 = _766 * _1561;
    float _1587 = _1551 * _1427;
    float _1589 = _762 * _1561;
    out.m_69.x = _1565;
    out.m_69.y = _1563;
    out.m_69.z = _1567;
    out.m_69.w = _1559;
    float _1591 = _1557 + 0.5;
    float _1593 = fma(_784, _1421, _1575);
    float _1595 = -_730;
    float _1597 = fma(_1595, _1511, _1577);
    float _1599 = -_730;
    float _1601 = fma(_1599, _1587, _1583);
    bool _1603 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1605 = isnan(_958);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1611 = _1607 || _1609;
    float _1613 = -_1423;
    float _1615 = fma(_770, _1613, _1593);
    out.m_71.x = _1553;
    out.m_71.y = _1591;
    float _1617 = fma(_784, _1511, _1581);
    float _1619 = fma(_784, _1587, _1589);
    float _1621 = fma(_786, _1511, _1579);
    float _1623 = fma(_786, _1421, _1573);
    float _1625 = -_1535;
    float _1627 = fma(_770, _1625, _1617);
    float _1629 = fma(_786, _1587, _1585);
    float _1631 = -_1569;
    float _1633 = fma(_770, _1631, _1619);
    float _1635 = -_730;
    float _1637 = fma(_1635, _1421, _1571);
    float _1639 = -_1569;
    float _1641 = fma(_788, _1639, _1601);
    float _1643 = -_1535;
    float _1645 = fma(_776, _1643, _1621);
    float _1647 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1649 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1651 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1653 = -_1423;
    float _1655 = fma(_776, _1653, _1623);
    float _1657 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1659 = -_1569;
    float _1661 = fma(_776, _1659, _1629);
    float _1663 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1665 = -_1535;
    float _1667 = fma(_788, _1665, _1597);
    float _1669 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1671 = -_1423;
    float _1673 = fma(_788, _1671, _1637);
    float _1675 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1647);
    float _1677 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1649);
    float _1679 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1651);
    float _1681 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1657);
    float _1689 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1691 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1669);
    float _1693 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1695 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1697 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1687);
    float _1701 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1689);
    float _1703 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1707 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    float _1709 = _1385 + _1186;
    float _1711 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1691);
    float _1713 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1715 = _1709 * 0.5;
    out.m_73.x = _1705;
    out.m_73.y = _1707;
    out.m_73.z = _1699;
    float _1717 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1675);
    float _1719 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1693);
    float _1721 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1679);
    out.m_75.z = _1715;
    out.m_75.w = _1186;
    if (!_1611)
    {
        _1339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1723 = _1339;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1611)
    {
        _1391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1391;
    out.m_77.x = _1711;
    out.m_77.y = _1701;
    out.m_77.z = _1719;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1611)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1735 = _1341;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1611)
    {
        _1343 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1741 = _1343;
    float _1743 = -_1703;
    float _1745 = _1743 + 1.0;
    out.m_79.x = _1717;
    out.m_79.y = _1713;
    out.m_79.z = _1721;
    float _1747 = _1703 * _1244;
    float _1749 = _1265 * _1747;
    float _1751 = _1265 * _1745;
    float _1753 = _1745;
    float _1755 = _1749;
    float _1757 = _1741;
    float _1759 = _1741;
    if (!_1611)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1761 = _1753;
    float _1763 = _1275 * _1747;
    float _1765 = fma(_1271, _1749, _1259);
    float _1767 = fma(_1273, _1749, _1261);
    float _1769 = _1761;
    float _1771 = _1761;
    if (!_1611)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1773 = _1755;
    float _1775 = fma(_1265, _1763, _1263);
    out.m_81.x = _1765;
    out.m_81.y = _1767;
    out.m_81.z = _1775;
    out.m_81.w = _1751;
    bool _1777 = !_1611;
    float _1779 = _1773;
    float _1781 = _1773;
    if (!_1777)
    {
        bool _1783 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1785 = isnan(_958);
        bool _1787 = _1783 || _1785;
        bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1791 = _1787 || _1789;
        if (!_1791)
        {
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1795 = _958 + _1793;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1797;
            float _1801 = 1.0 / _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1823 = _1795 * _1801;
            float _1825 = precise::clamp(_1823, 0.0, 1.0);
            float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1831 = fma(_1825, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1833 = fma(_1825, _1829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1835 = fma(_1825, _1805, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1837 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1839 = fma(_1825, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1841 = fma(_1825, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1835;
            _1727 = _1839;
            _1739 = _1833;
            _1771 = _1837;
            _1781 = _1831;
            _1733 = _1841;
            _1843 = true;
        }
        else
        {
            bool _1845 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1847 = isnan(_958);
            bool _1849 = _1845 || _1847;
            bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1853 = _1849 || _1851;
            if (!_1853)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1855 = _1769;
            _1771 = _1855;
            if (!_1853)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1857 = _1725;
            _1727 = _1857;
            if (!_1853)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1859 = _1731;
            _1733 = _1859;
            if (!_1853)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1861 = _1737;
            _1739 = _1861;
            if (!_1853)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1863 = _1757;
            _1759 = _1863;
            if (!_1853)
            {
                _1779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1865 = _1779;
            bool _1867 = !_1853;
            _1781 = _1865;
            if (!_1867)
            {
                bool _1869 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1871 = isnan(_958);
                bool _1873 = _1869 || _1871;
                bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1877 = _1873 || _1875;
                if (!_1877)
                {
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1881 = _958 + _1879;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1883;
                    float _1887 = 1.0 / _1885;
                    float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1909 = _1881 * _1887;
                    float _1911 = precise::clamp(_1909, 0.0, 1.0);
                    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1917 = fma(_1911, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1919 = fma(_1911, _1915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1921 = fma(_1911, _1891, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1923 = fma(_1911, _1899, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1925 = fma(_1911, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1927 = fma(_1911, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1921;
                    _1727 = _1925;
                    _1739 = _1919;
                    _1771 = _1923;
                    _1781 = _1917;
                    _1733 = _1927;
                    _1843 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1843 = false;
    float _1929 = _1759;
    float _1931 = _1727;
    float _1933 = _1739;
    float _1935 = _1771;
    float _1937 = _1781;
    float _1939 = _1733;
    float _1941 = fma(_1713, -0.5, 0.5);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -_1929;
    float _1947 = _1931 + _1945;
    float _1949 = -_1933;
    float _1951 = _1935 + _1949;
    float _1953 = -_1937;
    float _1955 = _1939 + _1953;
    bool _1957 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1959 = fma(_1943, _1947, _1929);
    float _1961 = fma(_1943, _1951, _1933);
    float _1963 = fma(_1943, _1955, _1937);
    float _1965 = _1959 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1967 = fma(_1961, 0.298911988735198974609375, _1965);
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = fma(_1963, 0.114477999508380889892578125, _1967);
    out.m_83.w = _1969;
    float _1973 = -_1971;
    float _1975 = _1961 + _1973;
    float _1977 = -_1971;
    float _1979 = _1959 + _1977;
    float _1981 = -_1971;
    float _1983 = _1963 + _1981;
    out.m_85.x = 0.0;
    float _1985 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1987 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1989 = fma(_1983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    out.m_87.x = _1985;
    out.m_87.y = _1987;
    out.m_87.z = _1989;
    if (!_1957)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1991 = -_932;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1995 = -_934;
    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1999 = -_936;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2003 = _1993 * _1993;
    float _2005 = fma(_1997, _1997, _2003);
    float _2007 = fma(_2001, _2001, _2005);
    float _2009 = sqrt(_2007);
    float _2011 = rsqrt(_2007);
    float _2013 = -_2009;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2017 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1997 * _2011;
    float _2023 = _1993 * _2011;
    float _2025 = abs(_2019);
    float _2027 = log2(_2025);
    float _2029 = _2001 * _2011;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2033 = _1713 * _2023;
    float _2035 = -_2023;
    float _2037 = -_2031;
    float _2039 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2037);
    float _2041 = fma(_1717, _2021, _2033);
    float _2043 = -_2029;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2039);
    float _2047 = fma(_1721, _2029, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2053 = _2045 + _2051;
    float _2055 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2057 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = exp2(_2055);
    float _2063 = _2061 * _2059;
    float _2065 = _2049 * _2063;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2067;
    out.m_85.y = _2069;
    out.m_85.z = _2071;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1843 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_120);
        out.gl_Position.z = _2127;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
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
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2198 = as_type<float>(_160);
        out.gl_Position.z = _2198;
    }
    if (_150)
    {
        return out;
    }
    float _162 = in.m_53.z;
    float _164 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _180 = _162 * 2.0;
    float _182 = floor(_180);
    float _184 = _166 * 2.0;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _166 + _162;
    float _190 = _170 * 2.0;
    float _192 = -_168;
    float _194 = fma(_186, 2.0, _192);
    float _196 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _198 = floor(_184);
    float _200 = _170 + _166;
    float _202 = _188 + (-1.0);
    float _204 = fma(_196, -2.0, _176);
    float _206 = _200 + (-1.0);
    float _208 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _210 = _202;
    float _212 = _164;
    if (_174)
    {
        _210 = _166;
    }
    float _214 = _210;
    float _216 = floor(_190);
    bool _218 = _182 >= 0.0;
    bool _220 = isnan(_182);
    bool _222 = _218 || _220;
    bool _224 = isnan(0.0);
    bool _226 = _222 || _224;
    float _228 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _182 > 0.0;
    int _232 = _226 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    bool _244 = _198 > 0.0;
    bool _246 = _198 >= 0.0;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan(0.0);
    bool _254 = _250 || _252;
    float _256 = _198;
    float _258 = _214;
    if (!_174)
    {
        _256 = _170;
    }
    float _260 = _256;
    float _262 = _260;
    if (!_174)
    {
        _258 = _162;
    }
    float _264 = _258;
    bool _266 = _216 > 0.0;
    bool _268 = _216 >= 0.0;
    bool _270 = isnan(_216);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _280 = 0.0;
    float _282 = _278;
    if (!_242)
    {
        float _284 = _164 * _164;
        float _286 = _284 * 0.5;
        _280 = _286;
    }
    float _288 = _280;
    float _290 = _288;
    if (_174)
    {
        _262 = _166;
    }
    float _292 = _262;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _296 = ~_232;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _304 = _300;
    float _306 = _292;
    if (!_230)
    {
        int _308 = ~_232;
        int _310 = _308 + 1;
        _304 = _310;
    }
    int _312 = _304;
    float _314 = _292 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[83].z, _294);
    float _318 = -_302;
    float _320 = fma(_278, 2.0, _318);
    float _322 = _314;
    if (!_242)
    {
        float _324 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = -_178;
    float _330 = fma(_314, 2.0, _328);
    bool _332 = !_242;
    float _334 = _326;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _164 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _164);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _348;
        _322 = _354;
        _306 = _352;
        _334 = _364;
    }
    float _366 = _282;
    float _368 = _322;
    float _370 = _306;
    float _372 = _334;
    bool _374 = !_242;
    float _376 = _366;
    float _378 = _368;
    float _380 = _370;
    if (!_374)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _164 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _212 = _400;
    }
    float _402 = _212;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    int _408 = _276 ? 0 : 1;
    float _410 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = -_132;
    float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (!_174)
    {
        _376 = _162;
    }
    float _428 = _376;
    float _430 = -_132;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[81].x, _330);
    float _434 = in.m_55.w;
    float _436 = _428;
    if (_174)
    {
        _436 = _170;
    }
    float _438 = _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_174)
    {
        _378 = _170;
    }
    float _450 = _378;
    float _452 = fma(_442, -2.0, _440);
    float _454 = _450;
    if (!_174)
    {
        _454 = _166;
    }
    float _456 = _454;
    float _458 = _406 * _132;
    if (!_174)
    {
        _380 = _162;
    }
    float _460 = _380;
    float _462 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _452);
    int _464 = abs(_446);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _460;
    if (_174)
    {
        _468 = _170;
    }
    float _470 = _468;
    float _472 = _456 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _474 = exp2(_458);
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _478 = fma(_472, -2.0, _448);
    float _480 = float(_312);
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = float(_464);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    int _494 = ~_408;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _204);
    int _502 = _498;
    if (!_266)
    {
        int _504 = ~_408;
        int _506 = _504 + 1;
        _502 = _506;
    }
    int _508 = _502;
    float _510 = 1.0 / _492;
    float _512 = _488 * _480;
    float _514 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _476);
    bool _516 = !_422;
    int _518 = _516 ? 0 : 1;
    float _520 = -_474;
    float _522 = _520 + 1.0;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = _512 * (-2.0);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _542 = abs(_518);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _558 = float(_508);
    float _560 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _562 = float(_542);
    float _564 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _540);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _544);
    float _568 = _554 ? _522 : 0.0;
    float _570 = _166 + (-0.5);
    float _572 = fma(_526, _482, _482);
    float _574 = _562 * _558;
    float _576 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _578 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _580 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    float _582 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _584 = -_132;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[86].x, _320);
    float _588 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _478);
    int _590 = as_type<int>(_578);
    if (_538)
    {
        float _592 = _568 * _510;
        _154 = _592;
    }
    float _594 = _154;
    int _596 = _254 ? 0 : 1;
    float _598 = fma(_228, _526, _228);
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _572);
    bool _602 = !_418;
    int _604 = _602 ? 0 : 1;
    float _606 = _574 * (-2.0);
    int _608 = ~_596;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_598, _594, _600);
    int _616 = _612;
    if (!_244)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_208, _606, _208);
    int _626 = abs(_604);
    float _628 = fma(_606, _486, _486);
    float _630 = _162 + (-0.5);
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = in.m_55.z;
    float _638 = _614 * 0.15915493667125701904296875;
    float _640 = float(_622);
    float _642 = _170 + _162;
    float _644 = float(_626);
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _628);
    float _648 = in.m_59.x;
    float _650 = in.m_59.y;
    float _652 = in.m_59.z;
    float _654 = _642 + (-1.0);
    float _656 = _644 * _640;
    float _658 = fma(_624, _594, _646);
    float _660 = _638 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = _656 * (-2.0);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = _170 + (-0.5);
    float _672 = fma(_664, _484, _484);
    float _674 = fma(_666, _664, _666);
    float _676 = _638 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = in.m_49.x;
    float _682 = in.m_49.y;
    float _684 = in.m_49.z;
    float _686 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _672);
    float _688 = _634 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = fma(_674, _594, _686);
    float _692 = _636 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _668 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = in.m_44.x;
    float _700 = in.m_44.y;
    float _702 = in.m_44.z;
    float _704 = _690 * 0.15915493667125701904296875;
    float _706 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _708 * _706;
    float _722 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _726 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _704 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_402, _680, _722);
    float _734 = fma(_402, _682, _714);
    float _736 = _678 * _696;
    float _738 = _724 * _726;
    float _740 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _744 = _704 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = fma(_732, _434, _698);
    float _750 = _662 * _696;
    float _752 = _678 * _718;
    float _754 = _662 * _718;
    float _756 = fma(_402, _684, _740);
    float _758 = _742 * _710;
    float _760 = fma(_734, _434, _700);
    float _762 = fma(_730, _750, _752);
    float _764 = -_736;
    float _766 = fma(_730, _754, _764);
    float _768 = -_754;
    float _770 = fma(_730, _736, _768);
    float _772 = fma(_756, _434, _702);
    float _774 = _762 * _720;
    float _776 = fma(_730, _752, _750);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _662 * _746;
    float _784 = _696 * _746;
    float _786 = _718 * _746;
    float _788 = _678 * _746;
    float _790 = _782 * _720;
    float _792 = _766 * _720;
    float _794 = fma(_784, _738, _774);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _798 = -_730;
    float _800 = fma(_798, _738, _790);
    float _802 = fma(_786, _738, _792);
    float _804 = -_758;
    float _806 = fma(_770, _804, _794);
    float _808 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _810 = -_758;
    float _812 = fma(_788, _810, _800);
    float _814 = -_758;
    float _816 = fma(_776, _814, _802);
    float _818 = _806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _820 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _822 = _806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _824 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[4].z, _808);
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[10].x, _818);
    float _828 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].x, _822);
    float _832 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[10].z, _826);
    float _836 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[8].z, _830);
    float _840 = _834 + _828;
    float _842 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _844 = _838 + _832;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _840 + _846;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _854 = _844 + _852;
    float _856 = _848 * _848;
    float _858 = _850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _860 = fma(_854, _854, _856);
    float _862 = _806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _864 = sqrt(_860);
    float _866 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[9].x, _862);
    float _868 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _870 = _868 + _858;
    bool _872 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _874 = _868;
    float _876 = _844;
    float _878 = _858;
    float _880 = _842;
    if (!_872)
    {
        _874 = _844;
    }
    float _882 = _874;
    float _884 = _882;
    if (!_872)
    {
        _876 = _840;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_872)
    {
        _878 = _870;
    }
    float _890 = _878;
    bool _892 = !_872;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _864 + _898;
        float _902 = _870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = rsqrt(_860);
        float _906 = _900 * _896;
        float _908 = _906 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _922 = fma(_916, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = fma(_870, _912, _920);
        float _926 = _904 * _922;
        float _928 = fma(_854, _926, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_848, _926, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _924;
        _884 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _884;
    float _936 = _888;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _940 = _932 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _934 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _936 + _946;
    float _950 = _940 * _940;
    float _952 = fma(_944, _944, _950);
    float _954 = fma(_948, _948, _952);
    float _956 = rsqrt(_954);
    float _958 = sqrt(_954);
    float _960 = _956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _944 * _960;
    float _964 = _948 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _956;
    float _982 = _978;
    float _984 = _940;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (_974)
    {
        float _994 = _978 * _990;
        _982 = _994;
    }
    float _996 = _982;
    if (_974)
    {
        float _998 = rsqrt(_970);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _1000;
    if (_974)
    {
        float _1004 = _996 * 0.15915493667125701904296875;
        _880 = _1004;
    }
    float _1006 = _880;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = _948;
    float _1012 = _1006;
    if (_974)
    {
        float _1014 = _1006 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = precise::max(0.0, _1008);
    float _1024 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1020);
    float _1026 = _748;
    float _1028 = _1022;
    if (_974)
    {
        float _1030 = _1006 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_960;
    float _1038 = -_1022;
    float _1040 = fma(_940, _1036, _1038);
    float _1042 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    if (_974)
    {
        float _1044 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1044;
    }
    float _1046 = _984;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1050 = _1018;
    float _1052 = _1046;
    if (_974)
    {
        float _1054 = fma(_1018, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    if (!_974)
    {
        _1052 = _1040;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (_974)
    {
        float _1064 = _1000 * _1056;
        _986 = _1064;
    }
    float _1066 = _986;
    if (!_974)
    {
        _1002 = _962;
    }
    float _1068 = _1002;
    float _1070 = _1068;
    float _1072 = _1034;
    if (_974)
    {
        float _1074 = _1034 + (-1.0);
        _1028 = _1074;
    }
    float _1076 = _1028;
    float _1078 = _1076;
    if (_974)
    {
        float _1080 = _962 * _1066;
        _1070 = _1080;
    }
    float _1082 = _1070;
    if (!_974)
    {
        _1058 = _966;
    }
    float _1084 = _1058;
    float _1086 = _1084;
    if (_974)
    {
        float _1088 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1088;
    }
    float _1090 = _1012;
    if (!_974)
    {
        _1078 = _964;
    }
    float _1092 = _1078;
    float _1094 = _1092;
    if (_974)
    {
        float _1096 = _964 * _1066;
        _1094 = _1096;
    }
    float _1098 = _1094;
    if (_974)
    {
        float _1100 = _1082 * _1082;
        _1086 = _1100;
    }
    float _1102 = _1086;
    if (_974)
    {
        float _1104 = fma(_1040, _1034, _1090);
        _1062 = _1104;
    }
    float _1106 = _1062;
    if (!_974)
    {
        _1072 = _968;
    }
    float _1108 = _1072;
    float _1110 = _1108;
    if (_974)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = _932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1118 = fma(_1106, _1106, _1102);
    float _1120 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1116);
    float _1124 = _1118 + _1114;
    float _1126 = _932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1136 = rsqrt(_1124);
    float _1138 = _932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1126);
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1150 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1152 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1154 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = abs(_1144);
    float _1158 = log2(_1156);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1136 * _1082;
    float _1168 = _1136 * _1106;
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1172 = _1136 * _1098;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1176 = -_1160;
    float _1178 = fma(_1176, _1120, 1.0);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = -_1174;
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1182);
    float _1186 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1188 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1172;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1184);
    float _1194 = log2(_1178);
    float _1196 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = fma(_1192, 0.5, 0.5);
    float _1204 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = _1168 + 1.0;
    float _1210 = 1.0 / _1186;
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1218 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1220 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = fma(_1202, _1216, -0.212114393711090087890625);
    float _1224 = sqrt(_1200);
    float _1226 = _1194 * 0.693147182464599609375;
    float _1228 = fma(_1202, _1222, 1.570728778839111328125);
    float _1230 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = exp2(_1188);
    float _1234 = _1218 * _1210;
    float _1236 = _1220 * _1210;
    float _1238 = fma(_1234, 0.5, 0.5);
    float _1240 = fma(_1236, -0.5, 0.5);
    float _1242 = _1224 * 0.636619746685028076171875;
    float3 _3933 = float3(_1238, _1240, _1230);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3933, float3(0.0), isnan(_3933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3933, float3(0.0), isnan(_3933)), level(0.0)).x;
    float _1246 = -_1228;
    float _1248 = fma(_1242, _1246, 1.0);
    float _1250 = -_1168;
    float _1252 = fma(_1232, _1208, _1250);
    float _1254 = fma(_1252, 0.5, 0.5);
    float3 _3957 = float3(_1238, _1240, _1230);
    float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3957, float3(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3957, float3(0.0), isnan(_3957)), level(0.0)).xyzw;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1257.w;
    float2 _3974 = float2(_1248, _1254);
    float3 _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3974, float2(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3974, float2(0.0), isnan(_3974)), level(0.0)).xyz;
    float _1271 = _1269.x;
    float _1273 = _1269.y;
    float _1275 = _1269.z;
    float _1277 = in.m_61.y;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1281 = _170 > 0.5;
    float _1283 = in.m_53.w;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_61.x;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1305 = _1303 != 0;
    float _1307 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1309 = _162 > 0.5;
    out.m_63.x = _934;
    out.m_63.y = _932;
    out.m_63.z = _936;
    float _1311 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    bool _1319 = _1283 > 0.5;
    float _1321 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1323 = _1281 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1327 = _1283;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1331 = _1277;
    int _1333 = as_type<int>(_1321);
    bool _1335 = _1293;
    float _1337 = _1301;
    float _1339 = _1186;
    float _1341 = _1220;
    float _1343 = _1218;
    if (!_1287)
    {
        _1327 = _1295;
    }
    float _1345 = _1327;
    float _1347 = in.m_65.x;
    float _1349 = in.m_65.y;
    float _1351 = in.m_65.z;
    float _1353 = _1299 ? as_type<float>(_1323) : _1277;
    float _1355 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1357 = _1319 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1321, _1353, -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1311);
    float _1373 = _1345;
    if (!_1287)
    {
        _1329 = _1345;
    }
    float _1375 = _1329;
    float _1377 = _1375;
    if (_1287)
    {
        _1373 = _1295;
    }
    float _1379 = _1373;
    float _1381 = exp2(_1289);
    float _1383 = _1369 ? as_type<float>(_1357) : _1277;
    float _1385 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1371);
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1385;
    if (_1293)
    {
        float _1393 = _1309 ? _1317 : _1277;
        _1331 = _1393;
    }
    float _1395 = _1331;
    if (_1287)
    {
        float _1397 = -_1379;
        float _1399 = _1397 + 1.0;
        _1333 = as_type<int>(_1399);
    }
    int _1401 = _1333;
    if (_1287)
    {
        bool _1403 = _166 > 0.5;
        _1335 = _1403;
    }
    bool _1405 = _1335;
    float _1407 = fma(_1383, _1325, -0.5);
    float _1409 = -_500;
    float _1411 = fma(_578, _1365, _1409);
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1287)
    {
        float _1415 = _1405 ? as_type<float>(_1401) : _1379;
        _1377 = _1415;
    }
    float _1417 = _1377;
    float _1419 = fma(_1355, _1395, -0.5);
    float _1421 = in.m_67.x;
    float _1423 = in.m_67.y;
    float _1425 = in.m_67.z;
    float _1427 = in.m_67.w;
    bool _1429 = _650 != 0.0;
    bool _1431 = isnan(_650);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(0.0);
    bool _1437 = _1433 || _1435;
    if (_1305)
    {
        float _1439 = -_1379;
        float _1441 = _1439 + 1.0;
        _590 = as_type<int>(_1441);
    }
    int _1443 = _590;
    int _1445 = 0;
    float _1447 = as_type<float>(_1443);
    if (_1363)
    {
        float _1449 = -_1379;
        float _1451 = _1449 + 1.0;
        _1445 = as_type<int>(_1451);
    }
    int _1453 = _1445;
    if (!_1305)
    {
        _1387 = _1379;
    }
    float _1455 = _1387;
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1459 = _648 == 0.0;
    bool _1461 = !_1437;
    bool _1463 = _1459 && _1461;
    float _1465 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1467 = _1455;
    if (!_1363)
    {
        _1337 = _1379;
    }
    float _1469 = _1337;
    float _1471 = -_462;
    float _1473 = fma(_514, _1407, _1471);
    bool _1475 = _652 == 0.0;
    bool _1477 = _1475 && _1463;
    float _1479 = fma(_1465, _1417, -0.5);
    float _1481 = _1469;
    if (_1305)
    {
        float _1483 = _1309 ? as_type<float>(_1443) : _1379;
        _1467 = _1483;
    }
    float _1485 = _1467;
    float _1487 = -_1381;
    float _1489 = _1487 + 1.0;
    if (_1363)
    {
        float _1491 = _1281 ? as_type<float>(_1453) : _1379;
        _1481 = _1491;
    }
    float _1493 = _1481;
    float _1495 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1497 = fma(_576, _1479, _426);
    out.gl_Position.x = _1218;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1186;
    float _1499 = fma(_1495, _1485, -0.5);
    float _1501 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1503 = _1413;
    if (_1477)
    {
        _1447 = _1347;
    }
    float _1505 = _1447;
    float _1507 = _1505;
    if (!_1477)
    {
        float _1509 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1347);
        _1507 = _1509;
    }
    float _1511 = _1507;
    if (_1477)
    {
        _1503 = _1351;
    }
    float _1513 = _1503;
    float _1515 = fma(_1501, _1493, -0.5);
    float _1517 = _1513;
    if (!_1477)
    {
        float _1519 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1351);
        _1517 = _1519;
    }
    float _1521 = _1517;
    float _1523 = fma(_410, _1499, _432);
    float _1525 = _1421 * _1349;
    if (_1477)
    {
        _1389 = _1349;
    }
    float _1527 = _1389;
    float _1529 = _1425 * _1347;
    float _1531 = _1527;
    if (!_1477)
    {
        float _1533 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1349);
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = _1423 * _1351;
    float _1539 = fma(_580, _1515, _586);
    float _1541 = -_1525;
    float _1543 = fma(_1423, _1347, _1541);
    float _1545 = -_1529;
    float _1547 = fma(_1421, _1351, _1545);
    float _1549 = -_1537;
    float _1551 = fma(_1425, _1349, _1549);
    float _1553 = _1539 + 0.5;
    float _1555 = -_588;
    float _1557 = fma(_582, _1419, _1555);
    float _1559 = _1473 + 0.5;
    float _1561 = _1543 * _1427;
    float _1563 = _1411 + 0.5;
    float _1565 = _1497 + 0.5;
    float _1567 = _1523 + 0.5;
    float _1569 = _1547 * _1427;
    float _1571 = _782 * _1425;
    float _1573 = _766 * _1425;
    float _1575 = _762 * _1425;
    float _1577 = _782 * _1521;
    float _1579 = _766 * _1521;
    float _1581 = _762 * _1521;
    float _1583 = _782 * _1561;
    float _1585 = _766 * _1561;
    float _1587 = _1551 * _1427;
    float _1589 = _762 * _1561;
    out.m_69.x = _1565;
    out.m_69.y = _1563;
    out.m_69.z = _1567;
    out.m_69.w = _1559;
    float _1591 = _1557 + 0.5;
    float _1593 = fma(_784, _1421, _1575);
    float _1595 = -_730;
    float _1597 = fma(_1595, _1511, _1577);
    float _1599 = -_730;
    float _1601 = fma(_1599, _1587, _1583);
    bool _1603 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1605 = isnan(_958);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1611 = _1607 || _1609;
    float _1613 = -_1423;
    float _1615 = fma(_770, _1613, _1593);
    out.m_71.x = _1553;
    out.m_71.y = _1591;
    float _1617 = fma(_784, _1511, _1581);
    float _1619 = fma(_784, _1587, _1589);
    float _1621 = fma(_786, _1511, _1579);
    float _1623 = fma(_786, _1421, _1573);
    float _1625 = -_1535;
    float _1627 = fma(_770, _1625, _1617);
    float _1629 = fma(_786, _1587, _1585);
    float _1631 = -_1569;
    float _1633 = fma(_770, _1631, _1619);
    float _1635 = -_730;
    float _1637 = fma(_1635, _1421, _1571);
    float _1639 = -_1569;
    float _1641 = fma(_788, _1639, _1601);
    float _1643 = -_1535;
    float _1645 = fma(_776, _1643, _1621);
    float _1647 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1649 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1651 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1653 = -_1423;
    float _1655 = fma(_776, _1653, _1623);
    float _1657 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1659 = -_1569;
    float _1661 = fma(_776, _1659, _1629);
    float _1663 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1665 = -_1535;
    float _1667 = fma(_788, _1665, _1597);
    float _1669 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1671 = -_1423;
    float _1673 = fma(_788, _1671, _1637);
    float _1675 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1647);
    float _1677 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1649);
    float _1679 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1651);
    float _1681 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1657);
    float _1689 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1691 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1669);
    float _1693 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1695 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1697 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1687);
    float _1701 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1689);
    float _1703 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1707 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    float _1709 = _1385 + _1186;
    float _1711 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1691);
    float _1713 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1715 = _1709 * 0.5;
    out.m_73.x = _1705;
    out.m_73.y = _1707;
    out.m_73.z = _1699;
    float _1717 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1675);
    float _1719 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1693);
    float _1721 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1679);
    out.m_75.z = _1715;
    out.m_75.w = _1186;
    if (!_1611)
    {
        _1339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1723 = _1339;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1611)
    {
        _1391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1391;
    out.m_77.x = _1711;
    out.m_77.y = _1701;
    out.m_77.z = _1719;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1611)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1735 = _1341;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1611)
    {
        _1343 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1741 = _1343;
    float _1743 = -_1703;
    float _1745 = _1743 + 1.0;
    out.m_79.x = _1717;
    out.m_79.y = _1713;
    out.m_79.z = _1721;
    float _1747 = _1703 * _1244;
    float _1749 = _1265 * _1747;
    float _1751 = _1265 * _1745;
    float _1753 = _1745;
    float _1755 = _1749;
    float _1757 = _1741;
    float _1759 = _1741;
    if (!_1611)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1761 = _1753;
    float _1763 = _1275 * _1747;
    float _1765 = fma(_1271, _1749, _1259);
    float _1767 = fma(_1273, _1749, _1261);
    float _1769 = _1761;
    float _1771 = _1761;
    if (!_1611)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1773 = _1755;
    float _1775 = fma(_1265, _1763, _1263);
    out.m_81.x = _1765;
    out.m_81.y = _1767;
    out.m_81.z = _1775;
    out.m_81.w = _1751;
    bool _1777 = !_1611;
    float _1779 = _1773;
    float _1781 = _1773;
    if (!_1777)
    {
        bool _1783 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1785 = isnan(_958);
        bool _1787 = _1783 || _1785;
        bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1791 = _1787 || _1789;
        if (!_1791)
        {
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1795 = _958 + _1793;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1797;
            float _1801 = 1.0 / _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1823 = _1795 * _1801;
            float _1825 = precise::clamp(_1823, 0.0, 1.0);
            float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1831 = fma(_1825, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1833 = fma(_1825, _1829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1835 = fma(_1825, _1805, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1837 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1839 = fma(_1825, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1841 = fma(_1825, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1835;
            _1727 = _1839;
            _1739 = _1833;
            _1771 = _1837;
            _1781 = _1831;
            _1733 = _1841;
            _1843 = true;
        }
        else
        {
            bool _1845 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1847 = isnan(_958);
            bool _1849 = _1845 || _1847;
            bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1853 = _1849 || _1851;
            if (!_1853)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1855 = _1769;
            _1771 = _1855;
            if (!_1853)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1857 = _1725;
            _1727 = _1857;
            if (!_1853)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1859 = _1731;
            _1733 = _1859;
            if (!_1853)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1861 = _1737;
            _1739 = _1861;
            if (!_1853)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1863 = _1757;
            _1759 = _1863;
            if (!_1853)
            {
                _1779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1865 = _1779;
            bool _1867 = !_1853;
            _1781 = _1865;
            if (!_1867)
            {
                bool _1869 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1871 = isnan(_958);
                bool _1873 = _1869 || _1871;
                bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1877 = _1873 || _1875;
                if (!_1877)
                {
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1881 = _958 + _1879;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1883;
                    float _1887 = 1.0 / _1885;
                    float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1909 = _1881 * _1887;
                    float _1911 = precise::clamp(_1909, 0.0, 1.0);
                    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1917 = fma(_1911, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1919 = fma(_1911, _1915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1921 = fma(_1911, _1891, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1923 = fma(_1911, _1899, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1925 = fma(_1911, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1927 = fma(_1911, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1921;
                    _1727 = _1925;
                    _1739 = _1919;
                    _1771 = _1923;
                    _1781 = _1917;
                    _1733 = _1927;
                    _1843 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1843 = false;
    float _1929 = _1759;
    float _1931 = _1727;
    float _1933 = _1739;
    float _1935 = _1771;
    float _1937 = _1781;
    float _1939 = _1733;
    float _1941 = fma(_1713, -0.5, 0.5);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -_1929;
    float _1947 = _1931 + _1945;
    float _1949 = -_1933;
    float _1951 = _1935 + _1949;
    float _1953 = -_1937;
    float _1955 = _1939 + _1953;
    bool _1957 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1959 = fma(_1943, _1947, _1929);
    float _1961 = fma(_1943, _1951, _1933);
    float _1963 = fma(_1943, _1955, _1937);
    float _1965 = _1959 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1967 = fma(_1961, 0.298911988735198974609375, _1965);
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = fma(_1963, 0.114477999508380889892578125, _1967);
    out.m_83.w = _1969;
    float _1973 = -_1971;
    float _1975 = _1961 + _1973;
    float _1977 = -_1971;
    float _1979 = _1959 + _1977;
    float _1981 = -_1971;
    float _1983 = _1963 + _1981;
    out.m_85.x = 0.0;
    float _1985 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1987 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1989 = fma(_1983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    out.m_87.x = _1985;
    out.m_87.y = _1987;
    out.m_87.z = _1989;
    if (!_1957)
    {
        return out;
    }
    float _1991 = -_932;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1995 = -_934;
    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1999 = -_936;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2003 = _1993 * _1993;
    float _2005 = fma(_1997, _1997, _2003);
    float _2007 = fma(_2001, _2001, _2005);
    float _2009 = sqrt(_2007);
    float _2011 = rsqrt(_2007);
    float _2013 = -_2009;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2017 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1997 * _2011;
    float _2023 = _1993 * _2011;
    float _2025 = abs(_2019);
    float _2027 = log2(_2025);
    float _2029 = _2001 * _2011;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2033 = _1713 * _2023;
    float _2035 = -_2023;
    float _2037 = -_2031;
    float _2039 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2037);
    float _2041 = fma(_1717, _2021, _2033);
    float _2043 = -_2029;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2039);
    float _2047 = fma(_1721, _2029, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2053 = _2045 + _2051;
    float _2055 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2057 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = exp2(_2055);
    float _2063 = _2061 * _2059;
    float _2065 = _2049 * _2063;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2067;
    out.m_85.y = _2069;
    out.m_85.z = _2071;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1843 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_120);
        out.gl_Position.z = _2127;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
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
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2198 = as_type<float>(_160);
        out.gl_Position.z = _2198;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.z;
    float _164 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_53.x;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _180 = _162 * 2.0;
    float _182 = floor(_180);
    float _184 = _166 * 2.0;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _166 + _162;
    float _190 = _170 * 2.0;
    float _192 = -_168;
    float _194 = fma(_186, 2.0, _192);
    float _196 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _198 = floor(_184);
    float _200 = _170 + _166;
    float _202 = _188 + (-1.0);
    float _204 = fma(_196, -2.0, _176);
    float _206 = _200 + (-1.0);
    float _208 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _210 = _202;
    float _212 = _164;
    if (_174)
    {
        _210 = _166;
    }
    float _214 = _210;
    float _216 = floor(_190);
    bool _218 = _182 >= 0.0;
    bool _220 = isnan(_182);
    bool _222 = _218 || _220;
    bool _224 = isnan(0.0);
    bool _226 = _222 || _224;
    float _228 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _182 > 0.0;
    int _232 = _226 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    bool _244 = _198 > 0.0;
    bool _246 = _198 >= 0.0;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan(0.0);
    bool _254 = _250 || _252;
    float _256 = _198;
    float _258 = _214;
    if (!_174)
    {
        _256 = _170;
    }
    float _260 = _256;
    float _262 = _260;
    if (!_174)
    {
        _258 = _162;
    }
    float _264 = _258;
    bool _266 = _216 > 0.0;
    bool _268 = _216 >= 0.0;
    bool _270 = isnan(_216);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    float _278 = _264 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _280 = 0.0;
    float _282 = _278;
    if (!_242)
    {
        float _284 = _164 * _164;
        float _286 = _284 * 0.5;
        _280 = _286;
    }
    float _288 = _280;
    float _290 = _288;
    if (_174)
    {
        _262 = _166;
    }
    float _292 = _262;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _296 = ~_232;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _304 = _300;
    float _306 = _292;
    if (!_230)
    {
        int _308 = ~_232;
        int _310 = _308 + 1;
        _304 = _310;
    }
    int _312 = _304;
    float _314 = _292 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _316 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[83].z, _294);
    float _318 = -_302;
    float _320 = fma(_278, 2.0, _318);
    float _322 = _314;
    if (!_242)
    {
        float _324 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _324;
    }
    float _326 = _290;
    float _328 = -_178;
    float _330 = fma(_314, 2.0, _328);
    bool _332 = !_242;
    float _334 = _326;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _164 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _164);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _348;
        _322 = _354;
        _306 = _352;
        _334 = _364;
    }
    float _366 = _282;
    float _368 = _322;
    float _370 = _306;
    float _372 = _334;
    bool _374 = !_242;
    float _376 = _366;
    float _378 = _368;
    float _380 = _370;
    if (!_374)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _164 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _212 = _400;
    }
    float _402 = _212;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    int _408 = _276 ? 0 : 1;
    float _410 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _316);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = -_132;
    float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    if (!_174)
    {
        _376 = _162;
    }
    float _428 = _376;
    float _430 = -_132;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[81].x, _330);
    float _434 = in.m_55.w;
    float _436 = _428;
    if (_174)
    {
        _436 = _170;
    }
    float _438 = _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_174)
    {
        _378 = _170;
    }
    float _450 = _378;
    float _452 = fma(_442, -2.0, _440);
    float _454 = _450;
    if (!_174)
    {
        _454 = _166;
    }
    float _456 = _454;
    float _458 = _406 * _132;
    if (!_174)
    {
        _380 = _162;
    }
    float _460 = _380;
    float _462 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _452);
    int _464 = abs(_446);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _460;
    if (_174)
    {
        _468 = _170;
    }
    float _470 = _468;
    float _472 = _456 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _474 = exp2(_458);
    float _476 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _478 = fma(_472, -2.0, _448);
    float _480 = float(_312);
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = float(_464);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _492 = 1.0 + _490;
    int _494 = ~_408;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _204);
    int _502 = _498;
    if (!_266)
    {
        int _504 = ~_408;
        int _506 = _504 + 1;
        _502 = _506;
    }
    int _508 = _502;
    float _510 = 1.0 / _492;
    float _512 = _488 * _480;
    float _514 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _476);
    bool _516 = !_422;
    int _518 = _516 ? 0 : 1;
    float _520 = -_474;
    float _522 = _520 + 1.0;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = _512 * (-2.0);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _542 = abs(_518);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _528);
    float _558 = float(_508);
    float _560 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _562 = float(_542);
    float _564 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _540);
    float _566 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _544);
    float _568 = _554 ? _522 : 0.0;
    float _570 = _166 + (-0.5);
    float _572 = fma(_526, _482, _482);
    float _574 = _562 * _558;
    float _576 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _578 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _580 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    float _582 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _566);
    float _584 = -_132;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[86].x, _320);
    float _588 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _478);
    int _590 = as_type<int>(_578);
    if (_538)
    {
        float _592 = _568 * _510;
        _154 = _592;
    }
    float _594 = _154;
    int _596 = _254 ? 0 : 1;
    float _598 = fma(_228, _526, _228);
    float _600 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _572);
    bool _602 = !_418;
    int _604 = _602 ? 0 : 1;
    float _606 = _574 * (-2.0);
    int _608 = ~_596;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_598, _594, _600);
    int _616 = _612;
    if (!_244)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_208, _606, _208);
    int _626 = abs(_604);
    float _628 = fma(_606, _486, _486);
    float _630 = _162 + (-0.5);
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = in.m_55.z;
    float _638 = _614 * 0.15915493667125701904296875;
    float _640 = float(_622);
    float _642 = _170 + _162;
    float _644 = float(_626);
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _628);
    float _648 = in.m_59.x;
    float _650 = in.m_59.y;
    float _652 = in.m_59.z;
    float _654 = _642 + (-1.0);
    float _656 = _644 * _640;
    float _658 = fma(_624, _594, _646);
    float _660 = _638 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = _656 * (-2.0);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = _170 + (-0.5);
    float _672 = fma(_664, _484, _484);
    float _674 = fma(_666, _664, _666);
    float _676 = _638 * 6.283185482025146484375;
    float _678 = cos(_676);
    float _680 = in.m_49.x;
    float _682 = in.m_49.y;
    float _684 = in.m_49.z;
    float _686 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _672);
    float _688 = _634 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _690 = fma(_674, _594, _686);
    float _692 = _636 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _668 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = in.m_44.x;
    float _700 = in.m_44.y;
    float _702 = in.m_44.z;
    float _704 = _690 * 0.15915493667125701904296875;
    float _706 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _652);
    float _710 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _668 * 6.283185482025146484375;
    float _718 = cos(_716);
    float _720 = _708 * _706;
    float _722 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _648);
    float _726 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _704 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_402, _680, _722);
    float _734 = fma(_402, _682, _714);
    float _736 = _678 * _696;
    float _738 = _724 * _726;
    float _740 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _650);
    float _744 = _704 * 6.283185482025146484375;
    float _746 = cos(_744);
    float _748 = fma(_732, _434, _698);
    float _750 = _662 * _696;
    float _752 = _678 * _718;
    float _754 = _662 * _718;
    float _756 = fma(_402, _684, _740);
    float _758 = _742 * _710;
    float _760 = fma(_734, _434, _700);
    float _762 = fma(_730, _750, _752);
    float _764 = -_736;
    float _766 = fma(_730, _754, _764);
    float _768 = -_754;
    float _770 = fma(_730, _736, _768);
    float _772 = fma(_756, _434, _702);
    float _774 = _762 * _720;
    float _776 = fma(_730, _752, _750);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _662 * _746;
    float _784 = _696 * _746;
    float _786 = _718 * _746;
    float _788 = _678 * _746;
    float _790 = _782 * _720;
    float _792 = _766 * _720;
    float _794 = fma(_784, _738, _774);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _798 = -_730;
    float _800 = fma(_798, _738, _790);
    float _802 = fma(_786, _738, _792);
    float _804 = -_758;
    float _806 = fma(_770, _804, _794);
    float _808 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _810 = -_758;
    float _812 = fma(_788, _810, _800);
    float _814 = -_758;
    float _816 = fma(_776, _814, _802);
    float _818 = _806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _820 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _822 = _806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _824 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[4].z, _808);
    float _826 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[10].x, _818);
    float _828 = _820 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].x, _822);
    float _832 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[10].z, _826);
    float _836 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[8].z, _830);
    float _840 = _834 + _828;
    float _842 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _844 = _838 + _832;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _848 = _840 + _846;
    float _850 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _854 = _844 + _852;
    float _856 = _848 * _848;
    float _858 = _850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _860 = fma(_854, _854, _856);
    float _862 = _806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _864 = sqrt(_860);
    float _866 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[9].x, _862);
    float _868 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[9].z, _866);
    float _870 = _868 + _858;
    bool _872 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _874 = _868;
    float _876 = _844;
    float _878 = _858;
    float _880 = _842;
    if (!_872)
    {
        _874 = _844;
    }
    float _882 = _874;
    float _884 = _882;
    if (!_872)
    {
        _876 = _840;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_872)
    {
        _878 = _870;
    }
    float _890 = _878;
    bool _892 = !_872;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _864 + _898;
        float _902 = _870 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = rsqrt(_860);
        float _906 = _900 * _896;
        float _908 = _906 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _922 = fma(_916, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = fma(_870, _912, _920);
        float _926 = _904 * _922;
        float _928 = fma(_854, _926, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_848, _926, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _924;
        _884 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _884;
    float _936 = _888;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _940 = _932 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _934 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _948 = _936 + _946;
    float _950 = _940 * _940;
    float _952 = fma(_944, _944, _950);
    float _954 = fma(_948, _948, _952);
    float _956 = rsqrt(_954);
    float _958 = sqrt(_954);
    float _960 = _956 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _944 * _960;
    float _964 = _948 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _956;
    float _982 = _978;
    float _984 = _940;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    float _992 = _990;
    if (_974)
    {
        float _994 = _978 * _990;
        _982 = _994;
    }
    float _996 = _982;
    if (_974)
    {
        float _998 = rsqrt(_970);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _1000;
    if (_974)
    {
        float _1004 = _996 * 0.15915493667125701904296875;
        _880 = _1004;
    }
    float _1006 = _880;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = _948;
    float _1012 = _1006;
    if (_974)
    {
        float _1014 = _1006 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        _1010 = _1016;
    }
    float _1018 = _1010;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1022 = precise::max(0.0, _1008);
    float _1024 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1020);
    float _1026 = _748;
    float _1028 = _1022;
    if (_974)
    {
        float _1030 = _1006 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        _1026 = _1032;
    }
    float _1034 = _1026;
    float _1036 = -_960;
    float _1038 = -_1022;
    float _1040 = fma(_940, _1036, _1038);
    float _1042 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    if (_974)
    {
        float _1044 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1044;
    }
    float _1046 = _984;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1050 = _1018;
    float _1052 = _1046;
    if (_974)
    {
        float _1054 = fma(_1018, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1050 = _1054;
    }
    float _1056 = _1050;
    float _1058 = _1056;
    if (!_974)
    {
        _1052 = _1040;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (_974)
    {
        float _1064 = _1000 * _1056;
        _986 = _1064;
    }
    float _1066 = _986;
    if (!_974)
    {
        _1002 = _962;
    }
    float _1068 = _1002;
    float _1070 = _1068;
    float _1072 = _1034;
    if (_974)
    {
        float _1074 = _1034 + (-1.0);
        _1028 = _1074;
    }
    float _1076 = _1028;
    float _1078 = _1076;
    if (_974)
    {
        float _1080 = _962 * _1066;
        _1070 = _1080;
    }
    float _1082 = _1070;
    if (!_974)
    {
        _1058 = _966;
    }
    float _1084 = _1058;
    float _1086 = _1084;
    if (_974)
    {
        float _1088 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1088;
    }
    float _1090 = _1012;
    if (!_974)
    {
        _1078 = _964;
    }
    float _1092 = _1078;
    float _1094 = _1092;
    if (_974)
    {
        float _1096 = _964 * _1066;
        _1094 = _1096;
    }
    float _1098 = _1094;
    if (_974)
    {
        float _1100 = _1082 * _1082;
        _1086 = _1100;
    }
    float _1102 = _1086;
    if (_974)
    {
        float _1104 = fma(_1040, _1034, _1090);
        _1062 = _1104;
    }
    float _1106 = _1062;
    if (!_974)
    {
        _1072 = _968;
    }
    float _1108 = _1072;
    float _1110 = _1108;
    if (_974)
    {
        float _1112 = _1098 * _1098;
        _1110 = _1112;
    }
    float _1114 = _1110;
    float _1116 = _932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1118 = fma(_1106, _1106, _1102);
    float _1120 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1116);
    float _1124 = _1118 + _1114;
    float _1126 = _932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1136 = rsqrt(_1124);
    float _1138 = _932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1126);
    float _1142 = -_1132;
    float _1144 = _1142 + 1.0;
    float _1146 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1138);
    float _1150 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1140);
    float _1152 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1148);
    float _1154 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = abs(_1144);
    float _1158 = log2(_1156);
    float _1160 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1136 * _1082;
    float _1168 = _1136 * _1106;
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1172 = _1136 * _1098;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1176 = -_1160;
    float _1178 = fma(_1176, _1120, 1.0);
    float _1180 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = -_1174;
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1182);
    float _1186 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1188 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1190 = -_1172;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1184);
    float _1194 = log2(_1178);
    float _1196 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = fma(_1192, 0.5, 0.5);
    float _1204 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = _1168 + 1.0;
    float _1210 = 1.0 / _1186;
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1218 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1220 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = fma(_1202, _1216, -0.212114393711090087890625);
    float _1224 = sqrt(_1200);
    float _1226 = _1194 * 0.693147182464599609375;
    float _1228 = fma(_1202, _1222, 1.570728778839111328125);
    float _1230 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = exp2(_1188);
    float _1234 = _1218 * _1210;
    float _1236 = _1220 * _1210;
    float _1238 = fma(_1234, 0.5, 0.5);
    float _1240 = fma(_1236, -0.5, 0.5);
    float _1242 = _1224 * 0.636619746685028076171875;
    float3 _3933 = float3(_1238, _1240, _1230);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3933, float3(0.0), isnan(_3933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3933, float3(0.0), isnan(_3933)), level(0.0)).x;
    float _1246 = -_1228;
    float _1248 = fma(_1242, _1246, 1.0);
    float _1250 = -_1168;
    float _1252 = fma(_1232, _1208, _1250);
    float _1254 = fma(_1252, 0.5, 0.5);
    float3 _3957 = float3(_1238, _1240, _1230);
    float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3957, float3(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3957, float3(0.0), isnan(_3957)), level(0.0)).xyzw;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1257.w;
    float2 _3974 = float2(_1248, _1254);
    float3 _1269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3974, float2(0.0), isnan(_3974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3974, float2(0.0), isnan(_3974)), level(0.0)).xyz;
    float _1271 = _1269.x;
    float _1273 = _1269.y;
    float _1275 = _1269.z;
    float _1277 = in.m_61.y;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1281 = _170 > 0.5;
    float _1283 = in.m_53.w;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_61.x;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1305 = _1303 != 0;
    float _1307 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1309 = _162 > 0.5;
    out.m_63.x = _934;
    out.m_63.y = _932;
    out.m_63.z = _936;
    float _1311 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    bool _1319 = _1283 > 0.5;
    float _1321 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1323 = _1281 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1325 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1327 = _1283;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1331 = _1277;
    int _1333 = as_type<int>(_1321);
    bool _1335 = _1293;
    float _1337 = _1301;
    float _1339 = _1186;
    float _1341 = _1220;
    float _1343 = _1218;
    if (!_1287)
    {
        _1327 = _1295;
    }
    float _1345 = _1327;
    float _1347 = in.m_65.x;
    float _1349 = in.m_65.y;
    float _1351 = in.m_65.z;
    float _1353 = _1299 ? as_type<float>(_1323) : _1277;
    float _1355 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1357 = _1319 ? as_type<int>(_1317) : as_type<int>(_1277);
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1321, _1353, -0.5);
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1311);
    float _1373 = _1345;
    if (!_1287)
    {
        _1329 = _1345;
    }
    float _1375 = _1329;
    float _1377 = _1375;
    if (_1287)
    {
        _1373 = _1295;
    }
    float _1379 = _1373;
    float _1381 = exp2(_1289);
    float _1383 = _1369 ? as_type<float>(_1357) : _1277;
    float _1385 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1371);
    float _1387 = _1383;
    float _1389 = _1379;
    float _1391 = _1385;
    if (_1293)
    {
        float _1393 = _1309 ? _1317 : _1277;
        _1331 = _1393;
    }
    float _1395 = _1331;
    if (_1287)
    {
        float _1397 = -_1379;
        float _1399 = _1397 + 1.0;
        _1333 = as_type<int>(_1399);
    }
    int _1401 = _1333;
    if (_1287)
    {
        bool _1403 = _166 > 0.5;
        _1335 = _1403;
    }
    bool _1405 = _1335;
    float _1407 = fma(_1383, _1325, -0.5);
    float _1409 = -_500;
    float _1411 = fma(_578, _1365, _1409);
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1287)
    {
        float _1415 = _1405 ? as_type<float>(_1401) : _1379;
        _1377 = _1415;
    }
    float _1417 = _1377;
    float _1419 = fma(_1355, _1395, -0.5);
    float _1421 = in.m_67.x;
    float _1423 = in.m_67.y;
    float _1425 = in.m_67.z;
    float _1427 = in.m_67.w;
    bool _1429 = _650 != 0.0;
    bool _1431 = isnan(_650);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(0.0);
    bool _1437 = _1433 || _1435;
    if (_1305)
    {
        float _1439 = -_1379;
        float _1441 = _1439 + 1.0;
        _590 = as_type<int>(_1441);
    }
    int _1443 = _590;
    int _1445 = 0;
    float _1447 = as_type<float>(_1443);
    if (_1363)
    {
        float _1449 = -_1379;
        float _1451 = _1449 + 1.0;
        _1445 = as_type<int>(_1451);
    }
    int _1453 = _1445;
    if (!_1305)
    {
        _1387 = _1379;
    }
    float _1455 = _1387;
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1459 = _648 == 0.0;
    bool _1461 = !_1437;
    bool _1463 = _1459 && _1461;
    float _1465 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1467 = _1455;
    if (!_1363)
    {
        _1337 = _1379;
    }
    float _1469 = _1337;
    float _1471 = -_462;
    float _1473 = fma(_514, _1407, _1471);
    bool _1475 = _652 == 0.0;
    bool _1477 = _1475 && _1463;
    float _1479 = fma(_1465, _1417, -0.5);
    float _1481 = _1469;
    if (_1305)
    {
        float _1483 = _1309 ? as_type<float>(_1443) : _1379;
        _1467 = _1483;
    }
    float _1485 = _1467;
    float _1487 = -_1381;
    float _1489 = _1487 + 1.0;
    if (_1363)
    {
        float _1491 = _1281 ? as_type<float>(_1453) : _1379;
        _1481 = _1491;
    }
    float _1493 = _1481;
    float _1495 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1497 = fma(_576, _1479, _426);
    out.gl_Position.x = _1218;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1385;
    out.gl_Position.w = _1186;
    float _1499 = fma(_1495, _1485, -0.5);
    float _1501 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1503 = _1413;
    if (_1477)
    {
        _1447 = _1347;
    }
    float _1505 = _1447;
    float _1507 = _1505;
    if (!_1477)
    {
        float _1509 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1347);
        _1507 = _1509;
    }
    float _1511 = _1507;
    if (_1477)
    {
        _1503 = _1351;
    }
    float _1513 = _1503;
    float _1515 = fma(_1501, _1493, -0.5);
    float _1517 = _1513;
    if (!_1477)
    {
        float _1519 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1351);
        _1517 = _1519;
    }
    float _1521 = _1517;
    float _1523 = fma(_410, _1499, _432);
    float _1525 = _1421 * _1349;
    if (_1477)
    {
        _1389 = _1349;
    }
    float _1527 = _1389;
    float _1529 = _1425 * _1347;
    float _1531 = _1527;
    if (!_1477)
    {
        float _1533 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1349);
        _1531 = _1533;
    }
    float _1535 = _1531;
    float _1537 = _1423 * _1351;
    float _1539 = fma(_580, _1515, _586);
    float _1541 = -_1525;
    float _1543 = fma(_1423, _1347, _1541);
    float _1545 = -_1529;
    float _1547 = fma(_1421, _1351, _1545);
    float _1549 = -_1537;
    float _1551 = fma(_1425, _1349, _1549);
    float _1553 = _1539 + 0.5;
    float _1555 = -_588;
    float _1557 = fma(_582, _1419, _1555);
    float _1559 = _1473 + 0.5;
    float _1561 = _1543 * _1427;
    float _1563 = _1411 + 0.5;
    float _1565 = _1497 + 0.5;
    float _1567 = _1523 + 0.5;
    float _1569 = _1547 * _1427;
    float _1571 = _782 * _1425;
    float _1573 = _766 * _1425;
    float _1575 = _762 * _1425;
    float _1577 = _782 * _1521;
    float _1579 = _766 * _1521;
    float _1581 = _762 * _1521;
    float _1583 = _782 * _1561;
    float _1585 = _766 * _1561;
    float _1587 = _1551 * _1427;
    float _1589 = _762 * _1561;
    out.m_69.x = _1565;
    out.m_69.y = _1563;
    out.m_69.z = _1567;
    out.m_69.w = _1559;
    float _1591 = _1557 + 0.5;
    float _1593 = fma(_784, _1421, _1575);
    float _1595 = -_730;
    float _1597 = fma(_1595, _1511, _1577);
    float _1599 = -_730;
    float _1601 = fma(_1599, _1587, _1583);
    bool _1603 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1605 = isnan(_958);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1611 = _1607 || _1609;
    float _1613 = -_1423;
    float _1615 = fma(_770, _1613, _1593);
    out.m_71.x = _1553;
    out.m_71.y = _1591;
    float _1617 = fma(_784, _1511, _1581);
    float _1619 = fma(_784, _1587, _1589);
    float _1621 = fma(_786, _1511, _1579);
    float _1623 = fma(_786, _1421, _1573);
    float _1625 = -_1535;
    float _1627 = fma(_770, _1625, _1617);
    float _1629 = fma(_786, _1587, _1585);
    float _1631 = -_1569;
    float _1633 = fma(_770, _1631, _1619);
    float _1635 = -_730;
    float _1637 = fma(_1635, _1421, _1571);
    float _1639 = -_1569;
    float _1641 = fma(_788, _1639, _1601);
    float _1643 = -_1535;
    float _1645 = fma(_776, _1643, _1621);
    float _1647 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1649 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1651 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1653 = -_1423;
    float _1655 = fma(_776, _1653, _1623);
    float _1657 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1659 = -_1569;
    float _1661 = fma(_776, _1659, _1629);
    float _1663 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1665 = -_1535;
    float _1667 = fma(_788, _1665, _1597);
    float _1669 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1671 = -_1423;
    float _1673 = fma(_788, _1671, _1637);
    float _1675 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1647);
    float _1677 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1649);
    float _1679 = fma(_1645, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1651);
    float _1681 = _1633 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1657);
    float _1689 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1691 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1669);
    float _1693 = fma(_1661, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1695 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1697 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1685);
    float _1699 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1687);
    float _1701 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1689);
    float _1703 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1695);
    float _1707 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1697);
    float _1709 = _1385 + _1186;
    float _1711 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1691);
    float _1713 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1677);
    float _1715 = _1709 * 0.5;
    out.m_73.x = _1705;
    out.m_73.y = _1707;
    out.m_73.z = _1699;
    float _1717 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1675);
    float _1719 = fma(_1641, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1693);
    float _1721 = fma(_1667, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1679);
    out.m_75.z = _1715;
    out.m_75.w = _1186;
    if (!_1611)
    {
        _1339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1723 = _1339;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1611)
    {
        _1391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1391;
    out.m_77.x = _1711;
    out.m_77.y = _1701;
    out.m_77.z = _1719;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1611)
    {
        _1341 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1735 = _1341;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1611)
    {
        _1343 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1741 = _1343;
    float _1743 = -_1703;
    float _1745 = _1743 + 1.0;
    out.m_79.x = _1717;
    out.m_79.y = _1713;
    out.m_79.z = _1721;
    float _1747 = _1703 * _1244;
    float _1749 = _1265 * _1747;
    float _1751 = _1265 * _1745;
    float _1753 = _1745;
    float _1755 = _1749;
    float _1757 = _1741;
    float _1759 = _1741;
    if (!_1611)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1761 = _1753;
    float _1763 = _1275 * _1747;
    float _1765 = fma(_1271, _1749, _1259);
    float _1767 = fma(_1273, _1749, _1261);
    float _1769 = _1761;
    float _1771 = _1761;
    if (!_1611)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1773 = _1755;
    float _1775 = fma(_1265, _1763, _1263);
    out.m_81.x = _1765;
    out.m_81.y = _1767;
    out.m_81.z = _1775;
    out.m_81.w = _1751;
    bool _1777 = !_1611;
    float _1779 = _1773;
    float _1781 = _1773;
    if (!_1777)
    {
        bool _1783 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1785 = isnan(_958);
        bool _1787 = _1783 || _1785;
        bool _1789 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1791 = _1787 || _1789;
        if (!_1791)
        {
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1795 = _958 + _1793;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1797;
            float _1801 = 1.0 / _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1823 = _1795 * _1801;
            float _1825 = precise::clamp(_1823, 0.0, 1.0);
            float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1831 = fma(_1825, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1833 = fma(_1825, _1829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1835 = fma(_1825, _1805, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1837 = fma(_1825, _1813, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1839 = fma(_1825, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1841 = fma(_1825, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1835;
            _1727 = _1839;
            _1739 = _1833;
            _1771 = _1837;
            _1781 = _1831;
            _1733 = _1841;
            _1843 = true;
        }
        else
        {
            bool _1845 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1847 = isnan(_958);
            bool _1849 = _1845 || _1847;
            bool _1851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1853 = _1849 || _1851;
            if (!_1853)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1855 = _1769;
            _1771 = _1855;
            if (!_1853)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1857 = _1725;
            _1727 = _1857;
            if (!_1853)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1859 = _1731;
            _1733 = _1859;
            if (!_1853)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1861 = _1737;
            _1739 = _1861;
            if (!_1853)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1863 = _1757;
            _1759 = _1863;
            if (!_1853)
            {
                _1779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1865 = _1779;
            bool _1867 = !_1853;
            _1781 = _1865;
            if (!_1867)
            {
                bool _1869 = _958 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1871 = isnan(_958);
                bool _1873 = _1869 || _1871;
                bool _1875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1877 = _1873 || _1875;
                if (!_1877)
                {
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1881 = _958 + _1879;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1883;
                    float _1887 = 1.0 / _1885;
                    float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1909 = _1881 * _1887;
                    float _1911 = precise::clamp(_1909, 0.0, 1.0);
                    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1917 = fma(_1911, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1919 = fma(_1911, _1915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1921 = fma(_1911, _1891, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1923 = fma(_1911, _1899, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1925 = fma(_1911, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1927 = fma(_1911, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1921;
                    _1727 = _1925;
                    _1739 = _1919;
                    _1771 = _1923;
                    _1781 = _1917;
                    _1733 = _1927;
                    _1843 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1843 = false;
    float _1929 = _1759;
    float _1931 = _1727;
    float _1933 = _1739;
    float _1935 = _1771;
    float _1937 = _1781;
    float _1939 = _1733;
    float _1941 = fma(_1713, -0.5, 0.5);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -_1929;
    float _1947 = _1931 + _1945;
    float _1949 = -_1933;
    float _1951 = _1935 + _1949;
    float _1953 = -_1937;
    float _1955 = _1939 + _1953;
    bool _1957 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1959 = fma(_1943, _1947, _1929);
    float _1961 = fma(_1943, _1951, _1933);
    float _1963 = fma(_1943, _1955, _1937);
    float _1965 = _1959 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1967 = fma(_1961, 0.298911988735198974609375, _1965);
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = fma(_1963, 0.114477999508380889892578125, _1967);
    out.m_83.w = _1969;
    float _1973 = -_1971;
    float _1975 = _1961 + _1973;
    float _1977 = -_1971;
    float _1979 = _1959 + _1977;
    float _1981 = -_1971;
    float _1983 = _1963 + _1981;
    out.m_85.x = 0.0;
    float _1985 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1987 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    float _1989 = fma(_1983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1971);
    out.m_87.x = _1985;
    out.m_87.y = _1987;
    out.m_87.z = _1989;
    if (!_1957)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1991 = -_932;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1995 = -_934;
    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1999 = -_936;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2003 = _1993 * _1993;
    float _2005 = fma(_1997, _1997, _2003);
    float _2007 = fma(_2001, _2001, _2005);
    float _2009 = sqrt(_2007);
    float _2011 = rsqrt(_2007);
    float _2013 = -_2009;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2017 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1997 * _2011;
    float _2023 = _1993 * _2011;
    float _2025 = abs(_2019);
    float _2027 = log2(_2025);
    float _2029 = _2001 * _2011;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2033 = _1713 * _2023;
    float _2035 = -_2023;
    float _2037 = -_2031;
    float _2039 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2037);
    float _2041 = fma(_1717, _2021, _2033);
    float _2043 = -_2029;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2039);
    float _2047 = fma(_1721, _2029, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2053 = _2045 + _2051;
    float _2055 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2057 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = exp2(_2055);
    float _2063 = _2061 * _2059;
    float _2065 = _2049 * _2063;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2071 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2067;
    out.m_85.y = _2069;
    out.m_85.z = _2071;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

