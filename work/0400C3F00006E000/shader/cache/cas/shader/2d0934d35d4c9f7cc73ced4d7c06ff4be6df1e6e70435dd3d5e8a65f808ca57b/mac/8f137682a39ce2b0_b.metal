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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_53 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2117 = false;
    bool _1404 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_50.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_53.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2401 = as_type<float>(_126);
        out.gl_Position.z = _2401;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_55.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_166);
        out.gl_Position.z = _2471;
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
        float _172 = in.m_57.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_57.z;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _198 + _202;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_57.x;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _236 = _234 != 0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _198 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = 0.0;
    if (!_208)
    {
        float _248 = in.m_57.y;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = 1.0 / _220;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = _200 * 2.0;
    float _260 = 1.0 / _224;
    float _262 = _204 * _216;
    float _264 = _210 * 2.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _198 + _266;
    float _270 = floor(_258);
    float _272 = _268 * _252;
    float _274 = _210 + _200;
    float _276 = _268;
    float _278 = _216;
    float _280 = _200;
    if (!_208)
    {
        _276 = _200;
    }
    float _282 = _276;
    float _284 = fma(_244, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _282;
    if (!_208)
    {
        _278 = _250;
    }
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = floor(_264);
    float _296 = _240 * _260;
    float _298 = fma(_292, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = _288;
    float _302 = _250;
    if (_208)
    {
        float _304 = in.m_57.x;
        float _306 = in.m_57.y;
        _300 = _304;
        _302 = _306;
    }
    float _308 = _300;
    float _310 = _302;
    float _312 = _274 + (-1.0);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _270 >= 0.0;
    bool _324 = isnan(_270);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _334 = _270 > 0.0;
    float _336 = fma(_320, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = _330 ? 0 : 1;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _348 = _294 > 0.0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _352 = _294 >= 0.0;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_256, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_346, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _368 = ~_342;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    int _374 = _372;
    if (!_334)
    {
        int _376 = ~_342;
        int _378 = _376 + 1;
        _374 = _378;
    }
    int _380 = _374;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _384 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _350);
    if (_208)
    {
        _286 = _310;
    }
    float _386 = _286;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _390 = _308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _392 = _360 ? 0 : 1;
    float _394 = _340 * _144;
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _388);
    float _398 = -_382;
    float _400 = fma(_390, 2.0, _398);
    float _402 = _386;
    if (!_208)
    {
        _402 = _200;
    }
    float _404 = _402;
    float _406 = _210 + _310;
    float _408 = _200 + _310;
    float _410 = _404;
    if (_208)
    {
        _410 = _310;
    }
    float _412 = _410;
    float _414 = _406 + (-1.0);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = ~_392;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _426 = _422;
    if (!_348)
    {
        int _428 = ~_392;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = _408 + (-1.0);
    float _436 = exp2(_394);
    float _438 = fma(_424, -2.0, _416);
    float _440 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _442 = !_228;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _448 = !_232;
    int _450 = _448 ? 0 : 1;
    float _452 = _310 * 2.0;
    float _454 = -_144;
    float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[81].x, _400);
    int _458 = abs(_444);
    float _460 = floor(_452);
    int _462 = abs(_450);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = in.m_59.x;
    float _470 = in.m_59.y;
    float _472 = in.m_59.z;
    bool _474 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(1.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _210 + (-0.5);
    float _486 = -_436;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _498 = _494 || _496;
    float _500 = 1.0 / _466;
    float _502 = float(_458);
    float _504 = _310 + (-0.5);
    float _506 = float(_462);
    float _508 = float(_380);
    float _510 = float(_432);
    float _512 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _384);
    float _514 = _502 * _508;
    float _516 = _498 ? _488 : 0.0;
    float _518 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _396);
    float _520 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _438);
    bool _522 = _460 > 0.0;
    float _524 = _506 * _510;
    float _526 = _456;
    if (_482)
    {
        float _528 = _516 * _500;
        _148 = _528;
    }
    float _530 = _148;
    float _532 = _514 * (-2.0);
    bool _534 = _460 >= 0.0;
    bool _536 = isnan(_460);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _524 * (-2.0);
    float _546 = fma(_532, _468, _468);
    int _548 = _542 ? 0 : 1;
    float _550 = fma(_544, _470, _470);
    float _552 = fma(_440, _532, _440);
    float _554 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[196].x, _546);
    bool _556 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _558 = isnan(_198);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = fma(_446, _544, _446);
    int _570 = ~_548;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_552, _530, _554);
    int _578 = _574;
    if (!_522)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _550);
    bool _588 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _590 = isnan(_198);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_566;
    float _602 = _600 + 1.0;
    bool _604 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_198);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_568, _530, _586);
    bool _618 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _620 = isnan(_198);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _598 * _602;
    float _632 = -_598;
    float _634 = _632 + 1.0;
    bool _636 = !_236;
    int _638 = _636 ? 0 : 1;
    float _640 = _576 * 0.15915493667125701904296875;
    float _642 = _628 * _634;
    int _644 = abs(_638);
    float _646 = -_628;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _650;
    float _654 = _614 * _648;
    float _656 = float(_584);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _658;
    float _662 = float(_644);
    float _664 = fma(_652, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _666 = _298 * _654;
    float _668 = _336 * _654;
    float _670 = _662 * _656;
    float _672 = _284 * _654;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _674;
    float _678 = in.m_61.x;
    float _680 = in.m_61.y;
    float _682 = in.m_61.z;
    float _684 = _670 * (-2.0);
    float _686 = _200 + (-0.5);
    float _688 = fma(_660, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _690 = fma(_676, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_332, _684, _332);
    float _694 = fma(_684, _472, _472);
    float _696 = -_614;
    float _698 = _696 + 1.0;
    float _700 = _616 * 0.15915493667125701904296875;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _694);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _668);
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _672);
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _666);
    float _716 = fma(_692, _530, _708);
    float _718 = fma(_366, _642, _710);
    float _720 = fma(_364, _642, _712);
    float _722 = fma(_362, _642, _714);
    float _724 = _716 * 0.15915493667125701904296875;
    float _726 = fma(_690, _630, _718);
    float _728 = fma(_664, _630, _720);
    float _730 = fma(_688, _630, _722);
    float _732 = _640 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].z, _726);
    float _738 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].y, _728);
    float _740 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].x, _730);
    float _742 = _736 * _682;
    float _744 = _738 * _680;
    float _746 = _740 * _678;
    float _748 = _640 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = in.m_50.x;
    float _754 = in.m_50.y;
    float _756 = in.m_50.z;
    float _758 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _704);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _764 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _706);
    float _768 = _760 * _758;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _762 * _764;
    float _778 = _766 * _774;
    float _780 = _700 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _724 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _734 * _772;
    float _790 = _750 * _772;
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _750 * _782;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _804 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _750 * _786;
    float _808 = _772 * _786;
    float _810 = _806 * _768;
    float _812 = fma(_798, _800, _788);
    float _814 = fma(_798, _788, _800);
    float _816 = _734 * _782;
    float _818 = _782 * _786;
    float _820 = _734 * _786;
    float _822 = -_768;
    float _824 = _798 * _822;
    float _826 = -_790;
    float _828 = fma(_798, _816, _826);
    float _830 = -_816;
    float _832 = fma(_798, _790, _830);
    float _834 = fma(_812, _776, _810);
    float _836 = _820 * _768;
    float _838 = fma(_818, _776, _824);
    float _840 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_828, _776, _836);
    float _846 = fma(_808, _778, _838);
    float _848 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _840);
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _854 = fma(_814, _778, _844);
    float _856 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _848);
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _852);
    float _862 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _860);
    float _870 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _872 = _804 + _866;
    float _874 = _864 + _868;
    float _876 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _870);
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _880 = _872 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _884 = _874 + _882;
    float _886 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _888 = _880 * _880;
    float _890 = _884 * _884;
    float _892 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _894 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _896 = _888 + _890;
    float _898 = floor(_892);
    float _900 = sqrt(_896);
    float _902 = -_898;
    float _904 = _892 + _902;
    bool _906 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _900 + _908;
    float _912 = 0.0;
    float _914 = _752;
    float _916 = _872;
    float _918 = _904;
    float _920 = _896;
    float _922 = _890;
    float _924 = _888;
    if (_906)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    if (_906)
    {
        float _930 = rsqrt(_896);
        _914 = _930;
    }
    float _932 = _914;
    float _934 = _928;
    if (_906)
    {
        float _936 = _910 * _928;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = _938;
    if (_906)
    {
        float _944 = _938 * 0.15915493667125701904296875;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _950 = _842;
    float _952 = _948;
    float _954 = _946;
    if (_906)
    {
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _948);
    float _964 = _886 + _962;
    float _966 = _962;
    float _968 = _964;
    if (!_906)
    {
        _966 = _874;
    }
    float _970 = _966;
    float _972 = _970;
    if (_906)
    {
        float _974 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _974;
    }
    float _976 = _952;
    float _978 = _976;
    if (_906)
    {
        float _980 = fma(_960, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = floor(_894);
    float _986 = _982;
    if (_906)
    {
        float _988 = _932 * _982;
        _986 = _988;
    }
    float _990 = _986;
    if (_906)
    {
        float _992 = fma(_880, _990, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _916 = _992;
    }
    float _994 = _916;
    if (_906)
    {
        float _996 = fma(_884, _990, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _996;
    }
    float _998 = _972;
    float _1000 = fma(_994, 6.2500002968590706586837768554688e-05, 0.5);
    float _1002 = fma(_998, 6.2500002968590706586837768554688e-05, 0.5);
    float _1004 = -_984;
    float _1006 = _894 + _1004;
    float2 _3779 = float2(_1000, _1002);
    float3 _1010 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3779, float2(0.0), isnan(_3779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3779, float2(0.0), isnan(_3779)), level(0.0)).xyz;
    float _1012 = _1010.x;
    float _1014 = _1010.y;
    float _1016 = _1010.z;
    float2 _3795 = float2(_904, _1006);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3795, float2(0.0), isnan(_3795)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3795, float2(0.0), isnan(_3795)), level(0.0)).x;
    float _1020 = in.m_65.x;
    float _1022 = in.m_65.y;
    float _1024 = in.m_65.z;
    bool _1026 = _704 != 0.0;
    bool _1028 = isnan(_704);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1038 = in.m_67.x;
    bool _1040 = _702 == 0.0;
    bool _1042 = !_1034;
    bool _1044 = _1040 && _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_57.w;
    bool _1052 = _706 == 0.0;
    bool _1054 = _1052 && _1044;
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1058 = _200 > 0.5;
    bool _1060 = _1058 && _1048;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_906)
    {
        float _1068 = _946 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _954 = _1070;
    }
    float _1072 = _954;
    float _1074 = _1020;
    int _1076 = as_type<int>(_1022);
    if (_1054)
    {
        _280 = _1022;
    }
    float _1078 = _280;
    float _1080 = _1078;
    if (!_1054)
    {
        float _1082 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1074 = _1082;
    }
    float _1084 = _1074;
    if (_1054)
    {
        _918 = _1024;
    }
    float _1086 = _918;
    float _1088 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1090 = 0.0;
    float _1092 = _1086;
    if (_1054)
    {
        _1090 = _1078;
    }
    float _1094 = _1090;
    int _1096 = 0;
    float _1098 = _1094;
    if (_1054)
    {
        float _1100 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1096 = as_type<int>(_1100);
    }
    int _1102 = _1096;
    int _1104 = _1102;
    if (!_1054)
    {
        _1080 = _1022;
    }
    float _1106 = _1080;
    if (_1054)
    {
        float _1108 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1076 = as_type<int>(_1108);
    }
    int _1110 = _1076;
    int _1112 = _1110;
    if (_1054)
    {
        _920 = _1086;
    }
    float _1114 = _920;
    float _1116 = _1038;
    float _1118 = _1114;
    if (_1048)
    {
        _1066 = _1038;
    }
    float _1120 = _1066;
    float _1122 = _1120;
    if (!_1054)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = as_type<int>(_1124);
    }
    int _1126 = _1104;
    if (!_1054)
    {
        _1092 = _1024;
    }
    float _1128 = _1092;
    float _1130 = in.m_67.y;
    if (_1060)
    {
        float _1132 = -_1120;
        float _1134 = _1132 + 1.0;
        _1122 = _1134;
    }
    float _1136 = _1122;
    bool _1138 = _1050 > 0.5;
    if (!_1054)
    {
        float _1140 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1112 = as_type<int>(_1140);
    }
    int _1142 = _1112;
    bool _1144 = !_1054;
    float _1146 = _1144 ? as_type<float>(_1126) : _1106;
    if (_1048)
    {
        _1116 = _1136;
    }
    float _1148 = _1116;
    bool _1150 = !_1054;
    float _1152 = _1150 ? as_type<float>(_1142) : _1128;
    float _1154 = _1146 * _1146;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = fma(_1152, _1152, _1154);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1054)
    {
        _1098 = as_type<float>(_1126);
    }
    float _1164 = _1098;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = rsqrt(_1158);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1054)
    {
        _1118 = as_type<float>(_1142);
    }
    float _1176 = _1118;
    float _1178 = -_1130;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_1088, _1148, -0.5);
    out.m_71.x = _1170;
    out.m_71.y = _1172;
    out.m_71.z = _1174;
    out.m_71.w = _1166;
    float _1184 = _1130;
    if (_1064)
    {
        float _1186 = _1138 ? _1180 : _1130;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1192 = -_1164;
    float _1194 = _798 * _1192;
    float _1196 = fma(_512, _1182, _456);
    float _1198 = fma(_1190, _1188, -0.5);
    float _1200 = _1146 * _1168;
    float _1202 = _1152 * _1168;
    float _1204 = _812 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1206 = fma(_818, _1084, _1194);
    float _1208 = -_1200;
    float _1210 = _808 * _1208;
    float _1212 = -_1200;
    float _1214 = _832 * _1212;
    float _1216 = -_1200;
    float _1218 = _814 * _1216;
    float _1220 = _812 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1222 = -_798;
    float _1224 = fma(_1222, _1202, _1210);
    float _1226 = _820 * _1164;
    float _1228 = fma(_806, _1202, _1214);
    float _1230 = _806 * _1164;
    float _1232 = fma(_820, _1202, _1218);
    float _1234 = fma(_828, _1084, _1226);
    float _1236 = _1202;
    if (_906)
    {
        float _1238 = _1072 + (-1.0);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = fma(_812, _1084, _1230);
    float _1244 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1204);
    float _1246 = fma(_814, _1176, _1234);
    float _1248 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1250 = _1240;
    float _1252 = _1248;
    if (_906)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _1254;
    }
    float _1256 = _526;
    if (_906)
    {
        float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1260 = _998 + _1258;
        _1250 = _1260;
    }
    float _1262 = _1250;
    float _1264 = fma(_832, _1176, _1242);
    float _1266 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1248);
    if (_906)
    {
        float _1268 = fma(_964, _1072, _1256);
        _968 = _1268;
    }
    float _1270 = _968;
    if (_906)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _994 + _1272;
        _1252 = _1274;
    }
    float _1276 = _1252;
    if (_906)
    {
        float _1278 = _1262 * _1262;
        _922 = _1278;
    }
    float _1280 = _922;
    float _1282 = -_520;
    float _1284 = fma(_518, _1198, _1282);
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1288 = _1270 + _1286;
    if (_906)
    {
        float _1290 = _1276 * _1276;
        _924 = _1290;
    }
    float _1292 = _924;
    float _1294 = fma(_808, _1176, _1206);
    float _1296 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1300 = fma(_1288, _1288, _1292);
    float _1302 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1304 = _812 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1306 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = _1300 + _1280;
    float _1310 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1220);
    float _1314 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1296);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1298);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1302);
    float _1320 = sqrt(_1308);
    float _1322 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1304);
    float _1324 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    float _1326 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1328 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1330 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1312);
    float _1332 = _1196 + 0.5;
    float _1334 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1336 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1314);
    float _1338 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1340 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1318);
    float _1342 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1322);
    float _1344 = _1284 + 0.5;
    float _1346 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1348 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1326);
    out.m_73.x = _1328;
    out.m_73.y = _1330;
    out.m_73.z = _1342;
    bool _1350 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1320);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_75.z = _1332;
    out.m_75.w = _1344;
    out.m_77.x = _1334;
    out.m_77.y = _1336;
    out.m_77.z = _1346;
    out.m_79.x = _1338;
    out.m_79.y = _1340;
    out.m_79.z = _1348;
    float _1360 = _1316;
    float _1362 = _1344;
    float _1364 = _1336;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1366 = _1360;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    bool _1368 = !_1358;
    float _1370 = _1366;
    float _1372 = _1014;
    float _1374 = _1016;
    if (!_1368)
    {
        bool _1376 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1378 = isnan(_1320);
        bool _1380 = _1376 || _1378;
        bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1384 = _1380 || _1382;
        if (!_1384)
        {
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = _1320 + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1392 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1390;
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1398 = 1.0 / _1392;
            float _1400 = _1388 * _1398;
            float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1402;
            _1404 = true;
        }
        else
        {
            bool _1406 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1408 = isnan(_1320);
            bool _1410 = _1406 || _1408;
            bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1414 = _1410 || _1412;
            if (!_1414)
            {
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1320 + _1416;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1428 = 1.0 / _1422;
                float _1430 = _1418 * _1428;
                float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1432;
                _1404 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1404 = false;
    float _1434 = _1370;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _994 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _998 + _1440;
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1270 + _1454;
    float _1458 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = fma(_1456, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = _1434;
    float _1466 = _1456;
    if (_1452)
    {
        _1464 = _1458;
    }
    float _1468 = _1464;
    float _1470 = _1468;
    if (_1452)
    {
        _1466 = _1462;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (_1452)
    {
        _1362 = _1460;
    }
    float _1476 = _1362;
    float _1478 = _1476;
    if (!_1452)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _886 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _804 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = _1482 * _1482;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _864 + _1492;
        float _1496 = fma(_1486, _1486, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_804;
        float _1512 = _1510 + _1458;
        float _1514 = _1504 * _1508;
        float _1516 = -_886;
        float _1518 = _1516 + _1462;
        float _1520 = -_864;
        float _1522 = _1520 + _1460;
        float _1524 = fma(_1512, _1514, _804);
        float _1526 = fma(_1518, _1514, _886);
        float _1528 = fma(_1522, _1514, _864);
        _1474 = _1526;
        _1470 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1474;
    float _1532 = _1470;
    float _1534 = _1478;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1538 = _1530 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1532 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1534 + _1544;
    float _1548 = _1538 * _1538;
    float _1550 = fma(_1542, _1542, _1548);
    float _1552 = fma(_1546, _1546, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = sqrt(_1552);
    float _1558 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1560 = _1542 * _1558;
    float _1562 = _1546 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 * _1562;
    float _1568 = _1564 + _1566;
    float _1570 = sqrt(_1568);
    bool _1572 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1570 + _1574;
    float _1578 = _1554;
    float _1580 = _1576;
    float _1582 = _1538;
    float _1584 = _1558;
    float _1586 = _1560;
    if (_1572)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (_1572)
    {
        float _1592 = rsqrt(_1568);
        _1372 = _1592;
    }
    float _1594 = _1372;
    float _1596 = _1594;
    if (_1572)
    {
        float _1598 = _1576 * _1590;
        _1580 = _1598;
    }
    float _1600 = _1580;
    if (_1572)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1364 = _1602;
    }
    float _1604 = _1364;
    float _1606 = _1590;
    if (_1572)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _1546;
    float _1620 = _1616;
    if (_1572)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1558;
    float _1630 = -_1616;
    float _1632 = fma(_1538, _1628, _1630);
    if (!_1572)
    {
        _1582 = _1562;
    }
    float _1634 = _1582;
    float _1636 = _1634;
    if (_1572)
    {
        float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1638;
    }
    float _1640 = _1620;
    float _1642 = _1612;
    float _1644 = _1640;
    if (_1572)
    {
        float _1646 = fma(_1612, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1374 = _1646;
    }
    float _1648 = _1374;
    if (!_1572)
    {
        _1642 = _1632;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    float _1654 = _1626;
    if (_1572)
    {
        float _1656 = _1626 + (-1.0);
        _1644 = _1656;
    }
    float _1658 = _1644;
    float _1660 = _1658;
    if (_1572)
    {
        float _1662 = _1594 * _1648;
        _1584 = _1662;
    }
    float _1664 = _1584;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1668 = fma(_1556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1666);
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    if (_1572)
    {
        float _1672 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1596 = _1672;
    }
    float _1674 = _1596;
    if (_1572)
    {
        float _1676 = _1560 * _1664;
        _1586 = _1676;
    }
    float _1678 = _1586;
    if (!_1572)
    {
        _1660 = _1564;
    }
    float _1680 = _1660;
    float _1682 = _1680;
    if (_1572)
    {
        float _1684 = _1562 * _1664;
        _1636 = _1684;
    }
    float _1686 = _1636;
    if (_1572)
    {
        float _1688 = fma(_1632, _1626, _1674);
        _1652 = _1688;
    }
    float _1690 = _1652;
    if (_1572)
    {
        float _1692 = _1678 * _1678;
        _1682 = _1692;
    }
    float _1694 = _1682;
    if (!_1572)
    {
        _1654 = _1566;
    }
    float _1696 = _1654;
    float _1698 = _1696;
    if (_1572)
    {
        float _1700 = _1686 * _1686;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = -_1670;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1690, _1694);
    float _1710 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = _1708 + _1702;
    float _1716 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = rsqrt(_1714);
    float _1724 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1730 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1732 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1736 = abs(_1706);
    float _1738 = log2(_1736);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1746 = -_1740;
    float _1748 = fma(_1746, _1728, 1.0);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1754 = _1722 * _1678;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = _1722 * _1690;
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1722 * _1686;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1764;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1748);
    float _1780 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = -_1768;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = exp2(_1770);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1800 = _1762 + 1.0;
    float _1802 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1808 = 1.0 / _1786;
    float _1810 = _1778 * 0.693147182464599609375;
    float _1812 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1792);
    float _1816 = -_1762;
    float _1818 = fma(_1796, _1800, _1816);
    float _1820 = fma(_1794, _1802, -0.212114393711090087890625);
    float _1822 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1806);
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1804);
    float _1826 = fma(_1818, 0.5, 0.5);
    float _1828 = fma(_1794, _1820, 1.570728778839111328125);
    float _1830 = _1822 * _1808;
    float _1832 = _1824 * _1808;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1814 * 0.636619746685028076171875;
    float3 _5230 = float3(_1834, _1836, _1812);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5230, float3(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5230, float3(0.0), isnan(_5230)), level(0.0)).x;
    float3 _5241 = float3(_1834, _1836, _1812);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5241, float3(0.0), isnan(_5241)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5241, float3(0.0), isnan(_5241)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1828;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5262 = float2(_1855, _1826);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1867 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1018;
    float _1871 = _1869 + 1.0;
    float _1873 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1865);
    float _1875 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    bool _1877 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1879 = isnan(_1556);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1885 = _1881 || _1883;
    float _1887 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1889 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1891 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1875);
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1889);
    float _1897 = 1.0 / _1893;
    float _1899 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1893;
    float _1905 = _1903 * _1897;
    float _1907 = _1905 * 0.5;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1917 = _1913 * _1915;
    float _1919 = abs(_1917);
    float _1921 = log2(_1919);
    bool _1923 = _1917 <= 8000.0;
    bool _1925 = isnan(_1917);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(8000.0);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1937 = exp2(_1935);
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1941, -2.0, 3.0);
    float _1945 = _1941 * _1941;
    float _1947 = _1945 * _1943;
    float _1949 = in.m_83.x;
    float _1951 = -_1947;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1947);
    float _1957 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1933 * _1955;
    float _1961 = exp2(_1957);
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1965 = _1871 * _1963;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1975 = _1971 * _1949;
    float _1977 = _1973 + _1786;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1786;
    float _1979 = -_1961;
    float _1981 = _1979 + 1.0;
    float _1983 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1977 * 0.5;
    float _1987 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1983;
    out.m_87.z = _1985;
    out.m_87.w = _1786;
    float _1989 = _1786;
    float _1991 = _1973;
    float _1993 = _1824;
    float _1995 = _1822;
    if (!_1885)
    {
        _1989 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1997 = _1989;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1885)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2003 = _1991;
    float _2005 = _2003;
    float _2007 = _2003;
    if (!_1885)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2009 = _1993;
    float _2011 = _2009;
    float _2013 = _2009;
    if (!_1885)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2015 = _1995;
    float _2017 = _1987 * _1840;
    float _2019 = -_1987;
    float _2021 = _2019 + 1.0;
    float _2023 = _1851 * _2017;
    float _2025 = _1863 * _2017;
    float _2027 = fma(_1859, _2023, _1845);
    float _2029 = fma(_1861, _2023, _1847);
    float _2031 = _1851 * _2021;
    float _2033 = fma(_1851, _2025, _1849);
    float _2035 = _2023;
    float _2037 = _2021;
    float _2039 = _2015;
    float _2041 = _2015;
    if (!_1885)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2035;
    float _2045 = _2043;
    float _2047 = _2043;
    if (!_1885)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2049 = _2037;
    out.m_89.x = _2027;
    out.m_89.y = _2029;
    out.m_89.z = _2033;
    out.m_89.w = _2031;
    bool _2051 = !_1885;
    float _2053 = _2049;
    float _2055 = _2049;
    if (!_2051)
    {
        bool _2057 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2059 = isnan(_1556);
        bool _2061 = _2057 || _2059;
        bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2065 = _2061 || _2063;
        if (!_2065)
        {
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = _1556 + _2067;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2073 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2071;
            float _2075 = 1.0 / _2073;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2097 = _2069 * _2075;
            float _2099 = precise::clamp(_2097, 0.0, 1.0);
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2105 = fma(_2099, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2107 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2099, _2083, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2111 = fma(_2099, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2113 = fma(_2099, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2115 = fma(_2099, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2107;
            _2013 = _2113;
            _2047 = _2105;
            _2007 = _2111;
            _2001 = _2109;
            _2041 = _2115;
            _2117 = true;
        }
        else
        {
            bool _2119 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2121 = isnan(_1556);
            bool _2123 = _2119 || _2121;
            bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2127 = _2123 || _2125;
            if (!_2127)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2129 = _2045;
            _2047 = _2129;
            if (!_2127)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2131 = _2053;
            _2055 = _2131;
            if (!_2127)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2133 = _1999;
            _2001 = _2133;
            if (!_2127)
            {
                _2005 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2135 = _2005;
            _2007 = _2135;
            if (!_2127)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2137 = _2011;
            _2013 = _2137;
            if (!_2127)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2139 = _2039;
            bool _2141 = !_2127;
            _2041 = _2139;
            if (!_2141)
            {
                bool _2143 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2145 = isnan(_1556);
                bool _2147 = _2143 || _2145;
                bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2151 = _2147 || _2149;
                if (!_2151)
                {
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = _1556 + _2153;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2157;
                    float _2161 = 1.0 / _2159;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2183 = _2155 * _2161;
                    float _2185 = precise::clamp(_2183, 0.0, 1.0);
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2191 = fma(_2185, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2193 = fma(_2185, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2185, _2169, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2197 = fma(_2185, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2199 = fma(_2185, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2201 = fma(_2185, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2193;
                    _2013 = _2199;
                    _2047 = _2191;
                    _2007 = _2197;
                    _2001 = _2195;
                    _2041 = _2201;
                    _2117 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2007 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2117 = false;
    float _2203 = _2055;
    float _2205 = _2013;
    float _2207 = _2047;
    float _2209 = _2007;
    float _2211 = _2001;
    float _2213 = _2041;
    float _2215 = fma(_1340, -0.5, 0.5);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = -_2203;
    float _2221 = _2219 + _2205;
    float _2223 = -_2207;
    float _2225 = _2223 + _2209;
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    bool _2231 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2233 = fma(_2217, _2221, _2203);
    float _2235 = fma(_2217, _2225, _2207);
    float _2237 = fma(_2217, _2229, _2211);
    float _2239 = _2233 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2241 = fma(_2235, 0.298911988735198974609375, _2239);
    float _2243 = fma(_2237, 0.114477999508380889892578125, _2241);
    out.m_91.x = 0.0;
    float _2245 = -_2243;
    float _2247 = _2235 + _2245;
    float _2249 = -_2243;
    float _2251 = _2233 + _2249;
    float _2253 = -_2243;
    float _2255 = _2237 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_85.w = _2257;
    out.m_93.x = _2259;
    out.m_93.y = _2261;
    out.m_93.z = _2263;
    if (!_2231)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2265 = -_1530;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2269 = -_1532;
    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2273 = -_1534;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = sqrt(_2281);
    float _2285 = rsqrt(_2281);
    float _2287 = -_2283;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = _2271 * _2285;
    float _2297 = _2267 * _2285;
    float _2299 = abs(_2293);
    float _2301 = log2(_2299);
    float _2303 = _2275 * _2285;
    float _2305 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2307 = _1340 * _2297;
    float _2309 = -_2297;
    float _2311 = -_2305;
    float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
    float _2315 = fma(_1338, _2295, _2307);
    float _2317 = -_2303;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
    float _2321 = fma(_1348, _2303, _2315);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2327 = _2319 + _2325;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = exp2(_2329);
    float _2337 = _2335 * _2333;
    float _2339 = _2323 * _2337;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2345 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2341;
    out.m_91.y = _2343;
    out.m_91.z = _2345;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2117 = false;
    bool _1404 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_50.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_53.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2401 = as_type<float>(_126);
        out.gl_Position.z = _2401;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_55.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_166);
        out.gl_Position.z = _2471;
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
        float _172 = in.m_57.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_57.z;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _198 + _202;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_57.x;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _236 = _234 != 0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _198 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = 0.0;
    if (!_208)
    {
        float _248 = in.m_57.y;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = 1.0 / _220;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = _200 * 2.0;
    float _260 = 1.0 / _224;
    float _262 = _204 * _216;
    float _264 = _210 * 2.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _198 + _266;
    float _270 = floor(_258);
    float _272 = _268 * _252;
    float _274 = _210 + _200;
    float _276 = _268;
    float _278 = _216;
    float _280 = _200;
    if (!_208)
    {
        _276 = _200;
    }
    float _282 = _276;
    float _284 = fma(_244, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _282;
    if (!_208)
    {
        _278 = _250;
    }
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = floor(_264);
    float _296 = _240 * _260;
    float _298 = fma(_292, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = _288;
    float _302 = _250;
    if (_208)
    {
        float _304 = in.m_57.x;
        float _306 = in.m_57.y;
        _300 = _304;
        _302 = _306;
    }
    float _308 = _300;
    float _310 = _302;
    float _312 = _274 + (-1.0);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _270 >= 0.0;
    bool _324 = isnan(_270);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _334 = _270 > 0.0;
    float _336 = fma(_320, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = _330 ? 0 : 1;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _348 = _294 > 0.0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _352 = _294 >= 0.0;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_256, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_346, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _368 = ~_342;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    int _374 = _372;
    if (!_334)
    {
        int _376 = ~_342;
        int _378 = _376 + 1;
        _374 = _378;
    }
    int _380 = _374;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _384 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _350);
    if (_208)
    {
        _286 = _310;
    }
    float _386 = _286;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _390 = _308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _392 = _360 ? 0 : 1;
    float _394 = _340 * _144;
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _388);
    float _398 = -_382;
    float _400 = fma(_390, 2.0, _398);
    float _402 = _386;
    if (!_208)
    {
        _402 = _200;
    }
    float _404 = _402;
    float _406 = _210 + _310;
    float _408 = _200 + _310;
    float _410 = _404;
    if (_208)
    {
        _410 = _310;
    }
    float _412 = _410;
    float _414 = _406 + (-1.0);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = ~_392;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _426 = _422;
    if (!_348)
    {
        int _428 = ~_392;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = _408 + (-1.0);
    float _436 = exp2(_394);
    float _438 = fma(_424, -2.0, _416);
    float _440 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _442 = !_228;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _448 = !_232;
    int _450 = _448 ? 0 : 1;
    float _452 = _310 * 2.0;
    float _454 = -_144;
    float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[81].x, _400);
    int _458 = abs(_444);
    float _460 = floor(_452);
    int _462 = abs(_450);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = in.m_59.x;
    float _470 = in.m_59.y;
    float _472 = in.m_59.z;
    bool _474 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(1.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _210 + (-0.5);
    float _486 = -_436;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _498 = _494 || _496;
    float _500 = 1.0 / _466;
    float _502 = float(_458);
    float _504 = _310 + (-0.5);
    float _506 = float(_462);
    float _508 = float(_380);
    float _510 = float(_432);
    float _512 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _384);
    float _514 = _502 * _508;
    float _516 = _498 ? _488 : 0.0;
    float _518 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _396);
    float _520 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _438);
    bool _522 = _460 > 0.0;
    float _524 = _506 * _510;
    float _526 = _456;
    if (_482)
    {
        float _528 = _516 * _500;
        _148 = _528;
    }
    float _530 = _148;
    float _532 = _514 * (-2.0);
    bool _534 = _460 >= 0.0;
    bool _536 = isnan(_460);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _524 * (-2.0);
    float _546 = fma(_532, _468, _468);
    int _548 = _542 ? 0 : 1;
    float _550 = fma(_544, _470, _470);
    float _552 = fma(_440, _532, _440);
    float _554 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[196].x, _546);
    bool _556 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _558 = isnan(_198);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = fma(_446, _544, _446);
    int _570 = ~_548;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_552, _530, _554);
    int _578 = _574;
    if (!_522)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _550);
    bool _588 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _590 = isnan(_198);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_566;
    float _602 = _600 + 1.0;
    bool _604 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_198);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_568, _530, _586);
    bool _618 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _620 = isnan(_198);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _598 * _602;
    float _632 = -_598;
    float _634 = _632 + 1.0;
    bool _636 = !_236;
    int _638 = _636 ? 0 : 1;
    float _640 = _576 * 0.15915493667125701904296875;
    float _642 = _628 * _634;
    int _644 = abs(_638);
    float _646 = -_628;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _650;
    float _654 = _614 * _648;
    float _656 = float(_584);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _658;
    float _662 = float(_644);
    float _664 = fma(_652, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _666 = _298 * _654;
    float _668 = _336 * _654;
    float _670 = _662 * _656;
    float _672 = _284 * _654;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _674;
    float _678 = in.m_61.x;
    float _680 = in.m_61.y;
    float _682 = in.m_61.z;
    float _684 = _670 * (-2.0);
    float _686 = _200 + (-0.5);
    float _688 = fma(_660, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _690 = fma(_676, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_332, _684, _332);
    float _694 = fma(_684, _472, _472);
    float _696 = -_614;
    float _698 = _696 + 1.0;
    float _700 = _616 * 0.15915493667125701904296875;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _694);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _668);
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _672);
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _666);
    float _716 = fma(_692, _530, _708);
    float _718 = fma(_366, _642, _710);
    float _720 = fma(_364, _642, _712);
    float _722 = fma(_362, _642, _714);
    float _724 = _716 * 0.15915493667125701904296875;
    float _726 = fma(_690, _630, _718);
    float _728 = fma(_664, _630, _720);
    float _730 = fma(_688, _630, _722);
    float _732 = _640 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].z, _726);
    float _738 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].y, _728);
    float _740 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].x, _730);
    float _742 = _736 * _682;
    float _744 = _738 * _680;
    float _746 = _740 * _678;
    float _748 = _640 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = in.m_50.x;
    float _754 = in.m_50.y;
    float _756 = in.m_50.z;
    float _758 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _704);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _764 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _706);
    float _768 = _760 * _758;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _762 * _764;
    float _778 = _766 * _774;
    float _780 = _700 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _724 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _734 * _772;
    float _790 = _750 * _772;
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _750 * _782;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _804 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _750 * _786;
    float _808 = _772 * _786;
    float _810 = _806 * _768;
    float _812 = fma(_798, _800, _788);
    float _814 = fma(_798, _788, _800);
    float _816 = _734 * _782;
    float _818 = _782 * _786;
    float _820 = _734 * _786;
    float _822 = -_768;
    float _824 = _798 * _822;
    float _826 = -_790;
    float _828 = fma(_798, _816, _826);
    float _830 = -_816;
    float _832 = fma(_798, _790, _830);
    float _834 = fma(_812, _776, _810);
    float _836 = _820 * _768;
    float _838 = fma(_818, _776, _824);
    float _840 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_828, _776, _836);
    float _846 = fma(_808, _778, _838);
    float _848 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _840);
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _854 = fma(_814, _778, _844);
    float _856 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _848);
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _852);
    float _862 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _860);
    float _870 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _872 = _804 + _866;
    float _874 = _864 + _868;
    float _876 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _870);
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _880 = _872 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _884 = _874 + _882;
    float _886 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _888 = _880 * _880;
    float _890 = _884 * _884;
    float _892 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _894 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _896 = _888 + _890;
    float _898 = floor(_892);
    float _900 = sqrt(_896);
    float _902 = -_898;
    float _904 = _892 + _902;
    bool _906 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _900 + _908;
    float _912 = 0.0;
    float _914 = _752;
    float _916 = _872;
    float _918 = _904;
    float _920 = _896;
    float _922 = _890;
    float _924 = _888;
    if (_906)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    if (_906)
    {
        float _930 = rsqrt(_896);
        _914 = _930;
    }
    float _932 = _914;
    float _934 = _928;
    if (_906)
    {
        float _936 = _910 * _928;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = _938;
    if (_906)
    {
        float _944 = _938 * 0.15915493667125701904296875;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _950 = _842;
    float _952 = _948;
    float _954 = _946;
    if (_906)
    {
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _948);
    float _964 = _886 + _962;
    float _966 = _962;
    float _968 = _964;
    if (!_906)
    {
        _966 = _874;
    }
    float _970 = _966;
    float _972 = _970;
    if (_906)
    {
        float _974 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _974;
    }
    float _976 = _952;
    float _978 = _976;
    if (_906)
    {
        float _980 = fma(_960, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = floor(_894);
    float _986 = _982;
    if (_906)
    {
        float _988 = _932 * _982;
        _986 = _988;
    }
    float _990 = _986;
    if (_906)
    {
        float _992 = fma(_880, _990, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _916 = _992;
    }
    float _994 = _916;
    if (_906)
    {
        float _996 = fma(_884, _990, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _996;
    }
    float _998 = _972;
    float _1000 = fma(_994, 6.2500002968590706586837768554688e-05, 0.5);
    float _1002 = fma(_998, 6.2500002968590706586837768554688e-05, 0.5);
    float _1004 = -_984;
    float _1006 = _894 + _1004;
    float2 _3779 = float2(_1000, _1002);
    float3 _1010 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3779, float2(0.0), isnan(_3779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3779, float2(0.0), isnan(_3779)), level(0.0)).xyz;
    float _1012 = _1010.x;
    float _1014 = _1010.y;
    float _1016 = _1010.z;
    float2 _3795 = float2(_904, _1006);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3795, float2(0.0), isnan(_3795)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3795, float2(0.0), isnan(_3795)), level(0.0)).x;
    float _1020 = in.m_65.x;
    float _1022 = in.m_65.y;
    float _1024 = in.m_65.z;
    bool _1026 = _704 != 0.0;
    bool _1028 = isnan(_704);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1038 = in.m_67.x;
    bool _1040 = _702 == 0.0;
    bool _1042 = !_1034;
    bool _1044 = _1040 && _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_57.w;
    bool _1052 = _706 == 0.0;
    bool _1054 = _1052 && _1044;
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1058 = _200 > 0.5;
    bool _1060 = _1058 && _1048;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_906)
    {
        float _1068 = _946 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _954 = _1070;
    }
    float _1072 = _954;
    float _1074 = _1020;
    int _1076 = as_type<int>(_1022);
    if (_1054)
    {
        _280 = _1022;
    }
    float _1078 = _280;
    float _1080 = _1078;
    if (!_1054)
    {
        float _1082 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1074 = _1082;
    }
    float _1084 = _1074;
    if (_1054)
    {
        _918 = _1024;
    }
    float _1086 = _918;
    float _1088 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1090 = 0.0;
    float _1092 = _1086;
    if (_1054)
    {
        _1090 = _1078;
    }
    float _1094 = _1090;
    int _1096 = 0;
    float _1098 = _1094;
    if (_1054)
    {
        float _1100 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1096 = as_type<int>(_1100);
    }
    int _1102 = _1096;
    int _1104 = _1102;
    if (!_1054)
    {
        _1080 = _1022;
    }
    float _1106 = _1080;
    if (_1054)
    {
        float _1108 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1076 = as_type<int>(_1108);
    }
    int _1110 = _1076;
    int _1112 = _1110;
    if (_1054)
    {
        _920 = _1086;
    }
    float _1114 = _920;
    float _1116 = _1038;
    float _1118 = _1114;
    if (_1048)
    {
        _1066 = _1038;
    }
    float _1120 = _1066;
    float _1122 = _1120;
    if (!_1054)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = as_type<int>(_1124);
    }
    int _1126 = _1104;
    if (!_1054)
    {
        _1092 = _1024;
    }
    float _1128 = _1092;
    float _1130 = in.m_67.y;
    if (_1060)
    {
        float _1132 = -_1120;
        float _1134 = _1132 + 1.0;
        _1122 = _1134;
    }
    float _1136 = _1122;
    bool _1138 = _1050 > 0.5;
    if (!_1054)
    {
        float _1140 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1112 = as_type<int>(_1140);
    }
    int _1142 = _1112;
    bool _1144 = !_1054;
    float _1146 = _1144 ? as_type<float>(_1126) : _1106;
    if (_1048)
    {
        _1116 = _1136;
    }
    float _1148 = _1116;
    bool _1150 = !_1054;
    float _1152 = _1150 ? as_type<float>(_1142) : _1128;
    float _1154 = _1146 * _1146;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = fma(_1152, _1152, _1154);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1054)
    {
        _1098 = as_type<float>(_1126);
    }
    float _1164 = _1098;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = rsqrt(_1158);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1054)
    {
        _1118 = as_type<float>(_1142);
    }
    float _1176 = _1118;
    float _1178 = -_1130;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_1088, _1148, -0.5);
    out.m_71.x = _1170;
    out.m_71.y = _1172;
    out.m_71.z = _1174;
    out.m_71.w = _1166;
    float _1184 = _1130;
    if (_1064)
    {
        float _1186 = _1138 ? _1180 : _1130;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1192 = -_1164;
    float _1194 = _798 * _1192;
    float _1196 = fma(_512, _1182, _456);
    float _1198 = fma(_1190, _1188, -0.5);
    float _1200 = _1146 * _1168;
    float _1202 = _1152 * _1168;
    float _1204 = _812 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1206 = fma(_818, _1084, _1194);
    float _1208 = -_1200;
    float _1210 = _808 * _1208;
    float _1212 = -_1200;
    float _1214 = _832 * _1212;
    float _1216 = -_1200;
    float _1218 = _814 * _1216;
    float _1220 = _812 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1222 = -_798;
    float _1224 = fma(_1222, _1202, _1210);
    float _1226 = _820 * _1164;
    float _1228 = fma(_806, _1202, _1214);
    float _1230 = _806 * _1164;
    float _1232 = fma(_820, _1202, _1218);
    float _1234 = fma(_828, _1084, _1226);
    float _1236 = _1202;
    if (_906)
    {
        float _1238 = _1072 + (-1.0);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = fma(_812, _1084, _1230);
    float _1244 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1204);
    float _1246 = fma(_814, _1176, _1234);
    float _1248 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1250 = _1240;
    float _1252 = _1248;
    if (_906)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _1254;
    }
    float _1256 = _526;
    if (_906)
    {
        float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1260 = _998 + _1258;
        _1250 = _1260;
    }
    float _1262 = _1250;
    float _1264 = fma(_832, _1176, _1242);
    float _1266 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1248);
    if (_906)
    {
        float _1268 = fma(_964, _1072, _1256);
        _968 = _1268;
    }
    float _1270 = _968;
    if (_906)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _994 + _1272;
        _1252 = _1274;
    }
    float _1276 = _1252;
    if (_906)
    {
        float _1278 = _1262 * _1262;
        _922 = _1278;
    }
    float _1280 = _922;
    float _1282 = -_520;
    float _1284 = fma(_518, _1198, _1282);
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1288 = _1270 + _1286;
    if (_906)
    {
        float _1290 = _1276 * _1276;
        _924 = _1290;
    }
    float _1292 = _924;
    float _1294 = fma(_808, _1176, _1206);
    float _1296 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1300 = fma(_1288, _1288, _1292);
    float _1302 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1304 = _812 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1306 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = _1300 + _1280;
    float _1310 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1220);
    float _1314 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1296);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1298);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1302);
    float _1320 = sqrt(_1308);
    float _1322 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1304);
    float _1324 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    float _1326 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1328 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1330 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1312);
    float _1332 = _1196 + 0.5;
    float _1334 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1336 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1314);
    float _1338 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1340 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1318);
    float _1342 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1322);
    float _1344 = _1284 + 0.5;
    float _1346 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1348 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1326);
    out.m_73.x = _1328;
    out.m_73.y = _1330;
    out.m_73.z = _1342;
    bool _1350 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1320);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_75.z = _1332;
    out.m_75.w = _1344;
    out.m_77.x = _1334;
    out.m_77.y = _1336;
    out.m_77.z = _1346;
    out.m_79.x = _1338;
    out.m_79.y = _1340;
    out.m_79.z = _1348;
    float _1360 = _1316;
    float _1362 = _1344;
    float _1364 = _1336;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1366 = _1360;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    bool _1368 = !_1358;
    float _1370 = _1366;
    float _1372 = _1014;
    float _1374 = _1016;
    if (!_1368)
    {
        bool _1376 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1378 = isnan(_1320);
        bool _1380 = _1376 || _1378;
        bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1384 = _1380 || _1382;
        if (!_1384)
        {
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = _1320 + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1392 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1390;
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1398 = 1.0 / _1392;
            float _1400 = _1388 * _1398;
            float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1402;
            _1404 = true;
        }
        else
        {
            bool _1406 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1408 = isnan(_1320);
            bool _1410 = _1406 || _1408;
            bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1414 = _1410 || _1412;
            if (!_1414)
            {
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1320 + _1416;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1428 = 1.0 / _1422;
                float _1430 = _1418 * _1428;
                float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1432;
                _1404 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1404 = false;
    float _1434 = _1370;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _994 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _998 + _1440;
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1270 + _1454;
    float _1458 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = fma(_1456, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = _1434;
    float _1466 = _1456;
    if (_1452)
    {
        _1464 = _1458;
    }
    float _1468 = _1464;
    float _1470 = _1468;
    if (_1452)
    {
        _1466 = _1462;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (_1452)
    {
        _1362 = _1460;
    }
    float _1476 = _1362;
    float _1478 = _1476;
    if (!_1452)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _886 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _804 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = _1482 * _1482;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _864 + _1492;
        float _1496 = fma(_1486, _1486, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_804;
        float _1512 = _1510 + _1458;
        float _1514 = _1504 * _1508;
        float _1516 = -_886;
        float _1518 = _1516 + _1462;
        float _1520 = -_864;
        float _1522 = _1520 + _1460;
        float _1524 = fma(_1512, _1514, _804);
        float _1526 = fma(_1518, _1514, _886);
        float _1528 = fma(_1522, _1514, _864);
        _1474 = _1526;
        _1470 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1474;
    float _1532 = _1470;
    float _1534 = _1478;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1538 = _1530 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1532 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1534 + _1544;
    float _1548 = _1538 * _1538;
    float _1550 = fma(_1542, _1542, _1548);
    float _1552 = fma(_1546, _1546, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = sqrt(_1552);
    float _1558 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1560 = _1542 * _1558;
    float _1562 = _1546 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 * _1562;
    float _1568 = _1564 + _1566;
    float _1570 = sqrt(_1568);
    bool _1572 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1570 + _1574;
    float _1578 = _1554;
    float _1580 = _1576;
    float _1582 = _1538;
    float _1584 = _1558;
    float _1586 = _1560;
    if (_1572)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (_1572)
    {
        float _1592 = rsqrt(_1568);
        _1372 = _1592;
    }
    float _1594 = _1372;
    float _1596 = _1594;
    if (_1572)
    {
        float _1598 = _1576 * _1590;
        _1580 = _1598;
    }
    float _1600 = _1580;
    if (_1572)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1364 = _1602;
    }
    float _1604 = _1364;
    float _1606 = _1590;
    if (_1572)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _1546;
    float _1620 = _1616;
    if (_1572)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1558;
    float _1630 = -_1616;
    float _1632 = fma(_1538, _1628, _1630);
    if (!_1572)
    {
        _1582 = _1562;
    }
    float _1634 = _1582;
    float _1636 = _1634;
    if (_1572)
    {
        float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1638;
    }
    float _1640 = _1620;
    float _1642 = _1612;
    float _1644 = _1640;
    if (_1572)
    {
        float _1646 = fma(_1612, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1374 = _1646;
    }
    float _1648 = _1374;
    if (!_1572)
    {
        _1642 = _1632;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    float _1654 = _1626;
    if (_1572)
    {
        float _1656 = _1626 + (-1.0);
        _1644 = _1656;
    }
    float _1658 = _1644;
    float _1660 = _1658;
    if (_1572)
    {
        float _1662 = _1594 * _1648;
        _1584 = _1662;
    }
    float _1664 = _1584;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1668 = fma(_1556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1666);
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    if (_1572)
    {
        float _1672 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1596 = _1672;
    }
    float _1674 = _1596;
    if (_1572)
    {
        float _1676 = _1560 * _1664;
        _1586 = _1676;
    }
    float _1678 = _1586;
    if (!_1572)
    {
        _1660 = _1564;
    }
    float _1680 = _1660;
    float _1682 = _1680;
    if (_1572)
    {
        float _1684 = _1562 * _1664;
        _1636 = _1684;
    }
    float _1686 = _1636;
    if (_1572)
    {
        float _1688 = fma(_1632, _1626, _1674);
        _1652 = _1688;
    }
    float _1690 = _1652;
    if (_1572)
    {
        float _1692 = _1678 * _1678;
        _1682 = _1692;
    }
    float _1694 = _1682;
    if (!_1572)
    {
        _1654 = _1566;
    }
    float _1696 = _1654;
    float _1698 = _1696;
    if (_1572)
    {
        float _1700 = _1686 * _1686;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = -_1670;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1690, _1694);
    float _1710 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = _1708 + _1702;
    float _1716 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = rsqrt(_1714);
    float _1724 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1730 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1732 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1736 = abs(_1706);
    float _1738 = log2(_1736);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1746 = -_1740;
    float _1748 = fma(_1746, _1728, 1.0);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1754 = _1722 * _1678;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = _1722 * _1690;
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1722 * _1686;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1764;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1748);
    float _1780 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = -_1768;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = exp2(_1770);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1800 = _1762 + 1.0;
    float _1802 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1808 = 1.0 / _1786;
    float _1810 = _1778 * 0.693147182464599609375;
    float _1812 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1792);
    float _1816 = -_1762;
    float _1818 = fma(_1796, _1800, _1816);
    float _1820 = fma(_1794, _1802, -0.212114393711090087890625);
    float _1822 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1806);
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1804);
    float _1826 = fma(_1818, 0.5, 0.5);
    float _1828 = fma(_1794, _1820, 1.570728778839111328125);
    float _1830 = _1822 * _1808;
    float _1832 = _1824 * _1808;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1814 * 0.636619746685028076171875;
    float3 _5230 = float3(_1834, _1836, _1812);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5230, float3(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5230, float3(0.0), isnan(_5230)), level(0.0)).x;
    float3 _5241 = float3(_1834, _1836, _1812);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5241, float3(0.0), isnan(_5241)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5241, float3(0.0), isnan(_5241)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1828;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5262 = float2(_1855, _1826);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1867 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1018;
    float _1871 = _1869 + 1.0;
    float _1873 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1865);
    float _1875 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    bool _1877 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1879 = isnan(_1556);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1885 = _1881 || _1883;
    float _1887 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1889 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1891 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1875);
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1889);
    float _1897 = 1.0 / _1893;
    float _1899 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1893;
    float _1905 = _1903 * _1897;
    float _1907 = _1905 * 0.5;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1917 = _1913 * _1915;
    float _1919 = abs(_1917);
    float _1921 = log2(_1919);
    bool _1923 = _1917 <= 8000.0;
    bool _1925 = isnan(_1917);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(8000.0);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1937 = exp2(_1935);
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1941, -2.0, 3.0);
    float _1945 = _1941 * _1941;
    float _1947 = _1945 * _1943;
    float _1949 = in.m_83.x;
    float _1951 = -_1947;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1947);
    float _1957 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1933 * _1955;
    float _1961 = exp2(_1957);
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1965 = _1871 * _1963;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1975 = _1971 * _1949;
    float _1977 = _1973 + _1786;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1786;
    float _1979 = -_1961;
    float _1981 = _1979 + 1.0;
    float _1983 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1977 * 0.5;
    float _1987 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1983;
    out.m_87.z = _1985;
    out.m_87.w = _1786;
    float _1989 = _1786;
    float _1991 = _1973;
    float _1993 = _1824;
    float _1995 = _1822;
    if (!_1885)
    {
        _1989 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1997 = _1989;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1885)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2003 = _1991;
    float _2005 = _2003;
    float _2007 = _2003;
    if (!_1885)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2009 = _1993;
    float _2011 = _2009;
    float _2013 = _2009;
    if (!_1885)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2015 = _1995;
    float _2017 = _1987 * _1840;
    float _2019 = -_1987;
    float _2021 = _2019 + 1.0;
    float _2023 = _1851 * _2017;
    float _2025 = _1863 * _2017;
    float _2027 = fma(_1859, _2023, _1845);
    float _2029 = fma(_1861, _2023, _1847);
    float _2031 = _1851 * _2021;
    float _2033 = fma(_1851, _2025, _1849);
    float _2035 = _2023;
    float _2037 = _2021;
    float _2039 = _2015;
    float _2041 = _2015;
    if (!_1885)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2035;
    float _2045 = _2043;
    float _2047 = _2043;
    if (!_1885)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2049 = _2037;
    out.m_89.x = _2027;
    out.m_89.y = _2029;
    out.m_89.z = _2033;
    out.m_89.w = _2031;
    bool _2051 = !_1885;
    float _2053 = _2049;
    float _2055 = _2049;
    if (!_2051)
    {
        bool _2057 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2059 = isnan(_1556);
        bool _2061 = _2057 || _2059;
        bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2065 = _2061 || _2063;
        if (!_2065)
        {
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = _1556 + _2067;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2073 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2071;
            float _2075 = 1.0 / _2073;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2097 = _2069 * _2075;
            float _2099 = precise::clamp(_2097, 0.0, 1.0);
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2105 = fma(_2099, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2107 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2099, _2083, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2111 = fma(_2099, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2113 = fma(_2099, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2115 = fma(_2099, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2107;
            _2013 = _2113;
            _2047 = _2105;
            _2007 = _2111;
            _2001 = _2109;
            _2041 = _2115;
            _2117 = true;
        }
        else
        {
            bool _2119 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2121 = isnan(_1556);
            bool _2123 = _2119 || _2121;
            bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2127 = _2123 || _2125;
            if (!_2127)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2129 = _2045;
            _2047 = _2129;
            if (!_2127)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2131 = _2053;
            _2055 = _2131;
            if (!_2127)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2133 = _1999;
            _2001 = _2133;
            if (!_2127)
            {
                _2005 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2135 = _2005;
            _2007 = _2135;
            if (!_2127)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2137 = _2011;
            _2013 = _2137;
            if (!_2127)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2139 = _2039;
            bool _2141 = !_2127;
            _2041 = _2139;
            if (!_2141)
            {
                bool _2143 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2145 = isnan(_1556);
                bool _2147 = _2143 || _2145;
                bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2151 = _2147 || _2149;
                if (!_2151)
                {
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = _1556 + _2153;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2157;
                    float _2161 = 1.0 / _2159;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2183 = _2155 * _2161;
                    float _2185 = precise::clamp(_2183, 0.0, 1.0);
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2191 = fma(_2185, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2193 = fma(_2185, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2185, _2169, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2197 = fma(_2185, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2199 = fma(_2185, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2201 = fma(_2185, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2193;
                    _2013 = _2199;
                    _2047 = _2191;
                    _2007 = _2197;
                    _2001 = _2195;
                    _2041 = _2201;
                    _2117 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2007 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2117 = false;
    float _2203 = _2055;
    float _2205 = _2013;
    float _2207 = _2047;
    float _2209 = _2007;
    float _2211 = _2001;
    float _2213 = _2041;
    float _2215 = fma(_1340, -0.5, 0.5);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = -_2203;
    float _2221 = _2219 + _2205;
    float _2223 = -_2207;
    float _2225 = _2223 + _2209;
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    bool _2231 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2233 = fma(_2217, _2221, _2203);
    float _2235 = fma(_2217, _2225, _2207);
    float _2237 = fma(_2217, _2229, _2211);
    float _2239 = _2233 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2241 = fma(_2235, 0.298911988735198974609375, _2239);
    float _2243 = fma(_2237, 0.114477999508380889892578125, _2241);
    out.m_91.x = 0.0;
    float _2245 = -_2243;
    float _2247 = _2235 + _2245;
    float _2249 = -_2243;
    float _2251 = _2233 + _2249;
    float _2253 = -_2243;
    float _2255 = _2237 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_85.w = _2257;
    out.m_93.x = _2259;
    out.m_93.y = _2261;
    out.m_93.z = _2263;
    if (!_2231)
    {
        return out;
    }
    float _2265 = -_1530;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2269 = -_1532;
    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2273 = -_1534;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = sqrt(_2281);
    float _2285 = rsqrt(_2281);
    float _2287 = -_2283;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = _2271 * _2285;
    float _2297 = _2267 * _2285;
    float _2299 = abs(_2293);
    float _2301 = log2(_2299);
    float _2303 = _2275 * _2285;
    float _2305 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2307 = _1340 * _2297;
    float _2309 = -_2297;
    float _2311 = -_2305;
    float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
    float _2315 = fma(_1338, _2295, _2307);
    float _2317 = -_2303;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
    float _2321 = fma(_1348, _2303, _2315);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2327 = _2319 + _2325;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = exp2(_2329);
    float _2337 = _2335 * _2333;
    float _2339 = _2323 * _2337;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2345 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2341;
    out.m_91.y = _2343;
    out.m_91.z = _2345;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2117 = false;
    bool _1404 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_50.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_53.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2401 = as_type<float>(_126);
        out.gl_Position.z = _2401;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_55.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2471 = as_type<float>(_166);
        out.gl_Position.z = _2471;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_57.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
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
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_57.z;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _198 + _202;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_57.x;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _236 = _234 != 0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _198 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = 0.0;
    if (!_208)
    {
        float _248 = in.m_57.y;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = 1.0 / _220;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _258 = _200 * 2.0;
    float _260 = 1.0 / _224;
    float _262 = _204 * _216;
    float _264 = _210 * 2.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _198 + _266;
    float _270 = floor(_258);
    float _272 = _268 * _252;
    float _274 = _210 + _200;
    float _276 = _268;
    float _278 = _216;
    float _280 = _200;
    if (!_208)
    {
        _276 = _200;
    }
    float _282 = _276;
    float _284 = fma(_244, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _282;
    if (!_208)
    {
        _278 = _250;
    }
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _290;
    float _294 = floor(_264);
    float _296 = _240 * _260;
    float _298 = fma(_292, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = _288;
    float _302 = _250;
    if (_208)
    {
        float _304 = in.m_57.x;
        float _306 = in.m_57.y;
        _300 = _304;
        _302 = _306;
    }
    float _308 = _300;
    float _310 = _302;
    float _312 = _274 + (-1.0);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    bool _322 = _270 >= 0.0;
    bool _324 = isnan(_270);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _334 = _270 > 0.0;
    float _336 = fma(_320, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = _330 ? 0 : 1;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _348 = _294 > 0.0;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _352 = _294 >= 0.0;
    bool _354 = isnan(_294);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_256, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_346, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _368 = ~_342;
    int _370 = _368 + 1;
    int _372 = _370 + 1;
    int _374 = _372;
    if (!_334)
    {
        int _376 = ~_342;
        int _378 = _376 + 1;
        _374 = _378;
    }
    int _380 = _374;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _384 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _350);
    if (_208)
    {
        _286 = _310;
    }
    float _386 = _286;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _390 = _308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _392 = _360 ? 0 : 1;
    float _394 = _340 * _144;
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _388);
    float _398 = -_382;
    float _400 = fma(_390, 2.0, _398);
    float _402 = _386;
    if (!_208)
    {
        _402 = _200;
    }
    float _404 = _402;
    float _406 = _210 + _310;
    float _408 = _200 + _310;
    float _410 = _404;
    if (_208)
    {
        _410 = _310;
    }
    float _412 = _410;
    float _414 = _406 + (-1.0);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = ~_392;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _426 = _422;
    if (!_348)
    {
        int _428 = ~_392;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = _408 + (-1.0);
    float _436 = exp2(_394);
    float _438 = fma(_424, -2.0, _416);
    float _440 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _442 = !_228;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _448 = !_232;
    int _450 = _448 ? 0 : 1;
    float _452 = _310 * 2.0;
    float _454 = -_144;
    float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[81].x, _400);
    int _458 = abs(_444);
    float _460 = floor(_452);
    int _462 = abs(_450);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _466 = 1.0 + _464;
    float _468 = in.m_59.x;
    float _470 = in.m_59.y;
    float _472 = in.m_59.z;
    bool _474 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(1.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = _210 + (-0.5);
    float _486 = -_436;
    float _488 = _486 + 1.0;
    bool _490 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _498 = _494 || _496;
    float _500 = 1.0 / _466;
    float _502 = float(_458);
    float _504 = _310 + (-0.5);
    float _506 = float(_462);
    float _508 = float(_380);
    float _510 = float(_432);
    float _512 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _384);
    float _514 = _502 * _508;
    float _516 = _498 ? _488 : 0.0;
    float _518 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _396);
    float _520 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _438);
    bool _522 = _460 > 0.0;
    float _524 = _506 * _510;
    float _526 = _456;
    if (_482)
    {
        float _528 = _516 * _500;
        _148 = _528;
    }
    float _530 = _148;
    float _532 = _514 * (-2.0);
    bool _534 = _460 >= 0.0;
    bool _536 = isnan(_460);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _524 * (-2.0);
    float _546 = fma(_532, _468, _468);
    int _548 = _542 ? 0 : 1;
    float _550 = fma(_544, _470, _470);
    float _552 = fma(_440, _532, _440);
    float _554 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[196].x, _546);
    bool _556 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _558 = isnan(_198);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = fma(_446, _544, _446);
    int _570 = ~_548;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_552, _530, _554);
    int _578 = _574;
    if (!_522)
    {
        int _580 = ~_548;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _550);
    bool _588 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _590 = isnan(_198);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_566;
    float _602 = _600 + 1.0;
    bool _604 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_198);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = fma(_568, _530, _586);
    bool _618 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _620 = isnan(_198);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _598 * _602;
    float _632 = -_598;
    float _634 = _632 + 1.0;
    bool _636 = !_236;
    int _638 = _636 ? 0 : 1;
    float _640 = _576 * 0.15915493667125701904296875;
    float _642 = _628 * _634;
    int _644 = abs(_638);
    float _646 = -_628;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _650;
    float _654 = _614 * _648;
    float _656 = float(_584);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _658;
    float _662 = float(_644);
    float _664 = fma(_652, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _666 = _298 * _654;
    float _668 = _336 * _654;
    float _670 = _662 * _656;
    float _672 = _284 * _654;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _674;
    float _678 = in.m_61.x;
    float _680 = in.m_61.y;
    float _682 = in.m_61.z;
    float _684 = _670 * (-2.0);
    float _686 = _200 + (-0.5);
    float _688 = fma(_660, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _690 = fma(_676, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _692 = fma(_332, _684, _332);
    float _694 = fma(_684, _472, _472);
    float _696 = -_614;
    float _698 = _696 + 1.0;
    float _700 = _616 * 0.15915493667125701904296875;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _694);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].z, _668);
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].y, _672);
    float _714 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[143].x, _666);
    float _716 = fma(_692, _530, _708);
    float _718 = fma(_366, _642, _710);
    float _720 = fma(_364, _642, _712);
    float _722 = fma(_362, _642, _714);
    float _724 = _716 * 0.15915493667125701904296875;
    float _726 = fma(_690, _630, _718);
    float _728 = fma(_664, _630, _720);
    float _730 = fma(_688, _630, _722);
    float _732 = _640 * 6.283185482025146484375;
    float _734 = sin(_732);
    float _736 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].z, _726);
    float _738 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].y, _728);
    float _740 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[146].x, _730);
    float _742 = _736 * _682;
    float _744 = _738 * _680;
    float _746 = _740 * _678;
    float _748 = _640 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = in.m_50.x;
    float _754 = in.m_50.y;
    float _756 = in.m_50.z;
    float _758 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _704);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _702);
    float _764 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _706);
    float _768 = _760 * _758;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _762 * _764;
    float _778 = _766 * _774;
    float _780 = _700 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _724 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _734 * _772;
    float _790 = _750 * _772;
    float _792 = _754 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _750 * _782;
    float _802 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _804 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _750 * _786;
    float _808 = _772 * _786;
    float _810 = _806 * _768;
    float _812 = fma(_798, _800, _788);
    float _814 = fma(_798, _788, _800);
    float _816 = _734 * _782;
    float _818 = _782 * _786;
    float _820 = _734 * _786;
    float _822 = -_768;
    float _824 = _798 * _822;
    float _826 = -_790;
    float _828 = fma(_798, _816, _826);
    float _830 = -_816;
    float _832 = fma(_798, _790, _830);
    float _834 = fma(_812, _776, _810);
    float _836 = _820 * _768;
    float _838 = fma(_818, _776, _824);
    float _840 = _754 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_828, _776, _836);
    float _846 = fma(_808, _778, _838);
    float _848 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].x, _840);
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _852 = _842 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _854 = fma(_814, _778, _844);
    float _856 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].z, _848);
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _852);
    float _862 = _754 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _860);
    float _870 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].x, _862);
    float _872 = _804 + _866;
    float _874 = _864 + _868;
    float _876 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].z, _870);
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _880 = _872 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _884 = _874 + _882;
    float _886 = _876 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _888 = _880 * _880;
    float _890 = _884 * _884;
    float _892 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _894 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _896 = _888 + _890;
    float _898 = floor(_892);
    float _900 = sqrt(_896);
    float _902 = -_898;
    float _904 = _892 + _902;
    bool _906 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _900 + _908;
    float _912 = 0.0;
    float _914 = _752;
    float _916 = _872;
    float _918 = _904;
    float _920 = _896;
    float _922 = _890;
    float _924 = _888;
    if (_906)
    {
        float _926 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    if (_906)
    {
        float _930 = rsqrt(_896);
        _914 = _930;
    }
    float _932 = _914;
    float _934 = _928;
    if (_906)
    {
        float _936 = _910 * _928;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = _938;
    if (_906)
    {
        float _944 = _938 * 0.15915493667125701904296875;
        _942 = _944;
    }
    float _946 = _942;
    float _948 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _940);
    float _950 = _842;
    float _952 = _948;
    float _954 = _946;
    if (_906)
    {
        float _956 = _946 * 6.283185482025146484375;
        float _958 = sin(_956);
        _950 = _958;
    }
    float _960 = _950;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _948);
    float _964 = _886 + _962;
    float _966 = _962;
    float _968 = _964;
    if (!_906)
    {
        _966 = _874;
    }
    float _970 = _966;
    float _972 = _970;
    if (_906)
    {
        float _974 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _974;
    }
    float _976 = _952;
    float _978 = _976;
    if (_906)
    {
        float _980 = fma(_960, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = floor(_894);
    float _986 = _982;
    if (_906)
    {
        float _988 = _932 * _982;
        _986 = _988;
    }
    float _990 = _986;
    if (_906)
    {
        float _992 = fma(_880, _990, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _916 = _992;
    }
    float _994 = _916;
    if (_906)
    {
        float _996 = fma(_884, _990, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _996;
    }
    float _998 = _972;
    float _1000 = fma(_994, 6.2500002968590706586837768554688e-05, 0.5);
    float _1002 = fma(_998, 6.2500002968590706586837768554688e-05, 0.5);
    float _1004 = -_984;
    float _1006 = _894 + _1004;
    float2 _3779 = float2(_1000, _1002);
    float3 _1010 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3779, float2(0.0), isnan(_3779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3779, float2(0.0), isnan(_3779)), level(0.0)).xyz;
    float _1012 = _1010.x;
    float _1014 = _1010.y;
    float _1016 = _1010.z;
    float2 _3795 = float2(_904, _1006);
    float _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3795, float2(0.0), isnan(_3795)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3795, float2(0.0), isnan(_3795)), level(0.0)).x;
    float _1020 = in.m_65.x;
    float _1022 = in.m_65.y;
    float _1024 = in.m_65.z;
    bool _1026 = _704 != 0.0;
    bool _1028 = isnan(_704);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1038 = in.m_67.x;
    bool _1040 = _702 == 0.0;
    bool _1042 = !_1034;
    bool _1044 = _1040 && _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_57.w;
    bool _1052 = _706 == 0.0;
    bool _1054 = _1052 && _1044;
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1058 = _200 > 0.5;
    bool _1060 = _1058 && _1048;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_906)
    {
        float _1068 = _946 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _954 = _1070;
    }
    float _1072 = _954;
    float _1074 = _1020;
    int _1076 = as_type<int>(_1022);
    if (_1054)
    {
        _280 = _1022;
    }
    float _1078 = _280;
    float _1080 = _1078;
    if (!_1054)
    {
        float _1082 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1074 = _1082;
    }
    float _1084 = _1074;
    if (_1054)
    {
        _918 = _1024;
    }
    float _1086 = _918;
    float _1088 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1090 = 0.0;
    float _1092 = _1086;
    if (_1054)
    {
        _1090 = _1078;
    }
    float _1094 = _1090;
    int _1096 = 0;
    float _1098 = _1094;
    if (_1054)
    {
        float _1100 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1096 = as_type<int>(_1100);
    }
    int _1102 = _1096;
    int _1104 = _1102;
    if (!_1054)
    {
        _1080 = _1022;
    }
    float _1106 = _1080;
    if (_1054)
    {
        float _1108 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1076 = as_type<int>(_1108);
    }
    int _1110 = _1076;
    int _1112 = _1110;
    if (_1054)
    {
        _920 = _1086;
    }
    float _1114 = _920;
    float _1116 = _1038;
    float _1118 = _1114;
    if (_1048)
    {
        _1066 = _1038;
    }
    float _1120 = _1066;
    float _1122 = _1120;
    if (!_1054)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = as_type<int>(_1124);
    }
    int _1126 = _1104;
    if (!_1054)
    {
        _1092 = _1024;
    }
    float _1128 = _1092;
    float _1130 = in.m_67.y;
    if (_1060)
    {
        float _1132 = -_1120;
        float _1134 = _1132 + 1.0;
        _1122 = _1134;
    }
    float _1136 = _1122;
    bool _1138 = _1050 > 0.5;
    if (!_1054)
    {
        float _1140 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1112 = as_type<int>(_1140);
    }
    int _1142 = _1112;
    bool _1144 = !_1054;
    float _1146 = _1144 ? as_type<float>(_1126) : _1106;
    if (_1048)
    {
        _1116 = _1136;
    }
    float _1148 = _1116;
    bool _1150 = !_1054;
    float _1152 = _1150 ? as_type<float>(_1142) : _1128;
    float _1154 = _1146 * _1146;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1158 = fma(_1152, _1152, _1154);
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1054)
    {
        _1098 = as_type<float>(_1126);
    }
    float _1164 = _1098;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = rsqrt(_1158);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1172 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1054)
    {
        _1118 = as_type<float>(_1142);
    }
    float _1176 = _1118;
    float _1178 = -_1130;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_1088, _1148, -0.5);
    out.m_71.x = _1170;
    out.m_71.y = _1172;
    out.m_71.z = _1174;
    out.m_71.w = _1166;
    float _1184 = _1130;
    if (_1064)
    {
        float _1186 = _1138 ? _1180 : _1130;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1192 = -_1164;
    float _1194 = _798 * _1192;
    float _1196 = fma(_512, _1182, _456);
    float _1198 = fma(_1190, _1188, -0.5);
    float _1200 = _1146 * _1168;
    float _1202 = _1152 * _1168;
    float _1204 = _812 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1206 = fma(_818, _1084, _1194);
    float _1208 = -_1200;
    float _1210 = _808 * _1208;
    float _1212 = -_1200;
    float _1214 = _832 * _1212;
    float _1216 = -_1200;
    float _1218 = _814 * _1216;
    float _1220 = _812 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1222 = -_798;
    float _1224 = fma(_1222, _1202, _1210);
    float _1226 = _820 * _1164;
    float _1228 = fma(_806, _1202, _1214);
    float _1230 = _806 * _1164;
    float _1232 = fma(_820, _1202, _1218);
    float _1234 = fma(_828, _1084, _1226);
    float _1236 = _1202;
    if (_906)
    {
        float _1238 = _1072 + (-1.0);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = fma(_812, _1084, _1230);
    float _1244 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1204);
    float _1246 = fma(_814, _1176, _1234);
    float _1248 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1250 = _1240;
    float _1252 = _1248;
    if (_906)
    {
        float _1254 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _526 = _1254;
    }
    float _1256 = _526;
    if (_906)
    {
        float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1260 = _998 + _1258;
        _1250 = _1260;
    }
    float _1262 = _1250;
    float _1264 = fma(_832, _1176, _1242);
    float _1266 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1248);
    if (_906)
    {
        float _1268 = fma(_964, _1072, _1256);
        _968 = _1268;
    }
    float _1270 = _968;
    if (_906)
    {
        float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1274 = _994 + _1272;
        _1252 = _1274;
    }
    float _1276 = _1252;
    if (_906)
    {
        float _1278 = _1262 * _1262;
        _922 = _1278;
    }
    float _1280 = _922;
    float _1282 = -_520;
    float _1284 = fma(_518, _1198, _1282);
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1288 = _1270 + _1286;
    if (_906)
    {
        float _1290 = _1276 * _1276;
        _924 = _1290;
    }
    float _1292 = _924;
    float _1294 = fma(_808, _1176, _1206);
    float _1296 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1300 = fma(_1288, _1288, _1292);
    float _1302 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1304 = _812 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1306 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = _1300 + _1280;
    float _1310 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1220);
    float _1314 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1296);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1298);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1302);
    float _1320 = sqrt(_1308);
    float _1322 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1304);
    float _1324 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    float _1326 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1328 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1330 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1312);
    float _1332 = _1196 + 0.5;
    float _1334 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1266);
    float _1336 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1314);
    float _1338 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1340 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1318);
    float _1342 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1322);
    float _1344 = _1284 + 0.5;
    float _1346 = fma(_1232, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1348 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1326);
    out.m_73.x = _1328;
    out.m_73.y = _1330;
    out.m_73.z = _1342;
    bool _1350 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1320);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_75.z = _1332;
    out.m_75.w = _1344;
    out.m_77.x = _1334;
    out.m_77.y = _1336;
    out.m_77.z = _1346;
    out.m_79.x = _1338;
    out.m_79.y = _1340;
    out.m_79.z = _1348;
    float _1360 = _1316;
    float _1362 = _1344;
    float _1364 = _1336;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1366 = _1360;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    bool _1368 = !_1358;
    float _1370 = _1366;
    float _1372 = _1014;
    float _1374 = _1016;
    if (!_1368)
    {
        bool _1376 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1378 = isnan(_1320);
        bool _1380 = _1376 || _1378;
        bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1384 = _1380 || _1382;
        if (!_1384)
        {
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = _1320 + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1392 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1390;
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1398 = 1.0 / _1392;
            float _1400 = _1388 * _1398;
            float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1402;
            _1404 = true;
        }
        else
        {
            bool _1406 = _1320 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1408 = isnan(_1320);
            bool _1410 = _1406 || _1408;
            bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1414 = _1410 || _1412;
            if (!_1414)
            {
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1320 + _1416;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1426 = _1424 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1428 = 1.0 / _1422;
                float _1430 = _1418 * _1428;
                float _1432 = fma(_1430, _1426, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1432;
                _1404 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1404 = false;
    float _1434 = _1370;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _994 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _998 + _1440;
    bool _1444 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.5);
    bool _1452 = _1448 || _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1270 + _1454;
    float _1458 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = fma(_1456, _1434, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = _1434;
    float _1466 = _1456;
    if (_1452)
    {
        _1464 = _1458;
    }
    float _1468 = _1464;
    float _1470 = _1468;
    if (_1452)
    {
        _1466 = _1462;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (_1452)
    {
        _1362 = _1460;
    }
    float _1476 = _1362;
    float _1478 = _1476;
    if (!_1452)
    {
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = _886 + _1480;
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = _804 + _1484;
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1490 = _1482 * _1482;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _864 + _1492;
        float _1496 = fma(_1486, _1486, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_804;
        float _1512 = _1510 + _1458;
        float _1514 = _1504 * _1508;
        float _1516 = -_886;
        float _1518 = _1516 + _1462;
        float _1520 = -_864;
        float _1522 = _1520 + _1460;
        float _1524 = fma(_1512, _1514, _804);
        float _1526 = fma(_1518, _1514, _886);
        float _1528 = fma(_1522, _1514, _864);
        _1474 = _1526;
        _1470 = _1524;
        _1478 = _1528;
    }
    float _1530 = _1474;
    float _1532 = _1470;
    float _1534 = _1478;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1538 = _1530 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1532 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1534 + _1544;
    float _1548 = _1538 * _1538;
    float _1550 = fma(_1542, _1542, _1548);
    float _1552 = fma(_1546, _1546, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = sqrt(_1552);
    float _1558 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1560 = _1542 * _1558;
    float _1562 = _1546 * _1558;
    float _1564 = _1560 * _1560;
    float _1566 = _1562 * _1562;
    float _1568 = _1564 + _1566;
    float _1570 = sqrt(_1568);
    bool _1572 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1570 + _1574;
    float _1578 = _1554;
    float _1580 = _1576;
    float _1582 = _1538;
    float _1584 = _1558;
    float _1586 = _1560;
    if (_1572)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (_1572)
    {
        float _1592 = rsqrt(_1568);
        _1372 = _1592;
    }
    float _1594 = _1372;
    float _1596 = _1594;
    if (_1572)
    {
        float _1598 = _1576 * _1590;
        _1580 = _1598;
    }
    float _1600 = _1580;
    if (_1572)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1364 = _1602;
    }
    float _1604 = _1364;
    float _1606 = _1590;
    if (_1572)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _1546;
    float _1620 = _1616;
    if (_1572)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1558;
    float _1630 = -_1616;
    float _1632 = fma(_1538, _1628, _1630);
    if (!_1572)
    {
        _1582 = _1562;
    }
    float _1634 = _1582;
    float _1636 = _1634;
    if (_1572)
    {
        float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1638;
    }
    float _1640 = _1620;
    float _1642 = _1612;
    float _1644 = _1640;
    if (_1572)
    {
        float _1646 = fma(_1612, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1374 = _1646;
    }
    float _1648 = _1374;
    if (!_1572)
    {
        _1642 = _1632;
    }
    float _1650 = _1642;
    float _1652 = _1650;
    float _1654 = _1626;
    if (_1572)
    {
        float _1656 = _1626 + (-1.0);
        _1644 = _1656;
    }
    float _1658 = _1644;
    float _1660 = _1658;
    if (_1572)
    {
        float _1662 = _1594 * _1648;
        _1584 = _1662;
    }
    float _1664 = _1584;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1668 = fma(_1556, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1666);
    float _1670 = precise::clamp(_1668, 0.0, 1.0);
    if (_1572)
    {
        float _1672 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1596 = _1672;
    }
    float _1674 = _1596;
    if (_1572)
    {
        float _1676 = _1560 * _1664;
        _1586 = _1676;
    }
    float _1678 = _1586;
    if (!_1572)
    {
        _1660 = _1564;
    }
    float _1680 = _1660;
    float _1682 = _1680;
    if (_1572)
    {
        float _1684 = _1562 * _1664;
        _1636 = _1684;
    }
    float _1686 = _1636;
    if (_1572)
    {
        float _1688 = fma(_1632, _1626, _1674);
        _1652 = _1688;
    }
    float _1690 = _1652;
    if (_1572)
    {
        float _1692 = _1678 * _1678;
        _1682 = _1692;
    }
    float _1694 = _1682;
    if (!_1572)
    {
        _1654 = _1566;
    }
    float _1696 = _1654;
    float _1698 = _1696;
    if (_1572)
    {
        float _1700 = _1686 * _1686;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = -_1670;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1690, _1694);
    float _1710 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = _1708 + _1702;
    float _1716 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = rsqrt(_1714);
    float _1724 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1730 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1732 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1736 = abs(_1706);
    float _1738 = log2(_1736);
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1730);
    float _1746 = -_1740;
    float _1748 = fma(_1746, _1728, 1.0);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1752 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1734);
    float _1754 = _1722 * _1678;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1762 = _1722 * _1690;
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1722 * _1686;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = -_1764;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1748);
    float _1780 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = -_1768;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1790 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = fma(_1784, 0.5, 0.5);
    float _1796 = exp2(_1770);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1788);
    float _1800 = _1762 + 1.0;
    float _1802 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1808 = 1.0 / _1786;
    float _1810 = _1778 * 0.693147182464599609375;
    float _1812 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = sqrt(_1792);
    float _1816 = -_1762;
    float _1818 = fma(_1796, _1800, _1816);
    float _1820 = fma(_1794, _1802, -0.212114393711090087890625);
    float _1822 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1806);
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1804);
    float _1826 = fma(_1818, 0.5, 0.5);
    float _1828 = fma(_1794, _1820, 1.570728778839111328125);
    float _1830 = _1822 * _1808;
    float _1832 = _1824 * _1808;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1814 * 0.636619746685028076171875;
    float3 _5230 = float3(_1834, _1836, _1812);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5230, float3(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5230, float3(0.0), isnan(_5230)), level(0.0)).x;
    float3 _5241 = float3(_1834, _1836, _1812);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5241, float3(0.0), isnan(_5241)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5241, float3(0.0), isnan(_5241)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1828;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5262 = float2(_1855, _1826);
    float3 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1867 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1869 = -_1018;
    float _1871 = _1869 + 1.0;
    float _1873 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1865);
    float _1875 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1867);
    bool _1877 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1879 = isnan(_1556);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1885 = _1881 || _1883;
    float _1887 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1889 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1891 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1875);
    float _1893 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1895 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1889);
    float _1897 = 1.0 / _1893;
    float _1899 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = _1901 + _1893;
    float _1905 = _1903 * _1897;
    float _1907 = _1905 * 0.5;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1917 = _1913 * _1915;
    float _1919 = abs(_1917);
    float _1921 = log2(_1919);
    bool _1923 = _1917 <= 8000.0;
    bool _1925 = isnan(_1917);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(8000.0);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1937 = exp2(_1935);
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = fma(_1941, -2.0, 3.0);
    float _1945 = _1941 * _1941;
    float _1947 = _1945 * _1943;
    float _1949 = in.m_83.x;
    float _1951 = -_1947;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1947);
    float _1957 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1933 * _1955;
    float _1961 = exp2(_1957);
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1965 = _1871 * _1963;
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = -_1967;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1973 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1975 = _1971 * _1949;
    float _1977 = _1973 + _1786;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1786;
    float _1979 = -_1961;
    float _1981 = _1979 + 1.0;
    float _1983 = _1975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1985 = _1977 * 0.5;
    float _1987 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1983;
    out.m_87.z = _1985;
    out.m_87.w = _1786;
    float _1989 = _1786;
    float _1991 = _1973;
    float _1993 = _1824;
    float _1995 = _1822;
    if (!_1885)
    {
        _1989 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1997 = _1989;
    float _1999 = _1997;
    float _2001 = _1997;
    if (!_1885)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2003 = _1991;
    float _2005 = _2003;
    float _2007 = _2003;
    if (!_1885)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2009 = _1993;
    float _2011 = _2009;
    float _2013 = _2009;
    if (!_1885)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2015 = _1995;
    float _2017 = _1987 * _1840;
    float _2019 = -_1987;
    float _2021 = _2019 + 1.0;
    float _2023 = _1851 * _2017;
    float _2025 = _1863 * _2017;
    float _2027 = fma(_1859, _2023, _1845);
    float _2029 = fma(_1861, _2023, _1847);
    float _2031 = _1851 * _2021;
    float _2033 = fma(_1851, _2025, _1849);
    float _2035 = _2023;
    float _2037 = _2021;
    float _2039 = _2015;
    float _2041 = _2015;
    if (!_1885)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2035;
    float _2045 = _2043;
    float _2047 = _2043;
    if (!_1885)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2049 = _2037;
    out.m_89.x = _2027;
    out.m_89.y = _2029;
    out.m_89.z = _2033;
    out.m_89.w = _2031;
    bool _2051 = !_1885;
    float _2053 = _2049;
    float _2055 = _2049;
    if (!_2051)
    {
        bool _2057 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2059 = isnan(_1556);
        bool _2061 = _2057 || _2059;
        bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2065 = _2061 || _2063;
        if (!_2065)
        {
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = _1556 + _2067;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2073 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2071;
            float _2075 = 1.0 / _2073;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2097 = _2069 * _2075;
            float _2099 = precise::clamp(_2097, 0.0, 1.0);
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2105 = fma(_2099, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2107 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2109 = fma(_2099, _2083, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2111 = fma(_2099, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2113 = fma(_2099, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2115 = fma(_2099, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2055 = _2107;
            _2013 = _2113;
            _2047 = _2105;
            _2007 = _2111;
            _2001 = _2109;
            _2041 = _2115;
            _2117 = true;
        }
        else
        {
            bool _2119 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2121 = isnan(_1556);
            bool _2123 = _2119 || _2121;
            bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2127 = _2123 || _2125;
            if (!_2127)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2129 = _2045;
            _2047 = _2129;
            if (!_2127)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2131 = _2053;
            _2055 = _2131;
            if (!_2127)
            {
                _1999 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2133 = _1999;
            _2001 = _2133;
            if (!_2127)
            {
                _2005 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2135 = _2005;
            _2007 = _2135;
            if (!_2127)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2137 = _2011;
            _2013 = _2137;
            if (!_2127)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2139 = _2039;
            bool _2141 = !_2127;
            _2041 = _2139;
            if (!_2141)
            {
                bool _2143 = _1556 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2145 = isnan(_1556);
                bool _2147 = _2143 || _2145;
                bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2151 = _2147 || _2149;
                if (!_2151)
                {
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = _1556 + _2153;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2157;
                    float _2161 = 1.0 / _2159;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2183 = _2155 * _2161;
                    float _2185 = precise::clamp(_2183, 0.0, 1.0);
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2191 = fma(_2185, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2193 = fma(_2185, _2189, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2195 = fma(_2185, _2169, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2197 = fma(_2185, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2199 = fma(_2185, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2201 = fma(_2185, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2055 = _2193;
                    _2013 = _2199;
                    _2047 = _2191;
                    _2007 = _2197;
                    _2001 = _2195;
                    _2041 = _2201;
                    _2117 = true;
                }
                else
                {
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2007 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2001 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2117 = false;
    float _2203 = _2055;
    float _2205 = _2013;
    float _2207 = _2047;
    float _2209 = _2007;
    float _2211 = _2001;
    float _2213 = _2041;
    float _2215 = fma(_1340, -0.5, 0.5);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = -_2203;
    float _2221 = _2219 + _2205;
    float _2223 = -_2207;
    float _2225 = _2223 + _2209;
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    bool _2231 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2233 = fma(_2217, _2221, _2203);
    float _2235 = fma(_2217, _2225, _2207);
    float _2237 = fma(_2217, _2229, _2211);
    float _2239 = _2233 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2241 = fma(_2235, 0.298911988735198974609375, _2239);
    float _2243 = fma(_2237, 0.114477999508380889892578125, _2241);
    out.m_91.x = 0.0;
    float _2245 = -_2243;
    float _2247 = _2235 + _2245;
    float _2249 = -_2243;
    float _2251 = _2233 + _2249;
    float _2253 = -_2243;
    float _2255 = _2237 + _2253;
    float _2257 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2259 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_85.w = _2257;
    out.m_93.x = _2259;
    out.m_93.y = _2261;
    out.m_93.z = _2263;
    if (!_2231)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2265 = -_1530;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2269 = -_1532;
    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2273 = -_1534;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2277 = _2267 * _2267;
    float _2279 = fma(_2271, _2271, _2277);
    float _2281 = fma(_2275, _2275, _2279);
    float _2283 = sqrt(_2281);
    float _2285 = rsqrt(_2281);
    float _2287 = -_2283;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2291 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    float _2295 = _2271 * _2285;
    float _2297 = _2267 * _2285;
    float _2299 = abs(_2293);
    float _2301 = log2(_2299);
    float _2303 = _2275 * _2285;
    float _2305 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2307 = _1340 * _2297;
    float _2309 = -_2297;
    float _2311 = -_2305;
    float _2313 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2311);
    float _2315 = fma(_1338, _2295, _2307);
    float _2317 = -_2303;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2313);
    float _2321 = fma(_1348, _2303, _2315);
    float _2323 = precise::clamp(_2321, 0.0, 1.0);
    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2327 = _2319 + _2325;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2331 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2333 = precise::clamp(_2331, 0.0, 1.0);
    float _2335 = exp2(_2329);
    float _2337 = _2335 * _2333;
    float _2339 = _2323 * _2337;
    float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2345 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2341;
    out.m_91.y = _2343;
    out.m_91.z = _2345;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

