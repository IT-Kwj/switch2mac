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
    float4 m_59 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
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
    bool _1460 = false;
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
        float _2191 = as_type<float>(_108);
        out.gl_Position.z = _2191;
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
        float _2255 = as_type<float>(_142);
        out.gl_Position.z = _2255;
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
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _172 = _170 != 0;
    float _174 = in.m_55.w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    int _180 = int(_134);
    int _182 = _178 ? 2 : 0;
    int _184 = _180 | _182;
    int _186 = _168 ? 4 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 8 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 16 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 32 : 0;
    int _200 = _196 | _198;
    int _202 = _172 ? 64 : 0;
    int _204 = _200 | _202;
    int _206 = _204 & 64;
    float _208 = in.m_57.w;
    float _210 = _118 * _150;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    float _218 = as_type<float>(_206);
    float _220 = _152;
    float _222 = _210;
    int _224 = _172 ? (-1) : 0;
    if (!_168)
    {
        float _226 = _152 * _152;
        float _228 = _226 * 0.5;
        _218 = _228;
    }
    float _230 = _218;
    float _232 = abs(_144);
    float _234 = abs(_148);
    float _236 = precise::max(_232, _234);
    float _238 = in.m_61.x;
    float _240 = in.m_61.y;
    float _242 = in.m_61.z;
    float _244 = _230;
    float _246 = _148;
    float _248 = _144;
    if (!_168)
    {
        float _250 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _250;
    }
    float _252 = _244;
    bool _254 = _236 >= 16.0;
    float _256 = fma(_210, 1.25, 0.75);
    float _258 = in.m_63.x;
    float _260 = in.m_63.y;
    float _262 = in.m_63.z;
    float _264 = -_154;
    float _266 = _264 + 1.0;
    float _268 = -_148;
    float _270 = fma(_256, _148, _268);
    float _272 = -_144;
    float _274 = fma(_256, _144, _272);
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _286 = in.m_49.x;
    float _288 = in.m_49.y;
    float _290 = in.m_49.z;
    float _292 = _252;
    float _294 = _154;
    if (_254)
    {
        float _296 = _148 * 0.0625;
        _246 = _296;
    }
    float _298 = _246;
    if (_254)
    {
        float _300 = _144 * 0.0625;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = _158 > 0.5;
    float _306 = abs(_298);
    bool _308 = _306 != 0.0;
    bool _310 = isnan(_306);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    int _318 = _304 ? as_type<int>(_266) : as_type<int>(_154);
    float _320 = abs(_302);
    bool _322 = _320 == 0.0;
    bool _324 = !_316;
    bool _326 = _322 && _324;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _330 = _328 != 0;
    bool _332 = false;
    if (_326)
    {
        bool _334 = as_type<int>(_302) >= 0;
        _332 = _334;
    }
    bool _336 = _332;
    int _338 = 0;
    if (_326)
    {
        int _340 = _336 ? 0 : 1078530011;
        _338 = _340;
    }
    int _342 = _338;
    bool _344 = !_168;
    float _346 = 0.0;
    int _348 = _342;
    float _350 = _260;
    if (!_344)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _152 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _152);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _380;
        _346 = _364;
    }
    float _382 = _292;
    float _384 = _346;
    bool _386 = !_168;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _152 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _220 = _408;
    }
    float _410 = _220;
    float _412 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (_326)
    {
        int _414 = int(0x80000000) & as_type<int>(_298);
        int _416 = _342 | _414;
        _348 = _416;
    }
    int _418 = _348;
    float _420 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _422 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _422;
    int _426 = _418;
    float _428 = as_type<float>(_418);
    if (!_168)
    {
        float _430 = _118 * _118;
        float _432 = _430 * 0.5;
        _388 = _432;
    }
    float _434 = _388;
    float _436 = fma(_410, _286, _412);
    float _438 = fma(_410, _288, _420);
    float _440 = fma(_410, _290, _422);
    float _442 = _210 * 3.1415927410125732421875;
    float _444 = _212 * _212;
    if (!_168)
    {
        float _446 = _434 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _446;
    }
    float _448 = _222;
    float _450 = _448;
    if (!_168)
    {
        _424 = _118;
    }
    float _452 = _424;
    bool _454 = !_168;
    float _456 = _452;
    if (!_454)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = _118 * _460;
        float _470 = 1.0 / _464;
        float _472 = _466 * 0.693147182464599609375;
        float _474 = exp2(_468);
        float _476 = 1.0 / _472;
        float _478 = _474 + (-1.0);
        float _480 = -_478;
        float _482 = fma(_480, _476, _118);
        float _484 = _482 * _470;
        float _486 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _450 = _486;
    }
    float _488 = _450;
    bool _490 = !_168;
    if (!_490)
    {
        float _492 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _494 = log2(_492);
        float _496 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _498 = _496 + 1.0;
        float _500 = 1.0 / _498;
        float _502 = _118 * _494;
        float _504 = exp2(_502);
        float _506 = -_504;
        float _508 = _506 + 1.0;
        float _510 = _508 * _500;
        _456 = _510;
    }
    float _512 = _456;
    float _514 = abs(_302);
    bool _516 = _514 == 0.0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _520 = _518 != 0;
    bool _522 = !_316;
    bool _524 = _522 && _516;
    if (!_524)
    {
        float _526 = abs(_298);
        bool _528 = _526 != as_type<float>(0x7f800000u /* inf */);
        bool _530 = isnan(_526);
        bool _532 = _528 || _530;
        bool _534 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _536 = _532 || _534;
        float _538 = abs(_302);
        bool _540 = _538 == as_type<float>(0x7f800000u /* inf */);
        bool _542 = !_536;
        bool _544 = _540 && _542;
        if (_544)
        {
            _426 = 1075235812;
        }
        int _546 = _426;
        int _548 = _546;
        if (_544)
        {
            bool _550 = as_type<int>(_302) >= 0;
            _224 = _550 ? (-1) : 0;
        }
        int _552 = _224;
        if (_544)
        {
            int _554 = ~_552;
            int _556 = (_554 != 0) ? _546 : 1061752795;
            _548 = _556;
        }
        int _558 = _548;
        float _560 = as_type<float>(_558);
        if (_544)
        {
            int _562 = int(0x80000000) & as_type<int>(_298);
            int _564 = _558 | _562;
            _560 = as_type<float>(_564);
        }
        float _566 = _560;
        float _568 = abs(_302);
        bool _570 = _568 == as_type<float>(0x7f800000u /* inf */);
        bool _572 = !_536;
        bool _574 = _572 && _570;
        _428 = _566;
        if (!_574)
        {
            float _576 = abs(_302);
            float _578 = abs(_298);
            float _580 = precise::max(_576, _578);
            float _582 = abs(_302);
            float _584 = abs(_298);
            float _586 = precise::min(_582, _584);
            float _588 = 1.0 / _580;
            float _590 = abs(_298);
            float _592 = abs(_302);
            bool _594 = _590 > _592;
            float _596 = _586 * _588;
            float _598 = _596 * _596;
            float _600 = _598 + 11.33538818359375;
            float _602 = fma(_598, _600, 28.84246826171875);
            float _604 = fma(_598, _602, 19.6966705322265625);
            float _606 = fma(_598, -0.82336294651031494140625, -5.674867153167724609375);
            float _608 = abs(_302);
            float _610 = abs(_298);
            float _612 = _608 + _610;
            int _614 = as_type<int>(_298) & int(0x80000000);
            float _616 = fma(_598, _606, -6.565555095672607421875);
            float _618 = 1.0 / _604;
            float _620 = _598 * _616;
            float _622 = _596 * _620;
            float _624 = fma(_622, _618, _596);
            float _626 = _624;
            _428 = _612;
            if (_594)
            {
                float _628 = -_624;
                float _630 = _628 + 1.57079637050628662109375;
                _626 = _630;
            }
            float _632 = _626;
            bool _634 = as_type<int>(_302) >= 0;
            int _636 = as_type<int>(_632);
            if (!_634)
            {
                float _638 = -_632;
                float _640 = _638 + 3.1415927410125732421875;
                _636 = as_type<int>(_640);
            }
            int _642 = _636;
            bool _644 = _612 > as_type<float>(0x7f800000u /* inf */);
            bool _646 = isnan(_612);
            bool _648 = _644 || _646;
            bool _650 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _652 = _648 || _650;
            if (!_652)
            {
                int _654 = _614 | _642;
                _428 = as_type<float>(_654);
            }
        }
    }
    float _656 = _428;
    float _658 = _442 * 0.15915493667125701904296875;
    float _660 = fma(_238, _238, _444);
    float _662 = in.m_57.x;
    float _664 = in.m_57.y;
    float _666 = in.m_57.z;
    float _668 = _214 * _214;
    float _670 = fma(_438, _208, _278);
    float _672 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _674 = fma(_258, _258, _660);
    float _676 = fma(_436, _208, _276);
    float _678 = fma(_240, _240, _668);
    float _680 = _670 * _240;
    float _682 = _670 * _214;
    float _684 = _670 * _260;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _688 = fma(_440, _208, _280);
    float _690 = fma(_260, _260, _678);
    float _692 = fma(_676, _238, _680);
    float _694 = fma(_676, _212, _682);
    float _696 = fma(_676, _258, _684);
    float _698 = _686 * 6.283185482025146484375;
    float _700 = fma(_688, _242, _692);
    float _702 = fma(_688, _216, _694);
    float _704 = fma(_688, _262, _696);
    float _706 = _698 * 0.15915493667125701904296875;
    float _708 = _686 * 12.0;
    float _710 = _686 * 6.0;
    float _712 = _662 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = fma(_656, 4.0, _708);
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _720 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 * 0.15915493667125701904296875;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = -_710;
    float _728 = fma(_656, 3.0, _726);
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _716 + _730;
    float _734 = 0.0;
    float _736 = _674;
    if (_178)
    {
        float _738 = in.m_55.x;
        _734 = _738;
    }
    float _740 = _734;
    float _742 = _704 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _720 + _746;
    float _750 = _732 * _732;
    float _752 = sqrt(_674);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = fma(_748, _748, _750);
    float _764 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = _664 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = fma(_756, _756, _762);
    float _772 = _722 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_764, -2.0, _724);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = -_718;
    float _784 = fma(_768, 2.0, _782);
    bool _786 = _174 > 0.5;
    float _788 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = _780 ? as_type<float>(_318) : _154;
    float _792 = _656 + 3.1415927410125732421875;
    float _794 = _744 * 6.283185482025146484375;
    float _796 = sin(_794);
    bool _798 = _780;
    float _800 = _790;
    if (_760)
    {
        float _802 = _786 ? _266 : _154;
        _294 = _802;
    }
    float _804 = _294;
    float _806 = _216 * _216;
    bool _808 = _752 > 0.0;
    float _810 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_178)
    {
        bool _812 = _740 > 0.5;
        _798 = _812;
    }
    bool _814 = _798;
    float _816 = _792 * 0.15915493667125701904296875;
    float _818 = fma(_242, _242, _806);
    float _820 = rsqrt(_770);
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _824 = fma(_262, _262, _818);
    float _826 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = _658 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _774 + _796;
    float _834 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _840 = _838 + 2.0;
    float _842 = sqrt(_690);
    float _844 = _822 * _820;
    float _846 = fma(_832, 0.25, 0.5);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _732 * _844;
    float _852 = fma(_846, _840, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _854 = _706 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = 0.0 + _830;
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _748 * _844;
    float _864 = -_862;
    float _866 = _748 + _864;
    float _868 = _816 * 6.283185482025146484375;
    float _870 = sin(_868);
    bool _872 = _842 > 0.0;
    float _874 = fma(_856, 0.10000002384185791015625, 1.0);
    float _876 = -_850;
    float _878 = _732 + _876;
    float _880 = -_146;
    float _882 = fma(_860, _146, _880);
    float _884 = _756 * _844;
    float _886 = _732;
    float _888 = _882;
    float _890 = _852;
    bool _892 = _872;
    if (_808)
    {
        float _894 = rsqrt(_674);
        _886 = _894;
    }
    float _896 = _886;
    float _898 = _878 * _878;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _902 = -_884;
    float _904 = _756 + _902;
    float _906 = fma(_870, 0.5, 0.5);
    float _908 = fma(_866, _866, _898);
    float _910 = _908;
    if (!_808)
    {
        _888 = 0.0;
    }
    float _912 = _888;
    float _914 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _916 = sqrt(_824);
    float _918 = fma(_904, _904, _908);
    float _920 = _906 * _852;
    float _922 = _912;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _926 = _914;
    if (!_808)
    {
        _910 = 0.0;
    }
    float _928 = _910;
    float _930 = in.m_53.x;
    float _932 = _928;
    float _934 = _930;
    if (!_808)
    {
        _736 = 0.0;
    }
    float _936 = _736;
    float _938 = _920 * _914;
    float _940 = sqrt(_918);
    float _942 = _936;
    if (_808)
    {
        float _944 = _896 * _238;
        _922 = _944;
    }
    float _946 = _922;
    if (_808)
    {
        float _948 = _896 * _212;
        _932 = _948;
    }
    float _950 = _932;
    if (_808)
    {
        float _952 = _896 * _258;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    if (!_872)
    {
        _924 = 0.0;
    }
    float _958 = _924;
    float _960 = _958;
    if (!_872)
    {
        _926 = 0.0;
    }
    float _962 = _926;
    float _964 = _844;
    float _966 = _962;
    if (_872)
    {
        float _968 = rsqrt(_690);
        _964 = _968;
    }
    float _970 = _964;
    bool _972 = _916 > 0.0;
    float _974 = fma(_938, _956, 1.0);
    if (!_872)
    {
        _890 = 0.0;
    }
    float _976 = _890;
    float _978 = _284 * _974;
    float _980 = _820 * _940;
    float _982 = _690;
    float _984 = _976;
    if (_330)
    {
        float _986 = in.m_55.z;
        _982 = _986;
    }
    float _988 = _982;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _994 = _788 * _980;
    float _996 = _810 * _980;
    float _998 = _834 * _980;
    float _1000 = _998;
    float _1002 = _990;
    if (_872)
    {
        float _1004 = _970 * _240;
        _960 = _1004;
    }
    float _1006 = _960;
    if (_872)
    {
        float _1008 = _970 * _214;
        _966 = _1008;
    }
    float _1010 = _966;
    if (_872)
    {
        float _1012 = _970 * _260;
        _984 = _1012;
    }
    float _1014 = _984;
    float _1016 = _282 * _974;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1020 = _956;
    if (_972)
    {
        float _1022 = rsqrt(_824);
        _1020 = _1022;
    }
    float _1024 = _1020;
    float _1026 = _996 * _990;
    float _1028 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _776);
    float _1030 = _994 * _1018;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1016);
    float _1034 = _1030 * _1006;
    float _1036 = _998 * _1032;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1040 = as_type<int>(_1028);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_972)
    {
        _1000 = 0.0;
    }
    float _1044 = _1000;
    float _1046 = fma(_1026, _946, _1034);
    float _1048 = _1030 * _1014;
    float _1050 = _988;
    float _1052 = _1044;
    float _1054 = _1048;
    if (_330)
    {
        bool _1056 = _988 > 0.5;
        _892 = _1056;
    }
    bool _1058 = _892;
    float _1060 = _946;
    if (!_520)
    {
        float _1062 = in.m_55.z;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (!_972)
    {
        _1050 = 0.0;
    }
    float _1066 = _1050;
    float _1068 = fma(_1026, _954, _1048);
    float _1070 = _1066;
    if (_972)
    {
        float _1072 = _1024 * _242;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_972)
    {
        float _1076 = _1024 * _262;
        _1052 = _1076;
    }
    float _1078 = _1052;
    if (!_520)
    {
        _1054 = _158;
    }
    float _1080 = _1054;
    float _1082 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1038);
    float _1084 = fma(_1036, _1074, _1046);
    float _1086 = fma(_1036, _1078, _1068);
    float _1088 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _1080;
    if (_520)
    {
        _1090 = _156;
    }
    float _1092 = _1090;
    float _1094 = _720 + _1084;
    float _1096 = _742 + _1086;
    float _1098 = fma(_1088, _790, -0.5);
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1096 + _1104;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1030 * _1010;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = fma(_1026, _950, _1110);
    float _1122 = _1112 + _1114;
    float _1124 = _1064;
    int _1126 = as_type<int>(_1110);
    float _1128 = _1112;
    float _1130 = _1114;
    float _1132 = _1096;
    if (!_520)
    {
        _800 = _1064;
    }
    float _1134 = _800;
    float _1136 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1116);
    float _1138 = _1134;
    if (_520)
    {
        _1138 = _158;
    }
    float _1140 = _1138;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_520)
    {
        _1124 = _158;
    }
    float _1144 = _1124;
    float _1146 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1136);
    float _1148 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    if (_330)
    {
        float _1150 = -_930;
        float _1152 = _1150 + 1.0;
        _1126 = as_type<int>(_1152);
    }
    int _1154 = _1126;
    float _1156 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1158 = -_1028;
    float _1160 = fma(_1146, _1098, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1164 = sqrt(_1122);
    if (_178)
    {
        float _1166 = -_930;
        float _1168 = _1166 + 1.0;
        _1040 = as_type<int>(_1168);
    }
    int _1170 = _1040;
    if (!_972)
    {
        _1042 = 0.0;
    }
    float _1172 = _1042;
    float _1174 = _1172;
    if (_972)
    {
        float _1176 = _1024 * _216;
        _1174 = _1176;
    }
    float _1178 = _1174;
    if (!_178)
    {
        _1002 = _930;
    }
    float _1180 = _1002;
    float _1182 = fma(_1156, _804, -0.5);
    float _1184 = _1180;
    if (_178)
    {
        float _1186 = _814 ? as_type<float>(_1170) : _930;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = fma(_1036, _1178, _1120);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1194 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1196 = _1190;
    if (_330)
    {
        float _1198 = _1058 ? as_type<float>(_1154) : _930;
        _934 = _1198;
    }
    float _1200 = _934;
    float _1202 = _716 + _1190;
    float _1204 = -_848;
    float _1206 = fma(_1118, 2.0, _1204);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1210 = fma(_1194, _1188, -0.5);
    bool _1212 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1202;
    if (!_1212)
    {
        _1196 = _1094;
    }
    float _1216 = _1196;
    bool _1218 = !_1212;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1164 + _1224;
        float _1228 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = rsqrt(_1122);
        float _1232 = _1226 * _1222;
        float _1234 = _1232 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = cos(_1240);
        float _1244 = fma(_1238, _1228, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1246 = _1230 * _1244;
        float _1248 = fma(_1102, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1250 = _1242 + (-1.0);
        float _1252 = fma(_1106, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1256 = _1248 + _1254;
        float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1262 = _1252 + _1260;
        float _1264 = _1256 * _1256;
        float _1266 = fma(_1202, _1242, _1258);
        float _1268 = _1262 * _1262;
        _1214 = _1266;
        _1128 = _1264;
        _1130 = _1268;
        _1220 = _1248;
        _1132 = _1252;
    }
    float _1270 = _1214;
    float _1272 = _1128;
    float _1274 = _1130;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1282 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1082);
    float _1284 = -_118;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1290 = _1270 + _1288;
    float _1292 = fma(_1280, _1200, -0.5);
    float _1294 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1148);
    float _1296 = fma(_1282, _1210, _1286);
    float _1298 = -_118;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1206);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1304 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1306 = fma(_1290, _1290, _1272);
    float _1308 = fma(_1294, _1292, _1300);
    float _1310 = fma(_1304, -2.0, _1302);
    float _1312 = _1306 + _1274;
    float _1314 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1208);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1320 = _1160 + 0.5;
    float _1322 = sqrt(_1312);
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = -_1318;
    float _1328 = fma(_1314, _1182, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1336 = _1296 + 0.5;
    float _1338 = _1308 + 0.5;
    float _1340 = _1328 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_65.x = _1336;
    out.m_65.y = _1320;
    out.m_65.z = _1338;
    out.m_65.w = _1340;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1356 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1322);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1344;
    out.m_69.y = _1346;
    out.m_69.z = _1348;
    out.m_69.w = _1342;
    out.m_71.x = _1368;
    out.m_71.y = _1370;
    out.m_71.z = _1324;
    out.m_71.w = _1366;
    float _1372 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1374 = fma(_512, _288, _1350);
    float _1376 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1378 = fma(_512, _286, _1372);
    float _1380 = -_1374;
    float _1382 = _438 + _1380;
    float _1384 = fma(_512, _290, _1376);
    float _1386 = -_1378;
    float _1388 = _436 + _1386;
    float _1390 = _1382 * _240;
    float _1392 = _1382 * _214;
    float _1394 = _1382 * _260;
    float _1396 = -_1384;
    float _1398 = _440 + _1396;
    float _1400 = fma(_1388, _238, _1390);
    float _1402 = fma(_1388, _212, _1392);
    float _1404 = fma(_1388, _258, _1394);
    float _1406 = _1394;
    float _1408 = _1366;
    float _1410 = _1336;
    if (!_1364)
    {
        _1406 = 1.0;
    }
    float _1412 = _1406;
    float _1414 = fma(_1398, _242, _1400);
    float _1416 = fma(_1398, _216, _1402);
    float _1418 = fma(_1398, _262, _1404);
    bool _1420 = !_1364;
    float _1422 = _1412;
    float _1424 = _1414;
    float _1426 = _1416;
    float _1428 = _1414;
    float _1430 = _1418;
    if (!_1420)
    {
        bool _1432 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1322);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1322 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1322);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1322 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1488;
                _1460 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1422;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1270 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1498 = _1276 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1502 = _1278 + _1500;
    float _1504 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1506 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1508 = fma(_1502, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1510 = -_716;
    float _1512 = _1510 + _1504;
    float _1514 = -_720;
    float _1516 = _1514 + _1506;
    float _1518 = -_742;
    float _1520 = _1518 + _1508;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = sqrt(_1526);
    bool _1530 = _1528 > 0.0;
    bool _1532 = !_1530;
    float _1534 = _1504;
    float _1536 = _1506;
    float _1538 = _1508;
    if (!_1532)
    {
        bool _1540 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1542 = _1528;
        if (_1540)
        {
            float _1544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1542 = _1544;
        }
        float _1546 = _1542;
        float _1548 = _1546;
        if (_1540)
        {
            float _1550 = _1414 * _1546;
            _1408 = _1550;
        }
        float _1552 = _1408;
        float _1554 = _1552;
        if (_1540)
        {
            float _1556 = _1416 * _1546;
            _1410 = _1556;
        }
        float _1558 = _1410;
        float _1560 = _1558;
        if (_1540)
        {
            float _1562 = _1418 * _1546;
            _1548 = _1562;
        }
        float _1564 = _1548;
        float _1566 = _1564;
        if (!_1540)
        {
            float _1568 = _118 + 1.0;
            float _1570 = _1568;
            if (!_168)
            {
                float _1572 = _1568 * _1568;
                float _1574 = _1572 * 0.5;
                _1424 = _1574;
            }
            float _1576 = _1424;
            float _1578 = _1576;
            if (!_168)
            {
                float _1580 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1578 = _1580;
            }
            float _1582 = _1578;
            bool _1584 = !_168;
            float _1586 = _1582;
            if (!_1584)
            {
                float _1588 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1590 = log2(_1588);
                float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1594 = _1592 + 1.0;
                float _1596 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1598 = _1590 * _1568;
                float _1600 = exp2(_1598);
                float _1602 = _1596 * 0.693147182464599609375;
                float _1604 = 1.0 / _1602;
                float _1606 = 1.0 / _1594;
                float _1608 = _1600 + (-1.0);
                float _1610 = -_1608;
                float _1612 = fma(_1610, _1604, _1568);
                float _1614 = _1612 * _1606;
                float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1586 = _1616;
            }
            float _1618 = _1586;
            float _1620 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1624 = !_168;
            if (!_1624)
            {
                float _1626 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1628 = log2(_1626);
                float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1632 = _1630 + 1.0;
                float _1634 = 1.0 / _1632;
                float _1636 = _1628 * _1568;
                float _1638 = exp2(_1636);
                float _1640 = -_1638;
                float _1642 = _1640 + 1.0;
                float _1644 = _1642 * _1634;
                _1570 = _1644;
            }
            float _1646 = _1570;
            float _1648 = fma(_1646, _288, _1622);
            float _1650 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1652 = fma(_1646, _286, _1620);
            float _1654 = -_1374;
            float _1656 = _1654 + _1648;
            float _1658 = fma(_1646, _290, _1650);
            float _1660 = -_1378;
            float _1662 = _1660 + _1652;
            float _1664 = _1656 * _240;
            float _1666 = _1656 * _214;
            float _1668 = _1656 * _260;
            float _1670 = -_1384;
            float _1672 = _1670 + _1658;
            float _1674 = fma(_1662, _238, _1664);
            float _1676 = fma(_1662, _212, _1666);
            float _1678 = fma(_1662, _258, _1668);
            float _1680 = fma(_1672, _242, _1674);
            float _1682 = fma(_1672, _216, _1676);
            float _1684 = fma(_1672, _262, _1678);
            _1426 = _1682;
            _1428 = _1680;
            _1430 = _1684;
            _1554 = _1680;
            _1560 = _1682;
            _1566 = _1684;
        }
        float _1686 = _1426;
        float _1688 = _1428;
        float _1690 = _1430;
        float _1692 = _1554;
        float _1694 = _1560;
        float _1696 = _1566;
        float _1698 = _1686 * _1686;
        float _1700 = rsqrt(_1526);
        float _1702 = fma(_1688, _1688, _1698);
        float _1704 = fma(_1690, _1690, _1702);
        float _1706 = sqrt(_1704);
        float _1708 = _1516 * _1700;
        float _1710 = _1512 * _1700;
        float _1712 = _1520 * _1700;
        bool _1714 = _1706 > 0.0;
        bool _1716 = !_1714;
        _350 = _1710;
        if (!_1716)
        {
            float _1718 = rsqrt(_1704);
            float _1720 = _1718 * _1686;
            float _1722 = _1718 * _1688;
            float _1724 = _1718 * _1690;
            float _1726 = _1710 * _1720;
            float _1728 = fma(_1708, _1722, _1726);
            float _1730 = fma(_1712, _1724, _1728);
            float _1732 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1692, _1732, _1506);
            float _1736 = fma(_1694, _1732, _1504);
            float _1738 = fma(_1696, _1732, _1508);
            _1534 = _1736;
            _1536 = _1734;
            _1538 = _1738;
        }
    }
    float _1740 = _1534;
    float _1742 = _1536;
    float _1744 = _1538;
    float _1746 = _350;
    float _1748 = -_850;
    float _1750 = _1748 + _1740;
    float _1752 = -_862;
    float _1754 = _1752 + _1742;
    float _1756 = -_884;
    float _1758 = _1756 + _1744;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1766 = _1754 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1770 = _1758 + _1768;
    float _1772 = _1762 * _1762;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = fma(_1770, _1770, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1786 = _1766 * _1784;
    float _1788 = _1770 * _1784;
    float _1790 = _1786 * _1786;
    float _1792 = _1788 * _1788;
    float _1794 = _1790 + _1792;
    float _1796 = sqrt(_1794);
    bool _1798 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = _1796 + _1800;
    float _1804 = _1780;
    float _1806 = _1794;
    float _1808 = _1802;
    float _1810 = _1746;
    float _1812 = _1762;
    float _1814 = _1784;
    float _1816 = _1786;
    if (_1798)
    {
        float _1818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1818;
    }
    float _1820 = _1804;
    if (_1798)
    {
        float _1822 = rsqrt(_1794);
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1798)
    {
        float _1826 = _1802 * _1820;
        _1808 = _1826;
    }
    float _1828 = _1808;
    if (_1798)
    {
        float _1830 = _1828 * 0.15915493667125701904296875;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1820;
    float _1836 = _1832;
    if (_1798)
    {
        float _1838 = _1832 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1834 = _1840;
    }
    float _1842 = _1834;
    float _1844 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1846 = precise::max(0.0, _1844);
    float _1848 = _1770;
    float _1850 = _1846;
    if (_1798)
    {
        float _1852 = _1832 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = -_1784;
    float _1860 = -_1846;
    float _1862 = fma(_1762, _1858, _1860);
    if (!_1798)
    {
        _1812 = _1788;
    }
    float _1864 = _1812;
    float _1866 = _1864;
    if (_1798)
    {
        float _1868 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1868;
    }
    float _1870 = _1850;
    float _1872 = _1842;
    float _1874 = _1870;
    if (_1798)
    {
        float _1876 = fma(_1842, _1870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1872 = _1876;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    float _1882 = _1856;
    if (_1798)
    {
        float _1884 = _1856 + (-1.0);
        _1874 = _1884;
    }
    float _1886 = _1874;
    float _1888 = _1886;
    if (_1798)
    {
        float _1890 = _1824 * _1878;
        _1814 = _1890;
    }
    float _1892 = _1814;
    if (!_1798)
    {
        _1880 = _1862;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1798)
    {
        float _1898 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1898;
    }
    float _1900 = _1836;
    if (_1798)
    {
        float _1902 = _1786 * _1892;
        _1816 = _1902;
    }
    float _1904 = _1816;
    if (!_1798)
    {
        _1888 = _1790;
    }
    float _1906 = _1888;
    float _1908 = _1906;
    if (_1798)
    {
        float _1910 = _1788 * _1892;
        _1866 = _1910;
    }
    float _1912 = _1866;
    if (_1798)
    {
        float _1914 = fma(_1862, _1856, _1900);
        _1896 = _1914;
    }
    float _1916 = _1896;
    if (_1798)
    {
        float _1918 = _1904 * _1904;
        _1908 = _1918;
    }
    float _1920 = _1908;
    if (!_1798)
    {
        _1882 = _1792;
    }
    float _1922 = _1882;
    float _1924 = _1922;
    if (_1798)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1916, _1916, _1920);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1934 = _1930 + _1928;
    float _1936 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1940 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1938);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1932);
    float _1946 = rsqrt(_1934);
    float _1948 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1950 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1936);
    float _1952 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1948);
    float _1960 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1964 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1950);
    float _1966 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = abs(_1956);
    float _1970 = log2(_1968);
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1976 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1978 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1980 = _1946 * _1904;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1984 = -_1972;
    float _1986 = fma(_1984, _1774, 1.0);
    float _1988 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1990 = _1946 * _1916;
    float _1992 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1982);
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = _1946 * _1912;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = -_1994;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2002);
    float _2006 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2008 = log2(_1986);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = -_1996;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2004);
    float _2016 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = fma(_2014, -0.5, 0.5);
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2024 = exp2(_2006);
    float _2026 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2028 = fma(_2014, 0.5, 0.5);
    float _2030 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2022);
    float _2032 = _1990 + 1.0;
    float _2034 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2026);
    float _2036 = fma(_2028, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2038 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2030);
    float _2040 = 1.0 / _2010;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2034);
    float _2044 = fma(_2028, _2036, -0.212114393711090087890625);
    float _2046 = _2008 * 0.693147182464599609375;
    float _2048 = fma(_2028, _2044, 1.570728778839111328125);
    float _2050 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2052 = sqrt(_2020);
    float _2054 = -_1990;
    float _2056 = fma(_2024, _2032, _2054);
    float _2058 = fma(_2056, 0.5, 0.5);
    float _2060 = _2038 * _2040;
    float _2062 = _2042 * _2040;
    float _2064 = fma(_2060, 0.5, 0.5);
    float _2066 = fma(_2062, -0.5, 0.5);
    float _2068 = _2052 * 0.636619746685028076171875;
    float3 _5277 = float3(_2064, _2066, _2050);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5277, float3(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5277, float3(0.0), isnan(_5277)), level(0.0)).x;
    float3 _5288 = float3(_2064, _2066, _2050);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5288, float3(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5288, float3(0.0), isnan(_5288)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float _2083 = -_2048;
    float _2085 = fma(_2068, _2083, 1.0);
    float2 _5310 = float2(_2085, _2058);
    float3 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2099 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2101 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2099);
    float _2103 = exp2(_2097);
    float _2105 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2107 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2105);
    float _2109 = _2107 + _2010;
    out.gl_Position.x = _2038;
    out.gl_Position.y = _2042;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _2010;
    float _2111 = _2109 * 0.5;
    float _2113 = -_2103;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2111;
    out.m_73.w = _2010;
    float _2119 = _2117 * _2070;
    float _2121 = -_2117;
    float _2123 = _2121 + 1.0;
    float _2125 = _2081 * _2119;
    float _2127 = _2095 * _2119;
    float _2129 = fma(_2091, _2125, _2075);
    float _2131 = fma(_2093, _2125, _2077);
    float _2133 = _2081 * _2123;
    float _2135 = fma(_2081, _2127, _2079);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2129;
    out.m_75.y = _2131;
    out.m_75.z = _2135;
    out.m_75.w = _2133;
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
    bool _1460 = false;
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
        float _2191 = as_type<float>(_108);
        out.gl_Position.z = _2191;
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
        float _2255 = as_type<float>(_142);
        out.gl_Position.z = _2255;
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
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _172 = _170 != 0;
    float _174 = in.m_55.w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    int _180 = int(_134);
    int _182 = _178 ? 2 : 0;
    int _184 = _180 | _182;
    int _186 = _168 ? 4 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 8 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 16 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 32 : 0;
    int _200 = _196 | _198;
    int _202 = _172 ? 64 : 0;
    int _204 = _200 | _202;
    int _206 = _204 & 64;
    float _208 = in.m_57.w;
    float _210 = _118 * _150;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    float _218 = as_type<float>(_206);
    float _220 = _152;
    float _222 = _210;
    int _224 = _172 ? (-1) : 0;
    if (!_168)
    {
        float _226 = _152 * _152;
        float _228 = _226 * 0.5;
        _218 = _228;
    }
    float _230 = _218;
    float _232 = abs(_144);
    float _234 = abs(_148);
    float _236 = precise::max(_232, _234);
    float _238 = in.m_61.x;
    float _240 = in.m_61.y;
    float _242 = in.m_61.z;
    float _244 = _230;
    float _246 = _148;
    float _248 = _144;
    if (!_168)
    {
        float _250 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _250;
    }
    float _252 = _244;
    bool _254 = _236 >= 16.0;
    float _256 = fma(_210, 1.25, 0.75);
    float _258 = in.m_63.x;
    float _260 = in.m_63.y;
    float _262 = in.m_63.z;
    float _264 = -_154;
    float _266 = _264 + 1.0;
    float _268 = -_148;
    float _270 = fma(_256, _148, _268);
    float _272 = -_144;
    float _274 = fma(_256, _144, _272);
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _286 = in.m_49.x;
    float _288 = in.m_49.y;
    float _290 = in.m_49.z;
    float _292 = _252;
    float _294 = _154;
    if (_254)
    {
        float _296 = _148 * 0.0625;
        _246 = _296;
    }
    float _298 = _246;
    if (_254)
    {
        float _300 = _144 * 0.0625;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = _158 > 0.5;
    float _306 = abs(_298);
    bool _308 = _306 != 0.0;
    bool _310 = isnan(_306);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    int _318 = _304 ? as_type<int>(_266) : as_type<int>(_154);
    float _320 = abs(_302);
    bool _322 = _320 == 0.0;
    bool _324 = !_316;
    bool _326 = _322 && _324;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _330 = _328 != 0;
    bool _332 = false;
    if (_326)
    {
        bool _334 = as_type<int>(_302) >= 0;
        _332 = _334;
    }
    bool _336 = _332;
    int _338 = 0;
    if (_326)
    {
        int _340 = _336 ? 0 : 1078530011;
        _338 = _340;
    }
    int _342 = _338;
    bool _344 = !_168;
    float _346 = 0.0;
    int _348 = _342;
    float _350 = _260;
    if (!_344)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _152 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _152);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _380;
        _346 = _364;
    }
    float _382 = _292;
    float _384 = _346;
    bool _386 = !_168;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _152 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _220 = _408;
    }
    float _410 = _220;
    float _412 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (_326)
    {
        int _414 = int(0x80000000) & as_type<int>(_298);
        int _416 = _342 | _414;
        _348 = _416;
    }
    int _418 = _348;
    float _420 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _422 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _422;
    int _426 = _418;
    float _428 = as_type<float>(_418);
    if (!_168)
    {
        float _430 = _118 * _118;
        float _432 = _430 * 0.5;
        _388 = _432;
    }
    float _434 = _388;
    float _436 = fma(_410, _286, _412);
    float _438 = fma(_410, _288, _420);
    float _440 = fma(_410, _290, _422);
    float _442 = _210 * 3.1415927410125732421875;
    float _444 = _212 * _212;
    if (!_168)
    {
        float _446 = _434 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _446;
    }
    float _448 = _222;
    float _450 = _448;
    if (!_168)
    {
        _424 = _118;
    }
    float _452 = _424;
    bool _454 = !_168;
    float _456 = _452;
    if (!_454)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = _118 * _460;
        float _470 = 1.0 / _464;
        float _472 = _466 * 0.693147182464599609375;
        float _474 = exp2(_468);
        float _476 = 1.0 / _472;
        float _478 = _474 + (-1.0);
        float _480 = -_478;
        float _482 = fma(_480, _476, _118);
        float _484 = _482 * _470;
        float _486 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _450 = _486;
    }
    float _488 = _450;
    bool _490 = !_168;
    if (!_490)
    {
        float _492 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _494 = log2(_492);
        float _496 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _498 = _496 + 1.0;
        float _500 = 1.0 / _498;
        float _502 = _118 * _494;
        float _504 = exp2(_502);
        float _506 = -_504;
        float _508 = _506 + 1.0;
        float _510 = _508 * _500;
        _456 = _510;
    }
    float _512 = _456;
    float _514 = abs(_302);
    bool _516 = _514 == 0.0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _520 = _518 != 0;
    bool _522 = !_316;
    bool _524 = _522 && _516;
    if (!_524)
    {
        float _526 = abs(_298);
        bool _528 = _526 != as_type<float>(0x7f800000u /* inf */);
        bool _530 = isnan(_526);
        bool _532 = _528 || _530;
        bool _534 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _536 = _532 || _534;
        float _538 = abs(_302);
        bool _540 = _538 == as_type<float>(0x7f800000u /* inf */);
        bool _542 = !_536;
        bool _544 = _540 && _542;
        if (_544)
        {
            _426 = 1075235812;
        }
        int _546 = _426;
        int _548 = _546;
        if (_544)
        {
            bool _550 = as_type<int>(_302) >= 0;
            _224 = _550 ? (-1) : 0;
        }
        int _552 = _224;
        if (_544)
        {
            int _554 = ~_552;
            int _556 = (_554 != 0) ? _546 : 1061752795;
            _548 = _556;
        }
        int _558 = _548;
        float _560 = as_type<float>(_558);
        if (_544)
        {
            int _562 = int(0x80000000) & as_type<int>(_298);
            int _564 = _558 | _562;
            _560 = as_type<float>(_564);
        }
        float _566 = _560;
        float _568 = abs(_302);
        bool _570 = _568 == as_type<float>(0x7f800000u /* inf */);
        bool _572 = !_536;
        bool _574 = _572 && _570;
        _428 = _566;
        if (!_574)
        {
            float _576 = abs(_302);
            float _578 = abs(_298);
            float _580 = precise::max(_576, _578);
            float _582 = abs(_302);
            float _584 = abs(_298);
            float _586 = precise::min(_582, _584);
            float _588 = 1.0 / _580;
            float _590 = abs(_298);
            float _592 = abs(_302);
            bool _594 = _590 > _592;
            float _596 = _586 * _588;
            float _598 = _596 * _596;
            float _600 = _598 + 11.33538818359375;
            float _602 = fma(_598, _600, 28.84246826171875);
            float _604 = fma(_598, _602, 19.6966705322265625);
            float _606 = fma(_598, -0.82336294651031494140625, -5.674867153167724609375);
            float _608 = abs(_302);
            float _610 = abs(_298);
            float _612 = _608 + _610;
            int _614 = as_type<int>(_298) & int(0x80000000);
            float _616 = fma(_598, _606, -6.565555095672607421875);
            float _618 = 1.0 / _604;
            float _620 = _598 * _616;
            float _622 = _596 * _620;
            float _624 = fma(_622, _618, _596);
            float _626 = _624;
            _428 = _612;
            if (_594)
            {
                float _628 = -_624;
                float _630 = _628 + 1.57079637050628662109375;
                _626 = _630;
            }
            float _632 = _626;
            bool _634 = as_type<int>(_302) >= 0;
            int _636 = as_type<int>(_632);
            if (!_634)
            {
                float _638 = -_632;
                float _640 = _638 + 3.1415927410125732421875;
                _636 = as_type<int>(_640);
            }
            int _642 = _636;
            bool _644 = _612 > as_type<float>(0x7f800000u /* inf */);
            bool _646 = isnan(_612);
            bool _648 = _644 || _646;
            bool _650 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _652 = _648 || _650;
            if (!_652)
            {
                int _654 = _614 | _642;
                _428 = as_type<float>(_654);
            }
        }
    }
    float _656 = _428;
    float _658 = _442 * 0.15915493667125701904296875;
    float _660 = fma(_238, _238, _444);
    float _662 = in.m_57.x;
    float _664 = in.m_57.y;
    float _666 = in.m_57.z;
    float _668 = _214 * _214;
    float _670 = fma(_438, _208, _278);
    float _672 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _674 = fma(_258, _258, _660);
    float _676 = fma(_436, _208, _276);
    float _678 = fma(_240, _240, _668);
    float _680 = _670 * _240;
    float _682 = _670 * _214;
    float _684 = _670 * _260;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _688 = fma(_440, _208, _280);
    float _690 = fma(_260, _260, _678);
    float _692 = fma(_676, _238, _680);
    float _694 = fma(_676, _212, _682);
    float _696 = fma(_676, _258, _684);
    float _698 = _686 * 6.283185482025146484375;
    float _700 = fma(_688, _242, _692);
    float _702 = fma(_688, _216, _694);
    float _704 = fma(_688, _262, _696);
    float _706 = _698 * 0.15915493667125701904296875;
    float _708 = _686 * 12.0;
    float _710 = _686 * 6.0;
    float _712 = _662 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = fma(_656, 4.0, _708);
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _720 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 * 0.15915493667125701904296875;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = -_710;
    float _728 = fma(_656, 3.0, _726);
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _716 + _730;
    float _734 = 0.0;
    float _736 = _674;
    if (_178)
    {
        float _738 = in.m_55.x;
        _734 = _738;
    }
    float _740 = _734;
    float _742 = _704 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _720 + _746;
    float _750 = _732 * _732;
    float _752 = sqrt(_674);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = fma(_748, _748, _750);
    float _764 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = _664 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = fma(_756, _756, _762);
    float _772 = _722 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_764, -2.0, _724);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = -_718;
    float _784 = fma(_768, 2.0, _782);
    bool _786 = _174 > 0.5;
    float _788 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = _780 ? as_type<float>(_318) : _154;
    float _792 = _656 + 3.1415927410125732421875;
    float _794 = _744 * 6.283185482025146484375;
    float _796 = sin(_794);
    bool _798 = _780;
    float _800 = _790;
    if (_760)
    {
        float _802 = _786 ? _266 : _154;
        _294 = _802;
    }
    float _804 = _294;
    float _806 = _216 * _216;
    bool _808 = _752 > 0.0;
    float _810 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_178)
    {
        bool _812 = _740 > 0.5;
        _798 = _812;
    }
    bool _814 = _798;
    float _816 = _792 * 0.15915493667125701904296875;
    float _818 = fma(_242, _242, _806);
    float _820 = rsqrt(_770);
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _824 = fma(_262, _262, _818);
    float _826 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = _658 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _774 + _796;
    float _834 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _840 = _838 + 2.0;
    float _842 = sqrt(_690);
    float _844 = _822 * _820;
    float _846 = fma(_832, 0.25, 0.5);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _732 * _844;
    float _852 = fma(_846, _840, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _854 = _706 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = 0.0 + _830;
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _748 * _844;
    float _864 = -_862;
    float _866 = _748 + _864;
    float _868 = _816 * 6.283185482025146484375;
    float _870 = sin(_868);
    bool _872 = _842 > 0.0;
    float _874 = fma(_856, 0.10000002384185791015625, 1.0);
    float _876 = -_850;
    float _878 = _732 + _876;
    float _880 = -_146;
    float _882 = fma(_860, _146, _880);
    float _884 = _756 * _844;
    float _886 = _732;
    float _888 = _882;
    float _890 = _852;
    bool _892 = _872;
    if (_808)
    {
        float _894 = rsqrt(_674);
        _886 = _894;
    }
    float _896 = _886;
    float _898 = _878 * _878;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _902 = -_884;
    float _904 = _756 + _902;
    float _906 = fma(_870, 0.5, 0.5);
    float _908 = fma(_866, _866, _898);
    float _910 = _908;
    if (!_808)
    {
        _888 = 0.0;
    }
    float _912 = _888;
    float _914 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _916 = sqrt(_824);
    float _918 = fma(_904, _904, _908);
    float _920 = _906 * _852;
    float _922 = _912;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _926 = _914;
    if (!_808)
    {
        _910 = 0.0;
    }
    float _928 = _910;
    float _930 = in.m_53.x;
    float _932 = _928;
    float _934 = _930;
    if (!_808)
    {
        _736 = 0.0;
    }
    float _936 = _736;
    float _938 = _920 * _914;
    float _940 = sqrt(_918);
    float _942 = _936;
    if (_808)
    {
        float _944 = _896 * _238;
        _922 = _944;
    }
    float _946 = _922;
    if (_808)
    {
        float _948 = _896 * _212;
        _932 = _948;
    }
    float _950 = _932;
    if (_808)
    {
        float _952 = _896 * _258;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    if (!_872)
    {
        _924 = 0.0;
    }
    float _958 = _924;
    float _960 = _958;
    if (!_872)
    {
        _926 = 0.0;
    }
    float _962 = _926;
    float _964 = _844;
    float _966 = _962;
    if (_872)
    {
        float _968 = rsqrt(_690);
        _964 = _968;
    }
    float _970 = _964;
    bool _972 = _916 > 0.0;
    float _974 = fma(_938, _956, 1.0);
    if (!_872)
    {
        _890 = 0.0;
    }
    float _976 = _890;
    float _978 = _284 * _974;
    float _980 = _820 * _940;
    float _982 = _690;
    float _984 = _976;
    if (_330)
    {
        float _986 = in.m_55.z;
        _982 = _986;
    }
    float _988 = _982;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _994 = _788 * _980;
    float _996 = _810 * _980;
    float _998 = _834 * _980;
    float _1000 = _998;
    float _1002 = _990;
    if (_872)
    {
        float _1004 = _970 * _240;
        _960 = _1004;
    }
    float _1006 = _960;
    if (_872)
    {
        float _1008 = _970 * _214;
        _966 = _1008;
    }
    float _1010 = _966;
    if (_872)
    {
        float _1012 = _970 * _260;
        _984 = _1012;
    }
    float _1014 = _984;
    float _1016 = _282 * _974;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1020 = _956;
    if (_972)
    {
        float _1022 = rsqrt(_824);
        _1020 = _1022;
    }
    float _1024 = _1020;
    float _1026 = _996 * _990;
    float _1028 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _776);
    float _1030 = _994 * _1018;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1016);
    float _1034 = _1030 * _1006;
    float _1036 = _998 * _1032;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1040 = as_type<int>(_1028);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_972)
    {
        _1000 = 0.0;
    }
    float _1044 = _1000;
    float _1046 = fma(_1026, _946, _1034);
    float _1048 = _1030 * _1014;
    float _1050 = _988;
    float _1052 = _1044;
    float _1054 = _1048;
    if (_330)
    {
        bool _1056 = _988 > 0.5;
        _892 = _1056;
    }
    bool _1058 = _892;
    float _1060 = _946;
    if (!_520)
    {
        float _1062 = in.m_55.z;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (!_972)
    {
        _1050 = 0.0;
    }
    float _1066 = _1050;
    float _1068 = fma(_1026, _954, _1048);
    float _1070 = _1066;
    if (_972)
    {
        float _1072 = _1024 * _242;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_972)
    {
        float _1076 = _1024 * _262;
        _1052 = _1076;
    }
    float _1078 = _1052;
    if (!_520)
    {
        _1054 = _158;
    }
    float _1080 = _1054;
    float _1082 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1038);
    float _1084 = fma(_1036, _1074, _1046);
    float _1086 = fma(_1036, _1078, _1068);
    float _1088 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _1080;
    if (_520)
    {
        _1090 = _156;
    }
    float _1092 = _1090;
    float _1094 = _720 + _1084;
    float _1096 = _742 + _1086;
    float _1098 = fma(_1088, _790, -0.5);
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1096 + _1104;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1030 * _1010;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = fma(_1026, _950, _1110);
    float _1122 = _1112 + _1114;
    float _1124 = _1064;
    int _1126 = as_type<int>(_1110);
    float _1128 = _1112;
    float _1130 = _1114;
    float _1132 = _1096;
    if (!_520)
    {
        _800 = _1064;
    }
    float _1134 = _800;
    float _1136 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1116);
    float _1138 = _1134;
    if (_520)
    {
        _1138 = _158;
    }
    float _1140 = _1138;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_520)
    {
        _1124 = _158;
    }
    float _1144 = _1124;
    float _1146 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1136);
    float _1148 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    if (_330)
    {
        float _1150 = -_930;
        float _1152 = _1150 + 1.0;
        _1126 = as_type<int>(_1152);
    }
    int _1154 = _1126;
    float _1156 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1158 = -_1028;
    float _1160 = fma(_1146, _1098, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1164 = sqrt(_1122);
    if (_178)
    {
        float _1166 = -_930;
        float _1168 = _1166 + 1.0;
        _1040 = as_type<int>(_1168);
    }
    int _1170 = _1040;
    if (!_972)
    {
        _1042 = 0.0;
    }
    float _1172 = _1042;
    float _1174 = _1172;
    if (_972)
    {
        float _1176 = _1024 * _216;
        _1174 = _1176;
    }
    float _1178 = _1174;
    if (!_178)
    {
        _1002 = _930;
    }
    float _1180 = _1002;
    float _1182 = fma(_1156, _804, -0.5);
    float _1184 = _1180;
    if (_178)
    {
        float _1186 = _814 ? as_type<float>(_1170) : _930;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = fma(_1036, _1178, _1120);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1194 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1196 = _1190;
    if (_330)
    {
        float _1198 = _1058 ? as_type<float>(_1154) : _930;
        _934 = _1198;
    }
    float _1200 = _934;
    float _1202 = _716 + _1190;
    float _1204 = -_848;
    float _1206 = fma(_1118, 2.0, _1204);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1210 = fma(_1194, _1188, -0.5);
    bool _1212 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1202;
    if (!_1212)
    {
        _1196 = _1094;
    }
    float _1216 = _1196;
    bool _1218 = !_1212;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1164 + _1224;
        float _1228 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = rsqrt(_1122);
        float _1232 = _1226 * _1222;
        float _1234 = _1232 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = cos(_1240);
        float _1244 = fma(_1238, _1228, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1246 = _1230 * _1244;
        float _1248 = fma(_1102, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1250 = _1242 + (-1.0);
        float _1252 = fma(_1106, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1256 = _1248 + _1254;
        float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1262 = _1252 + _1260;
        float _1264 = _1256 * _1256;
        float _1266 = fma(_1202, _1242, _1258);
        float _1268 = _1262 * _1262;
        _1214 = _1266;
        _1128 = _1264;
        _1130 = _1268;
        _1220 = _1248;
        _1132 = _1252;
    }
    float _1270 = _1214;
    float _1272 = _1128;
    float _1274 = _1130;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1282 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1082);
    float _1284 = -_118;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1290 = _1270 + _1288;
    float _1292 = fma(_1280, _1200, -0.5);
    float _1294 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1148);
    float _1296 = fma(_1282, _1210, _1286);
    float _1298 = -_118;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1206);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1304 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1306 = fma(_1290, _1290, _1272);
    float _1308 = fma(_1294, _1292, _1300);
    float _1310 = fma(_1304, -2.0, _1302);
    float _1312 = _1306 + _1274;
    float _1314 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1208);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1320 = _1160 + 0.5;
    float _1322 = sqrt(_1312);
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = -_1318;
    float _1328 = fma(_1314, _1182, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1336 = _1296 + 0.5;
    float _1338 = _1308 + 0.5;
    float _1340 = _1328 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_65.x = _1336;
    out.m_65.y = _1320;
    out.m_65.z = _1338;
    out.m_65.w = _1340;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1356 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1322);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1344;
    out.m_69.y = _1346;
    out.m_69.z = _1348;
    out.m_69.w = _1342;
    out.m_71.x = _1368;
    out.m_71.y = _1370;
    out.m_71.z = _1324;
    out.m_71.w = _1366;
    float _1372 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1374 = fma(_512, _288, _1350);
    float _1376 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1378 = fma(_512, _286, _1372);
    float _1380 = -_1374;
    float _1382 = _438 + _1380;
    float _1384 = fma(_512, _290, _1376);
    float _1386 = -_1378;
    float _1388 = _436 + _1386;
    float _1390 = _1382 * _240;
    float _1392 = _1382 * _214;
    float _1394 = _1382 * _260;
    float _1396 = -_1384;
    float _1398 = _440 + _1396;
    float _1400 = fma(_1388, _238, _1390);
    float _1402 = fma(_1388, _212, _1392);
    float _1404 = fma(_1388, _258, _1394);
    float _1406 = _1394;
    float _1408 = _1366;
    float _1410 = _1336;
    if (!_1364)
    {
        _1406 = 1.0;
    }
    float _1412 = _1406;
    float _1414 = fma(_1398, _242, _1400);
    float _1416 = fma(_1398, _216, _1402);
    float _1418 = fma(_1398, _262, _1404);
    bool _1420 = !_1364;
    float _1422 = _1412;
    float _1424 = _1414;
    float _1426 = _1416;
    float _1428 = _1414;
    float _1430 = _1418;
    if (!_1420)
    {
        bool _1432 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1322);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1322 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1322);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1322 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1488;
                _1460 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1422;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1270 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1498 = _1276 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1502 = _1278 + _1500;
    float _1504 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1506 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1508 = fma(_1502, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1510 = -_716;
    float _1512 = _1510 + _1504;
    float _1514 = -_720;
    float _1516 = _1514 + _1506;
    float _1518 = -_742;
    float _1520 = _1518 + _1508;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = sqrt(_1526);
    bool _1530 = _1528 > 0.0;
    bool _1532 = !_1530;
    float _1534 = _1504;
    float _1536 = _1506;
    float _1538 = _1508;
    if (!_1532)
    {
        bool _1540 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1542 = _1528;
        if (_1540)
        {
            float _1544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1542 = _1544;
        }
        float _1546 = _1542;
        float _1548 = _1546;
        if (_1540)
        {
            float _1550 = _1414 * _1546;
            _1408 = _1550;
        }
        float _1552 = _1408;
        float _1554 = _1552;
        if (_1540)
        {
            float _1556 = _1416 * _1546;
            _1410 = _1556;
        }
        float _1558 = _1410;
        float _1560 = _1558;
        if (_1540)
        {
            float _1562 = _1418 * _1546;
            _1548 = _1562;
        }
        float _1564 = _1548;
        float _1566 = _1564;
        if (!_1540)
        {
            float _1568 = _118 + 1.0;
            float _1570 = _1568;
            if (!_168)
            {
                float _1572 = _1568 * _1568;
                float _1574 = _1572 * 0.5;
                _1424 = _1574;
            }
            float _1576 = _1424;
            float _1578 = _1576;
            if (!_168)
            {
                float _1580 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1578 = _1580;
            }
            float _1582 = _1578;
            bool _1584 = !_168;
            float _1586 = _1582;
            if (!_1584)
            {
                float _1588 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1590 = log2(_1588);
                float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1594 = _1592 + 1.0;
                float _1596 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1598 = _1590 * _1568;
                float _1600 = exp2(_1598);
                float _1602 = _1596 * 0.693147182464599609375;
                float _1604 = 1.0 / _1602;
                float _1606 = 1.0 / _1594;
                float _1608 = _1600 + (-1.0);
                float _1610 = -_1608;
                float _1612 = fma(_1610, _1604, _1568);
                float _1614 = _1612 * _1606;
                float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1586 = _1616;
            }
            float _1618 = _1586;
            float _1620 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1624 = !_168;
            if (!_1624)
            {
                float _1626 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1628 = log2(_1626);
                float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1632 = _1630 + 1.0;
                float _1634 = 1.0 / _1632;
                float _1636 = _1628 * _1568;
                float _1638 = exp2(_1636);
                float _1640 = -_1638;
                float _1642 = _1640 + 1.0;
                float _1644 = _1642 * _1634;
                _1570 = _1644;
            }
            float _1646 = _1570;
            float _1648 = fma(_1646, _288, _1622);
            float _1650 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1652 = fma(_1646, _286, _1620);
            float _1654 = -_1374;
            float _1656 = _1654 + _1648;
            float _1658 = fma(_1646, _290, _1650);
            float _1660 = -_1378;
            float _1662 = _1660 + _1652;
            float _1664 = _1656 * _240;
            float _1666 = _1656 * _214;
            float _1668 = _1656 * _260;
            float _1670 = -_1384;
            float _1672 = _1670 + _1658;
            float _1674 = fma(_1662, _238, _1664);
            float _1676 = fma(_1662, _212, _1666);
            float _1678 = fma(_1662, _258, _1668);
            float _1680 = fma(_1672, _242, _1674);
            float _1682 = fma(_1672, _216, _1676);
            float _1684 = fma(_1672, _262, _1678);
            _1426 = _1682;
            _1428 = _1680;
            _1430 = _1684;
            _1554 = _1680;
            _1560 = _1682;
            _1566 = _1684;
        }
        float _1686 = _1426;
        float _1688 = _1428;
        float _1690 = _1430;
        float _1692 = _1554;
        float _1694 = _1560;
        float _1696 = _1566;
        float _1698 = _1686 * _1686;
        float _1700 = rsqrt(_1526);
        float _1702 = fma(_1688, _1688, _1698);
        float _1704 = fma(_1690, _1690, _1702);
        float _1706 = sqrt(_1704);
        float _1708 = _1516 * _1700;
        float _1710 = _1512 * _1700;
        float _1712 = _1520 * _1700;
        bool _1714 = _1706 > 0.0;
        bool _1716 = !_1714;
        _350 = _1710;
        if (!_1716)
        {
            float _1718 = rsqrt(_1704);
            float _1720 = _1718 * _1686;
            float _1722 = _1718 * _1688;
            float _1724 = _1718 * _1690;
            float _1726 = _1710 * _1720;
            float _1728 = fma(_1708, _1722, _1726);
            float _1730 = fma(_1712, _1724, _1728);
            float _1732 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1692, _1732, _1506);
            float _1736 = fma(_1694, _1732, _1504);
            float _1738 = fma(_1696, _1732, _1508);
            _1534 = _1736;
            _1536 = _1734;
            _1538 = _1738;
        }
    }
    float _1740 = _1534;
    float _1742 = _1536;
    float _1744 = _1538;
    float _1746 = _350;
    float _1748 = -_850;
    float _1750 = _1748 + _1740;
    float _1752 = -_862;
    float _1754 = _1752 + _1742;
    float _1756 = -_884;
    float _1758 = _1756 + _1744;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1766 = _1754 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1770 = _1758 + _1768;
    float _1772 = _1762 * _1762;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = fma(_1770, _1770, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1786 = _1766 * _1784;
    float _1788 = _1770 * _1784;
    float _1790 = _1786 * _1786;
    float _1792 = _1788 * _1788;
    float _1794 = _1790 + _1792;
    float _1796 = sqrt(_1794);
    bool _1798 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = _1796 + _1800;
    float _1804 = _1780;
    float _1806 = _1794;
    float _1808 = _1802;
    float _1810 = _1746;
    float _1812 = _1762;
    float _1814 = _1784;
    float _1816 = _1786;
    if (_1798)
    {
        float _1818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1818;
    }
    float _1820 = _1804;
    if (_1798)
    {
        float _1822 = rsqrt(_1794);
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1798)
    {
        float _1826 = _1802 * _1820;
        _1808 = _1826;
    }
    float _1828 = _1808;
    if (_1798)
    {
        float _1830 = _1828 * 0.15915493667125701904296875;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1820;
    float _1836 = _1832;
    if (_1798)
    {
        float _1838 = _1832 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1834 = _1840;
    }
    float _1842 = _1834;
    float _1844 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1846 = precise::max(0.0, _1844);
    float _1848 = _1770;
    float _1850 = _1846;
    if (_1798)
    {
        float _1852 = _1832 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = -_1784;
    float _1860 = -_1846;
    float _1862 = fma(_1762, _1858, _1860);
    if (!_1798)
    {
        _1812 = _1788;
    }
    float _1864 = _1812;
    float _1866 = _1864;
    if (_1798)
    {
        float _1868 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1868;
    }
    float _1870 = _1850;
    float _1872 = _1842;
    float _1874 = _1870;
    if (_1798)
    {
        float _1876 = fma(_1842, _1870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1872 = _1876;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    float _1882 = _1856;
    if (_1798)
    {
        float _1884 = _1856 + (-1.0);
        _1874 = _1884;
    }
    float _1886 = _1874;
    float _1888 = _1886;
    if (_1798)
    {
        float _1890 = _1824 * _1878;
        _1814 = _1890;
    }
    float _1892 = _1814;
    if (!_1798)
    {
        _1880 = _1862;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1798)
    {
        float _1898 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1898;
    }
    float _1900 = _1836;
    if (_1798)
    {
        float _1902 = _1786 * _1892;
        _1816 = _1902;
    }
    float _1904 = _1816;
    if (!_1798)
    {
        _1888 = _1790;
    }
    float _1906 = _1888;
    float _1908 = _1906;
    if (_1798)
    {
        float _1910 = _1788 * _1892;
        _1866 = _1910;
    }
    float _1912 = _1866;
    if (_1798)
    {
        float _1914 = fma(_1862, _1856, _1900);
        _1896 = _1914;
    }
    float _1916 = _1896;
    if (_1798)
    {
        float _1918 = _1904 * _1904;
        _1908 = _1918;
    }
    float _1920 = _1908;
    if (!_1798)
    {
        _1882 = _1792;
    }
    float _1922 = _1882;
    float _1924 = _1922;
    if (_1798)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1916, _1916, _1920);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1934 = _1930 + _1928;
    float _1936 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1940 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1938);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1932);
    float _1946 = rsqrt(_1934);
    float _1948 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1950 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1936);
    float _1952 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1948);
    float _1960 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1964 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1950);
    float _1966 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = abs(_1956);
    float _1970 = log2(_1968);
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1976 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1978 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1980 = _1946 * _1904;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1984 = -_1972;
    float _1986 = fma(_1984, _1774, 1.0);
    float _1988 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1990 = _1946 * _1916;
    float _1992 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1982);
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = _1946 * _1912;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = -_1994;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2002);
    float _2006 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2008 = log2(_1986);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = -_1996;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2004);
    float _2016 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = fma(_2014, -0.5, 0.5);
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2024 = exp2(_2006);
    float _2026 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2028 = fma(_2014, 0.5, 0.5);
    float _2030 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2022);
    float _2032 = _1990 + 1.0;
    float _2034 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2026);
    float _2036 = fma(_2028, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2038 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2030);
    float _2040 = 1.0 / _2010;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2034);
    float _2044 = fma(_2028, _2036, -0.212114393711090087890625);
    float _2046 = _2008 * 0.693147182464599609375;
    float _2048 = fma(_2028, _2044, 1.570728778839111328125);
    float _2050 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2052 = sqrt(_2020);
    float _2054 = -_1990;
    float _2056 = fma(_2024, _2032, _2054);
    float _2058 = fma(_2056, 0.5, 0.5);
    float _2060 = _2038 * _2040;
    float _2062 = _2042 * _2040;
    float _2064 = fma(_2060, 0.5, 0.5);
    float _2066 = fma(_2062, -0.5, 0.5);
    float _2068 = _2052 * 0.636619746685028076171875;
    float3 _5277 = float3(_2064, _2066, _2050);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5277, float3(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5277, float3(0.0), isnan(_5277)), level(0.0)).x;
    float3 _5288 = float3(_2064, _2066, _2050);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5288, float3(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5288, float3(0.0), isnan(_5288)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float _2083 = -_2048;
    float _2085 = fma(_2068, _2083, 1.0);
    float2 _5310 = float2(_2085, _2058);
    float3 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2099 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2101 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2099);
    float _2103 = exp2(_2097);
    float _2105 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2107 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2105);
    float _2109 = _2107 + _2010;
    out.gl_Position.x = _2038;
    out.gl_Position.y = _2042;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _2010;
    float _2111 = _2109 * 0.5;
    float _2113 = -_2103;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2111;
    out.m_73.w = _2010;
    float _2119 = _2117 * _2070;
    float _2121 = -_2117;
    float _2123 = _2121 + 1.0;
    float _2125 = _2081 * _2119;
    float _2127 = _2095 * _2119;
    float _2129 = fma(_2091, _2125, _2075);
    float _2131 = fma(_2093, _2125, _2077);
    float _2133 = _2081 * _2123;
    float _2135 = fma(_2081, _2127, _2079);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2129;
    out.m_75.y = _2131;
    out.m_75.z = _2135;
    out.m_75.w = _2133;
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
    bool _1460 = false;
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
        float _2191 = as_type<float>(_108);
        out.gl_Position.z = _2191;
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
        float _2255 = as_type<float>(_142);
        out.gl_Position.z = _2255;
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
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _172 = _170 != 0;
    float _174 = in.m_55.w;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _178 = _176 != 0;
    int _180 = int(_134);
    int _182 = _178 ? 2 : 0;
    int _184 = _180 | _182;
    int _186 = _168 ? 4 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 8 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 16 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 32 : 0;
    int _200 = _196 | _198;
    int _202 = _172 ? 64 : 0;
    int _204 = _200 | _202;
    int _206 = _204 & 64;
    float _208 = in.m_57.w;
    float _210 = _118 * _150;
    float _212 = in.m_59.x;
    float _214 = in.m_59.y;
    float _216 = in.m_59.z;
    float _218 = as_type<float>(_206);
    float _220 = _152;
    float _222 = _210;
    int _224 = _172 ? (-1) : 0;
    if (!_168)
    {
        float _226 = _152 * _152;
        float _228 = _226 * 0.5;
        _218 = _228;
    }
    float _230 = _218;
    float _232 = abs(_144);
    float _234 = abs(_148);
    float _236 = precise::max(_232, _234);
    float _238 = in.m_61.x;
    float _240 = in.m_61.y;
    float _242 = in.m_61.z;
    float _244 = _230;
    float _246 = _148;
    float _248 = _144;
    if (!_168)
    {
        float _250 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _244 = _250;
    }
    float _252 = _244;
    bool _254 = _236 >= 16.0;
    float _256 = fma(_210, 1.25, 0.75);
    float _258 = in.m_63.x;
    float _260 = in.m_63.y;
    float _262 = in.m_63.z;
    float _264 = -_154;
    float _266 = _264 + 1.0;
    float _268 = -_148;
    float _270 = fma(_256, _148, _268);
    float _272 = -_144;
    float _274 = fma(_256, _144, _272);
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _286 = in.m_49.x;
    float _288 = in.m_49.y;
    float _290 = in.m_49.z;
    float _292 = _252;
    float _294 = _154;
    if (_254)
    {
        float _296 = _148 * 0.0625;
        _246 = _296;
    }
    float _298 = _246;
    if (_254)
    {
        float _300 = _144 * 0.0625;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = _158 > 0.5;
    float _306 = abs(_298);
    bool _308 = _306 != 0.0;
    bool _310 = isnan(_306);
    bool _312 = _308 || _310;
    bool _314 = isnan(0.0);
    bool _316 = _312 || _314;
    int _318 = _304 ? as_type<int>(_266) : as_type<int>(_154);
    float _320 = abs(_302);
    bool _322 = _320 == 0.0;
    bool _324 = !_316;
    bool _326 = _322 && _324;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _330 = _328 != 0;
    bool _332 = false;
    if (_326)
    {
        bool _334 = as_type<int>(_302) >= 0;
        _332 = _334;
    }
    bool _336 = _332;
    int _338 = 0;
    if (_326)
    {
        int _340 = _336 ? 0 : 1078530011;
        _338 = _340;
    }
    int _342 = _338;
    bool _344 = !_168;
    float _346 = 0.0;
    int _348 = _342;
    float _350 = _260;
    if (!_344)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _152 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _152);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _380;
        _346 = _364;
    }
    float _382 = _292;
    float _384 = _346;
    bool _386 = !_168;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _152 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _220 = _408;
    }
    float _410 = _220;
    float _412 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (_326)
    {
        int _414 = int(0x80000000) & as_type<int>(_298);
        int _416 = _342 | _414;
        _348 = _416;
    }
    int _418 = _348;
    float _420 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _422 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _422;
    int _426 = _418;
    float _428 = as_type<float>(_418);
    if (!_168)
    {
        float _430 = _118 * _118;
        float _432 = _430 * 0.5;
        _388 = _432;
    }
    float _434 = _388;
    float _436 = fma(_410, _286, _412);
    float _438 = fma(_410, _288, _420);
    float _440 = fma(_410, _290, _422);
    float _442 = _210 * 3.1415927410125732421875;
    float _444 = _212 * _212;
    if (!_168)
    {
        float _446 = _434 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _446;
    }
    float _448 = _222;
    float _450 = _448;
    if (!_168)
    {
        _424 = _118;
    }
    float _452 = _424;
    bool _454 = !_168;
    float _456 = _452;
    if (!_454)
    {
        float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = log2(_458);
        float _462 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _464 = _462 + 1.0;
        float _466 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = _118 * _460;
        float _470 = 1.0 / _464;
        float _472 = _466 * 0.693147182464599609375;
        float _474 = exp2(_468);
        float _476 = 1.0 / _472;
        float _478 = _474 + (-1.0);
        float _480 = -_478;
        float _482 = fma(_480, _476, _118);
        float _484 = _482 * _470;
        float _486 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _450 = _486;
    }
    float _488 = _450;
    bool _490 = !_168;
    if (!_490)
    {
        float _492 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _494 = log2(_492);
        float _496 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _498 = _496 + 1.0;
        float _500 = 1.0 / _498;
        float _502 = _118 * _494;
        float _504 = exp2(_502);
        float _506 = -_504;
        float _508 = _506 + 1.0;
        float _510 = _508 * _500;
        _456 = _510;
    }
    float _512 = _456;
    float _514 = abs(_302);
    bool _516 = _514 == 0.0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _520 = _518 != 0;
    bool _522 = !_316;
    bool _524 = _522 && _516;
    if (!_524)
    {
        float _526 = abs(_298);
        bool _528 = _526 != as_type<float>(0x7f800000u /* inf */);
        bool _530 = isnan(_526);
        bool _532 = _528 || _530;
        bool _534 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _536 = _532 || _534;
        float _538 = abs(_302);
        bool _540 = _538 == as_type<float>(0x7f800000u /* inf */);
        bool _542 = !_536;
        bool _544 = _540 && _542;
        if (_544)
        {
            _426 = 1075235812;
        }
        int _546 = _426;
        int _548 = _546;
        if (_544)
        {
            bool _550 = as_type<int>(_302) >= 0;
            _224 = _550 ? (-1) : 0;
        }
        int _552 = _224;
        if (_544)
        {
            int _554 = ~_552;
            int _556 = (_554 != 0) ? _546 : 1061752795;
            _548 = _556;
        }
        int _558 = _548;
        float _560 = as_type<float>(_558);
        if (_544)
        {
            int _562 = int(0x80000000) & as_type<int>(_298);
            int _564 = _558 | _562;
            _560 = as_type<float>(_564);
        }
        float _566 = _560;
        float _568 = abs(_302);
        bool _570 = _568 == as_type<float>(0x7f800000u /* inf */);
        bool _572 = !_536;
        bool _574 = _572 && _570;
        _428 = _566;
        if (!_574)
        {
            float _576 = abs(_302);
            float _578 = abs(_298);
            float _580 = precise::max(_576, _578);
            float _582 = abs(_302);
            float _584 = abs(_298);
            float _586 = precise::min(_582, _584);
            float _588 = 1.0 / _580;
            float _590 = abs(_298);
            float _592 = abs(_302);
            bool _594 = _590 > _592;
            float _596 = _586 * _588;
            float _598 = _596 * _596;
            float _600 = _598 + 11.33538818359375;
            float _602 = fma(_598, _600, 28.84246826171875);
            float _604 = fma(_598, _602, 19.6966705322265625);
            float _606 = fma(_598, -0.82336294651031494140625, -5.674867153167724609375);
            float _608 = abs(_302);
            float _610 = abs(_298);
            float _612 = _608 + _610;
            int _614 = as_type<int>(_298) & int(0x80000000);
            float _616 = fma(_598, _606, -6.565555095672607421875);
            float _618 = 1.0 / _604;
            float _620 = _598 * _616;
            float _622 = _596 * _620;
            float _624 = fma(_622, _618, _596);
            float _626 = _624;
            _428 = _612;
            if (_594)
            {
                float _628 = -_624;
                float _630 = _628 + 1.57079637050628662109375;
                _626 = _630;
            }
            float _632 = _626;
            bool _634 = as_type<int>(_302) >= 0;
            int _636 = as_type<int>(_632);
            if (!_634)
            {
                float _638 = -_632;
                float _640 = _638 + 3.1415927410125732421875;
                _636 = as_type<int>(_640);
            }
            int _642 = _636;
            bool _644 = _612 > as_type<float>(0x7f800000u /* inf */);
            bool _646 = isnan(_612);
            bool _648 = _644 || _646;
            bool _650 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _652 = _648 || _650;
            if (!_652)
            {
                int _654 = _614 | _642;
                _428 = as_type<float>(_654);
            }
        }
    }
    float _656 = _428;
    float _658 = _442 * 0.15915493667125701904296875;
    float _660 = fma(_238, _238, _444);
    float _662 = in.m_57.x;
    float _664 = in.m_57.y;
    float _666 = in.m_57.z;
    float _668 = _214 * _214;
    float _670 = fma(_438, _208, _278);
    float _672 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _674 = fma(_258, _258, _660);
    float _676 = fma(_436, _208, _276);
    float _678 = fma(_240, _240, _668);
    float _680 = _670 * _240;
    float _682 = _670 * _214;
    float _684 = _670 * _260;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _688 = fma(_440, _208, _280);
    float _690 = fma(_260, _260, _678);
    float _692 = fma(_676, _238, _680);
    float _694 = fma(_676, _212, _682);
    float _696 = fma(_676, _258, _684);
    float _698 = _686 * 6.283185482025146484375;
    float _700 = fma(_688, _242, _692);
    float _702 = fma(_688, _216, _694);
    float _704 = fma(_688, _262, _696);
    float _706 = _698 * 0.15915493667125701904296875;
    float _708 = _686 * 12.0;
    float _710 = _686 * 6.0;
    float _712 = _662 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _714 = fma(_656, 4.0, _708);
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _720 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = _714 * 0.15915493667125701904296875;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _726 = -_710;
    float _728 = fma(_656, 3.0, _726);
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = _716 + _730;
    float _734 = 0.0;
    float _736 = _674;
    if (_178)
    {
        float _738 = in.m_55.x;
        _734 = _738;
    }
    float _740 = _734;
    float _742 = _704 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = _728 * 0.15915493667125701904296875;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _748 = _720 + _746;
    float _750 = _732 * _732;
    float _752 = sqrt(_674);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = fma(_748, _748, _750);
    float _764 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _766 = _664 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _768 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _770 = fma(_756, _756, _762);
    float _772 = _722 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_764, -2.0, _724);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = -_718;
    float _784 = fma(_768, 2.0, _782);
    bool _786 = _174 > 0.5;
    float _788 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = _780 ? as_type<float>(_318) : _154;
    float _792 = _656 + 3.1415927410125732421875;
    float _794 = _744 * 6.283185482025146484375;
    float _796 = sin(_794);
    bool _798 = _780;
    float _800 = _790;
    if (_760)
    {
        float _802 = _786 ? _266 : _154;
        _294 = _802;
    }
    float _804 = _294;
    float _806 = _216 * _216;
    bool _808 = _752 > 0.0;
    float _810 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_178)
    {
        bool _812 = _740 > 0.5;
        _798 = _812;
    }
    bool _814 = _798;
    float _816 = _792 * 0.15915493667125701904296875;
    float _818 = fma(_242, _242, _806);
    float _820 = rsqrt(_770);
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _824 = fma(_262, _262, _818);
    float _826 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _828 = _658 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _774 + _796;
    float _834 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _840 = _838 + 2.0;
    float _842 = sqrt(_690);
    float _844 = _822 * _820;
    float _846 = fma(_832, 0.25, 0.5);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _732 * _844;
    float _852 = fma(_846, _840, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _854 = _706 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = 0.0 + _830;
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _748 * _844;
    float _864 = -_862;
    float _866 = _748 + _864;
    float _868 = _816 * 6.283185482025146484375;
    float _870 = sin(_868);
    bool _872 = _842 > 0.0;
    float _874 = fma(_856, 0.10000002384185791015625, 1.0);
    float _876 = -_850;
    float _878 = _732 + _876;
    float _880 = -_146;
    float _882 = fma(_860, _146, _880);
    float _884 = _756 * _844;
    float _886 = _732;
    float _888 = _882;
    float _890 = _852;
    bool _892 = _872;
    if (_808)
    {
        float _894 = rsqrt(_674);
        _886 = _894;
    }
    float _896 = _886;
    float _898 = _878 * _878;
    float _900 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _902 = -_884;
    float _904 = _756 + _902;
    float _906 = fma(_870, 0.5, 0.5);
    float _908 = fma(_866, _866, _898);
    float _910 = _908;
    if (!_808)
    {
        _888 = 0.0;
    }
    float _912 = _888;
    float _914 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _916 = sqrt(_824);
    float _918 = fma(_904, _904, _908);
    float _920 = _906 * _852;
    float _922 = _912;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _926 = _914;
    if (!_808)
    {
        _910 = 0.0;
    }
    float _928 = _910;
    float _930 = in.m_53.x;
    float _932 = _928;
    float _934 = _930;
    if (!_808)
    {
        _736 = 0.0;
    }
    float _936 = _736;
    float _938 = _920 * _914;
    float _940 = sqrt(_918);
    float _942 = _936;
    if (_808)
    {
        float _944 = _896 * _238;
        _922 = _944;
    }
    float _946 = _922;
    if (_808)
    {
        float _948 = _896 * _212;
        _932 = _948;
    }
    float _950 = _932;
    if (_808)
    {
        float _952 = _896 * _258;
        _942 = _952;
    }
    float _954 = _942;
    float _956 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    if (!_872)
    {
        _924 = 0.0;
    }
    float _958 = _924;
    float _960 = _958;
    if (!_872)
    {
        _926 = 0.0;
    }
    float _962 = _926;
    float _964 = _844;
    float _966 = _962;
    if (_872)
    {
        float _968 = rsqrt(_690);
        _964 = _968;
    }
    float _970 = _964;
    bool _972 = _916 > 0.0;
    float _974 = fma(_938, _956, 1.0);
    if (!_872)
    {
        _890 = 0.0;
    }
    float _976 = _890;
    float _978 = _284 * _974;
    float _980 = _820 * _940;
    float _982 = _690;
    float _984 = _976;
    if (_330)
    {
        float _986 = in.m_55.z;
        _982 = _986;
    }
    float _988 = _982;
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _994 = _788 * _980;
    float _996 = _810 * _980;
    float _998 = _834 * _980;
    float _1000 = _998;
    float _1002 = _990;
    if (_872)
    {
        float _1004 = _970 * _240;
        _960 = _1004;
    }
    float _1006 = _960;
    if (_872)
    {
        float _1008 = _970 * _214;
        _966 = _1008;
    }
    float _1010 = _966;
    if (_872)
    {
        float _1012 = _970 * _260;
        _984 = _1012;
    }
    float _1014 = _984;
    float _1016 = _282 * _974;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _938);
    float _1020 = _956;
    if (_972)
    {
        float _1022 = rsqrt(_824);
        _1020 = _1022;
    }
    float _1024 = _1020;
    float _1026 = _996 * _990;
    float _1028 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _776);
    float _1030 = _994 * _1018;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1016);
    float _1034 = _1030 * _1006;
    float _1036 = _998 * _1032;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1040 = as_type<int>(_1028);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_972)
    {
        _1000 = 0.0;
    }
    float _1044 = _1000;
    float _1046 = fma(_1026, _946, _1034);
    float _1048 = _1030 * _1014;
    float _1050 = _988;
    float _1052 = _1044;
    float _1054 = _1048;
    if (_330)
    {
        bool _1056 = _988 > 0.5;
        _892 = _1056;
    }
    bool _1058 = _892;
    float _1060 = _946;
    if (!_520)
    {
        float _1062 = in.m_55.z;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (!_972)
    {
        _1050 = 0.0;
    }
    float _1066 = _1050;
    float _1068 = fma(_1026, _954, _1048);
    float _1070 = _1066;
    if (_972)
    {
        float _1072 = _1024 * _242;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_972)
    {
        float _1076 = _1024 * _262;
        _1052 = _1076;
    }
    float _1078 = _1052;
    if (!_520)
    {
        _1054 = _158;
    }
    float _1080 = _1054;
    float _1082 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1038);
    float _1084 = fma(_1036, _1074, _1046);
    float _1086 = fma(_1036, _1078, _1068);
    float _1088 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1090 = _1080;
    if (_520)
    {
        _1090 = _156;
    }
    float _1092 = _1090;
    float _1094 = _720 + _1084;
    float _1096 = _742 + _1086;
    float _1098 = fma(_1088, _790, -0.5);
    float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1106 = _1096 + _1104;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1030 * _1010;
    float _1112 = _1102 * _1102;
    float _1114 = _1106 * _1106;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1118 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = fma(_1026, _950, _1110);
    float _1122 = _1112 + _1114;
    float _1124 = _1064;
    int _1126 = as_type<int>(_1110);
    float _1128 = _1112;
    float _1130 = _1114;
    float _1132 = _1096;
    if (!_520)
    {
        _800 = _1064;
    }
    float _1134 = _800;
    float _1136 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1116);
    float _1138 = _1134;
    if (_520)
    {
        _1138 = _158;
    }
    float _1140 = _1138;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_520)
    {
        _1124 = _158;
    }
    float _1144 = _1124;
    float _1146 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1136);
    float _1148 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    if (_330)
    {
        float _1150 = -_930;
        float _1152 = _1150 + 1.0;
        _1126 = as_type<int>(_1152);
    }
    int _1154 = _1126;
    float _1156 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1158 = -_1028;
    float _1160 = fma(_1146, _1098, _1158);
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1164 = sqrt(_1122);
    if (_178)
    {
        float _1166 = -_930;
        float _1168 = _1166 + 1.0;
        _1040 = as_type<int>(_1168);
    }
    int _1170 = _1040;
    if (!_972)
    {
        _1042 = 0.0;
    }
    float _1172 = _1042;
    float _1174 = _1172;
    if (_972)
    {
        float _1176 = _1024 * _216;
        _1174 = _1176;
    }
    float _1178 = _1174;
    if (!_178)
    {
        _1002 = _930;
    }
    float _1180 = _1002;
    float _1182 = fma(_1156, _804, -0.5);
    float _1184 = _1180;
    if (_178)
    {
        float _1186 = _814 ? as_type<float>(_1170) : _930;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = fma(_1036, _1178, _1120);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1194 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1196 = _1190;
    if (_330)
    {
        float _1198 = _1058 ? as_type<float>(_1154) : _930;
        _934 = _1198;
    }
    float _1200 = _934;
    float _1202 = _716 + _1190;
    float _1204 = -_848;
    float _1206 = fma(_1118, 2.0, _1204);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1162);
    float _1210 = fma(_1194, _1188, -0.5);
    bool _1212 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1202;
    if (!_1212)
    {
        _1196 = _1094;
    }
    float _1216 = _1196;
    bool _1218 = !_1212;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1164 + _1224;
        float _1228 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = rsqrt(_1122);
        float _1232 = _1226 * _1222;
        float _1234 = _1232 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = cos(_1240);
        float _1244 = fma(_1238, _1228, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1246 = _1230 * _1244;
        float _1248 = fma(_1102, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1250 = _1242 + (-1.0);
        float _1252 = fma(_1106, _1246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1256 = _1248 + _1254;
        float _1258 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1262 = _1252 + _1260;
        float _1264 = _1256 * _1256;
        float _1266 = fma(_1202, _1242, _1258);
        float _1268 = _1262 * _1262;
        _1214 = _1266;
        _1128 = _1264;
        _1130 = _1268;
        _1220 = _1248;
        _1132 = _1252;
    }
    float _1270 = _1214;
    float _1272 = _1128;
    float _1274 = _1130;
    float _1276 = _1220;
    float _1278 = _1132;
    float _1280 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1282 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1082);
    float _1284 = -_118;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1290 = _1270 + _1288;
    float _1292 = fma(_1280, _1200, -0.5);
    float _1294 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1148);
    float _1296 = fma(_1282, _1210, _1286);
    float _1298 = -_118;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1206);
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1304 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1306 = fma(_1290, _1290, _1272);
    float _1308 = fma(_1294, _1292, _1300);
    float _1310 = fma(_1304, -2.0, _1302);
    float _1312 = _1306 + _1274;
    float _1314 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1208);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1320 = _1160 + 0.5;
    float _1322 = sqrt(_1312);
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = -_1318;
    float _1328 = fma(_1314, _1182, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1336 = _1296 + 0.5;
    float _1338 = _1308 + 0.5;
    float _1340 = _1328 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_65.x = _1336;
    out.m_65.y = _1320;
    out.m_65.z = _1338;
    out.m_65.w = _1340;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1356 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1322);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1344;
    out.m_69.y = _1346;
    out.m_69.z = _1348;
    out.m_69.w = _1342;
    out.m_71.x = _1368;
    out.m_71.y = _1370;
    out.m_71.z = _1324;
    out.m_71.w = _1366;
    float _1372 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1374 = fma(_512, _288, _1350);
    float _1376 = _488 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1378 = fma(_512, _286, _1372);
    float _1380 = -_1374;
    float _1382 = _438 + _1380;
    float _1384 = fma(_512, _290, _1376);
    float _1386 = -_1378;
    float _1388 = _436 + _1386;
    float _1390 = _1382 * _240;
    float _1392 = _1382 * _214;
    float _1394 = _1382 * _260;
    float _1396 = -_1384;
    float _1398 = _440 + _1396;
    float _1400 = fma(_1388, _238, _1390);
    float _1402 = fma(_1388, _212, _1392);
    float _1404 = fma(_1388, _258, _1394);
    float _1406 = _1394;
    float _1408 = _1366;
    float _1410 = _1336;
    if (!_1364)
    {
        _1406 = 1.0;
    }
    float _1412 = _1406;
    float _1414 = fma(_1398, _242, _1400);
    float _1416 = fma(_1398, _216, _1402);
    float _1418 = fma(_1398, _262, _1404);
    bool _1420 = !_1364;
    float _1422 = _1412;
    float _1424 = _1414;
    float _1426 = _1416;
    float _1428 = _1414;
    float _1430 = _1418;
    if (!_1420)
    {
        bool _1432 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1322);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1322 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1322);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1322 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1488;
                _1460 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1422;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1270 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1498 = _1276 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1502 = _1278 + _1500;
    float _1504 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1506 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1508 = fma(_1502, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1510 = -_716;
    float _1512 = _1510 + _1504;
    float _1514 = -_720;
    float _1516 = _1514 + _1506;
    float _1518 = -_742;
    float _1520 = _1518 + _1508;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = sqrt(_1526);
    bool _1530 = _1528 > 0.0;
    bool _1532 = !_1530;
    float _1534 = _1504;
    float _1536 = _1506;
    float _1538 = _1508;
    if (!_1532)
    {
        bool _1540 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1542 = _1528;
        if (_1540)
        {
            float _1544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1542 = _1544;
        }
        float _1546 = _1542;
        float _1548 = _1546;
        if (_1540)
        {
            float _1550 = _1414 * _1546;
            _1408 = _1550;
        }
        float _1552 = _1408;
        float _1554 = _1552;
        if (_1540)
        {
            float _1556 = _1416 * _1546;
            _1410 = _1556;
        }
        float _1558 = _1410;
        float _1560 = _1558;
        if (_1540)
        {
            float _1562 = _1418 * _1546;
            _1548 = _1562;
        }
        float _1564 = _1548;
        float _1566 = _1564;
        if (!_1540)
        {
            float _1568 = _118 + 1.0;
            float _1570 = _1568;
            if (!_168)
            {
                float _1572 = _1568 * _1568;
                float _1574 = _1572 * 0.5;
                _1424 = _1574;
            }
            float _1576 = _1424;
            float _1578 = _1576;
            if (!_168)
            {
                float _1580 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1578 = _1580;
            }
            float _1582 = _1578;
            bool _1584 = !_168;
            float _1586 = _1582;
            if (!_1584)
            {
                float _1588 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1590 = log2(_1588);
                float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1594 = _1592 + 1.0;
                float _1596 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1598 = _1590 * _1568;
                float _1600 = exp2(_1598);
                float _1602 = _1596 * 0.693147182464599609375;
                float _1604 = 1.0 / _1602;
                float _1606 = 1.0 / _1594;
                float _1608 = _1600 + (-1.0);
                float _1610 = -_1608;
                float _1612 = fma(_1610, _1604, _1568);
                float _1614 = _1612 * _1606;
                float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1586 = _1616;
            }
            float _1618 = _1586;
            float _1620 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1622 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1624 = !_168;
            if (!_1624)
            {
                float _1626 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1628 = log2(_1626);
                float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1632 = _1630 + 1.0;
                float _1634 = 1.0 / _1632;
                float _1636 = _1628 * _1568;
                float _1638 = exp2(_1636);
                float _1640 = -_1638;
                float _1642 = _1640 + 1.0;
                float _1644 = _1642 * _1634;
                _1570 = _1644;
            }
            float _1646 = _1570;
            float _1648 = fma(_1646, _288, _1622);
            float _1650 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1652 = fma(_1646, _286, _1620);
            float _1654 = -_1374;
            float _1656 = _1654 + _1648;
            float _1658 = fma(_1646, _290, _1650);
            float _1660 = -_1378;
            float _1662 = _1660 + _1652;
            float _1664 = _1656 * _240;
            float _1666 = _1656 * _214;
            float _1668 = _1656 * _260;
            float _1670 = -_1384;
            float _1672 = _1670 + _1658;
            float _1674 = fma(_1662, _238, _1664);
            float _1676 = fma(_1662, _212, _1666);
            float _1678 = fma(_1662, _258, _1668);
            float _1680 = fma(_1672, _242, _1674);
            float _1682 = fma(_1672, _216, _1676);
            float _1684 = fma(_1672, _262, _1678);
            _1426 = _1682;
            _1428 = _1680;
            _1430 = _1684;
            _1554 = _1680;
            _1560 = _1682;
            _1566 = _1684;
        }
        float _1686 = _1426;
        float _1688 = _1428;
        float _1690 = _1430;
        float _1692 = _1554;
        float _1694 = _1560;
        float _1696 = _1566;
        float _1698 = _1686 * _1686;
        float _1700 = rsqrt(_1526);
        float _1702 = fma(_1688, _1688, _1698);
        float _1704 = fma(_1690, _1690, _1702);
        float _1706 = sqrt(_1704);
        float _1708 = _1516 * _1700;
        float _1710 = _1512 * _1700;
        float _1712 = _1520 * _1700;
        bool _1714 = _1706 > 0.0;
        bool _1716 = !_1714;
        _350 = _1710;
        if (!_1716)
        {
            float _1718 = rsqrt(_1704);
            float _1720 = _1718 * _1686;
            float _1722 = _1718 * _1688;
            float _1724 = _1718 * _1690;
            float _1726 = _1710 * _1720;
            float _1728 = fma(_1708, _1722, _1726);
            float _1730 = fma(_1712, _1724, _1728);
            float _1732 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1692, _1732, _1506);
            float _1736 = fma(_1694, _1732, _1504);
            float _1738 = fma(_1696, _1732, _1508);
            _1534 = _1736;
            _1536 = _1734;
            _1538 = _1738;
        }
    }
    float _1740 = _1534;
    float _1742 = _1536;
    float _1744 = _1538;
    float _1746 = _350;
    float _1748 = -_850;
    float _1750 = _1748 + _1740;
    float _1752 = -_862;
    float _1754 = _1752 + _1742;
    float _1756 = -_884;
    float _1758 = _1756 + _1744;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1766 = _1754 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1770 = _1758 + _1768;
    float _1772 = _1762 * _1762;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1776 = fma(_1766, _1766, _1772);
    float _1778 = fma(_1770, _1770, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1786 = _1766 * _1784;
    float _1788 = _1770 * _1784;
    float _1790 = _1786 * _1786;
    float _1792 = _1788 * _1788;
    float _1794 = _1790 + _1792;
    float _1796 = sqrt(_1794);
    bool _1798 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1802 = _1796 + _1800;
    float _1804 = _1780;
    float _1806 = _1794;
    float _1808 = _1802;
    float _1810 = _1746;
    float _1812 = _1762;
    float _1814 = _1784;
    float _1816 = _1786;
    if (_1798)
    {
        float _1818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1818;
    }
    float _1820 = _1804;
    if (_1798)
    {
        float _1822 = rsqrt(_1794);
        _1806 = _1822;
    }
    float _1824 = _1806;
    if (_1798)
    {
        float _1826 = _1802 * _1820;
        _1808 = _1826;
    }
    float _1828 = _1808;
    if (_1798)
    {
        float _1830 = _1828 * 0.15915493667125701904296875;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1820;
    float _1836 = _1832;
    if (_1798)
    {
        float _1838 = _1832 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        _1834 = _1840;
    }
    float _1842 = _1834;
    float _1844 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1846 = precise::max(0.0, _1844);
    float _1848 = _1770;
    float _1850 = _1846;
    if (_1798)
    {
        float _1852 = _1832 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = -_1784;
    float _1860 = -_1846;
    float _1862 = fma(_1762, _1858, _1860);
    if (!_1798)
    {
        _1812 = _1788;
    }
    float _1864 = _1812;
    float _1866 = _1864;
    if (_1798)
    {
        float _1868 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1868;
    }
    float _1870 = _1850;
    float _1872 = _1842;
    float _1874 = _1870;
    if (_1798)
    {
        float _1876 = fma(_1842, _1870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1872 = _1876;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    float _1882 = _1856;
    if (_1798)
    {
        float _1884 = _1856 + (-1.0);
        _1874 = _1884;
    }
    float _1886 = _1874;
    float _1888 = _1886;
    if (_1798)
    {
        float _1890 = _1824 * _1878;
        _1814 = _1890;
    }
    float _1892 = _1814;
    if (!_1798)
    {
        _1880 = _1862;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1798)
    {
        float _1898 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1898;
    }
    float _1900 = _1836;
    if (_1798)
    {
        float _1902 = _1786 * _1892;
        _1816 = _1902;
    }
    float _1904 = _1816;
    if (!_1798)
    {
        _1888 = _1790;
    }
    float _1906 = _1888;
    float _1908 = _1906;
    if (_1798)
    {
        float _1910 = _1788 * _1892;
        _1866 = _1910;
    }
    float _1912 = _1866;
    if (_1798)
    {
        float _1914 = fma(_1862, _1856, _1900);
        _1896 = _1914;
    }
    float _1916 = _1896;
    if (_1798)
    {
        float _1918 = _1904 * _1904;
        _1908 = _1918;
    }
    float _1920 = _1908;
    if (!_1798)
    {
        _1882 = _1792;
    }
    float _1922 = _1882;
    float _1924 = _1922;
    if (_1798)
    {
        float _1926 = _1912 * _1912;
        _1924 = _1926;
    }
    float _1928 = _1924;
    float _1930 = fma(_1916, _1916, _1920);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1934 = _1930 + _1928;
    float _1936 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1940 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1938);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1932);
    float _1946 = rsqrt(_1934);
    float _1948 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1950 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1936);
    float _1952 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1948);
    float _1960 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1964 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1950);
    float _1966 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = abs(_1956);
    float _1970 = log2(_1968);
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1976 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1978 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1980 = _1946 * _1904;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1984 = -_1972;
    float _1986 = fma(_1984, _1774, 1.0);
    float _1988 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1990 = _1946 * _1916;
    float _1992 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1982);
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = _1946 * _1912;
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2000 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = -_1994;
    float _2004 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2002);
    float _2006 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2008 = log2(_1986);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = -_1996;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2004);
    float _2016 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = fma(_2014, -0.5, 0.5);
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2024 = exp2(_2006);
    float _2026 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2028 = fma(_2014, 0.5, 0.5);
    float _2030 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2022);
    float _2032 = _1990 + 1.0;
    float _2034 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2026);
    float _2036 = fma(_2028, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2038 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2030);
    float _2040 = 1.0 / _2010;
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2034);
    float _2044 = fma(_2028, _2036, -0.212114393711090087890625);
    float _2046 = _2008 * 0.693147182464599609375;
    float _2048 = fma(_2028, _2044, 1.570728778839111328125);
    float _2050 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2052 = sqrt(_2020);
    float _2054 = -_1990;
    float _2056 = fma(_2024, _2032, _2054);
    float _2058 = fma(_2056, 0.5, 0.5);
    float _2060 = _2038 * _2040;
    float _2062 = _2042 * _2040;
    float _2064 = fma(_2060, 0.5, 0.5);
    float _2066 = fma(_2062, -0.5, 0.5);
    float _2068 = _2052 * 0.636619746685028076171875;
    float3 _5277 = float3(_2064, _2066, _2050);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5277, float3(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5277, float3(0.0), isnan(_5277)), level(0.0)).x;
    float3 _5288 = float3(_2064, _2066, _2050);
    float4 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5288, float3(0.0), isnan(_5288)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5288, float3(0.0), isnan(_5288)), level(0.0)).xyzw;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = _2073.w;
    float _2083 = -_2048;
    float _2085 = fma(_2068, _2083, 1.0);
    float2 _5310 = float2(_2085, _2058);
    float3 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5310, float2(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5310, float2(0.0), isnan(_5310)), level(0.0)).xyz;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2099 = _1974 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2101 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2099);
    float _2103 = exp2(_2097);
    float _2105 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2101);
    float _2107 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2105);
    float _2109 = _2107 + _2010;
    out.gl_Position.x = _2038;
    out.gl_Position.y = _2042;
    out.gl_Position.z = _2107;
    out.gl_Position.w = _2010;
    float _2111 = _2109 * 0.5;
    float _2113 = -_2103;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2111;
    out.m_73.w = _2010;
    float _2119 = _2117 * _2070;
    float _2121 = -_2117;
    float _2123 = _2121 + 1.0;
    float _2125 = _2081 * _2119;
    float _2127 = _2095 * _2119;
    float _2129 = fma(_2091, _2125, _2075);
    float _2131 = fma(_2093, _2125, _2077);
    float _2133 = _2081 * _2123;
    float _2135 = fma(_2081, _2127, _2079);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2129;
    out.m_75.y = _2131;
    out.m_75.z = _2135;
    out.m_75.w = _2133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

