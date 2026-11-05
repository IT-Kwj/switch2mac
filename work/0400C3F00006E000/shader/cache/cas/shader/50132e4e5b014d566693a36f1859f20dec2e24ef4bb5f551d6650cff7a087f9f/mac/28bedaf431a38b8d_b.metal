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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_53 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_108);
        out.gl_Position.z = _2163;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    float _114 = float(_94);
    float _116 = -_112;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_112);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    bool _130 = _118 >= _114;
    bool _132 = !_128;
    bool _134 = _130 || _132;
    float _136 = _112;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2227 = as_type<float>(_142);
        out.gl_Position.z = _2227;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    float _150 = 1.0 / _114;
    float _152 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_53.y;
    float _156 = in.m_55.w;
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = _118 * _150;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = abs(_144);
    float _172 = abs(_148);
    float _174 = precise::max(_170, _172);
    bool _176 = _174 >= 16.0;
    float _178 = fma(_162, 1.25, 0.75);
    float _180 = -_148;
    float _182 = fma(_178, _148, _180);
    float _184 = -_144;
    float _186 = fma(_178, _144, _184);
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _198 = _148;
    float _200 = _144;
    float _202 = 1.25;
    float _204 = _152;
    if (_176)
    {
        float _206 = _148 * 0.0625;
        _198 = _206;
    }
    float _208 = _198;
    if (_176)
    {
        float _210 = _144 * 0.0625;
        _200 = _210;
    }
    float _212 = _200;
    bool _214 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.0);
    bool _222 = _218 || _220;
    float _224 = abs(_208);
    bool _226 = _224 != 0.0;
    bool _228 = isnan(_224);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = abs(_212);
    bool _238 = _236 == 0.0;
    float _240 = abs(_212);
    bool _242 = _240 == 0.0;
    bool _244 = !_234;
    bool _246 = _242 && _244;
    float _248 = 0.0;
    if (!_222)
    {
        float _250 = _152 * _152;
        float _252 = _250 * 0.5;
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_222)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _256 = _262;
    }
    float _264 = _256;
    if (!_222)
    {
        float _266 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _266;
    }
    float _268 = _258;
    bool _270 = false;
    float _272 = _268;
    if (_246)
    {
        bool _274 = as_type<int>(_212) >= 0;
        _270 = _274;
    }
    bool _276 = _270;
    int _278 = 0;
    int _280 = _276 ? (-1) : 0;
    if (_246)
    {
        int _282 = _276 ? 0 : 1078530011;
        _278 = _282;
    }
    int _284 = _278;
    bool _286 = !_222;
    float _288 = 0.0;
    int _290 = _284;
    float _292 = _154;
    float _294 = _166;
    if (!_286)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _152 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _152);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _314;
        _288 = _308;
        _272 = _324;
    }
    float _326 = _202;
    float _328 = _288;
    float _330 = _272;
    bool _332 = !_222;
    float _334 = _326;
    float _336 = _328;
    if (!_332)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _152 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _334 = _344;
        _204 = _356;
    }
    float _358 = _334;
    float _360 = _204;
    float _362 = _358;
    if (!_222)
    {
        _336 = _118;
    }
    float _364 = _336;
    float _366 = _364;
    if (!_222)
    {
        float _368 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _368;
    }
    float _370 = _362;
    float _372 = _370;
    if (_246)
    {
        int _374 = int(0x80000000) & as_type<int>(_208);
        int _376 = _284 | _374;
        _290 = _376;
    }
    int _378 = _290;
    bool _380 = !_222;
    int _382 = _378;
    float _384 = as_type<float>(_378);
    if (!_380)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = _118 * _388;
        float _398 = exp2(_396);
        float _400 = _394 * 0.693147182464599609375;
        float _402 = 1.0 / _400;
        float _404 = 1.0 / _392;
        float _406 = _398 + (-1.0);
        float _408 = -_406;
        float _410 = fma(_408, _402, _118);
        float _412 = _410 * _404;
        float _414 = _412 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _372 = _414;
    }
    float _416 = _372;
    bool _418 = !_222;
    if (!_418)
    {
        float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = log2(_420);
        float _424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _426 = _424 + 1.0;
        float _428 = 1.0 / _426;
        float _430 = _118 * _422;
        float _432 = exp2(_430);
        float _434 = -_432;
        float _436 = _434 + 1.0;
        float _438 = _436 * _428;
        _366 = _438;
    }
    float _440 = _366;
    bool _442 = !_234;
    bool _444 = _442 && _238;
    if (!_444)
    {
        float _446 = abs(_208);
        bool _448 = _446 != as_type<float>(0x7f800000u /* inf */);
        bool _450 = isnan(_446);
        bool _452 = _448 || _450;
        bool _454 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _456 = _452 || _454;
        float _458 = abs(_212);
        bool _460 = _458 == as_type<float>(0x7f800000u /* inf */);
        float _462 = abs(_212);
        bool _464 = _462 == as_type<float>(0x7f800000u /* inf */);
        bool _466 = !_456;
        bool _468 = _464 && _466;
        if (_468)
        {
            bool _470 = as_type<int>(_212) >= 0;
            _280 = _470 ? (-1) : 0;
        }
        int _472 = _280;
        if (_468)
        {
            _382 = 1075235812;
        }
        int _474 = _382;
        int _476 = _474;
        if (_468)
        {
            int _478 = ~_472;
            int _480 = (_478 != 0) ? _474 : 1061752795;
            _476 = _480;
        }
        int _482 = _476;
        float _484 = as_type<float>(_482);
        if (_468)
        {
            int _486 = int(0x80000000) & as_type<int>(_208);
            int _488 = _482 | _486;
            _484 = as_type<float>(_488);
        }
        float _490 = _484;
        bool _492 = !_456;
        bool _494 = _492 && _460;
        _384 = _490;
        if (!_494)
        {
            float _496 = abs(_212);
            float _498 = abs(_208);
            float _500 = precise::max(_496, _498);
            float _502 = abs(_212);
            float _504 = abs(_208);
            float _506 = _502 + _504;
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::min(_508, _510);
            float _514 = 1.0 / _500;
            float _516 = abs(_208);
            float _518 = abs(_212);
            bool _520 = _516 > _518;
            bool _522 = as_type<int>(_212) >= 0;
            bool _524 = _506 > as_type<float>(0x7f800000u /* inf */);
            bool _526 = isnan(_506);
            bool _528 = _524 || _526;
            bool _530 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _532 = _528 || _530;
            float _534 = _512 * _514;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = fma(_536, _544, -6.565555095672607421875);
            float _548 = 1.0 / _542;
            float _550 = _536 * _546;
            float _552 = _534 * _550;
            float _554 = fma(_552, _548, _534);
            int _556 = as_type<int>(_208) & int(0x80000000);
            float _558 = _554;
            _384 = _506;
            if (_520)
            {
                float _560 = -_554;
                float _562 = _560 + 1.57079637050628662109375;
                _558 = _562;
            }
            float _564 = _558;
            int _566 = as_type<int>(_564);
            if (!_522)
            {
                float _568 = -_564;
                float _570 = _568 + 3.1415927410125732421875;
                _566 = as_type<int>(_570);
            }
            int _572 = _566;
            if (!_532)
            {
                int _574 = _556 | _572;
                _384 = as_type<float>(_574);
            }
        }
    }
    float _576 = _384;
    float _578 = in.m_59.w;
    float _580 = -_154;
    float _582 = _580 + 1.0;
    bool _584 = _160 > 0.5;
    float _586 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = in.m_44.x;
    float _590 = in.m_44.y;
    float _592 = in.m_44.z;
    float _594 = _188 * _188;
    float _596 = in.m_61.x;
    float _598 = in.m_61.y;
    float _600 = in.m_61.z;
    int _602 = _584 ? as_type<int>(_582) : as_type<int>(_154);
    float _604 = _162 * 3.1415927410125732421875;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _608 = _606 != 0;
    float _610 = in.m_63.x;
    float _612 = in.m_63.y;
    float _614 = in.m_63.z;
    float _616 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    float _622 = _576 + 3.1415927410125732421875;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _626 = _624 != 0;
    float _628 = _604 * 0.15915493667125701904296875;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _632 = _630 != 0;
    float _634 = _622 * 0.15915493667125701904296875;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    float _640 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _642 = fma(_360, _166, _616);
    bool _644 = _156 > 0.5;
    float _646 = _628 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(_360, _164, _640);
    float _652 = fma(_360, _168, _586);
    float _654 = fma(_642, _578, _590);
    float _656 = fma(_650, _578, _588);
    float _658 = fma(_652, _578, _592);
    float _660 = _190 * _190;
    float _662 = _654 * _190;
    float _664 = _654 * _598;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _668 = fma(_598, _598, _660);
    float _670 = fma(_656, _188, _662);
    float _672 = _654 * _612;
    float _674 = fma(_656, _596, _664);
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _678 = fma(_658, _192, _670);
    float _680 = fma(_656, _610, _672);
    float _682 = fma(_658, _600, _674);
    float _684 = fma(_612, _612, _668);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = _676 * 6.283185482025146484375;
    float _690 = _676 * 12.0;
    float _692 = fma(_658, _614, _680);
    float _694 = _676 * 6.0;
    float _696 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _700 = _686 + _698;
    float _702 = fma(_576, 4.0, _690);
    float _704 = fma(_596, _596, _594);
    float _706 = -_694;
    float _708 = fma(_576, 3.0, _706);
    float _710 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _714 = _696 + _712;
    float _716 = _700 * _700;
    float _718 = _702 * 0.15915493667125701904296875;
    float _720 = fma(_610, _610, _704);
    float _722 = 0.0;
    bool _724 = _626;
    float _726 = _720;
    float _728 = _684;
    if (_620)
    {
        float _730 = in.m_55.x;
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _708 * 0.15915493667125701904296875;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _710 + _736;
    float _740 = fma(_714, _714, _716);
    float _742 = sqrt(_720);
    float _744 = _688 * 0.15915493667125701904296875;
    float _746 = fma(_738, _738, _740);
    float _748 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _750 = _192 * _192;
    float _752 = in.m_59.x;
    float _754 = in.m_59.y;
    float _756 = in.m_59.z;
    float _758 = _718 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = 0.0 + _648;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma(_600, _600, _750);
    float _770 = -_146;
    float _772 = fma(_764, _146, _770);
    float _774 = _734 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _784 = rsqrt(_746);
    float _786 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _788 = _744 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _760 + _776;
    float _794 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = sqrt(_684);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _808 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _810 = -_806;
    float _812 = fma(_748, 2.0, _810);
    float _814 = _626 ? as_type<float>(_602) : _154;
    float _816 = fma(_808, -2.0, _766);
    float _818 = _772;
    float _820 = _778;
    float _822 = _814;
    if (_638)
    {
        float _824 = _644 ? _582 : _154;
        _292 = _824;
    }
    float _826 = _292;
    float _828 = _634 * 6.283185482025146484375;
    float _830 = sin(_828);
    bool _832 = _742 > 0.0;
    float _834 = _700 * _784;
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _816);
    int _838 = as_type<int>(_836);
    if (_620)
    {
        bool _840 = _732 > 0.5;
        _724 = _840;
    }
    bool _842 = _724;
    float _844 = fma(_614, _614, _768);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _848 = _846 + 2.0;
    float _850 = fma(_792, 0.25, 0.5);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    bool _856 = _804 > 0.0;
    float _858 = fma(_790, 0.10000002384185791015625, 1.0);
    float _860 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _862 = _714 * _784;
    float _864 = _854 * _854;
    float _866 = _738 * _784;
    float _868 = _700;
    float _870 = _804;
    bool _872 = _856;
    if (_832)
    {
        float _874 = rsqrt(_720);
        _868 = _874;
    }
    float _876 = _868;
    float _878 = -_862;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _882 = fma(_830, 0.5, 0.5);
    float _884 = -_866;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    if (!_832)
    {
        _870 = 0.0;
    }
    float _888 = _870;
    float _890 = fma(_880, _880, _864);
    float _892 = _882 * _860;
    float _894 = _888;
    float _896 = _892;
    if (!_832)
    {
        _818 = 0.0;
    }
    float _898 = _818;
    float _900 = sqrt(_844);
    float _902 = fma(_886, _886, _890);
    float _904 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _906 = _898;
    if (!_832)
    {
        _726 = 0.0;
    }
    float _908 = _726;
    float _910 = _908;
    if (!_856)
    {
        _820 = 0.0;
    }
    float _912 = _820;
    float _914 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _916 = _882;
    float _918 = _912;
    if (_856)
    {
        float _920 = rsqrt(_684);
        _916 = _920;
    }
    float _922 = _916;
    if (_832)
    {
        float _924 = _876 * _596;
        _894 = _924;
    }
    float _926 = _894;
    if (_832)
    {
        float _928 = _876 * _188;
        _910 = _928;
    }
    float _930 = _910;
    if (_832)
    {
        float _932 = _876 * _610;
        _906 = _932;
    }
    float _934 = _906;
    float _936 = _892 * _904;
    if (!_856)
    {
        _896 = 0.0;
    }
    float _938 = _896;
    float _940 = _858;
    float _942 = _938;
    if (_632)
    {
        float _944 = in.m_55.z;
        _940 = _944;
    }
    float _946 = _940;
    float _948 = sqrt(_902);
    bool _950 = _900 > 0.0;
    float _952 = fma(_936, _914, 1.0);
    if (!_856)
    {
        _728 = 0.0;
    }
    float _954 = _728;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _958 = _954;
    if (_856)
    {
        float _960 = _922 * _598;
        _958 = _960;
    }
    float _962 = _958;
    if (_856)
    {
        float _964 = _922 * _190;
        _918 = _964;
    }
    float _966 = _918;
    if (_856)
    {
        float _968 = _922 * _612;
        _942 = _968;
    }
    float _970 = _942;
    float _972 = _196 * _952;
    float _974 = _194 * _952;
    float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    float _980 = _784 * _948;
    float _982 = in.m_53.x;
    float _984 = _800 * _980;
    float _986 = _914;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _990 = _974;
    float _992 = _982;
    if (_950)
    {
        float _994 = rsqrt(_844);
        _986 = _994;
    }
    float _996 = _986;
    float _998 = _798 * _980;
    float _1000 = _802 * _980;
    float _1002 = _984 * _956;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1006 = _998 * _978;
    float _1008 = _1002 * _962;
    float _1010 = _1000 * _1004;
    float _1012 = _844;
    float _1014 = _1000;
    float _1016 = _1008;
    if (!_608)
    {
        float _1018 = in.m_55.z;
        _1012 = _1018;
    }
    float _1020 = _1012;
    if (!_950)
    {
        _1014 = 0.0;
    }
    float _1022 = _1014;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1002 * _970;
    float _1028 = fma(_1006, _926, _1008);
    float _1030 = _1022;
    float _1032 = _1026;
    if (!_950)
    {
        _1016 = 0.0;
    }
    float _1034 = _1016;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1038 = fma(_1006, _934, _1026);
    float _1040 = _1034;
    if (_950)
    {
        float _1042 = _996 * _600;
        _1030 = _1042;
    }
    float _1044 = _1030;
    if (_950)
    {
        float _1046 = _996 * _614;
        _1040 = _1046;
    }
    float _1048 = _1040;
    if (!_608)
    {
        _1032 = _160;
    }
    float _1050 = _1032;
    float _1052 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    float _1054 = fma(_1010, _1044, _1028);
    float _1056 = fma(_1010, _1048, _1038);
    float _1058 = _976 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1060 = _1050;
    if (_608)
    {
        _1060 = _158;
    }
    float _1062 = _1060;
    float _1064 = _696 + _1054;
    float _1066 = _710 + _1056;
    float _1068 = fma(_1058, _814, -0.5);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1066 + _1074;
    float _1078 = _1066;
    if (_632)
    {
        bool _1080 = _946 > 0.5;
        _872 = _1080;
    }
    bool _1082 = _872;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1086 = _1072 * _1072;
    float _1088 = _1076 * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1092 = _1020;
    float _1094 = _1086;
    float _1096 = _1088;
    if (!_608)
    {
        _822 = _1020;
    }
    float _1098 = _822;
    float _1100 = _1002 * _966;
    float _1102 = _1086 + _1088;
    float _1104 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1090);
    float _1106 = _1098;
    int _1108 = as_type<int>(_1100);
    if (_608)
    {
        _1106 = _160;
    }
    float _1110 = _1106;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_608)
    {
        _1092 = _160;
    }
    float _1114 = _1092;
    float _1116 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    float _1118 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    float _1120 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1122 = fma(_1006, _930, _1100);
    float _1124 = -_836;
    float _1126 = fma(_1116, _1068, _1124);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1130 = sqrt(_1102);
    if (_620)
    {
        float _1132 = -_982;
        float _1134 = _1132 + 1.0;
        _838 = as_type<int>(_1134);
    }
    int _1136 = _838;
    if (!_950)
    {
        _988 = 0.0;
    }
    float _1138 = _988;
    float _1140 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1138;
    if (_950)
    {
        float _1144 = _996 * _192;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_632)
    {
        float _1148 = -_982;
        float _1150 = _1148 + 1.0;
        _1108 = as_type<int>(_1150);
    }
    int _1152 = _1108;
    if (!_620)
    {
        _990 = _982;
    }
    float _1154 = _990;
    float _1156 = fma(_1140, _826, -0.5);
    float _1158 = _1154;
    if (_620)
    {
        float _1160 = _842 ? as_type<float>(_1136) : _982;
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = fma(_1010, _1146, _1122);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1168 = _1164;
    if (_632)
    {
        float _1170 = _1082 ? as_type<float>(_1152) : _982;
        _992 = _1170;
    }
    float _1172 = _992;
    float _1174 = -_782;
    float _1176 = fma(_1120, 2.0, _1174);
    float _1178 = _686 + _1164;
    float _1180 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1128);
    float _1182 = fma(_1166, _1162, -0.5);
    bool _1184 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1178;
    if (!_1184)
    {
        _1168 = _1064;
    }
    float _1188 = _1168;
    bool _1190 = !_1184;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1130 + _1196;
        float _1200 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = rsqrt(_1102);
        float _1204 = _1198 * _1194;
        float _1206 = _1204 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = cos(_1212);
        float _1216 = fma(_1210, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = _1202 * _1216;
        float _1220 = fma(_1072, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1222 = _1214 + (-1.0);
        float _1224 = fma(_1076, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1228 = _1220 + _1226;
        float _1230 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1234 = _1224 + _1232;
        float _1236 = _1228 * _1228;
        float _1238 = fma(_1178, _1214, _1230);
        float _1240 = _1234 * _1234;
        _1186 = _1238;
        _1094 = _1236;
        _1096 = _1240;
        _1192 = _1220;
        _1078 = _1224;
    }
    float _1242 = _1186;
    float _1244 = _1094;
    float _1246 = _1096;
    float _1248 = _1192;
    float _1250 = _1078;
    float _1252 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1052);
    float _1256 = -_118;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1242 + _1260;
    float _1264 = fma(_1252, _1172, -0.5);
    float _1266 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1118);
    float _1268 = fma(_1254, _1182, _1258);
    float _1270 = -_118;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1278 = fma(_1262, _1262, _1244);
    float _1280 = fma(_1266, _1264, _1272);
    float _1282 = fma(_1276, -2.0, _1274);
    float _1284 = _1278 + _1246;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1290 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1282);
    float _1292 = sqrt(_1284);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = -_1290;
    float _1298 = fma(_1288, _1156, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1306 = _1126 + 0.5;
    float _1308 = _1268 + 0.5;
    float _1310 = _1280 + 0.5;
    float _1312 = _1298 + 0.5;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1316 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_65.x = _1308;
    out.m_65.y = _1306;
    out.m_65.z = _1310;
    out.m_65.w = _1312;
    bool _1328 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1292);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1316;
    out.m_69.y = _1318;
    out.m_69.z = _1320;
    out.m_69.w = _1314;
    out.m_71.x = _1340;
    out.m_71.y = _1342;
    out.m_71.z = _1294;
    out.m_71.w = _1338;
    float _1344 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1346 = fma(_440, _166, _1322);
    float _1348 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1350 = fma(_440, _164, _1344);
    float _1352 = -_1346;
    float _1354 = _642 + _1352;
    float _1356 = fma(_440, _168, _1348);
    float _1358 = -_1350;
    float _1360 = _650 + _1358;
    float _1362 = _1354 * _598;
    float _1364 = _1354 * _190;
    float _1366 = _1354 * _612;
    float _1368 = -_1356;
    float _1370 = _652 + _1368;
    float _1372 = fma(_1360, _596, _1362);
    float _1374 = fma(_1360, _188, _1364);
    float _1376 = fma(_1360, _610, _1366);
    float _1378 = fma(_1370, _600, _1372);
    float _1380 = fma(_1370, _192, _1374);
    float _1382 = fma(_1370, _614, _1376);
    float _1384 = _1376;
    float _1386 = _1306;
    float _1388 = _1310;
    float _1390 = _1382;
    float _1392 = _1380;
    float _1394 = _1378;
    float _1396 = _1382;
    if (!_1336)
    {
        _1384 = 1.0;
    }
    float _1398 = _1384;
    bool _1400 = !_1336;
    float _1402 = _1398;
    if (!_1400)
    {
        bool _1404 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1406 = isnan(_1292);
        bool _1408 = _1404 || _1406;
        bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1412 = _1408 || _1410;
        if (!_1412)
        {
            float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1416 = _1292 + _1414;
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1426 = 1.0 / _1420;
            float _1428 = _1416 * _1426;
            float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1402 = _1430;
            _1432 = true;
        }
        else
        {
            bool _1434 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1436 = isnan(_1292);
            bool _1438 = _1434 || _1436;
            bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1442 = _1438 || _1440;
            if (!_1442)
            {
                float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1446 = _1292 + _1444;
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1456 = 1.0 / _1450;
                float _1458 = _1446 * _1456;
                float _1460 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1402 = _1460;
                _1432 = true;
            }
            else
            {
                _1402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1432 = false;
    float _1462 = _1402;
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1466 = _1242 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1470 = _1248 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1474 = _1250 + _1472;
    float _1476 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1474, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = -_686;
    float _1484 = _1482 + _1476;
    float _1486 = -_696;
    float _1488 = _1486 + _1478;
    float _1490 = -_710;
    float _1492 = _1490 + _1480;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > 0.0;
    bool _1504 = !_1502;
    float _1506 = _1476;
    float _1508 = _1478;
    float _1510 = _1480;
    if (!_1504)
    {
        bool _1512 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1514 = _1500;
        if (_1512)
        {
            float _1516 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1514 = _1516;
        }
        float _1518 = _1514;
        float _1520 = _1518;
        if (_1512)
        {
            float _1522 = _1378 * _1518;
            _1386 = _1522;
        }
        float _1524 = _1386;
        float _1526 = _1524;
        if (_1512)
        {
            float _1528 = _1380 * _1518;
            _1388 = _1528;
        }
        float _1530 = _1388;
        float _1532 = _1530;
        if (_1512)
        {
            float _1534 = _1382 * _1518;
            _1520 = _1534;
        }
        float _1536 = _1520;
        float _1538 = _1536;
        if (!_1512)
        {
            float _1540 = _118 + 1.0;
            float _1542 = _1540;
            if (!_222)
            {
                float _1544 = _1540 * _1540;
                float _1546 = _1544 * 0.5;
                _1390 = _1546;
            }
            float _1548 = _1390;
            float _1550 = _1548;
            if (!_222)
            {
                float _1552 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1550 = _1552;
            }
            float _1554 = _1550;
            bool _1556 = !_222;
            float _1558 = _1554;
            if (!_1556)
            {
                float _1560 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1562 = log2(_1560);
                float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1566 = _1564 + 1.0;
                float _1568 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1570 = _1562 * _1540;
                float _1572 = 1.0 / _1566;
                float _1574 = _1568 * 0.693147182464599609375;
                float _1576 = exp2(_1570);
                float _1578 = 1.0 / _1574;
                float _1580 = _1576 + (-1.0);
                float _1582 = -_1580;
                float _1584 = fma(_1582, _1578, _1540);
                float _1586 = _1584 * _1572;
                float _1588 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1558 = _1588;
            }
            float _1590 = _1558;
            float _1592 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1594 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1596 = !_222;
            if (!_1596)
            {
                float _1598 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1600 = log2(_1598);
                float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1604 = _1602 + 1.0;
                float _1606 = 1.0 / _1604;
                float _1608 = _1600 * _1540;
                float _1610 = exp2(_1608);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                float _1616 = _1614 * _1606;
                _1542 = _1616;
            }
            float _1618 = _1542;
            float _1620 = fma(_1618, _166, _1594);
            float _1622 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1624 = fma(_1618, _164, _1592);
            float _1626 = -_1346;
            float _1628 = _1626 + _1620;
            float _1630 = fma(_1618, _168, _1622);
            float _1632 = -_1350;
            float _1634 = _1632 + _1624;
            float _1636 = _1628 * _598;
            float _1638 = _1628 * _190;
            float _1640 = _1628 * _612;
            float _1642 = -_1356;
            float _1644 = _1642 + _1630;
            float _1646 = fma(_1634, _596, _1636);
            float _1648 = fma(_1634, _188, _1638);
            float _1650 = fma(_1634, _610, _1640);
            float _1652 = fma(_1644, _600, _1646);
            float _1654 = fma(_1644, _192, _1648);
            float _1656 = fma(_1644, _614, _1650);
            _1392 = _1654;
            _1394 = _1652;
            _1396 = _1656;
            _1526 = _1652;
            _1532 = _1654;
            _1538 = _1656;
        }
        float _1658 = _1392;
        float _1660 = _1394;
        float _1662 = _1396;
        float _1664 = _1526;
        float _1666 = _1532;
        float _1668 = _1538;
        float _1670 = _1658 * _1658;
        float _1672 = rsqrt(_1498);
        float _1674 = fma(_1660, _1660, _1670);
        float _1676 = fma(_1662, _1662, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1488 * _1672;
        float _1682 = _1484 * _1672;
        float _1684 = _1492 * _1672;
        bool _1686 = _1678 > 0.0;
        bool _1688 = !_1686;
        _294 = _1682;
        if (!_1688)
        {
            float _1690 = rsqrt(_1676);
            float _1692 = _1690 * _1658;
            float _1694 = _1690 * _1660;
            float _1696 = _1690 * _1662;
            float _1698 = _1682 * _1692;
            float _1700 = fma(_1680, _1694, _1698);
            float _1702 = fma(_1684, _1696, _1700);
            float _1704 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1706 = fma(_1664, _1704, _1478);
            float _1708 = fma(_1666, _1704, _1476);
            float _1710 = fma(_1668, _1704, _1480);
            _1506 = _1708;
            _1508 = _1706;
            _1510 = _1710;
        }
    }
    float _1712 = _1506;
    float _1714 = _1508;
    float _1716 = _1510;
    float _1718 = _294;
    float _1720 = -_834;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1724 = -_862;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1714);
    float _1728 = -_866;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1738 = _1726 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1742 = _1730 + _1740;
    float _1744 = _1734 * _1734;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1748 = fma(_1738, _1738, _1744);
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = rsqrt(_1750);
    float _1754 = sqrt(_1750);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1758 = _1738 * _1756;
    float _1760 = _1742 * _1756;
    float _1762 = _1758 * _1758;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1774 = _1768 + _1772;
    float _1776 = _1752;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1718;
    float _1784 = _1734;
    float _1786 = _1756;
    float _1788 = _1758;
    if (_1770)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1776 = _1790;
    }
    float _1792 = _1776;
    if (_1770)
    {
        float _1794 = rsqrt(_1766);
        _1778 = _1794;
    }
    float _1796 = _1778;
    if (_1770)
    {
        float _1798 = _1774 * _1792;
        _1780 = _1798;
    }
    float _1800 = _1780;
    if (_1770)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1782 = _1802;
    }
    float _1804 = _1782;
    float _1806 = _1792;
    float _1808 = _1804;
    if (_1770)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1742;
    float _1822 = _1818;
    if (_1770)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1756;
    float _1832 = -_1818;
    float _1834 = fma(_1734, _1830, _1832);
    if (!_1770)
    {
        _1784 = _1760;
    }
    float _1836 = _1784;
    float _1838 = _1836;
    if (_1770)
    {
        float _1840 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1814;
    float _1846 = _1842;
    if (_1770)
    {
        float _1848 = fma(_1814, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1770)
    {
        float _1856 = _1828 + (-1.0);
        _1846 = _1856;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (_1770)
    {
        float _1862 = _1796 * _1850;
        _1786 = _1862;
    }
    float _1864 = _1786;
    if (!_1770)
    {
        _1852 = _1834;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1770)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1870;
    }
    float _1872 = _1808;
    if (_1770)
    {
        float _1874 = _1758 * _1864;
        _1788 = _1874;
    }
    float _1876 = _1788;
    if (!_1770)
    {
        _1860 = _1762;
    }
    float _1878 = _1860;
    float _1880 = _1878;
    if (_1770)
    {
        float _1882 = _1760 * _1864;
        _1838 = _1882;
    }
    float _1884 = _1838;
    if (_1770)
    {
        float _1886 = fma(_1834, _1828, _1872);
        _1868 = _1886;
    }
    float _1888 = _1868;
    if (_1770)
    {
        float _1890 = _1876 * _1876;
        _1880 = _1890;
    }
    float _1892 = _1880;
    if (!_1770)
    {
        _1854 = _1764;
    }
    float _1894 = _1854;
    float _1896 = _1894;
    if (_1770)
    {
        float _1898 = _1884 * _1884;
        _1896 = _1898;
    }
    float _1900 = _1896;
    float _1902 = fma(_1888, _1888, _1892);
    float _1904 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1906 = _1902 + _1900;
    float _1908 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1912 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1910);
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1904);
    float _1918 = rsqrt(_1906);
    float _1920 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1924 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    float _1930 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1932 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1934 = _1924 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1938 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1930);
    float _1940 = abs(_1928);
    float _1942 = log2(_1940);
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1932);
    float _1950 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1952 = _1918 * _1876;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1956 = -_1944;
    float _1958 = fma(_1956, _1746, 1.0);
    float _1960 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1962 = _1918 * _1888;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1954);
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1968 = _1918 * _1884;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1964);
    float _1974 = -_1966;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1974);
    float _1978 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1980 = log2(_1958);
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1972);
    float _1984 = -_1968;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1976);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1990 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = fma(_1986, -0.5, 0.5);
    float _1994 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1988);
    float _1996 = exp2(_1978);
    float _1998 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2000 = fma(_1986, 0.5, 0.5);
    float _2002 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1994);
    float _2004 = _1962 + 1.0;
    float _2006 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2002);
    float _2012 = 1.0 / _1982;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2016 = fma(_2000, _2008, -0.212114393711090087890625);
    float _2018 = _1980 * 0.693147182464599609375;
    float _2020 = fma(_2000, _2016, 1.570728778839111328125);
    float _2022 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2024 = sqrt(_1992);
    float _2026 = -_1962;
    float _2028 = fma(_1996, _2004, _2026);
    float _2030 = fma(_2028, 0.5, 0.5);
    float _2032 = _2010 * _2012;
    float _2034 = _2014 * _2012;
    float _2036 = fma(_2032, 0.5, 0.5);
    float _2038 = fma(_2034, -0.5, 0.5);
    float _2040 = _2024 * 0.636619746685028076171875;
    float3 _5216 = float3(_2036, _2038, _2022);
    float _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5216, float3(0.0), isnan(_5216)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5216, float3(0.0), isnan(_5216)), level(0.0)).x;
    float3 _5227 = float3(_2036, _2038, _2022);
    float4 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _2045.w;
    float _2055 = -_2020;
    float _2057 = fma(_2040, _2055, 1.0);
    float2 _5249 = float2(_2057, _2030);
    float3 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2071 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2073 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2071);
    float _2075 = exp2(_2069);
    float _2077 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2073);
    float _2079 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2081 = _2079 + _1982;
    out.gl_Position.x = _2010;
    out.gl_Position.y = _2014;
    out.gl_Position.z = _2079;
    out.gl_Position.w = _1982;
    float _2083 = _2081 * 0.5;
    float _2085 = -_2075;
    float _2087 = _2085 + 1.0;
    float _2089 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2083;
    out.m_73.w = _1982;
    float _2091 = _2089 * _2042;
    float _2093 = -_2089;
    float _2095 = _2093 + 1.0;
    float _2097 = _2053 * _2091;
    float _2099 = _2067 * _2091;
    float _2101 = fma(_2063, _2097, _2047);
    float _2103 = fma(_2065, _2097, _2049);
    float _2105 = _2053 * _2095;
    float _2107 = fma(_2053, _2099, _2051);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2101;
    out.m_75.y = _2103;
    out.m_75.z = _2107;
    out.m_75.w = _2105;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_108);
        out.gl_Position.z = _2163;
    }
    if (!_98)
    {
        return out;
    }
    float _112 = in.m_49.w;
    float _114 = float(_94);
    float _116 = -_112;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_112);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    bool _130 = _118 >= _114;
    bool _132 = !_128;
    bool _134 = _130 || _132;
    float _136 = _112;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2227 = as_type<float>(_142);
        out.gl_Position.z = _2227;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    float _150 = 1.0 / _114;
    float _152 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_53.y;
    float _156 = in.m_55.w;
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = _118 * _150;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = abs(_144);
    float _172 = abs(_148);
    float _174 = precise::max(_170, _172);
    bool _176 = _174 >= 16.0;
    float _178 = fma(_162, 1.25, 0.75);
    float _180 = -_148;
    float _182 = fma(_178, _148, _180);
    float _184 = -_144;
    float _186 = fma(_178, _144, _184);
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _198 = _148;
    float _200 = _144;
    float _202 = 1.25;
    float _204 = _152;
    if (_176)
    {
        float _206 = _148 * 0.0625;
        _198 = _206;
    }
    float _208 = _198;
    if (_176)
    {
        float _210 = _144 * 0.0625;
        _200 = _210;
    }
    float _212 = _200;
    bool _214 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.0);
    bool _222 = _218 || _220;
    float _224 = abs(_208);
    bool _226 = _224 != 0.0;
    bool _228 = isnan(_224);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = abs(_212);
    bool _238 = _236 == 0.0;
    float _240 = abs(_212);
    bool _242 = _240 == 0.0;
    bool _244 = !_234;
    bool _246 = _242 && _244;
    float _248 = 0.0;
    if (!_222)
    {
        float _250 = _152 * _152;
        float _252 = _250 * 0.5;
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_222)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _256 = _262;
    }
    float _264 = _256;
    if (!_222)
    {
        float _266 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _266;
    }
    float _268 = _258;
    bool _270 = false;
    float _272 = _268;
    if (_246)
    {
        bool _274 = as_type<int>(_212) >= 0;
        _270 = _274;
    }
    bool _276 = _270;
    int _278 = 0;
    int _280 = _276 ? (-1) : 0;
    if (_246)
    {
        int _282 = _276 ? 0 : 1078530011;
        _278 = _282;
    }
    int _284 = _278;
    bool _286 = !_222;
    float _288 = 0.0;
    int _290 = _284;
    float _292 = _154;
    float _294 = _166;
    if (!_286)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _152 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _152);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _314;
        _288 = _308;
        _272 = _324;
    }
    float _326 = _202;
    float _328 = _288;
    float _330 = _272;
    bool _332 = !_222;
    float _334 = _326;
    float _336 = _328;
    if (!_332)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _152 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _334 = _344;
        _204 = _356;
    }
    float _358 = _334;
    float _360 = _204;
    float _362 = _358;
    if (!_222)
    {
        _336 = _118;
    }
    float _364 = _336;
    float _366 = _364;
    if (!_222)
    {
        float _368 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _368;
    }
    float _370 = _362;
    float _372 = _370;
    if (_246)
    {
        int _374 = int(0x80000000) & as_type<int>(_208);
        int _376 = _284 | _374;
        _290 = _376;
    }
    int _378 = _290;
    bool _380 = !_222;
    int _382 = _378;
    float _384 = as_type<float>(_378);
    if (!_380)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = _118 * _388;
        float _398 = exp2(_396);
        float _400 = _394 * 0.693147182464599609375;
        float _402 = 1.0 / _400;
        float _404 = 1.0 / _392;
        float _406 = _398 + (-1.0);
        float _408 = -_406;
        float _410 = fma(_408, _402, _118);
        float _412 = _410 * _404;
        float _414 = _412 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _372 = _414;
    }
    float _416 = _372;
    bool _418 = !_222;
    if (!_418)
    {
        float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = log2(_420);
        float _424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _426 = _424 + 1.0;
        float _428 = 1.0 / _426;
        float _430 = _118 * _422;
        float _432 = exp2(_430);
        float _434 = -_432;
        float _436 = _434 + 1.0;
        float _438 = _436 * _428;
        _366 = _438;
    }
    float _440 = _366;
    bool _442 = !_234;
    bool _444 = _442 && _238;
    if (!_444)
    {
        float _446 = abs(_208);
        bool _448 = _446 != as_type<float>(0x7f800000u /* inf */);
        bool _450 = isnan(_446);
        bool _452 = _448 || _450;
        bool _454 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _456 = _452 || _454;
        float _458 = abs(_212);
        bool _460 = _458 == as_type<float>(0x7f800000u /* inf */);
        float _462 = abs(_212);
        bool _464 = _462 == as_type<float>(0x7f800000u /* inf */);
        bool _466 = !_456;
        bool _468 = _464 && _466;
        if (_468)
        {
            bool _470 = as_type<int>(_212) >= 0;
            _280 = _470 ? (-1) : 0;
        }
        int _472 = _280;
        if (_468)
        {
            _382 = 1075235812;
        }
        int _474 = _382;
        int _476 = _474;
        if (_468)
        {
            int _478 = ~_472;
            int _480 = (_478 != 0) ? _474 : 1061752795;
            _476 = _480;
        }
        int _482 = _476;
        float _484 = as_type<float>(_482);
        if (_468)
        {
            int _486 = int(0x80000000) & as_type<int>(_208);
            int _488 = _482 | _486;
            _484 = as_type<float>(_488);
        }
        float _490 = _484;
        bool _492 = !_456;
        bool _494 = _492 && _460;
        _384 = _490;
        if (!_494)
        {
            float _496 = abs(_212);
            float _498 = abs(_208);
            float _500 = precise::max(_496, _498);
            float _502 = abs(_212);
            float _504 = abs(_208);
            float _506 = _502 + _504;
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::min(_508, _510);
            float _514 = 1.0 / _500;
            float _516 = abs(_208);
            float _518 = abs(_212);
            bool _520 = _516 > _518;
            bool _522 = as_type<int>(_212) >= 0;
            bool _524 = _506 > as_type<float>(0x7f800000u /* inf */);
            bool _526 = isnan(_506);
            bool _528 = _524 || _526;
            bool _530 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _532 = _528 || _530;
            float _534 = _512 * _514;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = fma(_536, _544, -6.565555095672607421875);
            float _548 = 1.0 / _542;
            float _550 = _536 * _546;
            float _552 = _534 * _550;
            float _554 = fma(_552, _548, _534);
            int _556 = as_type<int>(_208) & int(0x80000000);
            float _558 = _554;
            _384 = _506;
            if (_520)
            {
                float _560 = -_554;
                float _562 = _560 + 1.57079637050628662109375;
                _558 = _562;
            }
            float _564 = _558;
            int _566 = as_type<int>(_564);
            if (!_522)
            {
                float _568 = -_564;
                float _570 = _568 + 3.1415927410125732421875;
                _566 = as_type<int>(_570);
            }
            int _572 = _566;
            if (!_532)
            {
                int _574 = _556 | _572;
                _384 = as_type<float>(_574);
            }
        }
    }
    float _576 = _384;
    float _578 = in.m_59.w;
    float _580 = -_154;
    float _582 = _580 + 1.0;
    bool _584 = _160 > 0.5;
    float _586 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = in.m_44.x;
    float _590 = in.m_44.y;
    float _592 = in.m_44.z;
    float _594 = _188 * _188;
    float _596 = in.m_61.x;
    float _598 = in.m_61.y;
    float _600 = in.m_61.z;
    int _602 = _584 ? as_type<int>(_582) : as_type<int>(_154);
    float _604 = _162 * 3.1415927410125732421875;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _608 = _606 != 0;
    float _610 = in.m_63.x;
    float _612 = in.m_63.y;
    float _614 = in.m_63.z;
    float _616 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    float _622 = _576 + 3.1415927410125732421875;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _626 = _624 != 0;
    float _628 = _604 * 0.15915493667125701904296875;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _632 = _630 != 0;
    float _634 = _622 * 0.15915493667125701904296875;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    float _640 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _642 = fma(_360, _166, _616);
    bool _644 = _156 > 0.5;
    float _646 = _628 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(_360, _164, _640);
    float _652 = fma(_360, _168, _586);
    float _654 = fma(_642, _578, _590);
    float _656 = fma(_650, _578, _588);
    float _658 = fma(_652, _578, _592);
    float _660 = _190 * _190;
    float _662 = _654 * _190;
    float _664 = _654 * _598;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _668 = fma(_598, _598, _660);
    float _670 = fma(_656, _188, _662);
    float _672 = _654 * _612;
    float _674 = fma(_656, _596, _664);
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _678 = fma(_658, _192, _670);
    float _680 = fma(_656, _610, _672);
    float _682 = fma(_658, _600, _674);
    float _684 = fma(_612, _612, _668);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = _676 * 6.283185482025146484375;
    float _690 = _676 * 12.0;
    float _692 = fma(_658, _614, _680);
    float _694 = _676 * 6.0;
    float _696 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _700 = _686 + _698;
    float _702 = fma(_576, 4.0, _690);
    float _704 = fma(_596, _596, _594);
    float _706 = -_694;
    float _708 = fma(_576, 3.0, _706);
    float _710 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _714 = _696 + _712;
    float _716 = _700 * _700;
    float _718 = _702 * 0.15915493667125701904296875;
    float _720 = fma(_610, _610, _704);
    float _722 = 0.0;
    bool _724 = _626;
    float _726 = _720;
    float _728 = _684;
    if (_620)
    {
        float _730 = in.m_55.x;
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _708 * 0.15915493667125701904296875;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _710 + _736;
    float _740 = fma(_714, _714, _716);
    float _742 = sqrt(_720);
    float _744 = _688 * 0.15915493667125701904296875;
    float _746 = fma(_738, _738, _740);
    float _748 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _750 = _192 * _192;
    float _752 = in.m_59.x;
    float _754 = in.m_59.y;
    float _756 = in.m_59.z;
    float _758 = _718 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = 0.0 + _648;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma(_600, _600, _750);
    float _770 = -_146;
    float _772 = fma(_764, _146, _770);
    float _774 = _734 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _784 = rsqrt(_746);
    float _786 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _788 = _744 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _760 + _776;
    float _794 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = sqrt(_684);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _808 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _810 = -_806;
    float _812 = fma(_748, 2.0, _810);
    float _814 = _626 ? as_type<float>(_602) : _154;
    float _816 = fma(_808, -2.0, _766);
    float _818 = _772;
    float _820 = _778;
    float _822 = _814;
    if (_638)
    {
        float _824 = _644 ? _582 : _154;
        _292 = _824;
    }
    float _826 = _292;
    float _828 = _634 * 6.283185482025146484375;
    float _830 = sin(_828);
    bool _832 = _742 > 0.0;
    float _834 = _700 * _784;
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _816);
    int _838 = as_type<int>(_836);
    if (_620)
    {
        bool _840 = _732 > 0.5;
        _724 = _840;
    }
    bool _842 = _724;
    float _844 = fma(_614, _614, _768);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _848 = _846 + 2.0;
    float _850 = fma(_792, 0.25, 0.5);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    bool _856 = _804 > 0.0;
    float _858 = fma(_790, 0.10000002384185791015625, 1.0);
    float _860 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _862 = _714 * _784;
    float _864 = _854 * _854;
    float _866 = _738 * _784;
    float _868 = _700;
    float _870 = _804;
    bool _872 = _856;
    if (_832)
    {
        float _874 = rsqrt(_720);
        _868 = _874;
    }
    float _876 = _868;
    float _878 = -_862;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _882 = fma(_830, 0.5, 0.5);
    float _884 = -_866;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    if (!_832)
    {
        _870 = 0.0;
    }
    float _888 = _870;
    float _890 = fma(_880, _880, _864);
    float _892 = _882 * _860;
    float _894 = _888;
    float _896 = _892;
    if (!_832)
    {
        _818 = 0.0;
    }
    float _898 = _818;
    float _900 = sqrt(_844);
    float _902 = fma(_886, _886, _890);
    float _904 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _906 = _898;
    if (!_832)
    {
        _726 = 0.0;
    }
    float _908 = _726;
    float _910 = _908;
    if (!_856)
    {
        _820 = 0.0;
    }
    float _912 = _820;
    float _914 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _916 = _882;
    float _918 = _912;
    if (_856)
    {
        float _920 = rsqrt(_684);
        _916 = _920;
    }
    float _922 = _916;
    if (_832)
    {
        float _924 = _876 * _596;
        _894 = _924;
    }
    float _926 = _894;
    if (_832)
    {
        float _928 = _876 * _188;
        _910 = _928;
    }
    float _930 = _910;
    if (_832)
    {
        float _932 = _876 * _610;
        _906 = _932;
    }
    float _934 = _906;
    float _936 = _892 * _904;
    if (!_856)
    {
        _896 = 0.0;
    }
    float _938 = _896;
    float _940 = _858;
    float _942 = _938;
    if (_632)
    {
        float _944 = in.m_55.z;
        _940 = _944;
    }
    float _946 = _940;
    float _948 = sqrt(_902);
    bool _950 = _900 > 0.0;
    float _952 = fma(_936, _914, 1.0);
    if (!_856)
    {
        _728 = 0.0;
    }
    float _954 = _728;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _958 = _954;
    if (_856)
    {
        float _960 = _922 * _598;
        _958 = _960;
    }
    float _962 = _958;
    if (_856)
    {
        float _964 = _922 * _190;
        _918 = _964;
    }
    float _966 = _918;
    if (_856)
    {
        float _968 = _922 * _612;
        _942 = _968;
    }
    float _970 = _942;
    float _972 = _196 * _952;
    float _974 = _194 * _952;
    float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    float _980 = _784 * _948;
    float _982 = in.m_53.x;
    float _984 = _800 * _980;
    float _986 = _914;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _990 = _974;
    float _992 = _982;
    if (_950)
    {
        float _994 = rsqrt(_844);
        _986 = _994;
    }
    float _996 = _986;
    float _998 = _798 * _980;
    float _1000 = _802 * _980;
    float _1002 = _984 * _956;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1006 = _998 * _978;
    float _1008 = _1002 * _962;
    float _1010 = _1000 * _1004;
    float _1012 = _844;
    float _1014 = _1000;
    float _1016 = _1008;
    if (!_608)
    {
        float _1018 = in.m_55.z;
        _1012 = _1018;
    }
    float _1020 = _1012;
    if (!_950)
    {
        _1014 = 0.0;
    }
    float _1022 = _1014;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1002 * _970;
    float _1028 = fma(_1006, _926, _1008);
    float _1030 = _1022;
    float _1032 = _1026;
    if (!_950)
    {
        _1016 = 0.0;
    }
    float _1034 = _1016;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1038 = fma(_1006, _934, _1026);
    float _1040 = _1034;
    if (_950)
    {
        float _1042 = _996 * _600;
        _1030 = _1042;
    }
    float _1044 = _1030;
    if (_950)
    {
        float _1046 = _996 * _614;
        _1040 = _1046;
    }
    float _1048 = _1040;
    if (!_608)
    {
        _1032 = _160;
    }
    float _1050 = _1032;
    float _1052 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    float _1054 = fma(_1010, _1044, _1028);
    float _1056 = fma(_1010, _1048, _1038);
    float _1058 = _976 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1060 = _1050;
    if (_608)
    {
        _1060 = _158;
    }
    float _1062 = _1060;
    float _1064 = _696 + _1054;
    float _1066 = _710 + _1056;
    float _1068 = fma(_1058, _814, -0.5);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1066 + _1074;
    float _1078 = _1066;
    if (_632)
    {
        bool _1080 = _946 > 0.5;
        _872 = _1080;
    }
    bool _1082 = _872;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1086 = _1072 * _1072;
    float _1088 = _1076 * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1092 = _1020;
    float _1094 = _1086;
    float _1096 = _1088;
    if (!_608)
    {
        _822 = _1020;
    }
    float _1098 = _822;
    float _1100 = _1002 * _966;
    float _1102 = _1086 + _1088;
    float _1104 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1090);
    float _1106 = _1098;
    int _1108 = as_type<int>(_1100);
    if (_608)
    {
        _1106 = _160;
    }
    float _1110 = _1106;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_608)
    {
        _1092 = _160;
    }
    float _1114 = _1092;
    float _1116 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    float _1118 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    float _1120 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1122 = fma(_1006, _930, _1100);
    float _1124 = -_836;
    float _1126 = fma(_1116, _1068, _1124);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1130 = sqrt(_1102);
    if (_620)
    {
        float _1132 = -_982;
        float _1134 = _1132 + 1.0;
        _838 = as_type<int>(_1134);
    }
    int _1136 = _838;
    if (!_950)
    {
        _988 = 0.0;
    }
    float _1138 = _988;
    float _1140 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1138;
    if (_950)
    {
        float _1144 = _996 * _192;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_632)
    {
        float _1148 = -_982;
        float _1150 = _1148 + 1.0;
        _1108 = as_type<int>(_1150);
    }
    int _1152 = _1108;
    if (!_620)
    {
        _990 = _982;
    }
    float _1154 = _990;
    float _1156 = fma(_1140, _826, -0.5);
    float _1158 = _1154;
    if (_620)
    {
        float _1160 = _842 ? as_type<float>(_1136) : _982;
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = fma(_1010, _1146, _1122);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1168 = _1164;
    if (_632)
    {
        float _1170 = _1082 ? as_type<float>(_1152) : _982;
        _992 = _1170;
    }
    float _1172 = _992;
    float _1174 = -_782;
    float _1176 = fma(_1120, 2.0, _1174);
    float _1178 = _686 + _1164;
    float _1180 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1128);
    float _1182 = fma(_1166, _1162, -0.5);
    bool _1184 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1178;
    if (!_1184)
    {
        _1168 = _1064;
    }
    float _1188 = _1168;
    bool _1190 = !_1184;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1130 + _1196;
        float _1200 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = rsqrt(_1102);
        float _1204 = _1198 * _1194;
        float _1206 = _1204 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = cos(_1212);
        float _1216 = fma(_1210, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = _1202 * _1216;
        float _1220 = fma(_1072, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1222 = _1214 + (-1.0);
        float _1224 = fma(_1076, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1228 = _1220 + _1226;
        float _1230 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1234 = _1224 + _1232;
        float _1236 = _1228 * _1228;
        float _1238 = fma(_1178, _1214, _1230);
        float _1240 = _1234 * _1234;
        _1186 = _1238;
        _1094 = _1236;
        _1096 = _1240;
        _1192 = _1220;
        _1078 = _1224;
    }
    float _1242 = _1186;
    float _1244 = _1094;
    float _1246 = _1096;
    float _1248 = _1192;
    float _1250 = _1078;
    float _1252 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1052);
    float _1256 = -_118;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1242 + _1260;
    float _1264 = fma(_1252, _1172, -0.5);
    float _1266 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1118);
    float _1268 = fma(_1254, _1182, _1258);
    float _1270 = -_118;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1278 = fma(_1262, _1262, _1244);
    float _1280 = fma(_1266, _1264, _1272);
    float _1282 = fma(_1276, -2.0, _1274);
    float _1284 = _1278 + _1246;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1290 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1282);
    float _1292 = sqrt(_1284);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = -_1290;
    float _1298 = fma(_1288, _1156, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1306 = _1126 + 0.5;
    float _1308 = _1268 + 0.5;
    float _1310 = _1280 + 0.5;
    float _1312 = _1298 + 0.5;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1316 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_65.x = _1308;
    out.m_65.y = _1306;
    out.m_65.z = _1310;
    out.m_65.w = _1312;
    bool _1328 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1292);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1316;
    out.m_69.y = _1318;
    out.m_69.z = _1320;
    out.m_69.w = _1314;
    out.m_71.x = _1340;
    out.m_71.y = _1342;
    out.m_71.z = _1294;
    out.m_71.w = _1338;
    float _1344 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1346 = fma(_440, _166, _1322);
    float _1348 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1350 = fma(_440, _164, _1344);
    float _1352 = -_1346;
    float _1354 = _642 + _1352;
    float _1356 = fma(_440, _168, _1348);
    float _1358 = -_1350;
    float _1360 = _650 + _1358;
    float _1362 = _1354 * _598;
    float _1364 = _1354 * _190;
    float _1366 = _1354 * _612;
    float _1368 = -_1356;
    float _1370 = _652 + _1368;
    float _1372 = fma(_1360, _596, _1362);
    float _1374 = fma(_1360, _188, _1364);
    float _1376 = fma(_1360, _610, _1366);
    float _1378 = fma(_1370, _600, _1372);
    float _1380 = fma(_1370, _192, _1374);
    float _1382 = fma(_1370, _614, _1376);
    float _1384 = _1376;
    float _1386 = _1306;
    float _1388 = _1310;
    float _1390 = _1382;
    float _1392 = _1380;
    float _1394 = _1378;
    float _1396 = _1382;
    if (!_1336)
    {
        _1384 = 1.0;
    }
    float _1398 = _1384;
    bool _1400 = !_1336;
    float _1402 = _1398;
    if (!_1400)
    {
        bool _1404 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1406 = isnan(_1292);
        bool _1408 = _1404 || _1406;
        bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1412 = _1408 || _1410;
        if (!_1412)
        {
            float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1416 = _1292 + _1414;
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1426 = 1.0 / _1420;
            float _1428 = _1416 * _1426;
            float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1402 = _1430;
            _1432 = true;
        }
        else
        {
            bool _1434 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1436 = isnan(_1292);
            bool _1438 = _1434 || _1436;
            bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1442 = _1438 || _1440;
            if (!_1442)
            {
                float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1446 = _1292 + _1444;
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1456 = 1.0 / _1450;
                float _1458 = _1446 * _1456;
                float _1460 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1402 = _1460;
                _1432 = true;
            }
            else
            {
                _1402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1432 = false;
    float _1462 = _1402;
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1466 = _1242 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1470 = _1248 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1474 = _1250 + _1472;
    float _1476 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1474, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = -_686;
    float _1484 = _1482 + _1476;
    float _1486 = -_696;
    float _1488 = _1486 + _1478;
    float _1490 = -_710;
    float _1492 = _1490 + _1480;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > 0.0;
    bool _1504 = !_1502;
    float _1506 = _1476;
    float _1508 = _1478;
    float _1510 = _1480;
    if (!_1504)
    {
        bool _1512 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1514 = _1500;
        if (_1512)
        {
            float _1516 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1514 = _1516;
        }
        float _1518 = _1514;
        float _1520 = _1518;
        if (_1512)
        {
            float _1522 = _1378 * _1518;
            _1386 = _1522;
        }
        float _1524 = _1386;
        float _1526 = _1524;
        if (_1512)
        {
            float _1528 = _1380 * _1518;
            _1388 = _1528;
        }
        float _1530 = _1388;
        float _1532 = _1530;
        if (_1512)
        {
            float _1534 = _1382 * _1518;
            _1520 = _1534;
        }
        float _1536 = _1520;
        float _1538 = _1536;
        if (!_1512)
        {
            float _1540 = _118 + 1.0;
            float _1542 = _1540;
            if (!_222)
            {
                float _1544 = _1540 * _1540;
                float _1546 = _1544 * 0.5;
                _1390 = _1546;
            }
            float _1548 = _1390;
            float _1550 = _1548;
            if (!_222)
            {
                float _1552 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1550 = _1552;
            }
            float _1554 = _1550;
            bool _1556 = !_222;
            float _1558 = _1554;
            if (!_1556)
            {
                float _1560 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1562 = log2(_1560);
                float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1566 = _1564 + 1.0;
                float _1568 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1570 = _1562 * _1540;
                float _1572 = 1.0 / _1566;
                float _1574 = _1568 * 0.693147182464599609375;
                float _1576 = exp2(_1570);
                float _1578 = 1.0 / _1574;
                float _1580 = _1576 + (-1.0);
                float _1582 = -_1580;
                float _1584 = fma(_1582, _1578, _1540);
                float _1586 = _1584 * _1572;
                float _1588 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1558 = _1588;
            }
            float _1590 = _1558;
            float _1592 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1594 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1596 = !_222;
            if (!_1596)
            {
                float _1598 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1600 = log2(_1598);
                float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1604 = _1602 + 1.0;
                float _1606 = 1.0 / _1604;
                float _1608 = _1600 * _1540;
                float _1610 = exp2(_1608);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                float _1616 = _1614 * _1606;
                _1542 = _1616;
            }
            float _1618 = _1542;
            float _1620 = fma(_1618, _166, _1594);
            float _1622 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1624 = fma(_1618, _164, _1592);
            float _1626 = -_1346;
            float _1628 = _1626 + _1620;
            float _1630 = fma(_1618, _168, _1622);
            float _1632 = -_1350;
            float _1634 = _1632 + _1624;
            float _1636 = _1628 * _598;
            float _1638 = _1628 * _190;
            float _1640 = _1628 * _612;
            float _1642 = -_1356;
            float _1644 = _1642 + _1630;
            float _1646 = fma(_1634, _596, _1636);
            float _1648 = fma(_1634, _188, _1638);
            float _1650 = fma(_1634, _610, _1640);
            float _1652 = fma(_1644, _600, _1646);
            float _1654 = fma(_1644, _192, _1648);
            float _1656 = fma(_1644, _614, _1650);
            _1392 = _1654;
            _1394 = _1652;
            _1396 = _1656;
            _1526 = _1652;
            _1532 = _1654;
            _1538 = _1656;
        }
        float _1658 = _1392;
        float _1660 = _1394;
        float _1662 = _1396;
        float _1664 = _1526;
        float _1666 = _1532;
        float _1668 = _1538;
        float _1670 = _1658 * _1658;
        float _1672 = rsqrt(_1498);
        float _1674 = fma(_1660, _1660, _1670);
        float _1676 = fma(_1662, _1662, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1488 * _1672;
        float _1682 = _1484 * _1672;
        float _1684 = _1492 * _1672;
        bool _1686 = _1678 > 0.0;
        bool _1688 = !_1686;
        _294 = _1682;
        if (!_1688)
        {
            float _1690 = rsqrt(_1676);
            float _1692 = _1690 * _1658;
            float _1694 = _1690 * _1660;
            float _1696 = _1690 * _1662;
            float _1698 = _1682 * _1692;
            float _1700 = fma(_1680, _1694, _1698);
            float _1702 = fma(_1684, _1696, _1700);
            float _1704 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1706 = fma(_1664, _1704, _1478);
            float _1708 = fma(_1666, _1704, _1476);
            float _1710 = fma(_1668, _1704, _1480);
            _1506 = _1708;
            _1508 = _1706;
            _1510 = _1710;
        }
    }
    float _1712 = _1506;
    float _1714 = _1508;
    float _1716 = _1510;
    float _1718 = _294;
    float _1720 = -_834;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1724 = -_862;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1714);
    float _1728 = -_866;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1738 = _1726 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1742 = _1730 + _1740;
    float _1744 = _1734 * _1734;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1748 = fma(_1738, _1738, _1744);
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = rsqrt(_1750);
    float _1754 = sqrt(_1750);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1758 = _1738 * _1756;
    float _1760 = _1742 * _1756;
    float _1762 = _1758 * _1758;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1774 = _1768 + _1772;
    float _1776 = _1752;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1718;
    float _1784 = _1734;
    float _1786 = _1756;
    float _1788 = _1758;
    if (_1770)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1776 = _1790;
    }
    float _1792 = _1776;
    if (_1770)
    {
        float _1794 = rsqrt(_1766);
        _1778 = _1794;
    }
    float _1796 = _1778;
    if (_1770)
    {
        float _1798 = _1774 * _1792;
        _1780 = _1798;
    }
    float _1800 = _1780;
    if (_1770)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1782 = _1802;
    }
    float _1804 = _1782;
    float _1806 = _1792;
    float _1808 = _1804;
    if (_1770)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1742;
    float _1822 = _1818;
    if (_1770)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1756;
    float _1832 = -_1818;
    float _1834 = fma(_1734, _1830, _1832);
    if (!_1770)
    {
        _1784 = _1760;
    }
    float _1836 = _1784;
    float _1838 = _1836;
    if (_1770)
    {
        float _1840 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1814;
    float _1846 = _1842;
    if (_1770)
    {
        float _1848 = fma(_1814, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1770)
    {
        float _1856 = _1828 + (-1.0);
        _1846 = _1856;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (_1770)
    {
        float _1862 = _1796 * _1850;
        _1786 = _1862;
    }
    float _1864 = _1786;
    if (!_1770)
    {
        _1852 = _1834;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1770)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1870;
    }
    float _1872 = _1808;
    if (_1770)
    {
        float _1874 = _1758 * _1864;
        _1788 = _1874;
    }
    float _1876 = _1788;
    if (!_1770)
    {
        _1860 = _1762;
    }
    float _1878 = _1860;
    float _1880 = _1878;
    if (_1770)
    {
        float _1882 = _1760 * _1864;
        _1838 = _1882;
    }
    float _1884 = _1838;
    if (_1770)
    {
        float _1886 = fma(_1834, _1828, _1872);
        _1868 = _1886;
    }
    float _1888 = _1868;
    if (_1770)
    {
        float _1890 = _1876 * _1876;
        _1880 = _1890;
    }
    float _1892 = _1880;
    if (!_1770)
    {
        _1854 = _1764;
    }
    float _1894 = _1854;
    float _1896 = _1894;
    if (_1770)
    {
        float _1898 = _1884 * _1884;
        _1896 = _1898;
    }
    float _1900 = _1896;
    float _1902 = fma(_1888, _1888, _1892);
    float _1904 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1906 = _1902 + _1900;
    float _1908 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1912 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1910);
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1904);
    float _1918 = rsqrt(_1906);
    float _1920 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1924 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    float _1930 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1932 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1934 = _1924 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1938 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1930);
    float _1940 = abs(_1928);
    float _1942 = log2(_1940);
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1932);
    float _1950 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1952 = _1918 * _1876;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1956 = -_1944;
    float _1958 = fma(_1956, _1746, 1.0);
    float _1960 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1962 = _1918 * _1888;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1954);
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1968 = _1918 * _1884;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1964);
    float _1974 = -_1966;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1974);
    float _1978 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1980 = log2(_1958);
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1972);
    float _1984 = -_1968;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1976);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1990 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = fma(_1986, -0.5, 0.5);
    float _1994 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1988);
    float _1996 = exp2(_1978);
    float _1998 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2000 = fma(_1986, 0.5, 0.5);
    float _2002 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1994);
    float _2004 = _1962 + 1.0;
    float _2006 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2002);
    float _2012 = 1.0 / _1982;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2016 = fma(_2000, _2008, -0.212114393711090087890625);
    float _2018 = _1980 * 0.693147182464599609375;
    float _2020 = fma(_2000, _2016, 1.570728778839111328125);
    float _2022 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2024 = sqrt(_1992);
    float _2026 = -_1962;
    float _2028 = fma(_1996, _2004, _2026);
    float _2030 = fma(_2028, 0.5, 0.5);
    float _2032 = _2010 * _2012;
    float _2034 = _2014 * _2012;
    float _2036 = fma(_2032, 0.5, 0.5);
    float _2038 = fma(_2034, -0.5, 0.5);
    float _2040 = _2024 * 0.636619746685028076171875;
    float3 _5216 = float3(_2036, _2038, _2022);
    float _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5216, float3(0.0), isnan(_5216)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5216, float3(0.0), isnan(_5216)), level(0.0)).x;
    float3 _5227 = float3(_2036, _2038, _2022);
    float4 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _2045.w;
    float _2055 = -_2020;
    float _2057 = fma(_2040, _2055, 1.0);
    float2 _5249 = float2(_2057, _2030);
    float3 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2071 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2073 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2071);
    float _2075 = exp2(_2069);
    float _2077 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2073);
    float _2079 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2081 = _2079 + _1982;
    out.gl_Position.x = _2010;
    out.gl_Position.y = _2014;
    out.gl_Position.z = _2079;
    out.gl_Position.w = _1982;
    float _2083 = _2081 * 0.5;
    float _2085 = -_2075;
    float _2087 = _2085 + 1.0;
    float _2089 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2083;
    out.m_73.w = _1982;
    float _2091 = _2089 * _2042;
    float _2093 = -_2089;
    float _2095 = _2093 + 1.0;
    float _2097 = _2053 * _2091;
    float _2099 = _2067 * _2091;
    float _2101 = fma(_2063, _2097, _2047);
    float _2103 = fma(_2065, _2097, _2049);
    float _2105 = _2053 * _2095;
    float _2107 = fma(_2053, _2099, _2051);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2101;
    out.m_75.y = _2103;
    out.m_75.z = _2107;
    out.m_75.w = _2105;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1432 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_98)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_108);
        out.gl_Position.z = _2163;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    float _114 = float(_94);
    float _116 = -_112;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_112);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    bool _130 = _118 >= _114;
    bool _132 = !_128;
    bool _134 = _130 || _132;
    float _136 = _112;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2227 = as_type<float>(_142);
        out.gl_Position.z = _2227;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    float _150 = 1.0 / _114;
    float _152 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_53.y;
    float _156 = in.m_55.w;
    float _158 = in.m_55.x;
    float _160 = in.m_55.y;
    float _162 = _118 * _150;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = abs(_144);
    float _172 = abs(_148);
    float _174 = precise::max(_170, _172);
    bool _176 = _174 >= 16.0;
    float _178 = fma(_162, 1.25, 0.75);
    float _180 = -_148;
    float _182 = fma(_178, _148, _180);
    float _184 = -_144;
    float _186 = fma(_178, _144, _184);
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _198 = _148;
    float _200 = _144;
    float _202 = 1.25;
    float _204 = _152;
    if (_176)
    {
        float _206 = _148 * 0.0625;
        _198 = _206;
    }
    float _208 = _198;
    if (_176)
    {
        float _210 = _144 * 0.0625;
        _200 = _210;
    }
    float _212 = _200;
    bool _214 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.0);
    bool _222 = _218 || _220;
    float _224 = abs(_208);
    bool _226 = _224 != 0.0;
    bool _228 = isnan(_224);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = abs(_212);
    bool _238 = _236 == 0.0;
    float _240 = abs(_212);
    bool _242 = _240 == 0.0;
    bool _244 = !_234;
    bool _246 = _242 && _244;
    float _248 = 0.0;
    if (!_222)
    {
        float _250 = _152 * _152;
        float _252 = _250 * 0.5;
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_222)
    {
        float _260 = _118 * _118;
        float _262 = _260 * 0.5;
        _256 = _262;
    }
    float _264 = _256;
    if (!_222)
    {
        float _266 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _266;
    }
    float _268 = _258;
    bool _270 = false;
    float _272 = _268;
    if (_246)
    {
        bool _274 = as_type<int>(_212) >= 0;
        _270 = _274;
    }
    bool _276 = _270;
    int _278 = 0;
    int _280 = _276 ? (-1) : 0;
    if (_246)
    {
        int _282 = _276 ? 0 : 1078530011;
        _278 = _282;
    }
    int _284 = _278;
    bool _286 = !_222;
    float _288 = 0.0;
    int _290 = _284;
    float _292 = _154;
    float _294 = _166;
    if (!_286)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _152 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _152);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _314;
        _288 = _308;
        _272 = _324;
    }
    float _326 = _202;
    float _328 = _288;
    float _330 = _272;
    bool _332 = !_222;
    float _334 = _326;
    float _336 = _328;
    if (!_332)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _152 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _334 = _344;
        _204 = _356;
    }
    float _358 = _334;
    float _360 = _204;
    float _362 = _358;
    if (!_222)
    {
        _336 = _118;
    }
    float _364 = _336;
    float _366 = _364;
    if (!_222)
    {
        float _368 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _368;
    }
    float _370 = _362;
    float _372 = _370;
    if (_246)
    {
        int _374 = int(0x80000000) & as_type<int>(_208);
        int _376 = _284 | _374;
        _290 = _376;
    }
    int _378 = _290;
    bool _380 = !_222;
    int _382 = _378;
    float _384 = as_type<float>(_378);
    if (!_380)
    {
        float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _388 = log2(_386);
        float _390 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _392 = _390 + 1.0;
        float _394 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = _118 * _388;
        float _398 = exp2(_396);
        float _400 = _394 * 0.693147182464599609375;
        float _402 = 1.0 / _400;
        float _404 = 1.0 / _392;
        float _406 = _398 + (-1.0);
        float _408 = -_406;
        float _410 = fma(_408, _402, _118);
        float _412 = _410 * _404;
        float _414 = _412 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _372 = _414;
    }
    float _416 = _372;
    bool _418 = !_222;
    if (!_418)
    {
        float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = log2(_420);
        float _424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _426 = _424 + 1.0;
        float _428 = 1.0 / _426;
        float _430 = _118 * _422;
        float _432 = exp2(_430);
        float _434 = -_432;
        float _436 = _434 + 1.0;
        float _438 = _436 * _428;
        _366 = _438;
    }
    float _440 = _366;
    bool _442 = !_234;
    bool _444 = _442 && _238;
    if (!_444)
    {
        float _446 = abs(_208);
        bool _448 = _446 != as_type<float>(0x7f800000u /* inf */);
        bool _450 = isnan(_446);
        bool _452 = _448 || _450;
        bool _454 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _456 = _452 || _454;
        float _458 = abs(_212);
        bool _460 = _458 == as_type<float>(0x7f800000u /* inf */);
        float _462 = abs(_212);
        bool _464 = _462 == as_type<float>(0x7f800000u /* inf */);
        bool _466 = !_456;
        bool _468 = _464 && _466;
        if (_468)
        {
            bool _470 = as_type<int>(_212) >= 0;
            _280 = _470 ? (-1) : 0;
        }
        int _472 = _280;
        if (_468)
        {
            _382 = 1075235812;
        }
        int _474 = _382;
        int _476 = _474;
        if (_468)
        {
            int _478 = ~_472;
            int _480 = (_478 != 0) ? _474 : 1061752795;
            _476 = _480;
        }
        int _482 = _476;
        float _484 = as_type<float>(_482);
        if (_468)
        {
            int _486 = int(0x80000000) & as_type<int>(_208);
            int _488 = _482 | _486;
            _484 = as_type<float>(_488);
        }
        float _490 = _484;
        bool _492 = !_456;
        bool _494 = _492 && _460;
        _384 = _490;
        if (!_494)
        {
            float _496 = abs(_212);
            float _498 = abs(_208);
            float _500 = precise::max(_496, _498);
            float _502 = abs(_212);
            float _504 = abs(_208);
            float _506 = _502 + _504;
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::min(_508, _510);
            float _514 = 1.0 / _500;
            float _516 = abs(_208);
            float _518 = abs(_212);
            bool _520 = _516 > _518;
            bool _522 = as_type<int>(_212) >= 0;
            bool _524 = _506 > as_type<float>(0x7f800000u /* inf */);
            bool _526 = isnan(_506);
            bool _528 = _524 || _526;
            bool _530 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _532 = _528 || _530;
            float _534 = _512 * _514;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = fma(_536, _544, -6.565555095672607421875);
            float _548 = 1.0 / _542;
            float _550 = _536 * _546;
            float _552 = _534 * _550;
            float _554 = fma(_552, _548, _534);
            int _556 = as_type<int>(_208) & int(0x80000000);
            float _558 = _554;
            _384 = _506;
            if (_520)
            {
                float _560 = -_554;
                float _562 = _560 + 1.57079637050628662109375;
                _558 = _562;
            }
            float _564 = _558;
            int _566 = as_type<int>(_564);
            if (!_522)
            {
                float _568 = -_564;
                float _570 = _568 + 3.1415927410125732421875;
                _566 = as_type<int>(_570);
            }
            int _572 = _566;
            if (!_532)
            {
                int _574 = _556 | _572;
                _384 = as_type<float>(_574);
            }
        }
    }
    float _576 = _384;
    float _578 = in.m_59.w;
    float _580 = -_154;
    float _582 = _580 + 1.0;
    bool _584 = _160 > 0.5;
    float _586 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _588 = in.m_44.x;
    float _590 = in.m_44.y;
    float _592 = in.m_44.z;
    float _594 = _188 * _188;
    float _596 = in.m_61.x;
    float _598 = in.m_61.y;
    float _600 = in.m_61.z;
    int _602 = _584 ? as_type<int>(_582) : as_type<int>(_154);
    float _604 = _162 * 3.1415927410125732421875;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _608 = _606 != 0;
    float _610 = in.m_63.x;
    float _612 = in.m_63.y;
    float _614 = in.m_63.z;
    float _616 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    float _622 = _576 + 3.1415927410125732421875;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _626 = _624 != 0;
    float _628 = _604 * 0.15915493667125701904296875;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _632 = _630 != 0;
    float _634 = _622 * 0.15915493667125701904296875;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    float _640 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _642 = fma(_360, _166, _616);
    bool _644 = _156 > 0.5;
    float _646 = _628 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(_360, _164, _640);
    float _652 = fma(_360, _168, _586);
    float _654 = fma(_642, _578, _590);
    float _656 = fma(_650, _578, _588);
    float _658 = fma(_652, _578, _592);
    float _660 = _190 * _190;
    float _662 = _654 * _190;
    float _664 = _654 * _598;
    float _666 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _668 = fma(_598, _598, _660);
    float _670 = fma(_656, _188, _662);
    float _672 = _654 * _612;
    float _674 = fma(_656, _596, _664);
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _678 = fma(_658, _192, _670);
    float _680 = fma(_656, _610, _672);
    float _682 = fma(_658, _600, _674);
    float _684 = fma(_612, _612, _668);
    float _686 = _678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = _676 * 6.283185482025146484375;
    float _690 = _676 * 12.0;
    float _692 = fma(_658, _614, _680);
    float _694 = _676 * 6.0;
    float _696 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _700 = _686 + _698;
    float _702 = fma(_576, 4.0, _690);
    float _704 = fma(_596, _596, _594);
    float _706 = -_694;
    float _708 = fma(_576, 3.0, _706);
    float _710 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _714 = _696 + _712;
    float _716 = _700 * _700;
    float _718 = _702 * 0.15915493667125701904296875;
    float _720 = fma(_610, _610, _704);
    float _722 = 0.0;
    bool _724 = _626;
    float _726 = _720;
    float _728 = _684;
    if (_620)
    {
        float _730 = in.m_55.x;
        _722 = _730;
    }
    float _732 = _722;
    float _734 = _708 * 0.15915493667125701904296875;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _710 + _736;
    float _740 = fma(_714, _714, _716);
    float _742 = sqrt(_720);
    float _744 = _688 * 0.15915493667125701904296875;
    float _746 = fma(_738, _738, _740);
    float _748 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _750 = _192 * _192;
    float _752 = in.m_59.x;
    float _754 = in.m_59.y;
    float _756 = in.m_59.z;
    float _758 = _718 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = 0.0 + _648;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma(_600, _600, _750);
    float _770 = -_146;
    float _772 = fma(_764, _146, _770);
    float _774 = _734 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _784 = rsqrt(_746);
    float _786 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _788 = _744 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _760 + _776;
    float _794 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _804 = sqrt(_684);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _808 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _810 = -_806;
    float _812 = fma(_748, 2.0, _810);
    float _814 = _626 ? as_type<float>(_602) : _154;
    float _816 = fma(_808, -2.0, _766);
    float _818 = _772;
    float _820 = _778;
    float _822 = _814;
    if (_638)
    {
        float _824 = _644 ? _582 : _154;
        _292 = _824;
    }
    float _826 = _292;
    float _828 = _634 * 6.283185482025146484375;
    float _830 = sin(_828);
    bool _832 = _742 > 0.0;
    float _834 = _700 * _784;
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _816);
    int _838 = as_type<int>(_836);
    if (_620)
    {
        bool _840 = _732 > 0.5;
        _724 = _840;
    }
    bool _842 = _724;
    float _844 = fma(_614, _614, _768);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _848 = _846 + 2.0;
    float _850 = fma(_792, 0.25, 0.5);
    float _852 = -_834;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    bool _856 = _804 > 0.0;
    float _858 = fma(_790, 0.10000002384185791015625, 1.0);
    float _860 = fma(_850, _848, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _862 = _714 * _784;
    float _864 = _854 * _854;
    float _866 = _738 * _784;
    float _868 = _700;
    float _870 = _804;
    bool _872 = _856;
    if (_832)
    {
        float _874 = rsqrt(_720);
        _868 = _874;
    }
    float _876 = _868;
    float _878 = -_862;
    float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _882 = fma(_830, 0.5, 0.5);
    float _884 = -_866;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    if (!_832)
    {
        _870 = 0.0;
    }
    float _888 = _870;
    float _890 = fma(_880, _880, _864);
    float _892 = _882 * _860;
    float _894 = _888;
    float _896 = _892;
    if (!_832)
    {
        _818 = 0.0;
    }
    float _898 = _818;
    float _900 = sqrt(_844);
    float _902 = fma(_886, _886, _890);
    float _904 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _906 = _898;
    if (!_832)
    {
        _726 = 0.0;
    }
    float _908 = _726;
    float _910 = _908;
    if (!_856)
    {
        _820 = 0.0;
    }
    float _912 = _820;
    float _914 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _916 = _882;
    float _918 = _912;
    if (_856)
    {
        float _920 = rsqrt(_684);
        _916 = _920;
    }
    float _922 = _916;
    if (_832)
    {
        float _924 = _876 * _596;
        _894 = _924;
    }
    float _926 = _894;
    if (_832)
    {
        float _928 = _876 * _188;
        _910 = _928;
    }
    float _930 = _910;
    if (_832)
    {
        float _932 = _876 * _610;
        _906 = _932;
    }
    float _934 = _906;
    float _936 = _892 * _904;
    if (!_856)
    {
        _896 = 0.0;
    }
    float _938 = _896;
    float _940 = _858;
    float _942 = _938;
    if (_632)
    {
        float _944 = in.m_55.z;
        _940 = _944;
    }
    float _946 = _940;
    float _948 = sqrt(_902);
    bool _950 = _900 > 0.0;
    float _952 = fma(_936, _914, 1.0);
    if (!_856)
    {
        _728 = 0.0;
    }
    float _954 = _728;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _958 = _954;
    if (_856)
    {
        float _960 = _922 * _598;
        _958 = _960;
    }
    float _962 = _958;
    if (_856)
    {
        float _964 = _922 * _190;
        _918 = _964;
    }
    float _966 = _918;
    if (_856)
    {
        float _968 = _922 * _612;
        _942 = _968;
    }
    float _970 = _942;
    float _972 = _196 * _952;
    float _974 = _194 * _952;
    float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    float _980 = _784 * _948;
    float _982 = in.m_53.x;
    float _984 = _800 * _980;
    float _986 = _914;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _990 = _974;
    float _992 = _982;
    if (_950)
    {
        float _994 = rsqrt(_844);
        _986 = _994;
    }
    float _996 = _986;
    float _998 = _798 * _980;
    float _1000 = _802 * _980;
    float _1002 = _984 * _956;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1006 = _998 * _978;
    float _1008 = _1002 * _962;
    float _1010 = _1000 * _1004;
    float _1012 = _844;
    float _1014 = _1000;
    float _1016 = _1008;
    if (!_608)
    {
        float _1018 = in.m_55.z;
        _1012 = _1018;
    }
    float _1020 = _1012;
    if (!_950)
    {
        _1014 = 0.0;
    }
    float _1022 = _1014;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1002 * _970;
    float _1028 = fma(_1006, _926, _1008);
    float _1030 = _1022;
    float _1032 = _1026;
    if (!_950)
    {
        _1016 = 0.0;
    }
    float _1034 = _1016;
    float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1038 = fma(_1006, _934, _1026);
    float _1040 = _1034;
    if (_950)
    {
        float _1042 = _996 * _600;
        _1030 = _1042;
    }
    float _1044 = _1030;
    if (_950)
    {
        float _1046 = _996 * _614;
        _1040 = _1046;
    }
    float _1048 = _1040;
    if (!_608)
    {
        _1032 = _160;
    }
    float _1050 = _1032;
    float _1052 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    float _1054 = fma(_1010, _1044, _1028);
    float _1056 = fma(_1010, _1048, _1038);
    float _1058 = _976 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1060 = _1050;
    if (_608)
    {
        _1060 = _158;
    }
    float _1062 = _1060;
    float _1064 = _696 + _1054;
    float _1066 = _710 + _1056;
    float _1068 = fma(_1058, _814, -0.5);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1066 + _1074;
    float _1078 = _1066;
    if (_632)
    {
        bool _1080 = _946 > 0.5;
        _872 = _1080;
    }
    bool _1082 = _872;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1086 = _1072 * _1072;
    float _1088 = _1076 * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1092 = _1020;
    float _1094 = _1086;
    float _1096 = _1088;
    if (!_608)
    {
        _822 = _1020;
    }
    float _1098 = _822;
    float _1100 = _1002 * _966;
    float _1102 = _1086 + _1088;
    float _1104 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1090);
    float _1106 = _1098;
    int _1108 = as_type<int>(_1100);
    if (_608)
    {
        _1106 = _160;
    }
    float _1110 = _1106;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_608)
    {
        _1092 = _160;
    }
    float _1114 = _1092;
    float _1116 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    float _1118 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    float _1120 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1122 = fma(_1006, _930, _1100);
    float _1124 = -_836;
    float _1126 = fma(_1116, _1068, _1124);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1130 = sqrt(_1102);
    if (_620)
    {
        float _1132 = -_982;
        float _1134 = _1132 + 1.0;
        _838 = as_type<int>(_1134);
    }
    int _1136 = _838;
    if (!_950)
    {
        _988 = 0.0;
    }
    float _1138 = _988;
    float _1140 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1138;
    if (_950)
    {
        float _1144 = _996 * _192;
        _1142 = _1144;
    }
    float _1146 = _1142;
    if (_632)
    {
        float _1148 = -_982;
        float _1150 = _1148 + 1.0;
        _1108 = as_type<int>(_1150);
    }
    int _1152 = _1108;
    if (!_620)
    {
        _990 = _982;
    }
    float _1154 = _990;
    float _1156 = fma(_1140, _826, -0.5);
    float _1158 = _1154;
    if (_620)
    {
        float _1160 = _842 ? as_type<float>(_1136) : _982;
        _1158 = _1160;
    }
    float _1162 = _1158;
    float _1164 = fma(_1010, _1146, _1122);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1168 = _1164;
    if (_632)
    {
        float _1170 = _1082 ? as_type<float>(_1152) : _982;
        _992 = _1170;
    }
    float _1172 = _992;
    float _1174 = -_782;
    float _1176 = fma(_1120, 2.0, _1174);
    float _1178 = _686 + _1164;
    float _1180 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1128);
    float _1182 = fma(_1166, _1162, -0.5);
    bool _1184 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1178;
    if (!_1184)
    {
        _1168 = _1064;
    }
    float _1188 = _1168;
    bool _1190 = !_1184;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1130 + _1196;
        float _1200 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = rsqrt(_1102);
        float _1204 = _1198 * _1194;
        float _1206 = _1204 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = cos(_1212);
        float _1216 = fma(_1210, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = _1202 * _1216;
        float _1220 = fma(_1072, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1222 = _1214 + (-1.0);
        float _1224 = fma(_1076, _1218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1228 = _1220 + _1226;
        float _1230 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1234 = _1224 + _1232;
        float _1236 = _1228 * _1228;
        float _1238 = fma(_1178, _1214, _1230);
        float _1240 = _1234 * _1234;
        _1186 = _1238;
        _1094 = _1236;
        _1096 = _1240;
        _1192 = _1220;
        _1078 = _1224;
    }
    float _1242 = _1186;
    float _1244 = _1094;
    float _1246 = _1096;
    float _1248 = _1192;
    float _1250 = _1078;
    float _1252 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1052);
    float _1256 = -_118;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1242 + _1260;
    float _1264 = fma(_1252, _1172, -0.5);
    float _1266 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1118);
    float _1268 = fma(_1254, _1182, _1258);
    float _1270 = -_118;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1278 = fma(_1262, _1262, _1244);
    float _1280 = fma(_1266, _1264, _1272);
    float _1282 = fma(_1276, -2.0, _1274);
    float _1284 = _1278 + _1246;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1290 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1282);
    float _1292 = sqrt(_1284);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = -_1290;
    float _1298 = fma(_1288, _1156, _1296);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1306 = _1126 + 0.5;
    float _1308 = _1268 + 0.5;
    float _1310 = _1280 + 0.5;
    float _1312 = _1298 + 0.5;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1316 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1318 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1322 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_65.x = _1308;
    out.m_65.y = _1306;
    out.m_65.z = _1310;
    out.m_65.w = _1312;
    bool _1328 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1292);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1316;
    out.m_69.y = _1318;
    out.m_69.z = _1320;
    out.m_69.w = _1314;
    out.m_71.x = _1340;
    out.m_71.y = _1342;
    out.m_71.z = _1294;
    out.m_71.w = _1338;
    float _1344 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1346 = fma(_440, _166, _1322);
    float _1348 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1350 = fma(_440, _164, _1344);
    float _1352 = -_1346;
    float _1354 = _642 + _1352;
    float _1356 = fma(_440, _168, _1348);
    float _1358 = -_1350;
    float _1360 = _650 + _1358;
    float _1362 = _1354 * _598;
    float _1364 = _1354 * _190;
    float _1366 = _1354 * _612;
    float _1368 = -_1356;
    float _1370 = _652 + _1368;
    float _1372 = fma(_1360, _596, _1362);
    float _1374 = fma(_1360, _188, _1364);
    float _1376 = fma(_1360, _610, _1366);
    float _1378 = fma(_1370, _600, _1372);
    float _1380 = fma(_1370, _192, _1374);
    float _1382 = fma(_1370, _614, _1376);
    float _1384 = _1376;
    float _1386 = _1306;
    float _1388 = _1310;
    float _1390 = _1382;
    float _1392 = _1380;
    float _1394 = _1378;
    float _1396 = _1382;
    if (!_1336)
    {
        _1384 = 1.0;
    }
    float _1398 = _1384;
    bool _1400 = !_1336;
    float _1402 = _1398;
    if (!_1400)
    {
        bool _1404 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1406 = isnan(_1292);
        bool _1408 = _1404 || _1406;
        bool _1410 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1412 = _1408 || _1410;
        if (!_1412)
        {
            float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1416 = _1292 + _1414;
            float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1420 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1418;
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1424 = _1422 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1426 = 1.0 / _1420;
            float _1428 = _1416 * _1426;
            float _1430 = fma(_1428, _1424, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1402 = _1430;
            _1432 = true;
        }
        else
        {
            bool _1434 = _1292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1436 = isnan(_1292);
            bool _1438 = _1434 || _1436;
            bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1442 = _1438 || _1440;
            if (!_1442)
            {
                float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1446 = _1292 + _1444;
                float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1454 = _1452 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1456 = 1.0 / _1450;
                float _1458 = _1446 * _1456;
                float _1460 = fma(_1458, _1454, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1402 = _1460;
                _1432 = true;
            }
            else
            {
                _1402 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1432 = false;
    float _1462 = _1402;
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1466 = _1242 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1470 = _1248 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1474 = _1250 + _1472;
    float _1476 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1474, _1462, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = -_686;
    float _1484 = _1482 + _1476;
    float _1486 = -_696;
    float _1488 = _1486 + _1478;
    float _1490 = -_710;
    float _1492 = _1490 + _1480;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > 0.0;
    bool _1504 = !_1502;
    float _1506 = _1476;
    float _1508 = _1478;
    float _1510 = _1480;
    if (!_1504)
    {
        bool _1512 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1514 = _1500;
        if (_1512)
        {
            float _1516 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1514 = _1516;
        }
        float _1518 = _1514;
        float _1520 = _1518;
        if (_1512)
        {
            float _1522 = _1378 * _1518;
            _1386 = _1522;
        }
        float _1524 = _1386;
        float _1526 = _1524;
        if (_1512)
        {
            float _1528 = _1380 * _1518;
            _1388 = _1528;
        }
        float _1530 = _1388;
        float _1532 = _1530;
        if (_1512)
        {
            float _1534 = _1382 * _1518;
            _1520 = _1534;
        }
        float _1536 = _1520;
        float _1538 = _1536;
        if (!_1512)
        {
            float _1540 = _118 + 1.0;
            float _1542 = _1540;
            if (!_222)
            {
                float _1544 = _1540 * _1540;
                float _1546 = _1544 * 0.5;
                _1390 = _1546;
            }
            float _1548 = _1390;
            float _1550 = _1548;
            if (!_222)
            {
                float _1552 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1550 = _1552;
            }
            float _1554 = _1550;
            bool _1556 = !_222;
            float _1558 = _1554;
            if (!_1556)
            {
                float _1560 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1562 = log2(_1560);
                float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1566 = _1564 + 1.0;
                float _1568 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1570 = _1562 * _1540;
                float _1572 = 1.0 / _1566;
                float _1574 = _1568 * 0.693147182464599609375;
                float _1576 = exp2(_1570);
                float _1578 = 1.0 / _1574;
                float _1580 = _1576 + (-1.0);
                float _1582 = -_1580;
                float _1584 = fma(_1582, _1578, _1540);
                float _1586 = _1584 * _1572;
                float _1588 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1558 = _1588;
            }
            float _1590 = _1558;
            float _1592 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1594 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1596 = !_222;
            if (!_1596)
            {
                float _1598 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1600 = log2(_1598);
                float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1604 = _1602 + 1.0;
                float _1606 = 1.0 / _1604;
                float _1608 = _1600 * _1540;
                float _1610 = exp2(_1608);
                float _1612 = -_1610;
                float _1614 = _1612 + 1.0;
                float _1616 = _1614 * _1606;
                _1542 = _1616;
            }
            float _1618 = _1542;
            float _1620 = fma(_1618, _166, _1594);
            float _1622 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1624 = fma(_1618, _164, _1592);
            float _1626 = -_1346;
            float _1628 = _1626 + _1620;
            float _1630 = fma(_1618, _168, _1622);
            float _1632 = -_1350;
            float _1634 = _1632 + _1624;
            float _1636 = _1628 * _598;
            float _1638 = _1628 * _190;
            float _1640 = _1628 * _612;
            float _1642 = -_1356;
            float _1644 = _1642 + _1630;
            float _1646 = fma(_1634, _596, _1636);
            float _1648 = fma(_1634, _188, _1638);
            float _1650 = fma(_1634, _610, _1640);
            float _1652 = fma(_1644, _600, _1646);
            float _1654 = fma(_1644, _192, _1648);
            float _1656 = fma(_1644, _614, _1650);
            _1392 = _1654;
            _1394 = _1652;
            _1396 = _1656;
            _1526 = _1652;
            _1532 = _1654;
            _1538 = _1656;
        }
        float _1658 = _1392;
        float _1660 = _1394;
        float _1662 = _1396;
        float _1664 = _1526;
        float _1666 = _1532;
        float _1668 = _1538;
        float _1670 = _1658 * _1658;
        float _1672 = rsqrt(_1498);
        float _1674 = fma(_1660, _1660, _1670);
        float _1676 = fma(_1662, _1662, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1488 * _1672;
        float _1682 = _1484 * _1672;
        float _1684 = _1492 * _1672;
        bool _1686 = _1678 > 0.0;
        bool _1688 = !_1686;
        _294 = _1682;
        if (!_1688)
        {
            float _1690 = rsqrt(_1676);
            float _1692 = _1690 * _1658;
            float _1694 = _1690 * _1660;
            float _1696 = _1690 * _1662;
            float _1698 = _1682 * _1692;
            float _1700 = fma(_1680, _1694, _1698);
            float _1702 = fma(_1684, _1696, _1700);
            float _1704 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1706 = fma(_1664, _1704, _1478);
            float _1708 = fma(_1666, _1704, _1476);
            float _1710 = fma(_1668, _1704, _1480);
            _1506 = _1708;
            _1508 = _1706;
            _1510 = _1710;
        }
    }
    float _1712 = _1506;
    float _1714 = _1508;
    float _1716 = _1510;
    float _1718 = _294;
    float _1720 = -_834;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1724 = -_862;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1714);
    float _1728 = -_866;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1738 = _1726 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1742 = _1730 + _1740;
    float _1744 = _1734 * _1734;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1748 = fma(_1738, _1738, _1744);
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = rsqrt(_1750);
    float _1754 = sqrt(_1750);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1758 = _1738 * _1756;
    float _1760 = _1742 * _1756;
    float _1762 = _1758 * _1758;
    float _1764 = _1760 * _1760;
    float _1766 = _1762 + _1764;
    float _1768 = sqrt(_1766);
    bool _1770 = _1768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1774 = _1768 + _1772;
    float _1776 = _1752;
    float _1778 = _1766;
    float _1780 = _1774;
    float _1782 = _1718;
    float _1784 = _1734;
    float _1786 = _1756;
    float _1788 = _1758;
    if (_1770)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1776 = _1790;
    }
    float _1792 = _1776;
    if (_1770)
    {
        float _1794 = rsqrt(_1766);
        _1778 = _1794;
    }
    float _1796 = _1778;
    if (_1770)
    {
        float _1798 = _1774 * _1792;
        _1780 = _1798;
    }
    float _1800 = _1780;
    if (_1770)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1782 = _1802;
    }
    float _1804 = _1782;
    float _1806 = _1792;
    float _1808 = _1804;
    if (_1770)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1742;
    float _1822 = _1818;
    if (_1770)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1756;
    float _1832 = -_1818;
    float _1834 = fma(_1734, _1830, _1832);
    if (!_1770)
    {
        _1784 = _1760;
    }
    float _1836 = _1784;
    float _1838 = _1836;
    if (_1770)
    {
        float _1840 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1814;
    float _1846 = _1842;
    if (_1770)
    {
        float _1848 = fma(_1814, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1844 = _1848;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1770)
    {
        float _1856 = _1828 + (-1.0);
        _1846 = _1856;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (_1770)
    {
        float _1862 = _1796 * _1850;
        _1786 = _1862;
    }
    float _1864 = _1786;
    if (!_1770)
    {
        _1852 = _1834;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1770)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1870;
    }
    float _1872 = _1808;
    if (_1770)
    {
        float _1874 = _1758 * _1864;
        _1788 = _1874;
    }
    float _1876 = _1788;
    if (!_1770)
    {
        _1860 = _1762;
    }
    float _1878 = _1860;
    float _1880 = _1878;
    if (_1770)
    {
        float _1882 = _1760 * _1864;
        _1838 = _1882;
    }
    float _1884 = _1838;
    if (_1770)
    {
        float _1886 = fma(_1834, _1828, _1872);
        _1868 = _1886;
    }
    float _1888 = _1868;
    if (_1770)
    {
        float _1890 = _1876 * _1876;
        _1880 = _1890;
    }
    float _1892 = _1880;
    if (!_1770)
    {
        _1854 = _1764;
    }
    float _1894 = _1854;
    float _1896 = _1894;
    if (_1770)
    {
        float _1898 = _1884 * _1884;
        _1896 = _1898;
    }
    float _1900 = _1896;
    float _1902 = fma(_1888, _1888, _1892);
    float _1904 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1906 = _1902 + _1900;
    float _1908 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1912 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1910);
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1904);
    float _1918 = rsqrt(_1906);
    float _1920 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1924 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1926 = -_1914;
    float _1928 = _1926 + 1.0;
    float _1930 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1932 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1934 = _1924 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1936 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1922);
    float _1938 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1930);
    float _1940 = abs(_1928);
    float _1942 = log2(_1940);
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1932);
    float _1950 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1952 = _1918 * _1876;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1956 = -_1944;
    float _1958 = fma(_1956, _1746, 1.0);
    float _1960 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1962 = _1918 * _1888;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1954);
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1968 = _1918 * _1884;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1964);
    float _1974 = -_1966;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1974);
    float _1978 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1980 = log2(_1958);
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1972);
    float _1984 = -_1968;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1976);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1990 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = fma(_1986, -0.5, 0.5);
    float _1994 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1988);
    float _1996 = exp2(_1978);
    float _1998 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2000 = fma(_1986, 0.5, 0.5);
    float _2002 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1994);
    float _2004 = _1962 + 1.0;
    float _2006 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = fma(_2000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2002);
    float _2012 = 1.0 / _1982;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2016 = fma(_2000, _2008, -0.212114393711090087890625);
    float _2018 = _1980 * 0.693147182464599609375;
    float _2020 = fma(_2000, _2016, 1.570728778839111328125);
    float _2022 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2024 = sqrt(_1992);
    float _2026 = -_1962;
    float _2028 = fma(_1996, _2004, _2026);
    float _2030 = fma(_2028, 0.5, 0.5);
    float _2032 = _2010 * _2012;
    float _2034 = _2014 * _2012;
    float _2036 = fma(_2032, 0.5, 0.5);
    float _2038 = fma(_2034, -0.5, 0.5);
    float _2040 = _2024 * 0.636619746685028076171875;
    float3 _5216 = float3(_2036, _2038, _2022);
    float _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5216, float3(0.0), isnan(_5216)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5216, float3(0.0), isnan(_5216)), level(0.0)).x;
    float3 _5227 = float3(_2036, _2038, _2022);
    float4 _2045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _2047 = _2045.x;
    float _2049 = _2045.y;
    float _2051 = _2045.z;
    float _2053 = _2045.w;
    float _2055 = -_2020;
    float _2057 = fma(_2040, _2055, 1.0);
    float2 _5249 = float2(_2057, _2030);
    float3 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2071 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2073 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2071);
    float _2075 = exp2(_2069);
    float _2077 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2073);
    float _2079 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2077);
    float _2081 = _2079 + _1982;
    out.gl_Position.x = _2010;
    out.gl_Position.y = _2014;
    out.gl_Position.z = _2079;
    out.gl_Position.w = _1982;
    float _2083 = _2081 * 0.5;
    float _2085 = -_2075;
    float _2087 = _2085 + 1.0;
    float _2089 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2083;
    out.m_73.w = _1982;
    float _2091 = _2089 * _2042;
    float _2093 = -_2089;
    float _2095 = _2093 + 1.0;
    float _2097 = _2053 * _2091;
    float _2099 = _2067 * _2091;
    float _2101 = fma(_2063, _2097, _2047);
    float _2103 = fma(_2065, _2097, _2049);
    float _2105 = _2053 * _2095;
    float _2107 = fma(_2053, _2099, _2051);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2101;
    out.m_75.y = _2103;
    out.m_75.z = _2107;
    out.m_75.w = _2105;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

