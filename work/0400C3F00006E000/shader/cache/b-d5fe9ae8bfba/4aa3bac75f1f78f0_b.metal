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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4704 = false;
    bool _4013 = false;
    bool _692 = false;
    bool _576 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4937 = as_type<float>(_128);
        out.gl_Position.z = _4937;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_166);
        out.gl_Position.z = _5006;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _206;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _198 + _240;
    float _244 = 1.0 / _210;
    float _246 = _242 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _198 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _224;
    float _260 = _250 * _238;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _198 + _266;
    float _270 = 1.0 / _214;
    float _272 = _254 * _244;
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _220;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _290 = _198 + _288;
    float _292 = _290 * _258;
    bool _294 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_198);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = _264 * _270;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = fma(_308, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_322;
    float _332 = _330 + 1.0;
    float _334 = fma(_326, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = _268 * _286;
    float _338 = -_284;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _236 * _332;
    bool _348 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_198);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = _304 * _340;
    float _362 = fma(_344, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = -_304;
    float _366 = _364 + 1.0;
    bool _368 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_198);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _384 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_198);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _322 * _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_236;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = _378 * _404;
    float _418 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _358 * _412;
    float _422 = fma(_408, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = -_378;
    float _426 = _424 + 1.0;
    float _428 = -_358;
    float _430 = _428 + 1.0;
    float _432 = _334 * _420;
    float _434 = _362 * _420;
    float _436 = _328 * _420;
    float _438 = _394 * _426;
    float _440 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_446, _272, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _460 = fma(_450, _272, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _470 = fma(_414, _438, _440);
    float _472 = fma(_418, _438, _442);
    float _474 = fma(_422, _438, _452);
    float _476 = fma(_456, _272, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_468, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_458, _416, _470);
    float _488 = fma(_460, _416, _472);
    float _490 = fma(_480, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_476, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _502;
    float _506 = fma(_482, _346, _486);
    float _508 = fma(_484, _346, _488);
    float _510 = fma(_490, _346, _492);
    float _512 = fma(_496, _336, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_500, _336, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_504, _336, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _530 = fma(_512, _396, _506);
    float _532 = fma(_520, _292, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _534 = fma(_524, _292, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _536 = fma(_528, _292, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _538 = fma(_514, _396, _508);
    float _540 = fma(_516, _396, _510);
    float _542 = fma(_532, _360, _530);
    float _544 = fma(_534, _360, _538);
    float _546 = fma(_536, _360, _540);
    float _548 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].y, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].z, _546);
    bool _554 = !_256;
    int _556 = as_type<int>(_292);
    float _574;
    if (!_554)
    {
        float _558 = in.m_55.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_112);
        float _580 = 1.0 / _578;
        float _582 = _146 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = in.m_57.x;
    float _588 = in.m_57.y;
    float _590 = in.m_57.z;
    bool _592 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_584);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_584);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _584 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _644 * _636;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _552 * _590;
    float _668 = _550 * _588;
    float _670 = _548 * _586;
    out.m_59.x = _658;
    out.m_59.y = _660;
    out.m_59.z = _662;
    out.m_59.w = _664;
    bool _672 = !_632;
    float _690;
    if (!_672)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        float _694 = float(_112);
        float _696 = 1.0 / _694;
        float _698 = _146 * _696;
        _690 = _698;
    }
    _692 = false;
    float _700 = _690;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_55.x;
    float _708 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = in.m_55.y;
    float _714 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _716 = int(_714);
    float _718 = in.m_61.x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _736 = int(_734);
    float _738 = float(_704);
    float _740 = float(_716);
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _744 = int(_742);
    float _746 = float(_736);
    float _748 = 1.0 / _740;
    float _750 = 1.0 / _738;
    float _752 = float(uint(_744));
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _760 = int(_758);
    float _762 = _748 * _146;
    float _764 = 1.0 / _746;
    float _766 = _750 * _146;
    float _768 = _750;
    float _770 = _746;
    bool _772 = _756;
    float _774 = _718;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_756)
    {
        _768 = 1.0;
    }
    float _778 = _768;
    float _780 = _778;
    if (!_756)
    {
        _780 = 1.2345600128173828125;
    }
    float _782 = _780;
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = float(uint(_760));
    float _790 = _788;
    if (_756)
    {
        _770 = 1.0;
    }
    float _792 = _770;
    float _794 = _792;
    if (!_756)
    {
        _794 = 7.345489978790283203125;
    }
    float _796 = _794;
    int _798 = ~_760;
    int _800 = _798 + 1;
    float _802 = 1.0 / _788;
    float _804 = _764 * _146;
    float _806 = _796 * _706;
    float _808 = _764;
    if (_756)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    float _812 = in.m_55.z;
    float _814 = _810;
    if (!_756)
    {
        _814 = 5.839270114898681640625;
    }
    float _816 = _814;
    float _818 = trunc(_762);
    int _820 = int(_818);
    float _822 = float(uint(_786));
    if (_756)
    {
        _790 = _706;
    }
    float _824 = _790;
    float _826 = _824;
    if (!_756)
    {
        _826 = _712;
    }
    float _828 = _826;
    int _830 = ~_786;
    int _832 = _830 + 1;
    float _834 = 1.0 / _752;
    int _836 = as_type<int>(_802) + (-2);
    float _838 = _828 * _782;
    int _840 = ~_786;
    int _842 = _840 + 1;
    float _844 = trunc(_766);
    int _846 = int(_844);
    float _848 = float(uint(_820));
    bool _850 = _812 > 0.5;
    float _852 = _706 + _812;
    float _854 = _712 + _812;
    float _856 = 1.0 / _822;
    int _858 = as_type<int>(_834) + (-2);
    float _860 = _852 + (-1.0);
    float _862 = _854 + (-1.0);
    float _864 = trunc(_804);
    int _866 = int(_864);
    float _868 = float(uint(_846));
    float _870 = as_type<float>(_836) * _848;
    float _872 = as_type<float>(_858) * _868;
    float _874 = _868;
    if (_756)
    {
        _874 = _706;
    }
    float _876 = _874;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = _876;
    int _889 = _885;
    if (!_756)
    {
        _887 = _812;
    }
    float _891 = _887;
    float _893 = float(uint(_866));
    float _895 = trunc(_872);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _891 * _816;
    float _903 = as_type<float>(_885) * _893;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    int _909 = _800 * int(_883);
    int _911 = _909 + _820;
    float _913 = trunc(_903);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = ~_744;
    int _921 = _919 + 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = float(uint(_911));
    int _929 = _921 * int(_899);
    int _931 = _929 + _846;
    float _933 = floor(_806);
    float _935 = as_type<float>(_836) * _927;
    int _937 = as_type<int>(_935);
    if (_907)
    {
        float _939 = -_718;
        float _941 = _939 + 1.0;
        _556 = as_type<int>(_941);
    }
    int _943 = _556;
    float _945 = float(uint(_931));
    int _947 = _832 * int(_917);
    int _949 = _947 + _866;
    float _951 = floor(_901);
    float _953 = as_type<float>(_858) * _945;
    float _955 = as_type<float>(_949);
    if (_925)
    {
        bool _957 = _706 > 0.5;
        _772 = _957;
    }
    bool _959 = _772;
    float _961 = float(uint(_949));
    float _963 = _961;
    if (!_925)
    {
        _955 = _718;
    }
    float _965 = _955;
    float _967 = -_933;
    float _969 = _806 + _967;
    float _971 = as_type<float>(_885) * _961;
    float _973 = trunc(_935);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = float(_112);
    float _981 = _965;
    if (!_907)
    {
        _963 = _718;
    }
    float _983 = _963;
    float _985 = _983;
    if (_907)
    {
        float _987 = _850 ? as_type<float>(_943) : _718;
        _985 = _987;
    }
    float _989 = _985;
    float _991 = float(_760);
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    if (_925)
    {
        float _999 = -_718;
        float _1001 = _999 + 1.0;
        _937 = as_type<int>(_1001);
    }
    int _1003 = _937;
    if (_925)
    {
        float _1005 = _959 ? as_type<float>(_1003) : _718;
        _981 = _1005;
    }
    float _1007 = _981;
    float _1009 = trunc(_953);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_883) + int(_977);
    int _1017 = ~_744;
    int _1019 = _1017 + 1;
    float _1021 = floor(_838);
    float _1023 = -_951;
    float _1025 = _901 + _1023;
    float _1027 = float(_820);
    int _1029 = int(_917) + int(_997);
    float _1031 = _969 * _991;
    bool _1033 = _1027 >= _991;
    bool _1035 = isnan(_1027);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_991);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _991 * _146;
    float _1047 = 1.0 / _979;
    int _1049 = int(_899) + int(_1013);
    int _1051 = ~_760;
    int _1053 = _1051 + 1;
    float _1055 = float(_846);
    float _1057 = -_1021;
    float _1059 = _838 + _1057;
    float _1061 = float(_744);
    int _1063 = _1053 * _1015;
    int _1065 = _1063 + _820;
    float _1067 = float(_786);
    bool _1069 = _1055 >= _1061;
    bool _1071 = isnan(_1055);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_1061);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1061 * _1059;
    bool _1083 = uint(_1065) >= uint(_760);
    float _1085 = _1045 * _1047;
    float _1087 = _1047 * _146;
    float _1089 = float(_866);
    float _1091 = _1067 * _1087;
    int _1093 = _1019 * _1049;
    int _1095 = _1093 + _846;
    bool _1097 = _1089 >= _1067;
    bool _1099 = isnan(_1089);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan(_1067);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    int _1109 = _842 * _1029;
    int _1111 = _1109 + _866;
    float _1113 = _1067 * _1025;
    bool _1115 = !_1083;
    int _1117 = _1115 ? 0 : (-1);
    float _1119 = trunc(_1043);
    int _1121 = int(_1119);
    bool _1123 = uint(_1095) >= uint(_744);
    float _1125 = _1061 * _1087;
    bool _1127 = uint(_1111) >= uint(_786);
    bool _1129 = !_1123;
    int _1131 = _1129 ? 0 : (-1);
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1143 = _1141 != 0;
    float _1145 = trunc(_1031);
    int _1147 = int(_1145);
    int _1149 = ~_1049;
    int _1151 = _1149 + _1131;
    int _1153 = _1151 + 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1135;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _744 * _1153;
    int _1165 = _1163 + _846;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = trunc(_1079);
    int _1173 = int(_1171);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1177 = _1175 != 0;
    bool _1179 = !_1127;
    int _1181 = _1179 ? 0 : (-1);
    bool _1183 = !_1157;
    int _1185 = _1183 ? 0 : 1;
    int _1187 = ~_1015;
    int _1189 = _1187 + _1117;
    int _1191 = _1189 + 1;
    float _1193 = trunc(_1085);
    int _1195 = int(_1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1203 = _1201 != 0;
    int _1205 = ~_1029;
    int _1207 = _1205 + _1181;
    int _1209 = _1207 + 1;
    int _1211 = _760 * _1191;
    int _1213 = _1211 + _820;
    bool _1215 = !_1169;
    int _1217 = _1215 ? 0 : 1;
    bool _1219 = !_1143;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_1107);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = _786 * _1209;
    int _1237 = _1235 + _866;
    bool _1239 = !_1177;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = _760 == 0;
    int _1245 = abs(_1241);
    float _1247 = trunc(_1113);
    int _1249 = int(_1247);
    int _1251 = ~_1121;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    bool _1257 = !_1243;
    int _1259 = _1257 ? _1213 : (-1);
    bool _1261 = !_1139;
    int _1263 = _1261 ? 0 : 1;
    bool _1265 = !_1203;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1259 * _1255;
    int _1271 = _760 + (-1);
    float _1273 = trunc(_1091);
    int _1275 = int(_1273);
    int _1277 = abs(_1263);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1285 = _1283 != 0;
    int _1287 = _1121 * _1271;
    int _1289 = _1287 + _1269;
    bool _1291 = _744 == 0;
    float _1293 = trunc(_1125);
    int _1295 = int(_1293);
    int _1297 = abs(_1185);
    int _1299 = abs(_1161);
    int _1301 = _1289 * _1277;
    int _1303 = ~_1173;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1147 * _1297;
    int _1311 = _1309 + _820;
    int _1313 = abs(_1221);
    float _1315 = trunc(_1081);
    int _1317 = int(_1315);
    int _1319 = _1195 * _1299;
    int _1321 = _1319 + _1301;
    int _1323 = abs(_1217);
    bool _1325 = !_1199;
    int _1327 = _1325 ? 0 : 1;
    int _1329 = _1311 * _1313;
    int _1331 = _1329 + _1321;
    int _1333 = abs(_1267);
    int _1335 = abs(_1327);
    int _1337 = _1147 * _1323;
    int _1339 = _1337 + _1331;
    bool _1341 = !_1291;
    int _1343 = _1341 ? _1165 : (-1);
    float _1345 = in.m_61.y;
    bool _1347 = _786 == 0;
    float _1349 = float(uint(_1339));
    int _1351 = _1307 * _1343;
    int _1353 = _744 + (-1);
    int _1355 = _1317 * _1245;
    int _1357 = _1355 + _846;
    float _1359 = as_type<float>(_836) * _1349;
    bool _1361 = !_1229;
    int _1363 = _1361 ? 0 : 1;
    int _1365 = _1173 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = trunc(_1359);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = ~_1225;
    int _1377 = _1375 + 1;
    int _1379 = _1377 + 1;
    float _1381 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1383 = !_1347;
    int _1385 = _1383 ? _1237 : (-1);
    int _1387 = _1367 * _1333;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    float _1393 = _712 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1395 = !_1285;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1295 * _1335;
    int _1401 = _1399 + _1387;
    bool _1403 = !_1233;
    int _1405 = _1403 ? 0 : 1;
    int _1407 = _1379 * _1385;
    bool _1409 = !_1391;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1393, -2.0, _720);
    int _1415 = abs(_1363);
    bool _1417 = !_1281;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _786 + (-1);
    int _1423 = _1357 * _1415;
    int _1425 = _1423 + _1401;
    int _1427 = abs(_1397);
    float _1429 = _812 * 2.0;
    int _1431 = abs(_1405);
    int _1433 = _1225 * _1421;
    int _1435 = _1433 + _1407;
    int _1437 = abs(_1411);
    int _1439 = abs(_1419);
    float _1441 = floor(_1429);
    int _1443 = _1249 * _1437;
    int _1445 = _1443 + _866;
    float _1447 = -_1345;
    float _1449 = _1447 + 1.0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1453 = _1451 != 0;
    int _1455 = _1435 * _1427;
    int _1457 = ~_760;
    int _1459 = _1457 + 1;
    int _1461 = _1317 * _1431;
    int _1463 = _1461 + _1425;
    float _1465 = in.m_55.w;
    bool _1467 = !_1453;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = _1275 * _1439;
    int _1473 = _1471 + _1455;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1477 = _1475 != 0;
    int _1479 = abs(_1469);
    int _1481 = _1459 * int(_1373);
    int _1483 = _1481 + _1339;
    float _1485 = float(uint(_1463));
    bool _1487 = _712 > 0.5;
    float _1489 = float(uint(_1483));
    float _1491 = as_type<float>(_858) * _1485;
    bool _1493 = !_1477;
    int _1495 = _1493 ? 0 : 1;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_836) * _1489;
    int _1503 = _1487 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1505 = trunc(_1491);
    float _1507 = precise::max(_1505, 0.0);
    uint _1509 = uint(_1507);
    int _1511 = abs(_1495);
    float _1513 = _1499 ? as_type<float>(_1503) : _1345;
    bool _1515 = _1465 > 0.5;
    float _1517 = trunc(_1501);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    int _1523 = _1445 * _1479;
    int _1525 = _1523 + _1473;
    float _1527 = float(uint(_1311));
    int _1529 = ~_744;
    int _1531 = _1529 + 1;
    int _1533 = _1249 * _1511;
    int _1535 = _1533 + _1525;
    int _1537 = _1515 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1539 = as_type<float>(_836) * _1527;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1539);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = ~_760;
    int _1553 = _1551 + 1;
    float _1555 = _1543 ? as_type<float>(_1537) : _1345;
    int _1557 = _1531 * int(_1509);
    int _1559 = _1557 + _1463;
    float _1561 = float(uint(_1535));
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1565 = _1563 != 0;
    int _1567 = int(_1373) + int(_1521);
    float _1569 = as_type<float>(_885) * _1561;
    float _1571 = float(uint(_1559));
    int _1573 = ~_760;
    int _1575 = _1573 + 1;
    int _1577 = _1553 * _1567;
    int _1579 = _1577 + _1339;
    bool _1581 = _812 > 0.5;
    float _1583 = trunc(_1569);
    float _1585 = precise::max(_1583, 0.0);
    uint _1587 = uint(_1585);
    float _1589 = as_type<float>(_858) * _1571;
    float _1591 = float(uint(_1357));
    int _1593 = _1575 * int(_1549);
    int _1595 = _1593 + _1311;
    bool _1597 = uint(_1579) >= uint(_760);
    float _1599 = _1345;
    int _1601 = _1339;
    if (_1565)
    {
        float _1603 = _1581 ? _1449 : _1345;
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = as_type<float>(_858) * _1591;
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1611 = _1609 != 0;
    float _1613 = trunc(_1589);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    bool _1619 = !_1597;
    int _1621 = _1619 ? 0 : (-1);
    float _1623 = float(uint(_1595));
    int _1625 = ~_1567;
    int _1627 = _1625 + _1621;
    int _1629 = _1627 + 1;
    int _1631 = ~_786;
    int _1633 = _1631 + 1;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = as_type<float>(_836) * _1623;
    int _1643 = _760 * _1629;
    int _1645 = _1643 + _1339;
    int _1647 = ~_744;
    int _1649 = _1647 + 1;
    int _1651 = _1633 * int(_1587);
    int _1653 = _1651 + _1535;
    if (_1611)
    {
        float _1655 = -_718;
        float _1657 = _1655 + 1.0;
        _1601 = as_type<int>(_1657);
    }
    int _1659 = _1601;
    int _1661 = ~_744;
    int _1663 = _1661 + 1;
    bool _1665 = !_1243;
    int _1667 = _1665 ? _1645 : (-1);
    float _1669 = trunc(_1641);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = float(uint(_1653));
    float _1677 = as_type<float>(_1663);
    if (_1611)
    {
        float _1679 = _1487 ? as_type<float>(_1659) : _718;
        _774 = _1679;
    }
    float _1681 = _774;
    int _1683 = int(_1509) + int(_1617);
    float _1685 = as_type<float>(_885) * _1675;
    int _1687 = _1667 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1649 * int(_1639);
    int _1693 = _1691 + _1357;
    float _1695 = float(uint(_1445));
    int _1697 = _1663 * _1683;
    int _1699 = _1697 + _1463;
    bool _1701 = uint(_1687) > 1u;
    float _1703 = trunc(_1685);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    int _1709 = _1667 & 3;
    bool _1711 = _1709 != 0;
    float _1713 = as_type<float>(_885) * _1695;
    float _1715 = float(uint(_1693));
    int _1717 = _1711 ? 0 : 1;
    bool _1719 = uint(_1699) >= uint(_744);
    float _1721 = trunc(_1713);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = int(_1549) + int(_1673);
    float _1729 = as_type<float>(_858) * _1715;
    int _1731 = ~_760;
    int _1733 = _1731 + 1;
    bool _1735 = !_1719;
    int _1737 = _1735 ? 0 : (-1);
    int _1739 = ~_1717;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1733 * _1727;
    int _1747 = _1745 + _1311;
    int _1749 = _1743;
    if (!_1701)
    {
        int _1751 = ~_1717;
        int _1753 = _1751 + 1;
        _1749 = _1753;
    }
    int _1755 = _1749;
    float _1757 = trunc(_1729);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_1683;
    int _1765 = _1763 + _1737;
    int _1767 = _1765 + 1;
    float _1769 = _706 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1771 = _1687 != 3;
    bool _1773 = uint(_1687) >= 2u;
    int _1775 = _744 * _1767;
    int _1777 = _1775 + _1463;
    int _1779 = int(_1587) + int(_1707);
    int _1781 = _1773 ? 0 : 1;
    bool _1783 = uint(_1747) >= uint(_760);
    int _1785 = ~_786;
    int _1787 = _1785 + 1;
    int _1789 = ~_786;
    int _1791 = _1789 + 1;
    bool _1793 = !_1291;
    int _1795 = _1793 ? _1777 : (-1);
    int _1797 = _1787 * int(_1725);
    int _1799 = _1797 + _1445;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1791 * _1779;
    int _1809 = _1807 + _1535;
    int _1811 = _1805;
    float _1813 = as_type<float>(_1707);
    float _1815 = as_type<float>(_1779);
    if (_1771)
    {
        int _1817 = ~_1781;
        int _1819 = _1817 + 1;
        _1811 = _1819;
    }
    int _1821 = _1811;
    int _1823 = _1795 & 3;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1799));
    bool _1829 = !_1783;
    int _1831 = _1829 ? 0 : (-1);
    float _1833 = _1825 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1835 = as_type<float>(_885) * _1827;
    bool _1837 = uint(_1823) >= 2u;
    bool _1839 = uint(_1809) >= uint(_786);
    int _1841 = _1837 ? 0 : 1;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _1823 != 3;
    int _1855 = ~_744;
    int _1857 = _1855 + 1;
    int _1859 = ~_1779;
    int _1861 = _1859 + _1851;
    int _1863 = _1861 + 1;
    int _1865 = int(_1639) + int(_1761);
    int _1867 = _786 * _1863;
    int _1869 = _1867 + _1535;
    bool _1871 = uint(_1823) > 1u;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1875 = _1873 != 0;
    int _1877 = _1857 * _1865;
    int _1879 = _1877 + _1357;
    int _1881 = ~_1841;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = _1885;
    float _1889 = as_type<float>(_1761);
    float _1891 = _1833;
    if (_1853)
    {
        int _1893 = ~_1841;
        int _1895 = _1893 + 1;
        _1887 = _1895;
    }
    int _1897 = _1887;
    bool _1899 = uint(_1879) >= uint(_744);
    bool _1901 = !_1347;
    int _1903 = _1901 ? _1869 : (-1);
    bool _1905 = !_1899;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~as_type<int>(_1833);
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    int _1915 = _1903 & 3;
    bool _1917 = _1915 != 0;
    int _1919 = int(_1725) + int(_1847);
    float _1921 = _706 * 2.0;
    int _1923 = _1913;
    if (!_1871)
    {
        int _1925 = ~as_type<int>(_1833);
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    int _1931 = _1795 & 3;
    bool _1933 = _1931 != 0;
    if (_1875)
    {
        _889 = 0;
    }
    int _1935 = _889;
    float _1937 = floor(_1921);
    bool _1939 = uint(_1915) >= 2u;
    int _1941 = _1935;
    if (!_1875)
    {
        _1941 = 1;
    }
    int _1943 = _1941;
    if (_1875)
    {
        _776 = 0;
    }
    int _1945 = _776;
    bool _1947 = !_1933;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1945;
    if (!_1875)
    {
        _1951 = 2;
    }
    int _1953 = _1951;
    bool _1955 = _1915 != 3;
    bool _1957 = !_1689;
    int _1959 = _1957 ? 0 : 1;
    int _1961 = _1939 ? 0 : 1;
    bool _1963 = _1943 != 1;
    bool _1965 = uint(_1915) > 1u;
    int _1967 = _1917 ? 0 : 1;
    bool _1969 = _1953 != 2;
    float _1971 = _712 * 2.0;
    int _1973 = ~_786;
    int _1975 = _1973 + 1;
    int _1977 = ~_1961;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    int _1983 = _1981;
    if (_1955)
    {
        int _1985 = ~_1961;
        int _1987 = _1985 + 1;
        _1983 = _1987;
    }
    int _1989 = _1983;
    int _1991 = _1975 * _1919;
    int _1993 = _1991 + _1445;
    float _1995 = floor(_1971);
    int _1997 = ~_1967;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    float _2005 = as_type<float>(_1993);
    if (!_1965)
    {
        int _2007 = ~_1967;
        int _2009 = _2007 + 1;
        _2003 = _2009;
    }
    int _2011 = _2003;
    bool _2013 = uint(_1993) >= uint(_786);
    bool _2015 = _1937 > 0.0;
    bool _2017 = !_2013;
    int _2019 = _2017 ? 0 : (-1);
    bool _2021 = _1937 >= 0.0;
    bool _2023 = isnan(_1937);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    if (!_1963)
    {
        _1677 = _712;
    }
    float _2031 = _1677;
    int _2033 = _2029 ? 0 : 1;
    float _2035 = _2031;
    if (_1969)
    {
        _1813 = _706;
    }
    float _2037 = _1813;
    float _2039 = _2037;
    if (_1969)
    {
        _2005 = _712;
    }
    float _2041 = _2005;
    float _2043 = _2041;
    if (!_1963)
    {
        _1889 = _2031;
    }
    float _2045 = _1889;
    float _2047 = _2045;
    if (!_1963)
    {
        _1891 = _812;
    }
    float _2049 = _1891;
    float _2051 = _2049;
    if (!_1963)
    {
        _1815 = _812;
    }
    float _2053 = _1815;
    float _2055 = _2053;
    if (!_1969)
    {
        _2039 = _812;
    }
    float _2057 = _2039;
    float _2059 = _812 + (-0.5);
    if (!_1969)
    {
        _2043 = _706;
    }
    float _2061 = _2043;
    if (_1963)
    {
        _2047 = _706;
    }
    float _2063 = _2047;
    if (_1963)
    {
        _2035 = _706;
    }
    float _2065 = _2035;
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1963)
    {
        _2051 = _712;
    }
    float _2069 = _2051;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1963)
    {
        _2055 = _712;
    }
    float _2073 = _2055;
    bool _2075 = _1687 != 3;
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2079 = _1995 > 0.0;
    int _2081 = ~_2033;
    int _2083 = _2081 + 1;
    int _2085 = _2083 + 1;
    int _2087 = _2085;
    if (!_2015)
    {
        int _2089 = ~_2033;
        int _2091 = _2089 + 1;
        _2087 = _2091;
    }
    int _2093 = _2087;
    int _2095 = _1903 & 3;
    bool _2097 = _2095 != 0;
    bool _2099 = _1995 >= 0.0;
    bool _2101 = isnan(_1995);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan(0.0);
    bool _2107 = _2103 || _2105;
    bool _2109 = _1823 != 3;
    float _2111 = in.m_63.x;
    float _2113 = in.m_63.y;
    float _2115 = in.m_63.z;
    bool _2117 = !_2075;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _1915 != 3;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _2107 ? 0 : 1;
    bool _2129 = !_2109;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = ~_2127;
    int _2147 = _2145 + 1;
    int _2149 = _2147 + 1;
    bool _2151 = !_2121;
    int _2153 = _2151 ? 0 : (-1);
    int _2155 = _2149;
    float _2157 = as_type<float>(_2093);
    if (!_2079)
    {
        int _2159 = ~_2127;
        int _2161 = _2159 + 1;
        _2155 = _2161;
    }
    int _2163 = _2155;
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2171 = _2169 != 0;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2179 = _2177 != 0;
    float _2181 = in.m_48.x;
    float _2183 = in.m_48.y;
    float _2185 = in.m_48.z;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2111);
    float _2193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2113);
    float _2195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2115);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2199 = 1.0 / _2189;
    float _2201 = _2191 * _708;
    bool _2203 = !_2135;
    int _2205 = _2203 ? 0 : 1;
    float _2207 = _2193 * _1381;
    float _2209 = _2195 * _710;
    bool _2211 = _1441 >= 0.0;
    bool _2213 = isnan(_1441);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = -_2197;
    float _2223 = fma(_1769, 2.0, _2221);
    float _2225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2227 = log2(_2225);
    int _2229 = _2219 ? 0 : 1;
    float _2231 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2233 = _1441 > 0.0;
    float _2235 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2237 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2239 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2241;
    float _2245 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2235);
    float _2247 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2239);
    float _2251 = _2243 * _2199;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2255 = _700 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2259 = ~_2229;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2267 = fma(_2251, _2255, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2269 = -_2257;
    float _2271 = fma(_2231, 2.0, _2269);
    float _2273 = _2227 * _146;
    float _2275 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2265);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2279 = -_146;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2223);
    float _2283 = exp2(_2273);
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2287 = _2263;
    float _2289 = _2245;
    float _2291 = _2247;
    if (!_2233)
    {
        int _2293 = ~_2229;
        int _2295 = _2293 + 1;
        _2287 = _2295;
    }
    int _2297 = _2287;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2301 = 1.0 + _2299;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2315 = _2311 || _2313;
    float _2317 = -_2277;
    float _2319 = fma(_2071, 2.0, _2317);
    float _2321 = 1.0 / _2301;
    float _2323 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2303);
    float _2325 = fma(_2077, -2.0, _2285);
    float _2327 = fma(_2067, -2.0, _2305);
    float _2329 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2275);
    float _2331 = -_2283;
    float _2333 = _2331 + 1.0;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2339 = _2315 ? _2333 : 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2345 = isnan(1.0);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2351 = _2347 || _2349;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2355 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2335);
    float _2357 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2337);
    float _2359 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2341);
    float _2361 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2353);
    float _2363 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1413);
    float _2365 = -_146;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2271);
    float _2369 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2323);
    float _2371 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2355);
    float _2373 = -_146;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2319);
    float _2377 = in.m_65.x;
    float _2379 = in.m_65.y;
    float _2381 = in.m_65.z;
    float _2383 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2357);
    float _2385 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2359);
    float _2387 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2361);
    float _2389 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    float _2391 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2327);
    if (_2351)
    {
        float _2393 = _2339 * _2321;
        _150 = _2393;
    }
    float _2395 = _150;
    bool _2397 = _2113 != 0.0;
    bool _2399 = isnan(_2113);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2245);
    float _2409 = _706 + _712;
    bool _2411 = _2111 == 0.0;
    bool _2413 = !_2405;
    bool _2415 = _2411 && _2413;
    float _2417 = _712 + (-0.5);
    bool _2419 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2421 = isnan(_700);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2427 = _2423 || _2425;
    float _2429 = float(_2427);
    float _2431 = -_732;
    float _2433 = _2431 + 1.0;
    bool _2435 = _2115 == 0.0;
    bool _2437 = _2435 && _2415;
    float _2439 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2441 = _2429 * _2433;
    float _2443 = -_2429;
    float _2445 = _2443 + 1.0;
    int _2447 = abs(_2167);
    float _2449 = _2409 + (-1.0);
    float _2451 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2453 = _2267 * _2441;
    float _2455 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2247);
    float _2457 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2249);
    float _2459 = in.m_67.x;
    float _2461 = in.m_67.y;
    float _2463 = in.m_67.z;
    float _2465 = _2429;
    float _2467 = _2453;
    float _2469 = _2449;
    if (_2437)
    {
        _2465 = _2379;
    }
    float _2471 = _2465;
    float _2473 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2453);
    float _2475 = _2471;
    if (_2437)
    {
        _2289 = _2377;
    }
    float _2477 = _2289;
    float _2479 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2481 = _2477;
    if (_2437)
    {
        _2291 = _2471;
    }
    float _2483 = _2291;
    float _2485 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2473);
    float _2487 = _2483;
    if (!_2437)
    {
        _2475 = _2379;
    }
    float _2489 = _2475;
    if (_2437)
    {
        _2467 = _2477;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    if (!_2437)
    {
        float _2495 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2489);
        _2487 = _2495;
    }
    float _2497 = _2487;
    if (!_2437)
    {
        _2481 = _2377;
    }
    float _2499 = _2481;
    int _2501 = abs(_2205);
    float _2503 = float(_2093);
    if (!_2437)
    {
        float _2505 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2493 = _2505;
    }
    float _2507 = _2493;
    float _2509 = float(_2447);
    float _2511 = float(_2297);
    float _2513 = float(_2501);
    float _2515 = _2509 * _2503;
    float _2517 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2437)
    {
        _2469 = _2381;
    }
    float _2519 = _2469;
    float _2521 = _2513 * _2511;
    float _2523 = _2407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2525 = -_2517;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2529 = _2519;
    if (_2437)
    {
        _2157 = _2519;
    }
    float _2531 = _2157;
    float _2533 = _706 + (-0.5);
    bool _2535 = !_2143;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2541 = _2531;
    if (!_2437)
    {
        _2529 = _2381;
    }
    float _2543 = _2529;
    float _2545 = -_2523;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2549 = _2521 * (-2.0);
    float _2551 = _2527 * _2527;
    int _2553 = abs(_2537);
    float _2555 = -_2539;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = fma(_2549, _2459, _2459);
    float _2561 = fma(_2547, _2547, _2551);
    float _2563 = fma(_2479, _2549, _2479);
    float _2565 = float(_2163);
    float _2567 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2559);
    float _2569 = fma(_2557, _2557, _2561);
    float _2571 = float(_2553);
    float _2573 = _2515 * (-2.0);
    float _2575 = fma(_2563, _2395, _2567);
    if (!_2437)
    {
        float _2577 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2543);
        _2541 = _2577;
    }
    float _2579 = _2541;
    int _2581 = abs(_1959);
    float _2583 = rsqrt(_2569);
    float _2585 = _2571 * _2565;
    float _2587 = fma(_2573, _2461, _2461);
    float _2589 = fma(_2439, _2573, _2439);
    float _2591 = _2575 * 0.15915493667125701904296875;
    float _2593 = _2585 * (-2.0);
    float _2595 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2587);
    bool _2597 = _760 == 0;
    float _2599 = _2591 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2463, _2463);
    float _2605 = fma(_2589, _2395, _2595);
    float _2607 = fma(_2451, _2593, _2451);
    float _2609 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2603);
    float _2611 = _2605 * 0.15915493667125701904296875;
    float _2613 = in.m_69.x;
    float _2615 = in.m_69.y;
    float _2617 = in.m_69.z;
    float _2619 = in.m_69.w;
    float _2621 = _2547 * _2583;
    float _2623 = _2527 * _2583;
    float _2625 = _2557 * _2583;
    float _2627 = fma(_2607, _2395, _2609);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = _2621 * _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2635 = _2623 * _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2625 * _2637;
    float _2641 = _2591 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2647 = -_2631;
    float _2649 = fma(_2625, _2645, _2647);
    float _2651 = _2627 * 0.15915493667125701904296875;
    float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2655 = -_2639;
    float _2657 = fma(_2623, _2653, _2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = -_2635;
    float _2663 = fma(_2621, _2659, _2661);
    float _2665 = _2649 * _2649;
    float _2667 = _2611 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = fma(_2657, _2657, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2675 = fma(_2663, _2663, _2671);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2679 = _2615 * _2543;
    float _2681 = _2611 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2687 = _2617 * _2499;
    float _2689 = -_2679;
    float _2691 = fma(_2617, _2489, _2689);
    float _2693 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2701 = _2651 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2613 * _2489;
    float _2707 = -_2687;
    float _2709 = fma(_2613, _2543, _2707);
    float _2711 = _2643 * _2669;
    out.m_71.x = _2693;
    out.m_71.y = _2695;
    out.m_71.z = _2697;
    out.m_71.w = _2699;
    float _2713 = -_2705;
    float _2715 = fma(_2615, _2499, _2713);
    float _2717 = _2691 * _2619;
    float _2719 = _2709 * _2619;
    float _2721 = rsqrt(_2675);
    float _2723 = _2643 * _2683;
    float _2725 = _2601 * _2683;
    float _2727 = _2601 * _2669;
    float _2729 = _2715 * _2619;
    float _2731 = _2651 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = _2683 * _2703;
    int _2737 = _1667 >> 31;
    float _2739 = _2643 * _2703;
    float _2741 = _2601 * _2703;
    int _2743 = _1795 >> 31;
    float _2745 = _2669 * _2703;
    float _2747 = _2739 * _2207;
    float _2749 = _2657 * _2721;
    float _2751 = _2649 * _2721;
    float _2753 = _2663 * _2721;
    int _2755 = _2737 & 3;
    float _2757 = _2741 * _2207;
    int _2759 = _1903 >> 31;
    int _2761 = _1667 + _2755;
    float _2763 = fma(_2733, _2723, _2727);
    float _2765 = fma(_2733, _2727, _2723);
    float _2767 = -_2207;
    float _2769 = _2733 * _2767;
    float _2771 = -_2711;
    float _2773 = fma(_2733, _2725, _2771);
    int _2775 = _2743 & 3;
    float _2777 = fma(_2763, _2201, _2747);
    float _2779 = fma(_2735, _2201, _2769);
    float _2781 = fma(_2773, _2201, _2757);
    int _2783 = _1795 + _2775;
    float _2785 = -_2725;
    float _2787 = fma(_2733, _2711, _2785);
    int _2789 = _2761 >> 2;
    float _2791 = _2625 * _2751;
    int _2793 = _2759 & 3;
    float _2795 = fma(_2787, _2209, _2777);
    int _2797 = _2783 >> 2;
    float _2799 = _2623 * _2749;
    int _2801 = _2789 << 4;
    int _2803 = _2801 + 368;
    float _2805 = -_2791;
    float _2807 = fma(_2623, _2753, _2805);
    int _2809 = _1903 + _2793;
    float _2811 = fma(_2745, _2209, _2779);
    int _2813 = _2797 << 4;
    int _2815 = _2813 + 512;
    float _2817 = fma(_2765, _2209, _2781);
    int _2819 = _2809 >> 2;
    uint _2821 = uint(int(uint(_2803) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    float _2837 = _2621 * _2753;
    float _2839 = -_2799;
    float _2841 = fma(_2621, _2751, _2839);
    int _2843 = _2819 << 4;
    int _2845 = _2843 + 656;
    float _2847 = _2787 * _2807;
    float _2849 = -_2837;
    float _2851 = fma(_2625, _2749, _2849);
    int _2853 = ~_1865;
    int _2855 = _2853 + _1907;
    int _2857 = _2855 + 1;
    float _2859 = _2763 * _2807;
    uint _2861 = uint(int(uint(_2815) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    float _2877 = _2763 * _2851;
    float _2879 = _2763 * _2841;
    int _2881 = ~_1727;
    int _2883 = _2881 + _1831;
    int _2885 = _2883 + 1;
    float _2887 = _2787 * _2841;
    int _2889 = ~_1919;
    int _2891 = _2889 + _2019;
    int _2893 = _2891 + 1;
    float _2895 = fma(_2735, _2749, _2859);
    float _2897 = fma(_2735, _2751, _2877);
    uint _2899 = uint(int(uint(_2845) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    float _2915 = fma(_2735, _2753, _2879);
    float _2917 = _2739 * _2807;
    float _2919 = _2739 * _2851;
    float _2921 = _2787 * _2851;
    int _2923 = _760 * _2885;
    int _2925 = _2923 + _1311;
    float _2927 = -_2733;
    float _2929 = fma(_2927, _2749, _2917);
    float _2931 = -_2733;
    float _2933 = fma(_2931, _2751, _2919);
    float _2935 = fma(_2745, _2751, _2921);
    int _2937 = _744 * _2857;
    int _2939 = _2937 + _1357;
    int _2941 = abs(_1755);
    float _2943 = _2807 * _2795;
    float _2945 = _2851 * _2795;
    int _2947 = _2815 + 8;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    uint _2951 = uint(int(uint(int(_2949)) >> uint(2)));
    int _2953 = int(_2949) & 3;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[int(_2951)][_2953];
    int _2957 = int(_2949) + 1;
    uint _2959 = uint(int(uint(_2957) >> uint(2)));
    int _2961 = _2957 & 3;
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[int(_2959)][_2961];
    float _2965 = _2739 * _2841;
    float _2967 = _2841 * _2795;
    int _2969 = abs(_1929);
    int _2971 = _786 * _2893;
    int _2973 = _2971 + _1445;
    int _2975 = abs(_2011);
    float _2977 = -_2733;
    float _2979 = fma(_2977, _2753, _2965);
    int _2981 = ~_2941;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2803 + 8;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    uint _2991 = uint(int(uint(int(_2989)) >> uint(2)));
    int _2993 = int(_2989) & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    int _2997 = int(_2989) + 1;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    int _3001 = _2997 & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = ~_2969;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = fma(_2745, _2749, _2847);
    float _3013 = fma(_2749, _2811, _2943);
    int _3015 = ~_2975;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    float _3021 = fma(_2745, _2753, _2887);
    int _3023 = abs(_1821);
    float _3025 = fma(_2751, _2811, _2945);
    int _3027 = _2845 + 8;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    uint _3031 = uint(int(uint(int(_3029)) >> uint(2)));
    int _3033 = int(_3029) & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = int(_3029) + 1;
    uint _3039 = uint(int(uint(_3037) >> uint(2)));
    int _3041 = _3037 & 3;
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[int(_3039)][_3041];
    float _3045 = fma(_2753, _2811, _2967);
    int _3047 = ~_3023;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _2985 * as_type<int>(_2835);
    int _3055 = abs(_2125);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3059 = int(_3057);
    bool _3061 = !_2597;
    int _3063 = _3061 ? _2925 : (-1);
    float _3065 = fma(_2741, _2621, _2929);
    bool _3067 = !_1291;
    int _3069 = _3067 ? _2939 : (-1);
    float _3071 = fma(_2741, _2623, _2933);
    bool _3073 = !_1347;
    int _3075 = _3073 ? _2973 : (-1);
    int _3077 = _3009 * as_type<int>(_2875);
    int _3079 = abs(_1949);
    float _3081 = fma(_2741, _2625, _2979);
    float _3083 = fma(_2773, _2621, _2895);
    float _3085 = fma(_2621, _2817, _3013);
    int _3087 = _3019 * as_type<int>(_2913);
    int _3089 = ~_3055;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2581;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2765, _2621, _3011);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3093 * as_type<int>(_2905);
    int _3115 = _3113 + _3087;
    int _3117 = abs(_1897);
    int _3119 = _3103 * as_type<int>(_2827);
    int _3121 = _3119 + _3053;
    int _3123 = abs(_1989);
    int _3125 = _3111 * as_type<int>(_2867);
    int _3127 = _3125 + _3077;
    int _3129 = abs(_2131);
    float _3131 = fma(_2765, _2625, _3021);
    int _3133 = ~_3117;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2765, _2623, _2935);
    int _3141 = ~_3123;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_2623, _2817, _3025);
    int _3149 = abs(_2119);
    int _3151 = _3137 * as_type<int>(_2955);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3129;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3051 * as_type<int>(_2995);
    int _3163 = _3161 + _3121;
    int _3165 = ~_3149;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3173 = int(_3171);
    float _3175 = float(uint(_3059));
    float _3177 = _3071 * _2615;
    float _3179 = float(uint(_3097));
    int _3181 = _3169 * as_type<int>(_3003);
    int _3183 = _3181 + _3163;
    int _3185 = abs(_2153);
    int _3187 = _3145 * as_type<int>(_3035);
    int _3189 = _3187 + _3115;
    int _3191 = abs(_3059);
    int _3193 = _3159 * as_type<int>(_2963);
    int _3195 = _3193 + _3153;
    bool _3197 = !_2171;
    int _3199 = _3197 ? 0 : 1;
    float _3201 = 1.0 / _3175;
    bool _3203 = !_2175;
    int _3205 = _3203 ? 0 : 1;
    float _3207 = fma(_2773, _2625, _2915);
    int _3209 = abs(_3199);
    int _3211 = abs(_3205);
    int _3213 = ~_3209;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = 1.0 / _3179;
    float _3221 = float(uint(_3173));
    int _3223 = ~_3185;
    int _3225 = _3223 + 1;
    int _3227 = _3225 + 1;
    int _3229 = _3183 * _3217;
    bool _3231 = !_2179;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = ~_3211;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    float _3241 = 1.0 / _3221;
    int _3243 = abs(_3233);
    int _3245 = _3227 * as_type<int>(_3043);
    int _3247 = _3245 + _3189;
    float _3249 = float(uint(_3191));
    int _3251 = _3063 * _3209;
    int _3253 = _3251 + _3229;
    int _3255 = ~_3243;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    int _3261 = _3239 * _3195;
    int _3263 = abs(_3097);
    float _3265 = fma(_2625, _2817, _3045);
    int _3267 = as_type<int>(_3201) + (-2);
    int _3269 = _3259 * _3247;
    float _3271 = float(uint(_3253));
    int _3273 = _3069 * _3211;
    int _3275 = _3273 + _3261;
    float _3277 = 1.0 / _3249;
    int _3279 = _3075 * _3243;
    int _3281 = _3279 + _3269;
    float _3283 = float(uint(_3263));
    float _3285 = fma(_2773, _2623, _2897);
    float _3287 = as_type<float>(_3267) * _3271;
    int _3289 = as_type<int>(_3219) + (-2);
    float _3291 = _2523 + _3085;
    float _3293 = float(uint(_3275));
    float _3295 = 1.0 / _3283;
    int _3297 = as_type<int>(_3241) + (-2);
    float _3299 = _2539 + _3265;
    float _3301 = float(uint(_3281));
    float _3303 = as_type<float>(_3289) * _3293;
    int _3305 = abs(_3173);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3291 + _3307;
    int _3311 = abs(_3253);
    float _3313 = trunc(_3287);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = as_type<float>(_3297) * _3301;
    float _3321 = float(uint(_3305));
    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3325 = _3299 + _3323;
    int _3327 = as_type<int>(_3277) + (-2);
    float _3329 = _3309 * _3309;
    float _3331 = float(uint(_3311));
    float _3333 = _3325 * _3325;
    float _3335 = trunc(_3303);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_3275);
    float _3343 = _3065 * _2497;
    int _3345 = ~_3059;
    int _3347 = _3345 + 1;
    float _3349 = as_type<float>(_3327) * _3331;
    int _3351 = as_type<int>(_3295) + (-2);
    float _3353 = _3329 + _3333;
    float _3355 = float(uint(_3341));
    float _3357 = trunc(_3319);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    int _3363 = ~_3097;
    int _3365 = _3363 + 1;
    int _3367 = _3347 * int(_3317);
    int _3369 = _3367 + _3253;
    int _3371 = ~_3173;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_3351) * _3355;
    int _3377 = abs(_3281);
    int _3379 = ~_3191;
    int _3381 = _3379 + 1;
    float _3383 = 1.0 / _3321;
    int _3385 = _3365 * int(_3339);
    int _3387 = _3385 + _3275;
    float _3389 = float(uint(_3369));
    float _3391 = float(uint(_3377));
    int _3393 = ~_3305;
    int _3395 = _3393 + 1;
    float _3397 = as_type<float>(_3267) * _3389;
    float _3399 = trunc(_3349);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    int _3405 = _3373 * int(_3361);
    int _3407 = _3405 + _3281;
    float _3409 = float(uint(_3387));
    float _3411 = _3071 * _2497;
    float _3413 = _2719 * _3071;
    float _3415 = float(uint(_3407));
    float _3417 = as_type<float>(_3289) * _3409;
    int _3419 = as_type<int>(_3383) + (-2);
    float _3421 = sqrt(_3353);
    float _3423 = _3081 * _2497;
    float _3425 = as_type<float>(_3297) * _3415;
    float _3427 = _3065 * _2615;
    float _3429 = _3081 * _2615;
    float _3431 = as_type<float>(_3419) * _3391;
    float _3433 = _2719 * _3065;
    float _3435 = trunc(_3375);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _3381 * int(_3403);
    int _3443 = _3441 + _3311;
    float _3445 = _2719 * _3081;
    float _3447 = fma(_3207, _2613, _3429);
    float _3449 = float(uint(_3443));
    float _3451 = fma(_3083, _2613, _3427);
    float _3453 = trunc(_3431);
    float _3455 = precise::max(_3453, 0.0);
    uint _3457 = uint(_3455);
    int _3459 = ~_3263;
    int _3461 = _3459 + 1;
    float _3463 = fma(_3285, _2613, _3177);
    float _3465 = as_type<float>(_3327) * _3449;
    bool _3467 = _3421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3469 = _3461 * int(_3439);
    int _3471 = _3469 + _3341;
    float _3473 = trunc(_3397);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = float(uint(_3471));
    int _3481 = _3395 * int(_3457);
    int _3483 = _3481 + _3377;
    float _3485 = trunc(_3417);
    float _3487 = precise::max(_3485, 0.0);
    uint _3489 = uint(_3487);
    float _3491 = as_type<float>(_3351) * _3479;
    float _3493 = fma(_3083, _2507, _3343);
    float _3495 = fma(_2717, _3285, _3413);
    float _3497 = float(uint(_3483));
    float _3499 = fma(_3285, _2507, _3411);
    float _3501 = _2517 + _3147;
    float _3503 = fma(_2717, _3083, _3433);
    float _3505 = trunc(_3425);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3419) * _3497;
    float _3513 = _3497;
    float _3515 = _3329;
    float _3517 = _3333;
    float _3519 = _3299;
    float _3521 = _3291;
    float _3523 = _2729;
    if (!_3467)
    {
        _3513 = _3329;
    }
    float _3525 = _3513;
    float _3527 = fma(_3207, _2507, _3423);
    float _3529 = _3525;
    if (!_3467)
    {
        _3515 = _3501;
    }
    float _3531 = _3515;
    float _3533 = trunc(_3465);
    float _3535 = precise::max(_3533, 0.0);
    uint _3537 = uint(_3535);
    float _3539 = trunc(_3491);
    float _3541 = precise::max(_3539, 0.0);
    uint _3543 = uint(_3541);
    bool _3545 = !_3467;
    float _3547 = _3531;
    if (!_3545)
    {
        float _3549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3553 = _3421 + _3551;
        float _3555 = rsqrt(_3353);
        float _3557 = _3553 * _3549;
        float _3559 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3561 = _3557 * 0.15915493667125701904296875;
        float _3563 = _3561 * 6.283185482025146484375;
        float _3565 = sin(_3563);
        float _3567 = _3561 * 6.283185482025146484375;
        float _3569 = cos(_3567);
        float _3571 = fma(_3565, _3559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3573 = _3555 * _3571;
        float _3575 = _3569 + (-1.0);
        float _3577 = fma(_3309, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3579 = fma(_3325, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3581 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3585 = _3577 + _3583;
        float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3589 = _3579 + _3587;
        float _3591 = fma(_3501, _3569, _3581);
        float _3593 = _3585 * _3585;
        float _3595 = _3589 * _3589;
        _3547 = _3591;
        _3529 = _3593;
        _3517 = _3595;
        _3519 = _3579;
        _3521 = _3577;
    }
    float _3597 = _3547;
    float _3599 = _3529;
    float _3601 = _3517;
    float _3603 = _3519;
    float _3605 = _3521;
    float _3607 = trunc(_3511);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    int _3613 = ~_3059;
    int _3615 = _3613 + 1;
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3619 = _3597 + _3617;
    int _3621 = int(_3317) + int(_3477);
    float _3623 = fma(_2717, _3207, _3445);
    int _3625 = int(_3339) + int(_3489);
    float _3627 = fma(_3619, _3619, _3599);
    int _3629 = int(_3439) + int(_3543);
    int _3631 = _3615 * _3621;
    int _3633 = _3631 + _3253;
    int _3635 = int(_3361) + int(_3509);
    float _3637 = _3627 + _3601;
    int _3639 = ~_3173;
    int _3641 = _3639 + 1;
    float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3645 = uint(_3633) >= uint(_3059);
    float _3647 = fma(_3105, _2617, _3451);
    int _3649 = ~_3097;
    int _3651 = _3649 + 1;
    int _3653 = _3641 * _3635;
    int _3655 = _3653 + _3281;
    int _3657 = int(_3457) + int(_3611);
    float _3659 = fma(_3139, _2617, _3463);
    int _3661 = ~_3263;
    int _3663 = _3661 + 1;
    int _3665 = _3651 * _3625;
    int _3667 = _3665 + _3275;
    int _3669 = int(_3403) + int(_3537);
    float _3671 = sqrt(_3637);
    int _3673 = ~_3191;
    int _3675 = _3673 + 1;
    int _3677 = _3663 * _3629;
    int _3679 = _3677 + _3341;
    int _3681 = ~_3305;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3131, _2617, _3447);
    bool _3687 = uint(_3667) >= uint(_3097);
    int _3689 = _3675 * _3669;
    int _3691 = _3689 + _3311;
    bool _3693 = !_3645;
    int _3695 = _3693 ? 0 : (-1);
    float _3697 = _3643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3699 = uint(_3679) >= uint(_3263);
    float _3701 = fma(_2729, _3105, _3503);
    bool _3703 = uint(_3655) >= uint(_3173);
    int _3705 = _3683 * _3657;
    int _3707 = _3705 + _3377;
    bool _3709 = !_3687;
    int _3711 = _3709 ? 0 : (-1);
    float _3713 = fma(_3697, _1007, -0.5);
    int _3715 = ~_3621;
    int _3717 = _3715 + _3695;
    int _3719 = _3717 + 1;
    float _3721 = fma(_2729, _3131, _3623);
    bool _3723 = !_3703;
    int _3725 = _3723 ? 0 : (-1);
    out.m_73.x = _3647;
    out.m_73.y = _3659;
    out.m_73.z = _3685;
    int _3727 = ~_3625;
    int _3729 = _3727 + _3711;
    int _3731 = _3729 + 1;
    bool _3733 = uint(_3691) >= uint(_3191);
    bool _3735 = uint(_3707) >= uint(_3305);
    int _3737 = _3097 * _3731;
    int _3739 = _3737 + _3275;
    bool _3741 = _3059 == 0;
    float _3743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3745 = _3059 == 0;
    int _3747 = _3253 ^ _3059;
    int _3749 = _3059 * _3719;
    int _3751 = _3749 + _3253;
    int _3753 = ~_3635;
    int _3755 = _3753 + _3725;
    int _3757 = _3755 + 1;
    bool _3759 = _3097 == 0;
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3763 = !_3733;
    int _3765 = _3763 ? 0 : (-1);
    bool _3767 = _3097 == 0;
    int _3769 = _3275 ^ _3097;
    bool _3771 = !_3699;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3777 = !_3741;
    int _3779 = _3777 ? _3751 : (-1);
    int _3781 = _3281 ^ _3173;
    int _3783 = _3173 * _3757;
    int _3785 = _3783 + _3281;
    bool _3787 = _3173 == 0;
    bool _3789 = _3173 == 0;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3793 = !_3759;
    int _3795 = _3793 ? _3739 : (-1);
    float _3797 = float(_3779);
    uint _3799 = uint(int(uint(_3747) >> uint(31)));
    uint _3801 = uint(int(uint(_3769) >> uint(31)));
    float _3803 = fma(_3697, _3797, _2281);
    bool _3805 = !_3735;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3811 = float(_3795);
    float _3813 = fma(_2383, _3713, _3803);
    uint _3815 = uint(int(uint(_3781) >> uint(31)));
    bool _3817 = !_3787;
    int _3819 = _3817 ? _3785 : (-1);
    float _3821 = _3791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3823 = ~_3765;
    int _3825 = _3669 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = _3813 + 0.5;
    int _3831 = ~_3773;
    int _3833 = _3629 + _3831;
    int _3835 = _3833 + 1;
    float _3837 = _3743 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3839 = ~int(_3799);
    int _3841 = _3839 + 1;
    float _3843 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3845 = ~int(_3801);
    int _3847 = _3845 + 1;
    float _3849 = fma(_3837, _989, -0.5);
    int _3851 = ~_3807;
    int _3853 = _3657 + _3851;
    int _3855 = _3853 + 1;
    float _3857 = fma(_3837, _3811, _2375);
    int _3859 = ~int(_3815);
    int _3861 = _3859 + 1;
    float _3863 = fma(_3843, _1681, -0.5);
    float _3865 = float(_3819);
    float _3867 = fma(_2329, _3849, _3857);
    int _3869 = _3827 ^ _3841;
    float _3871 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = _3835 ^ _3847;
    float _3875 = fma(_3843, _3865, _2367);
    int _3877 = _3855 ^ _3861;
    float _3879 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3881 = ~_3841;
    int _3883 = _3881 + _3869;
    int _3885 = _3883 + 1;
    float _3887 = fma(_1513, _3821, -0.5);
    int _3889 = ~_3847;
    int _3891 = _3889 + _3873;
    int _3893 = _3891 + 1;
    float _3895 = fma(_1555, _3879, -0.5);
    int _3897 = ~_3861;
    int _3899 = _3897 + _3877;
    int _3901 = _3899 + 1;
    float _3903 = fma(_2371, _3863, _3875);
    bool _3905 = !_3745;
    int _3907 = _3905 ? _3885 : (-1);
    bool _3909 = !_3767;
    int _3911 = _3909 ? _3893 : (-1);
    bool _3913 = !_3789;
    int _3915 = _3913 ? _3901 : (-1);
    float _3917 = float(_3907);
    float _3919 = float(_3911);
    float _3921 = float(_3915);
    float _3923 = -_2363;
    float _3925 = fma(_3821, _3917, _3923);
    float _3927 = fma(_3105, _2579, _3493);
    float _3929 = -_2389;
    float _3931 = fma(_3879, _3919, _3929);
    float _3933 = fma(_3871, _1605, -0.5);
    float _3935 = -_2391;
    float _3937 = fma(_3871, _3921, _3935);
    float _3939 = fma(_2385, _3887, _3925);
    float _3941 = fma(_2369, _3895, _3931);
    float _3943 = fma(_2729, _3139, _3495);
    float _3945 = fma(_2387, _3933, _3937);
    float _3947 = fma(_3139, _2579, _3499);
    float _3949 = _3903 + 0.5;
    float _3951 = _3867 + 0.5;
    float _3953 = _3939 + 0.5;
    float _3955 = _3941 + 0.5;
    float _3957 = _3945 + 0.5;
    float _3959 = fma(_3131, _2579, _3527);
    out.m_75.x = _3701;
    out.m_75.y = _3943;
    out.m_75.z = _3721;
    bool _3961 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3963 = isnan(_3671);
    bool _3965 = _3961 || _3963;
    bool _3967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3969 = _3965 || _3967;
    out.m_77.x = _3829;
    out.m_77.y = _3953;
    out.m_77.z = _3951;
    out.m_77.w = _3955;
    out.m_79.x = _3949;
    out.m_79.y = _3957;
    out.m_81.x = _3927;
    out.m_81.y = _3947;
    out.m_81.z = _3959;
    float _3971 = _3945;
    float _3973 = _3949;
    float _3975 = _3957;
    float _3977 = _3955;
    if (!_3969)
    {
        _3523 = 1.0;
    }
    float _3979 = _3523;
    bool _3981 = !_3969;
    float _3983 = _3979;
    if (!_3981)
    {
        bool _3985 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3987 = isnan(_3671);
        bool _3989 = _3985 || _3987;
        bool _3991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3993 = _3989 || _3991;
        if (!_3993)
        {
            float _3995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3997 = _3671 + _3995;
            float _3999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3999;
            float _4003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4007 = 1.0 / _4001;
            float _4009 = _3997 * _4007;
            float _4011 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3983 = _4011;
            _4013 = true;
        }
        else
        {
            bool _4015 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4017 = isnan(_3671);
            bool _4019 = _4015 || _4017;
            bool _4021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4023 = _4019 || _4021;
            if (!_4023)
            {
                float _4025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4027 = _3671 + _4025;
                float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4031 = _4029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4035 = _4033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4037 = 1.0 / _4031;
                float _4039 = _4027 * _4037;
                float _4041 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3983 = _4041;
                _4013 = true;
            }
            else
            {
                _3983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4013 = false;
    float _4043 = _3983;
    float _4045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4047 = _3597 + _4045;
    float _4049 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4051 = _3603 + _4049;
    bool _4053 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4055 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan(0.5);
    bool _4061 = _4057 || _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4065 = _3605 + _4063;
    float _4067 = fma(_4047, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4069 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4071 = fma(_4065, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4073 = _4067;
    float _4075 = _4069;
    if (_4061)
    {
        _3971 = _4071;
    }
    float _4077 = _3971;
    float _4079 = _4077;
    if (!_4061)
    {
        float _4081 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4083 = _2517 + _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4087 = _2523 + _4085;
        float _4089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4091 = -_2539;
        float _4093 = _4091 + _4069;
        float _4095 = _4083 * _4083;
        float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4099 = _2539 + _4097;
        float _4101 = fma(_4087, _4087, _4095);
        float _4103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4105 = fma(_4099, _4099, _4101);
        float _4107 = sqrt(_4105);
        float _4109 = _4089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4111 = precise::min(_4107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4113 = _4111 * _4103;
        float _4115 = -_2523;
        float _4117 = _4115 + _4071;
        float _4119 = _4109 * _4113;
        float _4121 = -_2517;
        float _4123 = _4121 + _4067;
        float _4125 = fma(_4117, _4119, _2523);
        float _4127 = fma(_4123, _4119, _2517);
        float _4129 = fma(_4093, _4119, _2539);
        _4073 = _4127;
        _4079 = _4125;
        _4075 = _4129;
        _3973 = _4119;
    }
    float _4131 = _4073;
    float _4133 = _4079;
    float _4135 = _4075;
    float _4137 = _3973;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _4131 + _4139;
    float _4143 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4145 = _4133 + _4143;
    float _4147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4149 = _4135 + _4147;
    float _4151 = _4141 * _4141;
    float _4153 = fma(_4145, _4145, _4151);
    float _4155 = fma(_4149, _4149, _4153);
    float _4157 = rsqrt(_4155);
    float _4159 = sqrt(_4155);
    float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4163 = _4145 * _4161;
    float _4165 = _4149 * _4161;
    float _4167 = _4163 * _4163;
    float _4169 = _4165 * _4165;
    float _4171 = _4167 + _4169;
    float _4173 = sqrt(_4171);
    bool _4175 = _4173 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4179 = _4173 + _4177;
    float _4181 = _4157;
    float _4183 = _4137;
    float _4185 = _4179;
    float _4187 = _4141;
    float _4189 = _4161;
    if (_4175)
    {
        float _4191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4191;
    }
    float _4193 = _4181;
    if (_4175)
    {
        float _4195 = rsqrt(_4171);
        _4183 = _4195;
    }
    float _4197 = _4183;
    float _4199 = _4197;
    if (_4175)
    {
        float _4201 = _4179 * _4193;
        _4185 = _4201;
    }
    float _4203 = _4185;
    if (_4175)
    {
        float _4205 = _4203 * 0.15915493667125701904296875;
        _3975 = _4205;
    }
    float _4207 = _3975;
    float _4209 = _4193;
    float _4211 = _4207;
    if (_4175)
    {
        float _4213 = _4207 * 6.283185482025146484375;
        float _4215 = sin(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4221 = precise::max(0.0, _4219);
    float _4223 = _4149;
    float _4225 = _4221;
    if (_4175)
    {
        float _4227 = _4207 * 6.283185482025146484375;
        float _4229 = cos(_4227);
        _4223 = _4229;
    }
    float _4231 = _4223;
    float _4233 = -_4161;
    float _4235 = -_4221;
    float _4237 = fma(_4141, _4233, _4235);
    if (_4175)
    {
        float _4239 = _4237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4225 = _4239;
    }
    float _4241 = _4225;
    float _4243 = _4241;
    if (!_4175)
    {
        _4211 = _4167;
    }
    float _4245 = _4211;
    float _4247 = _4217;
    float _4249 = _4245;
    if (_4175)
    {
        float _4251 = fma(_4217, _4241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4187 = _4251;
    }
    float _4253 = _4187;
    float _4255 = _4253;
    if (!_4175)
    {
        _4247 = _4163;
    }
    float _4257 = _4247;
    float _4259 = _4257;
    if (_4175)
    {
        float _4261 = _4231 + (-1.0);
        _4243 = _4261;
    }
    float _4263 = _4243;
    float _4265 = _4263;
    if (_4175)
    {
        float _4267 = _4197 * _4253;
        _3977 = _4267;
    }
    float _4269 = _3977;
    if (!_4175)
    {
        _4199 = _4237;
    }
    float _4271 = _4199;
    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4275 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4273);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    float _4279 = _4271;
    if (_4175)
    {
        float _4281 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4281;
    }
    float _4283 = _4189;
    if (_4175)
    {
        float _4285 = _4163 * _4269;
        _4259 = _4285;
    }
    float _4287 = _4259;
    if (!_4175)
    {
        _4255 = _4165;
    }
    float _4289 = _4255;
    float _4291 = _4289;
    if (_4175)
    {
        float _4293 = _4165 * _4269;
        _4291 = _4293;
    }
    float _4295 = _4291;
    if (_4175)
    {
        float _4297 = fma(_4237, _4231, _4283);
        _4279 = _4297;
    }
    float _4299 = _4279;
    if (_4175)
    {
        float _4301 = _4287 * _4287;
        _4249 = _4301;
    }
    float _4303 = _4249;
    if (!_4175)
    {
        _4265 = _4169;
    }
    float _4305 = _4265;
    float _4307 = _4305;
    if (_4175)
    {
        float _4309 = _4295 * _4295;
        _4307 = _4309;
    }
    float _4311 = _4307;
    float _4313 = fma(_4299, _4299, _4303);
    float _4315 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4317 = -_4277;
    float _4319 = _4317 + 1.0;
    float _4321 = _4313 + _4311;
    float _4323 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4325 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4327 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4329 = rsqrt(_4321);
    float _4331 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4315);
    float _4333 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4325);
    float _4335 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4327);
    float _4337 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4339 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4331);
    float _4341 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4333);
    float _4343 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4345 = floor(_4323);
    float _4347 = _4339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4349 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4351 = _4341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4353 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4343);
    float _4355 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4357 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4359 = _4329 * _4287;
    float _4361 = abs(_4319);
    float _4363 = log2(_4361);
    float _4365 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4353);
    float _4367 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4357);
    float _4369 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4371 = _4329 * _4295;
    float _4373 = _4365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4375 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4367);
    float _4377 = floor(_4337);
    float _4379 = _4329 * _4299;
    float _4381 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4375);
    float _4383 = -_4345;
    float _4385 = _4323 + _4383;
    float _4387 = -_4369;
    float _4389 = fma(_4379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4387);
    float _4391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4393 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4395 = -_4371;
    float _4397 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4389);
    float _4399 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4401 = 1.0 / _4381;
    float _4403 = fma(_4397, -0.5, 0.5);
    float _4405 = fma(_4397, 0.5, 0.5);
    float _4407 = -_4399;
    float _4409 = fma(_4407, _4391, 1.0);
    float _4411 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4413 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4415 = fma(_4405, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4417 = exp2(_4393);
    float _4419 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4411);
    float _4421 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4413);
    float _4423 = sqrt(_4403);
    float _4425 = fma(_4405, _4415, -0.212114393711090087890625);
    float _4427 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4419);
    float _4429 = _4379 + 1.0;
    float _4431 = log2(_4409);
    float _4433 = -_4377;
    float _4435 = _4337 + _4433;
    float _4437 = fma(_4405, _4425, 1.570728778839111328125);
    float _4439 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4421);
    float _4441 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4427);
    float _4443 = -_4379;
    float _4445 = fma(_4417, _4429, _4443);
    float _4447 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4439);
    float _4449 = _4423 * 0.636619746685028076171875;
    float _4451 = _4441 * _4401;
    float _4453 = _4447 * _4401;
    float2 _11396 = float2(_4385, _4435);
    float _4455 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11396, float2(0.0), isnan(_11396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11396, float2(0.0), isnan(_11396)), level(0.0)).x;
    float _4457 = -_4437;
    float _4459 = fma(_4449, _4457, 1.0);
    float _4461 = fma(_4451, 0.5, 0.5);
    float _4463 = fma(_4445, 0.5, 0.5);
    float _4465 = _4431 * 0.693147182464599609375;
    float _4467 = fma(_4453, -0.5, 0.5);
    float _4469 = _4465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _11425 = float3(_4461, _4467, _4469);
    float _4471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11425, float3(0.0), isnan(_11425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11425, float3(0.0), isnan(_11425)), level(0.0)).x;
    float3 _11436 = float3(_4461, _4467, _4469);
    float4 _4474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).xyzw;
    float _4476 = _4474.x;
    float _4478 = _4474.y;
    float _4480 = _4474.z;
    float _4482 = _4474.w;
    float2 _11452 = float2(_4459, _4463);
    float3 _4486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11452, float2(0.0), isnan(_11452)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11452, float2(0.0), isnan(_11452)), level(0.0)).xyz;
    float _4488 = _4486.x;
    float _4490 = _4486.y;
    float _4492 = _4486.z;
    float _4494 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4496 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4498 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4500 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4494);
    float _4502 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4496);
    float _4504 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4506 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4500);
    float _4508 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4502);
    float _4510 = exp2(_4498);
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4514 = _4508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4504);
    float _4518 = _4514 + _4512;
    float _4520 = 1.0 / _4512;
    float _4522 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4516);
    bool _4524 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4526 = isnan(_4159);
    bool _4528 = _4524 || _4526;
    bool _4530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4532 = _4528 || _4530;
    float _4534 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4522);
    float _4536 = -_4510;
    float _4538 = _4536 + 1.0;
    out.gl_Position.x = _4441;
    out.gl_Position.y = _4447;
    out.gl_Position.z = _4534;
    out.gl_Position.w = _4381;
    float _4540 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4542 = _4518 * _4520;
    float _4544 = _4542 * 0.5;
    float _4546 = in.m_83.x;
    float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4550 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4548);
    float _4552 = 1.0 / _4550;
    float _4554 = -_4540;
    float _4556 = _4554 + 1.0;
    float _4558 = _4447;
    float _4560 = _4534;
    float _4562 = _4556;
    if (!_4532)
    {
        _4558 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4564 = _4558;
    float _4566 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4568 = _4552 * _4566;
    float _4570 = abs(_4568);
    float _4572 = log2(_4570);
    bool _4574 = _4568 <= 8000.0;
    bool _4576 = isnan(_4568);
    bool _4578 = _4574 || _4576;
    bool _4580 = isnan(8000.0);
    bool _4582 = _4578 || _4580;
    float _4584 = float(_4582);
    float _4586 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4588 = exp2(_4586);
    float _4590 = fma(_4588, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4592, -2.0, 3.0);
    float _4596 = _4592 * _4592;
    float _4598 = _4596 * _4594;
    float _4600 = -_4598;
    float _4602 = _4600 + 1.0;
    float _4604 = fma(_4602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4598);
    float _4606 = _4534 + _4381;
    float _4608 = _4564;
    float _4610 = _4564;
    if (!_4532)
    {
        _4560 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4612 = _4560;
    float _4614 = _4584 * _4604;
    float _4616 = _4606 * 0.5;
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.z = _4616;
    out.m_85.w = _4381;
    float _4620 = -_4455;
    float _4622 = _4620 + 1.0;
    float _4624 = _4622 * _4618;
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = -_4626;
    float _4630 = fma(_4628, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4632 = _4540 * _4471;
    float _4634 = _4630 * _4546;
    float _4636 = _4482 * _4556;
    float _4638 = _4612;
    float _4640 = _4612;
    if (!_4532)
    {
        _4562 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4642 = _4562;
    float _4644 = _4482 * _4632;
    float _4646 = _4492 * _4632;
    float _4648 = _4634 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4650 = fma(_4488, _4644, _4476);
    float _4652 = fma(_4490, _4644, _4478);
    float _4654 = fma(_4482, _4646, _4480);
    out.m_87.x = _4648;
    out.m_89.x = _4650;
    out.m_89.y = _4652;
    out.m_89.z = _4654;
    out.m_89.w = _4636;
    bool _4656 = !_4532;
    float _4658 = _4642;
    float _4660 = _4642;
    if (!_4656)
    {
        bool _4662 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4664 = isnan(_4159);
        bool _4666 = _4662 || _4664;
        bool _4668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4670 = _4666 || _4668;
        if (!_4670)
        {
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4674 = _4159 + _4672;
            float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4678 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4676;
            float _4680 = 1.0 / _4678;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4690 = _4674 * _4680;
            float _4692 = precise::clamp(_4690, 0.0, 1.0);
            float _4694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4696 = _4694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4698 = fma(_4692, _4688, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4700 = fma(_4692, _4696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4702 = fma(_4692, _4684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4610 = _4702;
            _4640 = _4700;
            _4660 = _4698;
            _4704 = true;
        }
        else
        {
            bool _4706 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4708 = isnan(_4159);
            bool _4710 = _4706 || _4708;
            bool _4712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4714 = _4710 || _4712;
            if (!_4714)
            {
                _4638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4716 = _4638;
            _4640 = _4716;
            if (!_4714)
            {
                _4608 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4718 = _4608;
            _4610 = _4718;
            if (!_4714)
            {
                _4658 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4720 = _4658;
            bool _4722 = !_4714;
            _4660 = _4720;
            if (!_4722)
            {
                bool _4724 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4726 = isnan(_4159);
                bool _4728 = _4724 || _4726;
                bool _4730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4732 = _4728 || _4730;
                if (!_4732)
                {
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4736 = _4159 + _4734;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4738;
                    float _4742 = 1.0 / _4740;
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4752 = _4736 * _4742;
                    float _4754 = precise::clamp(_4752, 0.0, 1.0);
                    float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4760 = fma(_4754, _4750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4762 = fma(_4754, _4758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4764 = fma(_4754, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4610 = _4764;
                    _4640 = _4762;
                    _4660 = _4760;
                    _4704 = true;
                }
                else
                {
                    _4610 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4660 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4704 = false;
    float _4766 = _4610;
    float _4768 = _4640;
    float _4770 = _4660;
    float _4772 = _4766 * 0.586610972881317138671875;
    bool _4774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4776 = fma(_4768, 0.298911988735198974609375, _4772);
    out.m_91.x = 0.0;
    float _4778 = fma(_4770, 0.114477999508380889892578125, _4776);
    float _4780 = -_4778;
    float _4782 = _4780 + _4768;
    float _4784 = -_4778;
    float _4786 = _4784 + _4766;
    float _4788 = -_4778;
    float _4790 = _4788 + _4770;
    float _4792 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4794 = fma(_4782, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4796 = fma(_4786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4798 = fma(_4790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    out.m_87.w = _4792;
    out.m_93.x = _4794;
    out.m_93.y = _4796;
    out.m_93.z = _4798;
    if (!_4774)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4800 = -_4131;
    float _4802 = _4800 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4804 = -_4133;
    float _4806 = _4804 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4808 = -_4135;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4812 = _4802 * _4802;
    float _4814 = fma(_4806, _4806, _4812);
    float _4816 = fma(_4810, _4810, _4814);
    float _4818 = sqrt(_4816);
    float _4820 = rsqrt(_4816);
    float _4822 = -_4818;
    float _4824 = _4822 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4826 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4828 = precise::clamp(_4826, 0.0, 1.0);
    float _4830 = _4806 * _4820;
    float _4832 = _4802 * _4820;
    float _4834 = abs(_4828);
    float _4836 = log2(_4834);
    float _4838 = _4810 * _4820;
    float _4840 = _4830 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4842 = _3947 * _4832;
    float _4844 = -_4832;
    float _4846 = -_4840;
    float _4848 = fma(_4844, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4846);
    float _4850 = fma(_3927, _4830, _4842);
    float _4852 = -_4838;
    float _4854 = fma(_4852, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4848);
    float _4856 = fma(_3959, _4838, _4850);
    float _4858 = precise::clamp(_4856, 0.0, 1.0);
    float _4860 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4862 = _4854 + _4860;
    float _4864 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4866 = _4862 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4868 = precise::clamp(_4866, 0.0, 1.0);
    float _4870 = exp2(_4864);
    float _4872 = _4870 * _4868;
    float _4874 = _4858 * _4872;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4878 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4880 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4876;
    out.m_91.y = _4878;
    out.m_91.z = _4880;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4704 = false;
    bool _4013 = false;
    bool _692 = false;
    bool _576 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4937 = as_type<float>(_128);
        out.gl_Position.z = _4937;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_166);
        out.gl_Position.z = _5006;
    }
    if (_160)
    {
        return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _206;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _198 + _240;
    float _244 = 1.0 / _210;
    float _246 = _242 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _198 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _224;
    float _260 = _250 * _238;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _198 + _266;
    float _270 = 1.0 / _214;
    float _272 = _254 * _244;
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _220;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _290 = _198 + _288;
    float _292 = _290 * _258;
    bool _294 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_198);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = _264 * _270;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = fma(_308, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_322;
    float _332 = _330 + 1.0;
    float _334 = fma(_326, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = _268 * _286;
    float _338 = -_284;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _236 * _332;
    bool _348 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_198);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = _304 * _340;
    float _362 = fma(_344, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = -_304;
    float _366 = _364 + 1.0;
    bool _368 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_198);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _384 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_198);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _322 * _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_236;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = _378 * _404;
    float _418 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _358 * _412;
    float _422 = fma(_408, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = -_378;
    float _426 = _424 + 1.0;
    float _428 = -_358;
    float _430 = _428 + 1.0;
    float _432 = _334 * _420;
    float _434 = _362 * _420;
    float _436 = _328 * _420;
    float _438 = _394 * _426;
    float _440 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_446, _272, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _460 = fma(_450, _272, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _470 = fma(_414, _438, _440);
    float _472 = fma(_418, _438, _442);
    float _474 = fma(_422, _438, _452);
    float _476 = fma(_456, _272, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_468, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_458, _416, _470);
    float _488 = fma(_460, _416, _472);
    float _490 = fma(_480, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_476, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _502;
    float _506 = fma(_482, _346, _486);
    float _508 = fma(_484, _346, _488);
    float _510 = fma(_490, _346, _492);
    float _512 = fma(_496, _336, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_500, _336, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_504, _336, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _530 = fma(_512, _396, _506);
    float _532 = fma(_520, _292, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _534 = fma(_524, _292, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _536 = fma(_528, _292, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _538 = fma(_514, _396, _508);
    float _540 = fma(_516, _396, _510);
    float _542 = fma(_532, _360, _530);
    float _544 = fma(_534, _360, _538);
    float _546 = fma(_536, _360, _540);
    float _548 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].y, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].z, _546);
    bool _554 = !_256;
    int _556 = as_type<int>(_292);
    float _574;
    if (!_554)
    {
        float _558 = in.m_55.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_112);
        float _580 = 1.0 / _578;
        float _582 = _146 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = in.m_57.x;
    float _588 = in.m_57.y;
    float _590 = in.m_57.z;
    bool _592 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_584);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_584);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _584 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _644 * _636;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _552 * _590;
    float _668 = _550 * _588;
    float _670 = _548 * _586;
    out.m_59.x = _658;
    out.m_59.y = _660;
    out.m_59.z = _662;
    out.m_59.w = _664;
    bool _672 = !_632;
    float _690;
    if (!_672)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        float _694 = float(_112);
        float _696 = 1.0 / _694;
        float _698 = _146 * _696;
        _690 = _698;
    }
    _692 = false;
    float _700 = _690;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_55.x;
    float _708 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = in.m_55.y;
    float _714 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _716 = int(_714);
    float _718 = in.m_61.x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _736 = int(_734);
    float _738 = float(_704);
    float _740 = float(_716);
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _744 = int(_742);
    float _746 = float(_736);
    float _748 = 1.0 / _740;
    float _750 = 1.0 / _738;
    float _752 = float(uint(_744));
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _760 = int(_758);
    float _762 = _748 * _146;
    float _764 = 1.0 / _746;
    float _766 = _750 * _146;
    float _768 = _750;
    float _770 = _746;
    bool _772 = _756;
    float _774 = _718;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_756)
    {
        _768 = 1.0;
    }
    float _778 = _768;
    float _780 = _778;
    if (!_756)
    {
        _780 = 1.2345600128173828125;
    }
    float _782 = _780;
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = float(uint(_760));
    float _790 = _788;
    if (_756)
    {
        _770 = 1.0;
    }
    float _792 = _770;
    float _794 = _792;
    if (!_756)
    {
        _794 = 7.345489978790283203125;
    }
    float _796 = _794;
    int _798 = ~_760;
    int _800 = _798 + 1;
    float _802 = 1.0 / _788;
    float _804 = _764 * _146;
    float _806 = _796 * _706;
    float _808 = _764;
    if (_756)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    float _812 = in.m_55.z;
    float _814 = _810;
    if (!_756)
    {
        _814 = 5.839270114898681640625;
    }
    float _816 = _814;
    float _818 = trunc(_762);
    int _820 = int(_818);
    float _822 = float(uint(_786));
    if (_756)
    {
        _790 = _706;
    }
    float _824 = _790;
    float _826 = _824;
    if (!_756)
    {
        _826 = _712;
    }
    float _828 = _826;
    int _830 = ~_786;
    int _832 = _830 + 1;
    float _834 = 1.0 / _752;
    int _836 = as_type<int>(_802) + (-2);
    float _838 = _828 * _782;
    int _840 = ~_786;
    int _842 = _840 + 1;
    float _844 = trunc(_766);
    int _846 = int(_844);
    float _848 = float(uint(_820));
    bool _850 = _812 > 0.5;
    float _852 = _706 + _812;
    float _854 = _712 + _812;
    float _856 = 1.0 / _822;
    int _858 = as_type<int>(_834) + (-2);
    float _860 = _852 + (-1.0);
    float _862 = _854 + (-1.0);
    float _864 = trunc(_804);
    int _866 = int(_864);
    float _868 = float(uint(_846));
    float _870 = as_type<float>(_836) * _848;
    float _872 = as_type<float>(_858) * _868;
    float _874 = _868;
    if (_756)
    {
        _874 = _706;
    }
    float _876 = _874;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = _876;
    int _889 = _885;
    if (!_756)
    {
        _887 = _812;
    }
    float _891 = _887;
    float _893 = float(uint(_866));
    float _895 = trunc(_872);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _891 * _816;
    float _903 = as_type<float>(_885) * _893;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    int _909 = _800 * int(_883);
    int _911 = _909 + _820;
    float _913 = trunc(_903);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = ~_744;
    int _921 = _919 + 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = float(uint(_911));
    int _929 = _921 * int(_899);
    int _931 = _929 + _846;
    float _933 = floor(_806);
    float _935 = as_type<float>(_836) * _927;
    int _937 = as_type<int>(_935);
    if (_907)
    {
        float _939 = -_718;
        float _941 = _939 + 1.0;
        _556 = as_type<int>(_941);
    }
    int _943 = _556;
    float _945 = float(uint(_931));
    int _947 = _832 * int(_917);
    int _949 = _947 + _866;
    float _951 = floor(_901);
    float _953 = as_type<float>(_858) * _945;
    float _955 = as_type<float>(_949);
    if (_925)
    {
        bool _957 = _706 > 0.5;
        _772 = _957;
    }
    bool _959 = _772;
    float _961 = float(uint(_949));
    float _963 = _961;
    if (!_925)
    {
        _955 = _718;
    }
    float _965 = _955;
    float _967 = -_933;
    float _969 = _806 + _967;
    float _971 = as_type<float>(_885) * _961;
    float _973 = trunc(_935);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = float(_112);
    float _981 = _965;
    if (!_907)
    {
        _963 = _718;
    }
    float _983 = _963;
    float _985 = _983;
    if (_907)
    {
        float _987 = _850 ? as_type<float>(_943) : _718;
        _985 = _987;
    }
    float _989 = _985;
    float _991 = float(_760);
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    if (_925)
    {
        float _999 = -_718;
        float _1001 = _999 + 1.0;
        _937 = as_type<int>(_1001);
    }
    int _1003 = _937;
    if (_925)
    {
        float _1005 = _959 ? as_type<float>(_1003) : _718;
        _981 = _1005;
    }
    float _1007 = _981;
    float _1009 = trunc(_953);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_883) + int(_977);
    int _1017 = ~_744;
    int _1019 = _1017 + 1;
    float _1021 = floor(_838);
    float _1023 = -_951;
    float _1025 = _901 + _1023;
    float _1027 = float(_820);
    int _1029 = int(_917) + int(_997);
    float _1031 = _969 * _991;
    bool _1033 = _1027 >= _991;
    bool _1035 = isnan(_1027);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_991);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _991 * _146;
    float _1047 = 1.0 / _979;
    int _1049 = int(_899) + int(_1013);
    int _1051 = ~_760;
    int _1053 = _1051 + 1;
    float _1055 = float(_846);
    float _1057 = -_1021;
    float _1059 = _838 + _1057;
    float _1061 = float(_744);
    int _1063 = _1053 * _1015;
    int _1065 = _1063 + _820;
    float _1067 = float(_786);
    bool _1069 = _1055 >= _1061;
    bool _1071 = isnan(_1055);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_1061);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1061 * _1059;
    bool _1083 = uint(_1065) >= uint(_760);
    float _1085 = _1045 * _1047;
    float _1087 = _1047 * _146;
    float _1089 = float(_866);
    float _1091 = _1067 * _1087;
    int _1093 = _1019 * _1049;
    int _1095 = _1093 + _846;
    bool _1097 = _1089 >= _1067;
    bool _1099 = isnan(_1089);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan(_1067);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    int _1109 = _842 * _1029;
    int _1111 = _1109 + _866;
    float _1113 = _1067 * _1025;
    bool _1115 = !_1083;
    int _1117 = _1115 ? 0 : (-1);
    float _1119 = trunc(_1043);
    int _1121 = int(_1119);
    bool _1123 = uint(_1095) >= uint(_744);
    float _1125 = _1061 * _1087;
    bool _1127 = uint(_1111) >= uint(_786);
    bool _1129 = !_1123;
    int _1131 = _1129 ? 0 : (-1);
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1143 = _1141 != 0;
    float _1145 = trunc(_1031);
    int _1147 = int(_1145);
    int _1149 = ~_1049;
    int _1151 = _1149 + _1131;
    int _1153 = _1151 + 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1135;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _744 * _1153;
    int _1165 = _1163 + _846;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = trunc(_1079);
    int _1173 = int(_1171);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1177 = _1175 != 0;
    bool _1179 = !_1127;
    int _1181 = _1179 ? 0 : (-1);
    bool _1183 = !_1157;
    int _1185 = _1183 ? 0 : 1;
    int _1187 = ~_1015;
    int _1189 = _1187 + _1117;
    int _1191 = _1189 + 1;
    float _1193 = trunc(_1085);
    int _1195 = int(_1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1203 = _1201 != 0;
    int _1205 = ~_1029;
    int _1207 = _1205 + _1181;
    int _1209 = _1207 + 1;
    int _1211 = _760 * _1191;
    int _1213 = _1211 + _820;
    bool _1215 = !_1169;
    int _1217 = _1215 ? 0 : 1;
    bool _1219 = !_1143;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_1107);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = _786 * _1209;
    int _1237 = _1235 + _866;
    bool _1239 = !_1177;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = _760 == 0;
    int _1245 = abs(_1241);
    float _1247 = trunc(_1113);
    int _1249 = int(_1247);
    int _1251 = ~_1121;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    bool _1257 = !_1243;
    int _1259 = _1257 ? _1213 : (-1);
    bool _1261 = !_1139;
    int _1263 = _1261 ? 0 : 1;
    bool _1265 = !_1203;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1259 * _1255;
    int _1271 = _760 + (-1);
    float _1273 = trunc(_1091);
    int _1275 = int(_1273);
    int _1277 = abs(_1263);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1285 = _1283 != 0;
    int _1287 = _1121 * _1271;
    int _1289 = _1287 + _1269;
    bool _1291 = _744 == 0;
    float _1293 = trunc(_1125);
    int _1295 = int(_1293);
    int _1297 = abs(_1185);
    int _1299 = abs(_1161);
    int _1301 = _1289 * _1277;
    int _1303 = ~_1173;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1147 * _1297;
    int _1311 = _1309 + _820;
    int _1313 = abs(_1221);
    float _1315 = trunc(_1081);
    int _1317 = int(_1315);
    int _1319 = _1195 * _1299;
    int _1321 = _1319 + _1301;
    int _1323 = abs(_1217);
    bool _1325 = !_1199;
    int _1327 = _1325 ? 0 : 1;
    int _1329 = _1311 * _1313;
    int _1331 = _1329 + _1321;
    int _1333 = abs(_1267);
    int _1335 = abs(_1327);
    int _1337 = _1147 * _1323;
    int _1339 = _1337 + _1331;
    bool _1341 = !_1291;
    int _1343 = _1341 ? _1165 : (-1);
    float _1345 = in.m_61.y;
    bool _1347 = _786 == 0;
    float _1349 = float(uint(_1339));
    int _1351 = _1307 * _1343;
    int _1353 = _744 + (-1);
    int _1355 = _1317 * _1245;
    int _1357 = _1355 + _846;
    float _1359 = as_type<float>(_836) * _1349;
    bool _1361 = !_1229;
    int _1363 = _1361 ? 0 : 1;
    int _1365 = _1173 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = trunc(_1359);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = ~_1225;
    int _1377 = _1375 + 1;
    int _1379 = _1377 + 1;
    float _1381 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1383 = !_1347;
    int _1385 = _1383 ? _1237 : (-1);
    int _1387 = _1367 * _1333;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    float _1393 = _712 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1395 = !_1285;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1295 * _1335;
    int _1401 = _1399 + _1387;
    bool _1403 = !_1233;
    int _1405 = _1403 ? 0 : 1;
    int _1407 = _1379 * _1385;
    bool _1409 = !_1391;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1393, -2.0, _720);
    int _1415 = abs(_1363);
    bool _1417 = !_1281;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _786 + (-1);
    int _1423 = _1357 * _1415;
    int _1425 = _1423 + _1401;
    int _1427 = abs(_1397);
    float _1429 = _812 * 2.0;
    int _1431 = abs(_1405);
    int _1433 = _1225 * _1421;
    int _1435 = _1433 + _1407;
    int _1437 = abs(_1411);
    int _1439 = abs(_1419);
    float _1441 = floor(_1429);
    int _1443 = _1249 * _1437;
    int _1445 = _1443 + _866;
    float _1447 = -_1345;
    float _1449 = _1447 + 1.0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1453 = _1451 != 0;
    int _1455 = _1435 * _1427;
    int _1457 = ~_760;
    int _1459 = _1457 + 1;
    int _1461 = _1317 * _1431;
    int _1463 = _1461 + _1425;
    float _1465 = in.m_55.w;
    bool _1467 = !_1453;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = _1275 * _1439;
    int _1473 = _1471 + _1455;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1477 = _1475 != 0;
    int _1479 = abs(_1469);
    int _1481 = _1459 * int(_1373);
    int _1483 = _1481 + _1339;
    float _1485 = float(uint(_1463));
    bool _1487 = _712 > 0.5;
    float _1489 = float(uint(_1483));
    float _1491 = as_type<float>(_858) * _1485;
    bool _1493 = !_1477;
    int _1495 = _1493 ? 0 : 1;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_836) * _1489;
    int _1503 = _1487 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1505 = trunc(_1491);
    float _1507 = precise::max(_1505, 0.0);
    uint _1509 = uint(_1507);
    int _1511 = abs(_1495);
    float _1513 = _1499 ? as_type<float>(_1503) : _1345;
    bool _1515 = _1465 > 0.5;
    float _1517 = trunc(_1501);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    int _1523 = _1445 * _1479;
    int _1525 = _1523 + _1473;
    float _1527 = float(uint(_1311));
    int _1529 = ~_744;
    int _1531 = _1529 + 1;
    int _1533 = _1249 * _1511;
    int _1535 = _1533 + _1525;
    int _1537 = _1515 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1539 = as_type<float>(_836) * _1527;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1539);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = ~_760;
    int _1553 = _1551 + 1;
    float _1555 = _1543 ? as_type<float>(_1537) : _1345;
    int _1557 = _1531 * int(_1509);
    int _1559 = _1557 + _1463;
    float _1561 = float(uint(_1535));
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1565 = _1563 != 0;
    int _1567 = int(_1373) + int(_1521);
    float _1569 = as_type<float>(_885) * _1561;
    float _1571 = float(uint(_1559));
    int _1573 = ~_760;
    int _1575 = _1573 + 1;
    int _1577 = _1553 * _1567;
    int _1579 = _1577 + _1339;
    bool _1581 = _812 > 0.5;
    float _1583 = trunc(_1569);
    float _1585 = precise::max(_1583, 0.0);
    uint _1587 = uint(_1585);
    float _1589 = as_type<float>(_858) * _1571;
    float _1591 = float(uint(_1357));
    int _1593 = _1575 * int(_1549);
    int _1595 = _1593 + _1311;
    bool _1597 = uint(_1579) >= uint(_760);
    float _1599 = _1345;
    int _1601 = _1339;
    if (_1565)
    {
        float _1603 = _1581 ? _1449 : _1345;
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = as_type<float>(_858) * _1591;
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1611 = _1609 != 0;
    float _1613 = trunc(_1589);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    bool _1619 = !_1597;
    int _1621 = _1619 ? 0 : (-1);
    float _1623 = float(uint(_1595));
    int _1625 = ~_1567;
    int _1627 = _1625 + _1621;
    int _1629 = _1627 + 1;
    int _1631 = ~_786;
    int _1633 = _1631 + 1;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = as_type<float>(_836) * _1623;
    int _1643 = _760 * _1629;
    int _1645 = _1643 + _1339;
    int _1647 = ~_744;
    int _1649 = _1647 + 1;
    int _1651 = _1633 * int(_1587);
    int _1653 = _1651 + _1535;
    if (_1611)
    {
        float _1655 = -_718;
        float _1657 = _1655 + 1.0;
        _1601 = as_type<int>(_1657);
    }
    int _1659 = _1601;
    int _1661 = ~_744;
    int _1663 = _1661 + 1;
    bool _1665 = !_1243;
    int _1667 = _1665 ? _1645 : (-1);
    float _1669 = trunc(_1641);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = float(uint(_1653));
    float _1677 = as_type<float>(_1663);
    if (_1611)
    {
        float _1679 = _1487 ? as_type<float>(_1659) : _718;
        _774 = _1679;
    }
    float _1681 = _774;
    int _1683 = int(_1509) + int(_1617);
    float _1685 = as_type<float>(_885) * _1675;
    int _1687 = _1667 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1649 * int(_1639);
    int _1693 = _1691 + _1357;
    float _1695 = float(uint(_1445));
    int _1697 = _1663 * _1683;
    int _1699 = _1697 + _1463;
    bool _1701 = uint(_1687) > 1u;
    float _1703 = trunc(_1685);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    int _1709 = _1667 & 3;
    bool _1711 = _1709 != 0;
    float _1713 = as_type<float>(_885) * _1695;
    float _1715 = float(uint(_1693));
    int _1717 = _1711 ? 0 : 1;
    bool _1719 = uint(_1699) >= uint(_744);
    float _1721 = trunc(_1713);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = int(_1549) + int(_1673);
    float _1729 = as_type<float>(_858) * _1715;
    int _1731 = ~_760;
    int _1733 = _1731 + 1;
    bool _1735 = !_1719;
    int _1737 = _1735 ? 0 : (-1);
    int _1739 = ~_1717;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1733 * _1727;
    int _1747 = _1745 + _1311;
    int _1749 = _1743;
    if (!_1701)
    {
        int _1751 = ~_1717;
        int _1753 = _1751 + 1;
        _1749 = _1753;
    }
    int _1755 = _1749;
    float _1757 = trunc(_1729);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_1683;
    int _1765 = _1763 + _1737;
    int _1767 = _1765 + 1;
    float _1769 = _706 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1771 = _1687 != 3;
    bool _1773 = uint(_1687) >= 2u;
    int _1775 = _744 * _1767;
    int _1777 = _1775 + _1463;
    int _1779 = int(_1587) + int(_1707);
    int _1781 = _1773 ? 0 : 1;
    bool _1783 = uint(_1747) >= uint(_760);
    int _1785 = ~_786;
    int _1787 = _1785 + 1;
    int _1789 = ~_786;
    int _1791 = _1789 + 1;
    bool _1793 = !_1291;
    int _1795 = _1793 ? _1777 : (-1);
    int _1797 = _1787 * int(_1725);
    int _1799 = _1797 + _1445;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1791 * _1779;
    int _1809 = _1807 + _1535;
    int _1811 = _1805;
    float _1813 = as_type<float>(_1707);
    float _1815 = as_type<float>(_1779);
    if (_1771)
    {
        int _1817 = ~_1781;
        int _1819 = _1817 + 1;
        _1811 = _1819;
    }
    int _1821 = _1811;
    int _1823 = _1795 & 3;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1799));
    bool _1829 = !_1783;
    int _1831 = _1829 ? 0 : (-1);
    float _1833 = _1825 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1835 = as_type<float>(_885) * _1827;
    bool _1837 = uint(_1823) >= 2u;
    bool _1839 = uint(_1809) >= uint(_786);
    int _1841 = _1837 ? 0 : 1;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _1823 != 3;
    int _1855 = ~_744;
    int _1857 = _1855 + 1;
    int _1859 = ~_1779;
    int _1861 = _1859 + _1851;
    int _1863 = _1861 + 1;
    int _1865 = int(_1639) + int(_1761);
    int _1867 = _786 * _1863;
    int _1869 = _1867 + _1535;
    bool _1871 = uint(_1823) > 1u;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1875 = _1873 != 0;
    int _1877 = _1857 * _1865;
    int _1879 = _1877 + _1357;
    int _1881 = ~_1841;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = _1885;
    float _1889 = as_type<float>(_1761);
    float _1891 = _1833;
    if (_1853)
    {
        int _1893 = ~_1841;
        int _1895 = _1893 + 1;
        _1887 = _1895;
    }
    int _1897 = _1887;
    bool _1899 = uint(_1879) >= uint(_744);
    bool _1901 = !_1347;
    int _1903 = _1901 ? _1869 : (-1);
    bool _1905 = !_1899;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~as_type<int>(_1833);
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    int _1915 = _1903 & 3;
    bool _1917 = _1915 != 0;
    int _1919 = int(_1725) + int(_1847);
    float _1921 = _706 * 2.0;
    int _1923 = _1913;
    if (!_1871)
    {
        int _1925 = ~as_type<int>(_1833);
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    int _1931 = _1795 & 3;
    bool _1933 = _1931 != 0;
    if (_1875)
    {
        _889 = 0;
    }
    int _1935 = _889;
    float _1937 = floor(_1921);
    bool _1939 = uint(_1915) >= 2u;
    int _1941 = _1935;
    if (!_1875)
    {
        _1941 = 1;
    }
    int _1943 = _1941;
    if (_1875)
    {
        _776 = 0;
    }
    int _1945 = _776;
    bool _1947 = !_1933;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1945;
    if (!_1875)
    {
        _1951 = 2;
    }
    int _1953 = _1951;
    bool _1955 = _1915 != 3;
    bool _1957 = !_1689;
    int _1959 = _1957 ? 0 : 1;
    int _1961 = _1939 ? 0 : 1;
    bool _1963 = _1943 != 1;
    bool _1965 = uint(_1915) > 1u;
    int _1967 = _1917 ? 0 : 1;
    bool _1969 = _1953 != 2;
    float _1971 = _712 * 2.0;
    int _1973 = ~_786;
    int _1975 = _1973 + 1;
    int _1977 = ~_1961;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    int _1983 = _1981;
    if (_1955)
    {
        int _1985 = ~_1961;
        int _1987 = _1985 + 1;
        _1983 = _1987;
    }
    int _1989 = _1983;
    int _1991 = _1975 * _1919;
    int _1993 = _1991 + _1445;
    float _1995 = floor(_1971);
    int _1997 = ~_1967;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    float _2005 = as_type<float>(_1993);
    if (!_1965)
    {
        int _2007 = ~_1967;
        int _2009 = _2007 + 1;
        _2003 = _2009;
    }
    int _2011 = _2003;
    bool _2013 = uint(_1993) >= uint(_786);
    bool _2015 = _1937 > 0.0;
    bool _2017 = !_2013;
    int _2019 = _2017 ? 0 : (-1);
    bool _2021 = _1937 >= 0.0;
    bool _2023 = isnan(_1937);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    if (!_1963)
    {
        _1677 = _712;
    }
    float _2031 = _1677;
    int _2033 = _2029 ? 0 : 1;
    float _2035 = _2031;
    if (_1969)
    {
        _1813 = _706;
    }
    float _2037 = _1813;
    float _2039 = _2037;
    if (_1969)
    {
        _2005 = _712;
    }
    float _2041 = _2005;
    float _2043 = _2041;
    if (!_1963)
    {
        _1889 = _2031;
    }
    float _2045 = _1889;
    float _2047 = _2045;
    if (!_1963)
    {
        _1891 = _812;
    }
    float _2049 = _1891;
    float _2051 = _2049;
    if (!_1963)
    {
        _1815 = _812;
    }
    float _2053 = _1815;
    float _2055 = _2053;
    if (!_1969)
    {
        _2039 = _812;
    }
    float _2057 = _2039;
    float _2059 = _812 + (-0.5);
    if (!_1969)
    {
        _2043 = _706;
    }
    float _2061 = _2043;
    if (_1963)
    {
        _2047 = _706;
    }
    float _2063 = _2047;
    if (_1963)
    {
        _2035 = _706;
    }
    float _2065 = _2035;
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1963)
    {
        _2051 = _712;
    }
    float _2069 = _2051;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1963)
    {
        _2055 = _712;
    }
    float _2073 = _2055;
    bool _2075 = _1687 != 3;
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2079 = _1995 > 0.0;
    int _2081 = ~_2033;
    int _2083 = _2081 + 1;
    int _2085 = _2083 + 1;
    int _2087 = _2085;
    if (!_2015)
    {
        int _2089 = ~_2033;
        int _2091 = _2089 + 1;
        _2087 = _2091;
    }
    int _2093 = _2087;
    int _2095 = _1903 & 3;
    bool _2097 = _2095 != 0;
    bool _2099 = _1995 >= 0.0;
    bool _2101 = isnan(_1995);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan(0.0);
    bool _2107 = _2103 || _2105;
    bool _2109 = _1823 != 3;
    float _2111 = in.m_63.x;
    float _2113 = in.m_63.y;
    float _2115 = in.m_63.z;
    bool _2117 = !_2075;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _1915 != 3;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _2107 ? 0 : 1;
    bool _2129 = !_2109;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = ~_2127;
    int _2147 = _2145 + 1;
    int _2149 = _2147 + 1;
    bool _2151 = !_2121;
    int _2153 = _2151 ? 0 : (-1);
    int _2155 = _2149;
    float _2157 = as_type<float>(_2093);
    if (!_2079)
    {
        int _2159 = ~_2127;
        int _2161 = _2159 + 1;
        _2155 = _2161;
    }
    int _2163 = _2155;
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2171 = _2169 != 0;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2179 = _2177 != 0;
    float _2181 = in.m_48.x;
    float _2183 = in.m_48.y;
    float _2185 = in.m_48.z;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2111);
    float _2193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2113);
    float _2195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2115);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2199 = 1.0 / _2189;
    float _2201 = _2191 * _708;
    bool _2203 = !_2135;
    int _2205 = _2203 ? 0 : 1;
    float _2207 = _2193 * _1381;
    float _2209 = _2195 * _710;
    bool _2211 = _1441 >= 0.0;
    bool _2213 = isnan(_1441);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = -_2197;
    float _2223 = fma(_1769, 2.0, _2221);
    float _2225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2227 = log2(_2225);
    int _2229 = _2219 ? 0 : 1;
    float _2231 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2233 = _1441 > 0.0;
    float _2235 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2237 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2239 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2241;
    float _2245 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2235);
    float _2247 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2239);
    float _2251 = _2243 * _2199;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2255 = _700 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2259 = ~_2229;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2267 = fma(_2251, _2255, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2269 = -_2257;
    float _2271 = fma(_2231, 2.0, _2269);
    float _2273 = _2227 * _146;
    float _2275 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2265);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2279 = -_146;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2223);
    float _2283 = exp2(_2273);
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2287 = _2263;
    float _2289 = _2245;
    float _2291 = _2247;
    if (!_2233)
    {
        int _2293 = ~_2229;
        int _2295 = _2293 + 1;
        _2287 = _2295;
    }
    int _2297 = _2287;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2301 = 1.0 + _2299;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2315 = _2311 || _2313;
    float _2317 = -_2277;
    float _2319 = fma(_2071, 2.0, _2317);
    float _2321 = 1.0 / _2301;
    float _2323 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2303);
    float _2325 = fma(_2077, -2.0, _2285);
    float _2327 = fma(_2067, -2.0, _2305);
    float _2329 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2275);
    float _2331 = -_2283;
    float _2333 = _2331 + 1.0;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2339 = _2315 ? _2333 : 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2345 = isnan(1.0);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2351 = _2347 || _2349;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2355 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2335);
    float _2357 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2337);
    float _2359 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2341);
    float _2361 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2353);
    float _2363 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1413);
    float _2365 = -_146;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2271);
    float _2369 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2323);
    float _2371 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2355);
    float _2373 = -_146;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2319);
    float _2377 = in.m_65.x;
    float _2379 = in.m_65.y;
    float _2381 = in.m_65.z;
    float _2383 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2357);
    float _2385 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2359);
    float _2387 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2361);
    float _2389 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    float _2391 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2327);
    if (_2351)
    {
        float _2393 = _2339 * _2321;
        _150 = _2393;
    }
    float _2395 = _150;
    bool _2397 = _2113 != 0.0;
    bool _2399 = isnan(_2113);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2245);
    float _2409 = _706 + _712;
    bool _2411 = _2111 == 0.0;
    bool _2413 = !_2405;
    bool _2415 = _2411 && _2413;
    float _2417 = _712 + (-0.5);
    bool _2419 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2421 = isnan(_700);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2427 = _2423 || _2425;
    float _2429 = float(_2427);
    float _2431 = -_732;
    float _2433 = _2431 + 1.0;
    bool _2435 = _2115 == 0.0;
    bool _2437 = _2435 && _2415;
    float _2439 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2441 = _2429 * _2433;
    float _2443 = -_2429;
    float _2445 = _2443 + 1.0;
    int _2447 = abs(_2167);
    float _2449 = _2409 + (-1.0);
    float _2451 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2453 = _2267 * _2441;
    float _2455 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2247);
    float _2457 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2249);
    float _2459 = in.m_67.x;
    float _2461 = in.m_67.y;
    float _2463 = in.m_67.z;
    float _2465 = _2429;
    float _2467 = _2453;
    float _2469 = _2449;
    if (_2437)
    {
        _2465 = _2379;
    }
    float _2471 = _2465;
    float _2473 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2453);
    float _2475 = _2471;
    if (_2437)
    {
        _2289 = _2377;
    }
    float _2477 = _2289;
    float _2479 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2481 = _2477;
    if (_2437)
    {
        _2291 = _2471;
    }
    float _2483 = _2291;
    float _2485 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2473);
    float _2487 = _2483;
    if (!_2437)
    {
        _2475 = _2379;
    }
    float _2489 = _2475;
    if (_2437)
    {
        _2467 = _2477;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    if (!_2437)
    {
        float _2495 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2489);
        _2487 = _2495;
    }
    float _2497 = _2487;
    if (!_2437)
    {
        _2481 = _2377;
    }
    float _2499 = _2481;
    int _2501 = abs(_2205);
    float _2503 = float(_2093);
    if (!_2437)
    {
        float _2505 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2493 = _2505;
    }
    float _2507 = _2493;
    float _2509 = float(_2447);
    float _2511 = float(_2297);
    float _2513 = float(_2501);
    float _2515 = _2509 * _2503;
    float _2517 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2437)
    {
        _2469 = _2381;
    }
    float _2519 = _2469;
    float _2521 = _2513 * _2511;
    float _2523 = _2407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2525 = -_2517;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2529 = _2519;
    if (_2437)
    {
        _2157 = _2519;
    }
    float _2531 = _2157;
    float _2533 = _706 + (-0.5);
    bool _2535 = !_2143;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2541 = _2531;
    if (!_2437)
    {
        _2529 = _2381;
    }
    float _2543 = _2529;
    float _2545 = -_2523;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2549 = _2521 * (-2.0);
    float _2551 = _2527 * _2527;
    int _2553 = abs(_2537);
    float _2555 = -_2539;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = fma(_2549, _2459, _2459);
    float _2561 = fma(_2547, _2547, _2551);
    float _2563 = fma(_2479, _2549, _2479);
    float _2565 = float(_2163);
    float _2567 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2559);
    float _2569 = fma(_2557, _2557, _2561);
    float _2571 = float(_2553);
    float _2573 = _2515 * (-2.0);
    float _2575 = fma(_2563, _2395, _2567);
    if (!_2437)
    {
        float _2577 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2543);
        _2541 = _2577;
    }
    float _2579 = _2541;
    int _2581 = abs(_1959);
    float _2583 = rsqrt(_2569);
    float _2585 = _2571 * _2565;
    float _2587 = fma(_2573, _2461, _2461);
    float _2589 = fma(_2439, _2573, _2439);
    float _2591 = _2575 * 0.15915493667125701904296875;
    float _2593 = _2585 * (-2.0);
    float _2595 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2587);
    bool _2597 = _760 == 0;
    float _2599 = _2591 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2463, _2463);
    float _2605 = fma(_2589, _2395, _2595);
    float _2607 = fma(_2451, _2593, _2451);
    float _2609 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2603);
    float _2611 = _2605 * 0.15915493667125701904296875;
    float _2613 = in.m_69.x;
    float _2615 = in.m_69.y;
    float _2617 = in.m_69.z;
    float _2619 = in.m_69.w;
    float _2621 = _2547 * _2583;
    float _2623 = _2527 * _2583;
    float _2625 = _2557 * _2583;
    float _2627 = fma(_2607, _2395, _2609);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = _2621 * _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2635 = _2623 * _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2625 * _2637;
    float _2641 = _2591 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2647 = -_2631;
    float _2649 = fma(_2625, _2645, _2647);
    float _2651 = _2627 * 0.15915493667125701904296875;
    float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2655 = -_2639;
    float _2657 = fma(_2623, _2653, _2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = -_2635;
    float _2663 = fma(_2621, _2659, _2661);
    float _2665 = _2649 * _2649;
    float _2667 = _2611 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = fma(_2657, _2657, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2675 = fma(_2663, _2663, _2671);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2679 = _2615 * _2543;
    float _2681 = _2611 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2687 = _2617 * _2499;
    float _2689 = -_2679;
    float _2691 = fma(_2617, _2489, _2689);
    float _2693 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2701 = _2651 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2613 * _2489;
    float _2707 = -_2687;
    float _2709 = fma(_2613, _2543, _2707);
    float _2711 = _2643 * _2669;
    out.m_71.x = _2693;
    out.m_71.y = _2695;
    out.m_71.z = _2697;
    out.m_71.w = _2699;
    float _2713 = -_2705;
    float _2715 = fma(_2615, _2499, _2713);
    float _2717 = _2691 * _2619;
    float _2719 = _2709 * _2619;
    float _2721 = rsqrt(_2675);
    float _2723 = _2643 * _2683;
    float _2725 = _2601 * _2683;
    float _2727 = _2601 * _2669;
    float _2729 = _2715 * _2619;
    float _2731 = _2651 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = _2683 * _2703;
    int _2737 = _1667 >> 31;
    float _2739 = _2643 * _2703;
    float _2741 = _2601 * _2703;
    int _2743 = _1795 >> 31;
    float _2745 = _2669 * _2703;
    float _2747 = _2739 * _2207;
    float _2749 = _2657 * _2721;
    float _2751 = _2649 * _2721;
    float _2753 = _2663 * _2721;
    int _2755 = _2737 & 3;
    float _2757 = _2741 * _2207;
    int _2759 = _1903 >> 31;
    int _2761 = _1667 + _2755;
    float _2763 = fma(_2733, _2723, _2727);
    float _2765 = fma(_2733, _2727, _2723);
    float _2767 = -_2207;
    float _2769 = _2733 * _2767;
    float _2771 = -_2711;
    float _2773 = fma(_2733, _2725, _2771);
    int _2775 = _2743 & 3;
    float _2777 = fma(_2763, _2201, _2747);
    float _2779 = fma(_2735, _2201, _2769);
    float _2781 = fma(_2773, _2201, _2757);
    int _2783 = _1795 + _2775;
    float _2785 = -_2725;
    float _2787 = fma(_2733, _2711, _2785);
    int _2789 = _2761 >> 2;
    float _2791 = _2625 * _2751;
    int _2793 = _2759 & 3;
    float _2795 = fma(_2787, _2209, _2777);
    int _2797 = _2783 >> 2;
    float _2799 = _2623 * _2749;
    int _2801 = _2789 << 4;
    int _2803 = _2801 + 368;
    float _2805 = -_2791;
    float _2807 = fma(_2623, _2753, _2805);
    int _2809 = _1903 + _2793;
    float _2811 = fma(_2745, _2209, _2779);
    int _2813 = _2797 << 4;
    int _2815 = _2813 + 512;
    float _2817 = fma(_2765, _2209, _2781);
    int _2819 = _2809 >> 2;
    uint _2821 = uint(int(uint(_2803) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    float _2837 = _2621 * _2753;
    float _2839 = -_2799;
    float _2841 = fma(_2621, _2751, _2839);
    int _2843 = _2819 << 4;
    int _2845 = _2843 + 656;
    float _2847 = _2787 * _2807;
    float _2849 = -_2837;
    float _2851 = fma(_2625, _2749, _2849);
    int _2853 = ~_1865;
    int _2855 = _2853 + _1907;
    int _2857 = _2855 + 1;
    float _2859 = _2763 * _2807;
    uint _2861 = uint(int(uint(_2815) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    float _2877 = _2763 * _2851;
    float _2879 = _2763 * _2841;
    int _2881 = ~_1727;
    int _2883 = _2881 + _1831;
    int _2885 = _2883 + 1;
    float _2887 = _2787 * _2841;
    int _2889 = ~_1919;
    int _2891 = _2889 + _2019;
    int _2893 = _2891 + 1;
    float _2895 = fma(_2735, _2749, _2859);
    float _2897 = fma(_2735, _2751, _2877);
    uint _2899 = uint(int(uint(_2845) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    float _2915 = fma(_2735, _2753, _2879);
    float _2917 = _2739 * _2807;
    float _2919 = _2739 * _2851;
    float _2921 = _2787 * _2851;
    int _2923 = _760 * _2885;
    int _2925 = _2923 + _1311;
    float _2927 = -_2733;
    float _2929 = fma(_2927, _2749, _2917);
    float _2931 = -_2733;
    float _2933 = fma(_2931, _2751, _2919);
    float _2935 = fma(_2745, _2751, _2921);
    int _2937 = _744 * _2857;
    int _2939 = _2937 + _1357;
    int _2941 = abs(_1755);
    float _2943 = _2807 * _2795;
    float _2945 = _2851 * _2795;
    int _2947 = _2815 + 8;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    uint _2951 = uint(int(uint(int(_2949)) >> uint(2)));
    int _2953 = int(_2949) & 3;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[int(_2951)][_2953];
    int _2957 = int(_2949) + 1;
    uint _2959 = uint(int(uint(_2957) >> uint(2)));
    int _2961 = _2957 & 3;
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[int(_2959)][_2961];
    float _2965 = _2739 * _2841;
    float _2967 = _2841 * _2795;
    int _2969 = abs(_1929);
    int _2971 = _786 * _2893;
    int _2973 = _2971 + _1445;
    int _2975 = abs(_2011);
    float _2977 = -_2733;
    float _2979 = fma(_2977, _2753, _2965);
    int _2981 = ~_2941;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2803 + 8;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    uint _2991 = uint(int(uint(int(_2989)) >> uint(2)));
    int _2993 = int(_2989) & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    int _2997 = int(_2989) + 1;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    int _3001 = _2997 & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = ~_2969;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = fma(_2745, _2749, _2847);
    float _3013 = fma(_2749, _2811, _2943);
    int _3015 = ~_2975;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    float _3021 = fma(_2745, _2753, _2887);
    int _3023 = abs(_1821);
    float _3025 = fma(_2751, _2811, _2945);
    int _3027 = _2845 + 8;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    uint _3031 = uint(int(uint(int(_3029)) >> uint(2)));
    int _3033 = int(_3029) & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = int(_3029) + 1;
    uint _3039 = uint(int(uint(_3037) >> uint(2)));
    int _3041 = _3037 & 3;
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[int(_3039)][_3041];
    float _3045 = fma(_2753, _2811, _2967);
    int _3047 = ~_3023;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _2985 * as_type<int>(_2835);
    int _3055 = abs(_2125);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3059 = int(_3057);
    bool _3061 = !_2597;
    int _3063 = _3061 ? _2925 : (-1);
    float _3065 = fma(_2741, _2621, _2929);
    bool _3067 = !_1291;
    int _3069 = _3067 ? _2939 : (-1);
    float _3071 = fma(_2741, _2623, _2933);
    bool _3073 = !_1347;
    int _3075 = _3073 ? _2973 : (-1);
    int _3077 = _3009 * as_type<int>(_2875);
    int _3079 = abs(_1949);
    float _3081 = fma(_2741, _2625, _2979);
    float _3083 = fma(_2773, _2621, _2895);
    float _3085 = fma(_2621, _2817, _3013);
    int _3087 = _3019 * as_type<int>(_2913);
    int _3089 = ~_3055;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2581;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2765, _2621, _3011);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3093 * as_type<int>(_2905);
    int _3115 = _3113 + _3087;
    int _3117 = abs(_1897);
    int _3119 = _3103 * as_type<int>(_2827);
    int _3121 = _3119 + _3053;
    int _3123 = abs(_1989);
    int _3125 = _3111 * as_type<int>(_2867);
    int _3127 = _3125 + _3077;
    int _3129 = abs(_2131);
    float _3131 = fma(_2765, _2625, _3021);
    int _3133 = ~_3117;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2765, _2623, _2935);
    int _3141 = ~_3123;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_2623, _2817, _3025);
    int _3149 = abs(_2119);
    int _3151 = _3137 * as_type<int>(_2955);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3129;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3051 * as_type<int>(_2995);
    int _3163 = _3161 + _3121;
    int _3165 = ~_3149;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3173 = int(_3171);
    float _3175 = float(uint(_3059));
    float _3177 = _3071 * _2615;
    float _3179 = float(uint(_3097));
    int _3181 = _3169 * as_type<int>(_3003);
    int _3183 = _3181 + _3163;
    int _3185 = abs(_2153);
    int _3187 = _3145 * as_type<int>(_3035);
    int _3189 = _3187 + _3115;
    int _3191 = abs(_3059);
    int _3193 = _3159 * as_type<int>(_2963);
    int _3195 = _3193 + _3153;
    bool _3197 = !_2171;
    int _3199 = _3197 ? 0 : 1;
    float _3201 = 1.0 / _3175;
    bool _3203 = !_2175;
    int _3205 = _3203 ? 0 : 1;
    float _3207 = fma(_2773, _2625, _2915);
    int _3209 = abs(_3199);
    int _3211 = abs(_3205);
    int _3213 = ~_3209;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = 1.0 / _3179;
    float _3221 = float(uint(_3173));
    int _3223 = ~_3185;
    int _3225 = _3223 + 1;
    int _3227 = _3225 + 1;
    int _3229 = _3183 * _3217;
    bool _3231 = !_2179;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = ~_3211;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    float _3241 = 1.0 / _3221;
    int _3243 = abs(_3233);
    int _3245 = _3227 * as_type<int>(_3043);
    int _3247 = _3245 + _3189;
    float _3249 = float(uint(_3191));
    int _3251 = _3063 * _3209;
    int _3253 = _3251 + _3229;
    int _3255 = ~_3243;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    int _3261 = _3239 * _3195;
    int _3263 = abs(_3097);
    float _3265 = fma(_2625, _2817, _3045);
    int _3267 = as_type<int>(_3201) + (-2);
    int _3269 = _3259 * _3247;
    float _3271 = float(uint(_3253));
    int _3273 = _3069 * _3211;
    int _3275 = _3273 + _3261;
    float _3277 = 1.0 / _3249;
    int _3279 = _3075 * _3243;
    int _3281 = _3279 + _3269;
    float _3283 = float(uint(_3263));
    float _3285 = fma(_2773, _2623, _2897);
    float _3287 = as_type<float>(_3267) * _3271;
    int _3289 = as_type<int>(_3219) + (-2);
    float _3291 = _2523 + _3085;
    float _3293 = float(uint(_3275));
    float _3295 = 1.0 / _3283;
    int _3297 = as_type<int>(_3241) + (-2);
    float _3299 = _2539 + _3265;
    float _3301 = float(uint(_3281));
    float _3303 = as_type<float>(_3289) * _3293;
    int _3305 = abs(_3173);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3291 + _3307;
    int _3311 = abs(_3253);
    float _3313 = trunc(_3287);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = as_type<float>(_3297) * _3301;
    float _3321 = float(uint(_3305));
    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3325 = _3299 + _3323;
    int _3327 = as_type<int>(_3277) + (-2);
    float _3329 = _3309 * _3309;
    float _3331 = float(uint(_3311));
    float _3333 = _3325 * _3325;
    float _3335 = trunc(_3303);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_3275);
    float _3343 = _3065 * _2497;
    int _3345 = ~_3059;
    int _3347 = _3345 + 1;
    float _3349 = as_type<float>(_3327) * _3331;
    int _3351 = as_type<int>(_3295) + (-2);
    float _3353 = _3329 + _3333;
    float _3355 = float(uint(_3341));
    float _3357 = trunc(_3319);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    int _3363 = ~_3097;
    int _3365 = _3363 + 1;
    int _3367 = _3347 * int(_3317);
    int _3369 = _3367 + _3253;
    int _3371 = ~_3173;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_3351) * _3355;
    int _3377 = abs(_3281);
    int _3379 = ~_3191;
    int _3381 = _3379 + 1;
    float _3383 = 1.0 / _3321;
    int _3385 = _3365 * int(_3339);
    int _3387 = _3385 + _3275;
    float _3389 = float(uint(_3369));
    float _3391 = float(uint(_3377));
    int _3393 = ~_3305;
    int _3395 = _3393 + 1;
    float _3397 = as_type<float>(_3267) * _3389;
    float _3399 = trunc(_3349);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    int _3405 = _3373 * int(_3361);
    int _3407 = _3405 + _3281;
    float _3409 = float(uint(_3387));
    float _3411 = _3071 * _2497;
    float _3413 = _2719 * _3071;
    float _3415 = float(uint(_3407));
    float _3417 = as_type<float>(_3289) * _3409;
    int _3419 = as_type<int>(_3383) + (-2);
    float _3421 = sqrt(_3353);
    float _3423 = _3081 * _2497;
    float _3425 = as_type<float>(_3297) * _3415;
    float _3427 = _3065 * _2615;
    float _3429 = _3081 * _2615;
    float _3431 = as_type<float>(_3419) * _3391;
    float _3433 = _2719 * _3065;
    float _3435 = trunc(_3375);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _3381 * int(_3403);
    int _3443 = _3441 + _3311;
    float _3445 = _2719 * _3081;
    float _3447 = fma(_3207, _2613, _3429);
    float _3449 = float(uint(_3443));
    float _3451 = fma(_3083, _2613, _3427);
    float _3453 = trunc(_3431);
    float _3455 = precise::max(_3453, 0.0);
    uint _3457 = uint(_3455);
    int _3459 = ~_3263;
    int _3461 = _3459 + 1;
    float _3463 = fma(_3285, _2613, _3177);
    float _3465 = as_type<float>(_3327) * _3449;
    bool _3467 = _3421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3469 = _3461 * int(_3439);
    int _3471 = _3469 + _3341;
    float _3473 = trunc(_3397);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = float(uint(_3471));
    int _3481 = _3395 * int(_3457);
    int _3483 = _3481 + _3377;
    float _3485 = trunc(_3417);
    float _3487 = precise::max(_3485, 0.0);
    uint _3489 = uint(_3487);
    float _3491 = as_type<float>(_3351) * _3479;
    float _3493 = fma(_3083, _2507, _3343);
    float _3495 = fma(_2717, _3285, _3413);
    float _3497 = float(uint(_3483));
    float _3499 = fma(_3285, _2507, _3411);
    float _3501 = _2517 + _3147;
    float _3503 = fma(_2717, _3083, _3433);
    float _3505 = trunc(_3425);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3419) * _3497;
    float _3513 = _3497;
    float _3515 = _3329;
    float _3517 = _3333;
    float _3519 = _3299;
    float _3521 = _3291;
    float _3523 = _2729;
    if (!_3467)
    {
        _3513 = _3329;
    }
    float _3525 = _3513;
    float _3527 = fma(_3207, _2507, _3423);
    float _3529 = _3525;
    if (!_3467)
    {
        _3515 = _3501;
    }
    float _3531 = _3515;
    float _3533 = trunc(_3465);
    float _3535 = precise::max(_3533, 0.0);
    uint _3537 = uint(_3535);
    float _3539 = trunc(_3491);
    float _3541 = precise::max(_3539, 0.0);
    uint _3543 = uint(_3541);
    bool _3545 = !_3467;
    float _3547 = _3531;
    if (!_3545)
    {
        float _3549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3553 = _3421 + _3551;
        float _3555 = rsqrt(_3353);
        float _3557 = _3553 * _3549;
        float _3559 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3561 = _3557 * 0.15915493667125701904296875;
        float _3563 = _3561 * 6.283185482025146484375;
        float _3565 = sin(_3563);
        float _3567 = _3561 * 6.283185482025146484375;
        float _3569 = cos(_3567);
        float _3571 = fma(_3565, _3559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3573 = _3555 * _3571;
        float _3575 = _3569 + (-1.0);
        float _3577 = fma(_3309, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3579 = fma(_3325, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3581 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3585 = _3577 + _3583;
        float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3589 = _3579 + _3587;
        float _3591 = fma(_3501, _3569, _3581);
        float _3593 = _3585 * _3585;
        float _3595 = _3589 * _3589;
        _3547 = _3591;
        _3529 = _3593;
        _3517 = _3595;
        _3519 = _3579;
        _3521 = _3577;
    }
    float _3597 = _3547;
    float _3599 = _3529;
    float _3601 = _3517;
    float _3603 = _3519;
    float _3605 = _3521;
    float _3607 = trunc(_3511);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    int _3613 = ~_3059;
    int _3615 = _3613 + 1;
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3619 = _3597 + _3617;
    int _3621 = int(_3317) + int(_3477);
    float _3623 = fma(_2717, _3207, _3445);
    int _3625 = int(_3339) + int(_3489);
    float _3627 = fma(_3619, _3619, _3599);
    int _3629 = int(_3439) + int(_3543);
    int _3631 = _3615 * _3621;
    int _3633 = _3631 + _3253;
    int _3635 = int(_3361) + int(_3509);
    float _3637 = _3627 + _3601;
    int _3639 = ~_3173;
    int _3641 = _3639 + 1;
    float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3645 = uint(_3633) >= uint(_3059);
    float _3647 = fma(_3105, _2617, _3451);
    int _3649 = ~_3097;
    int _3651 = _3649 + 1;
    int _3653 = _3641 * _3635;
    int _3655 = _3653 + _3281;
    int _3657 = int(_3457) + int(_3611);
    float _3659 = fma(_3139, _2617, _3463);
    int _3661 = ~_3263;
    int _3663 = _3661 + 1;
    int _3665 = _3651 * _3625;
    int _3667 = _3665 + _3275;
    int _3669 = int(_3403) + int(_3537);
    float _3671 = sqrt(_3637);
    int _3673 = ~_3191;
    int _3675 = _3673 + 1;
    int _3677 = _3663 * _3629;
    int _3679 = _3677 + _3341;
    int _3681 = ~_3305;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3131, _2617, _3447);
    bool _3687 = uint(_3667) >= uint(_3097);
    int _3689 = _3675 * _3669;
    int _3691 = _3689 + _3311;
    bool _3693 = !_3645;
    int _3695 = _3693 ? 0 : (-1);
    float _3697 = _3643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3699 = uint(_3679) >= uint(_3263);
    float _3701 = fma(_2729, _3105, _3503);
    bool _3703 = uint(_3655) >= uint(_3173);
    int _3705 = _3683 * _3657;
    int _3707 = _3705 + _3377;
    bool _3709 = !_3687;
    int _3711 = _3709 ? 0 : (-1);
    float _3713 = fma(_3697, _1007, -0.5);
    int _3715 = ~_3621;
    int _3717 = _3715 + _3695;
    int _3719 = _3717 + 1;
    float _3721 = fma(_2729, _3131, _3623);
    bool _3723 = !_3703;
    int _3725 = _3723 ? 0 : (-1);
    out.m_73.x = _3647;
    out.m_73.y = _3659;
    out.m_73.z = _3685;
    int _3727 = ~_3625;
    int _3729 = _3727 + _3711;
    int _3731 = _3729 + 1;
    bool _3733 = uint(_3691) >= uint(_3191);
    bool _3735 = uint(_3707) >= uint(_3305);
    int _3737 = _3097 * _3731;
    int _3739 = _3737 + _3275;
    bool _3741 = _3059 == 0;
    float _3743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3745 = _3059 == 0;
    int _3747 = _3253 ^ _3059;
    int _3749 = _3059 * _3719;
    int _3751 = _3749 + _3253;
    int _3753 = ~_3635;
    int _3755 = _3753 + _3725;
    int _3757 = _3755 + 1;
    bool _3759 = _3097 == 0;
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3763 = !_3733;
    int _3765 = _3763 ? 0 : (-1);
    bool _3767 = _3097 == 0;
    int _3769 = _3275 ^ _3097;
    bool _3771 = !_3699;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3777 = !_3741;
    int _3779 = _3777 ? _3751 : (-1);
    int _3781 = _3281 ^ _3173;
    int _3783 = _3173 * _3757;
    int _3785 = _3783 + _3281;
    bool _3787 = _3173 == 0;
    bool _3789 = _3173 == 0;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3793 = !_3759;
    int _3795 = _3793 ? _3739 : (-1);
    float _3797 = float(_3779);
    uint _3799 = uint(int(uint(_3747) >> uint(31)));
    uint _3801 = uint(int(uint(_3769) >> uint(31)));
    float _3803 = fma(_3697, _3797, _2281);
    bool _3805 = !_3735;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3811 = float(_3795);
    float _3813 = fma(_2383, _3713, _3803);
    uint _3815 = uint(int(uint(_3781) >> uint(31)));
    bool _3817 = !_3787;
    int _3819 = _3817 ? _3785 : (-1);
    float _3821 = _3791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3823 = ~_3765;
    int _3825 = _3669 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = _3813 + 0.5;
    int _3831 = ~_3773;
    int _3833 = _3629 + _3831;
    int _3835 = _3833 + 1;
    float _3837 = _3743 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3839 = ~int(_3799);
    int _3841 = _3839 + 1;
    float _3843 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3845 = ~int(_3801);
    int _3847 = _3845 + 1;
    float _3849 = fma(_3837, _989, -0.5);
    int _3851 = ~_3807;
    int _3853 = _3657 + _3851;
    int _3855 = _3853 + 1;
    float _3857 = fma(_3837, _3811, _2375);
    int _3859 = ~int(_3815);
    int _3861 = _3859 + 1;
    float _3863 = fma(_3843, _1681, -0.5);
    float _3865 = float(_3819);
    float _3867 = fma(_2329, _3849, _3857);
    int _3869 = _3827 ^ _3841;
    float _3871 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = _3835 ^ _3847;
    float _3875 = fma(_3843, _3865, _2367);
    int _3877 = _3855 ^ _3861;
    float _3879 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3881 = ~_3841;
    int _3883 = _3881 + _3869;
    int _3885 = _3883 + 1;
    float _3887 = fma(_1513, _3821, -0.5);
    int _3889 = ~_3847;
    int _3891 = _3889 + _3873;
    int _3893 = _3891 + 1;
    float _3895 = fma(_1555, _3879, -0.5);
    int _3897 = ~_3861;
    int _3899 = _3897 + _3877;
    int _3901 = _3899 + 1;
    float _3903 = fma(_2371, _3863, _3875);
    bool _3905 = !_3745;
    int _3907 = _3905 ? _3885 : (-1);
    bool _3909 = !_3767;
    int _3911 = _3909 ? _3893 : (-1);
    bool _3913 = !_3789;
    int _3915 = _3913 ? _3901 : (-1);
    float _3917 = float(_3907);
    float _3919 = float(_3911);
    float _3921 = float(_3915);
    float _3923 = -_2363;
    float _3925 = fma(_3821, _3917, _3923);
    float _3927 = fma(_3105, _2579, _3493);
    float _3929 = -_2389;
    float _3931 = fma(_3879, _3919, _3929);
    float _3933 = fma(_3871, _1605, -0.5);
    float _3935 = -_2391;
    float _3937 = fma(_3871, _3921, _3935);
    float _3939 = fma(_2385, _3887, _3925);
    float _3941 = fma(_2369, _3895, _3931);
    float _3943 = fma(_2729, _3139, _3495);
    float _3945 = fma(_2387, _3933, _3937);
    float _3947 = fma(_3139, _2579, _3499);
    float _3949 = _3903 + 0.5;
    float _3951 = _3867 + 0.5;
    float _3953 = _3939 + 0.5;
    float _3955 = _3941 + 0.5;
    float _3957 = _3945 + 0.5;
    float _3959 = fma(_3131, _2579, _3527);
    out.m_75.x = _3701;
    out.m_75.y = _3943;
    out.m_75.z = _3721;
    bool _3961 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3963 = isnan(_3671);
    bool _3965 = _3961 || _3963;
    bool _3967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3969 = _3965 || _3967;
    out.m_77.x = _3829;
    out.m_77.y = _3953;
    out.m_77.z = _3951;
    out.m_77.w = _3955;
    out.m_79.x = _3949;
    out.m_79.y = _3957;
    out.m_81.x = _3927;
    out.m_81.y = _3947;
    out.m_81.z = _3959;
    float _3971 = _3945;
    float _3973 = _3949;
    float _3975 = _3957;
    float _3977 = _3955;
    if (!_3969)
    {
        _3523 = 1.0;
    }
    float _3979 = _3523;
    bool _3981 = !_3969;
    float _3983 = _3979;
    if (!_3981)
    {
        bool _3985 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3987 = isnan(_3671);
        bool _3989 = _3985 || _3987;
        bool _3991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3993 = _3989 || _3991;
        if (!_3993)
        {
            float _3995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3997 = _3671 + _3995;
            float _3999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3999;
            float _4003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4007 = 1.0 / _4001;
            float _4009 = _3997 * _4007;
            float _4011 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3983 = _4011;
            _4013 = true;
        }
        else
        {
            bool _4015 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4017 = isnan(_3671);
            bool _4019 = _4015 || _4017;
            bool _4021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4023 = _4019 || _4021;
            if (!_4023)
            {
                float _4025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4027 = _3671 + _4025;
                float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4031 = _4029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4035 = _4033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4037 = 1.0 / _4031;
                float _4039 = _4027 * _4037;
                float _4041 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3983 = _4041;
                _4013 = true;
            }
            else
            {
                _3983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4013 = false;
    float _4043 = _3983;
    float _4045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4047 = _3597 + _4045;
    float _4049 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4051 = _3603 + _4049;
    bool _4053 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4055 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan(0.5);
    bool _4061 = _4057 || _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4065 = _3605 + _4063;
    float _4067 = fma(_4047, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4069 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4071 = fma(_4065, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4073 = _4067;
    float _4075 = _4069;
    if (_4061)
    {
        _3971 = _4071;
    }
    float _4077 = _3971;
    float _4079 = _4077;
    if (!_4061)
    {
        float _4081 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4083 = _2517 + _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4087 = _2523 + _4085;
        float _4089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4091 = -_2539;
        float _4093 = _4091 + _4069;
        float _4095 = _4083 * _4083;
        float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4099 = _2539 + _4097;
        float _4101 = fma(_4087, _4087, _4095);
        float _4103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4105 = fma(_4099, _4099, _4101);
        float _4107 = sqrt(_4105);
        float _4109 = _4089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4111 = precise::min(_4107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4113 = _4111 * _4103;
        float _4115 = -_2523;
        float _4117 = _4115 + _4071;
        float _4119 = _4109 * _4113;
        float _4121 = -_2517;
        float _4123 = _4121 + _4067;
        float _4125 = fma(_4117, _4119, _2523);
        float _4127 = fma(_4123, _4119, _2517);
        float _4129 = fma(_4093, _4119, _2539);
        _4073 = _4127;
        _4079 = _4125;
        _4075 = _4129;
        _3973 = _4119;
    }
    float _4131 = _4073;
    float _4133 = _4079;
    float _4135 = _4075;
    float _4137 = _3973;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _4131 + _4139;
    float _4143 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4145 = _4133 + _4143;
    float _4147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4149 = _4135 + _4147;
    float _4151 = _4141 * _4141;
    float _4153 = fma(_4145, _4145, _4151);
    float _4155 = fma(_4149, _4149, _4153);
    float _4157 = rsqrt(_4155);
    float _4159 = sqrt(_4155);
    float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4163 = _4145 * _4161;
    float _4165 = _4149 * _4161;
    float _4167 = _4163 * _4163;
    float _4169 = _4165 * _4165;
    float _4171 = _4167 + _4169;
    float _4173 = sqrt(_4171);
    bool _4175 = _4173 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4179 = _4173 + _4177;
    float _4181 = _4157;
    float _4183 = _4137;
    float _4185 = _4179;
    float _4187 = _4141;
    float _4189 = _4161;
    if (_4175)
    {
        float _4191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4191;
    }
    float _4193 = _4181;
    if (_4175)
    {
        float _4195 = rsqrt(_4171);
        _4183 = _4195;
    }
    float _4197 = _4183;
    float _4199 = _4197;
    if (_4175)
    {
        float _4201 = _4179 * _4193;
        _4185 = _4201;
    }
    float _4203 = _4185;
    if (_4175)
    {
        float _4205 = _4203 * 0.15915493667125701904296875;
        _3975 = _4205;
    }
    float _4207 = _3975;
    float _4209 = _4193;
    float _4211 = _4207;
    if (_4175)
    {
        float _4213 = _4207 * 6.283185482025146484375;
        float _4215 = sin(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4221 = precise::max(0.0, _4219);
    float _4223 = _4149;
    float _4225 = _4221;
    if (_4175)
    {
        float _4227 = _4207 * 6.283185482025146484375;
        float _4229 = cos(_4227);
        _4223 = _4229;
    }
    float _4231 = _4223;
    float _4233 = -_4161;
    float _4235 = -_4221;
    float _4237 = fma(_4141, _4233, _4235);
    if (_4175)
    {
        float _4239 = _4237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4225 = _4239;
    }
    float _4241 = _4225;
    float _4243 = _4241;
    if (!_4175)
    {
        _4211 = _4167;
    }
    float _4245 = _4211;
    float _4247 = _4217;
    float _4249 = _4245;
    if (_4175)
    {
        float _4251 = fma(_4217, _4241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4187 = _4251;
    }
    float _4253 = _4187;
    float _4255 = _4253;
    if (!_4175)
    {
        _4247 = _4163;
    }
    float _4257 = _4247;
    float _4259 = _4257;
    if (_4175)
    {
        float _4261 = _4231 + (-1.0);
        _4243 = _4261;
    }
    float _4263 = _4243;
    float _4265 = _4263;
    if (_4175)
    {
        float _4267 = _4197 * _4253;
        _3977 = _4267;
    }
    float _4269 = _3977;
    if (!_4175)
    {
        _4199 = _4237;
    }
    float _4271 = _4199;
    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4275 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4273);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    float _4279 = _4271;
    if (_4175)
    {
        float _4281 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4281;
    }
    float _4283 = _4189;
    if (_4175)
    {
        float _4285 = _4163 * _4269;
        _4259 = _4285;
    }
    float _4287 = _4259;
    if (!_4175)
    {
        _4255 = _4165;
    }
    float _4289 = _4255;
    float _4291 = _4289;
    if (_4175)
    {
        float _4293 = _4165 * _4269;
        _4291 = _4293;
    }
    float _4295 = _4291;
    if (_4175)
    {
        float _4297 = fma(_4237, _4231, _4283);
        _4279 = _4297;
    }
    float _4299 = _4279;
    if (_4175)
    {
        float _4301 = _4287 * _4287;
        _4249 = _4301;
    }
    float _4303 = _4249;
    if (!_4175)
    {
        _4265 = _4169;
    }
    float _4305 = _4265;
    float _4307 = _4305;
    if (_4175)
    {
        float _4309 = _4295 * _4295;
        _4307 = _4309;
    }
    float _4311 = _4307;
    float _4313 = fma(_4299, _4299, _4303);
    float _4315 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4317 = -_4277;
    float _4319 = _4317 + 1.0;
    float _4321 = _4313 + _4311;
    float _4323 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4325 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4327 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4329 = rsqrt(_4321);
    float _4331 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4315);
    float _4333 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4325);
    float _4335 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4327);
    float _4337 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4339 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4331);
    float _4341 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4333);
    float _4343 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4345 = floor(_4323);
    float _4347 = _4339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4349 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4351 = _4341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4353 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4343);
    float _4355 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4357 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4359 = _4329 * _4287;
    float _4361 = abs(_4319);
    float _4363 = log2(_4361);
    float _4365 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4353);
    float _4367 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4357);
    float _4369 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4371 = _4329 * _4295;
    float _4373 = _4365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4375 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4367);
    float _4377 = floor(_4337);
    float _4379 = _4329 * _4299;
    float _4381 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4375);
    float _4383 = -_4345;
    float _4385 = _4323 + _4383;
    float _4387 = -_4369;
    float _4389 = fma(_4379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4387);
    float _4391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4393 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4395 = -_4371;
    float _4397 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4389);
    float _4399 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4401 = 1.0 / _4381;
    float _4403 = fma(_4397, -0.5, 0.5);
    float _4405 = fma(_4397, 0.5, 0.5);
    float _4407 = -_4399;
    float _4409 = fma(_4407, _4391, 1.0);
    float _4411 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4413 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4415 = fma(_4405, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4417 = exp2(_4393);
    float _4419 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4411);
    float _4421 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4413);
    float _4423 = sqrt(_4403);
    float _4425 = fma(_4405, _4415, -0.212114393711090087890625);
    float _4427 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4419);
    float _4429 = _4379 + 1.0;
    float _4431 = log2(_4409);
    float _4433 = -_4377;
    float _4435 = _4337 + _4433;
    float _4437 = fma(_4405, _4425, 1.570728778839111328125);
    float _4439 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4421);
    float _4441 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4427);
    float _4443 = -_4379;
    float _4445 = fma(_4417, _4429, _4443);
    float _4447 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4439);
    float _4449 = _4423 * 0.636619746685028076171875;
    float _4451 = _4441 * _4401;
    float _4453 = _4447 * _4401;
    float2 _11396 = float2(_4385, _4435);
    float _4455 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11396, float2(0.0), isnan(_11396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11396, float2(0.0), isnan(_11396)), level(0.0)).x;
    float _4457 = -_4437;
    float _4459 = fma(_4449, _4457, 1.0);
    float _4461 = fma(_4451, 0.5, 0.5);
    float _4463 = fma(_4445, 0.5, 0.5);
    float _4465 = _4431 * 0.693147182464599609375;
    float _4467 = fma(_4453, -0.5, 0.5);
    float _4469 = _4465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _11425 = float3(_4461, _4467, _4469);
    float _4471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11425, float3(0.0), isnan(_11425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11425, float3(0.0), isnan(_11425)), level(0.0)).x;
    float3 _11436 = float3(_4461, _4467, _4469);
    float4 _4474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).xyzw;
    float _4476 = _4474.x;
    float _4478 = _4474.y;
    float _4480 = _4474.z;
    float _4482 = _4474.w;
    float2 _11452 = float2(_4459, _4463);
    float3 _4486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11452, float2(0.0), isnan(_11452)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11452, float2(0.0), isnan(_11452)), level(0.0)).xyz;
    float _4488 = _4486.x;
    float _4490 = _4486.y;
    float _4492 = _4486.z;
    float _4494 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4496 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4498 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4500 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4494);
    float _4502 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4496);
    float _4504 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4506 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4500);
    float _4508 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4502);
    float _4510 = exp2(_4498);
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4514 = _4508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4504);
    float _4518 = _4514 + _4512;
    float _4520 = 1.0 / _4512;
    float _4522 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4516);
    bool _4524 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4526 = isnan(_4159);
    bool _4528 = _4524 || _4526;
    bool _4530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4532 = _4528 || _4530;
    float _4534 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4522);
    float _4536 = -_4510;
    float _4538 = _4536 + 1.0;
    out.gl_Position.x = _4441;
    out.gl_Position.y = _4447;
    out.gl_Position.z = _4534;
    out.gl_Position.w = _4381;
    float _4540 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4542 = _4518 * _4520;
    float _4544 = _4542 * 0.5;
    float _4546 = in.m_83.x;
    float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4550 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4548);
    float _4552 = 1.0 / _4550;
    float _4554 = -_4540;
    float _4556 = _4554 + 1.0;
    float _4558 = _4447;
    float _4560 = _4534;
    float _4562 = _4556;
    if (!_4532)
    {
        _4558 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4564 = _4558;
    float _4566 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4568 = _4552 * _4566;
    float _4570 = abs(_4568);
    float _4572 = log2(_4570);
    bool _4574 = _4568 <= 8000.0;
    bool _4576 = isnan(_4568);
    bool _4578 = _4574 || _4576;
    bool _4580 = isnan(8000.0);
    bool _4582 = _4578 || _4580;
    float _4584 = float(_4582);
    float _4586 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4588 = exp2(_4586);
    float _4590 = fma(_4588, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4592, -2.0, 3.0);
    float _4596 = _4592 * _4592;
    float _4598 = _4596 * _4594;
    float _4600 = -_4598;
    float _4602 = _4600 + 1.0;
    float _4604 = fma(_4602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4598);
    float _4606 = _4534 + _4381;
    float _4608 = _4564;
    float _4610 = _4564;
    if (!_4532)
    {
        _4560 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4612 = _4560;
    float _4614 = _4584 * _4604;
    float _4616 = _4606 * 0.5;
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.z = _4616;
    out.m_85.w = _4381;
    float _4620 = -_4455;
    float _4622 = _4620 + 1.0;
    float _4624 = _4622 * _4618;
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = -_4626;
    float _4630 = fma(_4628, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4632 = _4540 * _4471;
    float _4634 = _4630 * _4546;
    float _4636 = _4482 * _4556;
    float _4638 = _4612;
    float _4640 = _4612;
    if (!_4532)
    {
        _4562 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4642 = _4562;
    float _4644 = _4482 * _4632;
    float _4646 = _4492 * _4632;
    float _4648 = _4634 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4650 = fma(_4488, _4644, _4476);
    float _4652 = fma(_4490, _4644, _4478);
    float _4654 = fma(_4482, _4646, _4480);
    out.m_87.x = _4648;
    out.m_89.x = _4650;
    out.m_89.y = _4652;
    out.m_89.z = _4654;
    out.m_89.w = _4636;
    bool _4656 = !_4532;
    float _4658 = _4642;
    float _4660 = _4642;
    if (!_4656)
    {
        bool _4662 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4664 = isnan(_4159);
        bool _4666 = _4662 || _4664;
        bool _4668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4670 = _4666 || _4668;
        if (!_4670)
        {
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4674 = _4159 + _4672;
            float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4678 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4676;
            float _4680 = 1.0 / _4678;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4690 = _4674 * _4680;
            float _4692 = precise::clamp(_4690, 0.0, 1.0);
            float _4694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4696 = _4694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4698 = fma(_4692, _4688, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4700 = fma(_4692, _4696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4702 = fma(_4692, _4684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4610 = _4702;
            _4640 = _4700;
            _4660 = _4698;
            _4704 = true;
        }
        else
        {
            bool _4706 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4708 = isnan(_4159);
            bool _4710 = _4706 || _4708;
            bool _4712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4714 = _4710 || _4712;
            if (!_4714)
            {
                _4638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4716 = _4638;
            _4640 = _4716;
            if (!_4714)
            {
                _4608 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4718 = _4608;
            _4610 = _4718;
            if (!_4714)
            {
                _4658 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4720 = _4658;
            bool _4722 = !_4714;
            _4660 = _4720;
            if (!_4722)
            {
                bool _4724 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4726 = isnan(_4159);
                bool _4728 = _4724 || _4726;
                bool _4730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4732 = _4728 || _4730;
                if (!_4732)
                {
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4736 = _4159 + _4734;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4738;
                    float _4742 = 1.0 / _4740;
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4752 = _4736 * _4742;
                    float _4754 = precise::clamp(_4752, 0.0, 1.0);
                    float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4760 = fma(_4754, _4750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4762 = fma(_4754, _4758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4764 = fma(_4754, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4610 = _4764;
                    _4640 = _4762;
                    _4660 = _4760;
                    _4704 = true;
                }
                else
                {
                    _4610 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4660 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4704 = false;
    float _4766 = _4610;
    float _4768 = _4640;
    float _4770 = _4660;
    float _4772 = _4766 * 0.586610972881317138671875;
    bool _4774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4776 = fma(_4768, 0.298911988735198974609375, _4772);
    out.m_91.x = 0.0;
    float _4778 = fma(_4770, 0.114477999508380889892578125, _4776);
    float _4780 = -_4778;
    float _4782 = _4780 + _4768;
    float _4784 = -_4778;
    float _4786 = _4784 + _4766;
    float _4788 = -_4778;
    float _4790 = _4788 + _4770;
    float _4792 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4794 = fma(_4782, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4796 = fma(_4786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4798 = fma(_4790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    out.m_87.w = _4792;
    out.m_93.x = _4794;
    out.m_93.y = _4796;
    out.m_93.z = _4798;
    if (!_4774)
    {
        return out;
    }
    float _4800 = -_4131;
    float _4802 = _4800 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4804 = -_4133;
    float _4806 = _4804 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4808 = -_4135;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4812 = _4802 * _4802;
    float _4814 = fma(_4806, _4806, _4812);
    float _4816 = fma(_4810, _4810, _4814);
    float _4818 = sqrt(_4816);
    float _4820 = rsqrt(_4816);
    float _4822 = -_4818;
    float _4824 = _4822 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4826 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4828 = precise::clamp(_4826, 0.0, 1.0);
    float _4830 = _4806 * _4820;
    float _4832 = _4802 * _4820;
    float _4834 = abs(_4828);
    float _4836 = log2(_4834);
    float _4838 = _4810 * _4820;
    float _4840 = _4830 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4842 = _3947 * _4832;
    float _4844 = -_4832;
    float _4846 = -_4840;
    float _4848 = fma(_4844, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4846);
    float _4850 = fma(_3927, _4830, _4842);
    float _4852 = -_4838;
    float _4854 = fma(_4852, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4848);
    float _4856 = fma(_3959, _4838, _4850);
    float _4858 = precise::clamp(_4856, 0.0, 1.0);
    float _4860 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4862 = _4854 + _4860;
    float _4864 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4866 = _4862 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4868 = precise::clamp(_4866, 0.0, 1.0);
    float _4870 = exp2(_4864);
    float _4872 = _4870 * _4868;
    float _4874 = _4858 * _4872;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4878 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4880 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4876;
    out.m_91.y = _4878;
    out.m_91.z = _4880;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4704 = false;
    bool _4013 = false;
    bool _692 = false;
    bool _576 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4937 = as_type<float>(_128);
        out.gl_Position.z = _4937;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5006 = as_type<float>(_166);
        out.gl_Position.z = _5006;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _206;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _198 + _240;
    float _244 = 1.0 / _210;
    float _246 = _242 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _198 + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _224;
    float _260 = _250 * _238;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = _198 + _266;
    float _270 = 1.0 / _214;
    float _272 = _254 * _244;
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _220;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _290 = _198 + _288;
    float _292 = _290 * _258;
    bool _294 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _296 = isnan(_198);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    float _310 = _264 * _270;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = fma(_308, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_322;
    float _332 = _330 + 1.0;
    float _334 = fma(_326, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = _268 * _286;
    float _338 = -_284;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = _236 * _332;
    bool _348 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_198);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = _304 * _340;
    float _362 = fma(_344, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = -_304;
    float _366 = _364 + 1.0;
    bool _368 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_198);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _384 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_198);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _322 * _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = -_236;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = fma(_400, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = _378 * _404;
    float _418 = fma(_382, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _358 * _412;
    float _422 = fma(_408, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = -_378;
    float _426 = _424 + 1.0;
    float _428 = -_358;
    float _430 = _428 + 1.0;
    float _432 = _334 * _420;
    float _434 = _362 * _420;
    float _436 = _328 * _420;
    float _438 = _394 * _426;
    float _440 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_446, _272, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _460 = fma(_450, _272, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _470 = fma(_414, _438, _440);
    float _472 = fma(_418, _438, _442);
    float _474 = fma(_422, _438, _452);
    float _476 = fma(_456, _272, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_468, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_458, _416, _470);
    float _488 = fma(_460, _416, _472);
    float _490 = fma(_480, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_476, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _502;
    float _506 = fma(_482, _346, _486);
    float _508 = fma(_484, _346, _488);
    float _510 = fma(_490, _346, _492);
    float _512 = fma(_496, _336, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_500, _336, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_504, _336, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _530 = fma(_512, _396, _506);
    float _532 = fma(_520, _292, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _534 = fma(_524, _292, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _536 = fma(_528, _292, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _538 = fma(_514, _396, _508);
    float _540 = fma(_516, _396, _510);
    float _542 = fma(_532, _360, _530);
    float _544 = fma(_534, _360, _538);
    float _546 = fma(_536, _360, _540);
    float _548 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].y, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[149].z, _546);
    bool _554 = !_256;
    int _556 = as_type<int>(_292);
    float _574;
    if (!_554)
    {
        float _558 = in.m_55.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_112);
        float _580 = 1.0 / _578;
        float _582 = _146 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = in.m_57.x;
    float _588 = in.m_57.y;
    float _590 = in.m_57.z;
    bool _592 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = isnan(_584);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_584);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _626 = _584 + _624;
    float _628 = -_602;
    float _630 = _628 + 1.0;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _634 = 1.0 / _606;
    float _636 = _618 * _630;
    float _638 = -_618;
    float _640 = _638 + 1.0;
    float _642 = _622 * _634;
    float _644 = fma(_642, _626, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _644 * _636;
    float _648 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[116].x, _648);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _552 * _590;
    float _668 = _550 * _588;
    float _670 = _548 * _586;
    out.m_59.x = _658;
    out.m_59.y = _660;
    out.m_59.z = _662;
    out.m_59.w = _664;
    bool _672 = !_632;
    float _690;
    if (!_672)
    {
        float _674 = in.m_55.x;
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _678 = _674 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _682 = _680 * _676;
        float _684 = floor(_682);
        float _686 = -_684;
        float _688 = _682 + _686;
        _690 = _688;
        _692 = true;
    }
    else
    {
        float _694 = float(_112);
        float _696 = 1.0 / _694;
        float _698 = _146 * _696;
        _690 = _698;
    }
    _692 = false;
    float _700 = _690;
    float _702 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _704 = int(_702);
    float _706 = in.m_55.x;
    float _708 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _710 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = in.m_55.y;
    float _714 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _716 = int(_714);
    float _718 = in.m_61.x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _736 = int(_734);
    float _738 = float(_704);
    float _740 = float(_716);
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _744 = int(_742);
    float _746 = float(_736);
    float _748 = 1.0 / _740;
    float _750 = 1.0 / _738;
    float _752 = float(uint(_744));
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _760 = int(_758);
    float _762 = _748 * _146;
    float _764 = 1.0 / _746;
    float _766 = _750 * _146;
    float _768 = _750;
    float _770 = _746;
    bool _772 = _756;
    float _774 = _718;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_756)
    {
        _768 = 1.0;
    }
    float _778 = _768;
    float _780 = _778;
    if (!_756)
    {
        _780 = 1.2345600128173828125;
    }
    float _782 = _780;
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = float(uint(_760));
    float _790 = _788;
    if (_756)
    {
        _770 = 1.0;
    }
    float _792 = _770;
    float _794 = _792;
    if (!_756)
    {
        _794 = 7.345489978790283203125;
    }
    float _796 = _794;
    int _798 = ~_760;
    int _800 = _798 + 1;
    float _802 = 1.0 / _788;
    float _804 = _764 * _146;
    float _806 = _796 * _706;
    float _808 = _764;
    if (_756)
    {
        _808 = 1.0;
    }
    float _810 = _808;
    float _812 = in.m_55.z;
    float _814 = _810;
    if (!_756)
    {
        _814 = 5.839270114898681640625;
    }
    float _816 = _814;
    float _818 = trunc(_762);
    int _820 = int(_818);
    float _822 = float(uint(_786));
    if (_756)
    {
        _790 = _706;
    }
    float _824 = _790;
    float _826 = _824;
    if (!_756)
    {
        _826 = _712;
    }
    float _828 = _826;
    int _830 = ~_786;
    int _832 = _830 + 1;
    float _834 = 1.0 / _752;
    int _836 = as_type<int>(_802) + (-2);
    float _838 = _828 * _782;
    int _840 = ~_786;
    int _842 = _840 + 1;
    float _844 = trunc(_766);
    int _846 = int(_844);
    float _848 = float(uint(_820));
    bool _850 = _812 > 0.5;
    float _852 = _706 + _812;
    float _854 = _712 + _812;
    float _856 = 1.0 / _822;
    int _858 = as_type<int>(_834) + (-2);
    float _860 = _852 + (-1.0);
    float _862 = _854 + (-1.0);
    float _864 = trunc(_804);
    int _866 = int(_864);
    float _868 = float(uint(_846));
    float _870 = as_type<float>(_836) * _848;
    float _872 = as_type<float>(_858) * _868;
    float _874 = _868;
    if (_756)
    {
        _874 = _706;
    }
    float _876 = _874;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    int _885 = as_type<int>(_856) + (-2);
    float _887 = _876;
    int _889 = _885;
    if (!_756)
    {
        _887 = _812;
    }
    float _891 = _887;
    float _893 = float(uint(_866));
    float _895 = trunc(_872);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _891 * _816;
    float _903 = as_type<float>(_885) * _893;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _907 = _905 != 0;
    int _909 = _800 * int(_883);
    int _911 = _909 + _820;
    float _913 = trunc(_903);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    int _919 = ~_744;
    int _921 = _919 + 1;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = float(uint(_911));
    int _929 = _921 * int(_899);
    int _931 = _929 + _846;
    float _933 = floor(_806);
    float _935 = as_type<float>(_836) * _927;
    int _937 = as_type<int>(_935);
    if (_907)
    {
        float _939 = -_718;
        float _941 = _939 + 1.0;
        _556 = as_type<int>(_941);
    }
    int _943 = _556;
    float _945 = float(uint(_931));
    int _947 = _832 * int(_917);
    int _949 = _947 + _866;
    float _951 = floor(_901);
    float _953 = as_type<float>(_858) * _945;
    float _955 = as_type<float>(_949);
    if (_925)
    {
        bool _957 = _706 > 0.5;
        _772 = _957;
    }
    bool _959 = _772;
    float _961 = float(uint(_949));
    float _963 = _961;
    if (!_925)
    {
        _955 = _718;
    }
    float _965 = _955;
    float _967 = -_933;
    float _969 = _806 + _967;
    float _971 = as_type<float>(_885) * _961;
    float _973 = trunc(_935);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = float(_112);
    float _981 = _965;
    if (!_907)
    {
        _963 = _718;
    }
    float _983 = _963;
    float _985 = _983;
    if (_907)
    {
        float _987 = _850 ? as_type<float>(_943) : _718;
        _985 = _987;
    }
    float _989 = _985;
    float _991 = float(_760);
    float _993 = trunc(_971);
    float _995 = precise::max(_993, 0.0);
    uint _997 = uint(_995);
    if (_925)
    {
        float _999 = -_718;
        float _1001 = _999 + 1.0;
        _937 = as_type<int>(_1001);
    }
    int _1003 = _937;
    if (_925)
    {
        float _1005 = _959 ? as_type<float>(_1003) : _718;
        _981 = _1005;
    }
    float _1007 = _981;
    float _1009 = trunc(_953);
    float _1011 = precise::max(_1009, 0.0);
    uint _1013 = uint(_1011);
    int _1015 = int(_883) + int(_977);
    int _1017 = ~_744;
    int _1019 = _1017 + 1;
    float _1021 = floor(_838);
    float _1023 = -_951;
    float _1025 = _901 + _1023;
    float _1027 = float(_820);
    int _1029 = int(_917) + int(_997);
    float _1031 = _969 * _991;
    bool _1033 = _1027 >= _991;
    bool _1035 = isnan(_1027);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_991);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = _991 * _146;
    float _1047 = 1.0 / _979;
    int _1049 = int(_899) + int(_1013);
    int _1051 = ~_760;
    int _1053 = _1051 + 1;
    float _1055 = float(_846);
    float _1057 = -_1021;
    float _1059 = _838 + _1057;
    float _1061 = float(_744);
    int _1063 = _1053 * _1015;
    int _1065 = _1063 + _820;
    float _1067 = float(_786);
    bool _1069 = _1055 >= _1061;
    bool _1071 = isnan(_1055);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_1061);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1061 * _1059;
    bool _1083 = uint(_1065) >= uint(_760);
    float _1085 = _1045 * _1047;
    float _1087 = _1047 * _146;
    float _1089 = float(_866);
    float _1091 = _1067 * _1087;
    int _1093 = _1019 * _1049;
    int _1095 = _1093 + _846;
    bool _1097 = _1089 >= _1067;
    bool _1099 = isnan(_1089);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan(_1067);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    int _1109 = _842 * _1029;
    int _1111 = _1109 + _866;
    float _1113 = _1067 * _1025;
    bool _1115 = !_1083;
    int _1117 = _1115 ? 0 : (-1);
    float _1119 = trunc(_1043);
    int _1121 = int(_1119);
    bool _1123 = uint(_1095) >= uint(_744);
    float _1125 = _1061 * _1087;
    bool _1127 = uint(_1111) >= uint(_786);
    bool _1129 = !_1123;
    int _1131 = _1129 ? 0 : (-1);
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1143 = _1141 != 0;
    float _1145 = trunc(_1031);
    int _1147 = int(_1145);
    int _1149 = ~_1049;
    int _1151 = _1149 + _1131;
    int _1153 = _1151 + 1;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1135;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _744 * _1153;
    int _1165 = _1163 + _846;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = trunc(_1079);
    int _1173 = int(_1171);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1177 = _1175 != 0;
    bool _1179 = !_1127;
    int _1181 = _1179 ? 0 : (-1);
    bool _1183 = !_1157;
    int _1185 = _1183 ? 0 : 1;
    int _1187 = ~_1015;
    int _1189 = _1187 + _1117;
    int _1191 = _1189 + 1;
    float _1193 = trunc(_1085);
    int _1195 = int(_1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1203 = _1201 != 0;
    int _1205 = ~_1029;
    int _1207 = _1205 + _1181;
    int _1209 = _1207 + 1;
    int _1211 = _760 * _1191;
    int _1213 = _1211 + _820;
    bool _1215 = !_1169;
    int _1217 = _1215 ? 0 : 1;
    bool _1219 = !_1143;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_1107);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    int _1235 = _786 * _1209;
    int _1237 = _1235 + _866;
    bool _1239 = !_1177;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = _760 == 0;
    int _1245 = abs(_1241);
    float _1247 = trunc(_1113);
    int _1249 = int(_1247);
    int _1251 = ~_1121;
    int _1253 = _1251 + 1;
    int _1255 = _1253 + 1;
    bool _1257 = !_1243;
    int _1259 = _1257 ? _1213 : (-1);
    bool _1261 = !_1139;
    int _1263 = _1261 ? 0 : 1;
    bool _1265 = !_1203;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1259 * _1255;
    int _1271 = _760 + (-1);
    float _1273 = trunc(_1091);
    int _1275 = int(_1273);
    int _1277 = abs(_1263);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1285 = _1283 != 0;
    int _1287 = _1121 * _1271;
    int _1289 = _1287 + _1269;
    bool _1291 = _744 == 0;
    float _1293 = trunc(_1125);
    int _1295 = int(_1293);
    int _1297 = abs(_1185);
    int _1299 = abs(_1161);
    int _1301 = _1289 * _1277;
    int _1303 = ~_1173;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = _1147 * _1297;
    int _1311 = _1309 + _820;
    int _1313 = abs(_1221);
    float _1315 = trunc(_1081);
    int _1317 = int(_1315);
    int _1319 = _1195 * _1299;
    int _1321 = _1319 + _1301;
    int _1323 = abs(_1217);
    bool _1325 = !_1199;
    int _1327 = _1325 ? 0 : 1;
    int _1329 = _1311 * _1313;
    int _1331 = _1329 + _1321;
    int _1333 = abs(_1267);
    int _1335 = abs(_1327);
    int _1337 = _1147 * _1323;
    int _1339 = _1337 + _1331;
    bool _1341 = !_1291;
    int _1343 = _1341 ? _1165 : (-1);
    float _1345 = in.m_61.y;
    bool _1347 = _786 == 0;
    float _1349 = float(uint(_1339));
    int _1351 = _1307 * _1343;
    int _1353 = _744 + (-1);
    int _1355 = _1317 * _1245;
    int _1357 = _1355 + _846;
    float _1359 = as_type<float>(_836) * _1349;
    bool _1361 = !_1229;
    int _1363 = _1361 ? 0 : 1;
    int _1365 = _1173 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = trunc(_1359);
    float _1371 = precise::max(_1369, 0.0);
    uint _1373 = uint(_1371);
    int _1375 = ~_1225;
    int _1377 = _1375 + 1;
    int _1379 = _1377 + 1;
    float _1381 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1383 = !_1347;
    int _1385 = _1383 ? _1237 : (-1);
    int _1387 = _1367 * _1333;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    float _1393 = _712 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1395 = !_1285;
    int _1397 = _1395 ? 0 : 1;
    int _1399 = _1295 * _1335;
    int _1401 = _1399 + _1387;
    bool _1403 = !_1233;
    int _1405 = _1403 ? 0 : 1;
    int _1407 = _1379 * _1385;
    bool _1409 = !_1391;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1393, -2.0, _720);
    int _1415 = abs(_1363);
    bool _1417 = !_1281;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _786 + (-1);
    int _1423 = _1357 * _1415;
    int _1425 = _1423 + _1401;
    int _1427 = abs(_1397);
    float _1429 = _812 * 2.0;
    int _1431 = abs(_1405);
    int _1433 = _1225 * _1421;
    int _1435 = _1433 + _1407;
    int _1437 = abs(_1411);
    int _1439 = abs(_1419);
    float _1441 = floor(_1429);
    int _1443 = _1249 * _1437;
    int _1445 = _1443 + _866;
    float _1447 = -_1345;
    float _1449 = _1447 + 1.0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1453 = _1451 != 0;
    int _1455 = _1435 * _1427;
    int _1457 = ~_760;
    int _1459 = _1457 + 1;
    int _1461 = _1317 * _1431;
    int _1463 = _1461 + _1425;
    float _1465 = in.m_55.w;
    bool _1467 = !_1453;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = _1275 * _1439;
    int _1473 = _1471 + _1455;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1477 = _1475 != 0;
    int _1479 = abs(_1469);
    int _1481 = _1459 * int(_1373);
    int _1483 = _1481 + _1339;
    float _1485 = float(uint(_1463));
    bool _1487 = _712 > 0.5;
    float _1489 = float(uint(_1483));
    float _1491 = as_type<float>(_858) * _1485;
    bool _1493 = !_1477;
    int _1495 = _1493 ? 0 : 1;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_836) * _1489;
    int _1503 = _1487 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1505 = trunc(_1491);
    float _1507 = precise::max(_1505, 0.0);
    uint _1509 = uint(_1507);
    int _1511 = abs(_1495);
    float _1513 = _1499 ? as_type<float>(_1503) : _1345;
    bool _1515 = _1465 > 0.5;
    float _1517 = trunc(_1501);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    int _1523 = _1445 * _1479;
    int _1525 = _1523 + _1473;
    float _1527 = float(uint(_1311));
    int _1529 = ~_744;
    int _1531 = _1529 + 1;
    int _1533 = _1249 * _1511;
    int _1535 = _1533 + _1525;
    int _1537 = _1515 ? as_type<int>(_1449) : as_type<int>(_1345);
    float _1539 = as_type<float>(_836) * _1527;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1539);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = ~_760;
    int _1553 = _1551 + 1;
    float _1555 = _1543 ? as_type<float>(_1537) : _1345;
    int _1557 = _1531 * int(_1509);
    int _1559 = _1557 + _1463;
    float _1561 = float(uint(_1535));
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1565 = _1563 != 0;
    int _1567 = int(_1373) + int(_1521);
    float _1569 = as_type<float>(_885) * _1561;
    float _1571 = float(uint(_1559));
    int _1573 = ~_760;
    int _1575 = _1573 + 1;
    int _1577 = _1553 * _1567;
    int _1579 = _1577 + _1339;
    bool _1581 = _812 > 0.5;
    float _1583 = trunc(_1569);
    float _1585 = precise::max(_1583, 0.0);
    uint _1587 = uint(_1585);
    float _1589 = as_type<float>(_858) * _1571;
    float _1591 = float(uint(_1357));
    int _1593 = _1575 * int(_1549);
    int _1595 = _1593 + _1311;
    bool _1597 = uint(_1579) >= uint(_760);
    float _1599 = _1345;
    int _1601 = _1339;
    if (_1565)
    {
        float _1603 = _1581 ? _1449 : _1345;
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = as_type<float>(_858) * _1591;
    int _1609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1611 = _1609 != 0;
    float _1613 = trunc(_1589);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    bool _1619 = !_1597;
    int _1621 = _1619 ? 0 : (-1);
    float _1623 = float(uint(_1595));
    int _1625 = ~_1567;
    int _1627 = _1625 + _1621;
    int _1629 = _1627 + 1;
    int _1631 = ~_786;
    int _1633 = _1631 + 1;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = as_type<float>(_836) * _1623;
    int _1643 = _760 * _1629;
    int _1645 = _1643 + _1339;
    int _1647 = ~_744;
    int _1649 = _1647 + 1;
    int _1651 = _1633 * int(_1587);
    int _1653 = _1651 + _1535;
    if (_1611)
    {
        float _1655 = -_718;
        float _1657 = _1655 + 1.0;
        _1601 = as_type<int>(_1657);
    }
    int _1659 = _1601;
    int _1661 = ~_744;
    int _1663 = _1661 + 1;
    bool _1665 = !_1243;
    int _1667 = _1665 ? _1645 : (-1);
    float _1669 = trunc(_1641);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    float _1675 = float(uint(_1653));
    float _1677 = as_type<float>(_1663);
    if (_1611)
    {
        float _1679 = _1487 ? as_type<float>(_1659) : _718;
        _774 = _1679;
    }
    float _1681 = _774;
    int _1683 = int(_1509) + int(_1617);
    float _1685 = as_type<float>(_885) * _1675;
    int _1687 = _1667 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1649 * int(_1639);
    int _1693 = _1691 + _1357;
    float _1695 = float(uint(_1445));
    int _1697 = _1663 * _1683;
    int _1699 = _1697 + _1463;
    bool _1701 = uint(_1687) > 1u;
    float _1703 = trunc(_1685);
    float _1705 = precise::max(_1703, 0.0);
    uint _1707 = uint(_1705);
    int _1709 = _1667 & 3;
    bool _1711 = _1709 != 0;
    float _1713 = as_type<float>(_885) * _1695;
    float _1715 = float(uint(_1693));
    int _1717 = _1711 ? 0 : 1;
    bool _1719 = uint(_1699) >= uint(_744);
    float _1721 = trunc(_1713);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = int(_1549) + int(_1673);
    float _1729 = as_type<float>(_858) * _1715;
    int _1731 = ~_760;
    int _1733 = _1731 + 1;
    bool _1735 = !_1719;
    int _1737 = _1735 ? 0 : (-1);
    int _1739 = ~_1717;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1733 * _1727;
    int _1747 = _1745 + _1311;
    int _1749 = _1743;
    if (!_1701)
    {
        int _1751 = ~_1717;
        int _1753 = _1751 + 1;
        _1749 = _1753;
    }
    int _1755 = _1749;
    float _1757 = trunc(_1729);
    float _1759 = precise::max(_1757, 0.0);
    uint _1761 = uint(_1759);
    int _1763 = ~_1683;
    int _1765 = _1763 + _1737;
    int _1767 = _1765 + 1;
    float _1769 = _706 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1771 = _1687 != 3;
    bool _1773 = uint(_1687) >= 2u;
    int _1775 = _744 * _1767;
    int _1777 = _1775 + _1463;
    int _1779 = int(_1587) + int(_1707);
    int _1781 = _1773 ? 0 : 1;
    bool _1783 = uint(_1747) >= uint(_760);
    int _1785 = ~_786;
    int _1787 = _1785 + 1;
    int _1789 = ~_786;
    int _1791 = _1789 + 1;
    bool _1793 = !_1291;
    int _1795 = _1793 ? _1777 : (-1);
    int _1797 = _1787 * int(_1725);
    int _1799 = _1797 + _1445;
    int _1801 = ~_1781;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1791 * _1779;
    int _1809 = _1807 + _1535;
    int _1811 = _1805;
    float _1813 = as_type<float>(_1707);
    float _1815 = as_type<float>(_1779);
    if (_1771)
    {
        int _1817 = ~_1781;
        int _1819 = _1817 + 1;
        _1811 = _1819;
    }
    int _1821 = _1811;
    int _1823 = _1795 & 3;
    bool _1825 = _1823 != 0;
    float _1827 = float(uint(_1799));
    bool _1829 = !_1783;
    int _1831 = _1829 ? 0 : (-1);
    float _1833 = _1825 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1835 = as_type<float>(_885) * _1827;
    bool _1837 = uint(_1823) >= 2u;
    bool _1839 = uint(_1809) >= uint(_786);
    int _1841 = _1837 ? 0 : 1;
    float _1843 = trunc(_1835);
    float _1845 = precise::max(_1843, 0.0);
    uint _1847 = uint(_1845);
    bool _1849 = !_1839;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _1823 != 3;
    int _1855 = ~_744;
    int _1857 = _1855 + 1;
    int _1859 = ~_1779;
    int _1861 = _1859 + _1851;
    int _1863 = _1861 + 1;
    int _1865 = int(_1639) + int(_1761);
    int _1867 = _786 * _1863;
    int _1869 = _1867 + _1535;
    bool _1871 = uint(_1823) > 1u;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1875 = _1873 != 0;
    int _1877 = _1857 * _1865;
    int _1879 = _1877 + _1357;
    int _1881 = ~_1841;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = _1885;
    float _1889 = as_type<float>(_1761);
    float _1891 = _1833;
    if (_1853)
    {
        int _1893 = ~_1841;
        int _1895 = _1893 + 1;
        _1887 = _1895;
    }
    int _1897 = _1887;
    bool _1899 = uint(_1879) >= uint(_744);
    bool _1901 = !_1347;
    int _1903 = _1901 ? _1869 : (-1);
    bool _1905 = !_1899;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = ~as_type<int>(_1833);
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    int _1915 = _1903 & 3;
    bool _1917 = _1915 != 0;
    int _1919 = int(_1725) + int(_1847);
    float _1921 = _706 * 2.0;
    int _1923 = _1913;
    if (!_1871)
    {
        int _1925 = ~as_type<int>(_1833);
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    int _1931 = _1795 & 3;
    bool _1933 = _1931 != 0;
    if (_1875)
    {
        _889 = 0;
    }
    int _1935 = _889;
    float _1937 = floor(_1921);
    bool _1939 = uint(_1915) >= 2u;
    int _1941 = _1935;
    if (!_1875)
    {
        _1941 = 1;
    }
    int _1943 = _1941;
    if (_1875)
    {
        _776 = 0;
    }
    int _1945 = _776;
    bool _1947 = !_1933;
    int _1949 = _1947 ? 0 : 1;
    int _1951 = _1945;
    if (!_1875)
    {
        _1951 = 2;
    }
    int _1953 = _1951;
    bool _1955 = _1915 != 3;
    bool _1957 = !_1689;
    int _1959 = _1957 ? 0 : 1;
    int _1961 = _1939 ? 0 : 1;
    bool _1963 = _1943 != 1;
    bool _1965 = uint(_1915) > 1u;
    int _1967 = _1917 ? 0 : 1;
    bool _1969 = _1953 != 2;
    float _1971 = _712 * 2.0;
    int _1973 = ~_786;
    int _1975 = _1973 + 1;
    int _1977 = ~_1961;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    int _1983 = _1981;
    if (_1955)
    {
        int _1985 = ~_1961;
        int _1987 = _1985 + 1;
        _1983 = _1987;
    }
    int _1989 = _1983;
    int _1991 = _1975 * _1919;
    int _1993 = _1991 + _1445;
    float _1995 = floor(_1971);
    int _1997 = ~_1967;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    float _2005 = as_type<float>(_1993);
    if (!_1965)
    {
        int _2007 = ~_1967;
        int _2009 = _2007 + 1;
        _2003 = _2009;
    }
    int _2011 = _2003;
    bool _2013 = uint(_1993) >= uint(_786);
    bool _2015 = _1937 > 0.0;
    bool _2017 = !_2013;
    int _2019 = _2017 ? 0 : (-1);
    bool _2021 = _1937 >= 0.0;
    bool _2023 = isnan(_1937);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan(0.0);
    bool _2029 = _2025 || _2027;
    if (!_1963)
    {
        _1677 = _712;
    }
    float _2031 = _1677;
    int _2033 = _2029 ? 0 : 1;
    float _2035 = _2031;
    if (_1969)
    {
        _1813 = _706;
    }
    float _2037 = _1813;
    float _2039 = _2037;
    if (_1969)
    {
        _2005 = _712;
    }
    float _2041 = _2005;
    float _2043 = _2041;
    if (!_1963)
    {
        _1889 = _2031;
    }
    float _2045 = _1889;
    float _2047 = _2045;
    if (!_1963)
    {
        _1891 = _812;
    }
    float _2049 = _1891;
    float _2051 = _2049;
    if (!_1963)
    {
        _1815 = _812;
    }
    float _2053 = _1815;
    float _2055 = _2053;
    if (!_1969)
    {
        _2039 = _812;
    }
    float _2057 = _2039;
    float _2059 = _812 + (-0.5);
    if (!_1969)
    {
        _2043 = _706;
    }
    float _2061 = _2043;
    if (_1963)
    {
        _2047 = _706;
    }
    float _2063 = _2047;
    if (_1963)
    {
        _2035 = _706;
    }
    float _2065 = _2035;
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1963)
    {
        _2051 = _712;
    }
    float _2069 = _2051;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1963)
    {
        _2055 = _712;
    }
    float _2073 = _2055;
    bool _2075 = _1687 != 3;
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2079 = _1995 > 0.0;
    int _2081 = ~_2033;
    int _2083 = _2081 + 1;
    int _2085 = _2083 + 1;
    int _2087 = _2085;
    if (!_2015)
    {
        int _2089 = ~_2033;
        int _2091 = _2089 + 1;
        _2087 = _2091;
    }
    int _2093 = _2087;
    int _2095 = _1903 & 3;
    bool _2097 = _2095 != 0;
    bool _2099 = _1995 >= 0.0;
    bool _2101 = isnan(_1995);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan(0.0);
    bool _2107 = _2103 || _2105;
    bool _2109 = _1823 != 3;
    float _2111 = in.m_63.x;
    float _2113 = in.m_63.y;
    float _2115 = in.m_63.z;
    bool _2117 = !_2075;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _1915 != 3;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _2107 ? 0 : 1;
    bool _2129 = !_2109;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = ~_2127;
    int _2147 = _2145 + 1;
    int _2149 = _2147 + 1;
    bool _2151 = !_2121;
    int _2153 = _2151 ? 0 : (-1);
    int _2155 = _2149;
    float _2157 = as_type<float>(_2093);
    if (!_2079)
    {
        int _2159 = ~_2127;
        int _2161 = _2159 + 1;
        _2155 = _2161;
    }
    int _2163 = _2155;
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2171 = _2169 != 0;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2179 = _2177 != 0;
    float _2181 = in.m_48.x;
    float _2183 = in.m_48.y;
    float _2185 = in.m_48.z;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2111);
    float _2193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2113);
    float _2195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2115);
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2199 = 1.0 / _2189;
    float _2201 = _2191 * _708;
    bool _2203 = !_2135;
    int _2205 = _2203 ? 0 : 1;
    float _2207 = _2193 * _1381;
    float _2209 = _2195 * _710;
    bool _2211 = _1441 >= 0.0;
    bool _2213 = isnan(_1441);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan(0.0);
    bool _2219 = _2215 || _2217;
    float _2221 = -_2197;
    float _2223 = fma(_1769, 2.0, _2221);
    float _2225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2227 = log2(_2225);
    int _2229 = _2219 ? 0 : 1;
    float _2231 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2233 = _1441 > 0.0;
    float _2235 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2237 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2239 = _2183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2241;
    float _2245 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2235);
    float _2247 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2239);
    float _2251 = _2243 * _2199;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2255 = _700 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2259 = ~_2229;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2267 = fma(_2251, _2255, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2269 = -_2257;
    float _2271 = fma(_2231, 2.0, _2269);
    float _2273 = _2227 * _146;
    float _2275 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2265);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2279 = -_146;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2223);
    float _2283 = exp2(_2273);
    float _2285 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2287 = _2263;
    float _2289 = _2245;
    float _2291 = _2247;
    if (!_2233)
    {
        int _2293 = ~_2229;
        int _2295 = _2293 + 1;
        _2287 = _2295;
    }
    int _2297 = _2287;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2301 = 1.0 + _2299;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2307 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2315 = _2311 || _2313;
    float _2317 = -_2277;
    float _2319 = fma(_2071, 2.0, _2317);
    float _2321 = 1.0 / _2301;
    float _2323 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2303);
    float _2325 = fma(_2077, -2.0, _2285);
    float _2327 = fma(_2067, -2.0, _2305);
    float _2329 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2275);
    float _2331 = -_2283;
    float _2333 = _2331 + 1.0;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2339 = _2315 ? _2333 : 0.0;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2345 = isnan(1.0);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2351 = _2347 || _2349;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2355 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2335);
    float _2357 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2337);
    float _2359 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2341);
    float _2361 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2353);
    float _2363 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1413);
    float _2365 = -_146;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2271);
    float _2369 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2323);
    float _2371 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2355);
    float _2373 = -_146;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2319);
    float _2377 = in.m_65.x;
    float _2379 = in.m_65.y;
    float _2381 = in.m_65.z;
    float _2383 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2357);
    float _2385 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2359);
    float _2387 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2361);
    float _2389 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2325);
    float _2391 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2327);
    if (_2351)
    {
        float _2393 = _2339 * _2321;
        _150 = _2393;
    }
    float _2395 = _150;
    bool _2397 = _2113 != 0.0;
    bool _2399 = isnan(_2113);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2245);
    float _2409 = _706 + _712;
    bool _2411 = _2111 == 0.0;
    bool _2413 = !_2405;
    bool _2415 = _2411 && _2413;
    float _2417 = _712 + (-0.5);
    bool _2419 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2421 = isnan(_700);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2427 = _2423 || _2425;
    float _2429 = float(_2427);
    float _2431 = -_732;
    float _2433 = _2431 + 1.0;
    bool _2435 = _2115 == 0.0;
    bool _2437 = _2435 && _2415;
    float _2439 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2441 = _2429 * _2433;
    float _2443 = -_2429;
    float _2445 = _2443 + 1.0;
    int _2447 = abs(_2167);
    float _2449 = _2409 + (-1.0);
    float _2451 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2453 = _2267 * _2441;
    float _2455 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2247);
    float _2457 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2249);
    float _2459 = in.m_67.x;
    float _2461 = in.m_67.y;
    float _2463 = in.m_67.z;
    float _2465 = _2429;
    float _2467 = _2453;
    float _2469 = _2449;
    if (_2437)
    {
        _2465 = _2379;
    }
    float _2471 = _2465;
    float _2473 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2453);
    float _2475 = _2471;
    if (_2437)
    {
        _2289 = _2377;
    }
    float _2477 = _2289;
    float _2479 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2481 = _2477;
    if (_2437)
    {
        _2291 = _2471;
    }
    float _2483 = _2291;
    float _2485 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2473);
    float _2487 = _2483;
    if (!_2437)
    {
        _2475 = _2379;
    }
    float _2489 = _2475;
    if (_2437)
    {
        _2467 = _2477;
    }
    float _2491 = _2467;
    float _2493 = _2491;
    if (!_2437)
    {
        float _2495 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2489);
        _2487 = _2495;
    }
    float _2497 = _2487;
    if (!_2437)
    {
        _2481 = _2377;
    }
    float _2499 = _2481;
    int _2501 = abs(_2205);
    float _2503 = float(_2093);
    if (!_2437)
    {
        float _2505 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2493 = _2505;
    }
    float _2507 = _2493;
    float _2509 = float(_2447);
    float _2511 = float(_2297);
    float _2513 = float(_2501);
    float _2515 = _2509 * _2503;
    float _2517 = _2455 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2437)
    {
        _2469 = _2381;
    }
    float _2519 = _2469;
    float _2521 = _2513 * _2511;
    float _2523 = _2407 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2525 = -_2517;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2529 = _2519;
    if (_2437)
    {
        _2157 = _2519;
    }
    float _2531 = _2157;
    float _2533 = _706 + (-0.5);
    bool _2535 = !_2143;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = _2457 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2541 = _2531;
    if (!_2437)
    {
        _2529 = _2381;
    }
    float _2543 = _2529;
    float _2545 = -_2523;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2549 = _2521 * (-2.0);
    float _2551 = _2527 * _2527;
    int _2553 = abs(_2537);
    float _2555 = -_2539;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2559 = fma(_2549, _2459, _2459);
    float _2561 = fma(_2547, _2547, _2551);
    float _2563 = fma(_2479, _2549, _2479);
    float _2565 = float(_2163);
    float _2567 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2559);
    float _2569 = fma(_2557, _2557, _2561);
    float _2571 = float(_2553);
    float _2573 = _2515 * (-2.0);
    float _2575 = fma(_2563, _2395, _2567);
    if (!_2437)
    {
        float _2577 = fma(_2115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2543);
        _2541 = _2577;
    }
    float _2579 = _2541;
    int _2581 = abs(_1959);
    float _2583 = rsqrt(_2569);
    float _2585 = _2571 * _2565;
    float _2587 = fma(_2573, _2461, _2461);
    float _2589 = fma(_2439, _2573, _2439);
    float _2591 = _2575 * 0.15915493667125701904296875;
    float _2593 = _2585 * (-2.0);
    float _2595 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2587);
    bool _2597 = _760 == 0;
    float _2599 = _2591 * 6.283185482025146484375;
    float _2601 = sin(_2599);
    float _2603 = fma(_2593, _2463, _2463);
    float _2605 = fma(_2589, _2395, _2595);
    float _2607 = fma(_2451, _2593, _2451);
    float _2609 = fma(_2059, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2603);
    float _2611 = _2605 * 0.15915493667125701904296875;
    float _2613 = in.m_69.x;
    float _2615 = in.m_69.y;
    float _2617 = in.m_69.z;
    float _2619 = in.m_69.w;
    float _2621 = _2547 * _2583;
    float _2623 = _2527 * _2583;
    float _2625 = _2557 * _2583;
    float _2627 = fma(_2607, _2395, _2609);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = _2621 * _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2635 = _2623 * _2633;
    float _2637 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2625 * _2637;
    float _2641 = _2591 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2647 = -_2631;
    float _2649 = fma(_2625, _2645, _2647);
    float _2651 = _2627 * 0.15915493667125701904296875;
    float _2653 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2655 = -_2639;
    float _2657 = fma(_2623, _2653, _2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = -_2635;
    float _2663 = fma(_2621, _2659, _2661);
    float _2665 = _2649 * _2649;
    float _2667 = _2611 * 6.283185482025146484375;
    float _2669 = sin(_2667);
    float _2671 = fma(_2657, _2657, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2675 = fma(_2663, _2663, _2671);
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2679 = _2615 * _2543;
    float _2681 = _2611 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2687 = _2617 * _2499;
    float _2689 = -_2679;
    float _2691 = fma(_2617, _2489, _2689);
    float _2693 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2701 = _2651 * 6.283185482025146484375;
    float _2703 = cos(_2701);
    float _2705 = _2613 * _2489;
    float _2707 = -_2687;
    float _2709 = fma(_2613, _2543, _2707);
    float _2711 = _2643 * _2669;
    out.m_71.x = _2693;
    out.m_71.y = _2695;
    out.m_71.z = _2697;
    out.m_71.w = _2699;
    float _2713 = -_2705;
    float _2715 = fma(_2615, _2499, _2713);
    float _2717 = _2691 * _2619;
    float _2719 = _2709 * _2619;
    float _2721 = rsqrt(_2675);
    float _2723 = _2643 * _2683;
    float _2725 = _2601 * _2683;
    float _2727 = _2601 * _2669;
    float _2729 = _2715 * _2619;
    float _2731 = _2651 * 6.283185482025146484375;
    float _2733 = sin(_2731);
    float _2735 = _2683 * _2703;
    int _2737 = _1667 >> 31;
    float _2739 = _2643 * _2703;
    float _2741 = _2601 * _2703;
    int _2743 = _1795 >> 31;
    float _2745 = _2669 * _2703;
    float _2747 = _2739 * _2207;
    float _2749 = _2657 * _2721;
    float _2751 = _2649 * _2721;
    float _2753 = _2663 * _2721;
    int _2755 = _2737 & 3;
    float _2757 = _2741 * _2207;
    int _2759 = _1903 >> 31;
    int _2761 = _1667 + _2755;
    float _2763 = fma(_2733, _2723, _2727);
    float _2765 = fma(_2733, _2727, _2723);
    float _2767 = -_2207;
    float _2769 = _2733 * _2767;
    float _2771 = -_2711;
    float _2773 = fma(_2733, _2725, _2771);
    int _2775 = _2743 & 3;
    float _2777 = fma(_2763, _2201, _2747);
    float _2779 = fma(_2735, _2201, _2769);
    float _2781 = fma(_2773, _2201, _2757);
    int _2783 = _1795 + _2775;
    float _2785 = -_2725;
    float _2787 = fma(_2733, _2711, _2785);
    int _2789 = _2761 >> 2;
    float _2791 = _2625 * _2751;
    int _2793 = _2759 & 3;
    float _2795 = fma(_2787, _2209, _2777);
    int _2797 = _2783 >> 2;
    float _2799 = _2623 * _2749;
    int _2801 = _2789 << 4;
    int _2803 = _2801 + 368;
    float _2805 = -_2791;
    float _2807 = fma(_2623, _2753, _2805);
    int _2809 = _1903 + _2793;
    float _2811 = fma(_2745, _2209, _2779);
    int _2813 = _2797 << 4;
    int _2815 = _2813 + 512;
    float _2817 = fma(_2765, _2209, _2781);
    int _2819 = _2809 >> 2;
    uint _2821 = uint(int(uint(_2803) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    float _2837 = _2621 * _2753;
    float _2839 = -_2799;
    float _2841 = fma(_2621, _2751, _2839);
    int _2843 = _2819 << 4;
    int _2845 = _2843 + 656;
    float _2847 = _2787 * _2807;
    float _2849 = -_2837;
    float _2851 = fma(_2625, _2749, _2849);
    int _2853 = ~_1865;
    int _2855 = _2853 + _1907;
    int _2857 = _2855 + 1;
    float _2859 = _2763 * _2807;
    uint _2861 = uint(int(uint(_2815) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    float _2877 = _2763 * _2851;
    float _2879 = _2763 * _2841;
    int _2881 = ~_1727;
    int _2883 = _2881 + _1831;
    int _2885 = _2883 + 1;
    float _2887 = _2787 * _2841;
    int _2889 = ~_1919;
    int _2891 = _2889 + _2019;
    int _2893 = _2891 + 1;
    float _2895 = fma(_2735, _2749, _2859);
    float _2897 = fma(_2735, _2751, _2877);
    uint _2899 = uint(int(uint(_2845) >> uint(2)));
    uint _2901 = uint(int(uint(int(_2899)) >> uint(2)));
    int _2903 = int(_2899) & 3;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[int(_2901)][_2903];
    int _2907 = int(_2899) + 1;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    int _2911 = _2907 & 3;
    float _2913 = (*spvDescriptorSet0.vp_c9)._m0[int(_2909)][_2911];
    float _2915 = fma(_2735, _2753, _2879);
    float _2917 = _2739 * _2807;
    float _2919 = _2739 * _2851;
    float _2921 = _2787 * _2851;
    int _2923 = _760 * _2885;
    int _2925 = _2923 + _1311;
    float _2927 = -_2733;
    float _2929 = fma(_2927, _2749, _2917);
    float _2931 = -_2733;
    float _2933 = fma(_2931, _2751, _2919);
    float _2935 = fma(_2745, _2751, _2921);
    int _2937 = _744 * _2857;
    int _2939 = _2937 + _1357;
    int _2941 = abs(_1755);
    float _2943 = _2807 * _2795;
    float _2945 = _2851 * _2795;
    int _2947 = _2815 + 8;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    uint _2951 = uint(int(uint(int(_2949)) >> uint(2)));
    int _2953 = int(_2949) & 3;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[int(_2951)][_2953];
    int _2957 = int(_2949) + 1;
    uint _2959 = uint(int(uint(_2957) >> uint(2)));
    int _2961 = _2957 & 3;
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[int(_2959)][_2961];
    float _2965 = _2739 * _2841;
    float _2967 = _2841 * _2795;
    int _2969 = abs(_1929);
    int _2971 = _786 * _2893;
    int _2973 = _2971 + _1445;
    int _2975 = abs(_2011);
    float _2977 = -_2733;
    float _2979 = fma(_2977, _2753, _2965);
    int _2981 = ~_2941;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2803 + 8;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    uint _2991 = uint(int(uint(int(_2989)) >> uint(2)));
    int _2993 = int(_2989) & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    int _2997 = int(_2989) + 1;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    int _3001 = _2997 & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = ~_2969;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = fma(_2745, _2749, _2847);
    float _3013 = fma(_2749, _2811, _2943);
    int _3015 = ~_2975;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    float _3021 = fma(_2745, _2753, _2887);
    int _3023 = abs(_1821);
    float _3025 = fma(_2751, _2811, _2945);
    int _3027 = _2845 + 8;
    uint _3029 = uint(int(uint(_3027) >> uint(2)));
    uint _3031 = uint(int(uint(int(_3029)) >> uint(2)));
    int _3033 = int(_3029) & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = int(_3029) + 1;
    uint _3039 = uint(int(uint(_3037) >> uint(2)));
    int _3041 = _3037 & 3;
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[int(_3039)][_3041];
    float _3045 = fma(_2753, _2811, _2967);
    int _3047 = ~_3023;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = _2985 * as_type<int>(_2835);
    int _3055 = abs(_2125);
    float _3057 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3059 = int(_3057);
    bool _3061 = !_2597;
    int _3063 = _3061 ? _2925 : (-1);
    float _3065 = fma(_2741, _2621, _2929);
    bool _3067 = !_1291;
    int _3069 = _3067 ? _2939 : (-1);
    float _3071 = fma(_2741, _2623, _2933);
    bool _3073 = !_1347;
    int _3075 = _3073 ? _2973 : (-1);
    int _3077 = _3009 * as_type<int>(_2875);
    int _3079 = abs(_1949);
    float _3081 = fma(_2741, _2625, _2979);
    float _3083 = fma(_2773, _2621, _2895);
    float _3085 = fma(_2621, _2817, _3013);
    int _3087 = _3019 * as_type<int>(_2913);
    int _3089 = ~_3055;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3097 = int(_3095);
    int _3099 = ~_2581;
    int _3101 = _3099 + 1;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2765, _2621, _3011);
    int _3107 = ~_3079;
    int _3109 = _3107 + 1;
    int _3111 = _3109 + 1;
    int _3113 = _3093 * as_type<int>(_2905);
    int _3115 = _3113 + _3087;
    int _3117 = abs(_1897);
    int _3119 = _3103 * as_type<int>(_2827);
    int _3121 = _3119 + _3053;
    int _3123 = abs(_1989);
    int _3125 = _3111 * as_type<int>(_2867);
    int _3127 = _3125 + _3077;
    int _3129 = abs(_2131);
    float _3131 = fma(_2765, _2625, _3021);
    int _3133 = ~_3117;
    int _3135 = _3133 + 1;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2765, _2623, _2935);
    int _3141 = ~_3123;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_2623, _2817, _3025);
    int _3149 = abs(_2119);
    int _3151 = _3137 * as_type<int>(_2955);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3129;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3051 * as_type<int>(_2995);
    int _3163 = _3161 + _3121;
    int _3165 = ~_3149;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3173 = int(_3171);
    float _3175 = float(uint(_3059));
    float _3177 = _3071 * _2615;
    float _3179 = float(uint(_3097));
    int _3181 = _3169 * as_type<int>(_3003);
    int _3183 = _3181 + _3163;
    int _3185 = abs(_2153);
    int _3187 = _3145 * as_type<int>(_3035);
    int _3189 = _3187 + _3115;
    int _3191 = abs(_3059);
    int _3193 = _3159 * as_type<int>(_2963);
    int _3195 = _3193 + _3153;
    bool _3197 = !_2171;
    int _3199 = _3197 ? 0 : 1;
    float _3201 = 1.0 / _3175;
    bool _3203 = !_2175;
    int _3205 = _3203 ? 0 : 1;
    float _3207 = fma(_2773, _2625, _2915);
    int _3209 = abs(_3199);
    int _3211 = abs(_3205);
    int _3213 = ~_3209;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = 1.0 / _3179;
    float _3221 = float(uint(_3173));
    int _3223 = ~_3185;
    int _3225 = _3223 + 1;
    int _3227 = _3225 + 1;
    int _3229 = _3183 * _3217;
    bool _3231 = !_2179;
    int _3233 = _3231 ? 0 : 1;
    int _3235 = ~_3211;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    float _3241 = 1.0 / _3221;
    int _3243 = abs(_3233);
    int _3245 = _3227 * as_type<int>(_3043);
    int _3247 = _3245 + _3189;
    float _3249 = float(uint(_3191));
    int _3251 = _3063 * _3209;
    int _3253 = _3251 + _3229;
    int _3255 = ~_3243;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    int _3261 = _3239 * _3195;
    int _3263 = abs(_3097);
    float _3265 = fma(_2625, _2817, _3045);
    int _3267 = as_type<int>(_3201) + (-2);
    int _3269 = _3259 * _3247;
    float _3271 = float(uint(_3253));
    int _3273 = _3069 * _3211;
    int _3275 = _3273 + _3261;
    float _3277 = 1.0 / _3249;
    int _3279 = _3075 * _3243;
    int _3281 = _3279 + _3269;
    float _3283 = float(uint(_3263));
    float _3285 = fma(_2773, _2623, _2897);
    float _3287 = as_type<float>(_3267) * _3271;
    int _3289 = as_type<int>(_3219) + (-2);
    float _3291 = _2523 + _3085;
    float _3293 = float(uint(_3275));
    float _3295 = 1.0 / _3283;
    int _3297 = as_type<int>(_3241) + (-2);
    float _3299 = _2539 + _3265;
    float _3301 = float(uint(_3281));
    float _3303 = as_type<float>(_3289) * _3293;
    int _3305 = abs(_3173);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3291 + _3307;
    int _3311 = abs(_3253);
    float _3313 = trunc(_3287);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = as_type<float>(_3297) * _3301;
    float _3321 = float(uint(_3305));
    float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3325 = _3299 + _3323;
    int _3327 = as_type<int>(_3277) + (-2);
    float _3329 = _3309 * _3309;
    float _3331 = float(uint(_3311));
    float _3333 = _3325 * _3325;
    float _3335 = trunc(_3303);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_3275);
    float _3343 = _3065 * _2497;
    int _3345 = ~_3059;
    int _3347 = _3345 + 1;
    float _3349 = as_type<float>(_3327) * _3331;
    int _3351 = as_type<int>(_3295) + (-2);
    float _3353 = _3329 + _3333;
    float _3355 = float(uint(_3341));
    float _3357 = trunc(_3319);
    float _3359 = precise::max(_3357, 0.0);
    uint _3361 = uint(_3359);
    int _3363 = ~_3097;
    int _3365 = _3363 + 1;
    int _3367 = _3347 * int(_3317);
    int _3369 = _3367 + _3253;
    int _3371 = ~_3173;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_3351) * _3355;
    int _3377 = abs(_3281);
    int _3379 = ~_3191;
    int _3381 = _3379 + 1;
    float _3383 = 1.0 / _3321;
    int _3385 = _3365 * int(_3339);
    int _3387 = _3385 + _3275;
    float _3389 = float(uint(_3369));
    float _3391 = float(uint(_3377));
    int _3393 = ~_3305;
    int _3395 = _3393 + 1;
    float _3397 = as_type<float>(_3267) * _3389;
    float _3399 = trunc(_3349);
    float _3401 = precise::max(_3399, 0.0);
    uint _3403 = uint(_3401);
    int _3405 = _3373 * int(_3361);
    int _3407 = _3405 + _3281;
    float _3409 = float(uint(_3387));
    float _3411 = _3071 * _2497;
    float _3413 = _2719 * _3071;
    float _3415 = float(uint(_3407));
    float _3417 = as_type<float>(_3289) * _3409;
    int _3419 = as_type<int>(_3383) + (-2);
    float _3421 = sqrt(_3353);
    float _3423 = _3081 * _2497;
    float _3425 = as_type<float>(_3297) * _3415;
    float _3427 = _3065 * _2615;
    float _3429 = _3081 * _2615;
    float _3431 = as_type<float>(_3419) * _3391;
    float _3433 = _2719 * _3065;
    float _3435 = trunc(_3375);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _3381 * int(_3403);
    int _3443 = _3441 + _3311;
    float _3445 = _2719 * _3081;
    float _3447 = fma(_3207, _2613, _3429);
    float _3449 = float(uint(_3443));
    float _3451 = fma(_3083, _2613, _3427);
    float _3453 = trunc(_3431);
    float _3455 = precise::max(_3453, 0.0);
    uint _3457 = uint(_3455);
    int _3459 = ~_3263;
    int _3461 = _3459 + 1;
    float _3463 = fma(_3285, _2613, _3177);
    float _3465 = as_type<float>(_3327) * _3449;
    bool _3467 = _3421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3469 = _3461 * int(_3439);
    int _3471 = _3469 + _3341;
    float _3473 = trunc(_3397);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    float _3479 = float(uint(_3471));
    int _3481 = _3395 * int(_3457);
    int _3483 = _3481 + _3377;
    float _3485 = trunc(_3417);
    float _3487 = precise::max(_3485, 0.0);
    uint _3489 = uint(_3487);
    float _3491 = as_type<float>(_3351) * _3479;
    float _3493 = fma(_3083, _2507, _3343);
    float _3495 = fma(_2717, _3285, _3413);
    float _3497 = float(uint(_3483));
    float _3499 = fma(_3285, _2507, _3411);
    float _3501 = _2517 + _3147;
    float _3503 = fma(_2717, _3083, _3433);
    float _3505 = trunc(_3425);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3419) * _3497;
    float _3513 = _3497;
    float _3515 = _3329;
    float _3517 = _3333;
    float _3519 = _3299;
    float _3521 = _3291;
    float _3523 = _2729;
    if (!_3467)
    {
        _3513 = _3329;
    }
    float _3525 = _3513;
    float _3527 = fma(_3207, _2507, _3423);
    float _3529 = _3525;
    if (!_3467)
    {
        _3515 = _3501;
    }
    float _3531 = _3515;
    float _3533 = trunc(_3465);
    float _3535 = precise::max(_3533, 0.0);
    uint _3537 = uint(_3535);
    float _3539 = trunc(_3491);
    float _3541 = precise::max(_3539, 0.0);
    uint _3543 = uint(_3541);
    bool _3545 = !_3467;
    float _3547 = _3531;
    if (!_3545)
    {
        float _3549 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3553 = _3421 + _3551;
        float _3555 = rsqrt(_3353);
        float _3557 = _3553 * _3549;
        float _3559 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3561 = _3557 * 0.15915493667125701904296875;
        float _3563 = _3561 * 6.283185482025146484375;
        float _3565 = sin(_3563);
        float _3567 = _3561 * 6.283185482025146484375;
        float _3569 = cos(_3567);
        float _3571 = fma(_3565, _3559, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3573 = _3555 * _3571;
        float _3575 = _3569 + (-1.0);
        float _3577 = fma(_3309, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3579 = fma(_3325, _3573, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3581 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3585 = _3577 + _3583;
        float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3589 = _3579 + _3587;
        float _3591 = fma(_3501, _3569, _3581);
        float _3593 = _3585 * _3585;
        float _3595 = _3589 * _3589;
        _3547 = _3591;
        _3529 = _3593;
        _3517 = _3595;
        _3519 = _3579;
        _3521 = _3577;
    }
    float _3597 = _3547;
    float _3599 = _3529;
    float _3601 = _3517;
    float _3603 = _3519;
    float _3605 = _3521;
    float _3607 = trunc(_3511);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    int _3613 = ~_3059;
    int _3615 = _3613 + 1;
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3619 = _3597 + _3617;
    int _3621 = int(_3317) + int(_3477);
    float _3623 = fma(_2717, _3207, _3445);
    int _3625 = int(_3339) + int(_3489);
    float _3627 = fma(_3619, _3619, _3599);
    int _3629 = int(_3439) + int(_3543);
    int _3631 = _3615 * _3621;
    int _3633 = _3631 + _3253;
    int _3635 = int(_3361) + int(_3509);
    float _3637 = _3627 + _3601;
    int _3639 = ~_3173;
    int _3641 = _3639 + 1;
    float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3645 = uint(_3633) >= uint(_3059);
    float _3647 = fma(_3105, _2617, _3451);
    int _3649 = ~_3097;
    int _3651 = _3649 + 1;
    int _3653 = _3641 * _3635;
    int _3655 = _3653 + _3281;
    int _3657 = int(_3457) + int(_3611);
    float _3659 = fma(_3139, _2617, _3463);
    int _3661 = ~_3263;
    int _3663 = _3661 + 1;
    int _3665 = _3651 * _3625;
    int _3667 = _3665 + _3275;
    int _3669 = int(_3403) + int(_3537);
    float _3671 = sqrt(_3637);
    int _3673 = ~_3191;
    int _3675 = _3673 + 1;
    int _3677 = _3663 * _3629;
    int _3679 = _3677 + _3341;
    int _3681 = ~_3305;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3131, _2617, _3447);
    bool _3687 = uint(_3667) >= uint(_3097);
    int _3689 = _3675 * _3669;
    int _3691 = _3689 + _3311;
    bool _3693 = !_3645;
    int _3695 = _3693 ? 0 : (-1);
    float _3697 = _3643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3699 = uint(_3679) >= uint(_3263);
    float _3701 = fma(_2729, _3105, _3503);
    bool _3703 = uint(_3655) >= uint(_3173);
    int _3705 = _3683 * _3657;
    int _3707 = _3705 + _3377;
    bool _3709 = !_3687;
    int _3711 = _3709 ? 0 : (-1);
    float _3713 = fma(_3697, _1007, -0.5);
    int _3715 = ~_3621;
    int _3717 = _3715 + _3695;
    int _3719 = _3717 + 1;
    float _3721 = fma(_2729, _3131, _3623);
    bool _3723 = !_3703;
    int _3725 = _3723 ? 0 : (-1);
    out.m_73.x = _3647;
    out.m_73.y = _3659;
    out.m_73.z = _3685;
    int _3727 = ~_3625;
    int _3729 = _3727 + _3711;
    int _3731 = _3729 + 1;
    bool _3733 = uint(_3691) >= uint(_3191);
    bool _3735 = uint(_3707) >= uint(_3305);
    int _3737 = _3097 * _3731;
    int _3739 = _3737 + _3275;
    bool _3741 = _3059 == 0;
    float _3743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3745 = _3059 == 0;
    int _3747 = _3253 ^ _3059;
    int _3749 = _3059 * _3719;
    int _3751 = _3749 + _3253;
    int _3753 = ~_3635;
    int _3755 = _3753 + _3725;
    int _3757 = _3755 + 1;
    bool _3759 = _3097 == 0;
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3763 = !_3733;
    int _3765 = _3763 ? 0 : (-1);
    bool _3767 = _3097 == 0;
    int _3769 = _3275 ^ _3097;
    bool _3771 = !_3699;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3777 = !_3741;
    int _3779 = _3777 ? _3751 : (-1);
    int _3781 = _3281 ^ _3173;
    int _3783 = _3173 * _3757;
    int _3785 = _3783 + _3281;
    bool _3787 = _3173 == 0;
    bool _3789 = _3173 == 0;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3793 = !_3759;
    int _3795 = _3793 ? _3739 : (-1);
    float _3797 = float(_3779);
    uint _3799 = uint(int(uint(_3747) >> uint(31)));
    uint _3801 = uint(int(uint(_3769) >> uint(31)));
    float _3803 = fma(_3697, _3797, _2281);
    bool _3805 = !_3735;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3811 = float(_3795);
    float _3813 = fma(_2383, _3713, _3803);
    uint _3815 = uint(int(uint(_3781) >> uint(31)));
    bool _3817 = !_3787;
    int _3819 = _3817 ? _3785 : (-1);
    float _3821 = _3791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3823 = ~_3765;
    int _3825 = _3669 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = _3813 + 0.5;
    int _3831 = ~_3773;
    int _3833 = _3629 + _3831;
    int _3835 = _3833 + 1;
    float _3837 = _3743 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3839 = ~int(_3799);
    int _3841 = _3839 + 1;
    float _3843 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3845 = ~int(_3801);
    int _3847 = _3845 + 1;
    float _3849 = fma(_3837, _989, -0.5);
    int _3851 = ~_3807;
    int _3853 = _3657 + _3851;
    int _3855 = _3853 + 1;
    float _3857 = fma(_3837, _3811, _2375);
    int _3859 = ~int(_3815);
    int _3861 = _3859 + 1;
    float _3863 = fma(_3843, _1681, -0.5);
    float _3865 = float(_3819);
    float _3867 = fma(_2329, _3849, _3857);
    int _3869 = _3827 ^ _3841;
    float _3871 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = _3835 ^ _3847;
    float _3875 = fma(_3843, _3865, _2367);
    int _3877 = _3855 ^ _3861;
    float _3879 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3881 = ~_3841;
    int _3883 = _3881 + _3869;
    int _3885 = _3883 + 1;
    float _3887 = fma(_1513, _3821, -0.5);
    int _3889 = ~_3847;
    int _3891 = _3889 + _3873;
    int _3893 = _3891 + 1;
    float _3895 = fma(_1555, _3879, -0.5);
    int _3897 = ~_3861;
    int _3899 = _3897 + _3877;
    int _3901 = _3899 + 1;
    float _3903 = fma(_2371, _3863, _3875);
    bool _3905 = !_3745;
    int _3907 = _3905 ? _3885 : (-1);
    bool _3909 = !_3767;
    int _3911 = _3909 ? _3893 : (-1);
    bool _3913 = !_3789;
    int _3915 = _3913 ? _3901 : (-1);
    float _3917 = float(_3907);
    float _3919 = float(_3911);
    float _3921 = float(_3915);
    float _3923 = -_2363;
    float _3925 = fma(_3821, _3917, _3923);
    float _3927 = fma(_3105, _2579, _3493);
    float _3929 = -_2389;
    float _3931 = fma(_3879, _3919, _3929);
    float _3933 = fma(_3871, _1605, -0.5);
    float _3935 = -_2391;
    float _3937 = fma(_3871, _3921, _3935);
    float _3939 = fma(_2385, _3887, _3925);
    float _3941 = fma(_2369, _3895, _3931);
    float _3943 = fma(_2729, _3139, _3495);
    float _3945 = fma(_2387, _3933, _3937);
    float _3947 = fma(_3139, _2579, _3499);
    float _3949 = _3903 + 0.5;
    float _3951 = _3867 + 0.5;
    float _3953 = _3939 + 0.5;
    float _3955 = _3941 + 0.5;
    float _3957 = _3945 + 0.5;
    float _3959 = fma(_3131, _2579, _3527);
    out.m_75.x = _3701;
    out.m_75.y = _3943;
    out.m_75.z = _3721;
    bool _3961 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3963 = isnan(_3671);
    bool _3965 = _3961 || _3963;
    bool _3967 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3969 = _3965 || _3967;
    out.m_77.x = _3829;
    out.m_77.y = _3953;
    out.m_77.z = _3951;
    out.m_77.w = _3955;
    out.m_79.x = _3949;
    out.m_79.y = _3957;
    out.m_81.x = _3927;
    out.m_81.y = _3947;
    out.m_81.z = _3959;
    float _3971 = _3945;
    float _3973 = _3949;
    float _3975 = _3957;
    float _3977 = _3955;
    if (!_3969)
    {
        _3523 = 1.0;
    }
    float _3979 = _3523;
    bool _3981 = !_3969;
    float _3983 = _3979;
    if (!_3981)
    {
        bool _3985 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3987 = isnan(_3671);
        bool _3989 = _3985 || _3987;
        bool _3991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3993 = _3989 || _3991;
        if (!_3993)
        {
            float _3995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3997 = _3671 + _3995;
            float _3999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3999;
            float _4003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4005 = _4003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4007 = 1.0 / _4001;
            float _4009 = _3997 * _4007;
            float _4011 = fma(_4009, _4005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3983 = _4011;
            _4013 = true;
        }
        else
        {
            bool _4015 = _3671 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4017 = isnan(_3671);
            bool _4019 = _4015 || _4017;
            bool _4021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4023 = _4019 || _4021;
            if (!_4023)
            {
                float _4025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4027 = _3671 + _4025;
                float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4031 = _4029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4035 = _4033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4037 = 1.0 / _4031;
                float _4039 = _4027 * _4037;
                float _4041 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3983 = _4041;
                _4013 = true;
            }
            else
            {
                _3983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4013 = false;
    float _4043 = _3983;
    float _4045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4047 = _3597 + _4045;
    float _4049 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4051 = _3603 + _4049;
    bool _4053 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4055 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4057 = _4053 || _4055;
    bool _4059 = isnan(0.5);
    bool _4061 = _4057 || _4059;
    float _4063 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4065 = _3605 + _4063;
    float _4067 = fma(_4047, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4069 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4071 = fma(_4065, _4043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4073 = _4067;
    float _4075 = _4069;
    if (_4061)
    {
        _3971 = _4071;
    }
    float _4077 = _3971;
    float _4079 = _4077;
    if (!_4061)
    {
        float _4081 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4083 = _2517 + _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4087 = _2523 + _4085;
        float _4089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4091 = -_2539;
        float _4093 = _4091 + _4069;
        float _4095 = _4083 * _4083;
        float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4099 = _2539 + _4097;
        float _4101 = fma(_4087, _4087, _4095);
        float _4103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4105 = fma(_4099, _4099, _4101);
        float _4107 = sqrt(_4105);
        float _4109 = _4089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4111 = precise::min(_4107, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4113 = _4111 * _4103;
        float _4115 = -_2523;
        float _4117 = _4115 + _4071;
        float _4119 = _4109 * _4113;
        float _4121 = -_2517;
        float _4123 = _4121 + _4067;
        float _4125 = fma(_4117, _4119, _2523);
        float _4127 = fma(_4123, _4119, _2517);
        float _4129 = fma(_4093, _4119, _2539);
        _4073 = _4127;
        _4079 = _4125;
        _4075 = _4129;
        _3973 = _4119;
    }
    float _4131 = _4073;
    float _4133 = _4079;
    float _4135 = _4075;
    float _4137 = _3973;
    float _4139 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4141 = _4131 + _4139;
    float _4143 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4145 = _4133 + _4143;
    float _4147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4149 = _4135 + _4147;
    float _4151 = _4141 * _4141;
    float _4153 = fma(_4145, _4145, _4151);
    float _4155 = fma(_4149, _4149, _4153);
    float _4157 = rsqrt(_4155);
    float _4159 = sqrt(_4155);
    float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4163 = _4145 * _4161;
    float _4165 = _4149 * _4161;
    float _4167 = _4163 * _4163;
    float _4169 = _4165 * _4165;
    float _4171 = _4167 + _4169;
    float _4173 = sqrt(_4171);
    bool _4175 = _4173 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4179 = _4173 + _4177;
    float _4181 = _4157;
    float _4183 = _4137;
    float _4185 = _4179;
    float _4187 = _4141;
    float _4189 = _4161;
    if (_4175)
    {
        float _4191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4191;
    }
    float _4193 = _4181;
    if (_4175)
    {
        float _4195 = rsqrt(_4171);
        _4183 = _4195;
    }
    float _4197 = _4183;
    float _4199 = _4197;
    if (_4175)
    {
        float _4201 = _4179 * _4193;
        _4185 = _4201;
    }
    float _4203 = _4185;
    if (_4175)
    {
        float _4205 = _4203 * 0.15915493667125701904296875;
        _3975 = _4205;
    }
    float _4207 = _3975;
    float _4209 = _4193;
    float _4211 = _4207;
    if (_4175)
    {
        float _4213 = _4207 * 6.283185482025146484375;
        float _4215 = sin(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4221 = precise::max(0.0, _4219);
    float _4223 = _4149;
    float _4225 = _4221;
    if (_4175)
    {
        float _4227 = _4207 * 6.283185482025146484375;
        float _4229 = cos(_4227);
        _4223 = _4229;
    }
    float _4231 = _4223;
    float _4233 = -_4161;
    float _4235 = -_4221;
    float _4237 = fma(_4141, _4233, _4235);
    if (_4175)
    {
        float _4239 = _4237 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4225 = _4239;
    }
    float _4241 = _4225;
    float _4243 = _4241;
    if (!_4175)
    {
        _4211 = _4167;
    }
    float _4245 = _4211;
    float _4247 = _4217;
    float _4249 = _4245;
    if (_4175)
    {
        float _4251 = fma(_4217, _4241, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4187 = _4251;
    }
    float _4253 = _4187;
    float _4255 = _4253;
    if (!_4175)
    {
        _4247 = _4163;
    }
    float _4257 = _4247;
    float _4259 = _4257;
    if (_4175)
    {
        float _4261 = _4231 + (-1.0);
        _4243 = _4261;
    }
    float _4263 = _4243;
    float _4265 = _4263;
    if (_4175)
    {
        float _4267 = _4197 * _4253;
        _3977 = _4267;
    }
    float _4269 = _3977;
    if (!_4175)
    {
        _4199 = _4237;
    }
    float _4271 = _4199;
    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4275 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4273);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    float _4279 = _4271;
    if (_4175)
    {
        float _4281 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4189 = _4281;
    }
    float _4283 = _4189;
    if (_4175)
    {
        float _4285 = _4163 * _4269;
        _4259 = _4285;
    }
    float _4287 = _4259;
    if (!_4175)
    {
        _4255 = _4165;
    }
    float _4289 = _4255;
    float _4291 = _4289;
    if (_4175)
    {
        float _4293 = _4165 * _4269;
        _4291 = _4293;
    }
    float _4295 = _4291;
    if (_4175)
    {
        float _4297 = fma(_4237, _4231, _4283);
        _4279 = _4297;
    }
    float _4299 = _4279;
    if (_4175)
    {
        float _4301 = _4287 * _4287;
        _4249 = _4301;
    }
    float _4303 = _4249;
    if (!_4175)
    {
        _4265 = _4169;
    }
    float _4305 = _4265;
    float _4307 = _4305;
    if (_4175)
    {
        float _4309 = _4295 * _4295;
        _4307 = _4309;
    }
    float _4311 = _4307;
    float _4313 = fma(_4299, _4299, _4303);
    float _4315 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4317 = -_4277;
    float _4319 = _4317 + 1.0;
    float _4321 = _4313 + _4311;
    float _4323 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4325 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4327 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4329 = rsqrt(_4321);
    float _4331 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4315);
    float _4333 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4325);
    float _4335 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4327);
    float _4337 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4339 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4331);
    float _4341 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4333);
    float _4343 = _4131 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4345 = floor(_4323);
    float _4347 = _4339 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4349 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4351 = _4341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4353 = fma(_4133, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4343);
    float _4355 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4357 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4359 = _4329 * _4287;
    float _4361 = abs(_4319);
    float _4363 = log2(_4361);
    float _4365 = fma(_4135, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4353);
    float _4367 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4357);
    float _4369 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4371 = _4329 * _4295;
    float _4373 = _4365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4375 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4367);
    float _4377 = floor(_4337);
    float _4379 = _4329 * _4299;
    float _4381 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4375);
    float _4383 = -_4345;
    float _4385 = _4323 + _4383;
    float _4387 = -_4369;
    float _4389 = fma(_4379, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4387);
    float _4391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4393 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4395 = -_4371;
    float _4397 = fma(_4395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4389);
    float _4399 = _4347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4401 = 1.0 / _4381;
    float _4403 = fma(_4397, -0.5, 0.5);
    float _4405 = fma(_4397, 0.5, 0.5);
    float _4407 = -_4399;
    float _4409 = fma(_4407, _4391, 1.0);
    float _4411 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4413 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4415 = fma(_4405, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4417 = exp2(_4393);
    float _4419 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4411);
    float _4421 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4413);
    float _4423 = sqrt(_4403);
    float _4425 = fma(_4405, _4415, -0.212114393711090087890625);
    float _4427 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4419);
    float _4429 = _4379 + 1.0;
    float _4431 = log2(_4409);
    float _4433 = -_4377;
    float _4435 = _4337 + _4433;
    float _4437 = fma(_4405, _4425, 1.570728778839111328125);
    float _4439 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4421);
    float _4441 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4427);
    float _4443 = -_4379;
    float _4445 = fma(_4417, _4429, _4443);
    float _4447 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4439);
    float _4449 = _4423 * 0.636619746685028076171875;
    float _4451 = _4441 * _4401;
    float _4453 = _4447 * _4401;
    float2 _11396 = float2(_4385, _4435);
    float _4455 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11396, float2(0.0), isnan(_11396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11396, float2(0.0), isnan(_11396)), level(0.0)).x;
    float _4457 = -_4437;
    float _4459 = fma(_4449, _4457, 1.0);
    float _4461 = fma(_4451, 0.5, 0.5);
    float _4463 = fma(_4445, 0.5, 0.5);
    float _4465 = _4431 * 0.693147182464599609375;
    float _4467 = fma(_4453, -0.5, 0.5);
    float _4469 = _4465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _11425 = float3(_4461, _4467, _4469);
    float _4471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11425, float3(0.0), isnan(_11425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11425, float3(0.0), isnan(_11425)), level(0.0)).x;
    float3 _11436 = float3(_4461, _4467, _4469);
    float4 _4474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).xyzw;
    float _4476 = _4474.x;
    float _4478 = _4474.y;
    float _4480 = _4474.z;
    float _4482 = _4474.w;
    float2 _11452 = float2(_4459, _4463);
    float3 _4486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11452, float2(0.0), isnan(_11452)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11452, float2(0.0), isnan(_11452)), level(0.0)).xyz;
    float _4488 = _4486.x;
    float _4490 = _4486.y;
    float _4492 = _4486.z;
    float _4494 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4496 = _2517 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4498 = _4363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4500 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4494);
    float _4502 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4496);
    float _4504 = _4351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4506 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4500);
    float _4508 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4502);
    float _4510 = exp2(_4498);
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4514 = _4508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4504);
    float _4518 = _4514 + _4512;
    float _4520 = 1.0 / _4512;
    float _4522 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4516);
    bool _4524 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4526 = isnan(_4159);
    bool _4528 = _4524 || _4526;
    bool _4530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4532 = _4528 || _4530;
    float _4534 = fma(_4373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4522);
    float _4536 = -_4510;
    float _4538 = _4536 + 1.0;
    out.gl_Position.x = _4441;
    out.gl_Position.y = _4447;
    out.gl_Position.z = _4534;
    out.gl_Position.w = _4381;
    float _4540 = _4538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4542 = _4518 * _4520;
    float _4544 = _4542 * 0.5;
    float _4546 = in.m_83.x;
    float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4550 = fma(_4544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4548);
    float _4552 = 1.0 / _4550;
    float _4554 = -_4540;
    float _4556 = _4554 + 1.0;
    float _4558 = _4447;
    float _4560 = _4534;
    float _4562 = _4556;
    if (!_4532)
    {
        _4558 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4564 = _4558;
    float _4566 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4568 = _4552 * _4566;
    float _4570 = abs(_4568);
    float _4572 = log2(_4570);
    bool _4574 = _4568 <= 8000.0;
    bool _4576 = isnan(_4568);
    bool _4578 = _4574 || _4576;
    bool _4580 = isnan(8000.0);
    bool _4582 = _4578 || _4580;
    float _4584 = float(_4582);
    float _4586 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4588 = exp2(_4586);
    float _4590 = fma(_4588, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4592 = precise::clamp(_4590, 0.0, 1.0);
    float _4594 = fma(_4592, -2.0, 3.0);
    float _4596 = _4592 * _4592;
    float _4598 = _4596 * _4594;
    float _4600 = -_4598;
    float _4602 = _4600 + 1.0;
    float _4604 = fma(_4602, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4598);
    float _4606 = _4534 + _4381;
    float _4608 = _4564;
    float _4610 = _4564;
    if (!_4532)
    {
        _4560 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4612 = _4560;
    float _4614 = _4584 * _4604;
    float _4616 = _4606 * 0.5;
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.z = _4616;
    out.m_85.w = _4381;
    float _4620 = -_4455;
    float _4622 = _4620 + 1.0;
    float _4624 = _4622 * _4618;
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = -_4626;
    float _4630 = fma(_4628, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4632 = _4540 * _4471;
    float _4634 = _4630 * _4546;
    float _4636 = _4482 * _4556;
    float _4638 = _4612;
    float _4640 = _4612;
    if (!_4532)
    {
        _4562 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4642 = _4562;
    float _4644 = _4482 * _4632;
    float _4646 = _4492 * _4632;
    float _4648 = _4634 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4650 = fma(_4488, _4644, _4476);
    float _4652 = fma(_4490, _4644, _4478);
    float _4654 = fma(_4482, _4646, _4480);
    out.m_87.x = _4648;
    out.m_89.x = _4650;
    out.m_89.y = _4652;
    out.m_89.z = _4654;
    out.m_89.w = _4636;
    bool _4656 = !_4532;
    float _4658 = _4642;
    float _4660 = _4642;
    if (!_4656)
    {
        bool _4662 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4664 = isnan(_4159);
        bool _4666 = _4662 || _4664;
        bool _4668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4670 = _4666 || _4668;
        if (!_4670)
        {
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4674 = _4159 + _4672;
            float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4678 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4676;
            float _4680 = 1.0 / _4678;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4690 = _4674 * _4680;
            float _4692 = precise::clamp(_4690, 0.0, 1.0);
            float _4694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4696 = _4694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4698 = fma(_4692, _4688, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4700 = fma(_4692, _4696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4702 = fma(_4692, _4684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4610 = _4702;
            _4640 = _4700;
            _4660 = _4698;
            _4704 = true;
        }
        else
        {
            bool _4706 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4708 = isnan(_4159);
            bool _4710 = _4706 || _4708;
            bool _4712 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4714 = _4710 || _4712;
            if (!_4714)
            {
                _4638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4716 = _4638;
            _4640 = _4716;
            if (!_4714)
            {
                _4608 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4718 = _4608;
            _4610 = _4718;
            if (!_4714)
            {
                _4658 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4720 = _4658;
            bool _4722 = !_4714;
            _4660 = _4720;
            if (!_4722)
            {
                bool _4724 = _4159 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4726 = isnan(_4159);
                bool _4728 = _4724 || _4726;
                bool _4730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4732 = _4728 || _4730;
                if (!_4732)
                {
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4736 = _4159 + _4734;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4738;
                    float _4742 = 1.0 / _4740;
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4750 = _4748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4752 = _4736 * _4742;
                    float _4754 = precise::clamp(_4752, 0.0, 1.0);
                    float _4756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4760 = fma(_4754, _4750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4762 = fma(_4754, _4758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4764 = fma(_4754, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4610 = _4764;
                    _4640 = _4762;
                    _4660 = _4760;
                    _4704 = true;
                }
                else
                {
                    _4610 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4660 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4704 = false;
    float _4766 = _4610;
    float _4768 = _4640;
    float _4770 = _4660;
    float _4772 = _4766 * 0.586610972881317138671875;
    bool _4774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4776 = fma(_4768, 0.298911988735198974609375, _4772);
    out.m_91.x = 0.0;
    float _4778 = fma(_4770, 0.114477999508380889892578125, _4776);
    float _4780 = -_4778;
    float _4782 = _4780 + _4768;
    float _4784 = -_4778;
    float _4786 = _4784 + _4766;
    float _4788 = -_4778;
    float _4790 = _4788 + _4770;
    float _4792 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4794 = fma(_4782, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4796 = fma(_4786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    float _4798 = fma(_4790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4778);
    out.m_87.w = _4792;
    out.m_93.x = _4794;
    out.m_93.y = _4796;
    out.m_93.z = _4798;
    if (!_4774)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4800 = -_4131;
    float _4802 = _4800 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4804 = -_4133;
    float _4806 = _4804 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4808 = -_4135;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4812 = _4802 * _4802;
    float _4814 = fma(_4806, _4806, _4812);
    float _4816 = fma(_4810, _4810, _4814);
    float _4818 = sqrt(_4816);
    float _4820 = rsqrt(_4816);
    float _4822 = -_4818;
    float _4824 = _4822 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4826 = _4824 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4828 = precise::clamp(_4826, 0.0, 1.0);
    float _4830 = _4806 * _4820;
    float _4832 = _4802 * _4820;
    float _4834 = abs(_4828);
    float _4836 = log2(_4834);
    float _4838 = _4810 * _4820;
    float _4840 = _4830 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4842 = _3947 * _4832;
    float _4844 = -_4832;
    float _4846 = -_4840;
    float _4848 = fma(_4844, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4846);
    float _4850 = fma(_3927, _4830, _4842);
    float _4852 = -_4838;
    float _4854 = fma(_4852, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4848);
    float _4856 = fma(_3959, _4838, _4850);
    float _4858 = precise::clamp(_4856, 0.0, 1.0);
    float _4860 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4862 = _4854 + _4860;
    float _4864 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4866 = _4862 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4868 = precise::clamp(_4866, 0.0, 1.0);
    float _4870 = exp2(_4864);
    float _4872 = _4870 * _4868;
    float _4874 = _4858 * _4872;
    float _4876 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4878 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4880 = _4874 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4876;
    out.m_91.y = _4878;
    out.m_91.z = _4880;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

