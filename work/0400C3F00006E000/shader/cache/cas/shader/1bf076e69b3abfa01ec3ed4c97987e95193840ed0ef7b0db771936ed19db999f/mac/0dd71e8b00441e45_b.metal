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
    float4 m_67 [[user(locn3)]];
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
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2706 = false;
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
    float _124 = _107;
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
        float _3022 = as_type<float>(_134);
        out.gl_Position.z = _3022;
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
        float _3077 = as_type<float>(_160);
        out.gl_Position.z = _3077;
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _218 + _252;
    float _256 = 1.0 / _250;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _246;
    bool _262 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_218);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _242;
    float _276 = _226 * _256;
    float _278 = -_238;
    float _280 = _278 + 1.0;
    bool _282 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_218);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _272 * _280;
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = _222 * _260;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_312;
    float _324 = _322 + 1.0;
    float _326 = _312 * _298;
    float _328 = _254 * _274;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _292 * _324;
    float _340 = fma(_316, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -_292;
    float _352 = _350 + 1.0;
    float _354 = _342 * _338;
    float _356 = _344 * _338;
    float _358 = _340 * _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_348, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = fma(_362, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_370, _326, _364);
    float _390 = fma(_368, _276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_378, _276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_372, _326, _374);
    float _396 = fma(_386, _276, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_380, _326, _382);
    float _400 = fma(_390, _294, _388);
    float _402 = fma(_392, _294, _394);
    float _404 = fma(_396, _294, _398);
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _460 = _440 * 2.0;
    float _462 = floor(_456);
    float _464 = _438 * 2.0;
    float _466 = -_442;
    float _468 = fma(_458, 2.0, _466);
    float _470 = _440 + _438;
    float _472 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _440 + _432;
    float _476 = float(_454);
    float _478 = _470 + (-1.0);
    float _480 = exp2(_450);
    float _482 = fma(_472, -2.0, _448);
    float _484 = _474 + (-1.0);
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _488 = _476 * _116;
    float _490 = -_116;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = floor(_464);
    float _506 = float(_446);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _524 = floor(_460);
    bool _526 = !_516;
    int _528 = _526 ? 0 : 1;
    bool _530 = _462 > 0.0;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    int _536 = _502 ? 0 : 1;
    float _538 = in.m_59.x;
    float _540 = in.m_59.y;
    float _542 = in.m_59.z;
    bool _544 = !_512;
    int _546 = _544 ? 0 : 1;
    float _548 = 1.0 / _506;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    bool _560 = _504 > 0.0;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    int _572 = ~_536;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 > 0.0;
    bool _580 = _524 >= 0.0;
    bool _582 = isnan(_524);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _592 = 1.0 + _590;
    int _594 = _576;
    if (!_530)
    {
        int _596 = ~_536;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = 1.0 / _592;
    bool _604 = !_520;
    int _606 = _604 ? 0 : 1;
    float _608 = _548 * _116;
    float _610 = _558 ? _534 : 0.0;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _624 = _622 != 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _570 ? 0 : 1;
    float _630 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _632 = float(_600);
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    bool _636 = !_616;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _630);
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    int _654 = abs(_638);
    bool _656 = !_620;
    int _658 = _656 ? 0 : 1;
    int _660 = ~_628;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_654);
    int _668 = abs(_658);
    int _670 = _664;
    if (_650)
    {
        float _672 = _610 * _602;
        _126 = _672;
    }
    float _674 = _126;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _670 = _678;
    }
    int _680 = _670;
    float _682 = _666 * _632;
    float _684 = float(_668);
    float _686 = _438 + (-0.5);
    int _688 = _588 ? 0 : 1;
    float _690 = _682 * (-2.0);
    float _692 = float(_680);
    float _694 = fma(_690, _538, _538);
    float _696 = fma(_486, _690, _486);
    float _698 = _684 * _692;
    bool _700 = !_624;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = _698 * (-2.0);
    int _714 = _710;
    if (!_578)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_696, _674, _704);
    int _724 = abs(_702);
    float _726 = _440 + (-0.5);
    float _728 = float(_720);
    float _730 = fma(_712, _540, _540);
    float _732 = float(_724);
    float _734 = fma(_508, _712, _508);
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _738 = _432 + _438;
    float _740 = _732 * _728;
    float _742 = _432 + (-0.5);
    float _744 = fma(_734, _674, _736);
    float _746 = _738 + (-1.0);
    float _748 = _740 * (-2.0);
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _722 * 0.15915493667125701904296875;
    float _758 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _760 = fma(_748, _542, _542);
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = _744 * 0.15915493667125701904296875;
    float _770 = fma(_758, _748, _758);
    float _772 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _674, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _768 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _768 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _408 * _752;
    float _792 = _410 * _754;
    float _794 = _406 * _750;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _816 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _804 * _796;
    float _820 = _812 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _788;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _810 * _784;
    float _838 = _810 * _788;
    float _840 = _776 * _826;
    float _842 = _788 * _826;
    float _844 = _810 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _818;
    float _850 = _844 * _818;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_818;
    float _860 = _834 * _858;
    float _862 = -_838;
    float _864 = fma(_834, _822, _862);
    float _866 = fma(_852, _820, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_842, _820, _860);
    float _872 = fma(_856, _820, _850);
    float _874 = fma(_864, _830, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_846, _830, _870);
    float _880 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = fma(_868, _830, _872);
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _914 = _902 + _906;
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _918 = _908 + _912;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _916);
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = _924 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _934 = fma(_928, _928, _930);
    float _936 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _938 = sqrt(_934);
    float _940 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _946);
    float _952 = _932 + _948;
    bool _954 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _944;
    float _958 = _946;
    float _960 = _948;
    float _962 = _934;
    float _964 = _938;
    float _966 = _932;
    float _968 = _908;
    if (!_954)
    {
        _956 = _918;
    }
    float _970 = _956;
    float _972 = _970;
    if (!_954)
    {
        _958 = _914;
    }
    float _974 = _958;
    float _976 = _974;
    if (!_954)
    {
        _960 = _952;
    }
    float _978 = _960;
    bool _980 = !_954;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _938 + _986;
        float _990 = rsqrt(_934);
        float _992 = _988 * _984;
        float _994 = _952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_952, _1000, _1010);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_922, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
        _962 = _990;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = _962;
    float _1028 = -_932;
    float _1030 = _1028 + _1020;
    float _1032 = _950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = -_908;
    float _1036 = _1034 + _1022;
    float _1038 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1040 = _1030 * _1030;
    float _1042 = -_902;
    float _1044 = _1042 + _1024;
    float _1046 = 1.0 / _1032;
    float _1048 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1038);
    float _1050 = fma(_1036, _1036, _1040);
    float _1052 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1048);
    float _1054 = fma(_1044, _1044, _1050);
    bool _1056 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1058 = isnan(0.5);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1064 = _1060 || _1062;
    float _1066 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1068 = sqrt(_1054);
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1066 + _1032;
    float _1082 = _1080 * _1046;
    float _1084 = _1082 * 0.5;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1088 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1086);
    bool _1090 = _1068 > 0.0;
    float _1092 = 1.0 / _1088;
    float _1094 = _1026;
    float _1096 = _1068;
    float _1098 = _1022;
    float _1100 = _1020;
    float _1102 = _1024;
    float _1104 = _1054;
    if (!_1090)
    {
        _1094 = _1020;
    }
    float _1106 = _1094;
    float _1108 = _1106;
    float _1110 = _1106;
    if (!_1090)
    {
        _1096 = _1024;
    }
    float _1112 = _1096;
    bool _1114 = !_1090;
    float _1116 = _1112;
    float _1118 = 0.0;
    if (!_1114)
    {
        float _1120 = _188 * _188;
        float _1122 = fma(_186, _186, _1120);
        float _1124 = rsqrt(_1054);
        float _1126 = fma(_190, _190, _1122);
        float _1128 = sqrt(_1126);
        float _1130 = _1036 * _1124;
        float _1132 = _1030 * _1124;
        float _1134 = _1044 * _1124;
        bool _1136 = _1128 > 0.0;
        float _1138 = _1128;
        _1118 = _1130;
        _964 = _1126;
        if (!_1136)
        {
            _1108 = _1020;
        }
        float _1140 = _1108;
        _1110 = _1140;
        if (!_1136)
        {
            _1138 = _1024;
        }
        float _1142 = _1138;
        bool _1144 = !_1136;
        _1116 = _1142;
        if (!_1144)
        {
            float _1146 = rsqrt(_1126);
            float _1148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1150 = _188 * _1146;
            float _1152 = _186 * _1146;
            float _1154 = _1132 * _1150;
            float _1156 = _190 * _1146;
            float _1158 = fma(_1130, _1152, _1154);
            float _1160 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1162 = fma(_1134, _1156, _1158);
            float _1164 = _1162 * _1160;
            float _1166 = fma(_186, _1164, _1022);
            float _1168 = fma(_188, _1164, _1020);
            float _1170 = fma(_190, _1164, _1024);
            _1098 = _1166;
            _1110 = _1168;
            _1116 = _1170;
            _964 = _1146;
        }
    }
    float _1172 = _1098;
    float _1174 = _1110;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _964;
    float _1182 = _1176;
    float _1184 = _1178;
    if (_1078)
    {
        _1100 = 1.0;
    }
    float _1186 = _1100;
    float _1188 = _1186;
    if (_1064)
    {
        _1102 = _1172;
    }
    float _1190 = _1102;
    float _1192 = _1190;
    if (_1064)
    {
        _196 = _1174;
    }
    float _1194 = _196;
    float _1196 = _1194;
    if (!_1064)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _932 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _908 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = -_932;
        float _1210 = _1208 + _1174;
        float _1212 = _1200 * _1200;
        float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1216 = _902 + _1214;
        float _1218 = -_902;
        float _1220 = _1218 + _1176;
        float _1222 = fma(_1204, _1204, _1212);
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1226 = fma(_1216, _1216, _1222);
        float _1228 = sqrt(_1226);
        float _1230 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = precise::min(_1228, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1234 = _1232 * _1224;
        float _1236 = _1230 * _1234;
        float _1238 = -_908;
        float _1240 = _1238 + _1172;
        float _1242 = fma(_1210, _1236, _932);
        float _1244 = fma(_1240, _1236, _908);
        float _1246 = fma(_1220, _1236, _902);
        _1196 = _1242;
        _1192 = _1244;
        _1182 = _1246;
    }
    float _1248 = _1196;
    float _1250 = _1192;
    float _1252 = _1182;
    if (_1078)
    {
        _966 = 1.0;
    }
    float _1254 = _966;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1258 = _1092 * _1256;
    float _1260 = _1254;
    if (!_1078)
    {
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1268;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1266 * 0.15915493667125701904296875;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1270;
        float _1298 = 1.0 / _1294;
        float _1300 = _1292 * _1298;
        float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1304 = fma(_1258, _1300, _1302);
        float _1306 = _1304 * _1296;
        float _1308 = precise::clamp(_1306, 0.0, 1.0);
        _1188 = _1308;
    }
    float _1310 = _1188;
    if (!_1078)
    {
        float _1312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1316 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1320;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = _1322 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        float _1340 = _1332 * _1334;
        float _1342 = 1.0 / _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1344;
        float _1348 = 1.0 / _1346;
        float _1350 = _1338 * _1342;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = fma(_1258, _1350, _1352);
        float _1356 = _1354 * _1348;
        float _1358 = precise::clamp(_1356, 0.0, 1.0);
        float _1360 = -_1358;
        float _1362 = _1360 + 1.0;
        _1260 = _1362;
    }
    float _1364 = _1260;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1248 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1250 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1252 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1372, _1372, _1378);
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1376, _1376, _1384);
    float _1390 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = rsqrt(_1388);
    float _1394 = sqrt(_1388);
    float _1396 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1398 = _1372 * _1396;
    float _1400 = _1376 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1384;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    float _1428 = _1404;
    if (_1410)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1410)
    {
        float _1434 = rsqrt(_1406);
        _1418 = _1434;
    }
    float _1436 = _1418;
    if (_1410)
    {
        float _1438 = _1414 * _1432;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1184 = _1442;
    }
    float _1444 = _1184;
    float _1446 = _1432;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1180;
    if (_1410)
    {
        float _1460 = _1444 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        _1458 = _1462;
    }
    float _1464 = _1458;
    float _1466 = -_1396;
    float _1468 = -_1456;
    float _1470 = fma(_1368, _1466, _1468);
    if (_1410)
    {
        float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1472;
    }
    float _1474 = _1104;
    float _1476 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1474;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = fma(_1452, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1410)
    {
        _1480 = _1470;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1410)
    {
        float _1494 = _1464 + (-1.0);
        _968 = _1494;
    }
    float _1496 = _968;
    float _1498 = _1496;
    if (_1410)
    {
        float _1500 = _1436 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1410)
    {
        float _1506 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1506;
    }
    float _1508 = _1498;
    if (_1410)
    {
        float _1510 = _1398 * _1502;
        _1422 = _1510;
    }
    float _1512 = _1422;
    if (_1410)
    {
        float _1514 = _1400 * _1502;
        _1424 = _1514;
    }
    float _1516 = _1424;
    float _1518 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1504);
    if (_1410)
    {
        float _1520 = fma(_1470, _1464, _1508);
        _1492 = _1520;
    }
    float _1522 = _1492;
    if (_1410)
    {
        float _1524 = _1512 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1410)
    {
        float _1528 = _1516 * _1516;
        _1428 = _1528;
    }
    float _1530 = _1428;
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1534 = fma(_1522, _1522, _1526);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = -_1490;
    float _1540 = _1476 + _1538;
    float _1542 = _1534 + _1530;
    float _1544 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1548 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1546);
    float _1550 = precise::clamp(_1548, 0.0, 1.0);
    float _1552 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1558 = rsqrt(_1542);
    float _1560 = -_1550;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1566 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1568 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = abs(_1562);
    float _1580 = log2(_1578);
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1582;
    float _1590 = fma(_1588, _1554, 1.0);
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = _1558 * _1512;
    float _1596 = _1558 * _1522;
    float _1598 = floor(_1552);
    float _1600 = _1558 * _1516;
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1606 = -_1602;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1614 = log2(_1590);
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = fma(_1618, -0.5, 0.5);
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = -_1598;
    float _1626 = _1552 + _1624;
    float _1628 = exp2(_1610);
    float _1630 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1632 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1584);
    float _1634 = _1596 + 1.0;
    float _1636 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1638 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1640 = 1.0 / _1612;
    float _1642 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = _1614 * 0.693147182464599609375;
    float _1646 = fma(_1622, _1642, -0.212114393711090087890625);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = sqrt(_1620);
    float _1652 = -_1596;
    float _1654 = fma(_1628, _1634, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1636);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1638);
    float _1660 = fma(_1622, _1646, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1640;
    float _1666 = _1658 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1650 * 0.636619746685028076171875;
    float2 _5444 = float2(_1540, _1626);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5444, float2(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5444, float2(0.0), isnan(_5444)), level(0.0)).x;
    float _1676 = -_1660;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5460 = float3(_1668, _1670, _1648);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5460, float3(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5460, float3(0.0), isnan(_5460)), level(0.0)).x;
    float3 _5471 = float3(_1668, _1670, _1648);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5487 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_608);
    int _1707 = int(_1705);
    int _1709 = ~_454;
    int _1711 = _1709 + 1;
    float _1713 = _488 * _168;
    bool _1715 = _454 == 0;
    int _1717 = abs(_528);
    int _1719 = abs(_546);
    float _1721 = 1.0 / _1703;
    float _1723 = float(uint(_1707));
    float _1725 = trunc(_1713);
    int _1727 = int(_1725);
    int _1729 = as_type<int>(_1721) + (-2);
    float _1731 = as_type<float>(_1729) * _1723;
    int _1733 = ~_454;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    int _1744 = _1711 * int(_1742);
    int _1746 = _1744 + _1707;
    float _1748 = float(uint(_1746));
    float _1750 = as_type<float>(_1729) * _1748;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = trunc(_1750);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = !_1754;
    float _1764 = _1762 ? 7.345489978790283203125 : 1.0;
    float _1766 = _1764 * _438;
    float _1768 = float(_1707);
    float _1770 = floor(_1766);
    bool _1772 = _1768 >= _476;
    bool _1774 = isnan(_1768);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(_476);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    int _1784 = int(_1742) + int(_1760);
    float _1786 = trunc(_1782);
    int _1788 = int(_1786);
    int _1790 = _1735 * _1784;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1770;
    float _1798 = _1766 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1784;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = _1798 * _476;
    int _1816 = ~_1788;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    bool _1822 = !_1806;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _454 * _1812;
    int _1828 = _1826 + _1707;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1832 = _1830 != 0;
    float _1834 = trunc(_1814);
    int _1836 = int(_1834);
    int _1838 = abs(_1824);
    bool _1840 = !_1715;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    int _1848 = _1842 * _1820;
    int _1850 = _454 + (-1);
    float _1852 = in.m_65.y;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1860 = _1858 != 0;
    int _1862 = _1788 * _1850;
    int _1864 = _1862 + _1848;
    int _1866 = _1864 * _1717;
    int _1868 = _1836 * _1838;
    int _1870 = _1868 + _1707;
    int _1872 = _1727 * _1719;
    int _1874 = _1872 + _1866;
    int _1876 = abs(_606);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1882 = !_1832;
    int _1884 = _1882 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1886 = _440 > 0.5;
    int _1888 = abs(_1884);
    int _1890 = _1870 * _1876;
    int _1892 = _1890 + _1874;
    float _1894 = 1.0 / _1880;
    float _1896 = -_1852;
    float _1898 = _1896 + 1.0;
    int _1900 = ~_454;
    int _1902 = _1900 + 1;
    int _1904 = _1836 * _1888;
    int _1906 = _1904 + _1892;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1912 = as_type<float>(_1888);
    float _1914 = _1852;
    if (_1846)
    {
        float _1916 = in.m_57.x;
        _1912 = _1916;
    }
    float _1918 = _1912;
    if (_1856)
    {
        float _1920 = _1886 ? _1898 : _1852;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = float(uint(_1906));
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1934 = 1.0 / _1910;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1938 = as_type<float>(_1729) * _1928;
    float _1940 = _1926 * _1894;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1944 = -_522;
    float _1946 = fma(_652, _1936, _1944);
    float _1948 = trunc(_1938);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1932 * _1934;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1984 = _430 + _1982;
    bool _1986 = _1918 > 0.5;
    bool _1988 = _1986 && _1846;
    out.m_69.x = _1968;
    out.m_69.y = _1962;
    out.m_69.z = _1964;
    out.m_69.w = _1956;
    bool _1990 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1992 = isnan(_430);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1940, _1984, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2004 = _1902 * int(_1952);
    int _2006 = _2004 + _1906;
    float _2008 = in.m_71.x;
    float _2010 = in.m_71.y;
    float _2012 = in.m_71.z;
    bool _2014 = _764 != 0.0;
    bool _2016 = isnan(_764);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = float(uint(_1870));
    float _2026 = float(uint(_2006));
    bool _2028 = _762 == 0.0;
    bool _2030 = !_2022;
    bool _2032 = _2028 && _2030;
    float _2034 = as_type<float>(_1729) * _2024;
    bool _2036 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2038 = isnan(_430);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = as_type<float>(_1729) * _2026;
    float _2050 = -_1980;
    float _2052 = _2050 + 1.0;
    float _2054 = _1984;
    float _2056 = _1960;
    if (_1846)
    {
        _2054 = _1960;
    }
    float _2058 = _2054;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2062 = _430 + _2060;
    bool _2064 = _766 == 0.0;
    bool _2066 = _2064 && _2032;
    float _2068 = _2000 * _2052;
    float _2070 = trunc(_2048);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = -_2000;
    float _2078 = _2076 + 1.0;
    float _2080 = _2058;
    if (_1988)
    {
        float _2082 = -_2058;
        float _2084 = _2082 + 1.0;
        _2080 = _2084;
    }
    float _2086 = _2080;
    float _2088 = fma(_1966, _2062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2090 = ~_454;
    int _2092 = _2090 + 1;
    float _2094 = _2046 * _2078;
    float _2096 = -_2046;
    float _2098 = _2096 + 1.0;
    if (_1846)
    {
        _2056 = _2086;
    }
    float _2100 = _2056;
    float _2102 = trunc(_2034);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = _2002 * _2094;
    float _2114 = _2010;
    float _2116 = _2008;
    float _2118 = _2012;
    if (!_2066)
    {
        float _2120 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2114 = _2120;
    }
    float _2122 = _2114;
    if (!_2066)
    {
        float _2124 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2116 = _2124;
    }
    float _2126 = _2116;
    float _2128 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2130 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2112);
    int _2132 = int(_1952) + int(_2074);
    if (!_2066)
    {
        float _2134 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = fma(_640, _2128, _492);
    float _2140 = fma(_2088, _2068, _2130);
    int _2142 = _2092 * _2132;
    int _2144 = _2142 + _1906;
    float _2146 = abs(_1258);
    float _2148 = log2(_2146);
    int _2150 = _2110 * int(_2106);
    int _2152 = _2150 + _1870;
    float _2154 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2140);
    bool _2156 = uint(_2144) >= uint(_454);
    float _2158 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2162 = float(uint(_2152));
    float _2164 = _864 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2166 = !_2156;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _864 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = as_type<float>(_1729) * _2162;
    int _2174 = ~_2132;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2184 = _2138 + 0.5;
    float _2186 = _1946 + 0.5;
    float _2188 = trunc(_2172);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    int _2194 = _454 * _2178;
    int _2196 = _2194 + _1906;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2200 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2184;
    out.m_73.y = _2186;
    float _2202 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2196 : (-1);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2210 = ~_454;
    int _2212 = _2210 + 1;
    float _2214 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2208;
    out.m_75.y = _2200;
    out.m_75.z = _2202;
    out.m_75.w = _2160;
    float _2220 = exp2(_2214);
    int _2222 = _2206 >> 31;
    float _2224 = _864 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2226 = int(_2106) + int(_2192);
    float _2228 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2230 = _2222 & 3;
    float _2232 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    int _2234 = _2212 * _2226;
    int _2236 = _2234 + _1870;
    float _2238 = -_834;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    float _2242 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    int _2246 = _2206 & 3;
    bool _2248 = _2246 != 0;
    float _2250 = -_834;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    int _2254 = _2206 + _2230;
    float _2256 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2258 = uint(_2236) >= uint(_454);
    float _2260 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2252);
    int _2262 = _2254 >> 2;
    float _2264 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2266 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2256);
    float _2268 = -_834;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    int _2272 = _2262 << 4;
    int _2274 = _2272 + 368;
    float _2276 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2302 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2264);
    float _2304 = _2280 * _2122;
    float _2306 = _2260 * _2122;
    float _2308 = _2282 * _2122;
    float _2310 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2312 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    int _2314 = _2274 + 8;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    uint _2318 = uint(int(uint(int(_2316)) >> uint(2)));
    int _2320 = int(_2316) & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    int _2324 = int(_2316) + 1;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    int _2328 = _2324 & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    float _2332 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2334 = _2206 & 3;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_2312, _2126, _2306);
    int _2340 = _2248 ? 0 : 1;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2232);
    bool _2344 = uint(_2334) > 1u;
    float _2346 = fma(_2332, _2126, _2308);
    bool _2348 = _2334 != 3;
    float _2350 = fma(_2342, _2136, _2338);
    float _2352 = in.m_77.x;
    bool _2354 = !_2258;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    bool _2360 = uint(_2334) >= 2u;
    float _2362 = fma(_2278, -2.0, 3.0);
    int _2364 = ~_2340;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2278 * _2278;
    int _2372 = ~_2226;
    int _2374 = _2372 + _2356;
    int _2376 = _2374 + 1;
    float _2378 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    int _2380 = _2368;
    if (!_2344)
    {
        int _2382 = ~_2340;
        int _2384 = _2382 + 1;
        _2380 = _2384;
    }
    int _2386 = _2380;
    float _2388 = fma(_2310, _2126, _2304);
    bool _2390 = !_2336;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = _2370 * _2362;
    int _2396 = _2360 ? 0 : 1;
    int _2398 = _454 * _2376;
    int _2400 = _2398 + _1870;
    bool _2402 = _2334 != 3;
    float _2404 = _1612 * 0.5;
    int _2406 = abs(_2386);
    float _2408 = -_1674;
    float _2410 = _2408 + 1.0;
    int _2412 = ~_2396;
    int _2414 = _2412 + 1;
    int _2416 = _2414 + 1;
    float _2418 = fma(_2358, _2136, _2388);
    bool _2420 = !_2402;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = fma(_2378, _2136, _2346);
    int _2426 = abs(_2392);
    int _2428 = _2416;
    if (_2348)
    {
        int _2430 = ~_2396;
        int _2432 = _2430 + 1;
        _2428 = _2432;
    }
    int _2434 = _2428;
    int _2436 = ~_2406;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    out.m_79.x = _2418;
    out.m_79.y = _2350;
    out.m_79.z = _2424;
    bool _2442 = !_1860;
    int _2444 = _2442 ? 0 : 1;
    int _2446 = abs(_2422);
    int _2448 = _2440 * as_type<int>(_2298);
    int _2450 = abs(_2434);
    int _2452 = ~_2426;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2444);
    int _2460 = _2456 * as_type<int>(_2290);
    int _2462 = _2460 + _2448;
    int _2464 = ~_2450;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2446;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2468 * as_type<int>(_2322);
    int _2478 = _2476 + _2462;
    int _2480 = ~_2458;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2488 = _2474 * as_type<int>(_2330);
    int _2490 = _2488 + _2478;
    float _2492 = -_2394;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    bool _2498 = !_1715;
    int _2500 = _2498 ? _2400 : (-1);
    int _2502 = _2490 * _2484;
    float _2504 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2506 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2394);
    int _2510 = _2500 * _2458;
    int _2512 = _2510 + _2502;
    float _2514 = fma(_1658, -0.5, _2404);
    float _2516 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2518 = exp2(_2504);
    bool _2520 = _1258 <= 8000.0;
    bool _2522 = isnan(_1258);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = float(_2512);
    float _2534 = _2516 + _1612;
    float _2536 = _1656 + _1612;
    float _2538 = _2530 * _2508;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * 0.5;
    float _2544 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2516;
    out.gl_Position.w = _1612;
    bool _2546 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2548 = isnan(_1394);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2554 = _2550 || _2552;
    float _2556 = _2410 * _2544;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    out.m_81.x = _2542;
    out.m_81.y = _2514;
    out.m_81.z = _2540;
    out.m_81.w = _1612;
    float _2560 = -_2518;
    float _2562 = _2560 + 1.0;
    float _2564 = -_2558;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2532;
    float _2568 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2570 = _2566 * _2352;
    float _2572 = _2568 * _1680;
    float _2574 = _2532;
    float _2576 = _2542;
    if (!_2554)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2578 = _2574;
    float _2580 = _1691 * _2572;
    float _2582 = _1701 * _2572;
    float _2584 = -_2568;
    float _2586 = _2584 + 1.0;
    float _2588 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = fma(_1697, _2580, _1685);
    float _2592 = fma(_1699, _2580, _1687);
    float _2594 = _1691 * _2586;
    float _2596 = fma(_1691, _2582, _1689);
    out.m_85.x = _2588;
    float _2598 = _1310 * _1364;
    float _2600 = _2580;
    float _2602 = _2582;
    float _2604 = _2586;
    float _2606 = _2598;
    float _2608 = _2578;
    float _2610 = _2578;
    if (!_2554)
    {
        _2576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2576;
    out.m_87.x = _2590;
    out.m_87.y = _2592;
    out.m_87.z = _2596;
    out.m_87.w = _2594;
    float _2614 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2616 = _2612;
    float _2618 = _2612;
    if (!_2554)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2620 = _2600;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2554)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _2602;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2554)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2554)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2606;
    bool _2640 = !_2554;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2648 = isnan(_1394);
        bool _2650 = _2646 || _2648;
        bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2654 = _2650 || _2652;
        if (!_2654)
        {
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2658 = _1394 + _2656;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2668 = 1.0 / _2662;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2686 = _2658 * _2668;
            float _2688 = precise::clamp(_2686, 0.0, 1.0);
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2694 = fma(_2688, _2666, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2696 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2702 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2704 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2624 = _2698;
            _2636 = _2702;
            _2618 = _2694;
            _2630 = _2700;
            _2610 = _2696;
            _2644 = _2704;
            _2706 = true;
        }
        else
        {
            bool _2708 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2710 = isnan(_1394);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2716 = _2712 || _2714;
            if (!_2716)
            {
                _2616 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2718 = _2616;
            _2618 = _2718;
            if (!_2716)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2720 = _2622;
            _2624 = _2720;
            if (!_2716)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2722 = _2608;
            _2610 = _2722;
            if (!_2716)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2724 = _2628;
            _2630 = _2724;
            if (!_2716)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2726 = _2634;
            _2636 = _2726;
            if (!_2716)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2728 = _2642;
            bool _2730 = !_2716;
            _2644 = _2728;
            if (!_2730)
            {
                bool _2732 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2734 = isnan(_1394);
                bool _2736 = _2732 || _2734;
                bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2740 = _2736 || _2738;
                if (!_2740)
                {
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2744 = _1394 + _2742;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2754 = 1.0 / _2748;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2772 = _2744 * _2754;
                    float _2774 = precise::clamp(_2772, 0.0, 1.0);
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2624 = _2784;
                    _2636 = _2788;
                    _2618 = _2780;
                    _2630 = _2786;
                    _2610 = _2782;
                    _2644 = _2790;
                    _2706 = true;
                }
                else
                {
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2618 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2706 = false;
    float _2792 = _2624;
    float _2794 = _2636;
    float _2796 = _2618;
    float _2798 = _2630;
    float _2800 = _2610;
    float _2802 = _2644;
    float _2804 = fma(_2350, -0.5, 0.5);
    float _2806 = precise::clamp(_2804, 0.0, 1.0);
    float _2808 = -_2792;
    float _2810 = _2808 + _2794;
    float _2812 = _2614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2814 = -_2796;
    float _2816 = _2814 + _2798;
    out.m_89.x = 0.0;
    float _2818 = fma(_2806, _2810, _2792);
    float _2820 = fma(_2806, _2816, _2796);
    out.m_53.x = _2812;
    float _2822 = -_2800;
    float _2824 = _2822 + _2802;
    float _2826 = _2818 * 0.586610972881317138671875;
    bool _2828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2830 = fma(_2806, _2824, _2800);
    float _2832 = fma(_2820, 0.298911988735198974609375, _2826);
    bool _2834 = _1310 > 0.0;
    bool _2836 = isnan(_1310);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = fma(_2830, 0.114477999508380889892578125, _2832);
    bool _2846 = _1364 <= 0.0;
    bool _2848 = !_2842;
    bool _2850 = _2846 || _2848;
    float _2852 = -_2844;
    float _2854 = _2820 + _2852;
    float _2856 = -_2844;
    float _2858 = _2818 + _2856;
    float _2860 = -_2844;
    float _2862 = _2830 + _2860;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2868 = fma(_2862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    bool _2870 = !_2828;
    if (!_2870)
    {
        float _2872 = -_1248;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2876 = -_1250;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2880 = -_1252;
        float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2884 = _2874 * _2874;
        float _2886 = fma(_2878, _2878, _2884);
        float _2888 = fma(_2882, _2882, _2886);
        float _2890 = sqrt(_2888);
        float _2892 = rsqrt(_2888);
        float _2894 = -_2890;
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = _2878 * _2892;
        float _2904 = _2874 * _2892;
        float _2906 = abs(_2900);
        float _2908 = log2(_2906);
        float _2910 = _2882 * _2892;
        float _2912 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2914 = _2350 * _2904;
        float _2916 = -_2904;
        float _2918 = -_2912;
        float _2920 = fma(_2916, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2918);
        float _2922 = fma(_2418, _2902, _2914);
        float _2924 = -_2910;
        float _2926 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2920);
        float _2928 = fma(_2424, _2910, _2922);
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2934 = _2926 + _2932;
        float _2936 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2938 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2940 = precise::clamp(_2938, 0.0, 1.0);
        float _2942 = exp2(_2936);
        float _2944 = _2942 * _2940;
        float _2946 = _2930 * _2944;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2950 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2948;
        out.m_89.y = _2950;
        out.m_89.z = _2952;
    }
    out.m_91.x = _2864;
    out.m_91.y = _2866;
    out.m_91.z = _2868;
    if (!_2850)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2954;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2706 = false;
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
    float _124 = _107;
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
        float _3022 = as_type<float>(_134);
        out.gl_Position.z = _3022;
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
        float _3077 = as_type<float>(_160);
        out.gl_Position.z = _3077;
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _218 + _252;
    float _256 = 1.0 / _250;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _246;
    bool _262 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_218);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _242;
    float _276 = _226 * _256;
    float _278 = -_238;
    float _280 = _278 + 1.0;
    bool _282 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_218);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _272 * _280;
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = _222 * _260;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_312;
    float _324 = _322 + 1.0;
    float _326 = _312 * _298;
    float _328 = _254 * _274;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _292 * _324;
    float _340 = fma(_316, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -_292;
    float _352 = _350 + 1.0;
    float _354 = _342 * _338;
    float _356 = _344 * _338;
    float _358 = _340 * _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_348, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = fma(_362, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_370, _326, _364);
    float _390 = fma(_368, _276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_378, _276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_372, _326, _374);
    float _396 = fma(_386, _276, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_380, _326, _382);
    float _400 = fma(_390, _294, _388);
    float _402 = fma(_392, _294, _394);
    float _404 = fma(_396, _294, _398);
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _460 = _440 * 2.0;
    float _462 = floor(_456);
    float _464 = _438 * 2.0;
    float _466 = -_442;
    float _468 = fma(_458, 2.0, _466);
    float _470 = _440 + _438;
    float _472 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _440 + _432;
    float _476 = float(_454);
    float _478 = _470 + (-1.0);
    float _480 = exp2(_450);
    float _482 = fma(_472, -2.0, _448);
    float _484 = _474 + (-1.0);
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _488 = _476 * _116;
    float _490 = -_116;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = floor(_464);
    float _506 = float(_446);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _524 = floor(_460);
    bool _526 = !_516;
    int _528 = _526 ? 0 : 1;
    bool _530 = _462 > 0.0;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    int _536 = _502 ? 0 : 1;
    float _538 = in.m_59.x;
    float _540 = in.m_59.y;
    float _542 = in.m_59.z;
    bool _544 = !_512;
    int _546 = _544 ? 0 : 1;
    float _548 = 1.0 / _506;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    bool _560 = _504 > 0.0;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    int _572 = ~_536;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 > 0.0;
    bool _580 = _524 >= 0.0;
    bool _582 = isnan(_524);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _592 = 1.0 + _590;
    int _594 = _576;
    if (!_530)
    {
        int _596 = ~_536;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = 1.0 / _592;
    bool _604 = !_520;
    int _606 = _604 ? 0 : 1;
    float _608 = _548 * _116;
    float _610 = _558 ? _534 : 0.0;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _624 = _622 != 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _570 ? 0 : 1;
    float _630 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _632 = float(_600);
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    bool _636 = !_616;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _630);
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    int _654 = abs(_638);
    bool _656 = !_620;
    int _658 = _656 ? 0 : 1;
    int _660 = ~_628;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_654);
    int _668 = abs(_658);
    int _670 = _664;
    if (_650)
    {
        float _672 = _610 * _602;
        _126 = _672;
    }
    float _674 = _126;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _670 = _678;
    }
    int _680 = _670;
    float _682 = _666 * _632;
    float _684 = float(_668);
    float _686 = _438 + (-0.5);
    int _688 = _588 ? 0 : 1;
    float _690 = _682 * (-2.0);
    float _692 = float(_680);
    float _694 = fma(_690, _538, _538);
    float _696 = fma(_486, _690, _486);
    float _698 = _684 * _692;
    bool _700 = !_624;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = _698 * (-2.0);
    int _714 = _710;
    if (!_578)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_696, _674, _704);
    int _724 = abs(_702);
    float _726 = _440 + (-0.5);
    float _728 = float(_720);
    float _730 = fma(_712, _540, _540);
    float _732 = float(_724);
    float _734 = fma(_508, _712, _508);
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _738 = _432 + _438;
    float _740 = _732 * _728;
    float _742 = _432 + (-0.5);
    float _744 = fma(_734, _674, _736);
    float _746 = _738 + (-1.0);
    float _748 = _740 * (-2.0);
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _722 * 0.15915493667125701904296875;
    float _758 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _760 = fma(_748, _542, _542);
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = _744 * 0.15915493667125701904296875;
    float _770 = fma(_758, _748, _758);
    float _772 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _674, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _768 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _768 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _408 * _752;
    float _792 = _410 * _754;
    float _794 = _406 * _750;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _816 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _804 * _796;
    float _820 = _812 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _788;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _810 * _784;
    float _838 = _810 * _788;
    float _840 = _776 * _826;
    float _842 = _788 * _826;
    float _844 = _810 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _818;
    float _850 = _844 * _818;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_818;
    float _860 = _834 * _858;
    float _862 = -_838;
    float _864 = fma(_834, _822, _862);
    float _866 = fma(_852, _820, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_842, _820, _860);
    float _872 = fma(_856, _820, _850);
    float _874 = fma(_864, _830, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_846, _830, _870);
    float _880 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = fma(_868, _830, _872);
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _914 = _902 + _906;
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _918 = _908 + _912;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _916);
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = _924 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _934 = fma(_928, _928, _930);
    float _936 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _938 = sqrt(_934);
    float _940 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _946);
    float _952 = _932 + _948;
    bool _954 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _944;
    float _958 = _946;
    float _960 = _948;
    float _962 = _934;
    float _964 = _938;
    float _966 = _932;
    float _968 = _908;
    if (!_954)
    {
        _956 = _918;
    }
    float _970 = _956;
    float _972 = _970;
    if (!_954)
    {
        _958 = _914;
    }
    float _974 = _958;
    float _976 = _974;
    if (!_954)
    {
        _960 = _952;
    }
    float _978 = _960;
    bool _980 = !_954;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _938 + _986;
        float _990 = rsqrt(_934);
        float _992 = _988 * _984;
        float _994 = _952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_952, _1000, _1010);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_922, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
        _962 = _990;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = _962;
    float _1028 = -_932;
    float _1030 = _1028 + _1020;
    float _1032 = _950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = -_908;
    float _1036 = _1034 + _1022;
    float _1038 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1040 = _1030 * _1030;
    float _1042 = -_902;
    float _1044 = _1042 + _1024;
    float _1046 = 1.0 / _1032;
    float _1048 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1038);
    float _1050 = fma(_1036, _1036, _1040);
    float _1052 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1048);
    float _1054 = fma(_1044, _1044, _1050);
    bool _1056 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1058 = isnan(0.5);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1064 = _1060 || _1062;
    float _1066 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1068 = sqrt(_1054);
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1066 + _1032;
    float _1082 = _1080 * _1046;
    float _1084 = _1082 * 0.5;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1088 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1086);
    bool _1090 = _1068 > 0.0;
    float _1092 = 1.0 / _1088;
    float _1094 = _1026;
    float _1096 = _1068;
    float _1098 = _1022;
    float _1100 = _1020;
    float _1102 = _1024;
    float _1104 = _1054;
    if (!_1090)
    {
        _1094 = _1020;
    }
    float _1106 = _1094;
    float _1108 = _1106;
    float _1110 = _1106;
    if (!_1090)
    {
        _1096 = _1024;
    }
    float _1112 = _1096;
    bool _1114 = !_1090;
    float _1116 = _1112;
    float _1118 = 0.0;
    if (!_1114)
    {
        float _1120 = _188 * _188;
        float _1122 = fma(_186, _186, _1120);
        float _1124 = rsqrt(_1054);
        float _1126 = fma(_190, _190, _1122);
        float _1128 = sqrt(_1126);
        float _1130 = _1036 * _1124;
        float _1132 = _1030 * _1124;
        float _1134 = _1044 * _1124;
        bool _1136 = _1128 > 0.0;
        float _1138 = _1128;
        _1118 = _1130;
        _964 = _1126;
        if (!_1136)
        {
            _1108 = _1020;
        }
        float _1140 = _1108;
        _1110 = _1140;
        if (!_1136)
        {
            _1138 = _1024;
        }
        float _1142 = _1138;
        bool _1144 = !_1136;
        _1116 = _1142;
        if (!_1144)
        {
            float _1146 = rsqrt(_1126);
            float _1148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1150 = _188 * _1146;
            float _1152 = _186 * _1146;
            float _1154 = _1132 * _1150;
            float _1156 = _190 * _1146;
            float _1158 = fma(_1130, _1152, _1154);
            float _1160 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1162 = fma(_1134, _1156, _1158);
            float _1164 = _1162 * _1160;
            float _1166 = fma(_186, _1164, _1022);
            float _1168 = fma(_188, _1164, _1020);
            float _1170 = fma(_190, _1164, _1024);
            _1098 = _1166;
            _1110 = _1168;
            _1116 = _1170;
            _964 = _1146;
        }
    }
    float _1172 = _1098;
    float _1174 = _1110;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _964;
    float _1182 = _1176;
    float _1184 = _1178;
    if (_1078)
    {
        _1100 = 1.0;
    }
    float _1186 = _1100;
    float _1188 = _1186;
    if (_1064)
    {
        _1102 = _1172;
    }
    float _1190 = _1102;
    float _1192 = _1190;
    if (_1064)
    {
        _196 = _1174;
    }
    float _1194 = _196;
    float _1196 = _1194;
    if (!_1064)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _932 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _908 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = -_932;
        float _1210 = _1208 + _1174;
        float _1212 = _1200 * _1200;
        float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1216 = _902 + _1214;
        float _1218 = -_902;
        float _1220 = _1218 + _1176;
        float _1222 = fma(_1204, _1204, _1212);
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1226 = fma(_1216, _1216, _1222);
        float _1228 = sqrt(_1226);
        float _1230 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = precise::min(_1228, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1234 = _1232 * _1224;
        float _1236 = _1230 * _1234;
        float _1238 = -_908;
        float _1240 = _1238 + _1172;
        float _1242 = fma(_1210, _1236, _932);
        float _1244 = fma(_1240, _1236, _908);
        float _1246 = fma(_1220, _1236, _902);
        _1196 = _1242;
        _1192 = _1244;
        _1182 = _1246;
    }
    float _1248 = _1196;
    float _1250 = _1192;
    float _1252 = _1182;
    if (_1078)
    {
        _966 = 1.0;
    }
    float _1254 = _966;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1258 = _1092 * _1256;
    float _1260 = _1254;
    if (!_1078)
    {
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1268;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1266 * 0.15915493667125701904296875;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1270;
        float _1298 = 1.0 / _1294;
        float _1300 = _1292 * _1298;
        float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1304 = fma(_1258, _1300, _1302);
        float _1306 = _1304 * _1296;
        float _1308 = precise::clamp(_1306, 0.0, 1.0);
        _1188 = _1308;
    }
    float _1310 = _1188;
    if (!_1078)
    {
        float _1312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1316 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1320;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = _1322 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        float _1340 = _1332 * _1334;
        float _1342 = 1.0 / _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1344;
        float _1348 = 1.0 / _1346;
        float _1350 = _1338 * _1342;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = fma(_1258, _1350, _1352);
        float _1356 = _1354 * _1348;
        float _1358 = precise::clamp(_1356, 0.0, 1.0);
        float _1360 = -_1358;
        float _1362 = _1360 + 1.0;
        _1260 = _1362;
    }
    float _1364 = _1260;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1248 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1250 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1252 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1372, _1372, _1378);
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1376, _1376, _1384);
    float _1390 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = rsqrt(_1388);
    float _1394 = sqrt(_1388);
    float _1396 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1398 = _1372 * _1396;
    float _1400 = _1376 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1384;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    float _1428 = _1404;
    if (_1410)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1410)
    {
        float _1434 = rsqrt(_1406);
        _1418 = _1434;
    }
    float _1436 = _1418;
    if (_1410)
    {
        float _1438 = _1414 * _1432;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1184 = _1442;
    }
    float _1444 = _1184;
    float _1446 = _1432;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1180;
    if (_1410)
    {
        float _1460 = _1444 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        _1458 = _1462;
    }
    float _1464 = _1458;
    float _1466 = -_1396;
    float _1468 = -_1456;
    float _1470 = fma(_1368, _1466, _1468);
    if (_1410)
    {
        float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1472;
    }
    float _1474 = _1104;
    float _1476 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1474;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = fma(_1452, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1410)
    {
        _1480 = _1470;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1410)
    {
        float _1494 = _1464 + (-1.0);
        _968 = _1494;
    }
    float _1496 = _968;
    float _1498 = _1496;
    if (_1410)
    {
        float _1500 = _1436 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1410)
    {
        float _1506 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1506;
    }
    float _1508 = _1498;
    if (_1410)
    {
        float _1510 = _1398 * _1502;
        _1422 = _1510;
    }
    float _1512 = _1422;
    if (_1410)
    {
        float _1514 = _1400 * _1502;
        _1424 = _1514;
    }
    float _1516 = _1424;
    float _1518 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1504);
    if (_1410)
    {
        float _1520 = fma(_1470, _1464, _1508);
        _1492 = _1520;
    }
    float _1522 = _1492;
    if (_1410)
    {
        float _1524 = _1512 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1410)
    {
        float _1528 = _1516 * _1516;
        _1428 = _1528;
    }
    float _1530 = _1428;
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1534 = fma(_1522, _1522, _1526);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = -_1490;
    float _1540 = _1476 + _1538;
    float _1542 = _1534 + _1530;
    float _1544 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1548 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1546);
    float _1550 = precise::clamp(_1548, 0.0, 1.0);
    float _1552 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1558 = rsqrt(_1542);
    float _1560 = -_1550;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1566 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1568 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = abs(_1562);
    float _1580 = log2(_1578);
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1582;
    float _1590 = fma(_1588, _1554, 1.0);
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = _1558 * _1512;
    float _1596 = _1558 * _1522;
    float _1598 = floor(_1552);
    float _1600 = _1558 * _1516;
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1606 = -_1602;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1614 = log2(_1590);
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = fma(_1618, -0.5, 0.5);
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = -_1598;
    float _1626 = _1552 + _1624;
    float _1628 = exp2(_1610);
    float _1630 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1632 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1584);
    float _1634 = _1596 + 1.0;
    float _1636 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1638 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1640 = 1.0 / _1612;
    float _1642 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = _1614 * 0.693147182464599609375;
    float _1646 = fma(_1622, _1642, -0.212114393711090087890625);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = sqrt(_1620);
    float _1652 = -_1596;
    float _1654 = fma(_1628, _1634, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1636);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1638);
    float _1660 = fma(_1622, _1646, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1640;
    float _1666 = _1658 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1650 * 0.636619746685028076171875;
    float2 _5444 = float2(_1540, _1626);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5444, float2(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5444, float2(0.0), isnan(_5444)), level(0.0)).x;
    float _1676 = -_1660;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5460 = float3(_1668, _1670, _1648);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5460, float3(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5460, float3(0.0), isnan(_5460)), level(0.0)).x;
    float3 _5471 = float3(_1668, _1670, _1648);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5487 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_608);
    int _1707 = int(_1705);
    int _1709 = ~_454;
    int _1711 = _1709 + 1;
    float _1713 = _488 * _168;
    bool _1715 = _454 == 0;
    int _1717 = abs(_528);
    int _1719 = abs(_546);
    float _1721 = 1.0 / _1703;
    float _1723 = float(uint(_1707));
    float _1725 = trunc(_1713);
    int _1727 = int(_1725);
    int _1729 = as_type<int>(_1721) + (-2);
    float _1731 = as_type<float>(_1729) * _1723;
    int _1733 = ~_454;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    int _1744 = _1711 * int(_1742);
    int _1746 = _1744 + _1707;
    float _1748 = float(uint(_1746));
    float _1750 = as_type<float>(_1729) * _1748;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = trunc(_1750);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = !_1754;
    float _1764 = _1762 ? 7.345489978790283203125 : 1.0;
    float _1766 = _1764 * _438;
    float _1768 = float(_1707);
    float _1770 = floor(_1766);
    bool _1772 = _1768 >= _476;
    bool _1774 = isnan(_1768);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(_476);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    int _1784 = int(_1742) + int(_1760);
    float _1786 = trunc(_1782);
    int _1788 = int(_1786);
    int _1790 = _1735 * _1784;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1770;
    float _1798 = _1766 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1784;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = _1798 * _476;
    int _1816 = ~_1788;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    bool _1822 = !_1806;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _454 * _1812;
    int _1828 = _1826 + _1707;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1832 = _1830 != 0;
    float _1834 = trunc(_1814);
    int _1836 = int(_1834);
    int _1838 = abs(_1824);
    bool _1840 = !_1715;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    int _1848 = _1842 * _1820;
    int _1850 = _454 + (-1);
    float _1852 = in.m_65.y;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1860 = _1858 != 0;
    int _1862 = _1788 * _1850;
    int _1864 = _1862 + _1848;
    int _1866 = _1864 * _1717;
    int _1868 = _1836 * _1838;
    int _1870 = _1868 + _1707;
    int _1872 = _1727 * _1719;
    int _1874 = _1872 + _1866;
    int _1876 = abs(_606);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1882 = !_1832;
    int _1884 = _1882 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1886 = _440 > 0.5;
    int _1888 = abs(_1884);
    int _1890 = _1870 * _1876;
    int _1892 = _1890 + _1874;
    float _1894 = 1.0 / _1880;
    float _1896 = -_1852;
    float _1898 = _1896 + 1.0;
    int _1900 = ~_454;
    int _1902 = _1900 + 1;
    int _1904 = _1836 * _1888;
    int _1906 = _1904 + _1892;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1912 = as_type<float>(_1888);
    float _1914 = _1852;
    if (_1846)
    {
        float _1916 = in.m_57.x;
        _1912 = _1916;
    }
    float _1918 = _1912;
    if (_1856)
    {
        float _1920 = _1886 ? _1898 : _1852;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = float(uint(_1906));
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1934 = 1.0 / _1910;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1938 = as_type<float>(_1729) * _1928;
    float _1940 = _1926 * _1894;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1944 = -_522;
    float _1946 = fma(_652, _1936, _1944);
    float _1948 = trunc(_1938);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1932 * _1934;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1984 = _430 + _1982;
    bool _1986 = _1918 > 0.5;
    bool _1988 = _1986 && _1846;
    out.m_69.x = _1968;
    out.m_69.y = _1962;
    out.m_69.z = _1964;
    out.m_69.w = _1956;
    bool _1990 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1992 = isnan(_430);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1940, _1984, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2004 = _1902 * int(_1952);
    int _2006 = _2004 + _1906;
    float _2008 = in.m_71.x;
    float _2010 = in.m_71.y;
    float _2012 = in.m_71.z;
    bool _2014 = _764 != 0.0;
    bool _2016 = isnan(_764);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = float(uint(_1870));
    float _2026 = float(uint(_2006));
    bool _2028 = _762 == 0.0;
    bool _2030 = !_2022;
    bool _2032 = _2028 && _2030;
    float _2034 = as_type<float>(_1729) * _2024;
    bool _2036 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2038 = isnan(_430);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = as_type<float>(_1729) * _2026;
    float _2050 = -_1980;
    float _2052 = _2050 + 1.0;
    float _2054 = _1984;
    float _2056 = _1960;
    if (_1846)
    {
        _2054 = _1960;
    }
    float _2058 = _2054;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2062 = _430 + _2060;
    bool _2064 = _766 == 0.0;
    bool _2066 = _2064 && _2032;
    float _2068 = _2000 * _2052;
    float _2070 = trunc(_2048);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = -_2000;
    float _2078 = _2076 + 1.0;
    float _2080 = _2058;
    if (_1988)
    {
        float _2082 = -_2058;
        float _2084 = _2082 + 1.0;
        _2080 = _2084;
    }
    float _2086 = _2080;
    float _2088 = fma(_1966, _2062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2090 = ~_454;
    int _2092 = _2090 + 1;
    float _2094 = _2046 * _2078;
    float _2096 = -_2046;
    float _2098 = _2096 + 1.0;
    if (_1846)
    {
        _2056 = _2086;
    }
    float _2100 = _2056;
    float _2102 = trunc(_2034);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = _2002 * _2094;
    float _2114 = _2010;
    float _2116 = _2008;
    float _2118 = _2012;
    if (!_2066)
    {
        float _2120 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2114 = _2120;
    }
    float _2122 = _2114;
    if (!_2066)
    {
        float _2124 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2116 = _2124;
    }
    float _2126 = _2116;
    float _2128 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2130 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2112);
    int _2132 = int(_1952) + int(_2074);
    if (!_2066)
    {
        float _2134 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = fma(_640, _2128, _492);
    float _2140 = fma(_2088, _2068, _2130);
    int _2142 = _2092 * _2132;
    int _2144 = _2142 + _1906;
    float _2146 = abs(_1258);
    float _2148 = log2(_2146);
    int _2150 = _2110 * int(_2106);
    int _2152 = _2150 + _1870;
    float _2154 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2140);
    bool _2156 = uint(_2144) >= uint(_454);
    float _2158 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2162 = float(uint(_2152));
    float _2164 = _864 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2166 = !_2156;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _864 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = as_type<float>(_1729) * _2162;
    int _2174 = ~_2132;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2184 = _2138 + 0.5;
    float _2186 = _1946 + 0.5;
    float _2188 = trunc(_2172);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    int _2194 = _454 * _2178;
    int _2196 = _2194 + _1906;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2200 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2184;
    out.m_73.y = _2186;
    float _2202 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2196 : (-1);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2210 = ~_454;
    int _2212 = _2210 + 1;
    float _2214 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2208;
    out.m_75.y = _2200;
    out.m_75.z = _2202;
    out.m_75.w = _2160;
    float _2220 = exp2(_2214);
    int _2222 = _2206 >> 31;
    float _2224 = _864 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2226 = int(_2106) + int(_2192);
    float _2228 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2230 = _2222 & 3;
    float _2232 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    int _2234 = _2212 * _2226;
    int _2236 = _2234 + _1870;
    float _2238 = -_834;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    float _2242 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    int _2246 = _2206 & 3;
    bool _2248 = _2246 != 0;
    float _2250 = -_834;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    int _2254 = _2206 + _2230;
    float _2256 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2258 = uint(_2236) >= uint(_454);
    float _2260 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2252);
    int _2262 = _2254 >> 2;
    float _2264 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2266 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2256);
    float _2268 = -_834;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    int _2272 = _2262 << 4;
    int _2274 = _2272 + 368;
    float _2276 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2302 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2264);
    float _2304 = _2280 * _2122;
    float _2306 = _2260 * _2122;
    float _2308 = _2282 * _2122;
    float _2310 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2312 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    int _2314 = _2274 + 8;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    uint _2318 = uint(int(uint(int(_2316)) >> uint(2)));
    int _2320 = int(_2316) & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    int _2324 = int(_2316) + 1;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    int _2328 = _2324 & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    float _2332 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2334 = _2206 & 3;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_2312, _2126, _2306);
    int _2340 = _2248 ? 0 : 1;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2232);
    bool _2344 = uint(_2334) > 1u;
    float _2346 = fma(_2332, _2126, _2308);
    bool _2348 = _2334 != 3;
    float _2350 = fma(_2342, _2136, _2338);
    float _2352 = in.m_77.x;
    bool _2354 = !_2258;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    bool _2360 = uint(_2334) >= 2u;
    float _2362 = fma(_2278, -2.0, 3.0);
    int _2364 = ~_2340;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2278 * _2278;
    int _2372 = ~_2226;
    int _2374 = _2372 + _2356;
    int _2376 = _2374 + 1;
    float _2378 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    int _2380 = _2368;
    if (!_2344)
    {
        int _2382 = ~_2340;
        int _2384 = _2382 + 1;
        _2380 = _2384;
    }
    int _2386 = _2380;
    float _2388 = fma(_2310, _2126, _2304);
    bool _2390 = !_2336;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = _2370 * _2362;
    int _2396 = _2360 ? 0 : 1;
    int _2398 = _454 * _2376;
    int _2400 = _2398 + _1870;
    bool _2402 = _2334 != 3;
    float _2404 = _1612 * 0.5;
    int _2406 = abs(_2386);
    float _2408 = -_1674;
    float _2410 = _2408 + 1.0;
    int _2412 = ~_2396;
    int _2414 = _2412 + 1;
    int _2416 = _2414 + 1;
    float _2418 = fma(_2358, _2136, _2388);
    bool _2420 = !_2402;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = fma(_2378, _2136, _2346);
    int _2426 = abs(_2392);
    int _2428 = _2416;
    if (_2348)
    {
        int _2430 = ~_2396;
        int _2432 = _2430 + 1;
        _2428 = _2432;
    }
    int _2434 = _2428;
    int _2436 = ~_2406;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    out.m_79.x = _2418;
    out.m_79.y = _2350;
    out.m_79.z = _2424;
    bool _2442 = !_1860;
    int _2444 = _2442 ? 0 : 1;
    int _2446 = abs(_2422);
    int _2448 = _2440 * as_type<int>(_2298);
    int _2450 = abs(_2434);
    int _2452 = ~_2426;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2444);
    int _2460 = _2456 * as_type<int>(_2290);
    int _2462 = _2460 + _2448;
    int _2464 = ~_2450;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2446;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2468 * as_type<int>(_2322);
    int _2478 = _2476 + _2462;
    int _2480 = ~_2458;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2488 = _2474 * as_type<int>(_2330);
    int _2490 = _2488 + _2478;
    float _2492 = -_2394;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    bool _2498 = !_1715;
    int _2500 = _2498 ? _2400 : (-1);
    int _2502 = _2490 * _2484;
    float _2504 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2506 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2394);
    int _2510 = _2500 * _2458;
    int _2512 = _2510 + _2502;
    float _2514 = fma(_1658, -0.5, _2404);
    float _2516 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2518 = exp2(_2504);
    bool _2520 = _1258 <= 8000.0;
    bool _2522 = isnan(_1258);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = float(_2512);
    float _2534 = _2516 + _1612;
    float _2536 = _1656 + _1612;
    float _2538 = _2530 * _2508;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * 0.5;
    float _2544 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2516;
    out.gl_Position.w = _1612;
    bool _2546 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2548 = isnan(_1394);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2554 = _2550 || _2552;
    float _2556 = _2410 * _2544;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    out.m_81.x = _2542;
    out.m_81.y = _2514;
    out.m_81.z = _2540;
    out.m_81.w = _1612;
    float _2560 = -_2518;
    float _2562 = _2560 + 1.0;
    float _2564 = -_2558;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2532;
    float _2568 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2570 = _2566 * _2352;
    float _2572 = _2568 * _1680;
    float _2574 = _2532;
    float _2576 = _2542;
    if (!_2554)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2578 = _2574;
    float _2580 = _1691 * _2572;
    float _2582 = _1701 * _2572;
    float _2584 = -_2568;
    float _2586 = _2584 + 1.0;
    float _2588 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = fma(_1697, _2580, _1685);
    float _2592 = fma(_1699, _2580, _1687);
    float _2594 = _1691 * _2586;
    float _2596 = fma(_1691, _2582, _1689);
    out.m_85.x = _2588;
    float _2598 = _1310 * _1364;
    float _2600 = _2580;
    float _2602 = _2582;
    float _2604 = _2586;
    float _2606 = _2598;
    float _2608 = _2578;
    float _2610 = _2578;
    if (!_2554)
    {
        _2576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2576;
    out.m_87.x = _2590;
    out.m_87.y = _2592;
    out.m_87.z = _2596;
    out.m_87.w = _2594;
    float _2614 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2616 = _2612;
    float _2618 = _2612;
    if (!_2554)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2620 = _2600;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2554)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _2602;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2554)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2554)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2606;
    bool _2640 = !_2554;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2648 = isnan(_1394);
        bool _2650 = _2646 || _2648;
        bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2654 = _2650 || _2652;
        if (!_2654)
        {
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2658 = _1394 + _2656;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2668 = 1.0 / _2662;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2686 = _2658 * _2668;
            float _2688 = precise::clamp(_2686, 0.0, 1.0);
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2694 = fma(_2688, _2666, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2696 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2702 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2704 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2624 = _2698;
            _2636 = _2702;
            _2618 = _2694;
            _2630 = _2700;
            _2610 = _2696;
            _2644 = _2704;
            _2706 = true;
        }
        else
        {
            bool _2708 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2710 = isnan(_1394);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2716 = _2712 || _2714;
            if (!_2716)
            {
                _2616 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2718 = _2616;
            _2618 = _2718;
            if (!_2716)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2720 = _2622;
            _2624 = _2720;
            if (!_2716)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2722 = _2608;
            _2610 = _2722;
            if (!_2716)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2724 = _2628;
            _2630 = _2724;
            if (!_2716)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2726 = _2634;
            _2636 = _2726;
            if (!_2716)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2728 = _2642;
            bool _2730 = !_2716;
            _2644 = _2728;
            if (!_2730)
            {
                bool _2732 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2734 = isnan(_1394);
                bool _2736 = _2732 || _2734;
                bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2740 = _2736 || _2738;
                if (!_2740)
                {
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2744 = _1394 + _2742;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2754 = 1.0 / _2748;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2772 = _2744 * _2754;
                    float _2774 = precise::clamp(_2772, 0.0, 1.0);
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2624 = _2784;
                    _2636 = _2788;
                    _2618 = _2780;
                    _2630 = _2786;
                    _2610 = _2782;
                    _2644 = _2790;
                    _2706 = true;
                }
                else
                {
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2618 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2706 = false;
    float _2792 = _2624;
    float _2794 = _2636;
    float _2796 = _2618;
    float _2798 = _2630;
    float _2800 = _2610;
    float _2802 = _2644;
    float _2804 = fma(_2350, -0.5, 0.5);
    float _2806 = precise::clamp(_2804, 0.0, 1.0);
    float _2808 = -_2792;
    float _2810 = _2808 + _2794;
    float _2812 = _2614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2814 = -_2796;
    float _2816 = _2814 + _2798;
    out.m_89.x = 0.0;
    float _2818 = fma(_2806, _2810, _2792);
    float _2820 = fma(_2806, _2816, _2796);
    out.m_53.x = _2812;
    float _2822 = -_2800;
    float _2824 = _2822 + _2802;
    float _2826 = _2818 * 0.586610972881317138671875;
    bool _2828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2830 = fma(_2806, _2824, _2800);
    float _2832 = fma(_2820, 0.298911988735198974609375, _2826);
    bool _2834 = _1310 > 0.0;
    bool _2836 = isnan(_1310);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = fma(_2830, 0.114477999508380889892578125, _2832);
    bool _2846 = _1364 <= 0.0;
    bool _2848 = !_2842;
    bool _2850 = _2846 || _2848;
    float _2852 = -_2844;
    float _2854 = _2820 + _2852;
    float _2856 = -_2844;
    float _2858 = _2818 + _2856;
    float _2860 = -_2844;
    float _2862 = _2830 + _2860;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2868 = fma(_2862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    bool _2870 = !_2828;
    if (!_2870)
    {
        float _2872 = -_1248;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2876 = -_1250;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2880 = -_1252;
        float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2884 = _2874 * _2874;
        float _2886 = fma(_2878, _2878, _2884);
        float _2888 = fma(_2882, _2882, _2886);
        float _2890 = sqrt(_2888);
        float _2892 = rsqrt(_2888);
        float _2894 = -_2890;
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = _2878 * _2892;
        float _2904 = _2874 * _2892;
        float _2906 = abs(_2900);
        float _2908 = log2(_2906);
        float _2910 = _2882 * _2892;
        float _2912 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2914 = _2350 * _2904;
        float _2916 = -_2904;
        float _2918 = -_2912;
        float _2920 = fma(_2916, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2918);
        float _2922 = fma(_2418, _2902, _2914);
        float _2924 = -_2910;
        float _2926 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2920);
        float _2928 = fma(_2424, _2910, _2922);
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2934 = _2926 + _2932;
        float _2936 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2938 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2940 = precise::clamp(_2938, 0.0, 1.0);
        float _2942 = exp2(_2936);
        float _2944 = _2942 * _2940;
        float _2946 = _2930 * _2944;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2950 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2948;
        out.m_89.y = _2950;
        out.m_89.z = _2952;
    }
    out.m_91.x = _2864;
    out.m_91.y = _2866;
    out.m_91.z = _2868;
    if (!_2850)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2954;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2706 = false;
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
    float _124 = _107;
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
        float _3022 = as_type<float>(_134);
        out.gl_Position.z = _3022;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3077 = as_type<float>(_160);
        out.gl_Position.z = _3077;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _218 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _218 + _224;
    bool _228 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _218 + _252;
    float _256 = 1.0 / _250;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _260 = 1.0 / _246;
    bool _262 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_218);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _242;
    float _276 = _226 * _256;
    float _278 = -_238;
    float _280 = _278 + 1.0;
    bool _282 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_218);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _272 * _280;
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = _222 * _260;
    bool _302 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_218);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_312;
    float _324 = _322 + 1.0;
    float _326 = _312 * _298;
    float _328 = _254 * _274;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _292 * _324;
    float _340 = fma(_316, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -_292;
    float _352 = _350 + 1.0;
    float _354 = _342 * _338;
    float _356 = _344 * _338;
    float _358 = _340 * _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _366;
    float _370 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _372 = fma(_348, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _376;
    float _380 = fma(_362, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_370, _326, _364);
    float _390 = fma(_368, _276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _392 = fma(_378, _276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _394 = fma(_372, _326, _374);
    float _396 = fma(_386, _276, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _398 = fma(_380, _326, _382);
    float _400 = fma(_390, _294, _388);
    float _402 = fma(_392, _294, _394);
    float _404 = fma(_396, _294, _398);
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _460 = _440 * 2.0;
    float _462 = floor(_456);
    float _464 = _438 * 2.0;
    float _466 = -_442;
    float _468 = fma(_458, 2.0, _466);
    float _470 = _440 + _438;
    float _472 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _440 + _432;
    float _476 = float(_454);
    float _478 = _470 + (-1.0);
    float _480 = exp2(_450);
    float _482 = fma(_472, -2.0, _448);
    float _484 = _474 + (-1.0);
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _488 = _476 * _116;
    float _490 = -_116;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = floor(_464);
    float _506 = float(_446);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _524 = floor(_460);
    bool _526 = !_516;
    int _528 = _526 ? 0 : 1;
    bool _530 = _462 > 0.0;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    int _536 = _502 ? 0 : 1;
    float _538 = in.m_59.x;
    float _540 = in.m_59.y;
    float _542 = in.m_59.z;
    bool _544 = !_512;
    int _546 = _544 ? 0 : 1;
    float _548 = 1.0 / _506;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    bool _560 = _504 > 0.0;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    int _572 = ~_536;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 > 0.0;
    bool _580 = _524 >= 0.0;
    bool _582 = isnan(_524);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _592 = 1.0 + _590;
    int _594 = _576;
    if (!_530)
    {
        int _596 = ~_536;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = 1.0 / _592;
    bool _604 = !_520;
    int _606 = _604 ? 0 : 1;
    float _608 = _548 * _116;
    float _610 = _558 ? _534 : 0.0;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _624 = _622 != 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _570 ? 0 : 1;
    float _630 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _632 = float(_600);
    float _634 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    bool _636 = !_616;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _630);
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    int _654 = abs(_638);
    bool _656 = !_620;
    int _658 = _656 ? 0 : 1;
    int _660 = ~_628;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = float(_654);
    int _668 = abs(_658);
    int _670 = _664;
    if (_650)
    {
        float _672 = _610 * _602;
        _126 = _672;
    }
    float _674 = _126;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _670 = _678;
    }
    int _680 = _670;
    float _682 = _666 * _632;
    float _684 = float(_668);
    float _686 = _438 + (-0.5);
    int _688 = _588 ? 0 : 1;
    float _690 = _682 * (-2.0);
    float _692 = float(_680);
    float _694 = fma(_690, _538, _538);
    float _696 = fma(_486, _690, _486);
    float _698 = _684 * _692;
    bool _700 = !_624;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _706 = ~_688;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = _698 * (-2.0);
    int _714 = _710;
    if (!_578)
    {
        int _716 = ~_688;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_696, _674, _704);
    int _724 = abs(_702);
    float _726 = _440 + (-0.5);
    float _728 = float(_720);
    float _730 = fma(_712, _540, _540);
    float _732 = float(_724);
    float _734 = fma(_508, _712, _508);
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _738 = _432 + _438;
    float _740 = _732 * _728;
    float _742 = _432 + (-0.5);
    float _744 = fma(_734, _674, _736);
    float _746 = _738 + (-1.0);
    float _748 = _740 * (-2.0);
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _722 * 0.15915493667125701904296875;
    float _758 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _760 = fma(_748, _542, _542);
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = _744 * 0.15915493667125701904296875;
    float _770 = fma(_758, _748, _758);
    float _772 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _674, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _768 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _768 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _408 * _752;
    float _792 = _410 * _754;
    float _794 = _406 * _750;
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _816 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _804 * _796;
    float _820 = _812 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _788;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _810 * _784;
    float _838 = _810 * _788;
    float _840 = _776 * _826;
    float _842 = _788 * _826;
    float _844 = _810 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _818;
    float _850 = _844 * _818;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_818;
    float _860 = _834 * _858;
    float _862 = -_838;
    float _864 = fma(_834, _822, _862);
    float _866 = fma(_852, _820, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_842, _820, _860);
    float _872 = fma(_856, _820, _850);
    float _874 = fma(_864, _830, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_846, _830, _870);
    float _880 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = fma(_868, _830, _872);
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _880);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _914 = _902 + _906;
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _918 = _908 + _912;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _916);
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = _924 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _934 = fma(_928, _928, _930);
    float _936 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _938 = sqrt(_934);
    float _940 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _950 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _946);
    float _952 = _932 + _948;
    bool _954 = _938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _944;
    float _958 = _946;
    float _960 = _948;
    float _962 = _934;
    float _964 = _938;
    float _966 = _932;
    float _968 = _908;
    if (!_954)
    {
        _956 = _918;
    }
    float _970 = _956;
    float _972 = _970;
    if (!_954)
    {
        _958 = _914;
    }
    float _974 = _958;
    float _976 = _974;
    if (!_954)
    {
        _960 = _952;
    }
    float _978 = _960;
    bool _980 = !_954;
    float _982 = _978;
    if (!_980)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _988 = _938 + _986;
        float _990 = rsqrt(_934);
        float _992 = _988 * _984;
        float _994 = _952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _992 * 0.15915493667125701904296875;
        float _998 = _996 * 6.283185482025146484375;
        float _1000 = cos(_998);
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _1000 + (-1.0);
        float _1008 = fma(_1004, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = _990 * _1008;
        float _1014 = fma(_952, _1000, _1010);
        float _1016 = fma(_928, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1018 = fma(_922, _1012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1014;
        _972 = _1016;
        _976 = _1018;
        _962 = _990;
    }
    float _1020 = _982;
    float _1022 = _972;
    float _1024 = _976;
    float _1026 = _962;
    float _1028 = -_932;
    float _1030 = _1028 + _1020;
    float _1032 = _950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = -_908;
    float _1036 = _1034 + _1022;
    float _1038 = _932 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1040 = _1030 * _1030;
    float _1042 = -_902;
    float _1044 = _1042 + _1024;
    float _1046 = 1.0 / _1032;
    float _1048 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1038);
    float _1050 = fma(_1036, _1036, _1040);
    float _1052 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1048);
    float _1054 = fma(_1044, _1044, _1050);
    bool _1056 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1058 = isnan(0.5);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1064 = _1060 || _1062;
    float _1066 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1068 = sqrt(_1054);
    bool _1070 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1072 = isnan(0.5);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1066 + _1032;
    float _1082 = _1080 * _1046;
    float _1084 = _1082 * 0.5;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1088 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1086);
    bool _1090 = _1068 > 0.0;
    float _1092 = 1.0 / _1088;
    float _1094 = _1026;
    float _1096 = _1068;
    float _1098 = _1022;
    float _1100 = _1020;
    float _1102 = _1024;
    float _1104 = _1054;
    if (!_1090)
    {
        _1094 = _1020;
    }
    float _1106 = _1094;
    float _1108 = _1106;
    float _1110 = _1106;
    if (!_1090)
    {
        _1096 = _1024;
    }
    float _1112 = _1096;
    bool _1114 = !_1090;
    float _1116 = _1112;
    float _1118 = 0.0;
    if (!_1114)
    {
        float _1120 = _188 * _188;
        float _1122 = fma(_186, _186, _1120);
        float _1124 = rsqrt(_1054);
        float _1126 = fma(_190, _190, _1122);
        float _1128 = sqrt(_1126);
        float _1130 = _1036 * _1124;
        float _1132 = _1030 * _1124;
        float _1134 = _1044 * _1124;
        bool _1136 = _1128 > 0.0;
        float _1138 = _1128;
        _1118 = _1130;
        _964 = _1126;
        if (!_1136)
        {
            _1108 = _1020;
        }
        float _1140 = _1108;
        _1110 = _1140;
        if (!_1136)
        {
            _1138 = _1024;
        }
        float _1142 = _1138;
        bool _1144 = !_1136;
        _1116 = _1142;
        if (!_1144)
        {
            float _1146 = rsqrt(_1126);
            float _1148 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1150 = _188 * _1146;
            float _1152 = _186 * _1146;
            float _1154 = _1132 * _1150;
            float _1156 = _190 * _1146;
            float _1158 = fma(_1130, _1152, _1154);
            float _1160 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1162 = fma(_1134, _1156, _1158);
            float _1164 = _1162 * _1160;
            float _1166 = fma(_186, _1164, _1022);
            float _1168 = fma(_188, _1164, _1020);
            float _1170 = fma(_190, _1164, _1024);
            _1098 = _1166;
            _1110 = _1168;
            _1116 = _1170;
            _964 = _1146;
        }
    }
    float _1172 = _1098;
    float _1174 = _1110;
    float _1176 = _1116;
    float _1178 = _1118;
    float _1180 = _964;
    float _1182 = _1176;
    float _1184 = _1178;
    if (_1078)
    {
        _1100 = 1.0;
    }
    float _1186 = _1100;
    float _1188 = _1186;
    if (_1064)
    {
        _1102 = _1172;
    }
    float _1190 = _1102;
    float _1192 = _1190;
    if (_1064)
    {
        _196 = _1174;
    }
    float _1194 = _196;
    float _1196 = _1194;
    if (!_1064)
    {
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1200 = _932 + _1198;
        float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1204 = _908 + _1202;
        float _1206 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1208 = -_932;
        float _1210 = _1208 + _1174;
        float _1212 = _1200 * _1200;
        float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1216 = _902 + _1214;
        float _1218 = -_902;
        float _1220 = _1218 + _1176;
        float _1222 = fma(_1204, _1204, _1212);
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1226 = fma(_1216, _1216, _1222);
        float _1228 = sqrt(_1226);
        float _1230 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = precise::min(_1228, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1234 = _1232 * _1224;
        float _1236 = _1230 * _1234;
        float _1238 = -_908;
        float _1240 = _1238 + _1172;
        float _1242 = fma(_1210, _1236, _932);
        float _1244 = fma(_1240, _1236, _908);
        float _1246 = fma(_1220, _1236, _902);
        _1196 = _1242;
        _1192 = _1244;
        _1182 = _1246;
    }
    float _1248 = _1196;
    float _1250 = _1192;
    float _1252 = _1182;
    if (_1078)
    {
        _966 = 1.0;
    }
    float _1254 = _966;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1258 = _1092 * _1256;
    float _1260 = _1254;
    if (!_1078)
    {
        float _1262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1270 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1268;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1266 * 0.15915493667125701904296875;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = 1.0 / _1274;
        float _1284 = _1276 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = _1276 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1286 * _1288;
        float _1296 = 1.0 / _1270;
        float _1298 = 1.0 / _1294;
        float _1300 = _1292 * _1298;
        float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1304 = fma(_1258, _1300, _1302);
        float _1306 = _1304 * _1296;
        float _1308 = precise::clamp(_1306, 0.0, 1.0);
        _1188 = _1308;
    }
    float _1310 = _1188;
    if (!_1078)
    {
        float _1312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1314 = _1312 * 0.15915493667125701904296875;
        float _1316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1316 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1320;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = _1322 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        float _1340 = _1332 * _1334;
        float _1342 = 1.0 / _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1344;
        float _1348 = 1.0 / _1346;
        float _1350 = _1338 * _1342;
        float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1354 = fma(_1258, _1350, _1352);
        float _1356 = _1354 * _1348;
        float _1358 = precise::clamp(_1356, 0.0, 1.0);
        float _1360 = -_1358;
        float _1362 = _1360 + 1.0;
        _1260 = _1362;
    }
    float _1364 = _1260;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1248 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1250 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1252 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1372, _1372, _1378);
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1388 = fma(_1376, _1376, _1384);
    float _1390 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1386);
    float _1392 = rsqrt(_1388);
    float _1394 = sqrt(_1388);
    float _1396 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1398 = _1372 * _1396;
    float _1400 = _1376 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1384;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    float _1428 = _1404;
    if (_1410)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1430;
    }
    float _1432 = _1416;
    if (_1410)
    {
        float _1434 = rsqrt(_1406);
        _1418 = _1434;
    }
    float _1436 = _1418;
    if (_1410)
    {
        float _1438 = _1414 * _1432;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1184 = _1442;
    }
    float _1444 = _1184;
    float _1446 = _1432;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1180;
    if (_1410)
    {
        float _1460 = _1444 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        _1458 = _1462;
    }
    float _1464 = _1458;
    float _1466 = -_1396;
    float _1468 = -_1456;
    float _1470 = fma(_1368, _1466, _1468);
    if (_1410)
    {
        float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1472;
    }
    float _1474 = _1104;
    float _1476 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1474;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = fma(_1452, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1410)
    {
        _1480 = _1470;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1410)
    {
        float _1494 = _1464 + (-1.0);
        _968 = _1494;
    }
    float _1496 = _968;
    float _1498 = _1496;
    if (_1410)
    {
        float _1500 = _1436 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1410)
    {
        float _1506 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1506;
    }
    float _1508 = _1498;
    if (_1410)
    {
        float _1510 = _1398 * _1502;
        _1422 = _1510;
    }
    float _1512 = _1422;
    if (_1410)
    {
        float _1514 = _1400 * _1502;
        _1424 = _1514;
    }
    float _1516 = _1424;
    float _1518 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1504);
    if (_1410)
    {
        float _1520 = fma(_1470, _1464, _1508);
        _1492 = _1520;
    }
    float _1522 = _1492;
    if (_1410)
    {
        float _1524 = _1512 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1410)
    {
        float _1528 = _1516 * _1516;
        _1428 = _1528;
    }
    float _1530 = _1428;
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1534 = fma(_1522, _1522, _1526);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = -_1490;
    float _1540 = _1476 + _1538;
    float _1542 = _1534 + _1530;
    float _1544 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1548 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1546);
    float _1550 = precise::clamp(_1548, 0.0, 1.0);
    float _1552 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1558 = rsqrt(_1542);
    float _1560 = -_1550;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1566 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1556);
    float _1568 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1564);
    float _1574 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = abs(_1562);
    float _1580 = log2(_1578);
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1582;
    float _1590 = fma(_1588, _1554, 1.0);
    float _1592 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1594 = _1558 * _1512;
    float _1596 = _1558 * _1522;
    float _1598 = floor(_1552);
    float _1600 = _1558 * _1516;
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1606 = -_1602;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1614 = log2(_1590);
    float _1616 = -_1600;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1620 = fma(_1618, -0.5, 0.5);
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = -_1598;
    float _1626 = _1552 + _1624;
    float _1628 = exp2(_1610);
    float _1630 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1632 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1584);
    float _1634 = _1596 + 1.0;
    float _1636 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1638 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1632);
    float _1640 = 1.0 / _1612;
    float _1642 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1644 = _1614 * 0.693147182464599609375;
    float _1646 = fma(_1622, _1642, -0.212114393711090087890625);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = sqrt(_1620);
    float _1652 = -_1596;
    float _1654 = fma(_1628, _1634, _1652);
    float _1656 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1636);
    float _1658 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1638);
    float _1660 = fma(_1622, _1646, 1.570728778839111328125);
    float _1662 = fma(_1654, 0.5, 0.5);
    float _1664 = _1656 * _1640;
    float _1666 = _1658 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1650 * 0.636619746685028076171875;
    float2 _5444 = float2(_1540, _1626);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5444, float2(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5444, float2(0.0), isnan(_5444)), level(0.0)).x;
    float _1676 = -_1660;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5460 = float3(_1668, _1670, _1648);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5460, float3(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5460, float3(0.0), isnan(_5460)), level(0.0)).x;
    float3 _5471 = float3(_1668, _1670, _1648);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5471, float3(0.0), isnan(_5471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5471, float3(0.0), isnan(_5471)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5487 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_608);
    int _1707 = int(_1705);
    int _1709 = ~_454;
    int _1711 = _1709 + 1;
    float _1713 = _488 * _168;
    bool _1715 = _454 == 0;
    int _1717 = abs(_528);
    int _1719 = abs(_546);
    float _1721 = 1.0 / _1703;
    float _1723 = float(uint(_1707));
    float _1725 = trunc(_1713);
    int _1727 = int(_1725);
    int _1729 = as_type<int>(_1721) + (-2);
    float _1731 = as_type<float>(_1729) * _1723;
    int _1733 = ~_454;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    int _1744 = _1711 * int(_1742);
    int _1746 = _1744 + _1707;
    float _1748 = float(uint(_1746));
    float _1750 = as_type<float>(_1729) * _1748;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = trunc(_1750);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = !_1754;
    float _1764 = _1762 ? 7.345489978790283203125 : 1.0;
    float _1766 = _1764 * _438;
    float _1768 = float(_1707);
    float _1770 = floor(_1766);
    bool _1772 = _1768 >= _476;
    bool _1774 = isnan(_1768);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(_476);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    int _1784 = int(_1742) + int(_1760);
    float _1786 = trunc(_1782);
    int _1788 = int(_1786);
    int _1790 = _1735 * _1784;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1770;
    float _1798 = _1766 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1784;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = _1798 * _476;
    int _1816 = ~_1788;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    bool _1822 = !_1806;
    int _1824 = _1822 ? 0 : 1;
    int _1826 = _454 * _1812;
    int _1828 = _1826 + _1707;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1832 = _1830 != 0;
    float _1834 = trunc(_1814);
    int _1836 = int(_1834);
    int _1838 = abs(_1824);
    bool _1840 = !_1715;
    int _1842 = _1840 ? _1828 : (-1);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    int _1848 = _1842 * _1820;
    int _1850 = _454 + (-1);
    float _1852 = in.m_65.y;
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1856 = _1854 != 0;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1860 = _1858 != 0;
    int _1862 = _1788 * _1850;
    int _1864 = _1862 + _1848;
    int _1866 = _1864 * _1717;
    int _1868 = _1836 * _1838;
    int _1870 = _1868 + _1707;
    int _1872 = _1727 * _1719;
    int _1874 = _1872 + _1866;
    int _1876 = abs(_606);
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1882 = !_1832;
    int _1884 = _1882 ? 0 : 1;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1886 = _440 > 0.5;
    int _1888 = abs(_1884);
    int _1890 = _1870 * _1876;
    int _1892 = _1890 + _1874;
    float _1894 = 1.0 / _1880;
    float _1896 = -_1852;
    float _1898 = _1896 + 1.0;
    int _1900 = ~_454;
    int _1902 = _1900 + 1;
    int _1904 = _1836 * _1888;
    int _1906 = _1904 + _1892;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1912 = as_type<float>(_1888);
    float _1914 = _1852;
    if (_1846)
    {
        float _1916 = in.m_57.x;
        _1912 = _1916;
    }
    float _1918 = _1912;
    if (_1856)
    {
        float _1920 = _1886 ? _1898 : _1852;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = float(uint(_1906));
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1934 = 1.0 / _1910;
    float _1936 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1938 = as_type<float>(_1729) * _1928;
    float _1940 = _1926 * _1894;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1944 = -_522;
    float _1946 = fma(_652, _1936, _1944);
    float _1948 = trunc(_1938);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1932 * _1934;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1970 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1972 = isnan(_430);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1978 = _1974 || _1976;
    float _1980 = float(_1978);
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1984 = _430 + _1982;
    bool _1986 = _1918 > 0.5;
    bool _1988 = _1986 && _1846;
    out.m_69.x = _1968;
    out.m_69.y = _1962;
    out.m_69.z = _1964;
    out.m_69.w = _1956;
    bool _1990 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1992 = isnan(_430);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1940, _1984, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _2004 = _1902 * int(_1952);
    int _2006 = _2004 + _1906;
    float _2008 = in.m_71.x;
    float _2010 = in.m_71.y;
    float _2012 = in.m_71.z;
    bool _2014 = _764 != 0.0;
    bool _2016 = isnan(_764);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = float(uint(_1870));
    float _2026 = float(uint(_2006));
    bool _2028 = _762 == 0.0;
    bool _2030 = !_2022;
    bool _2032 = _2028 && _2030;
    float _2034 = as_type<float>(_1729) * _2024;
    bool _2036 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2038 = isnan(_430);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = as_type<float>(_1729) * _2026;
    float _2050 = -_1980;
    float _2052 = _2050 + 1.0;
    float _2054 = _1984;
    float _2056 = _1960;
    if (_1846)
    {
        _2054 = _1960;
    }
    float _2058 = _2054;
    float _2060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2062 = _430 + _2060;
    bool _2064 = _766 == 0.0;
    bool _2066 = _2064 && _2032;
    float _2068 = _2000 * _2052;
    float _2070 = trunc(_2048);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    float _2076 = -_2000;
    float _2078 = _2076 + 1.0;
    float _2080 = _2058;
    if (_1988)
    {
        float _2082 = -_2058;
        float _2084 = _2082 + 1.0;
        _2080 = _2084;
    }
    float _2086 = _2080;
    float _2088 = fma(_1966, _2062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _2090 = ~_454;
    int _2092 = _2090 + 1;
    float _2094 = _2046 * _2078;
    float _2096 = -_2046;
    float _2098 = _2096 + 1.0;
    if (_1846)
    {
        _2056 = _2086;
    }
    float _2100 = _2056;
    float _2102 = trunc(_2034);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = _2002 * _2094;
    float _2114 = _2010;
    float _2116 = _2008;
    float _2118 = _2012;
    if (!_2066)
    {
        float _2120 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2114 = _2120;
    }
    float _2122 = _2114;
    if (!_2066)
    {
        float _2124 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2116 = _2124;
    }
    float _2126 = _2116;
    float _2128 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2130 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2112);
    int _2132 = int(_1952) + int(_2074);
    if (!_2066)
    {
        float _2134 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2118 = _2134;
    }
    float _2136 = _2118;
    float _2138 = fma(_640, _2128, _492);
    float _2140 = fma(_2088, _2068, _2130);
    int _2142 = _2092 * _2132;
    int _2144 = _2142 + _1906;
    float _2146 = abs(_1258);
    float _2148 = log2(_2146);
    int _2150 = _2110 * int(_2106);
    int _2152 = _2150 + _1870;
    float _2154 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2140);
    bool _2156 = uint(_2144) >= uint(_454);
    float _2158 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2162 = float(uint(_2152));
    float _2164 = _864 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2166 = !_2156;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _864 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2172 = as_type<float>(_1729) * _2162;
    int _2174 = ~_2132;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2184 = _2138 + 0.5;
    float _2186 = _1946 + 0.5;
    float _2188 = trunc(_2172);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    int _2194 = _454 * _2178;
    int _2196 = _2194 + _1906;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2200 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2184;
    out.m_73.y = _2186;
    float _2202 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2196 : (-1);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2210 = ~_454;
    int _2212 = _2210 + 1;
    float _2214 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2216 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_75.x = _2208;
    out.m_75.y = _2200;
    out.m_75.z = _2202;
    out.m_75.w = _2160;
    float _2220 = exp2(_2214);
    int _2222 = _2206 >> 31;
    float _2224 = _864 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2226 = int(_2106) + int(_2192);
    float _2228 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2164);
    int _2230 = _2222 & 3;
    float _2232 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    int _2234 = _2212 * _2226;
    int _2236 = _2234 + _1870;
    float _2238 = -_834;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    float _2242 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2244 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2170);
    int _2246 = _2206 & 3;
    bool _2248 = _2246 != 0;
    float _2250 = -_834;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    int _2254 = _2206 + _2230;
    float _2256 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2258 = uint(_2236) >= uint(_454);
    float _2260 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2252);
    int _2262 = _2254 >> 2;
    float _2264 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2266 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2256);
    float _2268 = -_834;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    int _2272 = _2262 << 4;
    int _2274 = _2272 + 368;
    float _2276 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2282 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2302 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2264);
    float _2304 = _2280 * _2122;
    float _2306 = _2260 * _2122;
    float _2308 = _2282 * _2122;
    float _2310 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2312 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    int _2314 = _2274 + 8;
    uint _2316 = uint(int(uint(_2314) >> uint(2)));
    uint _2318 = uint(int(uint(int(_2316)) >> uint(2)));
    int _2320 = int(_2316) & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    int _2324 = int(_2316) + 1;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    int _2328 = _2324 & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    float _2332 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2302);
    int _2334 = _2206 & 3;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_2312, _2126, _2306);
    int _2340 = _2248 ? 0 : 1;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2232);
    bool _2344 = uint(_2334) > 1u;
    float _2346 = fma(_2332, _2126, _2308);
    bool _2348 = _2334 != 3;
    float _2350 = fma(_2342, _2136, _2338);
    float _2352 = in.m_77.x;
    bool _2354 = !_2258;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    bool _2360 = uint(_2334) >= 2u;
    float _2362 = fma(_2278, -2.0, 3.0);
    int _2364 = ~_2340;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    float _2370 = _2278 * _2278;
    int _2372 = ~_2226;
    int _2374 = _2372 + _2356;
    int _2376 = _2374 + 1;
    float _2378 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    int _2380 = _2368;
    if (!_2344)
    {
        int _2382 = ~_2340;
        int _2384 = _2382 + 1;
        _2380 = _2384;
    }
    int _2386 = _2380;
    float _2388 = fma(_2310, _2126, _2304);
    bool _2390 = !_2336;
    int _2392 = _2390 ? 0 : 1;
    float _2394 = _2370 * _2362;
    int _2396 = _2360 ? 0 : 1;
    int _2398 = _454 * _2376;
    int _2400 = _2398 + _1870;
    bool _2402 = _2334 != 3;
    float _2404 = _1612 * 0.5;
    int _2406 = abs(_2386);
    float _2408 = -_1674;
    float _2410 = _2408 + 1.0;
    int _2412 = ~_2396;
    int _2414 = _2412 + 1;
    int _2416 = _2414 + 1;
    float _2418 = fma(_2358, _2136, _2388);
    bool _2420 = !_2402;
    int _2422 = _2420 ? 0 : (-1);
    float _2424 = fma(_2378, _2136, _2346);
    int _2426 = abs(_2392);
    int _2428 = _2416;
    if (_2348)
    {
        int _2430 = ~_2396;
        int _2432 = _2430 + 1;
        _2428 = _2432;
    }
    int _2434 = _2428;
    int _2436 = ~_2406;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    out.m_79.x = _2418;
    out.m_79.y = _2350;
    out.m_79.z = _2424;
    bool _2442 = !_1860;
    int _2444 = _2442 ? 0 : 1;
    int _2446 = abs(_2422);
    int _2448 = _2440 * as_type<int>(_2298);
    int _2450 = abs(_2434);
    int _2452 = ~_2426;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = abs(_2444);
    int _2460 = _2456 * as_type<int>(_2290);
    int _2462 = _2460 + _2448;
    int _2464 = ~_2450;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2446;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2468 * as_type<int>(_2322);
    int _2478 = _2476 + _2462;
    int _2480 = ~_2458;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2488 = _2474 * as_type<int>(_2330);
    int _2490 = _2488 + _2478;
    float _2492 = -_2394;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    bool _2498 = !_1715;
    int _2500 = _2498 ? _2400 : (-1);
    int _2502 = _2490 * _2484;
    float _2504 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2506 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2394);
    int _2510 = _2500 * _2458;
    int _2512 = _2510 + _2502;
    float _2514 = fma(_1658, -0.5, _2404);
    float _2516 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2518 = exp2(_2504);
    bool _2520 = _1258 <= 8000.0;
    bool _2522 = isnan(_1258);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = float(_2512);
    float _2534 = _2516 + _1612;
    float _2536 = _1656 + _1612;
    float _2538 = _2530 * _2508;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * 0.5;
    float _2544 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1656;
    out.gl_Position.y = _1658;
    out.gl_Position.z = _2516;
    out.gl_Position.w = _1612;
    bool _2546 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2548 = isnan(_1394);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2554 = _2550 || _2552;
    float _2556 = _2410 * _2544;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    out.m_81.x = _2542;
    out.m_81.y = _2514;
    out.m_81.z = _2540;
    out.m_81.w = _1612;
    float _2560 = -_2518;
    float _2562 = _2560 + 1.0;
    float _2564 = -_2558;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2532;
    float _2568 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2570 = _2566 * _2352;
    float _2572 = _2568 * _1680;
    float _2574 = _2532;
    float _2576 = _2542;
    if (!_2554)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2578 = _2574;
    float _2580 = _1691 * _2572;
    float _2582 = _1701 * _2572;
    float _2584 = -_2568;
    float _2586 = _2584 + 1.0;
    float _2588 = _2570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = fma(_1697, _2580, _1685);
    float _2592 = fma(_1699, _2580, _1687);
    float _2594 = _1691 * _2586;
    float _2596 = fma(_1691, _2582, _1689);
    out.m_85.x = _2588;
    float _2598 = _1310 * _1364;
    float _2600 = _2580;
    float _2602 = _2582;
    float _2604 = _2586;
    float _2606 = _2598;
    float _2608 = _2578;
    float _2610 = _2578;
    if (!_2554)
    {
        _2576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2576;
    out.m_87.x = _2590;
    out.m_87.y = _2592;
    out.m_87.z = _2596;
    out.m_87.w = _2594;
    float _2614 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2616 = _2612;
    float _2618 = _2612;
    if (!_2554)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2620 = _2600;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2554)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _2602;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2554)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2554)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2606;
    bool _2640 = !_2554;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2648 = isnan(_1394);
        bool _2650 = _2646 || _2648;
        bool _2652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2654 = _2650 || _2652;
        if (!_2654)
        {
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2658 = _1394 + _2656;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2668 = 1.0 / _2662;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2686 = _2658 * _2668;
            float _2688 = precise::clamp(_2686, 0.0, 1.0);
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2694 = fma(_2688, _2666, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2696 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2702 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2704 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2624 = _2698;
            _2636 = _2702;
            _2618 = _2694;
            _2630 = _2700;
            _2610 = _2696;
            _2644 = _2704;
            _2706 = true;
        }
        else
        {
            bool _2708 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2710 = isnan(_1394);
            bool _2712 = _2708 || _2710;
            bool _2714 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2716 = _2712 || _2714;
            if (!_2716)
            {
                _2616 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2718 = _2616;
            _2618 = _2718;
            if (!_2716)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2720 = _2622;
            _2624 = _2720;
            if (!_2716)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2722 = _2608;
            _2610 = _2722;
            if (!_2716)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2724 = _2628;
            _2630 = _2724;
            if (!_2716)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2726 = _2634;
            _2636 = _2726;
            if (!_2716)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2728 = _2642;
            bool _2730 = !_2716;
            _2644 = _2728;
            if (!_2730)
            {
                bool _2732 = _1394 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2734 = isnan(_1394);
                bool _2736 = _2732 || _2734;
                bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2740 = _2736 || _2738;
                if (!_2740)
                {
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2744 = _1394 + _2742;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2754 = 1.0 / _2748;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2772 = _2744 * _2754;
                    float _2774 = precise::clamp(_2772, 0.0, 1.0);
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2624 = _2784;
                    _2636 = _2788;
                    _2618 = _2780;
                    _2630 = _2786;
                    _2610 = _2782;
                    _2644 = _2790;
                    _2706 = true;
                }
                else
                {
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2618 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2706 = false;
    float _2792 = _2624;
    float _2794 = _2636;
    float _2796 = _2618;
    float _2798 = _2630;
    float _2800 = _2610;
    float _2802 = _2644;
    float _2804 = fma(_2350, -0.5, 0.5);
    float _2806 = precise::clamp(_2804, 0.0, 1.0);
    float _2808 = -_2792;
    float _2810 = _2808 + _2794;
    float _2812 = _2614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2814 = -_2796;
    float _2816 = _2814 + _2798;
    out.m_89.x = 0.0;
    float _2818 = fma(_2806, _2810, _2792);
    float _2820 = fma(_2806, _2816, _2796);
    out.m_53.x = _2812;
    float _2822 = -_2800;
    float _2824 = _2822 + _2802;
    float _2826 = _2818 * 0.586610972881317138671875;
    bool _2828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2830 = fma(_2806, _2824, _2800);
    float _2832 = fma(_2820, 0.298911988735198974609375, _2826);
    bool _2834 = _1310 > 0.0;
    bool _2836 = isnan(_1310);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan(0.0);
    bool _2842 = _2838 || _2840;
    float _2844 = fma(_2830, 0.114477999508380889892578125, _2832);
    bool _2846 = _1364 <= 0.0;
    bool _2848 = !_2842;
    bool _2850 = _2846 || _2848;
    float _2852 = -_2844;
    float _2854 = _2820 + _2852;
    float _2856 = -_2844;
    float _2858 = _2818 + _2856;
    float _2860 = -_2844;
    float _2862 = _2830 + _2860;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    float _2868 = fma(_2862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2844);
    bool _2870 = !_2828;
    if (!_2870)
    {
        float _2872 = -_1248;
        float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2876 = -_1250;
        float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2880 = -_1252;
        float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2884 = _2874 * _2874;
        float _2886 = fma(_2878, _2878, _2884);
        float _2888 = fma(_2882, _2882, _2886);
        float _2890 = sqrt(_2888);
        float _2892 = rsqrt(_2888);
        float _2894 = -_2890;
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = _2878 * _2892;
        float _2904 = _2874 * _2892;
        float _2906 = abs(_2900);
        float _2908 = log2(_2906);
        float _2910 = _2882 * _2892;
        float _2912 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2914 = _2350 * _2904;
        float _2916 = -_2904;
        float _2918 = -_2912;
        float _2920 = fma(_2916, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2918);
        float _2922 = fma(_2418, _2902, _2914);
        float _2924 = -_2910;
        float _2926 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2920);
        float _2928 = fma(_2424, _2910, _2922);
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2934 = _2926 + _2932;
        float _2936 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2938 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2940 = precise::clamp(_2938, 0.0, 1.0);
        float _2942 = exp2(_2936);
        float _2944 = _2942 * _2940;
        float _2946 = _2930 * _2944;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2950 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2948;
        out.m_89.y = _2950;
        out.m_89.z = _2952;
    }
    out.m_91.x = _2864;
    out.m_91.y = _2866;
    out.m_91.z = _2868;
    if (!_2850)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2954 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2954;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

