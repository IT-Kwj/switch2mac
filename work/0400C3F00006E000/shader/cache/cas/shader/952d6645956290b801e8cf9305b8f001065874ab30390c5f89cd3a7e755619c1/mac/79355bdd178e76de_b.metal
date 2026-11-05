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
    float4 m_67 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_49 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_65 [[attribute(12)]];
    float4 m_59 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2543 = as_type<float>(_120);
        out.gl_Position.z = _2543;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_47.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_156);
        out.gl_Position.z = _2608;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = 1.0 / _126;
    float _178 = _162 * _160;
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _130 * _176;
    float _184 = _180 * 6.283185482025146484375;
    float _186 = floor(_180);
    float _188 = _184 * 0.15915493667125701904296875;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = _188 * 6.283185482025146484375;
    float _198 = cos(_196);
    bool _200 = !_174;
    int _202 = _200 ? 0 : 1;
    bool _204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _206 = abs(_202);
    float _208 = -_186;
    float _210 = _180 + _208;
    bool _212 = !_170;
    int _214 = _212 ? 0 : 1;
    float _216 = float(_194);
    int _218 = abs(_214);
    float _220 = -_210;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _224 = _210 < 0.5;
    float _226 = float(_224);
    float _228 = fma(_198, 0.5, 0.5);
    float _230 = abs(_222);
    float _232 = _216 * _230;
    float _234 = float(_206);
    float _236 = -_226;
    float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _240 = -_228;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = float(_218);
    float _246 = fma(_234, _242, _232);
    float _248 = abs(_238);
    float _250 = fma(_244, _248, _246);
    bool _252 = !_204;
    float _254 = 0.5;
    int _256 = as_type<int>(_158);
    float _272;
    if (!_252)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _182;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = in.m_51.x;
    float _296 = in.m_51.y;
    float _298 = in.m_51.z;
    bool _300 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_276);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -_310;
    float _318 = _316 + 1.0;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _322 = 1.0 / _314;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _330 = _280 * _322;
    float _332 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = _292 * _318;
    float _344 = -_292;
    float _346 = _344 + 1.0;
    float _348 = fma(_336, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_340, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _332 * _342;
    float _354 = _348 * _342;
    float _356 = _350 * _342;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    float _370 = _364 * _294;
    float _372 = _366 * _296;
    float _374 = _368 * _298;
    bool _376 = !_320;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _158 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _182;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    float _404 = _158 * 2.0;
    float _406 = in.m_53.x;
    float _408 = in.m_53.y;
    float _410 = in.m_53.z;
    float _412 = in.m_53.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_55.x;
    float _432 = in.m_55.y;
    float _434 = in.m_55.z;
    float _436 = in.m_55.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _442 = 1.0 / _416;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    float _450 = in.m_57.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _456 = _182 * _182;
    float _458 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = 1.0 / _454;
    float _462 = in.m_49.y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _470 = _468 != 0;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _474 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = 1.0 / _440;
    float _478 = _400 * _408;
    float _480 = _400 * _432;
    float _482 = fma(_398, _406, _478);
    float _484 = 1.0 / _466;
    float _486 = _400 * _446;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _492 = fma(_398, _430, _480);
    float _494 = fma(_402, _410, _482);
    float _496 = fma(_398, _444, _486);
    float _498 = fma(_402, _434, _492);
    float _500 = 1.0 / _490;
    float _502 = fma(_402, _448, _496);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _512 = floor(_404);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _518 = _506 * _442;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _528 = _462 * 2.0;
    float _530 = _158 + _462;
    float _532 = _522 * _484;
    float _534 = 1.0 / _510;
    float _536 = _526 * _460;
    float _538 = _530 + (-1.0);
    float _540 = _494 + _412;
    bool _542 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _544 = isnan(_396);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _498 + _436;
    float _556 = _502 + _450;
    float _558 = 1.0 / _516;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _564;
    bool _568 = _512 > 0.0;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    bool _574 = _512 >= 0.0;
    bool _576 = isnan(_512);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = _566 * _500;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _590 = floor(_528);
    int _592 = _582 ? 0 : 1;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _594;
    float _598 = _588 * _534;
    float _600 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _600;
    float _604 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _604;
    float _608 = _596 * _558;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _612 = _602 * _602;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _616 = _396 + _614;
    float _618 = _562 * _476;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _622 = _396 + _620;
    float _624 = fma(_606, _606, _612);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _628 = _396 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _632 = _396 + _630;
    float _634 = fma(_518, _616, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _636 = _590 > 0.0;
    float _638 = fma(_536, _628, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _640 = fma(_532, _632, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _642 = _590 >= 0.0;
    bool _644 = isnan(_590);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _396 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = _396 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _396 + _666;
    float _670 = in.m_49.z;
    float _672 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _674 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _676 = isnan(_396);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_584, _664, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _688 = fma(_598, _622, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _690 = fma(_608, _668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _692 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _694 = isnan(_396);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    bool _708 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _710 = isnan(_396);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    bool _724 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_396);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _702 * _706;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _744 = isnan(_396);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _552 * _740;
    bool _756 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _758 = isnan(_396);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _752 * _572;
    float _770 = -_752;
    float _772 = _770 + 1.0;
    float _774 = _656 * 12.98980045318603515625;
    float _776 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _776;
    bool _780 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _782 = isnan(_396);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _718 * _772;
    float _794 = fma(_462, 78.233001708984375, _774);
    float _796 = fma(_778, _778, _624);
    float _798 = -_718;
    float _800 = _798 + 1.0;
    float _802 = fma(_158, 78.233001708984375, _774);
    float _804 = _794 * 0.15915493667125701904296875;
    int _806 = ~_592;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _766 * _800;
    float _814 = _802 * 0.15915493667125701904296875;
    float _816 = -_766;
    float _818 = _816 + 1.0;
    float _820 = _804 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _670 * 2.0;
    float _826 = _790 * _818;
    float _828 = -_790;
    float _830 = _828 + 1.0;
    float _832 = _818;
    float _834 = _830;
    int _836 = _810;
    bool _838 = _420;
    if (_470)
    {
        _832 = _462;
    }
    float _840 = _832;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _844 = _840;
    if (!_470)
    {
        _844 = _158;
    }
    float _846 = _844;
    float _848 = _734 * _830;
    float _850 = _814 * 6.283185482025146484375;
    float _852 = sin(_850);
    if (_470)
    {
        _834 = _670;
    }
    float _854 = _834;
    float _856 = -_734;
    float _858 = _856 + 1.0;
    float _860 = _854;
    if (!_470)
    {
        _860 = _462;
    }
    float _862 = _860;
    float _864 = _634 * _848;
    float _866 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _868 = _866;
    if (!_568)
    {
        int _870 = ~_592;
        int _872 = _870 + 1;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = _722 * _130;
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[89].z, _472);
    float _880 = _822 * 43758.546875;
    int _882 = _650 ? 0 : 1;
    float _884 = fma(_866, -2.0, _842);
    float _886 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _864);
    int _888 = ~_882;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    float _894 = floor(_880);
    float _896 = _852 * 43758.546875;
    int _898 = _892;
    if (!_636)
    {
        int _900 = ~_882;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_470)
    {
        _868 = _158;
    }
    float _908 = _868;
    float _910 = fma(_638, _826, _886);
    float _912 = _908;
    if (!_470)
    {
        _912 = _670;
    }
    float _914 = _912;
    float _916 = _462 + _670;
    float _918 = floor(_896);
    bool _920 = !_424;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_640, _812, _910);
    float _926 = _914 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _928 = _916 + (-1.0);
    int _930 = abs(_922);
    float _932 = -_906;
    float _934 = fma(_926, 2.0, _932);
    float _936 = floor(_824);
    float _938 = _158 + _670;
    float _940 = -_894;
    float _942 = _880 + _940;
    float _944 = float(_930);
    float _946 = _938 + (-1.0);
    float _948 = float(_874);
    float _950 = -_918;
    float _952 = _896 + _950;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _956 = !_428;
    int _958 = _956 ? 0 : 1;
    float _960 = exp2(_876);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _964 = _944 * _948;
    int _966 = abs(_958);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = _540 + _968;
    bool _972 = _936 > 0.0;
    float _974 = in.m_61.x;
    float _976 = in.m_61.y;
    float _978 = in.m_61.z;
    bool _980 = _936 >= 0.0;
    bool _982 = isnan(_936);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = float(_966);
    float _1006 = float(_904);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = 1.0 / _1002;
    float _1012 = -_960;
    float _1014 = _1012 + 1.0;
    float _1016 = _1004 * _1006;
    float _1018 = fma(_672, _792, _924);
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1022 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[89].x, _878);
    float _1026 = _964 * (-2.0);
    float _1028 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1020);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1042 = fma(_954, _1026, _954);
    float _1044 = -_554;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1028);
    float _1050 = _1038 ? _1014 : 0.0;
    float _1052 = fma(_1026, _976, _976);
    float _1054 = fma(_686, _768, _1018);
    float _1056 = -_540;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1046 * _1046;
    float _1062 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _884);
    float _1064 = -_130;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[86].x, _934);
    float _1068 = _1024;
    if (_998)
    {
        float _1070 = _1050 * _1010;
        _150 = _1070;
    }
    float _1072 = _150;
    float _1074 = -_556;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = fma(_1058, _1058, _1060);
    float _1080 = _1016 * (-2.0);
    float _1082 = fma(_688, _754, _1054);
    float _1084 = _670 + (-0.5);
    float _1086 = fma(_1076, _1076, _1078);
    float _1088 = fma(_1080, _978, _978);
    float _1090 = _462 + (-0.5);
    int _1092 = _988 ? 0 : 1;
    float _1094 = sqrt(_796);
    bool _1096 = !_420;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1088);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1052);
    float _1110 = fma(_962, _1080, _962);
    float _1112 = fma(_690, _736, _1082);
    int _1114 = _1106;
    if (!_972)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = rsqrt(_1086);
    int _1124 = abs(_1098);
    float _1126 = fma(_1042, _1072, _1108);
    float _1128 = fma(_1110, _1072, _1100);
    float _1130 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    float _1132 = in.m_63.x;
    float _1134 = in.m_63.y;
    float _1136 = in.m_63.z;
    float _1138 = float(_1124);
    float _1140 = _1128 * 0.15915493667125701904296875;
    float _1142 = float(_1120);
    float _1144 = fma(_942, 4.0, -2.0);
    float _1146 = _1126 * 0.15915493667125701904296875;
    float _1148 = _1138 * _1142;
    float _1150 = _1130 * _1144;
    float _1152 = _1046 * _1122;
    float _1154 = _1076 * _1122;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1058 * _1122;
    float _1160 = _1150 * 0.15915493667125701904296875;
    float _1162 = _1146 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = fma(_1156, _974, _974);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1154 * _1168;
    float _1172 = _158 + (-0.5);
    float _1174 = fma(_610, _1156, _610);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1178 = _1158 * _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1182 = -_1170;
    float _1184 = fma(_1152, _1180, _1182);
    float _1186 = _952 * 0.5;
    float _1188 = _1146 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1166);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1196 = -_1178;
    float _1198 = fma(_1154, _1194, _1196);
    float _1200 = -_1186;
    float _1202 = fma(_456, 1.5, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1136;
    float _1208 = _656 + _1206;
    float _1210 = fma(_1174, _1072, _1192);
    float _1212 = _1130 * _952;
    float _1214 = _1212 * 4.0;
    float _1216 = -_654;
    float _1218 = _1216 + _1134;
    float _1220 = _1160 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_1204, _1208, _1136);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1228 = _1152 * _1226;
    float _1230 = _1198 * _1198;
    float _1232 = -_652;
    float _1234 = _1232 + _1132;
    float _1236 = fma(_1214, _656, _1224);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1228;
    float _1242 = fma(_1158, _1238, _1240);
    float _1244 = fma(_1184, _1184, _1230);
    float _1246 = _1160 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 0.15915493667125701904296875;
    float _1252 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1260 = _554 + _1258;
    float _1262 = _1222 * _1218;
    float _1264 = _1140 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1094, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1270 = precise::max(_1268, 1.0);
    float _1272 = _1248 * _1218;
    float _1274 = -_1262;
    float _1276 = fma(_1248, _1234, _1274);
    float _1278 = _1250 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1254 * _1252;
    float _1284 = fma(_1222, _1234, _1272);
    float _1286 = _1276 + _652;
    float _1288 = precise::min(_1270, 1.89999997615814208984375);
    float _1290 = _1284 + _654;
    float _1292 = -_1276;
    float _1294 = fma(_1292, _1204, _1286);
    float _1296 = _1250 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1164 * _1266;
    float _1302 = -_1284;
    float _1304 = fma(_1302, _1204, _1290);
    float _1306 = fma(_1214, _652, _1294);
    float _1308 = _1190 * _1266;
    float _1310 = fma(_1214, _654, _1304);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1314 = rsqrt(_1256);
    float _1316 = _1280 * _1164;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1320 = _1312 * _474;
    float _1322 = _1318 * _458;
    float _1324 = _1140 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1298 * _1190;
    float _1330 = _1298 * _1164;
    float _1332 = _1280 * _1190;
    float _1334 = _1298 * _1266;
    float _1336 = _1280 * _1266;
    float _1338 = _1184 * _1314;
    float _1340 = _1198 * _1314;
    float _1342 = _1242 * _1314;
    float _1344 = _1336 * _1322;
    float _1346 = _1152 * _1338;
    float _1348 = _1158 * _1342;
    float _1350 = -_1330;
    float _1352 = fma(_1326, _1332, _1350);
    float _1354 = -_1332;
    float _1356 = fma(_1326, _1330, _1354);
    float _1358 = fma(_1326, _1328, _1316);
    float _1360 = _1334 * _1322;
    float _1362 = -_1322;
    float _1364 = _1326 * _1362;
    float _1366 = fma(_1352, _1320, _1344);
    float _1368 = fma(_1326, _1316, _1328);
    float _1370 = fma(_1358, _1320, _1360);
    float _1372 = _1154 * _1340;
    float _1374 = fma(_1308, _1320, _1364);
    float _1376 = -_1346;
    float _1378 = fma(_1158, _1340, _1376);
    float _1380 = fma(_1356, _1282, _1370);
    float _1382 = fma(_1368, _1282, _1366);
    float _1384 = -_1372;
    float _1386 = fma(_1152, _1342, _1384);
    float _1388 = fma(_1300, _1282, _1374);
    float _1390 = _1378 * _1380;
    float _1392 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1394 = _1386 * _1380;
    float _1396 = -_1348;
    float _1398 = fma(_1154, _1338, _1396);
    float _1400 = fma(_1342, _1388, _1390);
    float _1402 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1392);
    float _1404 = fma(_1338, _1388, _1394);
    float _1406 = _1398 * _1380;
    float _1408 = fma(_1154, _1382, _1400);
    float _1410 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1402);
    float _1412 = fma(_1158, _1382, _1404);
    float _1414 = fma(_1340, _1388, _1406);
    float _1416 = fma(_1408, _1288, _556);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1420 = fma(_1412, _1288, _540);
    float _1422 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1426 = _1416 + _1424;
    float _1428 = 1.0 / _1418;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1420 + _1430;
    float _1434 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1152, _1382, _1414);
    float _1440 = _1260 * _1260;
    float _1442 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1444 = fma(_1432, _1432, _1436);
    float _1446 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1448 = sqrt(_1444);
    bool _1450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    float _1460 = _1446 + _1418;
    float _1462 = _1460 * _1428;
    float _1464 = _1462 * 0.5;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    bool _1470 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(0.5);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_1438, _1288, _554);
    float _1482 = fma(_970, _970, _1440);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _556 + _1484;
    bool _1488 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = 1.0 / _1468;
    float _1492 = _1440;
    float _1494 = _1288;
    float _1496 = _1388;
    float _1498 = _1438;
    float _1500 = _1184;
    float _1502 = _1432;
    float _1504 = _1426;
    float _1506 = _1482;
    if (!_1488)
    {
        _1492 = _1420;
    }
    float _1508 = _1492;
    float _1510 = _1508;
    if (!_1488)
    {
        _1494 = _1416;
    }
    float _1512 = _1494;
    float _1514 = _1512;
    if (!_1488)
    {
        _1496 = _1480;
    }
    float _1516 = _1496;
    bool _1518 = !_1488;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1448 + _1524;
        float _1528 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = _1526 * _1522;
        float _1532 = rsqrt(_1444);
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 + (-1.0);
        float _1546 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = _1532 * _1546;
        float _1552 = fma(_1480, _1538, _1548);
        float _1554 = fma(_1432, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1426, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1510 = _1554;
        _1520 = _1552;
        _1498 = _1544;
        _1514 = _1556;
    }
    float _1558 = _1510;
    float _1560 = _1520;
    float _1562 = _1498;
    float _1564 = _1514;
    float _1566 = _1564;
    float _1568 = _1562;
    if (_1478)
    {
        _1500 = 1.0;
    }
    float _1570 = _1500;
    float _1572 = fma(_1486, _1486, _1482);
    float _1574 = _1570;
    if (_1458)
    {
        _1502 = _1558;
    }
    float _1576 = _1502;
    float _1578 = _1576;
    if (_1458)
    {
        _1504 = _1560;
    }
    float _1580 = _1504;
    float _1582 = _1580;
    if (!_1458)
    {
        float _1584 = sqrt(_1572);
        float _1586 = -_540;
        float _1588 = _1586 + _1558;
        float _1590 = -_554;
        float _1592 = _1590 + _1560;
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1598 = precise::min(_1584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1600 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1602 = -_556;
        float _1604 = _1602 + _1564;
        float _1606 = _1598 * _1596;
        float _1608 = _1600 * _1606;
        float _1610 = fma(_1588, _1608, _540);
        float _1612 = fma(_1592, _1608, _554);
        float _1614 = fma(_1604, _1608, _556);
        _1506 = _1604;
        _1582 = _1612;
        _1578 = _1610;
        _1566 = _1614;
        _1568 = _1608;
    }
    float _1616 = _1506;
    float _1618 = _1582;
    float _1620 = _1578;
    float _1622 = _1566;
    float _1624 = _1568;
    float _1626 = 0.0;
    float _1628 = _1624;
    float _1630 = _1616;
    if (_1478)
    {
        _1626 = 1.0;
    }
    float _1632 = _1626;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1490 * _1634;
    float _1638 = _1632;
    if (!_1478)
    {
        float _1640 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1644 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1642;
        float _1646 = _1640 * 0.15915493667125701904296875;
        float _1648 = _1646 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1654 = _1652 * 0.15915493667125701904296875;
        float _1656 = _1646 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = 1.0 / _1650;
        float _1662 = _1654 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * _1660;
        float _1668 = _1654 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1664 * _1666;
        float _1674 = 1.0 / _1644;
        float _1676 = 1.0 / _1672;
        float _1678 = _1670 * _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1682 = fma(_1636, _1678, _1680);
        float _1684 = _1682 * _1674;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1628 = _1644;
        _1630 = _1660;
        _1574 = _1686;
    }
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1574;
    float _1694 = _1688;
    float _1696 = _1690;
    if (!_1478)
    {
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1708 = _1706 * 0.15915493667125701904296875;
        float _1710 = _1700 * 6.283185482025146484375;
        float _1712 = sin(_1710);
        float _1714 = 1.0 / _1704;
        float _1716 = _1708 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        float _1720 = _1712 * _1714;
        float _1722 = _1708 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1718 * _1720;
        float _1728 = 1.0 / _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1730;
        float _1734 = 1.0 / _1732;
        float _1736 = _1724 * _1728;
        float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1740 = fma(_1636, _1736, _1738);
        float _1742 = _1740 * _1734;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        float _1746 = -_1744;
        float _1748 = _1746 + 1.0;
        _1694 = _1728;
        _1696 = _1724;
        _1638 = _1748;
    }
    float _1750 = _1694;
    float _1752 = _1696;
    float _1754 = _1638;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1618 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1620 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1622 + _1764;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = _1758 * _1758;
    float _1772 = fma(_1762, _1762, _1770);
    float _1774 = precise::max(0.0, _1768);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = rsqrt(_1776);
    float _1780 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1782 = _1762 * _1780;
    float _1784 = _1766 * _1780;
    float _1786 = -_1780;
    float _1788 = -_1774;
    float _1790 = fma(_1758, _1786, _1788);
    float _1792 = _1782 * _1782;
    float _1794 = _1784 * _1784;
    float _1796 = _1792 + _1794;
    float _1798 = sqrt(_1796);
    bool _1800 = _1798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1798 + _1802;
    float _1806 = _1778;
    float _1808 = _1774;
    float _1810 = _1766;
    float _1812 = _1752;
    float _1814 = _1804;
    float _1816 = _1750;
    float _1818 = _1780;
    float _1820 = _1790;
    if (_1800)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1800)
    {
        float _1826 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1826;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1800)
    {
        _1810 = _1782;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    if (_1800)
    {
        float _1836 = rsqrt(_1796);
        _1812 = _1836;
    }
    float _1838 = _1812;
    float _1840 = _1838;
    if (_1800)
    {
        float _1842 = _1804 * _1824;
        _1814 = _1842;
    }
    float _1844 = _1814;
    if (_1800)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1816 = _1846;
    }
    float _1848 = _1816;
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1844;
    if (_1800)
    {
        float _1854 = _1848 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1824;
    if (_1800)
    {
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = _1858;
    if (_1800)
    {
        float _1870 = fma(_1858, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1830 = _1870;
    }
    float _1872 = _1830;
    float _1874 = sqrt(_1776);
    float _1876 = _1872;
    if (_1800)
    {
        float _1878 = _1838 * _1872;
        _1818 = _1878;
    }
    float _1880 = _1818;
    if (!_1800)
    {
        _1876 = _1792;
    }
    float _1882 = _1876;
    float _1884 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1882;
    float _1888 = _1866;
    if (_1800)
    {
        float _1890 = _1866 + (-1.0);
        _1868 = _1890;
    }
    float _1892 = _1868;
    float _1894 = _1892;
    if (_1800)
    {
        float _1896 = _1782 * _1880;
        _1834 = _1896;
    }
    float _1898 = _1834;
    float _1900 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    if (_1800)
    {
        float _1902 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1902;
    }
    float _1904 = _1840;
    if (!_1800)
    {
        _1894 = _1784;
    }
    float _1906 = _1894;
    float _1908 = _1906;
    if (_1800)
    {
        float _1910 = _1784 * _1880;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1800)
    {
        float _1914 = _1898 * _1898;
        _1886 = _1914;
    }
    float _1916 = _1886;
    if (_1800)
    {
        float _1918 = fma(_1790, _1866, _1904);
        _1820 = _1918;
    }
    float _1920 = _1820;
    if (!_1800)
    {
        _1888 = _1794;
    }
    float _1922 = _1888;
    float _1924 = _1922;
    if (_1800)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1932 = fma(_1920, _1920, _1916);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1944 = _1932 + _1928;
    float _1946 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1948 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1950 = -_1938;
    float _1952 = _1950 + 1.0;
    float _1954 = rsqrt(_1944);
    float _1956 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1946);
    float _1958 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1948);
    float _1960 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1956);
    float _1962 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = abs(_1952);
    float _1968 = log2(_1966);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1974 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1976 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1978 = _1954 * _1898;
    float _1980 = _1954 * _1912;
    float _1982 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = -_1974;
    float _1990 = fma(_1988, _1850, 1.0);
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1996 = _1954 * _1920;
    float _1998 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1994);
    float _2004 = -_1986;
    float _2006 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = log2(_1990);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2012 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
    float _2014 = -_1980;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_2016, -0.5, 0.5);
    float _2022 = 1.0 / _2012;
    float _2024 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2026 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2024);
    float _2028 = exp2(_1998);
    float _2030 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2032 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2010);
    float _2034 = _2008 * 0.693147182464599609375;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2038 = sqrt(_2020);
    float _2040 = fma(_2016, 0.5, 0.5);
    float _2042 = _1996 + 1.0;
    float _2044 = _2030 * _2022;
    float _2046 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = -_1996;
    float _2052 = fma(_2028, _2042, _2050);
    float _2054 = fma(_2040, _2046, -0.212114393711090087890625);
    float _2056 = fma(_2040, _2054, 1.570728778839111328125);
    float _2058 = _2032 * _2022;
    float _2060 = fma(_2052, 0.5, 0.5);
    float _2062 = _2038 * 0.636619746685028076171875;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = -_2056;
    float _2068 = fma(_2062, _2066, 1.0);
    float3 _5488 = float3(_2048, _2064, _2036);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5488, float3(0.0), isnan(_5488)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5488, float3(0.0), isnan(_5488)), level(0.0)).x;
    float3 _5499 = float3(_2048, _2064, _2036);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float2 _5516 = float2(_2068, _2060);
    float3 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5516, float2(0.0), isnan(_5516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5516, float2(0.0), isnan(_5516)), level(0.0)).xyz;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = in.m_65.x;
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2097 = _462 > 0.5;
    float _2099 = in.m_65.y;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2103 = _2101 != 0;
    float _2105 = _1024 * (-0.15915493667125701904296875);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2109 = _2107 != 0;
    float _2111 = in.m_49.w;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2115 = _2113 != 0;
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2121 = _2119 != 0;
    float _2123 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.w = _328;
    out.m_69.x = _1620;
    out.m_69.y = _1618;
    out.m_69.z = _1622;
    int _2125 = as_type<int>(_2048);
    bool _2127 = _2121;
    if (_2103)
    {
        bool _2129 = _158 > 0.5;
        _838 = _2129;
    }
    bool _2131 = _838;
    float _2133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2103)
    {
        float _2135 = -_2093;
        float _2137 = _2135 + 1.0;
        _2125 = as_type<int>(_2137);
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (!_2103)
    {
        _254 = _2093;
    }
    float _2143 = _254;
    float _2145 = _2143;
    if (_2115)
    {
        float _2147 = -_2093;
        float _2149 = _2147 + 1.0;
        _256 = as_type<int>(_2149);
    }
    int _2151 = _256;
    float _2153 = 0.0;
    if (!_2109)
    {
        _2153 = _2093;
    }
    float _2155 = _2153;
    float _2157 = -_2099;
    float _2159 = _2157 + 1.0;
    float _2161 = _2155;
    float _2163 = _2099;
    if (_2103)
    {
        float _2165 = _2131 ? as_type<float>(_2139) : _2093;
        _2145 = _2165;
    }
    float _2167 = _2145;
    if (_2109)
    {
        float _2169 = -_2093;
        float _2171 = _2169 + 1.0;
        _2141 = as_type<int>(_2171);
    }
    int _2173 = _2141;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2177 = _2175 != 0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2181 = _2111 > 0.5;
    float _2183 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2185 = _2097 ? as_type<int>(_2159) : as_type<int>(_2099);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2189 = _2187 != 0;
    float _2191 = _2183 * _2133;
    int _2193 = _2181 ? as_type<int>(_2159) : as_type<int>(_2099);
    float _2195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2197 = _2121 ? as_type<float>(_2185) : _2099;
    if (_2109)
    {
        bool _2199 = _670 > 0.5;
        _2127 = _2199;
    }
    bool _2201 = _2127;
    bool _2203 = _670 > 0.5;
    float _2205 = _2177 ? as_type<float>(_2193) : _2099;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2209 = in.m_71.x;
    float _2211 = in.m_71.y;
    if (_2109)
    {
        float _2213 = _2201 ? as_type<float>(_2173) : _2093;
        _2161 = _2213;
    }
    float _2215 = _2161;
    float _2217 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2115)
    {
        _1068 = _2093;
    }
    float _2219 = _1068;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2223 = _2219;
    if (_2115)
    {
        float _2225 = _2097 ? as_type<float>(_2151) : _2093;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = _2217 * _2095;
    if (_2189)
    {
        float _2231 = _2203 ? _2159 : _2099;
        _2163 = _2231;
    }
    float _2233 = _2163;
    float _2235 = in.m_71.z;
    float _2237 = rsqrt(_1572);
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2241 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2243 = in.m_73.x;
    float _2245 = in.m_73.y;
    float _2247 = in.m_73.z;
    float _2249 = in.m_73.w;
    float _2251 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2239 * _2195;
    float _2255 = _2221 * _2207;
    bool _2257 = _1692 > 0.0;
    bool _2259 = isnan(_1692);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = _2105 * 6.283185482025146484375;
    float _2269 = sin(_2267);
    float _2271 = fma(_2251, _2233, -0.5);
    float _2273 = fma(_2241, _2227, -0.5);
    out.m_75.x = _2191;
    out.m_75.y = _2229;
    out.m_75.z = _2253;
    out.m_75.w = _2255;
    bool _2275 = _1754 <= 0.0;
    bool _2277 = !_2265;
    bool _2279 = _2275 || _2277;
    float _2281 = _1222 * _2211;
    float _2283 = _2105 * 6.283185482025146484375;
    float _2285 = cos(_2283);
    float _2287 = _970 * _2237;
    float _2289 = _1260 * _2237;
    float _2291 = -_2281;
    float _2293 = fma(_1248, _2209, _2291);
    float _2295 = _1486 * _2237;
    float _2297 = _1248 * _2211;
    float _2299 = _2269 * _2271;
    float _2301 = _1334 * _1386;
    out.m_77.x = _2287;
    out.m_77.y = _2289;
    out.m_77.z = _2295;
    float _2303 = _2293 * _2247;
    float _2305 = fma(_1222, _2209, _2297);
    float _2307 = _2235 * _2245;
    float _2309 = exp2(_2123);
    float _2311 = -_2303;
    float _2313 = fma(_2235, _2243, _2311);
    float _2315 = -_2299;
    float _2317 = fma(_2285, _2273, _2315);
    float _2319 = _2305 * _2243;
    float _2321 = _2285 * _2271;
    float _2323 = _2313 * _2249;
    float _2325 = _1358 * _1398;
    float _2327 = fma(_1040, _2317, _1066);
    float _2329 = _1334 * _1398;
    float _2331 = _1334 * _1378;
    float _2333 = -_1326;
    float _2335 = fma(_2333, _1338, _2301);
    float _2337 = _1356 * _1398;
    float _2339 = _1358 * _1386;
    float _2341 = _1358 * _1378;
    float _2343 = -_1326;
    float _2345 = fma(_2343, _1340, _2329);
    float _2347 = -_1326;
    float _2349 = fma(_2347, _1342, _2331);
    float _2351 = -_2307;
    float _2353 = fma(_2305, _2247, _2351);
    float _2355 = fma(_1308, _1340, _2325);
    float _2357 = fma(_1300, _1340, _2337);
    float _2359 = -_2319;
    float _2361 = fma(_2293, _2245, _2359);
    float _2363 = fma(_1308, _1338, _2339);
    float _2365 = _1356 * _1386;
    float _2367 = fma(_1308, _1342, _2341);
    float _2369 = fma(_1336, _1158, _2335);
    float _2371 = fma(_1336, _1152, _2345);
    float _2373 = fma(_1336, _1154, _2349);
    float _2375 = fma(_2269, _2273, _2321);
    float _2377 = _2353 * _2249;
    float _2379 = fma(_1352, _1152, _2355);
    float _2381 = fma(_1368, _1152, _2357);
    float _2383 = _2361 * _2249;
    float _2385 = fma(_1352, _1158, _2363);
    float _2387 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_1300, _1338, _2365);
    float _2391 = _2369 * _2245;
    float _2393 = _2371 * _2245;
    float _2395 = -_1062;
    float _2397 = fma(_1048, _2375, _2395);
    float _2399 = _1356 * _1378;
    float _2401 = _2323 * _2369;
    float _2403 = _2323 * _2371;
    float _2405 = fma(_1352, _1154, _2367);
    float _2407 = _2373 * _2245;
    float _2409 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2411 = fma(_1368, _1158, _2389);
    float _2413 = _2323 * _2373;
    float _2415 = fma(_2385, _2243, _2391);
    float _2417 = fma(_2379, _2243, _2393);
    float _2419 = fma(_1300, _1342, _2399);
    float _2421 = fma(_2377, _2385, _2401);
    float _2423 = fma(_2377, _2379, _2403);
    float _2425 = fma(_2405, _2243, _2407);
    float _2427 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2409);
    float _2429 = fma(_2411, _2247, _2415);
    float _2431 = -_2309;
    float _2433 = _2431 + 1.0;
    float _2435 = _2327 + 0.5;
    float _2437 = fma(_2381, _2247, _2417);
    float _2439 = fma(_1368, _1154, _2419);
    float _2441 = _1692 * _1754;
    float _2443 = fma(_2383, _2381, _2423);
    float _2445 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2427);
    float _2447 = fma(_2377, _2405, _2413);
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2383, _2411, _2421);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2455 = fma(_2439, _2247, _2425);
    float _2457 = _2445 + _2012;
    float _2459 = fma(_2383, _2439, _2447);
    float _2461 = _250 * _2453;
    float _2463 = _2397 + 0.5;
    out.m_79.x = _2429;
    out.m_79.y = _2437;
    out.m_79.z = _2455;
    float _2465 = _2457 * 0.5;
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2435;
    out.m_81.y = _2463;
    out.m_83.x = _2451;
    out.m_83.y = _2443;
    out.m_83.z = _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    out.m_45.x = _2467;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2012;
    out.m_85.z = _2465;
    out.m_85.w = _2012;
    float _2473 = _2449 * _2070;
    float _2475 = _2081 * _2471;
    float _2477 = _2081 * _2473;
    float _2479 = _2091 * _2473;
    float _2481 = fma(_2087, _2477, _2075);
    float _2483 = fma(_2089, _2477, _2077);
    float _2485 = fma(_2081, _2479, _2079);
    out.m_87.x = _2481;
    out.m_87.y = _2483;
    out.m_87.z = _2485;
    out.m_87.w = _2475;
    if (!_2279)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2543 = as_type<float>(_120);
        out.gl_Position.z = _2543;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_47.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_156);
        out.gl_Position.z = _2608;
    }
    if (_146)
    {
        return out;
    }
    float _158 = in.m_49.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = 1.0 / _126;
    float _178 = _162 * _160;
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _130 * _176;
    float _184 = _180 * 6.283185482025146484375;
    float _186 = floor(_180);
    float _188 = _184 * 0.15915493667125701904296875;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = _188 * 6.283185482025146484375;
    float _198 = cos(_196);
    bool _200 = !_174;
    int _202 = _200 ? 0 : 1;
    bool _204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _206 = abs(_202);
    float _208 = -_186;
    float _210 = _180 + _208;
    bool _212 = !_170;
    int _214 = _212 ? 0 : 1;
    float _216 = float(_194);
    int _218 = abs(_214);
    float _220 = -_210;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _224 = _210 < 0.5;
    float _226 = float(_224);
    float _228 = fma(_198, 0.5, 0.5);
    float _230 = abs(_222);
    float _232 = _216 * _230;
    float _234 = float(_206);
    float _236 = -_226;
    float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _240 = -_228;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = float(_218);
    float _246 = fma(_234, _242, _232);
    float _248 = abs(_238);
    float _250 = fma(_244, _248, _246);
    bool _252 = !_204;
    float _254 = 0.5;
    int _256 = as_type<int>(_158);
    float _272;
    if (!_252)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _182;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = in.m_51.x;
    float _296 = in.m_51.y;
    float _298 = in.m_51.z;
    bool _300 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_276);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -_310;
    float _318 = _316 + 1.0;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _322 = 1.0 / _314;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _330 = _280 * _322;
    float _332 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = _292 * _318;
    float _344 = -_292;
    float _346 = _344 + 1.0;
    float _348 = fma(_336, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_340, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _332 * _342;
    float _354 = _348 * _342;
    float _356 = _350 * _342;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    float _370 = _364 * _294;
    float _372 = _366 * _296;
    float _374 = _368 * _298;
    bool _376 = !_320;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _158 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _182;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    float _404 = _158 * 2.0;
    float _406 = in.m_53.x;
    float _408 = in.m_53.y;
    float _410 = in.m_53.z;
    float _412 = in.m_53.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_55.x;
    float _432 = in.m_55.y;
    float _434 = in.m_55.z;
    float _436 = in.m_55.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _442 = 1.0 / _416;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    float _450 = in.m_57.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _456 = _182 * _182;
    float _458 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = 1.0 / _454;
    float _462 = in.m_49.y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _470 = _468 != 0;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _474 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = 1.0 / _440;
    float _478 = _400 * _408;
    float _480 = _400 * _432;
    float _482 = fma(_398, _406, _478);
    float _484 = 1.0 / _466;
    float _486 = _400 * _446;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _492 = fma(_398, _430, _480);
    float _494 = fma(_402, _410, _482);
    float _496 = fma(_398, _444, _486);
    float _498 = fma(_402, _434, _492);
    float _500 = 1.0 / _490;
    float _502 = fma(_402, _448, _496);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _512 = floor(_404);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _518 = _506 * _442;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _528 = _462 * 2.0;
    float _530 = _158 + _462;
    float _532 = _522 * _484;
    float _534 = 1.0 / _510;
    float _536 = _526 * _460;
    float _538 = _530 + (-1.0);
    float _540 = _494 + _412;
    bool _542 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _544 = isnan(_396);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _498 + _436;
    float _556 = _502 + _450;
    float _558 = 1.0 / _516;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _564;
    bool _568 = _512 > 0.0;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    bool _574 = _512 >= 0.0;
    bool _576 = isnan(_512);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = _566 * _500;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _590 = floor(_528);
    int _592 = _582 ? 0 : 1;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _594;
    float _598 = _588 * _534;
    float _600 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _600;
    float _604 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _604;
    float _608 = _596 * _558;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _612 = _602 * _602;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _616 = _396 + _614;
    float _618 = _562 * _476;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _622 = _396 + _620;
    float _624 = fma(_606, _606, _612);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _628 = _396 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _632 = _396 + _630;
    float _634 = fma(_518, _616, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _636 = _590 > 0.0;
    float _638 = fma(_536, _628, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _640 = fma(_532, _632, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _642 = _590 >= 0.0;
    bool _644 = isnan(_590);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _396 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = _396 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _396 + _666;
    float _670 = in.m_49.z;
    float _672 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _674 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _676 = isnan(_396);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_584, _664, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _688 = fma(_598, _622, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _690 = fma(_608, _668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _692 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _694 = isnan(_396);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    bool _708 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _710 = isnan(_396);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    bool _724 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_396);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _702 * _706;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _744 = isnan(_396);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _552 * _740;
    bool _756 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _758 = isnan(_396);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _752 * _572;
    float _770 = -_752;
    float _772 = _770 + 1.0;
    float _774 = _656 * 12.98980045318603515625;
    float _776 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _776;
    bool _780 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _782 = isnan(_396);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _718 * _772;
    float _794 = fma(_462, 78.233001708984375, _774);
    float _796 = fma(_778, _778, _624);
    float _798 = -_718;
    float _800 = _798 + 1.0;
    float _802 = fma(_158, 78.233001708984375, _774);
    float _804 = _794 * 0.15915493667125701904296875;
    int _806 = ~_592;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _766 * _800;
    float _814 = _802 * 0.15915493667125701904296875;
    float _816 = -_766;
    float _818 = _816 + 1.0;
    float _820 = _804 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _670 * 2.0;
    float _826 = _790 * _818;
    float _828 = -_790;
    float _830 = _828 + 1.0;
    float _832 = _818;
    float _834 = _830;
    int _836 = _810;
    bool _838 = _420;
    if (_470)
    {
        _832 = _462;
    }
    float _840 = _832;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _844 = _840;
    if (!_470)
    {
        _844 = _158;
    }
    float _846 = _844;
    float _848 = _734 * _830;
    float _850 = _814 * 6.283185482025146484375;
    float _852 = sin(_850);
    if (_470)
    {
        _834 = _670;
    }
    float _854 = _834;
    float _856 = -_734;
    float _858 = _856 + 1.0;
    float _860 = _854;
    if (!_470)
    {
        _860 = _462;
    }
    float _862 = _860;
    float _864 = _634 * _848;
    float _866 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _868 = _866;
    if (!_568)
    {
        int _870 = ~_592;
        int _872 = _870 + 1;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = _722 * _130;
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[89].z, _472);
    float _880 = _822 * 43758.546875;
    int _882 = _650 ? 0 : 1;
    float _884 = fma(_866, -2.0, _842);
    float _886 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _864);
    int _888 = ~_882;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    float _894 = floor(_880);
    float _896 = _852 * 43758.546875;
    int _898 = _892;
    if (!_636)
    {
        int _900 = ~_882;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_470)
    {
        _868 = _158;
    }
    float _908 = _868;
    float _910 = fma(_638, _826, _886);
    float _912 = _908;
    if (!_470)
    {
        _912 = _670;
    }
    float _914 = _912;
    float _916 = _462 + _670;
    float _918 = floor(_896);
    bool _920 = !_424;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_640, _812, _910);
    float _926 = _914 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _928 = _916 + (-1.0);
    int _930 = abs(_922);
    float _932 = -_906;
    float _934 = fma(_926, 2.0, _932);
    float _936 = floor(_824);
    float _938 = _158 + _670;
    float _940 = -_894;
    float _942 = _880 + _940;
    float _944 = float(_930);
    float _946 = _938 + (-1.0);
    float _948 = float(_874);
    float _950 = -_918;
    float _952 = _896 + _950;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _956 = !_428;
    int _958 = _956 ? 0 : 1;
    float _960 = exp2(_876);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _964 = _944 * _948;
    int _966 = abs(_958);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = _540 + _968;
    bool _972 = _936 > 0.0;
    float _974 = in.m_61.x;
    float _976 = in.m_61.y;
    float _978 = in.m_61.z;
    bool _980 = _936 >= 0.0;
    bool _982 = isnan(_936);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = float(_966);
    float _1006 = float(_904);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = 1.0 / _1002;
    float _1012 = -_960;
    float _1014 = _1012 + 1.0;
    float _1016 = _1004 * _1006;
    float _1018 = fma(_672, _792, _924);
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1022 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[89].x, _878);
    float _1026 = _964 * (-2.0);
    float _1028 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1020);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1042 = fma(_954, _1026, _954);
    float _1044 = -_554;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1028);
    float _1050 = _1038 ? _1014 : 0.0;
    float _1052 = fma(_1026, _976, _976);
    float _1054 = fma(_686, _768, _1018);
    float _1056 = -_540;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1046 * _1046;
    float _1062 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _884);
    float _1064 = -_130;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[86].x, _934);
    float _1068 = _1024;
    if (_998)
    {
        float _1070 = _1050 * _1010;
        _150 = _1070;
    }
    float _1072 = _150;
    float _1074 = -_556;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = fma(_1058, _1058, _1060);
    float _1080 = _1016 * (-2.0);
    float _1082 = fma(_688, _754, _1054);
    float _1084 = _670 + (-0.5);
    float _1086 = fma(_1076, _1076, _1078);
    float _1088 = fma(_1080, _978, _978);
    float _1090 = _462 + (-0.5);
    int _1092 = _988 ? 0 : 1;
    float _1094 = sqrt(_796);
    bool _1096 = !_420;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1088);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1052);
    float _1110 = fma(_962, _1080, _962);
    float _1112 = fma(_690, _736, _1082);
    int _1114 = _1106;
    if (!_972)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = rsqrt(_1086);
    int _1124 = abs(_1098);
    float _1126 = fma(_1042, _1072, _1108);
    float _1128 = fma(_1110, _1072, _1100);
    float _1130 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    float _1132 = in.m_63.x;
    float _1134 = in.m_63.y;
    float _1136 = in.m_63.z;
    float _1138 = float(_1124);
    float _1140 = _1128 * 0.15915493667125701904296875;
    float _1142 = float(_1120);
    float _1144 = fma(_942, 4.0, -2.0);
    float _1146 = _1126 * 0.15915493667125701904296875;
    float _1148 = _1138 * _1142;
    float _1150 = _1130 * _1144;
    float _1152 = _1046 * _1122;
    float _1154 = _1076 * _1122;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1058 * _1122;
    float _1160 = _1150 * 0.15915493667125701904296875;
    float _1162 = _1146 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = fma(_1156, _974, _974);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1154 * _1168;
    float _1172 = _158 + (-0.5);
    float _1174 = fma(_610, _1156, _610);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1178 = _1158 * _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1182 = -_1170;
    float _1184 = fma(_1152, _1180, _1182);
    float _1186 = _952 * 0.5;
    float _1188 = _1146 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1166);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1196 = -_1178;
    float _1198 = fma(_1154, _1194, _1196);
    float _1200 = -_1186;
    float _1202 = fma(_456, 1.5, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1136;
    float _1208 = _656 + _1206;
    float _1210 = fma(_1174, _1072, _1192);
    float _1212 = _1130 * _952;
    float _1214 = _1212 * 4.0;
    float _1216 = -_654;
    float _1218 = _1216 + _1134;
    float _1220 = _1160 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_1204, _1208, _1136);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1228 = _1152 * _1226;
    float _1230 = _1198 * _1198;
    float _1232 = -_652;
    float _1234 = _1232 + _1132;
    float _1236 = fma(_1214, _656, _1224);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1228;
    float _1242 = fma(_1158, _1238, _1240);
    float _1244 = fma(_1184, _1184, _1230);
    float _1246 = _1160 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 0.15915493667125701904296875;
    float _1252 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1260 = _554 + _1258;
    float _1262 = _1222 * _1218;
    float _1264 = _1140 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1094, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1270 = precise::max(_1268, 1.0);
    float _1272 = _1248 * _1218;
    float _1274 = -_1262;
    float _1276 = fma(_1248, _1234, _1274);
    float _1278 = _1250 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1254 * _1252;
    float _1284 = fma(_1222, _1234, _1272);
    float _1286 = _1276 + _652;
    float _1288 = precise::min(_1270, 1.89999997615814208984375);
    float _1290 = _1284 + _654;
    float _1292 = -_1276;
    float _1294 = fma(_1292, _1204, _1286);
    float _1296 = _1250 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1164 * _1266;
    float _1302 = -_1284;
    float _1304 = fma(_1302, _1204, _1290);
    float _1306 = fma(_1214, _652, _1294);
    float _1308 = _1190 * _1266;
    float _1310 = fma(_1214, _654, _1304);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1314 = rsqrt(_1256);
    float _1316 = _1280 * _1164;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1320 = _1312 * _474;
    float _1322 = _1318 * _458;
    float _1324 = _1140 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1298 * _1190;
    float _1330 = _1298 * _1164;
    float _1332 = _1280 * _1190;
    float _1334 = _1298 * _1266;
    float _1336 = _1280 * _1266;
    float _1338 = _1184 * _1314;
    float _1340 = _1198 * _1314;
    float _1342 = _1242 * _1314;
    float _1344 = _1336 * _1322;
    float _1346 = _1152 * _1338;
    float _1348 = _1158 * _1342;
    float _1350 = -_1330;
    float _1352 = fma(_1326, _1332, _1350);
    float _1354 = -_1332;
    float _1356 = fma(_1326, _1330, _1354);
    float _1358 = fma(_1326, _1328, _1316);
    float _1360 = _1334 * _1322;
    float _1362 = -_1322;
    float _1364 = _1326 * _1362;
    float _1366 = fma(_1352, _1320, _1344);
    float _1368 = fma(_1326, _1316, _1328);
    float _1370 = fma(_1358, _1320, _1360);
    float _1372 = _1154 * _1340;
    float _1374 = fma(_1308, _1320, _1364);
    float _1376 = -_1346;
    float _1378 = fma(_1158, _1340, _1376);
    float _1380 = fma(_1356, _1282, _1370);
    float _1382 = fma(_1368, _1282, _1366);
    float _1384 = -_1372;
    float _1386 = fma(_1152, _1342, _1384);
    float _1388 = fma(_1300, _1282, _1374);
    float _1390 = _1378 * _1380;
    float _1392 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1394 = _1386 * _1380;
    float _1396 = -_1348;
    float _1398 = fma(_1154, _1338, _1396);
    float _1400 = fma(_1342, _1388, _1390);
    float _1402 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1392);
    float _1404 = fma(_1338, _1388, _1394);
    float _1406 = _1398 * _1380;
    float _1408 = fma(_1154, _1382, _1400);
    float _1410 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1402);
    float _1412 = fma(_1158, _1382, _1404);
    float _1414 = fma(_1340, _1388, _1406);
    float _1416 = fma(_1408, _1288, _556);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1420 = fma(_1412, _1288, _540);
    float _1422 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1426 = _1416 + _1424;
    float _1428 = 1.0 / _1418;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1420 + _1430;
    float _1434 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1152, _1382, _1414);
    float _1440 = _1260 * _1260;
    float _1442 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1444 = fma(_1432, _1432, _1436);
    float _1446 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1448 = sqrt(_1444);
    bool _1450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    float _1460 = _1446 + _1418;
    float _1462 = _1460 * _1428;
    float _1464 = _1462 * 0.5;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    bool _1470 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(0.5);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_1438, _1288, _554);
    float _1482 = fma(_970, _970, _1440);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _556 + _1484;
    bool _1488 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = 1.0 / _1468;
    float _1492 = _1440;
    float _1494 = _1288;
    float _1496 = _1388;
    float _1498 = _1438;
    float _1500 = _1184;
    float _1502 = _1432;
    float _1504 = _1426;
    float _1506 = _1482;
    if (!_1488)
    {
        _1492 = _1420;
    }
    float _1508 = _1492;
    float _1510 = _1508;
    if (!_1488)
    {
        _1494 = _1416;
    }
    float _1512 = _1494;
    float _1514 = _1512;
    if (!_1488)
    {
        _1496 = _1480;
    }
    float _1516 = _1496;
    bool _1518 = !_1488;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1448 + _1524;
        float _1528 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = _1526 * _1522;
        float _1532 = rsqrt(_1444);
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 + (-1.0);
        float _1546 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = _1532 * _1546;
        float _1552 = fma(_1480, _1538, _1548);
        float _1554 = fma(_1432, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1426, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1510 = _1554;
        _1520 = _1552;
        _1498 = _1544;
        _1514 = _1556;
    }
    float _1558 = _1510;
    float _1560 = _1520;
    float _1562 = _1498;
    float _1564 = _1514;
    float _1566 = _1564;
    float _1568 = _1562;
    if (_1478)
    {
        _1500 = 1.0;
    }
    float _1570 = _1500;
    float _1572 = fma(_1486, _1486, _1482);
    float _1574 = _1570;
    if (_1458)
    {
        _1502 = _1558;
    }
    float _1576 = _1502;
    float _1578 = _1576;
    if (_1458)
    {
        _1504 = _1560;
    }
    float _1580 = _1504;
    float _1582 = _1580;
    if (!_1458)
    {
        float _1584 = sqrt(_1572);
        float _1586 = -_540;
        float _1588 = _1586 + _1558;
        float _1590 = -_554;
        float _1592 = _1590 + _1560;
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1598 = precise::min(_1584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1600 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1602 = -_556;
        float _1604 = _1602 + _1564;
        float _1606 = _1598 * _1596;
        float _1608 = _1600 * _1606;
        float _1610 = fma(_1588, _1608, _540);
        float _1612 = fma(_1592, _1608, _554);
        float _1614 = fma(_1604, _1608, _556);
        _1506 = _1604;
        _1582 = _1612;
        _1578 = _1610;
        _1566 = _1614;
        _1568 = _1608;
    }
    float _1616 = _1506;
    float _1618 = _1582;
    float _1620 = _1578;
    float _1622 = _1566;
    float _1624 = _1568;
    float _1626 = 0.0;
    float _1628 = _1624;
    float _1630 = _1616;
    if (_1478)
    {
        _1626 = 1.0;
    }
    float _1632 = _1626;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1490 * _1634;
    float _1638 = _1632;
    if (!_1478)
    {
        float _1640 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1644 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1642;
        float _1646 = _1640 * 0.15915493667125701904296875;
        float _1648 = _1646 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1654 = _1652 * 0.15915493667125701904296875;
        float _1656 = _1646 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = 1.0 / _1650;
        float _1662 = _1654 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * _1660;
        float _1668 = _1654 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1664 * _1666;
        float _1674 = 1.0 / _1644;
        float _1676 = 1.0 / _1672;
        float _1678 = _1670 * _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1682 = fma(_1636, _1678, _1680);
        float _1684 = _1682 * _1674;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1628 = _1644;
        _1630 = _1660;
        _1574 = _1686;
    }
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1574;
    float _1694 = _1688;
    float _1696 = _1690;
    if (!_1478)
    {
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1708 = _1706 * 0.15915493667125701904296875;
        float _1710 = _1700 * 6.283185482025146484375;
        float _1712 = sin(_1710);
        float _1714 = 1.0 / _1704;
        float _1716 = _1708 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        float _1720 = _1712 * _1714;
        float _1722 = _1708 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1718 * _1720;
        float _1728 = 1.0 / _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1730;
        float _1734 = 1.0 / _1732;
        float _1736 = _1724 * _1728;
        float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1740 = fma(_1636, _1736, _1738);
        float _1742 = _1740 * _1734;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        float _1746 = -_1744;
        float _1748 = _1746 + 1.0;
        _1694 = _1728;
        _1696 = _1724;
        _1638 = _1748;
    }
    float _1750 = _1694;
    float _1752 = _1696;
    float _1754 = _1638;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1618 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1620 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1622 + _1764;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = _1758 * _1758;
    float _1772 = fma(_1762, _1762, _1770);
    float _1774 = precise::max(0.0, _1768);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = rsqrt(_1776);
    float _1780 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1782 = _1762 * _1780;
    float _1784 = _1766 * _1780;
    float _1786 = -_1780;
    float _1788 = -_1774;
    float _1790 = fma(_1758, _1786, _1788);
    float _1792 = _1782 * _1782;
    float _1794 = _1784 * _1784;
    float _1796 = _1792 + _1794;
    float _1798 = sqrt(_1796);
    bool _1800 = _1798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1798 + _1802;
    float _1806 = _1778;
    float _1808 = _1774;
    float _1810 = _1766;
    float _1812 = _1752;
    float _1814 = _1804;
    float _1816 = _1750;
    float _1818 = _1780;
    float _1820 = _1790;
    if (_1800)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1800)
    {
        float _1826 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1826;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1800)
    {
        _1810 = _1782;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    if (_1800)
    {
        float _1836 = rsqrt(_1796);
        _1812 = _1836;
    }
    float _1838 = _1812;
    float _1840 = _1838;
    if (_1800)
    {
        float _1842 = _1804 * _1824;
        _1814 = _1842;
    }
    float _1844 = _1814;
    if (_1800)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1816 = _1846;
    }
    float _1848 = _1816;
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1844;
    if (_1800)
    {
        float _1854 = _1848 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1824;
    if (_1800)
    {
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = _1858;
    if (_1800)
    {
        float _1870 = fma(_1858, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1830 = _1870;
    }
    float _1872 = _1830;
    float _1874 = sqrt(_1776);
    float _1876 = _1872;
    if (_1800)
    {
        float _1878 = _1838 * _1872;
        _1818 = _1878;
    }
    float _1880 = _1818;
    if (!_1800)
    {
        _1876 = _1792;
    }
    float _1882 = _1876;
    float _1884 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1882;
    float _1888 = _1866;
    if (_1800)
    {
        float _1890 = _1866 + (-1.0);
        _1868 = _1890;
    }
    float _1892 = _1868;
    float _1894 = _1892;
    if (_1800)
    {
        float _1896 = _1782 * _1880;
        _1834 = _1896;
    }
    float _1898 = _1834;
    float _1900 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    if (_1800)
    {
        float _1902 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1902;
    }
    float _1904 = _1840;
    if (!_1800)
    {
        _1894 = _1784;
    }
    float _1906 = _1894;
    float _1908 = _1906;
    if (_1800)
    {
        float _1910 = _1784 * _1880;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1800)
    {
        float _1914 = _1898 * _1898;
        _1886 = _1914;
    }
    float _1916 = _1886;
    if (_1800)
    {
        float _1918 = fma(_1790, _1866, _1904);
        _1820 = _1918;
    }
    float _1920 = _1820;
    if (!_1800)
    {
        _1888 = _1794;
    }
    float _1922 = _1888;
    float _1924 = _1922;
    if (_1800)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1932 = fma(_1920, _1920, _1916);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1944 = _1932 + _1928;
    float _1946 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1948 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1950 = -_1938;
    float _1952 = _1950 + 1.0;
    float _1954 = rsqrt(_1944);
    float _1956 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1946);
    float _1958 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1948);
    float _1960 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1956);
    float _1962 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = abs(_1952);
    float _1968 = log2(_1966);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1974 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1976 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1978 = _1954 * _1898;
    float _1980 = _1954 * _1912;
    float _1982 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = -_1974;
    float _1990 = fma(_1988, _1850, 1.0);
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1996 = _1954 * _1920;
    float _1998 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1994);
    float _2004 = -_1986;
    float _2006 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = log2(_1990);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2012 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
    float _2014 = -_1980;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_2016, -0.5, 0.5);
    float _2022 = 1.0 / _2012;
    float _2024 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2026 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2024);
    float _2028 = exp2(_1998);
    float _2030 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2032 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2010);
    float _2034 = _2008 * 0.693147182464599609375;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2038 = sqrt(_2020);
    float _2040 = fma(_2016, 0.5, 0.5);
    float _2042 = _1996 + 1.0;
    float _2044 = _2030 * _2022;
    float _2046 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = -_1996;
    float _2052 = fma(_2028, _2042, _2050);
    float _2054 = fma(_2040, _2046, -0.212114393711090087890625);
    float _2056 = fma(_2040, _2054, 1.570728778839111328125);
    float _2058 = _2032 * _2022;
    float _2060 = fma(_2052, 0.5, 0.5);
    float _2062 = _2038 * 0.636619746685028076171875;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = -_2056;
    float _2068 = fma(_2062, _2066, 1.0);
    float3 _5488 = float3(_2048, _2064, _2036);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5488, float3(0.0), isnan(_5488)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5488, float3(0.0), isnan(_5488)), level(0.0)).x;
    float3 _5499 = float3(_2048, _2064, _2036);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float2 _5516 = float2(_2068, _2060);
    float3 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5516, float2(0.0), isnan(_5516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5516, float2(0.0), isnan(_5516)), level(0.0)).xyz;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = in.m_65.x;
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2097 = _462 > 0.5;
    float _2099 = in.m_65.y;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2103 = _2101 != 0;
    float _2105 = _1024 * (-0.15915493667125701904296875);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2109 = _2107 != 0;
    float _2111 = in.m_49.w;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2115 = _2113 != 0;
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2121 = _2119 != 0;
    float _2123 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.w = _328;
    out.m_69.x = _1620;
    out.m_69.y = _1618;
    out.m_69.z = _1622;
    int _2125 = as_type<int>(_2048);
    bool _2127 = _2121;
    if (_2103)
    {
        bool _2129 = _158 > 0.5;
        _838 = _2129;
    }
    bool _2131 = _838;
    float _2133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2103)
    {
        float _2135 = -_2093;
        float _2137 = _2135 + 1.0;
        _2125 = as_type<int>(_2137);
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (!_2103)
    {
        _254 = _2093;
    }
    float _2143 = _254;
    float _2145 = _2143;
    if (_2115)
    {
        float _2147 = -_2093;
        float _2149 = _2147 + 1.0;
        _256 = as_type<int>(_2149);
    }
    int _2151 = _256;
    float _2153 = 0.0;
    if (!_2109)
    {
        _2153 = _2093;
    }
    float _2155 = _2153;
    float _2157 = -_2099;
    float _2159 = _2157 + 1.0;
    float _2161 = _2155;
    float _2163 = _2099;
    if (_2103)
    {
        float _2165 = _2131 ? as_type<float>(_2139) : _2093;
        _2145 = _2165;
    }
    float _2167 = _2145;
    if (_2109)
    {
        float _2169 = -_2093;
        float _2171 = _2169 + 1.0;
        _2141 = as_type<int>(_2171);
    }
    int _2173 = _2141;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2177 = _2175 != 0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2181 = _2111 > 0.5;
    float _2183 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2185 = _2097 ? as_type<int>(_2159) : as_type<int>(_2099);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2189 = _2187 != 0;
    float _2191 = _2183 * _2133;
    int _2193 = _2181 ? as_type<int>(_2159) : as_type<int>(_2099);
    float _2195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2197 = _2121 ? as_type<float>(_2185) : _2099;
    if (_2109)
    {
        bool _2199 = _670 > 0.5;
        _2127 = _2199;
    }
    bool _2201 = _2127;
    bool _2203 = _670 > 0.5;
    float _2205 = _2177 ? as_type<float>(_2193) : _2099;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2209 = in.m_71.x;
    float _2211 = in.m_71.y;
    if (_2109)
    {
        float _2213 = _2201 ? as_type<float>(_2173) : _2093;
        _2161 = _2213;
    }
    float _2215 = _2161;
    float _2217 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2115)
    {
        _1068 = _2093;
    }
    float _2219 = _1068;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2223 = _2219;
    if (_2115)
    {
        float _2225 = _2097 ? as_type<float>(_2151) : _2093;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = _2217 * _2095;
    if (_2189)
    {
        float _2231 = _2203 ? _2159 : _2099;
        _2163 = _2231;
    }
    float _2233 = _2163;
    float _2235 = in.m_71.z;
    float _2237 = rsqrt(_1572);
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2241 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2243 = in.m_73.x;
    float _2245 = in.m_73.y;
    float _2247 = in.m_73.z;
    float _2249 = in.m_73.w;
    float _2251 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2239 * _2195;
    float _2255 = _2221 * _2207;
    bool _2257 = _1692 > 0.0;
    bool _2259 = isnan(_1692);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = _2105 * 6.283185482025146484375;
    float _2269 = sin(_2267);
    float _2271 = fma(_2251, _2233, -0.5);
    float _2273 = fma(_2241, _2227, -0.5);
    out.m_75.x = _2191;
    out.m_75.y = _2229;
    out.m_75.z = _2253;
    out.m_75.w = _2255;
    bool _2275 = _1754 <= 0.0;
    bool _2277 = !_2265;
    bool _2279 = _2275 || _2277;
    float _2281 = _1222 * _2211;
    float _2283 = _2105 * 6.283185482025146484375;
    float _2285 = cos(_2283);
    float _2287 = _970 * _2237;
    float _2289 = _1260 * _2237;
    float _2291 = -_2281;
    float _2293 = fma(_1248, _2209, _2291);
    float _2295 = _1486 * _2237;
    float _2297 = _1248 * _2211;
    float _2299 = _2269 * _2271;
    float _2301 = _1334 * _1386;
    out.m_77.x = _2287;
    out.m_77.y = _2289;
    out.m_77.z = _2295;
    float _2303 = _2293 * _2247;
    float _2305 = fma(_1222, _2209, _2297);
    float _2307 = _2235 * _2245;
    float _2309 = exp2(_2123);
    float _2311 = -_2303;
    float _2313 = fma(_2235, _2243, _2311);
    float _2315 = -_2299;
    float _2317 = fma(_2285, _2273, _2315);
    float _2319 = _2305 * _2243;
    float _2321 = _2285 * _2271;
    float _2323 = _2313 * _2249;
    float _2325 = _1358 * _1398;
    float _2327 = fma(_1040, _2317, _1066);
    float _2329 = _1334 * _1398;
    float _2331 = _1334 * _1378;
    float _2333 = -_1326;
    float _2335 = fma(_2333, _1338, _2301);
    float _2337 = _1356 * _1398;
    float _2339 = _1358 * _1386;
    float _2341 = _1358 * _1378;
    float _2343 = -_1326;
    float _2345 = fma(_2343, _1340, _2329);
    float _2347 = -_1326;
    float _2349 = fma(_2347, _1342, _2331);
    float _2351 = -_2307;
    float _2353 = fma(_2305, _2247, _2351);
    float _2355 = fma(_1308, _1340, _2325);
    float _2357 = fma(_1300, _1340, _2337);
    float _2359 = -_2319;
    float _2361 = fma(_2293, _2245, _2359);
    float _2363 = fma(_1308, _1338, _2339);
    float _2365 = _1356 * _1386;
    float _2367 = fma(_1308, _1342, _2341);
    float _2369 = fma(_1336, _1158, _2335);
    float _2371 = fma(_1336, _1152, _2345);
    float _2373 = fma(_1336, _1154, _2349);
    float _2375 = fma(_2269, _2273, _2321);
    float _2377 = _2353 * _2249;
    float _2379 = fma(_1352, _1152, _2355);
    float _2381 = fma(_1368, _1152, _2357);
    float _2383 = _2361 * _2249;
    float _2385 = fma(_1352, _1158, _2363);
    float _2387 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_1300, _1338, _2365);
    float _2391 = _2369 * _2245;
    float _2393 = _2371 * _2245;
    float _2395 = -_1062;
    float _2397 = fma(_1048, _2375, _2395);
    float _2399 = _1356 * _1378;
    float _2401 = _2323 * _2369;
    float _2403 = _2323 * _2371;
    float _2405 = fma(_1352, _1154, _2367);
    float _2407 = _2373 * _2245;
    float _2409 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2411 = fma(_1368, _1158, _2389);
    float _2413 = _2323 * _2373;
    float _2415 = fma(_2385, _2243, _2391);
    float _2417 = fma(_2379, _2243, _2393);
    float _2419 = fma(_1300, _1342, _2399);
    float _2421 = fma(_2377, _2385, _2401);
    float _2423 = fma(_2377, _2379, _2403);
    float _2425 = fma(_2405, _2243, _2407);
    float _2427 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2409);
    float _2429 = fma(_2411, _2247, _2415);
    float _2431 = -_2309;
    float _2433 = _2431 + 1.0;
    float _2435 = _2327 + 0.5;
    float _2437 = fma(_2381, _2247, _2417);
    float _2439 = fma(_1368, _1154, _2419);
    float _2441 = _1692 * _1754;
    float _2443 = fma(_2383, _2381, _2423);
    float _2445 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2427);
    float _2447 = fma(_2377, _2405, _2413);
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2383, _2411, _2421);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2455 = fma(_2439, _2247, _2425);
    float _2457 = _2445 + _2012;
    float _2459 = fma(_2383, _2439, _2447);
    float _2461 = _250 * _2453;
    float _2463 = _2397 + 0.5;
    out.m_79.x = _2429;
    out.m_79.y = _2437;
    out.m_79.z = _2455;
    float _2465 = _2457 * 0.5;
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2435;
    out.m_81.y = _2463;
    out.m_83.x = _2451;
    out.m_83.y = _2443;
    out.m_83.z = _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    out.m_45.x = _2467;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2012;
    out.m_85.z = _2465;
    out.m_85.w = _2012;
    float _2473 = _2449 * _2070;
    float _2475 = _2081 * _2471;
    float _2477 = _2081 * _2473;
    float _2479 = _2091 * _2473;
    float _2481 = fma(_2087, _2477, _2075);
    float _2483 = fma(_2089, _2477, _2077);
    float _2485 = fma(_2081, _2479, _2079);
    out.m_87.x = _2481;
    out.m_87.y = _2483;
    out.m_87.z = _2485;
    out.m_87.w = _2475;
    if (!_2279)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _394 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2543 = as_type<float>(_120);
        out.gl_Position.z = _2543;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_47.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    float _150 = _130;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_156);
        out.gl_Position.z = _2608;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = 1.0 / _126;
    float _178 = _162 * _160;
    float _180 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _130 * _176;
    float _184 = _180 * 6.283185482025146484375;
    float _186 = floor(_180);
    float _188 = _184 * 0.15915493667125701904296875;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    int _194 = abs(_192);
    float _196 = _188 * 6.283185482025146484375;
    float _198 = cos(_196);
    bool _200 = !_174;
    int _202 = _200 ? 0 : 1;
    bool _204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _206 = abs(_202);
    float _208 = -_186;
    float _210 = _180 + _208;
    bool _212 = !_170;
    int _214 = _212 ? 0 : 1;
    float _216 = float(_194);
    int _218 = abs(_214);
    float _220 = -_210;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _224 = _210 < 0.5;
    float _226 = float(_224);
    float _228 = fma(_198, 0.5, 0.5);
    float _230 = abs(_222);
    float _232 = _216 * _230;
    float _234 = float(_206);
    float _236 = -_226;
    float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _240 = -_228;
    float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _244 = float(_218);
    float _246 = fma(_234, _242, _232);
    float _248 = abs(_238);
    float _250 = fma(_244, _248, _246);
    bool _252 = !_204;
    float _254 = 0.5;
    int _256 = as_type<int>(_158);
    float _272;
    if (!_252)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _182;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = in.m_51.x;
    float _296 = in.m_51.y;
    float _298 = in.m_51.z;
    bool _300 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_276);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -_310;
    float _318 = _316 + 1.0;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _322 = 1.0 / _314;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _330 = _280 * _322;
    float _332 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = _292 * _318;
    float _344 = -_292;
    float _346 = _344 + 1.0;
    float _348 = fma(_336, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _350 = fma(_340, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _332 * _342;
    float _354 = _348 * _342;
    float _356 = _350 * _342;
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    float _370 = _364 * _294;
    float _372 = _366 * _296;
    float _374 = _368 * _298;
    bool _376 = !_320;
    float _392;
    if (!_376)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _380 = _158 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _182;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_42.x;
    float _400 = in.m_42.y;
    float _402 = in.m_42.z;
    float _404 = _158 * 2.0;
    float _406 = in.m_53.x;
    float _408 = in.m_53.y;
    float _410 = in.m_53.z;
    float _412 = in.m_53.w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_55.x;
    float _432 = in.m_55.y;
    float _434 = in.m_55.z;
    float _436 = in.m_55.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _442 = 1.0 / _416;
    float _444 = in.m_57.x;
    float _446 = in.m_57.y;
    float _448 = in.m_57.z;
    float _450 = in.m_57.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _456 = _182 * _182;
    float _458 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = 1.0 / _454;
    float _462 = in.m_49.y;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _470 = _468 != 0;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _474 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = 1.0 / _440;
    float _478 = _400 * _408;
    float _480 = _400 * _432;
    float _482 = fma(_398, _406, _478);
    float _484 = 1.0 / _466;
    float _486 = _400 * _446;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _492 = fma(_398, _430, _480);
    float _494 = fma(_402, _410, _482);
    float _496 = fma(_398, _444, _486);
    float _498 = fma(_402, _434, _492);
    float _500 = 1.0 / _490;
    float _502 = fma(_402, _448, _496);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _512 = floor(_404);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _518 = _506 * _442;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _528 = _462 * 2.0;
    float _530 = _158 + _462;
    float _532 = _522 * _484;
    float _534 = 1.0 / _510;
    float _536 = _526 * _460;
    float _538 = _530 + (-1.0);
    float _540 = _494 + _412;
    bool _542 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _544 = isnan(_396);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = _498 + _436;
    float _556 = _502 + _450;
    float _558 = 1.0 / _516;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _564;
    bool _568 = _512 > 0.0;
    float _570 = -_552;
    float _572 = _570 + 1.0;
    bool _574 = _512 >= 0.0;
    bool _576 = isnan(_512);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = _566 * _500;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _590 = floor(_528);
    int _592 = _582 ? 0 : 1;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _594;
    float _598 = _588 * _534;
    float _600 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _600;
    float _604 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _604;
    float _608 = _596 * _558;
    float _610 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _612 = _602 * _602;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _616 = _396 + _614;
    float _618 = _562 * _476;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _622 = _396 + _620;
    float _624 = fma(_606, _606, _612);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _628 = _396 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _632 = _396 + _630;
    float _634 = fma(_518, _616, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _636 = _590 > 0.0;
    float _638 = fma(_536, _628, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _640 = fma(_532, _632, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _642 = _590 >= 0.0;
    bool _644 = isnan(_590);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _396 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = _396 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _396 + _666;
    float _670 = in.m_49.z;
    float _672 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _674 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _676 = isnan(_396);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_584, _664, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _688 = fma(_598, _622, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _690 = fma(_608, _668, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _692 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _694 = isnan(_396);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    bool _708 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _710 = isnan(_396);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    bool _724 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_396);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _702 * _706;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _744 = isnan(_396);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _552 * _740;
    bool _756 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _758 = isnan(_396);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = _752 * _572;
    float _770 = -_752;
    float _772 = _770 + 1.0;
    float _774 = _656 * 12.98980045318603515625;
    float _776 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _778 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _776;
    bool _780 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _782 = isnan(_396);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _718 * _772;
    float _794 = fma(_462, 78.233001708984375, _774);
    float _796 = fma(_778, _778, _624);
    float _798 = -_718;
    float _800 = _798 + 1.0;
    float _802 = fma(_158, 78.233001708984375, _774);
    float _804 = _794 * 0.15915493667125701904296875;
    int _806 = ~_592;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _766 * _800;
    float _814 = _802 * 0.15915493667125701904296875;
    float _816 = -_766;
    float _818 = _816 + 1.0;
    float _820 = _804 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _670 * 2.0;
    float _826 = _790 * _818;
    float _828 = -_790;
    float _830 = _828 + 1.0;
    float _832 = _818;
    float _834 = _830;
    int _836 = _810;
    bool _838 = _420;
    if (_470)
    {
        _832 = _462;
    }
    float _840 = _832;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _844 = _840;
    if (!_470)
    {
        _844 = _158;
    }
    float _846 = _844;
    float _848 = _734 * _830;
    float _850 = _814 * 6.283185482025146484375;
    float _852 = sin(_850);
    if (_470)
    {
        _834 = _670;
    }
    float _854 = _834;
    float _856 = -_734;
    float _858 = _856 + 1.0;
    float _860 = _854;
    if (!_470)
    {
        _860 = _462;
    }
    float _862 = _860;
    float _864 = _634 * _848;
    float _866 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _868 = _866;
    if (!_568)
    {
        int _870 = ~_592;
        int _872 = _870 + 1;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = _722 * _130;
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[89].z, _472);
    float _880 = _822 * 43758.546875;
    int _882 = _650 ? 0 : 1;
    float _884 = fma(_866, -2.0, _842);
    float _886 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _864);
    int _888 = ~_882;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    float _894 = floor(_880);
    float _896 = _852 * 43758.546875;
    int _898 = _892;
    if (!_636)
    {
        int _900 = ~_882;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_470)
    {
        _868 = _158;
    }
    float _908 = _868;
    float _910 = fma(_638, _826, _886);
    float _912 = _908;
    if (!_470)
    {
        _912 = _670;
    }
    float _914 = _912;
    float _916 = _462 + _670;
    float _918 = floor(_896);
    bool _920 = !_424;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_640, _812, _910);
    float _926 = _914 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _928 = _916 + (-1.0);
    int _930 = abs(_922);
    float _932 = -_906;
    float _934 = fma(_926, 2.0, _932);
    float _936 = floor(_824);
    float _938 = _158 + _670;
    float _940 = -_894;
    float _942 = _880 + _940;
    float _944 = float(_930);
    float _946 = _938 + (-1.0);
    float _948 = float(_874);
    float _950 = -_918;
    float _952 = _896 + _950;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _956 = !_428;
    int _958 = _956 ? 0 : 1;
    float _960 = exp2(_876);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _964 = _944 * _948;
    int _966 = abs(_958);
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _970 = _540 + _968;
    bool _972 = _936 > 0.0;
    float _974 = in.m_61.x;
    float _976 = in.m_61.y;
    float _978 = in.m_61.z;
    bool _980 = _936 >= 0.0;
    bool _982 = isnan(_936);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = float(_966);
    float _1006 = float(_904);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1010 = 1.0 / _1002;
    float _1012 = -_960;
    float _1014 = _1012 + 1.0;
    float _1016 = _1004 * _1006;
    float _1018 = fma(_672, _792, _924);
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1022 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1008);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[89].x, _878);
    float _1026 = _964 * (-2.0);
    float _1028 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1020);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1022);
    float _1042 = fma(_954, _1026, _954);
    float _1044 = -_554;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1028);
    float _1050 = _1038 ? _1014 : 0.0;
    float _1052 = fma(_1026, _976, _976);
    float _1054 = fma(_686, _768, _1018);
    float _1056 = -_540;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1046 * _1046;
    float _1062 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _884);
    float _1064 = -_130;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[86].x, _934);
    float _1068 = _1024;
    if (_998)
    {
        float _1070 = _1050 * _1010;
        _150 = _1070;
    }
    float _1072 = _150;
    float _1074 = -_556;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = fma(_1058, _1058, _1060);
    float _1080 = _1016 * (-2.0);
    float _1082 = fma(_688, _754, _1054);
    float _1084 = _670 + (-0.5);
    float _1086 = fma(_1076, _1076, _1078);
    float _1088 = fma(_1080, _978, _978);
    float _1090 = _462 + (-0.5);
    int _1092 = _988 ? 0 : 1;
    float _1094 = sqrt(_796);
    bool _1096 = !_420;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1088);
    int _1102 = ~_1092;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1052);
    float _1110 = fma(_962, _1080, _962);
    float _1112 = fma(_690, _736, _1082);
    int _1114 = _1106;
    if (!_972)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = rsqrt(_1086);
    int _1124 = abs(_1098);
    float _1126 = fma(_1042, _1072, _1108);
    float _1128 = fma(_1110, _1072, _1100);
    float _1130 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    float _1132 = in.m_63.x;
    float _1134 = in.m_63.y;
    float _1136 = in.m_63.z;
    float _1138 = float(_1124);
    float _1140 = _1128 * 0.15915493667125701904296875;
    float _1142 = float(_1120);
    float _1144 = fma(_942, 4.0, -2.0);
    float _1146 = _1126 * 0.15915493667125701904296875;
    float _1148 = _1138 * _1142;
    float _1150 = _1130 * _1144;
    float _1152 = _1046 * _1122;
    float _1154 = _1076 * _1122;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1058 * _1122;
    float _1160 = _1150 * 0.15915493667125701904296875;
    float _1162 = _1146 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = fma(_1156, _974, _974);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1170 = _1154 * _1168;
    float _1172 = _158 + (-0.5);
    float _1174 = fma(_610, _1156, _610);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1178 = _1158 * _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1182 = -_1170;
    float _1184 = fma(_1152, _1180, _1182);
    float _1186 = _952 * 0.5;
    float _1188 = _1146 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1166);
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1196 = -_1178;
    float _1198 = fma(_1154, _1194, _1196);
    float _1200 = -_1186;
    float _1202 = fma(_456, 1.5, _1200);
    float _1204 = precise::clamp(_1202, 0.0, 1.0);
    float _1206 = -_1136;
    float _1208 = _656 + _1206;
    float _1210 = fma(_1174, _1072, _1192);
    float _1212 = _1130 * _952;
    float _1214 = _1212 * 4.0;
    float _1216 = -_654;
    float _1218 = _1216 + _1134;
    float _1220 = _1160 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = fma(_1204, _1208, _1136);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1228 = _1152 * _1226;
    float _1230 = _1198 * _1198;
    float _1232 = -_652;
    float _1234 = _1232 + _1132;
    float _1236 = fma(_1214, _656, _1224);
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1228;
    float _1242 = fma(_1158, _1238, _1240);
    float _1244 = fma(_1184, _1184, _1230);
    float _1246 = _1160 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 0.15915493667125701904296875;
    float _1252 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1260 = _554 + _1258;
    float _1262 = _1222 * _1218;
    float _1264 = _1140 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1094, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1270 = precise::max(_1268, 1.0);
    float _1272 = _1248 * _1218;
    float _1274 = -_1262;
    float _1276 = fma(_1248, _1234, _1274);
    float _1278 = _1250 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1254 * _1252;
    float _1284 = fma(_1222, _1234, _1272);
    float _1286 = _1276 + _652;
    float _1288 = precise::min(_1270, 1.89999997615814208984375);
    float _1290 = _1284 + _654;
    float _1292 = -_1276;
    float _1294 = fma(_1292, _1204, _1286);
    float _1296 = _1250 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    float _1300 = _1164 * _1266;
    float _1302 = -_1284;
    float _1304 = fma(_1302, _1204, _1290);
    float _1306 = fma(_1214, _652, _1294);
    float _1308 = _1190 * _1266;
    float _1310 = fma(_1214, _654, _1304);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1314 = rsqrt(_1256);
    float _1316 = _1280 * _1164;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1310);
    float _1320 = _1312 * _474;
    float _1322 = _1318 * _458;
    float _1324 = _1140 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1298 * _1190;
    float _1330 = _1298 * _1164;
    float _1332 = _1280 * _1190;
    float _1334 = _1298 * _1266;
    float _1336 = _1280 * _1266;
    float _1338 = _1184 * _1314;
    float _1340 = _1198 * _1314;
    float _1342 = _1242 * _1314;
    float _1344 = _1336 * _1322;
    float _1346 = _1152 * _1338;
    float _1348 = _1158 * _1342;
    float _1350 = -_1330;
    float _1352 = fma(_1326, _1332, _1350);
    float _1354 = -_1332;
    float _1356 = fma(_1326, _1330, _1354);
    float _1358 = fma(_1326, _1328, _1316);
    float _1360 = _1334 * _1322;
    float _1362 = -_1322;
    float _1364 = _1326 * _1362;
    float _1366 = fma(_1352, _1320, _1344);
    float _1368 = fma(_1326, _1316, _1328);
    float _1370 = fma(_1358, _1320, _1360);
    float _1372 = _1154 * _1340;
    float _1374 = fma(_1308, _1320, _1364);
    float _1376 = -_1346;
    float _1378 = fma(_1158, _1340, _1376);
    float _1380 = fma(_1356, _1282, _1370);
    float _1382 = fma(_1368, _1282, _1366);
    float _1384 = -_1372;
    float _1386 = fma(_1152, _1342, _1384);
    float _1388 = fma(_1300, _1282, _1374);
    float _1390 = _1378 * _1380;
    float _1392 = _554 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1394 = _1386 * _1380;
    float _1396 = -_1348;
    float _1398 = fma(_1154, _1338, _1396);
    float _1400 = fma(_1342, _1388, _1390);
    float _1402 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1392);
    float _1404 = fma(_1338, _1388, _1394);
    float _1406 = _1398 * _1380;
    float _1408 = fma(_1154, _1382, _1400);
    float _1410 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1402);
    float _1412 = fma(_1158, _1382, _1404);
    float _1414 = fma(_1340, _1388, _1406);
    float _1416 = fma(_1408, _1288, _556);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1420 = fma(_1412, _1288, _540);
    float _1422 = _554 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1426 = _1416 + _1424;
    float _1428 = 1.0 / _1418;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1420 + _1430;
    float _1434 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1422);
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1152, _1382, _1414);
    float _1440 = _1260 * _1260;
    float _1442 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1444 = fma(_1432, _1432, _1436);
    float _1446 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1448 = sqrt(_1444);
    bool _1450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    float _1460 = _1446 + _1418;
    float _1462 = _1460 * _1428;
    float _1464 = _1462 * 0.5;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
    bool _1470 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(0.5);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_1438, _1288, _554);
    float _1482 = fma(_970, _970, _1440);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _556 + _1484;
    bool _1488 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1490 = 1.0 / _1468;
    float _1492 = _1440;
    float _1494 = _1288;
    float _1496 = _1388;
    float _1498 = _1438;
    float _1500 = _1184;
    float _1502 = _1432;
    float _1504 = _1426;
    float _1506 = _1482;
    if (!_1488)
    {
        _1492 = _1420;
    }
    float _1508 = _1492;
    float _1510 = _1508;
    if (!_1488)
    {
        _1494 = _1416;
    }
    float _1512 = _1494;
    float _1514 = _1512;
    if (!_1488)
    {
        _1496 = _1480;
    }
    float _1516 = _1496;
    bool _1518 = !_1488;
    float _1520 = _1516;
    if (!_1518)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1526 = _1448 + _1524;
        float _1528 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1530 = _1526 * _1522;
        float _1532 = rsqrt(_1444);
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1534 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 + (-1.0);
        float _1546 = fma(_1542, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = _1532 * _1546;
        float _1552 = fma(_1480, _1538, _1548);
        float _1554 = fma(_1432, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1426, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1510 = _1554;
        _1520 = _1552;
        _1498 = _1544;
        _1514 = _1556;
    }
    float _1558 = _1510;
    float _1560 = _1520;
    float _1562 = _1498;
    float _1564 = _1514;
    float _1566 = _1564;
    float _1568 = _1562;
    if (_1478)
    {
        _1500 = 1.0;
    }
    float _1570 = _1500;
    float _1572 = fma(_1486, _1486, _1482);
    float _1574 = _1570;
    if (_1458)
    {
        _1502 = _1558;
    }
    float _1576 = _1502;
    float _1578 = _1576;
    if (_1458)
    {
        _1504 = _1560;
    }
    float _1580 = _1504;
    float _1582 = _1580;
    if (!_1458)
    {
        float _1584 = sqrt(_1572);
        float _1586 = -_540;
        float _1588 = _1586 + _1558;
        float _1590 = -_554;
        float _1592 = _1590 + _1560;
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1598 = precise::min(_1584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1600 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1602 = -_556;
        float _1604 = _1602 + _1564;
        float _1606 = _1598 * _1596;
        float _1608 = _1600 * _1606;
        float _1610 = fma(_1588, _1608, _540);
        float _1612 = fma(_1592, _1608, _554);
        float _1614 = fma(_1604, _1608, _556);
        _1506 = _1604;
        _1582 = _1612;
        _1578 = _1610;
        _1566 = _1614;
        _1568 = _1608;
    }
    float _1616 = _1506;
    float _1618 = _1582;
    float _1620 = _1578;
    float _1622 = _1566;
    float _1624 = _1568;
    float _1626 = 0.0;
    float _1628 = _1624;
    float _1630 = _1616;
    if (_1478)
    {
        _1626 = 1.0;
    }
    float _1632 = _1626;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1490 * _1634;
    float _1638 = _1632;
    if (!_1478)
    {
        float _1640 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1644 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1642;
        float _1646 = _1640 * 0.15915493667125701904296875;
        float _1648 = _1646 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1654 = _1652 * 0.15915493667125701904296875;
        float _1656 = _1646 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = 1.0 / _1650;
        float _1662 = _1654 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * _1660;
        float _1668 = _1654 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1664 * _1666;
        float _1674 = 1.0 / _1644;
        float _1676 = 1.0 / _1672;
        float _1678 = _1670 * _1676;
        float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1682 = fma(_1636, _1678, _1680);
        float _1684 = _1682 * _1674;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1628 = _1644;
        _1630 = _1660;
        _1574 = _1686;
    }
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1574;
    float _1694 = _1688;
    float _1696 = _1690;
    if (!_1478)
    {
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = cos(_1702);
        float _1706 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1708 = _1706 * 0.15915493667125701904296875;
        float _1710 = _1700 * 6.283185482025146484375;
        float _1712 = sin(_1710);
        float _1714 = 1.0 / _1704;
        float _1716 = _1708 * 6.283185482025146484375;
        float _1718 = cos(_1716);
        float _1720 = _1712 * _1714;
        float _1722 = _1708 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1718 * _1720;
        float _1728 = 1.0 / _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1730;
        float _1734 = 1.0 / _1732;
        float _1736 = _1724 * _1728;
        float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1740 = fma(_1636, _1736, _1738);
        float _1742 = _1740 * _1734;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        float _1746 = -_1744;
        float _1748 = _1746 + 1.0;
        _1694 = _1728;
        _1696 = _1724;
        _1638 = _1748;
    }
    float _1750 = _1694;
    float _1752 = _1696;
    float _1754 = _1638;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1618 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1620 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1622 + _1764;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = _1758 * _1758;
    float _1772 = fma(_1762, _1762, _1770);
    float _1774 = precise::max(0.0, _1768);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = rsqrt(_1776);
    float _1780 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1782 = _1762 * _1780;
    float _1784 = _1766 * _1780;
    float _1786 = -_1780;
    float _1788 = -_1774;
    float _1790 = fma(_1758, _1786, _1788);
    float _1792 = _1782 * _1782;
    float _1794 = _1784 * _1784;
    float _1796 = _1792 + _1794;
    float _1798 = sqrt(_1796);
    bool _1800 = _1798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1798 + _1802;
    float _1806 = _1778;
    float _1808 = _1774;
    float _1810 = _1766;
    float _1812 = _1752;
    float _1814 = _1804;
    float _1816 = _1750;
    float _1818 = _1780;
    float _1820 = _1790;
    if (_1800)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1800)
    {
        float _1826 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1826;
    }
    float _1828 = _1808;
    float _1830 = _1828;
    if (!_1800)
    {
        _1810 = _1782;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    if (_1800)
    {
        float _1836 = rsqrt(_1796);
        _1812 = _1836;
    }
    float _1838 = _1812;
    float _1840 = _1838;
    if (_1800)
    {
        float _1842 = _1804 * _1824;
        _1814 = _1842;
    }
    float _1844 = _1814;
    if (_1800)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1816 = _1846;
    }
    float _1848 = _1816;
    float _1850 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1852 = _1844;
    if (_1800)
    {
        float _1854 = _1848 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1824;
    if (_1800)
    {
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = _1858;
    if (_1800)
    {
        float _1870 = fma(_1858, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1830 = _1870;
    }
    float _1872 = _1830;
    float _1874 = sqrt(_1776);
    float _1876 = _1872;
    if (_1800)
    {
        float _1878 = _1838 * _1872;
        _1818 = _1878;
    }
    float _1880 = _1818;
    if (!_1800)
    {
        _1876 = _1792;
    }
    float _1882 = _1876;
    float _1884 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1882;
    float _1888 = _1866;
    if (_1800)
    {
        float _1890 = _1866 + (-1.0);
        _1868 = _1890;
    }
    float _1892 = _1868;
    float _1894 = _1892;
    if (_1800)
    {
        float _1896 = _1782 * _1880;
        _1834 = _1896;
    }
    float _1898 = _1834;
    float _1900 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    if (_1800)
    {
        float _1902 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1902;
    }
    float _1904 = _1840;
    if (!_1800)
    {
        _1894 = _1784;
    }
    float _1906 = _1894;
    float _1908 = _1906;
    if (_1800)
    {
        float _1910 = _1784 * _1880;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1800)
    {
        float _1914 = _1898 * _1898;
        _1886 = _1914;
    }
    float _1916 = _1886;
    if (_1800)
    {
        float _1918 = fma(_1790, _1866, _1904);
        _1820 = _1918;
    }
    float _1920 = _1820;
    if (!_1800)
    {
        _1888 = _1794;
    }
    float _1922 = _1888;
    float _1924 = _1922;
    if (_1800)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1932 = fma(_1920, _1920, _1916);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1944 = _1932 + _1928;
    float _1946 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1948 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1950 = -_1938;
    float _1952 = _1950 + 1.0;
    float _1954 = rsqrt(_1944);
    float _1956 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1946);
    float _1958 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1948);
    float _1960 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1956);
    float _1962 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = abs(_1952);
    float _1968 = log2(_1966);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1972 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1974 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1976 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1978 = _1954 * _1898;
    float _1980 = _1954 * _1912;
    float _1982 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = -_1974;
    float _1990 = fma(_1988, _1850, 1.0);
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1996 = _1954 * _1920;
    float _1998 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1994);
    float _2004 = -_1986;
    float _2006 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2004);
    float _2008 = log2(_1990);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2012 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2002);
    float _2014 = -_1980;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2006);
    float _2018 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2020 = fma(_2016, -0.5, 0.5);
    float _2022 = 1.0 / _2012;
    float _2024 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2018);
    float _2026 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2024);
    float _2028 = exp2(_1998);
    float _2030 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2032 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2010);
    float _2034 = _2008 * 0.693147182464599609375;
    float _2036 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2038 = sqrt(_2020);
    float _2040 = fma(_2016, 0.5, 0.5);
    float _2042 = _1996 + 1.0;
    float _2044 = _2030 * _2022;
    float _2046 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = -_1996;
    float _2052 = fma(_2028, _2042, _2050);
    float _2054 = fma(_2040, _2046, -0.212114393711090087890625);
    float _2056 = fma(_2040, _2054, 1.570728778839111328125);
    float _2058 = _2032 * _2022;
    float _2060 = fma(_2052, 0.5, 0.5);
    float _2062 = _2038 * 0.636619746685028076171875;
    float _2064 = fma(_2058, -0.5, 0.5);
    float _2066 = -_2056;
    float _2068 = fma(_2062, _2066, 1.0);
    float3 _5488 = float3(_2048, _2064, _2036);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5488, float3(0.0), isnan(_5488)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5488, float3(0.0), isnan(_5488)), level(0.0)).x;
    float3 _5499 = float3(_2048, _2064, _2036);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float2 _5516 = float2(_2068, _2060);
    float3 _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5516, float2(0.0), isnan(_5516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5516, float2(0.0), isnan(_5516)), level(0.0)).xyz;
    float _2087 = _2085.x;
    float _2089 = _2085.y;
    float _2091 = _2085.z;
    float _2093 = in.m_65.x;
    float _2095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2097 = _462 > 0.5;
    float _2099 = in.m_65.y;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2103 = _2101 != 0;
    float _2105 = _1024 * (-0.15915493667125701904296875);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2109 = _2107 != 0;
    float _2111 = in.m_49.w;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2115 = _2113 != 0;
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2121 = _2119 != 0;
    float _2123 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.w = _328;
    out.m_69.x = _1620;
    out.m_69.y = _1618;
    out.m_69.z = _1622;
    int _2125 = as_type<int>(_2048);
    bool _2127 = _2121;
    if (_2103)
    {
        bool _2129 = _158 > 0.5;
        _838 = _2129;
    }
    bool _2131 = _838;
    float _2133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2103)
    {
        float _2135 = -_2093;
        float _2137 = _2135 + 1.0;
        _2125 = as_type<int>(_2137);
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (!_2103)
    {
        _254 = _2093;
    }
    float _2143 = _254;
    float _2145 = _2143;
    if (_2115)
    {
        float _2147 = -_2093;
        float _2149 = _2147 + 1.0;
        _256 = as_type<int>(_2149);
    }
    int _2151 = _256;
    float _2153 = 0.0;
    if (!_2109)
    {
        _2153 = _2093;
    }
    float _2155 = _2153;
    float _2157 = -_2099;
    float _2159 = _2157 + 1.0;
    float _2161 = _2155;
    float _2163 = _2099;
    if (_2103)
    {
        float _2165 = _2131 ? as_type<float>(_2139) : _2093;
        _2145 = _2165;
    }
    float _2167 = _2145;
    if (_2109)
    {
        float _2169 = -_2093;
        float _2171 = _2169 + 1.0;
        _2141 = as_type<int>(_2171);
    }
    int _2173 = _2141;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2177 = _2175 != 0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2181 = _2111 > 0.5;
    float _2183 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2185 = _2097 ? as_type<int>(_2159) : as_type<int>(_2099);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2189 = _2187 != 0;
    float _2191 = _2183 * _2133;
    int _2193 = _2181 ? as_type<int>(_2159) : as_type<int>(_2099);
    float _2195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2197 = _2121 ? as_type<float>(_2185) : _2099;
    if (_2109)
    {
        bool _2199 = _670 > 0.5;
        _2127 = _2199;
    }
    bool _2201 = _2127;
    bool _2203 = _670 > 0.5;
    float _2205 = _2177 ? as_type<float>(_2193) : _2099;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2209 = in.m_71.x;
    float _2211 = in.m_71.y;
    if (_2109)
    {
        float _2213 = _2201 ? as_type<float>(_2173) : _2093;
        _2161 = _2213;
    }
    float _2215 = _2161;
    float _2217 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2115)
    {
        _1068 = _2093;
    }
    float _2219 = _1068;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2223 = _2219;
    if (_2115)
    {
        float _2225 = _2097 ? as_type<float>(_2151) : _2093;
        _2223 = _2225;
    }
    float _2227 = _2223;
    float _2229 = _2217 * _2095;
    if (_2189)
    {
        float _2231 = _2203 ? _2159 : _2099;
        _2163 = _2231;
    }
    float _2233 = _2163;
    float _2235 = in.m_71.z;
    float _2237 = rsqrt(_1572);
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2241 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2243 = in.m_73.x;
    float _2245 = in.m_73.y;
    float _2247 = in.m_73.z;
    float _2249 = in.m_73.w;
    float _2251 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2253 = _2239 * _2195;
    float _2255 = _2221 * _2207;
    bool _2257 = _1692 > 0.0;
    bool _2259 = isnan(_1692);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = _2105 * 6.283185482025146484375;
    float _2269 = sin(_2267);
    float _2271 = fma(_2251, _2233, -0.5);
    float _2273 = fma(_2241, _2227, -0.5);
    out.m_75.x = _2191;
    out.m_75.y = _2229;
    out.m_75.z = _2253;
    out.m_75.w = _2255;
    bool _2275 = _1754 <= 0.0;
    bool _2277 = !_2265;
    bool _2279 = _2275 || _2277;
    float _2281 = _1222 * _2211;
    float _2283 = _2105 * 6.283185482025146484375;
    float _2285 = cos(_2283);
    float _2287 = _970 * _2237;
    float _2289 = _1260 * _2237;
    float _2291 = -_2281;
    float _2293 = fma(_1248, _2209, _2291);
    float _2295 = _1486 * _2237;
    float _2297 = _1248 * _2211;
    float _2299 = _2269 * _2271;
    float _2301 = _1334 * _1386;
    out.m_77.x = _2287;
    out.m_77.y = _2289;
    out.m_77.z = _2295;
    float _2303 = _2293 * _2247;
    float _2305 = fma(_1222, _2209, _2297);
    float _2307 = _2235 * _2245;
    float _2309 = exp2(_2123);
    float _2311 = -_2303;
    float _2313 = fma(_2235, _2243, _2311);
    float _2315 = -_2299;
    float _2317 = fma(_2285, _2273, _2315);
    float _2319 = _2305 * _2243;
    float _2321 = _2285 * _2271;
    float _2323 = _2313 * _2249;
    float _2325 = _1358 * _1398;
    float _2327 = fma(_1040, _2317, _1066);
    float _2329 = _1334 * _1398;
    float _2331 = _1334 * _1378;
    float _2333 = -_1326;
    float _2335 = fma(_2333, _1338, _2301);
    float _2337 = _1356 * _1398;
    float _2339 = _1358 * _1386;
    float _2341 = _1358 * _1378;
    float _2343 = -_1326;
    float _2345 = fma(_2343, _1340, _2329);
    float _2347 = -_1326;
    float _2349 = fma(_2347, _1342, _2331);
    float _2351 = -_2307;
    float _2353 = fma(_2305, _2247, _2351);
    float _2355 = fma(_1308, _1340, _2325);
    float _2357 = fma(_1300, _1340, _2337);
    float _2359 = -_2319;
    float _2361 = fma(_2293, _2245, _2359);
    float _2363 = fma(_1308, _1338, _2339);
    float _2365 = _1356 * _1386;
    float _2367 = fma(_1308, _1342, _2341);
    float _2369 = fma(_1336, _1158, _2335);
    float _2371 = fma(_1336, _1152, _2345);
    float _2373 = fma(_1336, _1154, _2349);
    float _2375 = fma(_2269, _2273, _2321);
    float _2377 = _2353 * _2249;
    float _2379 = fma(_1352, _1152, _2355);
    float _2381 = fma(_1368, _1152, _2357);
    float _2383 = _2361 * _2249;
    float _2385 = fma(_1352, _1158, _2363);
    float _2387 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_1300, _1338, _2365);
    float _2391 = _2369 * _2245;
    float _2393 = _2371 * _2245;
    float _2395 = -_1062;
    float _2397 = fma(_1048, _2375, _2395);
    float _2399 = _1356 * _1378;
    float _2401 = _2323 * _2369;
    float _2403 = _2323 * _2371;
    float _2405 = fma(_1352, _1154, _2367);
    float _2407 = _2373 * _2245;
    float _2409 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2411 = fma(_1368, _1158, _2389);
    float _2413 = _2323 * _2373;
    float _2415 = fma(_2385, _2243, _2391);
    float _2417 = fma(_2379, _2243, _2393);
    float _2419 = fma(_1300, _1342, _2399);
    float _2421 = fma(_2377, _2385, _2401);
    float _2423 = fma(_2377, _2379, _2403);
    float _2425 = fma(_2405, _2243, _2407);
    float _2427 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2409);
    float _2429 = fma(_2411, _2247, _2415);
    float _2431 = -_2309;
    float _2433 = _2431 + 1.0;
    float _2435 = _2327 + 0.5;
    float _2437 = fma(_2381, _2247, _2417);
    float _2439 = fma(_1368, _1154, _2419);
    float _2441 = _1692 * _1754;
    float _2443 = fma(_2383, _2381, _2423);
    float _2445 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2427);
    float _2447 = fma(_2377, _2405, _2413);
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2383, _2411, _2421);
    float _2453 = _2441 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2455 = fma(_2439, _2247, _2425);
    float _2457 = _2445 + _2012;
    float _2459 = fma(_2383, _2439, _2447);
    float _2461 = _250 * _2453;
    float _2463 = _2397 + 0.5;
    out.m_79.x = _2429;
    out.m_79.y = _2437;
    out.m_79.z = _2455;
    float _2465 = _2457 * 0.5;
    float _2467 = _2461 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2435;
    out.m_81.y = _2463;
    out.m_83.x = _2451;
    out.m_83.y = _2443;
    out.m_83.z = _2459;
    float _2469 = -_2449;
    float _2471 = _2469 + 1.0;
    out.m_45.x = _2467;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2012;
    out.m_85.z = _2465;
    out.m_85.w = _2012;
    float _2473 = _2449 * _2070;
    float _2475 = _2081 * _2471;
    float _2477 = _2081 * _2473;
    float _2479 = _2091 * _2473;
    float _2481 = fma(_2087, _2477, _2075);
    float _2483 = fma(_2089, _2477, _2077);
    float _2485 = fma(_2081, _2479, _2079);
    out.m_87.x = _2481;
    out.m_87.y = _2483;
    out.m_87.z = _2485;
    out.m_87.w = _2475;
    if (!_2279)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

