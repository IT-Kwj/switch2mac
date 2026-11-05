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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_51 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1316 = as_type<float>(_110);
        out.gl_Position.z = _1316;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _128 = 0;
    if (_122)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_146);
        out.gl_Position.z = _1384;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154 * 0.15915493667125701904296875;
    float _168 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = 0.0;
    float _176 = _168;
    if (!_164)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = abs(_148);
    float _186 = abs(_150);
    float _188 = precise::max(_184, _186);
    float _190 = _150 * 0.0625;
    float _192 = _182;
    if (!_164)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = _188 >= 16.0;
    float _200 = _148 * 0.0625;
    float _202 = _198 ? _190 : _150;
    float _204 = _198 ? _200 : _148;
    float _206 = abs(_202);
    bool _208 = _206 != 0.0;
    bool _210 = isnan(_206);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = in.m_53.x;
    float _220 = in.m_53.y;
    float _222 = in.m_53.z;
    float _224 = abs(_204);
    bool _226 = _224 == 0.0;
    float _228 = abs(_204);
    bool _230 = _228 == 0.0;
    bool _232 = !_216;
    bool _234 = _230 && _232;
    bool _236 = false;
    float _238 = _196;
    int _240 = _216 ? (-1) : 0;
    if (_234)
    {
        bool _242 = as_type<int>(_204) >= 0;
        _236 = _242;
    }
    bool _244 = _236;
    int _246 = 0;
    if (_234)
    {
        int _248 = _244 ? 0 : 1078530011;
        _246 = _248;
    }
    int _250 = _246;
    bool _252 = !_164;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _168 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _168);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = as_type<int>(_272);
        _238 = _282;
    }
    int _284 = _128;
    float _286 = _238;
    bool _288 = !_164;
    int _290 = _284;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _168 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _290 = as_type<int>(_302);
        _176 = _310;
    }
    int _312 = _290;
    float _314 = _176;
    float _316 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    int _318 = _312;
    if (_234)
    {
        int _320 = int(0x80000000) & as_type<int>(_202);
        int _322 = _250 | _320;
        _318 = _322;
    }
    int _324 = _318;
    bool _326 = !_216;
    bool _328 = _326 && _226;
    int _330 = _324;
    float _332 = as_type<float>(_324);
    if (!_328)
    {
        float _334 = abs(_202);
        bool _336 = _334 != as_type<float>(0x7f800000u /* inf */);
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _344 = _340 || _342;
        float _346 = abs(_204);
        bool _348 = _346 == as_type<float>(0x7f800000u /* inf */);
        float _350 = abs(_204);
        bool _352 = _350 == as_type<float>(0x7f800000u /* inf */);
        bool _354 = !_344;
        bool _356 = _352 && _354;
        if (_356)
        {
            bool _358 = as_type<int>(_204) >= 0;
            _240 = _358 ? (-1) : 0;
        }
        int _360 = _240;
        if (_356)
        {
            _330 = 1075235812;
        }
        int _362 = _330;
        int _364 = _362;
        if (_356)
        {
            int _366 = ~_360;
            int _368 = (_366 != 0) ? _362 : 1061752795;
            _364 = _368;
        }
        int _370 = _364;
        float _372 = as_type<float>(_370);
        if (_356)
        {
            int _374 = int(0x80000000) & as_type<int>(_202);
            int _376 = _370 | _374;
            _372 = as_type<float>(_376);
        }
        float _378 = _372;
        bool _380 = !_344;
        bool _382 = _380 && _348;
        _332 = _378;
        if (!_382)
        {
            float _384 = abs(_202);
            float _386 = abs(_204);
            float _388 = precise::max(_384, _386);
            float _390 = abs(_202);
            float _392 = abs(_204);
            float _394 = precise::min(_390, _392);
            float _396 = 1.0 / _388;
            float _398 = abs(_202);
            float _400 = abs(_204);
            bool _402 = _398 > _400;
            bool _404 = as_type<int>(_204) >= 0;
            float _406 = _394 * _396;
            float _408 = abs(_202);
            float _410 = abs(_204);
            float _412 = _408 + _410;
            float _414 = _406 * _406;
            bool _416 = _412 > as_type<float>(0x7f800000u /* inf */);
            bool _418 = isnan(_412);
            bool _420 = _416 || _418;
            bool _422 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _424 = _420 || _422;
            float _426 = _414 + 11.33538818359375;
            float _428 = fma(_414, _426, 28.84246826171875);
            float _430 = fma(_414, _428, 19.6966705322265625);
            float _432 = fma(_414, -0.82336294651031494140625, -5.674867153167724609375);
            float _434 = fma(_414, _432, -6.565555095672607421875);
            float _436 = 1.0 / _430;
            float _438 = _414 * _434;
            float _440 = _406 * _438;
            float _442 = fma(_440, _436, _406);
            int _444 = as_type<int>(_202) & int(0x80000000);
            float _446 = _442;
            _332 = _412;
            if (_402)
            {
                float _448 = -_442;
                float _450 = _448 + 1.57079637050628662109375;
                _446 = _450;
            }
            float _452 = _446;
            int _454 = as_type<int>(_452);
            if (!_404)
            {
                float _456 = -_452;
                float _458 = _456 + 3.1415927410125732421875;
                _454 = as_type<int>(_458);
            }
            int _460 = _454;
            if (!_424)
            {
                int _462 = _444 | _460;
                _332 = as_type<float>(_462);
            }
        }
    }
    float _464 = _332;
    float _466 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _468 = -_316;
    float _470 = fma(_464, 4.0, _468);
    float _472 = fma(_172, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _474 = fma(_464, 3.0, _316);
    float _476 = fma(_464, 2.0, _466);
    float _478 = in.m_47.x;
    float _480 = in.m_47.y;
    float _482 = in.m_47.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _474 * 0.15915493667125701904296875;
    float _488 = _476 * 0.01745329238474369049072265625;
    float _490 = in.m_49.z;
    float _492 = _484 * 6.283185482025146484375;
    float _494 = cos(_492);
    float _496 = _488 * 0.15915493667125701904296875;
    float _498 = in.m_55.x;
    float _500 = in.m_55.y;
    float _502 = in.m_55.z;
    float _504 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _506 = 1.0 + _504;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _152 * _222;
    float _512 = -_218;
    float _514 = _218 * _512;
    float _516 = in.m_55.w;
    float _518 = fma(_508, 0.5, -0.5);
    float _520 = _486 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = -_510;
    float _526 = _218 * _524;
    float _528 = in.m_42.x;
    float _530 = in.m_42.y;
    float _532 = in.m_42.z;
    float _534 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _536 = _220 * _510;
    float _538 = fma(_518, _152, 1.0);
    float _540 = -_514;
    float _542 = fma(_220, _220, _540);
    float _544 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _546 = _496 * 6.283185482025146484375;
    float _548 = sin(_546);
    float _550 = _494 * 0.07500000298023223876953125;
    float _552 = fma(_314, _478, _534);
    float _554 = _472 * _538;
    float _556 = _542 * _152;
    float _558 = fma(_314, _480, _544);
    float _560 = fma(_522, 0.1500000059604644775390625, _550);
    float _562 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _564 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _568 = fma(_536, _560, _150);
    float _570 = -_526;
    float _572 = fma(_570, _560, _148);
    float _574 = -_556;
    float _576 = fma(_574, _560, _490);
    float _578 = fma(_508, 0.875, 0.125);
    float _580 = fma(_548, 0.25, 0.25);
    float _582 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = fma(_558, _516, _530);
    float _586 = fma(_552, _516, _528);
    float _588 = fma(_536, _580, _568);
    float _590 = -_526;
    float _592 = fma(_590, _580, _572);
    float _594 = -_556;
    float _596 = fma(_594, _580, _576);
    float _598 = fma(_314, _482, _562);
    float _600 = _588 * _554;
    float _602 = _592 * _554;
    float _604 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _612 = _596 * _578;
    float _614 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = _582 * _608;
    float _618 = _604 * _610;
    float _620 = fma(_598, _516, _532);
    float _622 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _626 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _630 = _616 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = _622 * _624;
    float _634 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _638 = _616 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _644 = _636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _646 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[8].x, _638);
    float _648 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _640);
    float _650 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _652 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _646);
    float _656 = _644 + _648;
    float _658 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = _650 + _654;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _656 + _662;
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _670 = _660 + _668;
    float _672 = _664 * _664;
    float _674 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = fma(_670, _670, _672);
    float _678 = _616 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _680 = sqrt(_676);
    float _682 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[9].x, _678);
    float _684 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _682);
    float _686 = _674 + _684;
    bool _688 = _680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _690 = _678;
    float _692 = _656;
    float _694 = _660;
    float _696 = _586;
    float _698 = _686;
    float _700 = _526;
    if (!_688)
    {
        _690 = _656;
    }
    float _702 = _690;
    float _704 = _702;
    if (!_688)
    {
        _692 = _686;
    }
    float _706 = _692;
    bool _708 = !_688;
    float _710 = _706;
    if (!_708)
    {
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _714 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _716 = _680 + _714;
        float _718 = rsqrt(_676);
        float _720 = _716 * _712;
        float _722 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _724 = _720 * 0.15915493667125701904296875;
        float _726 = _724 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _724 * 6.283185482025146484375;
        float _732 = sin(_730);
        float _734 = _728 + (-1.0);
        float _736 = _734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = fma(_732, _722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _740 = fma(_686, _728, _736);
        float _742 = _718 * _738;
        float _744 = fma(_670, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _746 = fma(_664, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _710 = _740;
        _694 = _744;
        _704 = _746;
    }
    float _748 = _710;
    float _750 = _694;
    float _752 = _704;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _748 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _752 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = sqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _760 * _776;
    float _780 = _764 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _764;
    float _798 = _794;
    float _800 = _756;
    if (_790)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _802;
    }
    float _804 = _796;
    if (_790)
    {
        float _806 = rsqrt(_786);
        _696 = _806;
    }
    float _808 = _696;
    float _810 = _808;
    if (_790)
    {
        float _812 = _794 * _804;
        _798 = _812;
    }
    float _814 = _798;
    if (_790)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _698 = _816;
    }
    float _818 = _698;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _822 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _820);
    float _824 = precise::clamp(_822, 0.0, 1.0);
    float _826 = _766;
    if (_790)
    {
        float _828 = _818 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _836 = precise::max(0.0, _834);
    float _838 = _772;
    float _840 = _834;
    if (_790)
    {
        float _842 = _818 * 6.283185482025146484375;
        float _844 = cos(_842);
        _838 = _844;
    }
    float _846 = _838;
    float _848 = -_776;
    float _850 = -_836;
    float _852 = fma(_756, _848, _850);
    float _854 = _852;
    if (!_790)
    {
        _800 = _780;
    }
    float _856 = _800;
    float _858 = _856;
    if (_790)
    {
        float _860 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _860;
    }
    float _862 = _840;
    float _864 = _832;
    float _866 = _862;
    if (_790)
    {
        float _868 = fma(_832, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    float _874 = _846;
    if (_790)
    {
        float _876 = _846 + (-1.0);
        _866 = _876;
    }
    float _878 = _866;
    float _880 = _878;
    if (_790)
    {
        float _882 = _808 * _870;
        _700 = _882;
    }
    float _884 = _700;
    if (!_790)
    {
        _810 = _778;
    }
    float _886 = _810;
    float _888 = _886;
    if (_790)
    {
        float _890 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _890;
    }
    float _892 = _872;
    if (_790)
    {
        float _894 = _778 * _884;
        _888 = _894;
    }
    float _896 = _888;
    if (!_790)
    {
        _880 = _782;
    }
    float _898 = _880;
    float _900 = _898;
    if (_790)
    {
        float _902 = _780 * _884;
        _858 = _902;
    }
    float _904 = _858;
    if (_790)
    {
        float _906 = fma(_852, _846, _892);
        _854 = _906;
    }
    float _908 = _854;
    if (_790)
    {
        float _910 = _896 * _896;
        _900 = _910;
    }
    float _912 = _900;
    if (!_790)
    {
        _874 = _784;
    }
    float _914 = _874;
    float _916 = _914;
    if (_790)
    {
        float _918 = _904 * _904;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_908, _908, _912);
    float _926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _928 = -_824;
    float _930 = _928 + 1.0;
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _934 = _924 + _920;
    float _936 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _938 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _932);
    float _942 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _936);
    float _946 = rsqrt(_934);
    float _948 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _952 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _944);
    float _954 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _956 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = abs(_930);
    float _964 = log2(_962);
    float _966 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _954);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _972 = -_958;
    float _974 = fma(_972, _926, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].x, _970);
    float _980 = _946 * _896;
    float _982 = _946 * _908;
    float _984 = _946 * _904;
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].z, _978);
    float _988 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = log2(_974);
    float _992 = -_988;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _992);
    float _996 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _986);
    float _1000 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1002 = -_984;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[21].z, _994);
    float _1006 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1008 = 1.0 / _998;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1000);
    float _1012 = fma(_1004, -0.5, 0.5);
    float _1014 = fma(_1004, 0.5, 0.5);
    float _1016 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1006);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1010);
    float _1020 = _982 + 1.0;
    float _1022 = fma(_1014, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1024 = exp2(_996);
    float _1026 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1016);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1018);
    float _1030 = fma(_1014, _1022, -0.212114393711090087890625);
    float _1032 = _990 * 0.693147182464599609375;
    float _1034 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1026);
    float _1036 = fma(_1014, _1030, 1.570728778839111328125);
    float _1038 = sqrt(_1012);
    float _1040 = _1034 * _1008;
    float _1042 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1044 = fma(_1040, -0.5, 0.5);
    float _1046 = -_982;
    float _1048 = fma(_1024, _1020, _1046);
    float _1050 = _1028 * _1008;
    float _1052 = fma(_1048, 0.5, 0.5);
    float _1054 = fma(_1050, 0.5, 0.5);
    float _1056 = _1038 * 0.636619746685028076171875;
    float3 _2823 = float3(_1054, _1044, _1042);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2823, float3(0.0), isnan(_2823)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2823, float3(0.0), isnan(_2823)), level(0.0)).x;
    float3 _2834 = float3(_1054, _1044, _1042);
    float4 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2834, float3(0.0), isnan(_2834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2834, float3(0.0), isnan(_2834)), level(0.0)).xyzw;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = _1061.w;
    float _1071 = -_1036;
    float _1073 = fma(_1056, _1071, 1.0);
    float2 _2856 = float2(_1073, _1052);
    float3 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2856, float2(0.0), isnan(_2856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2856, float2(0.0), isnan(_2856)), level(0.0)).xyz;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = in.m_57.x;
    float _1087 = in.m_57.y;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1093 = _1091 != 0;
    float _1095 = in.m_51.x;
    float _1097 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1099 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1099);
    out.m_59.y = _152;
    float _1113 = _1008;
    if (_1093)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1123 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1107);
    float _1125 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = 0.0;
    float _1129 = _1085;
    if (_1093)
    {
        _1127 = _1095;
    }
    float _1131 = _1127;
    float _1133 = _1131;
    if (!_1093)
    {
        _1129 = _1095;
    }
    float _1135 = _1129;
    float _1137 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1139 = exp2(_1097);
    bool _1141 = _1117 > 0.5;
    bool _1143 = _1141 && _1093;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1147 = -_1145;
    float _1149 = fma(_1121, 2.0, _1147);
    float _1151 = -_152;
    float _1153 = _1151 + 1.0;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1157 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1159 = -_126;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1149);
    float _1163 = -_1139;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1157, -2.0, _1155);
    float _1169 = _1135;
    if (_1143)
    {
        float _1171 = -_1131;
        float _1173 = _1171 + 1.0;
        _1133 = _1173;
    }
    float _1175 = _1133;
    bool _1177 = _1087 > 0.5;
    float _1179 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1123);
    float _1183 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    int _1185 = _1177 ? as_type<int>(_1153) : as_type<int>(_152);
    float _1187 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1093)
    {
        _1169 = _1175;
    }
    float _1189 = _1169;
    float _1191 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1137);
    float _1193 = _1103 ? as_type<float>(_1185) : _152;
    float _1195 = in.m_61.w;
    float _1197 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_1187, _1189, -0.5);
    float _1201 = fma(_1193, _1179, -0.5);
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    float _1205 = fma(_1181, _1199, _1161);
    float _1207 = -_1183;
    float _1209 = fma(_1191, _1201, _1207);
    float _1211 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1203);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = _1209 + 0.5;
    float _1217 = _1205 + 0.5;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1221 = _1211 + _998;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1221 * 0.5;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1223;
    out.m_63.y = _1225;
    out.m_63.z = _1125;
    float _1235 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1217;
    out.m_65.y = _1215;
    out.m_67.x = _1235;
    out.m_67.y = _1237;
    out.m_67.z = _1239;
    float _1241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _1195;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1034;
    out.gl_Position.z = _1211;
    out.gl_Position.w = _998;
    out.m_71.z = _1227;
    out.m_71.w = _998;
    out.m_45.x = _1241;
    float _1243 = _1197 * _1058;
    float _1245 = -_1197;
    float _1247 = _1245 + 1.0;
    float _1249 = _1069 * _1243;
    float _1251 = _1083 * _1243;
    float _1253 = fma(_1079, _1249, _1063);
    float _1255 = fma(_1081, _1249, _1065);
    float _1257 = _1069 * _1247;
    float _1259 = fma(_1069, _1251, _1067);
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1259;
    out.m_73.w = _1257;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1316 = as_type<float>(_110);
        out.gl_Position.z = _1316;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _128 = 0;
    if (_122)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_146);
        out.gl_Position.z = _1384;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154 * 0.15915493667125701904296875;
    float _168 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = 0.0;
    float _176 = _168;
    if (!_164)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = abs(_148);
    float _186 = abs(_150);
    float _188 = precise::max(_184, _186);
    float _190 = _150 * 0.0625;
    float _192 = _182;
    if (!_164)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = _188 >= 16.0;
    float _200 = _148 * 0.0625;
    float _202 = _198 ? _190 : _150;
    float _204 = _198 ? _200 : _148;
    float _206 = abs(_202);
    bool _208 = _206 != 0.0;
    bool _210 = isnan(_206);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = in.m_53.x;
    float _220 = in.m_53.y;
    float _222 = in.m_53.z;
    float _224 = abs(_204);
    bool _226 = _224 == 0.0;
    float _228 = abs(_204);
    bool _230 = _228 == 0.0;
    bool _232 = !_216;
    bool _234 = _230 && _232;
    bool _236 = false;
    float _238 = _196;
    int _240 = _216 ? (-1) : 0;
    if (_234)
    {
        bool _242 = as_type<int>(_204) >= 0;
        _236 = _242;
    }
    bool _244 = _236;
    int _246 = 0;
    if (_234)
    {
        int _248 = _244 ? 0 : 1078530011;
        _246 = _248;
    }
    int _250 = _246;
    bool _252 = !_164;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _168 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _168);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = as_type<int>(_272);
        _238 = _282;
    }
    int _284 = _128;
    float _286 = _238;
    bool _288 = !_164;
    int _290 = _284;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _168 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _290 = as_type<int>(_302);
        _176 = _310;
    }
    int _312 = _290;
    float _314 = _176;
    float _316 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    int _318 = _312;
    if (_234)
    {
        int _320 = int(0x80000000) & as_type<int>(_202);
        int _322 = _250 | _320;
        _318 = _322;
    }
    int _324 = _318;
    bool _326 = !_216;
    bool _328 = _326 && _226;
    int _330 = _324;
    float _332 = as_type<float>(_324);
    if (!_328)
    {
        float _334 = abs(_202);
        bool _336 = _334 != as_type<float>(0x7f800000u /* inf */);
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _344 = _340 || _342;
        float _346 = abs(_204);
        bool _348 = _346 == as_type<float>(0x7f800000u /* inf */);
        float _350 = abs(_204);
        bool _352 = _350 == as_type<float>(0x7f800000u /* inf */);
        bool _354 = !_344;
        bool _356 = _352 && _354;
        if (_356)
        {
            bool _358 = as_type<int>(_204) >= 0;
            _240 = _358 ? (-1) : 0;
        }
        int _360 = _240;
        if (_356)
        {
            _330 = 1075235812;
        }
        int _362 = _330;
        int _364 = _362;
        if (_356)
        {
            int _366 = ~_360;
            int _368 = (_366 != 0) ? _362 : 1061752795;
            _364 = _368;
        }
        int _370 = _364;
        float _372 = as_type<float>(_370);
        if (_356)
        {
            int _374 = int(0x80000000) & as_type<int>(_202);
            int _376 = _370 | _374;
            _372 = as_type<float>(_376);
        }
        float _378 = _372;
        bool _380 = !_344;
        bool _382 = _380 && _348;
        _332 = _378;
        if (!_382)
        {
            float _384 = abs(_202);
            float _386 = abs(_204);
            float _388 = precise::max(_384, _386);
            float _390 = abs(_202);
            float _392 = abs(_204);
            float _394 = precise::min(_390, _392);
            float _396 = 1.0 / _388;
            float _398 = abs(_202);
            float _400 = abs(_204);
            bool _402 = _398 > _400;
            bool _404 = as_type<int>(_204) >= 0;
            float _406 = _394 * _396;
            float _408 = abs(_202);
            float _410 = abs(_204);
            float _412 = _408 + _410;
            float _414 = _406 * _406;
            bool _416 = _412 > as_type<float>(0x7f800000u /* inf */);
            bool _418 = isnan(_412);
            bool _420 = _416 || _418;
            bool _422 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _424 = _420 || _422;
            float _426 = _414 + 11.33538818359375;
            float _428 = fma(_414, _426, 28.84246826171875);
            float _430 = fma(_414, _428, 19.6966705322265625);
            float _432 = fma(_414, -0.82336294651031494140625, -5.674867153167724609375);
            float _434 = fma(_414, _432, -6.565555095672607421875);
            float _436 = 1.0 / _430;
            float _438 = _414 * _434;
            float _440 = _406 * _438;
            float _442 = fma(_440, _436, _406);
            int _444 = as_type<int>(_202) & int(0x80000000);
            float _446 = _442;
            _332 = _412;
            if (_402)
            {
                float _448 = -_442;
                float _450 = _448 + 1.57079637050628662109375;
                _446 = _450;
            }
            float _452 = _446;
            int _454 = as_type<int>(_452);
            if (!_404)
            {
                float _456 = -_452;
                float _458 = _456 + 3.1415927410125732421875;
                _454 = as_type<int>(_458);
            }
            int _460 = _454;
            if (!_424)
            {
                int _462 = _444 | _460;
                _332 = as_type<float>(_462);
            }
        }
    }
    float _464 = _332;
    float _466 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _468 = -_316;
    float _470 = fma(_464, 4.0, _468);
    float _472 = fma(_172, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _474 = fma(_464, 3.0, _316);
    float _476 = fma(_464, 2.0, _466);
    float _478 = in.m_47.x;
    float _480 = in.m_47.y;
    float _482 = in.m_47.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _474 * 0.15915493667125701904296875;
    float _488 = _476 * 0.01745329238474369049072265625;
    float _490 = in.m_49.z;
    float _492 = _484 * 6.283185482025146484375;
    float _494 = cos(_492);
    float _496 = _488 * 0.15915493667125701904296875;
    float _498 = in.m_55.x;
    float _500 = in.m_55.y;
    float _502 = in.m_55.z;
    float _504 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _506 = 1.0 + _504;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _152 * _222;
    float _512 = -_218;
    float _514 = _218 * _512;
    float _516 = in.m_55.w;
    float _518 = fma(_508, 0.5, -0.5);
    float _520 = _486 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = -_510;
    float _526 = _218 * _524;
    float _528 = in.m_42.x;
    float _530 = in.m_42.y;
    float _532 = in.m_42.z;
    float _534 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _536 = _220 * _510;
    float _538 = fma(_518, _152, 1.0);
    float _540 = -_514;
    float _542 = fma(_220, _220, _540);
    float _544 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _546 = _496 * 6.283185482025146484375;
    float _548 = sin(_546);
    float _550 = _494 * 0.07500000298023223876953125;
    float _552 = fma(_314, _478, _534);
    float _554 = _472 * _538;
    float _556 = _542 * _152;
    float _558 = fma(_314, _480, _544);
    float _560 = fma(_522, 0.1500000059604644775390625, _550);
    float _562 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _564 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _568 = fma(_536, _560, _150);
    float _570 = -_526;
    float _572 = fma(_570, _560, _148);
    float _574 = -_556;
    float _576 = fma(_574, _560, _490);
    float _578 = fma(_508, 0.875, 0.125);
    float _580 = fma(_548, 0.25, 0.25);
    float _582 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = fma(_558, _516, _530);
    float _586 = fma(_552, _516, _528);
    float _588 = fma(_536, _580, _568);
    float _590 = -_526;
    float _592 = fma(_590, _580, _572);
    float _594 = -_556;
    float _596 = fma(_594, _580, _576);
    float _598 = fma(_314, _482, _562);
    float _600 = _588 * _554;
    float _602 = _592 * _554;
    float _604 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _612 = _596 * _578;
    float _614 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = _582 * _608;
    float _618 = _604 * _610;
    float _620 = fma(_598, _516, _532);
    float _622 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _626 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _630 = _616 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = _622 * _624;
    float _634 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _638 = _616 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _644 = _636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _646 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[8].x, _638);
    float _648 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _640);
    float _650 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _652 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _646);
    float _656 = _644 + _648;
    float _658 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = _650 + _654;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _656 + _662;
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _670 = _660 + _668;
    float _672 = _664 * _664;
    float _674 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = fma(_670, _670, _672);
    float _678 = _616 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _680 = sqrt(_676);
    float _682 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[9].x, _678);
    float _684 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _682);
    float _686 = _674 + _684;
    bool _688 = _680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _690 = _678;
    float _692 = _656;
    float _694 = _660;
    float _696 = _586;
    float _698 = _686;
    float _700 = _526;
    if (!_688)
    {
        _690 = _656;
    }
    float _702 = _690;
    float _704 = _702;
    if (!_688)
    {
        _692 = _686;
    }
    float _706 = _692;
    bool _708 = !_688;
    float _710 = _706;
    if (!_708)
    {
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _714 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _716 = _680 + _714;
        float _718 = rsqrt(_676);
        float _720 = _716 * _712;
        float _722 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _724 = _720 * 0.15915493667125701904296875;
        float _726 = _724 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _724 * 6.283185482025146484375;
        float _732 = sin(_730);
        float _734 = _728 + (-1.0);
        float _736 = _734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = fma(_732, _722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _740 = fma(_686, _728, _736);
        float _742 = _718 * _738;
        float _744 = fma(_670, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _746 = fma(_664, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _710 = _740;
        _694 = _744;
        _704 = _746;
    }
    float _748 = _710;
    float _750 = _694;
    float _752 = _704;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _748 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _752 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = sqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _760 * _776;
    float _780 = _764 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _764;
    float _798 = _794;
    float _800 = _756;
    if (_790)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _802;
    }
    float _804 = _796;
    if (_790)
    {
        float _806 = rsqrt(_786);
        _696 = _806;
    }
    float _808 = _696;
    float _810 = _808;
    if (_790)
    {
        float _812 = _794 * _804;
        _798 = _812;
    }
    float _814 = _798;
    if (_790)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _698 = _816;
    }
    float _818 = _698;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _822 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _820);
    float _824 = precise::clamp(_822, 0.0, 1.0);
    float _826 = _766;
    if (_790)
    {
        float _828 = _818 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _836 = precise::max(0.0, _834);
    float _838 = _772;
    float _840 = _834;
    if (_790)
    {
        float _842 = _818 * 6.283185482025146484375;
        float _844 = cos(_842);
        _838 = _844;
    }
    float _846 = _838;
    float _848 = -_776;
    float _850 = -_836;
    float _852 = fma(_756, _848, _850);
    float _854 = _852;
    if (!_790)
    {
        _800 = _780;
    }
    float _856 = _800;
    float _858 = _856;
    if (_790)
    {
        float _860 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _860;
    }
    float _862 = _840;
    float _864 = _832;
    float _866 = _862;
    if (_790)
    {
        float _868 = fma(_832, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    float _874 = _846;
    if (_790)
    {
        float _876 = _846 + (-1.0);
        _866 = _876;
    }
    float _878 = _866;
    float _880 = _878;
    if (_790)
    {
        float _882 = _808 * _870;
        _700 = _882;
    }
    float _884 = _700;
    if (!_790)
    {
        _810 = _778;
    }
    float _886 = _810;
    float _888 = _886;
    if (_790)
    {
        float _890 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _890;
    }
    float _892 = _872;
    if (_790)
    {
        float _894 = _778 * _884;
        _888 = _894;
    }
    float _896 = _888;
    if (!_790)
    {
        _880 = _782;
    }
    float _898 = _880;
    float _900 = _898;
    if (_790)
    {
        float _902 = _780 * _884;
        _858 = _902;
    }
    float _904 = _858;
    if (_790)
    {
        float _906 = fma(_852, _846, _892);
        _854 = _906;
    }
    float _908 = _854;
    if (_790)
    {
        float _910 = _896 * _896;
        _900 = _910;
    }
    float _912 = _900;
    if (!_790)
    {
        _874 = _784;
    }
    float _914 = _874;
    float _916 = _914;
    if (_790)
    {
        float _918 = _904 * _904;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_908, _908, _912);
    float _926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _928 = -_824;
    float _930 = _928 + 1.0;
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _934 = _924 + _920;
    float _936 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _938 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _932);
    float _942 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _936);
    float _946 = rsqrt(_934);
    float _948 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _952 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _944);
    float _954 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _956 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = abs(_930);
    float _964 = log2(_962);
    float _966 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _954);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _972 = -_958;
    float _974 = fma(_972, _926, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].x, _970);
    float _980 = _946 * _896;
    float _982 = _946 * _908;
    float _984 = _946 * _904;
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].z, _978);
    float _988 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = log2(_974);
    float _992 = -_988;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _992);
    float _996 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _986);
    float _1000 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1002 = -_984;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[21].z, _994);
    float _1006 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1008 = 1.0 / _998;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1000);
    float _1012 = fma(_1004, -0.5, 0.5);
    float _1014 = fma(_1004, 0.5, 0.5);
    float _1016 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1006);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1010);
    float _1020 = _982 + 1.0;
    float _1022 = fma(_1014, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1024 = exp2(_996);
    float _1026 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1016);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1018);
    float _1030 = fma(_1014, _1022, -0.212114393711090087890625);
    float _1032 = _990 * 0.693147182464599609375;
    float _1034 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1026);
    float _1036 = fma(_1014, _1030, 1.570728778839111328125);
    float _1038 = sqrt(_1012);
    float _1040 = _1034 * _1008;
    float _1042 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1044 = fma(_1040, -0.5, 0.5);
    float _1046 = -_982;
    float _1048 = fma(_1024, _1020, _1046);
    float _1050 = _1028 * _1008;
    float _1052 = fma(_1048, 0.5, 0.5);
    float _1054 = fma(_1050, 0.5, 0.5);
    float _1056 = _1038 * 0.636619746685028076171875;
    float3 _2823 = float3(_1054, _1044, _1042);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2823, float3(0.0), isnan(_2823)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2823, float3(0.0), isnan(_2823)), level(0.0)).x;
    float3 _2834 = float3(_1054, _1044, _1042);
    float4 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2834, float3(0.0), isnan(_2834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2834, float3(0.0), isnan(_2834)), level(0.0)).xyzw;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = _1061.w;
    float _1071 = -_1036;
    float _1073 = fma(_1056, _1071, 1.0);
    float2 _2856 = float2(_1073, _1052);
    float3 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2856, float2(0.0), isnan(_2856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2856, float2(0.0), isnan(_2856)), level(0.0)).xyz;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = in.m_57.x;
    float _1087 = in.m_57.y;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1093 = _1091 != 0;
    float _1095 = in.m_51.x;
    float _1097 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1099 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1099);
    out.m_59.y = _152;
    float _1113 = _1008;
    if (_1093)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1123 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1107);
    float _1125 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = 0.0;
    float _1129 = _1085;
    if (_1093)
    {
        _1127 = _1095;
    }
    float _1131 = _1127;
    float _1133 = _1131;
    if (!_1093)
    {
        _1129 = _1095;
    }
    float _1135 = _1129;
    float _1137 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1139 = exp2(_1097);
    bool _1141 = _1117 > 0.5;
    bool _1143 = _1141 && _1093;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1147 = -_1145;
    float _1149 = fma(_1121, 2.0, _1147);
    float _1151 = -_152;
    float _1153 = _1151 + 1.0;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1157 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1159 = -_126;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1149);
    float _1163 = -_1139;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1157, -2.0, _1155);
    float _1169 = _1135;
    if (_1143)
    {
        float _1171 = -_1131;
        float _1173 = _1171 + 1.0;
        _1133 = _1173;
    }
    float _1175 = _1133;
    bool _1177 = _1087 > 0.5;
    float _1179 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1123);
    float _1183 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    int _1185 = _1177 ? as_type<int>(_1153) : as_type<int>(_152);
    float _1187 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1093)
    {
        _1169 = _1175;
    }
    float _1189 = _1169;
    float _1191 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1137);
    float _1193 = _1103 ? as_type<float>(_1185) : _152;
    float _1195 = in.m_61.w;
    float _1197 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_1187, _1189, -0.5);
    float _1201 = fma(_1193, _1179, -0.5);
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    float _1205 = fma(_1181, _1199, _1161);
    float _1207 = -_1183;
    float _1209 = fma(_1191, _1201, _1207);
    float _1211 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1203);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = _1209 + 0.5;
    float _1217 = _1205 + 0.5;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1221 = _1211 + _998;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1221 * 0.5;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1223;
    out.m_63.y = _1225;
    out.m_63.z = _1125;
    float _1235 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1217;
    out.m_65.y = _1215;
    out.m_67.x = _1235;
    out.m_67.y = _1237;
    out.m_67.z = _1239;
    float _1241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _1195;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1034;
    out.gl_Position.z = _1211;
    out.gl_Position.w = _998;
    out.m_71.z = _1227;
    out.m_71.w = _998;
    out.m_45.x = _1241;
    float _1243 = _1197 * _1058;
    float _1245 = -_1197;
    float _1247 = _1245 + 1.0;
    float _1249 = _1069 * _1243;
    float _1251 = _1083 * _1243;
    float _1253 = fma(_1079, _1249, _1063);
    float _1255 = fma(_1081, _1249, _1065);
    float _1257 = _1069 * _1247;
    float _1259 = fma(_1069, _1251, _1067);
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1259;
    out.m_73.w = _1257;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1316 = as_type<float>(_110);
        out.gl_Position.z = _1316;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _128 = 0;
    if (_122)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_146);
        out.gl_Position.z = _1384;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_51.y;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154 * 0.15915493667125701904296875;
    float _168 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = 0.0;
    float _176 = _168;
    if (!_164)
    {
        float _178 = _168 * _168;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = abs(_148);
    float _186 = abs(_150);
    float _188 = precise::max(_184, _186);
    float _190 = _150 * 0.0625;
    float _192 = _182;
    if (!_164)
    {
        float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = _188 >= 16.0;
    float _200 = _148 * 0.0625;
    float _202 = _198 ? _190 : _150;
    float _204 = _198 ? _200 : _148;
    float _206 = abs(_202);
    bool _208 = _206 != 0.0;
    bool _210 = isnan(_206);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = in.m_53.x;
    float _220 = in.m_53.y;
    float _222 = in.m_53.z;
    float _224 = abs(_204);
    bool _226 = _224 == 0.0;
    float _228 = abs(_204);
    bool _230 = _228 == 0.0;
    bool _232 = !_216;
    bool _234 = _230 && _232;
    bool _236 = false;
    float _238 = _196;
    int _240 = _216 ? (-1) : 0;
    if (_234)
    {
        bool _242 = as_type<int>(_204) >= 0;
        _236 = _242;
    }
    bool _244 = _236;
    int _246 = 0;
    if (_234)
    {
        int _248 = _244 ? 0 : 1078530011;
        _246 = _248;
    }
    int _250 = _246;
    bool _252 = !_164;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _168 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _168);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _128 = as_type<int>(_272);
        _238 = _282;
    }
    int _284 = _128;
    float _286 = _238;
    bool _288 = !_164;
    int _290 = _284;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _168 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _290 = as_type<int>(_302);
        _176 = _310;
    }
    int _312 = _290;
    float _314 = _176;
    float _316 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    int _318 = _312;
    if (_234)
    {
        int _320 = int(0x80000000) & as_type<int>(_202);
        int _322 = _250 | _320;
        _318 = _322;
    }
    int _324 = _318;
    bool _326 = !_216;
    bool _328 = _326 && _226;
    int _330 = _324;
    float _332 = as_type<float>(_324);
    if (!_328)
    {
        float _334 = abs(_202);
        bool _336 = _334 != as_type<float>(0x7f800000u /* inf */);
        bool _338 = isnan(_334);
        bool _340 = _336 || _338;
        bool _342 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _344 = _340 || _342;
        float _346 = abs(_204);
        bool _348 = _346 == as_type<float>(0x7f800000u /* inf */);
        float _350 = abs(_204);
        bool _352 = _350 == as_type<float>(0x7f800000u /* inf */);
        bool _354 = !_344;
        bool _356 = _352 && _354;
        if (_356)
        {
            bool _358 = as_type<int>(_204) >= 0;
            _240 = _358 ? (-1) : 0;
        }
        int _360 = _240;
        if (_356)
        {
            _330 = 1075235812;
        }
        int _362 = _330;
        int _364 = _362;
        if (_356)
        {
            int _366 = ~_360;
            int _368 = (_366 != 0) ? _362 : 1061752795;
            _364 = _368;
        }
        int _370 = _364;
        float _372 = as_type<float>(_370);
        if (_356)
        {
            int _374 = int(0x80000000) & as_type<int>(_202);
            int _376 = _370 | _374;
            _372 = as_type<float>(_376);
        }
        float _378 = _372;
        bool _380 = !_344;
        bool _382 = _380 && _348;
        _332 = _378;
        if (!_382)
        {
            float _384 = abs(_202);
            float _386 = abs(_204);
            float _388 = precise::max(_384, _386);
            float _390 = abs(_202);
            float _392 = abs(_204);
            float _394 = precise::min(_390, _392);
            float _396 = 1.0 / _388;
            float _398 = abs(_202);
            float _400 = abs(_204);
            bool _402 = _398 > _400;
            bool _404 = as_type<int>(_204) >= 0;
            float _406 = _394 * _396;
            float _408 = abs(_202);
            float _410 = abs(_204);
            float _412 = _408 + _410;
            float _414 = _406 * _406;
            bool _416 = _412 > as_type<float>(0x7f800000u /* inf */);
            bool _418 = isnan(_412);
            bool _420 = _416 || _418;
            bool _422 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _424 = _420 || _422;
            float _426 = _414 + 11.33538818359375;
            float _428 = fma(_414, _426, 28.84246826171875);
            float _430 = fma(_414, _428, 19.6966705322265625);
            float _432 = fma(_414, -0.82336294651031494140625, -5.674867153167724609375);
            float _434 = fma(_414, _432, -6.565555095672607421875);
            float _436 = 1.0 / _430;
            float _438 = _414 * _434;
            float _440 = _406 * _438;
            float _442 = fma(_440, _436, _406);
            int _444 = as_type<int>(_202) & int(0x80000000);
            float _446 = _442;
            _332 = _412;
            if (_402)
            {
                float _448 = -_442;
                float _450 = _448 + 1.57079637050628662109375;
                _446 = _450;
            }
            float _452 = _446;
            int _454 = as_type<int>(_452);
            if (!_404)
            {
                float _456 = -_452;
                float _458 = _456 + 3.1415927410125732421875;
                _454 = as_type<int>(_458);
            }
            int _460 = _454;
            if (!_424)
            {
                int _462 = _444 | _460;
                _332 = as_type<float>(_462);
            }
        }
    }
    float _464 = _332;
    float _466 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _468 = -_316;
    float _470 = fma(_464, 4.0, _468);
    float _472 = fma(_172, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _474 = fma(_464, 3.0, _316);
    float _476 = fma(_464, 2.0, _466);
    float _478 = in.m_47.x;
    float _480 = in.m_47.y;
    float _482 = in.m_47.z;
    float _484 = _470 * 0.15915493667125701904296875;
    float _486 = _474 * 0.15915493667125701904296875;
    float _488 = _476 * 0.01745329238474369049072265625;
    float _490 = in.m_49.z;
    float _492 = _484 * 6.283185482025146484375;
    float _494 = cos(_492);
    float _496 = _488 * 0.15915493667125701904296875;
    float _498 = in.m_55.x;
    float _500 = in.m_55.y;
    float _502 = in.m_55.z;
    float _504 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _506 = 1.0 + _504;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _152 * _222;
    float _512 = -_218;
    float _514 = _218 * _512;
    float _516 = in.m_55.w;
    float _518 = fma(_508, 0.5, -0.5);
    float _520 = _486 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = -_510;
    float _526 = _218 * _524;
    float _528 = in.m_42.x;
    float _530 = in.m_42.y;
    float _532 = in.m_42.z;
    float _534 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _536 = _220 * _510;
    float _538 = fma(_518, _152, 1.0);
    float _540 = -_514;
    float _542 = fma(_220, _220, _540);
    float _544 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _546 = _496 * 6.283185482025146484375;
    float _548 = sin(_546);
    float _550 = _494 * 0.07500000298023223876953125;
    float _552 = fma(_314, _478, _534);
    float _554 = _472 * _538;
    float _556 = _542 * _152;
    float _558 = fma(_314, _480, _544);
    float _560 = fma(_522, 0.1500000059604644775390625, _550);
    float _562 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _564 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _568 = fma(_536, _560, _150);
    float _570 = -_526;
    float _572 = fma(_570, _560, _148);
    float _574 = -_556;
    float _576 = fma(_574, _560, _490);
    float _578 = fma(_508, 0.875, 0.125);
    float _580 = fma(_548, 0.25, 0.25);
    float _582 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = fma(_558, _516, _530);
    float _586 = fma(_552, _516, _528);
    float _588 = fma(_536, _580, _568);
    float _590 = -_526;
    float _592 = fma(_590, _580, _572);
    float _594 = -_556;
    float _596 = fma(_594, _580, _576);
    float _598 = fma(_314, _482, _562);
    float _600 = _588 * _554;
    float _602 = _592 * _554;
    float _604 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _600);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _612 = _596 * _578;
    float _614 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = _582 * _608;
    float _618 = _604 * _610;
    float _620 = fma(_598, _516, _532);
    float _622 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _626 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _630 = _616 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _632 = _622 * _624;
    float _634 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _638 = _616 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _640 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[10].x, _630);
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _644 = _636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _646 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[8].x, _638);
    float _648 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _640);
    float _650 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _652 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _646);
    float _656 = _644 + _648;
    float _658 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = _650 + _654;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _656 + _662;
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _670 = _660 + _668;
    float _672 = _664 * _664;
    float _674 = _666 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = fma(_670, _670, _672);
    float _678 = _616 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _680 = sqrt(_676);
    float _682 = fma(_618, (*spvDescriptorSet0.vp_c10)._m0[9].x, _678);
    float _684 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _682);
    float _686 = _674 + _684;
    bool _688 = _680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _690 = _678;
    float _692 = _656;
    float _694 = _660;
    float _696 = _586;
    float _698 = _686;
    float _700 = _526;
    if (!_688)
    {
        _690 = _656;
    }
    float _702 = _690;
    float _704 = _702;
    if (!_688)
    {
        _692 = _686;
    }
    float _706 = _692;
    bool _708 = !_688;
    float _710 = _706;
    if (!_708)
    {
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _714 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _716 = _680 + _714;
        float _718 = rsqrt(_676);
        float _720 = _716 * _712;
        float _722 = _686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _724 = _720 * 0.15915493667125701904296875;
        float _726 = _724 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _724 * 6.283185482025146484375;
        float _732 = sin(_730);
        float _734 = _728 + (-1.0);
        float _736 = _734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = fma(_732, _722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _740 = fma(_686, _728, _736);
        float _742 = _718 * _738;
        float _744 = fma(_670, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _746 = fma(_664, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _710 = _740;
        _694 = _744;
        _704 = _746;
    }
    float _748 = _710;
    float _750 = _694;
    float _752 = _704;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _748 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _752 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = sqrt(_770);
    float _776 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _760 * _776;
    float _780 = _764 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _764;
    float _798 = _794;
    float _800 = _756;
    if (_790)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _802;
    }
    float _804 = _796;
    if (_790)
    {
        float _806 = rsqrt(_786);
        _696 = _806;
    }
    float _808 = _696;
    float _810 = _808;
    if (_790)
    {
        float _812 = _794 * _804;
        _798 = _812;
    }
    float _814 = _798;
    if (_790)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _698 = _816;
    }
    float _818 = _698;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _822 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _820);
    float _824 = precise::clamp(_822, 0.0, 1.0);
    float _826 = _766;
    if (_790)
    {
        float _828 = _818 * 6.283185482025146484375;
        float _830 = sin(_828);
        _826 = _830;
    }
    float _832 = _826;
    float _834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _836 = precise::max(0.0, _834);
    float _838 = _772;
    float _840 = _834;
    if (_790)
    {
        float _842 = _818 * 6.283185482025146484375;
        float _844 = cos(_842);
        _838 = _844;
    }
    float _846 = _838;
    float _848 = -_776;
    float _850 = -_836;
    float _852 = fma(_756, _848, _850);
    float _854 = _852;
    if (!_790)
    {
        _800 = _780;
    }
    float _856 = _800;
    float _858 = _856;
    if (_790)
    {
        float _860 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _840 = _860;
    }
    float _862 = _840;
    float _864 = _832;
    float _866 = _862;
    if (_790)
    {
        float _868 = fma(_832, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    float _874 = _846;
    if (_790)
    {
        float _876 = _846 + (-1.0);
        _866 = _876;
    }
    float _878 = _866;
    float _880 = _878;
    if (_790)
    {
        float _882 = _808 * _870;
        _700 = _882;
    }
    float _884 = _700;
    if (!_790)
    {
        _810 = _778;
    }
    float _886 = _810;
    float _888 = _886;
    if (_790)
    {
        float _890 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _890;
    }
    float _892 = _872;
    if (_790)
    {
        float _894 = _778 * _884;
        _888 = _894;
    }
    float _896 = _888;
    if (!_790)
    {
        _880 = _782;
    }
    float _898 = _880;
    float _900 = _898;
    if (_790)
    {
        float _902 = _780 * _884;
        _858 = _902;
    }
    float _904 = _858;
    if (_790)
    {
        float _906 = fma(_852, _846, _892);
        _854 = _906;
    }
    float _908 = _854;
    if (_790)
    {
        float _910 = _896 * _896;
        _900 = _910;
    }
    float _912 = _900;
    if (!_790)
    {
        _874 = _784;
    }
    float _914 = _874;
    float _916 = _914;
    if (_790)
    {
        float _918 = _904 * _904;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_908, _908, _912);
    float _926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _928 = -_824;
    float _930 = _928 + 1.0;
    float _932 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _934 = _924 + _920;
    float _936 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _938 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _940 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _932);
    float _942 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _944 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _936);
    float _946 = rsqrt(_934);
    float _948 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _938);
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _952 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _944);
    float _954 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _942);
    float _956 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _960 = _952 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = abs(_930);
    float _964 = log2(_962);
    float _966 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _954);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _970 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _972 = -_958;
    float _974 = fma(_972, _926, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].x, _970);
    float _980 = _946 * _896;
    float _982 = _946 * _908;
    float _984 = _946 * _904;
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].z, _978);
    float _988 = _980 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = log2(_974);
    float _992 = -_988;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _992);
    float _996 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _998 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _986);
    float _1000 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1002 = -_984;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c15)._m0[21].z, _994);
    float _1006 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1008 = 1.0 / _998;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1000);
    float _1012 = fma(_1004, -0.5, 0.5);
    float _1014 = fma(_1004, 0.5, 0.5);
    float _1016 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1006);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1010);
    float _1020 = _982 + 1.0;
    float _1022 = fma(_1014, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1024 = exp2(_996);
    float _1026 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1016);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1018);
    float _1030 = fma(_1014, _1022, -0.212114393711090087890625);
    float _1032 = _990 * 0.693147182464599609375;
    float _1034 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1026);
    float _1036 = fma(_1014, _1030, 1.570728778839111328125);
    float _1038 = sqrt(_1012);
    float _1040 = _1034 * _1008;
    float _1042 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1044 = fma(_1040, -0.5, 0.5);
    float _1046 = -_982;
    float _1048 = fma(_1024, _1020, _1046);
    float _1050 = _1028 * _1008;
    float _1052 = fma(_1048, 0.5, 0.5);
    float _1054 = fma(_1050, 0.5, 0.5);
    float _1056 = _1038 * 0.636619746685028076171875;
    float3 _2823 = float3(_1054, _1044, _1042);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2823, float3(0.0), isnan(_2823)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2823, float3(0.0), isnan(_2823)), level(0.0)).x;
    float3 _2834 = float3(_1054, _1044, _1042);
    float4 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2834, float3(0.0), isnan(_2834)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2834, float3(0.0), isnan(_2834)), level(0.0)).xyzw;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = _1061.w;
    float _1071 = -_1036;
    float _1073 = fma(_1056, _1071, 1.0);
    float2 _2856 = float2(_1073, _1052);
    float3 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2856, float2(0.0), isnan(_2856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2856, float2(0.0), isnan(_2856)), level(0.0)).xyz;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = in.m_57.x;
    float _1087 = in.m_57.y;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1093 = _1091 != 0;
    float _1095 = in.m_51.x;
    float _1097 = _964 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1099 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1103 = _1101 != 0;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1099);
    out.m_59.y = _152;
    float _1113 = _1008;
    if (_1093)
    {
        float _1115 = in.m_57.x;
        _1113 = _1115;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1121 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1123 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1107);
    float _1125 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = 0.0;
    float _1129 = _1085;
    if (_1093)
    {
        _1127 = _1095;
    }
    float _1131 = _1127;
    float _1133 = _1131;
    if (!_1093)
    {
        _1129 = _1095;
    }
    float _1135 = _1129;
    float _1137 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1139 = exp2(_1097);
    bool _1141 = _1117 > 0.5;
    bool _1143 = _1141 && _1093;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1147 = -_1145;
    float _1149 = fma(_1121, 2.0, _1147);
    float _1151 = -_152;
    float _1153 = _1151 + 1.0;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1157 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1159 = -_126;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1149);
    float _1163 = -_1139;
    float _1165 = _1163 + 1.0;
    float _1167 = fma(_1157, -2.0, _1155);
    float _1169 = _1135;
    if (_1143)
    {
        float _1171 = -_1131;
        float _1173 = _1171 + 1.0;
        _1133 = _1173;
    }
    float _1175 = _1133;
    bool _1177 = _1087 > 0.5;
    float _1179 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1181 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1123);
    float _1183 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    int _1185 = _1177 ? as_type<int>(_1153) : as_type<int>(_152);
    float _1187 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1093)
    {
        _1169 = _1175;
    }
    float _1189 = _1169;
    float _1191 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1137);
    float _1193 = _1103 ? as_type<float>(_1185) : _152;
    float _1195 = in.m_61.w;
    float _1197 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_1187, _1189, -0.5);
    float _1201 = fma(_1193, _1179, -0.5);
    float _1203 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1111);
    float _1205 = fma(_1181, _1199, _1161);
    float _1207 = -_1183;
    float _1209 = fma(_1191, _1201, _1207);
    float _1211 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1203);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1215 = _1209 + 0.5;
    float _1217 = _1205 + 0.5;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1221 = _1211 + _998;
    float _1223 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1221 * 0.5;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.x = _1223;
    out.m_63.y = _1225;
    out.m_63.z = _1125;
    float _1235 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1217;
    out.m_65.y = _1215;
    out.m_67.x = _1235;
    out.m_67.y = _1237;
    out.m_67.z = _1239;
    float _1241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _1195;
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1034;
    out.gl_Position.z = _1211;
    out.gl_Position.w = _998;
    out.m_71.z = _1227;
    out.m_71.w = _998;
    out.m_45.x = _1241;
    float _1243 = _1197 * _1058;
    float _1245 = -_1197;
    float _1247 = _1245 + 1.0;
    float _1249 = _1069 * _1243;
    float _1251 = _1083 * _1243;
    float _1253 = fma(_1079, _1249, _1063);
    float _1255 = fma(_1081, _1249, _1065);
    float _1257 = _1069 * _1247;
    float _1259 = fma(_1069, _1251, _1067);
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1259;
    out.m_73.w = _1257;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

