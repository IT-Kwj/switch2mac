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
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4588 = false;
    bool _3969 = false;
    bool _528 = false;
    bool _412 = false;
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
        float _4821 = as_type<float>(_128);
        out.gl_Position.z = _4821;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4891 = as_type<float>(_166);
        out.gl_Position.z = _4891;
    }
    if (_158)
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _146 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_57.x;
    float _424 = in.m_57.y;
    float _426 = in.m_57.z;
    bool _428 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_420);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _446 = isnan(_420);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _420 + _460;
    float _464 = -_438;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _442;
    float _472 = _454 * _466;
    float _474 = -_454;
    float _476 = _474 + 1.0;
    float _478 = _390 * _426;
    float _480 = _388 * _424;
    float _482 = _458 * _470;
    float _484 = _386 * _422;
    float _486 = fma(_482, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _472;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _508 = !_468;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _146 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.x;
    bool _544 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = in.m_55.z;
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = in.m_55.y;
    float _564 = in.m_55.w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = float(_540);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _572 = int(_570);
    float _574 = in.m_61.x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _580 = _578 != 0;
    float _582 = float(uint(_560));
    float _584 = 1.0 / _568;
    int _586 = ~_560;
    int _588 = _586 + 1;
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _594 = int(_592);
    float _596 = float(_572);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _600 = _568;
    float _602 = _596;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_580)
    {
        _600 = 1.0;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_580)
    {
        _608 = 5.839270114898681640625;
    }
    float _610 = _608;
    bool _612 = _562 > 0.5;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _616 = int(_614);
    float _618 = _584 * _146;
    bool _620 = _564 > 0.5;
    float _622 = 1.0 / _582;
    float _624 = float(_594);
    float _626 = trunc(_618);
    int _628 = int(_626);
    float _630 = float(uint(_616));
    float _632 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _634 = int(_632);
    int _636 = as_type<int>(_622) + (-2);
    float _638 = 1.0 / _596;
    float _640 = float(uint(_628));
    float _642 = as_type<float>(_636) * _640;
    float _644 = 1.0 / _624;
    float _646 = float(uint(_634));
    float _648 = _624;
    float _650 = _564;
    if (_580)
    {
        _602 = 1.0;
    }
    float _652 = _602;
    float _654 = _652;
    if (!_580)
    {
        _654 = 1.2345600128173828125;
    }
    float _656 = _654;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = 1.0 / _630;
    if (_580)
    {
        _648 = 1.0;
    }
    float _664 = _648;
    float _666 = _638 * _146;
    float _668 = _664;
    float _670 = _638;
    if (!_580)
    {
        _668 = 7.345489978790283203125;
    }
    float _672 = _668;
    float _674 = _672;
    if (_580)
    {
        _670 = _542;
    }
    float _676 = _670;
    float _678 = _676;
    if (!_580)
    {
        _678 = _562;
    }
    float _680 = _678;
    float _682 = trunc(_642);
    float _684 = precise::max(_682, 0.0);
    uint _687 = uint(_684);
    float _689 = in.m_61.y;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _693 = _691 != 0;
    float _695 = _680 * _656;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _699 = _697 != 0;
    float _701 = 1.0 / _646;
    float _703 = trunc(_666);
    int _705 = int(_703);
    float _707 = _644 * _146;
    float _709 = _672 * _542;
    bool _711 = _699;
    if (_580)
    {
        _674 = _542;
    }
    float _713 = _674;
    float _715 = _713;
    if (!_580)
    {
        _715 = _556;
    }
    float _717 = _715;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc(_707);
    int _725 = int(_723);
    float _727 = -_689;
    float _729 = _727 + 1.0;
    float _731 = _717 * _610;
    int _733 = ~_560;
    int _735 = _733 + 1;
    int _737 = as_type<int>(_701) + (-2);
    int _739 = _612 ? as_type<int>(_729) : as_type<int>(_689);
    int _741 = _735 * int(_687);
    int _743 = _741 + _628;
    float _745 = float(uint(_705));
    float _747 = floor(_709);
    float _749 = _660 ? as_type<float>(_739) : _689;
    float _751 = _689;
    float _753 = _701;
    if (!_721)
    {
        _650 = _574;
    }
    float _755 = _650;
    float _757 = as_type<float>(_737) * _745;
    float _759 = float(uint(_743));
    float _761 = 0.0;
    float _763 = _755;
    int _765 = as_type<int>(_757);
    if (!_721)
    {
        _761 = _755;
    }
    float _767 = _761;
    float _769 = floor(_695);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = _767;
    if (_721)
    {
        _763 = _574;
    }
    float _777 = _763;
    float _779 = as_type<float>(_636) * _759;
    int _781 = as_type<int>(_662) + (-2);
    float _783 = float(uint(_725));
    float _785 = floor(_731);
    int _787 = _620 ? as_type<int>(_729) : as_type<int>(_689);
    int _789 = 0;
    float _791 = _777;
    if (_693)
    {
        float _793 = -_777;
        float _795 = _793 + 1.0;
        _789 = as_type<int>(_795);
    }
    int _797 = _789;
    bool _799 = _556 > 0.5;
    float _801 = as_type<float>(_781) * _783;
    float _803 = _699 ? as_type<float>(_787) : _689;
    float _805 = -_747;
    float _807 = _709 + _805;
    if (_773)
    {
        float _809 = _799 ? _729 : _689;
        _751 = _809;
    }
    float _811 = _751;
    float _813 = trunc(_757);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    if (_721)
    {
        bool _819 = _542 > 0.5;
        _711 = _819;
    }
    bool _821 = _711;
    int _823 = ~_634;
    int _825 = _823 + 1;
    int _827 = ~_616;
    int _829 = _827 + 1;
    if (!_693)
    {
        _753 = _777;
    }
    float _831 = _753;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_721)
    {
        float _841 = -_777;
        float _843 = _841 + 1.0;
        _765 = as_type<int>(_843);
    }
    int _845 = _765;
    if (_693)
    {
        float _847 = _799 ? as_type<float>(_797) : _777;
        _839 = _847;
    }
    float _849 = _839;
    float _851 = -_785;
    float _853 = _731 + _851;
    if (_721)
    {
        float _855 = _821 ? as_type<float>(_845) : _777;
        _775 = _855;
    }
    float _857 = _775;
    float _859 = -_769;
    float _861 = _695 + _859;
    float _863 = float(_112);
    float _865 = trunc(_779);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = float(_634);
    int _873 = _825 * int(_817);
    int _875 = _873 + _705;
    float _877 = float(_560);
    int _879 = _829 * int(_837);
    int _881 = _879 + _725;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = float(uint(_875));
    float _889 = 1.0 / _863;
    float _891 = float(_628);
    float _893 = as_type<float>(_737) * _887;
    bool _895 = _891 >= _877;
    bool _897 = isnan(_891);
    bool _899 = _895 || _897;
    bool _901 = isnan(_877);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = float(uint(_881));
    float _909 = trunc(_893);
    float _911 = precise::max(_909, 0.0);
    uint _913 = uint(_911);
    float _915 = _807 * _877;
    int _917 = int(_687) + int(_869);
    float _919 = _877 * _146;
    float _921 = as_type<float>(_781) * _907;
    float _923 = float(_705);
    float _925 = float(_616);
    float _927 = _889 * _146;
    float _929 = float(_725);
    float _931 = trunc(_921);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _923 >= _871;
    bool _939 = isnan(_923);
    bool _941 = _937 || _939;
    bool _943 = isnan(_871);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _871 * _861;
    float _951 = _919 * _889;
    float _953 = _871 * _927;
    float _955 = _925 * _927;
    bool _957 = _929 >= _925;
    bool _959 = isnan(_929);
    bool _961 = _957 || _959;
    bool _963 = isnan(_925);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = _925 * _853;
    int _971 = ~_634;
    int _973 = _971 + 1;
    int _975 = _588 * _917;
    int _977 = _975 + _628;
    int _979 = int(_817) + int(_913);
    float _981 = trunc(_915);
    int _983 = int(_981);
    bool _985 = !_885;
    int _987 = _985 ? 0 : 1;
    float _989 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = uint(_977) >= uint(_560);
    int _993 = int(_837) + int(_935);
    int _995 = _973 * _979;
    int _997 = _995 + _705;
    float _999 = trunc(_905);
    int _1001 = int(_999);
    bool _1003 = !_991;
    int _1005 = _1003 ? 0 : (-1);
    int _1007 = abs(_987);
    int _1009 = ~_917;
    int _1011 = _1009 + _1005;
    int _1013 = _1011 + 1;
    int _1015 = _983 * _1007;
    int _1017 = _1015 + _628;
    bool _1019 = uint(_997) >= uint(_634);
    int _1021 = _560 * _1013;
    int _1023 = _1021 + _628;
    int _1025 = ~_616;
    int _1027 = _1025 + 1;
    float _1029 = trunc(_951);
    int _1031 = int(_1029);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = _560 == 0;
    bool _1047 = !_1019;
    int _1049 = _1047 ? 0 : (-1);
    float _1051 = trunc(_947);
    int _1053 = int(_1051);
    bool _1055 = !_1039;
    int _1057 = _1055 ? 0 : 1;
    int _1059 = _1027 * _993;
    int _1061 = _1059 + _725;
    int _1063 = ~_1001;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    bool _1069 = !_1045;
    int _1071 = _1069 ? _1023 : (-1);
    int _1073 = ~_979;
    int _1075 = _1073 + _1049;
    int _1077 = _1075 + 1;
    float _1079 = trunc(_969);
    int _1081 = int(_1079);
    int _1083 = _560 + (-1);
    int _1085 = _1071 * _1067;
    int _1087 = abs(_1057);
    int _1089 = _634 * _1077;
    int _1091 = _1089 + _705;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1095 = _1093 != 0;
    int _1097 = _1001 * _1083;
    int _1099 = _1097 + _1085;
    bool _1101 = !_1035;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_949);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _1099 * _1087;
    bool _1115 = uint(_1061) >= uint(_616);
    bool _1117 = !_1043;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = abs(_1103);
    float _1123 = trunc(_967);
    int _1125 = int(_1123);
    int _1127 = abs(_1111);
    int _1129 = abs(_1119);
    bool _1131 = !_1115;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = _1107 * _1127;
    int _1137 = _1135 + _705;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1141 = _1139 != 0;
    float _1143 = trunc(_955);
    int _1145 = int(_1143);
    int _1147 = ~_993;
    int _1149 = _1147 + _1133;
    int _1151 = _1149 + 1;
    int _1153 = _1031 * _1121;
    int _1155 = _1153 + _1113;
    bool _1157 = !_1141;
    int _1159 = _1157 ? 0 : 1;
    int _1161 = _616 * _1151;
    int _1163 = _1161 + _725;
    bool _1165 = _634 == 0;
    int _1167 = _1017 * _1129;
    int _1169 = _1167 + _1155;
    int _1171 = abs(_1159);
    float _1173 = trunc(_953);
    int _1175 = int(_1173);
    int _1177 = ~_1053;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1165;
    int _1185 = _1183 ? _1091 : (-1);
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1189 = _1187 != 0;
    int _1191 = _634 + (-1);
    int _1193 = _1181 * _1185;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1201 = _1199 != 0;
    int _1203 = _983 * _1171;
    int _1205 = _1203 + _1169;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    int _1211 = _1053 * _1191;
    int _1213 = _1211 + _1193;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = float(uint(_1205));
    int _1221 = abs(_1209);
    int _1223 = abs(_1217);
    float _1225 = as_type<float>(_636) * _1219;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = float(uint(_1017));
    float _1237 = trunc(_1225);
    float _1239 = precise::max(_1237, 0.0);
    uint _1241 = uint(_1239);
    int _1243 = _1081 * _1221;
    int _1245 = _1243 + _725;
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = as_type<float>(_636) * _1235;
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1213 * _1223;
    int _1259 = abs(_1249);
    int _1261 = abs(_1255);
    float _1263 = trunc(_1251);
    float _1265 = precise::max(_1263, 0.0);
    uint _1267 = uint(_1265);
    bool _1269 = !_1233;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = _1175 * _1259;
    int _1275 = _1273 + _1257;
    bool _1277 = _616 == 0;
    int _1279 = ~_560;
    int _1281 = _1279 + 1;
    int _1283 = abs(_1271);
    int _1285 = _1137 * _1261;
    int _1287 = _1285 + _1275;
    int _1289 = ~_1125;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1281 * int(_1241);
    int _1297 = _1295 + _1205;
    bool _1299 = !_1277;
    int _1301 = _1299 ? _1163 : (-1);
    int _1303 = _1107 * _1283;
    int _1305 = _1303 + _1287;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1317 = _536 + _1315;
    int _1319 = ~_560;
    int _1321 = _1319 + 1;
    int _1323 = _1293 * _1301;
    float _1325 = float(uint(_1297));
    bool _1327 = !_1313;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = _1321 * int(_1267);
    int _1333 = _1331 + _1017;
    float _1335 = float(uint(_1305));
    float _1337 = as_type<float>(_636) * _1325;
    int _1339 = _616 + (-1);
    int _1341 = abs(_1329);
    float _1343 = as_type<float>(_737) * _1335;
    bool _1345 = !_1309;
    int _1347 = _1345 ? 0 : 1;
    int _1349 = _1125 * _1339;
    int _1351 = _1349 + _1323;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = float(uint(_1333));
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1363 = _1361 != 0;
    int _1365 = _1351 * _1341;
    int _1367 = abs(_1347);
    float _1369 = as_type<float>(_636) * _1359;
    int _1371 = ~_634;
    int _1373 = _1371 + 1;
    float _1375 = trunc(_1343);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1383 = _1381 != 0;
    int _1385 = _1145 * _1367;
    int _1387 = _1385 + _1365;
    bool _1389 = !_1363;
    int _1391 = _1389 ? 0 : 1;
    bool _1393 = !_1383;
    int _1395 = _1393 ? 0 : 1;
    int _1397 = abs(_1391);
    int _1399 = abs(_1395);
    float _1401 = trunc(_1369);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = int(_1241) + int(_1357);
    int _1409 = _1245 * _1397;
    int _1411 = _1409 + _1387;
    int _1413 = ~_560;
    int _1415 = _1413 + 1;
    int _1417 = _1373 * int(_1379);
    int _1419 = _1417 + _1305;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1423 = _1421 != 0;
    int _1425 = _1081 * _1399;
    int _1427 = _1425 + _1411;
    float _1429 = float(uint(_1137));
    float _1431 = float(uint(_1419));
    int _1433 = _1415 * _1407;
    int _1435 = _1433 + _1205;
    float _1437 = float(uint(_1427));
    float _1439 = as_type<float>(_737) * _1429;
    bool _1441 = _562 > 0.5;
    float _1443 = as_type<float>(_737) * _1431;
    bool _1445 = uint(_1435) >= uint(_560);
    float _1447 = as_type<float>(_781) * _1437;
    int _1449 = int(_1267) + int(_1405);
    float _1451 = trunc(_1443);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    bool _1457 = !_1445;
    int _1459 = _1457 ? 0 : (-1);
    int _1461 = _1415;
    if (_1423)
    {
        float _1463 = -_777;
        float _1465 = _1463 + 1.0;
        _1461 = as_type<int>(_1465);
    }
    int _1467 = _1461;
    float _1469 = float(uint(_1245));
    int _1471 = ~_1407;
    int _1473 = _1471 + _1459;
    int _1475 = _1473 + 1;
    if (_1423)
    {
        float _1477 = _1441 ? as_type<float>(_1467) : _777;
        _791 = _1477;
    }
    float _1479 = _791;
    float _1481 = trunc(_1447);
    float _1483 = precise::max(_1481, 0.0);
    uint _1485 = uint(_1483);
    float _1487 = as_type<float>(_781) * _1469;
    int _1489 = _560 * _1475;
    int _1491 = _1489 + _1205;
    bool _1493 = _560 == 0;
    int _1495 = ~_616;
    int _1497 = _1495 + 1;
    int _1499 = ~_634;
    int _1501 = _1499 + 1;
    float _1503 = trunc(_1487);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? _1491 : (-1);
    int _1513 = _1511 & 3;
    bool _1515 = _1513 != 0;
    int _1517 = int(_1379) + int(_1455);
    int _1519 = _1497 * int(_1485);
    int _1521 = _1519 + _1427;
    float _1523 = trunc(_1439);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    bool _1529 = uint(_1513) > 1u;
    int _1531 = ~_616;
    int _1533 = _1531 + 1;
    int _1535 = _1501 * _1517;
    int _1537 = _1535 + _1305;
    float _1539 = float(uint(_1521));
    int _1541 = _1511 & 3;
    bool _1543 = _1541 != 0;
    int _1545 = ~_634;
    int _1547 = _1545 + 1;
    float _1549 = as_type<float>(_781) * _1539;
    int _1551 = _1533 * int(_1507);
    int _1553 = _1551 + _1245;
    int _1555 = _1543 ? 0 : 1;
    bool _1557 = uint(_1537) >= uint(_634);
    float _1559 = trunc(_1549);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = ~_560;
    int _1567 = _1565 + 1;
    int _1569 = _1547 * int(_1527);
    int _1571 = _1569 + _1137;
    float _1573 = float(uint(_1553));
    bool _1575 = !_1557;
    int _1577 = _1575 ? 0 : (-1);
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    float _1585 = as_type<float>(_781) * _1573;
    int _1587 = _1583;
    int _1589 = _1567;
    if (!_1529)
    {
        int _1591 = ~_1555;
        int _1593 = _1591 + 1;
        _1587 = _1593;
    }
    int _1595 = _1587;
    bool _1597 = _1513 != 3;
    float _1599 = trunc(_1585);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    int _1605 = ~_1517;
    int _1607 = _1605 + _1577;
    int _1609 = _1607 + 1;
    int _1611 = _1567 * _1449;
    int _1613 = _1611 + _1017;
    float _1615 = float(uint(_1571));
    bool _1617 = uint(_1513) >= 2u;
    int _1619 = _634 * _1609;
    int _1621 = _1619 + _1305;
    int _1623 = int(_1485) + int(_1563);
    float _1625 = as_type<float>(_737) * _1615;
    int _1627 = _1617 ? 0 : 1;
    bool _1629 = uint(_1613) >= uint(_560);
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = !_1165;
    int _1639 = _1637 ? _1621 : (-1);
    int _1641 = ~_1627;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    int _1647 = _1645;
    if (_1597)
    {
        int _1649 = ~_1627;
        int _1651 = _1649 + 1;
        _1647 = _1651;
    }
    int _1653 = _1647;
    int _1655 = ~_616;
    int _1657 = _1655 + 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1661 = _1659 != 0;
    bool _1663 = !_1629;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1657 * _1623;
    int _1669 = _1667 + _1427;
    int _1671 = _1639 & 3;
    bool _1673 = _1671 != 0;
    bool _1675 = !_1661;
    int _1677 = _1675 ? 0 : 1;
    bool _1679 = uint(_1671) >= 2u;
    int _1681 = _1673 ? 0 : 1;
    int _1683 = _1679 ? 0 : 1;
    bool _1685 = uint(_1669) >= uint(_616);
    int _1687 = ~_634;
    int _1689 = _1687 + 1;
    bool _1691 = _1671 != 3;
    int _1693 = int(_1527) + int(_1635);
    bool _1695 = !_1685;
    int _1697 = _1695 ? 0 : (-1);
    bool _1699 = uint(_1671) > 1u;
    int _1701 = ~_1623;
    int _1703 = _1701 + _1697;
    int _1705 = _1703 + 1;
    int _1707 = _1689 * _1693;
    int _1709 = _1707 + _1137;
    int _1711 = ~_1683;
    int _1713 = _1711 + 1;
    int _1715 = _1713 + 1;
    int _1717 = _616 * _1705;
    int _1719 = _1717 + _1427;
    int _1721 = _1715;
    if (_1691)
    {
        int _1723 = ~_1683;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    bool _1729 = uint(_1709) >= uint(_634);
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = int(_1507) + int(_1603);
    float _1741 = _542 * 2.0;
    bool _1743 = !_1277;
    int _1745 = _1743 ? _1719 : (-1);
    float _1747 = 1.0 / _1733;
    int _1749 = ~_1681;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1753;
    if (!_1699)
    {
        int _1757 = ~_1681;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = !_1729;
    int _1765 = _1763 ? 0 : (-1);
    int _1767 = _1639 & 3;
    bool _1769 = _1767 != 0;
    float _1771 = floor(_1741);
    int _1773 = _1745 & 3;
    bool _1775 = _1773 != 0;
    float _1777 = _562 * 2.0;
    bool _1779 = !_1769;
    int _1781 = _1779 ? 0 : 1;
    bool _1783 = _1773 != 3;
    bool _1785 = !_1515;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = floor(_1777);
    float _1791 = _1777;
    if (_1737)
    {
        _604 = 0;
    }
    int _1793 = _604;
    bool _1795 = uint(_1773) >= 2u;
    int _1797 = ~_616;
    int _1799 = _1797 + 1;
    int _1801 = _1793;
    if (!_1737)
    {
        _1801 = 1;
    }
    int _1803 = _1801;
    bool _1805 = uint(_1773) > 1u;
    int _1807 = _1799 * _1739;
    int _1809 = _1807 + _1245;
    int _1811 = _1795 ? 0 : 1;
    bool _1813 = _1803 != 1;
    int _1815 = ~_1811;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1819;
    if (_1783)
    {
        int _1823 = ~_1811;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1775 ? 0 : 1;
    int _1831 = _1745 & 3;
    bool _1833 = _1831 != 0;
    bool _1835 = uint(_1809) >= uint(_616);
    bool _1837 = _1771 > 0.0;
    bool _1839 = !_1833;
    int _1841 = _1839 ? 0 : 1;
    bool _1843 = _1771 >= 0.0;
    bool _1845 = isnan(_1771);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan(0.0);
    bool _1851 = _1847 || _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    bool _1857 = !_1835;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = ~_1829;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    float _1867 = _1855 * _1747;
    bool _1869 = _1789 > 0.0;
    int _1871 = _1865;
    float _1873 = _1771;
    if (!_1805)
    {
        int _1875 = ~_1829;
        int _1877 = _1875 + 1;
        _1871 = _1877;
    }
    int _1879 = _1871;
    float _1881 = fma(_1867, _1317, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1883 = _1513 != 3;
    float _1885 = _542 + _562;
    float _1887 = 0.0;
    if (!_1813)
    {
        _1887 = _562;
    }
    float _1889 = _1887;
    int _1891 = _1851 ? 0 : 1;
    float _1893 = _1885 + (-1.0);
    bool _1895 = _1789 >= 0.0;
    bool _1897 = isnan(_1789);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1889;
    if (!_1813)
    {
        _1873 = _556;
    }
    float _1907 = _1873;
    float _1909 = _1907;
    if (!_1813)
    {
        _1791 = _1889;
    }
    float _1911 = _1791;
    float _1913 = 0.0;
    float _1915 = _1911;
    if (!_1813)
    {
        _1913 = _556;
    }
    float _1917 = _1913;
    int _1919 = ~_1891;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = _1917;
    int _1927 = _1923;
    if (_1813)
    {
        _1915 = _542;
    }
    float _1929 = _1915;
    if (_1813)
    {
        _1905 = _542;
    }
    float _1931 = _1905;
    if (_1813)
    {
        _1909 = _562;
    }
    float _1933 = _1909;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1813)
    {
        _1925 = _562;
    }
    float _1937 = _1925;
    if (!_1837)
    {
        int _1939 = ~_1891;
        int _1941 = _1939 + 1;
        _1927 = _1941;
    }
    int _1943 = _1927;
    bool _1945 = _1773 != 3;
    int _1947 = _1903 ? 0 : 1;
    bool _1949 = _1671 != 3;
    if (_1737)
    {
        _1589 = 0;
    }
    int _1951 = _1589;
    float _1953 = in.m_48.x;
    float _1955 = in.m_48.y;
    float _1957 = in.m_48.z;
    int _1959 = _1951;
    if (!_1737)
    {
        _1959 = 2;
    }
    int _1961 = _1959;
    bool _1963 = !_1883;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = ~_1947;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    bool _1973 = !_1945;
    int _1975 = _1973 ? 0 : (-1);
    bool _1977 = !_1949;
    int _1979 = _1977 ? 0 : (-1);
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1983 = _1981 != 0;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1991 = _1989 != 0;
    int _1993 = _1971;
    if (!_1869)
    {
        int _1995 = ~_1947;
        int _1997 = _1995 + 1;
        _1993 = _1997;
    }
    int _1999 = _1993;
    float _2001 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2009 = _2007 != 0;
    bool _2011 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2013 = isnan(_536);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _556 * 2.0;
    float _2025 = -_2021;
    float _2027 = _2025 + 1.0;
    bool _2029 = !_1983;
    int _2031 = _2029 ? 0 : 1;
    float _2033 = floor(_2023);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2037 = _1961 != 2;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2041 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2043 = fma(_989, -2.0, _2035);
    float _2045 = _554 * _2027;
    float _2047 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2049 = -_2039;
    float _2051 = fma(_2001, 2.0, _2049);
    float _2053 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2055 = _562 + _556;
    float _2057 = _1881 * _2045;
    float _2059 = -_554;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2041);
    float _2065 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2047);
    float _2067 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2053);
    bool _2069 = _2033 >= 0.0;
    bool _2071 = isnan(_2033);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = _2055 + (-1.0);
    float _2081 = fma(_2061, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2057);
    float _2083 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2085 = _2077 ? 0 : 1;
    float _2087 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2089 = _2033 > 0.0;
    float _2091 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2065);
    float _2093 = _2033;
    if (_2037)
    {
        _2093 = _542;
    }
    float _2095 = _2093;
    float _2097 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2063);
    float _2099 = _2095;
    if (!_2037)
    {
        _2099 = _556;
    }
    float _2101 = _2099;
    float _2103 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2067);
    float _2105 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2081);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2113 = _1511 >> 31;
    float _2115 = -_2107;
    float _2117 = fma(_2109, 2.0, _2115);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2125 = _2113 & 3;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _1511 + _2125;
    float _2135 = _2097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2137 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2139 = _2133 >> 2;
    out.m_63.x = _2127;
    out.m_63.y = _2129;
    out.m_63.z = _2131;
    out.m_63.w = _2111;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2143 = _2139 << 4;
    int _2145 = _2143 + 368;
    float _2147 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2149 = !_1987;
    int _2151 = _2149 ? 0 : 1;
    float _2153 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2141);
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2157 = !_1991;
    int _2159 = _2157 ? 0 : 1;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2137 + _2161;
    int _2165 = ~_2085;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    float _2171 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2155);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2175 = _2135 + _2173;
    int _2177 = _2169;
    if (!_2089)
    {
        int _2179 = ~_2085;
        int _2181 = _2179 + 1;
        _2177 = _2181;
    }
    int _2183 = _2177;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2187 = _2147 + _2185;
    int _2189 = _1639 >> 31;
    float _2191 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2193 = _1745 >> 31;
    float _2195 = -_146;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2051);
    int _2199 = _2189 & 3;
    float _2201 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2191);
    int _2203 = _2193 & 3;
    float _2205 = -_146;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2117);
    uint _2209 = uint(int(uint(_2145) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2201);
    int _2227 = _1745 + _2203;
    float _2229 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2171);
    int _2231 = abs(_2151);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2235 = _2227 >> 2;
    float _2237 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2153);
    int _2239 = abs(_2159);
    float _2241 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2243 = _2235 << 4;
    int _2245 = _2243 + 656;
    int _2247 = _1639 + _2199;
    float _2249 = fma(_2241, -2.0, _2233);
    uint _2251 = uint(int(uint(_2245) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = float(_1943);
    float _2269 = float(_1999);
    float _2271 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2249);
    float _2273 = float(_2231);
    float _2275 = float(_2239);
    int _2277 = _2247 >> 2;
    int _2279 = abs(_2031);
    float _2281 = _2273 * _2267;
    int _2283 = _2277 << 4;
    int _2285 = _2283 + 512;
    float _2287 = _2275 * _2269;
    int _2289 = _2245 + 8;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    uint _2293 = uint(int(uint(int(_2291)) >> uint(2)));
    int _2295 = int(_2291) & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    int _2299 = int(_2291) + 1;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    int _2303 = _2299 & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    bool _2307 = _2225 >= 0.0;
    float _2309 = _2281 * (-2.0);
    float _2311 = float(_2183);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2315 = abs(_1595);
    uint _2317 = uint(int(uint(_2285) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = -_2313;
    float _2335 = fma(_1935, 2.0, _2333);
    int _2337 = ~_1693;
    int _2339 = _2337 + _1765;
    int _2341 = _2339 + 1;
    int _2343 = ~_2315;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    float _2349 = -_146;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2335);
    int _2353 = ~_1449;
    int _2355 = _2353 + _1665;
    int _2357 = _2355 + 1;
    if (_2307)
    {
        out.m_51.x = 0.0;
    }
    int _2359 = _2145 + 8;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = ~_1739;
    int _2379 = _2377 + _1859;
    int _2381 = _2379 + 1;
    int _2383 = _2347 * as_type<int>(_2223);
    int _2385 = abs(_1761);
    int _2387 = _560 * _2357;
    int _2389 = _2387 + _1017;
    int _2391 = abs(_1879);
    int _2393 = _616 * _2381;
    int _2395 = _2393 + _1245;
    int _2397 = abs(_1787);
    int _2399 = _2285 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = _634 * _2341;
    int _2423 = _2421 + _1137;
    int _2425 = abs(_1841);
    int _2427 = ~_2397;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = abs(_1727);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2437 = int(_2435);
    int _2439 = ~_2391;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _2431 * as_type<int>(_2215);
    int _2447 = _2445 + _2383;
    int _2449 = abs(_1653);
    int _2451 = _2443 * as_type<int>(_2265);
    int _2453 = abs(_1827);
    int _2455 = ~_2425;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = ~_2453;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = abs(_1781);
    int _2469 = _2459 * as_type<int>(_2257);
    int _2471 = _2469 + _2451;
    int _2473 = ~_2385;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2481 = int(_2479);
    int _2483 = ~_2449;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    int _2489 = _2465 * as_type<int>(_2297);
    int _2491 = _2489 + _2471;
    int _2493 = abs(_1965);
    int _2495 = ~_2467;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2477 * as_type<int>(_2331);
    int _2503 = abs(_1677);
    int _2505 = ~_2493;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2499 * as_type<int>(_2323);
    int _2513 = _2511 + _2501;
    int _2515 = ~_2433;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2523 = log2(_2521);
    int _2525 = ~_2503;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    int _2531 = _2487 * as_type<int>(_2367);
    int _2533 = _2531 + _2447;
    float _2535 = float(uint(_2419));
    bool _2537 = _560 == 0;
    int _2539 = _2509 * as_type<int>(_2375);
    int _2541 = _2539 + _2533;
    float _2543 = float(uint(_2481));
    float _2545 = 1.0 / _2535;
    int _2547 = _2519 * as_type<int>(_2407);
    int _2549 = _2547 + _2513;
    int _2551 = abs(_1979);
    int _2553 = _2541 * _2529;
    int _2555 = abs(_1975);
    bool _2557 = !_2005;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2523 * _146;
    int _2563 = ~_2555;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = 1.0 / _2543;
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = abs(_2559);
    int _2579 = _2567 * as_type<int>(_2305);
    int _2581 = _2579 + _2491;
    bool _2583 = !_2009;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2575 * as_type<int>(_2415);
    int _2589 = _2587 + _2549;
    bool _2591 = !_2537;
    int _2593 = _2591 ? _2389 : (-1);
    float _2595 = exp2(_2561);
    int _2597 = ~_2577;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = abs(_2585);
    int _2605 = _2593 * _2503;
    int _2607 = _2605 + _2553;
    float _2609 = float(uint(_2437));
    int _2611 = _2601 * _2589;
    int _2613 = abs(_2437);
    int _2615 = abs(_2419);
    int _2617 = ~_2603;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    float _2623 = 1.0 / _2609;
    int _2625 = abs(_2481);
    float _2627 = float(uint(_2613));
    int _2629 = _2621 * _2581;
    float _2631 = float(uint(_2615));
    bool _2633 = _634 == 0;
    int _2635 = as_type<int>(_2545) + (-2);
    float _2637 = 1.0 / _2627;
    float _2639 = float(uint(_2607));
    float _2641 = float(uint(_2625));
    bool _2643 = !_1277;
    int _2645 = _2643 ? _2395 : (-1);
    bool _2647 = !_2633;
    int _2649 = _2647 ? _2423 : (-1);
    float _2651 = as_type<float>(_2635) * _2639;
    float _2653 = 1.0 / _2631;
    int _2655 = _2645 * _2603;
    int _2657 = _2655 + _2629;
    int _2659 = as_type<int>(_2569) + (-2);
    int _2661 = _2649 * _2577;
    int _2663 = _2661 + _2611;
    int _2665 = as_type<int>(_2623) + (-2);
    float _2667 = float(uint(_2657));
    float _2669 = in.m_65.x;
    float _2671 = in.m_65.y;
    float _2673 = in.m_65.z;
    float _2675 = 1.0 / _2641;
    float _2677 = float(uint(_2663));
    float _2679 = as_type<float>(_2659) * _2667;
    int _2681 = abs(_2663);
    int _2683 = abs(_2607);
    float _2685 = as_type<float>(_2665) * _2677;
    float _2687 = trunc(_2651);
    float _2689 = precise::max(_2687, 0.0);
    uint _2691 = uint(_2689);
    int _2693 = abs(_2657);
    int _2695 = as_type<int>(_2637) + (-2);
    float _2697 = float(uint(_2681));
    int _2699 = as_type<int>(_2653) + (-2);
    float _2701 = trunc(_2685);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = float(uint(_2683));
    float _2709 = as_type<float>(_2695) * _2697;
    int _2711 = ~_2419;
    int _2713 = _2711 + 1;
    int _2715 = as_type<int>(_2675) + (-2);
    float _2717 = as_type<float>(_2699) * _2707;
    float _2719 = float(uint(_2693));
    int _2721 = _2713 * int(_2691);
    int _2723 = _2721 + _2607;
    float _2725 = as_type<float>(_2553);
    float _2727 = _2653;
    if (_2037)
    {
        _2725 = _562;
    }
    float _2729 = _2725;
    float _2731 = trunc(_2679);
    float _2733 = precise::max(_2731, 0.0);
    uint _2735 = uint(_2733);
    float _2737 = as_type<float>(_2715) * _2719;
    float _2739 = _2729;
    if (!_2037)
    {
        _2739 = _542;
    }
    float _2741 = _2739;
    float _2743 = fma(_2309, _2671, _2671);
    float _2745 = float(_2279);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2307)
    {
        _2727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2749 = _2727;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2753 = float(uint(_2723));
    float _2755 = _2745 * _2311;
    float _2757 = trunc(_2717);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = ~_2437;
    int _2765 = _2763 + 1;
    float _2767 = fma(_2751, -2.0, _2747);
    int _2769 = as_type<int>(_2749);
    if (_2307)
    {
        float _2771 = _2749 * 5.0;
        _2769 = as_type<int>(_2771);
    }
    int _2773 = _2769;
    float _2775 = as_type<float>(_2635) * _2753;
    float _2777 = _2755 * (-2.0);
    float _2779 = trunc(_2737);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    if (_2307)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8634 = as_type<float>(_2773);
        out.gl_Position.z = _8634;
    }
    float _2785 = fma(_2083, _2777, _2083);
    float _2787 = fma(_2777, _2669, _2669);
    int _2789 = ~_2481;
    int _2791 = _2789 + 1;
    float _2793 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2767);
    int _2795 = ~_2613;
    int _2797 = _2795 + 1;
    float _2799 = trunc(_2709);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2615;
    int _2807 = _2805 + 1;
    int _2809 = _2765 * int(_2705);
    int _2811 = _2809 + _2663;
    float _2813 = trunc(_2775);
    float _2815 = precise::max(_2813, 0.0);
    uint _2817 = uint(_2815);
    int _2819 = ~_2625;
    int _2821 = _2819 + 1;
    int _2823 = _2791 * int(_2735);
    int _2825 = _2823 + _2657;
    float _2827 = float(uint(_2811));
    int _2829 = _2807 * int(_2761);
    int _2831 = _2829 + _2683;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2835 = 1.0 + _2833;
    int _2837 = _2821 * int(_2783);
    int _2839 = _2837 + _2693;
    float _2841 = float(uint(_2825));
    float _2843 = as_type<float>(_2665) * _2827;
    float _2845 = float(uint(_2831));
    int _2847 = _2797 * int(_2803);
    int _2849 = _2847 + _2681;
    float _2851 = float(uint(_2839));
    float _2853 = as_type<float>(_2659) * _2841;
    float _2855 = 1.0 / _2835;
    float _2857 = as_type<float>(_2699) * _2845;
    float _2859 = float(uint(_2849));
    float _2861 = as_type<float>(_2715) * _2851;
    float _2863 = -_2595;
    float _2865 = _2863 + 1.0;
    int _2867 = int(_2691) + int(_2817);
    float _2869 = as_type<float>(_2695) * _2859;
    float _2871 = trunc(_2843);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2879 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2043);
    bool _2881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2883 = isnan(1.0);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2889 = _2885 || _2887;
    float _2891 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _590);
    bool _2893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2895 = isnan(0.0);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2901 = _2897 || _2899;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2905 = trunc(_2853);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    int _2911 = ~_2419;
    int _2913 = _2911 + 1;
    float _2915 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _598);
    float _2917 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2903);
    float _2919 = _542 + (-0.5);
    float _2921 = _562 + (-0.5);
    int _2923 = _2913 * _2867;
    int _2925 = _2923 + _2607;
    float _2927 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2917);
    float _2929 = trunc(_2857);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2877);
    int _2937 = int(_2705) + int(_2875);
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2787);
    int _2941 = ~_2437;
    int _2943 = _2941 + 1;
    float _2945 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2935);
    float _2947 = _2901 ? _2865 : 0.0;
    float _2949 = trunc(_2869);
    float _2951 = precise::max(_2949, 0.0);
    uint _2953 = uint(_2951);
    bool _2955 = uint(_2925) >= uint(_2419);
    int _2957 = _2943 * _2937;
    int _2959 = _2957 + _2663;
    if (_2889)
    {
        float _2961 = _2947 * _2855;
        _148 = _2961;
    }
    float _2963 = _148;
    int _2965 = ~_2615;
    int _2967 = _2965 + 1;
    int _2969 = ~_2625;
    int _2971 = _2969 + 1;
    float _2973 = fma(_2785, _2963, _2939);
    float _2975 = trunc(_2861);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = int(_2761) + int(_2933);
    int _2983 = ~_2613;
    int _2985 = _2983 + 1;
    int _2987 = int(_2735) + int(_2909);
    int _2989 = _2967 * _2981;
    int _2991 = _2989 + _2683;
    int _2993 = ~_2481;
    int _2995 = _2993 + 1;
    int _2997 = int(_2803) + int(_2953);
    bool _2999 = uint(_2959) >= uint(_2437);
    int _3001 = _2995 * _2987;
    int _3003 = _3001 + _2657;
    bool _3005 = uint(_2991) >= uint(_2615);
    int _3007 = _2985 * _2997;
    int _3009 = _3007 + _2681;
    bool _3011 = !_2999;
    int _3013 = _3011 ? 0 : (-1);
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = int(_2783) + int(_2979);
    bool _3019 = uint(_3009) >= uint(_2613);
    bool _3021 = !_2955;
    int _3023 = _3021 ? 0 : (-1);
    int _3025 = _2971 * _3017;
    int _3027 = _3025 + _2693;
    bool _3029 = uint(_3003) >= uint(_2481);
    int _3031 = ~_2867;
    int _3033 = _3031 + _3023;
    int _3035 = _3033 + 1;
    bool _3037 = uint(_3027) >= uint(_2625);
    float _3039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3041 = ~_2937;
    int _3043 = _3041 + _3013;
    int _3045 = _3043 + 1;
    int _3047 = _2419 * _3035;
    int _3049 = _3047 + _2607;
    bool _3051 = !_3029;
    int _3053 = _3051 ? 0 : (-1);
    int _3055 = _2607 ^ _2419;
    int _3057 = _2437 * _3045;
    int _3059 = _3057 + _2663;
    bool _3061 = !_3005;
    int _3063 = _3061 ? 0 : (-1);
    int _3065 = ~_2987;
    int _3067 = _3065 + _3053;
    int _3069 = _3067 + 1;
    bool _3071 = _2437 == 0;
    int _3073 = _2663 ^ _2437;
    bool _3075 = _2419 == 0;
    float _3077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3079 = _2657 ^ _2481;
    int _3081 = _2481 * _3069;
    int _3083 = _3081 + _2657;
    bool _3085 = !_3071;
    int _3087 = _3085 ? _3059 : (-1);
    bool _3089 = !_3019;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = ~_3063;
    int _3095 = _2981 + _3093;
    int _3097 = _3095 + 1;
    float _3099 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3101 = !_3075;
    int _3103 = _3101 ? _3049 : (-1);
    float _3105 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3107 = float(_3087);
    float _3109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3111 = ~_3091;
    int _3113 = _2997 + _3111;
    int _3115 = _3113 + 1;
    float _3117 = fma(_3099, _857, -0.5);
    uint _3119 = uint(int(uint(_3055) >> uint(31)));
    float _3121 = fma(_3105, _849, -0.5);
    bool _3123 = _2481 == 0;
    float _3125 = fma(_3105, _3107, _2351);
    float _3127 = float(_3103);
    uint _3129 = uint(int(uint(_3073) >> uint(31)));
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3133 = ~int(_3119);
    int _3135 = _3133 + 1;
    float _3137 = fma(_3099, _3127, _2197);
    bool _3139 = !_3123;
    int _3141 = _3139 ? _3083 : (-1);
    float _3143 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3145 = ~int(_3129);
    int _3147 = _3145 + 1;
    float _3149 = fma(_2945, _3117, _3137);
    int _3151 = _3097 ^ _3135;
    float _3153 = fma(_3143, _1479, -0.5);
    bool _3155 = _2481 == 0;
    float _3157 = fma(_2229, _3121, _3125);
    float _3159 = float(_3141);
    bool _3161 = !_3037;
    int _3163 = _3161 ? 0 : (-1);
    uint _3165 = uint(int(uint(_3079) >> uint(31)));
    float _3167 = fma(_3143, _3159, _2207);
    int _3169 = _3115 ^ _3147;
    float _3171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3173 = _2419 == 0;
    float _3175 = fma(_2891, _3153, _3167);
    int _3177 = ~_3135;
    int _3179 = _3177 + _3151;
    int _3181 = _3179 + 1;
    float _3183 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3185 = ~_3163;
    int _3187 = _3017 + _3185;
    int _3189 = _3187 + 1;
    float _3191 = _2175 * _2175;
    int _3193 = ~int(_3165);
    int _3195 = _3193 + 1;
    float _3197 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3199 = _2437 == 0;
    float _3201 = fma(_749, _3183, -0.5);
    int _3203 = ~_3147;
    int _3205 = _3203 + _3169;
    int _3207 = _3205 + 1;
    float _3209 = fma(_2163, _2163, _3191);
    bool _3211 = !_3173;
    int _3213 = _3211 ? _3181 : (-1);
    float _3215 = fma(_803, _3197, -0.5);
    int _3217 = _3189 ^ _3195;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3221 = !_3199;
    int _3223 = _3221 ? _3207 : (-1);
    float _3225 = fma(_2087, _2309, _2087);
    float _3227 = float(_3213);
    float _3229 = fma(_3219, _811, -0.5);
    int _3231 = ~_3195;
    int _3233 = _3231 + _3217;
    int _3235 = _3233 + 1;
    float _3237 = float(_3223);
    float _3239 = -_2879;
    float _3241 = fma(_3183, _3227, _3239);
    bool _3243 = !_3155;
    int _3245 = _3243 ? _3235 : (-1);
    float _3247 = -_2271;
    float _3249 = fma(_3197, _3237, _3247);
    float _3251 = fma(_2187, _2187, _3209);
    float _3253 = float(_3245);
    float _3255 = fma(_2927, _3201, _3241);
    float _3257 = fma(_2237, _3215, _3249);
    float _3259 = _3149 + 0.5;
    float _3261 = -_2793;
    float _3263 = fma(_3219, _3253, _3261);
    float _3265 = rsqrt(_3251);
    float _3267 = _3175 + 0.5;
    float _3269 = _3255 + 0.5;
    float _3271 = fma(_2915, _3229, _3263);
    float _3273 = _3157 + 0.5;
    float _3275 = _3257 + 0.5;
    float _3277 = _3271 + 0.5;
    out.m_67.x = _3259;
    out.m_67.y = _3269;
    out.m_67.z = _3273;
    out.m_67.w = _3275;
    out.m_69.x = _3267;
    out.m_69.y = _3277;
    float _3279 = _2175 * _3265;
    float _3281 = _2163 * _3265;
    if (_2307)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3283 = -_3279;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2135);
    float _3287 = _2973 * 0.15915493667125701904296875;
    float _3289 = -_3281;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2137);
    float _3293 = _2187 * _3265;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3285 + _3295;
    float _3299 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2743);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3303 = _3291 + _3301;
    float _3305 = _3297 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3307 = _542 + _556;
    float _3309 = -_3293;
    float _3311 = fma(_3309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2147);
    float _3313 = _556 + (-0.5);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3305);
    float _3317 = _3307 + (-1.0);
    float _3319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3321 = _3311 + _3319;
    float _3323 = _2287 * (-2.0);
    float _3325 = -_3279;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2175);
    float _3329 = fma(_3317, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3315);
    float _3333 = fma(_3323, _2673, _2673);
    float _3335 = fma(_3225, _2963, _3299);
    float _3337 = fma(_3329, _3323, _3329);
    float _3339 = -_3281;
    float _3341 = fma(_3339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2163);
    bool _3343 = _3331 >= 0.0;
    float _3345 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3333);
    float _3347 = _3327 * _3327;
    float _3349 = _3335 * 0.15915493667125701904296875;
    float _3351 = -_3293;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    float _3355 = fma(_3337, _2963, _3345);
    float _3357 = fma(_3341, _3341, _3347);
    float _3359 = _3287 * 6.283185482025146484375;
    float _3361 = sin(_3359);
    float _3363 = _3355 * 0.15915493667125701904296875;
    float _3365 = fma(_3353, _3353, _3357);
    float _3367 = _3345;
    float _3369 = _3365;
    float _3371 = _3353;
    float _3373 = _3341;
    if (_3343)
    {
        _3367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3375 = _3367;
    int _3377 = as_type<int>(_3375);
    if (_3343)
    {
        out.m_51.x = 0.0;
    }
    float _3379 = _3287 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    if (_3343)
    {
        float _3383 = _3375 * 5.0;
        _3377 = as_type<int>(_3383);
    }
    int _3385 = _3377;
    float _3387 = _3349 * 6.283185482025146484375;
    float _3389 = sin(_3387);
    if (_3343)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9553 = as_type<float>(_3385);
        out.gl_Position.z = _9553;
    }
    float _3391 = _3349 * 6.283185482025146484375;
    float _3393 = cos(_3391);
    float _3395 = _3363 * 6.283185482025146484375;
    float _3397 = sin(_3395);
    float _3399 = _3361 * _3389;
    float _3401 = sqrt(_3365);
    float _3403 = _3381 * _3393;
    if (_3343)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3405 = -_2135;
    float _3407 = _3405 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3409 = -_2137;
    float _3411 = _3409 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3413 = -_2147;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3417 = in.m_71.x;
    float _3419 = in.m_71.y;
    float _3421 = in.m_71.z;
    float _3423 = _3407 * _3407;
    float _3425 = _3363 * 6.283185482025146484375;
    float _3427 = cos(_3425);
    float _3429 = _3265 * _3401;
    float _3431 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3433 = fma(_3411, _3411, _3423);
    float _3435 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3437 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3439 = fma(_3415, _3415, _3433);
    float _3441 = _3429 * _3431;
    float _3443 = _3429 * _3435;
    float _3445 = fma(_3397, _3403, _3399);
    float _3447 = rsqrt(_3439);
    float _3449 = _3381 * _3389;
    float _3451 = _3361 * _3393;
    float _3453 = fma(_3397, _3399, _3403);
    float _3455 = _3429 * _3437;
    float _3457 = _3381 * _3427;
    float _3459 = _3361 * _3427;
    float _3461 = _3393 * _3427;
    float _3463 = _3389 * _3427;
    float _3465 = -_3449;
    float _3467 = fma(_3397, _3451, _3465);
    float _3469 = -_3451;
    float _3471 = fma(_3397, _3449, _3469);
    float _3473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3417);
    float _3475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3419);
    bool _3477 = _3419 != 0.0;
    bool _3479 = isnan(_3419);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3421);
    float _3489 = _3455 * _3473;
    float _3491 = _3411 * _3447;
    float _3493 = _3415 * _3447;
    float _3495 = _3407 * _3447;
    float _3497 = _3443 * _3475;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3501 = _3491 * _3499;
    float _3503 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3505 = _3493 * _3503;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3515 = _3495 * _3513;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = -_3501;
    float _3521 = fma(_3493, _3517, _3519);
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3525 = -_3505;
    float _3527 = fma(_3495, _3523, _3525);
    bool _3529 = _3417 == 0.0;
    bool _3531 = !_3485;
    bool _3533 = _3529 && _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3537 = -_3515;
    float _3539 = fma(_3491, _3535, _3537);
    float _3541 = _3521 * _3521;
    float _3543 = -_3497;
    float _3545 = _3397 * _3543;
    float _3547 = _3441 * _3487;
    bool _3549 = _3421 == 0.0;
    bool _3551 = _3549 && _3533;
    float _3553 = fma(_3527, _3527, _3541);
    float _3555 = in.m_75.x;
    float _3557 = in.m_75.y;
    float _3559 = in.m_75.z;
    float _3561 = in.m_75.w;
    float _3563 = fma(_3461, _3489, _3545);
    float _3565 = _3457 * _3497;
    float _3567 = fma(_3539, _3539, _3553);
    float _3569 = _3459 * _3497;
    float _3571 = fma(_3445, _3489, _3565);
    float _3573 = rsqrt(_3567);
    float _3575 = fma(_3467, _3489, _3569);
    float _3577 = _3565;
    float _3579 = _3497;
    float _3581 = _3507;
    if (_3551)
    {
        _3369 = _3509;
    }
    float _3583 = _3369;
    float _3585 = _3583;
    if (_3551)
    {
        _3371 = _3507;
    }
    float _3587 = _3371;
    float _3589 = fma(_3471, _3547, _3571);
    float _3591 = _3587;
    if (_3551)
    {
        _3373 = _3511;
    }
    float _3593 = _3373;
    float _3595 = _3593;
    if (_3551)
    {
        _3577 = _3583;
    }
    float _3597 = _3577;
    float _3599 = _3597;
    if (_3551)
    {
        _3579 = _3587;
    }
    float _3601 = _3579;
    float _3603 = _3601;
    if (!_3551)
    {
        _3585 = _3509;
    }
    float _3605 = _3585;
    float _3607 = _3521 * _3573;
    if (!_3551)
    {
        _3591 = _3507;
    }
    float _3609 = _3591;
    float _3611 = _3527 * _3573;
    if (_3551)
    {
        _3581 = _3593;
    }
    float _3613 = _3581;
    float _3615 = _3613;
    if (!_3551)
    {
        float _3617 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3605);
        _3599 = _3617;
    }
    float _3619 = _3599;
    if (!_3551)
    {
        _3595 = _3511;
    }
    float _3621 = _3595;
    float _3623 = fma(_3463, _3547, _3563);
    float _3625 = _3539 * _3573;
    float _3627 = _3493 * _3607;
    float _3629 = _3495 * _3611;
    float _3631 = _3559 * _3609;
    if (!_3551)
    {
        float _3633 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3609);
        _3603 = _3633;
    }
    float _3635 = _3603;
    float _3637 = -_3627;
    float _3639 = fma(_3495, _3625, _3637);
    float _3641 = -_3629;
    float _3643 = fma(_3491, _3607, _3641);
    float _3645 = -_3631;
    float _3647 = fma(_3555, _3621, _3645);
    float _3649 = _3557 * _3621;
    float _3651 = _3555 * _3605;
    float _3653 = _3639 * _3589;
    float _3655 = _3643 * _3589;
    if (!_3551)
    {
        float _3657 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3621);
        _3615 = _3657;
    }
    float _3659 = _3615;
    float _3661 = fma(_3453, _3547, _3575);
    float _3663 = -_3649;
    float _3665 = fma(_3559, _3605, _3663);
    float _3667 = -_3651;
    float _3669 = fma(_3557, _3609, _3667);
    float _3671 = fma(_3611, _3623, _3653);
    float _3673 = fma(_3625, _3623, _3655);
    float _3675 = _3665 * _3561;
    float _3677 = _3491 * _3625;
    float _3679 = fma(_3491, _3661, _3671);
    float _3681 = fma(_3493, _3661, _3673);
    float _3683 = _3647 * _3561;
    float _3685 = _3669 * _3561;
    float _3687 = -_3677;
    float _3689 = fma(_3493, _3611, _3687);
    float _3691 = _2137 + _3679;
    float _3693 = _2147 + _3681;
    float _3695 = _3445 * _3639;
    float _3697 = _3445 * _3689;
    float _3699 = _3445 * _3643;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3703 = _3691 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3707 = _3693 + _3705;
    float _3709 = _3457 * _3639;
    float _3711 = _3471 * _3639;
    float _3713 = _3703 * _3703;
    float _3715 = _3707 * _3707;
    float _3717 = _3457 * _3689;
    float _3719 = _3457 * _3643;
    float _3721 = _3471 * _3643;
    float _3723 = _3713 + _3715;
    float _3725 = _3471 * _3689;
    float _3727 = fma(_3461, _3611, _3695);
    float _3729 = fma(_3461, _3607, _3697);
    float _3731 = fma(_3461, _3625, _3699);
    float _3733 = _3689 * _3589;
    float _3735 = sqrt(_3723);
    float _3737 = fma(_3463, _3611, _3711);
    float _3739 = -_3397;
    float _3741 = fma(_3739, _3611, _3709);
    float _3743 = fma(_3607, _3623, _3733);
    float _3745 = -_3397;
    float _3747 = fma(_3745, _3607, _3717);
    float _3749 = -_3397;
    float _3751 = fma(_3749, _3625, _3719);
    float _3753 = fma(_3463, _3625, _3721);
    float _3755 = fma(_3463, _3607, _3725);
    float _3757 = fma(_3495, _3661, _3743);
    float _3759 = fma(_3459, _3491, _3741);
    float _3761 = fma(_3459, _3495, _3747);
    float _3763 = fma(_3459, _3493, _3751);
    float _3765 = _2135 + _3757;
    float _3767 = fma(_3467, _3491, _3727);
    float _3769 = fma(_3467, _3495, _3729);
    float _3771 = fma(_3453, _3491, _3737);
    bool _3773 = _3735 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3775 = fma(_3453, _3495, _3755);
    float _3777 = fma(_3467, _3493, _3731);
    float _3779 = fma(_3453, _3493, _3753);
    float _3781 = _3759 * _3557;
    float _3783 = _3761 * _3557;
    float _3785 = _3763 * _3557;
    float _3787 = _3759 * _3619;
    float _3789 = _3683 * _3759;
    float _3791 = _3761 * _3619;
    float _3793 = _3763 * _3619;
    float _3795 = _3683 * _3761;
    float _3797 = _3683 * _3763;
    float _3799 = _3759;
    float _3801 = _3713;
    float _3803 = _3715;
    float _3805 = _3691;
    float _3807 = _3693;
    float _3809 = _3659;
    if (!_3773)
    {
        _3799 = _3765;
    }
    float _3811 = _3799;
    bool _3813 = !_3773;
    float _3815 = _3811;
    if (!_3813)
    {
        float _3817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3821 = _3735 + _3819;
        float _3823 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3825 = rsqrt(_3723);
        float _3827 = _3821 * _3817;
        float _3829 = _3827 * 0.15915493667125701904296875;
        float _3831 = _3829 * 6.283185482025146484375;
        float _3833 = sin(_3831);
        float _3835 = _3829 * 6.283185482025146484375;
        float _3837 = cos(_3835);
        float _3839 = fma(_3833, _3823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3841 = _3825 * _3839;
        float _3843 = _3837 + (-1.0);
        float _3845 = fma(_3703, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3847 = fma(_3707, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3849 = _3843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3853 = _3845 + _3851;
        float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3857 = _3847 + _3855;
        float _3859 = fma(_3765, _3837, _3849);
        float _3861 = _3853 * _3853;
        float _3863 = _3857 * _3857;
        _3815 = _3859;
        _3801 = _3861;
        _3803 = _3863;
        _3805 = _3845;
        _3807 = _3847;
    }
    float _3865 = _3815;
    float _3867 = _3801;
    float _3869 = _3803;
    float _3871 = _3805;
    float _3873 = _3807;
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3877 = _3865 + _3875;
    float _3879 = fma(_3767, _3555, _3781);
    float _3881 = fma(_3769, _3555, _3783);
    float _3883 = fma(_3767, _3635, _3787);
    float _3885 = fma(_3877, _3877, _3867);
    float _3887 = fma(_3769, _3635, _3791);
    float _3889 = fma(_3777, _3555, _3785);
    float _3891 = fma(_3675, _3767, _3789);
    float _3893 = _3885 + _3869;
    float _3895 = fma(_3777, _3635, _3793);
    float _3897 = fma(_3675, _3769, _3795);
    float _3899 = fma(_3675, _3777, _3797);
    float _3901 = fma(_3771, _3559, _3879);
    float _3903 = fma(_3775, _3559, _3881);
    float _3905 = sqrt(_3893);
    float _3907 = fma(_3771, _3659, _3883);
    float _3909 = fma(_3775, _3659, _3887);
    float _3911 = fma(_3779, _3559, _3889);
    float _3913 = fma(_3685, _3771, _3891);
    float _3915 = fma(_3685, _3775, _3897);
    float _3917 = fma(_3685, _3779, _3899);
    float _3919 = fma(_3779, _3659, _3895);
    out.m_77.x = _3901;
    out.m_77.y = _3903;
    out.m_77.z = _3911;
    out.m_79.x = _3913;
    out.m_79.y = _3915;
    out.m_79.z = _3917;
    out.m_81.x = _3907;
    out.m_81.y = _3909;
    out.m_81.z = _3919;
    bool _3921 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3923 = isnan(_3905);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3929 = _3925 || _3927;
    float _3931 = _3897;
    float _3933 = _3913;
    if (!_3929)
    {
        _3809 = 1.0;
    }
    float _3935 = _3809;
    bool _3937 = !_3929;
    float _3939 = _3935;
    if (!_3937)
    {
        bool _3941 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3943 = isnan(_3905);
        bool _3945 = _3941 || _3943;
        bool _3947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3949 = _3945 || _3947;
        if (!_3949)
        {
            float _3951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3953 = _3905 + _3951;
            float _3955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3955;
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3963 = 1.0 / _3957;
            float _3965 = _3953 * _3963;
            float _3967 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3939 = _3967;
            _3969 = true;
        }
        else
        {
            bool _3971 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3973 = isnan(_3905);
            bool _3975 = _3971 || _3973;
            bool _3977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3979 = _3975 || _3977;
            if (!_3979)
            {
                float _3981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3983 = _3905 + _3981;
                float _3985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3987 = _3985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3991 = _3989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3993 = 1.0 / _3987;
                float _3995 = _3983 * _3993;
                float _3997 = fma(_3995, _3991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3939 = _3997;
                _3969 = true;
            }
            else
            {
                _3939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3969 = false;
    float _3999 = _3939;
    float _4001 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4003 = _3865 + _4001;
    float _4005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4007 = _3871 + _4005;
    float _4009 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4013 = _3873 + _4011;
    float _4015 = fma(_4007, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4017 = -_3279;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4009);
    float _4021 = fma(_4013, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4023 = -_3281;
    float _4025 = fma(_4023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4015);
    float _4027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4029 = _4019 + _4027;
    float _4031 = -_3293;
    float _4033 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4021);
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _4025 + _4035;
    float _4039 = _4029 * _4029;
    float _4041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4043 = _4033 + _4041;
    float _4045 = fma(_4037, _4037, _4039);
    float _4047 = fma(_4043, _4043, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4043 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4049;
    float _4073 = _4061;
    float _4075 = _4069;
    float _4077 = _4029;
    float _4079 = _4051;
    float _4081 = _4053;
    if (_4065)
    {
        float _4083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4083;
    }
    float _4085 = _4071;
    if (_4065)
    {
        float _4087 = rsqrt(_4061);
        _4073 = _4087;
    }
    float _4089 = _4073;
    if (_4065)
    {
        float _4091 = _4069 * _4085;
        _4075 = _4091;
    }
    float _4093 = _4075;
    if (_4065)
    {
        float _4095 = _4093 * 0.15915493667125701904296875;
        _3931 = _4095;
    }
    float _4097 = _3931;
    float _4099 = _4085;
    if (_4065)
    {
        float _4101 = _4097 * 6.283185482025146484375;
        float _4103 = sin(_4101);
        _4099 = _4103;
    }
    float _4105 = _4099;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4109 = precise::max(0.0, _4107);
    float _4111 = _4043;
    float _4113 = _4109;
    if (_4065)
    {
        float _4115 = _4097 * 6.283185482025146484375;
        float _4117 = cos(_4115);
        _4111 = _4117;
    }
    float _4119 = _4111;
    float _4121 = -_4051;
    float _4123 = -_4109;
    float _4125 = fma(_4029, _4121, _4123);
    float _4127 = _4125;
    if (!_4065)
    {
        _4077 = _4057;
    }
    float _4129 = _4077;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4113 = _4133;
    }
    float _4135 = _4113;
    float _4137 = _4105;
    float _4139 = _4135;
    if (_4065)
    {
        float _4141 = fma(_4105, _4135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4137 = _4141;
    }
    float _4143 = _4137;
    float _4145 = _4143;
    float _4147 = _4119;
    if (_4065)
    {
        float _4149 = _4119 + (-1.0);
        _4139 = _4149;
    }
    float _4151 = _4139;
    if (_4065)
    {
        float _4153 = _4089 * _4143;
        _3933 = _4153;
    }
    float _4155 = _3933;
    if (!_4065)
    {
        _4145 = _4055;
    }
    float _4157 = _4145;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4079 = _4161;
    }
    float _4163 = _4079;
    if (_4065)
    {
        float _4165 = _4053 * _4155;
        _4081 = _4165;
    }
    float _4167 = _4081;
    if (_4065)
    {
        float _4169 = _4055 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    float _4173 = sqrt(_4047);
    if (_4065)
    {
        float _4175 = fma(_4125, _4119, _4163);
        _4127 = _4175;
    }
    float _4177 = _4127;
    if (_4065)
    {
        float _4179 = _4167 * _4167;
        _4131 = _4179;
    }
    float _4181 = _4131;
    if (!_4065)
    {
        _4147 = _4059;
    }
    float _4183 = _4147;
    float _4185 = _4183;
    if (_4065)
    {
        float _4187 = _4171 * _4171;
        _4185 = _4187;
    }
    float _4189 = _4185;
    float _4191 = fma(_4177, _4177, _4181);
    float _4193 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4195 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4191 + _4189;
    float _4199 = fma(_3291, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4203 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4205 = rsqrt(_4197);
    float _4207 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4193);
    float _4209 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4201);
    float _4211 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4203);
    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4215 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4213);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4221 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4209);
    float _4223 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4211);
    float _4225 = -_4217;
    float _4227 = _4225 + 1.0;
    float _4229 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4207);
    float _4231 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4219);
    float _4233 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4235 = _4223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4237 = _4229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4241 = abs(_4227);
    float _4243 = log2(_4241);
    float _4245 = _4205 * _4167;
    float _4247 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4249 = _4205 * _4177;
    float _4251 = _4205 * _4171;
    float _4253 = _4245 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4255 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4247);
    float _4257 = floor(_4199);
    float _4259 = -_4253;
    float _4261 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4259);
    float _4263 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4265 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4255);
    float _4267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4269 = -_4251;
    float _4271 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4261);
    float _4273 = _4237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4275 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4265);
    float _4277 = floor(_4263);
    float _4279 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4281 = -_4273;
    float _4283 = fma(_4281, _4267, 1.0);
    float _4285 = fma(_4271, -0.5, 0.5);
    float _4287 = fma(_4271, 0.5, 0.5);
    float _4289 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4291 = exp2(_4279);
    float _4293 = -_4257;
    float _4295 = _4199 + _4293;
    float _4297 = fma(_4287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4299 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4289);
    float _4301 = fma(_4287, _4297, -0.212114393711090087890625);
    float _4303 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4305 = 1.0 / _4275;
    float _4307 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4309 = fma(_4287, _4301, 1.570728778839111328125);
    float _4311 = _4249 + 1.0;
    float _4313 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4307);
    float _4315 = log2(_4283);
    float _4317 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = -_4249;
    float _4321 = fma(_4291, _4311, _4319);
    float _4323 = sqrt(_4285);
    float _4325 = _4315 * 0.693147182464599609375;
    float _4327 = -_4277;
    float _4329 = _4263 + _4327;
    float _4331 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4303);
    float _4333 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4335 = fma(_4321, 0.5, 0.5);
    float2 _11114 = float2(_4295, _4329);
    float _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11114, float2(0.0), isnan(_11114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11114, float2(0.0), isnan(_11114)), level(0.0)).x;
    float _4339 = _4331 * _4305;
    float _4341 = _4333 * _4305;
    float _4343 = _4323 * 0.636619746685028076171875;
    float _4345 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4347 = fma(_4339, 0.5, 0.5);
    float _4349 = fma(_4341, -0.5, 0.5);
    float _4351 = -_4309;
    float _4353 = fma(_4343, _4351, 1.0);
    float3 _11147 = float3(_4347, _4349, _4345);
    float _4355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11147, float3(0.0), isnan(_11147)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11147, float3(0.0), isnan(_11147)), level(0.0)).x;
    float3 _11158 = float3(_4347, _4349, _4345);
    float4 _4358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11158, float3(0.0), isnan(_11158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11158, float3(0.0), isnan(_11158)), level(0.0)).xyzw;
    float _4360 = _4358.x;
    float _4362 = _4358.y;
    float _4364 = _4358.z;
    float _4366 = _4358.w;
    float2 _11174 = float2(_4353, _4335);
    float3 _4370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11174, float2(0.0), isnan(_11174)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11174, float2(0.0), isnan(_11174)), level(0.0)).xyz;
    float _4372 = _4370.x;
    float _4374 = _4370.y;
    float _4376 = _4370.z;
    float _4378 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4380 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4382 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4384 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4386 = isnan(_4173);
    bool _4388 = _4384 || _4386;
    bool _4390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4392 = _4388 || _4390;
    float _4394 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4378);
    float _4396 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4380);
    float _4398 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4382);
    float _4400 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4402 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4394);
    float _4404 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4396);
    float _4406 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4398);
    float _4408 = _4402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4410 = _4404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4412 = exp2(_4400);
    float _4414 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4406);
    float _4416 = _4410 + _4408;
    float _4418 = in.m_83.x;
    float _4420 = _4414 + _4275;
    float _4422 = 1.0 / _4408;
    out.gl_Position.x = _4331;
    out.gl_Position.y = _4333;
    out.gl_Position.z = _4414;
    out.gl_Position.w = _4275;
    float _4424 = -_4412;
    float _4426 = _4424 + 1.0;
    float _4428 = _4426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4430 = _4416 * _4422;
    float _4432 = _4430 * 0.5;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4436 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4434);
    float _4438 = 1.0 / _4436;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4442 = _4438 * _4440;
    float _4444 = abs(_4442);
    float _4446 = log2(_4444);
    bool _4448 = _4442 <= 8000.0;
    bool _4450 = isnan(_4442);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(8000.0);
    bool _4456 = _4452 || _4454;
    float _4458 = float(_4456);
    float _4460 = _4446 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4462 = exp2(_4460);
    float _4464 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4466 = precise::clamp(_4464, 0.0, 1.0);
    float _4468 = fma(_4466, -2.0, 3.0);
    float _4470 = _4466 * _4466;
    float _4472 = _4470 * _4468;
    float _4474 = -_4472;
    float _4476 = _4474 + 1.0;
    float _4478 = fma(_4476, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4472);
    float _4480 = _4420 * 0.5;
    float _4482 = _4458 * _4478;
    out.m_85.z = _4480;
    out.m_85.w = _4275;
    float _4484 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4486 = _4275;
    float _4488 = _4480;
    if (!_4392)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4486;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4392)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4488;
    float _4498 = -_4337;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500 * _4484;
    float _4504 = precise::clamp(_4502, 0.0, 1.0);
    float _4506 = -_4504;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4510 = _4428 * _4355;
    float _4512 = -_4428;
    float _4514 = _4512 + 1.0;
    float _4516 = _4508 * _4418;
    float _4518 = _4366 * _4510;
    float _4520 = _4376 * _4510;
    float _4522 = _4366 * _4514;
    float _4524 = _4516 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4526 = fma(_4372, _4518, _4360);
    float _4528 = fma(_4374, _4518, _4362);
    float _4530 = fma(_4366, _4520, _4364);
    float _4532 = _4518;
    float _4534 = _4496;
    float _4536 = _4496;
    if (!_4392)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4538 = _4532;
    out.m_87.x = _4524;
    out.m_89.x = _4526;
    out.m_89.y = _4528;
    out.m_89.z = _4530;
    out.m_89.w = _4522;
    bool _4540 = !_4392;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        bool _4546 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4548 = isnan(_4173);
        bool _4550 = _4546 || _4548;
        bool _4552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4554 = _4550 || _4552;
        if (!_4554)
        {
            float _4556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4558 = _4173 + _4556;
            float _4560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4560;
            float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4566 = _4564 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4572 = 1.0 / _4562;
            float _4574 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4578 = _4558 * _4572;
            float _4580 = precise::clamp(_4578, 0.0, 1.0);
            float _4582 = fma(_4580, _4566, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4584 = fma(_4580, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4586 = fma(_4580, _4576, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4536 = _4584;
            _4494 = _4582;
            _4544 = _4586;
            _4588 = true;
        }
        else
        {
            bool _4590 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4592 = isnan(_4173);
            bool _4594 = _4590 || _4592;
            bool _4596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4598 = _4594 || _4596;
            if (!_4598)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4600 = _4492;
            _4494 = _4600;
            if (!_4598)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4602 = _4534;
            _4536 = _4602;
            if (!_4598)
            {
                _4542 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4604 = _4542;
            bool _4606 = !_4598;
            _4544 = _4604;
            if (!_4606)
            {
                bool _4608 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4610 = isnan(_4173);
                bool _4612 = _4608 || _4610;
                bool _4614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4616 = _4612 || _4614;
                if (!_4616)
                {
                    float _4618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4620 = _4173 + _4618;
                    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4622;
                    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4632 = _4630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4634 = 1.0 / _4624;
                    float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4640 = _4620 * _4634;
                    float _4642 = precise::clamp(_4640, 0.0, 1.0);
                    float _4644 = fma(_4642, _4628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4642, _4632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4642, _4638, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4536 = _4646;
                    _4494 = _4644;
                    _4544 = _4648;
                    _4588 = true;
                }
                else
                {
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4544 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4588 = false;
    float _4650 = _4536;
    float _4652 = _4494;
    float _4654 = _4544;
    float _4656 = _4650 * 0.586610972881317138671875;
    bool _4658 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4660 = fma(_4652, 0.298911988735198974609375, _4656);
    out.m_91.x = 0.0;
    float _4662 = fma(_4654, 0.114477999508380889892578125, _4660);
    float _4664 = -_4662;
    float _4666 = _4664 + _4652;
    float _4668 = -_4662;
    float _4670 = _4668 + _4650;
    float _4672 = -_4662;
    float _4674 = _4672 + _4654;
    float _4676 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4680 = fma(_4670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4682 = fma(_4674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    out.m_87.w = _4676;
    out.m_93.x = _4678;
    out.m_93.y = _4680;
    out.m_93.z = _4682;
    if (!_4658)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4684 = -_4019;
    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4688 = -_4025;
    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4692 = -_4033;
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4696 = _4686 * _4686;
    float _4698 = fma(_4690, _4690, _4696);
    float _4700 = fma(_4694, _4694, _4698);
    float _4702 = sqrt(_4700);
    float _4704 = rsqrt(_4700);
    float _4706 = -_4702;
    float _4708 = _4706 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4710 = _4708 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4712 = precise::clamp(_4710, 0.0, 1.0);
    float _4714 = _4690 * _4704;
    float _4716 = _4686 * _4704;
    float _4718 = abs(_4712);
    float _4720 = log2(_4718);
    float _4722 = _4694 * _4704;
    float _4724 = _4714 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4726 = _3909 * _4716;
    float _4728 = -_4716;
    float _4730 = -_4724;
    float _4732 = fma(_4728, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4730);
    float _4734 = fma(_3907, _4714, _4726);
    float _4736 = -_4722;
    float _4738 = fma(_4736, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4732);
    float _4740 = fma(_3919, _4722, _4734);
    float _4742 = precise::clamp(_4740, 0.0, 1.0);
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4746 = _4738 + _4744;
    float _4748 = _4720 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4752 = precise::clamp(_4750, 0.0, 1.0);
    float _4754 = exp2(_4748);
    float _4756 = _4754 * _4752;
    float _4758 = _4742 * _4756;
    float _4760 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4762 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4760;
    out.m_91.y = _4762;
    out.m_91.z = _4764;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4588 = false;
    bool _3969 = false;
    bool _528 = false;
    bool _412 = false;
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
        float _4821 = as_type<float>(_128);
        out.gl_Position.z = _4821;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4891 = as_type<float>(_166);
        out.gl_Position.z = _4891;
    }
    if (_158)
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _146 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_57.x;
    float _424 = in.m_57.y;
    float _426 = in.m_57.z;
    bool _428 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_420);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _446 = isnan(_420);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _420 + _460;
    float _464 = -_438;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _442;
    float _472 = _454 * _466;
    float _474 = -_454;
    float _476 = _474 + 1.0;
    float _478 = _390 * _426;
    float _480 = _388 * _424;
    float _482 = _458 * _470;
    float _484 = _386 * _422;
    float _486 = fma(_482, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _472;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _508 = !_468;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _146 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.x;
    bool _544 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = in.m_55.z;
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = in.m_55.y;
    float _564 = in.m_55.w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = float(_540);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _572 = int(_570);
    float _574 = in.m_61.x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _580 = _578 != 0;
    float _582 = float(uint(_560));
    float _584 = 1.0 / _568;
    int _586 = ~_560;
    int _588 = _586 + 1;
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _594 = int(_592);
    float _596 = float(_572);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _600 = _568;
    float _602 = _596;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_580)
    {
        _600 = 1.0;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_580)
    {
        _608 = 5.839270114898681640625;
    }
    float _610 = _608;
    bool _612 = _562 > 0.5;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _616 = int(_614);
    float _618 = _584 * _146;
    bool _620 = _564 > 0.5;
    float _622 = 1.0 / _582;
    float _624 = float(_594);
    float _626 = trunc(_618);
    int _628 = int(_626);
    float _630 = float(uint(_616));
    float _632 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _634 = int(_632);
    int _636 = as_type<int>(_622) + (-2);
    float _638 = 1.0 / _596;
    float _640 = float(uint(_628));
    float _642 = as_type<float>(_636) * _640;
    float _644 = 1.0 / _624;
    float _646 = float(uint(_634));
    float _648 = _624;
    float _650 = _564;
    if (_580)
    {
        _602 = 1.0;
    }
    float _652 = _602;
    float _654 = _652;
    if (!_580)
    {
        _654 = 1.2345600128173828125;
    }
    float _656 = _654;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = 1.0 / _630;
    if (_580)
    {
        _648 = 1.0;
    }
    float _664 = _648;
    float _666 = _638 * _146;
    float _668 = _664;
    float _670 = _638;
    if (!_580)
    {
        _668 = 7.345489978790283203125;
    }
    float _672 = _668;
    float _674 = _672;
    if (_580)
    {
        _670 = _542;
    }
    float _676 = _670;
    float _678 = _676;
    if (!_580)
    {
        _678 = _562;
    }
    float _680 = _678;
    float _682 = trunc(_642);
    float _684 = precise::max(_682, 0.0);
    uint _687 = uint(_684);
    float _689 = in.m_61.y;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _693 = _691 != 0;
    float _695 = _680 * _656;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _699 = _697 != 0;
    float _701 = 1.0 / _646;
    float _703 = trunc(_666);
    int _705 = int(_703);
    float _707 = _644 * _146;
    float _709 = _672 * _542;
    bool _711 = _699;
    if (_580)
    {
        _674 = _542;
    }
    float _713 = _674;
    float _715 = _713;
    if (!_580)
    {
        _715 = _556;
    }
    float _717 = _715;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc(_707);
    int _725 = int(_723);
    float _727 = -_689;
    float _729 = _727 + 1.0;
    float _731 = _717 * _610;
    int _733 = ~_560;
    int _735 = _733 + 1;
    int _737 = as_type<int>(_701) + (-2);
    int _739 = _612 ? as_type<int>(_729) : as_type<int>(_689);
    int _741 = _735 * int(_687);
    int _743 = _741 + _628;
    float _745 = float(uint(_705));
    float _747 = floor(_709);
    float _749 = _660 ? as_type<float>(_739) : _689;
    float _751 = _689;
    float _753 = _701;
    if (!_721)
    {
        _650 = _574;
    }
    float _755 = _650;
    float _757 = as_type<float>(_737) * _745;
    float _759 = float(uint(_743));
    float _761 = 0.0;
    float _763 = _755;
    int _765 = as_type<int>(_757);
    if (!_721)
    {
        _761 = _755;
    }
    float _767 = _761;
    float _769 = floor(_695);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = _767;
    if (_721)
    {
        _763 = _574;
    }
    float _777 = _763;
    float _779 = as_type<float>(_636) * _759;
    int _781 = as_type<int>(_662) + (-2);
    float _783 = float(uint(_725));
    float _785 = floor(_731);
    int _787 = _620 ? as_type<int>(_729) : as_type<int>(_689);
    int _789 = 0;
    float _791 = _777;
    if (_693)
    {
        float _793 = -_777;
        float _795 = _793 + 1.0;
        _789 = as_type<int>(_795);
    }
    int _797 = _789;
    bool _799 = _556 > 0.5;
    float _801 = as_type<float>(_781) * _783;
    float _803 = _699 ? as_type<float>(_787) : _689;
    float _805 = -_747;
    float _807 = _709 + _805;
    if (_773)
    {
        float _809 = _799 ? _729 : _689;
        _751 = _809;
    }
    float _811 = _751;
    float _813 = trunc(_757);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    if (_721)
    {
        bool _819 = _542 > 0.5;
        _711 = _819;
    }
    bool _821 = _711;
    int _823 = ~_634;
    int _825 = _823 + 1;
    int _827 = ~_616;
    int _829 = _827 + 1;
    if (!_693)
    {
        _753 = _777;
    }
    float _831 = _753;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_721)
    {
        float _841 = -_777;
        float _843 = _841 + 1.0;
        _765 = as_type<int>(_843);
    }
    int _845 = _765;
    if (_693)
    {
        float _847 = _799 ? as_type<float>(_797) : _777;
        _839 = _847;
    }
    float _849 = _839;
    float _851 = -_785;
    float _853 = _731 + _851;
    if (_721)
    {
        float _855 = _821 ? as_type<float>(_845) : _777;
        _775 = _855;
    }
    float _857 = _775;
    float _859 = -_769;
    float _861 = _695 + _859;
    float _863 = float(_112);
    float _865 = trunc(_779);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = float(_634);
    int _873 = _825 * int(_817);
    int _875 = _873 + _705;
    float _877 = float(_560);
    int _879 = _829 * int(_837);
    int _881 = _879 + _725;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = float(uint(_875));
    float _889 = 1.0 / _863;
    float _891 = float(_628);
    float _893 = as_type<float>(_737) * _887;
    bool _895 = _891 >= _877;
    bool _897 = isnan(_891);
    bool _899 = _895 || _897;
    bool _901 = isnan(_877);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = float(uint(_881));
    float _909 = trunc(_893);
    float _911 = precise::max(_909, 0.0);
    uint _913 = uint(_911);
    float _915 = _807 * _877;
    int _917 = int(_687) + int(_869);
    float _919 = _877 * _146;
    float _921 = as_type<float>(_781) * _907;
    float _923 = float(_705);
    float _925 = float(_616);
    float _927 = _889 * _146;
    float _929 = float(_725);
    float _931 = trunc(_921);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _923 >= _871;
    bool _939 = isnan(_923);
    bool _941 = _937 || _939;
    bool _943 = isnan(_871);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _871 * _861;
    float _951 = _919 * _889;
    float _953 = _871 * _927;
    float _955 = _925 * _927;
    bool _957 = _929 >= _925;
    bool _959 = isnan(_929);
    bool _961 = _957 || _959;
    bool _963 = isnan(_925);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = _925 * _853;
    int _971 = ~_634;
    int _973 = _971 + 1;
    int _975 = _588 * _917;
    int _977 = _975 + _628;
    int _979 = int(_817) + int(_913);
    float _981 = trunc(_915);
    int _983 = int(_981);
    bool _985 = !_885;
    int _987 = _985 ? 0 : 1;
    float _989 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = uint(_977) >= uint(_560);
    int _993 = int(_837) + int(_935);
    int _995 = _973 * _979;
    int _997 = _995 + _705;
    float _999 = trunc(_905);
    int _1001 = int(_999);
    bool _1003 = !_991;
    int _1005 = _1003 ? 0 : (-1);
    int _1007 = abs(_987);
    int _1009 = ~_917;
    int _1011 = _1009 + _1005;
    int _1013 = _1011 + 1;
    int _1015 = _983 * _1007;
    int _1017 = _1015 + _628;
    bool _1019 = uint(_997) >= uint(_634);
    int _1021 = _560 * _1013;
    int _1023 = _1021 + _628;
    int _1025 = ~_616;
    int _1027 = _1025 + 1;
    float _1029 = trunc(_951);
    int _1031 = int(_1029);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = _560 == 0;
    bool _1047 = !_1019;
    int _1049 = _1047 ? 0 : (-1);
    float _1051 = trunc(_947);
    int _1053 = int(_1051);
    bool _1055 = !_1039;
    int _1057 = _1055 ? 0 : 1;
    int _1059 = _1027 * _993;
    int _1061 = _1059 + _725;
    int _1063 = ~_1001;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    bool _1069 = !_1045;
    int _1071 = _1069 ? _1023 : (-1);
    int _1073 = ~_979;
    int _1075 = _1073 + _1049;
    int _1077 = _1075 + 1;
    float _1079 = trunc(_969);
    int _1081 = int(_1079);
    int _1083 = _560 + (-1);
    int _1085 = _1071 * _1067;
    int _1087 = abs(_1057);
    int _1089 = _634 * _1077;
    int _1091 = _1089 + _705;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1095 = _1093 != 0;
    int _1097 = _1001 * _1083;
    int _1099 = _1097 + _1085;
    bool _1101 = !_1035;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_949);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _1099 * _1087;
    bool _1115 = uint(_1061) >= uint(_616);
    bool _1117 = !_1043;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = abs(_1103);
    float _1123 = trunc(_967);
    int _1125 = int(_1123);
    int _1127 = abs(_1111);
    int _1129 = abs(_1119);
    bool _1131 = !_1115;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = _1107 * _1127;
    int _1137 = _1135 + _705;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1141 = _1139 != 0;
    float _1143 = trunc(_955);
    int _1145 = int(_1143);
    int _1147 = ~_993;
    int _1149 = _1147 + _1133;
    int _1151 = _1149 + 1;
    int _1153 = _1031 * _1121;
    int _1155 = _1153 + _1113;
    bool _1157 = !_1141;
    int _1159 = _1157 ? 0 : 1;
    int _1161 = _616 * _1151;
    int _1163 = _1161 + _725;
    bool _1165 = _634 == 0;
    int _1167 = _1017 * _1129;
    int _1169 = _1167 + _1155;
    int _1171 = abs(_1159);
    float _1173 = trunc(_953);
    int _1175 = int(_1173);
    int _1177 = ~_1053;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1165;
    int _1185 = _1183 ? _1091 : (-1);
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1189 = _1187 != 0;
    int _1191 = _634 + (-1);
    int _1193 = _1181 * _1185;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1201 = _1199 != 0;
    int _1203 = _983 * _1171;
    int _1205 = _1203 + _1169;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    int _1211 = _1053 * _1191;
    int _1213 = _1211 + _1193;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = float(uint(_1205));
    int _1221 = abs(_1209);
    int _1223 = abs(_1217);
    float _1225 = as_type<float>(_636) * _1219;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = float(uint(_1017));
    float _1237 = trunc(_1225);
    float _1239 = precise::max(_1237, 0.0);
    uint _1241 = uint(_1239);
    int _1243 = _1081 * _1221;
    int _1245 = _1243 + _725;
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = as_type<float>(_636) * _1235;
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1213 * _1223;
    int _1259 = abs(_1249);
    int _1261 = abs(_1255);
    float _1263 = trunc(_1251);
    float _1265 = precise::max(_1263, 0.0);
    uint _1267 = uint(_1265);
    bool _1269 = !_1233;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = _1175 * _1259;
    int _1275 = _1273 + _1257;
    bool _1277 = _616 == 0;
    int _1279 = ~_560;
    int _1281 = _1279 + 1;
    int _1283 = abs(_1271);
    int _1285 = _1137 * _1261;
    int _1287 = _1285 + _1275;
    int _1289 = ~_1125;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1281 * int(_1241);
    int _1297 = _1295 + _1205;
    bool _1299 = !_1277;
    int _1301 = _1299 ? _1163 : (-1);
    int _1303 = _1107 * _1283;
    int _1305 = _1303 + _1287;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1317 = _536 + _1315;
    int _1319 = ~_560;
    int _1321 = _1319 + 1;
    int _1323 = _1293 * _1301;
    float _1325 = float(uint(_1297));
    bool _1327 = !_1313;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = _1321 * int(_1267);
    int _1333 = _1331 + _1017;
    float _1335 = float(uint(_1305));
    float _1337 = as_type<float>(_636) * _1325;
    int _1339 = _616 + (-1);
    int _1341 = abs(_1329);
    float _1343 = as_type<float>(_737) * _1335;
    bool _1345 = !_1309;
    int _1347 = _1345 ? 0 : 1;
    int _1349 = _1125 * _1339;
    int _1351 = _1349 + _1323;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = float(uint(_1333));
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1363 = _1361 != 0;
    int _1365 = _1351 * _1341;
    int _1367 = abs(_1347);
    float _1369 = as_type<float>(_636) * _1359;
    int _1371 = ~_634;
    int _1373 = _1371 + 1;
    float _1375 = trunc(_1343);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1383 = _1381 != 0;
    int _1385 = _1145 * _1367;
    int _1387 = _1385 + _1365;
    bool _1389 = !_1363;
    int _1391 = _1389 ? 0 : 1;
    bool _1393 = !_1383;
    int _1395 = _1393 ? 0 : 1;
    int _1397 = abs(_1391);
    int _1399 = abs(_1395);
    float _1401 = trunc(_1369);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = int(_1241) + int(_1357);
    int _1409 = _1245 * _1397;
    int _1411 = _1409 + _1387;
    int _1413 = ~_560;
    int _1415 = _1413 + 1;
    int _1417 = _1373 * int(_1379);
    int _1419 = _1417 + _1305;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1423 = _1421 != 0;
    int _1425 = _1081 * _1399;
    int _1427 = _1425 + _1411;
    float _1429 = float(uint(_1137));
    float _1431 = float(uint(_1419));
    int _1433 = _1415 * _1407;
    int _1435 = _1433 + _1205;
    float _1437 = float(uint(_1427));
    float _1439 = as_type<float>(_737) * _1429;
    bool _1441 = _562 > 0.5;
    float _1443 = as_type<float>(_737) * _1431;
    bool _1445 = uint(_1435) >= uint(_560);
    float _1447 = as_type<float>(_781) * _1437;
    int _1449 = int(_1267) + int(_1405);
    float _1451 = trunc(_1443);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    bool _1457 = !_1445;
    int _1459 = _1457 ? 0 : (-1);
    int _1461 = _1415;
    if (_1423)
    {
        float _1463 = -_777;
        float _1465 = _1463 + 1.0;
        _1461 = as_type<int>(_1465);
    }
    int _1467 = _1461;
    float _1469 = float(uint(_1245));
    int _1471 = ~_1407;
    int _1473 = _1471 + _1459;
    int _1475 = _1473 + 1;
    if (_1423)
    {
        float _1477 = _1441 ? as_type<float>(_1467) : _777;
        _791 = _1477;
    }
    float _1479 = _791;
    float _1481 = trunc(_1447);
    float _1483 = precise::max(_1481, 0.0);
    uint _1485 = uint(_1483);
    float _1487 = as_type<float>(_781) * _1469;
    int _1489 = _560 * _1475;
    int _1491 = _1489 + _1205;
    bool _1493 = _560 == 0;
    int _1495 = ~_616;
    int _1497 = _1495 + 1;
    int _1499 = ~_634;
    int _1501 = _1499 + 1;
    float _1503 = trunc(_1487);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? _1491 : (-1);
    int _1513 = _1511 & 3;
    bool _1515 = _1513 != 0;
    int _1517 = int(_1379) + int(_1455);
    int _1519 = _1497 * int(_1485);
    int _1521 = _1519 + _1427;
    float _1523 = trunc(_1439);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    bool _1529 = uint(_1513) > 1u;
    int _1531 = ~_616;
    int _1533 = _1531 + 1;
    int _1535 = _1501 * _1517;
    int _1537 = _1535 + _1305;
    float _1539 = float(uint(_1521));
    int _1541 = _1511 & 3;
    bool _1543 = _1541 != 0;
    int _1545 = ~_634;
    int _1547 = _1545 + 1;
    float _1549 = as_type<float>(_781) * _1539;
    int _1551 = _1533 * int(_1507);
    int _1553 = _1551 + _1245;
    int _1555 = _1543 ? 0 : 1;
    bool _1557 = uint(_1537) >= uint(_634);
    float _1559 = trunc(_1549);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = ~_560;
    int _1567 = _1565 + 1;
    int _1569 = _1547 * int(_1527);
    int _1571 = _1569 + _1137;
    float _1573 = float(uint(_1553));
    bool _1575 = !_1557;
    int _1577 = _1575 ? 0 : (-1);
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    float _1585 = as_type<float>(_781) * _1573;
    int _1587 = _1583;
    int _1589 = _1567;
    if (!_1529)
    {
        int _1591 = ~_1555;
        int _1593 = _1591 + 1;
        _1587 = _1593;
    }
    int _1595 = _1587;
    bool _1597 = _1513 != 3;
    float _1599 = trunc(_1585);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    int _1605 = ~_1517;
    int _1607 = _1605 + _1577;
    int _1609 = _1607 + 1;
    int _1611 = _1567 * _1449;
    int _1613 = _1611 + _1017;
    float _1615 = float(uint(_1571));
    bool _1617 = uint(_1513) >= 2u;
    int _1619 = _634 * _1609;
    int _1621 = _1619 + _1305;
    int _1623 = int(_1485) + int(_1563);
    float _1625 = as_type<float>(_737) * _1615;
    int _1627 = _1617 ? 0 : 1;
    bool _1629 = uint(_1613) >= uint(_560);
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = !_1165;
    int _1639 = _1637 ? _1621 : (-1);
    int _1641 = ~_1627;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    int _1647 = _1645;
    if (_1597)
    {
        int _1649 = ~_1627;
        int _1651 = _1649 + 1;
        _1647 = _1651;
    }
    int _1653 = _1647;
    int _1655 = ~_616;
    int _1657 = _1655 + 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1661 = _1659 != 0;
    bool _1663 = !_1629;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1657 * _1623;
    int _1669 = _1667 + _1427;
    int _1671 = _1639 & 3;
    bool _1673 = _1671 != 0;
    bool _1675 = !_1661;
    int _1677 = _1675 ? 0 : 1;
    bool _1679 = uint(_1671) >= 2u;
    int _1681 = _1673 ? 0 : 1;
    int _1683 = _1679 ? 0 : 1;
    bool _1685 = uint(_1669) >= uint(_616);
    int _1687 = ~_634;
    int _1689 = _1687 + 1;
    bool _1691 = _1671 != 3;
    int _1693 = int(_1527) + int(_1635);
    bool _1695 = !_1685;
    int _1697 = _1695 ? 0 : (-1);
    bool _1699 = uint(_1671) > 1u;
    int _1701 = ~_1623;
    int _1703 = _1701 + _1697;
    int _1705 = _1703 + 1;
    int _1707 = _1689 * _1693;
    int _1709 = _1707 + _1137;
    int _1711 = ~_1683;
    int _1713 = _1711 + 1;
    int _1715 = _1713 + 1;
    int _1717 = _616 * _1705;
    int _1719 = _1717 + _1427;
    int _1721 = _1715;
    if (_1691)
    {
        int _1723 = ~_1683;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    bool _1729 = uint(_1709) >= uint(_634);
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = int(_1507) + int(_1603);
    float _1741 = _542 * 2.0;
    bool _1743 = !_1277;
    int _1745 = _1743 ? _1719 : (-1);
    float _1747 = 1.0 / _1733;
    int _1749 = ~_1681;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1753;
    if (!_1699)
    {
        int _1757 = ~_1681;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = !_1729;
    int _1765 = _1763 ? 0 : (-1);
    int _1767 = _1639 & 3;
    bool _1769 = _1767 != 0;
    float _1771 = floor(_1741);
    int _1773 = _1745 & 3;
    bool _1775 = _1773 != 0;
    float _1777 = _562 * 2.0;
    bool _1779 = !_1769;
    int _1781 = _1779 ? 0 : 1;
    bool _1783 = _1773 != 3;
    bool _1785 = !_1515;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = floor(_1777);
    float _1791 = _1777;
    if (_1737)
    {
        _604 = 0;
    }
    int _1793 = _604;
    bool _1795 = uint(_1773) >= 2u;
    int _1797 = ~_616;
    int _1799 = _1797 + 1;
    int _1801 = _1793;
    if (!_1737)
    {
        _1801 = 1;
    }
    int _1803 = _1801;
    bool _1805 = uint(_1773) > 1u;
    int _1807 = _1799 * _1739;
    int _1809 = _1807 + _1245;
    int _1811 = _1795 ? 0 : 1;
    bool _1813 = _1803 != 1;
    int _1815 = ~_1811;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1819;
    if (_1783)
    {
        int _1823 = ~_1811;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1775 ? 0 : 1;
    int _1831 = _1745 & 3;
    bool _1833 = _1831 != 0;
    bool _1835 = uint(_1809) >= uint(_616);
    bool _1837 = _1771 > 0.0;
    bool _1839 = !_1833;
    int _1841 = _1839 ? 0 : 1;
    bool _1843 = _1771 >= 0.0;
    bool _1845 = isnan(_1771);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan(0.0);
    bool _1851 = _1847 || _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    bool _1857 = !_1835;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = ~_1829;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    float _1867 = _1855 * _1747;
    bool _1869 = _1789 > 0.0;
    int _1871 = _1865;
    float _1873 = _1771;
    if (!_1805)
    {
        int _1875 = ~_1829;
        int _1877 = _1875 + 1;
        _1871 = _1877;
    }
    int _1879 = _1871;
    float _1881 = fma(_1867, _1317, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1883 = _1513 != 3;
    float _1885 = _542 + _562;
    float _1887 = 0.0;
    if (!_1813)
    {
        _1887 = _562;
    }
    float _1889 = _1887;
    int _1891 = _1851 ? 0 : 1;
    float _1893 = _1885 + (-1.0);
    bool _1895 = _1789 >= 0.0;
    bool _1897 = isnan(_1789);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1889;
    if (!_1813)
    {
        _1873 = _556;
    }
    float _1907 = _1873;
    float _1909 = _1907;
    if (!_1813)
    {
        _1791 = _1889;
    }
    float _1911 = _1791;
    float _1913 = 0.0;
    float _1915 = _1911;
    if (!_1813)
    {
        _1913 = _556;
    }
    float _1917 = _1913;
    int _1919 = ~_1891;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = _1917;
    int _1927 = _1923;
    if (_1813)
    {
        _1915 = _542;
    }
    float _1929 = _1915;
    if (_1813)
    {
        _1905 = _542;
    }
    float _1931 = _1905;
    if (_1813)
    {
        _1909 = _562;
    }
    float _1933 = _1909;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1813)
    {
        _1925 = _562;
    }
    float _1937 = _1925;
    if (!_1837)
    {
        int _1939 = ~_1891;
        int _1941 = _1939 + 1;
        _1927 = _1941;
    }
    int _1943 = _1927;
    bool _1945 = _1773 != 3;
    int _1947 = _1903 ? 0 : 1;
    bool _1949 = _1671 != 3;
    if (_1737)
    {
        _1589 = 0;
    }
    int _1951 = _1589;
    float _1953 = in.m_48.x;
    float _1955 = in.m_48.y;
    float _1957 = in.m_48.z;
    int _1959 = _1951;
    if (!_1737)
    {
        _1959 = 2;
    }
    int _1961 = _1959;
    bool _1963 = !_1883;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = ~_1947;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    bool _1973 = !_1945;
    int _1975 = _1973 ? 0 : (-1);
    bool _1977 = !_1949;
    int _1979 = _1977 ? 0 : (-1);
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1983 = _1981 != 0;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1991 = _1989 != 0;
    int _1993 = _1971;
    if (!_1869)
    {
        int _1995 = ~_1947;
        int _1997 = _1995 + 1;
        _1993 = _1997;
    }
    int _1999 = _1993;
    float _2001 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2009 = _2007 != 0;
    bool _2011 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2013 = isnan(_536);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _556 * 2.0;
    float _2025 = -_2021;
    float _2027 = _2025 + 1.0;
    bool _2029 = !_1983;
    int _2031 = _2029 ? 0 : 1;
    float _2033 = floor(_2023);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2037 = _1961 != 2;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2041 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2043 = fma(_989, -2.0, _2035);
    float _2045 = _554 * _2027;
    float _2047 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2049 = -_2039;
    float _2051 = fma(_2001, 2.0, _2049);
    float _2053 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2055 = _562 + _556;
    float _2057 = _1881 * _2045;
    float _2059 = -_554;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2041);
    float _2065 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2047);
    float _2067 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2053);
    bool _2069 = _2033 >= 0.0;
    bool _2071 = isnan(_2033);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = _2055 + (-1.0);
    float _2081 = fma(_2061, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2057);
    float _2083 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2085 = _2077 ? 0 : 1;
    float _2087 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2089 = _2033 > 0.0;
    float _2091 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2065);
    float _2093 = _2033;
    if (_2037)
    {
        _2093 = _542;
    }
    float _2095 = _2093;
    float _2097 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2063);
    float _2099 = _2095;
    if (!_2037)
    {
        _2099 = _556;
    }
    float _2101 = _2099;
    float _2103 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2067);
    float _2105 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2081);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2113 = _1511 >> 31;
    float _2115 = -_2107;
    float _2117 = fma(_2109, 2.0, _2115);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2125 = _2113 & 3;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _1511 + _2125;
    float _2135 = _2097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2137 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2139 = _2133 >> 2;
    out.m_63.x = _2127;
    out.m_63.y = _2129;
    out.m_63.z = _2131;
    out.m_63.w = _2111;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2143 = _2139 << 4;
    int _2145 = _2143 + 368;
    float _2147 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2149 = !_1987;
    int _2151 = _2149 ? 0 : 1;
    float _2153 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2141);
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2157 = !_1991;
    int _2159 = _2157 ? 0 : 1;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2137 + _2161;
    int _2165 = ~_2085;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    float _2171 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2155);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2175 = _2135 + _2173;
    int _2177 = _2169;
    if (!_2089)
    {
        int _2179 = ~_2085;
        int _2181 = _2179 + 1;
        _2177 = _2181;
    }
    int _2183 = _2177;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2187 = _2147 + _2185;
    int _2189 = _1639 >> 31;
    float _2191 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2193 = _1745 >> 31;
    float _2195 = -_146;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2051);
    int _2199 = _2189 & 3;
    float _2201 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2191);
    int _2203 = _2193 & 3;
    float _2205 = -_146;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2117);
    uint _2209 = uint(int(uint(_2145) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2201);
    int _2227 = _1745 + _2203;
    float _2229 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2171);
    int _2231 = abs(_2151);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2235 = _2227 >> 2;
    float _2237 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2153);
    int _2239 = abs(_2159);
    float _2241 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2243 = _2235 << 4;
    int _2245 = _2243 + 656;
    int _2247 = _1639 + _2199;
    float _2249 = fma(_2241, -2.0, _2233);
    uint _2251 = uint(int(uint(_2245) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = float(_1943);
    float _2269 = float(_1999);
    float _2271 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2249);
    float _2273 = float(_2231);
    float _2275 = float(_2239);
    int _2277 = _2247 >> 2;
    int _2279 = abs(_2031);
    float _2281 = _2273 * _2267;
    int _2283 = _2277 << 4;
    int _2285 = _2283 + 512;
    float _2287 = _2275 * _2269;
    int _2289 = _2245 + 8;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    uint _2293 = uint(int(uint(int(_2291)) >> uint(2)));
    int _2295 = int(_2291) & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    int _2299 = int(_2291) + 1;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    int _2303 = _2299 & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    bool _2307 = _2225 >= 0.0;
    float _2309 = _2281 * (-2.0);
    float _2311 = float(_2183);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2315 = abs(_1595);
    uint _2317 = uint(int(uint(_2285) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = -_2313;
    float _2335 = fma(_1935, 2.0, _2333);
    int _2337 = ~_1693;
    int _2339 = _2337 + _1765;
    int _2341 = _2339 + 1;
    int _2343 = ~_2315;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    float _2349 = -_146;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2335);
    int _2353 = ~_1449;
    int _2355 = _2353 + _1665;
    int _2357 = _2355 + 1;
    if (_2307)
    {
        out.m_51.x = 0.0;
    }
    int _2359 = _2145 + 8;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = ~_1739;
    int _2379 = _2377 + _1859;
    int _2381 = _2379 + 1;
    int _2383 = _2347 * as_type<int>(_2223);
    int _2385 = abs(_1761);
    int _2387 = _560 * _2357;
    int _2389 = _2387 + _1017;
    int _2391 = abs(_1879);
    int _2393 = _616 * _2381;
    int _2395 = _2393 + _1245;
    int _2397 = abs(_1787);
    int _2399 = _2285 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = _634 * _2341;
    int _2423 = _2421 + _1137;
    int _2425 = abs(_1841);
    int _2427 = ~_2397;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = abs(_1727);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2437 = int(_2435);
    int _2439 = ~_2391;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _2431 * as_type<int>(_2215);
    int _2447 = _2445 + _2383;
    int _2449 = abs(_1653);
    int _2451 = _2443 * as_type<int>(_2265);
    int _2453 = abs(_1827);
    int _2455 = ~_2425;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = ~_2453;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = abs(_1781);
    int _2469 = _2459 * as_type<int>(_2257);
    int _2471 = _2469 + _2451;
    int _2473 = ~_2385;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2481 = int(_2479);
    int _2483 = ~_2449;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    int _2489 = _2465 * as_type<int>(_2297);
    int _2491 = _2489 + _2471;
    int _2493 = abs(_1965);
    int _2495 = ~_2467;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2477 * as_type<int>(_2331);
    int _2503 = abs(_1677);
    int _2505 = ~_2493;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2499 * as_type<int>(_2323);
    int _2513 = _2511 + _2501;
    int _2515 = ~_2433;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2523 = log2(_2521);
    int _2525 = ~_2503;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    int _2531 = _2487 * as_type<int>(_2367);
    int _2533 = _2531 + _2447;
    float _2535 = float(uint(_2419));
    bool _2537 = _560 == 0;
    int _2539 = _2509 * as_type<int>(_2375);
    int _2541 = _2539 + _2533;
    float _2543 = float(uint(_2481));
    float _2545 = 1.0 / _2535;
    int _2547 = _2519 * as_type<int>(_2407);
    int _2549 = _2547 + _2513;
    int _2551 = abs(_1979);
    int _2553 = _2541 * _2529;
    int _2555 = abs(_1975);
    bool _2557 = !_2005;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2523 * _146;
    int _2563 = ~_2555;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = 1.0 / _2543;
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = abs(_2559);
    int _2579 = _2567 * as_type<int>(_2305);
    int _2581 = _2579 + _2491;
    bool _2583 = !_2009;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2575 * as_type<int>(_2415);
    int _2589 = _2587 + _2549;
    bool _2591 = !_2537;
    int _2593 = _2591 ? _2389 : (-1);
    float _2595 = exp2(_2561);
    int _2597 = ~_2577;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = abs(_2585);
    int _2605 = _2593 * _2503;
    int _2607 = _2605 + _2553;
    float _2609 = float(uint(_2437));
    int _2611 = _2601 * _2589;
    int _2613 = abs(_2437);
    int _2615 = abs(_2419);
    int _2617 = ~_2603;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    float _2623 = 1.0 / _2609;
    int _2625 = abs(_2481);
    float _2627 = float(uint(_2613));
    int _2629 = _2621 * _2581;
    float _2631 = float(uint(_2615));
    bool _2633 = _634 == 0;
    int _2635 = as_type<int>(_2545) + (-2);
    float _2637 = 1.0 / _2627;
    float _2639 = float(uint(_2607));
    float _2641 = float(uint(_2625));
    bool _2643 = !_1277;
    int _2645 = _2643 ? _2395 : (-1);
    bool _2647 = !_2633;
    int _2649 = _2647 ? _2423 : (-1);
    float _2651 = as_type<float>(_2635) * _2639;
    float _2653 = 1.0 / _2631;
    int _2655 = _2645 * _2603;
    int _2657 = _2655 + _2629;
    int _2659 = as_type<int>(_2569) + (-2);
    int _2661 = _2649 * _2577;
    int _2663 = _2661 + _2611;
    int _2665 = as_type<int>(_2623) + (-2);
    float _2667 = float(uint(_2657));
    float _2669 = in.m_65.x;
    float _2671 = in.m_65.y;
    float _2673 = in.m_65.z;
    float _2675 = 1.0 / _2641;
    float _2677 = float(uint(_2663));
    float _2679 = as_type<float>(_2659) * _2667;
    int _2681 = abs(_2663);
    int _2683 = abs(_2607);
    float _2685 = as_type<float>(_2665) * _2677;
    float _2687 = trunc(_2651);
    float _2689 = precise::max(_2687, 0.0);
    uint _2691 = uint(_2689);
    int _2693 = abs(_2657);
    int _2695 = as_type<int>(_2637) + (-2);
    float _2697 = float(uint(_2681));
    int _2699 = as_type<int>(_2653) + (-2);
    float _2701 = trunc(_2685);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = float(uint(_2683));
    float _2709 = as_type<float>(_2695) * _2697;
    int _2711 = ~_2419;
    int _2713 = _2711 + 1;
    int _2715 = as_type<int>(_2675) + (-2);
    float _2717 = as_type<float>(_2699) * _2707;
    float _2719 = float(uint(_2693));
    int _2721 = _2713 * int(_2691);
    int _2723 = _2721 + _2607;
    float _2725 = as_type<float>(_2553);
    float _2727 = _2653;
    if (_2037)
    {
        _2725 = _562;
    }
    float _2729 = _2725;
    float _2731 = trunc(_2679);
    float _2733 = precise::max(_2731, 0.0);
    uint _2735 = uint(_2733);
    float _2737 = as_type<float>(_2715) * _2719;
    float _2739 = _2729;
    if (!_2037)
    {
        _2739 = _542;
    }
    float _2741 = _2739;
    float _2743 = fma(_2309, _2671, _2671);
    float _2745 = float(_2279);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2307)
    {
        _2727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2749 = _2727;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2753 = float(uint(_2723));
    float _2755 = _2745 * _2311;
    float _2757 = trunc(_2717);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = ~_2437;
    int _2765 = _2763 + 1;
    float _2767 = fma(_2751, -2.0, _2747);
    int _2769 = as_type<int>(_2749);
    if (_2307)
    {
        float _2771 = _2749 * 5.0;
        _2769 = as_type<int>(_2771);
    }
    int _2773 = _2769;
    float _2775 = as_type<float>(_2635) * _2753;
    float _2777 = _2755 * (-2.0);
    float _2779 = trunc(_2737);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    if (_2307)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8634 = as_type<float>(_2773);
        out.gl_Position.z = _8634;
    }
    float _2785 = fma(_2083, _2777, _2083);
    float _2787 = fma(_2777, _2669, _2669);
    int _2789 = ~_2481;
    int _2791 = _2789 + 1;
    float _2793 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2767);
    int _2795 = ~_2613;
    int _2797 = _2795 + 1;
    float _2799 = trunc(_2709);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2615;
    int _2807 = _2805 + 1;
    int _2809 = _2765 * int(_2705);
    int _2811 = _2809 + _2663;
    float _2813 = trunc(_2775);
    float _2815 = precise::max(_2813, 0.0);
    uint _2817 = uint(_2815);
    int _2819 = ~_2625;
    int _2821 = _2819 + 1;
    int _2823 = _2791 * int(_2735);
    int _2825 = _2823 + _2657;
    float _2827 = float(uint(_2811));
    int _2829 = _2807 * int(_2761);
    int _2831 = _2829 + _2683;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2835 = 1.0 + _2833;
    int _2837 = _2821 * int(_2783);
    int _2839 = _2837 + _2693;
    float _2841 = float(uint(_2825));
    float _2843 = as_type<float>(_2665) * _2827;
    float _2845 = float(uint(_2831));
    int _2847 = _2797 * int(_2803);
    int _2849 = _2847 + _2681;
    float _2851 = float(uint(_2839));
    float _2853 = as_type<float>(_2659) * _2841;
    float _2855 = 1.0 / _2835;
    float _2857 = as_type<float>(_2699) * _2845;
    float _2859 = float(uint(_2849));
    float _2861 = as_type<float>(_2715) * _2851;
    float _2863 = -_2595;
    float _2865 = _2863 + 1.0;
    int _2867 = int(_2691) + int(_2817);
    float _2869 = as_type<float>(_2695) * _2859;
    float _2871 = trunc(_2843);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2879 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2043);
    bool _2881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2883 = isnan(1.0);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2889 = _2885 || _2887;
    float _2891 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _590);
    bool _2893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2895 = isnan(0.0);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2901 = _2897 || _2899;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2905 = trunc(_2853);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    int _2911 = ~_2419;
    int _2913 = _2911 + 1;
    float _2915 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _598);
    float _2917 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2903);
    float _2919 = _542 + (-0.5);
    float _2921 = _562 + (-0.5);
    int _2923 = _2913 * _2867;
    int _2925 = _2923 + _2607;
    float _2927 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2917);
    float _2929 = trunc(_2857);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2877);
    int _2937 = int(_2705) + int(_2875);
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2787);
    int _2941 = ~_2437;
    int _2943 = _2941 + 1;
    float _2945 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2935);
    float _2947 = _2901 ? _2865 : 0.0;
    float _2949 = trunc(_2869);
    float _2951 = precise::max(_2949, 0.0);
    uint _2953 = uint(_2951);
    bool _2955 = uint(_2925) >= uint(_2419);
    int _2957 = _2943 * _2937;
    int _2959 = _2957 + _2663;
    if (_2889)
    {
        float _2961 = _2947 * _2855;
        _148 = _2961;
    }
    float _2963 = _148;
    int _2965 = ~_2615;
    int _2967 = _2965 + 1;
    int _2969 = ~_2625;
    int _2971 = _2969 + 1;
    float _2973 = fma(_2785, _2963, _2939);
    float _2975 = trunc(_2861);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = int(_2761) + int(_2933);
    int _2983 = ~_2613;
    int _2985 = _2983 + 1;
    int _2987 = int(_2735) + int(_2909);
    int _2989 = _2967 * _2981;
    int _2991 = _2989 + _2683;
    int _2993 = ~_2481;
    int _2995 = _2993 + 1;
    int _2997 = int(_2803) + int(_2953);
    bool _2999 = uint(_2959) >= uint(_2437);
    int _3001 = _2995 * _2987;
    int _3003 = _3001 + _2657;
    bool _3005 = uint(_2991) >= uint(_2615);
    int _3007 = _2985 * _2997;
    int _3009 = _3007 + _2681;
    bool _3011 = !_2999;
    int _3013 = _3011 ? 0 : (-1);
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = int(_2783) + int(_2979);
    bool _3019 = uint(_3009) >= uint(_2613);
    bool _3021 = !_2955;
    int _3023 = _3021 ? 0 : (-1);
    int _3025 = _2971 * _3017;
    int _3027 = _3025 + _2693;
    bool _3029 = uint(_3003) >= uint(_2481);
    int _3031 = ~_2867;
    int _3033 = _3031 + _3023;
    int _3035 = _3033 + 1;
    bool _3037 = uint(_3027) >= uint(_2625);
    float _3039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3041 = ~_2937;
    int _3043 = _3041 + _3013;
    int _3045 = _3043 + 1;
    int _3047 = _2419 * _3035;
    int _3049 = _3047 + _2607;
    bool _3051 = !_3029;
    int _3053 = _3051 ? 0 : (-1);
    int _3055 = _2607 ^ _2419;
    int _3057 = _2437 * _3045;
    int _3059 = _3057 + _2663;
    bool _3061 = !_3005;
    int _3063 = _3061 ? 0 : (-1);
    int _3065 = ~_2987;
    int _3067 = _3065 + _3053;
    int _3069 = _3067 + 1;
    bool _3071 = _2437 == 0;
    int _3073 = _2663 ^ _2437;
    bool _3075 = _2419 == 0;
    float _3077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3079 = _2657 ^ _2481;
    int _3081 = _2481 * _3069;
    int _3083 = _3081 + _2657;
    bool _3085 = !_3071;
    int _3087 = _3085 ? _3059 : (-1);
    bool _3089 = !_3019;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = ~_3063;
    int _3095 = _2981 + _3093;
    int _3097 = _3095 + 1;
    float _3099 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3101 = !_3075;
    int _3103 = _3101 ? _3049 : (-1);
    float _3105 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3107 = float(_3087);
    float _3109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3111 = ~_3091;
    int _3113 = _2997 + _3111;
    int _3115 = _3113 + 1;
    float _3117 = fma(_3099, _857, -0.5);
    uint _3119 = uint(int(uint(_3055) >> uint(31)));
    float _3121 = fma(_3105, _849, -0.5);
    bool _3123 = _2481 == 0;
    float _3125 = fma(_3105, _3107, _2351);
    float _3127 = float(_3103);
    uint _3129 = uint(int(uint(_3073) >> uint(31)));
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3133 = ~int(_3119);
    int _3135 = _3133 + 1;
    float _3137 = fma(_3099, _3127, _2197);
    bool _3139 = !_3123;
    int _3141 = _3139 ? _3083 : (-1);
    float _3143 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3145 = ~int(_3129);
    int _3147 = _3145 + 1;
    float _3149 = fma(_2945, _3117, _3137);
    int _3151 = _3097 ^ _3135;
    float _3153 = fma(_3143, _1479, -0.5);
    bool _3155 = _2481 == 0;
    float _3157 = fma(_2229, _3121, _3125);
    float _3159 = float(_3141);
    bool _3161 = !_3037;
    int _3163 = _3161 ? 0 : (-1);
    uint _3165 = uint(int(uint(_3079) >> uint(31)));
    float _3167 = fma(_3143, _3159, _2207);
    int _3169 = _3115 ^ _3147;
    float _3171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3173 = _2419 == 0;
    float _3175 = fma(_2891, _3153, _3167);
    int _3177 = ~_3135;
    int _3179 = _3177 + _3151;
    int _3181 = _3179 + 1;
    float _3183 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3185 = ~_3163;
    int _3187 = _3017 + _3185;
    int _3189 = _3187 + 1;
    float _3191 = _2175 * _2175;
    int _3193 = ~int(_3165);
    int _3195 = _3193 + 1;
    float _3197 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3199 = _2437 == 0;
    float _3201 = fma(_749, _3183, -0.5);
    int _3203 = ~_3147;
    int _3205 = _3203 + _3169;
    int _3207 = _3205 + 1;
    float _3209 = fma(_2163, _2163, _3191);
    bool _3211 = !_3173;
    int _3213 = _3211 ? _3181 : (-1);
    float _3215 = fma(_803, _3197, -0.5);
    int _3217 = _3189 ^ _3195;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3221 = !_3199;
    int _3223 = _3221 ? _3207 : (-1);
    float _3225 = fma(_2087, _2309, _2087);
    float _3227 = float(_3213);
    float _3229 = fma(_3219, _811, -0.5);
    int _3231 = ~_3195;
    int _3233 = _3231 + _3217;
    int _3235 = _3233 + 1;
    float _3237 = float(_3223);
    float _3239 = -_2879;
    float _3241 = fma(_3183, _3227, _3239);
    bool _3243 = !_3155;
    int _3245 = _3243 ? _3235 : (-1);
    float _3247 = -_2271;
    float _3249 = fma(_3197, _3237, _3247);
    float _3251 = fma(_2187, _2187, _3209);
    float _3253 = float(_3245);
    float _3255 = fma(_2927, _3201, _3241);
    float _3257 = fma(_2237, _3215, _3249);
    float _3259 = _3149 + 0.5;
    float _3261 = -_2793;
    float _3263 = fma(_3219, _3253, _3261);
    float _3265 = rsqrt(_3251);
    float _3267 = _3175 + 0.5;
    float _3269 = _3255 + 0.5;
    float _3271 = fma(_2915, _3229, _3263);
    float _3273 = _3157 + 0.5;
    float _3275 = _3257 + 0.5;
    float _3277 = _3271 + 0.5;
    out.m_67.x = _3259;
    out.m_67.y = _3269;
    out.m_67.z = _3273;
    out.m_67.w = _3275;
    out.m_69.x = _3267;
    out.m_69.y = _3277;
    float _3279 = _2175 * _3265;
    float _3281 = _2163 * _3265;
    if (_2307)
    {
        return out;
    }
    float _3283 = -_3279;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2135);
    float _3287 = _2973 * 0.15915493667125701904296875;
    float _3289 = -_3281;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2137);
    float _3293 = _2187 * _3265;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3285 + _3295;
    float _3299 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2743);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3303 = _3291 + _3301;
    float _3305 = _3297 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3307 = _542 + _556;
    float _3309 = -_3293;
    float _3311 = fma(_3309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2147);
    float _3313 = _556 + (-0.5);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3305);
    float _3317 = _3307 + (-1.0);
    float _3319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3321 = _3311 + _3319;
    float _3323 = _2287 * (-2.0);
    float _3325 = -_3279;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2175);
    float _3329 = fma(_3317, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3315);
    float _3333 = fma(_3323, _2673, _2673);
    float _3335 = fma(_3225, _2963, _3299);
    float _3337 = fma(_3329, _3323, _3329);
    float _3339 = -_3281;
    float _3341 = fma(_3339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2163);
    bool _3343 = _3331 >= 0.0;
    float _3345 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3333);
    float _3347 = _3327 * _3327;
    float _3349 = _3335 * 0.15915493667125701904296875;
    float _3351 = -_3293;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    float _3355 = fma(_3337, _2963, _3345);
    float _3357 = fma(_3341, _3341, _3347);
    float _3359 = _3287 * 6.283185482025146484375;
    float _3361 = sin(_3359);
    float _3363 = _3355 * 0.15915493667125701904296875;
    float _3365 = fma(_3353, _3353, _3357);
    float _3367 = _3345;
    float _3369 = _3365;
    float _3371 = _3353;
    float _3373 = _3341;
    if (_3343)
    {
        _3367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3375 = _3367;
    int _3377 = as_type<int>(_3375);
    if (_3343)
    {
        out.m_51.x = 0.0;
    }
    float _3379 = _3287 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    if (_3343)
    {
        float _3383 = _3375 * 5.0;
        _3377 = as_type<int>(_3383);
    }
    int _3385 = _3377;
    float _3387 = _3349 * 6.283185482025146484375;
    float _3389 = sin(_3387);
    if (_3343)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9553 = as_type<float>(_3385);
        out.gl_Position.z = _9553;
    }
    float _3391 = _3349 * 6.283185482025146484375;
    float _3393 = cos(_3391);
    float _3395 = _3363 * 6.283185482025146484375;
    float _3397 = sin(_3395);
    float _3399 = _3361 * _3389;
    float _3401 = sqrt(_3365);
    float _3403 = _3381 * _3393;
    if (_3343)
    {
        return out;
    }
    float _3405 = -_2135;
    float _3407 = _3405 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3409 = -_2137;
    float _3411 = _3409 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3413 = -_2147;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3417 = in.m_71.x;
    float _3419 = in.m_71.y;
    float _3421 = in.m_71.z;
    float _3423 = _3407 * _3407;
    float _3425 = _3363 * 6.283185482025146484375;
    float _3427 = cos(_3425);
    float _3429 = _3265 * _3401;
    float _3431 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3433 = fma(_3411, _3411, _3423);
    float _3435 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3437 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3439 = fma(_3415, _3415, _3433);
    float _3441 = _3429 * _3431;
    float _3443 = _3429 * _3435;
    float _3445 = fma(_3397, _3403, _3399);
    float _3447 = rsqrt(_3439);
    float _3449 = _3381 * _3389;
    float _3451 = _3361 * _3393;
    float _3453 = fma(_3397, _3399, _3403);
    float _3455 = _3429 * _3437;
    float _3457 = _3381 * _3427;
    float _3459 = _3361 * _3427;
    float _3461 = _3393 * _3427;
    float _3463 = _3389 * _3427;
    float _3465 = -_3449;
    float _3467 = fma(_3397, _3451, _3465);
    float _3469 = -_3451;
    float _3471 = fma(_3397, _3449, _3469);
    float _3473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3417);
    float _3475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3419);
    bool _3477 = _3419 != 0.0;
    bool _3479 = isnan(_3419);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3421);
    float _3489 = _3455 * _3473;
    float _3491 = _3411 * _3447;
    float _3493 = _3415 * _3447;
    float _3495 = _3407 * _3447;
    float _3497 = _3443 * _3475;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3501 = _3491 * _3499;
    float _3503 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3505 = _3493 * _3503;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3515 = _3495 * _3513;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = -_3501;
    float _3521 = fma(_3493, _3517, _3519);
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3525 = -_3505;
    float _3527 = fma(_3495, _3523, _3525);
    bool _3529 = _3417 == 0.0;
    bool _3531 = !_3485;
    bool _3533 = _3529 && _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3537 = -_3515;
    float _3539 = fma(_3491, _3535, _3537);
    float _3541 = _3521 * _3521;
    float _3543 = -_3497;
    float _3545 = _3397 * _3543;
    float _3547 = _3441 * _3487;
    bool _3549 = _3421 == 0.0;
    bool _3551 = _3549 && _3533;
    float _3553 = fma(_3527, _3527, _3541);
    float _3555 = in.m_75.x;
    float _3557 = in.m_75.y;
    float _3559 = in.m_75.z;
    float _3561 = in.m_75.w;
    float _3563 = fma(_3461, _3489, _3545);
    float _3565 = _3457 * _3497;
    float _3567 = fma(_3539, _3539, _3553);
    float _3569 = _3459 * _3497;
    float _3571 = fma(_3445, _3489, _3565);
    float _3573 = rsqrt(_3567);
    float _3575 = fma(_3467, _3489, _3569);
    float _3577 = _3565;
    float _3579 = _3497;
    float _3581 = _3507;
    if (_3551)
    {
        _3369 = _3509;
    }
    float _3583 = _3369;
    float _3585 = _3583;
    if (_3551)
    {
        _3371 = _3507;
    }
    float _3587 = _3371;
    float _3589 = fma(_3471, _3547, _3571);
    float _3591 = _3587;
    if (_3551)
    {
        _3373 = _3511;
    }
    float _3593 = _3373;
    float _3595 = _3593;
    if (_3551)
    {
        _3577 = _3583;
    }
    float _3597 = _3577;
    float _3599 = _3597;
    if (_3551)
    {
        _3579 = _3587;
    }
    float _3601 = _3579;
    float _3603 = _3601;
    if (!_3551)
    {
        _3585 = _3509;
    }
    float _3605 = _3585;
    float _3607 = _3521 * _3573;
    if (!_3551)
    {
        _3591 = _3507;
    }
    float _3609 = _3591;
    float _3611 = _3527 * _3573;
    if (_3551)
    {
        _3581 = _3593;
    }
    float _3613 = _3581;
    float _3615 = _3613;
    if (!_3551)
    {
        float _3617 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3605);
        _3599 = _3617;
    }
    float _3619 = _3599;
    if (!_3551)
    {
        _3595 = _3511;
    }
    float _3621 = _3595;
    float _3623 = fma(_3463, _3547, _3563);
    float _3625 = _3539 * _3573;
    float _3627 = _3493 * _3607;
    float _3629 = _3495 * _3611;
    float _3631 = _3559 * _3609;
    if (!_3551)
    {
        float _3633 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3609);
        _3603 = _3633;
    }
    float _3635 = _3603;
    float _3637 = -_3627;
    float _3639 = fma(_3495, _3625, _3637);
    float _3641 = -_3629;
    float _3643 = fma(_3491, _3607, _3641);
    float _3645 = -_3631;
    float _3647 = fma(_3555, _3621, _3645);
    float _3649 = _3557 * _3621;
    float _3651 = _3555 * _3605;
    float _3653 = _3639 * _3589;
    float _3655 = _3643 * _3589;
    if (!_3551)
    {
        float _3657 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3621);
        _3615 = _3657;
    }
    float _3659 = _3615;
    float _3661 = fma(_3453, _3547, _3575);
    float _3663 = -_3649;
    float _3665 = fma(_3559, _3605, _3663);
    float _3667 = -_3651;
    float _3669 = fma(_3557, _3609, _3667);
    float _3671 = fma(_3611, _3623, _3653);
    float _3673 = fma(_3625, _3623, _3655);
    float _3675 = _3665 * _3561;
    float _3677 = _3491 * _3625;
    float _3679 = fma(_3491, _3661, _3671);
    float _3681 = fma(_3493, _3661, _3673);
    float _3683 = _3647 * _3561;
    float _3685 = _3669 * _3561;
    float _3687 = -_3677;
    float _3689 = fma(_3493, _3611, _3687);
    float _3691 = _2137 + _3679;
    float _3693 = _2147 + _3681;
    float _3695 = _3445 * _3639;
    float _3697 = _3445 * _3689;
    float _3699 = _3445 * _3643;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3703 = _3691 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3707 = _3693 + _3705;
    float _3709 = _3457 * _3639;
    float _3711 = _3471 * _3639;
    float _3713 = _3703 * _3703;
    float _3715 = _3707 * _3707;
    float _3717 = _3457 * _3689;
    float _3719 = _3457 * _3643;
    float _3721 = _3471 * _3643;
    float _3723 = _3713 + _3715;
    float _3725 = _3471 * _3689;
    float _3727 = fma(_3461, _3611, _3695);
    float _3729 = fma(_3461, _3607, _3697);
    float _3731 = fma(_3461, _3625, _3699);
    float _3733 = _3689 * _3589;
    float _3735 = sqrt(_3723);
    float _3737 = fma(_3463, _3611, _3711);
    float _3739 = -_3397;
    float _3741 = fma(_3739, _3611, _3709);
    float _3743 = fma(_3607, _3623, _3733);
    float _3745 = -_3397;
    float _3747 = fma(_3745, _3607, _3717);
    float _3749 = -_3397;
    float _3751 = fma(_3749, _3625, _3719);
    float _3753 = fma(_3463, _3625, _3721);
    float _3755 = fma(_3463, _3607, _3725);
    float _3757 = fma(_3495, _3661, _3743);
    float _3759 = fma(_3459, _3491, _3741);
    float _3761 = fma(_3459, _3495, _3747);
    float _3763 = fma(_3459, _3493, _3751);
    float _3765 = _2135 + _3757;
    float _3767 = fma(_3467, _3491, _3727);
    float _3769 = fma(_3467, _3495, _3729);
    float _3771 = fma(_3453, _3491, _3737);
    bool _3773 = _3735 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3775 = fma(_3453, _3495, _3755);
    float _3777 = fma(_3467, _3493, _3731);
    float _3779 = fma(_3453, _3493, _3753);
    float _3781 = _3759 * _3557;
    float _3783 = _3761 * _3557;
    float _3785 = _3763 * _3557;
    float _3787 = _3759 * _3619;
    float _3789 = _3683 * _3759;
    float _3791 = _3761 * _3619;
    float _3793 = _3763 * _3619;
    float _3795 = _3683 * _3761;
    float _3797 = _3683 * _3763;
    float _3799 = _3759;
    float _3801 = _3713;
    float _3803 = _3715;
    float _3805 = _3691;
    float _3807 = _3693;
    float _3809 = _3659;
    if (!_3773)
    {
        _3799 = _3765;
    }
    float _3811 = _3799;
    bool _3813 = !_3773;
    float _3815 = _3811;
    if (!_3813)
    {
        float _3817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3821 = _3735 + _3819;
        float _3823 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3825 = rsqrt(_3723);
        float _3827 = _3821 * _3817;
        float _3829 = _3827 * 0.15915493667125701904296875;
        float _3831 = _3829 * 6.283185482025146484375;
        float _3833 = sin(_3831);
        float _3835 = _3829 * 6.283185482025146484375;
        float _3837 = cos(_3835);
        float _3839 = fma(_3833, _3823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3841 = _3825 * _3839;
        float _3843 = _3837 + (-1.0);
        float _3845 = fma(_3703, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3847 = fma(_3707, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3849 = _3843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3853 = _3845 + _3851;
        float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3857 = _3847 + _3855;
        float _3859 = fma(_3765, _3837, _3849);
        float _3861 = _3853 * _3853;
        float _3863 = _3857 * _3857;
        _3815 = _3859;
        _3801 = _3861;
        _3803 = _3863;
        _3805 = _3845;
        _3807 = _3847;
    }
    float _3865 = _3815;
    float _3867 = _3801;
    float _3869 = _3803;
    float _3871 = _3805;
    float _3873 = _3807;
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3877 = _3865 + _3875;
    float _3879 = fma(_3767, _3555, _3781);
    float _3881 = fma(_3769, _3555, _3783);
    float _3883 = fma(_3767, _3635, _3787);
    float _3885 = fma(_3877, _3877, _3867);
    float _3887 = fma(_3769, _3635, _3791);
    float _3889 = fma(_3777, _3555, _3785);
    float _3891 = fma(_3675, _3767, _3789);
    float _3893 = _3885 + _3869;
    float _3895 = fma(_3777, _3635, _3793);
    float _3897 = fma(_3675, _3769, _3795);
    float _3899 = fma(_3675, _3777, _3797);
    float _3901 = fma(_3771, _3559, _3879);
    float _3903 = fma(_3775, _3559, _3881);
    float _3905 = sqrt(_3893);
    float _3907 = fma(_3771, _3659, _3883);
    float _3909 = fma(_3775, _3659, _3887);
    float _3911 = fma(_3779, _3559, _3889);
    float _3913 = fma(_3685, _3771, _3891);
    float _3915 = fma(_3685, _3775, _3897);
    float _3917 = fma(_3685, _3779, _3899);
    float _3919 = fma(_3779, _3659, _3895);
    out.m_77.x = _3901;
    out.m_77.y = _3903;
    out.m_77.z = _3911;
    out.m_79.x = _3913;
    out.m_79.y = _3915;
    out.m_79.z = _3917;
    out.m_81.x = _3907;
    out.m_81.y = _3909;
    out.m_81.z = _3919;
    bool _3921 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3923 = isnan(_3905);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3929 = _3925 || _3927;
    float _3931 = _3897;
    float _3933 = _3913;
    if (!_3929)
    {
        _3809 = 1.0;
    }
    float _3935 = _3809;
    bool _3937 = !_3929;
    float _3939 = _3935;
    if (!_3937)
    {
        bool _3941 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3943 = isnan(_3905);
        bool _3945 = _3941 || _3943;
        bool _3947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3949 = _3945 || _3947;
        if (!_3949)
        {
            float _3951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3953 = _3905 + _3951;
            float _3955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3955;
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3963 = 1.0 / _3957;
            float _3965 = _3953 * _3963;
            float _3967 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3939 = _3967;
            _3969 = true;
        }
        else
        {
            bool _3971 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3973 = isnan(_3905);
            bool _3975 = _3971 || _3973;
            bool _3977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3979 = _3975 || _3977;
            if (!_3979)
            {
                float _3981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3983 = _3905 + _3981;
                float _3985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3987 = _3985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3991 = _3989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3993 = 1.0 / _3987;
                float _3995 = _3983 * _3993;
                float _3997 = fma(_3995, _3991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3939 = _3997;
                _3969 = true;
            }
            else
            {
                _3939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3969 = false;
    float _3999 = _3939;
    float _4001 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4003 = _3865 + _4001;
    float _4005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4007 = _3871 + _4005;
    float _4009 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4013 = _3873 + _4011;
    float _4015 = fma(_4007, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4017 = -_3279;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4009);
    float _4021 = fma(_4013, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4023 = -_3281;
    float _4025 = fma(_4023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4015);
    float _4027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4029 = _4019 + _4027;
    float _4031 = -_3293;
    float _4033 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4021);
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _4025 + _4035;
    float _4039 = _4029 * _4029;
    float _4041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4043 = _4033 + _4041;
    float _4045 = fma(_4037, _4037, _4039);
    float _4047 = fma(_4043, _4043, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4043 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4049;
    float _4073 = _4061;
    float _4075 = _4069;
    float _4077 = _4029;
    float _4079 = _4051;
    float _4081 = _4053;
    if (_4065)
    {
        float _4083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4083;
    }
    float _4085 = _4071;
    if (_4065)
    {
        float _4087 = rsqrt(_4061);
        _4073 = _4087;
    }
    float _4089 = _4073;
    if (_4065)
    {
        float _4091 = _4069 * _4085;
        _4075 = _4091;
    }
    float _4093 = _4075;
    if (_4065)
    {
        float _4095 = _4093 * 0.15915493667125701904296875;
        _3931 = _4095;
    }
    float _4097 = _3931;
    float _4099 = _4085;
    if (_4065)
    {
        float _4101 = _4097 * 6.283185482025146484375;
        float _4103 = sin(_4101);
        _4099 = _4103;
    }
    float _4105 = _4099;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4109 = precise::max(0.0, _4107);
    float _4111 = _4043;
    float _4113 = _4109;
    if (_4065)
    {
        float _4115 = _4097 * 6.283185482025146484375;
        float _4117 = cos(_4115);
        _4111 = _4117;
    }
    float _4119 = _4111;
    float _4121 = -_4051;
    float _4123 = -_4109;
    float _4125 = fma(_4029, _4121, _4123);
    float _4127 = _4125;
    if (!_4065)
    {
        _4077 = _4057;
    }
    float _4129 = _4077;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4113 = _4133;
    }
    float _4135 = _4113;
    float _4137 = _4105;
    float _4139 = _4135;
    if (_4065)
    {
        float _4141 = fma(_4105, _4135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4137 = _4141;
    }
    float _4143 = _4137;
    float _4145 = _4143;
    float _4147 = _4119;
    if (_4065)
    {
        float _4149 = _4119 + (-1.0);
        _4139 = _4149;
    }
    float _4151 = _4139;
    if (_4065)
    {
        float _4153 = _4089 * _4143;
        _3933 = _4153;
    }
    float _4155 = _3933;
    if (!_4065)
    {
        _4145 = _4055;
    }
    float _4157 = _4145;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4079 = _4161;
    }
    float _4163 = _4079;
    if (_4065)
    {
        float _4165 = _4053 * _4155;
        _4081 = _4165;
    }
    float _4167 = _4081;
    if (_4065)
    {
        float _4169 = _4055 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    float _4173 = sqrt(_4047);
    if (_4065)
    {
        float _4175 = fma(_4125, _4119, _4163);
        _4127 = _4175;
    }
    float _4177 = _4127;
    if (_4065)
    {
        float _4179 = _4167 * _4167;
        _4131 = _4179;
    }
    float _4181 = _4131;
    if (!_4065)
    {
        _4147 = _4059;
    }
    float _4183 = _4147;
    float _4185 = _4183;
    if (_4065)
    {
        float _4187 = _4171 * _4171;
        _4185 = _4187;
    }
    float _4189 = _4185;
    float _4191 = fma(_4177, _4177, _4181);
    float _4193 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4195 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4191 + _4189;
    float _4199 = fma(_3291, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4203 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4205 = rsqrt(_4197);
    float _4207 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4193);
    float _4209 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4201);
    float _4211 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4203);
    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4215 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4213);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4221 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4209);
    float _4223 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4211);
    float _4225 = -_4217;
    float _4227 = _4225 + 1.0;
    float _4229 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4207);
    float _4231 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4219);
    float _4233 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4235 = _4223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4237 = _4229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4241 = abs(_4227);
    float _4243 = log2(_4241);
    float _4245 = _4205 * _4167;
    float _4247 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4249 = _4205 * _4177;
    float _4251 = _4205 * _4171;
    float _4253 = _4245 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4255 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4247);
    float _4257 = floor(_4199);
    float _4259 = -_4253;
    float _4261 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4259);
    float _4263 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4265 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4255);
    float _4267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4269 = -_4251;
    float _4271 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4261);
    float _4273 = _4237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4275 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4265);
    float _4277 = floor(_4263);
    float _4279 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4281 = -_4273;
    float _4283 = fma(_4281, _4267, 1.0);
    float _4285 = fma(_4271, -0.5, 0.5);
    float _4287 = fma(_4271, 0.5, 0.5);
    float _4289 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4291 = exp2(_4279);
    float _4293 = -_4257;
    float _4295 = _4199 + _4293;
    float _4297 = fma(_4287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4299 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4289);
    float _4301 = fma(_4287, _4297, -0.212114393711090087890625);
    float _4303 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4305 = 1.0 / _4275;
    float _4307 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4309 = fma(_4287, _4301, 1.570728778839111328125);
    float _4311 = _4249 + 1.0;
    float _4313 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4307);
    float _4315 = log2(_4283);
    float _4317 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = -_4249;
    float _4321 = fma(_4291, _4311, _4319);
    float _4323 = sqrt(_4285);
    float _4325 = _4315 * 0.693147182464599609375;
    float _4327 = -_4277;
    float _4329 = _4263 + _4327;
    float _4331 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4303);
    float _4333 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4335 = fma(_4321, 0.5, 0.5);
    float2 _11114 = float2(_4295, _4329);
    float _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11114, float2(0.0), isnan(_11114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11114, float2(0.0), isnan(_11114)), level(0.0)).x;
    float _4339 = _4331 * _4305;
    float _4341 = _4333 * _4305;
    float _4343 = _4323 * 0.636619746685028076171875;
    float _4345 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4347 = fma(_4339, 0.5, 0.5);
    float _4349 = fma(_4341, -0.5, 0.5);
    float _4351 = -_4309;
    float _4353 = fma(_4343, _4351, 1.0);
    float3 _11147 = float3(_4347, _4349, _4345);
    float _4355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11147, float3(0.0), isnan(_11147)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11147, float3(0.0), isnan(_11147)), level(0.0)).x;
    float3 _11158 = float3(_4347, _4349, _4345);
    float4 _4358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11158, float3(0.0), isnan(_11158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11158, float3(0.0), isnan(_11158)), level(0.0)).xyzw;
    float _4360 = _4358.x;
    float _4362 = _4358.y;
    float _4364 = _4358.z;
    float _4366 = _4358.w;
    float2 _11174 = float2(_4353, _4335);
    float3 _4370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11174, float2(0.0), isnan(_11174)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11174, float2(0.0), isnan(_11174)), level(0.0)).xyz;
    float _4372 = _4370.x;
    float _4374 = _4370.y;
    float _4376 = _4370.z;
    float _4378 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4380 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4382 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4384 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4386 = isnan(_4173);
    bool _4388 = _4384 || _4386;
    bool _4390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4392 = _4388 || _4390;
    float _4394 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4378);
    float _4396 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4380);
    float _4398 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4382);
    float _4400 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4402 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4394);
    float _4404 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4396);
    float _4406 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4398);
    float _4408 = _4402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4410 = _4404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4412 = exp2(_4400);
    float _4414 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4406);
    float _4416 = _4410 + _4408;
    float _4418 = in.m_83.x;
    float _4420 = _4414 + _4275;
    float _4422 = 1.0 / _4408;
    out.gl_Position.x = _4331;
    out.gl_Position.y = _4333;
    out.gl_Position.z = _4414;
    out.gl_Position.w = _4275;
    float _4424 = -_4412;
    float _4426 = _4424 + 1.0;
    float _4428 = _4426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4430 = _4416 * _4422;
    float _4432 = _4430 * 0.5;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4436 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4434);
    float _4438 = 1.0 / _4436;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4442 = _4438 * _4440;
    float _4444 = abs(_4442);
    float _4446 = log2(_4444);
    bool _4448 = _4442 <= 8000.0;
    bool _4450 = isnan(_4442);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(8000.0);
    bool _4456 = _4452 || _4454;
    float _4458 = float(_4456);
    float _4460 = _4446 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4462 = exp2(_4460);
    float _4464 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4466 = precise::clamp(_4464, 0.0, 1.0);
    float _4468 = fma(_4466, -2.0, 3.0);
    float _4470 = _4466 * _4466;
    float _4472 = _4470 * _4468;
    float _4474 = -_4472;
    float _4476 = _4474 + 1.0;
    float _4478 = fma(_4476, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4472);
    float _4480 = _4420 * 0.5;
    float _4482 = _4458 * _4478;
    out.m_85.z = _4480;
    out.m_85.w = _4275;
    float _4484 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4486 = _4275;
    float _4488 = _4480;
    if (!_4392)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4486;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4392)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4488;
    float _4498 = -_4337;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500 * _4484;
    float _4504 = precise::clamp(_4502, 0.0, 1.0);
    float _4506 = -_4504;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4510 = _4428 * _4355;
    float _4512 = -_4428;
    float _4514 = _4512 + 1.0;
    float _4516 = _4508 * _4418;
    float _4518 = _4366 * _4510;
    float _4520 = _4376 * _4510;
    float _4522 = _4366 * _4514;
    float _4524 = _4516 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4526 = fma(_4372, _4518, _4360);
    float _4528 = fma(_4374, _4518, _4362);
    float _4530 = fma(_4366, _4520, _4364);
    float _4532 = _4518;
    float _4534 = _4496;
    float _4536 = _4496;
    if (!_4392)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4538 = _4532;
    out.m_87.x = _4524;
    out.m_89.x = _4526;
    out.m_89.y = _4528;
    out.m_89.z = _4530;
    out.m_89.w = _4522;
    bool _4540 = !_4392;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        bool _4546 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4548 = isnan(_4173);
        bool _4550 = _4546 || _4548;
        bool _4552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4554 = _4550 || _4552;
        if (!_4554)
        {
            float _4556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4558 = _4173 + _4556;
            float _4560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4560;
            float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4566 = _4564 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4572 = 1.0 / _4562;
            float _4574 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4578 = _4558 * _4572;
            float _4580 = precise::clamp(_4578, 0.0, 1.0);
            float _4582 = fma(_4580, _4566, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4584 = fma(_4580, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4586 = fma(_4580, _4576, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4536 = _4584;
            _4494 = _4582;
            _4544 = _4586;
            _4588 = true;
        }
        else
        {
            bool _4590 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4592 = isnan(_4173);
            bool _4594 = _4590 || _4592;
            bool _4596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4598 = _4594 || _4596;
            if (!_4598)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4600 = _4492;
            _4494 = _4600;
            if (!_4598)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4602 = _4534;
            _4536 = _4602;
            if (!_4598)
            {
                _4542 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4604 = _4542;
            bool _4606 = !_4598;
            _4544 = _4604;
            if (!_4606)
            {
                bool _4608 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4610 = isnan(_4173);
                bool _4612 = _4608 || _4610;
                bool _4614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4616 = _4612 || _4614;
                if (!_4616)
                {
                    float _4618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4620 = _4173 + _4618;
                    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4622;
                    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4632 = _4630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4634 = 1.0 / _4624;
                    float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4640 = _4620 * _4634;
                    float _4642 = precise::clamp(_4640, 0.0, 1.0);
                    float _4644 = fma(_4642, _4628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4642, _4632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4642, _4638, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4536 = _4646;
                    _4494 = _4644;
                    _4544 = _4648;
                    _4588 = true;
                }
                else
                {
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4544 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4588 = false;
    float _4650 = _4536;
    float _4652 = _4494;
    float _4654 = _4544;
    float _4656 = _4650 * 0.586610972881317138671875;
    bool _4658 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4660 = fma(_4652, 0.298911988735198974609375, _4656);
    out.m_91.x = 0.0;
    float _4662 = fma(_4654, 0.114477999508380889892578125, _4660);
    float _4664 = -_4662;
    float _4666 = _4664 + _4652;
    float _4668 = -_4662;
    float _4670 = _4668 + _4650;
    float _4672 = -_4662;
    float _4674 = _4672 + _4654;
    float _4676 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4680 = fma(_4670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4682 = fma(_4674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    out.m_87.w = _4676;
    out.m_93.x = _4678;
    out.m_93.y = _4680;
    out.m_93.z = _4682;
    if (!_4658)
    {
        return out;
    }
    float _4684 = -_4019;
    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4688 = -_4025;
    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4692 = -_4033;
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4696 = _4686 * _4686;
    float _4698 = fma(_4690, _4690, _4696);
    float _4700 = fma(_4694, _4694, _4698);
    float _4702 = sqrt(_4700);
    float _4704 = rsqrt(_4700);
    float _4706 = -_4702;
    float _4708 = _4706 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4710 = _4708 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4712 = precise::clamp(_4710, 0.0, 1.0);
    float _4714 = _4690 * _4704;
    float _4716 = _4686 * _4704;
    float _4718 = abs(_4712);
    float _4720 = log2(_4718);
    float _4722 = _4694 * _4704;
    float _4724 = _4714 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4726 = _3909 * _4716;
    float _4728 = -_4716;
    float _4730 = -_4724;
    float _4732 = fma(_4728, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4730);
    float _4734 = fma(_3907, _4714, _4726);
    float _4736 = -_4722;
    float _4738 = fma(_4736, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4732);
    float _4740 = fma(_3919, _4722, _4734);
    float _4742 = precise::clamp(_4740, 0.0, 1.0);
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4746 = _4738 + _4744;
    float _4748 = _4720 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4752 = precise::clamp(_4750, 0.0, 1.0);
    float _4754 = exp2(_4748);
    float _4756 = _4754 * _4752;
    float _4758 = _4742 * _4756;
    float _4760 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4762 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4760;
    out.m_91.y = _4762;
    out.m_91.z = _4764;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4588 = false;
    bool _3969 = false;
    bool _528 = false;
    bool _412 = false;
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
        float _4821 = as_type<float>(_128);
        out.gl_Position.z = _4821;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4891 = as_type<float>(_166);
        out.gl_Position.z = _4891;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _146 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    float _422 = in.m_57.x;
    float _424 = in.m_57.y;
    float _426 = in.m_57.z;
    bool _428 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _430 = isnan(_420);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _446 = isnan(_420);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _420 + _460;
    float _464 = -_438;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _442;
    float _472 = _454 * _466;
    float _474 = -_454;
    float _476 = _474 + 1.0;
    float _478 = _390 * _426;
    float _480 = _388 * _424;
    float _482 = _458 * _470;
    float _484 = _386 * _422;
    float _486 = fma(_482, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _472;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _508 = !_468;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _146 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.x;
    bool _544 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = in.m_55.z;
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = in.m_55.y;
    float _564 = in.m_55.w;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = float(_540);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _572 = int(_570);
    float _574 = in.m_61.x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _580 = _578 != 0;
    float _582 = float(uint(_560));
    float _584 = 1.0 / _568;
    int _586 = ~_560;
    int _588 = _586 + 1;
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _594 = int(_592);
    float _596 = float(_572);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _600 = _568;
    float _602 = _596;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_580)
    {
        _600 = 1.0;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_580)
    {
        _608 = 5.839270114898681640625;
    }
    float _610 = _608;
    bool _612 = _562 > 0.5;
    float _614 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _616 = int(_614);
    float _618 = _584 * _146;
    bool _620 = _564 > 0.5;
    float _622 = 1.0 / _582;
    float _624 = float(_594);
    float _626 = trunc(_618);
    int _628 = int(_626);
    float _630 = float(uint(_616));
    float _632 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _634 = int(_632);
    int _636 = as_type<int>(_622) + (-2);
    float _638 = 1.0 / _596;
    float _640 = float(uint(_628));
    float _642 = as_type<float>(_636) * _640;
    float _644 = 1.0 / _624;
    float _646 = float(uint(_634));
    float _648 = _624;
    float _650 = _564;
    if (_580)
    {
        _602 = 1.0;
    }
    float _652 = _602;
    float _654 = _652;
    if (!_580)
    {
        _654 = 1.2345600128173828125;
    }
    float _656 = _654;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = 1.0 / _630;
    if (_580)
    {
        _648 = 1.0;
    }
    float _664 = _648;
    float _666 = _638 * _146;
    float _668 = _664;
    float _670 = _638;
    if (!_580)
    {
        _668 = 7.345489978790283203125;
    }
    float _672 = _668;
    float _674 = _672;
    if (_580)
    {
        _670 = _542;
    }
    float _676 = _670;
    float _678 = _676;
    if (!_580)
    {
        _678 = _562;
    }
    float _680 = _678;
    float _682 = trunc(_642);
    float _684 = precise::max(_682, 0.0);
    uint _687 = uint(_684);
    float _689 = in.m_61.y;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _693 = _691 != 0;
    float _695 = _680 * _656;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _699 = _697 != 0;
    float _701 = 1.0 / _646;
    float _703 = trunc(_666);
    int _705 = int(_703);
    float _707 = _644 * _146;
    float _709 = _672 * _542;
    bool _711 = _699;
    if (_580)
    {
        _674 = _542;
    }
    float _713 = _674;
    float _715 = _713;
    if (!_580)
    {
        _715 = _556;
    }
    float _717 = _715;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc(_707);
    int _725 = int(_723);
    float _727 = -_689;
    float _729 = _727 + 1.0;
    float _731 = _717 * _610;
    int _733 = ~_560;
    int _735 = _733 + 1;
    int _737 = as_type<int>(_701) + (-2);
    int _739 = _612 ? as_type<int>(_729) : as_type<int>(_689);
    int _741 = _735 * int(_687);
    int _743 = _741 + _628;
    float _745 = float(uint(_705));
    float _747 = floor(_709);
    float _749 = _660 ? as_type<float>(_739) : _689;
    float _751 = _689;
    float _753 = _701;
    if (!_721)
    {
        _650 = _574;
    }
    float _755 = _650;
    float _757 = as_type<float>(_737) * _745;
    float _759 = float(uint(_743));
    float _761 = 0.0;
    float _763 = _755;
    int _765 = as_type<int>(_757);
    if (!_721)
    {
        _761 = _755;
    }
    float _767 = _761;
    float _769 = floor(_695);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _773 = _771 != 0;
    float _775 = _767;
    if (_721)
    {
        _763 = _574;
    }
    float _777 = _763;
    float _779 = as_type<float>(_636) * _759;
    int _781 = as_type<int>(_662) + (-2);
    float _783 = float(uint(_725));
    float _785 = floor(_731);
    int _787 = _620 ? as_type<int>(_729) : as_type<int>(_689);
    int _789 = 0;
    float _791 = _777;
    if (_693)
    {
        float _793 = -_777;
        float _795 = _793 + 1.0;
        _789 = as_type<int>(_795);
    }
    int _797 = _789;
    bool _799 = _556 > 0.5;
    float _801 = as_type<float>(_781) * _783;
    float _803 = _699 ? as_type<float>(_787) : _689;
    float _805 = -_747;
    float _807 = _709 + _805;
    if (_773)
    {
        float _809 = _799 ? _729 : _689;
        _751 = _809;
    }
    float _811 = _751;
    float _813 = trunc(_757);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    if (_721)
    {
        bool _819 = _542 > 0.5;
        _711 = _819;
    }
    bool _821 = _711;
    int _823 = ~_634;
    int _825 = _823 + 1;
    int _827 = ~_616;
    int _829 = _827 + 1;
    if (!_693)
    {
        _753 = _777;
    }
    float _831 = _753;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_721)
    {
        float _841 = -_777;
        float _843 = _841 + 1.0;
        _765 = as_type<int>(_843);
    }
    int _845 = _765;
    if (_693)
    {
        float _847 = _799 ? as_type<float>(_797) : _777;
        _839 = _847;
    }
    float _849 = _839;
    float _851 = -_785;
    float _853 = _731 + _851;
    if (_721)
    {
        float _855 = _821 ? as_type<float>(_845) : _777;
        _775 = _855;
    }
    float _857 = _775;
    float _859 = -_769;
    float _861 = _695 + _859;
    float _863 = float(_112);
    float _865 = trunc(_779);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = float(_634);
    int _873 = _825 * int(_817);
    int _875 = _873 + _705;
    float _877 = float(_560);
    int _879 = _829 * int(_837);
    int _881 = _879 + _725;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = float(uint(_875));
    float _889 = 1.0 / _863;
    float _891 = float(_628);
    float _893 = as_type<float>(_737) * _887;
    bool _895 = _891 >= _877;
    bool _897 = isnan(_891);
    bool _899 = _895 || _897;
    bool _901 = isnan(_877);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = float(uint(_881));
    float _909 = trunc(_893);
    float _911 = precise::max(_909, 0.0);
    uint _913 = uint(_911);
    float _915 = _807 * _877;
    int _917 = int(_687) + int(_869);
    float _919 = _877 * _146;
    float _921 = as_type<float>(_781) * _907;
    float _923 = float(_705);
    float _925 = float(_616);
    float _927 = _889 * _146;
    float _929 = float(_725);
    float _931 = trunc(_921);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _923 >= _871;
    bool _939 = isnan(_923);
    bool _941 = _937 || _939;
    bool _943 = isnan(_871);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _871 * _861;
    float _951 = _919 * _889;
    float _953 = _871 * _927;
    float _955 = _925 * _927;
    bool _957 = _929 >= _925;
    bool _959 = isnan(_929);
    bool _961 = _957 || _959;
    bool _963 = isnan(_925);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = _925 * _853;
    int _971 = ~_634;
    int _973 = _971 + 1;
    int _975 = _588 * _917;
    int _977 = _975 + _628;
    int _979 = int(_817) + int(_913);
    float _981 = trunc(_915);
    int _983 = int(_981);
    bool _985 = !_885;
    int _987 = _985 ? 0 : 1;
    float _989 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = uint(_977) >= uint(_560);
    int _993 = int(_837) + int(_935);
    int _995 = _973 * _979;
    int _997 = _995 + _705;
    float _999 = trunc(_905);
    int _1001 = int(_999);
    bool _1003 = !_991;
    int _1005 = _1003 ? 0 : (-1);
    int _1007 = abs(_987);
    int _1009 = ~_917;
    int _1011 = _1009 + _1005;
    int _1013 = _1011 + 1;
    int _1015 = _983 * _1007;
    int _1017 = _1015 + _628;
    bool _1019 = uint(_997) >= uint(_634);
    int _1021 = _560 * _1013;
    int _1023 = _1021 + _628;
    int _1025 = ~_616;
    int _1027 = _1025 + 1;
    float _1029 = trunc(_951);
    int _1031 = int(_1029);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1043 = _1041 != 0;
    bool _1045 = _560 == 0;
    bool _1047 = !_1019;
    int _1049 = _1047 ? 0 : (-1);
    float _1051 = trunc(_947);
    int _1053 = int(_1051);
    bool _1055 = !_1039;
    int _1057 = _1055 ? 0 : 1;
    int _1059 = _1027 * _993;
    int _1061 = _1059 + _725;
    int _1063 = ~_1001;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    bool _1069 = !_1045;
    int _1071 = _1069 ? _1023 : (-1);
    int _1073 = ~_979;
    int _1075 = _1073 + _1049;
    int _1077 = _1075 + 1;
    float _1079 = trunc(_969);
    int _1081 = int(_1079);
    int _1083 = _560 + (-1);
    int _1085 = _1071 * _1067;
    int _1087 = abs(_1057);
    int _1089 = _634 * _1077;
    int _1091 = _1089 + _705;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1095 = _1093 != 0;
    int _1097 = _1001 * _1083;
    int _1099 = _1097 + _1085;
    bool _1101 = !_1035;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_949);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _1099 * _1087;
    bool _1115 = uint(_1061) >= uint(_616);
    bool _1117 = !_1043;
    int _1119 = _1117 ? 0 : 1;
    int _1121 = abs(_1103);
    float _1123 = trunc(_967);
    int _1125 = int(_1123);
    int _1127 = abs(_1111);
    int _1129 = abs(_1119);
    bool _1131 = !_1115;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = _1107 * _1127;
    int _1137 = _1135 + _705;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1141 = _1139 != 0;
    float _1143 = trunc(_955);
    int _1145 = int(_1143);
    int _1147 = ~_993;
    int _1149 = _1147 + _1133;
    int _1151 = _1149 + 1;
    int _1153 = _1031 * _1121;
    int _1155 = _1153 + _1113;
    bool _1157 = !_1141;
    int _1159 = _1157 ? 0 : 1;
    int _1161 = _616 * _1151;
    int _1163 = _1161 + _725;
    bool _1165 = _634 == 0;
    int _1167 = _1017 * _1129;
    int _1169 = _1167 + _1155;
    int _1171 = abs(_1159);
    float _1173 = trunc(_953);
    int _1175 = int(_1173);
    int _1177 = ~_1053;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    bool _1183 = !_1165;
    int _1185 = _1183 ? _1091 : (-1);
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1189 = _1187 != 0;
    int _1191 = _634 + (-1);
    int _1193 = _1181 * _1185;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1197 = _1195 != 0;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1201 = _1199 != 0;
    int _1203 = _983 * _1171;
    int _1205 = _1203 + _1169;
    bool _1207 = !_1189;
    int _1209 = _1207 ? 0 : 1;
    int _1211 = _1053 * _1191;
    int _1213 = _1211 + _1193;
    bool _1215 = !_1201;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = float(uint(_1205));
    int _1221 = abs(_1209);
    int _1223 = abs(_1217);
    float _1225 = as_type<float>(_636) * _1219;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1233 = _1231 != 0;
    float _1235 = float(uint(_1017));
    float _1237 = trunc(_1225);
    float _1239 = precise::max(_1237, 0.0);
    uint _1241 = uint(_1239);
    int _1243 = _1081 * _1221;
    int _1245 = _1243 + _725;
    bool _1247 = !_1197;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = as_type<float>(_636) * _1235;
    bool _1253 = !_1229;
    int _1255 = _1253 ? 0 : 1;
    int _1257 = _1213 * _1223;
    int _1259 = abs(_1249);
    int _1261 = abs(_1255);
    float _1263 = trunc(_1251);
    float _1265 = precise::max(_1263, 0.0);
    uint _1267 = uint(_1265);
    bool _1269 = !_1233;
    int _1271 = _1269 ? 0 : 1;
    int _1273 = _1175 * _1259;
    int _1275 = _1273 + _1257;
    bool _1277 = _616 == 0;
    int _1279 = ~_560;
    int _1281 = _1279 + 1;
    int _1283 = abs(_1271);
    int _1285 = _1137 * _1261;
    int _1287 = _1285 + _1275;
    int _1289 = ~_1125;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1281 * int(_1241);
    int _1297 = _1295 + _1205;
    bool _1299 = !_1277;
    int _1301 = _1299 ? _1163 : (-1);
    int _1303 = _1107 * _1283;
    int _1305 = _1303 + _1287;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1317 = _536 + _1315;
    int _1319 = ~_560;
    int _1321 = _1319 + 1;
    int _1323 = _1293 * _1301;
    float _1325 = float(uint(_1297));
    bool _1327 = !_1313;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = _1321 * int(_1267);
    int _1333 = _1331 + _1017;
    float _1335 = float(uint(_1305));
    float _1337 = as_type<float>(_636) * _1325;
    int _1339 = _616 + (-1);
    int _1341 = abs(_1329);
    float _1343 = as_type<float>(_737) * _1335;
    bool _1345 = !_1309;
    int _1347 = _1345 ? 0 : 1;
    int _1349 = _1125 * _1339;
    int _1351 = _1349 + _1323;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = float(uint(_1333));
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1363 = _1361 != 0;
    int _1365 = _1351 * _1341;
    int _1367 = abs(_1347);
    float _1369 = as_type<float>(_636) * _1359;
    int _1371 = ~_634;
    int _1373 = _1371 + 1;
    float _1375 = trunc(_1343);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1383 = _1381 != 0;
    int _1385 = _1145 * _1367;
    int _1387 = _1385 + _1365;
    bool _1389 = !_1363;
    int _1391 = _1389 ? 0 : 1;
    bool _1393 = !_1383;
    int _1395 = _1393 ? 0 : 1;
    int _1397 = abs(_1391);
    int _1399 = abs(_1395);
    float _1401 = trunc(_1369);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    int _1407 = int(_1241) + int(_1357);
    int _1409 = _1245 * _1397;
    int _1411 = _1409 + _1387;
    int _1413 = ~_560;
    int _1415 = _1413 + 1;
    int _1417 = _1373 * int(_1379);
    int _1419 = _1417 + _1305;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1423 = _1421 != 0;
    int _1425 = _1081 * _1399;
    int _1427 = _1425 + _1411;
    float _1429 = float(uint(_1137));
    float _1431 = float(uint(_1419));
    int _1433 = _1415 * _1407;
    int _1435 = _1433 + _1205;
    float _1437 = float(uint(_1427));
    float _1439 = as_type<float>(_737) * _1429;
    bool _1441 = _562 > 0.5;
    float _1443 = as_type<float>(_737) * _1431;
    bool _1445 = uint(_1435) >= uint(_560);
    float _1447 = as_type<float>(_781) * _1437;
    int _1449 = int(_1267) + int(_1405);
    float _1451 = trunc(_1443);
    float _1453 = precise::max(_1451, 0.0);
    uint _1455 = uint(_1453);
    bool _1457 = !_1445;
    int _1459 = _1457 ? 0 : (-1);
    int _1461 = _1415;
    if (_1423)
    {
        float _1463 = -_777;
        float _1465 = _1463 + 1.0;
        _1461 = as_type<int>(_1465);
    }
    int _1467 = _1461;
    float _1469 = float(uint(_1245));
    int _1471 = ~_1407;
    int _1473 = _1471 + _1459;
    int _1475 = _1473 + 1;
    if (_1423)
    {
        float _1477 = _1441 ? as_type<float>(_1467) : _777;
        _791 = _1477;
    }
    float _1479 = _791;
    float _1481 = trunc(_1447);
    float _1483 = precise::max(_1481, 0.0);
    uint _1485 = uint(_1483);
    float _1487 = as_type<float>(_781) * _1469;
    int _1489 = _560 * _1475;
    int _1491 = _1489 + _1205;
    bool _1493 = _560 == 0;
    int _1495 = ~_616;
    int _1497 = _1495 + 1;
    int _1499 = ~_634;
    int _1501 = _1499 + 1;
    float _1503 = trunc(_1487);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    bool _1509 = !_1493;
    int _1511 = _1509 ? _1491 : (-1);
    int _1513 = _1511 & 3;
    bool _1515 = _1513 != 0;
    int _1517 = int(_1379) + int(_1455);
    int _1519 = _1497 * int(_1485);
    int _1521 = _1519 + _1427;
    float _1523 = trunc(_1439);
    float _1525 = precise::max(_1523, 0.0);
    uint _1527 = uint(_1525);
    bool _1529 = uint(_1513) > 1u;
    int _1531 = ~_616;
    int _1533 = _1531 + 1;
    int _1535 = _1501 * _1517;
    int _1537 = _1535 + _1305;
    float _1539 = float(uint(_1521));
    int _1541 = _1511 & 3;
    bool _1543 = _1541 != 0;
    int _1545 = ~_634;
    int _1547 = _1545 + 1;
    float _1549 = as_type<float>(_781) * _1539;
    int _1551 = _1533 * int(_1507);
    int _1553 = _1551 + _1245;
    int _1555 = _1543 ? 0 : 1;
    bool _1557 = uint(_1537) >= uint(_634);
    float _1559 = trunc(_1549);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    int _1565 = ~_560;
    int _1567 = _1565 + 1;
    int _1569 = _1547 * int(_1527);
    int _1571 = _1569 + _1137;
    float _1573 = float(uint(_1553));
    bool _1575 = !_1557;
    int _1577 = _1575 ? 0 : (-1);
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = _1581 + 1;
    float _1585 = as_type<float>(_781) * _1573;
    int _1587 = _1583;
    int _1589 = _1567;
    if (!_1529)
    {
        int _1591 = ~_1555;
        int _1593 = _1591 + 1;
        _1587 = _1593;
    }
    int _1595 = _1587;
    bool _1597 = _1513 != 3;
    float _1599 = trunc(_1585);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    int _1605 = ~_1517;
    int _1607 = _1605 + _1577;
    int _1609 = _1607 + 1;
    int _1611 = _1567 * _1449;
    int _1613 = _1611 + _1017;
    float _1615 = float(uint(_1571));
    bool _1617 = uint(_1513) >= 2u;
    int _1619 = _634 * _1609;
    int _1621 = _1619 + _1305;
    int _1623 = int(_1485) + int(_1563);
    float _1625 = as_type<float>(_737) * _1615;
    int _1627 = _1617 ? 0 : 1;
    bool _1629 = uint(_1613) >= uint(_560);
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    bool _1637 = !_1165;
    int _1639 = _1637 ? _1621 : (-1);
    int _1641 = ~_1627;
    int _1643 = _1641 + 1;
    int _1645 = _1643 + 1;
    int _1647 = _1645;
    if (_1597)
    {
        int _1649 = ~_1627;
        int _1651 = _1649 + 1;
        _1647 = _1651;
    }
    int _1653 = _1647;
    int _1655 = ~_616;
    int _1657 = _1655 + 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1661 = _1659 != 0;
    bool _1663 = !_1629;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = _1657 * _1623;
    int _1669 = _1667 + _1427;
    int _1671 = _1639 & 3;
    bool _1673 = _1671 != 0;
    bool _1675 = !_1661;
    int _1677 = _1675 ? 0 : 1;
    bool _1679 = uint(_1671) >= 2u;
    int _1681 = _1673 ? 0 : 1;
    int _1683 = _1679 ? 0 : 1;
    bool _1685 = uint(_1669) >= uint(_616);
    int _1687 = ~_634;
    int _1689 = _1687 + 1;
    bool _1691 = _1671 != 3;
    int _1693 = int(_1527) + int(_1635);
    bool _1695 = !_1685;
    int _1697 = _1695 ? 0 : (-1);
    bool _1699 = uint(_1671) > 1u;
    int _1701 = ~_1623;
    int _1703 = _1701 + _1697;
    int _1705 = _1703 + 1;
    int _1707 = _1689 * _1693;
    int _1709 = _1707 + _1137;
    int _1711 = ~_1683;
    int _1713 = _1711 + 1;
    int _1715 = _1713 + 1;
    int _1717 = _616 * _1705;
    int _1719 = _1717 + _1427;
    int _1721 = _1715;
    if (_1691)
    {
        int _1723 = ~_1683;
        int _1725 = _1723 + 1;
        _1721 = _1725;
    }
    int _1727 = _1721;
    bool _1729 = uint(_1709) >= uint(_634);
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1737 = _1735 != 0;
    int _1739 = int(_1507) + int(_1603);
    float _1741 = _542 * 2.0;
    bool _1743 = !_1277;
    int _1745 = _1743 ? _1719 : (-1);
    float _1747 = 1.0 / _1733;
    int _1749 = ~_1681;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1753;
    if (!_1699)
    {
        int _1757 = ~_1681;
        int _1759 = _1757 + 1;
        _1755 = _1759;
    }
    int _1761 = _1755;
    bool _1763 = !_1729;
    int _1765 = _1763 ? 0 : (-1);
    int _1767 = _1639 & 3;
    bool _1769 = _1767 != 0;
    float _1771 = floor(_1741);
    int _1773 = _1745 & 3;
    bool _1775 = _1773 != 0;
    float _1777 = _562 * 2.0;
    bool _1779 = !_1769;
    int _1781 = _1779 ? 0 : 1;
    bool _1783 = _1773 != 3;
    bool _1785 = !_1515;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = floor(_1777);
    float _1791 = _1777;
    if (_1737)
    {
        _604 = 0;
    }
    int _1793 = _604;
    bool _1795 = uint(_1773) >= 2u;
    int _1797 = ~_616;
    int _1799 = _1797 + 1;
    int _1801 = _1793;
    if (!_1737)
    {
        _1801 = 1;
    }
    int _1803 = _1801;
    bool _1805 = uint(_1773) > 1u;
    int _1807 = _1799 * _1739;
    int _1809 = _1807 + _1245;
    int _1811 = _1795 ? 0 : 1;
    bool _1813 = _1803 != 1;
    int _1815 = ~_1811;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1819;
    if (_1783)
    {
        int _1823 = ~_1811;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    int _1829 = _1775 ? 0 : 1;
    int _1831 = _1745 & 3;
    bool _1833 = _1831 != 0;
    bool _1835 = uint(_1809) >= uint(_616);
    bool _1837 = _1771 > 0.0;
    bool _1839 = !_1833;
    int _1841 = _1839 ? 0 : 1;
    bool _1843 = _1771 >= 0.0;
    bool _1845 = isnan(_1771);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan(0.0);
    bool _1851 = _1847 || _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    bool _1857 = !_1835;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = ~_1829;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    float _1867 = _1855 * _1747;
    bool _1869 = _1789 > 0.0;
    int _1871 = _1865;
    float _1873 = _1771;
    if (!_1805)
    {
        int _1875 = ~_1829;
        int _1877 = _1875 + 1;
        _1871 = _1877;
    }
    int _1879 = _1871;
    float _1881 = fma(_1867, _1317, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1883 = _1513 != 3;
    float _1885 = _542 + _562;
    float _1887 = 0.0;
    if (!_1813)
    {
        _1887 = _562;
    }
    float _1889 = _1887;
    int _1891 = _1851 ? 0 : 1;
    float _1893 = _1885 + (-1.0);
    bool _1895 = _1789 >= 0.0;
    bool _1897 = isnan(_1789);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1889;
    if (!_1813)
    {
        _1873 = _556;
    }
    float _1907 = _1873;
    float _1909 = _1907;
    if (!_1813)
    {
        _1791 = _1889;
    }
    float _1911 = _1791;
    float _1913 = 0.0;
    float _1915 = _1911;
    if (!_1813)
    {
        _1913 = _556;
    }
    float _1917 = _1913;
    int _1919 = ~_1891;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    float _1925 = _1917;
    int _1927 = _1923;
    if (_1813)
    {
        _1915 = _542;
    }
    float _1929 = _1915;
    if (_1813)
    {
        _1905 = _542;
    }
    float _1931 = _1905;
    if (_1813)
    {
        _1909 = _562;
    }
    float _1933 = _1909;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1813)
    {
        _1925 = _562;
    }
    float _1937 = _1925;
    if (!_1837)
    {
        int _1939 = ~_1891;
        int _1941 = _1939 + 1;
        _1927 = _1941;
    }
    int _1943 = _1927;
    bool _1945 = _1773 != 3;
    int _1947 = _1903 ? 0 : 1;
    bool _1949 = _1671 != 3;
    if (_1737)
    {
        _1589 = 0;
    }
    int _1951 = _1589;
    float _1953 = in.m_48.x;
    float _1955 = in.m_48.y;
    float _1957 = in.m_48.z;
    int _1959 = _1951;
    if (!_1737)
    {
        _1959 = 2;
    }
    int _1961 = _1959;
    bool _1963 = !_1883;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = ~_1947;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    bool _1973 = !_1945;
    int _1975 = _1973 ? 0 : (-1);
    bool _1977 = !_1949;
    int _1979 = _1977 ? 0 : (-1);
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1983 = _1981 != 0;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1991 = _1989 != 0;
    int _1993 = _1971;
    if (!_1869)
    {
        int _1995 = ~_1947;
        int _1997 = _1995 + 1;
        _1993 = _1997;
    }
    int _1999 = _1993;
    float _2001 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2009 = _2007 != 0;
    bool _2011 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2013 = isnan(_536);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _556 * 2.0;
    float _2025 = -_2021;
    float _2027 = _2025 + 1.0;
    bool _2029 = !_1983;
    int _2031 = _2029 ? 0 : 1;
    float _2033 = floor(_2023);
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2037 = _1961 != 2;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2041 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2043 = fma(_989, -2.0, _2035);
    float _2045 = _554 * _2027;
    float _2047 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2049 = -_2039;
    float _2051 = fma(_2001, 2.0, _2049);
    float _2053 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2055 = _562 + _556;
    float _2057 = _1881 * _2045;
    float _2059 = -_554;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2041);
    float _2065 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2047);
    float _2067 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2053);
    bool _2069 = _2033 >= 0.0;
    bool _2071 = isnan(_2033);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = _2055 + (-1.0);
    float _2081 = fma(_2061, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2057);
    float _2083 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2085 = _2077 ? 0 : 1;
    float _2087 = fma(_2079, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2089 = _2033 > 0.0;
    float _2091 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2065);
    float _2093 = _2033;
    if (_2037)
    {
        _2093 = _542;
    }
    float _2095 = _2093;
    float _2097 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2063);
    float _2099 = _2095;
    if (!_2037)
    {
        _2099 = _556;
    }
    float _2101 = _2099;
    float _2103 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2067);
    float _2105 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2081);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2113 = _1511 >> 31;
    float _2115 = -_2107;
    float _2117 = fma(_2109, 2.0, _2115);
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2125 = _2113 & 3;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _1511 + _2125;
    float _2135 = _2097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2137 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2139 = _2133 >> 2;
    out.m_63.x = _2127;
    out.m_63.y = _2129;
    out.m_63.z = _2131;
    out.m_63.w = _2111;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2143 = _2139 << 4;
    int _2145 = _2143 + 368;
    float _2147 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2149 = !_1987;
    int _2151 = _2149 ? 0 : 1;
    float _2153 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2141);
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2157 = !_1991;
    int _2159 = _2157 ? 0 : 1;
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2163 = _2137 + _2161;
    int _2165 = ~_2085;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    float _2171 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2155);
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2175 = _2135 + _2173;
    int _2177 = _2169;
    if (!_2089)
    {
        int _2179 = ~_2085;
        int _2181 = _2179 + 1;
        _2177 = _2181;
    }
    int _2183 = _2177;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2187 = _2147 + _2185;
    int _2189 = _1639 >> 31;
    float _2191 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2193 = _1745 >> 31;
    float _2195 = -_146;
    float _2197 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2051);
    int _2199 = _2189 & 3;
    float _2201 = fma(_2163, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2191);
    int _2203 = _2193 & 3;
    float _2205 = -_146;
    float _2207 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2117);
    uint _2209 = uint(int(uint(_2145) >> uint(2)));
    uint _2211 = uint(int(uint(int(_2209)) >> uint(2)));
    int _2213 = int(_2209) & 3;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[int(_2211)][_2213];
    int _2217 = int(_2209) + 1;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    int _2221 = _2217 & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    float _2225 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2201);
    int _2227 = _1745 + _2203;
    float _2229 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2171);
    int _2231 = abs(_2151);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2235 = _2227 >> 2;
    float _2237 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2153);
    int _2239 = abs(_2159);
    float _2241 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2243 = _2235 << 4;
    int _2245 = _2243 + 656;
    int _2247 = _1639 + _2199;
    float _2249 = fma(_2241, -2.0, _2233);
    uint _2251 = uint(int(uint(_2245) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = float(_1943);
    float _2269 = float(_1999);
    float _2271 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2249);
    float _2273 = float(_2231);
    float _2275 = float(_2239);
    int _2277 = _2247 >> 2;
    int _2279 = abs(_2031);
    float _2281 = _2273 * _2267;
    int _2283 = _2277 << 4;
    int _2285 = _2283 + 512;
    float _2287 = _2275 * _2269;
    int _2289 = _2245 + 8;
    uint _2291 = uint(int(uint(_2289) >> uint(2)));
    uint _2293 = uint(int(uint(int(_2291)) >> uint(2)));
    int _2295 = int(_2291) & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    int _2299 = int(_2291) + 1;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    int _2303 = _2299 & 3;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[int(_2301)][_2303];
    bool _2307 = _2225 >= 0.0;
    float _2309 = _2281 * (-2.0);
    float _2311 = float(_2183);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2315 = abs(_1595);
    uint _2317 = uint(int(uint(_2285) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = -_2313;
    float _2335 = fma(_1935, 2.0, _2333);
    int _2337 = ~_1693;
    int _2339 = _2337 + _1765;
    int _2341 = _2339 + 1;
    int _2343 = ~_2315;
    int _2345 = _2343 + 1;
    int _2347 = _2345 + 1;
    float _2349 = -_146;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2335);
    int _2353 = ~_1449;
    int _2355 = _2353 + _1665;
    int _2357 = _2355 + 1;
    if (_2307)
    {
        out.m_51.x = 0.0;
    }
    int _2359 = _2145 + 8;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = ~_1739;
    int _2379 = _2377 + _1859;
    int _2381 = _2379 + 1;
    int _2383 = _2347 * as_type<int>(_2223);
    int _2385 = abs(_1761);
    int _2387 = _560 * _2357;
    int _2389 = _2387 + _1017;
    int _2391 = abs(_1879);
    int _2393 = _616 * _2381;
    int _2395 = _2393 + _1245;
    int _2397 = abs(_1787);
    int _2399 = _2285 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = _634 * _2341;
    int _2423 = _2421 + _1137;
    int _2425 = abs(_1841);
    int _2427 = ~_2397;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    int _2433 = abs(_1727);
    float _2435 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2437 = int(_2435);
    int _2439 = ~_2391;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _2431 * as_type<int>(_2215);
    int _2447 = _2445 + _2383;
    int _2449 = abs(_1653);
    int _2451 = _2443 * as_type<int>(_2265);
    int _2453 = abs(_1827);
    int _2455 = ~_2425;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = ~_2453;
    int _2463 = _2461 + 1;
    int _2465 = _2463 + 1;
    int _2467 = abs(_1781);
    int _2469 = _2459 * as_type<int>(_2257);
    int _2471 = _2469 + _2451;
    int _2473 = ~_2385;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2481 = int(_2479);
    int _2483 = ~_2449;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    int _2489 = _2465 * as_type<int>(_2297);
    int _2491 = _2489 + _2471;
    int _2493 = abs(_1965);
    int _2495 = ~_2467;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    int _2501 = _2477 * as_type<int>(_2331);
    int _2503 = abs(_1677);
    int _2505 = ~_2493;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2499 * as_type<int>(_2323);
    int _2513 = _2511 + _2501;
    int _2515 = ~_2433;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2523 = log2(_2521);
    int _2525 = ~_2503;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    int _2531 = _2487 * as_type<int>(_2367);
    int _2533 = _2531 + _2447;
    float _2535 = float(uint(_2419));
    bool _2537 = _560 == 0;
    int _2539 = _2509 * as_type<int>(_2375);
    int _2541 = _2539 + _2533;
    float _2543 = float(uint(_2481));
    float _2545 = 1.0 / _2535;
    int _2547 = _2519 * as_type<int>(_2407);
    int _2549 = _2547 + _2513;
    int _2551 = abs(_1979);
    int _2553 = _2541 * _2529;
    int _2555 = abs(_1975);
    bool _2557 = !_2005;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2523 * _146;
    int _2563 = ~_2555;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = 1.0 / _2543;
    int _2571 = ~_2551;
    int _2573 = _2571 + 1;
    int _2575 = _2573 + 1;
    int _2577 = abs(_2559);
    int _2579 = _2567 * as_type<int>(_2305);
    int _2581 = _2579 + _2491;
    bool _2583 = !_2009;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2575 * as_type<int>(_2415);
    int _2589 = _2587 + _2549;
    bool _2591 = !_2537;
    int _2593 = _2591 ? _2389 : (-1);
    float _2595 = exp2(_2561);
    int _2597 = ~_2577;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = abs(_2585);
    int _2605 = _2593 * _2503;
    int _2607 = _2605 + _2553;
    float _2609 = float(uint(_2437));
    int _2611 = _2601 * _2589;
    int _2613 = abs(_2437);
    int _2615 = abs(_2419);
    int _2617 = ~_2603;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    float _2623 = 1.0 / _2609;
    int _2625 = abs(_2481);
    float _2627 = float(uint(_2613));
    int _2629 = _2621 * _2581;
    float _2631 = float(uint(_2615));
    bool _2633 = _634 == 0;
    int _2635 = as_type<int>(_2545) + (-2);
    float _2637 = 1.0 / _2627;
    float _2639 = float(uint(_2607));
    float _2641 = float(uint(_2625));
    bool _2643 = !_1277;
    int _2645 = _2643 ? _2395 : (-1);
    bool _2647 = !_2633;
    int _2649 = _2647 ? _2423 : (-1);
    float _2651 = as_type<float>(_2635) * _2639;
    float _2653 = 1.0 / _2631;
    int _2655 = _2645 * _2603;
    int _2657 = _2655 + _2629;
    int _2659 = as_type<int>(_2569) + (-2);
    int _2661 = _2649 * _2577;
    int _2663 = _2661 + _2611;
    int _2665 = as_type<int>(_2623) + (-2);
    float _2667 = float(uint(_2657));
    float _2669 = in.m_65.x;
    float _2671 = in.m_65.y;
    float _2673 = in.m_65.z;
    float _2675 = 1.0 / _2641;
    float _2677 = float(uint(_2663));
    float _2679 = as_type<float>(_2659) * _2667;
    int _2681 = abs(_2663);
    int _2683 = abs(_2607);
    float _2685 = as_type<float>(_2665) * _2677;
    float _2687 = trunc(_2651);
    float _2689 = precise::max(_2687, 0.0);
    uint _2691 = uint(_2689);
    int _2693 = abs(_2657);
    int _2695 = as_type<int>(_2637) + (-2);
    float _2697 = float(uint(_2681));
    int _2699 = as_type<int>(_2653) + (-2);
    float _2701 = trunc(_2685);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = float(uint(_2683));
    float _2709 = as_type<float>(_2695) * _2697;
    int _2711 = ~_2419;
    int _2713 = _2711 + 1;
    int _2715 = as_type<int>(_2675) + (-2);
    float _2717 = as_type<float>(_2699) * _2707;
    float _2719 = float(uint(_2693));
    int _2721 = _2713 * int(_2691);
    int _2723 = _2721 + _2607;
    float _2725 = as_type<float>(_2553);
    float _2727 = _2653;
    if (_2037)
    {
        _2725 = _562;
    }
    float _2729 = _2725;
    float _2731 = trunc(_2679);
    float _2733 = precise::max(_2731, 0.0);
    uint _2735 = uint(_2733);
    float _2737 = as_type<float>(_2715) * _2719;
    float _2739 = _2729;
    if (!_2037)
    {
        _2739 = _542;
    }
    float _2741 = _2739;
    float _2743 = fma(_2309, _2671, _2671);
    float _2745 = float(_2279);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2307)
    {
        _2727 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2749 = _2727;
    float _2751 = _2741 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2753 = float(uint(_2723));
    float _2755 = _2745 * _2311;
    float _2757 = trunc(_2717);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = ~_2437;
    int _2765 = _2763 + 1;
    float _2767 = fma(_2751, -2.0, _2747);
    int _2769 = as_type<int>(_2749);
    if (_2307)
    {
        float _2771 = _2749 * 5.0;
        _2769 = as_type<int>(_2771);
    }
    int _2773 = _2769;
    float _2775 = as_type<float>(_2635) * _2753;
    float _2777 = _2755 * (-2.0);
    float _2779 = trunc(_2737);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    if (_2307)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8634 = as_type<float>(_2773);
        out.gl_Position.z = _8634;
    }
    float _2785 = fma(_2083, _2777, _2083);
    float _2787 = fma(_2777, _2669, _2669);
    int _2789 = ~_2481;
    int _2791 = _2789 + 1;
    float _2793 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2767);
    int _2795 = ~_2613;
    int _2797 = _2795 + 1;
    float _2799 = trunc(_2709);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2615;
    int _2807 = _2805 + 1;
    int _2809 = _2765 * int(_2705);
    int _2811 = _2809 + _2663;
    float _2813 = trunc(_2775);
    float _2815 = precise::max(_2813, 0.0);
    uint _2817 = uint(_2815);
    int _2819 = ~_2625;
    int _2821 = _2819 + 1;
    int _2823 = _2791 * int(_2735);
    int _2825 = _2823 + _2657;
    float _2827 = float(uint(_2811));
    int _2829 = _2807 * int(_2761);
    int _2831 = _2829 + _2683;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2835 = 1.0 + _2833;
    int _2837 = _2821 * int(_2783);
    int _2839 = _2837 + _2693;
    float _2841 = float(uint(_2825));
    float _2843 = as_type<float>(_2665) * _2827;
    float _2845 = float(uint(_2831));
    int _2847 = _2797 * int(_2803);
    int _2849 = _2847 + _2681;
    float _2851 = float(uint(_2839));
    float _2853 = as_type<float>(_2659) * _2841;
    float _2855 = 1.0 / _2835;
    float _2857 = as_type<float>(_2699) * _2845;
    float _2859 = float(uint(_2849));
    float _2861 = as_type<float>(_2715) * _2851;
    float _2863 = -_2595;
    float _2865 = _2863 + 1.0;
    int _2867 = int(_2691) + int(_2817);
    float _2869 = as_type<float>(_2695) * _2859;
    float _2871 = trunc(_2843);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2879 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2043);
    bool _2881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2883 = isnan(1.0);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2889 = _2885 || _2887;
    float _2891 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _590);
    bool _2893 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2895 = isnan(0.0);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2901 = _2897 || _2899;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2905 = trunc(_2853);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    int _2911 = ~_2419;
    int _2913 = _2911 + 1;
    float _2915 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _598);
    float _2917 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2903);
    float _2919 = _542 + (-0.5);
    float _2921 = _562 + (-0.5);
    int _2923 = _2913 * _2867;
    int _2925 = _2923 + _2607;
    float _2927 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2917);
    float _2929 = trunc(_2857);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2877);
    int _2937 = int(_2705) + int(_2875);
    float _2939 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2787);
    int _2941 = ~_2437;
    int _2943 = _2941 + 1;
    float _2945 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2935);
    float _2947 = _2901 ? _2865 : 0.0;
    float _2949 = trunc(_2869);
    float _2951 = precise::max(_2949, 0.0);
    uint _2953 = uint(_2951);
    bool _2955 = uint(_2925) >= uint(_2419);
    int _2957 = _2943 * _2937;
    int _2959 = _2957 + _2663;
    if (_2889)
    {
        float _2961 = _2947 * _2855;
        _148 = _2961;
    }
    float _2963 = _148;
    int _2965 = ~_2615;
    int _2967 = _2965 + 1;
    int _2969 = ~_2625;
    int _2971 = _2969 + 1;
    float _2973 = fma(_2785, _2963, _2939);
    float _2975 = trunc(_2861);
    float _2977 = precise::max(_2975, 0.0);
    uint _2979 = uint(_2977);
    int _2981 = int(_2761) + int(_2933);
    int _2983 = ~_2613;
    int _2985 = _2983 + 1;
    int _2987 = int(_2735) + int(_2909);
    int _2989 = _2967 * _2981;
    int _2991 = _2989 + _2683;
    int _2993 = ~_2481;
    int _2995 = _2993 + 1;
    int _2997 = int(_2803) + int(_2953);
    bool _2999 = uint(_2959) >= uint(_2437);
    int _3001 = _2995 * _2987;
    int _3003 = _3001 + _2657;
    bool _3005 = uint(_2991) >= uint(_2615);
    int _3007 = _2985 * _2997;
    int _3009 = _3007 + _2681;
    bool _3011 = !_2999;
    int _3013 = _3011 ? 0 : (-1);
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = int(_2783) + int(_2979);
    bool _3019 = uint(_3009) >= uint(_2613);
    bool _3021 = !_2955;
    int _3023 = _3021 ? 0 : (-1);
    int _3025 = _2971 * _3017;
    int _3027 = _3025 + _2693;
    bool _3029 = uint(_3003) >= uint(_2481);
    int _3031 = ~_2867;
    int _3033 = _3031 + _3023;
    int _3035 = _3033 + 1;
    bool _3037 = uint(_3027) >= uint(_2625);
    float _3039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3041 = ~_2937;
    int _3043 = _3041 + _3013;
    int _3045 = _3043 + 1;
    int _3047 = _2419 * _3035;
    int _3049 = _3047 + _2607;
    bool _3051 = !_3029;
    int _3053 = _3051 ? 0 : (-1);
    int _3055 = _2607 ^ _2419;
    int _3057 = _2437 * _3045;
    int _3059 = _3057 + _2663;
    bool _3061 = !_3005;
    int _3063 = _3061 ? 0 : (-1);
    int _3065 = ~_2987;
    int _3067 = _3065 + _3053;
    int _3069 = _3067 + 1;
    bool _3071 = _2437 == 0;
    int _3073 = _2663 ^ _2437;
    bool _3075 = _2419 == 0;
    float _3077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3079 = _2657 ^ _2481;
    int _3081 = _2481 * _3069;
    int _3083 = _3081 + _2657;
    bool _3085 = !_3071;
    int _3087 = _3085 ? _3059 : (-1);
    bool _3089 = !_3019;
    int _3091 = _3089 ? 0 : (-1);
    int _3093 = ~_3063;
    int _3095 = _2981 + _3093;
    int _3097 = _3095 + 1;
    float _3099 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3101 = !_3075;
    int _3103 = _3101 ? _3049 : (-1);
    float _3105 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3107 = float(_3087);
    float _3109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3111 = ~_3091;
    int _3113 = _2997 + _3111;
    int _3115 = _3113 + 1;
    float _3117 = fma(_3099, _857, -0.5);
    uint _3119 = uint(int(uint(_3055) >> uint(31)));
    float _3121 = fma(_3105, _849, -0.5);
    bool _3123 = _2481 == 0;
    float _3125 = fma(_3105, _3107, _2351);
    float _3127 = float(_3103);
    uint _3129 = uint(int(uint(_3073) >> uint(31)));
    float _3131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3133 = ~int(_3119);
    int _3135 = _3133 + 1;
    float _3137 = fma(_3099, _3127, _2197);
    bool _3139 = !_3123;
    int _3141 = _3139 ? _3083 : (-1);
    float _3143 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3145 = ~int(_3129);
    int _3147 = _3145 + 1;
    float _3149 = fma(_2945, _3117, _3137);
    int _3151 = _3097 ^ _3135;
    float _3153 = fma(_3143, _1479, -0.5);
    bool _3155 = _2481 == 0;
    float _3157 = fma(_2229, _3121, _3125);
    float _3159 = float(_3141);
    bool _3161 = !_3037;
    int _3163 = _3161 ? 0 : (-1);
    uint _3165 = uint(int(uint(_3079) >> uint(31)));
    float _3167 = fma(_3143, _3159, _2207);
    int _3169 = _3115 ^ _3147;
    float _3171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3173 = _2419 == 0;
    float _3175 = fma(_2891, _3153, _3167);
    int _3177 = ~_3135;
    int _3179 = _3177 + _3151;
    int _3181 = _3179 + 1;
    float _3183 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3185 = ~_3163;
    int _3187 = _3017 + _3185;
    int _3189 = _3187 + 1;
    float _3191 = _2175 * _2175;
    int _3193 = ~int(_3165);
    int _3195 = _3193 + 1;
    float _3197 = _3131 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3199 = _2437 == 0;
    float _3201 = fma(_749, _3183, -0.5);
    int _3203 = ~_3147;
    int _3205 = _3203 + _3169;
    int _3207 = _3205 + 1;
    float _3209 = fma(_2163, _2163, _3191);
    bool _3211 = !_3173;
    int _3213 = _3211 ? _3181 : (-1);
    float _3215 = fma(_803, _3197, -0.5);
    int _3217 = _3189 ^ _3195;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3221 = !_3199;
    int _3223 = _3221 ? _3207 : (-1);
    float _3225 = fma(_2087, _2309, _2087);
    float _3227 = float(_3213);
    float _3229 = fma(_3219, _811, -0.5);
    int _3231 = ~_3195;
    int _3233 = _3231 + _3217;
    int _3235 = _3233 + 1;
    float _3237 = float(_3223);
    float _3239 = -_2879;
    float _3241 = fma(_3183, _3227, _3239);
    bool _3243 = !_3155;
    int _3245 = _3243 ? _3235 : (-1);
    float _3247 = -_2271;
    float _3249 = fma(_3197, _3237, _3247);
    float _3251 = fma(_2187, _2187, _3209);
    float _3253 = float(_3245);
    float _3255 = fma(_2927, _3201, _3241);
    float _3257 = fma(_2237, _3215, _3249);
    float _3259 = _3149 + 0.5;
    float _3261 = -_2793;
    float _3263 = fma(_3219, _3253, _3261);
    float _3265 = rsqrt(_3251);
    float _3267 = _3175 + 0.5;
    float _3269 = _3255 + 0.5;
    float _3271 = fma(_2915, _3229, _3263);
    float _3273 = _3157 + 0.5;
    float _3275 = _3257 + 0.5;
    float _3277 = _3271 + 0.5;
    out.m_67.x = _3259;
    out.m_67.y = _3269;
    out.m_67.z = _3273;
    out.m_67.w = _3275;
    out.m_69.x = _3267;
    out.m_69.y = _3277;
    float _3279 = _2175 * _3265;
    float _3281 = _2163 * _3265;
    if (_2307)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3283 = -_3279;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2135);
    float _3287 = _2973 * 0.15915493667125701904296875;
    float _3289 = -_3281;
    float _3291 = fma(_3289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2137);
    float _3293 = _2187 * _3265;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3285 + _3295;
    float _3299 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2743);
    float _3301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3303 = _3291 + _3301;
    float _3305 = _3297 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3307 = _542 + _556;
    float _3309 = -_3293;
    float _3311 = fma(_3309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2147);
    float _3313 = _556 + (-0.5);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3305);
    float _3317 = _3307 + (-1.0);
    float _3319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3321 = _3311 + _3319;
    float _3323 = _2287 * (-2.0);
    float _3325 = -_3279;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2175);
    float _3329 = fma(_3317, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3315);
    float _3333 = fma(_3323, _2673, _2673);
    float _3335 = fma(_3225, _2963, _3299);
    float _3337 = fma(_3329, _3323, _3329);
    float _3339 = -_3281;
    float _3341 = fma(_3339, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2163);
    bool _3343 = _3331 >= 0.0;
    float _3345 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3333);
    float _3347 = _3327 * _3327;
    float _3349 = _3335 * 0.15915493667125701904296875;
    float _3351 = -_3293;
    float _3353 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    float _3355 = fma(_3337, _2963, _3345);
    float _3357 = fma(_3341, _3341, _3347);
    float _3359 = _3287 * 6.283185482025146484375;
    float _3361 = sin(_3359);
    float _3363 = _3355 * 0.15915493667125701904296875;
    float _3365 = fma(_3353, _3353, _3357);
    float _3367 = _3345;
    float _3369 = _3365;
    float _3371 = _3353;
    float _3373 = _3341;
    if (_3343)
    {
        _3367 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3375 = _3367;
    int _3377 = as_type<int>(_3375);
    if (_3343)
    {
        out.m_51.x = 0.0;
    }
    float _3379 = _3287 * 6.283185482025146484375;
    float _3381 = cos(_3379);
    if (_3343)
    {
        float _3383 = _3375 * 5.0;
        _3377 = as_type<int>(_3383);
    }
    int _3385 = _3377;
    float _3387 = _3349 * 6.283185482025146484375;
    float _3389 = sin(_3387);
    if (_3343)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9553 = as_type<float>(_3385);
        out.gl_Position.z = _9553;
    }
    float _3391 = _3349 * 6.283185482025146484375;
    float _3393 = cos(_3391);
    float _3395 = _3363 * 6.283185482025146484375;
    float _3397 = sin(_3395);
    float _3399 = _3361 * _3389;
    float _3401 = sqrt(_3365);
    float _3403 = _3381 * _3393;
    if (_3343)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3405 = -_2135;
    float _3407 = _3405 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3409 = -_2137;
    float _3411 = _3409 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3413 = -_2147;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3417 = in.m_71.x;
    float _3419 = in.m_71.y;
    float _3421 = in.m_71.z;
    float _3423 = _3407 * _3407;
    float _3425 = _3363 * 6.283185482025146484375;
    float _3427 = cos(_3425);
    float _3429 = _3265 * _3401;
    float _3431 = _478 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3433 = fma(_3411, _3411, _3423);
    float _3435 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3437 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3439 = fma(_3415, _3415, _3433);
    float _3441 = _3429 * _3431;
    float _3443 = _3429 * _3435;
    float _3445 = fma(_3397, _3403, _3399);
    float _3447 = rsqrt(_3439);
    float _3449 = _3381 * _3389;
    float _3451 = _3361 * _3393;
    float _3453 = fma(_3397, _3399, _3403);
    float _3455 = _3429 * _3437;
    float _3457 = _3381 * _3427;
    float _3459 = _3361 * _3427;
    float _3461 = _3393 * _3427;
    float _3463 = _3389 * _3427;
    float _3465 = -_3449;
    float _3467 = fma(_3397, _3451, _3465);
    float _3469 = -_3451;
    float _3471 = fma(_3397, _3449, _3469);
    float _3473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3417);
    float _3475 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3419);
    bool _3477 = _3419 != 0.0;
    bool _3479 = isnan(_3419);
    bool _3481 = _3477 || _3479;
    bool _3483 = isnan(0.0);
    bool _3485 = _3481 || _3483;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3421);
    float _3489 = _3455 * _3473;
    float _3491 = _3411 * _3447;
    float _3493 = _3415 * _3447;
    float _3495 = _3407 * _3447;
    float _3497 = _3443 * _3475;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3501 = _3491 * _3499;
    float _3503 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3505 = _3493 * _3503;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3515 = _3495 * _3513;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = -_3501;
    float _3521 = fma(_3493, _3517, _3519);
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3525 = -_3505;
    float _3527 = fma(_3495, _3523, _3525);
    bool _3529 = _3417 == 0.0;
    bool _3531 = !_3485;
    bool _3533 = _3529 && _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3537 = -_3515;
    float _3539 = fma(_3491, _3535, _3537);
    float _3541 = _3521 * _3521;
    float _3543 = -_3497;
    float _3545 = _3397 * _3543;
    float _3547 = _3441 * _3487;
    bool _3549 = _3421 == 0.0;
    bool _3551 = _3549 && _3533;
    float _3553 = fma(_3527, _3527, _3541);
    float _3555 = in.m_75.x;
    float _3557 = in.m_75.y;
    float _3559 = in.m_75.z;
    float _3561 = in.m_75.w;
    float _3563 = fma(_3461, _3489, _3545);
    float _3565 = _3457 * _3497;
    float _3567 = fma(_3539, _3539, _3553);
    float _3569 = _3459 * _3497;
    float _3571 = fma(_3445, _3489, _3565);
    float _3573 = rsqrt(_3567);
    float _3575 = fma(_3467, _3489, _3569);
    float _3577 = _3565;
    float _3579 = _3497;
    float _3581 = _3507;
    if (_3551)
    {
        _3369 = _3509;
    }
    float _3583 = _3369;
    float _3585 = _3583;
    if (_3551)
    {
        _3371 = _3507;
    }
    float _3587 = _3371;
    float _3589 = fma(_3471, _3547, _3571);
    float _3591 = _3587;
    if (_3551)
    {
        _3373 = _3511;
    }
    float _3593 = _3373;
    float _3595 = _3593;
    if (_3551)
    {
        _3577 = _3583;
    }
    float _3597 = _3577;
    float _3599 = _3597;
    if (_3551)
    {
        _3579 = _3587;
    }
    float _3601 = _3579;
    float _3603 = _3601;
    if (!_3551)
    {
        _3585 = _3509;
    }
    float _3605 = _3585;
    float _3607 = _3521 * _3573;
    if (!_3551)
    {
        _3591 = _3507;
    }
    float _3609 = _3591;
    float _3611 = _3527 * _3573;
    if (_3551)
    {
        _3581 = _3593;
    }
    float _3613 = _3581;
    float _3615 = _3613;
    if (!_3551)
    {
        float _3617 = fma(_3419, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3605);
        _3599 = _3617;
    }
    float _3619 = _3599;
    if (!_3551)
    {
        _3595 = _3511;
    }
    float _3621 = _3595;
    float _3623 = fma(_3463, _3547, _3563);
    float _3625 = _3539 * _3573;
    float _3627 = _3493 * _3607;
    float _3629 = _3495 * _3611;
    float _3631 = _3559 * _3609;
    if (!_3551)
    {
        float _3633 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3609);
        _3603 = _3633;
    }
    float _3635 = _3603;
    float _3637 = -_3627;
    float _3639 = fma(_3495, _3625, _3637);
    float _3641 = -_3629;
    float _3643 = fma(_3491, _3607, _3641);
    float _3645 = -_3631;
    float _3647 = fma(_3555, _3621, _3645);
    float _3649 = _3557 * _3621;
    float _3651 = _3555 * _3605;
    float _3653 = _3639 * _3589;
    float _3655 = _3643 * _3589;
    if (!_3551)
    {
        float _3657 = fma(_3421, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3621);
        _3615 = _3657;
    }
    float _3659 = _3615;
    float _3661 = fma(_3453, _3547, _3575);
    float _3663 = -_3649;
    float _3665 = fma(_3559, _3605, _3663);
    float _3667 = -_3651;
    float _3669 = fma(_3557, _3609, _3667);
    float _3671 = fma(_3611, _3623, _3653);
    float _3673 = fma(_3625, _3623, _3655);
    float _3675 = _3665 * _3561;
    float _3677 = _3491 * _3625;
    float _3679 = fma(_3491, _3661, _3671);
    float _3681 = fma(_3493, _3661, _3673);
    float _3683 = _3647 * _3561;
    float _3685 = _3669 * _3561;
    float _3687 = -_3677;
    float _3689 = fma(_3493, _3611, _3687);
    float _3691 = _2137 + _3679;
    float _3693 = _2147 + _3681;
    float _3695 = _3445 * _3639;
    float _3697 = _3445 * _3689;
    float _3699 = _3445 * _3643;
    float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3703 = _3691 + _3701;
    float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3707 = _3693 + _3705;
    float _3709 = _3457 * _3639;
    float _3711 = _3471 * _3639;
    float _3713 = _3703 * _3703;
    float _3715 = _3707 * _3707;
    float _3717 = _3457 * _3689;
    float _3719 = _3457 * _3643;
    float _3721 = _3471 * _3643;
    float _3723 = _3713 + _3715;
    float _3725 = _3471 * _3689;
    float _3727 = fma(_3461, _3611, _3695);
    float _3729 = fma(_3461, _3607, _3697);
    float _3731 = fma(_3461, _3625, _3699);
    float _3733 = _3689 * _3589;
    float _3735 = sqrt(_3723);
    float _3737 = fma(_3463, _3611, _3711);
    float _3739 = -_3397;
    float _3741 = fma(_3739, _3611, _3709);
    float _3743 = fma(_3607, _3623, _3733);
    float _3745 = -_3397;
    float _3747 = fma(_3745, _3607, _3717);
    float _3749 = -_3397;
    float _3751 = fma(_3749, _3625, _3719);
    float _3753 = fma(_3463, _3625, _3721);
    float _3755 = fma(_3463, _3607, _3725);
    float _3757 = fma(_3495, _3661, _3743);
    float _3759 = fma(_3459, _3491, _3741);
    float _3761 = fma(_3459, _3495, _3747);
    float _3763 = fma(_3459, _3493, _3751);
    float _3765 = _2135 + _3757;
    float _3767 = fma(_3467, _3491, _3727);
    float _3769 = fma(_3467, _3495, _3729);
    float _3771 = fma(_3453, _3491, _3737);
    bool _3773 = _3735 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3775 = fma(_3453, _3495, _3755);
    float _3777 = fma(_3467, _3493, _3731);
    float _3779 = fma(_3453, _3493, _3753);
    float _3781 = _3759 * _3557;
    float _3783 = _3761 * _3557;
    float _3785 = _3763 * _3557;
    float _3787 = _3759 * _3619;
    float _3789 = _3683 * _3759;
    float _3791 = _3761 * _3619;
    float _3793 = _3763 * _3619;
    float _3795 = _3683 * _3761;
    float _3797 = _3683 * _3763;
    float _3799 = _3759;
    float _3801 = _3713;
    float _3803 = _3715;
    float _3805 = _3691;
    float _3807 = _3693;
    float _3809 = _3659;
    if (!_3773)
    {
        _3799 = _3765;
    }
    float _3811 = _3799;
    bool _3813 = !_3773;
    float _3815 = _3811;
    if (!_3813)
    {
        float _3817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3821 = _3735 + _3819;
        float _3823 = _3765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3825 = rsqrt(_3723);
        float _3827 = _3821 * _3817;
        float _3829 = _3827 * 0.15915493667125701904296875;
        float _3831 = _3829 * 6.283185482025146484375;
        float _3833 = sin(_3831);
        float _3835 = _3829 * 6.283185482025146484375;
        float _3837 = cos(_3835);
        float _3839 = fma(_3833, _3823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3841 = _3825 * _3839;
        float _3843 = _3837 + (-1.0);
        float _3845 = fma(_3703, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3847 = fma(_3707, _3841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3849 = _3843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3853 = _3845 + _3851;
        float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3857 = _3847 + _3855;
        float _3859 = fma(_3765, _3837, _3849);
        float _3861 = _3853 * _3853;
        float _3863 = _3857 * _3857;
        _3815 = _3859;
        _3801 = _3861;
        _3803 = _3863;
        _3805 = _3845;
        _3807 = _3847;
    }
    float _3865 = _3815;
    float _3867 = _3801;
    float _3869 = _3803;
    float _3871 = _3805;
    float _3873 = _3807;
    float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3877 = _3865 + _3875;
    float _3879 = fma(_3767, _3555, _3781);
    float _3881 = fma(_3769, _3555, _3783);
    float _3883 = fma(_3767, _3635, _3787);
    float _3885 = fma(_3877, _3877, _3867);
    float _3887 = fma(_3769, _3635, _3791);
    float _3889 = fma(_3777, _3555, _3785);
    float _3891 = fma(_3675, _3767, _3789);
    float _3893 = _3885 + _3869;
    float _3895 = fma(_3777, _3635, _3793);
    float _3897 = fma(_3675, _3769, _3795);
    float _3899 = fma(_3675, _3777, _3797);
    float _3901 = fma(_3771, _3559, _3879);
    float _3903 = fma(_3775, _3559, _3881);
    float _3905 = sqrt(_3893);
    float _3907 = fma(_3771, _3659, _3883);
    float _3909 = fma(_3775, _3659, _3887);
    float _3911 = fma(_3779, _3559, _3889);
    float _3913 = fma(_3685, _3771, _3891);
    float _3915 = fma(_3685, _3775, _3897);
    float _3917 = fma(_3685, _3779, _3899);
    float _3919 = fma(_3779, _3659, _3895);
    out.m_77.x = _3901;
    out.m_77.y = _3903;
    out.m_77.z = _3911;
    out.m_79.x = _3913;
    out.m_79.y = _3915;
    out.m_79.z = _3917;
    out.m_81.x = _3907;
    out.m_81.y = _3909;
    out.m_81.z = _3919;
    bool _3921 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3923 = isnan(_3905);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3929 = _3925 || _3927;
    float _3931 = _3897;
    float _3933 = _3913;
    if (!_3929)
    {
        _3809 = 1.0;
    }
    float _3935 = _3809;
    bool _3937 = !_3929;
    float _3939 = _3935;
    if (!_3937)
    {
        bool _3941 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3943 = isnan(_3905);
        bool _3945 = _3941 || _3943;
        bool _3947 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3949 = _3945 || _3947;
        if (!_3949)
        {
            float _3951 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3953 = _3905 + _3951;
            float _3955 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3957 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3955;
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3963 = 1.0 / _3957;
            float _3965 = _3953 * _3963;
            float _3967 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3939 = _3967;
            _3969 = true;
        }
        else
        {
            bool _3971 = _3905 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3973 = isnan(_3905);
            bool _3975 = _3971 || _3973;
            bool _3977 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3979 = _3975 || _3977;
            if (!_3979)
            {
                float _3981 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3983 = _3905 + _3981;
                float _3985 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3987 = _3985 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3991 = _3989 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3993 = 1.0 / _3987;
                float _3995 = _3983 * _3993;
                float _3997 = fma(_3995, _3991, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3939 = _3997;
                _3969 = true;
            }
            else
            {
                _3939 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3969 = false;
    float _3999 = _3939;
    float _4001 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4003 = _3865 + _4001;
    float _4005 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4007 = _3871 + _4005;
    float _4009 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4013 = _3873 + _4011;
    float _4015 = fma(_4007, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4017 = -_3279;
    float _4019 = fma(_4017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4009);
    float _4021 = fma(_4013, _3999, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4023 = -_3281;
    float _4025 = fma(_4023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4015);
    float _4027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4029 = _4019 + _4027;
    float _4031 = -_3293;
    float _4033 = fma(_4031, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4021);
    float _4035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4037 = _4025 + _4035;
    float _4039 = _4029 * _4029;
    float _4041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4043 = _4033 + _4041;
    float _4045 = fma(_4037, _4037, _4039);
    float _4047 = fma(_4043, _4043, _4045);
    float _4049 = rsqrt(_4047);
    float _4051 = _4049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4053 = _4037 * _4051;
    float _4055 = _4043 * _4051;
    float _4057 = _4053 * _4053;
    float _4059 = _4055 * _4055;
    float _4061 = _4057 + _4059;
    float _4063 = sqrt(_4061);
    bool _4065 = _4063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4069 = _4063 + _4067;
    float _4071 = _4049;
    float _4073 = _4061;
    float _4075 = _4069;
    float _4077 = _4029;
    float _4079 = _4051;
    float _4081 = _4053;
    if (_4065)
    {
        float _4083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4071 = _4083;
    }
    float _4085 = _4071;
    if (_4065)
    {
        float _4087 = rsqrt(_4061);
        _4073 = _4087;
    }
    float _4089 = _4073;
    if (_4065)
    {
        float _4091 = _4069 * _4085;
        _4075 = _4091;
    }
    float _4093 = _4075;
    if (_4065)
    {
        float _4095 = _4093 * 0.15915493667125701904296875;
        _3931 = _4095;
    }
    float _4097 = _3931;
    float _4099 = _4085;
    if (_4065)
    {
        float _4101 = _4097 * 6.283185482025146484375;
        float _4103 = sin(_4101);
        _4099 = _4103;
    }
    float _4105 = _4099;
    float _4107 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4109 = precise::max(0.0, _4107);
    float _4111 = _4043;
    float _4113 = _4109;
    if (_4065)
    {
        float _4115 = _4097 * 6.283185482025146484375;
        float _4117 = cos(_4115);
        _4111 = _4117;
    }
    float _4119 = _4111;
    float _4121 = -_4051;
    float _4123 = -_4109;
    float _4125 = fma(_4029, _4121, _4123);
    float _4127 = _4125;
    if (!_4065)
    {
        _4077 = _4057;
    }
    float _4129 = _4077;
    float _4131 = _4129;
    if (_4065)
    {
        float _4133 = _4125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4113 = _4133;
    }
    float _4135 = _4113;
    float _4137 = _4105;
    float _4139 = _4135;
    if (_4065)
    {
        float _4141 = fma(_4105, _4135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4137 = _4141;
    }
    float _4143 = _4137;
    float _4145 = _4143;
    float _4147 = _4119;
    if (_4065)
    {
        float _4149 = _4119 + (-1.0);
        _4139 = _4149;
    }
    float _4151 = _4139;
    if (_4065)
    {
        float _4153 = _4089 * _4143;
        _3933 = _4153;
    }
    float _4155 = _3933;
    if (!_4065)
    {
        _4145 = _4055;
    }
    float _4157 = _4145;
    float _4159 = _4157;
    if (_4065)
    {
        float _4161 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4079 = _4161;
    }
    float _4163 = _4079;
    if (_4065)
    {
        float _4165 = _4053 * _4155;
        _4081 = _4165;
    }
    float _4167 = _4081;
    if (_4065)
    {
        float _4169 = _4055 * _4155;
        _4159 = _4169;
    }
    float _4171 = _4159;
    float _4173 = sqrt(_4047);
    if (_4065)
    {
        float _4175 = fma(_4125, _4119, _4163);
        _4127 = _4175;
    }
    float _4177 = _4127;
    if (_4065)
    {
        float _4179 = _4167 * _4167;
        _4131 = _4179;
    }
    float _4181 = _4131;
    if (!_4065)
    {
        _4147 = _4059;
    }
    float _4183 = _4147;
    float _4185 = _4183;
    if (_4065)
    {
        float _4187 = _4171 * _4171;
        _4185 = _4187;
    }
    float _4189 = _4185;
    float _4191 = fma(_4177, _4177, _4181);
    float _4193 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4195 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4197 = _4191 + _4189;
    float _4199 = fma(_3291, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4203 = _4019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4205 = rsqrt(_4197);
    float _4207 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4193);
    float _4209 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4201);
    float _4211 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4203);
    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4215 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4213);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4195);
    float _4221 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4209);
    float _4223 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4211);
    float _4225 = -_4217;
    float _4227 = _4225 + 1.0;
    float _4229 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4207);
    float _4231 = fma(_4033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4219);
    float _4233 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4235 = _4223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4237 = _4229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4241 = abs(_4227);
    float _4243 = log2(_4241);
    float _4245 = _4205 * _4167;
    float _4247 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4249 = _4205 * _4177;
    float _4251 = _4205 * _4171;
    float _4253 = _4245 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4255 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4247);
    float _4257 = floor(_4199);
    float _4259 = -_4253;
    float _4261 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4259);
    float _4263 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4265 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4255);
    float _4267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4269 = -_4251;
    float _4271 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4261);
    float _4273 = _4237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4275 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4265);
    float _4277 = floor(_4263);
    float _4279 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4281 = -_4273;
    float _4283 = fma(_4281, _4267, 1.0);
    float _4285 = fma(_4271, -0.5, 0.5);
    float _4287 = fma(_4271, 0.5, 0.5);
    float _4289 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4291 = exp2(_4279);
    float _4293 = -_4257;
    float _4295 = _4199 + _4293;
    float _4297 = fma(_4287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4299 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4289);
    float _4301 = fma(_4287, _4297, -0.212114393711090087890625);
    float _4303 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4305 = 1.0 / _4275;
    float _4307 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4309 = fma(_4287, _4301, 1.570728778839111328125);
    float _4311 = _4249 + 1.0;
    float _4313 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4307);
    float _4315 = log2(_4283);
    float _4317 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4313);
    float _4319 = -_4249;
    float _4321 = fma(_4291, _4311, _4319);
    float _4323 = sqrt(_4285);
    float _4325 = _4315 * 0.693147182464599609375;
    float _4327 = -_4277;
    float _4329 = _4263 + _4327;
    float _4331 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4303);
    float _4333 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4317);
    float _4335 = fma(_4321, 0.5, 0.5);
    float2 _11114 = float2(_4295, _4329);
    float _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11114, float2(0.0), isnan(_11114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11114, float2(0.0), isnan(_11114)), level(0.0)).x;
    float _4339 = _4331 * _4305;
    float _4341 = _4333 * _4305;
    float _4343 = _4323 * 0.636619746685028076171875;
    float _4345 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4347 = fma(_4339, 0.5, 0.5);
    float _4349 = fma(_4341, -0.5, 0.5);
    float _4351 = -_4309;
    float _4353 = fma(_4343, _4351, 1.0);
    float3 _11147 = float3(_4347, _4349, _4345);
    float _4355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11147, float3(0.0), isnan(_11147)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11147, float3(0.0), isnan(_11147)), level(0.0)).x;
    float3 _11158 = float3(_4347, _4349, _4345);
    float4 _4358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11158, float3(0.0), isnan(_11158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11158, float3(0.0), isnan(_11158)), level(0.0)).xyzw;
    float _4360 = _4358.x;
    float _4362 = _4358.y;
    float _4364 = _4358.z;
    float _4366 = _4358.w;
    float2 _11174 = float2(_4353, _4335);
    float3 _4370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11174, float2(0.0), isnan(_11174)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11174, float2(0.0), isnan(_11174)), level(0.0)).xyz;
    float _4372 = _4370.x;
    float _4374 = _4370.y;
    float _4376 = _4370.z;
    float _4378 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4380 = _3285 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4382 = _4233 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4384 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4386 = isnan(_4173);
    bool _4388 = _4384 || _4386;
    bool _4390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4392 = _4388 || _4390;
    float _4394 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4378);
    float _4396 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4380);
    float _4398 = fma(_4235, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4382);
    float _4400 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4402 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4394);
    float _4404 = fma(_3311, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4396);
    float _4406 = fma(_4237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4398);
    float _4408 = _4402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4410 = _4404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4412 = exp2(_4400);
    float _4414 = fma(_4239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4406);
    float _4416 = _4410 + _4408;
    float _4418 = in.m_83.x;
    float _4420 = _4414 + _4275;
    float _4422 = 1.0 / _4408;
    out.gl_Position.x = _4331;
    out.gl_Position.y = _4333;
    out.gl_Position.z = _4414;
    out.gl_Position.w = _4275;
    float _4424 = -_4412;
    float _4426 = _4424 + 1.0;
    float _4428 = _4426 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4430 = _4416 * _4422;
    float _4432 = _4430 * 0.5;
    float _4434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4436 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4434);
    float _4438 = 1.0 / _4436;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4442 = _4438 * _4440;
    float _4444 = abs(_4442);
    float _4446 = log2(_4444);
    bool _4448 = _4442 <= 8000.0;
    bool _4450 = isnan(_4442);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(8000.0);
    bool _4456 = _4452 || _4454;
    float _4458 = float(_4456);
    float _4460 = _4446 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4462 = exp2(_4460);
    float _4464 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4466 = precise::clamp(_4464, 0.0, 1.0);
    float _4468 = fma(_4466, -2.0, 3.0);
    float _4470 = _4466 * _4466;
    float _4472 = _4470 * _4468;
    float _4474 = -_4472;
    float _4476 = _4474 + 1.0;
    float _4478 = fma(_4476, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4472);
    float _4480 = _4420 * 0.5;
    float _4482 = _4458 * _4478;
    out.m_85.z = _4480;
    out.m_85.w = _4275;
    float _4484 = _4482 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4486 = _4275;
    float _4488 = _4480;
    if (!_4392)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4486;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4392)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4488;
    float _4498 = -_4337;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500 * _4484;
    float _4504 = precise::clamp(_4502, 0.0, 1.0);
    float _4506 = -_4504;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4510 = _4428 * _4355;
    float _4512 = -_4428;
    float _4514 = _4512 + 1.0;
    float _4516 = _4508 * _4418;
    float _4518 = _4366 * _4510;
    float _4520 = _4376 * _4510;
    float _4522 = _4366 * _4514;
    float _4524 = _4516 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4526 = fma(_4372, _4518, _4360);
    float _4528 = fma(_4374, _4518, _4362);
    float _4530 = fma(_4366, _4520, _4364);
    float _4532 = _4518;
    float _4534 = _4496;
    float _4536 = _4496;
    if (!_4392)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4538 = _4532;
    out.m_87.x = _4524;
    out.m_89.x = _4526;
    out.m_89.y = _4528;
    out.m_89.z = _4530;
    out.m_89.w = _4522;
    bool _4540 = !_4392;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        bool _4546 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4548 = isnan(_4173);
        bool _4550 = _4546 || _4548;
        bool _4552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4554 = _4550 || _4552;
        if (!_4554)
        {
            float _4556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4558 = _4173 + _4556;
            float _4560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4562 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4560;
            float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4566 = _4564 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4570 = _4568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4572 = 1.0 / _4562;
            float _4574 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4578 = _4558 * _4572;
            float _4580 = precise::clamp(_4578, 0.0, 1.0);
            float _4582 = fma(_4580, _4566, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4584 = fma(_4580, _4570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4586 = fma(_4580, _4576, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4536 = _4584;
            _4494 = _4582;
            _4544 = _4586;
            _4588 = true;
        }
        else
        {
            bool _4590 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4592 = isnan(_4173);
            bool _4594 = _4590 || _4592;
            bool _4596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4598 = _4594 || _4596;
            if (!_4598)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4600 = _4492;
            _4494 = _4600;
            if (!_4598)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4602 = _4534;
            _4536 = _4602;
            if (!_4598)
            {
                _4542 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4604 = _4542;
            bool _4606 = !_4598;
            _4544 = _4604;
            if (!_4606)
            {
                bool _4608 = _4173 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4610 = isnan(_4173);
                bool _4612 = _4608 || _4610;
                bool _4614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4616 = _4612 || _4614;
                if (!_4616)
                {
                    float _4618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4620 = _4173 + _4618;
                    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4622;
                    float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4632 = _4630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4634 = 1.0 / _4624;
                    float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4640 = _4620 * _4634;
                    float _4642 = precise::clamp(_4640, 0.0, 1.0);
                    float _4644 = fma(_4642, _4628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4646 = fma(_4642, _4632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4648 = fma(_4642, _4638, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4536 = _4646;
                    _4494 = _4644;
                    _4544 = _4648;
                    _4588 = true;
                }
                else
                {
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4544 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4588 = false;
    float _4650 = _4536;
    float _4652 = _4494;
    float _4654 = _4544;
    float _4656 = _4650 * 0.586610972881317138671875;
    bool _4658 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4660 = fma(_4652, 0.298911988735198974609375, _4656);
    out.m_91.x = 0.0;
    float _4662 = fma(_4654, 0.114477999508380889892578125, _4660);
    float _4664 = -_4662;
    float _4666 = _4664 + _4652;
    float _4668 = -_4662;
    float _4670 = _4668 + _4650;
    float _4672 = -_4662;
    float _4674 = _4672 + _4654;
    float _4676 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4680 = fma(_4670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    float _4682 = fma(_4674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4662);
    out.m_87.w = _4676;
    out.m_93.x = _4678;
    out.m_93.y = _4680;
    out.m_93.z = _4682;
    if (!_4658)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4684 = -_4019;
    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4688 = -_4025;
    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4692 = -_4033;
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4696 = _4686 * _4686;
    float _4698 = fma(_4690, _4690, _4696);
    float _4700 = fma(_4694, _4694, _4698);
    float _4702 = sqrt(_4700);
    float _4704 = rsqrt(_4700);
    float _4706 = -_4702;
    float _4708 = _4706 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4710 = _4708 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4712 = precise::clamp(_4710, 0.0, 1.0);
    float _4714 = _4690 * _4704;
    float _4716 = _4686 * _4704;
    float _4718 = abs(_4712);
    float _4720 = log2(_4718);
    float _4722 = _4694 * _4704;
    float _4724 = _4714 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4726 = _3909 * _4716;
    float _4728 = -_4716;
    float _4730 = -_4724;
    float _4732 = fma(_4728, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4730);
    float _4734 = fma(_3907, _4714, _4726);
    float _4736 = -_4722;
    float _4738 = fma(_4736, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4732);
    float _4740 = fma(_3919, _4722, _4734);
    float _4742 = precise::clamp(_4740, 0.0, 1.0);
    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4746 = _4738 + _4744;
    float _4748 = _4720 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4752 = precise::clamp(_4750, 0.0, 1.0);
    float _4754 = exp2(_4748);
    float _4756 = _4754 * _4752;
    float _4758 = _4742 * _4756;
    float _4760 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4762 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4760;
    out.m_91.y = _4762;
    out.m_91.z = _4764;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

