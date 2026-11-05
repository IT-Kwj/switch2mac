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
    bool _2704 = false;
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
        float _3020 = as_type<float>(_134);
        out.gl_Position.z = _3020;
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
        float _3075 = as_type<float>(_160);
        out.gl_Position.z = _3075;
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _440 + _438;
    float _460 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = floor(_456);
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _458 + (-1.0);
    float _468 = fma(_460, -2.0, _442);
    float _470 = _440 * 2.0;
    float _472 = _438 * 2.0;
    float _474 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = -_448;
    float _478 = fma(_464, 2.0, _476);
    float _480 = floor(_472);
    float _482 = _440 + _432;
    float _484 = -_116;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _488 = float(_454);
    float _490 = _482 + (-1.0);
    float _492 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = exp2(_450);
    float _506 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = _488 * _116;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = _438 + (-0.5);
    int _524 = _502 ? 0 : 1;
    float _526 = floor(_470);
    bool _528 = !_516;
    int _530 = _528 ? 0 : 1;
    bool _532 = _462 > 0.0;
    float _534 = float(_446);
    bool _536 = !_512;
    int _538 = _536 ? 0 : 1;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _552 = _548 || _550;
    float _554 = in.m_59.x;
    float _556 = in.m_59.y;
    float _558 = in.m_59.z;
    bool _560 = _480 > 0.0;
    float _562 = 1.0 / _534;
    bool _564 = _480 >= 0.0;
    bool _566 = isnan(_480);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    int _574 = ~_524;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = _526 > 0.0;
    bool _582 = _526 >= 0.0;
    bool _584 = isnan(_526);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    int _592 = _578;
    if (!_532)
    {
        int _594 = ~_524;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    bool _600 = !_520;
    int _602 = _600 ? 0 : 1;
    float _604 = _562 * _116;
    float _606 = _552 ? _542 : 0.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _610 = 1.0 + _608;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _572 ? 0 : 1;
    bool _630 = !_614;
    int _632 = _630 ? 0 : 1;
    float _634 = 1.0 / _610;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    int _648 = abs(_632);
    float _650 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _624);
    bool _652 = !_618;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _658 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _660 = float(_598);
    float _662 = float(_648);
    int _664 = ~_628;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    int _670 = abs(_654);
    float _672 = _662 * _660;
    int _674 = _668;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    if (_644)
    {
        float _682 = _606 * _634;
        _126 = _682;
    }
    float _684 = _126;
    int _686 = _590 ? 0 : 1;
    float _688 = _672 * (-2.0);
    float _690 = float(_680);
    float _692 = float(_670);
    float _694 = fma(_688, _554, _554);
    float _696 = fma(_474, _688, _474);
    bool _698 = !_622;
    int _700 = _698 ? 0 : 1;
    float _702 = _692 * _690;
    int _704 = ~_686;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _712 = _708;
    if (!_580)
    {
        int _714 = ~_686;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _702 * (-2.0);
    int _722 = abs(_700);
    float _724 = _440 + (-0.5);
    float _726 = float(_718);
    float _728 = fma(_720, _556, _556);
    float _730 = float(_722);
    float _732 = fma(_506, _720, _506);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _728);
    float _736 = _432 + _438;
    float _738 = _730 * _726;
    float _740 = fma(_696, _684, _710);
    float _742 = fma(_732, _684, _734);
    float _744 = _736 + (-1.0);
    float _746 = _738 * (-2.0);
    float _748 = in.m_61.x;
    float _750 = in.m_61.y;
    float _752 = in.m_61.z;
    float _754 = _432 + (-0.5);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _758 = fma(_746, _558, _558);
    float _760 = _740 * 0.15915493667125701904296875;
    float _762 = _742 * 0.15915493667125701904296875;
    float _764 = in.m_63.x;
    float _766 = in.m_63.y;
    float _768 = in.m_63.z;
    float _770 = fma(_756, _746, _756);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _774 = _760 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _684, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _762 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _406 * _748;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = _410 * _752;
    float _794 = _408 * _750;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _768);
    float _808 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _766);
    float _816 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = _796 * _804;
    float _820 = _808 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _790;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _812 * _784;
    float _838 = _812 * _790;
    float _840 = _776 * _826;
    float _842 = _812 * _826;
    float _844 = _790 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _830;
    float _850 = _842 * _830;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_838;
    float _860 = fma(_834, _822, _858);
    float _862 = -_830;
    float _864 = _834 * _862;
    float _866 = fma(_852, _818, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_856, _818, _850);
    float _872 = fma(_844, _818, _864);
    float _874 = fma(_860, _820, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_868, _820, _870);
    float _880 = fma(_846, _820, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
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
    float _940 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
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
    float _1378 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1380 = _1368 * _1368;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1378);
    float _1386 = fma(_1372, _1372, _1380);
    float _1388 = fma(_1376, _1376, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1372 * _1394;
    float _1398 = _1376 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1386;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1184 = _1440;
    }
    float _1442 = _1184;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1180;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1368, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1470;
    }
    float _1472 = _1104;
    float _1474 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    float _1478 = _1450;
    if (_1408)
    {
        float _1480 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1408)
    {
        _1478 = _1468;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1408)
    {
        float _1492 = _1462 + (-1.0);
        _968 = _1492;
    }
    float _1494 = _968;
    float _1496 = _1494;
    if (_1408)
    {
        float _1498 = _1434 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1408)
    {
        float _1504 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1504;
    }
    float _1506 = _1496;
    if (_1408)
    {
        float _1508 = _1396 * _1500;
        _1420 = _1508;
    }
    float _1510 = _1420;
    if (_1408)
    {
        float _1512 = _1398 * _1500;
        _1422 = _1512;
    }
    float _1514 = _1422;
    float _1516 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    if (_1408)
    {
        float _1518 = fma(_1468, _1462, _1506);
        _1490 = _1518;
    }
    float _1520 = _1490;
    if (_1408)
    {
        float _1522 = _1510 * _1510;
        _1424 = _1522;
    }
    float _1524 = _1424;
    if (_1408)
    {
        float _1526 = _1514 * _1514;
        _1426 = _1526;
    }
    float _1528 = _1426;
    float _1530 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1534 = fma(_1520, _1520, _1524);
    float _1536 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = _1534 + _1528;
    float _1542 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1552 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1554 = rsqrt(_1540);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1564 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = abs(_1560);
    float _1574 = log2(_1572);
    float _1576 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1550);
    float _1584 = -_1488;
    float _1586 = _1474 + _1584;
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1582);
    float _1592 = _1554 * _1510;
    float _1594 = _1554 * _1520;
    float _1596 = floor(_1564);
    float _1598 = _1554 * _1514;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1590);
    float _1604 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1606 = -_1600;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = log2(_1580);
    float _1614 = -_1598;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1618 = fma(_1616, -0.5, 0.5);
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = exp2(_1610);
    float _1624 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = -_1596;
    float _1628 = _1564 + _1626;
    float _1630 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1604);
    float _1632 = _1594 + 1.0;
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1636 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1638 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = 1.0 / _1602;
    float _1642 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1634);
    float _1644 = fma(_1620, _1636, -0.212114393711090087890625);
    float _1646 = _1612 * 0.693147182464599609375;
    float _1648 = fma(_1620, _1644, 1.570728778839111328125);
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1652 = sqrt(_1618);
    float _1654 = -_1594;
    float _1656 = fma(_1622, _1632, _1654);
    float _1658 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1662 = fma(_1656, 0.5, 0.5);
    float _1664 = _1658 * _1640;
    float _1666 = _1660 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1652 * 0.636619746685028076171875;
    float2 _5442 = float2(_1586, _1628);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5442, float2(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5442, float2(0.0), isnan(_5442)), level(0.0)).x;
    float _1676 = -_1648;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5458 = float3(_1668, _1670, _1650);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).x;
    float3 _5469 = float3(_1668, _1670, _1650);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5469, float3(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5469, float3(0.0), isnan(_5469)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5485 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_604);
    int _1707 = int(_1705);
    float _1709 = _508 * _168;
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    bool _1715 = _454 == 0;
    int _1717 = _454 + (-1);
    float _1719 = 1.0 / _1703;
    int _1721 = ~_454;
    int _1723 = _1721 + 1;
    int _1725 = abs(_530);
    float _1727 = float(uint(_1707));
    float _1729 = trunc(_1709);
    int _1731 = int(_1729);
    float _1733 = float(_1707);
    int _1735 = as_type<int>(_1719) + (-2);
    float _1737 = as_type<float>(_1735) * _1727;
    float _1739 = trunc(_1737);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    int _1746 = _1713 * int(_1744);
    int _1748 = _1746 + _1707;
    float _1750 = float(uint(_1748));
    float _1752 = as_type<float>(_1735) * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1756 = _1754 != 0;
    bool _1758 = _1733 >= _488;
    bool _1760 = isnan(_1733);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(_488);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = trunc(_1752);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1756;
    float _1778 = _1776 ? 7.345489978790283203125 : 1.0;
    float _1780 = _1778 * _438;
    float _1782 = trunc(_1768);
    int _1784 = int(_1782);
    float _1786 = floor(_1780);
    int _1788 = int(_1744) + int(_1774);
    int _1790 = _1723 * _1788;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1786;
    float _1798 = _1780 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _488;
    int _1806 = ~_1788;
    int _1808 = _1806 + _1802;
    int _1810 = _1808 + 1;
    float _1812 = trunc(_1804);
    int _1814 = int(_1812);
    int _1816 = _454 * _1810;
    int _1818 = _1816 + _1707;
    int _1820 = ~_1784;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1715;
    int _1832 = _1830 ? _1818 : (-1);
    bool _1834 = !_1828;
    int _1836 = _1834 ? 0 : 1;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    int _1842 = _1832 * _1824;
    int _1844 = abs(_538);
    int _1846 = _1784 * _1717;
    int _1848 = _1846 + _1842;
    int _1850 = abs(_1836);
    int _1852 = _1848 * _1725;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1856 = _430 + _1854;
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1731 * _1844;
    int _1864 = _1862 + _1852;
    int _1866 = abs(_602);
    int _1868 = _1814 * _1850;
    int _1870 = _1868 + _1707;
    int _1872 = abs(_1860);
    float _1874 = in.m_65.y;
    int _1876 = _1870 * _1866;
    int _1878 = _1876 + _1864;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1888 = _1814 * _1872;
    int _1890 = _1888 + _1878;
    bool _1892 = _440 > 0.5;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1896 = _1894 != 0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1902 = float(uint(_1890));
    float _1904 = 1.0 / _1886;
    float _1906 = as_type<float>(_1735) * _1902;
    float _1908 = as_type<float>(_1814);
    if (_1882)
    {
        float _1910 = in.m_57.x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1916 = _1914 != 0;
    float _1918 = 1.0 / _1900;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1920 = ~_454;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1906);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1938 = float(uint(_1870));
    float _1940 = -_1874;
    float _1942 = _1940 + 1.0;
    float _1944 = _1932 * _1904;
    float _1946 = _1936 * _1918;
    float _1948 = _1874;
    if (_1896)
    {
        float _1950 = _1892 ? _1942 : _1874;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1964 = _1922 * int(_1928);
    int _1966 = _1964 + _1890;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1972 = -_492;
    float _1974 = fma(_656, _1962, _1972);
    bool _1976 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1978 = isnan(_430);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1990 = _1912 > 0.5;
    bool _1992 = _1990 && _1882;
    float _1994 = fma(_1944, _1856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1996 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_430);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1986;
    float _2010 = _2008 + 1.0;
    float _2012 = float(uint(_1966));
    out.m_69.x = _1968;
    out.m_69.y = _1970;
    out.m_69.z = _1988;
    bool _2014 = _766 != 0.0;
    bool _2016 = isnan(_766);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = _2006 * _2010;
    float _2026 = -_2006;
    float _2028 = _2026 + 1.0;
    float _2030 = in.m_71.x;
    float _2032 = in.m_71.y;
    float _2034 = in.m_71.z;
    float _2036 = as_type<float>(_1735) * _2012;
    float _2038 = as_type<float>(_1735) * _1938;
    bool _2040 = _764 == 0.0;
    bool _2042 = !_2022;
    bool _2044 = _2040 && _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2048 = _430 + _2046;
    bool _2050 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2052 = isnan(_430);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = trunc(_2036);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _2012;
    float _2070 = _1960;
    if (_1882)
    {
        _2068 = _1960;
    }
    float _2072 = _2068;
    float _2074 = fma(_1946, _2048, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2076 = _768 == 0.0;
    bool _2078 = _2076 && _2044;
    float _2080 = _2060 * _2028;
    int _2082 = ~_454;
    int _2084 = _2082 + 1;
    float _2086 = _2072;
    if (_1992)
    {
        float _2088 = -_2072;
        float _2090 = _2088 + 1.0;
        _2086 = _2090;
    }
    float _2092 = _2086;
    float _2094 = -_2060;
    float _2096 = _2094 + 1.0;
    float _2098 = trunc(_2038);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = _1994 * _2080;
    if (_1882)
    {
        _2070 = _2092;
    }
    float _2106 = _2070;
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2104);
    float _2114 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2116 = _2030;
    float _2118 = _2032;
    float _2120 = _2034;
    if (!_2078)
    {
        float _2122 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (!_2078)
    {
        float _2126 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2118 = _2126;
    }
    float _2128 = _2118;
    int _2130 = int(_1928) + int(_2066);
    float _2132 = fma(_2074, _2024, _2112);
    float _2134 = fma(_658, _2114, _486);
    if (!_2078)
    {
        float _2136 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2120 = _2136;
    }
    float _2138 = _2120;
    int _2140 = _2110 * int(_2102);
    int _2142 = _2140 + _1870;
    float _2144 = abs(_1258);
    float _2146 = log2(_2144);
    int _2148 = _2084 * _2130;
    int _2150 = _2148 + _1890;
    float _2152 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2132);
    float _2154 = _2134 + 0.5;
    float _2156 = float(uint(_2142));
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2160 = uint(_2150) >= uint(_454);
    float _2162 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2164 = as_type<float>(_1735) * _2156;
    bool _2166 = !_2160;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2162);
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2174 = ~_2130;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2164);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = _1974 + 0.5;
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2192 = _454 * _2178;
    int _2194 = _2192 + _1890;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2198 = ~_454;
    int _2200 = _2198 + 1;
    out.m_73.x = _2154;
    out.m_73.y = _2186;
    float _2202 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2194 : (-1);
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2214 = exp2(_2188);
    int _2216 = int(_2102) + int(_2184);
    out.m_75.x = _2202;
    out.m_75.y = _2208;
    out.m_75.z = _2210;
    out.m_75.w = _2158;
    int _2218 = _2206 >> 31;
    float _2220 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2222 = _2218 & 3;
    float _2224 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = _2206 & 3;
    bool _2228 = _2226 != 0;
    float _2230 = -_834;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    int _2234 = _2206 + _2222;
    float _2236 = -_834;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2240 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2242 = _2200 * _2216;
    int _2244 = _2242 + _1870;
    float _2246 = -_834;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2250 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2252 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2256 = precise::clamp(_2254, 0.0, 1.0);
    float _2258 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    int _2260 = _2234 >> 2;
    float _2262 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2266 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2268 = _2260 << 4;
    int _2270 = _2268 + 368;
    float _2272 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2274 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2276 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    uint _2278 = uint(int(uint(_2270) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    float _2294 = _2250 * _2128;
    float _2296 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2298 = _2258 * _2128;
    int _2300 = _2206 & 3;
    bool _2302 = _2300 != 0;
    float _2304 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2264);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2308 = _2272 * _2128;
    int _2310 = _2270 + 8;
    uint _2312 = uint(int(uint(_2310) >> uint(2)));
    uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
    int _2316 = int(_2312) & 3;
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[int(_2314)][_2316];
    int _2320 = int(_2312) + 1;
    uint _2322 = uint(int(uint(_2320) >> uint(2)));
    int _2324 = _2320 & 3;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[int(_2322)][_2324];
    bool _2328 = uint(_2300) > 1u;
    float _2330 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    bool _2332 = uint(_2244) >= uint(_454);
    float _2334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    int _2336 = _2228 ? 0 : 1;
    float _2338 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    bool _2340 = _2300 != 3;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    float _2344 = fma(_2256, -2.0, 3.0);
    float _2346 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2348 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2350 = _2256 * _2256;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = fma(_2334, _2124, _2298);
    bool _2358 = uint(_2300) >= 2u;
    float _2360 = _2350 * _2344;
    int _2362 = ~_2336;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2338, _2124, _2308);
    int _2370 = _2366;
    if (!_2328)
    {
        int _2372 = ~_2336;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = fma(_2330, _2124, _2294);
    bool _2380 = !_2302;
    int _2382 = _2380 ? 0 : 1;
    float _2384 = fma(_2346, _2138, _2356);
    int _2386 = _2358 ? 0 : 1;
    float _2388 = in.m_77.x;
    bool _2390 = _2300 != 3;
    float _2392 = -_1674;
    float _2394 = _2392 + 1.0;
    int _2396 = abs(_2376);
    float _2398 = fma(_2342, _2138, _2378);
    int _2400 = ~_2216;
    int _2402 = _2400 + _2354;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2348, _2138, _2368);
    int _2408 = abs(_2382);
    int _2410 = ~_2386;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = _454 * _2404;
    int _2418 = _2416 + _1870;
    bool _2420 = !_2390;
    int _2422 = _2420 ? 0 : (-1);
    out.m_79.x = _2398;
    out.m_79.y = _2384;
    out.m_79.z = _2406;
    int _2424 = _2414;
    if (_2340)
    {
        int _2426 = ~_2386;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    int _2432 = ~_2396;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_1916;
    int _2440 = _2438 ? 0 : 1;
    int _2442 = abs(_2422);
    int _2444 = _2436 * as_type<int>(_2292);
    int _2446 = abs(_2430);
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = abs(_2440);
    int _2456 = _2452 * as_type<int>(_2284);
    int _2458 = _2456 + _2444;
    int _2460 = ~_2446;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2442;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2464 * as_type<int>(_2318);
    int _2474 = _2472 + _2458;
    int _2476 = ~_2454;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    float _2482 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2484 = _2470 * as_type<int>(_2326);
    int _2486 = _2484 + _2474;
    float _2488 = -_2360;
    float _2490 = _2488 + 1.0;
    float _2492 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    bool _2494 = !_1715;
    int _2496 = _2494 ? _2418 : (-1);
    int _2498 = _2486 * _2480;
    float _2500 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2502 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2492);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2360);
    float _2506 = _1602 * 0.5;
    int _2508 = _2496 * _2454;
    int _2510 = _2508 + _2498;
    float _2512 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2502);
    float _2514 = exp2(_2500);
    bool _2516 = _1258 <= 8000.0;
    bool _2518 = isnan(_1258);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(8000.0);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_1660, -0.5, _2506);
    float _2530 = float(_2510);
    float _2532 = _2512 + _1602;
    float _2534 = _1658 + _1602;
    float _2536 = _2526 * _2504;
    float _2538 = _2532 * 0.5;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2512;
    out.gl_Position.w = _1602;
    bool _2544 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2546 = isnan(_1392);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2552 = _2548 || _2550;
    float _2554 = _2394 * _2542;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    out.m_81.x = _2540;
    out.m_81.y = _2528;
    out.m_81.z = _2538;
    out.m_81.w = _1602;
    float _2558 = -_2514;
    float _2560 = _2558 + 1.0;
    float _2562 = -_2556;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2530;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2568 = _2564 * _2388;
    float _2570 = _2566 * _1680;
    float _2572 = _2530;
    float _2574 = _2540;
    if (!_2552)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2576 = _2572;
    float _2578 = _1691 * _2570;
    float _2580 = _1701 * _2570;
    float _2582 = -_2566;
    float _2584 = _2582 + 1.0;
    float _2586 = _2568 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2588 = fma(_1697, _2578, _1685);
    float _2590 = fma(_1699, _2578, _1687);
    float _2592 = _1691 * _2584;
    float _2594 = fma(_1691, _2580, _1689);
    out.m_85.x = _2586;
    float _2596 = _1310 * _1364;
    float _2598 = _2578;
    float _2600 = _2580;
    float _2602 = _2584;
    float _2604 = _2596;
    float _2606 = _2576;
    float _2608 = _2576;
    if (!_2552)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2610 = _2574;
    out.m_87.x = _2588;
    out.m_87.y = _2590;
    out.m_87.z = _2594;
    out.m_87.w = _2592;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2614 = _2610;
    float _2616 = _2610;
    if (!_2552)
    {
        _2598 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2598;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2552)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2624 = _2600;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2552)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2630 = _2602;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2552)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2636 = _2604;
    bool _2638 = !_2552;
    float _2640 = _2636;
    float _2642 = _2636;
    if (!_2638)
    {
        bool _2644 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2646 = isnan(_1392);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2656 = _1392 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2666 = 1.0 / _2660;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2684 = _2656 * _2666;
            float _2686 = precise::clamp(_2684, 0.0, 1.0);
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2696;
            _2634 = _2700;
            _2616 = _2692;
            _2628 = _2698;
            _2608 = _2694;
            _2642 = _2702;
            _2704 = true;
        }
        else
        {
            bool _2706 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2708 = isnan(_1392);
            bool _2710 = _2706 || _2708;
            bool _2712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2714 = _2710 || _2712;
            if (!_2714)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2716 = _2614;
            _2616 = _2716;
            if (!_2714)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2718 = _2620;
            _2622 = _2718;
            if (!_2714)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2720 = _2606;
            _2608 = _2720;
            if (!_2714)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2722 = _2626;
            _2628 = _2722;
            if (!_2714)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2724 = _2632;
            _2634 = _2724;
            if (!_2714)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2726 = _2640;
            bool _2728 = !_2714;
            _2642 = _2726;
            if (!_2728)
            {
                bool _2730 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2732 = isnan(_1392);
                bool _2734 = _2730 || _2732;
                bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2738 = _2734 || _2736;
                if (!_2738)
                {
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2742 = _1392 + _2740;
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = 1.0 / _2746;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2770 = _2742 * _2752;
                    float _2772 = precise::clamp(_2770, 0.0, 1.0);
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2778 = fma(_2772, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2782;
                    _2634 = _2786;
                    _2616 = _2778;
                    _2628 = _2784;
                    _2608 = _2780;
                    _2642 = _2788;
                    _2704 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2704 = false;
    float _2790 = _2622;
    float _2792 = _2634;
    float _2794 = _2616;
    float _2796 = _2628;
    float _2798 = _2608;
    float _2800 = _2642;
    float _2802 = fma(_2384, -0.5, 0.5);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = -_2790;
    float _2808 = _2806 + _2792;
    float _2810 = _2612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = -_2794;
    float _2814 = _2812 + _2796;
    out.m_89.x = 0.0;
    float _2816 = fma(_2804, _2808, _2790);
    float _2818 = fma(_2804, _2814, _2794);
    out.m_53.x = _2810;
    float _2820 = -_2798;
    float _2822 = _2820 + _2800;
    float _2824 = _2816 * 0.586610972881317138671875;
    bool _2826 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2828 = fma(_2804, _2822, _2798);
    float _2830 = fma(_2818, 0.298911988735198974609375, _2824);
    bool _2832 = _1310 > 0.0;
    bool _2834 = isnan(_1310);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.0);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2828, 0.114477999508380889892578125, _2830);
    bool _2844 = _1364 <= 0.0;
    bool _2846 = !_2840;
    bool _2848 = _2844 || _2846;
    float _2850 = -_2842;
    float _2852 = _2818 + _2850;
    float _2854 = -_2842;
    float _2856 = _2816 + _2854;
    float _2858 = -_2842;
    float _2860 = _2828 + _2858;
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2866 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    bool _2868 = !_2826;
    if (!_2868)
    {
        float _2870 = -_1248;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2874 = -_1250;
        float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2878 = -_1252;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2882 = _2872 * _2872;
        float _2884 = fma(_2876, _2876, _2882);
        float _2886 = fma(_2880, _2880, _2884);
        float _2888 = sqrt(_2886);
        float _2890 = rsqrt(_2886);
        float _2892 = -_2888;
        float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = _2876 * _2890;
        float _2902 = _2872 * _2890;
        float _2904 = abs(_2898);
        float _2906 = log2(_2904);
        float _2908 = _2880 * _2890;
        float _2910 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2912 = _2384 * _2902;
        float _2914 = -_2902;
        float _2916 = -_2910;
        float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2916);
        float _2920 = fma(_2398, _2900, _2912);
        float _2922 = -_2908;
        float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2918);
        float _2926 = fma(_2406, _2908, _2920);
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2932 = _2924 + _2930;
        float _2934 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = exp2(_2934);
        float _2942 = _2940 * _2938;
        float _2944 = _2928 * _2942;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2948 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2950 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2946;
        out.m_89.y = _2948;
        out.m_89.z = _2950;
    }
    out.m_91.x = _2862;
    out.m_91.y = _2864;
    out.m_91.z = _2866;
    if (!_2848)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2952;
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
    bool _2704 = false;
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
        float _3020 = as_type<float>(_134);
        out.gl_Position.z = _3020;
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
        float _3075 = as_type<float>(_160);
        out.gl_Position.z = _3075;
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _440 + _438;
    float _460 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = floor(_456);
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _458 + (-1.0);
    float _468 = fma(_460, -2.0, _442);
    float _470 = _440 * 2.0;
    float _472 = _438 * 2.0;
    float _474 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = -_448;
    float _478 = fma(_464, 2.0, _476);
    float _480 = floor(_472);
    float _482 = _440 + _432;
    float _484 = -_116;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _488 = float(_454);
    float _490 = _482 + (-1.0);
    float _492 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = exp2(_450);
    float _506 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = _488 * _116;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = _438 + (-0.5);
    int _524 = _502 ? 0 : 1;
    float _526 = floor(_470);
    bool _528 = !_516;
    int _530 = _528 ? 0 : 1;
    bool _532 = _462 > 0.0;
    float _534 = float(_446);
    bool _536 = !_512;
    int _538 = _536 ? 0 : 1;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _552 = _548 || _550;
    float _554 = in.m_59.x;
    float _556 = in.m_59.y;
    float _558 = in.m_59.z;
    bool _560 = _480 > 0.0;
    float _562 = 1.0 / _534;
    bool _564 = _480 >= 0.0;
    bool _566 = isnan(_480);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    int _574 = ~_524;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = _526 > 0.0;
    bool _582 = _526 >= 0.0;
    bool _584 = isnan(_526);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    int _592 = _578;
    if (!_532)
    {
        int _594 = ~_524;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    bool _600 = !_520;
    int _602 = _600 ? 0 : 1;
    float _604 = _562 * _116;
    float _606 = _552 ? _542 : 0.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _610 = 1.0 + _608;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _572 ? 0 : 1;
    bool _630 = !_614;
    int _632 = _630 ? 0 : 1;
    float _634 = 1.0 / _610;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    int _648 = abs(_632);
    float _650 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _624);
    bool _652 = !_618;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _658 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _660 = float(_598);
    float _662 = float(_648);
    int _664 = ~_628;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    int _670 = abs(_654);
    float _672 = _662 * _660;
    int _674 = _668;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    if (_644)
    {
        float _682 = _606 * _634;
        _126 = _682;
    }
    float _684 = _126;
    int _686 = _590 ? 0 : 1;
    float _688 = _672 * (-2.0);
    float _690 = float(_680);
    float _692 = float(_670);
    float _694 = fma(_688, _554, _554);
    float _696 = fma(_474, _688, _474);
    bool _698 = !_622;
    int _700 = _698 ? 0 : 1;
    float _702 = _692 * _690;
    int _704 = ~_686;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _712 = _708;
    if (!_580)
    {
        int _714 = ~_686;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _702 * (-2.0);
    int _722 = abs(_700);
    float _724 = _440 + (-0.5);
    float _726 = float(_718);
    float _728 = fma(_720, _556, _556);
    float _730 = float(_722);
    float _732 = fma(_506, _720, _506);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _728);
    float _736 = _432 + _438;
    float _738 = _730 * _726;
    float _740 = fma(_696, _684, _710);
    float _742 = fma(_732, _684, _734);
    float _744 = _736 + (-1.0);
    float _746 = _738 * (-2.0);
    float _748 = in.m_61.x;
    float _750 = in.m_61.y;
    float _752 = in.m_61.z;
    float _754 = _432 + (-0.5);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _758 = fma(_746, _558, _558);
    float _760 = _740 * 0.15915493667125701904296875;
    float _762 = _742 * 0.15915493667125701904296875;
    float _764 = in.m_63.x;
    float _766 = in.m_63.y;
    float _768 = in.m_63.z;
    float _770 = fma(_756, _746, _756);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _774 = _760 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _684, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _762 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _406 * _748;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = _410 * _752;
    float _794 = _408 * _750;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _768);
    float _808 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _766);
    float _816 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = _796 * _804;
    float _820 = _808 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _790;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _812 * _784;
    float _838 = _812 * _790;
    float _840 = _776 * _826;
    float _842 = _812 * _826;
    float _844 = _790 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _830;
    float _850 = _842 * _830;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_838;
    float _860 = fma(_834, _822, _858);
    float _862 = -_830;
    float _864 = _834 * _862;
    float _866 = fma(_852, _818, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_856, _818, _850);
    float _872 = fma(_844, _818, _864);
    float _874 = fma(_860, _820, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_868, _820, _870);
    float _880 = fma(_846, _820, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
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
    float _940 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
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
    float _1378 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1380 = _1368 * _1368;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1378);
    float _1386 = fma(_1372, _1372, _1380);
    float _1388 = fma(_1376, _1376, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1372 * _1394;
    float _1398 = _1376 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1386;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1184 = _1440;
    }
    float _1442 = _1184;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1180;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1368, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1470;
    }
    float _1472 = _1104;
    float _1474 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    float _1478 = _1450;
    if (_1408)
    {
        float _1480 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1408)
    {
        _1478 = _1468;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1408)
    {
        float _1492 = _1462 + (-1.0);
        _968 = _1492;
    }
    float _1494 = _968;
    float _1496 = _1494;
    if (_1408)
    {
        float _1498 = _1434 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1408)
    {
        float _1504 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1504;
    }
    float _1506 = _1496;
    if (_1408)
    {
        float _1508 = _1396 * _1500;
        _1420 = _1508;
    }
    float _1510 = _1420;
    if (_1408)
    {
        float _1512 = _1398 * _1500;
        _1422 = _1512;
    }
    float _1514 = _1422;
    float _1516 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    if (_1408)
    {
        float _1518 = fma(_1468, _1462, _1506);
        _1490 = _1518;
    }
    float _1520 = _1490;
    if (_1408)
    {
        float _1522 = _1510 * _1510;
        _1424 = _1522;
    }
    float _1524 = _1424;
    if (_1408)
    {
        float _1526 = _1514 * _1514;
        _1426 = _1526;
    }
    float _1528 = _1426;
    float _1530 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1534 = fma(_1520, _1520, _1524);
    float _1536 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = _1534 + _1528;
    float _1542 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1552 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1554 = rsqrt(_1540);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1564 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = abs(_1560);
    float _1574 = log2(_1572);
    float _1576 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1550);
    float _1584 = -_1488;
    float _1586 = _1474 + _1584;
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1582);
    float _1592 = _1554 * _1510;
    float _1594 = _1554 * _1520;
    float _1596 = floor(_1564);
    float _1598 = _1554 * _1514;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1590);
    float _1604 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1606 = -_1600;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = log2(_1580);
    float _1614 = -_1598;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1618 = fma(_1616, -0.5, 0.5);
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = exp2(_1610);
    float _1624 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = -_1596;
    float _1628 = _1564 + _1626;
    float _1630 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1604);
    float _1632 = _1594 + 1.0;
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1636 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1638 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = 1.0 / _1602;
    float _1642 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1634);
    float _1644 = fma(_1620, _1636, -0.212114393711090087890625);
    float _1646 = _1612 * 0.693147182464599609375;
    float _1648 = fma(_1620, _1644, 1.570728778839111328125);
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1652 = sqrt(_1618);
    float _1654 = -_1594;
    float _1656 = fma(_1622, _1632, _1654);
    float _1658 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1662 = fma(_1656, 0.5, 0.5);
    float _1664 = _1658 * _1640;
    float _1666 = _1660 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1652 * 0.636619746685028076171875;
    float2 _5442 = float2(_1586, _1628);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5442, float2(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5442, float2(0.0), isnan(_5442)), level(0.0)).x;
    float _1676 = -_1648;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5458 = float3(_1668, _1670, _1650);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).x;
    float3 _5469 = float3(_1668, _1670, _1650);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5469, float3(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5469, float3(0.0), isnan(_5469)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5485 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_604);
    int _1707 = int(_1705);
    float _1709 = _508 * _168;
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    bool _1715 = _454 == 0;
    int _1717 = _454 + (-1);
    float _1719 = 1.0 / _1703;
    int _1721 = ~_454;
    int _1723 = _1721 + 1;
    int _1725 = abs(_530);
    float _1727 = float(uint(_1707));
    float _1729 = trunc(_1709);
    int _1731 = int(_1729);
    float _1733 = float(_1707);
    int _1735 = as_type<int>(_1719) + (-2);
    float _1737 = as_type<float>(_1735) * _1727;
    float _1739 = trunc(_1737);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    int _1746 = _1713 * int(_1744);
    int _1748 = _1746 + _1707;
    float _1750 = float(uint(_1748));
    float _1752 = as_type<float>(_1735) * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1756 = _1754 != 0;
    bool _1758 = _1733 >= _488;
    bool _1760 = isnan(_1733);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(_488);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = trunc(_1752);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1756;
    float _1778 = _1776 ? 7.345489978790283203125 : 1.0;
    float _1780 = _1778 * _438;
    float _1782 = trunc(_1768);
    int _1784 = int(_1782);
    float _1786 = floor(_1780);
    int _1788 = int(_1744) + int(_1774);
    int _1790 = _1723 * _1788;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1786;
    float _1798 = _1780 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _488;
    int _1806 = ~_1788;
    int _1808 = _1806 + _1802;
    int _1810 = _1808 + 1;
    float _1812 = trunc(_1804);
    int _1814 = int(_1812);
    int _1816 = _454 * _1810;
    int _1818 = _1816 + _1707;
    int _1820 = ~_1784;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1715;
    int _1832 = _1830 ? _1818 : (-1);
    bool _1834 = !_1828;
    int _1836 = _1834 ? 0 : 1;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    int _1842 = _1832 * _1824;
    int _1844 = abs(_538);
    int _1846 = _1784 * _1717;
    int _1848 = _1846 + _1842;
    int _1850 = abs(_1836);
    int _1852 = _1848 * _1725;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1856 = _430 + _1854;
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1731 * _1844;
    int _1864 = _1862 + _1852;
    int _1866 = abs(_602);
    int _1868 = _1814 * _1850;
    int _1870 = _1868 + _1707;
    int _1872 = abs(_1860);
    float _1874 = in.m_65.y;
    int _1876 = _1870 * _1866;
    int _1878 = _1876 + _1864;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1888 = _1814 * _1872;
    int _1890 = _1888 + _1878;
    bool _1892 = _440 > 0.5;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1896 = _1894 != 0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1902 = float(uint(_1890));
    float _1904 = 1.0 / _1886;
    float _1906 = as_type<float>(_1735) * _1902;
    float _1908 = as_type<float>(_1814);
    if (_1882)
    {
        float _1910 = in.m_57.x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1916 = _1914 != 0;
    float _1918 = 1.0 / _1900;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1920 = ~_454;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1906);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1938 = float(uint(_1870));
    float _1940 = -_1874;
    float _1942 = _1940 + 1.0;
    float _1944 = _1932 * _1904;
    float _1946 = _1936 * _1918;
    float _1948 = _1874;
    if (_1896)
    {
        float _1950 = _1892 ? _1942 : _1874;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1964 = _1922 * int(_1928);
    int _1966 = _1964 + _1890;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1972 = -_492;
    float _1974 = fma(_656, _1962, _1972);
    bool _1976 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1978 = isnan(_430);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1990 = _1912 > 0.5;
    bool _1992 = _1990 && _1882;
    float _1994 = fma(_1944, _1856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1996 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_430);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1986;
    float _2010 = _2008 + 1.0;
    float _2012 = float(uint(_1966));
    out.m_69.x = _1968;
    out.m_69.y = _1970;
    out.m_69.z = _1988;
    bool _2014 = _766 != 0.0;
    bool _2016 = isnan(_766);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = _2006 * _2010;
    float _2026 = -_2006;
    float _2028 = _2026 + 1.0;
    float _2030 = in.m_71.x;
    float _2032 = in.m_71.y;
    float _2034 = in.m_71.z;
    float _2036 = as_type<float>(_1735) * _2012;
    float _2038 = as_type<float>(_1735) * _1938;
    bool _2040 = _764 == 0.0;
    bool _2042 = !_2022;
    bool _2044 = _2040 && _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2048 = _430 + _2046;
    bool _2050 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2052 = isnan(_430);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = trunc(_2036);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _2012;
    float _2070 = _1960;
    if (_1882)
    {
        _2068 = _1960;
    }
    float _2072 = _2068;
    float _2074 = fma(_1946, _2048, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2076 = _768 == 0.0;
    bool _2078 = _2076 && _2044;
    float _2080 = _2060 * _2028;
    int _2082 = ~_454;
    int _2084 = _2082 + 1;
    float _2086 = _2072;
    if (_1992)
    {
        float _2088 = -_2072;
        float _2090 = _2088 + 1.0;
        _2086 = _2090;
    }
    float _2092 = _2086;
    float _2094 = -_2060;
    float _2096 = _2094 + 1.0;
    float _2098 = trunc(_2038);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = _1994 * _2080;
    if (_1882)
    {
        _2070 = _2092;
    }
    float _2106 = _2070;
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2104);
    float _2114 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2116 = _2030;
    float _2118 = _2032;
    float _2120 = _2034;
    if (!_2078)
    {
        float _2122 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (!_2078)
    {
        float _2126 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2118 = _2126;
    }
    float _2128 = _2118;
    int _2130 = int(_1928) + int(_2066);
    float _2132 = fma(_2074, _2024, _2112);
    float _2134 = fma(_658, _2114, _486);
    if (!_2078)
    {
        float _2136 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2120 = _2136;
    }
    float _2138 = _2120;
    int _2140 = _2110 * int(_2102);
    int _2142 = _2140 + _1870;
    float _2144 = abs(_1258);
    float _2146 = log2(_2144);
    int _2148 = _2084 * _2130;
    int _2150 = _2148 + _1890;
    float _2152 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2132);
    float _2154 = _2134 + 0.5;
    float _2156 = float(uint(_2142));
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2160 = uint(_2150) >= uint(_454);
    float _2162 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2164 = as_type<float>(_1735) * _2156;
    bool _2166 = !_2160;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2162);
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2174 = ~_2130;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2164);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = _1974 + 0.5;
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2192 = _454 * _2178;
    int _2194 = _2192 + _1890;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2198 = ~_454;
    int _2200 = _2198 + 1;
    out.m_73.x = _2154;
    out.m_73.y = _2186;
    float _2202 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2194 : (-1);
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2214 = exp2(_2188);
    int _2216 = int(_2102) + int(_2184);
    out.m_75.x = _2202;
    out.m_75.y = _2208;
    out.m_75.z = _2210;
    out.m_75.w = _2158;
    int _2218 = _2206 >> 31;
    float _2220 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2222 = _2218 & 3;
    float _2224 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = _2206 & 3;
    bool _2228 = _2226 != 0;
    float _2230 = -_834;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    int _2234 = _2206 + _2222;
    float _2236 = -_834;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2240 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2242 = _2200 * _2216;
    int _2244 = _2242 + _1870;
    float _2246 = -_834;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2250 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2252 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2256 = precise::clamp(_2254, 0.0, 1.0);
    float _2258 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    int _2260 = _2234 >> 2;
    float _2262 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2266 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2268 = _2260 << 4;
    int _2270 = _2268 + 368;
    float _2272 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2274 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2276 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    uint _2278 = uint(int(uint(_2270) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    float _2294 = _2250 * _2128;
    float _2296 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2298 = _2258 * _2128;
    int _2300 = _2206 & 3;
    bool _2302 = _2300 != 0;
    float _2304 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2264);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2308 = _2272 * _2128;
    int _2310 = _2270 + 8;
    uint _2312 = uint(int(uint(_2310) >> uint(2)));
    uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
    int _2316 = int(_2312) & 3;
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[int(_2314)][_2316];
    int _2320 = int(_2312) + 1;
    uint _2322 = uint(int(uint(_2320) >> uint(2)));
    int _2324 = _2320 & 3;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[int(_2322)][_2324];
    bool _2328 = uint(_2300) > 1u;
    float _2330 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    bool _2332 = uint(_2244) >= uint(_454);
    float _2334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    int _2336 = _2228 ? 0 : 1;
    float _2338 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    bool _2340 = _2300 != 3;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    float _2344 = fma(_2256, -2.0, 3.0);
    float _2346 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2348 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2350 = _2256 * _2256;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = fma(_2334, _2124, _2298);
    bool _2358 = uint(_2300) >= 2u;
    float _2360 = _2350 * _2344;
    int _2362 = ~_2336;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2338, _2124, _2308);
    int _2370 = _2366;
    if (!_2328)
    {
        int _2372 = ~_2336;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = fma(_2330, _2124, _2294);
    bool _2380 = !_2302;
    int _2382 = _2380 ? 0 : 1;
    float _2384 = fma(_2346, _2138, _2356);
    int _2386 = _2358 ? 0 : 1;
    float _2388 = in.m_77.x;
    bool _2390 = _2300 != 3;
    float _2392 = -_1674;
    float _2394 = _2392 + 1.0;
    int _2396 = abs(_2376);
    float _2398 = fma(_2342, _2138, _2378);
    int _2400 = ~_2216;
    int _2402 = _2400 + _2354;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2348, _2138, _2368);
    int _2408 = abs(_2382);
    int _2410 = ~_2386;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = _454 * _2404;
    int _2418 = _2416 + _1870;
    bool _2420 = !_2390;
    int _2422 = _2420 ? 0 : (-1);
    out.m_79.x = _2398;
    out.m_79.y = _2384;
    out.m_79.z = _2406;
    int _2424 = _2414;
    if (_2340)
    {
        int _2426 = ~_2386;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    int _2432 = ~_2396;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_1916;
    int _2440 = _2438 ? 0 : 1;
    int _2442 = abs(_2422);
    int _2444 = _2436 * as_type<int>(_2292);
    int _2446 = abs(_2430);
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = abs(_2440);
    int _2456 = _2452 * as_type<int>(_2284);
    int _2458 = _2456 + _2444;
    int _2460 = ~_2446;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2442;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2464 * as_type<int>(_2318);
    int _2474 = _2472 + _2458;
    int _2476 = ~_2454;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    float _2482 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2484 = _2470 * as_type<int>(_2326);
    int _2486 = _2484 + _2474;
    float _2488 = -_2360;
    float _2490 = _2488 + 1.0;
    float _2492 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    bool _2494 = !_1715;
    int _2496 = _2494 ? _2418 : (-1);
    int _2498 = _2486 * _2480;
    float _2500 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2502 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2492);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2360);
    float _2506 = _1602 * 0.5;
    int _2508 = _2496 * _2454;
    int _2510 = _2508 + _2498;
    float _2512 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2502);
    float _2514 = exp2(_2500);
    bool _2516 = _1258 <= 8000.0;
    bool _2518 = isnan(_1258);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(8000.0);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_1660, -0.5, _2506);
    float _2530 = float(_2510);
    float _2532 = _2512 + _1602;
    float _2534 = _1658 + _1602;
    float _2536 = _2526 * _2504;
    float _2538 = _2532 * 0.5;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2512;
    out.gl_Position.w = _1602;
    bool _2544 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2546 = isnan(_1392);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2552 = _2548 || _2550;
    float _2554 = _2394 * _2542;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    out.m_81.x = _2540;
    out.m_81.y = _2528;
    out.m_81.z = _2538;
    out.m_81.w = _1602;
    float _2558 = -_2514;
    float _2560 = _2558 + 1.0;
    float _2562 = -_2556;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2530;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2568 = _2564 * _2388;
    float _2570 = _2566 * _1680;
    float _2572 = _2530;
    float _2574 = _2540;
    if (!_2552)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2576 = _2572;
    float _2578 = _1691 * _2570;
    float _2580 = _1701 * _2570;
    float _2582 = -_2566;
    float _2584 = _2582 + 1.0;
    float _2586 = _2568 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2588 = fma(_1697, _2578, _1685);
    float _2590 = fma(_1699, _2578, _1687);
    float _2592 = _1691 * _2584;
    float _2594 = fma(_1691, _2580, _1689);
    out.m_85.x = _2586;
    float _2596 = _1310 * _1364;
    float _2598 = _2578;
    float _2600 = _2580;
    float _2602 = _2584;
    float _2604 = _2596;
    float _2606 = _2576;
    float _2608 = _2576;
    if (!_2552)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2610 = _2574;
    out.m_87.x = _2588;
    out.m_87.y = _2590;
    out.m_87.z = _2594;
    out.m_87.w = _2592;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2614 = _2610;
    float _2616 = _2610;
    if (!_2552)
    {
        _2598 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2598;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2552)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2624 = _2600;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2552)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2630 = _2602;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2552)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2636 = _2604;
    bool _2638 = !_2552;
    float _2640 = _2636;
    float _2642 = _2636;
    if (!_2638)
    {
        bool _2644 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2646 = isnan(_1392);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2656 = _1392 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2666 = 1.0 / _2660;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2684 = _2656 * _2666;
            float _2686 = precise::clamp(_2684, 0.0, 1.0);
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2696;
            _2634 = _2700;
            _2616 = _2692;
            _2628 = _2698;
            _2608 = _2694;
            _2642 = _2702;
            _2704 = true;
        }
        else
        {
            bool _2706 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2708 = isnan(_1392);
            bool _2710 = _2706 || _2708;
            bool _2712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2714 = _2710 || _2712;
            if (!_2714)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2716 = _2614;
            _2616 = _2716;
            if (!_2714)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2718 = _2620;
            _2622 = _2718;
            if (!_2714)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2720 = _2606;
            _2608 = _2720;
            if (!_2714)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2722 = _2626;
            _2628 = _2722;
            if (!_2714)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2724 = _2632;
            _2634 = _2724;
            if (!_2714)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2726 = _2640;
            bool _2728 = !_2714;
            _2642 = _2726;
            if (!_2728)
            {
                bool _2730 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2732 = isnan(_1392);
                bool _2734 = _2730 || _2732;
                bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2738 = _2734 || _2736;
                if (!_2738)
                {
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2742 = _1392 + _2740;
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = 1.0 / _2746;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2770 = _2742 * _2752;
                    float _2772 = precise::clamp(_2770, 0.0, 1.0);
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2778 = fma(_2772, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2782;
                    _2634 = _2786;
                    _2616 = _2778;
                    _2628 = _2784;
                    _2608 = _2780;
                    _2642 = _2788;
                    _2704 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2704 = false;
    float _2790 = _2622;
    float _2792 = _2634;
    float _2794 = _2616;
    float _2796 = _2628;
    float _2798 = _2608;
    float _2800 = _2642;
    float _2802 = fma(_2384, -0.5, 0.5);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = -_2790;
    float _2808 = _2806 + _2792;
    float _2810 = _2612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = -_2794;
    float _2814 = _2812 + _2796;
    out.m_89.x = 0.0;
    float _2816 = fma(_2804, _2808, _2790);
    float _2818 = fma(_2804, _2814, _2794);
    out.m_53.x = _2810;
    float _2820 = -_2798;
    float _2822 = _2820 + _2800;
    float _2824 = _2816 * 0.586610972881317138671875;
    bool _2826 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2828 = fma(_2804, _2822, _2798);
    float _2830 = fma(_2818, 0.298911988735198974609375, _2824);
    bool _2832 = _1310 > 0.0;
    bool _2834 = isnan(_1310);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.0);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2828, 0.114477999508380889892578125, _2830);
    bool _2844 = _1364 <= 0.0;
    bool _2846 = !_2840;
    bool _2848 = _2844 || _2846;
    float _2850 = -_2842;
    float _2852 = _2818 + _2850;
    float _2854 = -_2842;
    float _2856 = _2816 + _2854;
    float _2858 = -_2842;
    float _2860 = _2828 + _2858;
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2866 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    bool _2868 = !_2826;
    if (!_2868)
    {
        float _2870 = -_1248;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2874 = -_1250;
        float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2878 = -_1252;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2882 = _2872 * _2872;
        float _2884 = fma(_2876, _2876, _2882);
        float _2886 = fma(_2880, _2880, _2884);
        float _2888 = sqrt(_2886);
        float _2890 = rsqrt(_2886);
        float _2892 = -_2888;
        float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = _2876 * _2890;
        float _2902 = _2872 * _2890;
        float _2904 = abs(_2898);
        float _2906 = log2(_2904);
        float _2908 = _2880 * _2890;
        float _2910 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2912 = _2384 * _2902;
        float _2914 = -_2902;
        float _2916 = -_2910;
        float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2916);
        float _2920 = fma(_2398, _2900, _2912);
        float _2922 = -_2908;
        float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2918);
        float _2926 = fma(_2406, _2908, _2920);
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2932 = _2924 + _2930;
        float _2934 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = exp2(_2934);
        float _2942 = _2940 * _2938;
        float _2944 = _2928 * _2942;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2948 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2950 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2946;
        out.m_89.y = _2948;
        out.m_89.z = _2950;
    }
    out.m_91.x = _2862;
    out.m_91.y = _2864;
    out.m_91.z = _2866;
    if (!_2848)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2952;
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
    bool _2704 = false;
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
        float _3020 = as_type<float>(_134);
        out.gl_Position.z = _3020;
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
        float _3075 = as_type<float>(_160);
        out.gl_Position.z = _3075;
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
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = _436 * _116;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = _432 * 2.0;
    float _458 = _440 + _438;
    float _460 = _440 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = floor(_456);
    float _464 = _438 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _466 = _458 + (-1.0);
    float _468 = fma(_460, -2.0, _442);
    float _470 = _440 * 2.0;
    float _472 = _438 * 2.0;
    float _474 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = -_448;
    float _478 = fma(_464, 2.0, _476);
    float _480 = floor(_472);
    float _482 = _440 + _432;
    float _484 = -_116;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _488 = float(_454);
    float _490 = _482 + (-1.0);
    float _492 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _468);
    bool _494 = _462 >= 0.0;
    bool _496 = isnan(_462);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = exp2(_450);
    float _506 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _508 = _488 * _116;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    float _522 = _438 + (-0.5);
    int _524 = _502 ? 0 : 1;
    float _526 = floor(_470);
    bool _528 = !_516;
    int _530 = _528 ? 0 : 1;
    bool _532 = _462 > 0.0;
    float _534 = float(_446);
    bool _536 = !_512;
    int _538 = _536 ? 0 : 1;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    bool _544 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _552 = _548 || _550;
    float _554 = in.m_59.x;
    float _556 = in.m_59.y;
    float _558 = in.m_59.z;
    bool _560 = _480 > 0.0;
    float _562 = 1.0 / _534;
    bool _564 = _480 >= 0.0;
    bool _566 = isnan(_480);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    int _574 = ~_524;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = _526 > 0.0;
    bool _582 = _526 >= 0.0;
    bool _584 = isnan(_526);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    int _592 = _578;
    if (!_532)
    {
        int _594 = ~_524;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    bool _600 = !_520;
    int _602 = _600 ? 0 : 1;
    float _604 = _562 * _116;
    float _606 = _552 ? _542 : 0.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _610 = 1.0 + _608;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _622 = _620 != 0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _628 = _572 ? 0 : 1;
    bool _630 = !_614;
    int _632 = _630 ? 0 : 1;
    float _634 = 1.0 / _610;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[78].w, _626);
    int _648 = abs(_632);
    float _650 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[78].z, _624);
    bool _652 = !_618;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _646);
    float _658 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _650);
    float _660 = float(_598);
    float _662 = float(_648);
    int _664 = ~_628;
    int _666 = _664 + 1;
    int _668 = _666 + 1;
    int _670 = abs(_654);
    float _672 = _662 * _660;
    int _674 = _668;
    if (!_560)
    {
        int _676 = ~_628;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    if (_644)
    {
        float _682 = _606 * _634;
        _126 = _682;
    }
    float _684 = _126;
    int _686 = _590 ? 0 : 1;
    float _688 = _672 * (-2.0);
    float _690 = float(_680);
    float _692 = float(_670);
    float _694 = fma(_688, _554, _554);
    float _696 = fma(_474, _688, _474);
    bool _698 = !_622;
    int _700 = _698 ? 0 : 1;
    float _702 = _692 * _690;
    int _704 = ~_686;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[196].x, _694);
    int _712 = _708;
    if (!_580)
    {
        int _714 = ~_686;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    float _720 = _702 * (-2.0);
    int _722 = abs(_700);
    float _724 = _440 + (-0.5);
    float _726 = float(_718);
    float _728 = fma(_720, _556, _556);
    float _730 = float(_722);
    float _732 = fma(_506, _720, _506);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _728);
    float _736 = _432 + _438;
    float _738 = _730 * _726;
    float _740 = fma(_696, _684, _710);
    float _742 = fma(_732, _684, _734);
    float _744 = _736 + (-1.0);
    float _746 = _738 * (-2.0);
    float _748 = in.m_61.x;
    float _750 = in.m_61.y;
    float _752 = in.m_61.z;
    float _754 = _432 + (-0.5);
    float _756 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _758 = fma(_746, _558, _558);
    float _760 = _740 * 0.15915493667125701904296875;
    float _762 = _742 * 0.15915493667125701904296875;
    float _764 = in.m_63.x;
    float _766 = in.m_63.y;
    float _768 = in.m_63.z;
    float _770 = fma(_756, _746, _756);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _774 = _760 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_770, _684, _772);
    float _780 = _778 * 0.15915493667125701904296875;
    float _782 = _762 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _406 * _748;
    float _788 = _762 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = _410 * _752;
    float _794 = _408 * _750;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_46.x;
    float _800 = in.m_46.y;
    float _802 = in.m_46.z;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _768);
    float _808 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _766);
    float _816 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = _796 * _804;
    float _820 = _808 * _806;
    float _822 = _776 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _776 * _790;
    float _830 = _816 * _814;
    float _832 = _780 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _812 * _784;
    float _838 = _812 * _790;
    float _840 = _776 * _826;
    float _842 = _812 * _826;
    float _844 = _790 * _826;
    float _846 = _784 * _826;
    float _848 = _840 * _830;
    float _850 = _842 * _830;
    float _852 = fma(_834, _828, _836);
    float _854 = -_822;
    float _856 = fma(_834, _838, _854);
    float _858 = -_838;
    float _860 = fma(_834, _822, _858);
    float _862 = -_830;
    float _864 = _834 * _862;
    float _866 = fma(_852, _818, _848);
    float _868 = fma(_834, _836, _828);
    float _870 = fma(_856, _818, _850);
    float _872 = fma(_844, _818, _864);
    float _874 = fma(_860, _820, _866);
    float _876 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = fma(_868, _820, _870);
    float _880 = fma(_846, _820, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _884 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _888 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _890 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _882);
    float _892 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _888);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _896);
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
    float _940 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _936);
    float _942 = _932 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _944 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _940);
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
    float _1378 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1380 = _1368 * _1368;
    float _1382 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1384 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1378);
    float _1386 = fma(_1372, _1372, _1380);
    float _1388 = fma(_1376, _1376, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1372 * _1394;
    float _1398 = _1376 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1386;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1184 = _1440;
    }
    float _1442 = _1184;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1180;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1368, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1470;
    }
    float _1472 = _1104;
    float _1474 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    float _1478 = _1450;
    if (_1408)
    {
        float _1480 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1408)
    {
        _1478 = _1468;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1408)
    {
        float _1492 = _1462 + (-1.0);
        _968 = _1492;
    }
    float _1494 = _968;
    float _1496 = _1494;
    if (_1408)
    {
        float _1498 = _1434 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1408)
    {
        float _1504 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1504;
    }
    float _1506 = _1496;
    if (_1408)
    {
        float _1508 = _1396 * _1500;
        _1420 = _1508;
    }
    float _1510 = _1420;
    if (_1408)
    {
        float _1512 = _1398 * _1500;
        _1422 = _1512;
    }
    float _1514 = _1422;
    float _1516 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    if (_1408)
    {
        float _1518 = fma(_1468, _1462, _1506);
        _1490 = _1518;
    }
    float _1520 = _1490;
    if (_1408)
    {
        float _1522 = _1510 * _1510;
        _1424 = _1522;
    }
    float _1524 = _1424;
    if (_1408)
    {
        float _1526 = _1514 * _1514;
        _1426 = _1526;
    }
    float _1528 = _1426;
    float _1530 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1532 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1534 = fma(_1520, _1520, _1524);
    float _1536 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1538 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1540 = _1534 + _1528;
    float _1542 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1552 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1554 = rsqrt(_1540);
    float _1556 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1382);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1552);
    float _1564 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1568 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1570 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1572 = abs(_1560);
    float _1574 = log2(_1572);
    float _1576 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1578 = -_1568;
    float _1580 = fma(_1578, _1566, 1.0);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1550);
    float _1584 = -_1488;
    float _1586 = _1474 + _1584;
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1590 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1582);
    float _1592 = _1554 * _1510;
    float _1594 = _1554 * _1520;
    float _1596 = floor(_1564);
    float _1598 = _1554 * _1514;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1590);
    float _1604 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1606 = -_1600;
    float _1608 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1612 = log2(_1580);
    float _1614 = -_1598;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1618 = fma(_1616, -0.5, 0.5);
    float _1620 = fma(_1616, 0.5, 0.5);
    float _1622 = exp2(_1610);
    float _1624 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1626 = -_1596;
    float _1628 = _1564 + _1626;
    float _1630 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1604);
    float _1632 = _1594 + 1.0;
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1624);
    float _1636 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1638 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = 1.0 / _1602;
    float _1642 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1634);
    float _1644 = fma(_1620, _1636, -0.212114393711090087890625);
    float _1646 = _1612 * 0.693147182464599609375;
    float _1648 = fma(_1620, _1644, 1.570728778839111328125);
    float _1650 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1652 = sqrt(_1618);
    float _1654 = -_1594;
    float _1656 = fma(_1622, _1632, _1654);
    float _1658 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1662 = fma(_1656, 0.5, 0.5);
    float _1664 = _1658 * _1640;
    float _1666 = _1660 * _1640;
    float _1668 = fma(_1664, 0.5, 0.5);
    float _1670 = fma(_1666, -0.5, 0.5);
    float _1672 = _1652 * 0.636619746685028076171875;
    float2 _5442 = float2(_1586, _1628);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5442, float2(0.0), isnan(_5442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5442, float2(0.0), isnan(_5442)), level(0.0)).x;
    float _1676 = -_1648;
    float _1678 = fma(_1672, _1676, 1.0);
    float3 _5458 = float3(_1668, _1670, _1650);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).x;
    float3 _5469 = float3(_1668, _1670, _1650);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5469, float3(0.0), isnan(_5469)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5469, float3(0.0), isnan(_5469)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _5485 = float2(_1678, _1662);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = float(uint(_454));
    float _1705 = trunc(_604);
    int _1707 = int(_1705);
    float _1709 = _508 * _168;
    int _1711 = ~_454;
    int _1713 = _1711 + 1;
    bool _1715 = _454 == 0;
    int _1717 = _454 + (-1);
    float _1719 = 1.0 / _1703;
    int _1721 = ~_454;
    int _1723 = _1721 + 1;
    int _1725 = abs(_530);
    float _1727 = float(uint(_1707));
    float _1729 = trunc(_1709);
    int _1731 = int(_1729);
    float _1733 = float(_1707);
    int _1735 = as_type<int>(_1719) + (-2);
    float _1737 = as_type<float>(_1735) * _1727;
    float _1739 = trunc(_1737);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    int _1746 = _1713 * int(_1744);
    int _1748 = _1746 + _1707;
    float _1750 = float(uint(_1748));
    float _1752 = as_type<float>(_1735) * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1756 = _1754 != 0;
    bool _1758 = _1733 >= _488;
    bool _1760 = isnan(_1733);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan(_488);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = trunc(_1752);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1756;
    float _1778 = _1776 ? 7.345489978790283203125 : 1.0;
    float _1780 = _1778 * _438;
    float _1782 = trunc(_1768);
    int _1784 = int(_1782);
    float _1786 = floor(_1780);
    int _1788 = int(_1744) + int(_1774);
    int _1790 = _1723 * _1788;
    int _1792 = _1790 + _1707;
    bool _1794 = uint(_1792) >= uint(_454);
    float _1796 = -_1786;
    float _1798 = _1780 + _1796;
    bool _1800 = !_1794;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = _1798 * _488;
    int _1806 = ~_1788;
    int _1808 = _1806 + _1802;
    int _1810 = _1808 + 1;
    float _1812 = trunc(_1804);
    int _1814 = int(_1812);
    int _1816 = _454 * _1810;
    int _1818 = _1816 + _1707;
    int _1820 = ~_1784;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1828 = _1826 != 0;
    bool _1830 = !_1715;
    int _1832 = _1830 ? _1818 : (-1);
    bool _1834 = !_1828;
    int _1836 = _1834 ? 0 : 1;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1840 = _1838 != 0;
    int _1842 = _1832 * _1824;
    int _1844 = abs(_538);
    int _1846 = _1784 * _1717;
    int _1848 = _1846 + _1842;
    int _1850 = abs(_1836);
    int _1852 = _1848 * _1725;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1856 = _430 + _1854;
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = _1731 * _1844;
    int _1864 = _1862 + _1852;
    int _1866 = abs(_602);
    int _1868 = _1814 * _1850;
    int _1870 = _1868 + _1707;
    int _1872 = abs(_1860);
    float _1874 = in.m_65.y;
    int _1876 = _1870 * _1866;
    int _1878 = _1876 + _1864;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1882 = _1880 != 0;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1888 = _1814 * _1872;
    int _1890 = _1888 + _1878;
    bool _1892 = _440 > 0.5;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1896 = _1894 != 0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1902 = float(uint(_1890));
    float _1904 = 1.0 / _1886;
    float _1906 = as_type<float>(_1735) * _1902;
    float _1908 = as_type<float>(_1814);
    if (_1882)
    {
        float _1910 = in.m_57.x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1916 = _1914 != 0;
    float _1918 = 1.0 / _1900;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1920 = ~_454;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1906);
    float _1926 = precise::max(_1924, 0.0);
    uint _1928 = uint(_1926);
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1938 = float(uint(_1870));
    float _1940 = -_1874;
    float _1942 = _1940 + 1.0;
    float _1944 = _1932 * _1904;
    float _1946 = _1936 * _1918;
    float _1948 = _1874;
    if (_1896)
    {
        float _1950 = _1892 ? _1942 : _1874;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1960 = in.m_65.x;
    float _1962 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1964 = _1922 * int(_1928);
    int _1966 = _1964 + _1890;
    float _1968 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1972 = -_492;
    float _1974 = fma(_656, _1962, _1972);
    bool _1976 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1978 = isnan(_430);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1990 = _1912 > 0.5;
    bool _1992 = _1990 && _1882;
    float _1994 = fma(_1944, _1856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1996 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_430);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1986;
    float _2010 = _2008 + 1.0;
    float _2012 = float(uint(_1966));
    out.m_69.x = _1968;
    out.m_69.y = _1970;
    out.m_69.z = _1988;
    bool _2014 = _766 != 0.0;
    bool _2016 = isnan(_766);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    float _2024 = _2006 * _2010;
    float _2026 = -_2006;
    float _2028 = _2026 + 1.0;
    float _2030 = in.m_71.x;
    float _2032 = in.m_71.y;
    float _2034 = in.m_71.z;
    float _2036 = as_type<float>(_1735) * _2012;
    float _2038 = as_type<float>(_1735) * _1938;
    bool _2040 = _764 == 0.0;
    bool _2042 = !_2022;
    bool _2044 = _2040 && _2042;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2048 = _430 + _2046;
    bool _2050 = _430 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2052 = isnan(_430);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = trunc(_2036);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _2012;
    float _2070 = _1960;
    if (_1882)
    {
        _2068 = _1960;
    }
    float _2072 = _2068;
    float _2074 = fma(_1946, _2048, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2076 = _768 == 0.0;
    bool _2078 = _2076 && _2044;
    float _2080 = _2060 * _2028;
    int _2082 = ~_454;
    int _2084 = _2082 + 1;
    float _2086 = _2072;
    if (_1992)
    {
        float _2088 = -_2072;
        float _2090 = _2088 + 1.0;
        _2086 = _2090;
    }
    float _2092 = _2086;
    float _2094 = -_2060;
    float _2096 = _2094 + 1.0;
    float _2098 = trunc(_2038);
    float _2100 = precise::max(_2098, 0.0);
    uint _2102 = uint(_2100);
    float _2104 = _1994 * _2080;
    if (_1882)
    {
        _2070 = _2092;
    }
    float _2106 = _2070;
    int _2108 = ~_454;
    int _2110 = _2108 + 1;
    float _2112 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2104);
    float _2114 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2116 = _2030;
    float _2118 = _2032;
    float _2120 = _2034;
    if (!_2078)
    {
        float _2122 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (!_2078)
    {
        float _2126 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2118 = _2126;
    }
    float _2128 = _2118;
    int _2130 = int(_1928) + int(_2066);
    float _2132 = fma(_2074, _2024, _2112);
    float _2134 = fma(_658, _2114, _486);
    if (!_2078)
    {
        float _2136 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2120 = _2136;
    }
    float _2138 = _2120;
    int _2140 = _2110 * int(_2102);
    int _2142 = _2140 + _1870;
    float _2144 = abs(_1258);
    float _2146 = log2(_2144);
    int _2148 = _2084 * _2130;
    int _2150 = _2148 + _1890;
    float _2152 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2132);
    float _2154 = _2134 + 0.5;
    float _2156 = float(uint(_2142));
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2160 = uint(_2150) >= uint(_454);
    float _2162 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2164 = as_type<float>(_1735) * _2156;
    bool _2166 = !_2160;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2162);
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2174 = ~_2130;
    int _2176 = _2174 + _2168;
    int _2178 = _2176 + 1;
    float _2180 = trunc(_2164);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = _1974 + 0.5;
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2192 = _454 * _2178;
    int _2194 = _2192 + _1890;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2198 = ~_454;
    int _2200 = _2198 + 1;
    out.m_73.x = _2154;
    out.m_73.y = _2186;
    float _2202 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2204 = !_1715;
    int _2206 = _2204 ? _2194 : (-1);
    float _2208 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2214 = exp2(_2188);
    int _2216 = int(_2102) + int(_2184);
    out.m_75.x = _2202;
    out.m_75.y = _2208;
    out.m_75.z = _2210;
    out.m_75.w = _2158;
    int _2218 = _2206 >> 31;
    float _2220 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2222 = _2218 & 3;
    float _2224 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = _2206 & 3;
    bool _2228 = _2226 != 0;
    float _2230 = -_834;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2220);
    int _2234 = _2206 + _2222;
    float _2236 = -_834;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2240 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2242 = _2200 * _2216;
    int _2244 = _2242 + _1870;
    float _2246 = -_834;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2250 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2232);
    float _2252 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2256 = precise::clamp(_2254, 0.0, 1.0);
    float _2258 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2248);
    int _2260 = _2234 >> 2;
    float _2262 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2266 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2268 = _2260 << 4;
    int _2270 = _2268 + 368;
    float _2272 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2274 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2276 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    uint _2278 = uint(int(uint(_2270) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    float _2294 = _2250 * _2128;
    float _2296 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2298 = _2258 * _2128;
    int _2300 = _2206 & 3;
    bool _2302 = _2300 != 0;
    float _2304 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2264);
    float _2306 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2266);
    float _2308 = _2272 * _2128;
    int _2310 = _2270 + 8;
    uint _2312 = uint(int(uint(_2310) >> uint(2)));
    uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
    int _2316 = int(_2312) & 3;
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[int(_2314)][_2316];
    int _2320 = int(_2312) + 1;
    uint _2322 = uint(int(uint(_2320) >> uint(2)));
    int _2324 = _2320 & 3;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[int(_2322)][_2324];
    bool _2328 = uint(_2300) > 1u;
    float _2330 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2276);
    bool _2332 = uint(_2244) >= uint(_454);
    float _2334 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2296);
    int _2336 = _2228 ? 0 : 1;
    float _2338 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    bool _2340 = _2300 != 3;
    float _2342 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    float _2344 = fma(_2256, -2.0, 3.0);
    float _2346 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2306);
    float _2348 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2350 = _2256 * _2256;
    bool _2352 = !_2332;
    int _2354 = _2352 ? 0 : (-1);
    float _2356 = fma(_2334, _2124, _2298);
    bool _2358 = uint(_2300) >= 2u;
    float _2360 = _2350 * _2344;
    int _2362 = ~_2336;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2338, _2124, _2308);
    int _2370 = _2366;
    if (!_2328)
    {
        int _2372 = ~_2336;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = fma(_2330, _2124, _2294);
    bool _2380 = !_2302;
    int _2382 = _2380 ? 0 : 1;
    float _2384 = fma(_2346, _2138, _2356);
    int _2386 = _2358 ? 0 : 1;
    float _2388 = in.m_77.x;
    bool _2390 = _2300 != 3;
    float _2392 = -_1674;
    float _2394 = _2392 + 1.0;
    int _2396 = abs(_2376);
    float _2398 = fma(_2342, _2138, _2378);
    int _2400 = ~_2216;
    int _2402 = _2400 + _2354;
    int _2404 = _2402 + 1;
    float _2406 = fma(_2348, _2138, _2368);
    int _2408 = abs(_2382);
    int _2410 = ~_2386;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    int _2416 = _454 * _2404;
    int _2418 = _2416 + _1870;
    bool _2420 = !_2390;
    int _2422 = _2420 ? 0 : (-1);
    out.m_79.x = _2398;
    out.m_79.y = _2384;
    out.m_79.z = _2406;
    int _2424 = _2414;
    if (_2340)
    {
        int _2426 = ~_2386;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    int _2432 = ~_2396;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_1916;
    int _2440 = _2438 ? 0 : 1;
    int _2442 = abs(_2422);
    int _2444 = _2436 * as_type<int>(_2292);
    int _2446 = abs(_2430);
    int _2448 = ~_2408;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = abs(_2440);
    int _2456 = _2452 * as_type<int>(_2284);
    int _2458 = _2456 + _2444;
    int _2460 = ~_2446;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2442;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2464 * as_type<int>(_2318);
    int _2474 = _2472 + _2458;
    int _2476 = ~_2454;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    float _2482 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2484 = _2470 * as_type<int>(_2326);
    int _2486 = _2484 + _2474;
    float _2488 = -_2360;
    float _2490 = _2488 + 1.0;
    float _2492 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    bool _2494 = !_1715;
    int _2496 = _2494 ? _2418 : (-1);
    int _2498 = _2486 * _2480;
    float _2500 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2502 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2492);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2360);
    float _2506 = _1602 * 0.5;
    int _2508 = _2496 * _2454;
    int _2510 = _2508 + _2498;
    float _2512 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2502);
    float _2514 = exp2(_2500);
    bool _2516 = _1258 <= 8000.0;
    bool _2518 = isnan(_1258);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan(8000.0);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = fma(_1660, -0.5, _2506);
    float _2530 = float(_2510);
    float _2532 = _2512 + _1602;
    float _2534 = _1658 + _1602;
    float _2536 = _2526 * _2504;
    float _2538 = _2532 * 0.5;
    float _2540 = _2534 * 0.5;
    float _2542 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2512;
    out.gl_Position.w = _1602;
    bool _2544 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2546 = isnan(_1392);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2552 = _2548 || _2550;
    float _2554 = _2394 * _2542;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    out.m_81.x = _2540;
    out.m_81.y = _2528;
    out.m_81.z = _2538;
    out.m_81.w = _1602;
    float _2558 = -_2514;
    float _2560 = _2558 + 1.0;
    float _2562 = -_2556;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2530;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2568 = _2564 * _2388;
    float _2570 = _2566 * _1680;
    float _2572 = _2530;
    float _2574 = _2540;
    if (!_2552)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2576 = _2572;
    float _2578 = _1691 * _2570;
    float _2580 = _1701 * _2570;
    float _2582 = -_2566;
    float _2584 = _2582 + 1.0;
    float _2586 = _2568 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2588 = fma(_1697, _2578, _1685);
    float _2590 = fma(_1699, _2578, _1687);
    float _2592 = _1691 * _2584;
    float _2594 = fma(_1691, _2580, _1689);
    out.m_85.x = _2586;
    float _2596 = _1310 * _1364;
    float _2598 = _2578;
    float _2600 = _2580;
    float _2602 = _2584;
    float _2604 = _2596;
    float _2606 = _2576;
    float _2608 = _2576;
    if (!_2552)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2610 = _2574;
    out.m_87.x = _2588;
    out.m_87.y = _2590;
    out.m_87.z = _2594;
    out.m_87.w = _2592;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2614 = _2610;
    float _2616 = _2610;
    if (!_2552)
    {
        _2598 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2598;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2552)
    {
        _2600 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2624 = _2600;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2552)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2630 = _2602;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2552)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2636 = _2604;
    bool _2638 = !_2552;
    float _2640 = _2636;
    float _2642 = _2636;
    if (!_2638)
    {
        bool _2644 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2646 = isnan(_1392);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2656 = _1392 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2666 = 1.0 / _2660;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2684 = _2656 * _2666;
            float _2686 = precise::clamp(_2684, 0.0, 1.0);
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2696;
            _2634 = _2700;
            _2616 = _2692;
            _2628 = _2698;
            _2608 = _2694;
            _2642 = _2702;
            _2704 = true;
        }
        else
        {
            bool _2706 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2708 = isnan(_1392);
            bool _2710 = _2706 || _2708;
            bool _2712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2714 = _2710 || _2712;
            if (!_2714)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2716 = _2614;
            _2616 = _2716;
            if (!_2714)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2718 = _2620;
            _2622 = _2718;
            if (!_2714)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2720 = _2606;
            _2608 = _2720;
            if (!_2714)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2722 = _2626;
            _2628 = _2722;
            if (!_2714)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2724 = _2632;
            _2634 = _2724;
            if (!_2714)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2726 = _2640;
            bool _2728 = !_2714;
            _2642 = _2726;
            if (!_2728)
            {
                bool _2730 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2732 = isnan(_1392);
                bool _2734 = _2730 || _2732;
                bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2738 = _2734 || _2736;
                if (!_2738)
                {
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2742 = _1392 + _2740;
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2744;
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = 1.0 / _2746;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2770 = _2742 * _2752;
                    float _2772 = precise::clamp(_2770, 0.0, 1.0);
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2778 = fma(_2772, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2782;
                    _2634 = _2786;
                    _2616 = _2778;
                    _2628 = _2784;
                    _2608 = _2780;
                    _2642 = _2788;
                    _2704 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2704 = false;
    float _2790 = _2622;
    float _2792 = _2634;
    float _2794 = _2616;
    float _2796 = _2628;
    float _2798 = _2608;
    float _2800 = _2642;
    float _2802 = fma(_2384, -0.5, 0.5);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = -_2790;
    float _2808 = _2806 + _2792;
    float _2810 = _2612 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = -_2794;
    float _2814 = _2812 + _2796;
    out.m_89.x = 0.0;
    float _2816 = fma(_2804, _2808, _2790);
    float _2818 = fma(_2804, _2814, _2794);
    out.m_53.x = _2810;
    float _2820 = -_2798;
    float _2822 = _2820 + _2800;
    float _2824 = _2816 * 0.586610972881317138671875;
    bool _2826 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2828 = fma(_2804, _2822, _2798);
    float _2830 = fma(_2818, 0.298911988735198974609375, _2824);
    bool _2832 = _1310 > 0.0;
    bool _2834 = isnan(_1310);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.0);
    bool _2840 = _2836 || _2838;
    float _2842 = fma(_2828, 0.114477999508380889892578125, _2830);
    bool _2844 = _1364 <= 0.0;
    bool _2846 = !_2840;
    bool _2848 = _2844 || _2846;
    float _2850 = -_2842;
    float _2852 = _2818 + _2850;
    float _2854 = -_2842;
    float _2856 = _2816 + _2854;
    float _2858 = -_2842;
    float _2860 = _2828 + _2858;
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    float _2866 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2842);
    bool _2868 = !_2826;
    if (!_2868)
    {
        float _2870 = -_1248;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2874 = -_1250;
        float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2878 = -_1252;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2882 = _2872 * _2872;
        float _2884 = fma(_2876, _2876, _2882);
        float _2886 = fma(_2880, _2880, _2884);
        float _2888 = sqrt(_2886);
        float _2890 = rsqrt(_2886);
        float _2892 = -_2888;
        float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2898 = precise::clamp(_2896, 0.0, 1.0);
        float _2900 = _2876 * _2890;
        float _2902 = _2872 * _2890;
        float _2904 = abs(_2898);
        float _2906 = log2(_2904);
        float _2908 = _2880 * _2890;
        float _2910 = _2900 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2912 = _2384 * _2902;
        float _2914 = -_2902;
        float _2916 = -_2910;
        float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2916);
        float _2920 = fma(_2398, _2900, _2912);
        float _2922 = -_2908;
        float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2918);
        float _2926 = fma(_2406, _2908, _2920);
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2932 = _2924 + _2930;
        float _2934 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = exp2(_2934);
        float _2942 = _2940 * _2938;
        float _2944 = _2928 * _2942;
        float _2946 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2948 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2950 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2946;
        out.m_89.y = _2948;
        out.m_89.z = _2950;
    }
    out.m_91.x = _2862;
    out.m_91.y = _2864;
    out.m_91.z = _2866;
    if (!_2848)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2952;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

