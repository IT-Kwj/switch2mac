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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2358 = false;
    bool _346 = false;
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
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_128);
        out.gl_Position.z = _2644;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = 1.0 / _134;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.x;
    float _180 = in.m_59.y;
    float _182 = in.m_59.z;
    float _184 = _164 * _164;
    float _186 = _166 * _166;
    float _188 = _168 * _168;
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _202 > 0.0;
    bool _210 = _204 > 0.0;
    float _212 = _204;
    if (_208)
    {
        float _214 = rsqrt(_196);
        _212 = _214;
    }
    float _216 = _212;
    float _218 = 0.0;
    float _220 = 0.0;
    if (!_208)
    {
        _218 = 0.0;
        _220 = 0.0;
    }
    float _222 = _218;
    float _224 = _220;
    bool _226 = _206 > 0.0;
    float _228 = 0.0;
    float _230 = _222;
    float _232 = _224;
    if (!_208)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_210)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _242 = _236;
    float _244 = _238;
    float _246 = _202;
    float _248 = _244;
    float _250 = _242;
    if (_210)
    {
        float _252 = rsqrt(_198);
        _246 = _252;
    }
    float _254 = _246;
    float _256 = 0.0;
    if (!_210)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_226)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _206;
    float _268 = _264;
    if (_226)
    {
        float _270 = rsqrt(_200);
        _266 = _270;
    }
    float _272 = _266;
    if (_208)
    {
        float _274 = _216 * _164;
        _240 = _274;
    }
    float _276 = _240;
    if (_208)
    {
        float _278 = _216 * _172;
        _230 = _278;
    }
    float _280 = _230;
    if (_208)
    {
        float _282 = _216 * _178;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _288 = 0.0;
    if (!_226)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = _290;
    if (_210)
    {
        float _294 = _254 * _166;
        _248 = _294;
    }
    float _296 = _248;
    float _298 = 0.0;
    if (!_226)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = _300;
    if (_210)
    {
        float _304 = _254 * _174;
        _250 = _304;
    }
    float _306 = _250;
    if (_210)
    {
        float _308 = _254 * _180;
        _262 = _308;
    }
    float _310 = _262;
    float _312 = _138 * _170;
    if (_226)
    {
        float _314 = _272 * _168;
        _268 = _314;
    }
    float _316 = _268;
    if (_226)
    {
        float _318 = _272 * _176;
        _292 = _318;
    }
    float _320 = _292;
    if (_226)
    {
        float _322 = _272 * _182;
        _302 = _322;
    }
    float _324 = _302;
    bool _326 = !_286;
    float _344;
    if (!_326)
    {
        float _328 = in.m_61.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        _344 = _312;
    }
    _346 = false;
    float _348 = _344;
    float _350 = in.m_48.x;
    float _352 = in.m_48.y;
    float _354 = in.m_48.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _358 = -_312;
    float _360 = _358 + 1.0;
    float _362 = in.m_61.y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _348 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    float _372 = in.m_61.x;
    float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _376 = log2(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _348 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _348 + _386;
    float _390 = in.m_59.w;
    float _392 = 1.0 / _370;
    float _394 = _360 * _356;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = in.m_57.w;
    bool _408 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_348);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _174 * _352;
    float _422 = _312 * _356;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = in.m_61.z;
    float _428 = _180 * _352;
    float _430 = fma(_172, _350, _420);
    float _432 = 1.0 / _380;
    float _434 = _376 * _138;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = fma(_178, _350, _428);
    float _442 = _384 * _392;
    float _444 = precise::min(_424, _396);
    float _446 = fma(_176, _354, _430);
    float _448 = fma(_182, _354, _440);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    float _454 = exp2(_434);
    float _456 = fma(_400, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _472 = _470 != 0;
    float _474 = _366 * _432;
    float _476 = 1.0 / _452;
    float _478 = _372 + _426;
    bool _480 = !_464;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_404, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _496 = _494 != 0;
    float _498 = _478 + (-1.0);
    bool _500 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(1.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = 1.0 / _438;
    float _512 = _362 * 2.0;
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _518 = -_454;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _426 * 2.0;
    float _534 = fma(_516, _362, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _536 = floor(_512);
    float _538 = _362 + _426;
    float _540 = _530 ? _520 : 0.0;
    float _542 = _534 * _138;
    float _544 = _538 + (-1.0);
    bool _546 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_348);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_508)
    {
        float _558 = _540 * _476;
        _156 = _558;
    }
    float _560 = _156;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _562;
    float _566 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = _372 + _362;
    bool _570 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_348);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _584 = -_556;
    float _586 = _584 + 1.0;
    float _588 = _568 + (-1.0);
    float _590 = _388 * _510;
    bool _592 = _536 > 0.0;
    float _594 = _372 * 2.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = !_468;
    int _600 = _598 ? 0 : 1;
    float _602 = floor(_532);
    bool _604 = _536 >= 0.0;
    bool _606 = isnan(_536);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _622;
    bool _626 = !_472;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_616, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = fma(_564, _442, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = floor(_594);
    float _640 = _448 + _390;
    float _642 = fma(_636, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _644 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _646 = isnan(_348);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_580;
    float _658 = _656 + 1.0;
    float _660 = fma(_620, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _662 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _664 = _602 >= 0.0;
    bool _666 = isnan(_602);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = _556 * _658;
    float _676 = _654 * _586;
    float _678 = -_654;
    float _680 = _678 + 1.0;
    float _682 = fma(_460, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _684 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _686 = _602 > 0.0;
    float _688 = _418 * _680;
    int _690 = _672 ? 0 : 1;
    float _692 = _684 * _582;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _696 = _630 * _688;
    float _698 = _456 * _688;
    float _700 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].x, _692);
    float _702 = _632 * _688;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _704;
    bool _708 = _638 >= 0.0;
    bool _710 = isnan(_638);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -_418;
    float _720 = _718 + 1.0;
    float _722 = floor(_700);
    float _724 = _446 + _406;
    float _726 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _728 = ~_690;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _742 = _732;
    if (!_686)
    {
        int _744 = ~_690;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    int _752 = _612 ? 0 : 1;
    float _754 = fma(_642, _676, _734);
    int _756 = _716 ? 0 : 1;
    float _758 = _740 * _694;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = fma(_484, _676, _750);
    bool _774 = _638 > 0.0;
    float _776 = -_722;
    float _778 = _700 + _776;
    float _780 = _700 + 0.25;
    float _782 = fma(_662, _674, _754);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _702);
    float _786 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].z, _758);
    float _788 = floor(_780);
    int _790 = ~_752;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = _700 * 6.283185482025146484375;
    int _798 = _794;
    if (!_592)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_660, _676, _784);
    int _808 = ~_756;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _786 + 0.25;
    bool _816 = _778 >= 0.5;
    bool _818 = isnan(_778);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    float _826 = floor(_786);
    int _828 = _812;
    if (!_774)
    {
        int _830 = ~_756;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_63.x;
    float _838 = in.m_63.y;
    float _840 = in.m_63.z;
    bool _842 = !_762;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_372, 6.283185482025146484375, _542);
    bool _848 = !_766;
    int _850 = _848 ? 0 : 1;
    float _852 = in.m_65.y;
    int _854 = abs(_844);
    float _856 = -_788;
    float _858 = _780 + _856;
    int _860 = abs(_850);
    float _862 = _426 + (-0.5);
    float _864 = float(_748);
    float _866 = _796 * 0.15915493667125701904296875;
    float _868 = float(_834);
    float _870 = floor(_814);
    float _872 = float(_854);
    float _874 = -_826;
    float _876 = _786 + _874;
    float _878 = float(_860);
    float _880 = _786 * 6.283185482025146484375;
    float _882 = in.m_65.x;
    int _884 = abs(_600);
    float _886 = _866 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _872 * _864;
    float _892 = _878 * _868;
    bool _894 = !_824;
    float _896 = _894 ? 0.5 : (-0.5);
    float _898 = _880 * 0.15915493667125701904296875;
    bool _900 = _858 > 0.5;
    float _902 = _892 * (-2.0);
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _906 = _904 * 2.0;
    int _908 = abs(_482);
    float _910 = _898 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = float(_884);
    float _916 = -_870;
    float _918 = _814 + _916;
    float _920 = float(_908);
    float _922 = fma(_902, _838, _838);
    int _924 = abs(_628);
    float _926 = _914 * _906;
    bool _928 = _876 >= 0.5;
    bool _930 = isnan(_876);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _888 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _940 = fma(_566, _902, _566);
    bool _942 = !_492;
    int _944 = _942 ? 0 : 1;
    float _946 = _858;
    float _948 = _918;
    if (_900)
    {
        float _950 = -_858;
        float _952 = _950 + 1.0;
        _946 = _952;
    }
    float _954 = _946;
    bool _956 = !_488;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_920, _938, _926);
    bool _962 = _918 > 0.5;
    float _964 = fma(_954, 4.0, -1.0);
    int _966 = abs(_944);
    float _968 = _362 + (-0.5);
    bool _970 = !_936;
    float _972 = _970 ? 0.5 : (-0.5);
    float _974 = _890 * (-2.0);
    int _976 = abs(_958);
    float _978 = fma(_682, _674, _772);
    float _980 = float(_924);
    float _982 = _972 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _984 = _982 * 2.0;
    float _986 = float(_966);
    float _988 = _964 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _990 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _992 = _912 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _994 = _986 * _984;
    float _996 = float(_976);
    float _998 = fma(_980, _988, _960);
    if (_962)
    {
        float _1000 = -_918;
        float _1002 = _1000 + 1.0;
        _948 = _1002;
    }
    float _1004 = _948;
    float _1006 = _846 * 0.15915493667125701904296875;
    float _1008 = _640 * _640;
    int _1010 = abs(_738);
    float _1012 = fma(_996, _992, _994);
    float _1014 = fma(_1004, 4.0, -1.0);
    float _1016 = fma(_998, 3.1415927410125732421875, _836);
    bool _1018 = !_770;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_724, _724, _1008);
    float _1024 = float(_1010);
    float _1026 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1028 = fma(_940, _560, _990);
    int _1030 = abs(_1020);
    float _1032 = _372 + (-0.5);
    float _1034 = fma(_1016, _974, _1016);
    float _1036 = _1006 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_1024, _1026, _1012);
    float _1042 = float(_804);
    float _1044 = fma(_596, _974, _596);
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1034);
    float _1048 = fma(_1040, 3.1415927410125732421875, _840);
    float _1050 = fma(_726, _674, _806);
    float _1052 = in.m_67.x;
    float _1054 = in.m_67.y;
    float _1056 = in.m_67.z;
    float _1058 = fma(_1044, _560, _1046);
    float _1060 = _1028 * 0.15915493667125701904296875;
    float _1062 = float(_1030);
    float _1064 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].y, _978);
    float _1066 = _1058 * 0.15915493667125701904296875;
    float _1068 = in.m_65.z;
    float _1070 = sqrt(_1022);
    float _1072 = _1062 * _1042;
    float _1074 = -_444;
    float _1076 = _1074 + 1.0;
    float _1078 = abs(_1038);
    float _1080 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1082 = _594 + (-1.0);
    float _1084 = _1072 * (-2.0);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1080);
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_514, _1084, _514);
    float _1094 = fma(_1048, _1084, _1048);
    float _1096 = -_1086;
    float _1098 = _1096 + _852;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _1102 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1104 = _1060 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _1082 * _1070;
    float _1110 = fma(_1092, _560, _1102);
    float _1112 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].x, _782);
    float _1114 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1050);
    float _1116 = _1108 * 0.75;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1112 * _1052;
    float _1122 = _1064 * _1054;
    float _1124 = _1066 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = _1114 * _1056;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1138 = _1130 * _1100;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1142 = _1066 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1140 * _1136;
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1126 * _1106;
    float _1154 = _1126 * _1090;
    float _1156 = _1134 * _1132;
    float _1158 = _1118 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1144 * _1090;
    float _1164 = _1144 * _1106;
    float _1166 = _1126 * _1150;
    float _1168 = _1144 * _1150;
    float _1170 = _1106 * _1150;
    float _1172 = _1090 * _1150;
    float _1174 = _1166 * _1156;
    float _1176 = _1116 * 0.15915493667125701904296875;
    float _1178 = _1168 * _1156;
    float _1180 = fma(_1160, _1152, _1162);
    float _1182 = -_1154;
    float _1184 = fma(_1160, _1164, _1182);
    float _1186 = -_1164;
    float _1188 = fma(_1160, _1154, _1186);
    float _1190 = -_1156;
    float _1192 = _1160 * _1190;
    float _1194 = fma(_1180, _1138, _1174);
    float _1196 = fma(_1160, _1162, _1152);
    float _1198 = _1176 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1170, _1138, _1192);
    float _1204 = fma(_1188, _1146, _1194);
    float _1206 = fma(_1184, _1138, _1178);
    float _1208 = fma(_1172, _1146, _1202);
    float _1210 = _1204 * _306;
    float _1212 = fma(_1196, _1146, _1206);
    float _1214 = _1176 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1204 * _310;
    float _1220 = fma(_1208, _280, _1210);
    float _1222 = _1204 * _296;
    float _1224 = fma(_1208, _284, _1218);
    float _1226 = fma(_1212, _320, _1220);
    float _1228 = fma(_1208, _276, _1222);
    float _1230 = fma(_1212, _324, _1224);
    float _1232 = _1226 * _1200;
    float _1234 = fma(_1212, _316, _1228);
    float _1236 = _1226 * _1216;
    float _1238 = -_1232;
    float _1240 = fma(_1230, _1216, _1238);
    float _1242 = in.m_69.y;
    float _1244 = fma(_1230, _1200, _1236);
    float _1246 = _640 + _1240;
    float _1248 = _724 + _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1246 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1256 = _1248 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = fma(_1256, _1256, _1258);
    float _1262 = sqrt(_1260);
    float _1264 = _352 + _1242;
    float _1266 = _1264 + _1234;
    bool _1268 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1262 + _1270;
    float _1274 = _1230;
    float _1276 = _1208;
    float _1278 = _1228;
    float _1280 = _1272;
    float _1282 = _1244;
    float _1284 = _1256;
    float _1286 = _1234;
    float _1288 = _1050;
    float _1290 = _1080;
    float _1292 = _1094;
    if (_1268)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1268)
    {
        float _1298 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1300;
    if (_1268)
    {
        float _1304 = rsqrt(_1260);
        _1278 = _1304;
    }
    float _1306 = _1278;
    float _1308 = _1296;
    float _1310 = _1306;
    if (_1268)
    {
        float _1312 = _1272 * _1296;
        _1280 = _1312;
    }
    float _1314 = _1280;
    if (_1268)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1282 = _1316;
    }
    float _1318 = _1282;
    float _1320 = _1314;
    float _1322 = _1318;
    if (_1268)
    {
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        _1320 = _1326;
    }
    float _1328 = _1320;
    float _1330 = _1328;
    if (_1268)
    {
        float _1332 = fma(_1328, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1332;
    }
    float _1334 = _1308;
    float _1336 = _1334;
    if (!_1268)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1268)
    {
        _1302 = _1246;
    }
    float _1342 = _1302;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1306 * _1334;
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1268)
    {
        float _1350 = fma(_1256, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (_1268)
    {
        float _1356 = fma(_1252, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1362 = _1352 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1366 = _1358 + _1364;
    float _1368 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4447 = float2(_1368, _1370);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).x;
    float _1374 = _1362;
    float _1376 = _1366;
    float _1378 = _1358;
    if (_1268)
    {
        float _1380 = _1318 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        _1374 = _1382;
    }
    float _1384 = _1374;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    if (!_1268)
    {
        _1336 = _1266;
    }
    float _1396 = _1336;
    float _1398 = _1396;
    if (!_1394)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1400;
    }
    float _1402 = _1284;
    float _1404 = _1384;
    if (_1268)
    {
        float _1406 = _1384 + (-1.0);
        _1376 = _1406;
    }
    float _1408 = _1376;
    float _1410 = _1408;
    if (_1268)
    {
        float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1412;
    }
    float _1414 = _1286;
    float _1416 = _1414;
    if (_1268)
    {
        float _1418 = fma(_1266, _1384, _1414);
        _1398 = _1418;
    }
    float _1420 = _1398;
    if (!_1394)
    {
        float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1424 = _724 + _1422;
        _1404 = _1424;
    }
    float _1426 = _1404;
    float _1428 = _1426;
    if (!_1394)
    {
        float _1430 = -_1264;
        float _1432 = _1430 + _1420;
        _1322 = _1432;
    }
    float _1434 = _1322;
    float _1436 = fma(_1372, 100.0, _1264);
    float _1438 = fma(_1372, 100.0, _1420);
    float _1440 = _1372;
    float _1442 = _1438;
    if (!_1394)
    {
        float _1444 = -_724;
        float _1446 = _1444 + _1352;
        _1440 = _1446;
    }
    float _1448 = _1440;
    if (!_1394)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1436 + _1450;
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (!_1394)
    {
        float _1458 = _1454 * _1454;
        _1416 = _1458;
    }
    float _1460 = _1416;
    float _1462 = _1460;
    if (!_1394)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1466 = _640 + _1464;
        _1456 = _1466;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1394)
    {
        float _1472 = fma(_1426, _1426, _1460);
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1474;
    if (!_1394)
    {
        float _1478 = fma(_1468, _1468, _1474);
        _1476 = _1478;
    }
    float _1480 = _1476;
    float _1482 = _1480;
    if (!_1394)
    {
        float _1484 = sqrt(_1480);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (!_1394)
    {
        float _1488 = precise::min(_1486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1428 = _1488;
    }
    float _1490 = _1428;
    float _1492 = _1490;
    if (!_1394)
    {
        float _1494 = _1490 * _1402;
        _1470 = _1494;
    }
    float _1496 = _1470;
    if (!_1394)
    {
        float _1498 = -_640;
        float _1500 = _1498 + _1358;
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1394)
    {
        float _1504 = fma(_1434, _1496, _1436);
        _1442 = _1504;
    }
    float _1506 = _1442;
    if (!_1394)
    {
        float _1508 = fma(_1448, _1496, _724);
        _1354 = _1508;
    }
    float _1510 = _1354;
    if (!_1394)
    {
        float _1512 = fma(_1502, _1496, _640);
        _1378 = _1512;
    }
    float _1514 = _1378;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1506 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1540 = _1522 * _1538;
    float _1542 = _1526 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 + _1546;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = _1550 + _1554;
    float _1558 = _1370;
    float _1560 = _1548;
    float _1562 = _1556;
    float _1564 = _1518;
    float _1566 = _1540;
    float _1568 = _1542;
    if (_1552)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1558 = _1570;
    }
    float _1572 = _1558;
    if (_1552)
    {
        float _1574 = rsqrt(_1548);
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1552)
    {
        float _1578 = _1556 * _1572;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1552)
    {
        float _1582 = _1580 * 0.15915493667125701904296875;
        _1288 = _1582;
    }
    float _1584 = _1288;
    float _1586 = _1572;
    if (_1552)
    {
        float _1588 = _1584 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = precise::max(0.0, _1594);
    float _1598 = _1434;
    float _1600 = _1596;
    if (_1552)
    {
        float _1602 = _1584 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = -_1538;
    float _1610 = -_1596;
    float _1612 = fma(_1518, _1608, _1610);
    if (_1552)
    {
        float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1614;
    }
    float _1616 = _1600;
    float _1618 = _1592;
    float _1620 = _1616;
    if (_1552)
    {
        float _1622 = fma(_1592, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1622;
    }
    float _1624 = _1290;
    if (!_1552)
    {
        _1618 = _1612;
    }
    float _1626 = _1618;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1630 = _1626;
    if (!_1552)
    {
        _1620 = _1544;
    }
    float _1632 = _1620;
    float _1634 = _1632;
    if (_1552)
    {
        float _1636 = _1606 + (-1.0);
        _1564 = _1636;
    }
    float _1638 = _1564;
    float _1640 = _1638;
    if (_1552)
    {
        float _1642 = _1576 * _1624;
        _1292 = _1642;
    }
    float _1644 = _1292;
    if (_1552)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = _1648;
    if (_1552)
    {
        float _1652 = _1540 * _1644;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1552)
    {
        float _1656 = _1542 * _1644;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1552)
    {
        float _1662 = fma(_1612, _1606, _1648);
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (_1552)
    {
        float _1666 = _1654 * _1654;
        _1634 = _1666;
    }
    float _1668 = _1634;
    if (!_1552)
    {
        _1650 = _1546;
    }
    float _1670 = _1650;
    float _1672 = _1670;
    if (_1552)
    {
        float _1674 = _1658 * _1658;
        _1672 = _1674;
    }
    float _1676 = _1672;
    float _1678 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1682 = fma(_1664, _1664, _1668);
    float _1684 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = floor(_1680);
    float _1688 = _1682 + _1676;
    float _1690 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1700 = -_1696;
    float _1702 = _1700 + 1.0;
    float _1704 = rsqrt(_1688);
    float _1706 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1712 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1720 = -_1712;
    float _1722 = fma(_1720, _1628, 1.0);
    float _1724 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = -_1686;
    float _1728 = _1680 + _1726;
    float _1730 = _1704 * _1654;
    float _1732 = _1704 * _1664;
    float _1734 = _1704 * _1658;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1738 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = floor(_1706);
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1740;
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = -_1734;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1710);
    float _1764 = log2(_1722);
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = exp2(_1752);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1788 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1780);
    float _1790 = -_1742;
    float _1792 = _1706 + _1790;
    float _1794 = _1732 + 1.0;
    float _1796 = sqrt(_1768);
    float _1798 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1802 = fma(_1774, _1786, -0.212114393711090087890625);
    float _1804 = _1764 * 0.693147182464599609375;
    float _1806 = 1.0 / _1788;
    float _1808 = -_1732;
    float _1810 = fma(_1778, _1794, _1808);
    float _1812 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1814 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float2 _5208 = float2(_1728, _1792);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).x;
    float _1818 = fma(_1774, _1802, 1.570728778839111328125);
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1796 * 0.636619746685028076171875;
    float _1824 = -_1818;
    float _1826 = fma(_1822, _1824, 1.0);
    float _1828 = fma(_1810, 0.5, 0.5);
    float _1830 = _1812 * _1806;
    float _1832 = _1814 * _1806;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float3 _5245 = float3(_1834, _1836, _1820);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float3 _5256 = float3(_1834, _1836, _1820);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5272 = float2(_1826, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1863 = in.m_71.x;
    float _1865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1867 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1086;
    float _1871 = -_852;
    bool _1873 = _1869 != _1871;
    bool _1875 = isnan(_1869);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1871);
    bool _1881 = _1877 || _1879;
    float _1883 = _1861 * _372;
    bool _1885 = _362 > 0.5;
    float _1887 = _1865 * _372;
    bool _1889 = _882 == 0.0;
    bool _1891 = !_1881;
    bool _1893 = _1889 && _1891;
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1897 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1899 = in.m_71.y;
    bool _1901 = _1068 == 0.0;
    bool _1903 = _1901 && _1893;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1907 = _1905 != 0;
    float _1909 = trunc(_1883);
    int _1911 = int(_1909);
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1915 = _1913 != 0;
    bool _1917 = _372 > 0.5;
    bool _1919 = _1917 && _1907;
    float _1921 = trunc(_1887);
    int _1923 = int(_1921);
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1927 = _1911 << 4;
    int _1929 = _1927 + 1712;
    float _1931 = in.m_73.x;
    float _1933 = in.m_73.y;
    float _1935 = in.m_73.z;
    float _1937 = -_1899;
    float _1939 = _1937 + 1.0;
    int _1941 = _1929 + 8;
    uint _1944 = uint(int(uint(_1941) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = _1923 << 4;
    int _1954 = _1952 + 1968;
    float _1956 = as_type<float>(_1923);
    float _1958 = _1899;
    float _1960 = _1863;
    if (_1907)
    {
        _1956 = _1863;
    }
    float _1962 = _1956;
    uint _1964 = uint(int(uint(_1929) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[int(_1974)][_1976];
    float _1980 = _1962;
    if (_1915)
    {
        float _1982 = _1885 ? _1939 : _1899;
        _1958 = _1982;
    }
    float _1984 = _1958;
    if (_1919)
    {
        float _1986 = -_1962;
        float _1988 = _1986 + 1.0;
        _1980 = _1988;
    }
    float _1990 = _1980;
    uint _1992 = uint(int(uint(_1954) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    if (_1907)
    {
        _1960 = _1990;
    }
    float _2008 = _1960;
    float _2010 = _1933;
    float _2012 = _1931;
    float _2014 = _1935;
    if (!_1903)
    {
        float _2016 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1933);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1903)
    {
        float _2020 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _2012 = _2020;
    }
    float _2022 = _2012;
    int _2024 = _1954 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    if (!_1903)
    {
        float _2034 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2014 = _2034;
    }
    float _2036 = _2014;
    float _2038 = -_2018;
    float _2040 = _1160 * _2038;
    float _2042 = _1168 * _2018;
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2046 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2048 = isnan(_1536);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2054 = _2050 || _2052;
    float _2056 = fma(_1170, _2022, _2040);
    float _2058 = fma(_1184, _2022, _2042);
    float _2060 = fma(_1172, _2036, _2056);
    float _2062 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = _1166 * _2018;
    float _2066 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_1180, _2022, _2064);
    float _2072 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2074 = _1978 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2076 = fma(_1188, _2036, _2070);
    float _2078 = fma(_1196, _2036, _2058);
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * _306;
    float _2086 = _2076 * _296;
    float _2088 = _2076 * _310;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2092 = fma(_2060, _280, _2084);
    float _2094 = fma(_2060, _276, _2086);
    out.m_75.x = _2080;
    out.m_75.y = _2082;
    out.m_75.z = _2068;
    out.m_75.w = _1925;
    float _2096 = fma(_2060, _284, _2088);
    float _2098 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = fma(_2078, _320, _2092);
    float _2102 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _2104;
    out.m_77.y = _2106;
    out.m_77.z = _2108;
    float _2110 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2112 = _2066 * _1895;
    float _2114 = fma(_2078, _316, _2094);
    float _2116 = fma(_2078, _324, _2096);
    float _2118 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2110);
    float _2120 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2122 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2118);
    float _2126 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2120);
    float _2128 = _2122 * _2044;
    out.m_79.x = _2100;
    out.m_79.y = _2114;
    out.m_79.z = _2116;
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2126);
    out.m_81.x = _2112;
    out.m_81.y = _2128;
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    float _2148 = 1.0 / _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2152 = _2148 * _2150;
    float _2154 = abs(_2152);
    float _2156 = log2(_2154);
    bool _2158 = _2152 <= 8000.0;
    bool _2160 = isnan(_2152);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(8000.0);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = exp2(_2170);
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = in.m_69.x;
    float _2180 = fma(_2176, -2.0, 3.0);
    float _2182 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _2188 = _2184 * _2180;
    float _2190 = exp2(_2182);
    float _2192 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2194 = -_2188;
    float _2196 = _2194 + 1.0;
    float _2198 = _2192 + _1788;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1788;
    float _2200 = fma(_2196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2202 = _2198 * 0.5;
    float _2204 = _2168 * _2200;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2208 = -_2190;
    float _2210 = _2208 + 1.0;
    out.m_85.z = _2202;
    out.m_85.w = _1788;
    float _2212 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2214 = -_1816;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * _2206;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = _2224 * _2178;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2230 = _2226;
    float _2232 = _2212;
    if (!_2054)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2234 = _2230;
    float _2236 = _2212 * _1838;
    float _2238 = -_2212;
    float _2240 = _2238 + 1.0;
    out.m_87.x = _2228;
    float _2242 = _2240;
    float _2244 = _2236;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2054)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2250 = _2232;
    float _2252 = _1849 * _2236;
    float _2254 = _1859 * _2236;
    float _2256 = _1849 * _2240;
    float _2258 = _2254;
    float _2260 = _2252;
    float _2262 = _2250;
    float _2264 = _2250;
    if (!_2054)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2242;
    float _2268 = fma(_1855, _2252, _1843);
    float _2270 = fma(_1857, _2252, _1845);
    float _2272 = fma(_1849, _2254, _1847);
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2054)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2278 = _2258;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2054)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2260;
    out.m_89.x = _2268;
    out.m_89.y = _2270;
    out.m_89.z = _2272;
    out.m_89.w = _2256;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2054)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2290 = _2244;
    bool _2292 = !_2054;
    float _2294 = _2290;
    float _2296 = _2290;
    if (!_2292)
    {
        bool _2298 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2300 = isnan(_1536);
        bool _2302 = _2298 || _2300;
        bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2306 = _2302 || _2304;
        if (!_2306)
        {
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2310 = _1536 + _2308;
            float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2312;
            float _2316 = 1.0 / _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2338 = _2310 * _2316;
            float _2340 = precise::clamp(_2338, 0.0, 1.0);
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2346 = fma(_2340, _2320, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2340, _2344, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2350 = fma(_2340, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2352 = fma(_2340, _2328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2354 = fma(_2340, _2332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2356 = fma(_2340, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2348;
            _2248 = _2354;
            _2282 = _2346;
            _2296 = _2352;
            _2276 = _2350;
            _2264 = _2356;
            _2358 = true;
        }
        else
        {
            bool _2360 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2362 = isnan(_1536);
            bool _2364 = _2360 || _2362;
            bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2368 = _2364 || _2366;
            if (!_2368)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2370 = _2280;
            _2282 = _2370;
            if (!_2368)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2372 = _2286;
            _2288 = _2372;
            if (!_2368)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2374 = _2274;
            _2276 = _2374;
            if (!_2368)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2376 = _2294;
            _2296 = _2376;
            if (!_2368)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2378 = _2246;
            _2248 = _2378;
            if (!_2368)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2380 = _2262;
            bool _2382 = !_2368;
            _2264 = _2380;
            if (!_2382)
            {
                bool _2384 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2386 = isnan(_1536);
                bool _2388 = _2384 || _2386;
                bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2392 = _2388 || _2390;
                if (!_2392)
                {
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2396 = _1536 + _2394;
                    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2398;
                    float _2402 = 1.0 / _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2424 = _2396 * _2402;
                    float _2426 = precise::clamp(_2424, 0.0, 1.0);
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2432 = fma(_2426, _2406, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2426, _2430, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2436 = fma(_2426, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2438 = fma(_2426, _2414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2440 = fma(_2426, _2418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2442 = fma(_2426, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2434;
                    _2248 = _2440;
                    _2282 = _2432;
                    _2296 = _2438;
                    _2276 = _2436;
                    _2264 = _2442;
                    _2358 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2358 = false;
    float _2444 = _2288;
    float _2446 = _2248;
    float _2448 = _2282;
    float _2450 = _2296;
    float _2452 = _2276;
    float _2454 = _2264;
    float _2456 = fma(_2114, -0.5, 0.5);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = -_2444;
    float _2462 = _2460 + _2446;
    float _2464 = -_2448;
    float _2466 = _2464 + _2450;
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    bool _2472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2474 = fma(_2458, _2462, _2444);
    float _2476 = fma(_2458, _2466, _2448);
    float _2478 = fma(_2458, _2470, _2452);
    float _2480 = _2474 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2482 = fma(_2476, 0.298911988735198974609375, _2480);
    float _2484 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2486 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_87.w = _2484;
    float _2488 = -_2486;
    float _2490 = _2476 + _2488;
    float _2492 = -_2486;
    float _2494 = _2474 + _2492;
    float _2496 = -_2486;
    float _2498 = _2478 + _2496;
    out.m_91.x = 0.0;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2504 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    out.m_93.x = _2500;
    out.m_93.y = _2502;
    out.m_93.z = _2504;
    if (!_2472)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2506 = -_1506;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2510 = -_1510;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2514 = -_1514;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2518 = _2508 * _2508;
    float _2520 = fma(_2512, _2512, _2518);
    float _2522 = fma(_2516, _2516, _2520);
    float _2524 = sqrt(_2522);
    float _2526 = rsqrt(_2522);
    float _2528 = -_2524;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = _2512 * _2526;
    float _2538 = _2508 * _2526;
    float _2540 = abs(_2534);
    float _2542 = log2(_2540);
    float _2544 = _2516 * _2526;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2548 = _2114 * _2538;
    float _2550 = -_2538;
    float _2552 = -_2546;
    float _2554 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2552);
    float _2556 = fma(_2100, _2536, _2548);
    float _2558 = -_2544;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2554);
    float _2562 = fma(_2116, _2544, _2556);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2568 = _2560 + _2566;
    float _2570 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = exp2(_2570);
    float _2578 = _2576 * _2574;
    float _2580 = _2564 * _2578;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2582;
    out.m_91.y = _2584;
    out.m_91.z = _2586;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2358 = false;
    bool _346 = false;
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
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_128);
        out.gl_Position.z = _2644;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = 1.0 / _134;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.x;
    float _180 = in.m_59.y;
    float _182 = in.m_59.z;
    float _184 = _164 * _164;
    float _186 = _166 * _166;
    float _188 = _168 * _168;
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _202 > 0.0;
    bool _210 = _204 > 0.0;
    float _212 = _204;
    if (_208)
    {
        float _214 = rsqrt(_196);
        _212 = _214;
    }
    float _216 = _212;
    float _218 = 0.0;
    float _220 = 0.0;
    if (!_208)
    {
        _218 = 0.0;
        _220 = 0.0;
    }
    float _222 = _218;
    float _224 = _220;
    bool _226 = _206 > 0.0;
    float _228 = 0.0;
    float _230 = _222;
    float _232 = _224;
    if (!_208)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_210)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _242 = _236;
    float _244 = _238;
    float _246 = _202;
    float _248 = _244;
    float _250 = _242;
    if (_210)
    {
        float _252 = rsqrt(_198);
        _246 = _252;
    }
    float _254 = _246;
    float _256 = 0.0;
    if (!_210)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_226)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _206;
    float _268 = _264;
    if (_226)
    {
        float _270 = rsqrt(_200);
        _266 = _270;
    }
    float _272 = _266;
    if (_208)
    {
        float _274 = _216 * _164;
        _240 = _274;
    }
    float _276 = _240;
    if (_208)
    {
        float _278 = _216 * _172;
        _230 = _278;
    }
    float _280 = _230;
    if (_208)
    {
        float _282 = _216 * _178;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _288 = 0.0;
    if (!_226)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = _290;
    if (_210)
    {
        float _294 = _254 * _166;
        _248 = _294;
    }
    float _296 = _248;
    float _298 = 0.0;
    if (!_226)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = _300;
    if (_210)
    {
        float _304 = _254 * _174;
        _250 = _304;
    }
    float _306 = _250;
    if (_210)
    {
        float _308 = _254 * _180;
        _262 = _308;
    }
    float _310 = _262;
    float _312 = _138 * _170;
    if (_226)
    {
        float _314 = _272 * _168;
        _268 = _314;
    }
    float _316 = _268;
    if (_226)
    {
        float _318 = _272 * _176;
        _292 = _318;
    }
    float _320 = _292;
    if (_226)
    {
        float _322 = _272 * _182;
        _302 = _322;
    }
    float _324 = _302;
    bool _326 = !_286;
    float _344;
    if (!_326)
    {
        float _328 = in.m_61.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        _344 = _312;
    }
    _346 = false;
    float _348 = _344;
    float _350 = in.m_48.x;
    float _352 = in.m_48.y;
    float _354 = in.m_48.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _358 = -_312;
    float _360 = _358 + 1.0;
    float _362 = in.m_61.y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _348 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    float _372 = in.m_61.x;
    float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _376 = log2(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _348 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _348 + _386;
    float _390 = in.m_59.w;
    float _392 = 1.0 / _370;
    float _394 = _360 * _356;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = in.m_57.w;
    bool _408 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_348);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _174 * _352;
    float _422 = _312 * _356;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = in.m_61.z;
    float _428 = _180 * _352;
    float _430 = fma(_172, _350, _420);
    float _432 = 1.0 / _380;
    float _434 = _376 * _138;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = fma(_178, _350, _428);
    float _442 = _384 * _392;
    float _444 = precise::min(_424, _396);
    float _446 = fma(_176, _354, _430);
    float _448 = fma(_182, _354, _440);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    float _454 = exp2(_434);
    float _456 = fma(_400, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _472 = _470 != 0;
    float _474 = _366 * _432;
    float _476 = 1.0 / _452;
    float _478 = _372 + _426;
    bool _480 = !_464;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_404, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _496 = _494 != 0;
    float _498 = _478 + (-1.0);
    bool _500 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(1.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = 1.0 / _438;
    float _512 = _362 * 2.0;
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _518 = -_454;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _426 * 2.0;
    float _534 = fma(_516, _362, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _536 = floor(_512);
    float _538 = _362 + _426;
    float _540 = _530 ? _520 : 0.0;
    float _542 = _534 * _138;
    float _544 = _538 + (-1.0);
    bool _546 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_348);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_508)
    {
        float _558 = _540 * _476;
        _156 = _558;
    }
    float _560 = _156;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _562;
    float _566 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = _372 + _362;
    bool _570 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_348);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _584 = -_556;
    float _586 = _584 + 1.0;
    float _588 = _568 + (-1.0);
    float _590 = _388 * _510;
    bool _592 = _536 > 0.0;
    float _594 = _372 * 2.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = !_468;
    int _600 = _598 ? 0 : 1;
    float _602 = floor(_532);
    bool _604 = _536 >= 0.0;
    bool _606 = isnan(_536);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _622;
    bool _626 = !_472;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_616, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = fma(_564, _442, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = floor(_594);
    float _640 = _448 + _390;
    float _642 = fma(_636, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _644 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _646 = isnan(_348);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_580;
    float _658 = _656 + 1.0;
    float _660 = fma(_620, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _662 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _664 = _602 >= 0.0;
    bool _666 = isnan(_602);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = _556 * _658;
    float _676 = _654 * _586;
    float _678 = -_654;
    float _680 = _678 + 1.0;
    float _682 = fma(_460, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _684 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _686 = _602 > 0.0;
    float _688 = _418 * _680;
    int _690 = _672 ? 0 : 1;
    float _692 = _684 * _582;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _696 = _630 * _688;
    float _698 = _456 * _688;
    float _700 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].x, _692);
    float _702 = _632 * _688;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _704;
    bool _708 = _638 >= 0.0;
    bool _710 = isnan(_638);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -_418;
    float _720 = _718 + 1.0;
    float _722 = floor(_700);
    float _724 = _446 + _406;
    float _726 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _728 = ~_690;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _742 = _732;
    if (!_686)
    {
        int _744 = ~_690;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    int _752 = _612 ? 0 : 1;
    float _754 = fma(_642, _676, _734);
    int _756 = _716 ? 0 : 1;
    float _758 = _740 * _694;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = fma(_484, _676, _750);
    bool _774 = _638 > 0.0;
    float _776 = -_722;
    float _778 = _700 + _776;
    float _780 = _700 + 0.25;
    float _782 = fma(_662, _674, _754);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _702);
    float _786 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].z, _758);
    float _788 = floor(_780);
    int _790 = ~_752;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = _700 * 6.283185482025146484375;
    int _798 = _794;
    if (!_592)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_660, _676, _784);
    int _808 = ~_756;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _786 + 0.25;
    bool _816 = _778 >= 0.5;
    bool _818 = isnan(_778);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    float _826 = floor(_786);
    int _828 = _812;
    if (!_774)
    {
        int _830 = ~_756;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_63.x;
    float _838 = in.m_63.y;
    float _840 = in.m_63.z;
    bool _842 = !_762;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_372, 6.283185482025146484375, _542);
    bool _848 = !_766;
    int _850 = _848 ? 0 : 1;
    float _852 = in.m_65.y;
    int _854 = abs(_844);
    float _856 = -_788;
    float _858 = _780 + _856;
    int _860 = abs(_850);
    float _862 = _426 + (-0.5);
    float _864 = float(_748);
    float _866 = _796 * 0.15915493667125701904296875;
    float _868 = float(_834);
    float _870 = floor(_814);
    float _872 = float(_854);
    float _874 = -_826;
    float _876 = _786 + _874;
    float _878 = float(_860);
    float _880 = _786 * 6.283185482025146484375;
    float _882 = in.m_65.x;
    int _884 = abs(_600);
    float _886 = _866 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _872 * _864;
    float _892 = _878 * _868;
    bool _894 = !_824;
    float _896 = _894 ? 0.5 : (-0.5);
    float _898 = _880 * 0.15915493667125701904296875;
    bool _900 = _858 > 0.5;
    float _902 = _892 * (-2.0);
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _906 = _904 * 2.0;
    int _908 = abs(_482);
    float _910 = _898 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = float(_884);
    float _916 = -_870;
    float _918 = _814 + _916;
    float _920 = float(_908);
    float _922 = fma(_902, _838, _838);
    int _924 = abs(_628);
    float _926 = _914 * _906;
    bool _928 = _876 >= 0.5;
    bool _930 = isnan(_876);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _888 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _940 = fma(_566, _902, _566);
    bool _942 = !_492;
    int _944 = _942 ? 0 : 1;
    float _946 = _858;
    float _948 = _918;
    if (_900)
    {
        float _950 = -_858;
        float _952 = _950 + 1.0;
        _946 = _952;
    }
    float _954 = _946;
    bool _956 = !_488;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_920, _938, _926);
    bool _962 = _918 > 0.5;
    float _964 = fma(_954, 4.0, -1.0);
    int _966 = abs(_944);
    float _968 = _362 + (-0.5);
    bool _970 = !_936;
    float _972 = _970 ? 0.5 : (-0.5);
    float _974 = _890 * (-2.0);
    int _976 = abs(_958);
    float _978 = fma(_682, _674, _772);
    float _980 = float(_924);
    float _982 = _972 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _984 = _982 * 2.0;
    float _986 = float(_966);
    float _988 = _964 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _990 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _992 = _912 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _994 = _986 * _984;
    float _996 = float(_976);
    float _998 = fma(_980, _988, _960);
    if (_962)
    {
        float _1000 = -_918;
        float _1002 = _1000 + 1.0;
        _948 = _1002;
    }
    float _1004 = _948;
    float _1006 = _846 * 0.15915493667125701904296875;
    float _1008 = _640 * _640;
    int _1010 = abs(_738);
    float _1012 = fma(_996, _992, _994);
    float _1014 = fma(_1004, 4.0, -1.0);
    float _1016 = fma(_998, 3.1415927410125732421875, _836);
    bool _1018 = !_770;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_724, _724, _1008);
    float _1024 = float(_1010);
    float _1026 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1028 = fma(_940, _560, _990);
    int _1030 = abs(_1020);
    float _1032 = _372 + (-0.5);
    float _1034 = fma(_1016, _974, _1016);
    float _1036 = _1006 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_1024, _1026, _1012);
    float _1042 = float(_804);
    float _1044 = fma(_596, _974, _596);
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1034);
    float _1048 = fma(_1040, 3.1415927410125732421875, _840);
    float _1050 = fma(_726, _674, _806);
    float _1052 = in.m_67.x;
    float _1054 = in.m_67.y;
    float _1056 = in.m_67.z;
    float _1058 = fma(_1044, _560, _1046);
    float _1060 = _1028 * 0.15915493667125701904296875;
    float _1062 = float(_1030);
    float _1064 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].y, _978);
    float _1066 = _1058 * 0.15915493667125701904296875;
    float _1068 = in.m_65.z;
    float _1070 = sqrt(_1022);
    float _1072 = _1062 * _1042;
    float _1074 = -_444;
    float _1076 = _1074 + 1.0;
    float _1078 = abs(_1038);
    float _1080 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1082 = _594 + (-1.0);
    float _1084 = _1072 * (-2.0);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1080);
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_514, _1084, _514);
    float _1094 = fma(_1048, _1084, _1048);
    float _1096 = -_1086;
    float _1098 = _1096 + _852;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _1102 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1104 = _1060 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _1082 * _1070;
    float _1110 = fma(_1092, _560, _1102);
    float _1112 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].x, _782);
    float _1114 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1050);
    float _1116 = _1108 * 0.75;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1112 * _1052;
    float _1122 = _1064 * _1054;
    float _1124 = _1066 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = _1114 * _1056;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1138 = _1130 * _1100;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1142 = _1066 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1140 * _1136;
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1126 * _1106;
    float _1154 = _1126 * _1090;
    float _1156 = _1134 * _1132;
    float _1158 = _1118 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1144 * _1090;
    float _1164 = _1144 * _1106;
    float _1166 = _1126 * _1150;
    float _1168 = _1144 * _1150;
    float _1170 = _1106 * _1150;
    float _1172 = _1090 * _1150;
    float _1174 = _1166 * _1156;
    float _1176 = _1116 * 0.15915493667125701904296875;
    float _1178 = _1168 * _1156;
    float _1180 = fma(_1160, _1152, _1162);
    float _1182 = -_1154;
    float _1184 = fma(_1160, _1164, _1182);
    float _1186 = -_1164;
    float _1188 = fma(_1160, _1154, _1186);
    float _1190 = -_1156;
    float _1192 = _1160 * _1190;
    float _1194 = fma(_1180, _1138, _1174);
    float _1196 = fma(_1160, _1162, _1152);
    float _1198 = _1176 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1170, _1138, _1192);
    float _1204 = fma(_1188, _1146, _1194);
    float _1206 = fma(_1184, _1138, _1178);
    float _1208 = fma(_1172, _1146, _1202);
    float _1210 = _1204 * _306;
    float _1212 = fma(_1196, _1146, _1206);
    float _1214 = _1176 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1204 * _310;
    float _1220 = fma(_1208, _280, _1210);
    float _1222 = _1204 * _296;
    float _1224 = fma(_1208, _284, _1218);
    float _1226 = fma(_1212, _320, _1220);
    float _1228 = fma(_1208, _276, _1222);
    float _1230 = fma(_1212, _324, _1224);
    float _1232 = _1226 * _1200;
    float _1234 = fma(_1212, _316, _1228);
    float _1236 = _1226 * _1216;
    float _1238 = -_1232;
    float _1240 = fma(_1230, _1216, _1238);
    float _1242 = in.m_69.y;
    float _1244 = fma(_1230, _1200, _1236);
    float _1246 = _640 + _1240;
    float _1248 = _724 + _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1246 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1256 = _1248 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = fma(_1256, _1256, _1258);
    float _1262 = sqrt(_1260);
    float _1264 = _352 + _1242;
    float _1266 = _1264 + _1234;
    bool _1268 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1262 + _1270;
    float _1274 = _1230;
    float _1276 = _1208;
    float _1278 = _1228;
    float _1280 = _1272;
    float _1282 = _1244;
    float _1284 = _1256;
    float _1286 = _1234;
    float _1288 = _1050;
    float _1290 = _1080;
    float _1292 = _1094;
    if (_1268)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1268)
    {
        float _1298 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1300;
    if (_1268)
    {
        float _1304 = rsqrt(_1260);
        _1278 = _1304;
    }
    float _1306 = _1278;
    float _1308 = _1296;
    float _1310 = _1306;
    if (_1268)
    {
        float _1312 = _1272 * _1296;
        _1280 = _1312;
    }
    float _1314 = _1280;
    if (_1268)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1282 = _1316;
    }
    float _1318 = _1282;
    float _1320 = _1314;
    float _1322 = _1318;
    if (_1268)
    {
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        _1320 = _1326;
    }
    float _1328 = _1320;
    float _1330 = _1328;
    if (_1268)
    {
        float _1332 = fma(_1328, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1332;
    }
    float _1334 = _1308;
    float _1336 = _1334;
    if (!_1268)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1268)
    {
        _1302 = _1246;
    }
    float _1342 = _1302;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1306 * _1334;
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1268)
    {
        float _1350 = fma(_1256, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (_1268)
    {
        float _1356 = fma(_1252, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1362 = _1352 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1366 = _1358 + _1364;
    float _1368 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4447 = float2(_1368, _1370);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).x;
    float _1374 = _1362;
    float _1376 = _1366;
    float _1378 = _1358;
    if (_1268)
    {
        float _1380 = _1318 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        _1374 = _1382;
    }
    float _1384 = _1374;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    if (!_1268)
    {
        _1336 = _1266;
    }
    float _1396 = _1336;
    float _1398 = _1396;
    if (!_1394)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1400;
    }
    float _1402 = _1284;
    float _1404 = _1384;
    if (_1268)
    {
        float _1406 = _1384 + (-1.0);
        _1376 = _1406;
    }
    float _1408 = _1376;
    float _1410 = _1408;
    if (_1268)
    {
        float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1412;
    }
    float _1414 = _1286;
    float _1416 = _1414;
    if (_1268)
    {
        float _1418 = fma(_1266, _1384, _1414);
        _1398 = _1418;
    }
    float _1420 = _1398;
    if (!_1394)
    {
        float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1424 = _724 + _1422;
        _1404 = _1424;
    }
    float _1426 = _1404;
    float _1428 = _1426;
    if (!_1394)
    {
        float _1430 = -_1264;
        float _1432 = _1430 + _1420;
        _1322 = _1432;
    }
    float _1434 = _1322;
    float _1436 = fma(_1372, 100.0, _1264);
    float _1438 = fma(_1372, 100.0, _1420);
    float _1440 = _1372;
    float _1442 = _1438;
    if (!_1394)
    {
        float _1444 = -_724;
        float _1446 = _1444 + _1352;
        _1440 = _1446;
    }
    float _1448 = _1440;
    if (!_1394)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1436 + _1450;
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (!_1394)
    {
        float _1458 = _1454 * _1454;
        _1416 = _1458;
    }
    float _1460 = _1416;
    float _1462 = _1460;
    if (!_1394)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1466 = _640 + _1464;
        _1456 = _1466;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1394)
    {
        float _1472 = fma(_1426, _1426, _1460);
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1474;
    if (!_1394)
    {
        float _1478 = fma(_1468, _1468, _1474);
        _1476 = _1478;
    }
    float _1480 = _1476;
    float _1482 = _1480;
    if (!_1394)
    {
        float _1484 = sqrt(_1480);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (!_1394)
    {
        float _1488 = precise::min(_1486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1428 = _1488;
    }
    float _1490 = _1428;
    float _1492 = _1490;
    if (!_1394)
    {
        float _1494 = _1490 * _1402;
        _1470 = _1494;
    }
    float _1496 = _1470;
    if (!_1394)
    {
        float _1498 = -_640;
        float _1500 = _1498 + _1358;
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1394)
    {
        float _1504 = fma(_1434, _1496, _1436);
        _1442 = _1504;
    }
    float _1506 = _1442;
    if (!_1394)
    {
        float _1508 = fma(_1448, _1496, _724);
        _1354 = _1508;
    }
    float _1510 = _1354;
    if (!_1394)
    {
        float _1512 = fma(_1502, _1496, _640);
        _1378 = _1512;
    }
    float _1514 = _1378;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1506 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1540 = _1522 * _1538;
    float _1542 = _1526 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 + _1546;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = _1550 + _1554;
    float _1558 = _1370;
    float _1560 = _1548;
    float _1562 = _1556;
    float _1564 = _1518;
    float _1566 = _1540;
    float _1568 = _1542;
    if (_1552)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1558 = _1570;
    }
    float _1572 = _1558;
    if (_1552)
    {
        float _1574 = rsqrt(_1548);
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1552)
    {
        float _1578 = _1556 * _1572;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1552)
    {
        float _1582 = _1580 * 0.15915493667125701904296875;
        _1288 = _1582;
    }
    float _1584 = _1288;
    float _1586 = _1572;
    if (_1552)
    {
        float _1588 = _1584 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = precise::max(0.0, _1594);
    float _1598 = _1434;
    float _1600 = _1596;
    if (_1552)
    {
        float _1602 = _1584 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = -_1538;
    float _1610 = -_1596;
    float _1612 = fma(_1518, _1608, _1610);
    if (_1552)
    {
        float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1614;
    }
    float _1616 = _1600;
    float _1618 = _1592;
    float _1620 = _1616;
    if (_1552)
    {
        float _1622 = fma(_1592, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1622;
    }
    float _1624 = _1290;
    if (!_1552)
    {
        _1618 = _1612;
    }
    float _1626 = _1618;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1630 = _1626;
    if (!_1552)
    {
        _1620 = _1544;
    }
    float _1632 = _1620;
    float _1634 = _1632;
    if (_1552)
    {
        float _1636 = _1606 + (-1.0);
        _1564 = _1636;
    }
    float _1638 = _1564;
    float _1640 = _1638;
    if (_1552)
    {
        float _1642 = _1576 * _1624;
        _1292 = _1642;
    }
    float _1644 = _1292;
    if (_1552)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = _1648;
    if (_1552)
    {
        float _1652 = _1540 * _1644;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1552)
    {
        float _1656 = _1542 * _1644;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1552)
    {
        float _1662 = fma(_1612, _1606, _1648);
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (_1552)
    {
        float _1666 = _1654 * _1654;
        _1634 = _1666;
    }
    float _1668 = _1634;
    if (!_1552)
    {
        _1650 = _1546;
    }
    float _1670 = _1650;
    float _1672 = _1670;
    if (_1552)
    {
        float _1674 = _1658 * _1658;
        _1672 = _1674;
    }
    float _1676 = _1672;
    float _1678 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1682 = fma(_1664, _1664, _1668);
    float _1684 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = floor(_1680);
    float _1688 = _1682 + _1676;
    float _1690 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1700 = -_1696;
    float _1702 = _1700 + 1.0;
    float _1704 = rsqrt(_1688);
    float _1706 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1712 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1720 = -_1712;
    float _1722 = fma(_1720, _1628, 1.0);
    float _1724 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = -_1686;
    float _1728 = _1680 + _1726;
    float _1730 = _1704 * _1654;
    float _1732 = _1704 * _1664;
    float _1734 = _1704 * _1658;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1738 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = floor(_1706);
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1740;
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = -_1734;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1710);
    float _1764 = log2(_1722);
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = exp2(_1752);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1788 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1780);
    float _1790 = -_1742;
    float _1792 = _1706 + _1790;
    float _1794 = _1732 + 1.0;
    float _1796 = sqrt(_1768);
    float _1798 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1802 = fma(_1774, _1786, -0.212114393711090087890625);
    float _1804 = _1764 * 0.693147182464599609375;
    float _1806 = 1.0 / _1788;
    float _1808 = -_1732;
    float _1810 = fma(_1778, _1794, _1808);
    float _1812 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1814 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float2 _5208 = float2(_1728, _1792);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).x;
    float _1818 = fma(_1774, _1802, 1.570728778839111328125);
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1796 * 0.636619746685028076171875;
    float _1824 = -_1818;
    float _1826 = fma(_1822, _1824, 1.0);
    float _1828 = fma(_1810, 0.5, 0.5);
    float _1830 = _1812 * _1806;
    float _1832 = _1814 * _1806;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float3 _5245 = float3(_1834, _1836, _1820);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float3 _5256 = float3(_1834, _1836, _1820);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5272 = float2(_1826, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1863 = in.m_71.x;
    float _1865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1867 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1086;
    float _1871 = -_852;
    bool _1873 = _1869 != _1871;
    bool _1875 = isnan(_1869);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1871);
    bool _1881 = _1877 || _1879;
    float _1883 = _1861 * _372;
    bool _1885 = _362 > 0.5;
    float _1887 = _1865 * _372;
    bool _1889 = _882 == 0.0;
    bool _1891 = !_1881;
    bool _1893 = _1889 && _1891;
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1897 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1899 = in.m_71.y;
    bool _1901 = _1068 == 0.0;
    bool _1903 = _1901 && _1893;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1907 = _1905 != 0;
    float _1909 = trunc(_1883);
    int _1911 = int(_1909);
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1915 = _1913 != 0;
    bool _1917 = _372 > 0.5;
    bool _1919 = _1917 && _1907;
    float _1921 = trunc(_1887);
    int _1923 = int(_1921);
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1927 = _1911 << 4;
    int _1929 = _1927 + 1712;
    float _1931 = in.m_73.x;
    float _1933 = in.m_73.y;
    float _1935 = in.m_73.z;
    float _1937 = -_1899;
    float _1939 = _1937 + 1.0;
    int _1941 = _1929 + 8;
    uint _1944 = uint(int(uint(_1941) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = _1923 << 4;
    int _1954 = _1952 + 1968;
    float _1956 = as_type<float>(_1923);
    float _1958 = _1899;
    float _1960 = _1863;
    if (_1907)
    {
        _1956 = _1863;
    }
    float _1962 = _1956;
    uint _1964 = uint(int(uint(_1929) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[int(_1974)][_1976];
    float _1980 = _1962;
    if (_1915)
    {
        float _1982 = _1885 ? _1939 : _1899;
        _1958 = _1982;
    }
    float _1984 = _1958;
    if (_1919)
    {
        float _1986 = -_1962;
        float _1988 = _1986 + 1.0;
        _1980 = _1988;
    }
    float _1990 = _1980;
    uint _1992 = uint(int(uint(_1954) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    if (_1907)
    {
        _1960 = _1990;
    }
    float _2008 = _1960;
    float _2010 = _1933;
    float _2012 = _1931;
    float _2014 = _1935;
    if (!_1903)
    {
        float _2016 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1933);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1903)
    {
        float _2020 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _2012 = _2020;
    }
    float _2022 = _2012;
    int _2024 = _1954 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    if (!_1903)
    {
        float _2034 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2014 = _2034;
    }
    float _2036 = _2014;
    float _2038 = -_2018;
    float _2040 = _1160 * _2038;
    float _2042 = _1168 * _2018;
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2046 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2048 = isnan(_1536);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2054 = _2050 || _2052;
    float _2056 = fma(_1170, _2022, _2040);
    float _2058 = fma(_1184, _2022, _2042);
    float _2060 = fma(_1172, _2036, _2056);
    float _2062 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = _1166 * _2018;
    float _2066 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_1180, _2022, _2064);
    float _2072 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2074 = _1978 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2076 = fma(_1188, _2036, _2070);
    float _2078 = fma(_1196, _2036, _2058);
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * _306;
    float _2086 = _2076 * _296;
    float _2088 = _2076 * _310;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2092 = fma(_2060, _280, _2084);
    float _2094 = fma(_2060, _276, _2086);
    out.m_75.x = _2080;
    out.m_75.y = _2082;
    out.m_75.z = _2068;
    out.m_75.w = _1925;
    float _2096 = fma(_2060, _284, _2088);
    float _2098 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = fma(_2078, _320, _2092);
    float _2102 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _2104;
    out.m_77.y = _2106;
    out.m_77.z = _2108;
    float _2110 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2112 = _2066 * _1895;
    float _2114 = fma(_2078, _316, _2094);
    float _2116 = fma(_2078, _324, _2096);
    float _2118 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2110);
    float _2120 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2122 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2118);
    float _2126 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2120);
    float _2128 = _2122 * _2044;
    out.m_79.x = _2100;
    out.m_79.y = _2114;
    out.m_79.z = _2116;
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2126);
    out.m_81.x = _2112;
    out.m_81.y = _2128;
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    float _2148 = 1.0 / _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2152 = _2148 * _2150;
    float _2154 = abs(_2152);
    float _2156 = log2(_2154);
    bool _2158 = _2152 <= 8000.0;
    bool _2160 = isnan(_2152);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(8000.0);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = exp2(_2170);
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = in.m_69.x;
    float _2180 = fma(_2176, -2.0, 3.0);
    float _2182 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _2188 = _2184 * _2180;
    float _2190 = exp2(_2182);
    float _2192 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2194 = -_2188;
    float _2196 = _2194 + 1.0;
    float _2198 = _2192 + _1788;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1788;
    float _2200 = fma(_2196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2202 = _2198 * 0.5;
    float _2204 = _2168 * _2200;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2208 = -_2190;
    float _2210 = _2208 + 1.0;
    out.m_85.z = _2202;
    out.m_85.w = _1788;
    float _2212 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2214 = -_1816;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * _2206;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = _2224 * _2178;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2230 = _2226;
    float _2232 = _2212;
    if (!_2054)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2234 = _2230;
    float _2236 = _2212 * _1838;
    float _2238 = -_2212;
    float _2240 = _2238 + 1.0;
    out.m_87.x = _2228;
    float _2242 = _2240;
    float _2244 = _2236;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2054)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2250 = _2232;
    float _2252 = _1849 * _2236;
    float _2254 = _1859 * _2236;
    float _2256 = _1849 * _2240;
    float _2258 = _2254;
    float _2260 = _2252;
    float _2262 = _2250;
    float _2264 = _2250;
    if (!_2054)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2242;
    float _2268 = fma(_1855, _2252, _1843);
    float _2270 = fma(_1857, _2252, _1845);
    float _2272 = fma(_1849, _2254, _1847);
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2054)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2278 = _2258;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2054)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2260;
    out.m_89.x = _2268;
    out.m_89.y = _2270;
    out.m_89.z = _2272;
    out.m_89.w = _2256;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2054)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2290 = _2244;
    bool _2292 = !_2054;
    float _2294 = _2290;
    float _2296 = _2290;
    if (!_2292)
    {
        bool _2298 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2300 = isnan(_1536);
        bool _2302 = _2298 || _2300;
        bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2306 = _2302 || _2304;
        if (!_2306)
        {
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2310 = _1536 + _2308;
            float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2312;
            float _2316 = 1.0 / _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2338 = _2310 * _2316;
            float _2340 = precise::clamp(_2338, 0.0, 1.0);
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2346 = fma(_2340, _2320, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2340, _2344, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2350 = fma(_2340, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2352 = fma(_2340, _2328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2354 = fma(_2340, _2332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2356 = fma(_2340, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2348;
            _2248 = _2354;
            _2282 = _2346;
            _2296 = _2352;
            _2276 = _2350;
            _2264 = _2356;
            _2358 = true;
        }
        else
        {
            bool _2360 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2362 = isnan(_1536);
            bool _2364 = _2360 || _2362;
            bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2368 = _2364 || _2366;
            if (!_2368)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2370 = _2280;
            _2282 = _2370;
            if (!_2368)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2372 = _2286;
            _2288 = _2372;
            if (!_2368)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2374 = _2274;
            _2276 = _2374;
            if (!_2368)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2376 = _2294;
            _2296 = _2376;
            if (!_2368)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2378 = _2246;
            _2248 = _2378;
            if (!_2368)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2380 = _2262;
            bool _2382 = !_2368;
            _2264 = _2380;
            if (!_2382)
            {
                bool _2384 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2386 = isnan(_1536);
                bool _2388 = _2384 || _2386;
                bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2392 = _2388 || _2390;
                if (!_2392)
                {
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2396 = _1536 + _2394;
                    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2398;
                    float _2402 = 1.0 / _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2424 = _2396 * _2402;
                    float _2426 = precise::clamp(_2424, 0.0, 1.0);
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2432 = fma(_2426, _2406, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2426, _2430, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2436 = fma(_2426, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2438 = fma(_2426, _2414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2440 = fma(_2426, _2418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2442 = fma(_2426, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2434;
                    _2248 = _2440;
                    _2282 = _2432;
                    _2296 = _2438;
                    _2276 = _2436;
                    _2264 = _2442;
                    _2358 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2358 = false;
    float _2444 = _2288;
    float _2446 = _2248;
    float _2448 = _2282;
    float _2450 = _2296;
    float _2452 = _2276;
    float _2454 = _2264;
    float _2456 = fma(_2114, -0.5, 0.5);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = -_2444;
    float _2462 = _2460 + _2446;
    float _2464 = -_2448;
    float _2466 = _2464 + _2450;
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    bool _2472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2474 = fma(_2458, _2462, _2444);
    float _2476 = fma(_2458, _2466, _2448);
    float _2478 = fma(_2458, _2470, _2452);
    float _2480 = _2474 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2482 = fma(_2476, 0.298911988735198974609375, _2480);
    float _2484 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2486 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_87.w = _2484;
    float _2488 = -_2486;
    float _2490 = _2476 + _2488;
    float _2492 = -_2486;
    float _2494 = _2474 + _2492;
    float _2496 = -_2486;
    float _2498 = _2478 + _2496;
    out.m_91.x = 0.0;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2504 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    out.m_93.x = _2500;
    out.m_93.y = _2502;
    out.m_93.z = _2504;
    if (!_2472)
    {
        return out;
    }
    float _2506 = -_1506;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2510 = -_1510;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2514 = -_1514;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2518 = _2508 * _2508;
    float _2520 = fma(_2512, _2512, _2518);
    float _2522 = fma(_2516, _2516, _2520);
    float _2524 = sqrt(_2522);
    float _2526 = rsqrt(_2522);
    float _2528 = -_2524;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = _2512 * _2526;
    float _2538 = _2508 * _2526;
    float _2540 = abs(_2534);
    float _2542 = log2(_2540);
    float _2544 = _2516 * _2526;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2548 = _2114 * _2538;
    float _2550 = -_2538;
    float _2552 = -_2546;
    float _2554 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2552);
    float _2556 = fma(_2100, _2536, _2548);
    float _2558 = -_2544;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2554);
    float _2562 = fma(_2116, _2544, _2556);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2568 = _2560 + _2566;
    float _2570 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = exp2(_2570);
    float _2578 = _2576 * _2574;
    float _2580 = _2564 * _2578;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2582;
    out.m_91.y = _2584;
    out.m_91.z = _2586;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2358 = false;
    bool _346 = false;
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
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2644 = as_type<float>(_128);
        out.gl_Position.z = _2644;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _130 = as_type<int>(_160);
    }
    int _162 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = 1.0 / _134;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.x;
    float _180 = in.m_59.y;
    float _182 = in.m_59.z;
    float _184 = _164 * _164;
    float _186 = _166 * _166;
    float _188 = _168 * _168;
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _202 > 0.0;
    bool _210 = _204 > 0.0;
    float _212 = _204;
    if (_208)
    {
        float _214 = rsqrt(_196);
        _212 = _214;
    }
    float _216 = _212;
    float _218 = 0.0;
    float _220 = 0.0;
    if (!_208)
    {
        _218 = 0.0;
        _220 = 0.0;
    }
    float _222 = _218;
    float _224 = _220;
    bool _226 = _206 > 0.0;
    float _228 = 0.0;
    float _230 = _222;
    float _232 = _224;
    if (!_208)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_210)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _242 = _236;
    float _244 = _238;
    float _246 = _202;
    float _248 = _244;
    float _250 = _242;
    if (_210)
    {
        float _252 = rsqrt(_198);
        _246 = _252;
    }
    float _254 = _246;
    float _256 = 0.0;
    if (!_210)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_226)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _206;
    float _268 = _264;
    if (_226)
    {
        float _270 = rsqrt(_200);
        _266 = _270;
    }
    float _272 = _266;
    if (_208)
    {
        float _274 = _216 * _164;
        _240 = _274;
    }
    float _276 = _240;
    if (_208)
    {
        float _278 = _216 * _172;
        _230 = _278;
    }
    float _280 = _230;
    if (_208)
    {
        float _282 = _216 * _178;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _288 = 0.0;
    if (!_226)
    {
        _288 = 0.0;
    }
    float _290 = _288;
    float _292 = _290;
    if (_210)
    {
        float _294 = _254 * _166;
        _248 = _294;
    }
    float _296 = _248;
    float _298 = 0.0;
    if (!_226)
    {
        _298 = 0.0;
    }
    float _300 = _298;
    float _302 = _300;
    if (_210)
    {
        float _304 = _254 * _174;
        _250 = _304;
    }
    float _306 = _250;
    if (_210)
    {
        float _308 = _254 * _180;
        _262 = _308;
    }
    float _310 = _262;
    float _312 = _138 * _170;
    if (_226)
    {
        float _314 = _272 * _168;
        _268 = _314;
    }
    float _316 = _268;
    if (_226)
    {
        float _318 = _272 * _176;
        _292 = _318;
    }
    float _320 = _292;
    if (_226)
    {
        float _322 = _272 * _182;
        _302 = _322;
    }
    float _324 = _302;
    bool _326 = !_286;
    float _344;
    if (!_326)
    {
        float _328 = in.m_61.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        _344 = _312;
    }
    _346 = false;
    float _348 = _344;
    float _350 = in.m_48.x;
    float _352 = in.m_48.y;
    float _354 = in.m_48.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _358 = -_312;
    float _360 = _358 + 1.0;
    float _362 = in.m_61.y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _348 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    float _372 = in.m_61.x;
    float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _376 = log2(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = _348 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _348 + _386;
    float _390 = in.m_59.w;
    float _392 = 1.0 / _370;
    float _394 = _360 * _356;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = in.m_57.w;
    bool _408 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_348);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _174 * _352;
    float _422 = _312 * _356;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = in.m_61.z;
    float _428 = _180 * _352;
    float _430 = fma(_172, _350, _420);
    float _432 = 1.0 / _380;
    float _434 = _376 * _138;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = fma(_178, _350, _428);
    float _442 = _384 * _392;
    float _444 = precise::min(_424, _396);
    float _446 = fma(_176, _354, _430);
    float _448 = fma(_182, _354, _440);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    float _454 = exp2(_434);
    float _456 = fma(_400, _442, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _472 = _470 != 0;
    float _474 = _366 * _432;
    float _476 = 1.0 / _452;
    float _478 = _372 + _426;
    bool _480 = !_464;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_404, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _496 = _494 != 0;
    float _498 = _478 + (-1.0);
    bool _500 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(1.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = 1.0 / _438;
    float _512 = _362 * 2.0;
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _518 = -_454;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _426 * 2.0;
    float _534 = fma(_516, _362, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _536 = floor(_512);
    float _538 = _362 + _426;
    float _540 = _530 ? _520 : 0.0;
    float _542 = _534 * _138;
    float _544 = _538 + (-1.0);
    bool _546 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _548 = isnan(_348);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    if (_508)
    {
        float _558 = _540 * _476;
        _156 = _558;
    }
    float _560 = _156;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _562;
    float _566 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = _372 + _362;
    bool _570 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_348);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _584 = -_556;
    float _586 = _584 + 1.0;
    float _588 = _568 + (-1.0);
    float _590 = _388 * _510;
    bool _592 = _536 > 0.0;
    float _594 = _372 * 2.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = !_468;
    int _600 = _598 ? 0 : 1;
    float _602 = floor(_532);
    bool _604 = _536 >= 0.0;
    bool _606 = isnan(_536);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _622;
    bool _626 = !_472;
    int _628 = _626 ? 0 : 1;
    float _630 = fma(_616, _442, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = fma(_564, _442, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = floor(_594);
    float _640 = _448 + _390;
    float _642 = fma(_636, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _644 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _646 = isnan(_348);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_580;
    float _658 = _656 + 1.0;
    float _660 = fma(_620, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _662 = fma(_624, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _664 = _602 >= 0.0;
    bool _666 = isnan(_602);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = _556 * _658;
    float _676 = _654 * _586;
    float _678 = -_654;
    float _680 = _678 + 1.0;
    float _682 = fma(_460, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _684 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _686 = _602 > 0.0;
    float _688 = _418 * _680;
    int _690 = _672 ? 0 : 1;
    float _692 = _684 * _582;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _696 = _630 * _688;
    float _698 = _456 * _688;
    float _700 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].x, _692);
    float _702 = _632 * _688;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _704;
    bool _708 = _638 >= 0.0;
    bool _710 = isnan(_638);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -_418;
    float _720 = _718 + 1.0;
    float _722 = floor(_700);
    float _724 = _446 + _406;
    float _726 = fma(_706, _590, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _728 = ~_690;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = _560 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _742 = _732;
    if (!_686)
    {
        int _744 = ~_690;
        int _746 = _744 + 1;
        _742 = _746;
    }
    int _748 = _742;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    int _752 = _612 ? 0 : 1;
    float _754 = fma(_642, _676, _734);
    int _756 = _716 ? 0 : 1;
    float _758 = _740 * _694;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = fma(_484, _676, _750);
    bool _774 = _638 > 0.0;
    float _776 = -_722;
    float _778 = _700 + _776;
    float _780 = _700 + 0.25;
    float _782 = fma(_662, _674, _754);
    float _784 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _702);
    float _786 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[203].z, _758);
    float _788 = floor(_780);
    int _790 = ~_752;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = _700 * 6.283185482025146484375;
    int _798 = _794;
    if (!_592)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_660, _676, _784);
    int _808 = ~_756;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _786 + 0.25;
    bool _816 = _778 >= 0.5;
    bool _818 = isnan(_778);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    float _826 = floor(_786);
    int _828 = _812;
    if (!_774)
    {
        int _830 = ~_756;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_63.x;
    float _838 = in.m_63.y;
    float _840 = in.m_63.z;
    bool _842 = !_762;
    int _844 = _842 ? 0 : 1;
    float _846 = fma(_372, 6.283185482025146484375, _542);
    bool _848 = !_766;
    int _850 = _848 ? 0 : 1;
    float _852 = in.m_65.y;
    int _854 = abs(_844);
    float _856 = -_788;
    float _858 = _780 + _856;
    int _860 = abs(_850);
    float _862 = _426 + (-0.5);
    float _864 = float(_748);
    float _866 = _796 * 0.15915493667125701904296875;
    float _868 = float(_834);
    float _870 = floor(_814);
    float _872 = float(_854);
    float _874 = -_826;
    float _876 = _786 + _874;
    float _878 = float(_860);
    float _880 = _786 * 6.283185482025146484375;
    float _882 = in.m_65.x;
    int _884 = abs(_600);
    float _886 = _866 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _872 * _864;
    float _892 = _878 * _868;
    bool _894 = !_824;
    float _896 = _894 ? 0.5 : (-0.5);
    float _898 = _880 * 0.15915493667125701904296875;
    bool _900 = _858 > 0.5;
    float _902 = _892 * (-2.0);
    float _904 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _906 = _904 * 2.0;
    int _908 = abs(_482);
    float _910 = _898 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = float(_884);
    float _916 = -_870;
    float _918 = _814 + _916;
    float _920 = float(_908);
    float _922 = fma(_902, _838, _838);
    int _924 = abs(_628);
    float _926 = _914 * _906;
    bool _928 = _876 >= 0.5;
    bool _930 = isnan(_876);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _888 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _940 = fma(_566, _902, _566);
    bool _942 = !_492;
    int _944 = _942 ? 0 : 1;
    float _946 = _858;
    float _948 = _918;
    if (_900)
    {
        float _950 = -_858;
        float _952 = _950 + 1.0;
        _946 = _952;
    }
    float _954 = _946;
    bool _956 = !_488;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_920, _938, _926);
    bool _962 = _918 > 0.5;
    float _964 = fma(_954, 4.0, -1.0);
    int _966 = abs(_944);
    float _968 = _362 + (-0.5);
    bool _970 = !_936;
    float _972 = _970 ? 0.5 : (-0.5);
    float _974 = _890 * (-2.0);
    int _976 = abs(_958);
    float _978 = fma(_682, _674, _772);
    float _980 = float(_924);
    float _982 = _972 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _984 = _982 * 2.0;
    float _986 = float(_966);
    float _988 = _964 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _990 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _992 = _912 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _994 = _986 * _984;
    float _996 = float(_976);
    float _998 = fma(_980, _988, _960);
    if (_962)
    {
        float _1000 = -_918;
        float _1002 = _1000 + 1.0;
        _948 = _1002;
    }
    float _1004 = _948;
    float _1006 = _846 * 0.15915493667125701904296875;
    float _1008 = _640 * _640;
    int _1010 = abs(_738);
    float _1012 = fma(_996, _992, _994);
    float _1014 = fma(_1004, 4.0, -1.0);
    float _1016 = fma(_998, 3.1415927410125732421875, _836);
    bool _1018 = !_770;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_724, _724, _1008);
    float _1024 = float(_1010);
    float _1026 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1028 = fma(_940, _560, _990);
    int _1030 = abs(_1020);
    float _1032 = _372 + (-0.5);
    float _1034 = fma(_1016, _974, _1016);
    float _1036 = _1006 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_1024, _1026, _1012);
    float _1042 = float(_804);
    float _1044 = fma(_596, _974, _596);
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1034);
    float _1048 = fma(_1040, 3.1415927410125732421875, _840);
    float _1050 = fma(_726, _674, _806);
    float _1052 = in.m_67.x;
    float _1054 = in.m_67.y;
    float _1056 = in.m_67.z;
    float _1058 = fma(_1044, _560, _1046);
    float _1060 = _1028 * 0.15915493667125701904296875;
    float _1062 = float(_1030);
    float _1064 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].y, _978);
    float _1066 = _1058 * 0.15915493667125701904296875;
    float _1068 = in.m_65.z;
    float _1070 = sqrt(_1022);
    float _1072 = _1062 * _1042;
    float _1074 = -_444;
    float _1076 = _1074 + 1.0;
    float _1078 = abs(_1038);
    float _1080 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1082 = _594 + (-1.0);
    float _1084 = _1072 * (-2.0);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1080);
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_514, _1084, _514);
    float _1094 = fma(_1048, _1084, _1048);
    float _1096 = -_1086;
    float _1098 = _1096 + _852;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _1102 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1094);
    float _1104 = _1060 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = _1082 * _1070;
    float _1110 = fma(_1092, _560, _1102);
    float _1112 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].x, _782);
    float _1114 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1050);
    float _1116 = _1108 * 0.75;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1112 * _1052;
    float _1122 = _1064 * _1054;
    float _1124 = _1066 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = _1114 * _1056;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1138 = _1130 * _1100;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1142 = _1066 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1140 * _1136;
    float _1148 = _1118 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1126 * _1106;
    float _1154 = _1126 * _1090;
    float _1156 = _1134 * _1132;
    float _1158 = _1118 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = _1144 * _1090;
    float _1164 = _1144 * _1106;
    float _1166 = _1126 * _1150;
    float _1168 = _1144 * _1150;
    float _1170 = _1106 * _1150;
    float _1172 = _1090 * _1150;
    float _1174 = _1166 * _1156;
    float _1176 = _1116 * 0.15915493667125701904296875;
    float _1178 = _1168 * _1156;
    float _1180 = fma(_1160, _1152, _1162);
    float _1182 = -_1154;
    float _1184 = fma(_1160, _1164, _1182);
    float _1186 = -_1164;
    float _1188 = fma(_1160, _1154, _1186);
    float _1190 = -_1156;
    float _1192 = _1160 * _1190;
    float _1194 = fma(_1180, _1138, _1174);
    float _1196 = fma(_1160, _1162, _1152);
    float _1198 = _1176 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1170, _1138, _1192);
    float _1204 = fma(_1188, _1146, _1194);
    float _1206 = fma(_1184, _1138, _1178);
    float _1208 = fma(_1172, _1146, _1202);
    float _1210 = _1204 * _306;
    float _1212 = fma(_1196, _1146, _1206);
    float _1214 = _1176 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1204 * _310;
    float _1220 = fma(_1208, _280, _1210);
    float _1222 = _1204 * _296;
    float _1224 = fma(_1208, _284, _1218);
    float _1226 = fma(_1212, _320, _1220);
    float _1228 = fma(_1208, _276, _1222);
    float _1230 = fma(_1212, _324, _1224);
    float _1232 = _1226 * _1200;
    float _1234 = fma(_1212, _316, _1228);
    float _1236 = _1226 * _1216;
    float _1238 = -_1232;
    float _1240 = fma(_1230, _1216, _1238);
    float _1242 = in.m_69.y;
    float _1244 = fma(_1230, _1200, _1236);
    float _1246 = _640 + _1240;
    float _1248 = _724 + _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1246 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1256 = _1248 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = fma(_1256, _1256, _1258);
    float _1262 = sqrt(_1260);
    float _1264 = _352 + _1242;
    float _1266 = _1264 + _1234;
    bool _1268 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1262 + _1270;
    float _1274 = _1230;
    float _1276 = _1208;
    float _1278 = _1228;
    float _1280 = _1272;
    float _1282 = _1244;
    float _1284 = _1256;
    float _1286 = _1234;
    float _1288 = _1050;
    float _1290 = _1080;
    float _1292 = _1094;
    if (_1268)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1268)
    {
        float _1298 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1298;
    }
    float _1300 = _1276;
    float _1302 = _1300;
    if (_1268)
    {
        float _1304 = rsqrt(_1260);
        _1278 = _1304;
    }
    float _1306 = _1278;
    float _1308 = _1296;
    float _1310 = _1306;
    if (_1268)
    {
        float _1312 = _1272 * _1296;
        _1280 = _1312;
    }
    float _1314 = _1280;
    if (_1268)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1282 = _1316;
    }
    float _1318 = _1282;
    float _1320 = _1314;
    float _1322 = _1318;
    if (_1268)
    {
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        _1320 = _1326;
    }
    float _1328 = _1320;
    float _1330 = _1328;
    if (_1268)
    {
        float _1332 = fma(_1328, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1332;
    }
    float _1334 = _1308;
    float _1336 = _1334;
    if (!_1268)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1268)
    {
        _1302 = _1246;
    }
    float _1342 = _1302;
    float _1344 = _1342;
    if (_1268)
    {
        float _1346 = _1306 * _1334;
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1268)
    {
        float _1350 = fma(_1256, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1340 = _1350;
    }
    float _1352 = _1340;
    float _1354 = _1352;
    if (_1268)
    {
        float _1356 = fma(_1252, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1362 = _1352 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1366 = _1358 + _1364;
    float _1368 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1370 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4447 = float2(_1368, _1370);
    float _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4447, float2(0.0), isnan(_4447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4447, float2(0.0), isnan(_4447)), level(0.0)).x;
    float _1374 = _1362;
    float _1376 = _1366;
    float _1378 = _1358;
    if (_1268)
    {
        float _1380 = _1318 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        _1374 = _1382;
    }
    float _1384 = _1374;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    if (!_1268)
    {
        _1336 = _1266;
    }
    float _1396 = _1336;
    float _1398 = _1396;
    if (!_1394)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1400;
    }
    float _1402 = _1284;
    float _1404 = _1384;
    if (_1268)
    {
        float _1406 = _1384 + (-1.0);
        _1376 = _1406;
    }
    float _1408 = _1376;
    float _1410 = _1408;
    if (_1268)
    {
        float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1412;
    }
    float _1414 = _1286;
    float _1416 = _1414;
    if (_1268)
    {
        float _1418 = fma(_1266, _1384, _1414);
        _1398 = _1418;
    }
    float _1420 = _1398;
    if (!_1394)
    {
        float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1424 = _724 + _1422;
        _1404 = _1424;
    }
    float _1426 = _1404;
    float _1428 = _1426;
    if (!_1394)
    {
        float _1430 = -_1264;
        float _1432 = _1430 + _1420;
        _1322 = _1432;
    }
    float _1434 = _1322;
    float _1436 = fma(_1372, 100.0, _1264);
    float _1438 = fma(_1372, 100.0, _1420);
    float _1440 = _1372;
    float _1442 = _1438;
    if (!_1394)
    {
        float _1444 = -_724;
        float _1446 = _1444 + _1352;
        _1440 = _1446;
    }
    float _1448 = _1440;
    if (!_1394)
    {
        float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1452 = _1436 + _1450;
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (!_1394)
    {
        float _1458 = _1454 * _1454;
        _1416 = _1458;
    }
    float _1460 = _1416;
    float _1462 = _1460;
    if (!_1394)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1466 = _640 + _1464;
        _1456 = _1466;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1394)
    {
        float _1472 = fma(_1426, _1426, _1460);
        _1462 = _1472;
    }
    float _1474 = _1462;
    float _1476 = _1474;
    if (!_1394)
    {
        float _1478 = fma(_1468, _1468, _1474);
        _1476 = _1478;
    }
    float _1480 = _1476;
    float _1482 = _1480;
    if (!_1394)
    {
        float _1484 = sqrt(_1480);
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (!_1394)
    {
        float _1488 = precise::min(_1486, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1428 = _1488;
    }
    float _1490 = _1428;
    float _1492 = _1490;
    if (!_1394)
    {
        float _1494 = _1490 * _1402;
        _1470 = _1494;
    }
    float _1496 = _1470;
    if (!_1394)
    {
        float _1498 = -_640;
        float _1500 = _1498 + _1358;
        _1492 = _1500;
    }
    float _1502 = _1492;
    if (!_1394)
    {
        float _1504 = fma(_1434, _1496, _1436);
        _1442 = _1504;
    }
    float _1506 = _1442;
    if (!_1394)
    {
        float _1508 = fma(_1448, _1496, _724);
        _1354 = _1508;
    }
    float _1510 = _1354;
    if (!_1394)
    {
        float _1512 = fma(_1502, _1496, _640);
        _1378 = _1512;
    }
    float _1514 = _1378;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1518 = _1506 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1514 + _1524;
    float _1528 = _1518 * _1518;
    float _1530 = fma(_1522, _1522, _1528);
    float _1532 = fma(_1526, _1526, _1530);
    float _1534 = rsqrt(_1532);
    float _1536 = sqrt(_1532);
    float _1538 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1540 = _1522 * _1538;
    float _1542 = _1526 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 + _1546;
    float _1550 = sqrt(_1548);
    bool _1552 = _1550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = _1550 + _1554;
    float _1558 = _1370;
    float _1560 = _1548;
    float _1562 = _1556;
    float _1564 = _1518;
    float _1566 = _1540;
    float _1568 = _1542;
    if (_1552)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1558 = _1570;
    }
    float _1572 = _1558;
    if (_1552)
    {
        float _1574 = rsqrt(_1548);
        _1560 = _1574;
    }
    float _1576 = _1560;
    if (_1552)
    {
        float _1578 = _1556 * _1572;
        _1562 = _1578;
    }
    float _1580 = _1562;
    if (_1552)
    {
        float _1582 = _1580 * 0.15915493667125701904296875;
        _1288 = _1582;
    }
    float _1584 = _1288;
    float _1586 = _1572;
    if (_1552)
    {
        float _1588 = _1584 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        _1586 = _1590;
    }
    float _1592 = _1586;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = precise::max(0.0, _1594);
    float _1598 = _1434;
    float _1600 = _1596;
    if (_1552)
    {
        float _1602 = _1584 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = -_1538;
    float _1610 = -_1596;
    float _1612 = fma(_1518, _1608, _1610);
    if (_1552)
    {
        float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1614;
    }
    float _1616 = _1600;
    float _1618 = _1592;
    float _1620 = _1616;
    if (_1552)
    {
        float _1622 = fma(_1592, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1290 = _1622;
    }
    float _1624 = _1290;
    if (!_1552)
    {
        _1618 = _1612;
    }
    float _1626 = _1618;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1630 = _1626;
    if (!_1552)
    {
        _1620 = _1544;
    }
    float _1632 = _1620;
    float _1634 = _1632;
    if (_1552)
    {
        float _1636 = _1606 + (-1.0);
        _1564 = _1636;
    }
    float _1638 = _1564;
    float _1640 = _1638;
    if (_1552)
    {
        float _1642 = _1576 * _1624;
        _1292 = _1642;
    }
    float _1644 = _1292;
    if (_1552)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = _1648;
    if (_1552)
    {
        float _1652 = _1540 * _1644;
        _1566 = _1652;
    }
    float _1654 = _1566;
    if (_1552)
    {
        float _1656 = _1542 * _1644;
        _1568 = _1656;
    }
    float _1658 = _1568;
    float _1660 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1552)
    {
        float _1662 = fma(_1612, _1606, _1648);
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (_1552)
    {
        float _1666 = _1654 * _1654;
        _1634 = _1666;
    }
    float _1668 = _1634;
    if (!_1552)
    {
        _1650 = _1546;
    }
    float _1670 = _1650;
    float _1672 = _1670;
    if (_1552)
    {
        float _1674 = _1658 * _1658;
        _1672 = _1674;
    }
    float _1676 = _1672;
    float _1678 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1680 = fma(_724, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1682 = fma(_1664, _1664, _1668);
    float _1684 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = floor(_1680);
    float _1688 = _1682 + _1676;
    float _1690 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1700 = -_1696;
    float _1702 = _1700 + 1.0;
    float _1704 = rsqrt(_1688);
    float _1706 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1712 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1678);
    float _1720 = -_1712;
    float _1722 = fma(_1720, _1628, 1.0);
    float _1724 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1726 = -_1686;
    float _1728 = _1680 + _1726;
    float _1730 = _1704 * _1654;
    float _1732 = _1704 * _1664;
    float _1734 = _1704 * _1658;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1724);
    float _1738 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = floor(_1706);
    float _1744 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1740;
    float _1750 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = -_1734;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1710);
    float _1764 = log2(_1722);
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1772 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = exp2(_1752);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1782 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1788 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1780);
    float _1790 = -_1742;
    float _1792 = _1706 + _1790;
    float _1794 = _1732 + 1.0;
    float _1796 = sqrt(_1768);
    float _1798 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1800 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1802 = fma(_1774, _1786, -0.212114393711090087890625);
    float _1804 = _1764 * 0.693147182464599609375;
    float _1806 = 1.0 / _1788;
    float _1808 = -_1732;
    float _1810 = fma(_1778, _1794, _1808);
    float _1812 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1798);
    float _1814 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float2 _5208 = float2(_1728, _1792);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).x;
    float _1818 = fma(_1774, _1802, 1.570728778839111328125);
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1796 * 0.636619746685028076171875;
    float _1824 = -_1818;
    float _1826 = fma(_1822, _1824, 1.0);
    float _1828 = fma(_1810, 0.5, 0.5);
    float _1830 = _1812 * _1806;
    float _1832 = _1814 * _1806;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float3 _5245 = float3(_1834, _1836, _1820);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float3 _5256 = float3(_1834, _1836, _1820);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5272 = float2(_1826, _1828);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5272, float2(0.0), isnan(_5272)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5272, float2(0.0), isnan(_5272)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1863 = in.m_71.x;
    float _1865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1867 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1086;
    float _1871 = -_852;
    bool _1873 = _1869 != _1871;
    bool _1875 = isnan(_1869);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1871);
    bool _1881 = _1877 || _1879;
    float _1883 = _1861 * _372;
    bool _1885 = _362 > 0.5;
    float _1887 = _1865 * _372;
    bool _1889 = _882 == 0.0;
    bool _1891 = !_1881;
    bool _1893 = _1889 && _1891;
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1897 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    float _1899 = in.m_71.y;
    bool _1901 = _1068 == 0.0;
    bool _1903 = _1901 && _1893;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1907 = _1905 != 0;
    float _1909 = trunc(_1883);
    int _1911 = int(_1909);
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1915 = _1913 != 0;
    bool _1917 = _372 > 0.5;
    bool _1919 = _1917 && _1907;
    float _1921 = trunc(_1887);
    int _1923 = int(_1921);
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1927 = _1911 << 4;
    int _1929 = _1927 + 1712;
    float _1931 = in.m_73.x;
    float _1933 = in.m_73.y;
    float _1935 = in.m_73.z;
    float _1937 = -_1899;
    float _1939 = _1937 + 1.0;
    int _1941 = _1929 + 8;
    uint _1944 = uint(int(uint(_1941) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = _1923 << 4;
    int _1954 = _1952 + 1968;
    float _1956 = as_type<float>(_1923);
    float _1958 = _1899;
    float _1960 = _1863;
    if (_1907)
    {
        _1956 = _1863;
    }
    float _1962 = _1956;
    uint _1964 = uint(int(uint(_1929) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[int(_1974)][_1976];
    float _1980 = _1962;
    if (_1915)
    {
        float _1982 = _1885 ? _1939 : _1899;
        _1958 = _1982;
    }
    float _1984 = _1958;
    if (_1919)
    {
        float _1986 = -_1962;
        float _1988 = _1986 + 1.0;
        _1980 = _1988;
    }
    float _1990 = _1980;
    uint _1992 = uint(int(uint(_1954) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    if (_1907)
    {
        _1960 = _1990;
    }
    float _2008 = _1960;
    float _2010 = _1933;
    float _2012 = _1931;
    float _2014 = _1935;
    if (!_1903)
    {
        float _2016 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1933);
        _2010 = _2016;
    }
    float _2018 = _2010;
    if (!_1903)
    {
        float _2020 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1931);
        _2012 = _2020;
    }
    float _2022 = _2012;
    int _2024 = _1954 + 8;
    uint _2026 = uint(int(uint(_2024) >> uint(2)));
    uint _2028 = uint(int(uint(int(_2026)) >> uint(2)));
    int _2030 = int(_2026) & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    if (!_1903)
    {
        float _2034 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1935);
        _2014 = _2034;
    }
    float _2036 = _2014;
    float _2038 = -_2018;
    float _2040 = _1160 * _2038;
    float _2042 = _1168 * _2018;
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2046 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2048 = isnan(_1536);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2054 = _2050 || _2052;
    float _2056 = fma(_1170, _2022, _2040);
    float _2058 = fma(_1184, _2022, _2042);
    float _2060 = fma(_1172, _2036, _2056);
    float _2062 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2064 = _1166 * _2018;
    float _2066 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_1180, _2022, _2064);
    float _2072 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2074 = _1978 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2076 = fma(_1188, _2036, _2070);
    float _2078 = fma(_1196, _2036, _2058);
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2076 * _306;
    float _2086 = _2076 * _296;
    float _2088 = _2076 * _310;
    float _2090 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2092 = fma(_2060, _280, _2084);
    float _2094 = fma(_2060, _276, _2086);
    out.m_75.x = _2080;
    out.m_75.y = _2082;
    out.m_75.z = _2068;
    out.m_75.w = _1925;
    float _2096 = fma(_2060, _284, _2088);
    float _2098 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = fma(_2078, _320, _2092);
    float _2102 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2104 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _2104;
    out.m_77.y = _2106;
    out.m_77.z = _2108;
    float _2110 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2112 = _2066 * _1895;
    float _2114 = fma(_2078, _316, _2094);
    float _2116 = fma(_2078, _324, _2096);
    float _2118 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2110);
    float _2120 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2122 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2118);
    float _2126 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2120);
    float _2128 = _2122 * _2044;
    out.m_79.x = _2100;
    out.m_79.y = _2114;
    out.m_79.z = _2116;
    float _2130 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2132 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2126);
    out.m_81.x = _2112;
    out.m_81.y = _2128;
    float _2134 = 1.0 / _2130;
    float _2136 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2138 = _2136 + _2130;
    float _2140 = _2138 * _2134;
    float _2142 = _2140 * 0.5;
    float _2144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2146 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2144);
    float _2148 = 1.0 / _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2152 = _2148 * _2150;
    float _2154 = abs(_2152);
    float _2156 = log2(_2154);
    bool _2158 = _2152 <= 8000.0;
    bool _2160 = isnan(_2152);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(8000.0);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = exp2(_2170);
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = in.m_69.x;
    float _2180 = fma(_2176, -2.0, 3.0);
    float _2182 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1897);
    float _2188 = _2184 * _2180;
    float _2190 = exp2(_2182);
    float _2192 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2194 = -_2188;
    float _2196 = _2194 + 1.0;
    float _2198 = _2192 + _1788;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1788;
    float _2200 = fma(_2196, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2202 = _2198 * 0.5;
    float _2204 = _2168 * _2200;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2208 = -_2190;
    float _2210 = _2208 + 1.0;
    out.m_85.z = _2202;
    out.m_85.w = _1788;
    float _2212 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2214 = -_1816;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * _2206;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = -_2220;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = _2224 * _2178;
    float _2228 = _2226 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2230 = _2226;
    float _2232 = _2212;
    if (!_2054)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2234 = _2230;
    float _2236 = _2212 * _1838;
    float _2238 = -_2212;
    float _2240 = _2238 + 1.0;
    out.m_87.x = _2228;
    float _2242 = _2240;
    float _2244 = _2236;
    float _2246 = _2234;
    float _2248 = _2234;
    if (!_2054)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2250 = _2232;
    float _2252 = _1849 * _2236;
    float _2254 = _1859 * _2236;
    float _2256 = _1849 * _2240;
    float _2258 = _2254;
    float _2260 = _2252;
    float _2262 = _2250;
    float _2264 = _2250;
    if (!_2054)
    {
        _2242 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2242;
    float _2268 = fma(_1855, _2252, _1843);
    float _2270 = fma(_1857, _2252, _1845);
    float _2272 = fma(_1849, _2254, _1847);
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2054)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2278 = _2258;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2054)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2260;
    out.m_89.x = _2268;
    out.m_89.y = _2270;
    out.m_89.z = _2272;
    out.m_89.w = _2256;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2054)
    {
        _2244 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2290 = _2244;
    bool _2292 = !_2054;
    float _2294 = _2290;
    float _2296 = _2290;
    if (!_2292)
    {
        bool _2298 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2300 = isnan(_1536);
        bool _2302 = _2298 || _2300;
        bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2306 = _2302 || _2304;
        if (!_2306)
        {
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2310 = _1536 + _2308;
            float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2314 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2312;
            float _2316 = 1.0 / _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2338 = _2310 * _2316;
            float _2340 = precise::clamp(_2338, 0.0, 1.0);
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2346 = fma(_2340, _2320, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2348 = fma(_2340, _2344, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2350 = fma(_2340, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2352 = fma(_2340, _2328, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2354 = fma(_2340, _2332, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2356 = fma(_2340, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2348;
            _2248 = _2354;
            _2282 = _2346;
            _2296 = _2352;
            _2276 = _2350;
            _2264 = _2356;
            _2358 = true;
        }
        else
        {
            bool _2360 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2362 = isnan(_1536);
            bool _2364 = _2360 || _2362;
            bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2368 = _2364 || _2366;
            if (!_2368)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2370 = _2280;
            _2282 = _2370;
            if (!_2368)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2372 = _2286;
            _2288 = _2372;
            if (!_2368)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2374 = _2274;
            _2276 = _2374;
            if (!_2368)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2376 = _2294;
            _2296 = _2376;
            if (!_2368)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2378 = _2246;
            _2248 = _2378;
            if (!_2368)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2380 = _2262;
            bool _2382 = !_2368;
            _2264 = _2380;
            if (!_2382)
            {
                bool _2384 = _1536 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2386 = isnan(_1536);
                bool _2388 = _2384 || _2386;
                bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2392 = _2388 || _2390;
                if (!_2392)
                {
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2396 = _1536 + _2394;
                    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2400 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2398;
                    float _2402 = 1.0 / _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2424 = _2396 * _2402;
                    float _2426 = precise::clamp(_2424, 0.0, 1.0);
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2432 = fma(_2426, _2406, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2434 = fma(_2426, _2430, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2436 = fma(_2426, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2438 = fma(_2426, _2414, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2440 = fma(_2426, _2418, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2442 = fma(_2426, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2434;
                    _2248 = _2440;
                    _2282 = _2432;
                    _2296 = _2438;
                    _2276 = _2436;
                    _2264 = _2442;
                    _2358 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2358 = false;
    float _2444 = _2288;
    float _2446 = _2248;
    float _2448 = _2282;
    float _2450 = _2296;
    float _2452 = _2276;
    float _2454 = _2264;
    float _2456 = fma(_2114, -0.5, 0.5);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = -_2444;
    float _2462 = _2460 + _2446;
    float _2464 = -_2448;
    float _2466 = _2464 + _2450;
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    bool _2472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2474 = fma(_2458, _2462, _2444);
    float _2476 = fma(_2458, _2466, _2448);
    float _2478 = fma(_2458, _2470, _2452);
    float _2480 = _2474 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2482 = fma(_2476, 0.298911988735198974609375, _2480);
    float _2484 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2486 = fma(_2478, 0.114477999508380889892578125, _2482);
    out.m_87.w = _2484;
    float _2488 = -_2486;
    float _2490 = _2476 + _2488;
    float _2492 = -_2486;
    float _2494 = _2474 + _2492;
    float _2496 = -_2486;
    float _2498 = _2478 + _2496;
    out.m_91.x = 0.0;
    float _2500 = fma(_2490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2502 = fma(_2494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    float _2504 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2486);
    out.m_93.x = _2500;
    out.m_93.y = _2502;
    out.m_93.z = _2504;
    if (!_2472)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2506 = -_1506;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2510 = -_1510;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2514 = -_1514;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2518 = _2508 * _2508;
    float _2520 = fma(_2512, _2512, _2518);
    float _2522 = fma(_2516, _2516, _2520);
    float _2524 = sqrt(_2522);
    float _2526 = rsqrt(_2522);
    float _2528 = -_2524;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = _2512 * _2526;
    float _2538 = _2508 * _2526;
    float _2540 = abs(_2534);
    float _2542 = log2(_2540);
    float _2544 = _2516 * _2526;
    float _2546 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2548 = _2114 * _2538;
    float _2550 = -_2538;
    float _2552 = -_2546;
    float _2554 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2552);
    float _2556 = fma(_2100, _2536, _2548);
    float _2558 = -_2544;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2554);
    float _2562 = fma(_2116, _2544, _2556);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2568 = _2560 + _2566;
    float _2570 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = exp2(_2570);
    float _2578 = _2576 * _2574;
    float _2580 = _2564 * _2578;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2582;
    out.m_91.y = _2584;
    out.m_91.z = _2586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

