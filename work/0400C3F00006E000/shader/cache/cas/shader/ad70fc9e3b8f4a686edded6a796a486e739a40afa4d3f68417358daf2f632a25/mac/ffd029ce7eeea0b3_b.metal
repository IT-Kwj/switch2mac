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
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1852 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2137 = as_type<float>(_128);
        out.gl_Position.z = _2137;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2206 = as_type<float>(_164);
        out.gl_Position.z = _2206;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_49.y;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_49.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = in.m_49.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.x;
    float _184 = in.m_51.y;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _190 = _166 * 2.0;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _194 = _170 * 2.0;
    float _196 = fma(_188, -2.0, _172);
    float _198 = floor(_190);
    float _200 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _174 * 2.0;
    float _204 = _174 + _170;
    float _206 = -_176;
    float _208 = fma(_200, 2.0, _206);
    float _210 = _166 + _170;
    float _212 = _204 + (-1.0);
    float _214 = floor(_194);
    float _216 = _210 + (-1.0);
    float _218 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _222 = _166 + _174;
    float _224 = floor(_202);
    float _226 = _222 + (-1.0);
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _232 = _198;
    float _234 = _168;
    float _236 = _174;
    if (_180)
    {
        _228 = _174;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_180)
    {
        _240 = _170;
    }
    float _242 = _240;
    float _244 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _246 = _214 > 0.0;
    float _248 = _184 * 6.283185482025146484375;
    bool _250 = _214 >= 0.0;
    bool _252 = isnan(_214);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = _242 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _262 = fma(_182, 8.0, _248);
    if (!_180)
    {
        _230 = _166;
    }
    float _264 = _230;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _268 = _224 > 0.0;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _272 = _224 >= 0.0;
    bool _274 = isnan(_224);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _284 = log2(_282);
    float _286 = -_270;
    float _288 = fma(_260, 2.0, _286);
    int _290 = _258 ? 0 : 1;
    bool _292 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _262);
    float _304 = _264;
    if (_180)
    {
        _304 = _174;
    }
    float _306 = _304;
    float _308 = in.m_53.x;
    float _310 = in.m_53.y;
    float _312 = in.m_53.z;
    bool _314 = _198 > 0.0;
    float _316 = _302 * 0.15915493667125701904296875;
    bool _318 = _198 >= 0.0;
    bool _320 = isnan(_198);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _266);
    float _330 = _306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _332 = _280 ? 0 : 1;
    float _334 = _316 * 6.283185482025146484375;
    float _336 = sin(_334);
    float _338 = _330;
    if (!_180)
    {
        _232 = _170;
    }
    float _340 = _232;
    float _342 = 0.0;
    float _344 = _340;
    if (!_300)
    {
        float _346 = _168 * _168;
        float _348 = _346 * 0.5;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = _350;
    if (_180)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = -_192;
    float _358 = fma(_330, 2.0, _356);
    int _360 = ~_332;
    int _362 = _360 + 1;
    int _364 = _362 + 1;
    int _366 = _364;
    if (!_300)
    {
        float _368 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = _368;
    }
    float _370 = _352;
    float _372 = _370;
    if (!_268)
    {
        int _374 = ~_332;
        int _376 = _374 + 1;
        _366 = _376;
    }
    int _378 = _366;
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    int _382 = ~_290;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    int _388 = _386;
    if (!_246)
    {
        int _390 = ~_290;
        int _392 = _390 + 1;
        _388 = _392;
    }
    int _394 = _388;
    float _396 = _310 * 0.20000000298023223876953125;
    float _398 = _396 * _396;
    float _400 = fma(_308, _308, _398);
    bool _402 = !_300;
    float _404 = _398;
    if (!_402)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _416 = _168 * _408;
        float _418 = 1.0 / _412;
        float _420 = _414 * 0.693147182464599609375;
        float _422 = exp2(_416);
        float _424 = 1.0 / _420;
        float _426 = _422 + (-1.0);
        float _428 = -_426;
        float _430 = fma(_428, _424, _168);
        float _432 = _430 * _418;
        float _434 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _422;
        _404 = _424;
        _372 = _434;
    }
    float _436 = _338;
    float _438 = _404;
    float _440 = _372;
    bool _442 = !_300;
    float _444 = _436;
    float _446 = _438;
    if (!_442)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = 1.0 / _454;
        float _458 = _168 * _450;
        float _460 = exp2(_458);
        float _462 = -_460;
        float _464 = _462 + 1.0;
        float _466 = _464 * _456;
        _444 = _460;
        _234 = _466;
    }
    float _468 = _444;
    float _470 = _234;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = fma(_312, _312, _400);
    float _486 = _468;
    if (_180)
    {
        _446 = _166;
    }
    float _488 = _446;
    float _490 = _284 * _146;
    float _492 = _488;
    if (!_180)
    {
        _492 = _174;
    }
    float _494 = _492;
    float _496 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    bool _498 = !_474;
    int _500 = _498 ? 0 : 1;
    float _502 = rsqrt(_484);
    if (!_180)
    {
        _486 = _170;
    }
    float _504 = _486;
    float _506 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _328);
    float _510 = _504;
    if (_180)
    {
        _510 = _166;
    }
    float _512 = _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _516 = abs(_500);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _520 = _326 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = float(_394);
    float _526 = fma(_506, -2.0, _514);
    float _528 = float(_516);
    float _530 = fma(_518, -2.0, _522);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = exp2(_490);
    int _540 = _536;
    if (!_314)
    {
        int _542 = ~_520;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _528 * _524;
    float _550 = in.m_55.x;
    float _552 = in.m_55.y;
    float _554 = in.m_55.z;
    float _556 = _502 * _336;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    bool _566 = !_478;
    int _568 = _566 ? 0 : 1;
    float _570 = 1.0 / _562;
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = -_538;
    float _584 = _582 + 1.0;
    int _586 = abs(_568);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _602 = float(_378);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _606 = -_146;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _288);
    float _610 = _548 * (-2.0);
    float _612 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _588);
    float _614 = float(_586);
    float _616 = -_146;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _620 = _598 ? _584 : 0.0;
    float _622 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _624 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _600);
    float _626 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _604);
    float _628 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _380);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _526);
    float _632 = fma(_610, _550, _550);
    float _634 = _614 * _602;
    float _636 = fma(_244, _610, _244);
    float _638 = fma(_182, 0.5, 0.5);
    float _640 = _174 + (-0.5);
    float _642 = in.m_47.x;
    float _644 = in.m_47.y;
    float _646 = in.m_47.z;
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _208);
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    float _654 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _656 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _624);
    float _658 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _626);
    float _660 = _656;
    float _662 = _622;
    if (_580)
    {
        float _664 = _620 * _570;
        _148 = _664;
    }
    float _666 = _148;
    float _668 = _556 * 0.01200000010430812835693359375;
    float _670 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _632);
    bool _672 = !_482;
    int _674 = _672 ? 0 : 1;
    float _676 = _634 * (-2.0);
    float _678 = _638 * _668;
    float _680 = fma(_636, _666, _670);
    int _682 = abs(_674);
    float _684 = fma(_676, _552, _552);
    float _686 = _166 + (-0.5);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = float(_546);
    float _692 = fma(_220, _676, _220);
    float _694 = float(_682);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = in.m_42.x;
    float _700 = in.m_42.y;
    float _702 = in.m_42.z;
    float _704 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _706 = _688 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _694 * _690;
    float _712 = in.m_57.w;
    float _714 = fma(_692, _666, _696);
    float _716 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _718 = _710 * (-2.0);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_470, _642, _704);
    float _728 = fma(_470, _644, _716);
    float _730 = fma(_718, _554, _554);
    float _732 = _170 + (-0.5);
    float _734 = fma(_218, _718, _218);
    float _736 = fma(_396, _678, _310);
    float _738 = _714 * 0.15915493667125701904296875;
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _742 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _744 = fma(_308, _678, _308);
    float _746 = fma(_734, _666, _740);
    float _748 = _688 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_470, _646, _742);
    float _754 = fma(_312, _678, _312);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_728, _712, _700);
    float _760 = _738 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _766 = fma(_726, _712, _698);
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _770 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _772 = _764 * _744;
    float _774 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _738 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _772);
    float _786 = fma(_752, _712, _702);
    float _788 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = _756 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _764 * _736;
    float _796 = _764 * _754;
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _750 * _762;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _794);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _796);
    float _806 = _784 * _798;
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _802 * _776;
    float _814 = _804 * _782;
    float _816 = _708 * _780;
    float _818 = _750 * _780;
    float _820 = _708 * _762;
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _824 = _750 * _792;
    float _826 = _780 * _792;
    float _828 = _708 * _792;
    float _830 = _762 * _792;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _834 = _828 * _812;
    float _836 = -_800;
    float _838 = fma(_810, _816, _836);
    float _840 = -_816;
    float _842 = fma(_810, _800, _840);
    float _844 = fma(_810, _818, _820);
    float _846 = _824 * _812;
    float _848 = fma(_810, _820, _818);
    float _850 = -_812;
    float _852 = _810 * _850;
    float _854 = fma(_838, _806, _834);
    float _856 = fma(_844, _806, _846);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_826, _806, _852);
    float _862 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _864 = fma(_842, _814, _856);
    float _866 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _868 = fma(_830, _814, _860);
    float _870 = fma(_848, _814, _854);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _874 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _878 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _872);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _886 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _878);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    float _894 = _862 + _888;
    float _896 = _884 + _890;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _894 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _896 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = _892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _920 = _916 + _918;
    bool _922 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _864;
    float _928 = _918;
    if (!_922)
    {
        _924 = _896;
    }
    float _930 = _924;
    float _932 = _930;
    if (!_922)
    {
        _926 = _894;
    }
    float _934 = _926;
    float _936 = _934;
    if (!_922)
    {
        _928 = _920;
    }
    float _938 = _928;
    bool _940 = !_922;
    float _942 = _938;
    if (!_940)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _948 = _912 + _946;
        float _950 = rsqrt(_908);
        float _952 = _948 * _944;
        float _954 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = _952 * 0.15915493667125701904296875;
        float _958 = _956 * 6.283185482025146484375;
        float _960 = cos(_958);
        float _962 = _956 * 6.283185482025146484375;
        float _964 = sin(_962);
        float _966 = _960 + (-1.0);
        float _968 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_964, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = fma(_920, _960, _968);
        float _974 = _950 * _970;
        float _976 = fma(_904, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = fma(_900, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _972;
        _932 = _976;
        _936 = _978;
    }
    float _980 = _942;
    float _982 = _932;
    float _984 = _936;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _988 = _980 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _982 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _996 = _984 + _994;
    float _998 = _988 * _988;
    float _1000 = fma(_992, _992, _998);
    float _1002 = fma(_996, _996, _1000);
    float _1004 = rsqrt(_1002);
    float _1006 = sqrt(_1002);
    float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1010 = _992 * _1008;
    float _1012 = _996 * _1008;
    float _1014 = _1010 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1020 = _1014 + _1016;
    float _1022 = precise::max(0.0, _1018);
    float _1024 = sqrt(_1020);
    float _1026 = -_1008;
    float _1028 = -_1022;
    float _1030 = fma(_988, _1026, _1028);
    bool _1032 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1034 = _1022;
    float _1036 = _988;
    float _1038 = _1014;
    float _1040 = _1016;
    float _1042 = _1010;
    if (!_1032)
    {
        _1034 = _1030;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1032)
    {
        _1036 = _1012;
    }
    float _1048 = _1036;
    bool _1050 = !_1032;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1024 + _1056;
        float _1060 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_1020);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = _1010 * _1078;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1012 * _1078;
        float _1088 = fma(_1030, _1074, _1084);
        float _1090 = _1082 * _1082;
        float _1092 = _1086 * _1086;
        _1046 = _1088;
        _1038 = _1090;
        _1040 = _1092;
        _1042 = _1082;
        _1052 = _1086;
    }
    float _1094 = _1046;
    float _1096 = _1038;
    float _1098 = _1040;
    float _1100 = _1042;
    float _1102 = _1052;
    float _1104 = fma(_1094, _1094, _1096);
    float _1106 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1104 + _1098;
    float _1110 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1112 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1116 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1114);
    float _1118 = precise::clamp(_1116, 0.0, 1.0);
    float _1120 = rsqrt(_1108);
    float _1122 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1124 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1126 = -_1118;
    float _1128 = _1126 + 1.0;
    float _1130 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1132 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1122);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = abs(_1128);
    float _1140 = log2(_1138);
    float _1142 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1130);
    float _1144 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1132);
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1148 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1110);
    float _1150 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1154 = -_1146;
    float _1156 = fma(_1136, _1154, 1.0);
    float _1158 = _1120 * _1100;
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = _1120 * _1094;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = _1120 * _1102;
    float _1174 = -_1166;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1184 = -_1172;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1188 = exp2(_1178);
    float _1190 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1194 = fma(_1186, -0.5, 0.5);
    float _1196 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = log2(_1156);
    float _1204 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1206 = _1164 + 1.0;
    float _1208 = fma(_1198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1210 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1212 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1204);
    float _1214 = fma(_1198, _1208, -0.212114393711090087890625);
    float _1216 = 1.0 / _1192;
    float _1218 = -_1164;
    float _1220 = fma(_1188, _1206, _1218);
    float _1222 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1226 = fma(_1198, _1214, 1.570728778839111328125);
    float _1228 = fma(_1220, 0.5, 0.5);
    float _1230 = sqrt(_1194);
    float _1232 = _1202 * 0.693147182464599609375;
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1236 = _1222 * _1216;
    float _1238 = _1224 * _1216;
    float _1240 = fma(_1236, 0.5, 0.5);
    float _1242 = fma(_1238, -0.5, 0.5);
    float _1244 = _1230 * 0.636619746685028076171875;
    float3 _3924 = float3(_1240, _1242, _1234);
    float _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3924, float3(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3924, float3(0.0), isnan(_3924)), level(0.0)).x;
    float _1248 = -_1226;
    float _1250 = fma(_1244, _1248, 1.0);
    float2 _3940 = float2(_1250, _1228);
    float3 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = in.m_59.y;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _166 > 0.5;
    float _1268 = in.m_49.w;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_59.x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_51.z;
    bool _1294 = _170 > 0.5;
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1300 = -_1262;
    float _1302 = _1300 + 1.0;
    bool _1304 = _1268 > 0.5;
    float _1306 = in.m_51.w;
    int _1308 = _1266 ? as_type<int>(_1302) : as_type<int>(_1262);
    out.m_61.x = _982;
    out.m_61.y = _980;
    out.m_61.z = _984;
    int _1310 = _1304 ? as_type<int>(_1302) : as_type<int>(_1262);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1314 = _1278 ? _1308 : as_type<int>(_1262);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1320 = _1318 != 0;
    float _1322 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1324 = _1284 ? as_type<float>(_1310) : _1262;
    float _1326 = fma(_1316, as_type<float>(_1314), -0.5);
    bool _1328 = _1284;
    float _1330 = _1262;
    int _1332 = as_type<int>(_1286);
    int _1334 = _1314;
    int _1336 = as_type<int>(_1264);
    float _1338 = _1322;
    float _1340 = _1192;
    float _1342 = _1224;
    float _1344 = _1222;
    if (_1272)
    {
        bool _1346 = _174 > 0.5;
        _1328 = _1346;
    }
    bool _1348 = _1328;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1354 = _1352 != 0;
    float _1356 = -_496;
    float _1358 = fma(_652, _1326, _1356);
    float _1360 = _1280;
    if (!_1272)
    {
        _236 = _1280;
    }
    float _1362 = _236;
    float _1364 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = _1294 ? _1302 : _1262;
        _1330 = _1368;
    }
    float _1370 = _1330;
    float _1372 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = 0.0;
    if (!_1272)
    {
        _1374 = _1362;
    }
    float _1376 = _1374;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1376;
    if (_1272)
    {
        _1366 = _1280;
    }
    float _1382 = _1366;
    float _1384 = fma(_1364, _1370, -0.5);
    float _1386 = fma(_1324, _1378, -0.5);
    float _1388 = _1382;
    if (!_1320)
    {
        _1360 = _1382;
    }
    float _1390 = _1360;
    float _1392 = _1390;
    if (_1272)
    {
        float _1394 = -_1382;
        float _1396 = _1394 + 1.0;
        _1332 = as_type<int>(_1396);
    }
    int _1398 = _1332;
    if (_1320)
    {
        float _1400 = -_1382;
        float _1402 = _1400 + 1.0;
        _1334 = as_type<int>(_1402);
    }
    int _1404 = _1334;
    if (_1354)
    {
        float _1406 = -_1382;
        float _1408 = _1406 + 1.0;
        _1336 = as_type<int>(_1408);
    }
    int _1410 = _1336;
    float _1412 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1272)
    {
        float _1416 = _1348 ? as_type<float>(_1398) : _1382;
        _1380 = _1416;
    }
    float _1418 = _1380;
    float _1420 = -_622;
    float _1422 = fma(_628, _1386, _1420);
    if (_1320)
    {
        float _1424 = _1294 ? as_type<float>(_1404) : _1382;
        _1392 = _1424;
    }
    float _1426 = _1392;
    float _1428 = in.m_63.x;
    float _1430 = in.m_63.y;
    float _1432 = in.m_63.z;
    if (_1354)
    {
        float _1434 = _1266 ? as_type<float>(_1410) : _1382;
        _1388 = _1434;
    }
    float _1436 = _1388;
    float _1438 = fma(_1322, _1418, -0.5);
    bool _1440 = _794 != 0.0;
    bool _1442 = isnan(_794);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = fma(_1372, _1426, -0.5);
    float _1452 = fma(_654, _1438, _650);
    bool _1454 = _772 == 0.0;
    bool _1456 = !_1448;
    bool _1458 = _1454 && _1456;
    float _1460 = fma(_508, _1450, _618);
    float _1462 = fma(_1412, _1436, -0.5);
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = in.m_65.w;
    bool _1472 = _796 == 0.0;
    bool _1474 = _1472 && _1458;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1480 = fma(_656, _1462, _608);
    float _1482 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = -_630;
    float _1490 = fma(_658, _1384, _1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1496 = _1462;
    float _1498 = _1428;
    float _1500 = _1490;
    if (_1474)
    {
        _660 = _1428;
    }
    float _1502 = _660;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1506 = _1502;
    if (_1474)
    {
        _1338 = _1432;
    }
    float _1508 = _1338;
    out.m_67.x = _1482;
    out.m_67.y = _1484;
    out.m_67.z = _1486;
    float _1510 = _1508;
    if (_1474)
    {
        _662 = _1502;
    }
    float _1512 = _662;
    float _1514 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1512;
    if (!_1474)
    {
        _1506 = _1428;
    }
    float _1518 = _1506;
    float _1520 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1474)
    {
        _1496 = _1430;
    }
    float _1522 = _1496;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1522;
    if (_1474)
    {
        _1498 = _1508;
    }
    float _1528 = _1498;
    float _1530 = _1468 * _1518;
    float _1532 = _1528;
    if (!_1474)
    {
        _1510 = _1432;
    }
    float _1534 = _1510;
    float _1536 = _1422 + 0.5;
    out.m_69.x = _1514;
    out.m_69.y = _1520;
    out.m_69.z = _1524;
    float _1538 = _1490 + 0.5;
    if (_1474)
    {
        _1500 = _1522;
    }
    float _1540 = _1500;
    float _1542 = _1480 + 0.5;
    float _1544 = _1540;
    if (!_1474)
    {
        _1526 = _1430;
    }
    float _1546 = _1526;
    float _1548 = _1466 * _1534;
    float _1550 = -_1530;
    float _1552 = fma(_1464, _1534, _1550);
    if (!_1474)
    {
        float _1554 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1516 = _1554;
    }
    float _1556 = _1516;
    if (!_1474)
    {
        float _1558 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1534);
        _1532 = _1558;
    }
    float _1560 = _1532;
    float _1562 = _1464 * _1546;
    float _1564 = -_1548;
    float _1566 = fma(_1468, _1546, _1564);
    if (!_1474)
    {
        float _1568 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1568;
    }
    float _1570 = _1544;
    float _1572 = _1358 + 0.5;
    float _1574 = _1452 + 0.5;
    float _1576 = _1460 + 0.5;
    float _1578 = _1552 * _1470;
    float _1580 = -_1562;
    float _1582 = fma(_1466, _1518, _1580);
    float _1584 = _1566 * _1470;
    float _1586 = exp2(_1274);
    out.m_71.x = _1574;
    out.m_71.y = _1572;
    out.m_71.z = _1576;
    out.m_71.w = _1536;
    bool _1588 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1590 = isnan(_1006);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1596 = _1592 || _1594;
    out.m_73.x = _1542;
    out.m_73.y = _1538;
    out.m_75.z = _1292;
    out.m_75.w = _1306;
    float _1598 = -_1570;
    float _1600 = _810 * _1598;
    float _1602 = -_1466;
    float _1604 = _810 * _1602;
    float _1606 = -_1578;
    float _1608 = _810 * _1606;
    float _1610 = _1582 * _1470;
    float _1612 = _824 * _1570;
    float _1614 = _828 * _1570;
    float _1616 = _824 * _1578;
    float _1618 = fma(_826, _1556, _1600);
    float _1620 = fma(_826, _1464, _1604);
    float _1622 = _828 * _1578;
    float _1624 = fma(_826, _1584, _1608);
    float _1626 = fma(_844, _1556, _1612);
    float _1628 = _824 * _1466;
    float _1630 = fma(_844, _1584, _1616);
    float _1632 = fma(_838, _1584, _1622);
    float _1634 = fma(_842, _1560, _1626);
    float _1636 = fma(_844, _1464, _1628);
    float _1638 = fma(_830, _1560, _1618);
    float _1640 = fma(_838, _1556, _1614);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_842, _1468, _1636);
    float _1650 = _828 * _1466;
    float _1652 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1658 = fma(_830, _1468, _1620);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_830, _1610, _1624);
    float _1664 = fma(_848, _1560, _1640);
    float _1666 = fma(_842, _1610, _1630);
    float _1668 = fma(_848, _1610, _1632);
    float _1670 = fma(_838, _1464, _1650);
    float _1672 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1682 = fma(_848, _1468, _1670);
    float _1684 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1686 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1674);
    float _1688 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1694 = -_1586;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1680);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    float _1702 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1686);
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1678);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1708 = _1222 + _1192;
    float _1710 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1690);
    float _1712 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1692);
    out.m_77.x = _1700;
    out.m_77.y = _1702;
    out.m_77.z = _1704;
    float _1714 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1698);
    float _1716 = _1192 * 0.5;
    float _1718 = _1708 * 0.5;
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1722 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1724 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1710);
    float _1726 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1728 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1730 = fma(_1224, -0.5, _1716);
    float _1732 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    float _1734 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1722);
    out.m_79.w = _1192;
    float _1736 = _1700;
    float _1738 = _1718;
    float _1740 = _1734;
    if (!_1596)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1742 = _1736;
    out.m_81.x = _1714;
    out.m_81.y = _1724;
    out.m_81.z = _1728;
    out.m_79.y = _1730;
    out.m_83.x = _1720;
    out.m_83.y = _1726;
    out.m_83.z = _1732;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1192;
    out.m_79.x = _1718;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1596)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1738;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1596)
    {
        _1340 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1340;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1596)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1596)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1766 = _1342;
    float _1768 = _1766;
    float _1770 = _1766;
    if (!_1596)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1772 = _1344;
    float _1774 = _1706 * _1246;
    float _1776 = -_1706;
    float _1778 = _1776 + 1.0;
    float _1780 = _1256 * _1774;
    float _1782 = _1258 * _1774;
    float _1784 = _1260 * _1774;
    out.m_85.x = _1780;
    out.m_85.y = _1782;
    out.m_85.z = _1784;
    out.m_85.w = _1778;
    bool _1786 = !_1596;
    float _1788 = _1772;
    float _1790 = _1772;
    if (!_1786)
    {
        bool _1792 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1794 = isnan(_1006);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1804 = _1006 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1814 = 1.0 / _1808;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1832 = _1804 * _1814;
            float _1834 = precise::clamp(_1832, 0.0, 1.0);
            float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1840 = fma(_1834, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1844 = fma(_1834, _1818, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1846 = fma(_1834, _1822, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1848 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1850 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1746 = _1844;
            _1770 = _1848;
            _1752 = _1840;
            _1764 = _1846;
            _1758 = _1842;
            _1790 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1856 = isnan(_1006);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1864 = _1750;
            _1752 = _1864;
            if (!_1862)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1866 = _1744;
            _1746 = _1866;
            if (!_1862)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1868 = _1756;
            _1758 = _1868;
            if (!_1862)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1870 = _1762;
            _1764 = _1870;
            if (!_1862)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1872 = _1768;
            _1770 = _1872;
            if (!_1862)
            {
                _1788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1874 = _1788;
            bool _1876 = !_1862;
            _1790 = _1874;
            if (!_1876)
            {
                bool _1878 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1880 = isnan(_1006);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1886 = _1882 || _1884;
                if (!_1886)
                {
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1890 = _1006 + _1888;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1892;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1900 = 1.0 / _1894;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1918 = _1890 * _1900;
                    float _1920 = precise::clamp(_1918, 0.0, 1.0);
                    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1926 = fma(_1920, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1928 = fma(_1920, _1924, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1930 = fma(_1920, _1904, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1932 = fma(_1920, _1908, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1934 = fma(_1920, _1912, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1936 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1746 = _1930;
                    _1770 = _1934;
                    _1752 = _1926;
                    _1764 = _1932;
                    _1758 = _1928;
                    _1790 = _1936;
                    _1852 = true;
                }
                else
                {
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1852 = false;
    float _1938 = _1746;
    float _1940 = _1770;
    float _1942 = _1752;
    float _1944 = _1764;
    float _1946 = _1758;
    float _1948 = _1790;
    float _1950 = fma(_1726, -0.5, 0.5);
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1938;
    float _1956 = _1954 + _1940;
    float _1958 = -_1942;
    float _1960 = _1958 + _1944;
    float _1962 = -_1946;
    float _1964 = _1962 + _1948;
    bool _1966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1968 = fma(_1952, _1956, _1938);
    float _1970 = fma(_1952, _1960, _1942);
    float _1972 = fma(_1952, _1964, _1946);
    float _1974 = _1968 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _1976 = fma(_1970, 0.298911988735198974609375, _1974);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1978 = fma(_1972, 0.114477999508380889892578125, _1976);
    out.m_89.x = 0.0;
    float _1980 = -_1978;
    float _1982 = _1970 + _1980;
    float _1984 = -_1978;
    float _1986 = _1968 + _1984;
    float _1988 = -_1978;
    float _1990 = _1972 + _1988;
    float _1992 = fma(_1982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    out.m_91.x = _1992;
    out.m_91.y = _1994;
    out.m_91.z = _1996;
    if (!_1966)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1998 = -_980;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2002 = -_982;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2006 = -_984;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = sqrt(_2014);
    float _2018 = rsqrt(_2014);
    float _2020 = -_2016;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2004 * _2018;
    float _2030 = _2000 * _2018;
    float _2032 = abs(_2026);
    float _2034 = log2(_2032);
    float _2036 = _2008 * _2018;
    float _2038 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2040 = _1726 * _2030;
    float _2042 = -_2030;
    float _2044 = -_2038;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2044);
    float _2048 = fma(_1720, _2028, _2040);
    float _2050 = -_2036;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2046);
    float _2054 = fma(_1732, _2036, _2048);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2060 = _2052 + _2058;
    float _2062 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = exp2(_2062);
    float _2070 = _2068 * _2066;
    float _2072 = _2056 * _2070;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2074;
    out.m_89.y = _2076;
    out.m_89.z = _2078;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1852 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2137 = as_type<float>(_128);
        out.gl_Position.z = _2137;
    }
    if (!_114)
    {
        return out;
    }
    float _132 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2206 = as_type<float>(_164);
        out.gl_Position.z = _2206;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_49.y;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_49.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = in.m_49.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.x;
    float _184 = in.m_51.y;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _190 = _166 * 2.0;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _194 = _170 * 2.0;
    float _196 = fma(_188, -2.0, _172);
    float _198 = floor(_190);
    float _200 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _174 * 2.0;
    float _204 = _174 + _170;
    float _206 = -_176;
    float _208 = fma(_200, 2.0, _206);
    float _210 = _166 + _170;
    float _212 = _204 + (-1.0);
    float _214 = floor(_194);
    float _216 = _210 + (-1.0);
    float _218 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _222 = _166 + _174;
    float _224 = floor(_202);
    float _226 = _222 + (-1.0);
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _232 = _198;
    float _234 = _168;
    float _236 = _174;
    if (_180)
    {
        _228 = _174;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_180)
    {
        _240 = _170;
    }
    float _242 = _240;
    float _244 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _246 = _214 > 0.0;
    float _248 = _184 * 6.283185482025146484375;
    bool _250 = _214 >= 0.0;
    bool _252 = isnan(_214);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = _242 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _262 = fma(_182, 8.0, _248);
    if (!_180)
    {
        _230 = _166;
    }
    float _264 = _230;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _268 = _224 > 0.0;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _272 = _224 >= 0.0;
    bool _274 = isnan(_224);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _284 = log2(_282);
    float _286 = -_270;
    float _288 = fma(_260, 2.0, _286);
    int _290 = _258 ? 0 : 1;
    bool _292 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _262);
    float _304 = _264;
    if (_180)
    {
        _304 = _174;
    }
    float _306 = _304;
    float _308 = in.m_53.x;
    float _310 = in.m_53.y;
    float _312 = in.m_53.z;
    bool _314 = _198 > 0.0;
    float _316 = _302 * 0.15915493667125701904296875;
    bool _318 = _198 >= 0.0;
    bool _320 = isnan(_198);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _266);
    float _330 = _306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _332 = _280 ? 0 : 1;
    float _334 = _316 * 6.283185482025146484375;
    float _336 = sin(_334);
    float _338 = _330;
    if (!_180)
    {
        _232 = _170;
    }
    float _340 = _232;
    float _342 = 0.0;
    float _344 = _340;
    if (!_300)
    {
        float _346 = _168 * _168;
        float _348 = _346 * 0.5;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = _350;
    if (_180)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = -_192;
    float _358 = fma(_330, 2.0, _356);
    int _360 = ~_332;
    int _362 = _360 + 1;
    int _364 = _362 + 1;
    int _366 = _364;
    if (!_300)
    {
        float _368 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = _368;
    }
    float _370 = _352;
    float _372 = _370;
    if (!_268)
    {
        int _374 = ~_332;
        int _376 = _374 + 1;
        _366 = _376;
    }
    int _378 = _366;
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    int _382 = ~_290;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    int _388 = _386;
    if (!_246)
    {
        int _390 = ~_290;
        int _392 = _390 + 1;
        _388 = _392;
    }
    int _394 = _388;
    float _396 = _310 * 0.20000000298023223876953125;
    float _398 = _396 * _396;
    float _400 = fma(_308, _308, _398);
    bool _402 = !_300;
    float _404 = _398;
    if (!_402)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _416 = _168 * _408;
        float _418 = 1.0 / _412;
        float _420 = _414 * 0.693147182464599609375;
        float _422 = exp2(_416);
        float _424 = 1.0 / _420;
        float _426 = _422 + (-1.0);
        float _428 = -_426;
        float _430 = fma(_428, _424, _168);
        float _432 = _430 * _418;
        float _434 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _422;
        _404 = _424;
        _372 = _434;
    }
    float _436 = _338;
    float _438 = _404;
    float _440 = _372;
    bool _442 = !_300;
    float _444 = _436;
    float _446 = _438;
    if (!_442)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = 1.0 / _454;
        float _458 = _168 * _450;
        float _460 = exp2(_458);
        float _462 = -_460;
        float _464 = _462 + 1.0;
        float _466 = _464 * _456;
        _444 = _460;
        _234 = _466;
    }
    float _468 = _444;
    float _470 = _234;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = fma(_312, _312, _400);
    float _486 = _468;
    if (_180)
    {
        _446 = _166;
    }
    float _488 = _446;
    float _490 = _284 * _146;
    float _492 = _488;
    if (!_180)
    {
        _492 = _174;
    }
    float _494 = _492;
    float _496 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    bool _498 = !_474;
    int _500 = _498 ? 0 : 1;
    float _502 = rsqrt(_484);
    if (!_180)
    {
        _486 = _170;
    }
    float _504 = _486;
    float _506 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _328);
    float _510 = _504;
    if (_180)
    {
        _510 = _166;
    }
    float _512 = _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _516 = abs(_500);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _520 = _326 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = float(_394);
    float _526 = fma(_506, -2.0, _514);
    float _528 = float(_516);
    float _530 = fma(_518, -2.0, _522);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = exp2(_490);
    int _540 = _536;
    if (!_314)
    {
        int _542 = ~_520;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _528 * _524;
    float _550 = in.m_55.x;
    float _552 = in.m_55.y;
    float _554 = in.m_55.z;
    float _556 = _502 * _336;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    bool _566 = !_478;
    int _568 = _566 ? 0 : 1;
    float _570 = 1.0 / _562;
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = -_538;
    float _584 = _582 + 1.0;
    int _586 = abs(_568);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _602 = float(_378);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _606 = -_146;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _288);
    float _610 = _548 * (-2.0);
    float _612 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _588);
    float _614 = float(_586);
    float _616 = -_146;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _620 = _598 ? _584 : 0.0;
    float _622 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _624 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _600);
    float _626 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _604);
    float _628 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _380);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _526);
    float _632 = fma(_610, _550, _550);
    float _634 = _614 * _602;
    float _636 = fma(_244, _610, _244);
    float _638 = fma(_182, 0.5, 0.5);
    float _640 = _174 + (-0.5);
    float _642 = in.m_47.x;
    float _644 = in.m_47.y;
    float _646 = in.m_47.z;
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _208);
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    float _654 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _656 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _624);
    float _658 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _626);
    float _660 = _656;
    float _662 = _622;
    if (_580)
    {
        float _664 = _620 * _570;
        _148 = _664;
    }
    float _666 = _148;
    float _668 = _556 * 0.01200000010430812835693359375;
    float _670 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _632);
    bool _672 = !_482;
    int _674 = _672 ? 0 : 1;
    float _676 = _634 * (-2.0);
    float _678 = _638 * _668;
    float _680 = fma(_636, _666, _670);
    int _682 = abs(_674);
    float _684 = fma(_676, _552, _552);
    float _686 = _166 + (-0.5);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = float(_546);
    float _692 = fma(_220, _676, _220);
    float _694 = float(_682);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = in.m_42.x;
    float _700 = in.m_42.y;
    float _702 = in.m_42.z;
    float _704 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _706 = _688 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _694 * _690;
    float _712 = in.m_57.w;
    float _714 = fma(_692, _666, _696);
    float _716 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _718 = _710 * (-2.0);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_470, _642, _704);
    float _728 = fma(_470, _644, _716);
    float _730 = fma(_718, _554, _554);
    float _732 = _170 + (-0.5);
    float _734 = fma(_218, _718, _218);
    float _736 = fma(_396, _678, _310);
    float _738 = _714 * 0.15915493667125701904296875;
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _742 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _744 = fma(_308, _678, _308);
    float _746 = fma(_734, _666, _740);
    float _748 = _688 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_470, _646, _742);
    float _754 = fma(_312, _678, _312);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_728, _712, _700);
    float _760 = _738 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _766 = fma(_726, _712, _698);
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _770 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _772 = _764 * _744;
    float _774 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _738 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _772);
    float _786 = fma(_752, _712, _702);
    float _788 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = _756 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _764 * _736;
    float _796 = _764 * _754;
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _750 * _762;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _794);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _796);
    float _806 = _784 * _798;
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _802 * _776;
    float _814 = _804 * _782;
    float _816 = _708 * _780;
    float _818 = _750 * _780;
    float _820 = _708 * _762;
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _824 = _750 * _792;
    float _826 = _780 * _792;
    float _828 = _708 * _792;
    float _830 = _762 * _792;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _834 = _828 * _812;
    float _836 = -_800;
    float _838 = fma(_810, _816, _836);
    float _840 = -_816;
    float _842 = fma(_810, _800, _840);
    float _844 = fma(_810, _818, _820);
    float _846 = _824 * _812;
    float _848 = fma(_810, _820, _818);
    float _850 = -_812;
    float _852 = _810 * _850;
    float _854 = fma(_838, _806, _834);
    float _856 = fma(_844, _806, _846);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_826, _806, _852);
    float _862 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _864 = fma(_842, _814, _856);
    float _866 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _868 = fma(_830, _814, _860);
    float _870 = fma(_848, _814, _854);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _874 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _878 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _872);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _886 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _878);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    float _894 = _862 + _888;
    float _896 = _884 + _890;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _894 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _896 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = _892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _920 = _916 + _918;
    bool _922 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _864;
    float _928 = _918;
    if (!_922)
    {
        _924 = _896;
    }
    float _930 = _924;
    float _932 = _930;
    if (!_922)
    {
        _926 = _894;
    }
    float _934 = _926;
    float _936 = _934;
    if (!_922)
    {
        _928 = _920;
    }
    float _938 = _928;
    bool _940 = !_922;
    float _942 = _938;
    if (!_940)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _948 = _912 + _946;
        float _950 = rsqrt(_908);
        float _952 = _948 * _944;
        float _954 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = _952 * 0.15915493667125701904296875;
        float _958 = _956 * 6.283185482025146484375;
        float _960 = cos(_958);
        float _962 = _956 * 6.283185482025146484375;
        float _964 = sin(_962);
        float _966 = _960 + (-1.0);
        float _968 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_964, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = fma(_920, _960, _968);
        float _974 = _950 * _970;
        float _976 = fma(_904, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = fma(_900, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _972;
        _932 = _976;
        _936 = _978;
    }
    float _980 = _942;
    float _982 = _932;
    float _984 = _936;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _988 = _980 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _982 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _996 = _984 + _994;
    float _998 = _988 * _988;
    float _1000 = fma(_992, _992, _998);
    float _1002 = fma(_996, _996, _1000);
    float _1004 = rsqrt(_1002);
    float _1006 = sqrt(_1002);
    float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1010 = _992 * _1008;
    float _1012 = _996 * _1008;
    float _1014 = _1010 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1020 = _1014 + _1016;
    float _1022 = precise::max(0.0, _1018);
    float _1024 = sqrt(_1020);
    float _1026 = -_1008;
    float _1028 = -_1022;
    float _1030 = fma(_988, _1026, _1028);
    bool _1032 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1034 = _1022;
    float _1036 = _988;
    float _1038 = _1014;
    float _1040 = _1016;
    float _1042 = _1010;
    if (!_1032)
    {
        _1034 = _1030;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1032)
    {
        _1036 = _1012;
    }
    float _1048 = _1036;
    bool _1050 = !_1032;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1024 + _1056;
        float _1060 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_1020);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = _1010 * _1078;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1012 * _1078;
        float _1088 = fma(_1030, _1074, _1084);
        float _1090 = _1082 * _1082;
        float _1092 = _1086 * _1086;
        _1046 = _1088;
        _1038 = _1090;
        _1040 = _1092;
        _1042 = _1082;
        _1052 = _1086;
    }
    float _1094 = _1046;
    float _1096 = _1038;
    float _1098 = _1040;
    float _1100 = _1042;
    float _1102 = _1052;
    float _1104 = fma(_1094, _1094, _1096);
    float _1106 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1104 + _1098;
    float _1110 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1112 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1116 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1114);
    float _1118 = precise::clamp(_1116, 0.0, 1.0);
    float _1120 = rsqrt(_1108);
    float _1122 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1124 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1126 = -_1118;
    float _1128 = _1126 + 1.0;
    float _1130 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1132 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1122);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = abs(_1128);
    float _1140 = log2(_1138);
    float _1142 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1130);
    float _1144 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1132);
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1148 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1110);
    float _1150 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1154 = -_1146;
    float _1156 = fma(_1136, _1154, 1.0);
    float _1158 = _1120 * _1100;
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = _1120 * _1094;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = _1120 * _1102;
    float _1174 = -_1166;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1184 = -_1172;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1188 = exp2(_1178);
    float _1190 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1194 = fma(_1186, -0.5, 0.5);
    float _1196 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = log2(_1156);
    float _1204 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1206 = _1164 + 1.0;
    float _1208 = fma(_1198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1210 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1212 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1204);
    float _1214 = fma(_1198, _1208, -0.212114393711090087890625);
    float _1216 = 1.0 / _1192;
    float _1218 = -_1164;
    float _1220 = fma(_1188, _1206, _1218);
    float _1222 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1226 = fma(_1198, _1214, 1.570728778839111328125);
    float _1228 = fma(_1220, 0.5, 0.5);
    float _1230 = sqrt(_1194);
    float _1232 = _1202 * 0.693147182464599609375;
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1236 = _1222 * _1216;
    float _1238 = _1224 * _1216;
    float _1240 = fma(_1236, 0.5, 0.5);
    float _1242 = fma(_1238, -0.5, 0.5);
    float _1244 = _1230 * 0.636619746685028076171875;
    float3 _3924 = float3(_1240, _1242, _1234);
    float _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3924, float3(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3924, float3(0.0), isnan(_3924)), level(0.0)).x;
    float _1248 = -_1226;
    float _1250 = fma(_1244, _1248, 1.0);
    float2 _3940 = float2(_1250, _1228);
    float3 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = in.m_59.y;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _166 > 0.5;
    float _1268 = in.m_49.w;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_59.x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_51.z;
    bool _1294 = _170 > 0.5;
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1300 = -_1262;
    float _1302 = _1300 + 1.0;
    bool _1304 = _1268 > 0.5;
    float _1306 = in.m_51.w;
    int _1308 = _1266 ? as_type<int>(_1302) : as_type<int>(_1262);
    out.m_61.x = _982;
    out.m_61.y = _980;
    out.m_61.z = _984;
    int _1310 = _1304 ? as_type<int>(_1302) : as_type<int>(_1262);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1314 = _1278 ? _1308 : as_type<int>(_1262);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1320 = _1318 != 0;
    float _1322 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1324 = _1284 ? as_type<float>(_1310) : _1262;
    float _1326 = fma(_1316, as_type<float>(_1314), -0.5);
    bool _1328 = _1284;
    float _1330 = _1262;
    int _1332 = as_type<int>(_1286);
    int _1334 = _1314;
    int _1336 = as_type<int>(_1264);
    float _1338 = _1322;
    float _1340 = _1192;
    float _1342 = _1224;
    float _1344 = _1222;
    if (_1272)
    {
        bool _1346 = _174 > 0.5;
        _1328 = _1346;
    }
    bool _1348 = _1328;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1354 = _1352 != 0;
    float _1356 = -_496;
    float _1358 = fma(_652, _1326, _1356);
    float _1360 = _1280;
    if (!_1272)
    {
        _236 = _1280;
    }
    float _1362 = _236;
    float _1364 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = _1294 ? _1302 : _1262;
        _1330 = _1368;
    }
    float _1370 = _1330;
    float _1372 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = 0.0;
    if (!_1272)
    {
        _1374 = _1362;
    }
    float _1376 = _1374;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1376;
    if (_1272)
    {
        _1366 = _1280;
    }
    float _1382 = _1366;
    float _1384 = fma(_1364, _1370, -0.5);
    float _1386 = fma(_1324, _1378, -0.5);
    float _1388 = _1382;
    if (!_1320)
    {
        _1360 = _1382;
    }
    float _1390 = _1360;
    float _1392 = _1390;
    if (_1272)
    {
        float _1394 = -_1382;
        float _1396 = _1394 + 1.0;
        _1332 = as_type<int>(_1396);
    }
    int _1398 = _1332;
    if (_1320)
    {
        float _1400 = -_1382;
        float _1402 = _1400 + 1.0;
        _1334 = as_type<int>(_1402);
    }
    int _1404 = _1334;
    if (_1354)
    {
        float _1406 = -_1382;
        float _1408 = _1406 + 1.0;
        _1336 = as_type<int>(_1408);
    }
    int _1410 = _1336;
    float _1412 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1272)
    {
        float _1416 = _1348 ? as_type<float>(_1398) : _1382;
        _1380 = _1416;
    }
    float _1418 = _1380;
    float _1420 = -_622;
    float _1422 = fma(_628, _1386, _1420);
    if (_1320)
    {
        float _1424 = _1294 ? as_type<float>(_1404) : _1382;
        _1392 = _1424;
    }
    float _1426 = _1392;
    float _1428 = in.m_63.x;
    float _1430 = in.m_63.y;
    float _1432 = in.m_63.z;
    if (_1354)
    {
        float _1434 = _1266 ? as_type<float>(_1410) : _1382;
        _1388 = _1434;
    }
    float _1436 = _1388;
    float _1438 = fma(_1322, _1418, -0.5);
    bool _1440 = _794 != 0.0;
    bool _1442 = isnan(_794);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = fma(_1372, _1426, -0.5);
    float _1452 = fma(_654, _1438, _650);
    bool _1454 = _772 == 0.0;
    bool _1456 = !_1448;
    bool _1458 = _1454 && _1456;
    float _1460 = fma(_508, _1450, _618);
    float _1462 = fma(_1412, _1436, -0.5);
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = in.m_65.w;
    bool _1472 = _796 == 0.0;
    bool _1474 = _1472 && _1458;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1480 = fma(_656, _1462, _608);
    float _1482 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = -_630;
    float _1490 = fma(_658, _1384, _1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1496 = _1462;
    float _1498 = _1428;
    float _1500 = _1490;
    if (_1474)
    {
        _660 = _1428;
    }
    float _1502 = _660;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1506 = _1502;
    if (_1474)
    {
        _1338 = _1432;
    }
    float _1508 = _1338;
    out.m_67.x = _1482;
    out.m_67.y = _1484;
    out.m_67.z = _1486;
    float _1510 = _1508;
    if (_1474)
    {
        _662 = _1502;
    }
    float _1512 = _662;
    float _1514 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1512;
    if (!_1474)
    {
        _1506 = _1428;
    }
    float _1518 = _1506;
    float _1520 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1474)
    {
        _1496 = _1430;
    }
    float _1522 = _1496;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1522;
    if (_1474)
    {
        _1498 = _1508;
    }
    float _1528 = _1498;
    float _1530 = _1468 * _1518;
    float _1532 = _1528;
    if (!_1474)
    {
        _1510 = _1432;
    }
    float _1534 = _1510;
    float _1536 = _1422 + 0.5;
    out.m_69.x = _1514;
    out.m_69.y = _1520;
    out.m_69.z = _1524;
    float _1538 = _1490 + 0.5;
    if (_1474)
    {
        _1500 = _1522;
    }
    float _1540 = _1500;
    float _1542 = _1480 + 0.5;
    float _1544 = _1540;
    if (!_1474)
    {
        _1526 = _1430;
    }
    float _1546 = _1526;
    float _1548 = _1466 * _1534;
    float _1550 = -_1530;
    float _1552 = fma(_1464, _1534, _1550);
    if (!_1474)
    {
        float _1554 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1516 = _1554;
    }
    float _1556 = _1516;
    if (!_1474)
    {
        float _1558 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1534);
        _1532 = _1558;
    }
    float _1560 = _1532;
    float _1562 = _1464 * _1546;
    float _1564 = -_1548;
    float _1566 = fma(_1468, _1546, _1564);
    if (!_1474)
    {
        float _1568 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1568;
    }
    float _1570 = _1544;
    float _1572 = _1358 + 0.5;
    float _1574 = _1452 + 0.5;
    float _1576 = _1460 + 0.5;
    float _1578 = _1552 * _1470;
    float _1580 = -_1562;
    float _1582 = fma(_1466, _1518, _1580);
    float _1584 = _1566 * _1470;
    float _1586 = exp2(_1274);
    out.m_71.x = _1574;
    out.m_71.y = _1572;
    out.m_71.z = _1576;
    out.m_71.w = _1536;
    bool _1588 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1590 = isnan(_1006);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1596 = _1592 || _1594;
    out.m_73.x = _1542;
    out.m_73.y = _1538;
    out.m_75.z = _1292;
    out.m_75.w = _1306;
    float _1598 = -_1570;
    float _1600 = _810 * _1598;
    float _1602 = -_1466;
    float _1604 = _810 * _1602;
    float _1606 = -_1578;
    float _1608 = _810 * _1606;
    float _1610 = _1582 * _1470;
    float _1612 = _824 * _1570;
    float _1614 = _828 * _1570;
    float _1616 = _824 * _1578;
    float _1618 = fma(_826, _1556, _1600);
    float _1620 = fma(_826, _1464, _1604);
    float _1622 = _828 * _1578;
    float _1624 = fma(_826, _1584, _1608);
    float _1626 = fma(_844, _1556, _1612);
    float _1628 = _824 * _1466;
    float _1630 = fma(_844, _1584, _1616);
    float _1632 = fma(_838, _1584, _1622);
    float _1634 = fma(_842, _1560, _1626);
    float _1636 = fma(_844, _1464, _1628);
    float _1638 = fma(_830, _1560, _1618);
    float _1640 = fma(_838, _1556, _1614);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_842, _1468, _1636);
    float _1650 = _828 * _1466;
    float _1652 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1658 = fma(_830, _1468, _1620);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_830, _1610, _1624);
    float _1664 = fma(_848, _1560, _1640);
    float _1666 = fma(_842, _1610, _1630);
    float _1668 = fma(_848, _1610, _1632);
    float _1670 = fma(_838, _1464, _1650);
    float _1672 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1682 = fma(_848, _1468, _1670);
    float _1684 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1686 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1674);
    float _1688 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1694 = -_1586;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1680);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    float _1702 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1686);
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1678);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1708 = _1222 + _1192;
    float _1710 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1690);
    float _1712 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1692);
    out.m_77.x = _1700;
    out.m_77.y = _1702;
    out.m_77.z = _1704;
    float _1714 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1698);
    float _1716 = _1192 * 0.5;
    float _1718 = _1708 * 0.5;
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1722 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1724 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1710);
    float _1726 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1728 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1730 = fma(_1224, -0.5, _1716);
    float _1732 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    float _1734 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1722);
    out.m_79.w = _1192;
    float _1736 = _1700;
    float _1738 = _1718;
    float _1740 = _1734;
    if (!_1596)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1742 = _1736;
    out.m_81.x = _1714;
    out.m_81.y = _1724;
    out.m_81.z = _1728;
    out.m_79.y = _1730;
    out.m_83.x = _1720;
    out.m_83.y = _1726;
    out.m_83.z = _1732;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1192;
    out.m_79.x = _1718;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1596)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1738;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1596)
    {
        _1340 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1340;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1596)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1596)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1766 = _1342;
    float _1768 = _1766;
    float _1770 = _1766;
    if (!_1596)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1772 = _1344;
    float _1774 = _1706 * _1246;
    float _1776 = -_1706;
    float _1778 = _1776 + 1.0;
    float _1780 = _1256 * _1774;
    float _1782 = _1258 * _1774;
    float _1784 = _1260 * _1774;
    out.m_85.x = _1780;
    out.m_85.y = _1782;
    out.m_85.z = _1784;
    out.m_85.w = _1778;
    bool _1786 = !_1596;
    float _1788 = _1772;
    float _1790 = _1772;
    if (!_1786)
    {
        bool _1792 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1794 = isnan(_1006);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1804 = _1006 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1814 = 1.0 / _1808;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1832 = _1804 * _1814;
            float _1834 = precise::clamp(_1832, 0.0, 1.0);
            float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1840 = fma(_1834, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1844 = fma(_1834, _1818, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1846 = fma(_1834, _1822, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1848 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1850 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1746 = _1844;
            _1770 = _1848;
            _1752 = _1840;
            _1764 = _1846;
            _1758 = _1842;
            _1790 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1856 = isnan(_1006);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1864 = _1750;
            _1752 = _1864;
            if (!_1862)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1866 = _1744;
            _1746 = _1866;
            if (!_1862)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1868 = _1756;
            _1758 = _1868;
            if (!_1862)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1870 = _1762;
            _1764 = _1870;
            if (!_1862)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1872 = _1768;
            _1770 = _1872;
            if (!_1862)
            {
                _1788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1874 = _1788;
            bool _1876 = !_1862;
            _1790 = _1874;
            if (!_1876)
            {
                bool _1878 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1880 = isnan(_1006);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1886 = _1882 || _1884;
                if (!_1886)
                {
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1890 = _1006 + _1888;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1892;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1900 = 1.0 / _1894;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1918 = _1890 * _1900;
                    float _1920 = precise::clamp(_1918, 0.0, 1.0);
                    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1926 = fma(_1920, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1928 = fma(_1920, _1924, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1930 = fma(_1920, _1904, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1932 = fma(_1920, _1908, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1934 = fma(_1920, _1912, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1936 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1746 = _1930;
                    _1770 = _1934;
                    _1752 = _1926;
                    _1764 = _1932;
                    _1758 = _1928;
                    _1790 = _1936;
                    _1852 = true;
                }
                else
                {
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1852 = false;
    float _1938 = _1746;
    float _1940 = _1770;
    float _1942 = _1752;
    float _1944 = _1764;
    float _1946 = _1758;
    float _1948 = _1790;
    float _1950 = fma(_1726, -0.5, 0.5);
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1938;
    float _1956 = _1954 + _1940;
    float _1958 = -_1942;
    float _1960 = _1958 + _1944;
    float _1962 = -_1946;
    float _1964 = _1962 + _1948;
    bool _1966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1968 = fma(_1952, _1956, _1938);
    float _1970 = fma(_1952, _1960, _1942);
    float _1972 = fma(_1952, _1964, _1946);
    float _1974 = _1968 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _1976 = fma(_1970, 0.298911988735198974609375, _1974);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1978 = fma(_1972, 0.114477999508380889892578125, _1976);
    out.m_89.x = 0.0;
    float _1980 = -_1978;
    float _1982 = _1970 + _1980;
    float _1984 = -_1978;
    float _1986 = _1968 + _1984;
    float _1988 = -_1978;
    float _1990 = _1972 + _1988;
    float _1992 = fma(_1982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    out.m_91.x = _1992;
    out.m_91.y = _1994;
    out.m_91.z = _1996;
    if (!_1966)
    {
        return out;
    }
    float _1998 = -_980;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2002 = -_982;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2006 = -_984;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = sqrt(_2014);
    float _2018 = rsqrt(_2014);
    float _2020 = -_2016;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2004 * _2018;
    float _2030 = _2000 * _2018;
    float _2032 = abs(_2026);
    float _2034 = log2(_2032);
    float _2036 = _2008 * _2018;
    float _2038 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2040 = _1726 * _2030;
    float _2042 = -_2030;
    float _2044 = -_2038;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2044);
    float _2048 = fma(_1720, _2028, _2040);
    float _2050 = -_2036;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2046);
    float _2054 = fma(_1732, _2036, _2048);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2060 = _2052 + _2058;
    float _2062 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = exp2(_2062);
    float _2070 = _2068 * _2066;
    float _2072 = _2056 * _2070;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2074;
    out.m_89.y = _2076;
    out.m_89.z = _2078;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1852 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2137 = as_type<float>(_128);
        out.gl_Position.z = _2137;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2206 = as_type<float>(_164);
        out.gl_Position.z = _2206;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_49.y;
    float _168 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_49.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = in.m_49.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.x;
    float _184 = in.m_51.y;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _190 = _166 * 2.0;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _194 = _170 * 2.0;
    float _196 = fma(_188, -2.0, _172);
    float _198 = floor(_190);
    float _200 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _174 * 2.0;
    float _204 = _174 + _170;
    float _206 = -_176;
    float _208 = fma(_200, 2.0, _206);
    float _210 = _166 + _170;
    float _212 = _204 + (-1.0);
    float _214 = floor(_194);
    float _216 = _210 + (-1.0);
    float _218 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _220 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _222 = _166 + _174;
    float _224 = floor(_202);
    float _226 = _222 + (-1.0);
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _232 = _198;
    float _234 = _168;
    float _236 = _174;
    if (_180)
    {
        _228 = _174;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_180)
    {
        _240 = _170;
    }
    float _242 = _240;
    float _244 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _246 = _214 > 0.0;
    float _248 = _184 * 6.283185482025146484375;
    bool _250 = _214 >= 0.0;
    bool _252 = isnan(_214);
    bool _254 = _250 || _252;
    bool _256 = isnan(0.0);
    bool _258 = _254 || _256;
    float _260 = _242 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _262 = fma(_182, 8.0, _248);
    if (!_180)
    {
        _230 = _166;
    }
    float _264 = _230;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _268 = _224 > 0.0;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _272 = _224 >= 0.0;
    bool _274 = isnan(_224);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _284 = log2(_282);
    float _286 = -_270;
    float _288 = fma(_260, 2.0, _286);
    int _290 = _258 ? 0 : 1;
    bool _292 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _262);
    float _304 = _264;
    if (_180)
    {
        _304 = _174;
    }
    float _306 = _304;
    float _308 = in.m_53.x;
    float _310 = in.m_53.y;
    float _312 = in.m_53.z;
    bool _314 = _198 > 0.0;
    float _316 = _302 * 0.15915493667125701904296875;
    bool _318 = _198 >= 0.0;
    bool _320 = isnan(_198);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _266);
    float _330 = _306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _332 = _280 ? 0 : 1;
    float _334 = _316 * 6.283185482025146484375;
    float _336 = sin(_334);
    float _338 = _330;
    if (!_180)
    {
        _232 = _170;
    }
    float _340 = _232;
    float _342 = 0.0;
    float _344 = _340;
    if (!_300)
    {
        float _346 = _168 * _168;
        float _348 = _346 * 0.5;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = _350;
    if (_180)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = -_192;
    float _358 = fma(_330, 2.0, _356);
    int _360 = ~_332;
    int _362 = _360 + 1;
    int _364 = _362 + 1;
    int _366 = _364;
    if (!_300)
    {
        float _368 = _350 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = _368;
    }
    float _370 = _352;
    float _372 = _370;
    if (!_268)
    {
        int _374 = ~_332;
        int _376 = _374 + 1;
        _366 = _376;
    }
    int _378 = _366;
    float _380 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    int _382 = ~_290;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    int _388 = _386;
    if (!_246)
    {
        int _390 = ~_290;
        int _392 = _390 + 1;
        _388 = _392;
    }
    int _394 = _388;
    float _396 = _310 * 0.20000000298023223876953125;
    float _398 = _396 * _396;
    float _400 = fma(_308, _308, _398);
    bool _402 = !_300;
    float _404 = _398;
    if (!_402)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _416 = _168 * _408;
        float _418 = 1.0 / _412;
        float _420 = _414 * 0.693147182464599609375;
        float _422 = exp2(_416);
        float _424 = 1.0 / _420;
        float _426 = _422 + (-1.0);
        float _428 = -_426;
        float _430 = fma(_428, _424, _168);
        float _432 = _430 * _418;
        float _434 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _422;
        _404 = _424;
        _372 = _434;
    }
    float _436 = _338;
    float _438 = _404;
    float _440 = _372;
    bool _442 = !_300;
    float _444 = _436;
    float _446 = _438;
    if (!_442)
    {
        float _448 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = log2(_448);
        float _452 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _454 = _452 + 1.0;
        float _456 = 1.0 / _454;
        float _458 = _168 * _450;
        float _460 = exp2(_458);
        float _462 = -_460;
        float _464 = _462 + 1.0;
        float _466 = _464 * _456;
        _444 = _460;
        _234 = _466;
    }
    float _468 = _444;
    float _470 = _234;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = fma(_312, _312, _400);
    float _486 = _468;
    if (_180)
    {
        _446 = _166;
    }
    float _488 = _446;
    float _490 = _284 * _146;
    float _492 = _488;
    if (!_180)
    {
        _492 = _174;
    }
    float _494 = _492;
    float _496 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _196);
    bool _498 = !_474;
    int _500 = _498 ? 0 : 1;
    float _502 = rsqrt(_484);
    if (!_180)
    {
        _486 = _170;
    }
    float _504 = _486;
    float _506 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _508 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _328);
    float _510 = _504;
    if (_180)
    {
        _510 = _166;
    }
    float _512 = _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _516 = abs(_500);
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _520 = _326 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = float(_394);
    float _526 = fma(_506, -2.0, _514);
    float _528 = float(_516);
    float _530 = fma(_518, -2.0, _522);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = exp2(_490);
    int _540 = _536;
    if (!_314)
    {
        int _542 = ~_520;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _528 * _524;
    float _550 = in.m_55.x;
    float _552 = in.m_55.y;
    float _554 = in.m_55.z;
    float _556 = _502 * _336;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _558);
    bool _566 = !_478;
    int _568 = _566 ? 0 : 1;
    float _570 = 1.0 / _562;
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = -_538;
    float _584 = _582 + 1.0;
    int _586 = abs(_568);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _602 = float(_378);
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _606 = -_146;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _288);
    float _610 = _548 * (-2.0);
    float _612 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _588);
    float _614 = float(_586);
    float _616 = -_146;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _620 = _598 ? _584 : 0.0;
    float _622 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _530);
    float _624 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _600);
    float _626 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _604);
    float _628 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _380);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _526);
    float _632 = fma(_610, _550, _550);
    float _634 = _614 * _602;
    float _636 = fma(_244, _610, _244);
    float _638 = fma(_182, 0.5, 0.5);
    float _640 = _174 + (-0.5);
    float _642 = in.m_47.x;
    float _644 = in.m_47.y;
    float _646 = in.m_47.z;
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _208);
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    float _654 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _564);
    float _656 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _624);
    float _658 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _626);
    float _660 = _656;
    float _662 = _622;
    if (_580)
    {
        float _664 = _620 * _570;
        _148 = _664;
    }
    float _666 = _148;
    float _668 = _556 * 0.01200000010430812835693359375;
    float _670 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _632);
    bool _672 = !_482;
    int _674 = _672 ? 0 : 1;
    float _676 = _634 * (-2.0);
    float _678 = _638 * _668;
    float _680 = fma(_636, _666, _670);
    int _682 = abs(_674);
    float _684 = fma(_676, _552, _552);
    float _686 = _166 + (-0.5);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = float(_546);
    float _692 = fma(_220, _676, _220);
    float _694 = float(_682);
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = in.m_42.x;
    float _700 = in.m_42.y;
    float _702 = in.m_42.z;
    float _704 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _706 = _688 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _694 * _690;
    float _712 = in.m_57.w;
    float _714 = fma(_692, _666, _696);
    float _716 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _718 = _710 * (-2.0);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_470, _642, _704);
    float _728 = fma(_470, _644, _716);
    float _730 = fma(_718, _554, _554);
    float _732 = _170 + (-0.5);
    float _734 = fma(_218, _718, _218);
    float _736 = fma(_396, _678, _310);
    float _738 = _714 * 0.15915493667125701904296875;
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _742 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _744 = fma(_308, _678, _308);
    float _746 = fma(_734, _666, _740);
    float _748 = _688 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = fma(_470, _646, _742);
    float _754 = fma(_312, _678, _312);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_728, _712, _700);
    float _760 = _738 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _766 = fma(_726, _712, _698);
    float _768 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _770 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _772 = _764 * _744;
    float _774 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _778 = _738 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _772);
    float _786 = fma(_752, _712, _702);
    float _788 = _758 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = _756 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _764 * _736;
    float _796 = _764 * _754;
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _750 * _762;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _794);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _796);
    float _806 = _784 * _798;
    float _808 = _756 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _802 * _776;
    float _814 = _804 * _782;
    float _816 = _708 * _780;
    float _818 = _750 * _780;
    float _820 = _708 * _762;
    float _822 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _824 = _750 * _792;
    float _826 = _780 * _792;
    float _828 = _708 * _792;
    float _830 = _762 * _792;
    float _832 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _834 = _828 * _812;
    float _836 = -_800;
    float _838 = fma(_810, _816, _836);
    float _840 = -_816;
    float _842 = fma(_810, _800, _840);
    float _844 = fma(_810, _818, _820);
    float _846 = _824 * _812;
    float _848 = fma(_810, _820, _818);
    float _850 = -_812;
    float _852 = _810 * _850;
    float _854 = fma(_838, _806, _834);
    float _856 = fma(_844, _806, _846);
    float _858 = _758 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _860 = fma(_826, _806, _852);
    float _862 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _864 = fma(_842, _814, _856);
    float _866 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].x, _858);
    float _868 = fma(_830, _814, _860);
    float _870 = fma(_848, _814, _854);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _874 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _866);
    float _878 = _758 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _872);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _874);
    float _884 = _876 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _886 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].x, _878);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _880);
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _886);
    float _894 = _862 + _888;
    float _896 = _884 + _890;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _894 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _896 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = _892 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _918 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _920 = _916 + _918;
    bool _922 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _864;
    float _928 = _918;
    if (!_922)
    {
        _924 = _896;
    }
    float _930 = _924;
    float _932 = _930;
    if (!_922)
    {
        _926 = _894;
    }
    float _934 = _926;
    float _936 = _934;
    if (!_922)
    {
        _928 = _920;
    }
    float _938 = _928;
    bool _940 = !_922;
    float _942 = _938;
    if (!_940)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _948 = _912 + _946;
        float _950 = rsqrt(_908);
        float _952 = _948 * _944;
        float _954 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = _952 * 0.15915493667125701904296875;
        float _958 = _956 * 6.283185482025146484375;
        float _960 = cos(_958);
        float _962 = _956 * 6.283185482025146484375;
        float _964 = sin(_962);
        float _966 = _960 + (-1.0);
        float _968 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = fma(_964, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _972 = fma(_920, _960, _968);
        float _974 = _950 * _970;
        float _976 = fma(_904, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = fma(_900, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _942 = _972;
        _932 = _976;
        _936 = _978;
    }
    float _980 = _942;
    float _982 = _932;
    float _984 = _936;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _988 = _980 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _982 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _996 = _984 + _994;
    float _998 = _988 * _988;
    float _1000 = fma(_992, _992, _998);
    float _1002 = fma(_996, _996, _1000);
    float _1004 = rsqrt(_1002);
    float _1006 = sqrt(_1002);
    float _1008 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1010 = _992 * _1008;
    float _1012 = _996 * _1008;
    float _1014 = _1010 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1020 = _1014 + _1016;
    float _1022 = precise::max(0.0, _1018);
    float _1024 = sqrt(_1020);
    float _1026 = -_1008;
    float _1028 = -_1022;
    float _1030 = fma(_988, _1026, _1028);
    bool _1032 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1034 = _1022;
    float _1036 = _988;
    float _1038 = _1014;
    float _1040 = _1016;
    float _1042 = _1010;
    if (!_1032)
    {
        _1034 = _1030;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1032)
    {
        _1036 = _1012;
    }
    float _1048 = _1036;
    bool _1050 = !_1032;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1024 + _1056;
        float _1060 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_1020);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = _1010 * _1078;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1012 * _1078;
        float _1088 = fma(_1030, _1074, _1084);
        float _1090 = _1082 * _1082;
        float _1092 = _1086 * _1086;
        _1046 = _1088;
        _1038 = _1090;
        _1040 = _1092;
        _1042 = _1082;
        _1052 = _1086;
    }
    float _1094 = _1046;
    float _1096 = _1038;
    float _1098 = _1040;
    float _1100 = _1042;
    float _1102 = _1052;
    float _1104 = fma(_1094, _1094, _1096);
    float _1106 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1104 + _1098;
    float _1110 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1112 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1116 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1114);
    float _1118 = precise::clamp(_1116, 0.0, 1.0);
    float _1120 = rsqrt(_1108);
    float _1122 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1124 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1126 = -_1118;
    float _1128 = _1126 + 1.0;
    float _1130 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1132 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1122);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1138 = abs(_1128);
    float _1140 = log2(_1138);
    float _1142 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1130);
    float _1144 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1132);
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1148 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1110);
    float _1150 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1154 = -_1146;
    float _1156 = fma(_1136, _1154, 1.0);
    float _1158 = _1120 * _1100;
    float _1160 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = _1120 * _1094;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1168 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1148);
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = _1120 * _1102;
    float _1174 = -_1166;
    float _1176 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1174);
    float _1178 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1180 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1182 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1184 = -_1172;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1176);
    float _1188 = exp2(_1178);
    float _1190 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1182);
    float _1194 = fma(_1186, -0.5, 0.5);
    float _1196 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = log2(_1156);
    float _1204 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1196);
    float _1206 = _1164 + 1.0;
    float _1208 = fma(_1198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1210 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1212 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1204);
    float _1214 = fma(_1198, _1208, -0.212114393711090087890625);
    float _1216 = 1.0 / _1192;
    float _1218 = -_1164;
    float _1220 = fma(_1188, _1206, _1218);
    float _1222 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1224 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1212);
    float _1226 = fma(_1198, _1214, 1.570728778839111328125);
    float _1228 = fma(_1220, 0.5, 0.5);
    float _1230 = sqrt(_1194);
    float _1232 = _1202 * 0.693147182464599609375;
    float _1234 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1236 = _1222 * _1216;
    float _1238 = _1224 * _1216;
    float _1240 = fma(_1236, 0.5, 0.5);
    float _1242 = fma(_1238, -0.5, 0.5);
    float _1244 = _1230 * 0.636619746685028076171875;
    float3 _3924 = float3(_1240, _1242, _1234);
    float _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3924, float3(0.0), isnan(_3924)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3924, float3(0.0), isnan(_3924)), level(0.0)).x;
    float _1248 = -_1226;
    float _1250 = fma(_1244, _1248, 1.0);
    float2 _3940 = float2(_1250, _1228);
    float3 _1254 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3940, float2(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3940, float2(0.0), isnan(_3940)), level(0.0)).xyz;
    float _1256 = _1254.x;
    float _1258 = _1254.y;
    float _1260 = _1254.z;
    float _1262 = in.m_59.y;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1266 = _166 > 0.5;
    float _1268 = in.m_49.w;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = in.m_59.x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_51.z;
    bool _1294 = _170 > 0.5;
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1300 = -_1262;
    float _1302 = _1300 + 1.0;
    bool _1304 = _1268 > 0.5;
    float _1306 = in.m_51.w;
    int _1308 = _1266 ? as_type<int>(_1302) : as_type<int>(_1262);
    out.m_61.x = _982;
    out.m_61.y = _980;
    out.m_61.z = _984;
    int _1310 = _1304 ? as_type<int>(_1302) : as_type<int>(_1262);
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1314 = _1278 ? _1308 : as_type<int>(_1262);
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1320 = _1318 != 0;
    float _1322 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1324 = _1284 ? as_type<float>(_1310) : _1262;
    float _1326 = fma(_1316, as_type<float>(_1314), -0.5);
    bool _1328 = _1284;
    float _1330 = _1262;
    int _1332 = as_type<int>(_1286);
    int _1334 = _1314;
    int _1336 = as_type<int>(_1264);
    float _1338 = _1322;
    float _1340 = _1192;
    float _1342 = _1224;
    float _1344 = _1222;
    if (_1272)
    {
        bool _1346 = _174 > 0.5;
        _1328 = _1346;
    }
    bool _1348 = _1328;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1354 = _1352 != 0;
    float _1356 = -_496;
    float _1358 = fma(_652, _1326, _1356);
    float _1360 = _1280;
    if (!_1272)
    {
        _236 = _1280;
    }
    float _1362 = _236;
    float _1364 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1362;
    if (_1290)
    {
        float _1368 = _1294 ? _1302 : _1262;
        _1330 = _1368;
    }
    float _1370 = _1330;
    float _1372 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = 0.0;
    if (!_1272)
    {
        _1374 = _1362;
    }
    float _1376 = _1374;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1376;
    if (_1272)
    {
        _1366 = _1280;
    }
    float _1382 = _1366;
    float _1384 = fma(_1364, _1370, -0.5);
    float _1386 = fma(_1324, _1378, -0.5);
    float _1388 = _1382;
    if (!_1320)
    {
        _1360 = _1382;
    }
    float _1390 = _1360;
    float _1392 = _1390;
    if (_1272)
    {
        float _1394 = -_1382;
        float _1396 = _1394 + 1.0;
        _1332 = as_type<int>(_1396);
    }
    int _1398 = _1332;
    if (_1320)
    {
        float _1400 = -_1382;
        float _1402 = _1400 + 1.0;
        _1334 = as_type<int>(_1402);
    }
    int _1404 = _1334;
    if (_1354)
    {
        float _1406 = -_1382;
        float _1408 = _1406 + 1.0;
        _1336 = as_type<int>(_1408);
    }
    int _1410 = _1336;
    float _1412 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1272)
    {
        float _1416 = _1348 ? as_type<float>(_1398) : _1382;
        _1380 = _1416;
    }
    float _1418 = _1380;
    float _1420 = -_622;
    float _1422 = fma(_628, _1386, _1420);
    if (_1320)
    {
        float _1424 = _1294 ? as_type<float>(_1404) : _1382;
        _1392 = _1424;
    }
    float _1426 = _1392;
    float _1428 = in.m_63.x;
    float _1430 = in.m_63.y;
    float _1432 = in.m_63.z;
    if (_1354)
    {
        float _1434 = _1266 ? as_type<float>(_1410) : _1382;
        _1388 = _1434;
    }
    float _1436 = _1388;
    float _1438 = fma(_1322, _1418, -0.5);
    bool _1440 = _794 != 0.0;
    bool _1442 = isnan(_794);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = fma(_1372, _1426, -0.5);
    float _1452 = fma(_654, _1438, _650);
    bool _1454 = _772 == 0.0;
    bool _1456 = !_1448;
    bool _1458 = _1454 && _1456;
    float _1460 = fma(_508, _1450, _618);
    float _1462 = fma(_1412, _1436, -0.5);
    float _1464 = in.m_65.x;
    float _1466 = in.m_65.y;
    float _1468 = in.m_65.z;
    float _1470 = in.m_65.w;
    bool _1472 = _796 == 0.0;
    bool _1474 = _1472 && _1458;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1480 = fma(_656, _1462, _608);
    float _1482 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1488 = -_630;
    float _1490 = fma(_658, _1384, _1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1496 = _1462;
    float _1498 = _1428;
    float _1500 = _1490;
    if (_1474)
    {
        _660 = _1428;
    }
    float _1502 = _660;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1506 = _1502;
    if (_1474)
    {
        _1338 = _1432;
    }
    float _1508 = _1338;
    out.m_67.x = _1482;
    out.m_67.y = _1484;
    out.m_67.z = _1486;
    float _1510 = _1508;
    if (_1474)
    {
        _662 = _1502;
    }
    float _1512 = _662;
    float _1514 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1512;
    if (!_1474)
    {
        _1506 = _1428;
    }
    float _1518 = _1506;
    float _1520 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1474)
    {
        _1496 = _1430;
    }
    float _1522 = _1496;
    float _1524 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1522;
    if (_1474)
    {
        _1498 = _1508;
    }
    float _1528 = _1498;
    float _1530 = _1468 * _1518;
    float _1532 = _1528;
    if (!_1474)
    {
        _1510 = _1432;
    }
    float _1534 = _1510;
    float _1536 = _1422 + 0.5;
    out.m_69.x = _1514;
    out.m_69.y = _1520;
    out.m_69.z = _1524;
    float _1538 = _1490 + 0.5;
    if (_1474)
    {
        _1500 = _1522;
    }
    float _1540 = _1500;
    float _1542 = _1480 + 0.5;
    float _1544 = _1540;
    if (!_1474)
    {
        _1526 = _1430;
    }
    float _1546 = _1526;
    float _1548 = _1466 * _1534;
    float _1550 = -_1530;
    float _1552 = fma(_1464, _1534, _1550);
    if (!_1474)
    {
        float _1554 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1516 = _1554;
    }
    float _1556 = _1516;
    if (!_1474)
    {
        float _1558 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1534);
        _1532 = _1558;
    }
    float _1560 = _1532;
    float _1562 = _1464 * _1546;
    float _1564 = -_1548;
    float _1566 = fma(_1468, _1546, _1564);
    if (!_1474)
    {
        float _1568 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1568;
    }
    float _1570 = _1544;
    float _1572 = _1358 + 0.5;
    float _1574 = _1452 + 0.5;
    float _1576 = _1460 + 0.5;
    float _1578 = _1552 * _1470;
    float _1580 = -_1562;
    float _1582 = fma(_1466, _1518, _1580);
    float _1584 = _1566 * _1470;
    float _1586 = exp2(_1274);
    out.m_71.x = _1574;
    out.m_71.y = _1572;
    out.m_71.z = _1576;
    out.m_71.w = _1536;
    bool _1588 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1590 = isnan(_1006);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1596 = _1592 || _1594;
    out.m_73.x = _1542;
    out.m_73.y = _1538;
    out.m_75.z = _1292;
    out.m_75.w = _1306;
    float _1598 = -_1570;
    float _1600 = _810 * _1598;
    float _1602 = -_1466;
    float _1604 = _810 * _1602;
    float _1606 = -_1578;
    float _1608 = _810 * _1606;
    float _1610 = _1582 * _1470;
    float _1612 = _824 * _1570;
    float _1614 = _828 * _1570;
    float _1616 = _824 * _1578;
    float _1618 = fma(_826, _1556, _1600);
    float _1620 = fma(_826, _1464, _1604);
    float _1622 = _828 * _1578;
    float _1624 = fma(_826, _1584, _1608);
    float _1626 = fma(_844, _1556, _1612);
    float _1628 = _824 * _1466;
    float _1630 = fma(_844, _1584, _1616);
    float _1632 = fma(_838, _1584, _1622);
    float _1634 = fma(_842, _1560, _1626);
    float _1636 = fma(_844, _1464, _1628);
    float _1638 = fma(_830, _1560, _1618);
    float _1640 = fma(_838, _1556, _1614);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_842, _1468, _1636);
    float _1650 = _828 * _1466;
    float _1652 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1642);
    float _1654 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1644);
    float _1656 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1658 = fma(_830, _1468, _1620);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_830, _1610, _1624);
    float _1664 = fma(_848, _1560, _1640);
    float _1666 = fma(_842, _1610, _1630);
    float _1668 = fma(_848, _1610, _1632);
    float _1670 = fma(_838, _1464, _1650);
    float _1672 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1674 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1676 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1682 = fma(_848, _1468, _1670);
    float _1684 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1672);
    float _1686 = fma(_1658, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1674);
    float _1688 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1676);
    float _1690 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1692 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1694 = -_1586;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1680);
    float _1700 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    float _1702 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1686);
    float _1704 = fma(_1682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1678);
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1708 = _1222 + _1192;
    float _1710 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1690);
    float _1712 = fma(_1662, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1692);
    out.m_77.x = _1700;
    out.m_77.y = _1702;
    out.m_77.z = _1704;
    float _1714 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1698);
    float _1716 = _1192 * 0.5;
    float _1718 = _1708 * 0.5;
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1652);
    float _1722 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    float _1724 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1710);
    float _1726 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1728 = fma(_1668, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1712);
    float _1730 = fma(_1224, -0.5, _1716);
    float _1732 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1656);
    float _1734 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1722);
    out.m_79.w = _1192;
    float _1736 = _1700;
    float _1738 = _1718;
    float _1740 = _1734;
    if (!_1596)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1742 = _1736;
    out.m_81.x = _1714;
    out.m_81.y = _1724;
    out.m_81.z = _1728;
    out.m_79.y = _1730;
    out.m_83.x = _1720;
    out.m_83.y = _1726;
    out.m_83.z = _1732;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1192;
    out.m_79.x = _1718;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1596)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1738;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1596)
    {
        _1340 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1340;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1596)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1596)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1766 = _1342;
    float _1768 = _1766;
    float _1770 = _1766;
    if (!_1596)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1772 = _1344;
    float _1774 = _1706 * _1246;
    float _1776 = -_1706;
    float _1778 = _1776 + 1.0;
    float _1780 = _1256 * _1774;
    float _1782 = _1258 * _1774;
    float _1784 = _1260 * _1774;
    out.m_85.x = _1780;
    out.m_85.y = _1782;
    out.m_85.z = _1784;
    out.m_85.w = _1778;
    bool _1786 = !_1596;
    float _1788 = _1772;
    float _1790 = _1772;
    if (!_1786)
    {
        bool _1792 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1794 = isnan(_1006);
        bool _1796 = _1792 || _1794;
        bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1800 = _1796 || _1798;
        if (!_1800)
        {
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1804 = _1006 + _1802;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1814 = 1.0 / _1808;
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1830 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1832 = _1804 * _1814;
            float _1834 = precise::clamp(_1832, 0.0, 1.0);
            float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1840 = fma(_1834, _1812, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1842 = fma(_1834, _1838, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1844 = fma(_1834, _1818, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1846 = fma(_1834, _1822, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1848 = fma(_1834, _1826, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1850 = fma(_1834, _1830, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1746 = _1844;
            _1770 = _1848;
            _1752 = _1840;
            _1764 = _1846;
            _1758 = _1842;
            _1790 = _1850;
            _1852 = true;
        }
        else
        {
            bool _1854 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1856 = isnan(_1006);
            bool _1858 = _1854 || _1856;
            bool _1860 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1862 = _1858 || _1860;
            if (!_1862)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1864 = _1750;
            _1752 = _1864;
            if (!_1862)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1866 = _1744;
            _1746 = _1866;
            if (!_1862)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1868 = _1756;
            _1758 = _1868;
            if (!_1862)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1870 = _1762;
            _1764 = _1870;
            if (!_1862)
            {
                _1768 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1872 = _1768;
            _1770 = _1872;
            if (!_1862)
            {
                _1788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1874 = _1788;
            bool _1876 = !_1862;
            _1790 = _1874;
            if (!_1876)
            {
                bool _1878 = _1006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1880 = isnan(_1006);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1886 = _1882 || _1884;
                if (!_1886)
                {
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1890 = _1006 + _1888;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1892;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1900 = 1.0 / _1894;
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1918 = _1890 * _1900;
                    float _1920 = precise::clamp(_1918, 0.0, 1.0);
                    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1926 = fma(_1920, _1898, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1928 = fma(_1920, _1924, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1930 = fma(_1920, _1904, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1932 = fma(_1920, _1908, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1934 = fma(_1920, _1912, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1936 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1746 = _1930;
                    _1770 = _1934;
                    _1752 = _1926;
                    _1764 = _1932;
                    _1758 = _1928;
                    _1790 = _1936;
                    _1852 = true;
                }
                else
                {
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1770 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1852 = false;
    float _1938 = _1746;
    float _1940 = _1770;
    float _1942 = _1752;
    float _1944 = _1764;
    float _1946 = _1758;
    float _1948 = _1790;
    float _1950 = fma(_1726, -0.5, 0.5);
    float _1952 = precise::clamp(_1950, 0.0, 1.0);
    float _1954 = -_1938;
    float _1956 = _1954 + _1940;
    float _1958 = -_1942;
    float _1960 = _1958 + _1944;
    float _1962 = -_1946;
    float _1964 = _1962 + _1948;
    bool _1966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1968 = fma(_1952, _1956, _1938);
    float _1970 = fma(_1952, _1960, _1942);
    float _1972 = fma(_1952, _1964, _1946);
    float _1974 = _1968 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _1976 = fma(_1970, 0.298911988735198974609375, _1974);
    out.m_87.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1978 = fma(_1972, 0.114477999508380889892578125, _1976);
    out.m_89.x = 0.0;
    float _1980 = -_1978;
    float _1982 = _1970 + _1980;
    float _1984 = -_1978;
    float _1986 = _1968 + _1984;
    float _1988 = -_1978;
    float _1990 = _1972 + _1988;
    float _1992 = fma(_1982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1978);
    out.m_91.x = _1992;
    out.m_91.y = _1994;
    out.m_91.z = _1996;
    if (!_1966)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1998 = -_980;
    float _2000 = _1998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2002 = -_982;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2006 = -_984;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2010 = _2000 * _2000;
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = fma(_2008, _2008, _2012);
    float _2016 = sqrt(_2014);
    float _2018 = rsqrt(_2014);
    float _2020 = -_2016;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2024 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2026 = precise::clamp(_2024, 0.0, 1.0);
    float _2028 = _2004 * _2018;
    float _2030 = _2000 * _2018;
    float _2032 = abs(_2026);
    float _2034 = log2(_2032);
    float _2036 = _2008 * _2018;
    float _2038 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2040 = _1726 * _2030;
    float _2042 = -_2030;
    float _2044 = -_2038;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2044);
    float _2048 = fma(_1720, _2028, _2040);
    float _2050 = -_2036;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2046);
    float _2054 = fma(_1732, _2036, _2048);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2060 = _2052 + _2058;
    float _2062 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = exp2(_2062);
    float _2070 = _2068 * _2066;
    float _2072 = _2056 * _2070;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2074;
    out.m_89.y = _2076;
    out.m_89.z = _2078;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

