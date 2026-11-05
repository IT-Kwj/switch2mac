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
    float4 m_69 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_87 [[user(locn11)]];
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
    float4 m_71 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3062 = false;
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
    float _130 = as_type<float>(_118);
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
        float _3378 = as_type<float>(_138);
        out.gl_Position.z = _3378;
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
        float _3433 = as_type<float>(_164);
        out.gl_Position.z = _3433;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _172 = _122 * _168;
    out.m_57.y = _166;
    bool _174 = !_170;
    float _176 = _172;
    if (!_174)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _176 = _192;
    }
    float _194 = _176;
    float _196 = in.m_59.x;
    float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _200 = log2(_198);
    float _202 = in.m_59.z;
    float _204 = in.m_59.y;
    float _206 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = _122 * _200;
    float _216 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _218 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _216);
    float _220 = _196 * 2.0;
    float _222 = exp2(_214);
    float _224 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _218);
    float _226 = _202 * 2.0;
    float _228 = _204 * 2.0;
    float _230 = floor(_220);
    float _232 = floor(_226);
    float _234 = -_222;
    float _236 = _234 + 1.0;
    bool _238 = _230 > 0.0;
    float _240 = floor(_228);
    bool _242 = _230 >= 0.0;
    bool _244 = isnan(_230);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    int _252 = _250 ? 0 : 1;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _256 = _254 != 0;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _264 = _262 != 0;
    int _266 = ~_252;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    float _274 = _202;
    float _276 = _204;
    if (!_238)
    {
        int _278 = ~_252;
        int _280 = _278 + 1;
        _272 = _280;
    }
    int _282 = _272;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _290 = _288 != 0;
    bool _292 = !_260;
    int _294 = _292 ? 0 : 1;
    bool _296 = !_256;
    int _298 = _296 ? 0 : 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _306 = _304 != 0;
    bool _308 = _232 >= 0.0;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    bool _318 = _240 >= 0.0;
    bool _320 = isnan(_240);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    int _328 = _316 ? 0 : 1;
    bool _330 = _232 > 0.0;
    int _332 = ~_328;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _326 ? 0 : 1;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _352 = -_208;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _352);
    float _356 = _196 + _204;
    int _358 = _336;
    bool _360 = _290;
    int _362 = _302 ? (-1) : 0;
    if (!_330)
    {
        int _364 = ~_328;
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    float _370 = -_350;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _370);
    bool _374 = _240 > 0.0;
    float _376 = _196 + _202;
    float _378 = in.m_46.x;
    float _380 = in.m_46.y;
    float _382 = in.m_46.z;
    float _384 = _348 ? _236 : 0.0;
    float _386 = _204 + _202;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = _376 + (-1.0);
    float _404 = _386 + (-1.0);
    float _406 = _356 + (-1.0);
    float _408 = 1.0 / _400;
    int _410 = abs(_298);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _418 = ~_338;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_294);
    int _426 = _422;
    if (!_374)
    {
        int _428 = ~_338;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = rsqrt(_224);
    float _436 = float(_424);
    float _438 = float(_282);
    float _440 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = _384 * _408;
    bool _446 = !_264;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = _196 * 6.283185482025146484375;
    bool _456 = !_396;
    float _458 = _456 ? _122 : _444;
    float _460 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _464 = fma(_122, 0.02999999932944774627685546875, _454);
    float _466 = float(_432);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _464 * 0.15915493667125701904296875;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _468 + _474;
    float _478 = -_470;
    float _480 = _478 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _482 = float(_410);
    float _484 = float(_368);
    float _486 = _480 * 0.0625;
    float _488 = abs(_476);
    float _490 = abs(_480);
    float _492 = precise::max(_488, _490);
    float _494 = _472 * 6.283185482025146484375;
    float _496 = sin(_494);
    bool _498 = !_302;
    int _500 = _498 ? 0 : 1;
    float _502 = _482 * _484;
    bool _504 = _492 >= 16.0;
    float _506 = _436 * _438;
    float _508 = _212 * _212;
    float _510 = _502 * (-2.0);
    int _512 = abs(_448);
    float _514 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _516 = fma(_354, _354, _508);
    float _518 = fma(_416, _510, _416);
    float _520 = _196 + (-0.5);
    float _522 = _514 * (-0.699999988079071044921875);
    float _524 = fma(_372, _372, _516);
    float _526 = _504 ? _486 : _480;
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _530 = _476;
    if (_504)
    {
        float _532 = _476 * 0.0625;
        _530 = _532;
    }
    float _534 = _530;
    float _536 = float(_512);
    float _538 = rsqrt(_524);
    float _540 = _522 * 0.15915493667125701904296875;
    float _542 = fma(_458, _518, _528);
    float _544 = abs(_534);
    bool _546 = _544 != 0.0;
    bool _548 = isnan(_544);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = _536 * _466;
    float _558 = in.m_61.x;
    float _560 = in.m_61.y;
    float _562 = in.m_61.z;
    float _564 = _542 * 0.15915493667125701904296875;
    float _566 = abs(_526);
    bool _568 = _566 == 0.0;
    bool _570 = !_554;
    bool _572 = _568 && _570;
    float _574 = _556 * (-2.0);
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _506 * (-2.0);
    float _584 = abs(_526);
    bool _586 = _584 == 0.0;
    float _588 = _204 + (-0.5);
    float _590 = _202 + (-0.5);
    float _592 = fma(_414, _574, _414);
    float _594 = _540 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_412, _582, _412);
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    int _608 = as_type<int>(_602);
    if (_572)
    {
        bool _610 = as_type<int>(_526) >= 0;
        _360 = _610;
    }
    bool _612 = _360;
    float _614 = fma(_458, _592, _602);
    float _616 = _564 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(_458, _598, _600);
    if (_572)
    {
        int _622 = _612 ? 0 : 1078530011;
        _608 = _622;
    }
    int _624 = _608;
    float _626 = _614 * 0.15915493667125701904296875;
    bool _628 = !_286;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_306;
    int _634 = _632 ? 0 : 1;
    float _636 = _564 * 6.283185482025146484375;
    float _638 = cos(_636);
    int _640 = _624;
    if (_572)
    {
        int _642 = int(0x80000000) & as_type<int>(_534);
        int _644 = _624 | _642;
        _640 = _644;
    }
    int _646 = _640;
    bool _648 = !_554;
    bool _650 = _648 && _586;
    int _652 = _646;
    float _654 = as_type<float>(_646);
    if (!_650)
    {
        float _656 = abs(_534);
        bool _658 = _656 != as_type<float>(0x7f800000u /* inf */);
        bool _660 = isnan(_656);
        bool _662 = _658 || _660;
        bool _664 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _666 = _662 || _664;
        float _668 = abs(_526);
        bool _670 = _668 == as_type<float>(0x7f800000u /* inf */);
        float _672 = abs(_526);
        bool _674 = _672 == as_type<float>(0x7f800000u /* inf */);
        bool _676 = !_666;
        bool _678 = _674 && _676;
        if (_678)
        {
            bool _680 = as_type<int>(_526) >= 0;
            _362 = _680 ? (-1) : 0;
        }
        int _682 = _362;
        if (_678)
        {
            _652 = 1075235812;
        }
        int _684 = _652;
        int _686 = _684;
        if (_678)
        {
            int _688 = ~_682;
            int _690 = (_688 != 0) ? _684 : 1061752795;
            _686 = _690;
        }
        int _692 = _686;
        float _694 = as_type<float>(_692);
        if (_678)
        {
            int _696 = int(0x80000000) & as_type<int>(_534);
            int _698 = _692 | _696;
            _694 = as_type<float>(_698);
        }
        float _700 = _694;
        bool _702 = !_666;
        bool _704 = _702 && _670;
        _654 = _700;
        if (!_704)
        {
            float _706 = abs(_534);
            float _708 = abs(_526);
            float _710 = precise::max(_706, _708);
            float _712 = abs(_534);
            float _714 = abs(_526);
            float _716 = precise::min(_712, _714);
            float _718 = 1.0 / _710;
            float _720 = abs(_534);
            float _722 = abs(_526);
            bool _724 = _720 > _722;
            bool _726 = as_type<int>(_526) >= 0;
            float _728 = abs(_534);
            float _730 = abs(_526);
            float _732 = _728 + _730;
            int _734 = as_type<int>(_534) & int(0x80000000);
            bool _736 = _732 > as_type<float>(0x7f800000u /* inf */);
            bool _738 = isnan(_732);
            bool _740 = _736 || _738;
            bool _742 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _744 = _740 || _742;
            float _746 = _716 * _718;
            float _748 = _746 * _746;
            float _750 = _748 + 11.33538818359375;
            float _752 = fma(_748, _750, 28.84246826171875);
            float _754 = fma(_748, _752, 19.6966705322265625);
            float _756 = fma(_748, -0.82336294651031494140625, -5.674867153167724609375);
            float _758 = fma(_748, _756, -6.565555095672607421875);
            float _760 = 1.0 / _754;
            float _762 = _748 * _758;
            float _764 = _746 * _762;
            float _766 = fma(_764, _760, _746);
            float _768 = _766;
            _654 = _732;
            if (_724)
            {
                float _770 = -_766;
                float _772 = _770 + 1.57079637050628662109375;
                _768 = _772;
            }
            float _774 = _768;
            int _776 = as_type<int>(_774);
            if (!_726)
            {
                float _778 = -_774;
                float _780 = _778 + 3.1415927410125732421875;
                _776 = as_type<int>(_780);
            }
            int _782 = _776;
            if (!_744)
            {
                int _784 = _734 | _782;
                _654 = as_type<float>(_784);
            }
        }
    }
    float _786 = _654;
    float _788 = -_786;
    float _790 = _620 + _788;
    float _792 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _790 * 0.15915493667125701904296875;
    float _796 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _798 = _626 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _806 = fma(_804, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _808 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = _212 * _538;
    float _814 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _816 = _794 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = _562 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = -_166;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _832 = _820 * _810;
    float _834 = _354 * _538;
    float _836 = _794 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _812 * _812;
    float _842 = _822 * _824;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _846 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _496 * _830;
    float _850 = _372 * _538;
    float _852 = fma(_834, _834, _840);
    float _854 = _626 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _844 * _846;
    float _860 = _806 * _848;
    float _862 = _618 * _800;
    float _864 = _618 * _818;
    float _866 = _638 * _800;
    float _868 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _870 = _862 * _842;
    float _872 = _638 * _838;
    float _874 = _618 * _838;
    float _876 = fma(_850, _850, _852);
    float _878 = _838 * _800;
    float _880 = _540 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _638 * _818;
    float _886 = _818 * _800;
    float _888 = _866 * _842;
    float _890 = fma(_856, _872, _864);
    float _892 = fma(_856, _864, _872);
    float _894 = -_842;
    float _896 = _856 * _894;
    float _898 = -_884;
    float _900 = fma(_856, _874, _898);
    float _902 = rsqrt(_876);
    float _904 = -_874;
    float _906 = fma(_856, _884, _904);
    float _908 = fma(_878, _832, _896);
    float _910 = fma(_890, _832, _888);
    float _912 = fma(_900, _832, _870);
    float _914 = fma(_886, _858, _908);
    float _916 = fma(_906, _858, _910);
    float _918 = fma(_892, _858, _912);
    float _920 = -_882;
    float _922 = _920 + 1.0;
    float _924 = _468 + _914;
    float _926 = _868 + _916;
    float _928 = _470 + _918;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _932 = _930 != 0;
    float _934 = fma(_834, _860, _924);
    float _936 = fma(_812, _860, _926);
    float _938 = _834 * _902;
    float _940 = _812 * _902;
    float _942 = _850 * _902;
    float _944 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _946 = _936 + _944;
    float _948 = _938 * _922;
    float _950 = _940 * _922;
    float _952 = _942 * _596;
    float _954 = _938 * _596;
    float _956 = _940 * _596;
    float _958 = fma(_940, _950, _882);
    float _960 = fma(_940, _948, _952);
    float _962 = -_952;
    float _964 = fma(_940, _948, _962);
    float _966 = fma(_938, _948, _882);
    float _968 = -_956;
    float _970 = fma(_942, _948, _968);
    float _972 = fma(_942, _948, _956);
    float _974 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _976 = _934 + _974;
    float _978 = _958 * _946;
    float _980 = fma(_850, _860, _928);
    float _982 = fma(_942, _950, _954);
    float _984 = -_954;
    float _986 = fma(_942, _950, _984);
    float _988 = fma(_960, _976, _978);
    float _990 = _964 * _946;
    float _992 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _994 = _980 + _992;
    float _996 = _942 * _942;
    float _998 = _982 * _946;
    float _1000 = fma(_966, _976, _990);
    float _1002 = fma(_986, _994, _988);
    float _1004 = fma(_922, _996, _882);
    float _1006 = fma(_970, _976, _998);
    float _1008 = fma(_972, _994, _1000);
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1014 = fma(_1004, _994, _1006);
    float _1016 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1010);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1012);
    float _1022 = 0.0;
    float _1024 = _958;
    if (!_932)
    {
        _1022 = 0.0;
    }
    float _1026 = _1022;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1016);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1018);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1036 = _1030 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1038 = _1032 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1044);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1054 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1064 = _1056 + _1062;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_1064, _1064, _1066);
    float _1070 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1036;
    float _1074 = _1040;
    float _1076 = _1026;
    float _1078 = _1050;
    float _1080 = _1056;
    float _1082 = _1068;
    float _1084 = _1060;
    if (!_932)
    {
        _1072 = 0.0;
    }
    float _1086 = _1072;
    float _1088 = sqrt(_1068);
    float _1090 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1092 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1090);
    float _1094 = _1086;
    if (!_932)
    {
        _1074 = 0.0;
    }
    float _1096 = _1074;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1100 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1102 = !_932;
    float _1104 = _1096;
    float _1106 = _1088;
    if (!_1102)
    {
        float _1108 = -_868;
        float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = -_468;
        float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _1110 * _1110;
        float _1118 = fma(_1114, _1114, _1116);
        float _1120 = fma(_480, _480, _1118);
        float _1122 = rsqrt(_1120);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1126 = _1114 * _1124;
        float _1128 = _1110 * _1124;
        float _1130 = _480 * _1124;
        _1076 = _1128;
        _1104 = _1126;
        _1094 = _1130;
        _1078 = _1122;
    }
    float _1132 = _1076;
    float _1134 = _1104;
    float _1136 = _1094;
    float _1138 = _1078;
    float _1140 = _1138;
    float _1142 = _1134;
    if (!_1100)
    {
        _1140 = _1054;
    }
    float _1144 = _1140;
    float _1146 = _1144;
    if (!_1100)
    {
        _1024 = _1098;
    }
    float _1148 = _1024;
    bool _1150 = !_1100;
    float _1152 = _1148;
    if (!_1150)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1158 = _1088 + _1156;
        float _1160 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = rsqrt(_1068);
        float _1164 = _1158 * _1154;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1166 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = fma(_1170, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = _1162 * _1176;
        float _1180 = _1174 + (-1.0);
        float _1182 = fma(_1064, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1060, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1186 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = fma(_1098, _1174, _1186);
        _1152 = _1188;
        _1080 = _1182;
        _1146 = _1184;
        _1106 = _1186;
    }
    float _1190 = _1152;
    float _1192 = _1080;
    float _1194 = _1146;
    float _1196 = _1106;
    float _1198 = _1132 + _1190;
    float _1200 = _1134 + _1192;
    float _1202 = _1136 + _1194;
    float _1204 = _468 + _1134;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1202 + _1214;
    float _1218 = _470 + _1136;
    float _1220 = _1208 * _1208;
    float _1222 = fma(_1212, _1212, _1220);
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1226 = fma(_1216, _1216, _1222);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1212 * _1232;
    float _1236 = _1216 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1222;
    float _1254 = _1196;
    float _1256 = _1250;
    float _1258 = _1232;
    bool _1260 = _1246;
    float _1262 = _1208;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (!_1246)
    {
        _1142 = _1238;
    }
    float _1268 = _1142;
    float _1270 = _1268;
    if (_1246)
    {
        float _1272 = rsqrt(_1242);
        _1254 = _1272;
    }
    float _1274 = _1254;
    float _1276 = _1274;
    if (_1246)
    {
        float _1278 = _1250 * _1266;
        _1256 = _1278;
    }
    float _1280 = _1256;
    if (_1246)
    {
        float _1282 = _1280 * 0.15915493667125701904296875;
        _1082 = _1282;
    }
    float _1284 = _1082;
    float _1286 = _1266;
    if (_1246)
    {
        float _1288 = _1284 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1286 = _1290;
    }
    float _1292 = _1286;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _480;
    float _1300 = _1296;
    if (_1246)
    {
        float _1302 = _1284 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1232;
    float _1310 = -_1296;
    float _1312 = fma(_1208, _1308, _1310);
    if (_1246)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1320 = _1316;
    float _1322 = _1292;
    if (_1246)
    {
        float _1324 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1324;
    }
    float _1326 = _1084;
    float _1328 = _1326;
    if (!_1246)
    {
        _1320 = _1312;
    }
    float _1330 = _1320;
    float _1332 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1318);
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1246)
    {
        float _1338 = _1306 + (-1.0);
        _1322 = _1338;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1246)
    {
        float _1344 = _1274 * _1326;
        _1328 = _1344;
    }
    float _1346 = _1328;
    if (!_1246)
    {
        _1276 = _1234;
    }
    float _1348 = _1276;
    float _1350 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1352 = _1348;
    if (_1246)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1354;
    }
    float _1356 = _1258;
    if (_1246)
    {
        float _1358 = _1234 * _1346;
        _1352 = _1358;
    }
    float _1360 = _1352;
    if (!_1246)
    {
        _1342 = _1236;
    }
    float _1362 = _1342;
    float _1364 = _1362;
    if (_1246)
    {
        float _1366 = _1236 * _1346;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (_1246)
    {
        float _1370 = fma(_1312, _1306, _1356);
        _1334 = _1370;
    }
    float _1372 = _1334;
    if (_1246)
    {
        float _1374 = _1360 * _1360;
        _1270 = _1374;
    }
    float _1376 = _1270;
    if (!_1246)
    {
        _1336 = _1240;
    }
    float _1378 = _1336;
    float _1380 = _1378;
    if (_1246)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = fma(_1372, _1372, _1376);
    float _1390 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = _1388 + _1384;
    float _1398 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1400 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = floor(_1390);
    float _1404 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1398);
    float _1406 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1418 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1420 = rsqrt(_1396);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = -_1412;
    float _1428 = _1426 + 1.0;
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1418);
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1224, 1.0);
    float _1442 = abs(_1428);
    float _1444 = log2(_1442);
    float _1446 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1448 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1420 * _1360;
    float _1452 = _1420 * _1372;
    float _1454 = _1420 * _1368;
    float _1456 = floor(_1432);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = -_1402;
    float _1462 = _1390 + _1460;
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1446);
    float _1466 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1458;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = log2(_1440);
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1480 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = 1.0 / _1464;
    float _1492 = -_1456;
    float _1494 = _1432 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1500 = _1452 + 1.0;
    float _1502 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1506 = exp2(_1472);
    float _1508 = _1474 * 0.693147182464599609375;
    float _1510 = fma(_1486, _1502, 1.570728778839111328125);
    float _1512 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = sqrt(_1484);
    float _1516 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1518 = _1504 * _1490;
    float _1520 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1516);
    float _1522 = fma(_1518, 0.5, 0.5);
    float _1524 = -_1452;
    float _1526 = fma(_1506, _1500, _1524);
    float _1528 = _1520 * _1490;
    float _1530 = fma(_1528, -0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = _1514 * 0.636619746685028076171875;
    float2 _5559 = float2(_1462, _1494);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1538 = -_1510;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _5575 = float3(_1522, _1530, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5575, float3(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5575, float3(0.0), isnan(_5575)), level(0.0)).x;
    float3 _5586 = float3(_1522, _1530, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5586, float3(0.0), isnan(_5586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5586, float3(0.0), isnan(_5586)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5602 = float2(_1540, _1532);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5602, float2(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5602, float2(0.0), isnan(_5602)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1567 = int(_1565);
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1571 = _1569 != 0;
    float _1573 = -_166;
    float _1575 = _1573 + 1.0;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1579 = _1577 != 0;
    float _1581 = _868 + _1132;
    bool _1583 = _202 > 0.5;
    out.m_65.x = _1212;
    out.m_65.y = _1208;
    out.m_65.z = _1216;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1591 = int(_1589);
    float _1593 = in.m_55.x;
    float _1595 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = _1504;
    float _1603 = _1520;
    if (_1571)
    {
        bool _1605 = _196 > 0.5;
        _1260 = _1605;
    }
    bool _1607 = _1260;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1611 = float(_1567);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1617 = _1615 != 0;
    float _1619 = in.m_67.x;
    float _1621 = 1.0 / _1611;
    float _1623 = float(uint(_1591));
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1627 = _1625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1629 = ~_1591;
    int _1631 = _1629 + 1;
    int _1633 = ~_1591;
    int _1635 = _1633 + 1;
    bool _1637 = !_1617;
    float _1639 = _1637 ? 1.2345600128173828125 : 1.0;
    float _1641 = 1.0 / _1623;
    bool _1643 = !_1617;
    float _1645 = _1643 ? _204 : _196;
    float _1647 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1649 = float(_1591);
    int _1651 = abs(_500);
    float _1653 = _122 * _1621;
    float _1655 = 1.0 / _1627;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.w = _1657;
    int _1659 = as_type<int>(_1641) + (-2);
    float _1661 = trunc(_1653);
    int _1663 = int(_1661);
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1669 = _122 * _1649;
    float _1671 = 1.0 / _1599;
    float _1673 = _1669 * _168;
    float _1675 = float(uint(_1663));
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1681 = as_type<float>(_1659) * _1675;
    float _1683 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1679);
    float _1685 = trunc(_1681);
    float _1687 = precise::max(_1685, 0.0);
    uint _1690 = uint(_1687);
    float _1692 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = trunc(_1673);
    int _1696 = int(_1694);
    int _1698 = _1631 * int(_1690);
    int _1700 = _1698 + _1663;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1704 = in.m_59.w;
    float _1706 = float(uint(_1700));
    float _1708 = as_type<float>(_1700);
    float _1710 = _1681;
    if (!_1571)
    {
        _1708 = _1593;
    }
    float _1712 = _1708;
    float _1714 = exp2(_1595);
    float _1716 = as_type<float>(_1659) * _1706;
    float _1718 = _1712;
    if (!_1571)
    {
        _1710 = _1712;
    }
    float _1720 = _1710;
    float _1722 = _1720;
    if (_1571)
    {
        _1718 = _1593;
    }
    float _1724 = _1718;
    int _1726 = _1583 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1728 = trunc(_1716);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = 0;
    if (_1571)
    {
        float _1736 = -_1724;
        float _1738 = _1736 + 1.0;
        _1734 = as_type<int>(_1738);
    }
    int _1740 = _1734;
    int _1742 = 0;
    if (_1579)
    {
        float _1744 = -_1724;
        float _1746 = _1744 + 1.0;
        _1742 = as_type<int>(_1746);
    }
    int _1748 = _1742;
    float _1750 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1571)
    {
        float _1752 = _1607 ? as_type<float>(_1740) : _1724;
        _1722 = _1752;
    }
    float _1754 = _1722;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    bool _1760 = _1704 > 0.5;
    int _1762 = _1760 ? as_type<int>(_1575) : as_type<int>(_166);
    int _1764 = int(_1690) + int(_1732);
    float _1766 = as_type<float>(_1732);
    if (!_1579)
    {
        _1766 = _1724;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (_1579)
    {
        float _1772 = _1583 ? as_type<float>(_1748) : _1724;
        _1770 = _1772;
    }
    float _1774 = _1770;
    int _1776 = _1635 * _1764;
    int _1778 = _1776 + _1663;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1790 = uint(_1778) >= uint(_1591);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1802 = _1800 != 0;
    float _1804 = _1587 ? as_type<float>(_1726) : _166;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1810 = _204 > 0.5;
    float _1812 = 1.0 / _1808;
    int _1814 = _1810 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1816 = fma(_1647, _1804, -0.5);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1820 = _1802 ? as_type<float>(_1814) : _166;
    float _1822 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1824 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.5);
    bool _1832 = _1828 || _1830;
    float _1834 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1836 = _1786 ? as_type<float>(_1762) : _166;
    float _1838 = fma(_1822, -2.0, _1613);
    float _1840 = -_1818;
    float _1842 = fma(_1834, 2.0, _1840);
    float _1844 = fma(_1692, _1820, -0.5);
    bool _1846 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1848 = isnan(_194);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1858;
    bool _1862 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1864 = isnan(_194);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1882 = _1860 * _1671;
    float _1884 = _1645 * _1639;
    float _1886 = _1876 * _1655;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1890 = _194 + _1888;
    float _1892 = _1880 * _1812;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1896 = _194 + _1894;
    float _1898 = floor(_1884);
    float _1900 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1904 = _194 + _1902;
    bool _1906 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1908 = isnan(_194);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1892, _1904, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1924 = fma(_1882, _1896, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1926 = float(_1663);
    float _1928 = -_1916;
    float _1930 = _1928 + 1.0;
    int _1932 = ~_1764;
    int _1934 = _1932 + _1798;
    int _1936 = _1934 + 1;
    float _1938 = _1916 * _1920;
    bool _1940 = _1926 >= _1649;
    bool _1942 = isnan(_1926);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(_1649);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1954 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1956 = isnan(_194);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    int _1966 = _1591 * _1936;
    int _1968 = _1966 + _1663;
    float _1970 = -_1898;
    float _1972 = _1884 + _1970;
    float _1974 = _1872 * _1930;
    float _1976 = trunc(_1950);
    int _1978 = int(_1976);
    bool _1980 = !_1782;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1952);
    bool _1986 = _1591 == 0;
    float _1988 = _1649 * _1972;
    float _1990 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1838);
    float _1992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1984);
    bool _1994 = !_1986;
    float _1996 = _1994 ? as_type<float>(_1968) : as_type<float>(0xffffffffu /* nan */);
    float _1998 = -_1872;
    float _2000 = _1998 + 1.0;
    int _2002 = _1591 + (-1);
    float _2004 = -_1990;
    float _2006 = fma(_1992, _1844, _2004);
    int _2008 = abs(_630);
    float _2010 = trunc(_1988);
    int _2012 = int(_2010);
    float _2014 = _1964 * _2000;
    int _2016 = as_type<int>(_1844);
    float _2018 = _1900;
    float _2020 = _1996;
    float _2022 = _1882;
    if (_1758)
    {
        float _2024 = -_1724;
        float _2026 = _2024 + 1.0;
        _2016 = as_type<int>(_2026);
    }
    int _2028 = _2016;
    int _2030 = abs(_1982);
    float _2032 = -_1964;
    float _2034 = _2032 + 1.0;
    int _2036 = ~_1978;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = _1900 * _2014;
    float _2044 = as_type<float>(_2028);
    if (!_1758)
    {
        _2018 = _1724;
    }
    float _2046 = _2018;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2050 = _2046;
    if (_1758)
    {
        float _2052 = _1810 ? as_type<float>(_2028) : _1724;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = as_type<int>(_1996) * _2040;
    if (_1617)
    {
        _2020 = _196;
    }
    float _2058 = _2020;
    float _2060 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2062 = _2058;
    if (!_1617)
    {
        _2062 = _202;
    }
    float _2064 = _2062;
    int _2066 = _1978 * _2002;
    int _2068 = _2066 + _2056;
    int _2070 = abs(_606);
    float _2072 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2076 = _2068 * _2070;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2080 = abs(_634);
    int _2082 = _1696 * _2008;
    int _2084 = _2082 + _2076;
    int _2086 = _2012 * _2030;
    int _2088 = _2086 + _1663;
    float _2090 = -_2078;
    float _2092 = fma(_2074, 2.0, _2090);
    bool _2094 = _578 != 0.0;
    bool _2096 = isnan(_578);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = in.m_71.x;
    float _2106 = in.m_71.y;
    float _2108 = in.m_71.z;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2112 = -_122;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    float _2116 = fma(_1750, _2054, -0.5);
    float _2118 = as_type<float>(_2080);
    float _2120 = as_type<float>(_2084);
    if (!_1617)
    {
        _2022 = _204;
    }
    float _2122 = _2022;
    int _2124 = _2088 * _1651;
    int _2126 = _2124 + _2084;
    float _2128 = _2122;
    if (_1617)
    {
        _2128 = _196;
    }
    float _2130 = _2128;
    float _2132 = -_122;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2092);
    int _2136 = _2012 * _2080;
    int _2138 = _2136 + _2126;
    bool _2140 = _576 == 0.0;
    bool _2142 = !_2102;
    bool _2144 = _2140 && _2142;
    float _2146 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2110);
    float _2148 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2152 = float(uint(_2138));
    float _2154 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    bool _2156 = _580 == 0.0;
    bool _2158 = _2156 && _2144;
    float _2160 = -_2150;
    float _2162 = fma(_2148, 2.0, _2160);
    float _2164 = as_type<float>(_1659) * _2152;
    float _2166 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2168 = _2152;
    float _2170 = _2130;
    if (!_1617)
    {
        _2044 = _202;
    }
    float _2172 = _2044;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2176 = _2172;
    float _2178 = _2174;
    if (_1617)
    {
        _274 = _204;
    }
    float _2180 = _274;
    float _2182 = trunc(_2164);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2190 = _2180;
    if (_1617)
    {
        _2176 = _204;
    }
    float _2192 = _2176;
    float _2194 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2174);
    if (_1617)
    {
        _2168 = _204;
    }
    float _2196 = _2168;
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2188);
    float _2200 = _2196;
    if (_2158)
    {
        _2170 = _2104;
    }
    float _2202 = _2170;
    float _2204 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2206 = _2202;
    if (_2158)
    {
        _276 = _2106;
    }
    float _2208 = _276;
    float _2210 = _2208;
    if (!_1617)
    {
        _2200 = _196;
    }
    float _2212 = _2200;
    float _2214 = fma(_2204, -2.0, _1667);
    int _2216 = ~_1591;
    int _2218 = _2216 + 1;
    if (_2158)
    {
        _2190 = _2202;
    }
    float _2220 = _2190;
    float _2222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2214);
    float _2224 = _2220;
    if (!_2158)
    {
        _2206 = _2104;
    }
    float _2226 = _2206;
    float _2228 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2158)
    {
        _2118 = _2208;
    }
    float _2230 = _2118;
    float _2232 = _2230;
    if (!_2158)
    {
        _2210 = _2106;
    }
    float _2234 = _2210;
    if (!_2158)
    {
        float _2236 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2226);
        _2224 = _2236;
    }
    float _2238 = _2224;
    float _2240 = float(uint(_2088));
    float _2242 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2158)
    {
        _2120 = _2108;
    }
    float _2244 = _2120;
    float _2246 = as_type<float>(_1659) * _2240;
    float _2248 = _2244;
    if (!_2158)
    {
        float _2250 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2232 = _2250;
    }
    float _2252 = _2232;
    int _2254 = _2218 * int(_2186);
    int _2256 = _2254 + _2138;
    float _2258 = fma(_1922, _1974, _2060);
    if (_2158)
    {
        _2178 = _2244;
    }
    float _2260 = _2178;
    float _2262 = trunc(_2246);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = _2260;
    if (!_2158)
    {
        _2248 = _2108;
    }
    float _2270 = _2248;
    float _2272 = fma(_2242, _1754, -0.5);
    float _2274 = float(uint(_2256));
    float _2276 = fma(_1924, _1938, _2258);
    int _2278 = ~_1591;
    int _2280 = _2278 + 1;
    float _2282 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2198);
    int _2284 = ~_1591;
    int _2286 = _2284 + 1;
    float _2288 = as_type<float>(_1659) * _2274;
    float _2290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2194);
    float _2292 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2276);
    if (!_2158)
    {
        float _2294 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2268 = _2294;
    }
    float _2296 = _2268;
    float _2298 = trunc(_2288);
    float _2300 = precise::max(_2298, 0.0);
    uint _2302 = uint(_2300);
    float _2304 = fma(_2290, _2272, _2114);
    int _2306 = _2280 * int(_2266);
    int _2308 = _2306 + _2088;
    float _2310 = -_122;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2162);
    float _2314 = float(uint(_2308));
    float _2316 = fma(_2154, _1788, _2312);
    int _2318 = ~_1591;
    int _2320 = _2318 + 1;
    float _2322 = in.m_73.x;
    float _2324 = in.m_73.y;
    float _2326 = in.m_73.z;
    float _2328 = in.m_73.w;
    float _2330 = as_type<float>(_1659) * _2314;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2334 = int(_2186) + int(_2302);
    float _2336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1683);
    float _2338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2072);
    float _2340 = trunc(_2330);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    float _2346 = fma(_2228, -2.0, _2332);
    int _2348 = _2320 * _2334;
    int _2350 = _2348 + _2138;
    float _2352 = fma(_2338, _2116, _2134);
    float _2354 = -_2222;
    float _2356 = fma(_2282, _2166, _2354);
    bool _2358 = uint(_2350) >= uint(_1591);
    float _2360 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2346);
    float _2362 = _2352 + 0.5;
    bool _2364 = !_2358;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = -_2360;
    float _2370 = fma(_2336, _1816, _2368);
    float _2372 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2376 = ~_2334;
    int _2378 = _2376 + _2366;
    int _2380 = _2378 + 1;
    float _2382 = _2326 * _2226;
    int _2384 = int(_2266) + int(_2344);
    float _2386 = _2322 * _2234;
    float _2388 = _2324 * _2270;
    int _2390 = _1591 * _2380;
    int _2392 = _2390 + _2138;
    float _2394 = -_2382;
    float _2396 = fma(_2322, _2270, _2394);
    float _2398 = -_2386;
    float _2400 = fma(_2324, _2226, _2398);
    float _2402 = -_2388;
    float _2404 = fma(_2326, _2234, _2402);
    bool _2406 = !_1986;
    int _2408 = _2406 ? _2392 : (-1);
    float _2410 = _2396 * _2328;
    float _2412 = _2316 + 0.5;
    float _2414 = _2006 + 0.5;
    int _2416 = _2408 >> 31;
    float _2418 = _2404 * _2328;
    float _2420 = _2304 + 0.5;
    float _2422 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    int _2424 = _2416 & 3;
    float _2426 = _2400 * _2328;
    float _2428 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2374);
    float _2430 = _2356 + 0.5;
    int _2432 = _2408 + _2424;
    float _2434 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2422);
    float _2436 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2428);
    int _2438 = _2432 >> 2;
    out.m_75.x = _2420;
    out.m_75.y = _2414;
    out.m_75.z = _2412;
    out.m_75.w = _2430;
    float _2440 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2442 = _2438 << 4;
    int _2444 = _2442 + 512;
    int _2446 = _2286 * _2384;
    int _2448 = _2446 + _2088;
    int _2450 = _2408 & 3;
    int _2452 = _2408 & 3;
    bool _2454 = _2452 != 0;
    float _2456 = _2370 + 0.5;
    bool _2458 = uint(_2450) > 1u;
    int _2460 = _2454 ? 0 : 1;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2464 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _2468 = uint(int(uint(_2444) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    float _2484 = 1.0 / _2464;
    float _2486 = _2440 + _2464;
    int _2488 = ~_2460;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2496 = _2492;
    if (!_2458)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = _2462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2508 = _2444 + 8;
    uint _2510 = uint(int(uint(_2508) >> uint(2)));
    uint _2512 = uint(int(uint(int(_2510)) >> uint(2)));
    int _2514 = int(_2510) & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    int _2518 = int(_2510) + 1;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    int _2522 = _2518 & 3;
    float _2524 = (*spvDescriptorSet0.vp_c9)._m0[int(_2520)][_2522];
    float _2526 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = uint(_2448) >= uint(_1591);
    out.m_77.x = _2362;
    out.m_77.y = _2456;
    bool _2532 = _2450 != 3;
    float _2534 = _862 * _2410;
    bool _2536 = !_2530;
    int _2538 = _2536 ? 0 : (-1);
    out.m_79.x = _2504;
    out.m_79.y = _2506;
    out.m_79.z = _2526;
    out.m_79.w = _2528;
    float _2540 = _2486 * _2484;
    float _2542 = _2540 * 0.5;
    bool _2544 = uint(_2450) >= 2u;
    float _2546 = _866 * _2410;
    int _2548 = ~_2384;
    int _2550 = _2548 + _2538;
    int _2552 = _2550 + 1;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2556 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2554);
    int _2558 = _2544 ? 0 : 1;
    float _2560 = _862 * _2324;
    float _2562 = fma(_890, _2418, _2546);
    int _2564 = _1591 * _2552;
    int _2566 = _2564 + _2088;
    float _2568 = -_2410;
    float _2570 = _856 * _2568;
    float _2572 = fma(_900, _2418, _2534);
    float _2574 = fma(_900, _2322, _2560);
    float _2576 = _862 * _2252;
    bool _2578 = !_2454;
    int _2580 = _2578 ? 0 : 1;
    float _2582 = fma(_878, _2418, _2570);
    bool _2584 = _2450 != 3;
    float _2586 = _866 * _2324;
    float _2588 = 1.0 / _2556;
    int _2590 = abs(_2502);
    float _2592 = _866 * _2252;
    int _2594 = ~_2558;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    float _2600 = fma(_890, _2322, _2586);
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = fma(_890, _2238, _2592);
    int _2610 = abs(_2580);
    float _2612 = -_2324;
    float _2614 = _856 * _2612;
    int _2616 = _2598;
    if (_2532)
    {
        int _2618 = ~_2558;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2626 = ~_2610;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = fma(_878, _2322, _2614);
    int _2634 = abs(_2622);
    int _2636 = _2606 * as_type<int>(_2482);
    float _2638 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2624);
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2642 = _2588 * _2640;
    int _2644 = ~_2634;
    int _2646 = _2644 + 1;
    int _2648 = _2646 + 1;
    int _2650 = _2630 * as_type<int>(_2474);
    int _2652 = _2650 + _2636;
    bool _2654 = !_2584;
    int _2656 = _2654 ? 0 : (-1);
    float _2658 = abs(_2642);
    float _2660 = log2(_2658);
    bool _2662 = !_1794;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2648 * as_type<int>(_2516);
    int _2668 = _2666 + _2652;
    int _2670 = abs(_2656);
    float _2672 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2674 = fma(_886, _2426, _2582);
    float _2676 = fma(_906, _2426, _2562);
    float _2678 = fma(_892, _2426, _2572);
    int _2680 = abs(_2664);
    float _2682 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2684 = ~_2670;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _1504 + _1464;
    int _2692 = ~_2680;
    int _2694 = _2692 + 1;
    int _2696 = _2694 + 1;
    float _2698 = _2682 + _1464;
    float _2700 = _1464 * 0.5;
    int _2702 = _2688 * as_type<int>(_2524);
    int _2704 = _2702 + _2668;
    float _2706 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_81.x = _2674;
    out.m_81.y = _2676;
    out.m_81.z = _2678;
    int _2708 = _2704 * _2696;
    float _2710 = fma(_886, _2326, _2632);
    float _2712 = exp2(_2706);
    bool _2714 = !_1986;
    int _2716 = _2714 ? _2566 : (-1);
    float _2718 = fma(_906, _2326, _2600);
    float _2720 = fma(_892, _2326, _2574);
    float _2722 = -_2252;
    float _2724 = _856 * _2722;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1520;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _1464;
    int _2726 = _2716 * _2680;
    int _2728 = _2726 + _2708;
    float _2730 = _2698 * 0.5;
    float _2732 = _2690 * 0.5;
    float _2734 = fma(_1520, -0.5, _2700);
    out.m_83.x = _2710;
    out.m_83.y = _2718;
    out.m_83.z = _2720;
    float _2736 = float(_2728);
    float _2738 = fma(_900, _2238, _2576);
    out.m_85.x = _2732;
    out.m_85.y = _2734;
    out.m_85.z = _2730;
    out.m_85.w = _1464;
    float _2740 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2742 = precise::clamp(_2740, 0.0, 1.0);
    out.m_87.y = _2736;
    if (_1832)
    {
        _1601 = 1.0;
    }
    float _2744 = _1601;
    float _2746 = fma(_2742, -2.0, 3.0);
    float _2748 = _2742 * _2742;
    float _2750 = _2744;
    if (_1832)
    {
        _1603 = 1.0;
    }
    float _2752 = _1603;
    float _2754 = _2748 * _2746;
    float _2756 = fma(_878, _2238, _2724);
    bool _2758 = _2642 <= 8000.0;
    bool _2760 = isnan(_2642);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    float _2770 = -_2754;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2754);
    float _2776 = _2752;
    if (!_1832)
    {
        float _2778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2782 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2780;
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2784 * 6.283185482025146484375;
        float _2788 = cos(_2786);
        float _2790 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2792 = _2790 * 0.15915493667125701904296875;
        float _2794 = _2784 * 6.283185482025146484375;
        float _2796 = sin(_2794);
        float _2798 = 1.0 / _2788;
        float _2800 = _2792 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        float _2804 = _2796 * _2798;
        float _2806 = _2792 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        float _2810 = _2802 * _2804;
        float _2812 = 1.0 / _2782;
        float _2814 = 1.0 / _2810;
        float _2816 = _2808 * _2814;
        float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2820 = fma(_2642, _2816, _2818);
        float _2822 = _2820 * _2812;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        _2776 = _2824;
        _1262 = _2812;
    }
    float _2826 = _2776;
    float _2828 = _1262;
    float _2830 = _2828;
    if (!_1832)
    {
        float _2832 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2834 = _2832 * 0.15915493667125701904296875;
        float _2836 = _2834 * 6.283185482025146484375;
        float _2838 = cos(_2836);
        float _2840 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = _2834 * 6.283185482025146484375;
        float _2846 = sin(_2844);
        float _2848 = 1.0 / _2838;
        float _2850 = _2842 * 6.283185482025146484375;
        float _2852 = cos(_2850);
        float _2854 = _2846 * _2848;
        float _2856 = _2842 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2852 * _2854;
        float _2862 = 1.0 / _2860;
        float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2866 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2864;
        float _2868 = 1.0 / _2866;
        float _2870 = _2858 * _2862;
        float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2874 = fma(_2642, _2870, _2872);
        float _2876 = _2874 * _2868;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = -_2878;
        float _2882 = _2880 + 1.0;
        _2750 = _2882;
        _2830 = _2846;
    }
    float _2884 = _2750;
    float _2886 = _2830;
    float _2888 = _2768 * _2774;
    float _2890 = -_1714;
    float _2892 = _2890 + 1.0;
    float _2894 = -_1536;
    float _2896 = _2894 + 1.0;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2900 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2902 = fma(_886, _2296, _2756);
    float _2904 = fma(_906, _2296, _2608);
    float _2906 = _2896 * _2898;
    float _2908 = precise::clamp(_2906, 0.0, 1.0);
    float _2910 = _2900 * _1542;
    float _2912 = -_2900;
    float _2914 = _2912 + 1.0;
    float _2916 = fma(_892, _2296, _2738);
    float _2918 = -_2908;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2922 = _1553 * _2910;
    float _2924 = _1563 * _2910;
    float _2926 = _1553 * _2914;
    float _2928 = _2920 * _1619;
    float _2930 = fma(_1559, _2922, _1547);
    float _2932 = fma(_1561, _2922, _1549);
    float _2934 = fma(_1553, _2924, _1551);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2902;
    out.m_89.y = _2904;
    out.m_89.z = _2916;
    bool _2938 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_1230);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2826 * _2884;
    out.m_91.x = _2936;
    float _2950 = _2948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2930;
    out.m_93.y = _2932;
    out.m_93.z = _2934;
    out.m_93.w = _2926;
    float _2952 = _2920;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2956 = _2886;
    float _2958 = _2928;
    float _2960 = _2922;
    float _2962 = _2914;
    if (!_2946)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2964 = _2952;
    float _2966 = _2964;
    float _2968 = _2964;
    if (!_2946)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2970 = _2954;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2946)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2956;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2946)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2982 = _2958;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2946)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2988 = _2960;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2946)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2994 = _2962;
    bool _2996 = !_2946;
    float _2998 = _2994;
    float _3000 = _2994;
    if (!_2996)
    {
        bool _3002 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3004 = isnan(_1230);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3014 = _1230 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3024 = 1.0 / _3018;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3042 = _3014 * _3024;
            float _3044 = precise::clamp(_3042, 0.0, 1.0);
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3050 = fma(_3044, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3052 = fma(_3044, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3054 = fma(_3044, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3056 = fma(_3044, _3032, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3058 = fma(_3044, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3060 = fma(_3044, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2974 = _3054;
            _2992 = _3058;
            _2968 = _3050;
            _2986 = _3056;
            _2980 = _3052;
            _3000 = _3060;
            _3062 = true;
        }
        else
        {
            bool _3064 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3066 = isnan(_1230);
            bool _3068 = _3064 || _3066;
            bool _3070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3072 = _3068 || _3070;
            if (!_3072)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3074 = _2966;
            _2968 = _3074;
            if (!_3072)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3076 = _2972;
            _2974 = _3076;
            if (!_3072)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3078 = _2978;
            _2980 = _3078;
            if (!_3072)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3080 = _2984;
            _2986 = _3080;
            if (!_3072)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3082 = _2990;
            _2992 = _3082;
            if (!_3072)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3084 = _2998;
            bool _3086 = !_3072;
            _3000 = _3084;
            if (!_3086)
            {
                bool _3088 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3090 = isnan(_1230);
                bool _3092 = _3088 || _3090;
                bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3096 = _3092 || _3094;
                if (!_3096)
                {
                    float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3100 = _1230 + _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3110 = 1.0 / _3104;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3128 = _3100 * _3110;
                    float _3130 = precise::clamp(_3128, 0.0, 1.0);
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3136 = fma(_3130, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3138 = fma(_3130, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3140 = fma(_3130, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3142 = fma(_3130, _3118, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3144 = fma(_3130, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3146 = fma(_3130, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2974 = _3140;
                    _2992 = _3144;
                    _2968 = _3136;
                    _2986 = _3142;
                    _2980 = _3138;
                    _3000 = _3146;
                    _3062 = true;
                }
                else
                {
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3062 = false;
    float _3148 = _2974;
    float _3150 = _2992;
    float _3152 = _2968;
    float _3154 = _2986;
    float _3156 = _2980;
    float _3158 = _3000;
    float _3160 = fma(_2904, -0.5, 0.5);
    float _3162 = precise::clamp(_3160, 0.0, 1.0);
    float _3164 = -_3148;
    float _3166 = _3164 + _3150;
    float _3168 = _2950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3170 = -_3152;
    float _3172 = _3170 + _3154;
    out.m_95.x = 0.0;
    float _3174 = fma(_3162, _3166, _3148);
    float _3176 = fma(_3162, _3172, _3152);
    out.m_53.x = _3168;
    float _3178 = -_3156;
    float _3180 = _3178 + _3158;
    float _3182 = _3174 * 0.586610972881317138671875;
    bool _3184 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3186 = fma(_3162, _3180, _3156);
    float _3188 = fma(_3176, 0.298911988735198974609375, _3182);
    bool _3190 = _2826 > 0.0;
    bool _3192 = isnan(_2826);
    bool _3194 = _3190 || _3192;
    bool _3196 = isnan(0.0);
    bool _3198 = _3194 || _3196;
    float _3200 = fma(_3186, 0.114477999508380889892578125, _3188);
    bool _3202 = _2884 <= 0.0;
    bool _3204 = !_3198;
    bool _3206 = _3202 || _3204;
    float _3208 = -_3200;
    float _3210 = _3176 + _3208;
    float _3212 = -_3200;
    float _3214 = _3174 + _3212;
    float _3216 = -_3200;
    float _3218 = _3186 + _3216;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3222 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3224 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    bool _3226 = !_3184;
    if (!_3226)
    {
        float _3228 = -_1198;
        float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3232 = -_1200;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3236 = -_1202;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3240 = _3230 * _3230;
        float _3242 = fma(_3234, _3234, _3240);
        float _3244 = fma(_3238, _3238, _3242);
        float _3246 = sqrt(_3244);
        float _3248 = rsqrt(_3244);
        float _3250 = -_3246;
        float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3256 = precise::clamp(_3254, 0.0, 1.0);
        float _3258 = _3234 * _3248;
        float _3260 = _3230 * _3248;
        float _3262 = abs(_3256);
        float _3264 = log2(_3262);
        float _3266 = _3238 * _3248;
        float _3268 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3270 = _2904 * _3260;
        float _3272 = -_3260;
        float _3274 = -_3268;
        float _3276 = fma(_3272, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3274);
        float _3278 = fma(_2902, _3258, _3270);
        float _3280 = -_3266;
        float _3282 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3276);
        float _3284 = fma(_2916, _3266, _3278);
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3290 = _3282 + _3288;
        float _3292 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3296 = precise::clamp(_3294, 0.0, 1.0);
        float _3298 = exp2(_3292);
        float _3300 = _3298 * _3296;
        float _3302 = _3286 * _3300;
        float _3304 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3306 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3304;
        out.m_95.y = _3306;
        out.m_95.z = _3308;
    }
    out.m_97.x = _3220;
    out.m_97.y = _3222;
    out.m_97.z = _3224;
    if (!_3206)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3310 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3310;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3062 = false;
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
    float _130 = as_type<float>(_118);
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
        float _3378 = as_type<float>(_138);
        out.gl_Position.z = _3378;
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
        float _3433 = as_type<float>(_164);
        out.gl_Position.z = _3433;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _172 = _122 * _168;
    out.m_57.y = _166;
    bool _174 = !_170;
    float _176 = _172;
    if (!_174)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _176 = _192;
    }
    float _194 = _176;
    float _196 = in.m_59.x;
    float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _200 = log2(_198);
    float _202 = in.m_59.z;
    float _204 = in.m_59.y;
    float _206 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = _122 * _200;
    float _216 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _218 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _216);
    float _220 = _196 * 2.0;
    float _222 = exp2(_214);
    float _224 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _218);
    float _226 = _202 * 2.0;
    float _228 = _204 * 2.0;
    float _230 = floor(_220);
    float _232 = floor(_226);
    float _234 = -_222;
    float _236 = _234 + 1.0;
    bool _238 = _230 > 0.0;
    float _240 = floor(_228);
    bool _242 = _230 >= 0.0;
    bool _244 = isnan(_230);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    int _252 = _250 ? 0 : 1;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _256 = _254 != 0;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _264 = _262 != 0;
    int _266 = ~_252;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    float _274 = _202;
    float _276 = _204;
    if (!_238)
    {
        int _278 = ~_252;
        int _280 = _278 + 1;
        _272 = _280;
    }
    int _282 = _272;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _290 = _288 != 0;
    bool _292 = !_260;
    int _294 = _292 ? 0 : 1;
    bool _296 = !_256;
    int _298 = _296 ? 0 : 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _306 = _304 != 0;
    bool _308 = _232 >= 0.0;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    bool _318 = _240 >= 0.0;
    bool _320 = isnan(_240);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    int _328 = _316 ? 0 : 1;
    bool _330 = _232 > 0.0;
    int _332 = ~_328;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _326 ? 0 : 1;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _352 = -_208;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _352);
    float _356 = _196 + _204;
    int _358 = _336;
    bool _360 = _290;
    int _362 = _302 ? (-1) : 0;
    if (!_330)
    {
        int _364 = ~_328;
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    float _370 = -_350;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _370);
    bool _374 = _240 > 0.0;
    float _376 = _196 + _202;
    float _378 = in.m_46.x;
    float _380 = in.m_46.y;
    float _382 = in.m_46.z;
    float _384 = _348 ? _236 : 0.0;
    float _386 = _204 + _202;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = _376 + (-1.0);
    float _404 = _386 + (-1.0);
    float _406 = _356 + (-1.0);
    float _408 = 1.0 / _400;
    int _410 = abs(_298);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _418 = ~_338;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_294);
    int _426 = _422;
    if (!_374)
    {
        int _428 = ~_338;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = rsqrt(_224);
    float _436 = float(_424);
    float _438 = float(_282);
    float _440 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = _384 * _408;
    bool _446 = !_264;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = _196 * 6.283185482025146484375;
    bool _456 = !_396;
    float _458 = _456 ? _122 : _444;
    float _460 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _464 = fma(_122, 0.02999999932944774627685546875, _454);
    float _466 = float(_432);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _464 * 0.15915493667125701904296875;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _468 + _474;
    float _478 = -_470;
    float _480 = _478 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _482 = float(_410);
    float _484 = float(_368);
    float _486 = _480 * 0.0625;
    float _488 = abs(_476);
    float _490 = abs(_480);
    float _492 = precise::max(_488, _490);
    float _494 = _472 * 6.283185482025146484375;
    float _496 = sin(_494);
    bool _498 = !_302;
    int _500 = _498 ? 0 : 1;
    float _502 = _482 * _484;
    bool _504 = _492 >= 16.0;
    float _506 = _436 * _438;
    float _508 = _212 * _212;
    float _510 = _502 * (-2.0);
    int _512 = abs(_448);
    float _514 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _516 = fma(_354, _354, _508);
    float _518 = fma(_416, _510, _416);
    float _520 = _196 + (-0.5);
    float _522 = _514 * (-0.699999988079071044921875);
    float _524 = fma(_372, _372, _516);
    float _526 = _504 ? _486 : _480;
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _530 = _476;
    if (_504)
    {
        float _532 = _476 * 0.0625;
        _530 = _532;
    }
    float _534 = _530;
    float _536 = float(_512);
    float _538 = rsqrt(_524);
    float _540 = _522 * 0.15915493667125701904296875;
    float _542 = fma(_458, _518, _528);
    float _544 = abs(_534);
    bool _546 = _544 != 0.0;
    bool _548 = isnan(_544);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = _536 * _466;
    float _558 = in.m_61.x;
    float _560 = in.m_61.y;
    float _562 = in.m_61.z;
    float _564 = _542 * 0.15915493667125701904296875;
    float _566 = abs(_526);
    bool _568 = _566 == 0.0;
    bool _570 = !_554;
    bool _572 = _568 && _570;
    float _574 = _556 * (-2.0);
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _506 * (-2.0);
    float _584 = abs(_526);
    bool _586 = _584 == 0.0;
    float _588 = _204 + (-0.5);
    float _590 = _202 + (-0.5);
    float _592 = fma(_414, _574, _414);
    float _594 = _540 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_412, _582, _412);
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    int _608 = as_type<int>(_602);
    if (_572)
    {
        bool _610 = as_type<int>(_526) >= 0;
        _360 = _610;
    }
    bool _612 = _360;
    float _614 = fma(_458, _592, _602);
    float _616 = _564 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(_458, _598, _600);
    if (_572)
    {
        int _622 = _612 ? 0 : 1078530011;
        _608 = _622;
    }
    int _624 = _608;
    float _626 = _614 * 0.15915493667125701904296875;
    bool _628 = !_286;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_306;
    int _634 = _632 ? 0 : 1;
    float _636 = _564 * 6.283185482025146484375;
    float _638 = cos(_636);
    int _640 = _624;
    if (_572)
    {
        int _642 = int(0x80000000) & as_type<int>(_534);
        int _644 = _624 | _642;
        _640 = _644;
    }
    int _646 = _640;
    bool _648 = !_554;
    bool _650 = _648 && _586;
    int _652 = _646;
    float _654 = as_type<float>(_646);
    if (!_650)
    {
        float _656 = abs(_534);
        bool _658 = _656 != as_type<float>(0x7f800000u /* inf */);
        bool _660 = isnan(_656);
        bool _662 = _658 || _660;
        bool _664 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _666 = _662 || _664;
        float _668 = abs(_526);
        bool _670 = _668 == as_type<float>(0x7f800000u /* inf */);
        float _672 = abs(_526);
        bool _674 = _672 == as_type<float>(0x7f800000u /* inf */);
        bool _676 = !_666;
        bool _678 = _674 && _676;
        if (_678)
        {
            bool _680 = as_type<int>(_526) >= 0;
            _362 = _680 ? (-1) : 0;
        }
        int _682 = _362;
        if (_678)
        {
            _652 = 1075235812;
        }
        int _684 = _652;
        int _686 = _684;
        if (_678)
        {
            int _688 = ~_682;
            int _690 = (_688 != 0) ? _684 : 1061752795;
            _686 = _690;
        }
        int _692 = _686;
        float _694 = as_type<float>(_692);
        if (_678)
        {
            int _696 = int(0x80000000) & as_type<int>(_534);
            int _698 = _692 | _696;
            _694 = as_type<float>(_698);
        }
        float _700 = _694;
        bool _702 = !_666;
        bool _704 = _702 && _670;
        _654 = _700;
        if (!_704)
        {
            float _706 = abs(_534);
            float _708 = abs(_526);
            float _710 = precise::max(_706, _708);
            float _712 = abs(_534);
            float _714 = abs(_526);
            float _716 = precise::min(_712, _714);
            float _718 = 1.0 / _710;
            float _720 = abs(_534);
            float _722 = abs(_526);
            bool _724 = _720 > _722;
            bool _726 = as_type<int>(_526) >= 0;
            float _728 = abs(_534);
            float _730 = abs(_526);
            float _732 = _728 + _730;
            int _734 = as_type<int>(_534) & int(0x80000000);
            bool _736 = _732 > as_type<float>(0x7f800000u /* inf */);
            bool _738 = isnan(_732);
            bool _740 = _736 || _738;
            bool _742 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _744 = _740 || _742;
            float _746 = _716 * _718;
            float _748 = _746 * _746;
            float _750 = _748 + 11.33538818359375;
            float _752 = fma(_748, _750, 28.84246826171875);
            float _754 = fma(_748, _752, 19.6966705322265625);
            float _756 = fma(_748, -0.82336294651031494140625, -5.674867153167724609375);
            float _758 = fma(_748, _756, -6.565555095672607421875);
            float _760 = 1.0 / _754;
            float _762 = _748 * _758;
            float _764 = _746 * _762;
            float _766 = fma(_764, _760, _746);
            float _768 = _766;
            _654 = _732;
            if (_724)
            {
                float _770 = -_766;
                float _772 = _770 + 1.57079637050628662109375;
                _768 = _772;
            }
            float _774 = _768;
            int _776 = as_type<int>(_774);
            if (!_726)
            {
                float _778 = -_774;
                float _780 = _778 + 3.1415927410125732421875;
                _776 = as_type<int>(_780);
            }
            int _782 = _776;
            if (!_744)
            {
                int _784 = _734 | _782;
                _654 = as_type<float>(_784);
            }
        }
    }
    float _786 = _654;
    float _788 = -_786;
    float _790 = _620 + _788;
    float _792 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _790 * 0.15915493667125701904296875;
    float _796 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _798 = _626 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _806 = fma(_804, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _808 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = _212 * _538;
    float _814 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _816 = _794 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = _562 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = -_166;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _832 = _820 * _810;
    float _834 = _354 * _538;
    float _836 = _794 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _812 * _812;
    float _842 = _822 * _824;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _846 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _496 * _830;
    float _850 = _372 * _538;
    float _852 = fma(_834, _834, _840);
    float _854 = _626 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _844 * _846;
    float _860 = _806 * _848;
    float _862 = _618 * _800;
    float _864 = _618 * _818;
    float _866 = _638 * _800;
    float _868 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _870 = _862 * _842;
    float _872 = _638 * _838;
    float _874 = _618 * _838;
    float _876 = fma(_850, _850, _852);
    float _878 = _838 * _800;
    float _880 = _540 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _638 * _818;
    float _886 = _818 * _800;
    float _888 = _866 * _842;
    float _890 = fma(_856, _872, _864);
    float _892 = fma(_856, _864, _872);
    float _894 = -_842;
    float _896 = _856 * _894;
    float _898 = -_884;
    float _900 = fma(_856, _874, _898);
    float _902 = rsqrt(_876);
    float _904 = -_874;
    float _906 = fma(_856, _884, _904);
    float _908 = fma(_878, _832, _896);
    float _910 = fma(_890, _832, _888);
    float _912 = fma(_900, _832, _870);
    float _914 = fma(_886, _858, _908);
    float _916 = fma(_906, _858, _910);
    float _918 = fma(_892, _858, _912);
    float _920 = -_882;
    float _922 = _920 + 1.0;
    float _924 = _468 + _914;
    float _926 = _868 + _916;
    float _928 = _470 + _918;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _932 = _930 != 0;
    float _934 = fma(_834, _860, _924);
    float _936 = fma(_812, _860, _926);
    float _938 = _834 * _902;
    float _940 = _812 * _902;
    float _942 = _850 * _902;
    float _944 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _946 = _936 + _944;
    float _948 = _938 * _922;
    float _950 = _940 * _922;
    float _952 = _942 * _596;
    float _954 = _938 * _596;
    float _956 = _940 * _596;
    float _958 = fma(_940, _950, _882);
    float _960 = fma(_940, _948, _952);
    float _962 = -_952;
    float _964 = fma(_940, _948, _962);
    float _966 = fma(_938, _948, _882);
    float _968 = -_956;
    float _970 = fma(_942, _948, _968);
    float _972 = fma(_942, _948, _956);
    float _974 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _976 = _934 + _974;
    float _978 = _958 * _946;
    float _980 = fma(_850, _860, _928);
    float _982 = fma(_942, _950, _954);
    float _984 = -_954;
    float _986 = fma(_942, _950, _984);
    float _988 = fma(_960, _976, _978);
    float _990 = _964 * _946;
    float _992 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _994 = _980 + _992;
    float _996 = _942 * _942;
    float _998 = _982 * _946;
    float _1000 = fma(_966, _976, _990);
    float _1002 = fma(_986, _994, _988);
    float _1004 = fma(_922, _996, _882);
    float _1006 = fma(_970, _976, _998);
    float _1008 = fma(_972, _994, _1000);
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1014 = fma(_1004, _994, _1006);
    float _1016 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1010);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1012);
    float _1022 = 0.0;
    float _1024 = _958;
    if (!_932)
    {
        _1022 = 0.0;
    }
    float _1026 = _1022;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1016);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1018);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1036 = _1030 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1038 = _1032 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1044);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1054 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1064 = _1056 + _1062;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_1064, _1064, _1066);
    float _1070 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1036;
    float _1074 = _1040;
    float _1076 = _1026;
    float _1078 = _1050;
    float _1080 = _1056;
    float _1082 = _1068;
    float _1084 = _1060;
    if (!_932)
    {
        _1072 = 0.0;
    }
    float _1086 = _1072;
    float _1088 = sqrt(_1068);
    float _1090 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1092 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1090);
    float _1094 = _1086;
    if (!_932)
    {
        _1074 = 0.0;
    }
    float _1096 = _1074;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1100 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1102 = !_932;
    float _1104 = _1096;
    float _1106 = _1088;
    if (!_1102)
    {
        float _1108 = -_868;
        float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = -_468;
        float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _1110 * _1110;
        float _1118 = fma(_1114, _1114, _1116);
        float _1120 = fma(_480, _480, _1118);
        float _1122 = rsqrt(_1120);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1126 = _1114 * _1124;
        float _1128 = _1110 * _1124;
        float _1130 = _480 * _1124;
        _1076 = _1128;
        _1104 = _1126;
        _1094 = _1130;
        _1078 = _1122;
    }
    float _1132 = _1076;
    float _1134 = _1104;
    float _1136 = _1094;
    float _1138 = _1078;
    float _1140 = _1138;
    float _1142 = _1134;
    if (!_1100)
    {
        _1140 = _1054;
    }
    float _1144 = _1140;
    float _1146 = _1144;
    if (!_1100)
    {
        _1024 = _1098;
    }
    float _1148 = _1024;
    bool _1150 = !_1100;
    float _1152 = _1148;
    if (!_1150)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1158 = _1088 + _1156;
        float _1160 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = rsqrt(_1068);
        float _1164 = _1158 * _1154;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1166 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = fma(_1170, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = _1162 * _1176;
        float _1180 = _1174 + (-1.0);
        float _1182 = fma(_1064, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1060, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1186 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = fma(_1098, _1174, _1186);
        _1152 = _1188;
        _1080 = _1182;
        _1146 = _1184;
        _1106 = _1186;
    }
    float _1190 = _1152;
    float _1192 = _1080;
    float _1194 = _1146;
    float _1196 = _1106;
    float _1198 = _1132 + _1190;
    float _1200 = _1134 + _1192;
    float _1202 = _1136 + _1194;
    float _1204 = _468 + _1134;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1202 + _1214;
    float _1218 = _470 + _1136;
    float _1220 = _1208 * _1208;
    float _1222 = fma(_1212, _1212, _1220);
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1226 = fma(_1216, _1216, _1222);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1212 * _1232;
    float _1236 = _1216 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1222;
    float _1254 = _1196;
    float _1256 = _1250;
    float _1258 = _1232;
    bool _1260 = _1246;
    float _1262 = _1208;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (!_1246)
    {
        _1142 = _1238;
    }
    float _1268 = _1142;
    float _1270 = _1268;
    if (_1246)
    {
        float _1272 = rsqrt(_1242);
        _1254 = _1272;
    }
    float _1274 = _1254;
    float _1276 = _1274;
    if (_1246)
    {
        float _1278 = _1250 * _1266;
        _1256 = _1278;
    }
    float _1280 = _1256;
    if (_1246)
    {
        float _1282 = _1280 * 0.15915493667125701904296875;
        _1082 = _1282;
    }
    float _1284 = _1082;
    float _1286 = _1266;
    if (_1246)
    {
        float _1288 = _1284 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1286 = _1290;
    }
    float _1292 = _1286;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _480;
    float _1300 = _1296;
    if (_1246)
    {
        float _1302 = _1284 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1232;
    float _1310 = -_1296;
    float _1312 = fma(_1208, _1308, _1310);
    if (_1246)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1320 = _1316;
    float _1322 = _1292;
    if (_1246)
    {
        float _1324 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1324;
    }
    float _1326 = _1084;
    float _1328 = _1326;
    if (!_1246)
    {
        _1320 = _1312;
    }
    float _1330 = _1320;
    float _1332 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1318);
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1246)
    {
        float _1338 = _1306 + (-1.0);
        _1322 = _1338;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1246)
    {
        float _1344 = _1274 * _1326;
        _1328 = _1344;
    }
    float _1346 = _1328;
    if (!_1246)
    {
        _1276 = _1234;
    }
    float _1348 = _1276;
    float _1350 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1352 = _1348;
    if (_1246)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1354;
    }
    float _1356 = _1258;
    if (_1246)
    {
        float _1358 = _1234 * _1346;
        _1352 = _1358;
    }
    float _1360 = _1352;
    if (!_1246)
    {
        _1342 = _1236;
    }
    float _1362 = _1342;
    float _1364 = _1362;
    if (_1246)
    {
        float _1366 = _1236 * _1346;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (_1246)
    {
        float _1370 = fma(_1312, _1306, _1356);
        _1334 = _1370;
    }
    float _1372 = _1334;
    if (_1246)
    {
        float _1374 = _1360 * _1360;
        _1270 = _1374;
    }
    float _1376 = _1270;
    if (!_1246)
    {
        _1336 = _1240;
    }
    float _1378 = _1336;
    float _1380 = _1378;
    if (_1246)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = fma(_1372, _1372, _1376);
    float _1390 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = _1388 + _1384;
    float _1398 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1400 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = floor(_1390);
    float _1404 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1398);
    float _1406 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1418 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1420 = rsqrt(_1396);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = -_1412;
    float _1428 = _1426 + 1.0;
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1418);
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1224, 1.0);
    float _1442 = abs(_1428);
    float _1444 = log2(_1442);
    float _1446 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1448 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1420 * _1360;
    float _1452 = _1420 * _1372;
    float _1454 = _1420 * _1368;
    float _1456 = floor(_1432);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = -_1402;
    float _1462 = _1390 + _1460;
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1446);
    float _1466 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1458;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = log2(_1440);
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1480 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = 1.0 / _1464;
    float _1492 = -_1456;
    float _1494 = _1432 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1500 = _1452 + 1.0;
    float _1502 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1506 = exp2(_1472);
    float _1508 = _1474 * 0.693147182464599609375;
    float _1510 = fma(_1486, _1502, 1.570728778839111328125);
    float _1512 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = sqrt(_1484);
    float _1516 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1518 = _1504 * _1490;
    float _1520 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1516);
    float _1522 = fma(_1518, 0.5, 0.5);
    float _1524 = -_1452;
    float _1526 = fma(_1506, _1500, _1524);
    float _1528 = _1520 * _1490;
    float _1530 = fma(_1528, -0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = _1514 * 0.636619746685028076171875;
    float2 _5559 = float2(_1462, _1494);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1538 = -_1510;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _5575 = float3(_1522, _1530, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5575, float3(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5575, float3(0.0), isnan(_5575)), level(0.0)).x;
    float3 _5586 = float3(_1522, _1530, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5586, float3(0.0), isnan(_5586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5586, float3(0.0), isnan(_5586)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5602 = float2(_1540, _1532);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5602, float2(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5602, float2(0.0), isnan(_5602)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1567 = int(_1565);
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1571 = _1569 != 0;
    float _1573 = -_166;
    float _1575 = _1573 + 1.0;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1579 = _1577 != 0;
    float _1581 = _868 + _1132;
    bool _1583 = _202 > 0.5;
    out.m_65.x = _1212;
    out.m_65.y = _1208;
    out.m_65.z = _1216;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1591 = int(_1589);
    float _1593 = in.m_55.x;
    float _1595 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = _1504;
    float _1603 = _1520;
    if (_1571)
    {
        bool _1605 = _196 > 0.5;
        _1260 = _1605;
    }
    bool _1607 = _1260;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1611 = float(_1567);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1617 = _1615 != 0;
    float _1619 = in.m_67.x;
    float _1621 = 1.0 / _1611;
    float _1623 = float(uint(_1591));
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1627 = _1625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1629 = ~_1591;
    int _1631 = _1629 + 1;
    int _1633 = ~_1591;
    int _1635 = _1633 + 1;
    bool _1637 = !_1617;
    float _1639 = _1637 ? 1.2345600128173828125 : 1.0;
    float _1641 = 1.0 / _1623;
    bool _1643 = !_1617;
    float _1645 = _1643 ? _204 : _196;
    float _1647 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1649 = float(_1591);
    int _1651 = abs(_500);
    float _1653 = _122 * _1621;
    float _1655 = 1.0 / _1627;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.w = _1657;
    int _1659 = as_type<int>(_1641) + (-2);
    float _1661 = trunc(_1653);
    int _1663 = int(_1661);
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1669 = _122 * _1649;
    float _1671 = 1.0 / _1599;
    float _1673 = _1669 * _168;
    float _1675 = float(uint(_1663));
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1681 = as_type<float>(_1659) * _1675;
    float _1683 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1679);
    float _1685 = trunc(_1681);
    float _1687 = precise::max(_1685, 0.0);
    uint _1690 = uint(_1687);
    float _1692 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = trunc(_1673);
    int _1696 = int(_1694);
    int _1698 = _1631 * int(_1690);
    int _1700 = _1698 + _1663;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1704 = in.m_59.w;
    float _1706 = float(uint(_1700));
    float _1708 = as_type<float>(_1700);
    float _1710 = _1681;
    if (!_1571)
    {
        _1708 = _1593;
    }
    float _1712 = _1708;
    float _1714 = exp2(_1595);
    float _1716 = as_type<float>(_1659) * _1706;
    float _1718 = _1712;
    if (!_1571)
    {
        _1710 = _1712;
    }
    float _1720 = _1710;
    float _1722 = _1720;
    if (_1571)
    {
        _1718 = _1593;
    }
    float _1724 = _1718;
    int _1726 = _1583 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1728 = trunc(_1716);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = 0;
    if (_1571)
    {
        float _1736 = -_1724;
        float _1738 = _1736 + 1.0;
        _1734 = as_type<int>(_1738);
    }
    int _1740 = _1734;
    int _1742 = 0;
    if (_1579)
    {
        float _1744 = -_1724;
        float _1746 = _1744 + 1.0;
        _1742 = as_type<int>(_1746);
    }
    int _1748 = _1742;
    float _1750 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1571)
    {
        float _1752 = _1607 ? as_type<float>(_1740) : _1724;
        _1722 = _1752;
    }
    float _1754 = _1722;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    bool _1760 = _1704 > 0.5;
    int _1762 = _1760 ? as_type<int>(_1575) : as_type<int>(_166);
    int _1764 = int(_1690) + int(_1732);
    float _1766 = as_type<float>(_1732);
    if (!_1579)
    {
        _1766 = _1724;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (_1579)
    {
        float _1772 = _1583 ? as_type<float>(_1748) : _1724;
        _1770 = _1772;
    }
    float _1774 = _1770;
    int _1776 = _1635 * _1764;
    int _1778 = _1776 + _1663;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1790 = uint(_1778) >= uint(_1591);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1802 = _1800 != 0;
    float _1804 = _1587 ? as_type<float>(_1726) : _166;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1810 = _204 > 0.5;
    float _1812 = 1.0 / _1808;
    int _1814 = _1810 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1816 = fma(_1647, _1804, -0.5);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1820 = _1802 ? as_type<float>(_1814) : _166;
    float _1822 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1824 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.5);
    bool _1832 = _1828 || _1830;
    float _1834 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1836 = _1786 ? as_type<float>(_1762) : _166;
    float _1838 = fma(_1822, -2.0, _1613);
    float _1840 = -_1818;
    float _1842 = fma(_1834, 2.0, _1840);
    float _1844 = fma(_1692, _1820, -0.5);
    bool _1846 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1848 = isnan(_194);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1858;
    bool _1862 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1864 = isnan(_194);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1882 = _1860 * _1671;
    float _1884 = _1645 * _1639;
    float _1886 = _1876 * _1655;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1890 = _194 + _1888;
    float _1892 = _1880 * _1812;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1896 = _194 + _1894;
    float _1898 = floor(_1884);
    float _1900 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1904 = _194 + _1902;
    bool _1906 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1908 = isnan(_194);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1892, _1904, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1924 = fma(_1882, _1896, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1926 = float(_1663);
    float _1928 = -_1916;
    float _1930 = _1928 + 1.0;
    int _1932 = ~_1764;
    int _1934 = _1932 + _1798;
    int _1936 = _1934 + 1;
    float _1938 = _1916 * _1920;
    bool _1940 = _1926 >= _1649;
    bool _1942 = isnan(_1926);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(_1649);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1954 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1956 = isnan(_194);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    int _1966 = _1591 * _1936;
    int _1968 = _1966 + _1663;
    float _1970 = -_1898;
    float _1972 = _1884 + _1970;
    float _1974 = _1872 * _1930;
    float _1976 = trunc(_1950);
    int _1978 = int(_1976);
    bool _1980 = !_1782;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1952);
    bool _1986 = _1591 == 0;
    float _1988 = _1649 * _1972;
    float _1990 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1838);
    float _1992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1984);
    bool _1994 = !_1986;
    float _1996 = _1994 ? as_type<float>(_1968) : as_type<float>(0xffffffffu /* nan */);
    float _1998 = -_1872;
    float _2000 = _1998 + 1.0;
    int _2002 = _1591 + (-1);
    float _2004 = -_1990;
    float _2006 = fma(_1992, _1844, _2004);
    int _2008 = abs(_630);
    float _2010 = trunc(_1988);
    int _2012 = int(_2010);
    float _2014 = _1964 * _2000;
    int _2016 = as_type<int>(_1844);
    float _2018 = _1900;
    float _2020 = _1996;
    float _2022 = _1882;
    if (_1758)
    {
        float _2024 = -_1724;
        float _2026 = _2024 + 1.0;
        _2016 = as_type<int>(_2026);
    }
    int _2028 = _2016;
    int _2030 = abs(_1982);
    float _2032 = -_1964;
    float _2034 = _2032 + 1.0;
    int _2036 = ~_1978;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = _1900 * _2014;
    float _2044 = as_type<float>(_2028);
    if (!_1758)
    {
        _2018 = _1724;
    }
    float _2046 = _2018;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2050 = _2046;
    if (_1758)
    {
        float _2052 = _1810 ? as_type<float>(_2028) : _1724;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = as_type<int>(_1996) * _2040;
    if (_1617)
    {
        _2020 = _196;
    }
    float _2058 = _2020;
    float _2060 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2062 = _2058;
    if (!_1617)
    {
        _2062 = _202;
    }
    float _2064 = _2062;
    int _2066 = _1978 * _2002;
    int _2068 = _2066 + _2056;
    int _2070 = abs(_606);
    float _2072 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2076 = _2068 * _2070;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2080 = abs(_634);
    int _2082 = _1696 * _2008;
    int _2084 = _2082 + _2076;
    int _2086 = _2012 * _2030;
    int _2088 = _2086 + _1663;
    float _2090 = -_2078;
    float _2092 = fma(_2074, 2.0, _2090);
    bool _2094 = _578 != 0.0;
    bool _2096 = isnan(_578);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = in.m_71.x;
    float _2106 = in.m_71.y;
    float _2108 = in.m_71.z;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2112 = -_122;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    float _2116 = fma(_1750, _2054, -0.5);
    float _2118 = as_type<float>(_2080);
    float _2120 = as_type<float>(_2084);
    if (!_1617)
    {
        _2022 = _204;
    }
    float _2122 = _2022;
    int _2124 = _2088 * _1651;
    int _2126 = _2124 + _2084;
    float _2128 = _2122;
    if (_1617)
    {
        _2128 = _196;
    }
    float _2130 = _2128;
    float _2132 = -_122;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2092);
    int _2136 = _2012 * _2080;
    int _2138 = _2136 + _2126;
    bool _2140 = _576 == 0.0;
    bool _2142 = !_2102;
    bool _2144 = _2140 && _2142;
    float _2146 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2110);
    float _2148 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2152 = float(uint(_2138));
    float _2154 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    bool _2156 = _580 == 0.0;
    bool _2158 = _2156 && _2144;
    float _2160 = -_2150;
    float _2162 = fma(_2148, 2.0, _2160);
    float _2164 = as_type<float>(_1659) * _2152;
    float _2166 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2168 = _2152;
    float _2170 = _2130;
    if (!_1617)
    {
        _2044 = _202;
    }
    float _2172 = _2044;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2176 = _2172;
    float _2178 = _2174;
    if (_1617)
    {
        _274 = _204;
    }
    float _2180 = _274;
    float _2182 = trunc(_2164);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2190 = _2180;
    if (_1617)
    {
        _2176 = _204;
    }
    float _2192 = _2176;
    float _2194 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2174);
    if (_1617)
    {
        _2168 = _204;
    }
    float _2196 = _2168;
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2188);
    float _2200 = _2196;
    if (_2158)
    {
        _2170 = _2104;
    }
    float _2202 = _2170;
    float _2204 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2206 = _2202;
    if (_2158)
    {
        _276 = _2106;
    }
    float _2208 = _276;
    float _2210 = _2208;
    if (!_1617)
    {
        _2200 = _196;
    }
    float _2212 = _2200;
    float _2214 = fma(_2204, -2.0, _1667);
    int _2216 = ~_1591;
    int _2218 = _2216 + 1;
    if (_2158)
    {
        _2190 = _2202;
    }
    float _2220 = _2190;
    float _2222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2214);
    float _2224 = _2220;
    if (!_2158)
    {
        _2206 = _2104;
    }
    float _2226 = _2206;
    float _2228 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2158)
    {
        _2118 = _2208;
    }
    float _2230 = _2118;
    float _2232 = _2230;
    if (!_2158)
    {
        _2210 = _2106;
    }
    float _2234 = _2210;
    if (!_2158)
    {
        float _2236 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2226);
        _2224 = _2236;
    }
    float _2238 = _2224;
    float _2240 = float(uint(_2088));
    float _2242 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2158)
    {
        _2120 = _2108;
    }
    float _2244 = _2120;
    float _2246 = as_type<float>(_1659) * _2240;
    float _2248 = _2244;
    if (!_2158)
    {
        float _2250 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2232 = _2250;
    }
    float _2252 = _2232;
    int _2254 = _2218 * int(_2186);
    int _2256 = _2254 + _2138;
    float _2258 = fma(_1922, _1974, _2060);
    if (_2158)
    {
        _2178 = _2244;
    }
    float _2260 = _2178;
    float _2262 = trunc(_2246);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = _2260;
    if (!_2158)
    {
        _2248 = _2108;
    }
    float _2270 = _2248;
    float _2272 = fma(_2242, _1754, -0.5);
    float _2274 = float(uint(_2256));
    float _2276 = fma(_1924, _1938, _2258);
    int _2278 = ~_1591;
    int _2280 = _2278 + 1;
    float _2282 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2198);
    int _2284 = ~_1591;
    int _2286 = _2284 + 1;
    float _2288 = as_type<float>(_1659) * _2274;
    float _2290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2194);
    float _2292 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2276);
    if (!_2158)
    {
        float _2294 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2268 = _2294;
    }
    float _2296 = _2268;
    float _2298 = trunc(_2288);
    float _2300 = precise::max(_2298, 0.0);
    uint _2302 = uint(_2300);
    float _2304 = fma(_2290, _2272, _2114);
    int _2306 = _2280 * int(_2266);
    int _2308 = _2306 + _2088;
    float _2310 = -_122;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2162);
    float _2314 = float(uint(_2308));
    float _2316 = fma(_2154, _1788, _2312);
    int _2318 = ~_1591;
    int _2320 = _2318 + 1;
    float _2322 = in.m_73.x;
    float _2324 = in.m_73.y;
    float _2326 = in.m_73.z;
    float _2328 = in.m_73.w;
    float _2330 = as_type<float>(_1659) * _2314;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2334 = int(_2186) + int(_2302);
    float _2336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1683);
    float _2338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2072);
    float _2340 = trunc(_2330);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    float _2346 = fma(_2228, -2.0, _2332);
    int _2348 = _2320 * _2334;
    int _2350 = _2348 + _2138;
    float _2352 = fma(_2338, _2116, _2134);
    float _2354 = -_2222;
    float _2356 = fma(_2282, _2166, _2354);
    bool _2358 = uint(_2350) >= uint(_1591);
    float _2360 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2346);
    float _2362 = _2352 + 0.5;
    bool _2364 = !_2358;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = -_2360;
    float _2370 = fma(_2336, _1816, _2368);
    float _2372 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2376 = ~_2334;
    int _2378 = _2376 + _2366;
    int _2380 = _2378 + 1;
    float _2382 = _2326 * _2226;
    int _2384 = int(_2266) + int(_2344);
    float _2386 = _2322 * _2234;
    float _2388 = _2324 * _2270;
    int _2390 = _1591 * _2380;
    int _2392 = _2390 + _2138;
    float _2394 = -_2382;
    float _2396 = fma(_2322, _2270, _2394);
    float _2398 = -_2386;
    float _2400 = fma(_2324, _2226, _2398);
    float _2402 = -_2388;
    float _2404 = fma(_2326, _2234, _2402);
    bool _2406 = !_1986;
    int _2408 = _2406 ? _2392 : (-1);
    float _2410 = _2396 * _2328;
    float _2412 = _2316 + 0.5;
    float _2414 = _2006 + 0.5;
    int _2416 = _2408 >> 31;
    float _2418 = _2404 * _2328;
    float _2420 = _2304 + 0.5;
    float _2422 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    int _2424 = _2416 & 3;
    float _2426 = _2400 * _2328;
    float _2428 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2374);
    float _2430 = _2356 + 0.5;
    int _2432 = _2408 + _2424;
    float _2434 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2422);
    float _2436 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2428);
    int _2438 = _2432 >> 2;
    out.m_75.x = _2420;
    out.m_75.y = _2414;
    out.m_75.z = _2412;
    out.m_75.w = _2430;
    float _2440 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2442 = _2438 << 4;
    int _2444 = _2442 + 512;
    int _2446 = _2286 * _2384;
    int _2448 = _2446 + _2088;
    int _2450 = _2408 & 3;
    int _2452 = _2408 & 3;
    bool _2454 = _2452 != 0;
    float _2456 = _2370 + 0.5;
    bool _2458 = uint(_2450) > 1u;
    int _2460 = _2454 ? 0 : 1;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2464 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _2468 = uint(int(uint(_2444) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    float _2484 = 1.0 / _2464;
    float _2486 = _2440 + _2464;
    int _2488 = ~_2460;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2496 = _2492;
    if (!_2458)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = _2462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2508 = _2444 + 8;
    uint _2510 = uint(int(uint(_2508) >> uint(2)));
    uint _2512 = uint(int(uint(int(_2510)) >> uint(2)));
    int _2514 = int(_2510) & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    int _2518 = int(_2510) + 1;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    int _2522 = _2518 & 3;
    float _2524 = (*spvDescriptorSet0.vp_c9)._m0[int(_2520)][_2522];
    float _2526 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = uint(_2448) >= uint(_1591);
    out.m_77.x = _2362;
    out.m_77.y = _2456;
    bool _2532 = _2450 != 3;
    float _2534 = _862 * _2410;
    bool _2536 = !_2530;
    int _2538 = _2536 ? 0 : (-1);
    out.m_79.x = _2504;
    out.m_79.y = _2506;
    out.m_79.z = _2526;
    out.m_79.w = _2528;
    float _2540 = _2486 * _2484;
    float _2542 = _2540 * 0.5;
    bool _2544 = uint(_2450) >= 2u;
    float _2546 = _866 * _2410;
    int _2548 = ~_2384;
    int _2550 = _2548 + _2538;
    int _2552 = _2550 + 1;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2556 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2554);
    int _2558 = _2544 ? 0 : 1;
    float _2560 = _862 * _2324;
    float _2562 = fma(_890, _2418, _2546);
    int _2564 = _1591 * _2552;
    int _2566 = _2564 + _2088;
    float _2568 = -_2410;
    float _2570 = _856 * _2568;
    float _2572 = fma(_900, _2418, _2534);
    float _2574 = fma(_900, _2322, _2560);
    float _2576 = _862 * _2252;
    bool _2578 = !_2454;
    int _2580 = _2578 ? 0 : 1;
    float _2582 = fma(_878, _2418, _2570);
    bool _2584 = _2450 != 3;
    float _2586 = _866 * _2324;
    float _2588 = 1.0 / _2556;
    int _2590 = abs(_2502);
    float _2592 = _866 * _2252;
    int _2594 = ~_2558;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    float _2600 = fma(_890, _2322, _2586);
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = fma(_890, _2238, _2592);
    int _2610 = abs(_2580);
    float _2612 = -_2324;
    float _2614 = _856 * _2612;
    int _2616 = _2598;
    if (_2532)
    {
        int _2618 = ~_2558;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2626 = ~_2610;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = fma(_878, _2322, _2614);
    int _2634 = abs(_2622);
    int _2636 = _2606 * as_type<int>(_2482);
    float _2638 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2624);
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2642 = _2588 * _2640;
    int _2644 = ~_2634;
    int _2646 = _2644 + 1;
    int _2648 = _2646 + 1;
    int _2650 = _2630 * as_type<int>(_2474);
    int _2652 = _2650 + _2636;
    bool _2654 = !_2584;
    int _2656 = _2654 ? 0 : (-1);
    float _2658 = abs(_2642);
    float _2660 = log2(_2658);
    bool _2662 = !_1794;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2648 * as_type<int>(_2516);
    int _2668 = _2666 + _2652;
    int _2670 = abs(_2656);
    float _2672 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2674 = fma(_886, _2426, _2582);
    float _2676 = fma(_906, _2426, _2562);
    float _2678 = fma(_892, _2426, _2572);
    int _2680 = abs(_2664);
    float _2682 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2684 = ~_2670;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _1504 + _1464;
    int _2692 = ~_2680;
    int _2694 = _2692 + 1;
    int _2696 = _2694 + 1;
    float _2698 = _2682 + _1464;
    float _2700 = _1464 * 0.5;
    int _2702 = _2688 * as_type<int>(_2524);
    int _2704 = _2702 + _2668;
    float _2706 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_81.x = _2674;
    out.m_81.y = _2676;
    out.m_81.z = _2678;
    int _2708 = _2704 * _2696;
    float _2710 = fma(_886, _2326, _2632);
    float _2712 = exp2(_2706);
    bool _2714 = !_1986;
    int _2716 = _2714 ? _2566 : (-1);
    float _2718 = fma(_906, _2326, _2600);
    float _2720 = fma(_892, _2326, _2574);
    float _2722 = -_2252;
    float _2724 = _856 * _2722;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1520;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _1464;
    int _2726 = _2716 * _2680;
    int _2728 = _2726 + _2708;
    float _2730 = _2698 * 0.5;
    float _2732 = _2690 * 0.5;
    float _2734 = fma(_1520, -0.5, _2700);
    out.m_83.x = _2710;
    out.m_83.y = _2718;
    out.m_83.z = _2720;
    float _2736 = float(_2728);
    float _2738 = fma(_900, _2238, _2576);
    out.m_85.x = _2732;
    out.m_85.y = _2734;
    out.m_85.z = _2730;
    out.m_85.w = _1464;
    float _2740 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2742 = precise::clamp(_2740, 0.0, 1.0);
    out.m_87.y = _2736;
    if (_1832)
    {
        _1601 = 1.0;
    }
    float _2744 = _1601;
    float _2746 = fma(_2742, -2.0, 3.0);
    float _2748 = _2742 * _2742;
    float _2750 = _2744;
    if (_1832)
    {
        _1603 = 1.0;
    }
    float _2752 = _1603;
    float _2754 = _2748 * _2746;
    float _2756 = fma(_878, _2238, _2724);
    bool _2758 = _2642 <= 8000.0;
    bool _2760 = isnan(_2642);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    float _2770 = -_2754;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2754);
    float _2776 = _2752;
    if (!_1832)
    {
        float _2778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2782 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2780;
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2784 * 6.283185482025146484375;
        float _2788 = cos(_2786);
        float _2790 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2792 = _2790 * 0.15915493667125701904296875;
        float _2794 = _2784 * 6.283185482025146484375;
        float _2796 = sin(_2794);
        float _2798 = 1.0 / _2788;
        float _2800 = _2792 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        float _2804 = _2796 * _2798;
        float _2806 = _2792 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        float _2810 = _2802 * _2804;
        float _2812 = 1.0 / _2782;
        float _2814 = 1.0 / _2810;
        float _2816 = _2808 * _2814;
        float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2820 = fma(_2642, _2816, _2818);
        float _2822 = _2820 * _2812;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        _2776 = _2824;
        _1262 = _2812;
    }
    float _2826 = _2776;
    float _2828 = _1262;
    float _2830 = _2828;
    if (!_1832)
    {
        float _2832 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2834 = _2832 * 0.15915493667125701904296875;
        float _2836 = _2834 * 6.283185482025146484375;
        float _2838 = cos(_2836);
        float _2840 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = _2834 * 6.283185482025146484375;
        float _2846 = sin(_2844);
        float _2848 = 1.0 / _2838;
        float _2850 = _2842 * 6.283185482025146484375;
        float _2852 = cos(_2850);
        float _2854 = _2846 * _2848;
        float _2856 = _2842 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2852 * _2854;
        float _2862 = 1.0 / _2860;
        float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2866 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2864;
        float _2868 = 1.0 / _2866;
        float _2870 = _2858 * _2862;
        float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2874 = fma(_2642, _2870, _2872);
        float _2876 = _2874 * _2868;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = -_2878;
        float _2882 = _2880 + 1.0;
        _2750 = _2882;
        _2830 = _2846;
    }
    float _2884 = _2750;
    float _2886 = _2830;
    float _2888 = _2768 * _2774;
    float _2890 = -_1714;
    float _2892 = _2890 + 1.0;
    float _2894 = -_1536;
    float _2896 = _2894 + 1.0;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2900 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2902 = fma(_886, _2296, _2756);
    float _2904 = fma(_906, _2296, _2608);
    float _2906 = _2896 * _2898;
    float _2908 = precise::clamp(_2906, 0.0, 1.0);
    float _2910 = _2900 * _1542;
    float _2912 = -_2900;
    float _2914 = _2912 + 1.0;
    float _2916 = fma(_892, _2296, _2738);
    float _2918 = -_2908;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2922 = _1553 * _2910;
    float _2924 = _1563 * _2910;
    float _2926 = _1553 * _2914;
    float _2928 = _2920 * _1619;
    float _2930 = fma(_1559, _2922, _1547);
    float _2932 = fma(_1561, _2922, _1549);
    float _2934 = fma(_1553, _2924, _1551);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2902;
    out.m_89.y = _2904;
    out.m_89.z = _2916;
    bool _2938 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_1230);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2826 * _2884;
    out.m_91.x = _2936;
    float _2950 = _2948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2930;
    out.m_93.y = _2932;
    out.m_93.z = _2934;
    out.m_93.w = _2926;
    float _2952 = _2920;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2956 = _2886;
    float _2958 = _2928;
    float _2960 = _2922;
    float _2962 = _2914;
    if (!_2946)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2964 = _2952;
    float _2966 = _2964;
    float _2968 = _2964;
    if (!_2946)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2970 = _2954;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2946)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2956;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2946)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2982 = _2958;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2946)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2988 = _2960;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2946)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2994 = _2962;
    bool _2996 = !_2946;
    float _2998 = _2994;
    float _3000 = _2994;
    if (!_2996)
    {
        bool _3002 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3004 = isnan(_1230);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3014 = _1230 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3024 = 1.0 / _3018;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3042 = _3014 * _3024;
            float _3044 = precise::clamp(_3042, 0.0, 1.0);
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3050 = fma(_3044, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3052 = fma(_3044, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3054 = fma(_3044, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3056 = fma(_3044, _3032, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3058 = fma(_3044, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3060 = fma(_3044, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2974 = _3054;
            _2992 = _3058;
            _2968 = _3050;
            _2986 = _3056;
            _2980 = _3052;
            _3000 = _3060;
            _3062 = true;
        }
        else
        {
            bool _3064 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3066 = isnan(_1230);
            bool _3068 = _3064 || _3066;
            bool _3070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3072 = _3068 || _3070;
            if (!_3072)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3074 = _2966;
            _2968 = _3074;
            if (!_3072)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3076 = _2972;
            _2974 = _3076;
            if (!_3072)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3078 = _2978;
            _2980 = _3078;
            if (!_3072)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3080 = _2984;
            _2986 = _3080;
            if (!_3072)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3082 = _2990;
            _2992 = _3082;
            if (!_3072)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3084 = _2998;
            bool _3086 = !_3072;
            _3000 = _3084;
            if (!_3086)
            {
                bool _3088 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3090 = isnan(_1230);
                bool _3092 = _3088 || _3090;
                bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3096 = _3092 || _3094;
                if (!_3096)
                {
                    float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3100 = _1230 + _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3110 = 1.0 / _3104;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3128 = _3100 * _3110;
                    float _3130 = precise::clamp(_3128, 0.0, 1.0);
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3136 = fma(_3130, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3138 = fma(_3130, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3140 = fma(_3130, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3142 = fma(_3130, _3118, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3144 = fma(_3130, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3146 = fma(_3130, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2974 = _3140;
                    _2992 = _3144;
                    _2968 = _3136;
                    _2986 = _3142;
                    _2980 = _3138;
                    _3000 = _3146;
                    _3062 = true;
                }
                else
                {
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3062 = false;
    float _3148 = _2974;
    float _3150 = _2992;
    float _3152 = _2968;
    float _3154 = _2986;
    float _3156 = _2980;
    float _3158 = _3000;
    float _3160 = fma(_2904, -0.5, 0.5);
    float _3162 = precise::clamp(_3160, 0.0, 1.0);
    float _3164 = -_3148;
    float _3166 = _3164 + _3150;
    float _3168 = _2950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3170 = -_3152;
    float _3172 = _3170 + _3154;
    out.m_95.x = 0.0;
    float _3174 = fma(_3162, _3166, _3148);
    float _3176 = fma(_3162, _3172, _3152);
    out.m_53.x = _3168;
    float _3178 = -_3156;
    float _3180 = _3178 + _3158;
    float _3182 = _3174 * 0.586610972881317138671875;
    bool _3184 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3186 = fma(_3162, _3180, _3156);
    float _3188 = fma(_3176, 0.298911988735198974609375, _3182);
    bool _3190 = _2826 > 0.0;
    bool _3192 = isnan(_2826);
    bool _3194 = _3190 || _3192;
    bool _3196 = isnan(0.0);
    bool _3198 = _3194 || _3196;
    float _3200 = fma(_3186, 0.114477999508380889892578125, _3188);
    bool _3202 = _2884 <= 0.0;
    bool _3204 = !_3198;
    bool _3206 = _3202 || _3204;
    float _3208 = -_3200;
    float _3210 = _3176 + _3208;
    float _3212 = -_3200;
    float _3214 = _3174 + _3212;
    float _3216 = -_3200;
    float _3218 = _3186 + _3216;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3222 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3224 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    bool _3226 = !_3184;
    if (!_3226)
    {
        float _3228 = -_1198;
        float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3232 = -_1200;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3236 = -_1202;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3240 = _3230 * _3230;
        float _3242 = fma(_3234, _3234, _3240);
        float _3244 = fma(_3238, _3238, _3242);
        float _3246 = sqrt(_3244);
        float _3248 = rsqrt(_3244);
        float _3250 = -_3246;
        float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3256 = precise::clamp(_3254, 0.0, 1.0);
        float _3258 = _3234 * _3248;
        float _3260 = _3230 * _3248;
        float _3262 = abs(_3256);
        float _3264 = log2(_3262);
        float _3266 = _3238 * _3248;
        float _3268 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3270 = _2904 * _3260;
        float _3272 = -_3260;
        float _3274 = -_3268;
        float _3276 = fma(_3272, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3274);
        float _3278 = fma(_2902, _3258, _3270);
        float _3280 = -_3266;
        float _3282 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3276);
        float _3284 = fma(_2916, _3266, _3278);
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3290 = _3282 + _3288;
        float _3292 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3296 = precise::clamp(_3294, 0.0, 1.0);
        float _3298 = exp2(_3292);
        float _3300 = _3298 * _3296;
        float _3302 = _3286 * _3300;
        float _3304 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3306 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3304;
        out.m_95.y = _3306;
        out.m_95.z = _3308;
    }
    out.m_97.x = _3220;
    out.m_97.y = _3222;
    out.m_97.z = _3224;
    if (!_3206)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3310 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3310;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3062 = false;
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
    float _130 = as_type<float>(_118);
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
        float _3378 = as_type<float>(_138);
        out.gl_Position.z = _3378;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3433 = as_type<float>(_164);
        out.gl_Position.z = _3433;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _172 = _122 * _168;
    out.m_57.y = _166;
    bool _174 = !_170;
    float _176 = _172;
    if (!_174)
    {
        float _178 = in.m_59.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _176 = _192;
    }
    float _194 = _176;
    float _196 = in.m_59.x;
    float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _200 = log2(_198);
    float _202 = in.m_59.z;
    float _204 = in.m_59.y;
    float _206 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _210);
    float _214 = _122 * _200;
    float _216 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _218 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _216);
    float _220 = _196 * 2.0;
    float _222 = exp2(_214);
    float _224 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _218);
    float _226 = _202 * 2.0;
    float _228 = _204 * 2.0;
    float _230 = floor(_220);
    float _232 = floor(_226);
    float _234 = -_222;
    float _236 = _234 + 1.0;
    bool _238 = _230 > 0.0;
    float _240 = floor(_228);
    bool _242 = _230 >= 0.0;
    bool _244 = isnan(_230);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    int _252 = _250 ? 0 : 1;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _256 = _254 != 0;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _264 = _262 != 0;
    int _266 = ~_252;
    int _268 = _266 + 1;
    int _270 = _268 + 1;
    int _272 = _270;
    float _274 = _202;
    float _276 = _204;
    if (!_238)
    {
        int _278 = ~_252;
        int _280 = _278 + 1;
        _272 = _280;
    }
    int _282 = _272;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _290 = _288 != 0;
    bool _292 = !_260;
    int _294 = _292 ? 0 : 1;
    bool _296 = !_256;
    int _298 = _296 ? 0 : 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _306 = _304 != 0;
    bool _308 = _232 >= 0.0;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    bool _318 = _240 >= 0.0;
    bool _320 = isnan(_240);
    bool _322 = _318 || _320;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    int _328 = _316 ? 0 : 1;
    bool _330 = _232 > 0.0;
    int _332 = ~_328;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _326 ? 0 : 1;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _352 = -_208;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _352);
    float _356 = _196 + _204;
    int _358 = _336;
    bool _360 = _290;
    int _362 = _302 ? (-1) : 0;
    if (!_330)
    {
        int _364 = ~_328;
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    float _370 = -_350;
    float _372 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _370);
    bool _374 = _240 > 0.0;
    float _376 = _196 + _202;
    float _378 = in.m_46.x;
    float _380 = in.m_46.y;
    float _382 = in.m_46.z;
    float _384 = _348 ? _236 : 0.0;
    float _386 = _204 + _202;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = _376 + (-1.0);
    float _404 = _386 + (-1.0);
    float _406 = _356 + (-1.0);
    float _408 = 1.0 / _400;
    int _410 = abs(_298);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _418 = ~_338;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    int _424 = abs(_294);
    int _426 = _422;
    if (!_374)
    {
        int _428 = ~_338;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = rsqrt(_224);
    float _436 = float(_424);
    float _438 = float(_282);
    float _440 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = _384 * _408;
    bool _446 = !_264;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = _196 * 6.283185482025146484375;
    bool _456 = !_396;
    float _458 = _456 ? _122 : _444;
    float _460 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _462 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _464 = fma(_122, 0.02999999932944774627685546875, _454);
    float _466 = float(_432);
    float _468 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _470 = _462 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _464 * 0.15915493667125701904296875;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _468 + _474;
    float _478 = -_470;
    float _480 = _478 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _482 = float(_410);
    float _484 = float(_368);
    float _486 = _480 * 0.0625;
    float _488 = abs(_476);
    float _490 = abs(_480);
    float _492 = precise::max(_488, _490);
    float _494 = _472 * 6.283185482025146484375;
    float _496 = sin(_494);
    bool _498 = !_302;
    int _500 = _498 ? 0 : 1;
    float _502 = _482 * _484;
    bool _504 = _492 >= 16.0;
    float _506 = _436 * _438;
    float _508 = _212 * _212;
    float _510 = _502 * (-2.0);
    int _512 = abs(_448);
    float _514 = _434 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _516 = fma(_354, _354, _508);
    float _518 = fma(_416, _510, _416);
    float _520 = _196 + (-0.5);
    float _522 = _514 * (-0.699999988079071044921875);
    float _524 = fma(_372, _372, _516);
    float _526 = _504 ? _486 : _480;
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _530 = _476;
    if (_504)
    {
        float _532 = _476 * 0.0625;
        _530 = _532;
    }
    float _534 = _530;
    float _536 = float(_512);
    float _538 = rsqrt(_524);
    float _540 = _522 * 0.15915493667125701904296875;
    float _542 = fma(_458, _518, _528);
    float _544 = abs(_534);
    bool _546 = _544 != 0.0;
    bool _548 = isnan(_544);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = _536 * _466;
    float _558 = in.m_61.x;
    float _560 = in.m_61.y;
    float _562 = in.m_61.z;
    float _564 = _542 * 0.15915493667125701904296875;
    float _566 = abs(_526);
    bool _568 = _566 == 0.0;
    bool _570 = !_554;
    bool _572 = _568 && _570;
    float _574 = _556 * (-2.0);
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    float _582 = _506 * (-2.0);
    float _584 = abs(_526);
    bool _586 = _584 == 0.0;
    float _588 = _204 + (-0.5);
    float _590 = _202 + (-0.5);
    float _592 = fma(_414, _574, _414);
    float _594 = _540 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_412, _582, _412);
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    int _608 = as_type<int>(_602);
    if (_572)
    {
        bool _610 = as_type<int>(_526) >= 0;
        _360 = _610;
    }
    bool _612 = _360;
    float _614 = fma(_458, _592, _602);
    float _616 = _564 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(_458, _598, _600);
    if (_572)
    {
        int _622 = _612 ? 0 : 1078530011;
        _608 = _622;
    }
    int _624 = _608;
    float _626 = _614 * 0.15915493667125701904296875;
    bool _628 = !_286;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_306;
    int _634 = _632 ? 0 : 1;
    float _636 = _564 * 6.283185482025146484375;
    float _638 = cos(_636);
    int _640 = _624;
    if (_572)
    {
        int _642 = int(0x80000000) & as_type<int>(_534);
        int _644 = _624 | _642;
        _640 = _644;
    }
    int _646 = _640;
    bool _648 = !_554;
    bool _650 = _648 && _586;
    int _652 = _646;
    float _654 = as_type<float>(_646);
    if (!_650)
    {
        float _656 = abs(_534);
        bool _658 = _656 != as_type<float>(0x7f800000u /* inf */);
        bool _660 = isnan(_656);
        bool _662 = _658 || _660;
        bool _664 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _666 = _662 || _664;
        float _668 = abs(_526);
        bool _670 = _668 == as_type<float>(0x7f800000u /* inf */);
        float _672 = abs(_526);
        bool _674 = _672 == as_type<float>(0x7f800000u /* inf */);
        bool _676 = !_666;
        bool _678 = _674 && _676;
        if (_678)
        {
            bool _680 = as_type<int>(_526) >= 0;
            _362 = _680 ? (-1) : 0;
        }
        int _682 = _362;
        if (_678)
        {
            _652 = 1075235812;
        }
        int _684 = _652;
        int _686 = _684;
        if (_678)
        {
            int _688 = ~_682;
            int _690 = (_688 != 0) ? _684 : 1061752795;
            _686 = _690;
        }
        int _692 = _686;
        float _694 = as_type<float>(_692);
        if (_678)
        {
            int _696 = int(0x80000000) & as_type<int>(_534);
            int _698 = _692 | _696;
            _694 = as_type<float>(_698);
        }
        float _700 = _694;
        bool _702 = !_666;
        bool _704 = _702 && _670;
        _654 = _700;
        if (!_704)
        {
            float _706 = abs(_534);
            float _708 = abs(_526);
            float _710 = precise::max(_706, _708);
            float _712 = abs(_534);
            float _714 = abs(_526);
            float _716 = precise::min(_712, _714);
            float _718 = 1.0 / _710;
            float _720 = abs(_534);
            float _722 = abs(_526);
            bool _724 = _720 > _722;
            bool _726 = as_type<int>(_526) >= 0;
            float _728 = abs(_534);
            float _730 = abs(_526);
            float _732 = _728 + _730;
            int _734 = as_type<int>(_534) & int(0x80000000);
            bool _736 = _732 > as_type<float>(0x7f800000u /* inf */);
            bool _738 = isnan(_732);
            bool _740 = _736 || _738;
            bool _742 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _744 = _740 || _742;
            float _746 = _716 * _718;
            float _748 = _746 * _746;
            float _750 = _748 + 11.33538818359375;
            float _752 = fma(_748, _750, 28.84246826171875);
            float _754 = fma(_748, _752, 19.6966705322265625);
            float _756 = fma(_748, -0.82336294651031494140625, -5.674867153167724609375);
            float _758 = fma(_748, _756, -6.565555095672607421875);
            float _760 = 1.0 / _754;
            float _762 = _748 * _758;
            float _764 = _746 * _762;
            float _766 = fma(_764, _760, _746);
            float _768 = _766;
            _654 = _732;
            if (_724)
            {
                float _770 = -_766;
                float _772 = _770 + 1.57079637050628662109375;
                _768 = _772;
            }
            float _774 = _768;
            int _776 = as_type<int>(_774);
            if (!_726)
            {
                float _778 = -_774;
                float _780 = _778 + 3.1415927410125732421875;
                _776 = as_type<int>(_780);
            }
            int _782 = _776;
            if (!_744)
            {
                int _784 = _734 | _782;
                _654 = as_type<float>(_784);
            }
        }
    }
    float _786 = _654;
    float _788 = -_786;
    float _790 = _620 + _788;
    float _792 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _790 * 0.15915493667125701904296875;
    float _796 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _798 = _626 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _806 = fma(_804, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _808 = _560 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _812 = _212 * _538;
    float _814 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _816 = _794 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _826 = _562 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = -_166;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _832 = _820 * _810;
    float _834 = _354 * _538;
    float _836 = _794 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _812 * _812;
    float _842 = _822 * _824;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _846 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _496 * _830;
    float _850 = _372 * _538;
    float _852 = fma(_834, _834, _840);
    float _854 = _626 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _844 * _846;
    float _860 = _806 * _848;
    float _862 = _618 * _800;
    float _864 = _618 * _818;
    float _866 = _638 * _800;
    float _868 = _814 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _870 = _862 * _842;
    float _872 = _638 * _838;
    float _874 = _618 * _838;
    float _876 = fma(_850, _850, _852);
    float _878 = _838 * _800;
    float _880 = _540 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _638 * _818;
    float _886 = _818 * _800;
    float _888 = _866 * _842;
    float _890 = fma(_856, _872, _864);
    float _892 = fma(_856, _864, _872);
    float _894 = -_842;
    float _896 = _856 * _894;
    float _898 = -_884;
    float _900 = fma(_856, _874, _898);
    float _902 = rsqrt(_876);
    float _904 = -_874;
    float _906 = fma(_856, _884, _904);
    float _908 = fma(_878, _832, _896);
    float _910 = fma(_890, _832, _888);
    float _912 = fma(_900, _832, _870);
    float _914 = fma(_886, _858, _908);
    float _916 = fma(_906, _858, _910);
    float _918 = fma(_892, _858, _912);
    float _920 = -_882;
    float _922 = _920 + 1.0;
    float _924 = _468 + _914;
    float _926 = _868 + _916;
    float _928 = _470 + _918;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _932 = _930 != 0;
    float _934 = fma(_834, _860, _924);
    float _936 = fma(_812, _860, _926);
    float _938 = _834 * _902;
    float _940 = _812 * _902;
    float _942 = _850 * _902;
    float _944 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _946 = _936 + _944;
    float _948 = _938 * _922;
    float _950 = _940 * _922;
    float _952 = _942 * _596;
    float _954 = _938 * _596;
    float _956 = _940 * _596;
    float _958 = fma(_940, _950, _882);
    float _960 = fma(_940, _948, _952);
    float _962 = -_952;
    float _964 = fma(_940, _948, _962);
    float _966 = fma(_938, _948, _882);
    float _968 = -_956;
    float _970 = fma(_942, _948, _968);
    float _972 = fma(_942, _948, _956);
    float _974 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _976 = _934 + _974;
    float _978 = _958 * _946;
    float _980 = fma(_850, _860, _928);
    float _982 = fma(_942, _950, _954);
    float _984 = -_954;
    float _986 = fma(_942, _950, _984);
    float _988 = fma(_960, _976, _978);
    float _990 = _964 * _946;
    float _992 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _994 = _980 + _992;
    float _996 = _942 * _942;
    float _998 = _982 * _946;
    float _1000 = fma(_966, _976, _990);
    float _1002 = fma(_986, _994, _988);
    float _1004 = fma(_922, _996, _882);
    float _1006 = fma(_970, _976, _998);
    float _1008 = fma(_972, _994, _1000);
    float _1010 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1014 = fma(_1004, _994, _1006);
    float _1016 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1010);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1012);
    float _1022 = 0.0;
    float _1024 = _958;
    if (!_932)
    {
        _1022 = 0.0;
    }
    float _1026 = _1022;
    float _1028 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1016);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1018);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1028);
    float _1036 = _1030 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1038 = _1032 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1040 = _1034 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1044);
    float _1050 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1048);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1056 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1054 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1064 = _1056 + _1062;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_1064, _1064, _1066);
    float _1070 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1036;
    float _1074 = _1040;
    float _1076 = _1026;
    float _1078 = _1050;
    float _1080 = _1056;
    float _1082 = _1068;
    float _1084 = _1060;
    if (!_932)
    {
        _1072 = 0.0;
    }
    float _1086 = _1072;
    float _1088 = sqrt(_1068);
    float _1090 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1092 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1090);
    float _1094 = _1086;
    if (!_932)
    {
        _1074 = 0.0;
    }
    float _1096 = _1074;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1100 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1102 = !_932;
    float _1104 = _1096;
    float _1106 = _1088;
    if (!_1102)
    {
        float _1108 = -_868;
        float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = -_468;
        float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _1110 * _1110;
        float _1118 = fma(_1114, _1114, _1116);
        float _1120 = fma(_480, _480, _1118);
        float _1122 = rsqrt(_1120);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1126 = _1114 * _1124;
        float _1128 = _1110 * _1124;
        float _1130 = _480 * _1124;
        _1076 = _1128;
        _1104 = _1126;
        _1094 = _1130;
        _1078 = _1122;
    }
    float _1132 = _1076;
    float _1134 = _1104;
    float _1136 = _1094;
    float _1138 = _1078;
    float _1140 = _1138;
    float _1142 = _1134;
    if (!_1100)
    {
        _1140 = _1054;
    }
    float _1144 = _1140;
    float _1146 = _1144;
    if (!_1100)
    {
        _1024 = _1098;
    }
    float _1148 = _1024;
    bool _1150 = !_1100;
    float _1152 = _1148;
    if (!_1150)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1158 = _1088 + _1156;
        float _1160 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = rsqrt(_1068);
        float _1164 = _1158 * _1154;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = _1166 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1166 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = fma(_1170, _1160, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1178 = _1162 * _1176;
        float _1180 = _1174 + (-1.0);
        float _1182 = fma(_1064, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1184 = fma(_1060, _1178, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1186 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = fma(_1098, _1174, _1186);
        _1152 = _1188;
        _1080 = _1182;
        _1146 = _1184;
        _1106 = _1186;
    }
    float _1190 = _1152;
    float _1192 = _1080;
    float _1194 = _1146;
    float _1196 = _1106;
    float _1198 = _1132 + _1190;
    float _1200 = _1134 + _1192;
    float _1202 = _1136 + _1194;
    float _1204 = _468 + _1134;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1202 + _1214;
    float _1218 = _470 + _1136;
    float _1220 = _1208 * _1208;
    float _1222 = fma(_1212, _1212, _1220);
    float _1224 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1226 = fma(_1216, _1216, _1222);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1212 * _1232;
    float _1236 = _1216 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1222;
    float _1254 = _1196;
    float _1256 = _1250;
    float _1258 = _1232;
    bool _1260 = _1246;
    float _1262 = _1208;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (!_1246)
    {
        _1142 = _1238;
    }
    float _1268 = _1142;
    float _1270 = _1268;
    if (_1246)
    {
        float _1272 = rsqrt(_1242);
        _1254 = _1272;
    }
    float _1274 = _1254;
    float _1276 = _1274;
    if (_1246)
    {
        float _1278 = _1250 * _1266;
        _1256 = _1278;
    }
    float _1280 = _1256;
    if (_1246)
    {
        float _1282 = _1280 * 0.15915493667125701904296875;
        _1082 = _1282;
    }
    float _1284 = _1082;
    float _1286 = _1266;
    if (_1246)
    {
        float _1288 = _1284 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        _1286 = _1290;
    }
    float _1292 = _1286;
    float _1294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1296 = precise::max(0.0, _1294);
    float _1298 = _480;
    float _1300 = _1296;
    if (_1246)
    {
        float _1302 = _1284 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = -_1232;
    float _1310 = -_1296;
    float _1312 = fma(_1208, _1308, _1310);
    if (_1246)
    {
        float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    float _1318 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1320 = _1316;
    float _1322 = _1292;
    if (_1246)
    {
        float _1324 = fma(_1292, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1324;
    }
    float _1326 = _1084;
    float _1328 = _1326;
    if (!_1246)
    {
        _1320 = _1312;
    }
    float _1330 = _1320;
    float _1332 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1318);
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1246)
    {
        float _1338 = _1306 + (-1.0);
        _1322 = _1338;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1246)
    {
        float _1344 = _1274 * _1326;
        _1328 = _1344;
    }
    float _1346 = _1328;
    if (!_1246)
    {
        _1276 = _1234;
    }
    float _1348 = _1276;
    float _1350 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1352 = _1348;
    if (_1246)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1354;
    }
    float _1356 = _1258;
    if (_1246)
    {
        float _1358 = _1234 * _1346;
        _1352 = _1358;
    }
    float _1360 = _1352;
    if (!_1246)
    {
        _1342 = _1236;
    }
    float _1362 = _1342;
    float _1364 = _1362;
    if (_1246)
    {
        float _1366 = _1236 * _1346;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (_1246)
    {
        float _1370 = fma(_1312, _1306, _1356);
        _1334 = _1370;
    }
    float _1372 = _1334;
    if (_1246)
    {
        float _1374 = _1360 * _1360;
        _1270 = _1374;
    }
    float _1376 = _1270;
    if (!_1246)
    {
        _1336 = _1240;
    }
    float _1378 = _1336;
    float _1380 = _1378;
    if (_1246)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = fma(_1372, _1372, _1376);
    float _1390 = fma(_1204, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = _1388 + _1384;
    float _1398 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1400 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1392);
    float _1402 = floor(_1390);
    float _1404 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1398);
    float _1406 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1400);
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1404);
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1418 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1420 = rsqrt(_1396);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1426 = -_1412;
    float _1428 = _1426 + 1.0;
    float _1430 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1218, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1424);
    float _1436 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1418);
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1224, 1.0);
    float _1442 = abs(_1428);
    float _1444 = log2(_1442);
    float _1446 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1434);
    float _1448 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1420 * _1360;
    float _1452 = _1420 * _1372;
    float _1454 = _1420 * _1368;
    float _1456 = floor(_1432);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = -_1402;
    float _1462 = _1390 + _1460;
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1446);
    float _1466 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1458;
    float _1470 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = log2(_1440);
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1480 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = 1.0 / _1464;
    float _1492 = -_1456;
    float _1494 = _1432 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1500 = _1452 + 1.0;
    float _1502 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1498);
    float _1506 = exp2(_1472);
    float _1508 = _1474 * 0.693147182464599609375;
    float _1510 = fma(_1486, _1502, 1.570728778839111328125);
    float _1512 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = sqrt(_1484);
    float _1516 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1518 = _1504 * _1490;
    float _1520 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1516);
    float _1522 = fma(_1518, 0.5, 0.5);
    float _1524 = -_1452;
    float _1526 = fma(_1506, _1500, _1524);
    float _1528 = _1520 * _1490;
    float _1530 = fma(_1528, -0.5, 0.5);
    float _1532 = fma(_1526, 0.5, 0.5);
    float _1534 = _1514 * 0.636619746685028076171875;
    float2 _5559 = float2(_1462, _1494);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5559, float2(0.0), isnan(_5559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5559, float2(0.0), isnan(_5559)), level(0.0)).x;
    float _1538 = -_1510;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _5575 = float3(_1522, _1530, _1512);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5575, float3(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5575, float3(0.0), isnan(_5575)), level(0.0)).x;
    float3 _5586 = float3(_1522, _1530, _1512);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5586, float3(0.0), isnan(_5586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5586, float3(0.0), isnan(_5586)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5602 = float2(_1540, _1532);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5602, float2(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5602, float2(0.0), isnan(_5602)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1567 = int(_1565);
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1571 = _1569 != 0;
    float _1573 = -_166;
    float _1575 = _1573 + 1.0;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1579 = _1577 != 0;
    float _1581 = _868 + _1132;
    bool _1583 = _202 > 0.5;
    out.m_65.x = _1212;
    out.m_65.y = _1208;
    out.m_65.z = _1216;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1591 = int(_1589);
    float _1593 = in.m_55.x;
    float _1595 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1601 = _1504;
    float _1603 = _1520;
    if (_1571)
    {
        bool _1605 = _196 > 0.5;
        _1260 = _1605;
    }
    bool _1607 = _1260;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1611 = float(_1567);
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1617 = _1615 != 0;
    float _1619 = in.m_67.x;
    float _1621 = 1.0 / _1611;
    float _1623 = float(uint(_1591));
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1627 = _1625 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1629 = ~_1591;
    int _1631 = _1629 + 1;
    int _1633 = ~_1591;
    int _1635 = _1633 + 1;
    bool _1637 = !_1617;
    float _1639 = _1637 ? 1.2345600128173828125 : 1.0;
    float _1641 = 1.0 / _1623;
    bool _1643 = !_1617;
    float _1645 = _1643 ? _204 : _196;
    float _1647 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1649 = float(_1591);
    int _1651 = abs(_500);
    float _1653 = _122 * _1621;
    float _1655 = 1.0 / _1627;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.w = _1657;
    int _1659 = as_type<int>(_1641) + (-2);
    float _1661 = trunc(_1653);
    int _1663 = int(_1661);
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1669 = _122 * _1649;
    float _1671 = 1.0 / _1599;
    float _1673 = _1669 * _168;
    float _1675 = float(uint(_1663));
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1681 = as_type<float>(_1659) * _1675;
    float _1683 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1679);
    float _1685 = trunc(_1681);
    float _1687 = precise::max(_1685, 0.0);
    uint _1690 = uint(_1687);
    float _1692 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = trunc(_1673);
    int _1696 = int(_1694);
    int _1698 = _1631 * int(_1690);
    int _1700 = _1698 + _1663;
    float _1702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1704 = in.m_59.w;
    float _1706 = float(uint(_1700));
    float _1708 = as_type<float>(_1700);
    float _1710 = _1681;
    if (!_1571)
    {
        _1708 = _1593;
    }
    float _1712 = _1708;
    float _1714 = exp2(_1595);
    float _1716 = as_type<float>(_1659) * _1706;
    float _1718 = _1712;
    if (!_1571)
    {
        _1710 = _1712;
    }
    float _1720 = _1710;
    float _1722 = _1720;
    if (_1571)
    {
        _1718 = _1593;
    }
    float _1724 = _1718;
    int _1726 = _1583 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1728 = trunc(_1716);
    float _1730 = precise::max(_1728, 0.0);
    uint _1732 = uint(_1730);
    int _1734 = 0;
    if (_1571)
    {
        float _1736 = -_1724;
        float _1738 = _1736 + 1.0;
        _1734 = as_type<int>(_1738);
    }
    int _1740 = _1734;
    int _1742 = 0;
    if (_1579)
    {
        float _1744 = -_1724;
        float _1746 = _1744 + 1.0;
        _1742 = as_type<int>(_1746);
    }
    int _1748 = _1742;
    float _1750 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1571)
    {
        float _1752 = _1607 ? as_type<float>(_1740) : _1724;
        _1722 = _1752;
    }
    float _1754 = _1722;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    bool _1760 = _1704 > 0.5;
    int _1762 = _1760 ? as_type<int>(_1575) : as_type<int>(_166);
    int _1764 = int(_1690) + int(_1732);
    float _1766 = as_type<float>(_1732);
    if (!_1579)
    {
        _1766 = _1724;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (_1579)
    {
        float _1772 = _1583 ? as_type<float>(_1748) : _1724;
        _1770 = _1772;
    }
    float _1774 = _1770;
    int _1776 = _1635 * _1764;
    int _1778 = _1776 + _1663;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _1790 = uint(_1778) >= uint(_1591);
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1794 = _1792 != 0;
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1802 = _1800 != 0;
    float _1804 = _1587 ? as_type<float>(_1726) : _166;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1810 = _204 > 0.5;
    float _1812 = 1.0 / _1808;
    int _1814 = _1810 ? as_type<int>(_1575) : as_type<int>(_166);
    float _1816 = fma(_1647, _1804, -0.5);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1820 = _1802 ? as_type<float>(_1814) : _166;
    float _1822 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1824 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.5);
    bool _1832 = _1828 || _1830;
    float _1834 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1836 = _1786 ? as_type<float>(_1762) : _166;
    float _1838 = fma(_1822, -2.0, _1613);
    float _1840 = -_1818;
    float _1842 = fma(_1834, 2.0, _1840);
    float _1844 = fma(_1692, _1820, -0.5);
    bool _1846 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1848 = isnan(_194);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1858;
    bool _1862 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1864 = isnan(_194);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1882 = _1860 * _1671;
    float _1884 = _1645 * _1639;
    float _1886 = _1876 * _1655;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1890 = _194 + _1888;
    float _1892 = _1880 * _1812;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1896 = _194 + _1894;
    float _1898 = floor(_1884);
    float _1900 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1904 = _194 + _1902;
    bool _1906 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1908 = isnan(_194);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1856;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1892, _1904, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1924 = fma(_1882, _1896, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1926 = float(_1663);
    float _1928 = -_1916;
    float _1930 = _1928 + 1.0;
    int _1932 = ~_1764;
    int _1934 = _1932 + _1798;
    int _1936 = _1934 + 1;
    float _1938 = _1916 * _1920;
    bool _1940 = _1926 >= _1649;
    bool _1942 = isnan(_1926);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan(_1649);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1954 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1956 = isnan(_194);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    int _1966 = _1591 * _1936;
    int _1968 = _1966 + _1663;
    float _1970 = -_1898;
    float _1972 = _1884 + _1970;
    float _1974 = _1872 * _1930;
    float _1976 = trunc(_1950);
    int _1978 = int(_1976);
    bool _1980 = !_1782;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1952);
    bool _1986 = _1591 == 0;
    float _1988 = _1649 * _1972;
    float _1990 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1838);
    float _1992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1984);
    bool _1994 = !_1986;
    float _1996 = _1994 ? as_type<float>(_1968) : as_type<float>(0xffffffffu /* nan */);
    float _1998 = -_1872;
    float _2000 = _1998 + 1.0;
    int _2002 = _1591 + (-1);
    float _2004 = -_1990;
    float _2006 = fma(_1992, _1844, _2004);
    int _2008 = abs(_630);
    float _2010 = trunc(_1988);
    int _2012 = int(_2010);
    float _2014 = _1964 * _2000;
    int _2016 = as_type<int>(_1844);
    float _2018 = _1900;
    float _2020 = _1996;
    float _2022 = _1882;
    if (_1758)
    {
        float _2024 = -_1724;
        float _2026 = _2024 + 1.0;
        _2016 = as_type<int>(_2026);
    }
    int _2028 = _2016;
    int _2030 = abs(_1982);
    float _2032 = -_1964;
    float _2034 = _2032 + 1.0;
    int _2036 = ~_1978;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = _1900 * _2014;
    float _2044 = as_type<float>(_2028);
    if (!_1758)
    {
        _2018 = _1724;
    }
    float _2046 = _2018;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2050 = _2046;
    if (_1758)
    {
        float _2052 = _1810 ? as_type<float>(_2028) : _1724;
        _2050 = _2052;
    }
    float _2054 = _2050;
    int _2056 = as_type<int>(_1996) * _2040;
    if (_1617)
    {
        _2020 = _196;
    }
    float _2058 = _2020;
    float _2060 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2042);
    float _2062 = _2058;
    if (!_1617)
    {
        _2062 = _202;
    }
    float _2064 = _2062;
    int _2066 = _1978 * _2002;
    int _2068 = _2066 + _2056;
    int _2070 = abs(_606);
    float _2072 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2076 = _2068 * _2070;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2080 = abs(_634);
    int _2082 = _1696 * _2008;
    int _2084 = _2082 + _2076;
    int _2086 = _2012 * _2030;
    int _2088 = _2086 + _1663;
    float _2090 = -_2078;
    float _2092 = fma(_2074, 2.0, _2090);
    bool _2094 = _578 != 0.0;
    bool _2096 = isnan(_578);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = in.m_71.x;
    float _2106 = in.m_71.y;
    float _2108 = in.m_71.z;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2112 = -_122;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    float _2116 = fma(_1750, _2054, -0.5);
    float _2118 = as_type<float>(_2080);
    float _2120 = as_type<float>(_2084);
    if (!_1617)
    {
        _2022 = _204;
    }
    float _2122 = _2022;
    int _2124 = _2088 * _1651;
    int _2126 = _2124 + _2084;
    float _2128 = _2122;
    if (_1617)
    {
        _2128 = _196;
    }
    float _2130 = _2128;
    float _2132 = -_122;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2092);
    int _2136 = _2012 * _2080;
    int _2138 = _2136 + _2126;
    bool _2140 = _576 == 0.0;
    bool _2142 = !_2102;
    bool _2144 = _2140 && _2142;
    float _2146 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2110);
    float _2148 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2152 = float(uint(_2138));
    float _2154 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    bool _2156 = _580 == 0.0;
    bool _2158 = _2156 && _2144;
    float _2160 = -_2150;
    float _2162 = fma(_2148, 2.0, _2160);
    float _2164 = as_type<float>(_1659) * _2152;
    float _2166 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2168 = _2152;
    float _2170 = _2130;
    if (!_1617)
    {
        _2044 = _202;
    }
    float _2172 = _2044;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2176 = _2172;
    float _2178 = _2174;
    if (_1617)
    {
        _274 = _204;
    }
    float _2180 = _274;
    float _2182 = trunc(_2164);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2190 = _2180;
    if (_1617)
    {
        _2176 = _204;
    }
    float _2192 = _2176;
    float _2194 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2174);
    if (_1617)
    {
        _2168 = _204;
    }
    float _2196 = _2168;
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2188);
    float _2200 = _2196;
    if (_2158)
    {
        _2170 = _2104;
    }
    float _2202 = _2170;
    float _2204 = _2192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2206 = _2202;
    if (_2158)
    {
        _276 = _2106;
    }
    float _2208 = _276;
    float _2210 = _2208;
    if (!_1617)
    {
        _2200 = _196;
    }
    float _2212 = _2200;
    float _2214 = fma(_2204, -2.0, _1667);
    int _2216 = ~_1591;
    int _2218 = _2216 + 1;
    if (_2158)
    {
        _2190 = _2202;
    }
    float _2220 = _2190;
    float _2222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2214);
    float _2224 = _2220;
    if (!_2158)
    {
        _2206 = _2104;
    }
    float _2226 = _2206;
    float _2228 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_2158)
    {
        _2118 = _2208;
    }
    float _2230 = _2118;
    float _2232 = _2230;
    if (!_2158)
    {
        _2210 = _2106;
    }
    float _2234 = _2210;
    if (!_2158)
    {
        float _2236 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2226);
        _2224 = _2236;
    }
    float _2238 = _2224;
    float _2240 = float(uint(_2088));
    float _2242 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2158)
    {
        _2120 = _2108;
    }
    float _2244 = _2120;
    float _2246 = as_type<float>(_1659) * _2240;
    float _2248 = _2244;
    if (!_2158)
    {
        float _2250 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2234);
        _2232 = _2250;
    }
    float _2252 = _2232;
    int _2254 = _2218 * int(_2186);
    int _2256 = _2254 + _2138;
    float _2258 = fma(_1922, _1974, _2060);
    if (_2158)
    {
        _2178 = _2244;
    }
    float _2260 = _2178;
    float _2262 = trunc(_2246);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = _2260;
    if (!_2158)
    {
        _2248 = _2108;
    }
    float _2270 = _2248;
    float _2272 = fma(_2242, _1754, -0.5);
    float _2274 = float(uint(_2256));
    float _2276 = fma(_1924, _1938, _2258);
    int _2278 = ~_1591;
    int _2280 = _2278 + 1;
    float _2282 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2198);
    int _2284 = ~_1591;
    int _2286 = _2284 + 1;
    float _2288 = as_type<float>(_1659) * _2274;
    float _2290 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2194);
    float _2292 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2276);
    if (!_2158)
    {
        float _2294 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2270);
        _2268 = _2294;
    }
    float _2296 = _2268;
    float _2298 = trunc(_2288);
    float _2300 = precise::max(_2298, 0.0);
    uint _2302 = uint(_2300);
    float _2304 = fma(_2290, _2272, _2114);
    int _2306 = _2280 * int(_2266);
    int _2308 = _2306 + _2088;
    float _2310 = -_122;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2162);
    float _2314 = float(uint(_2308));
    float _2316 = fma(_2154, _1788, _2312);
    int _2318 = ~_1591;
    int _2320 = _2318 + 1;
    float _2322 = in.m_73.x;
    float _2324 = in.m_73.y;
    float _2326 = in.m_73.z;
    float _2328 = in.m_73.w;
    float _2330 = as_type<float>(_1659) * _2314;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2334 = int(_2186) + int(_2302);
    float _2336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1683);
    float _2338 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2072);
    float _2340 = trunc(_2330);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    float _2346 = fma(_2228, -2.0, _2332);
    int _2348 = _2320 * _2334;
    int _2350 = _2348 + _2138;
    float _2352 = fma(_2338, _2116, _2134);
    float _2354 = -_2222;
    float _2356 = fma(_2282, _2166, _2354);
    bool _2358 = uint(_2350) >= uint(_1591);
    float _2360 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2346);
    float _2362 = _2352 + 0.5;
    bool _2364 = !_2358;
    int _2366 = _2364 ? 0 : (-1);
    float _2368 = -_2360;
    float _2370 = fma(_2336, _1816, _2368);
    float _2372 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2376 = ~_2334;
    int _2378 = _2376 + _2366;
    int _2380 = _2378 + 1;
    float _2382 = _2326 * _2226;
    int _2384 = int(_2266) + int(_2344);
    float _2386 = _2322 * _2234;
    float _2388 = _2324 * _2270;
    int _2390 = _1591 * _2380;
    int _2392 = _2390 + _2138;
    float _2394 = -_2382;
    float _2396 = fma(_2322, _2270, _2394);
    float _2398 = -_2386;
    float _2400 = fma(_2324, _2226, _2398);
    float _2402 = -_2388;
    float _2404 = fma(_2326, _2234, _2402);
    bool _2406 = !_1986;
    int _2408 = _2406 ? _2392 : (-1);
    float _2410 = _2396 * _2328;
    float _2412 = _2316 + 0.5;
    float _2414 = _2006 + 0.5;
    int _2416 = _2408 >> 31;
    float _2418 = _2404 * _2328;
    float _2420 = _2304 + 0.5;
    float _2422 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    int _2424 = _2416 & 3;
    float _2426 = _2400 * _2328;
    float _2428 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2374);
    float _2430 = _2356 + 0.5;
    int _2432 = _2408 + _2424;
    float _2434 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2422);
    float _2436 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2428);
    int _2438 = _2432 >> 2;
    out.m_75.x = _2420;
    out.m_75.y = _2414;
    out.m_75.z = _2412;
    out.m_75.w = _2430;
    float _2440 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2442 = _2438 << 4;
    int _2444 = _2442 + 512;
    int _2446 = _2286 * _2384;
    int _2448 = _2446 + _2088;
    int _2450 = _2408 & 3;
    int _2452 = _2408 & 3;
    bool _2454 = _2452 != 0;
    float _2456 = _2370 + 0.5;
    bool _2458 = uint(_2450) > 1u;
    int _2460 = _2454 ? 0 : 1;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2464 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2466 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _2468 = uint(int(uint(_2444) >> uint(2)));
    uint _2470 = uint(int(uint(int(_2468)) >> uint(2)));
    int _2472 = int(_2468) & 3;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[int(_2470)][_2472];
    int _2476 = int(_2468) + 1;
    uint _2478 = uint(int(uint(_2476) >> uint(2)));
    int _2480 = _2476 & 3;
    float _2482 = (*spvDescriptorSet0.vp_c9)._m0[int(_2478)][_2480];
    float _2484 = 1.0 / _2464;
    float _2486 = _2440 + _2464;
    int _2488 = ~_2460;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2496 = _2492;
    if (!_2458)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = _2462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2508 = _2444 + 8;
    uint _2510 = uint(int(uint(_2508) >> uint(2)));
    uint _2512 = uint(int(uint(int(_2510)) >> uint(2)));
    int _2514 = int(_2510) & 3;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[int(_2512)][_2514];
    int _2518 = int(_2510) + 1;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    int _2522 = _2518 & 3;
    float _2524 = (*spvDescriptorSet0.vp_c9)._m0[int(_2520)][_2522];
    float _2526 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2292 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = uint(_2448) >= uint(_1591);
    out.m_77.x = _2362;
    out.m_77.y = _2456;
    bool _2532 = _2450 != 3;
    float _2534 = _862 * _2410;
    bool _2536 = !_2530;
    int _2538 = _2536 ? 0 : (-1);
    out.m_79.x = _2504;
    out.m_79.y = _2506;
    out.m_79.z = _2526;
    out.m_79.w = _2528;
    float _2540 = _2486 * _2484;
    float _2542 = _2540 * 0.5;
    bool _2544 = uint(_2450) >= 2u;
    float _2546 = _866 * _2410;
    int _2548 = ~_2384;
    int _2550 = _2548 + _2538;
    int _2552 = _2550 + 1;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2556 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2554);
    int _2558 = _2544 ? 0 : 1;
    float _2560 = _862 * _2324;
    float _2562 = fma(_890, _2418, _2546);
    int _2564 = _1591 * _2552;
    int _2566 = _2564 + _2088;
    float _2568 = -_2410;
    float _2570 = _856 * _2568;
    float _2572 = fma(_900, _2418, _2534);
    float _2574 = fma(_900, _2322, _2560);
    float _2576 = _862 * _2252;
    bool _2578 = !_2454;
    int _2580 = _2578 ? 0 : 1;
    float _2582 = fma(_878, _2418, _2570);
    bool _2584 = _2450 != 3;
    float _2586 = _866 * _2324;
    float _2588 = 1.0 / _2556;
    int _2590 = abs(_2502);
    float _2592 = _866 * _2252;
    int _2594 = ~_2558;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    float _2600 = fma(_890, _2322, _2586);
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = fma(_890, _2238, _2592);
    int _2610 = abs(_2580);
    float _2612 = -_2324;
    float _2614 = _856 * _2612;
    int _2616 = _2598;
    if (_2532)
    {
        int _2618 = ~_2558;
        int _2620 = _2618 + 1;
        _2616 = _2620;
    }
    int _2622 = _2616;
    float _2624 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2626 = ~_2610;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    float _2632 = fma(_878, _2322, _2614);
    int _2634 = abs(_2622);
    int _2636 = _2606 * as_type<int>(_2482);
    float _2638 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2624);
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2642 = _2588 * _2640;
    int _2644 = ~_2634;
    int _2646 = _2644 + 1;
    int _2648 = _2646 + 1;
    int _2650 = _2630 * as_type<int>(_2474);
    int _2652 = _2650 + _2636;
    bool _2654 = !_2584;
    int _2656 = _2654 ? 0 : (-1);
    float _2658 = abs(_2642);
    float _2660 = log2(_2658);
    bool _2662 = !_1794;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2648 * as_type<int>(_2516);
    int _2668 = _2666 + _2652;
    int _2670 = abs(_2656);
    float _2672 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2674 = fma(_886, _2426, _2582);
    float _2676 = fma(_906, _2426, _2562);
    float _2678 = fma(_892, _2426, _2572);
    int _2680 = abs(_2664);
    float _2682 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    int _2684 = ~_2670;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _1504 + _1464;
    int _2692 = ~_2680;
    int _2694 = _2692 + 1;
    int _2696 = _2694 + 1;
    float _2698 = _2682 + _1464;
    float _2700 = _1464 * 0.5;
    int _2702 = _2688 * as_type<int>(_2524);
    int _2704 = _2702 + _2668;
    float _2706 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_81.x = _2674;
    out.m_81.y = _2676;
    out.m_81.z = _2678;
    int _2708 = _2704 * _2696;
    float _2710 = fma(_886, _2326, _2632);
    float _2712 = exp2(_2706);
    bool _2714 = !_1986;
    int _2716 = _2714 ? _2566 : (-1);
    float _2718 = fma(_906, _2326, _2600);
    float _2720 = fma(_892, _2326, _2574);
    float _2722 = -_2252;
    float _2724 = _856 * _2722;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1520;
    out.gl_Position.z = _2682;
    out.gl_Position.w = _1464;
    int _2726 = _2716 * _2680;
    int _2728 = _2726 + _2708;
    float _2730 = _2698 * 0.5;
    float _2732 = _2690 * 0.5;
    float _2734 = fma(_1520, -0.5, _2700);
    out.m_83.x = _2710;
    out.m_83.y = _2718;
    out.m_83.z = _2720;
    float _2736 = float(_2728);
    float _2738 = fma(_900, _2238, _2576);
    out.m_85.x = _2732;
    out.m_85.y = _2734;
    out.m_85.z = _2730;
    out.m_85.w = _1464;
    float _2740 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2742 = precise::clamp(_2740, 0.0, 1.0);
    out.m_87.y = _2736;
    if (_1832)
    {
        _1601 = 1.0;
    }
    float _2744 = _1601;
    float _2746 = fma(_2742, -2.0, 3.0);
    float _2748 = _2742 * _2742;
    float _2750 = _2744;
    if (_1832)
    {
        _1603 = 1.0;
    }
    float _2752 = _1603;
    float _2754 = _2748 * _2746;
    float _2756 = fma(_878, _2238, _2724);
    bool _2758 = _2642 <= 8000.0;
    bool _2760 = isnan(_2642);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    float _2770 = -_2754;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2754);
    float _2776 = _2752;
    if (!_1832)
    {
        float _2778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2782 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2780;
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2784 * 6.283185482025146484375;
        float _2788 = cos(_2786);
        float _2790 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2792 = _2790 * 0.15915493667125701904296875;
        float _2794 = _2784 * 6.283185482025146484375;
        float _2796 = sin(_2794);
        float _2798 = 1.0 / _2788;
        float _2800 = _2792 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        float _2804 = _2796 * _2798;
        float _2806 = _2792 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        float _2810 = _2802 * _2804;
        float _2812 = 1.0 / _2782;
        float _2814 = 1.0 / _2810;
        float _2816 = _2808 * _2814;
        float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2820 = fma(_2642, _2816, _2818);
        float _2822 = _2820 * _2812;
        float _2824 = precise::clamp(_2822, 0.0, 1.0);
        _2776 = _2824;
        _1262 = _2812;
    }
    float _2826 = _2776;
    float _2828 = _1262;
    float _2830 = _2828;
    if (!_1832)
    {
        float _2832 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2834 = _2832 * 0.15915493667125701904296875;
        float _2836 = _2834 * 6.283185482025146484375;
        float _2838 = cos(_2836);
        float _2840 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2842 = _2840 * 0.15915493667125701904296875;
        float _2844 = _2834 * 6.283185482025146484375;
        float _2846 = sin(_2844);
        float _2848 = 1.0 / _2838;
        float _2850 = _2842 * 6.283185482025146484375;
        float _2852 = cos(_2850);
        float _2854 = _2846 * _2848;
        float _2856 = _2842 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2852 * _2854;
        float _2862 = 1.0 / _2860;
        float _2864 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2866 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2864;
        float _2868 = 1.0 / _2866;
        float _2870 = _2858 * _2862;
        float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2874 = fma(_2642, _2870, _2872);
        float _2876 = _2874 * _2868;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = -_2878;
        float _2882 = _2880 + 1.0;
        _2750 = _2882;
        _2830 = _2846;
    }
    float _2884 = _2750;
    float _2886 = _2830;
    float _2888 = _2768 * _2774;
    float _2890 = -_1714;
    float _2892 = _2890 + 1.0;
    float _2894 = -_1536;
    float _2896 = _2894 + 1.0;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2900 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2902 = fma(_886, _2296, _2756);
    float _2904 = fma(_906, _2296, _2608);
    float _2906 = _2896 * _2898;
    float _2908 = precise::clamp(_2906, 0.0, 1.0);
    float _2910 = _2900 * _1542;
    float _2912 = -_2900;
    float _2914 = _2912 + 1.0;
    float _2916 = fma(_892, _2296, _2738);
    float _2918 = -_2908;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2922 = _1553 * _2910;
    float _2924 = _1563 * _2910;
    float _2926 = _1553 * _2914;
    float _2928 = _2920 * _1619;
    float _2930 = fma(_1559, _2922, _1547);
    float _2932 = fma(_1561, _2922, _1549);
    float _2934 = fma(_1553, _2924, _1551);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2902;
    out.m_89.y = _2904;
    out.m_89.z = _2916;
    bool _2938 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2940 = isnan(_1230);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2946 = _2942 || _2944;
    float _2948 = _2826 * _2884;
    out.m_91.x = _2936;
    float _2950 = _2948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _2930;
    out.m_93.y = _2932;
    out.m_93.z = _2934;
    out.m_93.w = _2926;
    float _2952 = _2920;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2956 = _2886;
    float _2958 = _2928;
    float _2960 = _2922;
    float _2962 = _2914;
    if (!_2946)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2964 = _2952;
    float _2966 = _2964;
    float _2968 = _2964;
    if (!_2946)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2970 = _2954;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2946)
    {
        _2956 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2956;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2946)
    {
        _2958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2982 = _2958;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2946)
    {
        _2960 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2988 = _2960;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2946)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2994 = _2962;
    bool _2996 = !_2946;
    float _2998 = _2994;
    float _3000 = _2994;
    if (!_2996)
    {
        bool _3002 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3004 = isnan(_1230);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3014 = _1230 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3018 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3024 = 1.0 / _3018;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3042 = _3014 * _3024;
            float _3044 = precise::clamp(_3042, 0.0, 1.0);
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3050 = fma(_3044, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3052 = fma(_3044, _3048, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3054 = fma(_3044, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3056 = fma(_3044, _3032, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3058 = fma(_3044, _3036, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3060 = fma(_3044, _3040, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2974 = _3054;
            _2992 = _3058;
            _2968 = _3050;
            _2986 = _3056;
            _2980 = _3052;
            _3000 = _3060;
            _3062 = true;
        }
        else
        {
            bool _3064 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3066 = isnan(_1230);
            bool _3068 = _3064 || _3066;
            bool _3070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3072 = _3068 || _3070;
            if (!_3072)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3074 = _2966;
            _2968 = _3074;
            if (!_3072)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3076 = _2972;
            _2974 = _3076;
            if (!_3072)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3078 = _2978;
            _2980 = _3078;
            if (!_3072)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3080 = _2984;
            _2986 = _3080;
            if (!_3072)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3082 = _2990;
            _2992 = _3082;
            if (!_3072)
            {
                _2998 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3084 = _2998;
            bool _3086 = !_3072;
            _3000 = _3084;
            if (!_3086)
            {
                bool _3088 = _1230 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3090 = isnan(_1230);
                bool _3092 = _3088 || _3090;
                bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3096 = _3092 || _3094;
                if (!_3096)
                {
                    float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3100 = _1230 + _3098;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3102;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3110 = 1.0 / _3104;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3128 = _3100 * _3110;
                    float _3130 = precise::clamp(_3128, 0.0, 1.0);
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3136 = fma(_3130, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3138 = fma(_3130, _3134, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3140 = fma(_3130, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3142 = fma(_3130, _3118, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3144 = fma(_3130, _3122, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3146 = fma(_3130, _3126, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2974 = _3140;
                    _2992 = _3144;
                    _2968 = _3136;
                    _2986 = _3142;
                    _2980 = _3138;
                    _3000 = _3146;
                    _3062 = true;
                }
                else
                {
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3000 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3062 = false;
    float _3148 = _2974;
    float _3150 = _2992;
    float _3152 = _2968;
    float _3154 = _2986;
    float _3156 = _2980;
    float _3158 = _3000;
    float _3160 = fma(_2904, -0.5, 0.5);
    float _3162 = precise::clamp(_3160, 0.0, 1.0);
    float _3164 = -_3148;
    float _3166 = _3164 + _3150;
    float _3168 = _2950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3170 = -_3152;
    float _3172 = _3170 + _3154;
    out.m_95.x = 0.0;
    float _3174 = fma(_3162, _3166, _3148);
    float _3176 = fma(_3162, _3172, _3152);
    out.m_53.x = _3168;
    float _3178 = -_3156;
    float _3180 = _3178 + _3158;
    float _3182 = _3174 * 0.586610972881317138671875;
    bool _3184 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3186 = fma(_3162, _3180, _3156);
    float _3188 = fma(_3176, 0.298911988735198974609375, _3182);
    bool _3190 = _2826 > 0.0;
    bool _3192 = isnan(_2826);
    bool _3194 = _3190 || _3192;
    bool _3196 = isnan(0.0);
    bool _3198 = _3194 || _3196;
    float _3200 = fma(_3186, 0.114477999508380889892578125, _3188);
    bool _3202 = _2884 <= 0.0;
    bool _3204 = !_3198;
    bool _3206 = _3202 || _3204;
    float _3208 = -_3200;
    float _3210 = _3176 + _3208;
    float _3212 = -_3200;
    float _3214 = _3174 + _3212;
    float _3216 = -_3200;
    float _3218 = _3186 + _3216;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3222 = fma(_3214, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    float _3224 = fma(_3218, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3200);
    bool _3226 = !_3184;
    if (!_3226)
    {
        float _3228 = -_1198;
        float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3232 = -_1200;
        float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3236 = -_1202;
        float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3240 = _3230 * _3230;
        float _3242 = fma(_3234, _3234, _3240);
        float _3244 = fma(_3238, _3238, _3242);
        float _3246 = sqrt(_3244);
        float _3248 = rsqrt(_3244);
        float _3250 = -_3246;
        float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3256 = precise::clamp(_3254, 0.0, 1.0);
        float _3258 = _3234 * _3248;
        float _3260 = _3230 * _3248;
        float _3262 = abs(_3256);
        float _3264 = log2(_3262);
        float _3266 = _3238 * _3248;
        float _3268 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3270 = _2904 * _3260;
        float _3272 = -_3260;
        float _3274 = -_3268;
        float _3276 = fma(_3272, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3274);
        float _3278 = fma(_2902, _3258, _3270);
        float _3280 = -_3266;
        float _3282 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3276);
        float _3284 = fma(_2916, _3266, _3278);
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3290 = _3282 + _3288;
        float _3292 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3296 = precise::clamp(_3294, 0.0, 1.0);
        float _3298 = exp2(_3292);
        float _3300 = _3298 * _3296;
        float _3302 = _3286 * _3300;
        float _3304 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3306 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3304;
        out.m_95.y = _3306;
        out.m_95.z = _3308;
    }
    out.m_97.x = _3220;
    out.m_97.y = _3222;
    out.m_97.z = _3224;
    if (!_3206)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3310 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3310;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

