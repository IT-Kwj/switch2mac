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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_79 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_85 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 m_91 [[user(locn16)]];
    float4 m_93 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2886 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_138);
        out.gl_Position.z = _3201;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3256 = as_type<float>(_164);
        out.gl_Position.z = _3256;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.x;
    float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _170 = log2(_168);
    float _172 = in.m_55.z;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _176 = in.m_55.y;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _182 = -_174;
    float _184 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _182);
    float _186 = -_178;
    float _188 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _190 = -_180;
    float _192 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _190);
    float _194 = in.m_46.x;
    float _196 = in.m_46.y;
    float _198 = in.m_46.z;
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = _122 * _170;
    float _204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _200);
    float _206 = _166 * 2.0;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _204);
    float _210 = floor(_206);
    float _212 = _172 * 2.0;
    float _214 = _166 + _172;
    float _216 = _172 + (-0.5);
    float _218 = _214 + (-1.0);
    float _220 = floor(_212);
    float _222 = _176 + _172;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _222 + (-1.0);
    bool _228 = _210 > 0.0;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _232 = _210 >= 0.0;
    bool _234 = isnan(_210);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = _176 * 2.0;
    float _244 = exp2(_202);
    float _246 = _176 + _166;
    int _248 = _240 ? 0 : 1;
    bool _250 = _220 > 0.0;
    float _252 = _246 + (-1.0);
    bool _254 = _220 >= 0.0;
    bool _256 = isnan(_220);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = floor(_242);
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _288 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = 1.0 / _284;
    float _304 = -_244;
    float _306 = _304 + 1.0;
    int _308 = _262 ? 0 : 1;
    float _310 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    bool _312 = !_292;
    int _314 = _312 ? 0 : 1;
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    bool _318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _326 = _322 || _324;
    float _328 = _310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _330 = _264 > 0.0;
    float _332 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = _326 ? _306 : 0.0;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _338 = _328 + _336;
    bool _340 = _264 >= 0.0;
    bool _342 = isnan(_264);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = -_332;
    float _352 = _350 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _354 = ~_248;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = rsqrt(_208);
    int _362 = _348 ? 0 : 1;
    float _364 = _334 * _302;
    int _366 = _358;
    float _368 = _338;
    int _370 = as_type<int>(_216);
    float _372 = _172;
    float _374 = _176;
    if (!_228)
    {
        int _376 = ~_248;
        int _378 = _376 + 1;
        _366 = _378;
    }
    int _380 = _366;
    int _382 = ~_362;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = abs(_338);
    float _390 = abs(_352);
    float _392 = precise::max(_388, _390);
    int _394 = _386;
    if (!_330)
    {
        int _396 = ~_362;
        int _398 = _396 + 1;
        _394 = _398;
    }
    int _400 = _394;
    int _402 = ~_308;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    bool _408 = !_296;
    int _410 = _408 ? 0 : 1;
    int _412 = _406;
    if (!_250)
    {
        int _414 = ~_308;
        int _416 = _414 + 1;
        _412 = _416;
    }
    int _418 = _412;
    float _420 = _166 * 6.283185482025146484375;
    int _422 = abs(_314);
    bool _424 = _392 >= 16.0;
    float _426 = fma(_122, 0.02999999932944774627685546875, _420);
    bool _428 = !_300;
    int _430 = _428 ? 0 : 1;
    int _432 = abs(_410);
    float _434 = _426 * 0.15915493667125701904296875;
    float _436 = float(_422);
    float _438 = float(_418);
    int _440 = abs(_430);
    float _442 = _434 * 6.283185482025146484375;
    float _444 = sin(_442);
    float _446 = _436 * _438;
    float _448 = float(_380);
    if (_424)
    {
        float _450 = _338 * 0.0625;
        _368 = _450;
    }
    float _452 = _368;
    float _454 = float(_432);
    float _456 = _184 * _184;
    float _458 = float(_440);
    float _460 = float(_400);
    float _462 = _454 * _448;
    float _464 = abs(_452);
    bool _466 = _464 != 0.0;
    bool _468 = isnan(_464);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _446 * (-2.0);
    bool _478 = !_280;
    float _480 = _478 ? _122 : _364;
    float _482 = _458 * _460;
    float _484 = _352 * 0.0625;
    float _486 = fma(_266, _476, _266);
    float _488 = _360 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _490 = _166 + (-0.5);
    float _492 = fma(_188, _188, _456);
    float _494 = _424 ? _484 : _352;
    float _496 = _488 * (-0.699999988079071044921875);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _504 = _502 != 0;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _508 = abs(_494);
    bool _510 = _508 == 0.0;
    bool _512 = !_474;
    bool _514 = _510 && _512;
    float _516 = fma(_192, _192, _492);
    float _518 = _496 * 0.15915493667125701904296875;
    float _520 = fma(_480, _486, _506);
    float _522 = in.m_57.x;
    float _524 = in.m_57.y;
    float _526 = in.m_57.z;
    bool _528 = !_504;
    int _530 = _528 ? 0 : 1;
    float _532 = _482 * (-2.0);
    float _534 = _520 * 0.15915493667125701904296875;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = abs(_494);
    bool _544 = _542 == 0.0;
    float _546 = _462 * (-2.0);
    float _548 = fma(_224, _532, _224);
    float _550 = rsqrt(_516);
    bool _552 = _504;
    if (_514)
    {
        bool _554 = as_type<int>(_494) >= 0;
        _552 = _554;
    }
    bool _556 = _552;
    float _558 = _176 + (-0.5);
    float _560 = fma(_230, _546, _230);
    float _562 = _216 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _564 = _562;
    if (_514)
    {
        int _566 = _556 ? 0 : 1078530011;
        _370 = _566;
    }
    int _568 = _370;
    float _570 = _558 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    bool _572 = !_500;
    int _574 = _572 ? 0 : 1;
    float _576 = _518 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_480, _548, _562);
    float _582 = fma(_480, _560, _570);
    int _584 = _568;
    if (_514)
    {
        int _586 = int(0x80000000) & as_type<int>(_452);
        int _588 = _568 | _586;
        _564 = as_type<float>(_588);
    }
    float _590 = _564;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _598 = _596 != 0;
    float _600 = _534 * 6.283185482025146484375;
    float _602 = sin(_600);
    bool _604 = !_594;
    int _606 = _604 ? 0 : 1;
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    float _612 = _534 * 6.283185482025146484375;
    float _614 = cos(_612);
    bool _616 = !_474;
    bool _618 = _616 && _544;
    int _620 = _594 ? (-1) : 0;
    float _622 = _590;
    float _624 = _590;
    if (!_618)
    {
        float _626 = abs(_452);
        bool _628 = _626 != as_type<float>(0x7f800000u /* inf */);
        bool _630 = isnan(_626);
        bool _632 = _628 || _630;
        bool _634 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _636 = _632 || _634;
        float _638 = abs(_494);
        bool _640 = _638 == as_type<float>(0x7f800000u /* inf */);
        float _642 = abs(_494);
        bool _644 = _642 == as_type<float>(0x7f800000u /* inf */);
        bool _646 = !_636;
        bool _648 = _644 && _646;
        if (_648)
        {
            bool _650 = as_type<int>(_494) >= 0;
            _620 = _650 ? (-1) : 0;
        }
        int _652 = _620;
        if (_648)
        {
            _584 = 1075235812;
        }
        int _654 = _584;
        int _656 = _654;
        if (_648)
        {
            int _658 = ~_652;
            int _660 = (_658 != 0) ? _654 : 1061752795;
            _656 = _660;
        }
        int _662 = _656;
        if (_648)
        {
            int _664 = int(0x80000000) & as_type<int>(_452);
            int _666 = _662 | _664;
            _622 = as_type<float>(_666);
        }
        float _668 = _622;
        bool _670 = !_636;
        bool _672 = _670 && _640;
        _624 = _668;
        if (!_672)
        {
            float _674 = abs(_452);
            float _676 = abs(_494);
            float _678 = precise::max(_674, _676);
            float _680 = abs(_452);
            float _682 = abs(_494);
            float _684 = precise::min(_680, _682);
            float _686 = 1.0 / _678;
            float _688 = abs(_452);
            float _690 = abs(_494);
            bool _692 = _688 > _690;
            bool _694 = as_type<int>(_494) >= 0;
            float _696 = abs(_452);
            float _698 = abs(_494);
            float _700 = _696 + _698;
            bool _702 = _700 > as_type<float>(0x7f800000u /* inf */);
            bool _704 = isnan(_700);
            bool _706 = _702 || _704;
            bool _708 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _710 = _706 || _708;
            float _712 = _684 * _686;
            float _714 = _712 * _712;
            float _716 = _714 + 11.33538818359375;
            float _718 = fma(_714, _716, 28.84246826171875);
            float _720 = fma(_714, _718, 19.6966705322265625);
            float _722 = fma(_714, -0.82336294651031494140625, -5.674867153167724609375);
            float _724 = fma(_714, _722, -6.565555095672607421875);
            float _726 = 1.0 / _720;
            float _728 = _714 * _724;
            float _730 = _712 * _728;
            float _732 = fma(_730, _726, _712);
            int _734 = as_type<int>(_452) & int(0x80000000);
            float _736 = _732;
            _624 = _700;
            if (_692)
            {
                float _738 = -_732;
                float _740 = _738 + 1.57079637050628662109375;
                _736 = _740;
            }
            float _742 = _736;
            int _744 = as_type<int>(_742);
            if (!_694)
            {
                float _746 = -_742;
                float _748 = _746 + 3.1415927410125732421875;
                _744 = as_type<int>(_748);
            }
            int _750 = _744;
            if (!_710)
            {
                int _752 = _734 | _750;
                _624 = as_type<float>(_752);
            }
        }
    }
    float _754 = _624;
    float _756 = -_754;
    float _758 = _582 + _756;
    float _760 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_61.y;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _768 = _522 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _770 = _580 * 0.15915493667125701904296875;
    float _772 = _764 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _524 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _536);
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _782 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    float _784 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _764 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _184 * _550;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _794 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = _778 * _780;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _540);
    float _800 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _804 = fma(_802, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _806 = _770 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _188 * _550;
    float _812 = -_762;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _816 = _790 * _790;
    float _818 = _792 * _794;
    float _820 = _798 * _800;
    float _822 = _192 * _550;
    float _824 = _444 * _814;
    float _826 = _770 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_810, _810, _816);
    float _832 = _602 * _774;
    float _834 = _804 * _824;
    float _836 = _614 * _788;
    float _838 = fma(_822, _822, _830);
    float _840 = _614 * _774;
    float _842 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _518 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = _614 * _808;
    float _850 = _602 * _808;
    float _852 = _602 * _788;
    float _854 = _788 * _808;
    float _856 = _848 * _818;
    float _858 = _774 * _808;
    float _860 = _850 * _818;
    float _862 = rsqrt(_838);
    float _864 = fma(_828, _836, _832);
    float _866 = fma(_828, _832, _836);
    float _868 = -_818;
    float _870 = _828 * _868;
    float _872 = -_840;
    float _874 = fma(_828, _852, _872);
    float _876 = -_852;
    float _878 = fma(_828, _840, _876);
    float _880 = fma(_864, _796, _856);
    float _882 = fma(_854, _796, _870);
    float _884 = fma(_874, _796, _860);
    float _886 = -_846;
    float _888 = _886 + 1.0;
    float _890 = fma(_878, _820, _880);
    float _892 = fma(_858, _820, _882);
    float _894 = fma(_866, _820, _884);
    float _896 = _842 + _890;
    float _898 = _328 + _892;
    float _900 = _810 * _862;
    float _902 = _790 * _862;
    float _904 = _822 * _862;
    float _906 = fma(_790, _834, _896);
    float _908 = _900 * _578;
    float _910 = _900 * _888;
    float _912 = _904 * _578;
    float _914 = _902 * _578;
    float _916 = _902 * _888;
    float _918 = fma(_810, _834, _898);
    float _920 = fma(_902, _910, _912);
    float _922 = -_912;
    float _924 = fma(_902, _910, _922);
    float _926 = fma(_902, _916, _846);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _930 = _906 + _928;
    float _932 = _332 + _894;
    float _934 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _936 = _918 + _934;
    float _938 = fma(_900, _910, _846);
    float _940 = _926 * _930;
    float _942 = fma(_822, _834, _932);
    float _944 = fma(_904, _916, _908);
    float _946 = -_908;
    float _948 = fma(_904, _916, _946);
    float _950 = fma(_920, _936, _940);
    float _952 = _924 * _930;
    float _954 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _956 = _942 + _954;
    float _958 = -_914;
    float _960 = fma(_904, _910, _958);
    float _962 = fma(_904, _910, _914);
    float _964 = _904 * _904;
    float _966 = _944 * _930;
    float _968 = fma(_938, _936, _952);
    float _970 = fma(_948, _956, _950);
    float _972 = fma(_888, _964, _846);
    float _974 = fma(_960, _936, _966);
    float _976 = fma(_962, _956, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _982 = fma(_972, _956, _974);
    float _984 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].y, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _980);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _992 = _990 != 0;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].y, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].z, _994);
    float _1002 = _996 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1008 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _810;
    float _1014 = _1002;
    float _1016 = _1004;
    if (!_992)
    {
        _1012 = 0.0;
    }
    float _1018 = _1012;
    float _1020 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1008);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1026 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1030 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1028 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1038, _1038, _1040);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1046 = _1018;
    float _1048 = _1024;
    float _1050 = _1030;
    float _1052 = _1028;
    float _1054 = _1038;
    float _1056 = _1034;
    if (!_992)
    {
        _1014 = 0.0;
    }
    float _1058 = _1014;
    float _1060 = sqrt(_1042);
    float _1062 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1044);
    float _1064 = _1058;
    if (!_992)
    {
        _1016 = 0.0;
    }
    float _1066 = _1016;
    float _1068 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1072 = _1060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1074 = !_992;
    float _1076 = _1066;
    if (!_1074)
    {
        float _1078 = -_842;
        float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1082 = -_328;
        float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1086 = _1080 * _1080;
        float _1088 = fma(_1084, _1084, _1086);
        float _1090 = fma(_352, _352, _1088);
        float _1092 = rsqrt(_1090);
        float _1094 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1096 = _1084 * _1094;
        float _1098 = _1080 * _1094;
        float _1100 = _352 * _1094;
        _1046 = _1098;
        _1048 = _1092;
        _1064 = _1096;
        _1076 = _1100;
    }
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1064;
    float _1108 = _1076;
    float _1110 = _1104;
    float _1112 = _1106;
    if (!_1072)
    {
        _1110 = _1070;
    }
    float _1114 = _1110;
    bool _1116 = !_1072;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1060 + _1122;
        float _1126 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1042);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1070, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1038, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1034, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1050 = _1152;
        _1052 = _1154;
    }
    float _1156 = _1118;
    float _1158 = _1050;
    float _1160 = _1052;
    float _1162 = _1102 + _1156;
    float _1164 = _1106 + _1158;
    float _1166 = _1108 + _1160;
    float _1168 = _328 + _1106;
    float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1172 = _1162 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1180 = _1166 + _1178;
    float _1182 = _332 + _1108;
    float _1184 = _1172 * _1172;
    float _1186 = fma(_1176, _1176, _1184);
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1176 * _1194;
    float _1198 = _1180 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1158;
    float _1218 = _1212;
    float _1220 = _1194;
    bool _1222 = _1208;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1208)
    {
        _1112 = _1202;
    }
    float _1228 = _1112;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = rsqrt(_1204);
        _1216 = _1232;
    }
    float _1234 = _1216;
    float _1236 = _1234;
    if (_1208)
    {
        float _1238 = _1212 * _1226;
        _1218 = _1238;
    }
    float _1240 = _1218;
    float _1242 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1208)
    {
        float _1244 = _1240 * 0.15915493667125701904296875;
        _1054 = _1244;
    }
    float _1246 = _1054;
    float _1248 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1226;
    if (_1208)
    {
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _352;
    float _1264 = _1260;
    if (_1208)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1194;
    float _1274 = -_1260;
    float _1276 = fma(_1172, _1272, _1274);
    if (_1208)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1278;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    float _1284 = _1256;
    if (_1208)
    {
        float _1286 = fma(_1256, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1056 = _1286;
    }
    float _1288 = _1056;
    float _1290 = _1288;
    if (!_1208)
    {
        _1282 = _1276;
    }
    float _1292 = _1282;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1270 + (-1.0);
        _1284 = _1296;
    }
    float _1298 = _1284;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1234 * _1288;
        _1290 = _1302;
    }
    float _1304 = _1290;
    if (!_1208)
    {
        _1236 = _1196;
    }
    float _1306 = _1236;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1310;
    }
    float _1312 = _1220;
    float _1314 = _1312;
    if (_1208)
    {
        float _1316 = _1196 * _1304;
        _1308 = _1316;
    }
    float _1318 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1320 = _1300;
    float _1322 = _1320;
    if (_1208)
    {
        float _1324 = _1198 * _1304;
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1208)
    {
        float _1328 = fma(_1276, _1270, _1312);
        _1294 = _1328;
    }
    float _1330 = _1294;
    if (!_1208)
    {
        _1314 = _1200;
    }
    float _1332 = _1314;
    float _1334 = _1332;
    if (_1208)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    if (_1208)
    {
        float _1340 = _1326 * _1326;
        _1230 = _1340;
    }
    float _1342 = _1230;
    float _1344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1338);
    float _1348 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1352 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1354 = _1346 + _1342;
    float _1356 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1358 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1360 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1362 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1364 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1358);
    float _1366 = rsqrt(_1354);
    float _1368 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1382 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1388 = -_1378;
    float _1390 = _1388 + 1.0;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = floor(_1350);
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1386, 1.0);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1408 = _1366 * _1318;
    float _1410 = _1366 * _1326;
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1406);
    float _1414 = abs(_1390);
    float _1416 = log2(_1414);
    float _1418 = _1366 * _1330;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = -_1420;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1422);
    float _1426 = floor(_1352);
    float _1428 = -_1398;
    float _1430 = _1350 + _1428;
    float _1432 = -_1410;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1424);
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1434, -0.5, 0.5);
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1446 = log2(_1402);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1442, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1454 = fma(_1442, _1450, -0.212114393711090087890625);
    float _1456 = -_1426;
    float _1458 = _1352 + _1456;
    float _1460 = sqrt(_1440);
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1452);
    float _1466 = _1418 + 1.0;
    float _1468 = fma(_1442, _1454, 1.570728778839111328125);
    float _1470 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = 1.0 / _1412;
    float _1474 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1476 = _1446 * 0.693147182464599609375;
    float _1478 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = exp2(_1444);
    float _1482 = _1460 * 0.636619746685028076171875;
    float _1484 = -_1468;
    float _1486 = fma(_1482, _1484, 1.0);
    float _1488 = _1464 * _1472;
    float _1490 = _1474 * _1472;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = -_1418;
    float _1498 = fma(_1480, _1466, _1496);
    float2 _5329 = float2(_1430, _1458);
    float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5329, float2(0.0), isnan(_5329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5329, float2(0.0), isnan(_5329)), level(0.0)).x;
    float3 _5340 = float3(_1492, _1494, _1478);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float _1504 = fma(_1498, 0.5, 0.5);
    float3 _5353 = float3(_1492, _1494, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _5369 = float2(_1486, _1504);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1529 = int(_1527);
    float _1531 = in.m_61.x;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -_762;
    float _1539 = _1537 + 1.0;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    out.m_63.y = _762;
    float _1545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1547 = int(_1545);
    float _1549 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1551 = _172 > 0.5;
    out.m_65.x = _1176;
    out.m_65.y = _1172;
    out.m_65.z = _1180;
    float _1553 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1549);
    float _1555 = _1474;
    if (_1535)
    {
        bool _1557 = _166 > 0.5;
        _1222 = _1557;
    }
    bool _1559 = _1222;
    float _1561 = in.m_67.x;
    float _1563 = float(_1529);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1569 = _1567 != 0;
    float _1571 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1553);
    float _1573 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1575 = 1.0 / _1563;
    float _1577 = float(uint(_1547));
    int _1579 = 0;
    float _1581 = _1531;
    if (_1543)
    {
        float _1583 = -_1531;
        float _1585 = _1583 + 1.0;
        _1579 = as_type<int>(_1585);
    }
    int _1587 = _1579;
    int _1589 = ~_1547;
    int _1591 = _1589 + 1;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1595 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1571);
    float _1597 = 1.0 / _1577;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1474;
    out.gl_Position.z = _1595;
    out.gl_Position.w = _1412;
    float _1601 = _122 * _1575;
    float _1603 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1599);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1615 = _1595;
    if (!_1535)
    {
        _1613 = _1531;
    }
    float _1617 = _1613;
    int _1619 = as_type<int>(_1597) + (-2);
    bool _1621 = !_1607;
    float _1623 = _1621 ? 1.2345600128173828125 : 1.0;
    bool _1625 = !_1607;
    float _1627 = _1625 ? _176 : _166;
    float _1629 = _1627 * _1623;
    float _1631 = 1.0 / _152;
    float _1633 = float(uint(_1611));
    float _1635 = float(_1611);
    float _1637 = as_type<float>(_1619) * _1633;
    int _1639 = ~_1547;
    int _1641 = _1639 + 1;
    float _1643 = floor(_1629);
    float _1645 = trunc(_1637);
    float _1647 = precise::max(_1645, 0.0);
    uint _1650 = uint(_1647);
    int _1652 = _1641 * int(_1650);
    int _1654 = _1652 + _1611;
    float _1656 = float(uint(_1654));
    float _1658 = as_type<float>(_1619) * _1656;
    float _1660 = in.m_55.w;
    float _1662 = trunc(_1658);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1650) + int(_1666);
    int _1670 = int(_1650);
    float _1672 = as_type<float>(_1666);
    float _1674 = _1617;
    if (_1535)
    {
        float _1676 = -_1531;
        float _1678 = _1676 + 1.0;
        _1670 = as_type<int>(_1678);
    }
    int _1680 = _1670;
    if (!_1543)
    {
        _1672 = _1531;
    }
    float _1682 = _1672;
    float _1684 = _1682;
    if (_1543)
    {
        float _1686 = _1551 ? as_type<float>(_1587) : _1531;
        _1684 = _1686;
    }
    float _1688 = _1684;
    int _1690 = _1591 * _1668;
    int _1692 = _1690 + _1611;
    if (_1535)
    {
        float _1694 = _1559 ? as_type<float>(_1680) : _1531;
        _1674 = _1694;
    }
    float _1696 = _1674;
    bool _1698 = _1660 > 0.5;
    float _1700 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1702 = uint(_1692) >= uint(_1547);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1706 = _1704 != 0;
    float _1708 = float(_1547);
    bool _1710 = !_1702;
    int _1712 = _1710 ? 0 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1698 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1720 = _1635 >= _1708;
    bool _1722 = isnan(_1635);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(_1708);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1738 = _1736 != 0;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1742 = _1740 != 0;
    float _1744 = trunc(_1730);
    int _1746 = int(_1744);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    float _1752 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1754 = _1551 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1756 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1565;
    float _1768 = fma(_1752, 2.0, _1766);
    float _1770 = _1569 ? as_type<float>(_1754) : _762;
    float _1772 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1774 = _176 > 0.5;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1778 = ~_1668;
    int _1780 = _1778 + _1712;
    int _1782 = _1780 + 1;
    float _1784 = _122 * _1708;
    int _1786 = _1774 ? as_type<int>(_1539) : as_type<int>(_762);
    float _1788 = fma(_1772, -2.0, _1776);
    float _1790 = -_1643;
    float _1792 = _1629 + _1790;
    int _1794 = _1547 * _1782;
    int _1796 = _1794 + _1611;
    float _1798 = _1738 ? as_type<float>(_1786) : _762;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1802 = _1547 == 0;
    float _1804 = _1784 * _1631;
    int _1806 = ~_1746;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1708 * _1792;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1796 : (-1);
    float _1818 = _1742 ? as_type<float>(_1718) : _762;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1822 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1593);
    int _1824 = _1816 * _1810;
    int _1826 = _1547 + (-1);
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1830 = abs(_530);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1834 = abs(_1716);
    float _1836 = trunc(_1804);
    int _1838 = int(_1836);
    int _1840 = _1746 * _1826;
    int _1842 = _1840 + _1824;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1846 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1828);
    float _1848 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1788);
    int _1850 = _1842 * _1830;
    float _1852 = fma(_1844, _1798, -0.5);
    float _1854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1846);
    float _1856 = trunc(_1812);
    int _1858 = int(_1856);
    float _1860 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1862 = abs(_574);
    float _1864 = -_1848;
    float _1866 = fma(_1854, _1852, _1864);
    float _1868 = fma(_1860, _1770, -0.5);
    float _1870 = _1848;
    float _1872 = _1800;
    float _1874 = as_type<float>(_1830);
    if (_1607)
    {
        _1870 = _166;
    }
    float _1876 = _1870;
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1880 = _1876;
    if (!_1607)
    {
        _1880 = _172;
    }
    float _1882 = _1880;
    int _1884 = _1838 * _1862;
    int _1886 = _1884 + _1850;
    int _1888 = abs(_606);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1892 = _1858 * _1834;
    int _1894 = _1892 + _1611;
    int _1896 = abs(_610);
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1902 = _1894 * _1888;
    int _1904 = _1902 + _1886;
    int _1906 = as_type<int>(_1900);
    if (!_1607)
    {
        _1872 = _176;
    }
    float _1908 = _1872;
    float _1910 = -_1900;
    float _1912 = fma(_1890, 2.0, _1910);
    int _1914 = _1858 * _1896;
    int _1916 = _1914 + _1904;
    float _1918 = _1908;
    if (_1734)
    {
        float _1920 = -_1531;
        float _1922 = _1920 + 1.0;
        _1906 = as_type<int>(_1922);
    }
    int _1924 = _1906;
    if (_1607)
    {
        _1918 = _166;
    }
    float _1926 = _1918;
    float _1928 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1930 = float(uint(_1916));
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1934 = _1930;
    float _1936 = _1878;
    if (_1734)
    {
        float _1938 = _1774 ? as_type<float>(_1924) : _1531;
        _1581 = _1938;
    }
    float _1940 = _1581;
    bool _1942 = _538 != 0.0;
    bool _1944 = isnan(_538);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan(0.0);
    bool _1950 = _1946 || _1948;
    float _1952 = as_type<float>(_1619) * _1930;
    float _1954 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1932);
    float _1956 = in.m_69.x;
    float _1958 = in.m_69.y;
    float _1960 = in.m_69.z;
    bool _1962 = _536 == 0.0;
    bool _1964 = !_1950;
    bool _1966 = _1962 && _1964;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1970 = trunc(_1952);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1978 = _540 == 0.0;
    bool _1980 = _1978 && _1966;
    float _1982 = fma(_1928, _1940, -0.5);
    float _1984 = -_1976;
    float _1986 = fma(_1968, 2.0, _1984);
    int _1988 = ~_1547;
    int _1990 = _1988 + 1;
    float _1992 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1607)
    {
        _1934 = _172;
    }
    float _1998 = _1934;
    float _2000 = fma(_1992, _1696, -0.5);
    float _2002 = _1998;
    if (_1607)
    {
        _2002 = _176;
    }
    float _2004 = _2002;
    float _2006 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1994);
    if (_1607)
    {
        _372 = _176;
    }
    float _2008 = _372;
    float _2010 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1954);
    int _2012 = _1990 * int(_1974);
    int _2014 = _2012 + _1916;
    float _2016 = as_type<float>(_2014);
    float _2018 = _2008;
    if (!_1607)
    {
        _374 = _166;
    }
    float _2020 = _374;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2024 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2026 = float(uint(_1894));
    float _2028 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2006);
    float _2030 = _2022;
    if (_1980)
    {
        _1874 = _1956;
    }
    float _2032 = _1874;
    float _2034 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2022);
    float _2036 = float(uint(_2014));
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2040 = _2032;
    if (_1980)
    {
        _2030 = _2032;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (!_1980)
    {
        _2040 = _1956;
    }
    float _2046 = _2040;
    float _2048 = as_type<float>(_1619) * _2036;
    if (_1980)
    {
        _1996 = _1958;
    }
    float _2050 = _1996;
    float _2052 = -_122;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1986);
    float _2056 = _2050;
    if (_1980)
    {
        _2016 = _1960;
    }
    float _2058 = _2016;
    float _2060 = _2058;
    if (!_1980)
    {
        float _2062 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2046);
        _2044 = _2062;
    }
    float _2064 = _2044;
    if (_1980)
    {
        _2018 = _2050;
    }
    float _2066 = _2018;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    float _2074 = _2066;
    if (!_1980)
    {
        _2056 = _1958;
    }
    float _2076 = _2056;
    float _2078 = fma(_2010, _1700, _2054);
    if (_1980)
    {
        _1936 = _2058;
    }
    float _2080 = _1936;
    float _2082 = _2078 + 0.5;
    float _2084 = _2080;
    if (!_1980)
    {
        _2060 = _1960;
    }
    float _2086 = _2060;
    float _2088 = -_122;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1768);
    float _2092 = as_type<float>(_1619) * _2026;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2096 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    int _2098 = ~_1547;
    int _2100 = _2098 + 1;
    float _2102 = -_122;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1912);
    float _2106 = fma(_2024, -2.0, _2094);
    float _2108 = trunc(_2092);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = fma(_2096, _2000, _2090);
    int _2116 = int(_1974) + int(_2072);
    float _2118 = fma(_2028, _1982, _2104);
    float _2120 = in.m_71.x;
    float _2122 = in.m_71.y;
    float _2124 = in.m_71.z;
    float _2126 = in.m_71.w;
    int _2128 = ~_1547;
    int _2130 = _2128 + 1;
    float _2132 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2106);
    int _2134 = _2100 * _2116;
    int _2136 = _2134 + _1916;
    if (!_1980)
    {
        float _2138 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2084 = _2138;
    }
    float _2140 = _2084;
    if (!_1980)
    {
        float _2142 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2076);
        _2074 = _2142;
    }
    float _2144 = _2074;
    float _2146 = exp2(_1573);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2150 = uint(_2136) >= uint(_1547);
    int _2152 = _2130 * int(_2112);
    int _2154 = _2152 + _1894;
    float _2156 = fma(_2038, -2.0, _2148);
    bool _2158 = !_2150;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2164 = float(uint(_2154));
    float _2166 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1822);
    float _2168 = -_2132;
    float _2170 = fma(_2162, _1832, _2168);
    int _2172 = ~_2116;
    int _2174 = _2172 + _2160;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1619) * _2164;
    float _2180 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2156);
    float _2182 = _2124 * _2046;
    float _2184 = _2120 * _2076;
    float _2186 = _2122 * _2086;
    float _2188 = trunc(_2178);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = -_2182;
    float _2196 = fma(_2120, _2086, _2194);
    float _2198 = -_2184;
    float _2200 = fma(_2122, _2046, _2198);
    float _2202 = -_2186;
    float _2204 = fma(_2124, _2076, _2202);
    int _2206 = _1547 * _2176;
    int _2208 = _2206 + _1916;
    float _2210 = _1866 + 0.5;
    float _2212 = _2196 * _2126;
    float _2214 = _2114 + 0.5;
    float _2216 = _2204 * _2126;
    float _2218 = _2200 * _2126;
    bool _2220 = !_1802;
    int _2222 = _2220 ? _2208 : (-1);
    float _2224 = _2170 + 0.5;
    float _2226 = -_2180;
    float _2228 = fma(_2166, _1868, _2226);
    float _2230 = _842 + _1102;
    int _2232 = _2222 >> 31;
    float _2234 = _2118 + 0.5;
    int _2236 = int(_2112) + int(_2192);
    out.m_73.x = _2214;
    out.m_73.y = _2210;
    out.m_73.z = _2082;
    out.m_73.w = _2224;
    int _2238 = _2232 & 3;
    float _2240 = _2228 + 0.5;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2246 = ~_1547;
    int _2248 = _2246 + 1;
    float _2250 = _850 * _2212;
    out.m_75.x = _2234;
    out.m_75.y = _2240;
    int _2252 = _2222 & 3;
    bool _2254 = _2252 != 0;
    int _2256 = _2248 * _2236;
    int _2258 = _2256 + _1894;
    float _2260 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2242);
    int _2262 = _2222 + _2238;
    float _2264 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2244);
    bool _2266 = uint(_2258) >= uint(_1547);
    float _2268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2260);
    int _2270 = _2262 >> 2;
    float _2272 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    int _2274 = _2222 & 3;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2278 = _2270 << 4;
    int _2280 = _2278 + 512;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2284 = !_2266;
    int _2286 = _2284 ? 0 : (-1);
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2280) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = 1.0 / _2282;
    float _2308 = _2276 + _2282;
    out.m_77.w = _2288;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2312 = _2280 + 8;
    uint _2314 = uint(int(uint(_2312) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = uint(_2274) > 1u;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2334 = ~_2236;
    int _2336 = _2334 + _2286;
    int _2338 = _2336 + 1;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2344 = _2254 ? 0 : 1;
    int _2346 = _1547 * _2338;
    int _2348 = _2346 + _1894;
    float _2350 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2308 * _2306;
    float _2358 = _2356 * 0.5;
    int _2360 = ~_2344;
    int _2362 = _2360 + 1;
    int _2364 = _2362 + 1;
    float _2366 = -_2212;
    float _2368 = _828 * _2366;
    int _2370 = _2364;
    if (!_2330)
    {
        int _2372 = ~_2344;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2380 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2378);
    out.m_79.x = _2342;
    out.m_79.y = _2350;
    out.m_79.z = _2354;
    out.m_79.w = _2352;
    bool _2382 = _2274 != 3;
    float _2384 = _848 * _2212;
    bool _2386 = uint(_2274) >= 2u;
    float _2388 = _848 * _2122;
    int _2390 = abs(_2376);
    float _2392 = _848 * _2144;
    int _2394 = _2386 ? 0 : 1;
    float _2396 = fma(_864, _2120, _2388);
    int _2398 = ~_2390;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_864, _2064, _2392);
    bool _2406 = !_1802;
    int _2408 = _2406 ? _2348 : (-1);
    bool _2410 = !_2254;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, _2216, _2368);
    bool _2416 = _2274 != 3;
    float _2418 = _850 * _2122;
    float _2420 = 1.0 / _2380;
    int _2422 = ~_2394;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = fma(_864, _2216, _2384);
    int _2430 = abs(_2412);
    float _2432 = fma(_874, _2216, _2250);
    int _2434 = _2426;
    if (_2382)
    {
        int _2436 = ~_2394;
        int _2438 = _2436 + 1;
        _2434 = _2438;
    }
    int _2440 = _2434;
    int _2442 = _2402 * as_type<int>(_2304);
    float _2444 = -_2122;
    float _2446 = _828 * _2444;
    int _2448 = ~_2430;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_874, _2120, _2418);
    int _2456 = abs(_2440);
    float _2458 = fma(_854, _2120, _2446);
    bool _2460 = !_1750;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = _2452 * as_type<int>(_2296);
    int _2466 = _2464 + _2442;
    float _2468 = fma(_858, _2218, _2414);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2472 = _2420 * _2470;
    bool _2474 = !_2416;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = -_2144;
    float _2480 = _828 * _2478;
    int _2482 = ~_2456;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    float _2488 = abs(_2472);
    float _2490 = log2(_2488);
    int _2492 = abs(_2462);
    float _2494 = fma(_858, _2124, _2458);
    float _2496 = _850 * _2144;
    int _2498 = _2486 * as_type<int>(_2320);
    int _2500 = _2498 + _2466;
    int _2502 = abs(_2476);
    float _2504 = fma(_878, _2218, _2428);
    float _2506 = fma(_866, _2218, _2432);
    int _2508 = ~_2492;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_854, _2064, _2480);
    int _2516 = ~_2502;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_878, _2124, _2396);
    out.m_81.x = _2468;
    out.m_81.y = _2504;
    out.m_81.z = _2506;
    float _2524 = fma(_866, _2124, _2454);
    float _2526 = fma(_874, _2064, _2496);
    int _2528 = _2520 * as_type<int>(_2328);
    int _2530 = _2528 + _2500;
    float _2532 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2534 = _1595 + _1412;
    float _2536 = _1464 + _1412;
    int _2538 = _2530 * _2512;
    float _2540 = _1412 * 0.5;
    out.m_83.x = _2494;
    out.m_83.y = _2522;
    out.m_83.z = _2524;
    float _2542 = exp2(_2532);
    int _2544 = _2408 * _2492;
    int _2546 = _2544 + _2538;
    float _2548 = _2534 * 0.5;
    float _2550 = _2536 * 0.5;
    float _2552 = fma(_1474, -0.5, _2540);
    float _2554 = float(_2546);
    bool _2556 = _2472 <= 8000.0;
    bool _2558 = isnan(_2472);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan(8000.0);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    out.m_85.y = _2554;
    out.m_87.x = _2550;
    out.m_87.y = _2552;
    out.m_87.z = _2548;
    out.m_87.w = _1412;
    float _2568 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _2554;
    if (_1764)
    {
        _2572 = 1.0;
    }
    float _2574 = _2572;
    float _2576 = fma(_2570, -2.0, 3.0);
    float _2578 = _2570 * _2570;
    float _2580 = _2578 * _2576;
    float _2582 = -_2580;
    float _2584 = _2582 + 1.0;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2580);
    float _2588 = _2584;
    float _2590 = _2574;
    if (_1764)
    {
        _2588 = 1.0;
    }
    float _2592 = _2588;
    float _2594 = _2592;
    if (!_1764)
    {
        float _2596 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2598 = _2596 * 0.15915493667125701904296875;
        float _2600 = _2598 * 6.283185482025146484375;
        float _2602 = cos(_2600);
        float _2604 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = _2598 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        float _2612 = 1.0 / _2602;
        float _2614 = _2606 * 6.283185482025146484375;
        float _2616 = cos(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = _2606 * 6.283185482025146484375;
        float _2622 = sin(_2620);
        float _2624 = _2616 * _2618;
        float _2626 = 1.0 / _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2628;
        float _2632 = 1.0 / _2630;
        float _2634 = _2622 * _2626;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2638 = fma(_2472, _2634, _2636);
        float _2640 = _2638 * _2632;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        _2594 = _2642;
        _1615 = _2612;
        _1555 = _2632;
    }
    float _2644 = _2594;
    float _2646 = _1615;
    float _2648 = _1555;
    float _2650 = _2646;
    float _2652 = _2648;
    if (!_1764)
    {
        float _2654 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2656 = _2654 * 0.15915493667125701904296875;
        float _2658 = _2656 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2664 = _2662 * 0.15915493667125701904296875;
        float _2666 = _2656 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        float _2670 = 1.0 / _2660;
        float _2672 = _2664 * 6.283185482025146484375;
        float _2674 = cos(_2672);
        float _2676 = _2668 * _2670;
        float _2678 = _2664 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2674 * _2676;
        float _2684 = 1.0 / _2682;
        float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2686;
        float _2690 = 1.0 / _2688;
        float _2692 = _2680 * _2684;
        float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2696 = fma(_2472, _2692, _2694);
        float _2698 = _2696 * _2690;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = -_2700;
        float _2704 = _2702 + 1.0;
        _2590 = _2704;
        _2650 = _2656;
        _2652 = _2664;
    }
    float _2706 = _2590;
    float _2708 = _2650;
    float _2710 = _2652;
    float _2712 = _2566 * _2586;
    float _2714 = -_2146;
    float _2716 = _2714 + 1.0;
    float _2718 = -_1500;
    float _2720 = _2718 + 1.0;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2724 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2726 = fma(_878, _2140, _2404);
    float _2728 = fma(_858, _2140, _2514);
    float _2730 = _2720 * _2722;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2724 * _1502;
    float _2736 = -_2724;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_866, _2140, _2526);
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _1515 * _2734;
    float _2748 = _1525 * _2734;
    float _2750 = _1515 * _2738;
    float _2752 = _2744 * _1561;
    float _2754 = fma(_1521, _2746, _1509);
    float _2756 = fma(_1523, _2746, _1511);
    float _2758 = fma(_1515, _2748, _1513);
    float _2760 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2728;
    out.m_89.y = _2726;
    out.m_89.z = _2740;
    bool _2762 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2764 = isnan(_1192);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2770 = _2766 || _2768;
    float _2772 = _2644 * _2706;
    out.m_91.x = _2760;
    float _2774 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2754;
    out.m_93.y = _2756;
    out.m_93.z = _2758;
    out.m_93.w = _2750;
    float _2776 = _2752;
    float _2778 = _2708;
    float _2780 = _2710;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2784 = _2746;
    float _2786 = _2738;
    if (!_2770)
    {
        _2776 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2788 = _2776;
    float _2790 = _2788;
    float _2792 = _2788;
    if (!_2770)
    {
        _2778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2770)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2780;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2770)
    {
        _2782 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2782;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2770)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2812 = _2784;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2770)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2818 = _2786;
    bool _2820 = !_2770;
    float _2822 = _2818;
    float _2824 = _2818;
    if (!_2820)
    {
        bool _2826 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2828 = isnan(_1192);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2834 = _2830 || _2832;
        if (!_2834)
        {
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2838 = _1192 + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2840;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2848 = 1.0 / _2842;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2866 = _2838 * _2848;
            float _2868 = precise::clamp(_2866, 0.0, 1.0);
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2876 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2878 = fma(_2868, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2878;
            _2816 = _2882;
            _2792 = _2874;
            _2810 = _2880;
            _2804 = _2876;
            _2824 = _2884;
            _2886 = true;
        }
        else
        {
            bool _2888 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2890 = isnan(_1192);
            bool _2892 = _2888 || _2890;
            bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2896 = _2892 || _2894;
            if (!_2896)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2898 = _2790;
            _2792 = _2898;
            if (!_2896)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2900 = _2796;
            _2798 = _2900;
            if (!_2896)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2902 = _2802;
            _2804 = _2902;
            if (!_2896)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2904 = _2808;
            _2810 = _2904;
            if (!_2896)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2906 = _2814;
            _2816 = _2906;
            if (!_2896)
            {
                _2822 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2908 = _2822;
            bool _2910 = !_2896;
            _2824 = _2908;
            if (!_2910)
            {
                bool _2912 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2914 = isnan(_1192);
                bool _2916 = _2912 || _2914;
                bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2920 = _2916 || _2918;
                if (!_2920)
                {
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2924 = _1192 + _2922;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2926;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2934 = 1.0 / _2928;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2952 = _2924 * _2934;
                    float _2954 = precise::clamp(_2952, 0.0, 1.0);
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2960 = fma(_2954, _2932, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2962 = fma(_2954, _2958, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2964 = fma(_2954, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2954, _2942, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2968 = fma(_2954, _2946, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2970 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2964;
                    _2816 = _2968;
                    _2792 = _2960;
                    _2810 = _2966;
                    _2804 = _2962;
                    _2824 = _2970;
                    _2886 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2824 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2886 = false;
    float _2972 = _2798;
    float _2974 = _2816;
    float _2976 = _2792;
    float _2978 = _2810;
    float _2980 = _2804;
    float _2982 = _2824;
    float _2984 = fma(_2726, -0.5, 0.5);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = -_2972;
    float _2990 = _2988 + _2974;
    float _2992 = _2774 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2994 = -_2976;
    float _2996 = _2994 + _2978;
    out.m_95.x = 0.0;
    float _2998 = fma(_2986, _2990, _2972);
    float _3000 = fma(_2986, _2996, _2976);
    out.m_53.x = _2992;
    float _3002 = -_2980;
    float _3004 = _3002 + _2982;
    float _3006 = _2998 * 0.586610972881317138671875;
    bool _3008 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3010 = fma(_2986, _3004, _2980);
    float _3012 = fma(_3000, 0.298911988735198974609375, _3006);
    bool _3014 = _2644 > 0.0;
    bool _3016 = isnan(_2644);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan(0.0);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_3010, 0.114477999508380889892578125, _3012);
    bool _3026 = _2706 <= 0.0;
    bool _3028 = !_3022;
    bool _3030 = _3026 || _3028;
    float _3032 = -_3024;
    float _3034 = _3000 + _3032;
    float _3036 = -_3024;
    float _3038 = _2998 + _3036;
    float _3040 = -_3024;
    float _3042 = _3010 + _3040;
    float _3044 = fma(_3034, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3046 = fma(_3038, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3048 = fma(_3042, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    bool _3050 = !_3008;
    if (!_3050)
    {
        float _3052 = -_1162;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3056 = -_1164;
        float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3060 = -_1166;
        float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3064 = _3054 * _3054;
        float _3066 = fma(_3058, _3058, _3064);
        float _3068 = fma(_3062, _3062, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = rsqrt(_3068);
        float _3074 = -_3070;
        float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3078 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = _3058 * _3072;
        float _3084 = _3054 * _3072;
        float _3086 = abs(_3080);
        float _3088 = log2(_3086);
        float _3090 = _3062 * _3072;
        float _3092 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3094 = _2726 * _3084;
        float _3096 = -_3084;
        float _3098 = -_3092;
        float _3100 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3098);
        float _3102 = fma(_2728, _3082, _3094);
        float _3104 = -_3090;
        float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3100);
        float _3108 = fma(_2740, _3090, _3102);
        float _3110 = precise::clamp(_3108, 0.0, 1.0);
        float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3114 = _3106 + _3112;
        float _3116 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = exp2(_3116);
        float _3124 = _3122 * _3120;
        float _3126 = _3110 * _3124;
        float _3128 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3130 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3128;
        out.m_95.y = _3130;
        out.m_95.z = _3132;
    }
    out.m_97.x = _3044;
    out.m_97.y = _3046;
    out.m_97.z = _3048;
    if (!_3030)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3134;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2886 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_138);
        out.gl_Position.z = _3201;
    }
    if (!_126)
    {
        return out;
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3256 = as_type<float>(_164);
        out.gl_Position.z = _3256;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_55.x;
    float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _170 = log2(_168);
    float _172 = in.m_55.z;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _176 = in.m_55.y;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _182 = -_174;
    float _184 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _182);
    float _186 = -_178;
    float _188 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _190 = -_180;
    float _192 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _190);
    float _194 = in.m_46.x;
    float _196 = in.m_46.y;
    float _198 = in.m_46.z;
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = _122 * _170;
    float _204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _200);
    float _206 = _166 * 2.0;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _204);
    float _210 = floor(_206);
    float _212 = _172 * 2.0;
    float _214 = _166 + _172;
    float _216 = _172 + (-0.5);
    float _218 = _214 + (-1.0);
    float _220 = floor(_212);
    float _222 = _176 + _172;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _222 + (-1.0);
    bool _228 = _210 > 0.0;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _232 = _210 >= 0.0;
    bool _234 = isnan(_210);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = _176 * 2.0;
    float _244 = exp2(_202);
    float _246 = _176 + _166;
    int _248 = _240 ? 0 : 1;
    bool _250 = _220 > 0.0;
    float _252 = _246 + (-1.0);
    bool _254 = _220 >= 0.0;
    bool _256 = isnan(_220);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = floor(_242);
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _288 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = 1.0 / _284;
    float _304 = -_244;
    float _306 = _304 + 1.0;
    int _308 = _262 ? 0 : 1;
    float _310 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    bool _312 = !_292;
    int _314 = _312 ? 0 : 1;
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    bool _318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _326 = _322 || _324;
    float _328 = _310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _330 = _264 > 0.0;
    float _332 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = _326 ? _306 : 0.0;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _338 = _328 + _336;
    bool _340 = _264 >= 0.0;
    bool _342 = isnan(_264);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = -_332;
    float _352 = _350 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _354 = ~_248;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = rsqrt(_208);
    int _362 = _348 ? 0 : 1;
    float _364 = _334 * _302;
    int _366 = _358;
    float _368 = _338;
    int _370 = as_type<int>(_216);
    float _372 = _172;
    float _374 = _176;
    if (!_228)
    {
        int _376 = ~_248;
        int _378 = _376 + 1;
        _366 = _378;
    }
    int _380 = _366;
    int _382 = ~_362;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = abs(_338);
    float _390 = abs(_352);
    float _392 = precise::max(_388, _390);
    int _394 = _386;
    if (!_330)
    {
        int _396 = ~_362;
        int _398 = _396 + 1;
        _394 = _398;
    }
    int _400 = _394;
    int _402 = ~_308;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    bool _408 = !_296;
    int _410 = _408 ? 0 : 1;
    int _412 = _406;
    if (!_250)
    {
        int _414 = ~_308;
        int _416 = _414 + 1;
        _412 = _416;
    }
    int _418 = _412;
    float _420 = _166 * 6.283185482025146484375;
    int _422 = abs(_314);
    bool _424 = _392 >= 16.0;
    float _426 = fma(_122, 0.02999999932944774627685546875, _420);
    bool _428 = !_300;
    int _430 = _428 ? 0 : 1;
    int _432 = abs(_410);
    float _434 = _426 * 0.15915493667125701904296875;
    float _436 = float(_422);
    float _438 = float(_418);
    int _440 = abs(_430);
    float _442 = _434 * 6.283185482025146484375;
    float _444 = sin(_442);
    float _446 = _436 * _438;
    float _448 = float(_380);
    if (_424)
    {
        float _450 = _338 * 0.0625;
        _368 = _450;
    }
    float _452 = _368;
    float _454 = float(_432);
    float _456 = _184 * _184;
    float _458 = float(_440);
    float _460 = float(_400);
    float _462 = _454 * _448;
    float _464 = abs(_452);
    bool _466 = _464 != 0.0;
    bool _468 = isnan(_464);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _446 * (-2.0);
    bool _478 = !_280;
    float _480 = _478 ? _122 : _364;
    float _482 = _458 * _460;
    float _484 = _352 * 0.0625;
    float _486 = fma(_266, _476, _266);
    float _488 = _360 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _490 = _166 + (-0.5);
    float _492 = fma(_188, _188, _456);
    float _494 = _424 ? _484 : _352;
    float _496 = _488 * (-0.699999988079071044921875);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _504 = _502 != 0;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _508 = abs(_494);
    bool _510 = _508 == 0.0;
    bool _512 = !_474;
    bool _514 = _510 && _512;
    float _516 = fma(_192, _192, _492);
    float _518 = _496 * 0.15915493667125701904296875;
    float _520 = fma(_480, _486, _506);
    float _522 = in.m_57.x;
    float _524 = in.m_57.y;
    float _526 = in.m_57.z;
    bool _528 = !_504;
    int _530 = _528 ? 0 : 1;
    float _532 = _482 * (-2.0);
    float _534 = _520 * 0.15915493667125701904296875;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = abs(_494);
    bool _544 = _542 == 0.0;
    float _546 = _462 * (-2.0);
    float _548 = fma(_224, _532, _224);
    float _550 = rsqrt(_516);
    bool _552 = _504;
    if (_514)
    {
        bool _554 = as_type<int>(_494) >= 0;
        _552 = _554;
    }
    bool _556 = _552;
    float _558 = _176 + (-0.5);
    float _560 = fma(_230, _546, _230);
    float _562 = _216 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _564 = _562;
    if (_514)
    {
        int _566 = _556 ? 0 : 1078530011;
        _370 = _566;
    }
    int _568 = _370;
    float _570 = _558 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    bool _572 = !_500;
    int _574 = _572 ? 0 : 1;
    float _576 = _518 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_480, _548, _562);
    float _582 = fma(_480, _560, _570);
    int _584 = _568;
    if (_514)
    {
        int _586 = int(0x80000000) & as_type<int>(_452);
        int _588 = _568 | _586;
        _564 = as_type<float>(_588);
    }
    float _590 = _564;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _598 = _596 != 0;
    float _600 = _534 * 6.283185482025146484375;
    float _602 = sin(_600);
    bool _604 = !_594;
    int _606 = _604 ? 0 : 1;
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    float _612 = _534 * 6.283185482025146484375;
    float _614 = cos(_612);
    bool _616 = !_474;
    bool _618 = _616 && _544;
    int _620 = _594 ? (-1) : 0;
    float _622 = _590;
    float _624 = _590;
    if (!_618)
    {
        float _626 = abs(_452);
        bool _628 = _626 != as_type<float>(0x7f800000u /* inf */);
        bool _630 = isnan(_626);
        bool _632 = _628 || _630;
        bool _634 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _636 = _632 || _634;
        float _638 = abs(_494);
        bool _640 = _638 == as_type<float>(0x7f800000u /* inf */);
        float _642 = abs(_494);
        bool _644 = _642 == as_type<float>(0x7f800000u /* inf */);
        bool _646 = !_636;
        bool _648 = _644 && _646;
        if (_648)
        {
            bool _650 = as_type<int>(_494) >= 0;
            _620 = _650 ? (-1) : 0;
        }
        int _652 = _620;
        if (_648)
        {
            _584 = 1075235812;
        }
        int _654 = _584;
        int _656 = _654;
        if (_648)
        {
            int _658 = ~_652;
            int _660 = (_658 != 0) ? _654 : 1061752795;
            _656 = _660;
        }
        int _662 = _656;
        if (_648)
        {
            int _664 = int(0x80000000) & as_type<int>(_452);
            int _666 = _662 | _664;
            _622 = as_type<float>(_666);
        }
        float _668 = _622;
        bool _670 = !_636;
        bool _672 = _670 && _640;
        _624 = _668;
        if (!_672)
        {
            float _674 = abs(_452);
            float _676 = abs(_494);
            float _678 = precise::max(_674, _676);
            float _680 = abs(_452);
            float _682 = abs(_494);
            float _684 = precise::min(_680, _682);
            float _686 = 1.0 / _678;
            float _688 = abs(_452);
            float _690 = abs(_494);
            bool _692 = _688 > _690;
            bool _694 = as_type<int>(_494) >= 0;
            float _696 = abs(_452);
            float _698 = abs(_494);
            float _700 = _696 + _698;
            bool _702 = _700 > as_type<float>(0x7f800000u /* inf */);
            bool _704 = isnan(_700);
            bool _706 = _702 || _704;
            bool _708 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _710 = _706 || _708;
            float _712 = _684 * _686;
            float _714 = _712 * _712;
            float _716 = _714 + 11.33538818359375;
            float _718 = fma(_714, _716, 28.84246826171875);
            float _720 = fma(_714, _718, 19.6966705322265625);
            float _722 = fma(_714, -0.82336294651031494140625, -5.674867153167724609375);
            float _724 = fma(_714, _722, -6.565555095672607421875);
            float _726 = 1.0 / _720;
            float _728 = _714 * _724;
            float _730 = _712 * _728;
            float _732 = fma(_730, _726, _712);
            int _734 = as_type<int>(_452) & int(0x80000000);
            float _736 = _732;
            _624 = _700;
            if (_692)
            {
                float _738 = -_732;
                float _740 = _738 + 1.57079637050628662109375;
                _736 = _740;
            }
            float _742 = _736;
            int _744 = as_type<int>(_742);
            if (!_694)
            {
                float _746 = -_742;
                float _748 = _746 + 3.1415927410125732421875;
                _744 = as_type<int>(_748);
            }
            int _750 = _744;
            if (!_710)
            {
                int _752 = _734 | _750;
                _624 = as_type<float>(_752);
            }
        }
    }
    float _754 = _624;
    float _756 = -_754;
    float _758 = _582 + _756;
    float _760 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_61.y;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _768 = _522 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _770 = _580 * 0.15915493667125701904296875;
    float _772 = _764 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _524 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _536);
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _782 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    float _784 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _764 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _184 * _550;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _794 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = _778 * _780;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _540);
    float _800 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _804 = fma(_802, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _806 = _770 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _188 * _550;
    float _812 = -_762;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _816 = _790 * _790;
    float _818 = _792 * _794;
    float _820 = _798 * _800;
    float _822 = _192 * _550;
    float _824 = _444 * _814;
    float _826 = _770 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_810, _810, _816);
    float _832 = _602 * _774;
    float _834 = _804 * _824;
    float _836 = _614 * _788;
    float _838 = fma(_822, _822, _830);
    float _840 = _614 * _774;
    float _842 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _518 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = _614 * _808;
    float _850 = _602 * _808;
    float _852 = _602 * _788;
    float _854 = _788 * _808;
    float _856 = _848 * _818;
    float _858 = _774 * _808;
    float _860 = _850 * _818;
    float _862 = rsqrt(_838);
    float _864 = fma(_828, _836, _832);
    float _866 = fma(_828, _832, _836);
    float _868 = -_818;
    float _870 = _828 * _868;
    float _872 = -_840;
    float _874 = fma(_828, _852, _872);
    float _876 = -_852;
    float _878 = fma(_828, _840, _876);
    float _880 = fma(_864, _796, _856);
    float _882 = fma(_854, _796, _870);
    float _884 = fma(_874, _796, _860);
    float _886 = -_846;
    float _888 = _886 + 1.0;
    float _890 = fma(_878, _820, _880);
    float _892 = fma(_858, _820, _882);
    float _894 = fma(_866, _820, _884);
    float _896 = _842 + _890;
    float _898 = _328 + _892;
    float _900 = _810 * _862;
    float _902 = _790 * _862;
    float _904 = _822 * _862;
    float _906 = fma(_790, _834, _896);
    float _908 = _900 * _578;
    float _910 = _900 * _888;
    float _912 = _904 * _578;
    float _914 = _902 * _578;
    float _916 = _902 * _888;
    float _918 = fma(_810, _834, _898);
    float _920 = fma(_902, _910, _912);
    float _922 = -_912;
    float _924 = fma(_902, _910, _922);
    float _926 = fma(_902, _916, _846);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _930 = _906 + _928;
    float _932 = _332 + _894;
    float _934 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _936 = _918 + _934;
    float _938 = fma(_900, _910, _846);
    float _940 = _926 * _930;
    float _942 = fma(_822, _834, _932);
    float _944 = fma(_904, _916, _908);
    float _946 = -_908;
    float _948 = fma(_904, _916, _946);
    float _950 = fma(_920, _936, _940);
    float _952 = _924 * _930;
    float _954 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _956 = _942 + _954;
    float _958 = -_914;
    float _960 = fma(_904, _910, _958);
    float _962 = fma(_904, _910, _914);
    float _964 = _904 * _904;
    float _966 = _944 * _930;
    float _968 = fma(_938, _936, _952);
    float _970 = fma(_948, _956, _950);
    float _972 = fma(_888, _964, _846);
    float _974 = fma(_960, _936, _966);
    float _976 = fma(_962, _956, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _982 = fma(_972, _956, _974);
    float _984 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].y, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _980);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _992 = _990 != 0;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].y, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].z, _994);
    float _1002 = _996 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1008 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _810;
    float _1014 = _1002;
    float _1016 = _1004;
    if (!_992)
    {
        _1012 = 0.0;
    }
    float _1018 = _1012;
    float _1020 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1008);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1026 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1030 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1028 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1038, _1038, _1040);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1046 = _1018;
    float _1048 = _1024;
    float _1050 = _1030;
    float _1052 = _1028;
    float _1054 = _1038;
    float _1056 = _1034;
    if (!_992)
    {
        _1014 = 0.0;
    }
    float _1058 = _1014;
    float _1060 = sqrt(_1042);
    float _1062 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1044);
    float _1064 = _1058;
    if (!_992)
    {
        _1016 = 0.0;
    }
    float _1066 = _1016;
    float _1068 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1072 = _1060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1074 = !_992;
    float _1076 = _1066;
    if (!_1074)
    {
        float _1078 = -_842;
        float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1082 = -_328;
        float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1086 = _1080 * _1080;
        float _1088 = fma(_1084, _1084, _1086);
        float _1090 = fma(_352, _352, _1088);
        float _1092 = rsqrt(_1090);
        float _1094 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1096 = _1084 * _1094;
        float _1098 = _1080 * _1094;
        float _1100 = _352 * _1094;
        _1046 = _1098;
        _1048 = _1092;
        _1064 = _1096;
        _1076 = _1100;
    }
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1064;
    float _1108 = _1076;
    float _1110 = _1104;
    float _1112 = _1106;
    if (!_1072)
    {
        _1110 = _1070;
    }
    float _1114 = _1110;
    bool _1116 = !_1072;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1060 + _1122;
        float _1126 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1042);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1070, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1038, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1034, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1050 = _1152;
        _1052 = _1154;
    }
    float _1156 = _1118;
    float _1158 = _1050;
    float _1160 = _1052;
    float _1162 = _1102 + _1156;
    float _1164 = _1106 + _1158;
    float _1166 = _1108 + _1160;
    float _1168 = _328 + _1106;
    float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1172 = _1162 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1180 = _1166 + _1178;
    float _1182 = _332 + _1108;
    float _1184 = _1172 * _1172;
    float _1186 = fma(_1176, _1176, _1184);
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1176 * _1194;
    float _1198 = _1180 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1158;
    float _1218 = _1212;
    float _1220 = _1194;
    bool _1222 = _1208;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1208)
    {
        _1112 = _1202;
    }
    float _1228 = _1112;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = rsqrt(_1204);
        _1216 = _1232;
    }
    float _1234 = _1216;
    float _1236 = _1234;
    if (_1208)
    {
        float _1238 = _1212 * _1226;
        _1218 = _1238;
    }
    float _1240 = _1218;
    float _1242 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1208)
    {
        float _1244 = _1240 * 0.15915493667125701904296875;
        _1054 = _1244;
    }
    float _1246 = _1054;
    float _1248 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1226;
    if (_1208)
    {
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _352;
    float _1264 = _1260;
    if (_1208)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1194;
    float _1274 = -_1260;
    float _1276 = fma(_1172, _1272, _1274);
    if (_1208)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1278;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    float _1284 = _1256;
    if (_1208)
    {
        float _1286 = fma(_1256, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1056 = _1286;
    }
    float _1288 = _1056;
    float _1290 = _1288;
    if (!_1208)
    {
        _1282 = _1276;
    }
    float _1292 = _1282;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1270 + (-1.0);
        _1284 = _1296;
    }
    float _1298 = _1284;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1234 * _1288;
        _1290 = _1302;
    }
    float _1304 = _1290;
    if (!_1208)
    {
        _1236 = _1196;
    }
    float _1306 = _1236;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1310;
    }
    float _1312 = _1220;
    float _1314 = _1312;
    if (_1208)
    {
        float _1316 = _1196 * _1304;
        _1308 = _1316;
    }
    float _1318 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1320 = _1300;
    float _1322 = _1320;
    if (_1208)
    {
        float _1324 = _1198 * _1304;
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1208)
    {
        float _1328 = fma(_1276, _1270, _1312);
        _1294 = _1328;
    }
    float _1330 = _1294;
    if (!_1208)
    {
        _1314 = _1200;
    }
    float _1332 = _1314;
    float _1334 = _1332;
    if (_1208)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    if (_1208)
    {
        float _1340 = _1326 * _1326;
        _1230 = _1340;
    }
    float _1342 = _1230;
    float _1344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1338);
    float _1348 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1352 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1354 = _1346 + _1342;
    float _1356 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1358 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1360 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1362 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1364 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1358);
    float _1366 = rsqrt(_1354);
    float _1368 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1382 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1388 = -_1378;
    float _1390 = _1388 + 1.0;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = floor(_1350);
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1386, 1.0);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1408 = _1366 * _1318;
    float _1410 = _1366 * _1326;
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1406);
    float _1414 = abs(_1390);
    float _1416 = log2(_1414);
    float _1418 = _1366 * _1330;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = -_1420;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1422);
    float _1426 = floor(_1352);
    float _1428 = -_1398;
    float _1430 = _1350 + _1428;
    float _1432 = -_1410;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1424);
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1434, -0.5, 0.5);
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1446 = log2(_1402);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1442, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1454 = fma(_1442, _1450, -0.212114393711090087890625);
    float _1456 = -_1426;
    float _1458 = _1352 + _1456;
    float _1460 = sqrt(_1440);
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1452);
    float _1466 = _1418 + 1.0;
    float _1468 = fma(_1442, _1454, 1.570728778839111328125);
    float _1470 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = 1.0 / _1412;
    float _1474 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1476 = _1446 * 0.693147182464599609375;
    float _1478 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = exp2(_1444);
    float _1482 = _1460 * 0.636619746685028076171875;
    float _1484 = -_1468;
    float _1486 = fma(_1482, _1484, 1.0);
    float _1488 = _1464 * _1472;
    float _1490 = _1474 * _1472;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = -_1418;
    float _1498 = fma(_1480, _1466, _1496);
    float2 _5329 = float2(_1430, _1458);
    float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5329, float2(0.0), isnan(_5329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5329, float2(0.0), isnan(_5329)), level(0.0)).x;
    float3 _5340 = float3(_1492, _1494, _1478);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float _1504 = fma(_1498, 0.5, 0.5);
    float3 _5353 = float3(_1492, _1494, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _5369 = float2(_1486, _1504);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1529 = int(_1527);
    float _1531 = in.m_61.x;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -_762;
    float _1539 = _1537 + 1.0;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    out.m_63.y = _762;
    float _1545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1547 = int(_1545);
    float _1549 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1551 = _172 > 0.5;
    out.m_65.x = _1176;
    out.m_65.y = _1172;
    out.m_65.z = _1180;
    float _1553 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1549);
    float _1555 = _1474;
    if (_1535)
    {
        bool _1557 = _166 > 0.5;
        _1222 = _1557;
    }
    bool _1559 = _1222;
    float _1561 = in.m_67.x;
    float _1563 = float(_1529);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1569 = _1567 != 0;
    float _1571 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1553);
    float _1573 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1575 = 1.0 / _1563;
    float _1577 = float(uint(_1547));
    int _1579 = 0;
    float _1581 = _1531;
    if (_1543)
    {
        float _1583 = -_1531;
        float _1585 = _1583 + 1.0;
        _1579 = as_type<int>(_1585);
    }
    int _1587 = _1579;
    int _1589 = ~_1547;
    int _1591 = _1589 + 1;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1595 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1571);
    float _1597 = 1.0 / _1577;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1474;
    out.gl_Position.z = _1595;
    out.gl_Position.w = _1412;
    float _1601 = _122 * _1575;
    float _1603 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1599);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1615 = _1595;
    if (!_1535)
    {
        _1613 = _1531;
    }
    float _1617 = _1613;
    int _1619 = as_type<int>(_1597) + (-2);
    bool _1621 = !_1607;
    float _1623 = _1621 ? 1.2345600128173828125 : 1.0;
    bool _1625 = !_1607;
    float _1627 = _1625 ? _176 : _166;
    float _1629 = _1627 * _1623;
    float _1631 = 1.0 / _152;
    float _1633 = float(uint(_1611));
    float _1635 = float(_1611);
    float _1637 = as_type<float>(_1619) * _1633;
    int _1639 = ~_1547;
    int _1641 = _1639 + 1;
    float _1643 = floor(_1629);
    float _1645 = trunc(_1637);
    float _1647 = precise::max(_1645, 0.0);
    uint _1650 = uint(_1647);
    int _1652 = _1641 * int(_1650);
    int _1654 = _1652 + _1611;
    float _1656 = float(uint(_1654));
    float _1658 = as_type<float>(_1619) * _1656;
    float _1660 = in.m_55.w;
    float _1662 = trunc(_1658);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1650) + int(_1666);
    int _1670 = int(_1650);
    float _1672 = as_type<float>(_1666);
    float _1674 = _1617;
    if (_1535)
    {
        float _1676 = -_1531;
        float _1678 = _1676 + 1.0;
        _1670 = as_type<int>(_1678);
    }
    int _1680 = _1670;
    if (!_1543)
    {
        _1672 = _1531;
    }
    float _1682 = _1672;
    float _1684 = _1682;
    if (_1543)
    {
        float _1686 = _1551 ? as_type<float>(_1587) : _1531;
        _1684 = _1686;
    }
    float _1688 = _1684;
    int _1690 = _1591 * _1668;
    int _1692 = _1690 + _1611;
    if (_1535)
    {
        float _1694 = _1559 ? as_type<float>(_1680) : _1531;
        _1674 = _1694;
    }
    float _1696 = _1674;
    bool _1698 = _1660 > 0.5;
    float _1700 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1702 = uint(_1692) >= uint(_1547);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1706 = _1704 != 0;
    float _1708 = float(_1547);
    bool _1710 = !_1702;
    int _1712 = _1710 ? 0 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1698 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1720 = _1635 >= _1708;
    bool _1722 = isnan(_1635);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(_1708);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1738 = _1736 != 0;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1742 = _1740 != 0;
    float _1744 = trunc(_1730);
    int _1746 = int(_1744);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    float _1752 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1754 = _1551 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1756 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1565;
    float _1768 = fma(_1752, 2.0, _1766);
    float _1770 = _1569 ? as_type<float>(_1754) : _762;
    float _1772 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1774 = _176 > 0.5;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1778 = ~_1668;
    int _1780 = _1778 + _1712;
    int _1782 = _1780 + 1;
    float _1784 = _122 * _1708;
    int _1786 = _1774 ? as_type<int>(_1539) : as_type<int>(_762);
    float _1788 = fma(_1772, -2.0, _1776);
    float _1790 = -_1643;
    float _1792 = _1629 + _1790;
    int _1794 = _1547 * _1782;
    int _1796 = _1794 + _1611;
    float _1798 = _1738 ? as_type<float>(_1786) : _762;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1802 = _1547 == 0;
    float _1804 = _1784 * _1631;
    int _1806 = ~_1746;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1708 * _1792;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1796 : (-1);
    float _1818 = _1742 ? as_type<float>(_1718) : _762;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1822 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1593);
    int _1824 = _1816 * _1810;
    int _1826 = _1547 + (-1);
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1830 = abs(_530);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1834 = abs(_1716);
    float _1836 = trunc(_1804);
    int _1838 = int(_1836);
    int _1840 = _1746 * _1826;
    int _1842 = _1840 + _1824;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1846 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1828);
    float _1848 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1788);
    int _1850 = _1842 * _1830;
    float _1852 = fma(_1844, _1798, -0.5);
    float _1854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1846);
    float _1856 = trunc(_1812);
    int _1858 = int(_1856);
    float _1860 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1862 = abs(_574);
    float _1864 = -_1848;
    float _1866 = fma(_1854, _1852, _1864);
    float _1868 = fma(_1860, _1770, -0.5);
    float _1870 = _1848;
    float _1872 = _1800;
    float _1874 = as_type<float>(_1830);
    if (_1607)
    {
        _1870 = _166;
    }
    float _1876 = _1870;
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1880 = _1876;
    if (!_1607)
    {
        _1880 = _172;
    }
    float _1882 = _1880;
    int _1884 = _1838 * _1862;
    int _1886 = _1884 + _1850;
    int _1888 = abs(_606);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1892 = _1858 * _1834;
    int _1894 = _1892 + _1611;
    int _1896 = abs(_610);
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1902 = _1894 * _1888;
    int _1904 = _1902 + _1886;
    int _1906 = as_type<int>(_1900);
    if (!_1607)
    {
        _1872 = _176;
    }
    float _1908 = _1872;
    float _1910 = -_1900;
    float _1912 = fma(_1890, 2.0, _1910);
    int _1914 = _1858 * _1896;
    int _1916 = _1914 + _1904;
    float _1918 = _1908;
    if (_1734)
    {
        float _1920 = -_1531;
        float _1922 = _1920 + 1.0;
        _1906 = as_type<int>(_1922);
    }
    int _1924 = _1906;
    if (_1607)
    {
        _1918 = _166;
    }
    float _1926 = _1918;
    float _1928 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1930 = float(uint(_1916));
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1934 = _1930;
    float _1936 = _1878;
    if (_1734)
    {
        float _1938 = _1774 ? as_type<float>(_1924) : _1531;
        _1581 = _1938;
    }
    float _1940 = _1581;
    bool _1942 = _538 != 0.0;
    bool _1944 = isnan(_538);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan(0.0);
    bool _1950 = _1946 || _1948;
    float _1952 = as_type<float>(_1619) * _1930;
    float _1954 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1932);
    float _1956 = in.m_69.x;
    float _1958 = in.m_69.y;
    float _1960 = in.m_69.z;
    bool _1962 = _536 == 0.0;
    bool _1964 = !_1950;
    bool _1966 = _1962 && _1964;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1970 = trunc(_1952);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1978 = _540 == 0.0;
    bool _1980 = _1978 && _1966;
    float _1982 = fma(_1928, _1940, -0.5);
    float _1984 = -_1976;
    float _1986 = fma(_1968, 2.0, _1984);
    int _1988 = ~_1547;
    int _1990 = _1988 + 1;
    float _1992 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1607)
    {
        _1934 = _172;
    }
    float _1998 = _1934;
    float _2000 = fma(_1992, _1696, -0.5);
    float _2002 = _1998;
    if (_1607)
    {
        _2002 = _176;
    }
    float _2004 = _2002;
    float _2006 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1994);
    if (_1607)
    {
        _372 = _176;
    }
    float _2008 = _372;
    float _2010 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1954);
    int _2012 = _1990 * int(_1974);
    int _2014 = _2012 + _1916;
    float _2016 = as_type<float>(_2014);
    float _2018 = _2008;
    if (!_1607)
    {
        _374 = _166;
    }
    float _2020 = _374;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2024 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2026 = float(uint(_1894));
    float _2028 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2006);
    float _2030 = _2022;
    if (_1980)
    {
        _1874 = _1956;
    }
    float _2032 = _1874;
    float _2034 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2022);
    float _2036 = float(uint(_2014));
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2040 = _2032;
    if (_1980)
    {
        _2030 = _2032;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (!_1980)
    {
        _2040 = _1956;
    }
    float _2046 = _2040;
    float _2048 = as_type<float>(_1619) * _2036;
    if (_1980)
    {
        _1996 = _1958;
    }
    float _2050 = _1996;
    float _2052 = -_122;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1986);
    float _2056 = _2050;
    if (_1980)
    {
        _2016 = _1960;
    }
    float _2058 = _2016;
    float _2060 = _2058;
    if (!_1980)
    {
        float _2062 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2046);
        _2044 = _2062;
    }
    float _2064 = _2044;
    if (_1980)
    {
        _2018 = _2050;
    }
    float _2066 = _2018;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    float _2074 = _2066;
    if (!_1980)
    {
        _2056 = _1958;
    }
    float _2076 = _2056;
    float _2078 = fma(_2010, _1700, _2054);
    if (_1980)
    {
        _1936 = _2058;
    }
    float _2080 = _1936;
    float _2082 = _2078 + 0.5;
    float _2084 = _2080;
    if (!_1980)
    {
        _2060 = _1960;
    }
    float _2086 = _2060;
    float _2088 = -_122;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1768);
    float _2092 = as_type<float>(_1619) * _2026;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2096 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    int _2098 = ~_1547;
    int _2100 = _2098 + 1;
    float _2102 = -_122;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1912);
    float _2106 = fma(_2024, -2.0, _2094);
    float _2108 = trunc(_2092);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = fma(_2096, _2000, _2090);
    int _2116 = int(_1974) + int(_2072);
    float _2118 = fma(_2028, _1982, _2104);
    float _2120 = in.m_71.x;
    float _2122 = in.m_71.y;
    float _2124 = in.m_71.z;
    float _2126 = in.m_71.w;
    int _2128 = ~_1547;
    int _2130 = _2128 + 1;
    float _2132 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2106);
    int _2134 = _2100 * _2116;
    int _2136 = _2134 + _1916;
    if (!_1980)
    {
        float _2138 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2084 = _2138;
    }
    float _2140 = _2084;
    if (!_1980)
    {
        float _2142 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2076);
        _2074 = _2142;
    }
    float _2144 = _2074;
    float _2146 = exp2(_1573);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2150 = uint(_2136) >= uint(_1547);
    int _2152 = _2130 * int(_2112);
    int _2154 = _2152 + _1894;
    float _2156 = fma(_2038, -2.0, _2148);
    bool _2158 = !_2150;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2164 = float(uint(_2154));
    float _2166 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1822);
    float _2168 = -_2132;
    float _2170 = fma(_2162, _1832, _2168);
    int _2172 = ~_2116;
    int _2174 = _2172 + _2160;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1619) * _2164;
    float _2180 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2156);
    float _2182 = _2124 * _2046;
    float _2184 = _2120 * _2076;
    float _2186 = _2122 * _2086;
    float _2188 = trunc(_2178);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = -_2182;
    float _2196 = fma(_2120, _2086, _2194);
    float _2198 = -_2184;
    float _2200 = fma(_2122, _2046, _2198);
    float _2202 = -_2186;
    float _2204 = fma(_2124, _2076, _2202);
    int _2206 = _1547 * _2176;
    int _2208 = _2206 + _1916;
    float _2210 = _1866 + 0.5;
    float _2212 = _2196 * _2126;
    float _2214 = _2114 + 0.5;
    float _2216 = _2204 * _2126;
    float _2218 = _2200 * _2126;
    bool _2220 = !_1802;
    int _2222 = _2220 ? _2208 : (-1);
    float _2224 = _2170 + 0.5;
    float _2226 = -_2180;
    float _2228 = fma(_2166, _1868, _2226);
    float _2230 = _842 + _1102;
    int _2232 = _2222 >> 31;
    float _2234 = _2118 + 0.5;
    int _2236 = int(_2112) + int(_2192);
    out.m_73.x = _2214;
    out.m_73.y = _2210;
    out.m_73.z = _2082;
    out.m_73.w = _2224;
    int _2238 = _2232 & 3;
    float _2240 = _2228 + 0.5;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2246 = ~_1547;
    int _2248 = _2246 + 1;
    float _2250 = _850 * _2212;
    out.m_75.x = _2234;
    out.m_75.y = _2240;
    int _2252 = _2222 & 3;
    bool _2254 = _2252 != 0;
    int _2256 = _2248 * _2236;
    int _2258 = _2256 + _1894;
    float _2260 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2242);
    int _2262 = _2222 + _2238;
    float _2264 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2244);
    bool _2266 = uint(_2258) >= uint(_1547);
    float _2268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2260);
    int _2270 = _2262 >> 2;
    float _2272 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    int _2274 = _2222 & 3;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2278 = _2270 << 4;
    int _2280 = _2278 + 512;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2284 = !_2266;
    int _2286 = _2284 ? 0 : (-1);
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2280) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = 1.0 / _2282;
    float _2308 = _2276 + _2282;
    out.m_77.w = _2288;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2312 = _2280 + 8;
    uint _2314 = uint(int(uint(_2312) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = uint(_2274) > 1u;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2334 = ~_2236;
    int _2336 = _2334 + _2286;
    int _2338 = _2336 + 1;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2344 = _2254 ? 0 : 1;
    int _2346 = _1547 * _2338;
    int _2348 = _2346 + _1894;
    float _2350 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2308 * _2306;
    float _2358 = _2356 * 0.5;
    int _2360 = ~_2344;
    int _2362 = _2360 + 1;
    int _2364 = _2362 + 1;
    float _2366 = -_2212;
    float _2368 = _828 * _2366;
    int _2370 = _2364;
    if (!_2330)
    {
        int _2372 = ~_2344;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2380 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2378);
    out.m_79.x = _2342;
    out.m_79.y = _2350;
    out.m_79.z = _2354;
    out.m_79.w = _2352;
    bool _2382 = _2274 != 3;
    float _2384 = _848 * _2212;
    bool _2386 = uint(_2274) >= 2u;
    float _2388 = _848 * _2122;
    int _2390 = abs(_2376);
    float _2392 = _848 * _2144;
    int _2394 = _2386 ? 0 : 1;
    float _2396 = fma(_864, _2120, _2388);
    int _2398 = ~_2390;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_864, _2064, _2392);
    bool _2406 = !_1802;
    int _2408 = _2406 ? _2348 : (-1);
    bool _2410 = !_2254;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, _2216, _2368);
    bool _2416 = _2274 != 3;
    float _2418 = _850 * _2122;
    float _2420 = 1.0 / _2380;
    int _2422 = ~_2394;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = fma(_864, _2216, _2384);
    int _2430 = abs(_2412);
    float _2432 = fma(_874, _2216, _2250);
    int _2434 = _2426;
    if (_2382)
    {
        int _2436 = ~_2394;
        int _2438 = _2436 + 1;
        _2434 = _2438;
    }
    int _2440 = _2434;
    int _2442 = _2402 * as_type<int>(_2304);
    float _2444 = -_2122;
    float _2446 = _828 * _2444;
    int _2448 = ~_2430;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_874, _2120, _2418);
    int _2456 = abs(_2440);
    float _2458 = fma(_854, _2120, _2446);
    bool _2460 = !_1750;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = _2452 * as_type<int>(_2296);
    int _2466 = _2464 + _2442;
    float _2468 = fma(_858, _2218, _2414);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2472 = _2420 * _2470;
    bool _2474 = !_2416;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = -_2144;
    float _2480 = _828 * _2478;
    int _2482 = ~_2456;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    float _2488 = abs(_2472);
    float _2490 = log2(_2488);
    int _2492 = abs(_2462);
    float _2494 = fma(_858, _2124, _2458);
    float _2496 = _850 * _2144;
    int _2498 = _2486 * as_type<int>(_2320);
    int _2500 = _2498 + _2466;
    int _2502 = abs(_2476);
    float _2504 = fma(_878, _2218, _2428);
    float _2506 = fma(_866, _2218, _2432);
    int _2508 = ~_2492;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_854, _2064, _2480);
    int _2516 = ~_2502;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_878, _2124, _2396);
    out.m_81.x = _2468;
    out.m_81.y = _2504;
    out.m_81.z = _2506;
    float _2524 = fma(_866, _2124, _2454);
    float _2526 = fma(_874, _2064, _2496);
    int _2528 = _2520 * as_type<int>(_2328);
    int _2530 = _2528 + _2500;
    float _2532 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2534 = _1595 + _1412;
    float _2536 = _1464 + _1412;
    int _2538 = _2530 * _2512;
    float _2540 = _1412 * 0.5;
    out.m_83.x = _2494;
    out.m_83.y = _2522;
    out.m_83.z = _2524;
    float _2542 = exp2(_2532);
    int _2544 = _2408 * _2492;
    int _2546 = _2544 + _2538;
    float _2548 = _2534 * 0.5;
    float _2550 = _2536 * 0.5;
    float _2552 = fma(_1474, -0.5, _2540);
    float _2554 = float(_2546);
    bool _2556 = _2472 <= 8000.0;
    bool _2558 = isnan(_2472);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan(8000.0);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    out.m_85.y = _2554;
    out.m_87.x = _2550;
    out.m_87.y = _2552;
    out.m_87.z = _2548;
    out.m_87.w = _1412;
    float _2568 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _2554;
    if (_1764)
    {
        _2572 = 1.0;
    }
    float _2574 = _2572;
    float _2576 = fma(_2570, -2.0, 3.0);
    float _2578 = _2570 * _2570;
    float _2580 = _2578 * _2576;
    float _2582 = -_2580;
    float _2584 = _2582 + 1.0;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2580);
    float _2588 = _2584;
    float _2590 = _2574;
    if (_1764)
    {
        _2588 = 1.0;
    }
    float _2592 = _2588;
    float _2594 = _2592;
    if (!_1764)
    {
        float _2596 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2598 = _2596 * 0.15915493667125701904296875;
        float _2600 = _2598 * 6.283185482025146484375;
        float _2602 = cos(_2600);
        float _2604 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = _2598 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        float _2612 = 1.0 / _2602;
        float _2614 = _2606 * 6.283185482025146484375;
        float _2616 = cos(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = _2606 * 6.283185482025146484375;
        float _2622 = sin(_2620);
        float _2624 = _2616 * _2618;
        float _2626 = 1.0 / _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2628;
        float _2632 = 1.0 / _2630;
        float _2634 = _2622 * _2626;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2638 = fma(_2472, _2634, _2636);
        float _2640 = _2638 * _2632;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        _2594 = _2642;
        _1615 = _2612;
        _1555 = _2632;
    }
    float _2644 = _2594;
    float _2646 = _1615;
    float _2648 = _1555;
    float _2650 = _2646;
    float _2652 = _2648;
    if (!_1764)
    {
        float _2654 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2656 = _2654 * 0.15915493667125701904296875;
        float _2658 = _2656 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2664 = _2662 * 0.15915493667125701904296875;
        float _2666 = _2656 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        float _2670 = 1.0 / _2660;
        float _2672 = _2664 * 6.283185482025146484375;
        float _2674 = cos(_2672);
        float _2676 = _2668 * _2670;
        float _2678 = _2664 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2674 * _2676;
        float _2684 = 1.0 / _2682;
        float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2686;
        float _2690 = 1.0 / _2688;
        float _2692 = _2680 * _2684;
        float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2696 = fma(_2472, _2692, _2694);
        float _2698 = _2696 * _2690;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = -_2700;
        float _2704 = _2702 + 1.0;
        _2590 = _2704;
        _2650 = _2656;
        _2652 = _2664;
    }
    float _2706 = _2590;
    float _2708 = _2650;
    float _2710 = _2652;
    float _2712 = _2566 * _2586;
    float _2714 = -_2146;
    float _2716 = _2714 + 1.0;
    float _2718 = -_1500;
    float _2720 = _2718 + 1.0;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2724 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2726 = fma(_878, _2140, _2404);
    float _2728 = fma(_858, _2140, _2514);
    float _2730 = _2720 * _2722;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2724 * _1502;
    float _2736 = -_2724;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_866, _2140, _2526);
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _1515 * _2734;
    float _2748 = _1525 * _2734;
    float _2750 = _1515 * _2738;
    float _2752 = _2744 * _1561;
    float _2754 = fma(_1521, _2746, _1509);
    float _2756 = fma(_1523, _2746, _1511);
    float _2758 = fma(_1515, _2748, _1513);
    float _2760 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2728;
    out.m_89.y = _2726;
    out.m_89.z = _2740;
    bool _2762 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2764 = isnan(_1192);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2770 = _2766 || _2768;
    float _2772 = _2644 * _2706;
    out.m_91.x = _2760;
    float _2774 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2754;
    out.m_93.y = _2756;
    out.m_93.z = _2758;
    out.m_93.w = _2750;
    float _2776 = _2752;
    float _2778 = _2708;
    float _2780 = _2710;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2784 = _2746;
    float _2786 = _2738;
    if (!_2770)
    {
        _2776 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2788 = _2776;
    float _2790 = _2788;
    float _2792 = _2788;
    if (!_2770)
    {
        _2778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2770)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2780;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2770)
    {
        _2782 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2782;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2770)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2812 = _2784;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2770)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2818 = _2786;
    bool _2820 = !_2770;
    float _2822 = _2818;
    float _2824 = _2818;
    if (!_2820)
    {
        bool _2826 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2828 = isnan(_1192);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2834 = _2830 || _2832;
        if (!_2834)
        {
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2838 = _1192 + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2840;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2848 = 1.0 / _2842;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2866 = _2838 * _2848;
            float _2868 = precise::clamp(_2866, 0.0, 1.0);
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2876 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2878 = fma(_2868, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2878;
            _2816 = _2882;
            _2792 = _2874;
            _2810 = _2880;
            _2804 = _2876;
            _2824 = _2884;
            _2886 = true;
        }
        else
        {
            bool _2888 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2890 = isnan(_1192);
            bool _2892 = _2888 || _2890;
            bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2896 = _2892 || _2894;
            if (!_2896)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2898 = _2790;
            _2792 = _2898;
            if (!_2896)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2900 = _2796;
            _2798 = _2900;
            if (!_2896)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2902 = _2802;
            _2804 = _2902;
            if (!_2896)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2904 = _2808;
            _2810 = _2904;
            if (!_2896)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2906 = _2814;
            _2816 = _2906;
            if (!_2896)
            {
                _2822 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2908 = _2822;
            bool _2910 = !_2896;
            _2824 = _2908;
            if (!_2910)
            {
                bool _2912 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2914 = isnan(_1192);
                bool _2916 = _2912 || _2914;
                bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2920 = _2916 || _2918;
                if (!_2920)
                {
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2924 = _1192 + _2922;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2926;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2934 = 1.0 / _2928;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2952 = _2924 * _2934;
                    float _2954 = precise::clamp(_2952, 0.0, 1.0);
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2960 = fma(_2954, _2932, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2962 = fma(_2954, _2958, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2964 = fma(_2954, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2954, _2942, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2968 = fma(_2954, _2946, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2970 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2964;
                    _2816 = _2968;
                    _2792 = _2960;
                    _2810 = _2966;
                    _2804 = _2962;
                    _2824 = _2970;
                    _2886 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2824 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2886 = false;
    float _2972 = _2798;
    float _2974 = _2816;
    float _2976 = _2792;
    float _2978 = _2810;
    float _2980 = _2804;
    float _2982 = _2824;
    float _2984 = fma(_2726, -0.5, 0.5);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = -_2972;
    float _2990 = _2988 + _2974;
    float _2992 = _2774 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2994 = -_2976;
    float _2996 = _2994 + _2978;
    out.m_95.x = 0.0;
    float _2998 = fma(_2986, _2990, _2972);
    float _3000 = fma(_2986, _2996, _2976);
    out.m_53.x = _2992;
    float _3002 = -_2980;
    float _3004 = _3002 + _2982;
    float _3006 = _2998 * 0.586610972881317138671875;
    bool _3008 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3010 = fma(_2986, _3004, _2980);
    float _3012 = fma(_3000, 0.298911988735198974609375, _3006);
    bool _3014 = _2644 > 0.0;
    bool _3016 = isnan(_2644);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan(0.0);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_3010, 0.114477999508380889892578125, _3012);
    bool _3026 = _2706 <= 0.0;
    bool _3028 = !_3022;
    bool _3030 = _3026 || _3028;
    float _3032 = -_3024;
    float _3034 = _3000 + _3032;
    float _3036 = -_3024;
    float _3038 = _2998 + _3036;
    float _3040 = -_3024;
    float _3042 = _3010 + _3040;
    float _3044 = fma(_3034, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3046 = fma(_3038, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3048 = fma(_3042, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    bool _3050 = !_3008;
    if (!_3050)
    {
        float _3052 = -_1162;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3056 = -_1164;
        float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3060 = -_1166;
        float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3064 = _3054 * _3054;
        float _3066 = fma(_3058, _3058, _3064);
        float _3068 = fma(_3062, _3062, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = rsqrt(_3068);
        float _3074 = -_3070;
        float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3078 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = _3058 * _3072;
        float _3084 = _3054 * _3072;
        float _3086 = abs(_3080);
        float _3088 = log2(_3086);
        float _3090 = _3062 * _3072;
        float _3092 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3094 = _2726 * _3084;
        float _3096 = -_3084;
        float _3098 = -_3092;
        float _3100 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3098);
        float _3102 = fma(_2728, _3082, _3094);
        float _3104 = -_3090;
        float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3100);
        float _3108 = fma(_2740, _3090, _3102);
        float _3110 = precise::clamp(_3108, 0.0, 1.0);
        float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3114 = _3106 + _3112;
        float _3116 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = exp2(_3116);
        float _3124 = _3122 * _3120;
        float _3126 = _3110 * _3124;
        float _3128 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3130 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3128;
        out.m_95.y = _3130;
        out.m_95.z = _3132;
    }
    out.m_97.x = _3044;
    out.m_97.y = _3046;
    out.m_97.z = _3048;
    if (!_3030)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3134;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2886 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_138);
        out.gl_Position.z = _3201;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3256 = as_type<float>(_164);
        out.gl_Position.z = _3256;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.x;
    float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _170 = log2(_168);
    float _172 = in.m_55.z;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _176 = in.m_55.y;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _182 = -_174;
    float _184 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _182);
    float _186 = -_178;
    float _188 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _190 = -_180;
    float _192 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _190);
    float _194 = in.m_46.x;
    float _196 = in.m_46.y;
    float _198 = in.m_46.z;
    float _200 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _202 = _122 * _170;
    float _204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _200);
    float _206 = _166 * 2.0;
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _204);
    float _210 = floor(_206);
    float _212 = _172 * 2.0;
    float _214 = _166 + _172;
    float _216 = _172 + (-0.5);
    float _218 = _214 + (-1.0);
    float _220 = floor(_212);
    float _222 = _176 + _172;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _222 + (-1.0);
    bool _228 = _210 > 0.0;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _232 = _210 >= 0.0;
    bool _234 = isnan(_210);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = _176 * 2.0;
    float _244 = exp2(_202);
    float _246 = _176 + _166;
    int _248 = _240 ? 0 : 1;
    bool _250 = _220 > 0.0;
    float _252 = _246 + (-1.0);
    bool _254 = _220 >= 0.0;
    bool _256 = isnan(_220);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = floor(_242);
    float _266 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = _196 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _284 = 1.0 + _282;
    float _286 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _288 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _300 = _298 != 0;
    float _302 = 1.0 / _284;
    float _304 = -_244;
    float _306 = _304 + 1.0;
    int _308 = _262 ? 0 : 1;
    float _310 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    bool _312 = !_292;
    int _314 = _312 ? 0 : 1;
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    bool _318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _326 = _322 || _324;
    float _328 = _310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _330 = _264 > 0.0;
    float _332 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = _326 ? _306 : 0.0;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _338 = _328 + _336;
    bool _340 = _264 >= 0.0;
    bool _342 = isnan(_264);
    bool _344 = _340 || _342;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    float _350 = -_332;
    float _352 = _350 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _354 = ~_248;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = rsqrt(_208);
    int _362 = _348 ? 0 : 1;
    float _364 = _334 * _302;
    int _366 = _358;
    float _368 = _338;
    int _370 = as_type<int>(_216);
    float _372 = _172;
    float _374 = _176;
    if (!_228)
    {
        int _376 = ~_248;
        int _378 = _376 + 1;
        _366 = _378;
    }
    int _380 = _366;
    int _382 = ~_362;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = abs(_338);
    float _390 = abs(_352);
    float _392 = precise::max(_388, _390);
    int _394 = _386;
    if (!_330)
    {
        int _396 = ~_362;
        int _398 = _396 + 1;
        _394 = _398;
    }
    int _400 = _394;
    int _402 = ~_308;
    int _404 = _402 + 1;
    int _406 = _404 + 1;
    bool _408 = !_296;
    int _410 = _408 ? 0 : 1;
    int _412 = _406;
    if (!_250)
    {
        int _414 = ~_308;
        int _416 = _414 + 1;
        _412 = _416;
    }
    int _418 = _412;
    float _420 = _166 * 6.283185482025146484375;
    int _422 = abs(_314);
    bool _424 = _392 >= 16.0;
    float _426 = fma(_122, 0.02999999932944774627685546875, _420);
    bool _428 = !_300;
    int _430 = _428 ? 0 : 1;
    int _432 = abs(_410);
    float _434 = _426 * 0.15915493667125701904296875;
    float _436 = float(_422);
    float _438 = float(_418);
    int _440 = abs(_430);
    float _442 = _434 * 6.283185482025146484375;
    float _444 = sin(_442);
    float _446 = _436 * _438;
    float _448 = float(_380);
    if (_424)
    {
        float _450 = _338 * 0.0625;
        _368 = _450;
    }
    float _452 = _368;
    float _454 = float(_432);
    float _456 = _184 * _184;
    float _458 = float(_440);
    float _460 = float(_400);
    float _462 = _454 * _448;
    float _464 = abs(_452);
    bool _466 = _464 != 0.0;
    bool _468 = isnan(_464);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _446 * (-2.0);
    bool _478 = !_280;
    float _480 = _478 ? _122 : _364;
    float _482 = _458 * _460;
    float _484 = _352 * 0.0625;
    float _486 = fma(_266, _476, _266);
    float _488 = _360 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _490 = _166 + (-0.5);
    float _492 = fma(_188, _188, _456);
    float _494 = _424 ? _484 : _352;
    float _496 = _488 * (-0.699999988079071044921875);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _504 = _502 != 0;
    float _506 = _490 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _508 = abs(_494);
    bool _510 = _508 == 0.0;
    bool _512 = !_474;
    bool _514 = _510 && _512;
    float _516 = fma(_192, _192, _492);
    float _518 = _496 * 0.15915493667125701904296875;
    float _520 = fma(_480, _486, _506);
    float _522 = in.m_57.x;
    float _524 = in.m_57.y;
    float _526 = in.m_57.z;
    bool _528 = !_504;
    int _530 = _528 ? 0 : 1;
    float _532 = _482 * (-2.0);
    float _534 = _520 * 0.15915493667125701904296875;
    float _536 = in.m_59.x;
    float _538 = in.m_59.y;
    float _540 = in.m_59.z;
    float _542 = abs(_494);
    bool _544 = _542 == 0.0;
    float _546 = _462 * (-2.0);
    float _548 = fma(_224, _532, _224);
    float _550 = rsqrt(_516);
    bool _552 = _504;
    if (_514)
    {
        bool _554 = as_type<int>(_494) >= 0;
        _552 = _554;
    }
    bool _556 = _552;
    float _558 = _176 + (-0.5);
    float _560 = fma(_230, _546, _230);
    float _562 = _216 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _564 = _562;
    if (_514)
    {
        int _566 = _556 ? 0 : 1078530011;
        _370 = _566;
    }
    int _568 = _370;
    float _570 = _558 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    bool _572 = !_500;
    int _574 = _572 ? 0 : 1;
    float _576 = _518 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = fma(_480, _548, _562);
    float _582 = fma(_480, _560, _570);
    int _584 = _568;
    if (_514)
    {
        int _586 = int(0x80000000) & as_type<int>(_452);
        int _588 = _568 | _586;
        _564 = as_type<float>(_588);
    }
    float _590 = _564;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _598 = _596 != 0;
    float _600 = _534 * 6.283185482025146484375;
    float _602 = sin(_600);
    bool _604 = !_594;
    int _606 = _604 ? 0 : 1;
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    float _612 = _534 * 6.283185482025146484375;
    float _614 = cos(_612);
    bool _616 = !_474;
    bool _618 = _616 && _544;
    int _620 = _594 ? (-1) : 0;
    float _622 = _590;
    float _624 = _590;
    if (!_618)
    {
        float _626 = abs(_452);
        bool _628 = _626 != as_type<float>(0x7f800000u /* inf */);
        bool _630 = isnan(_626);
        bool _632 = _628 || _630;
        bool _634 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _636 = _632 || _634;
        float _638 = abs(_494);
        bool _640 = _638 == as_type<float>(0x7f800000u /* inf */);
        float _642 = abs(_494);
        bool _644 = _642 == as_type<float>(0x7f800000u /* inf */);
        bool _646 = !_636;
        bool _648 = _644 && _646;
        if (_648)
        {
            bool _650 = as_type<int>(_494) >= 0;
            _620 = _650 ? (-1) : 0;
        }
        int _652 = _620;
        if (_648)
        {
            _584 = 1075235812;
        }
        int _654 = _584;
        int _656 = _654;
        if (_648)
        {
            int _658 = ~_652;
            int _660 = (_658 != 0) ? _654 : 1061752795;
            _656 = _660;
        }
        int _662 = _656;
        if (_648)
        {
            int _664 = int(0x80000000) & as_type<int>(_452);
            int _666 = _662 | _664;
            _622 = as_type<float>(_666);
        }
        float _668 = _622;
        bool _670 = !_636;
        bool _672 = _670 && _640;
        _624 = _668;
        if (!_672)
        {
            float _674 = abs(_452);
            float _676 = abs(_494);
            float _678 = precise::max(_674, _676);
            float _680 = abs(_452);
            float _682 = abs(_494);
            float _684 = precise::min(_680, _682);
            float _686 = 1.0 / _678;
            float _688 = abs(_452);
            float _690 = abs(_494);
            bool _692 = _688 > _690;
            bool _694 = as_type<int>(_494) >= 0;
            float _696 = abs(_452);
            float _698 = abs(_494);
            float _700 = _696 + _698;
            bool _702 = _700 > as_type<float>(0x7f800000u /* inf */);
            bool _704 = isnan(_700);
            bool _706 = _702 || _704;
            bool _708 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _710 = _706 || _708;
            float _712 = _684 * _686;
            float _714 = _712 * _712;
            float _716 = _714 + 11.33538818359375;
            float _718 = fma(_714, _716, 28.84246826171875);
            float _720 = fma(_714, _718, 19.6966705322265625);
            float _722 = fma(_714, -0.82336294651031494140625, -5.674867153167724609375);
            float _724 = fma(_714, _722, -6.565555095672607421875);
            float _726 = 1.0 / _720;
            float _728 = _714 * _724;
            float _730 = _712 * _728;
            float _732 = fma(_730, _726, _712);
            int _734 = as_type<int>(_452) & int(0x80000000);
            float _736 = _732;
            _624 = _700;
            if (_692)
            {
                float _738 = -_732;
                float _740 = _738 + 1.57079637050628662109375;
                _736 = _740;
            }
            float _742 = _736;
            int _744 = as_type<int>(_742);
            if (!_694)
            {
                float _746 = -_742;
                float _748 = _746 + 3.1415927410125732421875;
                _744 = as_type<int>(_748);
            }
            int _750 = _744;
            if (!_710)
            {
                int _752 = _734 | _750;
                _624 = as_type<float>(_752);
            }
        }
    }
    float _754 = _624;
    float _756 = -_754;
    float _758 = _582 + _756;
    float _760 = _196 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_61.y;
    float _764 = _758 * 0.15915493667125701904296875;
    float _766 = fma(_194, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _768 = _522 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _770 = _580 * 0.15915493667125701904296875;
    float _772 = _764 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _524 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _536);
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _782 = fma(_198, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    float _784 = _526 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _764 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _184 * _550;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _794 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _796 = _778 * _780;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _540);
    float _800 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _804 = fma(_802, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _806 = _770 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _188 * _550;
    float _812 = -_762;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _816 = _790 * _790;
    float _818 = _792 * _794;
    float _820 = _798 * _800;
    float _822 = _192 * _550;
    float _824 = _444 * _814;
    float _826 = _770 * 6.283185482025146484375;
    float _828 = sin(_826);
    float _830 = fma(_810, _810, _816);
    float _832 = _602 * _774;
    float _834 = _804 * _824;
    float _836 = _614 * _788;
    float _838 = fma(_822, _822, _830);
    float _840 = _614 * _774;
    float _842 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _518 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = _614 * _808;
    float _850 = _602 * _808;
    float _852 = _602 * _788;
    float _854 = _788 * _808;
    float _856 = _848 * _818;
    float _858 = _774 * _808;
    float _860 = _850 * _818;
    float _862 = rsqrt(_838);
    float _864 = fma(_828, _836, _832);
    float _866 = fma(_828, _832, _836);
    float _868 = -_818;
    float _870 = _828 * _868;
    float _872 = -_840;
    float _874 = fma(_828, _852, _872);
    float _876 = -_852;
    float _878 = fma(_828, _840, _876);
    float _880 = fma(_864, _796, _856);
    float _882 = fma(_854, _796, _870);
    float _884 = fma(_874, _796, _860);
    float _886 = -_846;
    float _888 = _886 + 1.0;
    float _890 = fma(_878, _820, _880);
    float _892 = fma(_858, _820, _882);
    float _894 = fma(_866, _820, _884);
    float _896 = _842 + _890;
    float _898 = _328 + _892;
    float _900 = _810 * _862;
    float _902 = _790 * _862;
    float _904 = _822 * _862;
    float _906 = fma(_790, _834, _896);
    float _908 = _900 * _578;
    float _910 = _900 * _888;
    float _912 = _904 * _578;
    float _914 = _902 * _578;
    float _916 = _902 * _888;
    float _918 = fma(_810, _834, _898);
    float _920 = fma(_902, _910, _912);
    float _922 = -_912;
    float _924 = fma(_902, _910, _922);
    float _926 = fma(_902, _916, _846);
    float _928 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _930 = _906 + _928;
    float _932 = _332 + _894;
    float _934 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _936 = _918 + _934;
    float _938 = fma(_900, _910, _846);
    float _940 = _926 * _930;
    float _942 = fma(_822, _834, _932);
    float _944 = fma(_904, _916, _908);
    float _946 = -_908;
    float _948 = fma(_904, _916, _946);
    float _950 = fma(_920, _936, _940);
    float _952 = _924 * _930;
    float _954 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _956 = _942 + _954;
    float _958 = -_914;
    float _960 = fma(_904, _910, _958);
    float _962 = fma(_904, _910, _914);
    float _964 = _904 * _904;
    float _966 = _944 * _930;
    float _968 = fma(_938, _936, _952);
    float _970 = fma(_948, _956, _950);
    float _972 = fma(_888, _964, _846);
    float _974 = fma(_960, _936, _966);
    float _976 = fma(_962, _956, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _982 = fma(_972, _956, _974);
    float _984 = _970 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].y, _978);
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _980);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _992 = _990 != 0;
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].z, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].y, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].z, _994);
    float _1002 = _996 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = _1000 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1008 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _810;
    float _1014 = _1002;
    float _1016 = _1004;
    if (!_992)
    {
        _1012 = 0.0;
    }
    float _1018 = _1012;
    float _1020 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1008);
    float _1022 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1026 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1030 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1034 = _1028 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = _1034 * _1034;
    float _1042 = fma(_1038, _1038, _1040);
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1046 = _1018;
    float _1048 = _1024;
    float _1050 = _1030;
    float _1052 = _1028;
    float _1054 = _1038;
    float _1056 = _1034;
    if (!_992)
    {
        _1014 = 0.0;
    }
    float _1058 = _1014;
    float _1060 = sqrt(_1042);
    float _1062 = fma(_1004, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1044);
    float _1064 = _1058;
    if (!_992)
    {
        _1016 = 0.0;
    }
    float _1066 = _1016;
    float _1068 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1062);
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1072 = _1060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1074 = !_992;
    float _1076 = _1066;
    if (!_1074)
    {
        float _1078 = -_842;
        float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1082 = -_328;
        float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1086 = _1080 * _1080;
        float _1088 = fma(_1084, _1084, _1086);
        float _1090 = fma(_352, _352, _1088);
        float _1092 = rsqrt(_1090);
        float _1094 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1096 = _1084 * _1094;
        float _1098 = _1080 * _1094;
        float _1100 = _352 * _1094;
        _1046 = _1098;
        _1048 = _1092;
        _1064 = _1096;
        _1076 = _1100;
    }
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _1064;
    float _1108 = _1076;
    float _1110 = _1104;
    float _1112 = _1106;
    if (!_1072)
    {
        _1110 = _1070;
    }
    float _1114 = _1110;
    bool _1116 = !_1072;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1060 + _1122;
        float _1126 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1042);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1070, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1038, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1034, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1050 = _1152;
        _1052 = _1154;
    }
    float _1156 = _1118;
    float _1158 = _1050;
    float _1160 = _1052;
    float _1162 = _1102 + _1156;
    float _1164 = _1106 + _1158;
    float _1166 = _1108 + _1160;
    float _1168 = _328 + _1106;
    float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1172 = _1162 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1180 = _1166 + _1178;
    float _1182 = _332 + _1108;
    float _1184 = _1172 * _1172;
    float _1186 = fma(_1176, _1176, _1184);
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1176 * _1194;
    float _1198 = _1180 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1158;
    float _1218 = _1212;
    float _1220 = _1194;
    bool _1222 = _1208;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (!_1208)
    {
        _1112 = _1202;
    }
    float _1228 = _1112;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = rsqrt(_1204);
        _1216 = _1232;
    }
    float _1234 = _1216;
    float _1236 = _1234;
    if (_1208)
    {
        float _1238 = _1212 * _1226;
        _1218 = _1238;
    }
    float _1240 = _1218;
    float _1242 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1208)
    {
        float _1244 = _1240 * 0.15915493667125701904296875;
        _1054 = _1244;
    }
    float _1246 = _1054;
    float _1248 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1226;
    if (_1208)
    {
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        _1250 = _1254;
    }
    float _1256 = _1250;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = precise::max(0.0, _1258);
    float _1262 = _352;
    float _1264 = _1260;
    if (_1208)
    {
        float _1266 = _1246 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = -_1194;
    float _1274 = -_1260;
    float _1276 = fma(_1172, _1272, _1274);
    if (_1208)
    {
        float _1278 = _1276 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1278;
    }
    float _1280 = _1264;
    float _1282 = _1280;
    float _1284 = _1256;
    if (_1208)
    {
        float _1286 = fma(_1256, _1280, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1056 = _1286;
    }
    float _1288 = _1056;
    float _1290 = _1288;
    if (!_1208)
    {
        _1282 = _1276;
    }
    float _1292 = _1282;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1270 + (-1.0);
        _1284 = _1296;
    }
    float _1298 = _1284;
    float _1300 = _1298;
    if (_1208)
    {
        float _1302 = _1234 * _1288;
        _1290 = _1302;
    }
    float _1304 = _1290;
    if (!_1208)
    {
        _1236 = _1196;
    }
    float _1306 = _1236;
    float _1308 = _1306;
    if (_1208)
    {
        float _1310 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1310;
    }
    float _1312 = _1220;
    float _1314 = _1312;
    if (_1208)
    {
        float _1316 = _1196 * _1304;
        _1308 = _1316;
    }
    float _1318 = _1308;
    if (!_1208)
    {
        _1300 = _1198;
    }
    float _1320 = _1300;
    float _1322 = _1320;
    if (_1208)
    {
        float _1324 = _1198 * _1304;
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1208)
    {
        float _1328 = fma(_1276, _1270, _1312);
        _1294 = _1328;
    }
    float _1330 = _1294;
    if (!_1208)
    {
        _1314 = _1200;
    }
    float _1332 = _1314;
    float _1334 = _1332;
    if (_1208)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    if (_1208)
    {
        float _1340 = _1326 * _1326;
        _1230 = _1340;
    }
    float _1342 = _1230;
    float _1344 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1338);
    float _1348 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1352 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1354 = _1346 + _1342;
    float _1356 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1358 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1360 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1362 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1364 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1358);
    float _1366 = rsqrt(_1354);
    float _1368 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1382 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1388 = -_1378;
    float _1390 = _1388 + 1.0;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1394 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = floor(_1350);
    float _1400 = -_1392;
    float _1402 = fma(_1400, _1386, 1.0);
    float _1404 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1408 = _1366 * _1318;
    float _1410 = _1366 * _1326;
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1406);
    float _1414 = abs(_1390);
    float _1416 = log2(_1414);
    float _1418 = _1366 * _1330;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1422 = -_1420;
    float _1424 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1422);
    float _1426 = floor(_1352);
    float _1428 = -_1398;
    float _1430 = _1350 + _1428;
    float _1432 = -_1410;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1424);
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1434, -0.5, 0.5);
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1446 = log2(_1402);
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1436);
    float _1450 = fma(_1442, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1448);
    float _1454 = fma(_1442, _1450, -0.212114393711090087890625);
    float _1456 = -_1426;
    float _1458 = _1352 + _1456;
    float _1460 = sqrt(_1440);
    float _1462 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1464 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1452);
    float _1466 = _1418 + 1.0;
    float _1468 = fma(_1442, _1454, 1.570728778839111328125);
    float _1470 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = 1.0 / _1412;
    float _1474 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1476 = _1446 * 0.693147182464599609375;
    float _1478 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = exp2(_1444);
    float _1482 = _1460 * 0.636619746685028076171875;
    float _1484 = -_1468;
    float _1486 = fma(_1482, _1484, 1.0);
    float _1488 = _1464 * _1472;
    float _1490 = _1474 * _1472;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = -_1418;
    float _1498 = fma(_1480, _1466, _1496);
    float2 _5329 = float2(_1430, _1458);
    float _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5329, float2(0.0), isnan(_5329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5329, float2(0.0), isnan(_5329)), level(0.0)).x;
    float3 _5340 = float3(_1492, _1494, _1478);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float _1504 = fma(_1498, 0.5, 0.5);
    float3 _5353 = float3(_1492, _1494, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _5369 = float2(_1486, _1504);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1529 = int(_1527);
    float _1531 = in.m_61.x;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1535 = _1533 != 0;
    float _1537 = -_762;
    float _1539 = _1537 + 1.0;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    out.m_63.y = _762;
    float _1545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1547 = int(_1545);
    float _1549 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1551 = _172 > 0.5;
    out.m_65.x = _1176;
    out.m_65.y = _1172;
    out.m_65.z = _1180;
    float _1553 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1549);
    float _1555 = _1474;
    if (_1535)
    {
        bool _1557 = _166 > 0.5;
        _1222 = _1557;
    }
    bool _1559 = _1222;
    float _1561 = in.m_67.x;
    float _1563 = float(_1529);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1569 = _1567 != 0;
    float _1571 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1553);
    float _1573 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1575 = 1.0 / _1563;
    float _1577 = float(uint(_1547));
    int _1579 = 0;
    float _1581 = _1531;
    if (_1543)
    {
        float _1583 = -_1531;
        float _1585 = _1583 + 1.0;
        _1579 = as_type<int>(_1585);
    }
    int _1587 = _1579;
    int _1589 = ~_1547;
    int _1591 = _1589 + 1;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1595 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1571);
    float _1597 = 1.0 / _1577;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.gl_Position.x = _1464;
    out.gl_Position.y = _1474;
    out.gl_Position.z = _1595;
    out.gl_Position.w = _1412;
    float _1601 = _122 * _1575;
    float _1603 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1599);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = trunc(_1601);
    int _1611 = int(_1609);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1615 = _1595;
    if (!_1535)
    {
        _1613 = _1531;
    }
    float _1617 = _1613;
    int _1619 = as_type<int>(_1597) + (-2);
    bool _1621 = !_1607;
    float _1623 = _1621 ? 1.2345600128173828125 : 1.0;
    bool _1625 = !_1607;
    float _1627 = _1625 ? _176 : _166;
    float _1629 = _1627 * _1623;
    float _1631 = 1.0 / _152;
    float _1633 = float(uint(_1611));
    float _1635 = float(_1611);
    float _1637 = as_type<float>(_1619) * _1633;
    int _1639 = ~_1547;
    int _1641 = _1639 + 1;
    float _1643 = floor(_1629);
    float _1645 = trunc(_1637);
    float _1647 = precise::max(_1645, 0.0);
    uint _1650 = uint(_1647);
    int _1652 = _1641 * int(_1650);
    int _1654 = _1652 + _1611;
    float _1656 = float(uint(_1654));
    float _1658 = as_type<float>(_1619) * _1656;
    float _1660 = in.m_55.w;
    float _1662 = trunc(_1658);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    int _1668 = int(_1650) + int(_1666);
    int _1670 = int(_1650);
    float _1672 = as_type<float>(_1666);
    float _1674 = _1617;
    if (_1535)
    {
        float _1676 = -_1531;
        float _1678 = _1676 + 1.0;
        _1670 = as_type<int>(_1678);
    }
    int _1680 = _1670;
    if (!_1543)
    {
        _1672 = _1531;
    }
    float _1682 = _1672;
    float _1684 = _1682;
    if (_1543)
    {
        float _1686 = _1551 ? as_type<float>(_1587) : _1531;
        _1684 = _1686;
    }
    float _1688 = _1684;
    int _1690 = _1591 * _1668;
    int _1692 = _1690 + _1611;
    if (_1535)
    {
        float _1694 = _1559 ? as_type<float>(_1680) : _1531;
        _1674 = _1694;
    }
    float _1696 = _1674;
    bool _1698 = _1660 > 0.5;
    float _1700 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1702 = uint(_1692) >= uint(_1547);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1706 = _1704 != 0;
    float _1708 = float(_1547);
    bool _1710 = !_1702;
    int _1712 = _1710 ? 0 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1698 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1720 = _1635 >= _1708;
    bool _1722 = isnan(_1635);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(_1708);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1738 = _1736 != 0;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1742 = _1740 != 0;
    float _1744 = trunc(_1730);
    int _1746 = int(_1744);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    float _1752 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1754 = _1551 ? as_type<int>(_1539) : as_type<int>(_762);
    bool _1756 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.5);
    bool _1764 = _1760 || _1762;
    float _1766 = -_1565;
    float _1768 = fma(_1752, 2.0, _1766);
    float _1770 = _1569 ? as_type<float>(_1754) : _762;
    float _1772 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1774 = _176 > 0.5;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1778 = ~_1668;
    int _1780 = _1778 + _1712;
    int _1782 = _1780 + 1;
    float _1784 = _122 * _1708;
    int _1786 = _1774 ? as_type<int>(_1539) : as_type<int>(_762);
    float _1788 = fma(_1772, -2.0, _1776);
    float _1790 = -_1643;
    float _1792 = _1629 + _1790;
    int _1794 = _1547 * _1782;
    int _1796 = _1794 + _1611;
    float _1798 = _1738 ? as_type<float>(_1786) : _762;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1802 = _1547 == 0;
    float _1804 = _1784 * _1631;
    int _1806 = ~_1746;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1708 * _1792;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1796 : (-1);
    float _1818 = _1742 ? as_type<float>(_1718) : _762;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1822 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1593);
    int _1824 = _1816 * _1810;
    int _1826 = _1547 + (-1);
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1830 = abs(_530);
    float _1832 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    int _1834 = abs(_1716);
    float _1836 = trunc(_1804);
    int _1838 = int(_1836);
    int _1840 = _1746 * _1826;
    int _1842 = _1840 + _1824;
    float _1844 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1846 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1828);
    float _1848 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1788);
    int _1850 = _1842 * _1830;
    float _1852 = fma(_1844, _1798, -0.5);
    float _1854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1846);
    float _1856 = trunc(_1812);
    int _1858 = int(_1856);
    float _1860 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1862 = abs(_574);
    float _1864 = -_1848;
    float _1866 = fma(_1854, _1852, _1864);
    float _1868 = fma(_1860, _1770, -0.5);
    float _1870 = _1848;
    float _1872 = _1800;
    float _1874 = as_type<float>(_1830);
    if (_1607)
    {
        _1870 = _166;
    }
    float _1876 = _1870;
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1880 = _1876;
    if (!_1607)
    {
        _1880 = _172;
    }
    float _1882 = _1880;
    int _1884 = _1838 * _1862;
    int _1886 = _1884 + _1850;
    int _1888 = abs(_606);
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1892 = _1858 * _1834;
    int _1894 = _1892 + _1611;
    int _1896 = abs(_610);
    float _1898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1902 = _1894 * _1888;
    int _1904 = _1902 + _1886;
    int _1906 = as_type<int>(_1900);
    if (!_1607)
    {
        _1872 = _176;
    }
    float _1908 = _1872;
    float _1910 = -_1900;
    float _1912 = fma(_1890, 2.0, _1910);
    int _1914 = _1858 * _1896;
    int _1916 = _1914 + _1904;
    float _1918 = _1908;
    if (_1734)
    {
        float _1920 = -_1531;
        float _1922 = _1920 + 1.0;
        _1906 = as_type<int>(_1922);
    }
    int _1924 = _1906;
    if (_1607)
    {
        _1918 = _166;
    }
    float _1926 = _1918;
    float _1928 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1930 = float(uint(_1916));
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1934 = _1930;
    float _1936 = _1878;
    if (_1734)
    {
        float _1938 = _1774 ? as_type<float>(_1924) : _1531;
        _1581 = _1938;
    }
    float _1940 = _1581;
    bool _1942 = _538 != 0.0;
    bool _1944 = isnan(_538);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan(0.0);
    bool _1950 = _1946 || _1948;
    float _1952 = as_type<float>(_1619) * _1930;
    float _1954 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1932);
    float _1956 = in.m_69.x;
    float _1958 = in.m_69.y;
    float _1960 = in.m_69.z;
    bool _1962 = _536 == 0.0;
    bool _1964 = !_1950;
    bool _1966 = _1962 && _1964;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1970 = trunc(_1952);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1978 = _540 == 0.0;
    bool _1980 = _1978 && _1966;
    float _1982 = fma(_1928, _1940, -0.5);
    float _1984 = -_1976;
    float _1986 = fma(_1968, 2.0, _1984);
    int _1988 = ~_1547;
    int _1990 = _1988 + 1;
    float _1992 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1607)
    {
        _1934 = _172;
    }
    float _1998 = _1934;
    float _2000 = fma(_1992, _1696, -0.5);
    float _2002 = _1998;
    if (_1607)
    {
        _2002 = _176;
    }
    float _2004 = _2002;
    float _2006 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1994);
    if (_1607)
    {
        _372 = _176;
    }
    float _2008 = _372;
    float _2010 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1954);
    int _2012 = _1990 * int(_1974);
    int _2014 = _2012 + _1916;
    float _2016 = as_type<float>(_2014);
    float _2018 = _2008;
    if (!_1607)
    {
        _374 = _166;
    }
    float _2020 = _374;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2024 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2026 = float(uint(_1894));
    float _2028 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2006);
    float _2030 = _2022;
    if (_1980)
    {
        _1874 = _1956;
    }
    float _2032 = _1874;
    float _2034 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2022);
    float _2036 = float(uint(_2014));
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2040 = _2032;
    if (_1980)
    {
        _2030 = _2032;
    }
    float _2042 = _2030;
    float _2044 = _2042;
    if (!_1980)
    {
        _2040 = _1956;
    }
    float _2046 = _2040;
    float _2048 = as_type<float>(_1619) * _2036;
    if (_1980)
    {
        _1996 = _1958;
    }
    float _2050 = _1996;
    float _2052 = -_122;
    float _2054 = fma(_2052, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1986);
    float _2056 = _2050;
    if (_1980)
    {
        _2016 = _1960;
    }
    float _2058 = _2016;
    float _2060 = _2058;
    if (!_1980)
    {
        float _2062 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2046);
        _2044 = _2062;
    }
    float _2064 = _2044;
    if (_1980)
    {
        _2018 = _2050;
    }
    float _2066 = _2018;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    float _2074 = _2066;
    if (!_1980)
    {
        _2056 = _1958;
    }
    float _2076 = _2056;
    float _2078 = fma(_2010, _1700, _2054);
    if (_1980)
    {
        _1936 = _2058;
    }
    float _2080 = _1936;
    float _2082 = _2078 + 0.5;
    float _2084 = _2080;
    if (!_1980)
    {
        _2060 = _1960;
    }
    float _2086 = _2060;
    float _2088 = -_122;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1768);
    float _2092 = as_type<float>(_1619) * _2026;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2096 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1603);
    int _2098 = ~_1547;
    int _2100 = _2098 + 1;
    float _2102 = -_122;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1912);
    float _2106 = fma(_2024, -2.0, _2094);
    float _2108 = trunc(_2092);
    float _2110 = precise::max(_2108, 0.0);
    uint _2112 = uint(_2110);
    float _2114 = fma(_2096, _2000, _2090);
    int _2116 = int(_1974) + int(_2072);
    float _2118 = fma(_2028, _1982, _2104);
    float _2120 = in.m_71.x;
    float _2122 = in.m_71.y;
    float _2124 = in.m_71.z;
    float _2126 = in.m_71.w;
    int _2128 = ~_1547;
    int _2130 = _2128 + 1;
    float _2132 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2106);
    int _2134 = _2100 * _2116;
    int _2136 = _2134 + _1916;
    if (!_1980)
    {
        float _2138 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2084 = _2138;
    }
    float _2140 = _2084;
    if (!_1980)
    {
        float _2142 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2076);
        _2074 = _2142;
    }
    float _2144 = _2074;
    float _2146 = exp2(_1573);
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2150 = uint(_2136) >= uint(_1547);
    int _2152 = _2130 * int(_2112);
    int _2154 = _2152 + _1894;
    float _2156 = fma(_2038, -2.0, _2148);
    bool _2158 = !_2150;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2034);
    float _2164 = float(uint(_2154));
    float _2166 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1822);
    float _2168 = -_2132;
    float _2170 = fma(_2162, _1832, _2168);
    int _2172 = ~_2116;
    int _2174 = _2172 + _2160;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1619) * _2164;
    float _2180 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2156);
    float _2182 = _2124 * _2046;
    float _2184 = _2120 * _2076;
    float _2186 = _2122 * _2086;
    float _2188 = trunc(_2178);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = -_2182;
    float _2196 = fma(_2120, _2086, _2194);
    float _2198 = -_2184;
    float _2200 = fma(_2122, _2046, _2198);
    float _2202 = -_2186;
    float _2204 = fma(_2124, _2076, _2202);
    int _2206 = _1547 * _2176;
    int _2208 = _2206 + _1916;
    float _2210 = _1866 + 0.5;
    float _2212 = _2196 * _2126;
    float _2214 = _2114 + 0.5;
    float _2216 = _2204 * _2126;
    float _2218 = _2200 * _2126;
    bool _2220 = !_1802;
    int _2222 = _2220 ? _2208 : (-1);
    float _2224 = _2170 + 0.5;
    float _2226 = -_2180;
    float _2228 = fma(_2166, _1868, _2226);
    float _2230 = _842 + _1102;
    int _2232 = _2222 >> 31;
    float _2234 = _2118 + 0.5;
    int _2236 = int(_2112) + int(_2192);
    out.m_73.x = _2214;
    out.m_73.y = _2210;
    out.m_73.z = _2082;
    out.m_73.w = _2224;
    int _2238 = _2232 & 3;
    float _2240 = _2228 + 0.5;
    float _2242 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2246 = ~_1547;
    int _2248 = _2246 + 1;
    float _2250 = _850 * _2212;
    out.m_75.x = _2234;
    out.m_75.y = _2240;
    int _2252 = _2222 & 3;
    bool _2254 = _2252 != 0;
    int _2256 = _2248 * _2236;
    int _2258 = _2256 + _1894;
    float _2260 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2242);
    int _2262 = _2222 + _2238;
    float _2264 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2244);
    bool _2266 = uint(_2258) >= uint(_1547);
    float _2268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2260);
    int _2270 = _2262 >> 2;
    float _2272 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    int _2274 = _2222 & 3;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2278 = _2270 << 4;
    int _2280 = _2278 + 512;
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2284 = !_2266;
    int _2286 = _2284 ? 0 : (-1);
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2280) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    float _2306 = 1.0 / _2282;
    float _2308 = _2276 + _2282;
    out.m_77.w = _2288;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2312 = _2280 + 8;
    uint _2314 = uint(int(uint(_2312) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = uint(_2274) > 1u;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2334 = ~_2236;
    int _2336 = _2334 + _2286;
    int _2338 = _2336 + 1;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2344 = _2254 ? 0 : 1;
    int _2346 = _1547 * _2338;
    int _2348 = _2346 + _1894;
    float _2350 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2308 * _2306;
    float _2358 = _2356 * 0.5;
    int _2360 = ~_2344;
    int _2362 = _2360 + 1;
    int _2364 = _2362 + 1;
    float _2366 = -_2212;
    float _2368 = _828 * _2366;
    int _2370 = _2364;
    if (!_2330)
    {
        int _2372 = ~_2344;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2380 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2378);
    out.m_79.x = _2342;
    out.m_79.y = _2350;
    out.m_79.z = _2354;
    out.m_79.w = _2352;
    bool _2382 = _2274 != 3;
    float _2384 = _848 * _2212;
    bool _2386 = uint(_2274) >= 2u;
    float _2388 = _848 * _2122;
    int _2390 = abs(_2376);
    float _2392 = _848 * _2144;
    int _2394 = _2386 ? 0 : 1;
    float _2396 = fma(_864, _2120, _2388);
    int _2398 = ~_2390;
    int _2400 = _2398 + 1;
    int _2402 = _2400 + 1;
    float _2404 = fma(_864, _2064, _2392);
    bool _2406 = !_1802;
    int _2408 = _2406 ? _2348 : (-1);
    bool _2410 = !_2254;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, _2216, _2368);
    bool _2416 = _2274 != 3;
    float _2418 = _850 * _2122;
    float _2420 = 1.0 / _2380;
    int _2422 = ~_2394;
    int _2424 = _2422 + 1;
    int _2426 = _2424 + 1;
    float _2428 = fma(_864, _2216, _2384);
    int _2430 = abs(_2412);
    float _2432 = fma(_874, _2216, _2250);
    int _2434 = _2426;
    if (_2382)
    {
        int _2436 = ~_2394;
        int _2438 = _2436 + 1;
        _2434 = _2438;
    }
    int _2440 = _2434;
    int _2442 = _2402 * as_type<int>(_2304);
    float _2444 = -_2122;
    float _2446 = _828 * _2444;
    int _2448 = ~_2430;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_874, _2120, _2418);
    int _2456 = abs(_2440);
    float _2458 = fma(_854, _2120, _2446);
    bool _2460 = !_1750;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = _2452 * as_type<int>(_2296);
    int _2466 = _2464 + _2442;
    float _2468 = fma(_858, _2218, _2414);
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2472 = _2420 * _2470;
    bool _2474 = !_2416;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = -_2144;
    float _2480 = _828 * _2478;
    int _2482 = ~_2456;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    float _2488 = abs(_2472);
    float _2490 = log2(_2488);
    int _2492 = abs(_2462);
    float _2494 = fma(_858, _2124, _2458);
    float _2496 = _850 * _2144;
    int _2498 = _2486 * as_type<int>(_2320);
    int _2500 = _2498 + _2466;
    int _2502 = abs(_2476);
    float _2504 = fma(_878, _2218, _2428);
    float _2506 = fma(_866, _2218, _2432);
    int _2508 = ~_2492;
    int _2510 = _2508 + 1;
    int _2512 = _2510 + 1;
    float _2514 = fma(_854, _2064, _2480);
    int _2516 = ~_2502;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_878, _2124, _2396);
    out.m_81.x = _2468;
    out.m_81.y = _2504;
    out.m_81.z = _2506;
    float _2524 = fma(_866, _2124, _2454);
    float _2526 = fma(_874, _2064, _2496);
    int _2528 = _2520 * as_type<int>(_2328);
    int _2530 = _2528 + _2500;
    float _2532 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2534 = _1595 + _1412;
    float _2536 = _1464 + _1412;
    int _2538 = _2530 * _2512;
    float _2540 = _1412 * 0.5;
    out.m_83.x = _2494;
    out.m_83.y = _2522;
    out.m_83.z = _2524;
    float _2542 = exp2(_2532);
    int _2544 = _2408 * _2492;
    int _2546 = _2544 + _2538;
    float _2548 = _2534 * 0.5;
    float _2550 = _2536 * 0.5;
    float _2552 = fma(_1474, -0.5, _2540);
    float _2554 = float(_2546);
    bool _2556 = _2472 <= 8000.0;
    bool _2558 = isnan(_2472);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan(8000.0);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    out.m_85.y = _2554;
    out.m_87.x = _2550;
    out.m_87.y = _2552;
    out.m_87.z = _2548;
    out.m_87.w = _1412;
    float _2568 = fma(_2542, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = _2554;
    if (_1764)
    {
        _2572 = 1.0;
    }
    float _2574 = _2572;
    float _2576 = fma(_2570, -2.0, 3.0);
    float _2578 = _2570 * _2570;
    float _2580 = _2578 * _2576;
    float _2582 = -_2580;
    float _2584 = _2582 + 1.0;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2580);
    float _2588 = _2584;
    float _2590 = _2574;
    if (_1764)
    {
        _2588 = 1.0;
    }
    float _2592 = _2588;
    float _2594 = _2592;
    if (!_1764)
    {
        float _2596 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2598 = _2596 * 0.15915493667125701904296875;
        float _2600 = _2598 * 6.283185482025146484375;
        float _2602 = cos(_2600);
        float _2604 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = _2598 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        float _2612 = 1.0 / _2602;
        float _2614 = _2606 * 6.283185482025146484375;
        float _2616 = cos(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = _2606 * 6.283185482025146484375;
        float _2622 = sin(_2620);
        float _2624 = _2616 * _2618;
        float _2626 = 1.0 / _2624;
        float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2628;
        float _2632 = 1.0 / _2630;
        float _2634 = _2622 * _2626;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2638 = fma(_2472, _2634, _2636);
        float _2640 = _2638 * _2632;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        _2594 = _2642;
        _1615 = _2612;
        _1555 = _2632;
    }
    float _2644 = _2594;
    float _2646 = _1615;
    float _2648 = _1555;
    float _2650 = _2646;
    float _2652 = _2648;
    if (!_1764)
    {
        float _2654 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2656 = _2654 * 0.15915493667125701904296875;
        float _2658 = _2656 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2664 = _2662 * 0.15915493667125701904296875;
        float _2666 = _2656 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        float _2670 = 1.0 / _2660;
        float _2672 = _2664 * 6.283185482025146484375;
        float _2674 = cos(_2672);
        float _2676 = _2668 * _2670;
        float _2678 = _2664 * 6.283185482025146484375;
        float _2680 = sin(_2678);
        float _2682 = _2674 * _2676;
        float _2684 = 1.0 / _2682;
        float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2686;
        float _2690 = 1.0 / _2688;
        float _2692 = _2680 * _2684;
        float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2696 = fma(_2472, _2692, _2694);
        float _2698 = _2696 * _2690;
        float _2700 = precise::clamp(_2698, 0.0, 1.0);
        float _2702 = -_2700;
        float _2704 = _2702 + 1.0;
        _2590 = _2704;
        _2650 = _2656;
        _2652 = _2664;
    }
    float _2706 = _2590;
    float _2708 = _2650;
    float _2710 = _2652;
    float _2712 = _2566 * _2586;
    float _2714 = -_2146;
    float _2716 = _2714 + 1.0;
    float _2718 = -_1500;
    float _2720 = _2718 + 1.0;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2724 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2726 = fma(_878, _2140, _2404);
    float _2728 = fma(_858, _2140, _2514);
    float _2730 = _2720 * _2722;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2724 * _1502;
    float _2736 = -_2724;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_866, _2140, _2526);
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _1515 * _2734;
    float _2748 = _1525 * _2734;
    float _2750 = _1515 * _2738;
    float _2752 = _2744 * _1561;
    float _2754 = fma(_1521, _2746, _1509);
    float _2756 = fma(_1523, _2746, _1511);
    float _2758 = fma(_1515, _2748, _1513);
    float _2760 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2728;
    out.m_89.y = _2726;
    out.m_89.z = _2740;
    bool _2762 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2764 = isnan(_1192);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2770 = _2766 || _2768;
    float _2772 = _2644 * _2706;
    out.m_91.x = _2760;
    float _2774 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2754;
    out.m_93.y = _2756;
    out.m_93.z = _2758;
    out.m_93.w = _2750;
    float _2776 = _2752;
    float _2778 = _2708;
    float _2780 = _2710;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2784 = _2746;
    float _2786 = _2738;
    if (!_2770)
    {
        _2776 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2788 = _2776;
    float _2790 = _2788;
    float _2792 = _2788;
    if (!_2770)
    {
        _2778 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2770)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2780;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2770)
    {
        _2782 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2782;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2770)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2812 = _2784;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2770)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2818 = _2786;
    bool _2820 = !_2770;
    float _2822 = _2818;
    float _2824 = _2818;
    if (!_2820)
    {
        bool _2826 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2828 = isnan(_1192);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2834 = _2830 || _2832;
        if (!_2834)
        {
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2838 = _1192 + _2836;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2842 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2840;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2848 = 1.0 / _2842;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2866 = _2838 * _2848;
            float _2868 = precise::clamp(_2866, 0.0, 1.0);
            float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2874 = fma(_2868, _2846, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2876 = fma(_2868, _2872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2878 = fma(_2868, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2868, _2856, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2882 = fma(_2868, _2860, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2884 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2878;
            _2816 = _2882;
            _2792 = _2874;
            _2810 = _2880;
            _2804 = _2876;
            _2824 = _2884;
            _2886 = true;
        }
        else
        {
            bool _2888 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2890 = isnan(_1192);
            bool _2892 = _2888 || _2890;
            bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2896 = _2892 || _2894;
            if (!_2896)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2898 = _2790;
            _2792 = _2898;
            if (!_2896)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2900 = _2796;
            _2798 = _2900;
            if (!_2896)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2902 = _2802;
            _2804 = _2902;
            if (!_2896)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2904 = _2808;
            _2810 = _2904;
            if (!_2896)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2906 = _2814;
            _2816 = _2906;
            if (!_2896)
            {
                _2822 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2908 = _2822;
            bool _2910 = !_2896;
            _2824 = _2908;
            if (!_2910)
            {
                bool _2912 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2914 = isnan(_1192);
                bool _2916 = _2912 || _2914;
                bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2920 = _2916 || _2918;
                if (!_2920)
                {
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2924 = _1192 + _2922;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2926;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2934 = 1.0 / _2928;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2952 = _2924 * _2934;
                    float _2954 = precise::clamp(_2952, 0.0, 1.0);
                    float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2960 = fma(_2954, _2932, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2962 = fma(_2954, _2958, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2964 = fma(_2954, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2954, _2942, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2968 = fma(_2954, _2946, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2970 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2964;
                    _2816 = _2968;
                    _2792 = _2960;
                    _2810 = _2966;
                    _2804 = _2962;
                    _2824 = _2970;
                    _2886 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2824 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2886 = false;
    float _2972 = _2798;
    float _2974 = _2816;
    float _2976 = _2792;
    float _2978 = _2810;
    float _2980 = _2804;
    float _2982 = _2824;
    float _2984 = fma(_2726, -0.5, 0.5);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = -_2972;
    float _2990 = _2988 + _2974;
    float _2992 = _2774 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2994 = -_2976;
    float _2996 = _2994 + _2978;
    out.m_95.x = 0.0;
    float _2998 = fma(_2986, _2990, _2972);
    float _3000 = fma(_2986, _2996, _2976);
    out.m_53.x = _2992;
    float _3002 = -_2980;
    float _3004 = _3002 + _2982;
    float _3006 = _2998 * 0.586610972881317138671875;
    bool _3008 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3010 = fma(_2986, _3004, _2980);
    float _3012 = fma(_3000, 0.298911988735198974609375, _3006);
    bool _3014 = _2644 > 0.0;
    bool _3016 = isnan(_2644);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan(0.0);
    bool _3022 = _3018 || _3020;
    float _3024 = fma(_3010, 0.114477999508380889892578125, _3012);
    bool _3026 = _2706 <= 0.0;
    bool _3028 = !_3022;
    bool _3030 = _3026 || _3028;
    float _3032 = -_3024;
    float _3034 = _3000 + _3032;
    float _3036 = -_3024;
    float _3038 = _2998 + _3036;
    float _3040 = -_3024;
    float _3042 = _3010 + _3040;
    float _3044 = fma(_3034, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3046 = fma(_3038, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    float _3048 = fma(_3042, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3024);
    bool _3050 = !_3008;
    if (!_3050)
    {
        float _3052 = -_1162;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3056 = -_1164;
        float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3060 = -_1166;
        float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3064 = _3054 * _3054;
        float _3066 = fma(_3058, _3058, _3064);
        float _3068 = fma(_3062, _3062, _3066);
        float _3070 = sqrt(_3068);
        float _3072 = rsqrt(_3068);
        float _3074 = -_3070;
        float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3078 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = _3058 * _3072;
        float _3084 = _3054 * _3072;
        float _3086 = abs(_3080);
        float _3088 = log2(_3086);
        float _3090 = _3062 * _3072;
        float _3092 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3094 = _2726 * _3084;
        float _3096 = -_3084;
        float _3098 = -_3092;
        float _3100 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3098);
        float _3102 = fma(_2728, _3082, _3094);
        float _3104 = -_3090;
        float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3100);
        float _3108 = fma(_2740, _3090, _3102);
        float _3110 = precise::clamp(_3108, 0.0, 1.0);
        float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3114 = _3106 + _3112;
        float _3116 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = exp2(_3116);
        float _3124 = _3122 * _3120;
        float _3126 = _3110 * _3124;
        float _3128 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3130 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3128;
        out.m_95.y = _3130;
        out.m_95.z = _3132;
    }
    out.m_97.x = _3044;
    out.m_97.y = _3046;
    out.m_97.z = _3048;
    if (!_3030)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3134;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

