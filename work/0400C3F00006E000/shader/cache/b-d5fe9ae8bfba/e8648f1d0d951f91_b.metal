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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_75 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_134);
        out.gl_Position.z = _3059;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_160);
        out.gl_Position.z = _3114;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _218 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = 1.0 / _242;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _254;
    float _262 = 1.0 / _250;
    float _264 = _222 * _256;
    bool _266 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_218);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_238;
    float _280 = _278 + 1.0;
    float _282 = _276 * _280;
    float _284 = _226 * _260;
    bool _286 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_218);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_276;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_296;
    float _324 = _322 + 1.0;
    float _326 = _246 * _262;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _312 * _324;
    float _338 = fma(_300, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = _296 * _316;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = _340 * _336;
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = _342 * _336;
    float _362 = _338 * _336;
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_348, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _378;
    float _382 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_368, _344, _364);
    float _390 = fma(_376, _264, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_380, _264, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_370, _344, _366);
    float _396 = fma(_386, _264, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_382, _344, _372);
    float _400 = fma(_390, _282, _388);
    float _402 = fma(_392, _282, _394);
    float _404 = fma(_396, _282, _398);
    float _406 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].x, _400);
    float _408 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].y, _402);
    float _410 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].z, _404);
    bool _412 = !_258;
    if (!_412)
    {
        float _414 = in.m_57.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _194 = _428;
    }
    float _430 = _194;
    float _432 = in.m_57.z;
    float _434 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _436 = log2(_434);
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _444 = int(_442);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = exp2(_450);
    float _460 = _438 * 2.0;
    float _462 = _440 * 2.0;
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _468 = _440 + _438;
    float _470 = floor(_456);
    float _472 = -_446;
    float _474 = fma(_464, 2.0, _472);
    float _476 = _440 + _432;
    float _478 = fma(_466, -2.0, _448);
    float _480 = _468 + (-1.0);
    float _482 = _476 + (-1.0);
    float _484 = float(_454);
    float _486 = floor(_460);
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _494 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _484 * _116;
    float _502 = -_116;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _474);
    float _506 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _508 = _470 >= 0.0;
    bool _510 = isnan(_470);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_462);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _530 = _528 != 0;
    int _532 = _516 ? 0 : 1;
    bool _534 = _486 > 0.0;
    float _536 = 1.0 / _498;
    bool _538 = !_526;
    int _540 = _538 ? 0 : 1;
    bool _542 = _470 > 0.0;
    bool _544 = !_522;
    int _546 = _544 ? 0 : 1;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    bool _558 = _486 >= 0.0;
    bool _560 = isnan(_486);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = _518 > 0.0;
    bool _570 = _518 >= 0.0;
    bool _572 = isnan(_518);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    int _580 = ~_532;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    int _586 = _584;
    float _588 = _506;
    if (!_542)
    {
        int _590 = ~_532;
        int _592 = _590 + 1;
        _586 = _592;
    }
    int _594 = _586;
    bool _596 = !_530;
    int _598 = _596 ? 0 : 1;
    float _600 = _556 ? _490 : 0.0;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(_444);
    float _620 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _622 = in.m_59.x;
    float _624 = in.m_59.y;
    float _626 = in.m_59.z;
    bool _628 = !_606;
    int _630 = _628 ? 0 : 1;
    float _632 = 1.0 / _618;
    int _634 = _566 ? 0 : 1;
    float _636 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _650 = float(_594);
    bool _652 = !_610;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _648);
    int _658 = abs(_630);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_658);
    int _668 = abs(_654);
    float _670 = _632 * _116;
    int _672 = _664;
    if (!_534)
    {
        int _674 = ~_634;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = _666 * _650;
    float _682 = float(_668);
    if (_646)
    {
        float _684 = _600 * _536;
        _126 = _684;
    }
    float _686 = _126;
    int _688 = _578 ? 0 : 1;
    float _690 = _680 * (-2.0);
    float _692 = float(_678);
    float _694 = _438 + (-0.5);
    float _696 = fma(_690, _622, _622);
    bool _698 = !_614;
    int _700 = _698 ? 0 : 1;
    float _702 = _682 * _692;
    float _704 = fma(_494, _690, _494);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    int _714 = _710;
    if (!_568)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _702 * (-2.0);
    int _724 = abs(_700);
    float _726 = fma(_704, _686, _712);
    float _728 = _440 + (-0.5);
    float _730 = fma(_722, _624, _624);
    float _732 = float(_720);
    float _734 = fma(_492, _722, _492);
    float _736 = float(_724);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = _432 + _438;
    float _742 = _432 + (-0.5);
    float _744 = _736 * _732;
    float _746 = _740 + (-1.0);
    float _748 = fma(_734, _686, _738);
    float _750 = _726 * 0.15915493667125701904296875;
    float _752 = _744 * (-2.0);
    float _754 = in.m_61.x;
    float _756 = in.m_61.y;
    float _758 = in.m_61.z;
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _750 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_752, _626, _626);
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = fma(_760, _752, _760);
    float _776 = _748 * 0.15915493667125701904296875;
    float _778 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _780 = _750 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = fma(_774, _686, _778);
    float _786 = _776 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _784 * 0.15915493667125701904296875;
    float _792 = _406 * _754;
    float _794 = _410 * _758;
    float _796 = _776 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = _408 * _756;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _804 = in.m_46.x;
    float _806 = in.m_46.y;
    float _808 = in.m_46.z;
    float _810 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _814 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _818 = _790 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _824 = _810 * _802;
    float _826 = _814 * _812;
    float _828 = _782 * _788;
    float _830 = _822 * _816;
    float _832 = _764 * _788;
    float _834 = _790 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _782 * _798;
    float _840 = _764 * _798;
    float _842 = _782 * _820;
    float _844 = _764 * _820;
    float _846 = _798 * _820;
    float _848 = _788 * _820;
    float _850 = _842 * _830;
    float _852 = _844 * _830;
    float _854 = fma(_836, _838, _832);
    float _856 = -_828;
    float _858 = fma(_836, _840, _856);
    float _860 = -_840;
    float _862 = fma(_836, _828, _860);
    float _864 = -_830;
    float _866 = _836 * _864;
    float _868 = fma(_854, _824, _850);
    float _870 = fma(_836, _832, _838);
    float _872 = fma(_858, _824, _852);
    float _874 = fma(_846, _824, _866);
    float _876 = fma(_862, _826, _868);
    float _878 = _806 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_870, _826, _872);
    float _882 = fma(_848, _826, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = _806 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _888 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _886);
    float _896 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _912 = _806 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _904 + _908;
    float _918 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _920 = _910 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _930 = _920 + _928;
    float _932 = _924 * _924;
    float _934 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _936 = fma(_930, _930, _932);
    float _938 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _940 = sqrt(_936);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _938);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _946 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _948 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[11].x, _944);
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _952 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[11].z, _948);
    float _954 = _934 + _950;
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _946;
    float _960 = _948;
    float _962 = _950;
    float _964 = _936;
    float _966 = _940;
    float _968 = _934;
    float _970 = _910;
    if (!_956)
    {
        _958 = _920;
    }
    float _972 = _958;
    float _974 = _972;
    if (!_956)
    {
        _960 = _916;
    }
    float _976 = _960;
    float _978 = _976;
    if (!_956)
    {
        _962 = _954;
    }
    float _980 = _962;
    bool _982 = !_956;
    float _984 = _980;
    if (!_982)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _990 = _940 + _988;
        float _992 = rsqrt(_936);
        float _994 = _990 * _986;
        float _996 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * 0.15915493667125701904296875;
        float _1000 = _998 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 + (-1.0);
        float _1010 = fma(_1006, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _992 * _1010;
        float _1016 = fma(_954, _1002, _1012);
        float _1018 = fma(_930, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1020 = fma(_924, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1016;
        _974 = _1018;
        _978 = _1020;
        _964 = _992;
    }
    float _1022 = _984;
    float _1024 = _974;
    float _1026 = _978;
    float _1028 = _964;
    float _1030 = -_934;
    float _1032 = _1030 + _1022;
    float _1034 = _952 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1036 = -_910;
    float _1038 = _1036 + _1024;
    float _1040 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = _1032 * _1032;
    float _1044 = -_904;
    float _1046 = _1044 + _1026;
    float _1048 = 1.0 / _1034;
    float _1050 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1052 = fma(_1038, _1038, _1042);
    float _1054 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1050);
    float _1056 = fma(_1046, _1046, _1052);
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = sqrt(_1056);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = _1068 + _1034;
    float _1084 = _1082 * _1048;
    float _1086 = _1084 * 0.5;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1088);
    bool _1092 = _1070 > 0.0;
    float _1094 = 1.0 / _1090;
    float _1096 = _1028;
    float _1098 = _1070;
    float _1100 = _1024;
    float _1102 = _1034;
    float _1104 = _1022;
    float _1106 = _1026;
    float _1108 = _1056;
    if (!_1092)
    {
        _1096 = _1022;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    float _1114 = _1110;
    if (!_1092)
    {
        _1098 = _1026;
    }
    float _1116 = _1098;
    bool _1118 = !_1092;
    float _1120 = _1116;
    if (!_1118)
    {
        float _1122 = _188 * _188;
        float _1124 = fma(_186, _186, _1122);
        float _1126 = rsqrt(_1056);
        float _1128 = fma(_190, _190, _1124);
        float _1130 = sqrt(_1128);
        float _1132 = _1038 * _1126;
        float _1134 = _1032 * _1126;
        float _1136 = _1046 * _1126;
        bool _1138 = _1130 > 0.0;
        float _1140 = _1130;
        _1102 = _1134;
        _966 = _1128;
        if (!_1138)
        {
            _1112 = _1022;
        }
        float _1142 = _1112;
        _1114 = _1142;
        if (!_1138)
        {
            _1140 = _1026;
        }
        float _1144 = _1140;
        bool _1146 = !_1138;
        _1120 = _1144;
        if (!_1146)
        {
            float _1148 = rsqrt(_1128);
            float _1150 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1152 = _188 * _1148;
            float _1154 = _186 * _1148;
            float _1156 = _1134 * _1152;
            float _1158 = _190 * _1148;
            float _1160 = fma(_1132, _1154, _1156);
            float _1162 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1164 = fma(_1136, _1158, _1160);
            float _1166 = _1164 * _1162;
            float _1168 = fma(_186, _1166, _1024);
            float _1170 = fma(_188, _1166, _1022);
            float _1172 = fma(_190, _1166, _1026);
            _1100 = _1168;
            _1114 = _1170;
            _1120 = _1172;
            _966 = _1148;
        }
    }
    float _1174 = _1100;
    float _1176 = _1114;
    float _1178 = _1120;
    float _1180 = _1102;
    float _1182 = _966;
    float _1184 = _1178;
    float _1186 = _1180;
    if (_1080)
    {
        _1104 = 1.0;
    }
    float _1188 = _1104;
    float _1190 = _1188;
    if (_1066)
    {
        _1106 = _1174;
    }
    float _1192 = _1106;
    float _1194 = _1192;
    if (_1066)
    {
        _196 = _1176;
    }
    float _1196 = _196;
    float _1198 = _1196;
    if (!_1066)
    {
        float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1202 = _934 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1206 = _910 + _1204;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1210 = -_934;
        float _1212 = _1210 + _1176;
        float _1214 = _1202 * _1202;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1218 = _904 + _1216;
        float _1220 = -_904;
        float _1222 = _1220 + _1178;
        float _1224 = fma(_1206, _1206, _1214);
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1228 = fma(_1218, _1218, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1234 = precise::min(_1230, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1236 = _1234 * _1226;
        float _1238 = _1232 * _1236;
        float _1240 = -_910;
        float _1242 = _1240 + _1174;
        float _1244 = fma(_1212, _1238, _934);
        float _1246 = fma(_1242, _1238, _910);
        float _1248 = fma(_1222, _1238, _904);
        _1198 = _1244;
        _1194 = _1246;
        _1184 = _1248;
    }
    float _1250 = _1198;
    float _1252 = _1194;
    float _1254 = _1184;
    if (_1080)
    {
        _968 = 1.0;
    }
    float _1256 = _968;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1260 = _1094 * _1258;
    float _1262 = _1256;
    if (!_1080)
    {
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1266 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        float _1278 = _1268 * 0.15915493667125701904296875;
        float _1280 = _1266 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = 1.0 / _1276;
        float _1286 = _1278 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        float _1290 = _1282 * _1284;
        float _1292 = _1278 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        float _1296 = _1288 * _1290;
        float _1298 = 1.0 / _1272;
        float _1300 = 1.0 / _1296;
        float _1302 = _1294 * _1300;
        float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1306 = fma(_1260, _1302, _1304);
        float _1308 = _1306 * _1298;
        float _1310 = precise::clamp(_1308, 0.0, 1.0);
        _1190 = _1310;
    }
    float _1312 = _1190;
    if (!_1080)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1260, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1262 = _1364;
    }
    float _1366 = _1262;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1250 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1252 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1254 + _1376;
    float _1380 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1370 * _1370;
    float _1384 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1386 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1374, _1374, _1382);
    float _1390 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = fma(_1378, _1378, _1388);
    float _1394 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = rsqrt(_1392);
    float _1398 = sqrt(_1392);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1402 = _1374 * _1400;
    float _1404 = _1378 * _1400;
    float _1406 = _1402 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1388;
    float _1422 = _1410;
    float _1424 = _1418;
    float _1426 = _1402;
    float _1428 = _1404;
    float _1430 = _1406;
    float _1432 = _1408;
    if (_1414)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1434;
    }
    float _1436 = _1420;
    if (_1414)
    {
        float _1438 = rsqrt(_1410);
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1414)
    {
        float _1442 = _1418 * _1436;
        _1424 = _1442;
    }
    float _1444 = _1424;
    if (_1414)
    {
        float _1446 = _1444 * 0.15915493667125701904296875;
        _1186 = _1446;
    }
    float _1448 = _1186;
    float _1450 = _1436;
    if (_1414)
    {
        float _1452 = _1448 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1460 = precise::max(0.0, _1458);
    float _1462 = _1182;
    if (_1414)
    {
        float _1464 = _1448 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = -_1400;
    float _1472 = -_1460;
    float _1474 = fma(_1370, _1470, _1472);
    if (_1414)
    {
        float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1476;
    }
    float _1478 = _1108;
    float _1480 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1484 = _1456;
    float _1486 = _1478;
    if (_1414)
    {
        float _1488 = fma(_1456, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1488;
    }
    float _1490 = _1484;
    float _1492 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1494 = floor(_1482);
    float _1496 = _1490;
    if (_1414)
    {
        float _1498 = _1468 + (-1.0);
        _970 = _1498;
    }
    float _1500 = _970;
    float _1502 = _1500;
    if (_1414)
    {
        float _1504 = _1440 * _1490;
        _1486 = _1504;
    }
    float _1506 = _1486;
    if (!_1414)
    {
        _1496 = _1474;
    }
    float _1508 = _1496;
    float _1510 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1512 = _1508;
    if (_1414)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1514;
    }
    float _1516 = _1502;
    if (_1414)
    {
        float _1518 = _1402 * _1506;
        _1426 = _1518;
    }
    float _1520 = _1426;
    if (_1414)
    {
        float _1522 = _1404 * _1506;
        _1428 = _1522;
    }
    float _1524 = _1428;
    float _1526 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (_1414)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1512 = _1528;
    }
    float _1530 = _1512;
    if (_1414)
    {
        float _1532 = _1520 * _1520;
        _1430 = _1532;
    }
    float _1534 = _1430;
    if (_1414)
    {
        float _1536 = _1524 * _1524;
        _1432 = _1536;
    }
    float _1538 = _1432;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1542 = fma(_1530, _1530, _1534);
    float _1544 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1548 = _1542 + _1538;
    float _1550 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1554 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1552);
    float _1556 = precise::clamp(_1554, 0.0, 1.0);
    float _1558 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1560 = -_1494;
    float _1562 = _1482 + _1560;
    float _1564 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1566 = rsqrt(_1548);
    float _1568 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1384);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1568);
    float _1580 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = abs(_1572);
    float _1584 = log2(_1582);
    float _1586 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1540);
    float _1588 = -_1544;
    float _1590 = fma(_1588, _1546, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1596 = _1566 * _1520;
    float _1598 = _1566 * _1530;
    float _1600 = _1566 * _1524;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1594);
    float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1606 = floor(_1558);
    float _1608 = -_1604;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1620 = log2(_1590);
    float _1622 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = fma(_1618, 0.5, 0.5);
    float _1628 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1622);
    float _1630 = exp2(_1612);
    float _1632 = -_1606;
    float _1634 = _1558 + _1632;
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = _1598 + 1.0;
    float _1640 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1642 = 1.0 / _1602;
    float _1644 = fma(_1626, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1620 * 0.693147182464599609375;
    float _1648 = fma(_1626, _1644, -0.212114393711090087890625);
    float _1650 = sqrt(_1624);
    float _1652 = -_1598;
    float _1654 = fma(_1630, _1638, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1628);
    float _1660 = fma(_1626, _1648, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1642;
    float _1666 = _1658 * _1642;
    float _1668 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1650 * 0.636619746685028076171875;
    float2 _5483 = float2(_1562, _1634);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).x;
    float _1678 = -_1660;
    float _1680 = fma(_1674, _1678, 1.0);
    float3 _5499 = float3(_1670, _1672, _1668);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).x;
    float3 _5510 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5526 = float2(_1680, _1662);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = float(uint(_454));
    float _1707 = trunc(_670);
    int _1709 = int(_1707);
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    float _1715 = _500 * _168;
    bool _1717 = _454 == 0;
    int _1719 = abs(_540);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1705;
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1729 = _1727 != 0;
    float _1731 = float(uint(_1709));
    bool _1733 = !_1729;
    float _1735 = _1733 ? 7.345489978790283203125 : 1.0;
    int _1737 = as_type<int>(_1725) + (-2);
    float _1739 = _1735 * _438;
    float _1741 = float(_1709);
    float _1743 = as_type<float>(_1737) * _1731;
    float _1745 = floor(_1739);
    bool _1747 = _1741 >= _484;
    bool _1749 = isnan(_1741);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(_484);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = trunc(_1743);
    float _1761 = precise::max(_1759, 0.0);
    uint _1764 = uint(_1761);
    float _1766 = trunc(_1757);
    int _1768 = int(_1766);
    int _1770 = ~_454;
    int _1772 = _1770 + 1;
    int _1774 = _1713 * int(_1764);
    int _1776 = _1774 + _1709;
    float _1778 = float(uint(_1776));
    float _1780 = as_type<float>(_1737) * _1778;
    float _1782 = trunc(_1780);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = int(_1764) + int(_1786);
    int _1790 = _1772 * _1788;
    int _1792 = _1790 + _1709;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1745;
    float _1798 = _1739 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _484;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1808 = _1806 != 0;
    int _1810 = ~_1788;
    int _1812 = _1810 + _1802;
    int _1814 = _1812 + 1;
    bool _1816 = !_1808;
    int _1818 = _1816 ? 0 : 1;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _440 > 0.5;
    int _1826 = _454 * _1814;
    int _1828 = _1826 + _1709;
    int _1830 = abs(_1818);
    int _1832 = ~_1768;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    bool _1838 = !_1717;
    int _1840 = _1838 ? _1828 : (-1);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1844 = _1842 != 0;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    int _1850 = _1840 * _1836;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1854 = _1852 != 0;
    float _1856 = trunc(_1715);
    int _1858 = int(_1856);
    int _1860 = _454 + (-1);
    int _1862 = _1822 * _1830;
    int _1864 = _1862 + _1709;
    int _1866 = _1768 * _1860;
    int _1868 = _1866 + _1850;
    int _1870 = abs(_546);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1876 = in.m_67.y;
    int _1878 = _1868 * _1719;
    int _1880 = abs(_598);
    bool _1882 = !_1723;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1858 * _1870;
    int _1888 = _1886 + _1878;
    float _1890 = 1.0 / _1874;
    int _1892 = abs(_1884);
    int _1894 = _1864 * _1880;
    int _1896 = _1894 + _1888;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1902 = _1822 * _1892;
    int _1904 = _1902 + _1896;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1910 = as_type<float>(_1822);
    if (_1844)
    {
        float _1912 = in.m_57.x;
        _1910 = _1912;
    }
    float _1914 = _1910;
    float _1916 = 1.0 / _1900;
    float _1918 = float(uint(_1904));
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = as_type<float>(_1737) * _1918;
    float _1926 = -_1876;
    float _1928 = _1926 + 1.0;
    float _1930 = 1.0 / _1908;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1938 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1876;
    if (_1848)
    {
        float _1942 = _1824 ? _1928 : _1876;
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1946;
    float _1950 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = trunc(_1924);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1934 * _1916;
    float _1962 = _1948 * _1890;
    float _1964 = in.m_67.x;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1966;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    bool _1982 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_430);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    out.m_69.x = _1938;
    out.m_69.y = _1950;
    out.m_69.z = _1952;
    int _1994 = ~_454;
    int _1996 = _1994 + 1;
    float _1998 = _1968 * _1930;
    bool _2000 = _1914 > 0.5;
    bool _2002 = _2000 && _1844;
    float _2004 = -_1992;
    float _2006 = _2004 + 1.0;
    bool _2008 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2010 = isnan(_430);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    bool _2020 = _770 != 0.0;
    bool _2022 = isnan(_770);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    int _2030 = _1996 * int(_1958);
    int _2032 = _2030 + _1904;
    bool _2034 = _768 == 0.0;
    bool _2036 = !_2028;
    bool _2038 = _2034 && _2036;
    float _2040 = -_1980;
    float _2042 = _2040 + 1.0;
    bool _2044 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_430);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2058 = float(uint(_2032));
    float _2060 = _1992 * _2042;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2064 = _430 + _2062;
    float _2066 = _2054 * _2006;
    float _2068 = -_2054;
    float _2070 = _2068 + 1.0;
    float _2072 = -_506;
    float _2074 = fma(_656, _2056, _2072);
    float _2076 = fma(_1962, _2064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2078 = float(uint(_1864));
    float _2080 = _2018 * _2070;
    float _2082 = as_type<float>(_1737) * _2058;
    float _2084 = in.m_71.x;
    float _2086 = in.m_71.y;
    float _2088 = in.m_71.z;
    float _2090 = _1964;
    if (_1844)
    {
        _588 = _1964;
    }
    float _2092 = _588;
    float _2094 = _2076 * _2080;
    float _2096 = as_type<float>(_1737) * _2078;
    float _2098 = trunc(_2082);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2106 = _430 + _2104;
    float _2108 = _2092;
    if (_2002)
    {
        float _2110 = -_2092;
        float _2112 = _2110 + 1.0;
        _2108 = _2112;
    }
    float _2114 = _2108;
    bool _2116 = _772 == 0.0;
    bool _2118 = _2116 && _2038;
    float _2120 = fma(_1998, _2106, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1844)
    {
        _2090 = _2114;
    }
    float _2122 = _2090;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2126 = _430 + _2124;
    float _2128 = -_2018;
    float _2130 = _2128 + 1.0;
    int _2132 = ~_454;
    int _2134 = _2132 + 1;
    float _2136 = trunc(_2096);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = fma(_1960, _2126, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2144 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2094);
    int _2146 = ~_454;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2152 = int(_1958) + int(_2102);
    float _2154 = fma(_2142, _2066, _2144);
    float _2156 = _2084;
    float _2158 = _2086;
    float _2160 = _2088;
    if (!_2118)
    {
        float _2162 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (!_2118)
    {
        float _2166 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2158 = _2166;
    }
    float _2168 = _2158;
    if (!_2118)
    {
        float _2170 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2160 = _2170;
    }
    float _2172 = _2160;
    float _2174 = fma(_2120, _2060, _2154);
    float _2176 = fma(_636, _2150, _504);
    int _2178 = ~_454;
    int _2180 = _2178 + 1;
    int _2182 = _2148 * _2152;
    int _2184 = _2182 + _1904;
    float _2186 = abs(_1260);
    float _2188 = log2(_2186);
    int _2190 = _2134 * int(_2140);
    int _2192 = _2190 + _1864;
    float _2194 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2174);
    float _2196 = _2176 + 0.5;
    bool _2198 = uint(_2184) >= uint(_454);
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2202 = float(uint(_2192));
    float _2204 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2206 = as_type<float>(_1737) * _2202;
    bool _2208 = !_2198;
    int _2210 = _2208 ? 0 : (-1);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2216 = ~_2152;
    int _2218 = _2216 + _2210;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2206);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2074 + 0.5;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2234 = _454 * _2220;
    int _2236 = _2234 + _1904;
    float _2238 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2196;
    out.m_73.y = _2230;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2244 = !_1717;
    int _2246 = _2244 ? _2236 : (-1);
    float _2248 = exp2(_2232);
    float _2250 = _862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2238;
    out.m_75.y = _2240;
    out.m_75.z = _2242;
    out.m_75.w = _2200;
    int _2252 = _2246 & 3;
    bool _2254 = _2252 != 0;
    float _2256 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    int _2258 = int(_2140) + int(_2226);
    int _2260 = _2246 >> 31;
    float _2262 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = _2260 & 3;
    float _2266 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = -_836;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2272 = _2246 + _2264;
    float _2274 = -_836;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2204);
    float _2278 = -_836;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2284 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2276);
    int _2288 = _2272 >> 2;
    float _2290 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2294 = precise::clamp(_2292, 0.0, 1.0);
    float _2296 = _862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2298 = _2288 << 4;
    int _2300 = _2298 + 368;
    float _2302 = _862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    uint _2308 = uint(int(uint(_2300) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2326 = _2282 * _2168;
    float _2328 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2180 * _2258;
    int _2332 = _2330 + _1864;
    float _2334 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2336 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2338 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2340 = _2300 + 8;
    uint _2342 = uint(int(uint(_2340) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = _2286 * _2168;
    int _2360 = _2246 & 3;
    bool _2362 = _2360 != 0;
    float _2364 = _2304 * _2168;
    bool _2366 = uint(_2332) >= uint(_454);
    float _2368 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    bool _2370 = uint(_2360) > 1u;
    float _2372 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    int _2374 = _2254 ? 0 : 1;
    float _2376 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    bool _2378 = _2360 != 3;
    float _2380 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2382 = fma(_2294, -2.0, 3.0);
    float _2384 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2336);
    float _2386 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2256);
    float _2388 = _2294 * _2294;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2372, _2164, _2358);
    bool _2396 = uint(_2360) >= 2u;
    float _2398 = _2388 * _2382;
    int _2400 = ~_2374;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2376, _2164, _2364);
    int _2408 = _2404;
    if (!_2370)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2368, _2164, _2326);
    bool _2418 = !_2362;
    int _2420 = _2418 ? 0 : 1;
    float _2422 = fma(_2384, _2172, _2394);
    int _2424 = _2396 ? 0 : 1;
    float _2426 = in.m_77.x;
    bool _2428 = _2360 != 3;
    float _2430 = -_1676;
    float _2432 = _2430 + 1.0;
    int _2434 = abs(_2414);
    float _2436 = fma(_2380, _2172, _2416);
    int _2438 = ~_2258;
    int _2440 = _2438 + _2392;
    int _2442 = _2440 + 1;
    float _2444 = fma(_2386, _2172, _2406);
    int _2446 = abs(_2420);
    int _2448 = ~_2424;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = _454 * _2442;
    int _2456 = _2454 + _1864;
    bool _2458 = !_2428;
    int _2460 = _2458 ? 0 : (-1);
    out.m_79.x = _2436;
    out.m_79.y = _2422;
    out.m_79.z = _2444;
    int _2462 = _2452;
    if (_2378)
    {
        int _2464 = ~_2424;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    int _2470 = ~_2434;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    bool _2476 = !_1854;
    int _2478 = _2476 ? 0 : 1;
    int _2480 = abs(_2460);
    int _2482 = _2474 * as_type<int>(_2322);
    int _2484 = abs(_2468);
    int _2486 = ~_2446;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    int _2492 = abs(_2478);
    int _2494 = _2490 * as_type<int>(_2314);
    int _2496 = _2494 + _2482;
    int _2498 = ~_2484;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = ~_2480;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2502 * as_type<int>(_2348);
    int _2512 = _2510 + _2496;
    int _2514 = ~_2492;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2522 = _2508 * as_type<int>(_2356);
    int _2524 = _2522 + _2512;
    float _2526 = -_2398;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    bool _2532 = !_1717;
    int _2534 = _2532 ? _2456 : (-1);
    int _2536 = _2524 * _2518;
    float _2538 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    float _2542 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2398);
    float _2544 = _1602 * 0.5;
    int _2546 = _2534 * _2492;
    int _2548 = _2546 + _2536;
    float _2550 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2540);
    float _2552 = exp2(_2538);
    bool _2554 = _1260 <= 8000.0;
    bool _2556 = isnan(_1260);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(8000.0);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_1658, -0.5, _2544);
    float _2568 = float(_2548);
    float _2570 = _2550 + _1602;
    float _2572 = _1656 + _1602;
    float _2574 = _2564 * _2542;
    float _2576 = _2570 * 0.5;
    float _2578 = _2572 * 0.5;
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1602;
    bool _2582 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2584 = isnan(_1398);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2590 = _2586 || _2588;
    float _2592 = _2432 * _2580;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    out.m_81.x = _2578;
    out.m_81.y = _2566;
    out.m_81.z = _2576;
    out.m_81.w = _1602;
    float _2596 = -_2552;
    float _2598 = _2596 + 1.0;
    float _2600 = -_2594;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2568;
    float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2606 = _2602 * _2426;
    float _2608 = _2604 * _1682;
    float _2610 = _2568;
    float _2612 = _2578;
    if (!_2590)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2610;
    float _2616 = _1693 * _2608;
    float _2618 = _1703 * _2608;
    float _2620 = -_2604;
    float _2622 = _2620 + 1.0;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = fma(_1699, _2616, _1687);
    float _2628 = fma(_1701, _2616, _1689);
    float _2630 = _1693 * _2622;
    float _2632 = fma(_1693, _2618, _1691);
    out.m_85.x = _2624;
    float _2634 = _1312 * _1366;
    float _2636 = _2616;
    float _2638 = _2618;
    float _2640 = _2622;
    float _2642 = _2634;
    float _2644 = _2614;
    float _2646 = _2614;
    if (!_2590)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2648 = _2612;
    out.m_87.x = _2626;
    out.m_87.y = _2628;
    out.m_87.z = _2632;
    out.m_87.w = _2630;
    float _2650 = _2634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2652 = _2648;
    float _2654 = _2648;
    if (!_2590)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _2636;
    float _2658 = _2656;
    float _2660 = _2656;
    if (!_2590)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2662 = _2638;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2590)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2668 = _2640;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2590)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2674 = _2642;
    bool _2676 = !_2590;
    float _2678 = _2674;
    float _2680 = _2674;
    if (!_2676)
    {
        bool _2682 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2684 = isnan(_1398);
        bool _2686 = _2682 || _2684;
        bool _2688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2690 = _2686 || _2688;
        if (!_2690)
        {
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2694 = _1398 + _2692;
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = 1.0 / _2698;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2722 = _2694 * _2704;
            float _2724 = precise::clamp(_2722, 0.0, 1.0);
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = fma(_2724, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2732 = fma(_2724, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2724, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2724, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2738 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2740 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2660 = _2734;
            _2672 = _2738;
            _2654 = _2730;
            _2666 = _2736;
            _2646 = _2732;
            _2680 = _2740;
            _2742 = true;
        }
        else
        {
            bool _2744 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2746 = isnan(_1398);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2754 = _2652;
            _2654 = _2754;
            if (!_2752)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2756 = _2658;
            _2660 = _2756;
            if (!_2752)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2758 = _2644;
            _2646 = _2758;
            if (!_2752)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2760 = _2664;
            _2666 = _2760;
            if (!_2752)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2762 = _2670;
            _2672 = _2762;
            if (!_2752)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2764 = _2678;
            bool _2766 = !_2752;
            _2680 = _2764;
            if (!_2766)
            {
                bool _2768 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2770 = isnan(_1398);
                bool _2772 = _2768 || _2770;
                bool _2774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2776 = _2772 || _2774;
                if (!_2776)
                {
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2780 = _1398 + _2778;
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = 1.0 / _2784;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2808 = _2780 * _2790;
                    float _2810 = precise::clamp(_2808, 0.0, 1.0);
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = fma(_2810, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2818 = fma(_2810, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2810, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2822 = fma(_2810, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2824 = fma(_2810, _2802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2826 = fma(_2810, _2806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2660 = _2820;
                    _2672 = _2824;
                    _2654 = _2816;
                    _2666 = _2822;
                    _2646 = _2818;
                    _2680 = _2826;
                    _2742 = true;
                }
                else
                {
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2742 = false;
    float _2828 = _2660;
    float _2830 = _2672;
    float _2832 = _2654;
    float _2834 = _2666;
    float _2836 = _2646;
    float _2838 = _2680;
    float _2840 = fma(_2422, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2828;
    float _2846 = _2844 + _2830;
    float _2848 = _2650 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2850 = -_2832;
    float _2852 = _2850 + _2834;
    out.m_89.x = 0.0;
    float _2854 = fma(_2842, _2846, _2828);
    float _2856 = fma(_2842, _2852, _2832);
    out.m_53.x = _2848;
    float _2858 = -_2836;
    float _2860 = _2858 + _2838;
    float _2862 = _2854 * 0.586610972881317138671875;
    bool _2864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2866 = fma(_2842, _2860, _2836);
    float _2868 = fma(_2856, 0.298911988735198974609375, _2862);
    bool _2870 = _1312 > 0.0;
    bool _2872 = isnan(_1312);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    float _2880 = fma(_2866, 0.114477999508380889892578125, _2868);
    bool _2882 = _1366 <= 0.0;
    bool _2884 = !_2878;
    bool _2886 = _2882 || _2884;
    float _2888 = -_2880;
    float _2890 = _2856 + _2888;
    float _2892 = -_2880;
    float _2894 = _2854 + _2892;
    float _2896 = -_2880;
    float _2898 = _2866 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    bool _2906 = !_2864;
    if (!_2906)
    {
        float _2908 = -_1250;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1252;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1254;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2422 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2436, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2444, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (!_2886)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_134);
        out.gl_Position.z = _3059;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_160);
        out.gl_Position.z = _3114;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _218 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = 1.0 / _242;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _254;
    float _262 = 1.0 / _250;
    float _264 = _222 * _256;
    bool _266 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_218);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_238;
    float _280 = _278 + 1.0;
    float _282 = _276 * _280;
    float _284 = _226 * _260;
    bool _286 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_218);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_276;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_296;
    float _324 = _322 + 1.0;
    float _326 = _246 * _262;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _312 * _324;
    float _338 = fma(_300, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = _296 * _316;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = _340 * _336;
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = _342 * _336;
    float _362 = _338 * _336;
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_348, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _378;
    float _382 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_368, _344, _364);
    float _390 = fma(_376, _264, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_380, _264, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_370, _344, _366);
    float _396 = fma(_386, _264, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_382, _344, _372);
    float _400 = fma(_390, _282, _388);
    float _402 = fma(_392, _282, _394);
    float _404 = fma(_396, _282, _398);
    float _406 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].x, _400);
    float _408 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].y, _402);
    float _410 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].z, _404);
    bool _412 = !_258;
    if (!_412)
    {
        float _414 = in.m_57.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _194 = _428;
    }
    float _430 = _194;
    float _432 = in.m_57.z;
    float _434 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _436 = log2(_434);
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _444 = int(_442);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = exp2(_450);
    float _460 = _438 * 2.0;
    float _462 = _440 * 2.0;
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _468 = _440 + _438;
    float _470 = floor(_456);
    float _472 = -_446;
    float _474 = fma(_464, 2.0, _472);
    float _476 = _440 + _432;
    float _478 = fma(_466, -2.0, _448);
    float _480 = _468 + (-1.0);
    float _482 = _476 + (-1.0);
    float _484 = float(_454);
    float _486 = floor(_460);
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _494 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _484 * _116;
    float _502 = -_116;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _474);
    float _506 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _508 = _470 >= 0.0;
    bool _510 = isnan(_470);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_462);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _530 = _528 != 0;
    int _532 = _516 ? 0 : 1;
    bool _534 = _486 > 0.0;
    float _536 = 1.0 / _498;
    bool _538 = !_526;
    int _540 = _538 ? 0 : 1;
    bool _542 = _470 > 0.0;
    bool _544 = !_522;
    int _546 = _544 ? 0 : 1;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    bool _558 = _486 >= 0.0;
    bool _560 = isnan(_486);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = _518 > 0.0;
    bool _570 = _518 >= 0.0;
    bool _572 = isnan(_518);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    int _580 = ~_532;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    int _586 = _584;
    float _588 = _506;
    if (!_542)
    {
        int _590 = ~_532;
        int _592 = _590 + 1;
        _586 = _592;
    }
    int _594 = _586;
    bool _596 = !_530;
    int _598 = _596 ? 0 : 1;
    float _600 = _556 ? _490 : 0.0;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(_444);
    float _620 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _622 = in.m_59.x;
    float _624 = in.m_59.y;
    float _626 = in.m_59.z;
    bool _628 = !_606;
    int _630 = _628 ? 0 : 1;
    float _632 = 1.0 / _618;
    int _634 = _566 ? 0 : 1;
    float _636 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _650 = float(_594);
    bool _652 = !_610;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _648);
    int _658 = abs(_630);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_658);
    int _668 = abs(_654);
    float _670 = _632 * _116;
    int _672 = _664;
    if (!_534)
    {
        int _674 = ~_634;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = _666 * _650;
    float _682 = float(_668);
    if (_646)
    {
        float _684 = _600 * _536;
        _126 = _684;
    }
    float _686 = _126;
    int _688 = _578 ? 0 : 1;
    float _690 = _680 * (-2.0);
    float _692 = float(_678);
    float _694 = _438 + (-0.5);
    float _696 = fma(_690, _622, _622);
    bool _698 = !_614;
    int _700 = _698 ? 0 : 1;
    float _702 = _682 * _692;
    float _704 = fma(_494, _690, _494);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    int _714 = _710;
    if (!_568)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _702 * (-2.0);
    int _724 = abs(_700);
    float _726 = fma(_704, _686, _712);
    float _728 = _440 + (-0.5);
    float _730 = fma(_722, _624, _624);
    float _732 = float(_720);
    float _734 = fma(_492, _722, _492);
    float _736 = float(_724);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = _432 + _438;
    float _742 = _432 + (-0.5);
    float _744 = _736 * _732;
    float _746 = _740 + (-1.0);
    float _748 = fma(_734, _686, _738);
    float _750 = _726 * 0.15915493667125701904296875;
    float _752 = _744 * (-2.0);
    float _754 = in.m_61.x;
    float _756 = in.m_61.y;
    float _758 = in.m_61.z;
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _750 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_752, _626, _626);
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = fma(_760, _752, _760);
    float _776 = _748 * 0.15915493667125701904296875;
    float _778 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _780 = _750 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = fma(_774, _686, _778);
    float _786 = _776 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _784 * 0.15915493667125701904296875;
    float _792 = _406 * _754;
    float _794 = _410 * _758;
    float _796 = _776 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = _408 * _756;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _804 = in.m_46.x;
    float _806 = in.m_46.y;
    float _808 = in.m_46.z;
    float _810 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _814 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _818 = _790 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _824 = _810 * _802;
    float _826 = _814 * _812;
    float _828 = _782 * _788;
    float _830 = _822 * _816;
    float _832 = _764 * _788;
    float _834 = _790 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _782 * _798;
    float _840 = _764 * _798;
    float _842 = _782 * _820;
    float _844 = _764 * _820;
    float _846 = _798 * _820;
    float _848 = _788 * _820;
    float _850 = _842 * _830;
    float _852 = _844 * _830;
    float _854 = fma(_836, _838, _832);
    float _856 = -_828;
    float _858 = fma(_836, _840, _856);
    float _860 = -_840;
    float _862 = fma(_836, _828, _860);
    float _864 = -_830;
    float _866 = _836 * _864;
    float _868 = fma(_854, _824, _850);
    float _870 = fma(_836, _832, _838);
    float _872 = fma(_858, _824, _852);
    float _874 = fma(_846, _824, _866);
    float _876 = fma(_862, _826, _868);
    float _878 = _806 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_870, _826, _872);
    float _882 = fma(_848, _826, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = _806 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _888 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _886);
    float _896 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _912 = _806 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _904 + _908;
    float _918 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _920 = _910 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _930 = _920 + _928;
    float _932 = _924 * _924;
    float _934 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _936 = fma(_930, _930, _932);
    float _938 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _940 = sqrt(_936);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _938);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _946 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _948 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[11].x, _944);
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _952 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[11].z, _948);
    float _954 = _934 + _950;
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _946;
    float _960 = _948;
    float _962 = _950;
    float _964 = _936;
    float _966 = _940;
    float _968 = _934;
    float _970 = _910;
    if (!_956)
    {
        _958 = _920;
    }
    float _972 = _958;
    float _974 = _972;
    if (!_956)
    {
        _960 = _916;
    }
    float _976 = _960;
    float _978 = _976;
    if (!_956)
    {
        _962 = _954;
    }
    float _980 = _962;
    bool _982 = !_956;
    float _984 = _980;
    if (!_982)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _990 = _940 + _988;
        float _992 = rsqrt(_936);
        float _994 = _990 * _986;
        float _996 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * 0.15915493667125701904296875;
        float _1000 = _998 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 + (-1.0);
        float _1010 = fma(_1006, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _992 * _1010;
        float _1016 = fma(_954, _1002, _1012);
        float _1018 = fma(_930, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1020 = fma(_924, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1016;
        _974 = _1018;
        _978 = _1020;
        _964 = _992;
    }
    float _1022 = _984;
    float _1024 = _974;
    float _1026 = _978;
    float _1028 = _964;
    float _1030 = -_934;
    float _1032 = _1030 + _1022;
    float _1034 = _952 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1036 = -_910;
    float _1038 = _1036 + _1024;
    float _1040 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = _1032 * _1032;
    float _1044 = -_904;
    float _1046 = _1044 + _1026;
    float _1048 = 1.0 / _1034;
    float _1050 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1052 = fma(_1038, _1038, _1042);
    float _1054 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1050);
    float _1056 = fma(_1046, _1046, _1052);
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = sqrt(_1056);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = _1068 + _1034;
    float _1084 = _1082 * _1048;
    float _1086 = _1084 * 0.5;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1088);
    bool _1092 = _1070 > 0.0;
    float _1094 = 1.0 / _1090;
    float _1096 = _1028;
    float _1098 = _1070;
    float _1100 = _1024;
    float _1102 = _1034;
    float _1104 = _1022;
    float _1106 = _1026;
    float _1108 = _1056;
    if (!_1092)
    {
        _1096 = _1022;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    float _1114 = _1110;
    if (!_1092)
    {
        _1098 = _1026;
    }
    float _1116 = _1098;
    bool _1118 = !_1092;
    float _1120 = _1116;
    if (!_1118)
    {
        float _1122 = _188 * _188;
        float _1124 = fma(_186, _186, _1122);
        float _1126 = rsqrt(_1056);
        float _1128 = fma(_190, _190, _1124);
        float _1130 = sqrt(_1128);
        float _1132 = _1038 * _1126;
        float _1134 = _1032 * _1126;
        float _1136 = _1046 * _1126;
        bool _1138 = _1130 > 0.0;
        float _1140 = _1130;
        _1102 = _1134;
        _966 = _1128;
        if (!_1138)
        {
            _1112 = _1022;
        }
        float _1142 = _1112;
        _1114 = _1142;
        if (!_1138)
        {
            _1140 = _1026;
        }
        float _1144 = _1140;
        bool _1146 = !_1138;
        _1120 = _1144;
        if (!_1146)
        {
            float _1148 = rsqrt(_1128);
            float _1150 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1152 = _188 * _1148;
            float _1154 = _186 * _1148;
            float _1156 = _1134 * _1152;
            float _1158 = _190 * _1148;
            float _1160 = fma(_1132, _1154, _1156);
            float _1162 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1164 = fma(_1136, _1158, _1160);
            float _1166 = _1164 * _1162;
            float _1168 = fma(_186, _1166, _1024);
            float _1170 = fma(_188, _1166, _1022);
            float _1172 = fma(_190, _1166, _1026);
            _1100 = _1168;
            _1114 = _1170;
            _1120 = _1172;
            _966 = _1148;
        }
    }
    float _1174 = _1100;
    float _1176 = _1114;
    float _1178 = _1120;
    float _1180 = _1102;
    float _1182 = _966;
    float _1184 = _1178;
    float _1186 = _1180;
    if (_1080)
    {
        _1104 = 1.0;
    }
    float _1188 = _1104;
    float _1190 = _1188;
    if (_1066)
    {
        _1106 = _1174;
    }
    float _1192 = _1106;
    float _1194 = _1192;
    if (_1066)
    {
        _196 = _1176;
    }
    float _1196 = _196;
    float _1198 = _1196;
    if (!_1066)
    {
        float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1202 = _934 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1206 = _910 + _1204;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1210 = -_934;
        float _1212 = _1210 + _1176;
        float _1214 = _1202 * _1202;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1218 = _904 + _1216;
        float _1220 = -_904;
        float _1222 = _1220 + _1178;
        float _1224 = fma(_1206, _1206, _1214);
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1228 = fma(_1218, _1218, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1234 = precise::min(_1230, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1236 = _1234 * _1226;
        float _1238 = _1232 * _1236;
        float _1240 = -_910;
        float _1242 = _1240 + _1174;
        float _1244 = fma(_1212, _1238, _934);
        float _1246 = fma(_1242, _1238, _910);
        float _1248 = fma(_1222, _1238, _904);
        _1198 = _1244;
        _1194 = _1246;
        _1184 = _1248;
    }
    float _1250 = _1198;
    float _1252 = _1194;
    float _1254 = _1184;
    if (_1080)
    {
        _968 = 1.0;
    }
    float _1256 = _968;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1260 = _1094 * _1258;
    float _1262 = _1256;
    if (!_1080)
    {
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1266 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        float _1278 = _1268 * 0.15915493667125701904296875;
        float _1280 = _1266 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = 1.0 / _1276;
        float _1286 = _1278 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        float _1290 = _1282 * _1284;
        float _1292 = _1278 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        float _1296 = _1288 * _1290;
        float _1298 = 1.0 / _1272;
        float _1300 = 1.0 / _1296;
        float _1302 = _1294 * _1300;
        float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1306 = fma(_1260, _1302, _1304);
        float _1308 = _1306 * _1298;
        float _1310 = precise::clamp(_1308, 0.0, 1.0);
        _1190 = _1310;
    }
    float _1312 = _1190;
    if (!_1080)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1260, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1262 = _1364;
    }
    float _1366 = _1262;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1250 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1252 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1254 + _1376;
    float _1380 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1370 * _1370;
    float _1384 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1386 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1374, _1374, _1382);
    float _1390 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = fma(_1378, _1378, _1388);
    float _1394 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = rsqrt(_1392);
    float _1398 = sqrt(_1392);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1402 = _1374 * _1400;
    float _1404 = _1378 * _1400;
    float _1406 = _1402 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1388;
    float _1422 = _1410;
    float _1424 = _1418;
    float _1426 = _1402;
    float _1428 = _1404;
    float _1430 = _1406;
    float _1432 = _1408;
    if (_1414)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1434;
    }
    float _1436 = _1420;
    if (_1414)
    {
        float _1438 = rsqrt(_1410);
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1414)
    {
        float _1442 = _1418 * _1436;
        _1424 = _1442;
    }
    float _1444 = _1424;
    if (_1414)
    {
        float _1446 = _1444 * 0.15915493667125701904296875;
        _1186 = _1446;
    }
    float _1448 = _1186;
    float _1450 = _1436;
    if (_1414)
    {
        float _1452 = _1448 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1460 = precise::max(0.0, _1458);
    float _1462 = _1182;
    if (_1414)
    {
        float _1464 = _1448 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = -_1400;
    float _1472 = -_1460;
    float _1474 = fma(_1370, _1470, _1472);
    if (_1414)
    {
        float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1476;
    }
    float _1478 = _1108;
    float _1480 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1484 = _1456;
    float _1486 = _1478;
    if (_1414)
    {
        float _1488 = fma(_1456, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1488;
    }
    float _1490 = _1484;
    float _1492 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1494 = floor(_1482);
    float _1496 = _1490;
    if (_1414)
    {
        float _1498 = _1468 + (-1.0);
        _970 = _1498;
    }
    float _1500 = _970;
    float _1502 = _1500;
    if (_1414)
    {
        float _1504 = _1440 * _1490;
        _1486 = _1504;
    }
    float _1506 = _1486;
    if (!_1414)
    {
        _1496 = _1474;
    }
    float _1508 = _1496;
    float _1510 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1512 = _1508;
    if (_1414)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1514;
    }
    float _1516 = _1502;
    if (_1414)
    {
        float _1518 = _1402 * _1506;
        _1426 = _1518;
    }
    float _1520 = _1426;
    if (_1414)
    {
        float _1522 = _1404 * _1506;
        _1428 = _1522;
    }
    float _1524 = _1428;
    float _1526 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (_1414)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1512 = _1528;
    }
    float _1530 = _1512;
    if (_1414)
    {
        float _1532 = _1520 * _1520;
        _1430 = _1532;
    }
    float _1534 = _1430;
    if (_1414)
    {
        float _1536 = _1524 * _1524;
        _1432 = _1536;
    }
    float _1538 = _1432;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1542 = fma(_1530, _1530, _1534);
    float _1544 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1548 = _1542 + _1538;
    float _1550 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1554 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1552);
    float _1556 = precise::clamp(_1554, 0.0, 1.0);
    float _1558 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1560 = -_1494;
    float _1562 = _1482 + _1560;
    float _1564 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1566 = rsqrt(_1548);
    float _1568 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1384);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1568);
    float _1580 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = abs(_1572);
    float _1584 = log2(_1582);
    float _1586 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1540);
    float _1588 = -_1544;
    float _1590 = fma(_1588, _1546, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1596 = _1566 * _1520;
    float _1598 = _1566 * _1530;
    float _1600 = _1566 * _1524;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1594);
    float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1606 = floor(_1558);
    float _1608 = -_1604;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1620 = log2(_1590);
    float _1622 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = fma(_1618, 0.5, 0.5);
    float _1628 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1622);
    float _1630 = exp2(_1612);
    float _1632 = -_1606;
    float _1634 = _1558 + _1632;
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = _1598 + 1.0;
    float _1640 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1642 = 1.0 / _1602;
    float _1644 = fma(_1626, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1620 * 0.693147182464599609375;
    float _1648 = fma(_1626, _1644, -0.212114393711090087890625);
    float _1650 = sqrt(_1624);
    float _1652 = -_1598;
    float _1654 = fma(_1630, _1638, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1628);
    float _1660 = fma(_1626, _1648, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1642;
    float _1666 = _1658 * _1642;
    float _1668 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1650 * 0.636619746685028076171875;
    float2 _5483 = float2(_1562, _1634);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).x;
    float _1678 = -_1660;
    float _1680 = fma(_1674, _1678, 1.0);
    float3 _5499 = float3(_1670, _1672, _1668);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).x;
    float3 _5510 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5526 = float2(_1680, _1662);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = float(uint(_454));
    float _1707 = trunc(_670);
    int _1709 = int(_1707);
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    float _1715 = _500 * _168;
    bool _1717 = _454 == 0;
    int _1719 = abs(_540);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1705;
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1729 = _1727 != 0;
    float _1731 = float(uint(_1709));
    bool _1733 = !_1729;
    float _1735 = _1733 ? 7.345489978790283203125 : 1.0;
    int _1737 = as_type<int>(_1725) + (-2);
    float _1739 = _1735 * _438;
    float _1741 = float(_1709);
    float _1743 = as_type<float>(_1737) * _1731;
    float _1745 = floor(_1739);
    bool _1747 = _1741 >= _484;
    bool _1749 = isnan(_1741);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(_484);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = trunc(_1743);
    float _1761 = precise::max(_1759, 0.0);
    uint _1764 = uint(_1761);
    float _1766 = trunc(_1757);
    int _1768 = int(_1766);
    int _1770 = ~_454;
    int _1772 = _1770 + 1;
    int _1774 = _1713 * int(_1764);
    int _1776 = _1774 + _1709;
    float _1778 = float(uint(_1776));
    float _1780 = as_type<float>(_1737) * _1778;
    float _1782 = trunc(_1780);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = int(_1764) + int(_1786);
    int _1790 = _1772 * _1788;
    int _1792 = _1790 + _1709;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1745;
    float _1798 = _1739 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _484;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1808 = _1806 != 0;
    int _1810 = ~_1788;
    int _1812 = _1810 + _1802;
    int _1814 = _1812 + 1;
    bool _1816 = !_1808;
    int _1818 = _1816 ? 0 : 1;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _440 > 0.5;
    int _1826 = _454 * _1814;
    int _1828 = _1826 + _1709;
    int _1830 = abs(_1818);
    int _1832 = ~_1768;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    bool _1838 = !_1717;
    int _1840 = _1838 ? _1828 : (-1);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1844 = _1842 != 0;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    int _1850 = _1840 * _1836;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1854 = _1852 != 0;
    float _1856 = trunc(_1715);
    int _1858 = int(_1856);
    int _1860 = _454 + (-1);
    int _1862 = _1822 * _1830;
    int _1864 = _1862 + _1709;
    int _1866 = _1768 * _1860;
    int _1868 = _1866 + _1850;
    int _1870 = abs(_546);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1876 = in.m_67.y;
    int _1878 = _1868 * _1719;
    int _1880 = abs(_598);
    bool _1882 = !_1723;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1858 * _1870;
    int _1888 = _1886 + _1878;
    float _1890 = 1.0 / _1874;
    int _1892 = abs(_1884);
    int _1894 = _1864 * _1880;
    int _1896 = _1894 + _1888;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1902 = _1822 * _1892;
    int _1904 = _1902 + _1896;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1910 = as_type<float>(_1822);
    if (_1844)
    {
        float _1912 = in.m_57.x;
        _1910 = _1912;
    }
    float _1914 = _1910;
    float _1916 = 1.0 / _1900;
    float _1918 = float(uint(_1904));
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = as_type<float>(_1737) * _1918;
    float _1926 = -_1876;
    float _1928 = _1926 + 1.0;
    float _1930 = 1.0 / _1908;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1938 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1876;
    if (_1848)
    {
        float _1942 = _1824 ? _1928 : _1876;
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1946;
    float _1950 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = trunc(_1924);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1934 * _1916;
    float _1962 = _1948 * _1890;
    float _1964 = in.m_67.x;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1966;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    bool _1982 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_430);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    out.m_69.x = _1938;
    out.m_69.y = _1950;
    out.m_69.z = _1952;
    int _1994 = ~_454;
    int _1996 = _1994 + 1;
    float _1998 = _1968 * _1930;
    bool _2000 = _1914 > 0.5;
    bool _2002 = _2000 && _1844;
    float _2004 = -_1992;
    float _2006 = _2004 + 1.0;
    bool _2008 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2010 = isnan(_430);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    bool _2020 = _770 != 0.0;
    bool _2022 = isnan(_770);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    int _2030 = _1996 * int(_1958);
    int _2032 = _2030 + _1904;
    bool _2034 = _768 == 0.0;
    bool _2036 = !_2028;
    bool _2038 = _2034 && _2036;
    float _2040 = -_1980;
    float _2042 = _2040 + 1.0;
    bool _2044 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_430);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2058 = float(uint(_2032));
    float _2060 = _1992 * _2042;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2064 = _430 + _2062;
    float _2066 = _2054 * _2006;
    float _2068 = -_2054;
    float _2070 = _2068 + 1.0;
    float _2072 = -_506;
    float _2074 = fma(_656, _2056, _2072);
    float _2076 = fma(_1962, _2064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2078 = float(uint(_1864));
    float _2080 = _2018 * _2070;
    float _2082 = as_type<float>(_1737) * _2058;
    float _2084 = in.m_71.x;
    float _2086 = in.m_71.y;
    float _2088 = in.m_71.z;
    float _2090 = _1964;
    if (_1844)
    {
        _588 = _1964;
    }
    float _2092 = _588;
    float _2094 = _2076 * _2080;
    float _2096 = as_type<float>(_1737) * _2078;
    float _2098 = trunc(_2082);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2106 = _430 + _2104;
    float _2108 = _2092;
    if (_2002)
    {
        float _2110 = -_2092;
        float _2112 = _2110 + 1.0;
        _2108 = _2112;
    }
    float _2114 = _2108;
    bool _2116 = _772 == 0.0;
    bool _2118 = _2116 && _2038;
    float _2120 = fma(_1998, _2106, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1844)
    {
        _2090 = _2114;
    }
    float _2122 = _2090;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2126 = _430 + _2124;
    float _2128 = -_2018;
    float _2130 = _2128 + 1.0;
    int _2132 = ~_454;
    int _2134 = _2132 + 1;
    float _2136 = trunc(_2096);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = fma(_1960, _2126, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2144 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2094);
    int _2146 = ~_454;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2152 = int(_1958) + int(_2102);
    float _2154 = fma(_2142, _2066, _2144);
    float _2156 = _2084;
    float _2158 = _2086;
    float _2160 = _2088;
    if (!_2118)
    {
        float _2162 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (!_2118)
    {
        float _2166 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2158 = _2166;
    }
    float _2168 = _2158;
    if (!_2118)
    {
        float _2170 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2160 = _2170;
    }
    float _2172 = _2160;
    float _2174 = fma(_2120, _2060, _2154);
    float _2176 = fma(_636, _2150, _504);
    int _2178 = ~_454;
    int _2180 = _2178 + 1;
    int _2182 = _2148 * _2152;
    int _2184 = _2182 + _1904;
    float _2186 = abs(_1260);
    float _2188 = log2(_2186);
    int _2190 = _2134 * int(_2140);
    int _2192 = _2190 + _1864;
    float _2194 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2174);
    float _2196 = _2176 + 0.5;
    bool _2198 = uint(_2184) >= uint(_454);
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2202 = float(uint(_2192));
    float _2204 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2206 = as_type<float>(_1737) * _2202;
    bool _2208 = !_2198;
    int _2210 = _2208 ? 0 : (-1);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2216 = ~_2152;
    int _2218 = _2216 + _2210;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2206);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2074 + 0.5;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2234 = _454 * _2220;
    int _2236 = _2234 + _1904;
    float _2238 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2196;
    out.m_73.y = _2230;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2244 = !_1717;
    int _2246 = _2244 ? _2236 : (-1);
    float _2248 = exp2(_2232);
    float _2250 = _862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2238;
    out.m_75.y = _2240;
    out.m_75.z = _2242;
    out.m_75.w = _2200;
    int _2252 = _2246 & 3;
    bool _2254 = _2252 != 0;
    float _2256 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    int _2258 = int(_2140) + int(_2226);
    int _2260 = _2246 >> 31;
    float _2262 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = _2260 & 3;
    float _2266 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = -_836;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2272 = _2246 + _2264;
    float _2274 = -_836;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2204);
    float _2278 = -_836;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2284 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2276);
    int _2288 = _2272 >> 2;
    float _2290 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2294 = precise::clamp(_2292, 0.0, 1.0);
    float _2296 = _862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2298 = _2288 << 4;
    int _2300 = _2298 + 368;
    float _2302 = _862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    uint _2308 = uint(int(uint(_2300) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2326 = _2282 * _2168;
    float _2328 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2180 * _2258;
    int _2332 = _2330 + _1864;
    float _2334 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2336 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2338 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2340 = _2300 + 8;
    uint _2342 = uint(int(uint(_2340) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = _2286 * _2168;
    int _2360 = _2246 & 3;
    bool _2362 = _2360 != 0;
    float _2364 = _2304 * _2168;
    bool _2366 = uint(_2332) >= uint(_454);
    float _2368 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    bool _2370 = uint(_2360) > 1u;
    float _2372 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    int _2374 = _2254 ? 0 : 1;
    float _2376 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    bool _2378 = _2360 != 3;
    float _2380 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2382 = fma(_2294, -2.0, 3.0);
    float _2384 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2336);
    float _2386 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2256);
    float _2388 = _2294 * _2294;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2372, _2164, _2358);
    bool _2396 = uint(_2360) >= 2u;
    float _2398 = _2388 * _2382;
    int _2400 = ~_2374;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2376, _2164, _2364);
    int _2408 = _2404;
    if (!_2370)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2368, _2164, _2326);
    bool _2418 = !_2362;
    int _2420 = _2418 ? 0 : 1;
    float _2422 = fma(_2384, _2172, _2394);
    int _2424 = _2396 ? 0 : 1;
    float _2426 = in.m_77.x;
    bool _2428 = _2360 != 3;
    float _2430 = -_1676;
    float _2432 = _2430 + 1.0;
    int _2434 = abs(_2414);
    float _2436 = fma(_2380, _2172, _2416);
    int _2438 = ~_2258;
    int _2440 = _2438 + _2392;
    int _2442 = _2440 + 1;
    float _2444 = fma(_2386, _2172, _2406);
    int _2446 = abs(_2420);
    int _2448 = ~_2424;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = _454 * _2442;
    int _2456 = _2454 + _1864;
    bool _2458 = !_2428;
    int _2460 = _2458 ? 0 : (-1);
    out.m_79.x = _2436;
    out.m_79.y = _2422;
    out.m_79.z = _2444;
    int _2462 = _2452;
    if (_2378)
    {
        int _2464 = ~_2424;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    int _2470 = ~_2434;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    bool _2476 = !_1854;
    int _2478 = _2476 ? 0 : 1;
    int _2480 = abs(_2460);
    int _2482 = _2474 * as_type<int>(_2322);
    int _2484 = abs(_2468);
    int _2486 = ~_2446;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    int _2492 = abs(_2478);
    int _2494 = _2490 * as_type<int>(_2314);
    int _2496 = _2494 + _2482;
    int _2498 = ~_2484;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = ~_2480;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2502 * as_type<int>(_2348);
    int _2512 = _2510 + _2496;
    int _2514 = ~_2492;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2522 = _2508 * as_type<int>(_2356);
    int _2524 = _2522 + _2512;
    float _2526 = -_2398;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    bool _2532 = !_1717;
    int _2534 = _2532 ? _2456 : (-1);
    int _2536 = _2524 * _2518;
    float _2538 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    float _2542 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2398);
    float _2544 = _1602 * 0.5;
    int _2546 = _2534 * _2492;
    int _2548 = _2546 + _2536;
    float _2550 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2540);
    float _2552 = exp2(_2538);
    bool _2554 = _1260 <= 8000.0;
    bool _2556 = isnan(_1260);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(8000.0);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_1658, -0.5, _2544);
    float _2568 = float(_2548);
    float _2570 = _2550 + _1602;
    float _2572 = _1656 + _1602;
    float _2574 = _2564 * _2542;
    float _2576 = _2570 * 0.5;
    float _2578 = _2572 * 0.5;
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1602;
    bool _2582 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2584 = isnan(_1398);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2590 = _2586 || _2588;
    float _2592 = _2432 * _2580;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    out.m_81.x = _2578;
    out.m_81.y = _2566;
    out.m_81.z = _2576;
    out.m_81.w = _1602;
    float _2596 = -_2552;
    float _2598 = _2596 + 1.0;
    float _2600 = -_2594;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2568;
    float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2606 = _2602 * _2426;
    float _2608 = _2604 * _1682;
    float _2610 = _2568;
    float _2612 = _2578;
    if (!_2590)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2610;
    float _2616 = _1693 * _2608;
    float _2618 = _1703 * _2608;
    float _2620 = -_2604;
    float _2622 = _2620 + 1.0;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = fma(_1699, _2616, _1687);
    float _2628 = fma(_1701, _2616, _1689);
    float _2630 = _1693 * _2622;
    float _2632 = fma(_1693, _2618, _1691);
    out.m_85.x = _2624;
    float _2634 = _1312 * _1366;
    float _2636 = _2616;
    float _2638 = _2618;
    float _2640 = _2622;
    float _2642 = _2634;
    float _2644 = _2614;
    float _2646 = _2614;
    if (!_2590)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2648 = _2612;
    out.m_87.x = _2626;
    out.m_87.y = _2628;
    out.m_87.z = _2632;
    out.m_87.w = _2630;
    float _2650 = _2634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2652 = _2648;
    float _2654 = _2648;
    if (!_2590)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _2636;
    float _2658 = _2656;
    float _2660 = _2656;
    if (!_2590)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2662 = _2638;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2590)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2668 = _2640;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2590)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2674 = _2642;
    bool _2676 = !_2590;
    float _2678 = _2674;
    float _2680 = _2674;
    if (!_2676)
    {
        bool _2682 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2684 = isnan(_1398);
        bool _2686 = _2682 || _2684;
        bool _2688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2690 = _2686 || _2688;
        if (!_2690)
        {
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2694 = _1398 + _2692;
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = 1.0 / _2698;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2722 = _2694 * _2704;
            float _2724 = precise::clamp(_2722, 0.0, 1.0);
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = fma(_2724, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2732 = fma(_2724, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2724, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2724, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2738 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2740 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2660 = _2734;
            _2672 = _2738;
            _2654 = _2730;
            _2666 = _2736;
            _2646 = _2732;
            _2680 = _2740;
            _2742 = true;
        }
        else
        {
            bool _2744 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2746 = isnan(_1398);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2754 = _2652;
            _2654 = _2754;
            if (!_2752)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2756 = _2658;
            _2660 = _2756;
            if (!_2752)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2758 = _2644;
            _2646 = _2758;
            if (!_2752)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2760 = _2664;
            _2666 = _2760;
            if (!_2752)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2762 = _2670;
            _2672 = _2762;
            if (!_2752)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2764 = _2678;
            bool _2766 = !_2752;
            _2680 = _2764;
            if (!_2766)
            {
                bool _2768 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2770 = isnan(_1398);
                bool _2772 = _2768 || _2770;
                bool _2774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2776 = _2772 || _2774;
                if (!_2776)
                {
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2780 = _1398 + _2778;
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = 1.0 / _2784;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2808 = _2780 * _2790;
                    float _2810 = precise::clamp(_2808, 0.0, 1.0);
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = fma(_2810, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2818 = fma(_2810, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2810, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2822 = fma(_2810, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2824 = fma(_2810, _2802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2826 = fma(_2810, _2806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2660 = _2820;
                    _2672 = _2824;
                    _2654 = _2816;
                    _2666 = _2822;
                    _2646 = _2818;
                    _2680 = _2826;
                    _2742 = true;
                }
                else
                {
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2742 = false;
    float _2828 = _2660;
    float _2830 = _2672;
    float _2832 = _2654;
    float _2834 = _2666;
    float _2836 = _2646;
    float _2838 = _2680;
    float _2840 = fma(_2422, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2828;
    float _2846 = _2844 + _2830;
    float _2848 = _2650 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2850 = -_2832;
    float _2852 = _2850 + _2834;
    out.m_89.x = 0.0;
    float _2854 = fma(_2842, _2846, _2828);
    float _2856 = fma(_2842, _2852, _2832);
    out.m_53.x = _2848;
    float _2858 = -_2836;
    float _2860 = _2858 + _2838;
    float _2862 = _2854 * 0.586610972881317138671875;
    bool _2864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2866 = fma(_2842, _2860, _2836);
    float _2868 = fma(_2856, 0.298911988735198974609375, _2862);
    bool _2870 = _1312 > 0.0;
    bool _2872 = isnan(_1312);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    float _2880 = fma(_2866, 0.114477999508380889892578125, _2868);
    bool _2882 = _1366 <= 0.0;
    bool _2884 = !_2878;
    bool _2886 = _2882 || _2884;
    float _2888 = -_2880;
    float _2890 = _2856 + _2888;
    float _2892 = -_2880;
    float _2894 = _2854 + _2892;
    float _2896 = -_2880;
    float _2898 = _2866 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    bool _2906 = !_2864;
    if (!_2906)
    {
        float _2908 = -_1250;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1252;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1254;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2422 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2436, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2444, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (!_2886)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_134);
        out.gl_Position.z = _3059;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_160);
        out.gl_Position.z = _3114;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _218 + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _254 = _252 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = 1.0 / _242;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _254;
    float _262 = 1.0 / _250;
    float _264 = _222 * _256;
    bool _266 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_218);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_238;
    float _280 = _278 + 1.0;
    float _282 = _276 * _280;
    float _284 = _226 * _260;
    bool _286 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_218);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -_276;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_296;
    float _324 = _322 + 1.0;
    float _326 = _246 * _262;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _312 * _324;
    float _338 = fma(_300, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = _296 * _316;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = _340 * _336;
    float _352 = -_312;
    float _354 = _352 + 1.0;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = _342 * _336;
    float _362 = _338 * _336;
    float _364 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _366 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_348, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _378;
    float _382 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_368, _344, _364);
    float _390 = fma(_376, _264, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_380, _264, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_370, _344, _366);
    float _396 = fma(_386, _264, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_382, _344, _372);
    float _400 = fma(_390, _282, _388);
    float _402 = fma(_392, _282, _394);
    float _404 = fma(_396, _282, _398);
    float _406 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].x, _400);
    float _408 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].y, _402);
    float _410 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[146].z, _404);
    bool _412 = !_258;
    if (!_412)
    {
        float _414 = in.m_57.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _194 = _428;
    }
    float _430 = _194;
    float _432 = in.m_57.z;
    float _434 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _436 = log2(_434);
    float _438 = in.m_57.x;
    float _440 = in.m_57.y;
    float _442 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _444 = int(_442);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = exp2(_450);
    float _460 = _438 * 2.0;
    float _462 = _440 * 2.0;
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _468 = _440 + _438;
    float _470 = floor(_456);
    float _472 = -_446;
    float _474 = fma(_464, 2.0, _472);
    float _476 = _440 + _432;
    float _478 = fma(_466, -2.0, _448);
    float _480 = _468 + (-1.0);
    float _482 = _476 + (-1.0);
    float _484 = float(_454);
    float _486 = floor(_460);
    float _488 = -_458;
    float _490 = _488 + 1.0;
    float _492 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _494 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _484 * _116;
    float _502 = -_116;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _474);
    float _506 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    bool _508 = _470 >= 0.0;
    bool _510 = isnan(_470);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_462);
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _530 = _528 != 0;
    int _532 = _516 ? 0 : 1;
    bool _534 = _486 > 0.0;
    float _536 = 1.0 / _498;
    bool _538 = !_526;
    int _540 = _538 ? 0 : 1;
    bool _542 = _470 > 0.0;
    bool _544 = !_522;
    int _546 = _544 ? 0 : 1;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    bool _558 = _486 >= 0.0;
    bool _560 = isnan(_486);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    bool _568 = _518 > 0.0;
    bool _570 = _518 >= 0.0;
    bool _572 = isnan(_518);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    int _580 = ~_532;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    int _586 = _584;
    float _588 = _506;
    if (!_542)
    {
        int _590 = ~_532;
        int _592 = _590 + 1;
        _586 = _592;
    }
    int _594 = _586;
    bool _596 = !_530;
    int _598 = _596 ? 0 : 1;
    float _600 = _556 ? _490 : 0.0;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _618 = float(_444);
    float _620 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _602);
    float _622 = in.m_59.x;
    float _624 = in.m_59.y;
    float _626 = in.m_59.z;
    bool _628 = !_606;
    int _630 = _628 ? 0 : 1;
    float _632 = 1.0 / _618;
    int _634 = _566 ? 0 : 1;
    float _636 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _616);
    float _650 = float(_594);
    bool _652 = !_610;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _648);
    int _658 = abs(_630);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_658);
    int _668 = abs(_654);
    float _670 = _632 * _116;
    int _672 = _664;
    if (!_534)
    {
        int _674 = ~_634;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = _666 * _650;
    float _682 = float(_668);
    if (_646)
    {
        float _684 = _600 * _536;
        _126 = _684;
    }
    float _686 = _126;
    int _688 = _578 ? 0 : 1;
    float _690 = _680 * (-2.0);
    float _692 = float(_678);
    float _694 = _438 + (-0.5);
    float _696 = fma(_690, _622, _622);
    bool _698 = !_614;
    int _700 = _698 ? 0 : 1;
    float _702 = _682 * _692;
    float _704 = fma(_494, _690, _494);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    int _714 = _710;
    if (!_568)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _702 * (-2.0);
    int _724 = abs(_700);
    float _726 = fma(_704, _686, _712);
    float _728 = _440 + (-0.5);
    float _730 = fma(_722, _624, _624);
    float _732 = float(_720);
    float _734 = fma(_492, _722, _492);
    float _736 = float(_724);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = _432 + _438;
    float _742 = _432 + (-0.5);
    float _744 = _736 * _732;
    float _746 = _740 + (-1.0);
    float _748 = fma(_734, _686, _738);
    float _750 = _726 * 0.15915493667125701904296875;
    float _752 = _744 * (-2.0);
    float _754 = in.m_61.x;
    float _756 = in.m_61.y;
    float _758 = in.m_61.z;
    float _760 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _750 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_752, _626, _626);
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = fma(_760, _752, _760);
    float _776 = _748 * 0.15915493667125701904296875;
    float _778 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _780 = _750 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = fma(_774, _686, _778);
    float _786 = _776 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _784 * 0.15915493667125701904296875;
    float _792 = _406 * _754;
    float _794 = _410 * _758;
    float _796 = _776 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = _408 * _756;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _804 = in.m_46.x;
    float _806 = in.m_46.y;
    float _808 = in.m_46.z;
    float _810 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _814 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _818 = _790 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _824 = _810 * _802;
    float _826 = _814 * _812;
    float _828 = _782 * _788;
    float _830 = _822 * _816;
    float _832 = _764 * _788;
    float _834 = _790 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _782 * _798;
    float _840 = _764 * _798;
    float _842 = _782 * _820;
    float _844 = _764 * _820;
    float _846 = _798 * _820;
    float _848 = _788 * _820;
    float _850 = _842 * _830;
    float _852 = _844 * _830;
    float _854 = fma(_836, _838, _832);
    float _856 = -_828;
    float _858 = fma(_836, _840, _856);
    float _860 = -_840;
    float _862 = fma(_836, _828, _860);
    float _864 = -_830;
    float _866 = _836 * _864;
    float _868 = fma(_854, _824, _850);
    float _870 = fma(_836, _832, _838);
    float _872 = fma(_858, _824, _852);
    float _874 = fma(_846, _824, _866);
    float _876 = fma(_862, _826, _868);
    float _878 = _806 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_870, _826, _872);
    float _882 = fma(_848, _826, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = _806 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _888 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[4].x, _886);
    float _896 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _894);
    float _904 = _896 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = _902 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _912 = _806 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _904 + _908;
    float _918 = fma(_804, (*spvDescriptorSet0.vp_c10)._m0[5].x, _912);
    float _920 = _910 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = fma(_808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _930 = _920 + _928;
    float _932 = _924 * _924;
    float _934 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _936 = fma(_930, _930, _932);
    float _938 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _940 = sqrt(_936);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _938);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _946 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _942);
    float _948 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[11].x, _944);
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _952 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[11].z, _948);
    float _954 = _934 + _950;
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _946;
    float _960 = _948;
    float _962 = _950;
    float _964 = _936;
    float _966 = _940;
    float _968 = _934;
    float _970 = _910;
    if (!_956)
    {
        _958 = _920;
    }
    float _972 = _958;
    float _974 = _972;
    if (!_956)
    {
        _960 = _916;
    }
    float _976 = _960;
    float _978 = _976;
    if (!_956)
    {
        _962 = _954;
    }
    float _980 = _962;
    bool _982 = !_956;
    float _984 = _980;
    if (!_982)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _990 = _940 + _988;
        float _992 = rsqrt(_936);
        float _994 = _990 * _986;
        float _996 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * 0.15915493667125701904296875;
        float _1000 = _998 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        float _1008 = _1002 + (-1.0);
        float _1010 = fma(_1006, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _992 * _1010;
        float _1016 = fma(_954, _1002, _1012);
        float _1018 = fma(_930, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1020 = fma(_924, _1014, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1016;
        _974 = _1018;
        _978 = _1020;
        _964 = _992;
    }
    float _1022 = _984;
    float _1024 = _974;
    float _1026 = _978;
    float _1028 = _964;
    float _1030 = -_934;
    float _1032 = _1030 + _1022;
    float _1034 = _952 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1036 = -_910;
    float _1038 = _1036 + _1024;
    float _1040 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1042 = _1032 * _1032;
    float _1044 = -_904;
    float _1046 = _1044 + _1026;
    float _1048 = 1.0 / _1034;
    float _1050 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1040);
    float _1052 = fma(_1038, _1038, _1042);
    float _1054 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1050);
    float _1056 = fma(_1046, _1046, _1052);
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = sqrt(_1056);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = _1068 + _1034;
    float _1084 = _1082 * _1048;
    float _1086 = _1084 * 0.5;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1088);
    bool _1092 = _1070 > 0.0;
    float _1094 = 1.0 / _1090;
    float _1096 = _1028;
    float _1098 = _1070;
    float _1100 = _1024;
    float _1102 = _1034;
    float _1104 = _1022;
    float _1106 = _1026;
    float _1108 = _1056;
    if (!_1092)
    {
        _1096 = _1022;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    float _1114 = _1110;
    if (!_1092)
    {
        _1098 = _1026;
    }
    float _1116 = _1098;
    bool _1118 = !_1092;
    float _1120 = _1116;
    if (!_1118)
    {
        float _1122 = _188 * _188;
        float _1124 = fma(_186, _186, _1122);
        float _1126 = rsqrt(_1056);
        float _1128 = fma(_190, _190, _1124);
        float _1130 = sqrt(_1128);
        float _1132 = _1038 * _1126;
        float _1134 = _1032 * _1126;
        float _1136 = _1046 * _1126;
        bool _1138 = _1130 > 0.0;
        float _1140 = _1130;
        _1102 = _1134;
        _966 = _1128;
        if (!_1138)
        {
            _1112 = _1022;
        }
        float _1142 = _1112;
        _1114 = _1142;
        if (!_1138)
        {
            _1140 = _1026;
        }
        float _1144 = _1140;
        bool _1146 = !_1138;
        _1120 = _1144;
        if (!_1146)
        {
            float _1148 = rsqrt(_1128);
            float _1150 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1152 = _188 * _1148;
            float _1154 = _186 * _1148;
            float _1156 = _1134 * _1152;
            float _1158 = _190 * _1148;
            float _1160 = fma(_1132, _1154, _1156);
            float _1162 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1164 = fma(_1136, _1158, _1160);
            float _1166 = _1164 * _1162;
            float _1168 = fma(_186, _1166, _1024);
            float _1170 = fma(_188, _1166, _1022);
            float _1172 = fma(_190, _1166, _1026);
            _1100 = _1168;
            _1114 = _1170;
            _1120 = _1172;
            _966 = _1148;
        }
    }
    float _1174 = _1100;
    float _1176 = _1114;
    float _1178 = _1120;
    float _1180 = _1102;
    float _1182 = _966;
    float _1184 = _1178;
    float _1186 = _1180;
    if (_1080)
    {
        _1104 = 1.0;
    }
    float _1188 = _1104;
    float _1190 = _1188;
    if (_1066)
    {
        _1106 = _1174;
    }
    float _1192 = _1106;
    float _1194 = _1192;
    if (_1066)
    {
        _196 = _1176;
    }
    float _1196 = _196;
    float _1198 = _1196;
    if (!_1066)
    {
        float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1202 = _934 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1206 = _910 + _1204;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1210 = -_934;
        float _1212 = _1210 + _1176;
        float _1214 = _1202 * _1202;
        float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1218 = _904 + _1216;
        float _1220 = -_904;
        float _1222 = _1220 + _1178;
        float _1224 = fma(_1206, _1206, _1214);
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1228 = fma(_1218, _1218, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1234 = precise::min(_1230, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1236 = _1234 * _1226;
        float _1238 = _1232 * _1236;
        float _1240 = -_910;
        float _1242 = _1240 + _1174;
        float _1244 = fma(_1212, _1238, _934);
        float _1246 = fma(_1242, _1238, _910);
        float _1248 = fma(_1222, _1238, _904);
        _1198 = _1244;
        _1194 = _1246;
        _1184 = _1248;
    }
    float _1250 = _1198;
    float _1252 = _1194;
    float _1254 = _1184;
    if (_1080)
    {
        _968 = 1.0;
    }
    float _1256 = _968;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1260 = _1094 * _1258;
    float _1262 = _1256;
    if (!_1080)
    {
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1266 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        float _1278 = _1268 * 0.15915493667125701904296875;
        float _1280 = _1266 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = 1.0 / _1276;
        float _1286 = _1278 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        float _1290 = _1282 * _1284;
        float _1292 = _1278 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        float _1296 = _1288 * _1290;
        float _1298 = 1.0 / _1272;
        float _1300 = 1.0 / _1296;
        float _1302 = _1294 * _1300;
        float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1306 = fma(_1260, _1302, _1304);
        float _1308 = _1306 * _1298;
        float _1310 = precise::clamp(_1308, 0.0, 1.0);
        _1190 = _1310;
    }
    float _1312 = _1190;
    if (!_1080)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1260, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1262 = _1364;
    }
    float _1366 = _1262;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1250 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1252 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1254 + _1376;
    float _1380 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1370 * _1370;
    float _1384 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1386 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1374, _1374, _1382);
    float _1390 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = fma(_1378, _1378, _1388);
    float _1394 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = rsqrt(_1392);
    float _1398 = sqrt(_1392);
    float _1400 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1402 = _1374 * _1400;
    float _1404 = _1378 * _1400;
    float _1406 = _1402 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1388;
    float _1422 = _1410;
    float _1424 = _1418;
    float _1426 = _1402;
    float _1428 = _1404;
    float _1430 = _1406;
    float _1432 = _1408;
    if (_1414)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1434;
    }
    float _1436 = _1420;
    if (_1414)
    {
        float _1438 = rsqrt(_1410);
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1414)
    {
        float _1442 = _1418 * _1436;
        _1424 = _1442;
    }
    float _1444 = _1424;
    if (_1414)
    {
        float _1446 = _1444 * 0.15915493667125701904296875;
        _1186 = _1446;
    }
    float _1448 = _1186;
    float _1450 = _1436;
    if (_1414)
    {
        float _1452 = _1448 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1460 = precise::max(0.0, _1458);
    float _1462 = _1182;
    if (_1414)
    {
        float _1464 = _1448 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = -_1400;
    float _1472 = -_1460;
    float _1474 = fma(_1370, _1470, _1472);
    if (_1414)
    {
        float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1476;
    }
    float _1478 = _1108;
    float _1480 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1484 = _1456;
    float _1486 = _1478;
    if (_1414)
    {
        float _1488 = fma(_1456, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1488;
    }
    float _1490 = _1484;
    float _1492 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1494 = floor(_1482);
    float _1496 = _1490;
    if (_1414)
    {
        float _1498 = _1468 + (-1.0);
        _970 = _1498;
    }
    float _1500 = _970;
    float _1502 = _1500;
    if (_1414)
    {
        float _1504 = _1440 * _1490;
        _1486 = _1504;
    }
    float _1506 = _1486;
    if (!_1414)
    {
        _1496 = _1474;
    }
    float _1508 = _1496;
    float _1510 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1512 = _1508;
    if (_1414)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1514;
    }
    float _1516 = _1502;
    if (_1414)
    {
        float _1518 = _1402 * _1506;
        _1426 = _1518;
    }
    float _1520 = _1426;
    if (_1414)
    {
        float _1522 = _1404 * _1506;
        _1428 = _1522;
    }
    float _1524 = _1428;
    float _1526 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (_1414)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1512 = _1528;
    }
    float _1530 = _1512;
    if (_1414)
    {
        float _1532 = _1520 * _1520;
        _1430 = _1532;
    }
    float _1534 = _1430;
    if (_1414)
    {
        float _1536 = _1524 * _1524;
        _1432 = _1536;
    }
    float _1538 = _1432;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1542 = fma(_1530, _1530, _1534);
    float _1544 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1548 = _1542 + _1538;
    float _1550 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1554 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1552);
    float _1556 = precise::clamp(_1554, 0.0, 1.0);
    float _1558 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1560 = -_1494;
    float _1562 = _1482 + _1560;
    float _1564 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1550);
    float _1566 = rsqrt(_1548);
    float _1568 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1384);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1568);
    float _1580 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1582 = abs(_1572);
    float _1584 = log2(_1582);
    float _1586 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1540);
    float _1588 = -_1544;
    float _1590 = fma(_1588, _1546, 1.0);
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1596 = _1566 * _1520;
    float _1598 = _1566 * _1530;
    float _1600 = _1566 * _1524;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1594);
    float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1606 = floor(_1558);
    float _1608 = -_1604;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1620 = log2(_1590);
    float _1622 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = fma(_1618, 0.5, 0.5);
    float _1628 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1622);
    float _1630 = exp2(_1612);
    float _1632 = -_1606;
    float _1634 = _1558 + _1632;
    float _1636 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1638 = _1598 + 1.0;
    float _1640 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1636);
    float _1642 = 1.0 / _1602;
    float _1644 = fma(_1626, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1620 * 0.693147182464599609375;
    float _1648 = fma(_1626, _1644, -0.212114393711090087890625);
    float _1650 = sqrt(_1624);
    float _1652 = -_1598;
    float _1654 = fma(_1630, _1638, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1628);
    float _1660 = fma(_1626, _1648, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1642;
    float _1666 = _1658 * _1642;
    float _1668 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1650 * 0.636619746685028076171875;
    float2 _5483 = float2(_1562, _1634);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).x;
    float _1678 = -_1660;
    float _1680 = fma(_1674, _1678, 1.0);
    float3 _5499 = float3(_1670, _1672, _1668);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5499, float3(0.0), isnan(_5499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5499, float3(0.0), isnan(_5499)), level(0.0)).x;
    float3 _5510 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5526 = float2(_1680, _1662);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = float(uint(_454));
    float _1707 = trunc(_670);
    int _1709 = int(_1707);
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    float _1715 = _500 * _168;
    bool _1717 = _454 == 0;
    int _1719 = abs(_540);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1705;
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1729 = _1727 != 0;
    float _1731 = float(uint(_1709));
    bool _1733 = !_1729;
    float _1735 = _1733 ? 7.345489978790283203125 : 1.0;
    int _1737 = as_type<int>(_1725) + (-2);
    float _1739 = _1735 * _438;
    float _1741 = float(_1709);
    float _1743 = as_type<float>(_1737) * _1731;
    float _1745 = floor(_1739);
    bool _1747 = _1741 >= _484;
    bool _1749 = isnan(_1741);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(_484);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = trunc(_1743);
    float _1761 = precise::max(_1759, 0.0);
    uint _1764 = uint(_1761);
    float _1766 = trunc(_1757);
    int _1768 = int(_1766);
    int _1770 = ~_454;
    int _1772 = _1770 + 1;
    int _1774 = _1713 * int(_1764);
    int _1776 = _1774 + _1709;
    float _1778 = float(uint(_1776));
    float _1780 = as_type<float>(_1737) * _1778;
    float _1782 = trunc(_1780);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = int(_1764) + int(_1786);
    int _1790 = _1772 * _1788;
    int _1792 = _1790 + _1709;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1745;
    float _1798 = _1739 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _484;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1808 = _1806 != 0;
    int _1810 = ~_1788;
    int _1812 = _1810 + _1802;
    int _1814 = _1812 + 1;
    bool _1816 = !_1808;
    int _1818 = _1816 ? 0 : 1;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _440 > 0.5;
    int _1826 = _454 * _1814;
    int _1828 = _1826 + _1709;
    int _1830 = abs(_1818);
    int _1832 = ~_1768;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    bool _1838 = !_1717;
    int _1840 = _1838 ? _1828 : (-1);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1844 = _1842 != 0;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    int _1850 = _1840 * _1836;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1854 = _1852 != 0;
    float _1856 = trunc(_1715);
    int _1858 = int(_1856);
    int _1860 = _454 + (-1);
    int _1862 = _1822 * _1830;
    int _1864 = _1862 + _1709;
    int _1866 = _1768 * _1860;
    int _1868 = _1866 + _1850;
    int _1870 = abs(_546);
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1876 = in.m_67.y;
    int _1878 = _1868 * _1719;
    int _1880 = abs(_598);
    bool _1882 = !_1723;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1858 * _1870;
    int _1888 = _1886 + _1878;
    float _1890 = 1.0 / _1874;
    int _1892 = abs(_1884);
    int _1894 = _1864 * _1880;
    int _1896 = _1894 + _1888;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1902 = _1822 * _1892;
    int _1904 = _1902 + _1896;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1910 = as_type<float>(_1822);
    if (_1844)
    {
        float _1912 = in.m_57.x;
        _1910 = _1912;
    }
    float _1914 = _1910;
    float _1916 = 1.0 / _1900;
    float _1918 = float(uint(_1904));
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1924 = as_type<float>(_1737) * _1918;
    float _1926 = -_1876;
    float _1928 = _1926 + 1.0;
    float _1930 = 1.0 / _1908;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1938 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1876;
    if (_1848)
    {
        float _1942 = _1824 ? _1928 : _1876;
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1946;
    float _1950 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = trunc(_1924);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1934 * _1916;
    float _1962 = _1948 * _1890;
    float _1964 = in.m_67.x;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1966;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    bool _1982 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_430);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    out.m_69.x = _1938;
    out.m_69.y = _1950;
    out.m_69.z = _1952;
    int _1994 = ~_454;
    int _1996 = _1994 + 1;
    float _1998 = _1968 * _1930;
    bool _2000 = _1914 > 0.5;
    bool _2002 = _2000 && _1844;
    float _2004 = -_1992;
    float _2006 = _2004 + 1.0;
    bool _2008 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2010 = isnan(_430);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    bool _2020 = _770 != 0.0;
    bool _2022 = isnan(_770);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.0);
    bool _2028 = _2024 || _2026;
    int _2030 = _1996 * int(_1958);
    int _2032 = _2030 + _1904;
    bool _2034 = _768 == 0.0;
    bool _2036 = !_2028;
    bool _2038 = _2034 && _2036;
    float _2040 = -_1980;
    float _2042 = _2040 + 1.0;
    bool _2044 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_430);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2058 = float(uint(_2032));
    float _2060 = _1992 * _2042;
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2064 = _430 + _2062;
    float _2066 = _2054 * _2006;
    float _2068 = -_2054;
    float _2070 = _2068 + 1.0;
    float _2072 = -_506;
    float _2074 = fma(_656, _2056, _2072);
    float _2076 = fma(_1962, _2064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2078 = float(uint(_1864));
    float _2080 = _2018 * _2070;
    float _2082 = as_type<float>(_1737) * _2058;
    float _2084 = in.m_71.x;
    float _2086 = in.m_71.y;
    float _2088 = in.m_71.z;
    float _2090 = _1964;
    if (_1844)
    {
        _588 = _1964;
    }
    float _2092 = _588;
    float _2094 = _2076 * _2080;
    float _2096 = as_type<float>(_1737) * _2078;
    float _2098 = trunc(_2082);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2106 = _430 + _2104;
    float _2108 = _2092;
    if (_2002)
    {
        float _2110 = -_2092;
        float _2112 = _2110 + 1.0;
        _2108 = _2112;
    }
    float _2114 = _2108;
    bool _2116 = _772 == 0.0;
    bool _2118 = _2116 && _2038;
    float _2120 = fma(_1998, _2106, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1844)
    {
        _2090 = _2114;
    }
    float _2122 = _2090;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2126 = _430 + _2124;
    float _2128 = -_2018;
    float _2130 = _2128 + 1.0;
    int _2132 = ~_454;
    int _2134 = _2132 + 1;
    float _2136 = trunc(_2096);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = fma(_1960, _2126, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2144 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2094);
    int _2146 = ~_454;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2152 = int(_1958) + int(_2102);
    float _2154 = fma(_2142, _2066, _2144);
    float _2156 = _2084;
    float _2158 = _2086;
    float _2160 = _2088;
    if (!_2118)
    {
        float _2162 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2156 = _2162;
    }
    float _2164 = _2156;
    if (!_2118)
    {
        float _2166 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2158 = _2166;
    }
    float _2168 = _2158;
    if (!_2118)
    {
        float _2170 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2160 = _2170;
    }
    float _2172 = _2160;
    float _2174 = fma(_2120, _2060, _2154);
    float _2176 = fma(_636, _2150, _504);
    int _2178 = ~_454;
    int _2180 = _2178 + 1;
    int _2182 = _2148 * _2152;
    int _2184 = _2182 + _1904;
    float _2186 = abs(_1260);
    float _2188 = log2(_2186);
    int _2190 = _2134 * int(_2140);
    int _2192 = _2190 + _1864;
    float _2194 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2174);
    float _2196 = _2176 + 0.5;
    bool _2198 = uint(_2184) >= uint(_454);
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2202 = float(uint(_2192));
    float _2204 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2206 = as_type<float>(_1737) * _2202;
    bool _2208 = !_2198;
    int _2210 = _2208 ? 0 : (-1);
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2216 = ~_2152;
    int _2218 = _2216 + _2210;
    int _2220 = _2218 + 1;
    float _2222 = trunc(_2206);
    float _2224 = precise::max(_2222, 0.0);
    uint _2226 = uint(_2224);
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2074 + 0.5;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2234 = _454 * _2220;
    int _2236 = _2234 + _1904;
    float _2238 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2196;
    out.m_73.y = _2230;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2244 = !_1717;
    int _2246 = _2244 ? _2236 : (-1);
    float _2248 = exp2(_2232);
    float _2250 = _862 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2238;
    out.m_75.y = _2240;
    out.m_75.z = _2242;
    out.m_75.w = _2200;
    int _2252 = _2246 & 3;
    bool _2254 = _2252 != 0;
    float _2256 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    int _2258 = int(_2140) + int(_2226);
    int _2260 = _2246 >> 31;
    float _2262 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2264 = _2260 & 3;
    float _2266 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = -_836;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2272 = _2246 + _2264;
    float _2274 = -_836;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2204);
    float _2278 = -_836;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2270);
    float _2284 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2276);
    int _2288 = _2272 >> 2;
    float _2290 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2294 = precise::clamp(_2292, 0.0, 1.0);
    float _2296 = _862 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2298 = _2288 << 4;
    int _2300 = _2298 + 368;
    float _2302 = _862 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    uint _2308 = uint(int(uint(_2300) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2326 = _2282 * _2168;
    float _2328 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2330 = _2180 * _2258;
    int _2332 = _2330 + _1864;
    float _2334 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2336 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2338 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2328);
    int _2340 = _2300 + 8;
    uint _2342 = uint(int(uint(_2340) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = _2286 * _2168;
    int _2360 = _2246 & 3;
    bool _2362 = _2360 != 0;
    float _2364 = _2304 * _2168;
    bool _2366 = uint(_2332) >= uint(_454);
    float _2368 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    bool _2370 = uint(_2360) > 1u;
    float _2372 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    int _2374 = _2254 ? 0 : 1;
    float _2376 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2306);
    bool _2378 = _2360 != 3;
    float _2380 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2334);
    float _2382 = fma(_2294, -2.0, 3.0);
    float _2384 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2336);
    float _2386 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2256);
    float _2388 = _2294 * _2294;
    bool _2390 = !_2366;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = fma(_2372, _2164, _2358);
    bool _2396 = uint(_2360) >= 2u;
    float _2398 = _2388 * _2382;
    int _2400 = ~_2374;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2376, _2164, _2364);
    int _2408 = _2404;
    if (!_2370)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = fma(_2368, _2164, _2326);
    bool _2418 = !_2362;
    int _2420 = _2418 ? 0 : 1;
    float _2422 = fma(_2384, _2172, _2394);
    int _2424 = _2396 ? 0 : 1;
    float _2426 = in.m_77.x;
    bool _2428 = _2360 != 3;
    float _2430 = -_1676;
    float _2432 = _2430 + 1.0;
    int _2434 = abs(_2414);
    float _2436 = fma(_2380, _2172, _2416);
    int _2438 = ~_2258;
    int _2440 = _2438 + _2392;
    int _2442 = _2440 + 1;
    float _2444 = fma(_2386, _2172, _2406);
    int _2446 = abs(_2420);
    int _2448 = ~_2424;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = _454 * _2442;
    int _2456 = _2454 + _1864;
    bool _2458 = !_2428;
    int _2460 = _2458 ? 0 : (-1);
    out.m_79.x = _2436;
    out.m_79.y = _2422;
    out.m_79.z = _2444;
    int _2462 = _2452;
    if (_2378)
    {
        int _2464 = ~_2424;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    int _2470 = ~_2434;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    bool _2476 = !_1854;
    int _2478 = _2476 ? 0 : 1;
    int _2480 = abs(_2460);
    int _2482 = _2474 * as_type<int>(_2322);
    int _2484 = abs(_2468);
    int _2486 = ~_2446;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    int _2492 = abs(_2478);
    int _2494 = _2490 * as_type<int>(_2314);
    int _2496 = _2494 + _2482;
    int _2498 = ~_2484;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = ~_2480;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2502 * as_type<int>(_2348);
    int _2512 = _2510 + _2496;
    int _2514 = ~_2492;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2522 = _2508 * as_type<int>(_2356);
    int _2524 = _2522 + _2512;
    float _2526 = -_2398;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2520);
    bool _2532 = !_1717;
    int _2534 = _2532 ? _2456 : (-1);
    int _2536 = _2524 * _2518;
    float _2538 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2530);
    float _2542 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2398);
    float _2544 = _1602 * 0.5;
    int _2546 = _2534 * _2492;
    int _2548 = _2546 + _2536;
    float _2550 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2540);
    float _2552 = exp2(_2538);
    bool _2554 = _1260 <= 8000.0;
    bool _2556 = isnan(_1260);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(8000.0);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = fma(_1658, -0.5, _2544);
    float _2568 = float(_2548);
    float _2570 = _2550 + _1602;
    float _2572 = _1656 + _1602;
    float _2574 = _2564 * _2542;
    float _2576 = _2570 * 0.5;
    float _2578 = _2572 * 0.5;
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2550;
    out.gl_Position.w = _1602;
    bool _2582 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2584 = isnan(_1398);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2590 = _2586 || _2588;
    float _2592 = _2432 * _2580;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    out.m_81.x = _2578;
    out.m_81.y = _2566;
    out.m_81.z = _2576;
    out.m_81.w = _1602;
    float _2596 = -_2552;
    float _2598 = _2596 + 1.0;
    float _2600 = -_2594;
    float _2602 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2568;
    float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2606 = _2602 * _2426;
    float _2608 = _2604 * _1682;
    float _2610 = _2568;
    float _2612 = _2578;
    if (!_2590)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2614 = _2610;
    float _2616 = _1693 * _2608;
    float _2618 = _1703 * _2608;
    float _2620 = -_2604;
    float _2622 = _2620 + 1.0;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = fma(_1699, _2616, _1687);
    float _2628 = fma(_1701, _2616, _1689);
    float _2630 = _1693 * _2622;
    float _2632 = fma(_1693, _2618, _1691);
    out.m_85.x = _2624;
    float _2634 = _1312 * _1366;
    float _2636 = _2616;
    float _2638 = _2618;
    float _2640 = _2622;
    float _2642 = _2634;
    float _2644 = _2614;
    float _2646 = _2614;
    if (!_2590)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2648 = _2612;
    out.m_87.x = _2626;
    out.m_87.y = _2628;
    out.m_87.z = _2632;
    out.m_87.w = _2630;
    float _2650 = _2634 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2652 = _2648;
    float _2654 = _2648;
    if (!_2590)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _2636;
    float _2658 = _2656;
    float _2660 = _2656;
    if (!_2590)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2662 = _2638;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2590)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2668 = _2640;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2590)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2674 = _2642;
    bool _2676 = !_2590;
    float _2678 = _2674;
    float _2680 = _2674;
    if (!_2676)
    {
        bool _2682 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2684 = isnan(_1398);
        bool _2686 = _2682 || _2684;
        bool _2688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2690 = _2686 || _2688;
        if (!_2690)
        {
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2694 = _1398 + _2692;
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = 1.0 / _2698;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2722 = _2694 * _2704;
            float _2724 = precise::clamp(_2722, 0.0, 1.0);
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = fma(_2724, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2732 = fma(_2724, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2724, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2724, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2738 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2740 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2660 = _2734;
            _2672 = _2738;
            _2654 = _2730;
            _2666 = _2736;
            _2646 = _2732;
            _2680 = _2740;
            _2742 = true;
        }
        else
        {
            bool _2744 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2746 = isnan(_1398);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2754 = _2652;
            _2654 = _2754;
            if (!_2752)
            {
                _2658 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2756 = _2658;
            _2660 = _2756;
            if (!_2752)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2758 = _2644;
            _2646 = _2758;
            if (!_2752)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2760 = _2664;
            _2666 = _2760;
            if (!_2752)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2762 = _2670;
            _2672 = _2762;
            if (!_2752)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2764 = _2678;
            bool _2766 = !_2752;
            _2680 = _2764;
            if (!_2766)
            {
                bool _2768 = _1398 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2770 = isnan(_1398);
                bool _2772 = _2768 || _2770;
                bool _2774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2776 = _2772 || _2774;
                if (!_2776)
                {
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2780 = _1398 + _2778;
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = 1.0 / _2784;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2808 = _2780 * _2790;
                    float _2810 = precise::clamp(_2808, 0.0, 1.0);
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = fma(_2810, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2818 = fma(_2810, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2810, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2822 = fma(_2810, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2824 = fma(_2810, _2802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2826 = fma(_2810, _2806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2660 = _2820;
                    _2672 = _2824;
                    _2654 = _2816;
                    _2666 = _2822;
                    _2646 = _2818;
                    _2680 = _2826;
                    _2742 = true;
                }
                else
                {
                    _2660 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2742 = false;
    float _2828 = _2660;
    float _2830 = _2672;
    float _2832 = _2654;
    float _2834 = _2666;
    float _2836 = _2646;
    float _2838 = _2680;
    float _2840 = fma(_2422, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2828;
    float _2846 = _2844 + _2830;
    float _2848 = _2650 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2850 = -_2832;
    float _2852 = _2850 + _2834;
    out.m_89.x = 0.0;
    float _2854 = fma(_2842, _2846, _2828);
    float _2856 = fma(_2842, _2852, _2832);
    out.m_53.x = _2848;
    float _2858 = -_2836;
    float _2860 = _2858 + _2838;
    float _2862 = _2854 * 0.586610972881317138671875;
    bool _2864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2866 = fma(_2842, _2860, _2836);
    float _2868 = fma(_2856, 0.298911988735198974609375, _2862);
    bool _2870 = _1312 > 0.0;
    bool _2872 = isnan(_1312);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    float _2880 = fma(_2866, 0.114477999508380889892578125, _2868);
    bool _2882 = _1366 <= 0.0;
    bool _2884 = !_2878;
    bool _2886 = _2882 || _2884;
    float _2888 = -_2880;
    float _2890 = _2856 + _2888;
    float _2892 = -_2880;
    float _2894 = _2854 + _2892;
    float _2896 = -_2880;
    float _2898 = _2866 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    bool _2906 = !_2864;
    if (!_2906)
    {
        float _2908 = -_1250;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1252;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1254;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2422 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2436, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2444, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (!_2886)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

