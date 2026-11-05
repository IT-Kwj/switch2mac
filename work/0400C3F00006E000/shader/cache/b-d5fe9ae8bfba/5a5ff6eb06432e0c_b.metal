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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
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
        float _2183 = as_type<float>(_108);
        out.gl_Position.z = _2183;
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
        float _2247 = as_type<float>(_142);
        out.gl_Position.z = _2247;
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
    float _158 = in.m_57.w;
    float _160 = _118 * _150;
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = abs(_144);
    float _174 = abs(_148);
    float _176 = precise::max(_172, _174);
    bool _178 = _176 >= 16.0;
    float _180 = fma(_160, 1.25, 0.75);
    float _182 = -_148;
    float _184 = fma(_180, _148, _182);
    float _186 = -_144;
    float _188 = fma(_180, _144, _186);
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _200 = _148;
    float _202 = _144;
    float _204 = _152;
    if (_178)
    {
        float _206 = _148 * 0.0625;
        _200 = _206;
    }
    float _208 = _200;
    if (_178)
    {
        float _210 = _144 * 0.0625;
        _202 = _210;
    }
    float _212 = _202;
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
    float _256 = _254;
    if (!_222)
    {
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _258;
    }
    float _260 = _256;
    bool _262 = false;
    float _264 = _260;
    if (_246)
    {
        bool _266 = as_type<int>(_212) >= 0;
        _262 = _266;
    }
    bool _268 = _262;
    bool _270 = !_222;
    int _272 = 0;
    float _274 = 0.0;
    int _276 = _268 ? (-1) : 0;
    float _278 = _154;
    float _280 = _162;
    if (!_270)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _152 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _152);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = as_type<int>(_294);
        _274 = _300;
        _264 = _310;
    }
    int _312 = _272;
    float _314 = _274;
    float _316 = _264;
    bool _318 = !_222;
    float _320 = _314;
    int _322 = _312;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _152 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _320 = _330;
        _204 = _342;
    }
    float _344 = _320;
    float _346 = _204;
    float _348 = _344;
    if (_246)
    {
        int _350 = _268 ? 0 : 1078530011;
        _322 = _350;
    }
    int _352 = _322;
    float _354 = 0.0;
    int _356 = _352;
    if (!_222)
    {
        float _358 = _118 * _118;
        float _360 = _358 * 0.5;
        _354 = _360;
    }
    float _362 = _354;
    float _364 = _362;
    if (!_222)
    {
        _348 = _118;
    }
    float _366 = _348;
    float _368 = _366;
    if (!_222)
    {
        float _370 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _364 = _370;
    }
    float _372 = _364;
    float _374 = 0.0;
    float _376 = _372;
    if (_246)
    {
        int _378 = int(0x80000000) & as_type<int>(_208);
        int _380 = _352 | _378;
        _374 = as_type<float>(_380);
    }
    float _382 = _374;
    bool _384 = !_222;
    float _386 = _382;
    float _388 = _382;
    if (!_384)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = _118 * _392;
        float _402 = 1.0 / _396;
        float _404 = _398 * 0.693147182464599609375;
        float _406 = exp2(_400);
        float _408 = 1.0 / _404;
        float _410 = _406 + (-1.0);
        float _412 = -_410;
        float _414 = fma(_412, _408, _118);
        float _416 = _414 * _402;
        float _418 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _356 = as_type<int>(_408);
        _376 = _418;
    }
    int _420 = _356;
    float _422 = _376;
    bool _424 = !_222;
    int _426 = _420;
    if (!_424)
    {
        float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _430 = log2(_428);
        float _432 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _434 = _432 + 1.0;
        float _436 = 1.0 / _434;
        float _438 = _118 * _430;
        float _440 = exp2(_438);
        float _442 = -_440;
        float _444 = _442 + 1.0;
        float _446 = _444 * _436;
        _426 = as_type<int>(_434);
        _368 = _446;
    }
    int _448 = _426;
    float _450 = _368;
    bool _452 = !_234;
    bool _454 = _452 && _238;
    int _456 = _448;
    float _458 = 0.0;
    if (!_454)
    {
        float _460 = abs(_208);
        bool _462 = _460 != as_type<float>(0x7f800000u /* inf */);
        bool _464 = isnan(_460);
        bool _466 = _462 || _464;
        bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _470 = _466 || _468;
        float _472 = abs(_212);
        bool _474 = _472 == as_type<float>(0x7f800000u /* inf */);
        float _476 = abs(_212);
        bool _478 = _476 == as_type<float>(0x7f800000u /* inf */);
        bool _480 = !_470;
        bool _482 = _478 && _480;
        if (_482)
        {
            bool _484 = as_type<int>(_212) >= 0;
            _276 = _484 ? (-1) : 0;
        }
        int _486 = _276;
        if (_482)
        {
            _456 = 1075235812;
        }
        int _488 = _456;
        int _490 = _488;
        if (_482)
        {
            int _492 = ~_486;
            int _494 = (_492 != 0) ? _488 : 1061752795;
            _490 = _494;
        }
        int _496 = _490;
        if (_482)
        {
            int _498 = int(0x80000000) & as_type<int>(_208);
            int _500 = _496 | _498;
            _386 = as_type<float>(_500);
        }
        float _502 = _386;
        bool _504 = !_470;
        bool _506 = _504 && _474;
        _458 = 0.0;
        _388 = _502;
        if (!_506)
        {
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::max(_508, _510);
            float _514 = abs(_212);
            float _516 = abs(_208);
            float _518 = _514 + _516;
            float _520 = abs(_212);
            float _522 = abs(_208);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _512;
            float _528 = abs(_208);
            float _530 = abs(_212);
            bool _532 = _528 > _530;
            bool _534 = as_type<int>(_212) >= 0;
            bool _536 = _518 > as_type<float>(0x7f800000u /* inf */);
            bool _538 = isnan(_518);
            bool _540 = _536 || _538;
            bool _542 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _544 = _540 || _542;
            float _546 = _524 * _526;
            float _548 = _546 * _546;
            float _550 = _548 + 11.33538818359375;
            float _552 = fma(_548, _550, 28.84246826171875);
            float _554 = fma(_548, _552, 19.6966705322265625);
            float _556 = fma(_548, -0.82336294651031494140625, -5.674867153167724609375);
            float _558 = fma(_548, _556, -6.565555095672607421875);
            float _560 = 1.0 / _554;
            float _562 = _548 * _558;
            float _564 = _546 * _562;
            float _566 = fma(_564, _560, _546);
            int _568 = as_type<int>(_208) & int(0x80000000);
            float _570 = _566;
            _458 = 0.82336294651031494140625;
            _388 = _518;
            if (_532)
            {
                float _572 = -_566;
                float _574 = _572 + 1.57079637050628662109375;
                _570 = _574;
            }
            float _576 = _570;
            int _578 = as_type<int>(_576);
            if (!_534)
            {
                float _580 = -_576;
                float _582 = _580 + 3.1415927410125732421875;
                _578 = as_type<int>(_582);
            }
            int _584 = _578;
            if (!_544)
            {
                int _586 = _568 | _584;
                _388 = as_type<float>(_586);
            }
        }
    }
    float _588 = _458;
    float _590 = _388;
    float _592 = in.m_57.x;
    float _594 = in.m_57.y;
    float _596 = in.m_57.z;
    float _598 = -_154;
    float _600 = _598 + 1.0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _604 = _602 != 0;
    float _606 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _608 = _164 > 0.5;
    float _610 = in.m_53.x;
    float _612 = _160 * 3.1415927410125732421875;
    int _614 = _608 ? as_type<int>(_600) : as_type<int>(_154);
    out.m_59.y = _154;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _156 > 0.5;
    float _624 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _632 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = fma(_346, _192, _624);
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _642 = _640 != 0;
    float _644 = fma(_346, _190, _630);
    float _646 = fma(_346, _194, _632);
    float _648 = _212;
    bool _650 = _636;
    bool _652 = _642;
    if (_604)
    {
        float _654 = in.m_55.x;
        _648 = _654;
    }
    float _656 = _648;
    float _658 = fma(_638, _158, _168);
    float _660 = fma(_644, _158, _166);
    float _662 = fma(_646, _158, _170);
    float _664 = _588;
    if (_618)
    {
        float _666 = in.m_55.z;
        _664 = _666;
    }
    float _668 = _664;
    float _670 = _592 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _672 = _594 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = _636 ? as_type<float>(_614) : _154;
    float _686 = in.m_63.x;
    float _688 = in.m_63.y;
    float _690 = in.m_63.z;
    float _692 = -_682;
    float _694 = fma(_606, 2.0, _692);
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    if (_642)
    {
        float _702 = _622 ? _600 : _154;
        _278 = _702;
    }
    float _704 = _278;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _708 = 0.0;
    if (!_628)
    {
        _708 = _164;
    }
    float _710 = _708;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _710;
    float _716 = _712;
    if (_628)
    {
        _714 = _162;
    }
    float _718 = _714;
    float _720 = fma(_620, -2.0, _706);
    float _722 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _724 = as_type<int>(_720);
    if (_604)
    {
        bool _726 = _656 > 0.5;
        _650 = _726;
    }
    bool _728 = _650;
    float _730 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    if (!_604)
    {
        _716 = _610;
    }
    float _732 = _716;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _736 = _732;
    if (_618)
    {
        bool _738 = _668 > 0.5;
        _652 = _738;
    }
    bool _740 = _652;
    float _742 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _674 * _674;
    float _748 = _742;
    float _750 = _676;
    float _752 = _678;
    if (!_604)
    {
        _280 = _732;
    }
    float _754 = _280;
    float _756 = _734 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _758 = _754;
    if (_604)
    {
        _736 = _610;
    }
    float _760 = _736;
    float _762 = fma(_686, _686, _746);
    float _764 = _612 * 0.15915493667125701904296875;
    float _766 = _658 * _688;
    float _768 = _658 * _676;
    float _770 = _658 * _698;
    float _772 = _676 * _676;
    float _774 = fma(_660, _686, _766);
    float _776 = fma(_660, _674, _768);
    float _778 = fma(_660, _696, _770);
    float _780 = fma(_688, _688, _772);
    float _782 = fma(_662, _690, _774);
    float _784 = fma(_662, _678, _776);
    float _786 = _770;
    float _788 = _686;
    if (!_628)
    {
        float _790 = in.m_55.z;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = fma(_662, _700, _778);
    float _796 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _798 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = fma(_698, _698, _780);
    float _804 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _808 = _798 + _806;
    float _810 = _800 * 0.15915493667125701904296875;
    float _812 = _794 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _804 + _814;
    float _818 = _808 * _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _822 = _812 + _820;
    float _824 = fma(_696, _696, _762);
    float _826 = fma(_816, _816, _818);
    float _828 = _756 * 12.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = sqrt(_824);
    float _834 = fma(_822, _822, _826);
    float _836 = fma(_796, _684, -0.5);
    float _838 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _840 = fma(_590, 4.0, _828);
    float _842 = _796;
    float _844 = _792;
    float _846 = _802;
    if (!_628)
    {
        _842 = _792;
    }
    float _848 = _842;
    float _850 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _838);
    float _852 = rsqrt(_834);
    float _854 = _848;
    if (_628)
    {
        _854 = _164;
    }
    float _856 = _854;
    float _858 = _840 * 0.15915493667125701904296875;
    if (_628)
    {
        _844 = _164;
    }
    float _860 = _844;
    float _862 = _756 * 6.0;
    float _864 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    if (_604)
    {
        float _866 = -_760;
        float _868 = _866 + 1.0;
        _724 = as_type<int>(_868);
    }
    int _870 = _724;
    float _872 = _810 * 6.283185482025146484375;
    float _874 = sin(_872);
    float _876 = -_862;
    float _878 = fma(_590, 3.0, _876);
    float _880 = -_864;
    float _882 = fma(_850, _836, _880);
    float _884 = _590 + 3.1415927410125732421875;
    float _886 = _878 * 0.15915493667125701904296875;
    bool _888 = _832 > 0.0;
    float _890 = _678 * _678;
    float _892 = _764 * 6.283185482025146484375;
    float _894 = sin(_892);
    if (_604)
    {
        float _896 = _728 ? as_type<float>(_870) : _760;
        _758 = _896;
    }
    float _898 = _758;
    float _900 = _808 * _852;
    float _902 = _884 * 0.15915493667125701904296875;
    float _904 = _822 * _852;
    float _906 = -_900;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _910 = fma(_874, 0.10000002384185791015625, 1.0);
    float _912 = _858 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_690, _690, _890);
    float _918 = _816 * _852;
    float _920 = -_918;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _924 = _886 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = 0.0 + _894;
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = _908 * _908;
    float _934 = fma(_700, _700, _916);
    float _936 = -_146;
    float _938 = fma(_930, _146, _936);
    float _940 = fma(_922, _922, _932);
    float _942 = -_904;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _946 = sqrt(_802);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _952 = _950 + 2.0;
    float _954 = fma(_944, _944, _940);
    float _956 = _902 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _914 + _926;
    float _962 = fma(_960, 0.25, 0.5);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _966 = sqrt(_934);
    bool _968 = _946 > 0.0;
    float _970 = fma(_962, _952, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _974 = sqrt(_954);
    float _976 = fma(_958, 0.5, 0.5);
    float _978 = _976 * _970;
    float _980 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _984 = _966 > 0.0;
    float _986 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[83].z, _972);
    float _988 = _978 * _980;
    float _990 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = _966;
    float _994 = _972;
    if (_968)
    {
        float _996 = rsqrt(_802);
        _992 = _996;
    }
    float _998 = _992;
    float _1000 = fma(_988, _964, 1.0);
    float _1002 = -_982;
    float _1004 = fma(_990, 2.0, _1002);
    float _1006 = _852 * _974;
    float _1008 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _198 * _1000;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1016 = _1008 * _1006;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1020 = _722 * _1006;
    float _1022 = _196 * _1000;
    float _1024 = _742 * _1006;
    float _1026 = _1016 * _1018;
    float _1028 = _1018;
    float _1030 = _1006;
    float _1032 = _1020;
    float _1034 = _1024;
    float _1036 = _1012;
    if (!_968)
    {
        _748 = 0.0;
    }
    float _1038 = _748;
    float _1040 = _982;
    float _1042 = _1038;
    if (_888)
    {
        float _1044 = rsqrt(_824);
        _1040 = _1044;
    }
    float _1046 = _1040;
    if (!_968)
    {
        _1028 = 0.0;
    }
    float _1048 = _1028;
    float _1050 = _1020 * _1012;
    float _1052 = _1048;
    if (_968)
    {
        float _1054 = _998 * _688;
        _1042 = _1054;
    }
    float _1056 = _1042;
    if (_968)
    {
        float _1058 = _998 * _698;
        _1052 = _1058;
    }
    float _1060 = _1052;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1022);
    float _1064 = _1062;
    if (!_888)
    {
        _1030 = 0.0;
    }
    float _1066 = _1030;
    float _1068 = _1050 * _1056;
    float _1070 = _934;
    float _1072 = _1066;
    int _1074 = as_type<int>(_1068);
    if (_984)
    {
        float _1076 = rsqrt(_934);
        _1070 = _1076;
    }
    float _1078 = _1070;
    float _1080 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1082 = _1014;
    if (!_888)
    {
        _1082 = 0.0;
    }
    float _1084 = _1082;
    float _1086 = _1050 * _1060;
    float _1088 = _1084;
    if (!_984)
    {
        _1032 = 0.0;
    }
    float _1090 = _1032;
    float _1092 = fma(_1080, _704, -0.5);
    float _1094 = _1024 * _1062;
    float _1096 = _1090;
    if (!_984)
    {
        _1034 = 0.0;
    }
    float _1098 = _1034;
    float _1100 = _1098;
    if (_888)
    {
        float _1102 = _1046 * _686;
        _1088 = _1102;
    }
    float _1104 = _1088;
    if (_888)
    {
        float _1106 = _1046 * _696;
        _1072 = _1106;
    }
    float _1108 = _1072;
    if (!_618)
    {
        _846 = _760;
    }
    float _1110 = _846;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1114 = fma(_1026, _1104, _1068);
    float _1116 = fma(_1026, _1108, _1086);
    float _1118 = _1110;
    if (_618)
    {
        float _1120 = -_760;
        float _1122 = _1120 + 1.0;
        _1074 = as_type<int>(_1122);
    }
    int _1124 = _1074;
    if (_984)
    {
        float _1126 = _1078 * _690;
        _1096 = _1126;
    }
    float _1128 = _1096;
    if (_984)
    {
        float _1130 = _1078 * _700;
        _1100 = _1130;
    }
    float _1132 = _1100;
    if (!_888)
    {
        _1036 = 0.0;
    }
    float _1134 = _1036;
    float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1138 = fma(_1094, _1128, _1114);
    float _1140 = fma(_1094, _1132, _1116);
    float _1142 = _1134;
    if (_618)
    {
        float _1144 = _740 ? as_type<float>(_1124) : _760;
        _1118 = _1144;
    }
    float _1146 = _1118;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1150 = _804 + _1138;
    float _1152 = _812 + _1140;
    float _1154 = _1150;
    float _1156 = _1152;
    if (_888)
    {
        float _1158 = _1046 * _674;
        _1142 = _1158;
    }
    float _1160 = _1142;
    float _1162 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1148);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1150 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1152 + _1168;
    if (!_968)
    {
        _1064 = 0.0;
    }
    float _1172 = _1064;
    float _1174 = _1172;
    if (_968)
    {
        float _1176 = _998 * _676;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1166 * _1166;
    float _1182 = _1170 * _1170;
    float _1184 = _1180;
    float _1186 = _1182;
    if (!_984)
    {
        _994 = 0.0;
    }
    float _1188 = _994;
    float _1190 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = _1050 * _1178;
    float _1194 = _1180 + _1182;
    float _1196 = _1188;
    if (_984)
    {
        float _1198 = _1078 * _678;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1190, _898, -0.5);
    float _1204 = sqrt(_1194);
    float _1206 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1208 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1210 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1212 = -_118;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _1216 = fma(_1026, _1160, _1192);
    float _1218 = fma(_1206, _1146, -0.5);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1222 = fma(_1210, _1202, _1214);
    float _1224 = fma(_1094, _1200, _1216);
    float _1226 = fma(_1208, -2.0, _1220);
    float _1228 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1232 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1238 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = -_118;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1252 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1226);
    float _1254 = _798 + _1224;
    bool _1256 = !_1232;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1204 + _1262;
        float _1266 = rsqrt(_1194);
        float _1268 = _1264 * _1260;
        float _1270 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = _1268 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1266 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1166, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1170, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1254, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1184 = _1304;
        _1186 = _1306;
        _1154 = _1288;
        _1156 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1184;
    float _1312 = _1186;
    float _1314 = _1154;
    float _1316 = _1156;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1248;
    out.m_67.w = _1246;
    float _1322 = fma(_1228, _1218, _1244);
    float _1324 = -_1252;
    float _1326 = fma(_1250, _1092, _1324);
    float _1328 = fma(_1320, _1320, _1310);
    float _1330 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1332 = _1328 + _1312;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1336 = sqrt(_1332);
    float _1338 = _882 + 0.5;
    float _1340 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1342 = _1322 + 0.5;
    float _1344 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = fma(_450, _192, _1340);
    float _1350 = fma(_450, _190, _1330);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = -_1348;
    float _1358 = _638 + _1356;
    float _1360 = fma(_450, _194, _1344);
    float _1362 = -_1350;
    float _1364 = _644 + _1362;
    float _1366 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * _698;
    float _1370 = _1358 * _688;
    bool _1372 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1380 = _1376 || _1378;
    float _1382 = _1358 * _676;
    float _1384 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1222 + 0.5;
    float _1390 = _1326 + 0.5;
    float _1392 = -_1360;
    float _1394 = _646 + _1392;
    float _1396 = fma(_1364, _696, _1368);
    float _1398 = fma(_1364, _686, _1370);
    float _1400 = fma(_1364, _674, _1382);
    out.m_69.x = _1366;
    out.m_69.y = _1384;
    out.m_69.z = _1386;
    out.m_69.w = _1354;
    out.m_71.x = _1388;
    out.m_71.y = _1338;
    out.m_71.z = _1342;
    out.m_71.w = _1390;
    float _1402 = fma(_1394, _700, _1396);
    float _1404 = fma(_1394, _690, _1398);
    float _1406 = _1396;
    float _1408 = _1308;
    float _1410 = _1402;
    float _1412 = _1404;
    float _1414 = _1402;
    if (!_1380)
    {
        _1406 = 1.0;
    }
    float _1416 = _1406;
    float _1418 = fma(_1394, _678, _1400);
    bool _1420 = !_1380;
    float _1422 = _1416;
    float _1424 = _1418;
    if (!_1420)
    {
        bool _1426 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1336);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1336 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1336);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1336 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1482;
                _1454 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1422;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1488 = _1308 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1492 = _1314 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1316 + _1494;
    float _1498 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1492, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1502 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1504 = -_798;
    float _1506 = _1504 + _1498;
    float _1508 = -_804;
    float _1510 = _1508 + _1500;
    float _1512 = -_812;
    float _1514 = _1512 + _1502;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > 0.0;
    bool _1526 = !_1524;
    float _1528 = _1522;
    float _1530 = _1492;
    float _1532 = _1498;
    float _1534 = _1500;
    float _1536 = _1502;
    if (!_1526)
    {
        bool _1538 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1540 = _1390;
        if (_1538)
        {
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1540 = _1542;
        }
        float _1544 = _1540;
        if (_1538)
        {
            float _1546 = _1404 * _1544;
            _1408 = _1546;
        }
        float _1548 = _1408;
        float _1550 = _1548;
        if (_1538)
        {
            float _1552 = _1418 * _1544;
            _1528 = _1552;
        }
        float _1554 = _1528;
        float _1556 = _1554;
        if (_1538)
        {
            float _1558 = _1402 * _1544;
            _1530 = _1558;
        }
        float _1560 = _1530;
        float _1562 = _1560;
        if (!_1538)
        {
            float _1564 = _118 + 1.0;
            float _1566 = _1564;
            if (!_222)
            {
                float _1568 = _1564 * _1564;
                float _1570 = _1568 * 0.5;
                _1410 = _1570;
            }
            float _1572 = _1410;
            float _1574 = _1572;
            if (!_222)
            {
                float _1576 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1574 = _1576;
            }
            float _1578 = _1574;
            bool _1580 = !_222;
            float _1582 = _1578;
            if (!_1580)
            {
                float _1584 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1586 = log2(_1584);
                float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1590 = _1588 + 1.0;
                float _1592 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1594 = _1586 * _1564;
                float _1596 = 1.0 / _1590;
                float _1598 = _1592 * 0.693147182464599609375;
                float _1600 = exp2(_1594);
                float _1602 = 1.0 / _1598;
                float _1604 = _1600 + (-1.0);
                float _1606 = -_1604;
                float _1608 = fma(_1606, _1602, _1564);
                float _1610 = _1608 * _1596;
                float _1612 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1582 = _1612;
            }
            float _1614 = _1582;
            float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1618 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1620 = !_222;
            if (!_1620)
            {
                float _1622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1624 = log2(_1622);
                float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1628 = _1626 + 1.0;
                float _1630 = 1.0 / _1628;
                float _1632 = _1624 * _1564;
                float _1634 = exp2(_1632);
                float _1636 = -_1634;
                float _1638 = _1636 + 1.0;
                float _1640 = _1638 * _1630;
                _1566 = _1640;
            }
            float _1642 = _1566;
            float _1644 = fma(_1642, _192, _1618);
            float _1646 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1648 = fma(_1642, _190, _1616);
            float _1650 = -_1348;
            float _1652 = _1650 + _1644;
            float _1654 = fma(_1642, _194, _1646);
            float _1656 = -_1350;
            float _1658 = _1656 + _1648;
            float _1660 = _1652 * _688;
            float _1662 = _1652 * _676;
            float _1664 = _1652 * _698;
            float _1666 = -_1360;
            float _1668 = _1666 + _1654;
            float _1670 = fma(_1658, _686, _1660);
            float _1672 = fma(_1658, _674, _1662);
            float _1674 = fma(_1658, _696, _1664);
            float _1676 = fma(_1668, _690, _1670);
            float _1678 = fma(_1668, _678, _1672);
            float _1680 = fma(_1668, _700, _1674);
            _1424 = _1678;
            _1412 = _1676;
            _1414 = _1680;
            _1550 = _1676;
            _1556 = _1678;
            _1562 = _1680;
        }
        float _1682 = _1424;
        float _1684 = _1412;
        float _1686 = _1414;
        float _1688 = _1550;
        float _1690 = _1556;
        float _1692 = _1562;
        float _1694 = _1682 * _1682;
        float _1696 = rsqrt(_1520);
        float _1698 = fma(_1684, _1684, _1694);
        float _1700 = fma(_1686, _1686, _1698);
        float _1702 = sqrt(_1700);
        float _1704 = _1510 * _1696;
        float _1706 = _1506 * _1696;
        float _1708 = _1514 * _1696;
        bool _1710 = _1702 > 0.0;
        bool _1712 = !_1710;
        _750 = _1706;
        if (!_1712)
        {
            float _1714 = rsqrt(_1700);
            float _1716 = _1714 * _1682;
            float _1718 = _1714 * _1684;
            float _1720 = _1714 * _1686;
            float _1722 = _1706 * _1716;
            float _1724 = fma(_1704, _1718, _1722);
            float _1726 = fma(_1708, _1720, _1724);
            float _1728 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1730 = fma(_1688, _1728, _1500);
            float _1732 = fma(_1690, _1728, _1498);
            float _1734 = fma(_1692, _1728, _1502);
            _1532 = _1732;
            _1534 = _1730;
            _1536 = _1734;
            _750 = _1722;
        }
    }
    float _1736 = _1532;
    float _1738 = _1534;
    float _1740 = _1536;
    float _1742 = _750;
    float _1744 = -_900;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_918;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_904;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1774;
    float _1800 = _1742;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _788 = _1822;
    }
    float _1824 = _788;
    float _1826 = _1810;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1766;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (!_1792)
    {
        _1804 = _1782;
    }
    float _1854 = _1804;
    float _1856 = _1854;
    if (_1792)
    {
        float _1858 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1832;
    float _1864 = _1860;
    if (_1792)
    {
        float _1866 = fma(_1832, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _752 = _1866;
    }
    float _1868 = _752;
    float _1870 = _1868;
    if (!_1792)
    {
        _1862 = _1852;
    }
    float _1872 = _1862;
    float _1874 = _1872;
    float _1876 = _1846;
    if (_1792)
    {
        float _1878 = _1846 + (-1.0);
        _1864 = _1878;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1792)
    {
        float _1884 = _1814 * _1868;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1792)
    {
        float _1888 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1888;
    }
    float _1890 = _1816;
    if (_1792)
    {
        float _1892 = _1780 * _1886;
        _1806 = _1892;
    }
    float _1894 = _1806;
    if (!_1792)
    {
        _1882 = _1784;
    }
    float _1896 = _1882;
    float _1898 = _1896;
    if (_1792)
    {
        float _1900 = _1782 * _1886;
        _1856 = _1900;
    }
    float _1902 = _1856;
    if (_1792)
    {
        float _1904 = fma(_1852, _1846, _1890);
        _1874 = _1904;
    }
    float _1906 = _1874;
    if (_1792)
    {
        float _1908 = _1894 * _1894;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (!_1792)
    {
        _1876 = _1786;
    }
    float _1912 = _1876;
    float _1914 = _1912;
    if (_1792)
    {
        float _1916 = _1902 * _1902;
        _1914 = _1916;
    }
    float _1918 = _1914;
    float _1920 = fma(_1906, _1906, _1910);
    float _1922 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = _1920 + _1918;
    float _1926 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = rsqrt(_1924);
    float _1938 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1932;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1948 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1954 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1952);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1972 = _1936 * _1894;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1976 = _1936 * _1906;
    float _1978 = -_1966;
    float _1980 = fma(_1978, _1962, 1.0);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1984 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1968);
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1974);
    float _1988 = _1936 * _1902;
    float _1990 = -_1982;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1990);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1998 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1992);
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1996);
    float _2008 = log2(_1980);
    float _2010 = fma(_2002, -0.5, 0.5);
    float _2012 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2004);
    float _2016 = fma(_2002, 0.5, 0.5);
    float _2018 = _1976 + 1.0;
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2012);
    float _2022 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2014);
    float _2024 = exp2(_1998);
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2032 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2034 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2028);
    float _2036 = 1.0 / _2006;
    float _2038 = _2008 * 0.693147182464599609375;
    float _2040 = fma(_2016, _2032, 1.570728778839111328125);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2044 = sqrt(_2010);
    float _2046 = -_1976;
    float _2048 = fma(_2024, _2018, _2046);
    float _2050 = fma(_2048, 0.5, 0.5);
    float _2052 = _2030 * _2036;
    float _2054 = _2034 * _2036;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2044 * 0.636619746685028076171875;
    float3 _5258 = float3(_2056, _2058, _2042);
    float _2062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5258, float3(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5258, float3(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_2056, _2058, _2042);
    float4 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).xyzw;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    float _2073 = _2065.w;
    float _2075 = -_2040;
    float _2077 = fma(_2060, _2075, 1.0);
    float2 _5291 = float2(_2077, _2050);
    float3 _2081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5291, float2(0.0), isnan(_5291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5291, float2(0.0), isnan(_5291)), level(0.0)).xyz;
    float _2083 = _2081.x;
    float _2085 = _2081.y;
    float _2087 = _2081.z;
    float _2089 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2091 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2093 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2091);
    float _2095 = exp2(_2089);
    float _2097 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2093);
    float _2099 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2101 = _2099 + _2006;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2099;
    out.gl_Position.w = _2006;
    float _2103 = _2101 * 0.5;
    float _2105 = -_2095;
    float _2107 = _2105 + 1.0;
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2103;
    out.m_73.w = _2006;
    float _2111 = _2109 * _2062;
    float _2113 = -_2109;
    float _2115 = _2113 + 1.0;
    float _2117 = _2073 * _2111;
    float _2119 = _2073 * _2115;
    float _2121 = _2087 * _2111;
    float _2123 = fma(_2083, _2117, _2067);
    float _2125 = fma(_2085, _2117, _2069);
    float _2127 = fma(_2073, _2121, _2071);
    out.m_75.x = _2123;
    out.m_75.y = _2125;
    out.m_75.z = _2127;
    out.m_75.w = _2119;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
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
        float _2183 = as_type<float>(_108);
        out.gl_Position.z = _2183;
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
        float _2247 = as_type<float>(_142);
        out.gl_Position.z = _2247;
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
    float _158 = in.m_57.w;
    float _160 = _118 * _150;
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = abs(_144);
    float _174 = abs(_148);
    float _176 = precise::max(_172, _174);
    bool _178 = _176 >= 16.0;
    float _180 = fma(_160, 1.25, 0.75);
    float _182 = -_148;
    float _184 = fma(_180, _148, _182);
    float _186 = -_144;
    float _188 = fma(_180, _144, _186);
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _200 = _148;
    float _202 = _144;
    float _204 = _152;
    if (_178)
    {
        float _206 = _148 * 0.0625;
        _200 = _206;
    }
    float _208 = _200;
    if (_178)
    {
        float _210 = _144 * 0.0625;
        _202 = _210;
    }
    float _212 = _202;
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
    float _256 = _254;
    if (!_222)
    {
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _258;
    }
    float _260 = _256;
    bool _262 = false;
    float _264 = _260;
    if (_246)
    {
        bool _266 = as_type<int>(_212) >= 0;
        _262 = _266;
    }
    bool _268 = _262;
    bool _270 = !_222;
    int _272 = 0;
    float _274 = 0.0;
    int _276 = _268 ? (-1) : 0;
    float _278 = _154;
    float _280 = _162;
    if (!_270)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _152 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _152);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = as_type<int>(_294);
        _274 = _300;
        _264 = _310;
    }
    int _312 = _272;
    float _314 = _274;
    float _316 = _264;
    bool _318 = !_222;
    float _320 = _314;
    int _322 = _312;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _152 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _320 = _330;
        _204 = _342;
    }
    float _344 = _320;
    float _346 = _204;
    float _348 = _344;
    if (_246)
    {
        int _350 = _268 ? 0 : 1078530011;
        _322 = _350;
    }
    int _352 = _322;
    float _354 = 0.0;
    int _356 = _352;
    if (!_222)
    {
        float _358 = _118 * _118;
        float _360 = _358 * 0.5;
        _354 = _360;
    }
    float _362 = _354;
    float _364 = _362;
    if (!_222)
    {
        _348 = _118;
    }
    float _366 = _348;
    float _368 = _366;
    if (!_222)
    {
        float _370 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _364 = _370;
    }
    float _372 = _364;
    float _374 = 0.0;
    float _376 = _372;
    if (_246)
    {
        int _378 = int(0x80000000) & as_type<int>(_208);
        int _380 = _352 | _378;
        _374 = as_type<float>(_380);
    }
    float _382 = _374;
    bool _384 = !_222;
    float _386 = _382;
    float _388 = _382;
    if (!_384)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = _118 * _392;
        float _402 = 1.0 / _396;
        float _404 = _398 * 0.693147182464599609375;
        float _406 = exp2(_400);
        float _408 = 1.0 / _404;
        float _410 = _406 + (-1.0);
        float _412 = -_410;
        float _414 = fma(_412, _408, _118);
        float _416 = _414 * _402;
        float _418 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _356 = as_type<int>(_408);
        _376 = _418;
    }
    int _420 = _356;
    float _422 = _376;
    bool _424 = !_222;
    int _426 = _420;
    if (!_424)
    {
        float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _430 = log2(_428);
        float _432 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _434 = _432 + 1.0;
        float _436 = 1.0 / _434;
        float _438 = _118 * _430;
        float _440 = exp2(_438);
        float _442 = -_440;
        float _444 = _442 + 1.0;
        float _446 = _444 * _436;
        _426 = as_type<int>(_434);
        _368 = _446;
    }
    int _448 = _426;
    float _450 = _368;
    bool _452 = !_234;
    bool _454 = _452 && _238;
    int _456 = _448;
    float _458 = 0.0;
    if (!_454)
    {
        float _460 = abs(_208);
        bool _462 = _460 != as_type<float>(0x7f800000u /* inf */);
        bool _464 = isnan(_460);
        bool _466 = _462 || _464;
        bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _470 = _466 || _468;
        float _472 = abs(_212);
        bool _474 = _472 == as_type<float>(0x7f800000u /* inf */);
        float _476 = abs(_212);
        bool _478 = _476 == as_type<float>(0x7f800000u /* inf */);
        bool _480 = !_470;
        bool _482 = _478 && _480;
        if (_482)
        {
            bool _484 = as_type<int>(_212) >= 0;
            _276 = _484 ? (-1) : 0;
        }
        int _486 = _276;
        if (_482)
        {
            _456 = 1075235812;
        }
        int _488 = _456;
        int _490 = _488;
        if (_482)
        {
            int _492 = ~_486;
            int _494 = (_492 != 0) ? _488 : 1061752795;
            _490 = _494;
        }
        int _496 = _490;
        if (_482)
        {
            int _498 = int(0x80000000) & as_type<int>(_208);
            int _500 = _496 | _498;
            _386 = as_type<float>(_500);
        }
        float _502 = _386;
        bool _504 = !_470;
        bool _506 = _504 && _474;
        _458 = 0.0;
        _388 = _502;
        if (!_506)
        {
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::max(_508, _510);
            float _514 = abs(_212);
            float _516 = abs(_208);
            float _518 = _514 + _516;
            float _520 = abs(_212);
            float _522 = abs(_208);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _512;
            float _528 = abs(_208);
            float _530 = abs(_212);
            bool _532 = _528 > _530;
            bool _534 = as_type<int>(_212) >= 0;
            bool _536 = _518 > as_type<float>(0x7f800000u /* inf */);
            bool _538 = isnan(_518);
            bool _540 = _536 || _538;
            bool _542 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _544 = _540 || _542;
            float _546 = _524 * _526;
            float _548 = _546 * _546;
            float _550 = _548 + 11.33538818359375;
            float _552 = fma(_548, _550, 28.84246826171875);
            float _554 = fma(_548, _552, 19.6966705322265625);
            float _556 = fma(_548, -0.82336294651031494140625, -5.674867153167724609375);
            float _558 = fma(_548, _556, -6.565555095672607421875);
            float _560 = 1.0 / _554;
            float _562 = _548 * _558;
            float _564 = _546 * _562;
            float _566 = fma(_564, _560, _546);
            int _568 = as_type<int>(_208) & int(0x80000000);
            float _570 = _566;
            _458 = 0.82336294651031494140625;
            _388 = _518;
            if (_532)
            {
                float _572 = -_566;
                float _574 = _572 + 1.57079637050628662109375;
                _570 = _574;
            }
            float _576 = _570;
            int _578 = as_type<int>(_576);
            if (!_534)
            {
                float _580 = -_576;
                float _582 = _580 + 3.1415927410125732421875;
                _578 = as_type<int>(_582);
            }
            int _584 = _578;
            if (!_544)
            {
                int _586 = _568 | _584;
                _388 = as_type<float>(_586);
            }
        }
    }
    float _588 = _458;
    float _590 = _388;
    float _592 = in.m_57.x;
    float _594 = in.m_57.y;
    float _596 = in.m_57.z;
    float _598 = -_154;
    float _600 = _598 + 1.0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _604 = _602 != 0;
    float _606 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _608 = _164 > 0.5;
    float _610 = in.m_53.x;
    float _612 = _160 * 3.1415927410125732421875;
    int _614 = _608 ? as_type<int>(_600) : as_type<int>(_154);
    out.m_59.y = _154;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _156 > 0.5;
    float _624 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _632 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = fma(_346, _192, _624);
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _642 = _640 != 0;
    float _644 = fma(_346, _190, _630);
    float _646 = fma(_346, _194, _632);
    float _648 = _212;
    bool _650 = _636;
    bool _652 = _642;
    if (_604)
    {
        float _654 = in.m_55.x;
        _648 = _654;
    }
    float _656 = _648;
    float _658 = fma(_638, _158, _168);
    float _660 = fma(_644, _158, _166);
    float _662 = fma(_646, _158, _170);
    float _664 = _588;
    if (_618)
    {
        float _666 = in.m_55.z;
        _664 = _666;
    }
    float _668 = _664;
    float _670 = _592 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _672 = _594 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = _636 ? as_type<float>(_614) : _154;
    float _686 = in.m_63.x;
    float _688 = in.m_63.y;
    float _690 = in.m_63.z;
    float _692 = -_682;
    float _694 = fma(_606, 2.0, _692);
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    if (_642)
    {
        float _702 = _622 ? _600 : _154;
        _278 = _702;
    }
    float _704 = _278;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _708 = 0.0;
    if (!_628)
    {
        _708 = _164;
    }
    float _710 = _708;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _710;
    float _716 = _712;
    if (_628)
    {
        _714 = _162;
    }
    float _718 = _714;
    float _720 = fma(_620, -2.0, _706);
    float _722 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _724 = as_type<int>(_720);
    if (_604)
    {
        bool _726 = _656 > 0.5;
        _650 = _726;
    }
    bool _728 = _650;
    float _730 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    if (!_604)
    {
        _716 = _610;
    }
    float _732 = _716;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _736 = _732;
    if (_618)
    {
        bool _738 = _668 > 0.5;
        _652 = _738;
    }
    bool _740 = _652;
    float _742 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _674 * _674;
    float _748 = _742;
    float _750 = _676;
    float _752 = _678;
    if (!_604)
    {
        _280 = _732;
    }
    float _754 = _280;
    float _756 = _734 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _758 = _754;
    if (_604)
    {
        _736 = _610;
    }
    float _760 = _736;
    float _762 = fma(_686, _686, _746);
    float _764 = _612 * 0.15915493667125701904296875;
    float _766 = _658 * _688;
    float _768 = _658 * _676;
    float _770 = _658 * _698;
    float _772 = _676 * _676;
    float _774 = fma(_660, _686, _766);
    float _776 = fma(_660, _674, _768);
    float _778 = fma(_660, _696, _770);
    float _780 = fma(_688, _688, _772);
    float _782 = fma(_662, _690, _774);
    float _784 = fma(_662, _678, _776);
    float _786 = _770;
    float _788 = _686;
    if (!_628)
    {
        float _790 = in.m_55.z;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = fma(_662, _700, _778);
    float _796 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _798 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = fma(_698, _698, _780);
    float _804 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _808 = _798 + _806;
    float _810 = _800 * 0.15915493667125701904296875;
    float _812 = _794 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _804 + _814;
    float _818 = _808 * _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _822 = _812 + _820;
    float _824 = fma(_696, _696, _762);
    float _826 = fma(_816, _816, _818);
    float _828 = _756 * 12.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = sqrt(_824);
    float _834 = fma(_822, _822, _826);
    float _836 = fma(_796, _684, -0.5);
    float _838 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _840 = fma(_590, 4.0, _828);
    float _842 = _796;
    float _844 = _792;
    float _846 = _802;
    if (!_628)
    {
        _842 = _792;
    }
    float _848 = _842;
    float _850 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _838);
    float _852 = rsqrt(_834);
    float _854 = _848;
    if (_628)
    {
        _854 = _164;
    }
    float _856 = _854;
    float _858 = _840 * 0.15915493667125701904296875;
    if (_628)
    {
        _844 = _164;
    }
    float _860 = _844;
    float _862 = _756 * 6.0;
    float _864 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    if (_604)
    {
        float _866 = -_760;
        float _868 = _866 + 1.0;
        _724 = as_type<int>(_868);
    }
    int _870 = _724;
    float _872 = _810 * 6.283185482025146484375;
    float _874 = sin(_872);
    float _876 = -_862;
    float _878 = fma(_590, 3.0, _876);
    float _880 = -_864;
    float _882 = fma(_850, _836, _880);
    float _884 = _590 + 3.1415927410125732421875;
    float _886 = _878 * 0.15915493667125701904296875;
    bool _888 = _832 > 0.0;
    float _890 = _678 * _678;
    float _892 = _764 * 6.283185482025146484375;
    float _894 = sin(_892);
    if (_604)
    {
        float _896 = _728 ? as_type<float>(_870) : _760;
        _758 = _896;
    }
    float _898 = _758;
    float _900 = _808 * _852;
    float _902 = _884 * 0.15915493667125701904296875;
    float _904 = _822 * _852;
    float _906 = -_900;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _910 = fma(_874, 0.10000002384185791015625, 1.0);
    float _912 = _858 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_690, _690, _890);
    float _918 = _816 * _852;
    float _920 = -_918;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _924 = _886 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = 0.0 + _894;
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = _908 * _908;
    float _934 = fma(_700, _700, _916);
    float _936 = -_146;
    float _938 = fma(_930, _146, _936);
    float _940 = fma(_922, _922, _932);
    float _942 = -_904;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _946 = sqrt(_802);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _952 = _950 + 2.0;
    float _954 = fma(_944, _944, _940);
    float _956 = _902 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _914 + _926;
    float _962 = fma(_960, 0.25, 0.5);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _966 = sqrt(_934);
    bool _968 = _946 > 0.0;
    float _970 = fma(_962, _952, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _974 = sqrt(_954);
    float _976 = fma(_958, 0.5, 0.5);
    float _978 = _976 * _970;
    float _980 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _984 = _966 > 0.0;
    float _986 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[83].z, _972);
    float _988 = _978 * _980;
    float _990 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = _966;
    float _994 = _972;
    if (_968)
    {
        float _996 = rsqrt(_802);
        _992 = _996;
    }
    float _998 = _992;
    float _1000 = fma(_988, _964, 1.0);
    float _1002 = -_982;
    float _1004 = fma(_990, 2.0, _1002);
    float _1006 = _852 * _974;
    float _1008 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _198 * _1000;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1016 = _1008 * _1006;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1020 = _722 * _1006;
    float _1022 = _196 * _1000;
    float _1024 = _742 * _1006;
    float _1026 = _1016 * _1018;
    float _1028 = _1018;
    float _1030 = _1006;
    float _1032 = _1020;
    float _1034 = _1024;
    float _1036 = _1012;
    if (!_968)
    {
        _748 = 0.0;
    }
    float _1038 = _748;
    float _1040 = _982;
    float _1042 = _1038;
    if (_888)
    {
        float _1044 = rsqrt(_824);
        _1040 = _1044;
    }
    float _1046 = _1040;
    if (!_968)
    {
        _1028 = 0.0;
    }
    float _1048 = _1028;
    float _1050 = _1020 * _1012;
    float _1052 = _1048;
    if (_968)
    {
        float _1054 = _998 * _688;
        _1042 = _1054;
    }
    float _1056 = _1042;
    if (_968)
    {
        float _1058 = _998 * _698;
        _1052 = _1058;
    }
    float _1060 = _1052;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1022);
    float _1064 = _1062;
    if (!_888)
    {
        _1030 = 0.0;
    }
    float _1066 = _1030;
    float _1068 = _1050 * _1056;
    float _1070 = _934;
    float _1072 = _1066;
    int _1074 = as_type<int>(_1068);
    if (_984)
    {
        float _1076 = rsqrt(_934);
        _1070 = _1076;
    }
    float _1078 = _1070;
    float _1080 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1082 = _1014;
    if (!_888)
    {
        _1082 = 0.0;
    }
    float _1084 = _1082;
    float _1086 = _1050 * _1060;
    float _1088 = _1084;
    if (!_984)
    {
        _1032 = 0.0;
    }
    float _1090 = _1032;
    float _1092 = fma(_1080, _704, -0.5);
    float _1094 = _1024 * _1062;
    float _1096 = _1090;
    if (!_984)
    {
        _1034 = 0.0;
    }
    float _1098 = _1034;
    float _1100 = _1098;
    if (_888)
    {
        float _1102 = _1046 * _686;
        _1088 = _1102;
    }
    float _1104 = _1088;
    if (_888)
    {
        float _1106 = _1046 * _696;
        _1072 = _1106;
    }
    float _1108 = _1072;
    if (!_618)
    {
        _846 = _760;
    }
    float _1110 = _846;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1114 = fma(_1026, _1104, _1068);
    float _1116 = fma(_1026, _1108, _1086);
    float _1118 = _1110;
    if (_618)
    {
        float _1120 = -_760;
        float _1122 = _1120 + 1.0;
        _1074 = as_type<int>(_1122);
    }
    int _1124 = _1074;
    if (_984)
    {
        float _1126 = _1078 * _690;
        _1096 = _1126;
    }
    float _1128 = _1096;
    if (_984)
    {
        float _1130 = _1078 * _700;
        _1100 = _1130;
    }
    float _1132 = _1100;
    if (!_888)
    {
        _1036 = 0.0;
    }
    float _1134 = _1036;
    float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1138 = fma(_1094, _1128, _1114);
    float _1140 = fma(_1094, _1132, _1116);
    float _1142 = _1134;
    if (_618)
    {
        float _1144 = _740 ? as_type<float>(_1124) : _760;
        _1118 = _1144;
    }
    float _1146 = _1118;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1150 = _804 + _1138;
    float _1152 = _812 + _1140;
    float _1154 = _1150;
    float _1156 = _1152;
    if (_888)
    {
        float _1158 = _1046 * _674;
        _1142 = _1158;
    }
    float _1160 = _1142;
    float _1162 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1148);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1150 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1152 + _1168;
    if (!_968)
    {
        _1064 = 0.0;
    }
    float _1172 = _1064;
    float _1174 = _1172;
    if (_968)
    {
        float _1176 = _998 * _676;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1166 * _1166;
    float _1182 = _1170 * _1170;
    float _1184 = _1180;
    float _1186 = _1182;
    if (!_984)
    {
        _994 = 0.0;
    }
    float _1188 = _994;
    float _1190 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = _1050 * _1178;
    float _1194 = _1180 + _1182;
    float _1196 = _1188;
    if (_984)
    {
        float _1198 = _1078 * _678;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1190, _898, -0.5);
    float _1204 = sqrt(_1194);
    float _1206 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1208 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1210 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1212 = -_118;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _1216 = fma(_1026, _1160, _1192);
    float _1218 = fma(_1206, _1146, -0.5);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1222 = fma(_1210, _1202, _1214);
    float _1224 = fma(_1094, _1200, _1216);
    float _1226 = fma(_1208, -2.0, _1220);
    float _1228 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1232 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1238 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = -_118;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1252 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1226);
    float _1254 = _798 + _1224;
    bool _1256 = !_1232;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1204 + _1262;
        float _1266 = rsqrt(_1194);
        float _1268 = _1264 * _1260;
        float _1270 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = _1268 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1266 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1166, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1170, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1254, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1184 = _1304;
        _1186 = _1306;
        _1154 = _1288;
        _1156 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1184;
    float _1312 = _1186;
    float _1314 = _1154;
    float _1316 = _1156;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1248;
    out.m_67.w = _1246;
    float _1322 = fma(_1228, _1218, _1244);
    float _1324 = -_1252;
    float _1326 = fma(_1250, _1092, _1324);
    float _1328 = fma(_1320, _1320, _1310);
    float _1330 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1332 = _1328 + _1312;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1336 = sqrt(_1332);
    float _1338 = _882 + 0.5;
    float _1340 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1342 = _1322 + 0.5;
    float _1344 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = fma(_450, _192, _1340);
    float _1350 = fma(_450, _190, _1330);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = -_1348;
    float _1358 = _638 + _1356;
    float _1360 = fma(_450, _194, _1344);
    float _1362 = -_1350;
    float _1364 = _644 + _1362;
    float _1366 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * _698;
    float _1370 = _1358 * _688;
    bool _1372 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1380 = _1376 || _1378;
    float _1382 = _1358 * _676;
    float _1384 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1222 + 0.5;
    float _1390 = _1326 + 0.5;
    float _1392 = -_1360;
    float _1394 = _646 + _1392;
    float _1396 = fma(_1364, _696, _1368);
    float _1398 = fma(_1364, _686, _1370);
    float _1400 = fma(_1364, _674, _1382);
    out.m_69.x = _1366;
    out.m_69.y = _1384;
    out.m_69.z = _1386;
    out.m_69.w = _1354;
    out.m_71.x = _1388;
    out.m_71.y = _1338;
    out.m_71.z = _1342;
    out.m_71.w = _1390;
    float _1402 = fma(_1394, _700, _1396);
    float _1404 = fma(_1394, _690, _1398);
    float _1406 = _1396;
    float _1408 = _1308;
    float _1410 = _1402;
    float _1412 = _1404;
    float _1414 = _1402;
    if (!_1380)
    {
        _1406 = 1.0;
    }
    float _1416 = _1406;
    float _1418 = fma(_1394, _678, _1400);
    bool _1420 = !_1380;
    float _1422 = _1416;
    float _1424 = _1418;
    if (!_1420)
    {
        bool _1426 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1336);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1336 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1336);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1336 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1482;
                _1454 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1422;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1488 = _1308 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1492 = _1314 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1316 + _1494;
    float _1498 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1492, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1502 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1504 = -_798;
    float _1506 = _1504 + _1498;
    float _1508 = -_804;
    float _1510 = _1508 + _1500;
    float _1512 = -_812;
    float _1514 = _1512 + _1502;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > 0.0;
    bool _1526 = !_1524;
    float _1528 = _1522;
    float _1530 = _1492;
    float _1532 = _1498;
    float _1534 = _1500;
    float _1536 = _1502;
    if (!_1526)
    {
        bool _1538 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1540 = _1390;
        if (_1538)
        {
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1540 = _1542;
        }
        float _1544 = _1540;
        if (_1538)
        {
            float _1546 = _1404 * _1544;
            _1408 = _1546;
        }
        float _1548 = _1408;
        float _1550 = _1548;
        if (_1538)
        {
            float _1552 = _1418 * _1544;
            _1528 = _1552;
        }
        float _1554 = _1528;
        float _1556 = _1554;
        if (_1538)
        {
            float _1558 = _1402 * _1544;
            _1530 = _1558;
        }
        float _1560 = _1530;
        float _1562 = _1560;
        if (!_1538)
        {
            float _1564 = _118 + 1.0;
            float _1566 = _1564;
            if (!_222)
            {
                float _1568 = _1564 * _1564;
                float _1570 = _1568 * 0.5;
                _1410 = _1570;
            }
            float _1572 = _1410;
            float _1574 = _1572;
            if (!_222)
            {
                float _1576 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1574 = _1576;
            }
            float _1578 = _1574;
            bool _1580 = !_222;
            float _1582 = _1578;
            if (!_1580)
            {
                float _1584 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1586 = log2(_1584);
                float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1590 = _1588 + 1.0;
                float _1592 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1594 = _1586 * _1564;
                float _1596 = 1.0 / _1590;
                float _1598 = _1592 * 0.693147182464599609375;
                float _1600 = exp2(_1594);
                float _1602 = 1.0 / _1598;
                float _1604 = _1600 + (-1.0);
                float _1606 = -_1604;
                float _1608 = fma(_1606, _1602, _1564);
                float _1610 = _1608 * _1596;
                float _1612 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1582 = _1612;
            }
            float _1614 = _1582;
            float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1618 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1620 = !_222;
            if (!_1620)
            {
                float _1622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1624 = log2(_1622);
                float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1628 = _1626 + 1.0;
                float _1630 = 1.0 / _1628;
                float _1632 = _1624 * _1564;
                float _1634 = exp2(_1632);
                float _1636 = -_1634;
                float _1638 = _1636 + 1.0;
                float _1640 = _1638 * _1630;
                _1566 = _1640;
            }
            float _1642 = _1566;
            float _1644 = fma(_1642, _192, _1618);
            float _1646 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1648 = fma(_1642, _190, _1616);
            float _1650 = -_1348;
            float _1652 = _1650 + _1644;
            float _1654 = fma(_1642, _194, _1646);
            float _1656 = -_1350;
            float _1658 = _1656 + _1648;
            float _1660 = _1652 * _688;
            float _1662 = _1652 * _676;
            float _1664 = _1652 * _698;
            float _1666 = -_1360;
            float _1668 = _1666 + _1654;
            float _1670 = fma(_1658, _686, _1660);
            float _1672 = fma(_1658, _674, _1662);
            float _1674 = fma(_1658, _696, _1664);
            float _1676 = fma(_1668, _690, _1670);
            float _1678 = fma(_1668, _678, _1672);
            float _1680 = fma(_1668, _700, _1674);
            _1424 = _1678;
            _1412 = _1676;
            _1414 = _1680;
            _1550 = _1676;
            _1556 = _1678;
            _1562 = _1680;
        }
        float _1682 = _1424;
        float _1684 = _1412;
        float _1686 = _1414;
        float _1688 = _1550;
        float _1690 = _1556;
        float _1692 = _1562;
        float _1694 = _1682 * _1682;
        float _1696 = rsqrt(_1520);
        float _1698 = fma(_1684, _1684, _1694);
        float _1700 = fma(_1686, _1686, _1698);
        float _1702 = sqrt(_1700);
        float _1704 = _1510 * _1696;
        float _1706 = _1506 * _1696;
        float _1708 = _1514 * _1696;
        bool _1710 = _1702 > 0.0;
        bool _1712 = !_1710;
        _750 = _1706;
        if (!_1712)
        {
            float _1714 = rsqrt(_1700);
            float _1716 = _1714 * _1682;
            float _1718 = _1714 * _1684;
            float _1720 = _1714 * _1686;
            float _1722 = _1706 * _1716;
            float _1724 = fma(_1704, _1718, _1722);
            float _1726 = fma(_1708, _1720, _1724);
            float _1728 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1730 = fma(_1688, _1728, _1500);
            float _1732 = fma(_1690, _1728, _1498);
            float _1734 = fma(_1692, _1728, _1502);
            _1532 = _1732;
            _1534 = _1730;
            _1536 = _1734;
            _750 = _1722;
        }
    }
    float _1736 = _1532;
    float _1738 = _1534;
    float _1740 = _1536;
    float _1742 = _750;
    float _1744 = -_900;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_918;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_904;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1774;
    float _1800 = _1742;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _788 = _1822;
    }
    float _1824 = _788;
    float _1826 = _1810;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1766;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (!_1792)
    {
        _1804 = _1782;
    }
    float _1854 = _1804;
    float _1856 = _1854;
    if (_1792)
    {
        float _1858 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1832;
    float _1864 = _1860;
    if (_1792)
    {
        float _1866 = fma(_1832, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _752 = _1866;
    }
    float _1868 = _752;
    float _1870 = _1868;
    if (!_1792)
    {
        _1862 = _1852;
    }
    float _1872 = _1862;
    float _1874 = _1872;
    float _1876 = _1846;
    if (_1792)
    {
        float _1878 = _1846 + (-1.0);
        _1864 = _1878;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1792)
    {
        float _1884 = _1814 * _1868;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1792)
    {
        float _1888 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1888;
    }
    float _1890 = _1816;
    if (_1792)
    {
        float _1892 = _1780 * _1886;
        _1806 = _1892;
    }
    float _1894 = _1806;
    if (!_1792)
    {
        _1882 = _1784;
    }
    float _1896 = _1882;
    float _1898 = _1896;
    if (_1792)
    {
        float _1900 = _1782 * _1886;
        _1856 = _1900;
    }
    float _1902 = _1856;
    if (_1792)
    {
        float _1904 = fma(_1852, _1846, _1890);
        _1874 = _1904;
    }
    float _1906 = _1874;
    if (_1792)
    {
        float _1908 = _1894 * _1894;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (!_1792)
    {
        _1876 = _1786;
    }
    float _1912 = _1876;
    float _1914 = _1912;
    if (_1792)
    {
        float _1916 = _1902 * _1902;
        _1914 = _1916;
    }
    float _1918 = _1914;
    float _1920 = fma(_1906, _1906, _1910);
    float _1922 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = _1920 + _1918;
    float _1926 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = rsqrt(_1924);
    float _1938 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1932;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1948 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1954 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1952);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1972 = _1936 * _1894;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1976 = _1936 * _1906;
    float _1978 = -_1966;
    float _1980 = fma(_1978, _1962, 1.0);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1984 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1968);
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1974);
    float _1988 = _1936 * _1902;
    float _1990 = -_1982;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1990);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1998 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1992);
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1996);
    float _2008 = log2(_1980);
    float _2010 = fma(_2002, -0.5, 0.5);
    float _2012 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2004);
    float _2016 = fma(_2002, 0.5, 0.5);
    float _2018 = _1976 + 1.0;
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2012);
    float _2022 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2014);
    float _2024 = exp2(_1998);
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2032 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2034 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2028);
    float _2036 = 1.0 / _2006;
    float _2038 = _2008 * 0.693147182464599609375;
    float _2040 = fma(_2016, _2032, 1.570728778839111328125);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2044 = sqrt(_2010);
    float _2046 = -_1976;
    float _2048 = fma(_2024, _2018, _2046);
    float _2050 = fma(_2048, 0.5, 0.5);
    float _2052 = _2030 * _2036;
    float _2054 = _2034 * _2036;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2044 * 0.636619746685028076171875;
    float3 _5258 = float3(_2056, _2058, _2042);
    float _2062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5258, float3(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5258, float3(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_2056, _2058, _2042);
    float4 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).xyzw;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    float _2073 = _2065.w;
    float _2075 = -_2040;
    float _2077 = fma(_2060, _2075, 1.0);
    float2 _5291 = float2(_2077, _2050);
    float3 _2081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5291, float2(0.0), isnan(_5291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5291, float2(0.0), isnan(_5291)), level(0.0)).xyz;
    float _2083 = _2081.x;
    float _2085 = _2081.y;
    float _2087 = _2081.z;
    float _2089 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2091 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2093 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2091);
    float _2095 = exp2(_2089);
    float _2097 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2093);
    float _2099 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2101 = _2099 + _2006;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2099;
    out.gl_Position.w = _2006;
    float _2103 = _2101 * 0.5;
    float _2105 = -_2095;
    float _2107 = _2105 + 1.0;
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2103;
    out.m_73.w = _2006;
    float _2111 = _2109 * _2062;
    float _2113 = -_2109;
    float _2115 = _2113 + 1.0;
    float _2117 = _2073 * _2111;
    float _2119 = _2073 * _2115;
    float _2121 = _2087 * _2111;
    float _2123 = fma(_2083, _2117, _2067);
    float _2125 = fma(_2085, _2117, _2069);
    float _2127 = fma(_2073, _2121, _2071);
    out.m_75.x = _2123;
    out.m_75.y = _2125;
    out.m_75.z = _2127;
    out.m_75.w = _2119;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
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
        float _2183 = as_type<float>(_108);
        out.gl_Position.z = _2183;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2247 = as_type<float>(_142);
        out.gl_Position.z = _2247;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = in.m_51.z;
    float _150 = 1.0 / _114;
    float _152 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_53.y;
    float _156 = in.m_55.w;
    float _158 = in.m_57.w;
    float _160 = _118 * _150;
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = abs(_144);
    float _174 = abs(_148);
    float _176 = precise::max(_172, _174);
    bool _178 = _176 >= 16.0;
    float _180 = fma(_160, 1.25, 0.75);
    float _182 = -_148;
    float _184 = fma(_180, _148, _182);
    float _186 = -_144;
    float _188 = fma(_180, _144, _186);
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _148);
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _144);
    float _200 = _148;
    float _202 = _144;
    float _204 = _152;
    if (_178)
    {
        float _206 = _148 * 0.0625;
        _200 = _206;
    }
    float _208 = _200;
    if (_178)
    {
        float _210 = _144 * 0.0625;
        _202 = _210;
    }
    float _212 = _202;
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
    float _256 = _254;
    if (!_222)
    {
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _258;
    }
    float _260 = _256;
    bool _262 = false;
    float _264 = _260;
    if (_246)
    {
        bool _266 = as_type<int>(_212) >= 0;
        _262 = _266;
    }
    bool _268 = _262;
    bool _270 = !_222;
    int _272 = 0;
    float _274 = 0.0;
    int _276 = _268 ? (-1) : 0;
    float _278 = _154;
    float _280 = _162;
    if (!_270)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _152 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _152);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = as_type<int>(_294);
        _274 = _300;
        _264 = _310;
    }
    int _312 = _272;
    float _314 = _274;
    float _316 = _264;
    bool _318 = !_222;
    float _320 = _314;
    int _322 = _312;
    if (!_318)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _152 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _320 = _330;
        _204 = _342;
    }
    float _344 = _320;
    float _346 = _204;
    float _348 = _344;
    if (_246)
    {
        int _350 = _268 ? 0 : 1078530011;
        _322 = _350;
    }
    int _352 = _322;
    float _354 = 0.0;
    int _356 = _352;
    if (!_222)
    {
        float _358 = _118 * _118;
        float _360 = _358 * 0.5;
        _354 = _360;
    }
    float _362 = _354;
    float _364 = _362;
    if (!_222)
    {
        _348 = _118;
    }
    float _366 = _348;
    float _368 = _366;
    if (!_222)
    {
        float _370 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _364 = _370;
    }
    float _372 = _364;
    float _374 = 0.0;
    float _376 = _372;
    if (_246)
    {
        int _378 = int(0x80000000) & as_type<int>(_208);
        int _380 = _352 | _378;
        _374 = as_type<float>(_380);
    }
    float _382 = _374;
    bool _384 = !_222;
    float _386 = _382;
    float _388 = _382;
    if (!_384)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = _118 * _392;
        float _402 = 1.0 / _396;
        float _404 = _398 * 0.693147182464599609375;
        float _406 = exp2(_400);
        float _408 = 1.0 / _404;
        float _410 = _406 + (-1.0);
        float _412 = -_410;
        float _414 = fma(_412, _408, _118);
        float _416 = _414 * _402;
        float _418 = _416 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _356 = as_type<int>(_408);
        _376 = _418;
    }
    int _420 = _356;
    float _422 = _376;
    bool _424 = !_222;
    int _426 = _420;
    if (!_424)
    {
        float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _430 = log2(_428);
        float _432 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _434 = _432 + 1.0;
        float _436 = 1.0 / _434;
        float _438 = _118 * _430;
        float _440 = exp2(_438);
        float _442 = -_440;
        float _444 = _442 + 1.0;
        float _446 = _444 * _436;
        _426 = as_type<int>(_434);
        _368 = _446;
    }
    int _448 = _426;
    float _450 = _368;
    bool _452 = !_234;
    bool _454 = _452 && _238;
    int _456 = _448;
    float _458 = 0.0;
    if (!_454)
    {
        float _460 = abs(_208);
        bool _462 = _460 != as_type<float>(0x7f800000u /* inf */);
        bool _464 = isnan(_460);
        bool _466 = _462 || _464;
        bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _470 = _466 || _468;
        float _472 = abs(_212);
        bool _474 = _472 == as_type<float>(0x7f800000u /* inf */);
        float _476 = abs(_212);
        bool _478 = _476 == as_type<float>(0x7f800000u /* inf */);
        bool _480 = !_470;
        bool _482 = _478 && _480;
        if (_482)
        {
            bool _484 = as_type<int>(_212) >= 0;
            _276 = _484 ? (-1) : 0;
        }
        int _486 = _276;
        if (_482)
        {
            _456 = 1075235812;
        }
        int _488 = _456;
        int _490 = _488;
        if (_482)
        {
            int _492 = ~_486;
            int _494 = (_492 != 0) ? _488 : 1061752795;
            _490 = _494;
        }
        int _496 = _490;
        if (_482)
        {
            int _498 = int(0x80000000) & as_type<int>(_208);
            int _500 = _496 | _498;
            _386 = as_type<float>(_500);
        }
        float _502 = _386;
        bool _504 = !_470;
        bool _506 = _504 && _474;
        _458 = 0.0;
        _388 = _502;
        if (!_506)
        {
            float _508 = abs(_212);
            float _510 = abs(_208);
            float _512 = precise::max(_508, _510);
            float _514 = abs(_212);
            float _516 = abs(_208);
            float _518 = _514 + _516;
            float _520 = abs(_212);
            float _522 = abs(_208);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _512;
            float _528 = abs(_208);
            float _530 = abs(_212);
            bool _532 = _528 > _530;
            bool _534 = as_type<int>(_212) >= 0;
            bool _536 = _518 > as_type<float>(0x7f800000u /* inf */);
            bool _538 = isnan(_518);
            bool _540 = _536 || _538;
            bool _542 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _544 = _540 || _542;
            float _546 = _524 * _526;
            float _548 = _546 * _546;
            float _550 = _548 + 11.33538818359375;
            float _552 = fma(_548, _550, 28.84246826171875);
            float _554 = fma(_548, _552, 19.6966705322265625);
            float _556 = fma(_548, -0.82336294651031494140625, -5.674867153167724609375);
            float _558 = fma(_548, _556, -6.565555095672607421875);
            float _560 = 1.0 / _554;
            float _562 = _548 * _558;
            float _564 = _546 * _562;
            float _566 = fma(_564, _560, _546);
            int _568 = as_type<int>(_208) & int(0x80000000);
            float _570 = _566;
            _458 = 0.82336294651031494140625;
            _388 = _518;
            if (_532)
            {
                float _572 = -_566;
                float _574 = _572 + 1.57079637050628662109375;
                _570 = _574;
            }
            float _576 = _570;
            int _578 = as_type<int>(_576);
            if (!_534)
            {
                float _580 = -_576;
                float _582 = _580 + 3.1415927410125732421875;
                _578 = as_type<int>(_582);
            }
            int _584 = _578;
            if (!_544)
            {
                int _586 = _568 | _584;
                _388 = as_type<float>(_586);
            }
        }
    }
    float _588 = _458;
    float _590 = _388;
    float _592 = in.m_57.x;
    float _594 = in.m_57.y;
    float _596 = in.m_57.z;
    float _598 = -_154;
    float _600 = _598 + 1.0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _604 = _602 != 0;
    float _606 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _608 = _164 > 0.5;
    float _610 = in.m_53.x;
    float _612 = _160 * 3.1415927410125732421875;
    int _614 = _608 ? as_type<int>(_600) : as_type<int>(_154);
    out.m_59.y = _154;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _618 = _616 != 0;
    float _620 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _156 > 0.5;
    float _624 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _632 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _636 = _634 != 0;
    float _638 = fma(_346, _192, _624);
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _642 = _640 != 0;
    float _644 = fma(_346, _190, _630);
    float _646 = fma(_346, _194, _632);
    float _648 = _212;
    bool _650 = _636;
    bool _652 = _642;
    if (_604)
    {
        float _654 = in.m_55.x;
        _648 = _654;
    }
    float _656 = _648;
    float _658 = fma(_638, _158, _168);
    float _660 = fma(_644, _158, _166);
    float _662 = fma(_646, _158, _170);
    float _664 = _588;
    if (_618)
    {
        float _666 = in.m_55.z;
        _664 = _666;
    }
    float _668 = _664;
    float _670 = _592 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _672 = _594 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = _636 ? as_type<float>(_614) : _154;
    float _686 = in.m_63.x;
    float _688 = in.m_63.y;
    float _690 = in.m_63.z;
    float _692 = -_682;
    float _694 = fma(_606, 2.0, _692);
    float _696 = in.m_65.x;
    float _698 = in.m_65.y;
    float _700 = in.m_65.z;
    if (_642)
    {
        float _702 = _622 ? _600 : _154;
        _278 = _702;
    }
    float _704 = _278;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _708 = 0.0;
    if (!_628)
    {
        _708 = _164;
    }
    float _710 = _708;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _710;
    float _716 = _712;
    if (_628)
    {
        _714 = _162;
    }
    float _718 = _714;
    float _720 = fma(_620, -2.0, _706);
    float _722 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _724 = as_type<int>(_720);
    if (_604)
    {
        bool _726 = _656 > 0.5;
        _650 = _726;
    }
    bool _728 = _650;
    float _730 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    if (!_604)
    {
        _716 = _610;
    }
    float _732 = _716;
    float _734 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _736 = _732;
    if (_618)
    {
        bool _738 = _668 > 0.5;
        _652 = _738;
    }
    bool _740 = _652;
    float _742 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _674 * _674;
    float _748 = _742;
    float _750 = _676;
    float _752 = _678;
    if (!_604)
    {
        _280 = _732;
    }
    float _754 = _280;
    float _756 = _734 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _758 = _754;
    if (_604)
    {
        _736 = _610;
    }
    float _760 = _736;
    float _762 = fma(_686, _686, _746);
    float _764 = _612 * 0.15915493667125701904296875;
    float _766 = _658 * _688;
    float _768 = _658 * _676;
    float _770 = _658 * _698;
    float _772 = _676 * _676;
    float _774 = fma(_660, _686, _766);
    float _776 = fma(_660, _674, _768);
    float _778 = fma(_660, _696, _770);
    float _780 = fma(_688, _688, _772);
    float _782 = fma(_662, _690, _774);
    float _784 = fma(_662, _678, _776);
    float _786 = _770;
    float _788 = _686;
    if (!_628)
    {
        float _790 = in.m_55.z;
        _786 = _790;
    }
    float _792 = _786;
    float _794 = fma(_662, _700, _778);
    float _796 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _798 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = fma(_698, _698, _780);
    float _804 = _782 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _808 = _798 + _806;
    float _810 = _800 * 0.15915493667125701904296875;
    float _812 = _794 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _816 = _804 + _814;
    float _818 = _808 * _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _822 = _812 + _820;
    float _824 = fma(_696, _696, _762);
    float _826 = fma(_816, _816, _818);
    float _828 = _756 * 12.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = sqrt(_824);
    float _834 = fma(_822, _822, _826);
    float _836 = fma(_796, _684, -0.5);
    float _838 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _840 = fma(_590, 4.0, _828);
    float _842 = _796;
    float _844 = _792;
    float _846 = _802;
    if (!_628)
    {
        _842 = _792;
    }
    float _848 = _842;
    float _850 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _838);
    float _852 = rsqrt(_834);
    float _854 = _848;
    if (_628)
    {
        _854 = _164;
    }
    float _856 = _854;
    float _858 = _840 * 0.15915493667125701904296875;
    if (_628)
    {
        _844 = _164;
    }
    float _860 = _844;
    float _862 = _756 * 6.0;
    float _864 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _720);
    if (_604)
    {
        float _866 = -_760;
        float _868 = _866 + 1.0;
        _724 = as_type<int>(_868);
    }
    int _870 = _724;
    float _872 = _810 * 6.283185482025146484375;
    float _874 = sin(_872);
    float _876 = -_862;
    float _878 = fma(_590, 3.0, _876);
    float _880 = -_864;
    float _882 = fma(_850, _836, _880);
    float _884 = _590 + 3.1415927410125732421875;
    float _886 = _878 * 0.15915493667125701904296875;
    bool _888 = _832 > 0.0;
    float _890 = _678 * _678;
    float _892 = _764 * 6.283185482025146484375;
    float _894 = sin(_892);
    if (_604)
    {
        float _896 = _728 ? as_type<float>(_870) : _760;
        _758 = _896;
    }
    float _898 = _758;
    float _900 = _808 * _852;
    float _902 = _884 * 0.15915493667125701904296875;
    float _904 = _822 * _852;
    float _906 = -_900;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _910 = fma(_874, 0.10000002384185791015625, 1.0);
    float _912 = _858 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = fma(_690, _690, _890);
    float _918 = _816 * _852;
    float _920 = -_918;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _816);
    float _924 = _886 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = 0.0 + _894;
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = _908 * _908;
    float _934 = fma(_700, _700, _916);
    float _936 = -_146;
    float _938 = fma(_930, _146, _936);
    float _940 = fma(_922, _922, _932);
    float _942 = -_904;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _946 = sqrt(_802);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[191].z, _146);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _952 = _950 + 2.0;
    float _954 = fma(_944, _944, _940);
    float _956 = _902 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _914 + _926;
    float _962 = fma(_960, 0.25, 0.5);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _966 = sqrt(_934);
    bool _968 = _946 > 0.0;
    float _970 = fma(_962, _952, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _974 = sqrt(_954);
    float _976 = fma(_958, 0.5, 0.5);
    float _978 = _976 * _970;
    float _980 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _984 = _966 > 0.0;
    float _986 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[83].z, _972);
    float _988 = _978 * _980;
    float _990 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = _966;
    float _994 = _972;
    if (_968)
    {
        float _996 = rsqrt(_802);
        _992 = _996;
    }
    float _998 = _992;
    float _1000 = fma(_988, _964, 1.0);
    float _1002 = -_982;
    float _1004 = fma(_990, 2.0, _1002);
    float _1006 = _852 * _974;
    float _1008 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _198 * _1000;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1016 = _1008 * _1006;
    float _1018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1020 = _722 * _1006;
    float _1022 = _196 * _1000;
    float _1024 = _742 * _1006;
    float _1026 = _1016 * _1018;
    float _1028 = _1018;
    float _1030 = _1006;
    float _1032 = _1020;
    float _1034 = _1024;
    float _1036 = _1012;
    if (!_968)
    {
        _748 = 0.0;
    }
    float _1038 = _748;
    float _1040 = _982;
    float _1042 = _1038;
    if (_888)
    {
        float _1044 = rsqrt(_824);
        _1040 = _1044;
    }
    float _1046 = _1040;
    if (!_968)
    {
        _1028 = 0.0;
    }
    float _1048 = _1028;
    float _1050 = _1020 * _1012;
    float _1052 = _1048;
    if (_968)
    {
        float _1054 = _998 * _688;
        _1042 = _1054;
    }
    float _1056 = _1042;
    if (_968)
    {
        float _1058 = _998 * _698;
        _1052 = _1058;
    }
    float _1060 = _1052;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1022);
    float _1064 = _1062;
    if (!_888)
    {
        _1030 = 0.0;
    }
    float _1066 = _1030;
    float _1068 = _1050 * _1056;
    float _1070 = _934;
    float _1072 = _1066;
    int _1074 = as_type<int>(_1068);
    if (_984)
    {
        float _1076 = rsqrt(_934);
        _1070 = _1076;
    }
    float _1078 = _1070;
    float _1080 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1082 = _1014;
    if (!_888)
    {
        _1082 = 0.0;
    }
    float _1084 = _1082;
    float _1086 = _1050 * _1060;
    float _1088 = _1084;
    if (!_984)
    {
        _1032 = 0.0;
    }
    float _1090 = _1032;
    float _1092 = fma(_1080, _704, -0.5);
    float _1094 = _1024 * _1062;
    float _1096 = _1090;
    if (!_984)
    {
        _1034 = 0.0;
    }
    float _1098 = _1034;
    float _1100 = _1098;
    if (_888)
    {
        float _1102 = _1046 * _686;
        _1088 = _1102;
    }
    float _1104 = _1088;
    if (_888)
    {
        float _1106 = _1046 * _696;
        _1072 = _1106;
    }
    float _1108 = _1072;
    if (!_618)
    {
        _846 = _760;
    }
    float _1110 = _846;
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1114 = fma(_1026, _1104, _1068);
    float _1116 = fma(_1026, _1108, _1086);
    float _1118 = _1110;
    if (_618)
    {
        float _1120 = -_760;
        float _1122 = _1120 + 1.0;
        _1074 = as_type<int>(_1122);
    }
    int _1124 = _1074;
    if (_984)
    {
        float _1126 = _1078 * _690;
        _1096 = _1126;
    }
    float _1128 = _1096;
    if (_984)
    {
        float _1130 = _1078 * _700;
        _1100 = _1130;
    }
    float _1132 = _1100;
    if (!_888)
    {
        _1036 = 0.0;
    }
    float _1134 = _1036;
    float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1138 = fma(_1094, _1128, _1114);
    float _1140 = fma(_1094, _1132, _1116);
    float _1142 = _1134;
    if (_618)
    {
        float _1144 = _740 ? as_type<float>(_1124) : _760;
        _1118 = _1144;
    }
    float _1146 = _1118;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1150 = _804 + _1138;
    float _1152 = _812 + _1140;
    float _1154 = _1150;
    float _1156 = _1152;
    if (_888)
    {
        float _1158 = _1046 * _674;
        _1142 = _1158;
    }
    float _1160 = _1142;
    float _1162 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1148);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1150 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1152 + _1168;
    if (!_968)
    {
        _1064 = 0.0;
    }
    float _1172 = _1064;
    float _1174 = _1172;
    if (_968)
    {
        float _1176 = _998 * _676;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1166 * _1166;
    float _1182 = _1170 * _1170;
    float _1184 = _1180;
    float _1186 = _1182;
    if (!_984)
    {
        _994 = 0.0;
    }
    float _1188 = _994;
    float _1190 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = _1050 * _1178;
    float _1194 = _1180 + _1182;
    float _1196 = _1188;
    if (_984)
    {
        float _1198 = _1078 * _678;
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = fma(_1190, _898, -0.5);
    float _1204 = sqrt(_1194);
    float _1206 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1208 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1210 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1212 = -_118;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _1216 = fma(_1026, _1160, _1192);
    float _1218 = fma(_1206, _1146, -0.5);
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1222 = fma(_1210, _1202, _1214);
    float _1224 = fma(_1094, _1200, _1216);
    float _1226 = fma(_1208, -2.0, _1220);
    float _1228 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1232 = _1204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1238 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = -_118;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1248 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1252 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1226);
    float _1254 = _798 + _1224;
    bool _1256 = !_1232;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1204 + _1262;
        float _1266 = rsqrt(_1194);
        float _1268 = _1264 * _1260;
        float _1270 = _1254 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = _1268 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1266 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1166, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1170, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1254, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1184 = _1304;
        _1186 = _1306;
        _1154 = _1288;
        _1156 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1184;
    float _1312 = _1186;
    float _1314 = _1154;
    float _1316 = _1156;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1248;
    out.m_67.w = _1246;
    float _1322 = fma(_1228, _1218, _1244);
    float _1324 = -_1252;
    float _1326 = fma(_1250, _1092, _1324);
    float _1328 = fma(_1320, _1320, _1310);
    float _1330 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1332 = _1328 + _1312;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1336 = sqrt(_1332);
    float _1338 = _882 + 0.5;
    float _1340 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1342 = _1322 + 0.5;
    float _1344 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = fma(_450, _192, _1340);
    float _1350 = fma(_450, _190, _1330);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = -_1348;
    float _1358 = _638 + _1356;
    float _1360 = fma(_450, _194, _1344);
    float _1362 = -_1350;
    float _1364 = _644 + _1362;
    float _1366 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * _698;
    float _1370 = _1358 * _688;
    bool _1372 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1374 = isnan(_1336);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1380 = _1376 || _1378;
    float _1382 = _1358 * _676;
    float _1384 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1222 + 0.5;
    float _1390 = _1326 + 0.5;
    float _1392 = -_1360;
    float _1394 = _646 + _1392;
    float _1396 = fma(_1364, _696, _1368);
    float _1398 = fma(_1364, _686, _1370);
    float _1400 = fma(_1364, _674, _1382);
    out.m_69.x = _1366;
    out.m_69.y = _1384;
    out.m_69.z = _1386;
    out.m_69.w = _1354;
    out.m_71.x = _1388;
    out.m_71.y = _1338;
    out.m_71.z = _1342;
    out.m_71.w = _1390;
    float _1402 = fma(_1394, _700, _1396);
    float _1404 = fma(_1394, _690, _1398);
    float _1406 = _1396;
    float _1408 = _1308;
    float _1410 = _1402;
    float _1412 = _1404;
    float _1414 = _1402;
    if (!_1380)
    {
        _1406 = 1.0;
    }
    float _1416 = _1406;
    float _1418 = fma(_1394, _678, _1400);
    bool _1420 = !_1380;
    float _1422 = _1416;
    float _1424 = _1418;
    if (!_1420)
    {
        bool _1426 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1336);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1336 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1336 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1336);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1336 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1482;
                _1454 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1422;
    float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1488 = _1308 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1492 = _1314 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1316 + _1494;
    float _1498 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1492, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1502 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1504 = -_798;
    float _1506 = _1504 + _1498;
    float _1508 = -_804;
    float _1510 = _1508 + _1500;
    float _1512 = -_812;
    float _1514 = _1512 + _1502;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > 0.0;
    bool _1526 = !_1524;
    float _1528 = _1522;
    float _1530 = _1492;
    float _1532 = _1498;
    float _1534 = _1500;
    float _1536 = _1502;
    if (!_1526)
    {
        bool _1538 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1540 = _1390;
        if (_1538)
        {
            float _1542 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1540 = _1542;
        }
        float _1544 = _1540;
        if (_1538)
        {
            float _1546 = _1404 * _1544;
            _1408 = _1546;
        }
        float _1548 = _1408;
        float _1550 = _1548;
        if (_1538)
        {
            float _1552 = _1418 * _1544;
            _1528 = _1552;
        }
        float _1554 = _1528;
        float _1556 = _1554;
        if (_1538)
        {
            float _1558 = _1402 * _1544;
            _1530 = _1558;
        }
        float _1560 = _1530;
        float _1562 = _1560;
        if (!_1538)
        {
            float _1564 = _118 + 1.0;
            float _1566 = _1564;
            if (!_222)
            {
                float _1568 = _1564 * _1564;
                float _1570 = _1568 * 0.5;
                _1410 = _1570;
            }
            float _1572 = _1410;
            float _1574 = _1572;
            if (!_222)
            {
                float _1576 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1574 = _1576;
            }
            float _1578 = _1574;
            bool _1580 = !_222;
            float _1582 = _1578;
            if (!_1580)
            {
                float _1584 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1586 = log2(_1584);
                float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1590 = _1588 + 1.0;
                float _1592 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1594 = _1586 * _1564;
                float _1596 = 1.0 / _1590;
                float _1598 = _1592 * 0.693147182464599609375;
                float _1600 = exp2(_1594);
                float _1602 = 1.0 / _1598;
                float _1604 = _1600 + (-1.0);
                float _1606 = -_1604;
                float _1608 = fma(_1606, _1602, _1564);
                float _1610 = _1608 * _1596;
                float _1612 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1582 = _1612;
            }
            float _1614 = _1582;
            float _1616 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1618 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1620 = !_222;
            if (!_1620)
            {
                float _1622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1624 = log2(_1622);
                float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1628 = _1626 + 1.0;
                float _1630 = 1.0 / _1628;
                float _1632 = _1624 * _1564;
                float _1634 = exp2(_1632);
                float _1636 = -_1634;
                float _1638 = _1636 + 1.0;
                float _1640 = _1638 * _1630;
                _1566 = _1640;
            }
            float _1642 = _1566;
            float _1644 = fma(_1642, _192, _1618);
            float _1646 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1648 = fma(_1642, _190, _1616);
            float _1650 = -_1348;
            float _1652 = _1650 + _1644;
            float _1654 = fma(_1642, _194, _1646);
            float _1656 = -_1350;
            float _1658 = _1656 + _1648;
            float _1660 = _1652 * _688;
            float _1662 = _1652 * _676;
            float _1664 = _1652 * _698;
            float _1666 = -_1360;
            float _1668 = _1666 + _1654;
            float _1670 = fma(_1658, _686, _1660);
            float _1672 = fma(_1658, _674, _1662);
            float _1674 = fma(_1658, _696, _1664);
            float _1676 = fma(_1668, _690, _1670);
            float _1678 = fma(_1668, _678, _1672);
            float _1680 = fma(_1668, _700, _1674);
            _1424 = _1678;
            _1412 = _1676;
            _1414 = _1680;
            _1550 = _1676;
            _1556 = _1678;
            _1562 = _1680;
        }
        float _1682 = _1424;
        float _1684 = _1412;
        float _1686 = _1414;
        float _1688 = _1550;
        float _1690 = _1556;
        float _1692 = _1562;
        float _1694 = _1682 * _1682;
        float _1696 = rsqrt(_1520);
        float _1698 = fma(_1684, _1684, _1694);
        float _1700 = fma(_1686, _1686, _1698);
        float _1702 = sqrt(_1700);
        float _1704 = _1510 * _1696;
        float _1706 = _1506 * _1696;
        float _1708 = _1514 * _1696;
        bool _1710 = _1702 > 0.0;
        bool _1712 = !_1710;
        _750 = _1706;
        if (!_1712)
        {
            float _1714 = rsqrt(_1700);
            float _1716 = _1714 * _1682;
            float _1718 = _1714 * _1684;
            float _1720 = _1714 * _1686;
            float _1722 = _1706 * _1716;
            float _1724 = fma(_1704, _1718, _1722);
            float _1726 = fma(_1708, _1720, _1724);
            float _1728 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1730 = fma(_1688, _1728, _1500);
            float _1732 = fma(_1690, _1728, _1498);
            float _1734 = fma(_1692, _1728, _1502);
            _1532 = _1732;
            _1534 = _1730;
            _1536 = _1734;
            _750 = _1722;
        }
    }
    float _1736 = _1532;
    float _1738 = _1534;
    float _1740 = _1536;
    float _1742 = _750;
    float _1744 = -_900;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_918;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_904;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1750 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1754 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1774;
    float _1800 = _1742;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _788 = _1822;
    }
    float _1824 = _788;
    float _1826 = _1810;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1766;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (!_1792)
    {
        _1804 = _1782;
    }
    float _1854 = _1804;
    float _1856 = _1854;
    if (_1792)
    {
        float _1858 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1858;
    }
    float _1860 = _1840;
    float _1862 = _1832;
    float _1864 = _1860;
    if (_1792)
    {
        float _1866 = fma(_1832, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _752 = _1866;
    }
    float _1868 = _752;
    float _1870 = _1868;
    if (!_1792)
    {
        _1862 = _1852;
    }
    float _1872 = _1862;
    float _1874 = _1872;
    float _1876 = _1846;
    if (_1792)
    {
        float _1878 = _1846 + (-1.0);
        _1864 = _1878;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1792)
    {
        float _1884 = _1814 * _1868;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1792)
    {
        float _1888 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1888;
    }
    float _1890 = _1816;
    if (_1792)
    {
        float _1892 = _1780 * _1886;
        _1806 = _1892;
    }
    float _1894 = _1806;
    if (!_1792)
    {
        _1882 = _1784;
    }
    float _1896 = _1882;
    float _1898 = _1896;
    if (_1792)
    {
        float _1900 = _1782 * _1886;
        _1856 = _1900;
    }
    float _1902 = _1856;
    if (_1792)
    {
        float _1904 = fma(_1852, _1846, _1890);
        _1874 = _1904;
    }
    float _1906 = _1874;
    if (_1792)
    {
        float _1908 = _1894 * _1894;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (!_1792)
    {
        _1876 = _1786;
    }
    float _1912 = _1876;
    float _1914 = _1912;
    if (_1792)
    {
        float _1916 = _1902 * _1902;
        _1914 = _1916;
    }
    float _1918 = _1914;
    float _1920 = fma(_1906, _1906, _1910);
    float _1922 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1924 = _1920 + _1918;
    float _1926 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1922);
    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1930 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1928);
    float _1932 = precise::clamp(_1930, 0.0, 1.0);
    float _1934 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = rsqrt(_1924);
    float _1938 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1932;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1948 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1954 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1952);
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1972 = _1936 * _1894;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1976 = _1936 * _1906;
    float _1978 = -_1966;
    float _1980 = fma(_1978, _1962, 1.0);
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1984 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1968);
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1974);
    float _1988 = _1936 * _1902;
    float _1990 = -_1982;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1990);
    float _1994 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1996 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1998 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1992);
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1996);
    float _2008 = log2(_1980);
    float _2010 = fma(_2002, -0.5, 0.5);
    float _2012 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2014 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2004);
    float _2016 = fma(_2002, 0.5, 0.5);
    float _2018 = _1976 + 1.0;
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2012);
    float _2022 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2014);
    float _2024 = exp2(_1998);
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2020);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2022);
    float _2032 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2034 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2028);
    float _2036 = 1.0 / _2006;
    float _2038 = _2008 * 0.693147182464599609375;
    float _2040 = fma(_2016, _2032, 1.570728778839111328125);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2044 = sqrt(_2010);
    float _2046 = -_1976;
    float _2048 = fma(_2024, _2018, _2046);
    float _2050 = fma(_2048, 0.5, 0.5);
    float _2052 = _2030 * _2036;
    float _2054 = _2034 * _2036;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2044 * 0.636619746685028076171875;
    float3 _5258 = float3(_2056, _2058, _2042);
    float _2062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5258, float3(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5258, float3(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_2056, _2058, _2042);
    float4 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).xyzw;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    float _2073 = _2065.w;
    float _2075 = -_2040;
    float _2077 = fma(_2060, _2075, 1.0);
    float2 _5291 = float2(_2077, _2050);
    float3 _2081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5291, float2(0.0), isnan(_5291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5291, float2(0.0), isnan(_5291)), level(0.0)).xyz;
    float _2083 = _2081.x;
    float _2085 = _2081.y;
    float _2087 = _2081.z;
    float _2089 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2091 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2093 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2091);
    float _2095 = exp2(_2089);
    float _2097 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2093);
    float _2099 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2097);
    float _2101 = _2099 + _2006;
    out.gl_Position.x = _2030;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2099;
    out.gl_Position.w = _2006;
    float _2103 = _2101 * 0.5;
    float _2105 = -_2095;
    float _2107 = _2105 + 1.0;
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2103;
    out.m_73.w = _2006;
    float _2111 = _2109 * _2062;
    float _2113 = -_2109;
    float _2115 = _2113 + 1.0;
    float _2117 = _2073 * _2111;
    float _2119 = _2073 * _2115;
    float _2121 = _2087 * _2111;
    float _2123 = fma(_2083, _2117, _2067);
    float _2125 = fma(_2085, _2117, _2069);
    float _2127 = fma(_2073, _2121, _2071);
    out.m_75.x = _2123;
    out.m_75.y = _2125;
    out.m_75.z = _2127;
    out.m_75.w = _2119;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

