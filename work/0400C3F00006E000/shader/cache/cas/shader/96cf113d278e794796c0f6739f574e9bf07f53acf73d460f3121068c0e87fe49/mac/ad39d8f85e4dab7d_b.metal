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
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1801 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2036 = as_type<float>(_128);
        out.gl_Position.z = _2036;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_49.w;
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
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_47.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_164);
        out.gl_Position.z = _2105;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_51.z;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_51.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_51.x;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _166 * 2.0;
    float _188 = floor(_186);
    float _190 = _170 * 2.0;
    float _192 = _170 + _166;
    float _194 = _176 * 2.0;
    float _196 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _192 + (-1.0);
    float _200 = floor(_190);
    float _202 = _170 + _176;
    float _204 = -_178;
    float _206 = fma(_196, 2.0, _204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _202 + (-1.0);
    float _212 = fma(_208, -2.0, _180);
    float _214 = floor(_194);
    bool _216 = _188 >= 0.0;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _228 = _188 > 0.0;
    float _230 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _232 = _224 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    float _244 = _198;
    float _246 = _188;
    float _248 = _168;
    if (_174)
    {
        _244 = _176;
    }
    float _250 = _244;
    bool _252 = _200 > 0.0;
    bool _254 = _200 >= 0.0;
    bool _256 = isnan(_200);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = _250;
    if (!_174)
    {
        _246 = _170;
    }
    float _266 = _246;
    float _268 = _266;
    if (!_174)
    {
        _264 = _166;
    }
    float _270 = _264;
    float _272 = 0.0;
    if (!_242)
    {
        float _274 = _168 * _168;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    float _280 = _278;
    if (_174)
    {
        _268 = _176;
    }
    float _282 = _268;
    bool _284 = _214 > 0.0;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _288 = _214 >= 0.0;
    bool _290 = isnan(_214);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _300 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _302 = ~_232;
    int _304 = _302 + 1;
    int _306 = _304 + 1;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _286);
    float _310 = -_184;
    float _312 = fma(_298, 2.0, _310);
    float _314 = -_182;
    float _316 = fma(_300, 2.0, _314);
    int _318 = _306;
    float _320 = _300;
    float _322 = _298;
    float _324 = _282;
    if (!_228)
    {
        int _326 = ~_232;
        int _328 = _326 + 1;
        _318 = _328;
    }
    int _330 = _318;
    if (!_242)
    {
        float _332 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _332;
    }
    float _334 = _280;
    bool _336 = !_242;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _168 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _168);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _354;
        _322 = _346;
        _324 = _356;
        _338 = _368;
    }
    float _370 = _320;
    float _372 = _322;
    float _374 = _324;
    float _376 = _338;
    bool _378 = !_242;
    float _380 = _370;
    float _382 = _372;
    float _384 = _374;
    if (!_378)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = 1.0 / _392;
        float _396 = _168 * _388;
        float _398 = exp2(_396);
        float _400 = -_398;
        float _402 = _400 + 1.0;
        float _404 = _402 * _394;
        _380 = _398;
        _248 = _404;
    }
    float _406 = _380;
    float _408 = _248;
    float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _412 = log2(_410);
    int _414 = _296 ? 0 : 1;
    float _416 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _212);
    float _432 = _406;
    float _434 = _430;
    if (!_174)
    {
        _382 = _166;
    }
    float _436 = _382;
    float _438 = -_146;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[81].x, _316);
    float _442 = -_146;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    bool _446 = !_420;
    int _448 = _446 ? 0 : 1;
    float _450 = -_146;
    float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[86].x, _312);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _456 = _436;
    if (_174)
    {
        _456 = _170;
    }
    float _458 = _456;
    if (_174)
    {
        _432 = _170;
    }
    float _460 = _432;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _464 = _460;
    if (!_174)
    {
        _464 = _176;
    }
    float _466 = _464;
    int _468 = abs(_448);
    float _470 = _458 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_174)
    {
        _384 = _166;
    }
    float _472 = _384;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _476 = _472;
    if (_174)
    {
        _476 = _170;
    }
    float _478 = _476;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = float(_330);
    float _484 = _412 * _146;
    float _486 = float(_468);
    float _488 = fma(_470, -2.0, _462);
    float _490 = fma(_474, -2.0, _454);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = _486 * _482;
    float _502 = exp2(_484);
    float _504 = _500 * (-2.0);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _512 = ~_414;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _508);
    bool _524 = !_424;
    int _526 = _524 ? 0 : 1;
    float _528 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _510);
    float _530 = 1.0 / _520;
    bool _532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(1.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = -_502;
    float _544 = _542 + 1.0;
    int _546 = _516;
    if (!_284)
    {
        int _548 = ~_414;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _556 = abs(_526);
    float _558 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _506);
    bool _560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    float _572 = float(_552);
    float _574 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _554);
    float _576 = float(_556);
    float _578 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    float _580 = _568 ? _544 : 0.0;
    float _582 = fma(_504, _494, _494);
    float _584 = fma(_226, _504, _226);
    float _586 = _576 * _572;
    float _588 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _528);
    bool _590 = !_428;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _574);
    float _596 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _492);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _488);
    float _600 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    if (_540)
    {
        float _602 = _580 * _530;
        _148 = _602;
    }
    float _604 = _148;
    float _606 = _176 + (-0.5);
    int _608 = _262 ? 0 : 1;
    float _610 = _586 * (-2.0);
    int _612 = abs(_592);
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _582);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_610, _496, _496);
    int _624 = _620;
    if (!_252)
    {
        int _626 = ~_608;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_584, _604, _614);
    float _634 = fma(_230, _610, _230);
    float _636 = _170 + (-0.5);
    float _638 = float(_630);
    float _640 = _176 + _166;
    float _642 = float(_612);
    float _644 = in.m_55.x;
    float _646 = in.m_55.y;
    float _648 = in.m_55.z;
    float _650 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _622);
    float _652 = _632 * 0.15915493667125701904296875;
    float _654 = _642 * _638;
    float _656 = _640 + (-1.0);
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = fma(_634, _604, _650);
    float _666 = _654 * (-2.0);
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _670 = _166 + (-0.5);
    float _672 = _664 * 0.15915493667125701904296875;
    float _674 = fma(_666, _498, _498);
    float _676 = fma(_668, _666, _668);
    float _678 = in.m_55.w;
    float _680 = _652 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].z, _674);
    float _686 = in.m_49.x;
    float _688 = in.m_49.y;
    float _690 = in.m_49.z;
    float _692 = fma(_676, _604, _684);
    float _694 = in.m_44.x;
    float _696 = in.m_44.y;
    float _698 = in.m_44.z;
    float _700 = _652 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _644 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = _692 * 0.15915493667125701904296875;
    float _708 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _712 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _672 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _726 = _672 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _722 * _712;
    float _732 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = _724 * _716;
    float _736 = fma(_408, _688, _714);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _740 = fma(_408, _690, _732);
    float _742 = _706 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = fma(_736, _678, _696);
    float _752 = fma(_740, _678, _698);
    float _754 = _738 * _746;
    float _756 = fma(_408, _686, _748);
    float _758 = _682 * _720;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _682 * _728;
    float _766 = fma(_756, _678, _694);
    float _768 = _702 * _720;
    float _770 = _702 * _728;
    float _772 = _750 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _774 = _750 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _750 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _702 * _744;
    float _780 = _728 * _744;
    float _782 = _682 * _744;
    float _784 = _720 * _744;
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _772);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _790 = _782 * _734;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _794 = -_768;
    float _796 = fma(_762, _764, _794);
    float _798 = -_764;
    float _800 = fma(_762, _768, _798);
    float _802 = fma(_762, _770, _758);
    float _804 = _778 * _734;
    float _806 = fma(_762, _758, _770);
    float _808 = -_734;
    float _810 = _762 * _808;
    float _812 = fma(_796, _730, _790);
    float _814 = fma(_802, _730, _804);
    float _816 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _818 = fma(_780, _730, _810);
    float _820 = fma(_806, _754, _812);
    float _822 = fma(_800, _754, _814);
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _826 = fma(_784, _754, _818);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].x, _830);
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].x, _836);
    float _844 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].z, _838);
    float _846 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _848 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[9].z, _842);
    float _850 = _844 + _828;
    float _852 = _846 + _834;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _868 = sqrt(_864);
    float _870 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _872 = _848 + _870;
    bool _874 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = _870;
    float _878 = _826;
    float _880 = _848;
    float _882 = _820;
    float _884 = _734;
    if (!_874)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_874)
    {
        _878 = _850;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_874)
    {
        _880 = _872;
    }
    float _894 = _880;
    bool _896 = !_874;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _868 + _902;
        float _906 = rsqrt(_864);
        float _908 = _904 * _900;
        float _910 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_872, _916, _924);
        float _930 = _906 * _926;
        float _932 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _888 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _888;
    float _940 = _892;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _940 + _950;
    float _954 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _956 = _944 * _944;
    float _958 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_948, _948, _956);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _964 = fma(_952, _952, _960);
    float _966 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _962);
    float _968 = rsqrt(_964);
    float _970 = sqrt(_964);
    float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _948 * _972;
    float _976 = _952 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _968;
    float _994 = _990;
    float _996 = _944;
    float _998 = _972;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (_986)
    {
        float _1006 = _990 * _1002;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_986)
    {
        float _1010 = rsqrt(_982);
        _1004 = _1010;
    }
    float _1012 = _1004;
    float _1014 = _1012;
    if (_986)
    {
        float _1016 = _1008 * 0.15915493667125701904296875;
        _882 = _1016;
    }
    float _1018 = _882;
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1022 = _952;
    if (_986)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1022 = _1026;
    }
    float _1028 = _1022;
    float _1030 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1032 = precise::max(0.0, _1020);
    float _1034 = _752;
    float _1036 = _1032;
    if (_986)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = -_972;
    float _1046 = -_1032;
    float _1048 = fma(_944, _1044, _1046);
    if (_986)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1028;
    float _1056 = _1052;
    if (_986)
    {
        float _1058 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_986)
    {
        _1056 = _1048;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    if (_986)
    {
        float _1068 = _1012 * _1060;
        _884 = _1068;
    }
    float _1070 = _884;
    if (!_986)
    {
        _1014 = _974;
    }
    float _1072 = _1014;
    float _1074 = _1072;
    float _1076 = _1042;
    if (_986)
    {
        float _1078 = _1042 + (-1.0);
        _1036 = _1078;
    }
    float _1080 = _1036;
    float _1082 = _1080;
    if (_986)
    {
        float _1084 = _974 * _1070;
        _1074 = _1084;
    }
    float _1086 = _1074;
    if (!_986)
    {
        _1062 = _978;
    }
    float _1088 = _1062;
    float _1090 = _1088;
    if (_986)
    {
        float _1092 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1092;
    }
    float _1094 = _998;
    if (!_986)
    {
        _1082 = _976;
    }
    float _1096 = _1082;
    float _1098 = _1096;
    if (_986)
    {
        float _1100 = _976 * _1070;
        _1098 = _1100;
    }
    float _1102 = _1098;
    if (_986)
    {
        float _1104 = _1086 * _1086;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_986)
    {
        float _1108 = fma(_1048, _1042, _1094);
        _1066 = _1108;
    }
    float _1110 = _1066;
    if (!_986)
    {
        _1076 = _980;
    }
    float _1112 = _1076;
    float _1114 = _1112;
    if (_986)
    {
        float _1116 = _1102 * _1102;
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_1110, _1110, _1106);
    float _1124 = _1122 + _1118;
    float _1126 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = rsqrt(_1124);
    float _1138 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1140 = -_1132;
    float _1142 = _1140 + 1.0;
    float _1144 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1146 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1152 = abs(_1142);
    float _1154 = log2(_1152);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1162 = -_1156;
    float _1164 = fma(_1162, _954, 1.0);
    float _1166 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = _1136 * _1086;
    float _1172 = _1136 * _1110;
    float _1174 = _1136 * _1102;
    float _1176 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1184 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1186 = -_1178;
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1186);
    float _1190 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1192 = log2(_1164);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1196 = -_1174;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1188);
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1182);
    float _1204 = _1172 + 1.0;
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = exp2(_1190);
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1214 = 1.0 / _1194;
    float _1216 = fma(_1198, 0.5, 0.5);
    float _1218 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1202);
    float _1220 = _1192 * 0.693147182464599609375;
    float _1222 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = sqrt(_1206);
    float _1230 = -_1172;
    float _1232 = fma(_1210, _1204, _1230);
    float _1234 = fma(_1216, _1222, -0.212114393711090087890625);
    float _1236 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1238 = fma(_1232, 0.5, 0.5);
    float _1240 = fma(_1216, _1234, 1.570728778839111328125);
    float _1242 = _1224 * _1214;
    float _1244 = _1236 * _1214;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1228 * 0.636619746685028076171875;
    float3 _3844 = float3(_1246, _1248, _1226);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3844, float3(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3844, float3(0.0), isnan(_3844)), level(0.0)).x;
    float _1254 = -_1240;
    float _1256 = fma(_1250, _1254, 1.0);
    float3 _3860 = float3(_1246, _1248, _1226);
    float4 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3860, float3(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3860, float3(0.0), isnan(_3860)), level(0.0)).xyzw;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = _1259.w;
    float2 _3877 = float2(_1256, _1238);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3877, float2(0.0), isnan(_3877)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3877, float2(0.0), isnan(_3877)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = in.m_59.y;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1283 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = in.m_51.w;
    bool _1287 = _170 > 0.5;
    float _1289 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_59.x;
    float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1301 = _1299 != 0;
    float _1303 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1289);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1307 = _1305 != 0;
    float _1309 = in.m_61.x;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    bool _1317 = _166 > 0.5;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_63.x = _938;
    out.m_63.y = _936;
    out.m_63.z = _940;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1327 = _1285 > 0.5;
    int _1329 = _1287 ? as_type<int>(_1323) : as_type<int>(_1279);
    float _1331 = in.m_65.x;
    float _1333 = in.m_65.y;
    float _1335 = in.m_65.z;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1339 = _1293 ? as_type<float>(_1329) : _1279;
    float _1341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1345 = _1343 != 0;
    out.m_67.x = _1309;
    int _1347 = _1327 ? as_type<int>(_1323) : as_type<int>(_1279);
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    float _1353 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1355 = _1345 ? as_type<float>(_1347) : _1279;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1359 = _1279;
    bool _1361 = _1345;
    int _1363 = as_type<int>(_1357);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1367 = _1337;
    float _1369 = _1295;
    float _1371 = _1297;
    if (_1307)
    {
        float _1373 = _1317 ? _1323 : _1279;
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1379 = as_type<int>(_1377);
    if (_1301)
    {
        bool _1381 = _176 > 0.5;
        _1361 = _1381;
    }
    bool _1383 = _1361;
    float _1385 = fma(_1357, _1339, -0.5);
    if (_1301)
    {
        float _1387 = -_1295;
        float _1389 = _1387 + 1.0;
        _1363 = as_type<int>(_1389);
    }
    int _1391 = _1363;
    int _1393 = _1391;
    if (!_1301)
    {
        _1365 = _1295;
    }
    float _1395 = _1365;
    float _1397 = fma(_1355, _1377, -0.5);
    bool _1399 = _660 != 0.0;
    bool _1401 = isnan(_660);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    float _1409 = fma(_1337, _1375, -0.5);
    float _1411 = _1395;
    if (_1301)
    {
        float _1413 = _1383 ? as_type<float>(_1391) : _1295;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1313)
    {
        float _1417 = -_1295;
        float _1419 = _1417 + 1.0;
        _1393 = as_type<int>(_1419);
    }
    int _1421 = _1393;
    if (_1351)
    {
        float _1423 = -_1295;
        float _1425 = _1423 + 1.0;
        _1379 = as_type<int>(_1425);
    }
    int _1427 = _1379;
    bool _1429 = _658 == 0.0;
    bool _1431 = !_1407;
    bool _1433 = _1429 && _1431;
    float _1435 = -_430;
    float _1437 = fma(_578, _1385, _1435);
    if (!_1313)
    {
        _1367 = _1295;
    }
    float _1439 = _1367;
    float _1441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1443 = _1439;
    if (_1313)
    {
        float _1445 = _1317 ? as_type<float>(_1421) : _1295;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1351)
    {
        float _1451 = _1287 ? as_type<float>(_1427) : _1295;
        _1369 = _1451;
    }
    float _1453 = _1369;
    float _1455 = -_598;
    float _1457 = fma(_596, _1397, _1455);
    float _1459 = in.m_69.x;
    float _1461 = in.m_69.y;
    float _1463 = in.m_69.z;
    float _1465 = in.m_69.w;
    bool _1467 = _662 == 0.0;
    bool _1469 = _1467 && _1433;
    float _1471 = fma(_1353, _1447, -0.5);
    float _1473 = fma(_1449, _1453, -0.5);
    float _1475 = -_600;
    float _1477 = fma(_594, _1409, _1475);
    float _1479 = exp2(_1283);
    float _1481 = in.m_61.z;
    float _1483 = fma(_588, _1473, _452);
    float _1485 = in.m_61.w;
    float _1487 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = _1441;
    float _1491 = _1331;
    if (_1469)
    {
        _1371 = _1331;
    }
    float _1493 = _1371;
    float _1495 = fma(_1487, _1415, -0.5);
    float _1497 = _1493;
    if (_1469)
    {
        _1489 = _1333;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (!_1469)
    {
        float _1503 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1333);
        _1501 = _1503;
    }
    float _1505 = _1501;
    if (_1469)
    {
        _434 = _1493;
    }
    float _1507 = _434;
    float _1509 = in.m_61.y;
    float _1511 = _1507;
    if (!_1469)
    {
        _1497 = _1331;
    }
    float _1513 = _1497;
    float _1515 = -_1479;
    float _1517 = _1515 + 1.0;
    if (_1469)
    {
        _1491 = _1335;
    }
    float _1519 = _1491;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1335);
        _1521 = _1523;
    }
    float _1525 = _1521;
    float _1527 = fma(_416, _1471, _440);
    if (!_1469)
    {
        float _1529 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1463 * _1513;
    float _1535 = fma(_570, _1495, _444);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1539 = _1459 * _1333;
    float _1541 = _1461 * _1335;
    float _1543 = -_1533;
    float _1545 = fma(_1459, _1335, _1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1549 = -_1539;
    float _1551 = fma(_1461, _1513, _1549);
    float _1553 = -_1541;
    float _1555 = fma(_1463, _1333, _1553);
    float _1557 = _1545 * _1465;
    out.m_71.w = _1537;
    float _1559 = _1551 * _1465;
    float _1561 = -_1505;
    float _1563 = _762 * _1561;
    float _1565 = _1437 + 0.5;
    out.m_73.w = _1547;
    float _1567 = _1535 + 0.5;
    float _1569 = _1527 + 0.5;
    float _1571 = fma(_780, _1531, _1563);
    float _1573 = _1457 + 0.5;
    float _1575 = _1555 * _1465;
    float _1577 = -_1557;
    float _1579 = _762 * _1577;
    float _1581 = _778 * _1505;
    float _1583 = -_1461;
    float _1585 = _762 * _1583;
    out.m_75.x = _1567;
    out.m_75.y = _1565;
    out.m_75.z = _1569;
    out.m_75.w = _1573;
    float _1587 = fma(_784, _1525, _1571);
    float _1589 = fma(_802, _1531, _1581);
    float _1591 = fma(_780, _1459, _1585);
    float _1593 = fma(_780, _1575, _1579);
    float _1595 = _778 * _1461;
    float _1597 = _782 * _1461;
    float _1599 = fma(_784, _1463, _1591);
    float _1601 = fma(_800, _1525, _1589);
    float _1603 = fma(_802, _1459, _1595);
    float _1605 = fma(_796, _1459, _1597);
    float _1607 = fma(_784, _1559, _1593);
    float _1609 = _1483 + 0.5;
    float _1611 = fma(_800, _1463, _1603);
    float _1613 = _778 * _1557;
    float _1615 = _782 * _1505;
    float _1617 = _782 * _1557;
    float _1619 = fma(_806, _1463, _1605);
    float _1621 = fma(_802, _1575, _1613);
    float _1623 = fma(_796, _1531, _1615);
    float _1625 = fma(_796, _1575, _1617);
    float _1627 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1629 = fma(_800, _1559, _1621);
    float _1631 = fma(_806, _1525, _1623);
    float _1633 = fma(_806, _1559, _1625);
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1641 = _1477 + 0.5;
    float _1643 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1627);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1649 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1639);
    out.m_77.x = _1609;
    out.m_77.y = _1641;
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1653 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1655 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1657 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1651);
    float _1663 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_67.y = _1509;
    float _1665 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1667 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    float _1669 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1647);
    float _1671 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1673 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1675 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1665);
    float _1677 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1661);
    out.m_79.x = _1659;
    out.m_79.y = _1667;
    out.m_79.z = _1669;
    float _1679 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1681 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1671);
    float _1683 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1653);
    float _1685 = _1673 + _1194;
    float _1687 = _1224 + _1194;
    float _1689 = _1194 * 0.5;
    float _1691 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1693 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1683);
    float _1695 = _1685 * 0.5;
    float _1697 = _1687 * 0.5;
    float _1699 = fma(_1236, -0.5, _1689);
    float _1701 = -_1657;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1679);
    float _1707 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    out.m_67.z = _1481;
    bool _1709 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_970);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    out.m_67.w = _1485;
    out.m_81.x = _1655;
    out.m_81.y = _1691;
    out.m_81.z = _1693;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1194;
    float _1719 = _1669;
    float _1721 = _1667;
    float _1723 = _1703;
    if (!_1717)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1725 = _1719;
    out.m_83.x = _1697;
    out.m_83.y = _1699;
    out.m_83.z = _1695;
    out.m_83.w = _1194;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1717)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1721;
    out.m_85.x = _1677;
    out.m_85.y = _1705;
    out.m_85.z = _1707;
    float _1733 = _1657 * _1252;
    float _1735 = _1267 * _1733;
    float _1737 = _1267 * _1703;
    float _1739 = _1731;
    float _1741 = _1731;
    if (!_1717)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1743 = _1723;
    float _1745 = _1277 * _1733;
    float _1747 = fma(_1273, _1735, _1261);
    float _1749 = fma(_1275, _1735, _1263);
    float _1751 = fma(_1267, _1745, _1265);
    out.m_87.x = _1747;
    out.m_87.y = _1749;
    out.m_87.z = _1751;
    out.m_87.w = _1737;
    bool _1753 = !_1717;
    float _1755 = _1743;
    float _1757 = _1743;
    if (!_1753)
    {
        bool _1759 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1761 = isnan(_970);
        bool _1763 = _1759 || _1761;
        bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1767 = _1763 || _1765;
        if (!_1767)
        {
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1771 = _970 + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = 1.0 / _1775;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1791 = _1771 * _1785;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = fma(_1793, _1779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1799 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1741 = _1797;
            _1729 = _1795;
            _1757 = _1799;
            _1801 = true;
        }
        else
        {
            bool _1803 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1805 = isnan(_970);
            bool _1807 = _1803 || _1805;
            bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1811 = _1807 || _1809;
            if (!_1811)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1813 = _1727;
            _1729 = _1813;
            if (!_1811)
            {
                _1739 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1815 = _1739;
            _1741 = _1815;
            if (!_1811)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1817 = _1755;
            bool _1819 = !_1811;
            _1757 = _1817;
            if (!_1819)
            {
                bool _1821 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1823 = isnan(_970);
                bool _1825 = _1821 || _1823;
                bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1829 = _1825 || _1827;
                if (!_1829)
                {
                    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1833 = _970 + _1831;
                    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1835;
                    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1847 = 1.0 / _1837;
                    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1853 = _1833 * _1847;
                    float _1855 = precise::clamp(_1853, 0.0, 1.0);
                    float _1857 = fma(_1855, _1841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1859 = fma(_1855, _1845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1861 = fma(_1855, _1851, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1741 = _1859;
                    _1729 = _1857;
                    _1757 = _1861;
                    _1801 = true;
                }
                else
                {
                    _1741 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1801 = false;
    float _1863 = _1741;
    float _1865 = _1729;
    float _1867 = _1757;
    float _1869 = _1863 * 0.586610972881317138671875;
    bool _1871 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _1873 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1873);
    float _1877 = -_1875;
    float _1879 = _1877 + _1865;
    float _1881 = -_1875;
    float _1883 = _1881 + _1863;
    float _1885 = -_1875;
    float _1887 = _1885 + _1867;
    float _1889 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_47.x = _1889;
    out.m_91.x = _1891;
    out.m_91.y = _1893;
    out.m_91.z = _1895;
    if (!_1871)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1897 = -_936;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_938;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_940;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1705 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1677, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1707, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1973;
    out.m_89.y = _1975;
    out.m_89.z = _1977;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1801 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2036 = as_type<float>(_128);
        out.gl_Position.z = _2036;
    }
    if (!_114)
    {
        return out;
    }
    float _132 = in.m_49.w;
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
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_47.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_164);
        out.gl_Position.z = _2105;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_51.z;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_51.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_51.x;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _166 * 2.0;
    float _188 = floor(_186);
    float _190 = _170 * 2.0;
    float _192 = _170 + _166;
    float _194 = _176 * 2.0;
    float _196 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _192 + (-1.0);
    float _200 = floor(_190);
    float _202 = _170 + _176;
    float _204 = -_178;
    float _206 = fma(_196, 2.0, _204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _202 + (-1.0);
    float _212 = fma(_208, -2.0, _180);
    float _214 = floor(_194);
    bool _216 = _188 >= 0.0;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _228 = _188 > 0.0;
    float _230 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _232 = _224 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    float _244 = _198;
    float _246 = _188;
    float _248 = _168;
    if (_174)
    {
        _244 = _176;
    }
    float _250 = _244;
    bool _252 = _200 > 0.0;
    bool _254 = _200 >= 0.0;
    bool _256 = isnan(_200);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = _250;
    if (!_174)
    {
        _246 = _170;
    }
    float _266 = _246;
    float _268 = _266;
    if (!_174)
    {
        _264 = _166;
    }
    float _270 = _264;
    float _272 = 0.0;
    if (!_242)
    {
        float _274 = _168 * _168;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    float _280 = _278;
    if (_174)
    {
        _268 = _176;
    }
    float _282 = _268;
    bool _284 = _214 > 0.0;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _288 = _214 >= 0.0;
    bool _290 = isnan(_214);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _300 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _302 = ~_232;
    int _304 = _302 + 1;
    int _306 = _304 + 1;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _286);
    float _310 = -_184;
    float _312 = fma(_298, 2.0, _310);
    float _314 = -_182;
    float _316 = fma(_300, 2.0, _314);
    int _318 = _306;
    float _320 = _300;
    float _322 = _298;
    float _324 = _282;
    if (!_228)
    {
        int _326 = ~_232;
        int _328 = _326 + 1;
        _318 = _328;
    }
    int _330 = _318;
    if (!_242)
    {
        float _332 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _332;
    }
    float _334 = _280;
    bool _336 = !_242;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _168 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _168);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _354;
        _322 = _346;
        _324 = _356;
        _338 = _368;
    }
    float _370 = _320;
    float _372 = _322;
    float _374 = _324;
    float _376 = _338;
    bool _378 = !_242;
    float _380 = _370;
    float _382 = _372;
    float _384 = _374;
    if (!_378)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = 1.0 / _392;
        float _396 = _168 * _388;
        float _398 = exp2(_396);
        float _400 = -_398;
        float _402 = _400 + 1.0;
        float _404 = _402 * _394;
        _380 = _398;
        _248 = _404;
    }
    float _406 = _380;
    float _408 = _248;
    float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _412 = log2(_410);
    int _414 = _296 ? 0 : 1;
    float _416 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _212);
    float _432 = _406;
    float _434 = _430;
    if (!_174)
    {
        _382 = _166;
    }
    float _436 = _382;
    float _438 = -_146;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[81].x, _316);
    float _442 = -_146;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    bool _446 = !_420;
    int _448 = _446 ? 0 : 1;
    float _450 = -_146;
    float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[86].x, _312);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _456 = _436;
    if (_174)
    {
        _456 = _170;
    }
    float _458 = _456;
    if (_174)
    {
        _432 = _170;
    }
    float _460 = _432;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _464 = _460;
    if (!_174)
    {
        _464 = _176;
    }
    float _466 = _464;
    int _468 = abs(_448);
    float _470 = _458 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_174)
    {
        _384 = _166;
    }
    float _472 = _384;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _476 = _472;
    if (_174)
    {
        _476 = _170;
    }
    float _478 = _476;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = float(_330);
    float _484 = _412 * _146;
    float _486 = float(_468);
    float _488 = fma(_470, -2.0, _462);
    float _490 = fma(_474, -2.0, _454);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = _486 * _482;
    float _502 = exp2(_484);
    float _504 = _500 * (-2.0);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _512 = ~_414;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _508);
    bool _524 = !_424;
    int _526 = _524 ? 0 : 1;
    float _528 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _510);
    float _530 = 1.0 / _520;
    bool _532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(1.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = -_502;
    float _544 = _542 + 1.0;
    int _546 = _516;
    if (!_284)
    {
        int _548 = ~_414;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _556 = abs(_526);
    float _558 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _506);
    bool _560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    float _572 = float(_552);
    float _574 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _554);
    float _576 = float(_556);
    float _578 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    float _580 = _568 ? _544 : 0.0;
    float _582 = fma(_504, _494, _494);
    float _584 = fma(_226, _504, _226);
    float _586 = _576 * _572;
    float _588 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _528);
    bool _590 = !_428;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _574);
    float _596 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _492);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _488);
    float _600 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    if (_540)
    {
        float _602 = _580 * _530;
        _148 = _602;
    }
    float _604 = _148;
    float _606 = _176 + (-0.5);
    int _608 = _262 ? 0 : 1;
    float _610 = _586 * (-2.0);
    int _612 = abs(_592);
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _582);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_610, _496, _496);
    int _624 = _620;
    if (!_252)
    {
        int _626 = ~_608;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_584, _604, _614);
    float _634 = fma(_230, _610, _230);
    float _636 = _170 + (-0.5);
    float _638 = float(_630);
    float _640 = _176 + _166;
    float _642 = float(_612);
    float _644 = in.m_55.x;
    float _646 = in.m_55.y;
    float _648 = in.m_55.z;
    float _650 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _622);
    float _652 = _632 * 0.15915493667125701904296875;
    float _654 = _642 * _638;
    float _656 = _640 + (-1.0);
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = fma(_634, _604, _650);
    float _666 = _654 * (-2.0);
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _670 = _166 + (-0.5);
    float _672 = _664 * 0.15915493667125701904296875;
    float _674 = fma(_666, _498, _498);
    float _676 = fma(_668, _666, _668);
    float _678 = in.m_55.w;
    float _680 = _652 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].z, _674);
    float _686 = in.m_49.x;
    float _688 = in.m_49.y;
    float _690 = in.m_49.z;
    float _692 = fma(_676, _604, _684);
    float _694 = in.m_44.x;
    float _696 = in.m_44.y;
    float _698 = in.m_44.z;
    float _700 = _652 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _644 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = _692 * 0.15915493667125701904296875;
    float _708 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _712 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _672 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _726 = _672 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _722 * _712;
    float _732 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = _724 * _716;
    float _736 = fma(_408, _688, _714);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _740 = fma(_408, _690, _732);
    float _742 = _706 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = fma(_736, _678, _696);
    float _752 = fma(_740, _678, _698);
    float _754 = _738 * _746;
    float _756 = fma(_408, _686, _748);
    float _758 = _682 * _720;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _682 * _728;
    float _766 = fma(_756, _678, _694);
    float _768 = _702 * _720;
    float _770 = _702 * _728;
    float _772 = _750 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _774 = _750 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _750 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _702 * _744;
    float _780 = _728 * _744;
    float _782 = _682 * _744;
    float _784 = _720 * _744;
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _772);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _790 = _782 * _734;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _794 = -_768;
    float _796 = fma(_762, _764, _794);
    float _798 = -_764;
    float _800 = fma(_762, _768, _798);
    float _802 = fma(_762, _770, _758);
    float _804 = _778 * _734;
    float _806 = fma(_762, _758, _770);
    float _808 = -_734;
    float _810 = _762 * _808;
    float _812 = fma(_796, _730, _790);
    float _814 = fma(_802, _730, _804);
    float _816 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _818 = fma(_780, _730, _810);
    float _820 = fma(_806, _754, _812);
    float _822 = fma(_800, _754, _814);
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _826 = fma(_784, _754, _818);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].x, _830);
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].x, _836);
    float _844 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].z, _838);
    float _846 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _848 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[9].z, _842);
    float _850 = _844 + _828;
    float _852 = _846 + _834;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _868 = sqrt(_864);
    float _870 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _872 = _848 + _870;
    bool _874 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = _870;
    float _878 = _826;
    float _880 = _848;
    float _882 = _820;
    float _884 = _734;
    if (!_874)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_874)
    {
        _878 = _850;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_874)
    {
        _880 = _872;
    }
    float _894 = _880;
    bool _896 = !_874;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _868 + _902;
        float _906 = rsqrt(_864);
        float _908 = _904 * _900;
        float _910 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_872, _916, _924);
        float _930 = _906 * _926;
        float _932 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _888 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _888;
    float _940 = _892;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _940 + _950;
    float _954 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _956 = _944 * _944;
    float _958 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_948, _948, _956);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _964 = fma(_952, _952, _960);
    float _966 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _962);
    float _968 = rsqrt(_964);
    float _970 = sqrt(_964);
    float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _948 * _972;
    float _976 = _952 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _968;
    float _994 = _990;
    float _996 = _944;
    float _998 = _972;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (_986)
    {
        float _1006 = _990 * _1002;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_986)
    {
        float _1010 = rsqrt(_982);
        _1004 = _1010;
    }
    float _1012 = _1004;
    float _1014 = _1012;
    if (_986)
    {
        float _1016 = _1008 * 0.15915493667125701904296875;
        _882 = _1016;
    }
    float _1018 = _882;
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1022 = _952;
    if (_986)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1022 = _1026;
    }
    float _1028 = _1022;
    float _1030 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1032 = precise::max(0.0, _1020);
    float _1034 = _752;
    float _1036 = _1032;
    if (_986)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = -_972;
    float _1046 = -_1032;
    float _1048 = fma(_944, _1044, _1046);
    if (_986)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1028;
    float _1056 = _1052;
    if (_986)
    {
        float _1058 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_986)
    {
        _1056 = _1048;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    if (_986)
    {
        float _1068 = _1012 * _1060;
        _884 = _1068;
    }
    float _1070 = _884;
    if (!_986)
    {
        _1014 = _974;
    }
    float _1072 = _1014;
    float _1074 = _1072;
    float _1076 = _1042;
    if (_986)
    {
        float _1078 = _1042 + (-1.0);
        _1036 = _1078;
    }
    float _1080 = _1036;
    float _1082 = _1080;
    if (_986)
    {
        float _1084 = _974 * _1070;
        _1074 = _1084;
    }
    float _1086 = _1074;
    if (!_986)
    {
        _1062 = _978;
    }
    float _1088 = _1062;
    float _1090 = _1088;
    if (_986)
    {
        float _1092 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1092;
    }
    float _1094 = _998;
    if (!_986)
    {
        _1082 = _976;
    }
    float _1096 = _1082;
    float _1098 = _1096;
    if (_986)
    {
        float _1100 = _976 * _1070;
        _1098 = _1100;
    }
    float _1102 = _1098;
    if (_986)
    {
        float _1104 = _1086 * _1086;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_986)
    {
        float _1108 = fma(_1048, _1042, _1094);
        _1066 = _1108;
    }
    float _1110 = _1066;
    if (!_986)
    {
        _1076 = _980;
    }
    float _1112 = _1076;
    float _1114 = _1112;
    if (_986)
    {
        float _1116 = _1102 * _1102;
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_1110, _1110, _1106);
    float _1124 = _1122 + _1118;
    float _1126 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = rsqrt(_1124);
    float _1138 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1140 = -_1132;
    float _1142 = _1140 + 1.0;
    float _1144 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1146 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1152 = abs(_1142);
    float _1154 = log2(_1152);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1162 = -_1156;
    float _1164 = fma(_1162, _954, 1.0);
    float _1166 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = _1136 * _1086;
    float _1172 = _1136 * _1110;
    float _1174 = _1136 * _1102;
    float _1176 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1184 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1186 = -_1178;
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1186);
    float _1190 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1192 = log2(_1164);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1196 = -_1174;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1188);
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1182);
    float _1204 = _1172 + 1.0;
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = exp2(_1190);
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1214 = 1.0 / _1194;
    float _1216 = fma(_1198, 0.5, 0.5);
    float _1218 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1202);
    float _1220 = _1192 * 0.693147182464599609375;
    float _1222 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = sqrt(_1206);
    float _1230 = -_1172;
    float _1232 = fma(_1210, _1204, _1230);
    float _1234 = fma(_1216, _1222, -0.212114393711090087890625);
    float _1236 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1238 = fma(_1232, 0.5, 0.5);
    float _1240 = fma(_1216, _1234, 1.570728778839111328125);
    float _1242 = _1224 * _1214;
    float _1244 = _1236 * _1214;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1228 * 0.636619746685028076171875;
    float3 _3844 = float3(_1246, _1248, _1226);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3844, float3(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3844, float3(0.0), isnan(_3844)), level(0.0)).x;
    float _1254 = -_1240;
    float _1256 = fma(_1250, _1254, 1.0);
    float3 _3860 = float3(_1246, _1248, _1226);
    float4 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3860, float3(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3860, float3(0.0), isnan(_3860)), level(0.0)).xyzw;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = _1259.w;
    float2 _3877 = float2(_1256, _1238);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3877, float2(0.0), isnan(_3877)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3877, float2(0.0), isnan(_3877)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = in.m_59.y;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1283 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = in.m_51.w;
    bool _1287 = _170 > 0.5;
    float _1289 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_59.x;
    float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1301 = _1299 != 0;
    float _1303 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1289);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1307 = _1305 != 0;
    float _1309 = in.m_61.x;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    bool _1317 = _166 > 0.5;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_63.x = _938;
    out.m_63.y = _936;
    out.m_63.z = _940;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1327 = _1285 > 0.5;
    int _1329 = _1287 ? as_type<int>(_1323) : as_type<int>(_1279);
    float _1331 = in.m_65.x;
    float _1333 = in.m_65.y;
    float _1335 = in.m_65.z;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1339 = _1293 ? as_type<float>(_1329) : _1279;
    float _1341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1345 = _1343 != 0;
    out.m_67.x = _1309;
    int _1347 = _1327 ? as_type<int>(_1323) : as_type<int>(_1279);
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    float _1353 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1355 = _1345 ? as_type<float>(_1347) : _1279;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1359 = _1279;
    bool _1361 = _1345;
    int _1363 = as_type<int>(_1357);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1367 = _1337;
    float _1369 = _1295;
    float _1371 = _1297;
    if (_1307)
    {
        float _1373 = _1317 ? _1323 : _1279;
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1379 = as_type<int>(_1377);
    if (_1301)
    {
        bool _1381 = _176 > 0.5;
        _1361 = _1381;
    }
    bool _1383 = _1361;
    float _1385 = fma(_1357, _1339, -0.5);
    if (_1301)
    {
        float _1387 = -_1295;
        float _1389 = _1387 + 1.0;
        _1363 = as_type<int>(_1389);
    }
    int _1391 = _1363;
    int _1393 = _1391;
    if (!_1301)
    {
        _1365 = _1295;
    }
    float _1395 = _1365;
    float _1397 = fma(_1355, _1377, -0.5);
    bool _1399 = _660 != 0.0;
    bool _1401 = isnan(_660);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    float _1409 = fma(_1337, _1375, -0.5);
    float _1411 = _1395;
    if (_1301)
    {
        float _1413 = _1383 ? as_type<float>(_1391) : _1295;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1313)
    {
        float _1417 = -_1295;
        float _1419 = _1417 + 1.0;
        _1393 = as_type<int>(_1419);
    }
    int _1421 = _1393;
    if (_1351)
    {
        float _1423 = -_1295;
        float _1425 = _1423 + 1.0;
        _1379 = as_type<int>(_1425);
    }
    int _1427 = _1379;
    bool _1429 = _658 == 0.0;
    bool _1431 = !_1407;
    bool _1433 = _1429 && _1431;
    float _1435 = -_430;
    float _1437 = fma(_578, _1385, _1435);
    if (!_1313)
    {
        _1367 = _1295;
    }
    float _1439 = _1367;
    float _1441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1443 = _1439;
    if (_1313)
    {
        float _1445 = _1317 ? as_type<float>(_1421) : _1295;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1351)
    {
        float _1451 = _1287 ? as_type<float>(_1427) : _1295;
        _1369 = _1451;
    }
    float _1453 = _1369;
    float _1455 = -_598;
    float _1457 = fma(_596, _1397, _1455);
    float _1459 = in.m_69.x;
    float _1461 = in.m_69.y;
    float _1463 = in.m_69.z;
    float _1465 = in.m_69.w;
    bool _1467 = _662 == 0.0;
    bool _1469 = _1467 && _1433;
    float _1471 = fma(_1353, _1447, -0.5);
    float _1473 = fma(_1449, _1453, -0.5);
    float _1475 = -_600;
    float _1477 = fma(_594, _1409, _1475);
    float _1479 = exp2(_1283);
    float _1481 = in.m_61.z;
    float _1483 = fma(_588, _1473, _452);
    float _1485 = in.m_61.w;
    float _1487 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = _1441;
    float _1491 = _1331;
    if (_1469)
    {
        _1371 = _1331;
    }
    float _1493 = _1371;
    float _1495 = fma(_1487, _1415, -0.5);
    float _1497 = _1493;
    if (_1469)
    {
        _1489 = _1333;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (!_1469)
    {
        float _1503 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1333);
        _1501 = _1503;
    }
    float _1505 = _1501;
    if (_1469)
    {
        _434 = _1493;
    }
    float _1507 = _434;
    float _1509 = in.m_61.y;
    float _1511 = _1507;
    if (!_1469)
    {
        _1497 = _1331;
    }
    float _1513 = _1497;
    float _1515 = -_1479;
    float _1517 = _1515 + 1.0;
    if (_1469)
    {
        _1491 = _1335;
    }
    float _1519 = _1491;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1335);
        _1521 = _1523;
    }
    float _1525 = _1521;
    float _1527 = fma(_416, _1471, _440);
    if (!_1469)
    {
        float _1529 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1463 * _1513;
    float _1535 = fma(_570, _1495, _444);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1539 = _1459 * _1333;
    float _1541 = _1461 * _1335;
    float _1543 = -_1533;
    float _1545 = fma(_1459, _1335, _1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1549 = -_1539;
    float _1551 = fma(_1461, _1513, _1549);
    float _1553 = -_1541;
    float _1555 = fma(_1463, _1333, _1553);
    float _1557 = _1545 * _1465;
    out.m_71.w = _1537;
    float _1559 = _1551 * _1465;
    float _1561 = -_1505;
    float _1563 = _762 * _1561;
    float _1565 = _1437 + 0.5;
    out.m_73.w = _1547;
    float _1567 = _1535 + 0.5;
    float _1569 = _1527 + 0.5;
    float _1571 = fma(_780, _1531, _1563);
    float _1573 = _1457 + 0.5;
    float _1575 = _1555 * _1465;
    float _1577 = -_1557;
    float _1579 = _762 * _1577;
    float _1581 = _778 * _1505;
    float _1583 = -_1461;
    float _1585 = _762 * _1583;
    out.m_75.x = _1567;
    out.m_75.y = _1565;
    out.m_75.z = _1569;
    out.m_75.w = _1573;
    float _1587 = fma(_784, _1525, _1571);
    float _1589 = fma(_802, _1531, _1581);
    float _1591 = fma(_780, _1459, _1585);
    float _1593 = fma(_780, _1575, _1579);
    float _1595 = _778 * _1461;
    float _1597 = _782 * _1461;
    float _1599 = fma(_784, _1463, _1591);
    float _1601 = fma(_800, _1525, _1589);
    float _1603 = fma(_802, _1459, _1595);
    float _1605 = fma(_796, _1459, _1597);
    float _1607 = fma(_784, _1559, _1593);
    float _1609 = _1483 + 0.5;
    float _1611 = fma(_800, _1463, _1603);
    float _1613 = _778 * _1557;
    float _1615 = _782 * _1505;
    float _1617 = _782 * _1557;
    float _1619 = fma(_806, _1463, _1605);
    float _1621 = fma(_802, _1575, _1613);
    float _1623 = fma(_796, _1531, _1615);
    float _1625 = fma(_796, _1575, _1617);
    float _1627 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1629 = fma(_800, _1559, _1621);
    float _1631 = fma(_806, _1525, _1623);
    float _1633 = fma(_806, _1559, _1625);
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1641 = _1477 + 0.5;
    float _1643 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1627);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1649 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1639);
    out.m_77.x = _1609;
    out.m_77.y = _1641;
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1653 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1655 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1657 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1651);
    float _1663 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_67.y = _1509;
    float _1665 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1667 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    float _1669 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1647);
    float _1671 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1673 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1675 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1665);
    float _1677 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1661);
    out.m_79.x = _1659;
    out.m_79.y = _1667;
    out.m_79.z = _1669;
    float _1679 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1681 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1671);
    float _1683 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1653);
    float _1685 = _1673 + _1194;
    float _1687 = _1224 + _1194;
    float _1689 = _1194 * 0.5;
    float _1691 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1693 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1683);
    float _1695 = _1685 * 0.5;
    float _1697 = _1687 * 0.5;
    float _1699 = fma(_1236, -0.5, _1689);
    float _1701 = -_1657;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1679);
    float _1707 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    out.m_67.z = _1481;
    bool _1709 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_970);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    out.m_67.w = _1485;
    out.m_81.x = _1655;
    out.m_81.y = _1691;
    out.m_81.z = _1693;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1194;
    float _1719 = _1669;
    float _1721 = _1667;
    float _1723 = _1703;
    if (!_1717)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1725 = _1719;
    out.m_83.x = _1697;
    out.m_83.y = _1699;
    out.m_83.z = _1695;
    out.m_83.w = _1194;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1717)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1721;
    out.m_85.x = _1677;
    out.m_85.y = _1705;
    out.m_85.z = _1707;
    float _1733 = _1657 * _1252;
    float _1735 = _1267 * _1733;
    float _1737 = _1267 * _1703;
    float _1739 = _1731;
    float _1741 = _1731;
    if (!_1717)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1743 = _1723;
    float _1745 = _1277 * _1733;
    float _1747 = fma(_1273, _1735, _1261);
    float _1749 = fma(_1275, _1735, _1263);
    float _1751 = fma(_1267, _1745, _1265);
    out.m_87.x = _1747;
    out.m_87.y = _1749;
    out.m_87.z = _1751;
    out.m_87.w = _1737;
    bool _1753 = !_1717;
    float _1755 = _1743;
    float _1757 = _1743;
    if (!_1753)
    {
        bool _1759 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1761 = isnan(_970);
        bool _1763 = _1759 || _1761;
        bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1767 = _1763 || _1765;
        if (!_1767)
        {
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1771 = _970 + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = 1.0 / _1775;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1791 = _1771 * _1785;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = fma(_1793, _1779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1799 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1741 = _1797;
            _1729 = _1795;
            _1757 = _1799;
            _1801 = true;
        }
        else
        {
            bool _1803 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1805 = isnan(_970);
            bool _1807 = _1803 || _1805;
            bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1811 = _1807 || _1809;
            if (!_1811)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1813 = _1727;
            _1729 = _1813;
            if (!_1811)
            {
                _1739 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1815 = _1739;
            _1741 = _1815;
            if (!_1811)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1817 = _1755;
            bool _1819 = !_1811;
            _1757 = _1817;
            if (!_1819)
            {
                bool _1821 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1823 = isnan(_970);
                bool _1825 = _1821 || _1823;
                bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1829 = _1825 || _1827;
                if (!_1829)
                {
                    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1833 = _970 + _1831;
                    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1835;
                    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1847 = 1.0 / _1837;
                    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1853 = _1833 * _1847;
                    float _1855 = precise::clamp(_1853, 0.0, 1.0);
                    float _1857 = fma(_1855, _1841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1859 = fma(_1855, _1845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1861 = fma(_1855, _1851, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1741 = _1859;
                    _1729 = _1857;
                    _1757 = _1861;
                    _1801 = true;
                }
                else
                {
                    _1741 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1801 = false;
    float _1863 = _1741;
    float _1865 = _1729;
    float _1867 = _1757;
    float _1869 = _1863 * 0.586610972881317138671875;
    bool _1871 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _1873 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1873);
    float _1877 = -_1875;
    float _1879 = _1877 + _1865;
    float _1881 = -_1875;
    float _1883 = _1881 + _1863;
    float _1885 = -_1875;
    float _1887 = _1885 + _1867;
    float _1889 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_47.x = _1889;
    out.m_91.x = _1891;
    out.m_91.y = _1893;
    out.m_91.z = _1895;
    if (!_1871)
    {
        return out;
    }
    float _1897 = -_936;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_938;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_940;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1705 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1677, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1707, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1973;
    out.m_89.y = _1975;
    out.m_89.z = _1977;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1801 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_47.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2036 = as_type<float>(_128);
        out.gl_Position.z = _2036;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_49.w;
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
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_47.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_164);
        out.gl_Position.z = _2105;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_51.z;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_51.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _174 = _172 != 0;
    float _176 = in.m_51.x;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _166 * 2.0;
    float _188 = floor(_186);
    float _190 = _170 * 2.0;
    float _192 = _170 + _166;
    float _194 = _176 * 2.0;
    float _196 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _198 = _192 + (-1.0);
    float _200 = floor(_190);
    float _202 = _170 + _176;
    float _204 = -_178;
    float _206 = fma(_196, 2.0, _204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _210 = _202 + (-1.0);
    float _212 = fma(_208, -2.0, _180);
    float _214 = floor(_194);
    bool _216 = _188 >= 0.0;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _228 = _188 > 0.0;
    float _230 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _232 = _224 ? 0 : 1;
    bool _234 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    float _244 = _198;
    float _246 = _188;
    float _248 = _168;
    if (_174)
    {
        _244 = _176;
    }
    float _250 = _244;
    bool _252 = _200 > 0.0;
    bool _254 = _200 >= 0.0;
    bool _256 = isnan(_200);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = _250;
    if (!_174)
    {
        _246 = _170;
    }
    float _266 = _246;
    float _268 = _266;
    if (!_174)
    {
        _264 = _166;
    }
    float _270 = _264;
    float _272 = 0.0;
    if (!_242)
    {
        float _274 = _168 * _168;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    float _280 = _278;
    if (_174)
    {
        _268 = _176;
    }
    float _282 = _268;
    bool _284 = _214 > 0.0;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _288 = _214 >= 0.0;
    bool _290 = isnan(_214);
    bool _292 = _288 || _290;
    bool _294 = isnan(0.0);
    bool _296 = _292 || _294;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _300 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _302 = ~_232;
    int _304 = _302 + 1;
    int _306 = _304 + 1;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _286);
    float _310 = -_184;
    float _312 = fma(_298, 2.0, _310);
    float _314 = -_182;
    float _316 = fma(_300, 2.0, _314);
    int _318 = _306;
    float _320 = _300;
    float _322 = _298;
    float _324 = _282;
    if (!_228)
    {
        int _326 = ~_232;
        int _328 = _326 + 1;
        _318 = _328;
    }
    int _330 = _318;
    if (!_242)
    {
        float _332 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _332;
    }
    float _334 = _280;
    bool _336 = !_242;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _168 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _168);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _354;
        _322 = _346;
        _324 = _356;
        _338 = _368;
    }
    float _370 = _320;
    float _372 = _322;
    float _374 = _324;
    float _376 = _338;
    bool _378 = !_242;
    float _380 = _370;
    float _382 = _372;
    float _384 = _374;
    if (!_378)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = 1.0 / _392;
        float _396 = _168 * _388;
        float _398 = exp2(_396);
        float _400 = -_398;
        float _402 = _400 + 1.0;
        float _404 = _402 * _394;
        _380 = _398;
        _248 = _404;
    }
    float _406 = _380;
    float _408 = _248;
    float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _412 = log2(_410);
    int _414 = _296 ? 0 : 1;
    float _416 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _212);
    float _432 = _406;
    float _434 = _430;
    if (!_174)
    {
        _382 = _166;
    }
    float _436 = _382;
    float _438 = -_146;
    float _440 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[81].x, _316);
    float _442 = -_146;
    float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[76].x, _206);
    bool _446 = !_420;
    int _448 = _446 ? 0 : 1;
    float _450 = -_146;
    float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[86].x, _312);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _456 = _436;
    if (_174)
    {
        _456 = _170;
    }
    float _458 = _456;
    if (_174)
    {
        _432 = _170;
    }
    float _460 = _432;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _464 = _460;
    if (!_174)
    {
        _464 = _176;
    }
    float _466 = _464;
    int _468 = abs(_448);
    float _470 = _458 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_174)
    {
        _384 = _166;
    }
    float _472 = _384;
    float _474 = _466 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _476 = _472;
    if (_174)
    {
        _476 = _170;
    }
    float _478 = _476;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = float(_330);
    float _484 = _412 * _146;
    float _486 = float(_468);
    float _488 = fma(_470, -2.0, _462);
    float _490 = fma(_474, -2.0, _454);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = _486 * _482;
    float _502 = exp2(_484);
    float _504 = _500 * (-2.0);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _512 = ~_414;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _508);
    bool _524 = !_424;
    int _526 = _524 ? 0 : 1;
    float _528 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _510);
    float _530 = 1.0 / _520;
    bool _532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(1.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = -_502;
    float _544 = _542 + 1.0;
    int _546 = _516;
    if (!_284)
    {
        int _548 = ~_414;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _556 = abs(_526);
    float _558 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _506);
    bool _560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _568 = _564 || _566;
    float _570 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _522);
    float _572 = float(_552);
    float _574 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _554);
    float _576 = float(_556);
    float _578 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    float _580 = _568 ? _544 : 0.0;
    float _582 = fma(_504, _494, _494);
    float _584 = fma(_226, _504, _226);
    float _586 = _576 * _572;
    float _588 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _528);
    bool _590 = !_428;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _574);
    float _596 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _492);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _488);
    float _600 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    if (_540)
    {
        float _602 = _580 * _530;
        _148 = _602;
    }
    float _604 = _148;
    float _606 = _176 + (-0.5);
    int _608 = _262 ? 0 : 1;
    float _610 = _586 * (-2.0);
    int _612 = abs(_592);
    float _614 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _582);
    int _616 = ~_608;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_610, _496, _496);
    int _624 = _620;
    if (!_252)
    {
        int _626 = ~_608;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_584, _604, _614);
    float _634 = fma(_230, _610, _230);
    float _636 = _170 + (-0.5);
    float _638 = float(_630);
    float _640 = _176 + _166;
    float _642 = float(_612);
    float _644 = in.m_55.x;
    float _646 = in.m_55.y;
    float _648 = in.m_55.z;
    float _650 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[196].y, _622);
    float _652 = _632 * 0.15915493667125701904296875;
    float _654 = _642 * _638;
    float _656 = _640 + (-1.0);
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = fma(_634, _604, _650);
    float _666 = _654 * (-2.0);
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _670 = _166 + (-0.5);
    float _672 = _664 * 0.15915493667125701904296875;
    float _674 = fma(_666, _498, _498);
    float _676 = fma(_668, _666, _668);
    float _678 = in.m_55.w;
    float _680 = _652 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[196].z, _674);
    float _686 = in.m_49.x;
    float _688 = in.m_49.y;
    float _690 = in.m_49.z;
    float _692 = fma(_676, _604, _684);
    float _694 = in.m_44.x;
    float _696 = in.m_44.y;
    float _698 = in.m_44.z;
    float _700 = _652 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = _644 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _706 = _692 * 0.15915493667125701904296875;
    float _708 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _710 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _712 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _718 = _672 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _726 = _672 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = _722 * _712;
    float _732 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = _724 * _716;
    float _736 = fma(_408, _688, _714);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    float _740 = fma(_408, _690, _732);
    float _742 = _706 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _750 = fma(_736, _678, _696);
    float _752 = fma(_740, _678, _698);
    float _754 = _738 * _746;
    float _756 = fma(_408, _686, _748);
    float _758 = _682 * _720;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _682 * _728;
    float _766 = fma(_756, _678, _694);
    float _768 = _702 * _720;
    float _770 = _702 * _728;
    float _772 = _750 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _774 = _750 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _750 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _702 * _744;
    float _780 = _728 * _744;
    float _782 = _682 * _744;
    float _784 = _720 * _744;
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _772);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _790 = _782 * _734;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _794 = -_768;
    float _796 = fma(_762, _764, _794);
    float _798 = -_764;
    float _800 = fma(_762, _768, _798);
    float _802 = fma(_762, _770, _758);
    float _804 = _778 * _734;
    float _806 = fma(_762, _758, _770);
    float _808 = -_734;
    float _810 = _762 * _808;
    float _812 = fma(_796, _730, _790);
    float _814 = fma(_802, _730, _804);
    float _816 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    float _818 = fma(_780, _730, _810);
    float _820 = fma(_806, _754, _812);
    float _822 = fma(_800, _754, _814);
    float _824 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _826 = fma(_784, _754, _818);
    float _828 = _816 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _832 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _834 = _824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].x, _830);
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].x, _832);
    float _842 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].x, _836);
    float _844 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].z, _838);
    float _846 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].z, _840);
    float _848 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[9].z, _842);
    float _850 = _844 + _828;
    float _852 = _846 + _834;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = fma(_752, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _868 = sqrt(_864);
    float _870 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _872 = _848 + _870;
    bool _874 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _876 = _870;
    float _878 = _826;
    float _880 = _848;
    float _882 = _820;
    float _884 = _734;
    if (!_874)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = _886;
    if (!_874)
    {
        _878 = _850;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_874)
    {
        _880 = _872;
    }
    float _894 = _880;
    bool _896 = !_874;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _868 + _902;
        float _906 = rsqrt(_864);
        float _908 = _904 * _900;
        float _910 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_872, _916, _924);
        float _930 = _906 * _926;
        float _932 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _888 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _888;
    float _940 = _892;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _944 = _936 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _948 = _938 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _940 + _950;
    float _954 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _956 = _944 * _944;
    float _958 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_948, _948, _956);
    float _962 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _964 = fma(_952, _952, _960);
    float _966 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _962);
    float _968 = rsqrt(_964);
    float _970 = sqrt(_964);
    float _972 = _968 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _948 * _972;
    float _976 = _952 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _968;
    float _994 = _990;
    float _996 = _944;
    float _998 = _972;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (_986)
    {
        float _1006 = _990 * _1002;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_986)
    {
        float _1010 = rsqrt(_982);
        _1004 = _1010;
    }
    float _1012 = _1004;
    float _1014 = _1012;
    if (_986)
    {
        float _1016 = _1008 * 0.15915493667125701904296875;
        _882 = _1016;
    }
    float _1018 = _882;
    float _1020 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1022 = _952;
    if (_986)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1022 = _1026;
    }
    float _1028 = _1022;
    float _1030 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1032 = precise::max(0.0, _1020);
    float _1034 = _752;
    float _1036 = _1032;
    if (_986)
    {
        float _1038 = _1018 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = -_972;
    float _1046 = -_1032;
    float _1048 = fma(_944, _1044, _1046);
    if (_986)
    {
        float _1050 = _1048 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1028;
    float _1056 = _1052;
    if (_986)
    {
        float _1058 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1060;
    if (!_986)
    {
        _1056 = _1048;
    }
    float _1064 = _1056;
    float _1066 = _1064;
    if (_986)
    {
        float _1068 = _1012 * _1060;
        _884 = _1068;
    }
    float _1070 = _884;
    if (!_986)
    {
        _1014 = _974;
    }
    float _1072 = _1014;
    float _1074 = _1072;
    float _1076 = _1042;
    if (_986)
    {
        float _1078 = _1042 + (-1.0);
        _1036 = _1078;
    }
    float _1080 = _1036;
    float _1082 = _1080;
    if (_986)
    {
        float _1084 = _974 * _1070;
        _1074 = _1084;
    }
    float _1086 = _1074;
    if (!_986)
    {
        _1062 = _978;
    }
    float _1088 = _1062;
    float _1090 = _1088;
    if (_986)
    {
        float _1092 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1092;
    }
    float _1094 = _998;
    if (!_986)
    {
        _1082 = _976;
    }
    float _1096 = _1082;
    float _1098 = _1096;
    if (_986)
    {
        float _1100 = _976 * _1070;
        _1098 = _1100;
    }
    float _1102 = _1098;
    if (_986)
    {
        float _1104 = _1086 * _1086;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_986)
    {
        float _1108 = fma(_1048, _1042, _1094);
        _1066 = _1108;
    }
    float _1110 = _1066;
    if (!_986)
    {
        _1076 = _980;
    }
    float _1112 = _1076;
    float _1114 = _1112;
    if (_986)
    {
        float _1116 = _1102 * _1102;
        _1114 = _1116;
    }
    float _1118 = _1114;
    float _1120 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1122 = fma(_1110, _1110, _1106);
    float _1124 = _1122 + _1118;
    float _1126 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1120);
    float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1128);
    float _1132 = precise::clamp(_1130, 0.0, 1.0);
    float _1134 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1136 = rsqrt(_1124);
    float _1138 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1140 = -_1132;
    float _1142 = _1140 + 1.0;
    float _1144 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1134);
    float _1146 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1148 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1152 = abs(_1142);
    float _1154 = log2(_1152);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1162 = -_1156;
    float _1164 = fma(_1162, _954, 1.0);
    float _1166 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1158);
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = _1136 * _1086;
    float _1172 = _1136 * _1110;
    float _1174 = _1136 * _1102;
    float _1176 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1184 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1176);
    float _1186 = -_1178;
    float _1188 = fma(_1172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1186);
    float _1190 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1192 = log2(_1164);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1196 = -_1174;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1188);
    float _1200 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1182);
    float _1204 = _1172 + 1.0;
    float _1206 = fma(_1198, -0.5, 0.5);
    float _1208 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = exp2(_1190);
    float _1212 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1214 = 1.0 / _1194;
    float _1216 = fma(_1198, 0.5, 0.5);
    float _1218 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1202);
    float _1220 = _1192 * 0.693147182464599609375;
    float _1222 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = sqrt(_1206);
    float _1230 = -_1172;
    float _1232 = fma(_1210, _1204, _1230);
    float _1234 = fma(_1216, _1222, -0.212114393711090087890625);
    float _1236 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1238 = fma(_1232, 0.5, 0.5);
    float _1240 = fma(_1216, _1234, 1.570728778839111328125);
    float _1242 = _1224 * _1214;
    float _1244 = _1236 * _1214;
    float _1246 = fma(_1242, 0.5, 0.5);
    float _1248 = fma(_1244, -0.5, 0.5);
    float _1250 = _1228 * 0.636619746685028076171875;
    float3 _3844 = float3(_1246, _1248, _1226);
    float _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3844, float3(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3844, float3(0.0), isnan(_3844)), level(0.0)).x;
    float _1254 = -_1240;
    float _1256 = fma(_1250, _1254, 1.0);
    float3 _3860 = float3(_1246, _1248, _1226);
    float4 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3860, float3(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3860, float3(0.0), isnan(_3860)), level(0.0)).xyzw;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = _1259.w;
    float2 _3877 = float2(_1256, _1238);
    float3 _1271 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3877, float2(0.0), isnan(_3877)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3877, float2(0.0), isnan(_3877)), level(0.0)).xyz;
    float _1273 = _1271.x;
    float _1275 = _1271.y;
    float _1277 = _1271.z;
    float _1279 = in.m_59.y;
    float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1283 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = in.m_51.w;
    bool _1287 = _170 > 0.5;
    float _1289 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = in.m_59.x;
    float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1301 = _1299 != 0;
    float _1303 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1289);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1307 = _1305 != 0;
    float _1309 = in.m_61.x;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    bool _1317 = _166 > 0.5;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_63.x = _938;
    out.m_63.y = _936;
    out.m_63.z = _940;
    float _1321 = -_1279;
    float _1323 = _1321 + 1.0;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1327 = _1285 > 0.5;
    int _1329 = _1287 ? as_type<int>(_1323) : as_type<int>(_1279);
    float _1331 = in.m_65.x;
    float _1333 = in.m_65.y;
    float _1335 = in.m_65.z;
    float _1337 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1339 = _1293 ? as_type<float>(_1329) : _1279;
    float _1341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1345 = _1343 != 0;
    out.m_67.x = _1309;
    int _1347 = _1327 ? as_type<int>(_1323) : as_type<int>(_1279);
    int _1349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1351 = _1349 != 0;
    float _1353 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1355 = _1345 ? as_type<float>(_1347) : _1279;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1359 = _1279;
    bool _1361 = _1345;
    int _1363 = as_type<int>(_1357);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1367 = _1337;
    float _1369 = _1295;
    float _1371 = _1297;
    if (_1307)
    {
        float _1373 = _1317 ? _1323 : _1279;
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1379 = as_type<int>(_1377);
    if (_1301)
    {
        bool _1381 = _176 > 0.5;
        _1361 = _1381;
    }
    bool _1383 = _1361;
    float _1385 = fma(_1357, _1339, -0.5);
    if (_1301)
    {
        float _1387 = -_1295;
        float _1389 = _1387 + 1.0;
        _1363 = as_type<int>(_1389);
    }
    int _1391 = _1363;
    int _1393 = _1391;
    if (!_1301)
    {
        _1365 = _1295;
    }
    float _1395 = _1365;
    float _1397 = fma(_1355, _1377, -0.5);
    bool _1399 = _660 != 0.0;
    bool _1401 = isnan(_660);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    float _1409 = fma(_1337, _1375, -0.5);
    float _1411 = _1395;
    if (_1301)
    {
        float _1413 = _1383 ? as_type<float>(_1391) : _1295;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1313)
    {
        float _1417 = -_1295;
        float _1419 = _1417 + 1.0;
        _1393 = as_type<int>(_1419);
    }
    int _1421 = _1393;
    if (_1351)
    {
        float _1423 = -_1295;
        float _1425 = _1423 + 1.0;
        _1379 = as_type<int>(_1425);
    }
    int _1427 = _1379;
    bool _1429 = _658 == 0.0;
    bool _1431 = !_1407;
    bool _1433 = _1429 && _1431;
    float _1435 = -_430;
    float _1437 = fma(_578, _1385, _1435);
    if (!_1313)
    {
        _1367 = _1295;
    }
    float _1439 = _1367;
    float _1441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1443 = _1439;
    if (_1313)
    {
        float _1445 = _1317 ? as_type<float>(_1421) : _1295;
        _1443 = _1445;
    }
    float _1447 = _1443;
    float _1449 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1351)
    {
        float _1451 = _1287 ? as_type<float>(_1427) : _1295;
        _1369 = _1451;
    }
    float _1453 = _1369;
    float _1455 = -_598;
    float _1457 = fma(_596, _1397, _1455);
    float _1459 = in.m_69.x;
    float _1461 = in.m_69.y;
    float _1463 = in.m_69.z;
    float _1465 = in.m_69.w;
    bool _1467 = _662 == 0.0;
    bool _1469 = _1467 && _1433;
    float _1471 = fma(_1353, _1447, -0.5);
    float _1473 = fma(_1449, _1453, -0.5);
    float _1475 = -_600;
    float _1477 = fma(_594, _1409, _1475);
    float _1479 = exp2(_1283);
    float _1481 = in.m_61.z;
    float _1483 = fma(_588, _1473, _452);
    float _1485 = in.m_61.w;
    float _1487 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = _1441;
    float _1491 = _1331;
    if (_1469)
    {
        _1371 = _1331;
    }
    float _1493 = _1371;
    float _1495 = fma(_1487, _1415, -0.5);
    float _1497 = _1493;
    if (_1469)
    {
        _1489 = _1333;
    }
    float _1499 = _1489;
    float _1501 = _1499;
    if (!_1469)
    {
        float _1503 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1333);
        _1501 = _1503;
    }
    float _1505 = _1501;
    if (_1469)
    {
        _434 = _1493;
    }
    float _1507 = _434;
    float _1509 = in.m_61.y;
    float _1511 = _1507;
    if (!_1469)
    {
        _1497 = _1331;
    }
    float _1513 = _1497;
    float _1515 = -_1479;
    float _1517 = _1515 + 1.0;
    if (_1469)
    {
        _1491 = _1335;
    }
    float _1519 = _1491;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1335);
        _1521 = _1523;
    }
    float _1525 = _1521;
    float _1527 = fma(_416, _1471, _440);
    if (!_1469)
    {
        float _1529 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1463 * _1513;
    float _1535 = fma(_570, _1495, _444);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1539 = _1459 * _1333;
    float _1541 = _1461 * _1335;
    float _1543 = -_1533;
    float _1545 = fma(_1459, _1335, _1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1549 = -_1539;
    float _1551 = fma(_1461, _1513, _1549);
    float _1553 = -_1541;
    float _1555 = fma(_1463, _1333, _1553);
    float _1557 = _1545 * _1465;
    out.m_71.w = _1537;
    float _1559 = _1551 * _1465;
    float _1561 = -_1505;
    float _1563 = _762 * _1561;
    float _1565 = _1437 + 0.5;
    out.m_73.w = _1547;
    float _1567 = _1535 + 0.5;
    float _1569 = _1527 + 0.5;
    float _1571 = fma(_780, _1531, _1563);
    float _1573 = _1457 + 0.5;
    float _1575 = _1555 * _1465;
    float _1577 = -_1557;
    float _1579 = _762 * _1577;
    float _1581 = _778 * _1505;
    float _1583 = -_1461;
    float _1585 = _762 * _1583;
    out.m_75.x = _1567;
    out.m_75.y = _1565;
    out.m_75.z = _1569;
    out.m_75.w = _1573;
    float _1587 = fma(_784, _1525, _1571);
    float _1589 = fma(_802, _1531, _1581);
    float _1591 = fma(_780, _1459, _1585);
    float _1593 = fma(_780, _1575, _1579);
    float _1595 = _778 * _1461;
    float _1597 = _782 * _1461;
    float _1599 = fma(_784, _1463, _1591);
    float _1601 = fma(_800, _1525, _1589);
    float _1603 = fma(_802, _1459, _1595);
    float _1605 = fma(_796, _1459, _1597);
    float _1607 = fma(_784, _1559, _1593);
    float _1609 = _1483 + 0.5;
    float _1611 = fma(_800, _1463, _1603);
    float _1613 = _778 * _1557;
    float _1615 = _782 * _1505;
    float _1617 = _782 * _1557;
    float _1619 = fma(_806, _1463, _1605);
    float _1621 = fma(_802, _1575, _1613);
    float _1623 = fma(_796, _1531, _1615);
    float _1625 = fma(_796, _1575, _1617);
    float _1627 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1629 = fma(_800, _1559, _1621);
    float _1631 = fma(_806, _1525, _1623);
    float _1633 = fma(_806, _1559, _1625);
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1637 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1639 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1641 = _1477 + 0.5;
    float _1643 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1635);
    float _1645 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1627);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1637);
    float _1649 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1639);
    out.m_77.x = _1609;
    out.m_77.y = _1641;
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1653 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1655 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1657 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1659 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1643);
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1651);
    float _1663 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_67.y = _1509;
    float _1665 = _1629 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1667 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    float _1669 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1647);
    float _1671 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1673 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1315);
    float _1675 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1665);
    float _1677 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1661);
    out.m_79.x = _1659;
    out.m_79.y = _1667;
    out.m_79.z = _1669;
    float _1679 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1663);
    float _1681 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1671);
    float _1683 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1653);
    float _1685 = _1673 + _1194;
    float _1687 = _1224 + _1194;
    float _1689 = _1194 * 0.5;
    float _1691 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1693 = fma(_1633, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1683);
    float _1695 = _1685 * 0.5;
    float _1697 = _1687 * 0.5;
    float _1699 = fma(_1236, -0.5, _1689);
    float _1701 = -_1657;
    float _1703 = _1701 + 1.0;
    float _1705 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1679);
    float _1707 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1681);
    out.m_67.z = _1481;
    bool _1709 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_970);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    out.m_67.w = _1485;
    out.m_81.x = _1655;
    out.m_81.y = _1691;
    out.m_81.z = _1693;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1194;
    float _1719 = _1669;
    float _1721 = _1667;
    float _1723 = _1703;
    if (!_1717)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1725 = _1719;
    out.m_83.x = _1697;
    out.m_83.y = _1699;
    out.m_83.z = _1695;
    out.m_83.w = _1194;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1717)
    {
        _1721 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1731 = _1721;
    out.m_85.x = _1677;
    out.m_85.y = _1705;
    out.m_85.z = _1707;
    float _1733 = _1657 * _1252;
    float _1735 = _1267 * _1733;
    float _1737 = _1267 * _1703;
    float _1739 = _1731;
    float _1741 = _1731;
    if (!_1717)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1743 = _1723;
    float _1745 = _1277 * _1733;
    float _1747 = fma(_1273, _1735, _1261);
    float _1749 = fma(_1275, _1735, _1263);
    float _1751 = fma(_1267, _1745, _1265);
    out.m_87.x = _1747;
    out.m_87.y = _1749;
    out.m_87.z = _1751;
    out.m_87.w = _1737;
    bool _1753 = !_1717;
    float _1755 = _1743;
    float _1757 = _1743;
    if (!_1753)
    {
        bool _1759 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1761 = isnan(_970);
        bool _1763 = _1759 || _1761;
        bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1767 = _1763 || _1765;
        if (!_1767)
        {
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1771 = _970 + _1769;
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = 1.0 / _1775;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1791 = _1771 * _1785;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = fma(_1793, _1779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1797 = fma(_1793, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1799 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1741 = _1797;
            _1729 = _1795;
            _1757 = _1799;
            _1801 = true;
        }
        else
        {
            bool _1803 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1805 = isnan(_970);
            bool _1807 = _1803 || _1805;
            bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1811 = _1807 || _1809;
            if (!_1811)
            {
                _1727 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1813 = _1727;
            _1729 = _1813;
            if (!_1811)
            {
                _1739 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1815 = _1739;
            _1741 = _1815;
            if (!_1811)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1817 = _1755;
            bool _1819 = !_1811;
            _1757 = _1817;
            if (!_1819)
            {
                bool _1821 = _970 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1823 = isnan(_970);
                bool _1825 = _1821 || _1823;
                bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1829 = _1825 || _1827;
                if (!_1829)
                {
                    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1833 = _970 + _1831;
                    float _1835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1835;
                    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1841 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1847 = 1.0 / _1837;
                    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1853 = _1833 * _1847;
                    float _1855 = precise::clamp(_1853, 0.0, 1.0);
                    float _1857 = fma(_1855, _1841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1859 = fma(_1855, _1845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1861 = fma(_1855, _1851, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1741 = _1859;
                    _1729 = _1857;
                    _1757 = _1861;
                    _1801 = true;
                }
                else
                {
                    _1741 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1729 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1801 = false;
    float _1863 = _1741;
    float _1865 = _1729;
    float _1867 = _1757;
    float _1869 = _1863 * 0.586610972881317138671875;
    bool _1871 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_89.x = 0.0;
    float _1873 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1873);
    float _1877 = -_1875;
    float _1879 = _1877 + _1865;
    float _1881 = -_1875;
    float _1883 = _1881 + _1863;
    float _1885 = -_1875;
    float _1887 = _1885 + _1867;
    float _1889 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_47.x = _1889;
    out.m_91.x = _1891;
    out.m_91.y = _1893;
    out.m_91.z = _1895;
    if (!_1871)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1897 = -_936;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_938;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_940;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1705 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1677, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1707, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _1973;
    out.m_89.y = _1975;
    out.m_89.z = _1977;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

