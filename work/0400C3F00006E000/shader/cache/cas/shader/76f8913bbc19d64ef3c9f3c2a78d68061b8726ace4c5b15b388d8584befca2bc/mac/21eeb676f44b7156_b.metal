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
    float4 m_75 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1741 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2039 = as_type<float>(_122);
        out.gl_Position.z = _2039;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2111 = as_type<float>(_162);
        out.gl_Position.z = _2111;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _164 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _194 = floor(_188);
    float _196 = _178 * 2.0;
    float _198 = -_180;
    float _200 = fma(_192, 2.0, _198);
    float _202 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _204 = floor(_190);
    float _206 = fma(_202, -2.0, _186);
    float _208 = floor(_196);
    bool _210 = _194 >= 0.0;
    bool _212 = isnan(_194);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = _194 > 0.0;
    float _222 = _178 + _166;
    bool _224 = _204 > 0.0;
    float _226 = _222 + (-1.0);
    bool _228 = _204 >= 0.0;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = _218 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _242 = _208 > 0.0;
    bool _244 = _208 >= 0.0;
    bool _246 = isnan(_208);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _256 = ~as_type<int>(_238);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    int _262 = _260;
    float _264 = _202;
    float _266 = _238;
    float _268 = _226;
    float _270 = _254;
    float _272 = _178;
    if (!_220)
    {
        int _274 = ~as_type<int>(_238);
        int _276 = _274 + 1;
        _262 = _276;
    }
    int _278 = _262;
    float _280 = 0.0;
    if (!_176)
    {
        float _282 = _254 * _254;
        float _284 = _282 * 0.5;
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _286;
    if (!_176)
    {
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _290;
    }
    float _292 = _288;
    bool _294 = !_176;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _254 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _254);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _312;
        _266 = _304;
        _268 = _314;
        _296 = _326;
    }
    float _328 = _264;
    float _330 = _266;
    float _332 = _268;
    float _334 = _296;
    bool _336 = !_176;
    float _338 = _328;
    float _340 = _330;
    float _342 = _332;
    if (!_336)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _254 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _338 = _356;
        _270 = _362;
    }
    float _364 = _338;
    float _366 = _270;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -_134;
    float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    float _376 = _364;
    if (!_184)
    {
        _340 = _178;
    }
    float _378 = _340;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _382 = _378;
    if (!_184)
    {
        _342 = _164;
    }
    float _384 = _342;
    float _386 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _206);
    float _388 = _384;
    if (!_184)
    {
        _376 = _164;
    }
    float _390 = _376;
    float _392 = _390;
    if (_184)
    {
        _382 = _166;
    }
    float _394 = _382;
    if (_184)
    {
        _388 = _178;
    }
    float _396 = _388;
    float _398 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].z, _380);
    if (_184)
    {
        _392 = _178;
    }
    float _400 = _392;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _414 = _412 != 0;
    float _416 = _394 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _418 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    bool _422 = !_406;
    int _424 = _422 ? 0 : 1;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _428 = _370 * _134;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _432 = abs(_424);
    float _434 = -_426;
    float _436 = fma(_416, 2.0, _434);
    int _438 = _236 ? 0 : 1;
    float _440 = fma(_418, -2.0, _430);
    float _442 = float(_278);
    float _444 = exp2(_428);
    float _446 = float(_432);
    float _448 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _440);
    int _450 = ~_438;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    float _456 = -_134;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[81].x, _436);
    int _460 = _454;
    if (!_224)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * _442;
    int _470 = _252 ? 0 : 1;
    float _472 = in.m_55.x;
    float _474 = in.m_55.y;
    float _476 = in.m_55.z;
    float _478 = _468 * (-2.0);
    int _480 = ~_470;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _398);
    int _488 = _484;
    if (!_242)
    {
        int _490 = ~_470;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = -_444;
    float _502 = _500 + 1.0;
    float _504 = fma(_240, _478, _240);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _518 = 1.0 / _498;
    bool _520 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _532 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _516);
    bool _534 = !_410;
    int _536 = _534 ? 0 : 1;
    float _538 = _166 + (-0.5);
    float _540 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _530);
    float _542 = _528 ? _502 : 0.0;
    float _544 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    int _546 = abs(_536);
    float _548 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _540);
    float _550 = float(_466);
    float _552 = fma(_478, _472, _472);
    float _554 = float(_546);
    float _556 = _178 + _164;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _420);
    bool _560 = !_414;
    int _562 = _560 ? 0 : 1;
    if (_514)
    {
        float _564 = _542 * _518;
        _156 = _564;
    }
    float _566 = _156;
    float _568 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[196].x, _552);
    float _570 = _554 * _550;
    float _572 = _556 + (-1.0);
    int _574 = abs(_562);
    float _576 = fma(_504, _566, _568);
    float _578 = float(_494);
    float _580 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = _570 * (-2.0);
    float _584 = float(_574);
    float _586 = _576 * 0.15915493667125701904296875;
    float _588 = fma(_580, _582, _580);
    float _590 = fma(_582, _474, _474);
    float _592 = in.m_49.x;
    float _594 = in.m_49.y;
    float _596 = in.m_49.z;
    float _598 = _584 * _578;
    float _600 = _166 + _164;
    float _602 = _178 + (-0.5);
    float _604 = _164 + (-0.5);
    float _606 = _598 * (-2.0);
    float _608 = _600 + (-1.0);
    float _610 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_606, _476, _476);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = fma(_588, _566, _610);
    float _622 = in.m_44.x;
    float _624 = in.m_44.y;
    float _626 = in.m_44.z;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _616);
    float _630 = fma(_618, _606, _618);
    float _632 = _620 * 0.15915493667125701904296875;
    float _634 = _586 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = in.m_57.x;
    float _640 = in.m_57.y;
    float _642 = in.m_57.z;
    float _644 = in.m_57.w;
    float _646 = fma(_630, _566, _628);
    float _648 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _650 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _652 = _646 * 0.15915493667125701904296875;
    float _654 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _656 = _632 * 6.283185482025146484375;
    float _658 = sin(_656);
    float _660 = in.m_59.x;
    float _662 = in.m_59.y;
    float _664 = in.m_59.z;
    float _666 = fma(_366, _596, _648);
    float _668 = fma(_366, _592, _650);
    float _670 = fma(_366, _594, _654);
    float _672 = _632 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _678 = isnan(0.5);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _684 = _680 || _682;
    float _686 = _652 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _614 * _658;
    float _692 = _640 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _694 = _638 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _636 * _658;
    float _698 = fma(_668, _644, _622);
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = fma(_670, _644, _624);
    float _704 = _652 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = _636 * _674;
    float _710 = _614 * _674;
    float _712 = fma(_666, _644, _626);
    float _714 = _642 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _718 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _722 = fma(_688, _708, _690);
    float _724 = fma(_688, _690, _708);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _728 = -_696;
    float _730 = fma(_688, _710, _728);
    float _732 = -_710;
    float _734 = fma(_688, _696, _732);
    float _736 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _700 * _726;
    float _740 = _718 * _716;
    float _742 = _636 * _706;
    float _744 = _614 * _706;
    float _746 = _674 * _706;
    float _748 = _658 * _706;
    float _750 = _742 * _738;
    float _752 = -_738;
    float _754 = _688 * _752;
    float _756 = _736 * _720;
    float _758 = _744 * _738;
    float _760 = fma(_722, _740, _750);
    float _762 = fma(_746, _740, _754);
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _766 = fma(_730, _740, _758);
    float _768 = fma(_734, _756, _760);
    float _770 = fma(_748, _756, _762);
    float _772 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _764);
    float _774 = _702 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _778 = fma(_724, _756, _766);
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _782 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = _768 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _776);
    float _788 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _790 = _702 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _784);
    float _796 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _798 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    float _800 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _804 = _788 + _796;
    float _806 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _808 = _800 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _808 + _816;
    float _820 = _812 * _812;
    float _822 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _824 = fma(_818, _818, _820);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _822);
    float _828 = sqrt(_824);
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _832);
    float _838 = 1.0 / _834;
    float _840 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].z, _836);
    float _842 = _768 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _834;
    float _852 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].z, _846);
    float _854 = _814 + _852;
    float _856 = _852;
    float _858 = _842;
    float _860 = _834;
    float _862 = _850;
    float _864 = _660;
    if (_684)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _850 * _838;
    float _870 = _868 * 0.5;
    float _872 = _866;
    float _874 = _870;
    if (!_848)
    {
        _858 = _808;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _804;
    }
    float _880 = _860;
    float _882 = _880;
    if (!_848)
    {
        _862 = _854;
    }
    float _884 = _862;
    bool _886 = !_848;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _828 + _892;
        float _896 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_824);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_854, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_812, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _878 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _878;
    float _930 = _882;
    if (!_684)
    {
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _940 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _938);
        float _942 = _934 * 6.283185482025146484375;
        float _944 = cos(_942);
        float _946 = _936 * 0.15915493667125701904296875;
        float _948 = _934 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = 1.0 / _944;
        float _954 = _946 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _950 * _952;
        float _960 = _946 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _956 * _958;
        float _966 = 1.0 / _940;
        float _968 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _970 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _968;
        float _972 = 1.0 / _964;
        float _974 = 1.0 / _970;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _978 = _966 * _976;
        float _980 = _962 * _972;
        float _982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _984 = fma(_980, _978, _982);
        float _986 = _984 * _974;
        float _988 = precise::clamp(_986, 0.0, 1.0);
        _872 = _988;
    }
    float _990 = _872;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _926 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _928 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _930 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = sqrt(_1008);
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1016 = _998 * _1014;
    float _1018 = _1002 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 * _1018;
    float _1024 = _1020 + _1022;
    float _1026 = sqrt(_1024);
    bool _1028 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1026 + _1030;
    float _1034 = _1010;
    float _1036 = _1024;
    float _1038 = _1032;
    float _1040 = _994;
    if (_1028)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1042;
    }
    float _1044 = _1034;
    if (_1028)
    {
        float _1046 = rsqrt(_1024);
        _1036 = _1046;
    }
    float _1048 = _1036;
    float _1050 = _1048;
    if (_1028)
    {
        float _1052 = _1032 * _1044;
        _1038 = _1052;
    }
    float _1054 = _1038;
    if (_1028)
    {
        float _1056 = _1054 * 0.15915493667125701904296875;
        _874 = _1056;
    }
    float _1058 = _874;
    float _1060 = _1002;
    float _1062 = _1058;
    if (_1028)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1060 = _1066;
    }
    float _1068 = _1060;
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1072 = precise::max(0.0, _1070);
    float _1074 = _1044;
    float _1076 = _1072;
    if (_1028)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1014;
    float _1086 = -_1072;
    float _1088 = fma(_994, _1084, _1086);
    if (_1028)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1090;
    }
    float _1092 = _1040;
    float _1094 = _1092;
    float _1096 = _1068;
    if (_1028)
    {
        float _1098 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1094 = _1098;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (!_1028)
    {
        _1096 = _1016;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    float _1108 = _1082;
    if (_1028)
    {
        float _1110 = _1082 + (-1.0);
        _1076 = _1110;
    }
    float _1112 = _1076;
    float _1114 = 0.0;
    float _1116 = _1112;
    if (_1028)
    {
        float _1118 = _1048 * _1100;
        _1114 = _1118;
    }
    float _1120 = _1114;
    if (!_1028)
    {
        _1102 = _1088;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1028)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1062 = _1126;
    }
    float _1128 = _1062;
    if (_1028)
    {
        float _1130 = _1016 * _1120;
        _1106 = _1130;
    }
    float _1132 = _1106;
    if (!_1028)
    {
        _1116 = _1018;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1028)
    {
        float _1138 = _1018 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (!_1028)
    {
        _1050 = _1020;
    }
    float _1142 = _1050;
    float _1144 = _1142;
    if (_1028)
    {
        float _1146 = fma(_1088, _1082, _1128);
        _1124 = _1146;
    }
    float _1148 = _1124;
    if (_1028)
    {
        float _1150 = _1132 * _1132;
        _1144 = _1150;
    }
    float _1152 = _1144;
    if (!_1028)
    {
        _1108 = _1022;
    }
    float _1154 = _1108;
    float _1156 = _1154;
    if (_1028)
    {
        float _1158 = _1140 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1148, _1148, _1152);
    float _1164 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1162 + _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1174 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1172);
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1180 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1184 = -_1176;
    float _1186 = _1184 + 1.0;
    float _1188 = rsqrt(_1170);
    float _1190 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1192 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1194 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1196 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = abs(_1186);
    float _1204 = log2(_1202);
    float _1206 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1188 * _1132;
    float _1222 = _1188 * _1148;
    float _1224 = _1188 * _1140;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = -_1212;
    float _1234 = fma(_1232, _1166, 1.0);
    float _1236 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = -_1228;
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1248 = -_1224;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1240);
    float _1252 = log2(_1234);
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1256 = _1222 + 1.0;
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1254);
    float _1264 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1244);
    float _1266 = exp2(_1242);
    float _1268 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1262);
    float _1270 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1274 = fma(_1260, _1270, -0.212114393711090087890625);
    float _1276 = 1.0 / _1246;
    float _1278 = _1252 * 0.693147182464599609375;
    float _1280 = fma(_1260, _1274, 1.570728778839111328125);
    float _1282 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1284 = sqrt(_1258);
    float _1286 = -_1222;
    float _1288 = fma(_1266, _1256, _1286);
    float _1290 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1272 * _1276;
    float _1296 = _1290 * _1276;
    float _1298 = fma(_1294, 0.5, 0.5);
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1284 * 0.636619746685028076171875;
    float3 _3907 = float3(_1298, _1300, _1282);
    float _1304 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).x;
    float _1306 = -_1280;
    float _1308 = fma(_1302, _1306, 1.0);
    float3 _3923 = float3(_1298, _1300, _1282);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3923, float3(0.0), isnan(_3923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3923, float3(0.0), isnan(_3923)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _3940 = float2(_1308, _1292);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = in.m_53.w;
    bool _1333 = _662 != 0.0;
    bool _1335 = isnan(_662);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1345 = in.m_61.y;
    bool _1347 = _660 == 0.0;
    bool _1349 = !_1341;
    bool _1351 = _1347 && _1349;
    float _1353 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_61.x;
    bool _1361 = _664 == 0.0;
    bool _1363 = _1361 && _1351;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1367 = _1365 != 0;
    float _1369 = in.m_63.x;
    float _1371 = in.m_63.y;
    float _1373 = in.m_63.z;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1377 = _1375 != 0;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1383 = _1381 != 0;
    out.m_65.x = _718;
    out.m_65.y = _700;
    out.m_65.z = _736;
    bool _1385 = _178 > 0.5;
    out.m_67.x = _928;
    out.m_67.y = _926;
    out.m_67.z = _930;
    float _1387 = exp2(_1353);
    bool _1389 = _1331 > 0.5;
    float _1391 = -_1345;
    float _1393 = _1391 + 1.0;
    out.m_69.y = _1345;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1300;
    bool _1399 = _1383;
    float _1401 = _1345;
    bool _1403 = _1389;
    float _1405 = _1246;
    float _1407 = _1290;
    float _1409 = _1272;
    if (!_1357)
    {
        _1397 = _1359;
    }
    float _1411 = _1397;
    int _1413 = _1389 ? as_type<int>(_1393) : as_type<int>(_1345);
    float _1415 = _1371;
    float _1417 = _1373;
    float _1419 = _1411;
    float _1421 = _1369;
    int _1423 = as_type<int>(_1343);
    if (!_1363)
    {
        float _1425 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1357)
    {
        _272 = _1411;
    }
    float _1429 = _272;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1433 = _1383 ? as_type<float>(_1413) : _1345;
    float _1435 = _1429;
    if (!_1363)
    {
        float _1437 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1417 = _1437;
    }
    float _1439 = _1417;
    if (_1367)
    {
        bool _1441 = _164 > 0.5;
        _1399 = _1441;
    }
    bool _1443 = _1399;
    float _1445 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1447 = as_type<int>(_1445);
    if (_1357)
    {
        _1419 = _1359;
    }
    float _1449 = _1419;
    if (!_1363)
    {
        float _1451 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1421 = _1451;
    }
    float _1453 = _1421;
    if (_1377)
    {
        float _1455 = _1385 ? _1393 : _1345;
        _1401 = _1455;
    }
    float _1457 = _1401;
    float _1459 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = fma(_1433, _1445, -0.5);
    if (_1357)
    {
        float _1463 = -_1449;
        float _1465 = _1463 + 1.0;
        _1447 = as_type<int>(_1465);
    }
    int _1467 = _1447;
    if (_1357)
    {
        bool _1469 = _166 > 0.5;
        _1403 = _1469;
    }
    bool _1471 = _1403;
    float _1473 = fma(_1459, _1457, -0.5);
    if (_1367)
    {
        float _1475 = -_1449;
        float _1477 = _1475 + 1.0;
        _1423 = as_type<int>(_1477);
    }
    int _1479 = _1423;
    float _1481 = -_1427;
    float _1483 = _688 * _1481;
    if (_1357)
    {
        float _1485 = _1471 ? as_type<float>(_1467) : _1449;
        _1435 = _1485;
    }
    float _1487 = _1435;
    float _1489 = -_386;
    float _1491 = fma(_548, _1473, _1489);
    if (!_1367)
    {
        _864 = _1449;
    }
    float _1493 = _864;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1497 = _1493;
    if (_1367)
    {
        float _1499 = _1443 ? as_type<float>(_1479) : _1449;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1507 = fma(_1495, _1487, -0.5);
    float _1509 = fma(_746, _1453, _1483);
    float _1511 = fma(_1503, _1501, -0.5);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = fma(_544, _1507, _374);
    float _1517 = _742 * _1427;
    float _1519 = fma(_486, _1511, _458);
    float _1521 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = -_448;
    float _1525 = fma(_558, _1461, _1523);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = fma(_722, _1453, _1517);
    float _1535 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    float _1537 = in.m_71.w;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _744 * _1427;
    float _1549 = fma(_734, _1439, _1533);
    float _1551 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1553 = -_1387;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_730, _1453, _1547);
    float _1559 = fma(_748, _1439, _1509);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_73.x = _1541;
    out.m_73.y = _1543;
    out.m_73.z = _1545;
    out.m_73.w = _1539;
    float _1563 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1565 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1571 = fma(_724, _1439, _1557);
    float _1573 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1561);
    float _1575 = _1563 + _1246;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1573);
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1577);
    float _1595 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1579);
    float _1597 = -_1587;
    float _1599 = _1597 + 1.0;
    out.m_75.x = _1513;
    out.m_75.y = _1583;
    out.m_75.z = _1585;
    out.m_75.w = _1581;
    bool _1601 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1603 = isnan(_1012);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1595);
    out.m_77.w = _1537;
    out.m_79.x = _1589;
    out.m_79.y = _1593;
    out.m_79.z = _1611;
    out.gl_Position.x = _1272;
    out.gl_Position.y = _1290;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1246;
    float _1613 = _1491 + 0.5;
    float _1615 = _1525 + 0.5;
    float _1617 = _1515 + 0.5;
    float _1619 = _1519 + 0.5;
    out.m_81.z = _1591;
    out.m_81.w = _1246;
    out.m_83.x = _1617;
    out.m_83.y = _1613;
    out.m_83.z = _1619;
    out.m_83.w = _1615;
    float _1621 = _1563;
    float _1623 = _1599;
    if (!_1609)
    {
        _1405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1625 = _1405;
    float _1627 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1609)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1609)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1639 = _1407;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1609)
    {
        _1409 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1645 = _1409;
    float _1647 = _1587 * _1304;
    float _1649 = _1319 * _1647;
    float _1651 = _1319 * _1599;
    float _1653 = _1649;
    float _1655 = _1645;
    float _1657 = _1645;
    if (!_1609)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1659 = _1623;
    float _1661 = _1329 * _1647;
    float _1663 = fma(_1325, _1649, _1313);
    float _1665 = fma(_1327, _1649, _1315);
    float _1667 = _1659;
    float _1669 = _1659;
    if (!_1609)
    {
        _1653 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1671 = _1653;
    float _1673 = fma(_1319, _1661, _1317);
    out.m_85.x = _1663;
    out.m_85.y = _1665;
    out.m_85.z = _1673;
    out.m_85.w = _1651;
    bool _1675 = !_1609;
    float _1677 = _1671;
    float _1679 = _1671;
    if (!_1675)
    {
        bool _1681 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1683 = isnan(_1012);
        bool _1685 = _1681 || _1683;
        bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1689 = _1685 || _1687;
        if (!_1689)
        {
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1693 = _1012 + _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1703 = 1.0 / _1697;
            float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1721 = _1693 * _1703;
            float _1723 = precise::clamp(_1721, 0.0, 1.0);
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1729 = fma(_1723, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1723, _1727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1733 = fma(_1723, _1707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1735 = fma(_1723, _1711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1737 = fma(_1723, _1715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1739 = fma(_1723, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1669 = _1733;
            _1643 = _1737;
            _1679 = _1729;
            _1637 = _1735;
            _1631 = _1731;
            _1657 = _1739;
            _1741 = true;
        }
        else
        {
            bool _1743 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1745 = isnan(_1012);
            bool _1747 = _1743 || _1745;
            bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1751 = _1747 || _1749;
            if (!_1751)
            {
                _1677 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1753 = _1677;
            _1679 = _1753;
            if (!_1751)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1755 = _1667;
            _1669 = _1755;
            if (!_1751)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1757 = _1629;
            _1631 = _1757;
            if (!_1751)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1759 = _1635;
            _1637 = _1759;
            if (!_1751)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1761 = _1641;
            _1643 = _1761;
            if (!_1751)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1763 = _1655;
            bool _1765 = !_1751;
            _1657 = _1763;
            if (!_1765)
            {
                bool _1767 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1769 = isnan(_1012);
                bool _1771 = _1767 || _1769;
                bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1775 = _1771 || _1773;
                if (!_1775)
                {
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1779 = _1012 + _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1789 = 1.0 / _1783;
                    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1807 = _1779 * _1789;
                    float _1809 = precise::clamp(_1807, 0.0, 1.0);
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1815 = fma(_1809, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1819 = fma(_1809, _1793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1821 = fma(_1809, _1797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1823 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1825 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1669 = _1819;
                    _1643 = _1823;
                    _1679 = _1815;
                    _1637 = _1821;
                    _1631 = _1817;
                    _1657 = _1825;
                    _1741 = true;
                }
                else
                {
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1679 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1741 = false;
    float _1827 = _1669;
    float _1829 = _1643;
    float _1831 = _1679;
    float _1833 = _1637;
    float _1835 = _1631;
    float _1837 = _1657;
    float _1839 = fma(_1593, -0.5, 0.5);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1827;
    float _1845 = _1843 + _1829;
    float _1847 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = -_1831;
    float _1851 = _1849 + _1833;
    float _1853 = fma(_1841, _1845, _1827);
    out.m_87.x = 0.0;
    float _1855 = -_1835;
    float _1857 = _1855 + _1837;
    float _1859 = fma(_1841, _1851, _1831);
    float _1861 = _1853 * 0.586610972881317138671875;
    out.m_47.x = _1847;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1841, _1857, _1835);
    float _1867 = fma(_1859, 0.298911988735198974609375, _1861);
    bool _1869 = _990 > 0.0;
    bool _1871 = isnan(_990);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = fma(_1865, 0.114477999508380889892578125, _1867);
    float _1881 = -_1879;
    float _1883 = _1859 + _1881;
    float _1885 = -_1879;
    float _1887 = _1853 + _1885;
    float _1889 = -_1879;
    float _1891 = _1865 + _1889;
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1897 = fma(_1891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    bool _1899 = !_1863;
    if (!_1899)
    {
        float _1901 = -_926;
        float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1905 = -_928;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1909 = -_930;
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1913 = _1903 * _1903;
        float _1915 = fma(_1907, _1907, _1913);
        float _1917 = fma(_1911, _1911, _1915);
        float _1919 = sqrt(_1917);
        float _1921 = rsqrt(_1917);
        float _1923 = -_1919;
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1929 = precise::clamp(_1927, 0.0, 1.0);
        float _1931 = _1907 * _1921;
        float _1933 = _1903 * _1921;
        float _1935 = abs(_1929);
        float _1937 = log2(_1935);
        float _1939 = _1911 * _1921;
        float _1941 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1943 = _1593 * _1933;
        float _1945 = -_1933;
        float _1947 = -_1941;
        float _1949 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1947);
        float _1951 = fma(_1589, _1931, _1943);
        float _1953 = -_1939;
        float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1949);
        float _1957 = fma(_1611, _1939, _1951);
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1963 = _1955 + _1961;
        float _1965 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = exp2(_1965);
        float _1973 = _1971 * _1969;
        float _1975 = _1959 * _1973;
        float _1977 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1977;
        out.m_87.y = _1979;
        out.m_87.z = _1981;
    }
    out.m_89.x = _1893;
    out.m_89.y = _1895;
    out.m_89.z = _1897;
    if (_1877)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1983;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1741 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2039 = as_type<float>(_122);
        out.gl_Position.z = _2039;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2111 = as_type<float>(_162);
        out.gl_Position.z = _2111;
    }
    if (_152)
    {
        return out;
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _164 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _194 = floor(_188);
    float _196 = _178 * 2.0;
    float _198 = -_180;
    float _200 = fma(_192, 2.0, _198);
    float _202 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _204 = floor(_190);
    float _206 = fma(_202, -2.0, _186);
    float _208 = floor(_196);
    bool _210 = _194 >= 0.0;
    bool _212 = isnan(_194);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = _194 > 0.0;
    float _222 = _178 + _166;
    bool _224 = _204 > 0.0;
    float _226 = _222 + (-1.0);
    bool _228 = _204 >= 0.0;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = _218 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _242 = _208 > 0.0;
    bool _244 = _208 >= 0.0;
    bool _246 = isnan(_208);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _256 = ~as_type<int>(_238);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    int _262 = _260;
    float _264 = _202;
    float _266 = _238;
    float _268 = _226;
    float _270 = _254;
    float _272 = _178;
    if (!_220)
    {
        int _274 = ~as_type<int>(_238);
        int _276 = _274 + 1;
        _262 = _276;
    }
    int _278 = _262;
    float _280 = 0.0;
    if (!_176)
    {
        float _282 = _254 * _254;
        float _284 = _282 * 0.5;
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _286;
    if (!_176)
    {
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _290;
    }
    float _292 = _288;
    bool _294 = !_176;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _254 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _254);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _312;
        _266 = _304;
        _268 = _314;
        _296 = _326;
    }
    float _328 = _264;
    float _330 = _266;
    float _332 = _268;
    float _334 = _296;
    bool _336 = !_176;
    float _338 = _328;
    float _340 = _330;
    float _342 = _332;
    if (!_336)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _254 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _338 = _356;
        _270 = _362;
    }
    float _364 = _338;
    float _366 = _270;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -_134;
    float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    float _376 = _364;
    if (!_184)
    {
        _340 = _178;
    }
    float _378 = _340;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _382 = _378;
    if (!_184)
    {
        _342 = _164;
    }
    float _384 = _342;
    float _386 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _206);
    float _388 = _384;
    if (!_184)
    {
        _376 = _164;
    }
    float _390 = _376;
    float _392 = _390;
    if (_184)
    {
        _382 = _166;
    }
    float _394 = _382;
    if (_184)
    {
        _388 = _178;
    }
    float _396 = _388;
    float _398 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].z, _380);
    if (_184)
    {
        _392 = _178;
    }
    float _400 = _392;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _414 = _412 != 0;
    float _416 = _394 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _418 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    bool _422 = !_406;
    int _424 = _422 ? 0 : 1;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _428 = _370 * _134;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _432 = abs(_424);
    float _434 = -_426;
    float _436 = fma(_416, 2.0, _434);
    int _438 = _236 ? 0 : 1;
    float _440 = fma(_418, -2.0, _430);
    float _442 = float(_278);
    float _444 = exp2(_428);
    float _446 = float(_432);
    float _448 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _440);
    int _450 = ~_438;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    float _456 = -_134;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[81].x, _436);
    int _460 = _454;
    if (!_224)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * _442;
    int _470 = _252 ? 0 : 1;
    float _472 = in.m_55.x;
    float _474 = in.m_55.y;
    float _476 = in.m_55.z;
    float _478 = _468 * (-2.0);
    int _480 = ~_470;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _398);
    int _488 = _484;
    if (!_242)
    {
        int _490 = ~_470;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = -_444;
    float _502 = _500 + 1.0;
    float _504 = fma(_240, _478, _240);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _518 = 1.0 / _498;
    bool _520 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _532 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _516);
    bool _534 = !_410;
    int _536 = _534 ? 0 : 1;
    float _538 = _166 + (-0.5);
    float _540 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _530);
    float _542 = _528 ? _502 : 0.0;
    float _544 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    int _546 = abs(_536);
    float _548 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _540);
    float _550 = float(_466);
    float _552 = fma(_478, _472, _472);
    float _554 = float(_546);
    float _556 = _178 + _164;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _420);
    bool _560 = !_414;
    int _562 = _560 ? 0 : 1;
    if (_514)
    {
        float _564 = _542 * _518;
        _156 = _564;
    }
    float _566 = _156;
    float _568 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[196].x, _552);
    float _570 = _554 * _550;
    float _572 = _556 + (-1.0);
    int _574 = abs(_562);
    float _576 = fma(_504, _566, _568);
    float _578 = float(_494);
    float _580 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = _570 * (-2.0);
    float _584 = float(_574);
    float _586 = _576 * 0.15915493667125701904296875;
    float _588 = fma(_580, _582, _580);
    float _590 = fma(_582, _474, _474);
    float _592 = in.m_49.x;
    float _594 = in.m_49.y;
    float _596 = in.m_49.z;
    float _598 = _584 * _578;
    float _600 = _166 + _164;
    float _602 = _178 + (-0.5);
    float _604 = _164 + (-0.5);
    float _606 = _598 * (-2.0);
    float _608 = _600 + (-1.0);
    float _610 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_606, _476, _476);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = fma(_588, _566, _610);
    float _622 = in.m_44.x;
    float _624 = in.m_44.y;
    float _626 = in.m_44.z;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _616);
    float _630 = fma(_618, _606, _618);
    float _632 = _620 * 0.15915493667125701904296875;
    float _634 = _586 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = in.m_57.x;
    float _640 = in.m_57.y;
    float _642 = in.m_57.z;
    float _644 = in.m_57.w;
    float _646 = fma(_630, _566, _628);
    float _648 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _650 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _652 = _646 * 0.15915493667125701904296875;
    float _654 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _656 = _632 * 6.283185482025146484375;
    float _658 = sin(_656);
    float _660 = in.m_59.x;
    float _662 = in.m_59.y;
    float _664 = in.m_59.z;
    float _666 = fma(_366, _596, _648);
    float _668 = fma(_366, _592, _650);
    float _670 = fma(_366, _594, _654);
    float _672 = _632 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _678 = isnan(0.5);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _684 = _680 || _682;
    float _686 = _652 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _614 * _658;
    float _692 = _640 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _694 = _638 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _636 * _658;
    float _698 = fma(_668, _644, _622);
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = fma(_670, _644, _624);
    float _704 = _652 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = _636 * _674;
    float _710 = _614 * _674;
    float _712 = fma(_666, _644, _626);
    float _714 = _642 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _718 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _722 = fma(_688, _708, _690);
    float _724 = fma(_688, _690, _708);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _728 = -_696;
    float _730 = fma(_688, _710, _728);
    float _732 = -_710;
    float _734 = fma(_688, _696, _732);
    float _736 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _700 * _726;
    float _740 = _718 * _716;
    float _742 = _636 * _706;
    float _744 = _614 * _706;
    float _746 = _674 * _706;
    float _748 = _658 * _706;
    float _750 = _742 * _738;
    float _752 = -_738;
    float _754 = _688 * _752;
    float _756 = _736 * _720;
    float _758 = _744 * _738;
    float _760 = fma(_722, _740, _750);
    float _762 = fma(_746, _740, _754);
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _766 = fma(_730, _740, _758);
    float _768 = fma(_734, _756, _760);
    float _770 = fma(_748, _756, _762);
    float _772 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _764);
    float _774 = _702 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _778 = fma(_724, _756, _766);
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _782 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = _768 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _776);
    float _788 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _790 = _702 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _784);
    float _796 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _798 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    float _800 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _804 = _788 + _796;
    float _806 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _808 = _800 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _808 + _816;
    float _820 = _812 * _812;
    float _822 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _824 = fma(_818, _818, _820);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _822);
    float _828 = sqrt(_824);
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _832);
    float _838 = 1.0 / _834;
    float _840 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].z, _836);
    float _842 = _768 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _834;
    float _852 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].z, _846);
    float _854 = _814 + _852;
    float _856 = _852;
    float _858 = _842;
    float _860 = _834;
    float _862 = _850;
    float _864 = _660;
    if (_684)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _850 * _838;
    float _870 = _868 * 0.5;
    float _872 = _866;
    float _874 = _870;
    if (!_848)
    {
        _858 = _808;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _804;
    }
    float _880 = _860;
    float _882 = _880;
    if (!_848)
    {
        _862 = _854;
    }
    float _884 = _862;
    bool _886 = !_848;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _828 + _892;
        float _896 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_824);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_854, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_812, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _878 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _878;
    float _930 = _882;
    if (!_684)
    {
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _940 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _938);
        float _942 = _934 * 6.283185482025146484375;
        float _944 = cos(_942);
        float _946 = _936 * 0.15915493667125701904296875;
        float _948 = _934 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = 1.0 / _944;
        float _954 = _946 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _950 * _952;
        float _960 = _946 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _956 * _958;
        float _966 = 1.0 / _940;
        float _968 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _970 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _968;
        float _972 = 1.0 / _964;
        float _974 = 1.0 / _970;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _978 = _966 * _976;
        float _980 = _962 * _972;
        float _982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _984 = fma(_980, _978, _982);
        float _986 = _984 * _974;
        float _988 = precise::clamp(_986, 0.0, 1.0);
        _872 = _988;
    }
    float _990 = _872;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _926 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _928 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _930 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = sqrt(_1008);
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1016 = _998 * _1014;
    float _1018 = _1002 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 * _1018;
    float _1024 = _1020 + _1022;
    float _1026 = sqrt(_1024);
    bool _1028 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1026 + _1030;
    float _1034 = _1010;
    float _1036 = _1024;
    float _1038 = _1032;
    float _1040 = _994;
    if (_1028)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1042;
    }
    float _1044 = _1034;
    if (_1028)
    {
        float _1046 = rsqrt(_1024);
        _1036 = _1046;
    }
    float _1048 = _1036;
    float _1050 = _1048;
    if (_1028)
    {
        float _1052 = _1032 * _1044;
        _1038 = _1052;
    }
    float _1054 = _1038;
    if (_1028)
    {
        float _1056 = _1054 * 0.15915493667125701904296875;
        _874 = _1056;
    }
    float _1058 = _874;
    float _1060 = _1002;
    float _1062 = _1058;
    if (_1028)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1060 = _1066;
    }
    float _1068 = _1060;
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1072 = precise::max(0.0, _1070);
    float _1074 = _1044;
    float _1076 = _1072;
    if (_1028)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1014;
    float _1086 = -_1072;
    float _1088 = fma(_994, _1084, _1086);
    if (_1028)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1090;
    }
    float _1092 = _1040;
    float _1094 = _1092;
    float _1096 = _1068;
    if (_1028)
    {
        float _1098 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1094 = _1098;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (!_1028)
    {
        _1096 = _1016;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    float _1108 = _1082;
    if (_1028)
    {
        float _1110 = _1082 + (-1.0);
        _1076 = _1110;
    }
    float _1112 = _1076;
    float _1114 = 0.0;
    float _1116 = _1112;
    if (_1028)
    {
        float _1118 = _1048 * _1100;
        _1114 = _1118;
    }
    float _1120 = _1114;
    if (!_1028)
    {
        _1102 = _1088;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1028)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1062 = _1126;
    }
    float _1128 = _1062;
    if (_1028)
    {
        float _1130 = _1016 * _1120;
        _1106 = _1130;
    }
    float _1132 = _1106;
    if (!_1028)
    {
        _1116 = _1018;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1028)
    {
        float _1138 = _1018 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (!_1028)
    {
        _1050 = _1020;
    }
    float _1142 = _1050;
    float _1144 = _1142;
    if (_1028)
    {
        float _1146 = fma(_1088, _1082, _1128);
        _1124 = _1146;
    }
    float _1148 = _1124;
    if (_1028)
    {
        float _1150 = _1132 * _1132;
        _1144 = _1150;
    }
    float _1152 = _1144;
    if (!_1028)
    {
        _1108 = _1022;
    }
    float _1154 = _1108;
    float _1156 = _1154;
    if (_1028)
    {
        float _1158 = _1140 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1148, _1148, _1152);
    float _1164 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1162 + _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1174 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1172);
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1180 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1184 = -_1176;
    float _1186 = _1184 + 1.0;
    float _1188 = rsqrt(_1170);
    float _1190 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1192 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1194 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1196 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = abs(_1186);
    float _1204 = log2(_1202);
    float _1206 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1188 * _1132;
    float _1222 = _1188 * _1148;
    float _1224 = _1188 * _1140;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = -_1212;
    float _1234 = fma(_1232, _1166, 1.0);
    float _1236 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = -_1228;
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1248 = -_1224;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1240);
    float _1252 = log2(_1234);
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1256 = _1222 + 1.0;
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1254);
    float _1264 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1244);
    float _1266 = exp2(_1242);
    float _1268 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1262);
    float _1270 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1274 = fma(_1260, _1270, -0.212114393711090087890625);
    float _1276 = 1.0 / _1246;
    float _1278 = _1252 * 0.693147182464599609375;
    float _1280 = fma(_1260, _1274, 1.570728778839111328125);
    float _1282 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1284 = sqrt(_1258);
    float _1286 = -_1222;
    float _1288 = fma(_1266, _1256, _1286);
    float _1290 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1272 * _1276;
    float _1296 = _1290 * _1276;
    float _1298 = fma(_1294, 0.5, 0.5);
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1284 * 0.636619746685028076171875;
    float3 _3907 = float3(_1298, _1300, _1282);
    float _1304 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).x;
    float _1306 = -_1280;
    float _1308 = fma(_1302, _1306, 1.0);
    float3 _3923 = float3(_1298, _1300, _1282);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3923, float3(0.0), isnan(_3923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3923, float3(0.0), isnan(_3923)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _3940 = float2(_1308, _1292);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = in.m_53.w;
    bool _1333 = _662 != 0.0;
    bool _1335 = isnan(_662);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1345 = in.m_61.y;
    bool _1347 = _660 == 0.0;
    bool _1349 = !_1341;
    bool _1351 = _1347 && _1349;
    float _1353 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_61.x;
    bool _1361 = _664 == 0.0;
    bool _1363 = _1361 && _1351;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1367 = _1365 != 0;
    float _1369 = in.m_63.x;
    float _1371 = in.m_63.y;
    float _1373 = in.m_63.z;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1377 = _1375 != 0;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1383 = _1381 != 0;
    out.m_65.x = _718;
    out.m_65.y = _700;
    out.m_65.z = _736;
    bool _1385 = _178 > 0.5;
    out.m_67.x = _928;
    out.m_67.y = _926;
    out.m_67.z = _930;
    float _1387 = exp2(_1353);
    bool _1389 = _1331 > 0.5;
    float _1391 = -_1345;
    float _1393 = _1391 + 1.0;
    out.m_69.y = _1345;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1300;
    bool _1399 = _1383;
    float _1401 = _1345;
    bool _1403 = _1389;
    float _1405 = _1246;
    float _1407 = _1290;
    float _1409 = _1272;
    if (!_1357)
    {
        _1397 = _1359;
    }
    float _1411 = _1397;
    int _1413 = _1389 ? as_type<int>(_1393) : as_type<int>(_1345);
    float _1415 = _1371;
    float _1417 = _1373;
    float _1419 = _1411;
    float _1421 = _1369;
    int _1423 = as_type<int>(_1343);
    if (!_1363)
    {
        float _1425 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1357)
    {
        _272 = _1411;
    }
    float _1429 = _272;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1433 = _1383 ? as_type<float>(_1413) : _1345;
    float _1435 = _1429;
    if (!_1363)
    {
        float _1437 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1417 = _1437;
    }
    float _1439 = _1417;
    if (_1367)
    {
        bool _1441 = _164 > 0.5;
        _1399 = _1441;
    }
    bool _1443 = _1399;
    float _1445 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1447 = as_type<int>(_1445);
    if (_1357)
    {
        _1419 = _1359;
    }
    float _1449 = _1419;
    if (!_1363)
    {
        float _1451 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1421 = _1451;
    }
    float _1453 = _1421;
    if (_1377)
    {
        float _1455 = _1385 ? _1393 : _1345;
        _1401 = _1455;
    }
    float _1457 = _1401;
    float _1459 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = fma(_1433, _1445, -0.5);
    if (_1357)
    {
        float _1463 = -_1449;
        float _1465 = _1463 + 1.0;
        _1447 = as_type<int>(_1465);
    }
    int _1467 = _1447;
    if (_1357)
    {
        bool _1469 = _166 > 0.5;
        _1403 = _1469;
    }
    bool _1471 = _1403;
    float _1473 = fma(_1459, _1457, -0.5);
    if (_1367)
    {
        float _1475 = -_1449;
        float _1477 = _1475 + 1.0;
        _1423 = as_type<int>(_1477);
    }
    int _1479 = _1423;
    float _1481 = -_1427;
    float _1483 = _688 * _1481;
    if (_1357)
    {
        float _1485 = _1471 ? as_type<float>(_1467) : _1449;
        _1435 = _1485;
    }
    float _1487 = _1435;
    float _1489 = -_386;
    float _1491 = fma(_548, _1473, _1489);
    if (!_1367)
    {
        _864 = _1449;
    }
    float _1493 = _864;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1497 = _1493;
    if (_1367)
    {
        float _1499 = _1443 ? as_type<float>(_1479) : _1449;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1507 = fma(_1495, _1487, -0.5);
    float _1509 = fma(_746, _1453, _1483);
    float _1511 = fma(_1503, _1501, -0.5);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = fma(_544, _1507, _374);
    float _1517 = _742 * _1427;
    float _1519 = fma(_486, _1511, _458);
    float _1521 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = -_448;
    float _1525 = fma(_558, _1461, _1523);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = fma(_722, _1453, _1517);
    float _1535 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    float _1537 = in.m_71.w;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _744 * _1427;
    float _1549 = fma(_734, _1439, _1533);
    float _1551 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1553 = -_1387;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_730, _1453, _1547);
    float _1559 = fma(_748, _1439, _1509);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_73.x = _1541;
    out.m_73.y = _1543;
    out.m_73.z = _1545;
    out.m_73.w = _1539;
    float _1563 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1565 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1571 = fma(_724, _1439, _1557);
    float _1573 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1561);
    float _1575 = _1563 + _1246;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1573);
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1577);
    float _1595 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1579);
    float _1597 = -_1587;
    float _1599 = _1597 + 1.0;
    out.m_75.x = _1513;
    out.m_75.y = _1583;
    out.m_75.z = _1585;
    out.m_75.w = _1581;
    bool _1601 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1603 = isnan(_1012);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1595);
    out.m_77.w = _1537;
    out.m_79.x = _1589;
    out.m_79.y = _1593;
    out.m_79.z = _1611;
    out.gl_Position.x = _1272;
    out.gl_Position.y = _1290;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1246;
    float _1613 = _1491 + 0.5;
    float _1615 = _1525 + 0.5;
    float _1617 = _1515 + 0.5;
    float _1619 = _1519 + 0.5;
    out.m_81.z = _1591;
    out.m_81.w = _1246;
    out.m_83.x = _1617;
    out.m_83.y = _1613;
    out.m_83.z = _1619;
    out.m_83.w = _1615;
    float _1621 = _1563;
    float _1623 = _1599;
    if (!_1609)
    {
        _1405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1625 = _1405;
    float _1627 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1609)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1609)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1639 = _1407;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1609)
    {
        _1409 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1645 = _1409;
    float _1647 = _1587 * _1304;
    float _1649 = _1319 * _1647;
    float _1651 = _1319 * _1599;
    float _1653 = _1649;
    float _1655 = _1645;
    float _1657 = _1645;
    if (!_1609)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1659 = _1623;
    float _1661 = _1329 * _1647;
    float _1663 = fma(_1325, _1649, _1313);
    float _1665 = fma(_1327, _1649, _1315);
    float _1667 = _1659;
    float _1669 = _1659;
    if (!_1609)
    {
        _1653 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1671 = _1653;
    float _1673 = fma(_1319, _1661, _1317);
    out.m_85.x = _1663;
    out.m_85.y = _1665;
    out.m_85.z = _1673;
    out.m_85.w = _1651;
    bool _1675 = !_1609;
    float _1677 = _1671;
    float _1679 = _1671;
    if (!_1675)
    {
        bool _1681 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1683 = isnan(_1012);
        bool _1685 = _1681 || _1683;
        bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1689 = _1685 || _1687;
        if (!_1689)
        {
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1693 = _1012 + _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1703 = 1.0 / _1697;
            float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1721 = _1693 * _1703;
            float _1723 = precise::clamp(_1721, 0.0, 1.0);
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1729 = fma(_1723, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1723, _1727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1733 = fma(_1723, _1707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1735 = fma(_1723, _1711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1737 = fma(_1723, _1715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1739 = fma(_1723, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1669 = _1733;
            _1643 = _1737;
            _1679 = _1729;
            _1637 = _1735;
            _1631 = _1731;
            _1657 = _1739;
            _1741 = true;
        }
        else
        {
            bool _1743 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1745 = isnan(_1012);
            bool _1747 = _1743 || _1745;
            bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1751 = _1747 || _1749;
            if (!_1751)
            {
                _1677 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1753 = _1677;
            _1679 = _1753;
            if (!_1751)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1755 = _1667;
            _1669 = _1755;
            if (!_1751)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1757 = _1629;
            _1631 = _1757;
            if (!_1751)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1759 = _1635;
            _1637 = _1759;
            if (!_1751)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1761 = _1641;
            _1643 = _1761;
            if (!_1751)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1763 = _1655;
            bool _1765 = !_1751;
            _1657 = _1763;
            if (!_1765)
            {
                bool _1767 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1769 = isnan(_1012);
                bool _1771 = _1767 || _1769;
                bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1775 = _1771 || _1773;
                if (!_1775)
                {
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1779 = _1012 + _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1789 = 1.0 / _1783;
                    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1807 = _1779 * _1789;
                    float _1809 = precise::clamp(_1807, 0.0, 1.0);
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1815 = fma(_1809, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1819 = fma(_1809, _1793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1821 = fma(_1809, _1797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1823 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1825 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1669 = _1819;
                    _1643 = _1823;
                    _1679 = _1815;
                    _1637 = _1821;
                    _1631 = _1817;
                    _1657 = _1825;
                    _1741 = true;
                }
                else
                {
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1679 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1741 = false;
    float _1827 = _1669;
    float _1829 = _1643;
    float _1831 = _1679;
    float _1833 = _1637;
    float _1835 = _1631;
    float _1837 = _1657;
    float _1839 = fma(_1593, -0.5, 0.5);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1827;
    float _1845 = _1843 + _1829;
    float _1847 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = -_1831;
    float _1851 = _1849 + _1833;
    float _1853 = fma(_1841, _1845, _1827);
    out.m_87.x = 0.0;
    float _1855 = -_1835;
    float _1857 = _1855 + _1837;
    float _1859 = fma(_1841, _1851, _1831);
    float _1861 = _1853 * 0.586610972881317138671875;
    out.m_47.x = _1847;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1841, _1857, _1835);
    float _1867 = fma(_1859, 0.298911988735198974609375, _1861);
    bool _1869 = _990 > 0.0;
    bool _1871 = isnan(_990);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = fma(_1865, 0.114477999508380889892578125, _1867);
    float _1881 = -_1879;
    float _1883 = _1859 + _1881;
    float _1885 = -_1879;
    float _1887 = _1853 + _1885;
    float _1889 = -_1879;
    float _1891 = _1865 + _1889;
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1897 = fma(_1891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    bool _1899 = !_1863;
    if (!_1899)
    {
        float _1901 = -_926;
        float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1905 = -_928;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1909 = -_930;
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1913 = _1903 * _1903;
        float _1915 = fma(_1907, _1907, _1913);
        float _1917 = fma(_1911, _1911, _1915);
        float _1919 = sqrt(_1917);
        float _1921 = rsqrt(_1917);
        float _1923 = -_1919;
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1929 = precise::clamp(_1927, 0.0, 1.0);
        float _1931 = _1907 * _1921;
        float _1933 = _1903 * _1921;
        float _1935 = abs(_1929);
        float _1937 = log2(_1935);
        float _1939 = _1911 * _1921;
        float _1941 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1943 = _1593 * _1933;
        float _1945 = -_1933;
        float _1947 = -_1941;
        float _1949 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1947);
        float _1951 = fma(_1589, _1931, _1943);
        float _1953 = -_1939;
        float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1949);
        float _1957 = fma(_1611, _1939, _1951);
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1963 = _1955 + _1961;
        float _1965 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = exp2(_1965);
        float _1973 = _1971 * _1969;
        float _1975 = _1959 * _1973;
        float _1977 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1977;
        out.m_87.y = _1979;
        out.m_87.z = _1981;
    }
    out.m_89.x = _1893;
    out.m_89.y = _1895;
    out.m_89.z = _1897;
    if (_1877)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1983;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1741 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2039 = as_type<float>(_122);
        out.gl_Position.z = _2039;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2111 = as_type<float>(_162);
        out.gl_Position.z = _2111;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.z;
    float _166 = in.m_53.x;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _184 = _182 != 0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _164 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _194 = floor(_188);
    float _196 = _178 * 2.0;
    float _198 = -_180;
    float _200 = fma(_192, 2.0, _198);
    float _202 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _204 = floor(_190);
    float _206 = fma(_202, -2.0, _186);
    float _208 = floor(_196);
    bool _210 = _194 >= 0.0;
    bool _212 = isnan(_194);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = _194 > 0.0;
    float _222 = _178 + _166;
    bool _224 = _204 > 0.0;
    float _226 = _222 + (-1.0);
    bool _228 = _204 >= 0.0;
    bool _230 = isnan(_204);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = _218 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _242 = _208 > 0.0;
    bool _244 = _208 >= 0.0;
    bool _246 = isnan(_208);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _256 = ~as_type<int>(_238);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    int _262 = _260;
    float _264 = _202;
    float _266 = _238;
    float _268 = _226;
    float _270 = _254;
    float _272 = _178;
    if (!_220)
    {
        int _274 = ~as_type<int>(_238);
        int _276 = _274 + 1;
        _262 = _276;
    }
    int _278 = _262;
    float _280 = 0.0;
    if (!_176)
    {
        float _282 = _254 * _254;
        float _284 = _282 * 0.5;
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _286;
    if (!_176)
    {
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _290;
    }
    float _292 = _288;
    bool _294 = !_176;
    float _296 = _292;
    if (!_294)
    {
        float _298 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = log2(_298);
        float _302 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _304 = _302 + 1.0;
        float _306 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = _254 * _300;
        float _310 = 1.0 / _304;
        float _312 = _306 * 0.693147182464599609375;
        float _314 = exp2(_308);
        float _316 = 1.0 / _312;
        float _318 = _314 + (-1.0);
        float _320 = -_318;
        float _322 = fma(_320, _316, _254);
        float _324 = _322 * _310;
        float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _312;
        _266 = _304;
        _268 = _314;
        _296 = _326;
    }
    float _328 = _264;
    float _330 = _266;
    float _332 = _268;
    float _334 = _296;
    bool _336 = !_176;
    float _338 = _328;
    float _340 = _330;
    float _342 = _332;
    if (!_336)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _254 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _338 = _356;
        _270 = _362;
    }
    float _364 = _338;
    float _366 = _270;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -_134;
    float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    float _376 = _364;
    if (!_184)
    {
        _340 = _178;
    }
    float _378 = _340;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _382 = _378;
    if (!_184)
    {
        _342 = _164;
    }
    float _384 = _342;
    float _386 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _206);
    float _388 = _384;
    if (!_184)
    {
        _376 = _164;
    }
    float _390 = _376;
    float _392 = _390;
    if (_184)
    {
        _382 = _166;
    }
    float _394 = _382;
    if (_184)
    {
        _388 = _178;
    }
    float _396 = _388;
    float _398 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].z, _380);
    if (_184)
    {
        _392 = _178;
    }
    float _400 = _392;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _414 = _412 != 0;
    float _416 = _394 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _418 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    bool _422 = !_406;
    int _424 = _422 ? 0 : 1;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _428 = _370 * _134;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _432 = abs(_424);
    float _434 = -_426;
    float _436 = fma(_416, 2.0, _434);
    int _438 = _236 ? 0 : 1;
    float _440 = fma(_418, -2.0, _430);
    float _442 = float(_278);
    float _444 = exp2(_428);
    float _446 = float(_432);
    float _448 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _440);
    int _450 = ~_438;
    int _452 = _450 + 1;
    int _454 = _452 + 1;
    float _456 = -_134;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[81].x, _436);
    int _460 = _454;
    if (!_224)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * _442;
    int _470 = _252 ? 0 : 1;
    float _472 = in.m_55.x;
    float _474 = in.m_55.y;
    float _476 = in.m_55.z;
    float _478 = _468 * (-2.0);
    int _480 = ~_470;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _398);
    int _488 = _484;
    if (!_242)
    {
        int _490 = ~_470;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = -_444;
    float _502 = _500 + 1.0;
    float _504 = fma(_240, _478, _240);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _518 = 1.0 / _498;
    bool _520 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _532 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _516);
    bool _534 = !_410;
    int _536 = _534 ? 0 : 1;
    float _538 = _166 + (-0.5);
    float _540 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _530);
    float _542 = _528 ? _502 : 0.0;
    float _544 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    int _546 = abs(_536);
    float _548 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _540);
    float _550 = float(_466);
    float _552 = fma(_478, _472, _472);
    float _554 = float(_546);
    float _556 = _178 + _164;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _420);
    bool _560 = !_414;
    int _562 = _560 ? 0 : 1;
    if (_514)
    {
        float _564 = _542 * _518;
        _156 = _564;
    }
    float _566 = _156;
    float _568 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[196].x, _552);
    float _570 = _554 * _550;
    float _572 = _556 + (-1.0);
    int _574 = abs(_562);
    float _576 = fma(_504, _566, _568);
    float _578 = float(_494);
    float _580 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _582 = _570 * (-2.0);
    float _584 = float(_574);
    float _586 = _576 * 0.15915493667125701904296875;
    float _588 = fma(_580, _582, _580);
    float _590 = fma(_582, _474, _474);
    float _592 = in.m_49.x;
    float _594 = in.m_49.y;
    float _596 = in.m_49.z;
    float _598 = _584 * _578;
    float _600 = _166 + _164;
    float _602 = _178 + (-0.5);
    float _604 = _164 + (-0.5);
    float _606 = _598 * (-2.0);
    float _608 = _600 + (-1.0);
    float _610 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _590);
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_606, _476, _476);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = fma(_588, _566, _610);
    float _622 = in.m_44.x;
    float _624 = in.m_44.y;
    float _626 = in.m_44.z;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].z, _616);
    float _630 = fma(_618, _606, _618);
    float _632 = _620 * 0.15915493667125701904296875;
    float _634 = _586 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = in.m_57.x;
    float _640 = in.m_57.y;
    float _642 = in.m_57.z;
    float _644 = in.m_57.w;
    float _646 = fma(_630, _566, _628);
    float _648 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _650 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _652 = _646 * 0.15915493667125701904296875;
    float _654 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _656 = _632 * 6.283185482025146484375;
    float _658 = sin(_656);
    float _660 = in.m_59.x;
    float _662 = in.m_59.y;
    float _664 = in.m_59.z;
    float _666 = fma(_366, _596, _648);
    float _668 = fma(_366, _592, _650);
    float _670 = fma(_366, _594, _654);
    float _672 = _632 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _678 = isnan(0.5);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _684 = _680 || _682;
    float _686 = _652 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _614 * _658;
    float _692 = _640 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _694 = _638 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _696 = _636 * _658;
    float _698 = fma(_668, _644, _622);
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _702 = fma(_670, _644, _624);
    float _704 = _652 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = _636 * _674;
    float _710 = _614 * _674;
    float _712 = fma(_666, _644, _626);
    float _714 = _642 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _718 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _722 = fma(_688, _708, _690);
    float _724 = fma(_688, _690, _708);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _728 = -_696;
    float _730 = fma(_688, _710, _728);
    float _732 = -_710;
    float _734 = fma(_688, _696, _732);
    float _736 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _738 = _700 * _726;
    float _740 = _718 * _716;
    float _742 = _636 * _706;
    float _744 = _614 * _706;
    float _746 = _674 * _706;
    float _748 = _658 * _706;
    float _750 = _742 * _738;
    float _752 = -_738;
    float _754 = _688 * _752;
    float _756 = _736 * _720;
    float _758 = _744 * _738;
    float _760 = fma(_722, _740, _750);
    float _762 = fma(_746, _740, _754);
    float _764 = _702 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _766 = fma(_730, _740, _758);
    float _768 = fma(_734, _756, _760);
    float _770 = fma(_748, _756, _762);
    float _772 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _764);
    float _774 = _702 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _778 = fma(_724, _756, _766);
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _782 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = _768 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].x, _776);
    float _788 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _790 = _702 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _792 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].x, _784);
    float _796 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _798 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _790);
    float _800 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _802 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].z, _794);
    float _804 = _788 + _796;
    float _806 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _808 = _800 + _802;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _812 = _804 + _810;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _808 + _816;
    float _820 = _812 * _812;
    float _822 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _824 = fma(_818, _818, _820);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _822);
    float _828 = sqrt(_824);
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].z, _826);
    float _832 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _834 = _830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _832);
    float _838 = 1.0 / _834;
    float _840 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].z, _836);
    float _842 = _768 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _844 = _840 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].x, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _834;
    float _852 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].z, _846);
    float _854 = _814 + _852;
    float _856 = _852;
    float _858 = _842;
    float _860 = _834;
    float _862 = _850;
    float _864 = _660;
    if (_684)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _850 * _838;
    float _870 = _868 * 0.5;
    float _872 = _866;
    float _874 = _870;
    if (!_848)
    {
        _858 = _808;
    }
    float _876 = _858;
    float _878 = _876;
    if (!_848)
    {
        _860 = _804;
    }
    float _880 = _860;
    float _882 = _880;
    if (!_848)
    {
        _862 = _854;
    }
    float _884 = _862;
    bool _886 = !_848;
    float _888 = _884;
    if (!_886)
    {
        float _890 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _894 = _828 + _892;
        float _896 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = rsqrt(_824);
        float _900 = _894 * _890;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _902 * 6.283185482025146484375;
        float _906 = cos(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        float _912 = _906 + (-1.0);
        float _914 = _912 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _916 = fma(_910, _896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _918 = fma(_854, _906, _914);
        float _920 = _898 * _916;
        float _922 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _924 = fma(_812, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _888 = _918;
        _878 = _922;
        _882 = _924;
    }
    float _926 = _888;
    float _928 = _878;
    float _930 = _882;
    if (!_684)
    {
        float _932 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _934 = _932 * 0.15915493667125701904296875;
        float _936 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _938 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _940 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _938);
        float _942 = _934 * 6.283185482025146484375;
        float _944 = cos(_942);
        float _946 = _936 * 0.15915493667125701904296875;
        float _948 = _934 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = 1.0 / _944;
        float _954 = _946 * 6.283185482025146484375;
        float _956 = cos(_954);
        float _958 = _950 * _952;
        float _960 = _946 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _956 * _958;
        float _966 = 1.0 / _940;
        float _968 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _970 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _968;
        float _972 = 1.0 / _964;
        float _974 = 1.0 / _970;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _978 = _966 * _976;
        float _980 = _962 * _972;
        float _982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _984 = fma(_980, _978, _982);
        float _986 = _984 * _974;
        float _988 = precise::clamp(_986, 0.0, 1.0);
        _872 = _988;
    }
    float _990 = _872;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _926 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _928 + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1002 = _930 + _1000;
    float _1004 = _994 * _994;
    float _1006 = fma(_998, _998, _1004);
    float _1008 = fma(_1002, _1002, _1006);
    float _1010 = rsqrt(_1008);
    float _1012 = sqrt(_1008);
    float _1014 = _1010 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1016 = _998 * _1014;
    float _1018 = _1002 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = _1018 * _1018;
    float _1024 = _1020 + _1022;
    float _1026 = sqrt(_1024);
    bool _1028 = _1026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1026 + _1030;
    float _1034 = _1010;
    float _1036 = _1024;
    float _1038 = _1032;
    float _1040 = _994;
    if (_1028)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1042;
    }
    float _1044 = _1034;
    if (_1028)
    {
        float _1046 = rsqrt(_1024);
        _1036 = _1046;
    }
    float _1048 = _1036;
    float _1050 = _1048;
    if (_1028)
    {
        float _1052 = _1032 * _1044;
        _1038 = _1052;
    }
    float _1054 = _1038;
    if (_1028)
    {
        float _1056 = _1054 * 0.15915493667125701904296875;
        _874 = _1056;
    }
    float _1058 = _874;
    float _1060 = _1002;
    float _1062 = _1058;
    if (_1028)
    {
        float _1064 = _1058 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        _1060 = _1066;
    }
    float _1068 = _1060;
    float _1070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1072 = precise::max(0.0, _1070);
    float _1074 = _1044;
    float _1076 = _1072;
    if (_1028)
    {
        float _1078 = _1058 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        _1074 = _1080;
    }
    float _1082 = _1074;
    float _1084 = -_1014;
    float _1086 = -_1072;
    float _1088 = fma(_994, _1084, _1086);
    if (_1028)
    {
        float _1090 = _1088 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1090;
    }
    float _1092 = _1040;
    float _1094 = _1092;
    float _1096 = _1068;
    if (_1028)
    {
        float _1098 = fma(_1068, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1094 = _1098;
    }
    float _1100 = _1094;
    float _1102 = _1100;
    if (!_1028)
    {
        _1096 = _1016;
    }
    float _1104 = _1096;
    float _1106 = _1104;
    float _1108 = _1082;
    if (_1028)
    {
        float _1110 = _1082 + (-1.0);
        _1076 = _1110;
    }
    float _1112 = _1076;
    float _1114 = 0.0;
    float _1116 = _1112;
    if (_1028)
    {
        float _1118 = _1048 * _1100;
        _1114 = _1118;
    }
    float _1120 = _1114;
    if (!_1028)
    {
        _1102 = _1088;
    }
    float _1122 = _1102;
    float _1124 = _1122;
    if (_1028)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1062 = _1126;
    }
    float _1128 = _1062;
    if (_1028)
    {
        float _1130 = _1016 * _1120;
        _1106 = _1130;
    }
    float _1132 = _1106;
    if (!_1028)
    {
        _1116 = _1018;
    }
    float _1134 = _1116;
    float _1136 = _1134;
    if (_1028)
    {
        float _1138 = _1018 * _1120;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (!_1028)
    {
        _1050 = _1020;
    }
    float _1142 = _1050;
    float _1144 = _1142;
    if (_1028)
    {
        float _1146 = fma(_1088, _1082, _1128);
        _1124 = _1146;
    }
    float _1148 = _1124;
    if (_1028)
    {
        float _1150 = _1132 * _1132;
        _1144 = _1150;
    }
    float _1152 = _1144;
    if (!_1028)
    {
        _1108 = _1022;
    }
    float _1154 = _1108;
    float _1156 = _1154;
    if (_1028)
    {
        float _1158 = _1140 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = fma(_1148, _1148, _1152);
    float _1164 = _926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1168 = _926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1170 = _1162 + _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1174 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1172);
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1180 = _926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1168);
    float _1184 = -_1176;
    float _1186 = _1184 + 1.0;
    float _1188 = rsqrt(_1170);
    float _1190 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1192 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1194 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1196 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1190);
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = _926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = abs(_1186);
    float _1204 = log2(_1202);
    float _1206 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1208 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1210 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1218 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1188 * _1132;
    float _1222 = _1188 * _1148;
    float _1224 = _1188 * _1140;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1214);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = -_1212;
    float _1234 = fma(_1232, _1166, 1.0);
    float _1236 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1226);
    float _1238 = -_1228;
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1216);
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1236);
    float _1248 = -_1224;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1240);
    float _1252 = log2(_1234);
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1256 = _1222 + 1.0;
    float _1258 = fma(_1250, -0.5, 0.5);
    float _1260 = fma(_1250, 0.5, 0.5);
    float _1262 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1254);
    float _1264 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1244);
    float _1266 = exp2(_1242);
    float _1268 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1262);
    float _1270 = fma(_1260, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1274 = fma(_1260, _1270, -0.212114393711090087890625);
    float _1276 = 1.0 / _1246;
    float _1278 = _1252 * 0.693147182464599609375;
    float _1280 = fma(_1260, _1274, 1.570728778839111328125);
    float _1282 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1284 = sqrt(_1258);
    float _1286 = -_1222;
    float _1288 = fma(_1266, _1256, _1286);
    float _1290 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1264);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1272 * _1276;
    float _1296 = _1290 * _1276;
    float _1298 = fma(_1294, 0.5, 0.5);
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1284 * 0.636619746685028076171875;
    float3 _3907 = float3(_1298, _1300, _1282);
    float _1304 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3907, float3(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3907, float3(0.0), isnan(_3907)), level(0.0)).x;
    float _1306 = -_1280;
    float _1308 = fma(_1302, _1306, 1.0);
    float3 _3923 = float3(_1298, _1300, _1282);
    float4 _1311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3923, float3(0.0), isnan(_3923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3923, float3(0.0), isnan(_3923)), level(0.0)).xyzw;
    float _1313 = _1311.x;
    float _1315 = _1311.y;
    float _1317 = _1311.z;
    float _1319 = _1311.w;
    float2 _3940 = float2(_1308, _1292);
    float3 _1323 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1325 = _1323.x;
    float _1327 = _1323.y;
    float _1329 = _1323.z;
    float _1331 = in.m_53.w;
    bool _1333 = _662 != 0.0;
    bool _1335 = isnan(_662);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1345 = in.m_61.y;
    bool _1347 = _660 == 0.0;
    bool _1349 = !_1341;
    bool _1351 = _1347 && _1349;
    float _1353 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_61.x;
    bool _1361 = _664 == 0.0;
    bool _1363 = _1361 && _1351;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1367 = _1365 != 0;
    float _1369 = in.m_63.x;
    float _1371 = in.m_63.y;
    float _1373 = in.m_63.z;
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1377 = _1375 != 0;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1383 = _1381 != 0;
    out.m_65.x = _718;
    out.m_65.y = _700;
    out.m_65.z = _736;
    bool _1385 = _178 > 0.5;
    out.m_67.x = _928;
    out.m_67.y = _926;
    out.m_67.z = _930;
    float _1387 = exp2(_1353);
    bool _1389 = _1331 > 0.5;
    float _1391 = -_1345;
    float _1393 = _1391 + 1.0;
    out.m_69.y = _1345;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1300;
    bool _1399 = _1383;
    float _1401 = _1345;
    bool _1403 = _1389;
    float _1405 = _1246;
    float _1407 = _1290;
    float _1409 = _1272;
    if (!_1357)
    {
        _1397 = _1359;
    }
    float _1411 = _1397;
    int _1413 = _1389 ? as_type<int>(_1393) : as_type<int>(_1345);
    float _1415 = _1371;
    float _1417 = _1373;
    float _1419 = _1411;
    float _1421 = _1369;
    int _1423 = as_type<int>(_1343);
    if (!_1363)
    {
        float _1425 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1415 = _1425;
    }
    float _1427 = _1415;
    if (!_1357)
    {
        _272 = _1411;
    }
    float _1429 = _272;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1433 = _1383 ? as_type<float>(_1413) : _1345;
    float _1435 = _1429;
    if (!_1363)
    {
        float _1437 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1417 = _1437;
    }
    float _1439 = _1417;
    if (_1367)
    {
        bool _1441 = _164 > 0.5;
        _1399 = _1441;
    }
    bool _1443 = _1399;
    float _1445 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1447 = as_type<int>(_1445);
    if (_1357)
    {
        _1419 = _1359;
    }
    float _1449 = _1419;
    if (!_1363)
    {
        float _1451 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1421 = _1451;
    }
    float _1453 = _1421;
    if (_1377)
    {
        float _1455 = _1385 ? _1393 : _1345;
        _1401 = _1455;
    }
    float _1457 = _1401;
    float _1459 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = fma(_1433, _1445, -0.5);
    if (_1357)
    {
        float _1463 = -_1449;
        float _1465 = _1463 + 1.0;
        _1447 = as_type<int>(_1465);
    }
    int _1467 = _1447;
    if (_1357)
    {
        bool _1469 = _166 > 0.5;
        _1403 = _1469;
    }
    bool _1471 = _1403;
    float _1473 = fma(_1459, _1457, -0.5);
    if (_1367)
    {
        float _1475 = -_1449;
        float _1477 = _1475 + 1.0;
        _1423 = as_type<int>(_1477);
    }
    int _1479 = _1423;
    float _1481 = -_1427;
    float _1483 = _688 * _1481;
    if (_1357)
    {
        float _1485 = _1471 ? as_type<float>(_1467) : _1449;
        _1435 = _1485;
    }
    float _1487 = _1435;
    float _1489 = -_386;
    float _1491 = fma(_548, _1473, _1489);
    if (!_1367)
    {
        _864 = _1449;
    }
    float _1493 = _864;
    float _1495 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1497 = _1493;
    if (_1367)
    {
        float _1499 = _1443 ? as_type<float>(_1479) : _1449;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1507 = fma(_1495, _1487, -0.5);
    float _1509 = fma(_746, _1453, _1483);
    float _1511 = fma(_1503, _1501, -0.5);
    float _1513 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = fma(_544, _1507, _374);
    float _1517 = _742 * _1427;
    float _1519 = fma(_486, _1511, _458);
    float _1521 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = -_448;
    float _1525 = fma(_558, _1461, _1523);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1533 = fma(_722, _1453, _1517);
    float _1535 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    float _1537 = in.m_71.w;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _744 * _1427;
    float _1549 = fma(_734, _1439, _1533);
    float _1551 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1553 = -_1387;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_730, _1453, _1547);
    float _1559 = fma(_748, _1439, _1509);
    float _1561 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_73.x = _1541;
    out.m_73.y = _1543;
    out.m_73.z = _1545;
    out.m_73.w = _1539;
    float _1563 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1565 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1571 = fma(_724, _1439, _1557);
    float _1573 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1561);
    float _1575 = _1563 + _1246;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1565);
    float _1579 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1583 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1585 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1587 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1573);
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1577);
    float _1595 = fma(_1559, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1579);
    float _1597 = -_1587;
    float _1599 = _1597 + 1.0;
    out.m_75.x = _1513;
    out.m_75.y = _1583;
    out.m_75.z = _1585;
    out.m_75.w = _1581;
    bool _1601 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1603 = isnan(_1012);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1609 = _1605 || _1607;
    float _1611 = fma(_1571, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1595);
    out.m_77.w = _1537;
    out.m_79.x = _1589;
    out.m_79.y = _1593;
    out.m_79.z = _1611;
    out.gl_Position.x = _1272;
    out.gl_Position.y = _1290;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1246;
    float _1613 = _1491 + 0.5;
    float _1615 = _1525 + 0.5;
    float _1617 = _1515 + 0.5;
    float _1619 = _1519 + 0.5;
    out.m_81.z = _1591;
    out.m_81.w = _1246;
    out.m_83.x = _1617;
    out.m_83.y = _1613;
    out.m_83.z = _1619;
    out.m_83.w = _1615;
    float _1621 = _1563;
    float _1623 = _1599;
    if (!_1609)
    {
        _1405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1625 = _1405;
    float _1627 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1609)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1633 = _1621;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1609)
    {
        _1407 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1639 = _1407;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1609)
    {
        _1409 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1645 = _1409;
    float _1647 = _1587 * _1304;
    float _1649 = _1319 * _1647;
    float _1651 = _1319 * _1599;
    float _1653 = _1649;
    float _1655 = _1645;
    float _1657 = _1645;
    if (!_1609)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1659 = _1623;
    float _1661 = _1329 * _1647;
    float _1663 = fma(_1325, _1649, _1313);
    float _1665 = fma(_1327, _1649, _1315);
    float _1667 = _1659;
    float _1669 = _1659;
    if (!_1609)
    {
        _1653 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1671 = _1653;
    float _1673 = fma(_1319, _1661, _1317);
    out.m_85.x = _1663;
    out.m_85.y = _1665;
    out.m_85.z = _1673;
    out.m_85.w = _1651;
    bool _1675 = !_1609;
    float _1677 = _1671;
    float _1679 = _1671;
    if (!_1675)
    {
        bool _1681 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1683 = isnan(_1012);
        bool _1685 = _1681 || _1683;
        bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1689 = _1685 || _1687;
        if (!_1689)
        {
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1693 = _1012 + _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1703 = 1.0 / _1697;
            float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1721 = _1693 * _1703;
            float _1723 = precise::clamp(_1721, 0.0, 1.0);
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1729 = fma(_1723, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1723, _1727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1733 = fma(_1723, _1707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1735 = fma(_1723, _1711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1737 = fma(_1723, _1715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1739 = fma(_1723, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1669 = _1733;
            _1643 = _1737;
            _1679 = _1729;
            _1637 = _1735;
            _1631 = _1731;
            _1657 = _1739;
            _1741 = true;
        }
        else
        {
            bool _1743 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1745 = isnan(_1012);
            bool _1747 = _1743 || _1745;
            bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1751 = _1747 || _1749;
            if (!_1751)
            {
                _1677 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1753 = _1677;
            _1679 = _1753;
            if (!_1751)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1755 = _1667;
            _1669 = _1755;
            if (!_1751)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1757 = _1629;
            _1631 = _1757;
            if (!_1751)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1759 = _1635;
            _1637 = _1759;
            if (!_1751)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1761 = _1641;
            _1643 = _1761;
            if (!_1751)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1763 = _1655;
            bool _1765 = !_1751;
            _1657 = _1763;
            if (!_1765)
            {
                bool _1767 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1769 = isnan(_1012);
                bool _1771 = _1767 || _1769;
                bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1775 = _1771 || _1773;
                if (!_1775)
                {
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1779 = _1012 + _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1789 = 1.0 / _1783;
                    float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1807 = _1779 * _1789;
                    float _1809 = precise::clamp(_1807, 0.0, 1.0);
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1815 = fma(_1809, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1809, _1813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1819 = fma(_1809, _1793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1821 = fma(_1809, _1797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1823 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1825 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1669 = _1819;
                    _1643 = _1823;
                    _1679 = _1815;
                    _1637 = _1821;
                    _1631 = _1817;
                    _1657 = _1825;
                    _1741 = true;
                }
                else
                {
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1679 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1741 = false;
    float _1827 = _1669;
    float _1829 = _1643;
    float _1831 = _1679;
    float _1833 = _1637;
    float _1835 = _1631;
    float _1837 = _1657;
    float _1839 = fma(_1593, -0.5, 0.5);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1827;
    float _1845 = _1843 + _1829;
    float _1847 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = -_1831;
    float _1851 = _1849 + _1833;
    float _1853 = fma(_1841, _1845, _1827);
    out.m_87.x = 0.0;
    float _1855 = -_1835;
    float _1857 = _1855 + _1837;
    float _1859 = fma(_1841, _1851, _1831);
    float _1861 = _1853 * 0.586610972881317138671875;
    out.m_47.x = _1847;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1841, _1857, _1835);
    float _1867 = fma(_1859, 0.298911988735198974609375, _1861);
    bool _1869 = _990 > 0.0;
    bool _1871 = isnan(_990);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = fma(_1865, 0.114477999508380889892578125, _1867);
    float _1881 = -_1879;
    float _1883 = _1859 + _1881;
    float _1885 = -_1879;
    float _1887 = _1853 + _1885;
    float _1889 = -_1879;
    float _1891 = _1865 + _1889;
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1895 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    float _1897 = fma(_1891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1879);
    bool _1899 = !_1863;
    if (!_1899)
    {
        float _1901 = -_926;
        float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1905 = -_928;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1909 = -_930;
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1913 = _1903 * _1903;
        float _1915 = fma(_1907, _1907, _1913);
        float _1917 = fma(_1911, _1911, _1915);
        float _1919 = sqrt(_1917);
        float _1921 = rsqrt(_1917);
        float _1923 = -_1919;
        float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1927 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1929 = precise::clamp(_1927, 0.0, 1.0);
        float _1931 = _1907 * _1921;
        float _1933 = _1903 * _1921;
        float _1935 = abs(_1929);
        float _1937 = log2(_1935);
        float _1939 = _1911 * _1921;
        float _1941 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1943 = _1593 * _1933;
        float _1945 = -_1933;
        float _1947 = -_1941;
        float _1949 = fma(_1945, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1947);
        float _1951 = fma(_1589, _1931, _1943);
        float _1953 = -_1939;
        float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1949);
        float _1957 = fma(_1611, _1939, _1951);
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1963 = _1955 + _1961;
        float _1965 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1969 = precise::clamp(_1967, 0.0, 1.0);
        float _1971 = exp2(_1965);
        float _1973 = _1971 * _1969;
        float _1975 = _1959 * _1973;
        float _1977 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1979 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1981 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1977;
        out.m_87.y = _1979;
        out.m_87.z = _1981;
    }
    out.m_89.x = _1893;
    out.m_89.y = _1895;
    out.m_89.z = _1897;
    if (_1877)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1983;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

