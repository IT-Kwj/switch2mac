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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _98 = 0;
    if (!_92)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_102);
        out.gl_Position.z = _2027;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_49.w;
    float _108 = float(_88);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _106;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_136);
        out.gl_Position.z = _2091;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_51.x;
    float _140 = in.m_51.y;
    float _142 = in.m_51.z;
    float _144 = 1.0 / _108;
    float _146 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.w;
    float _162 = in.m_57.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _166 = _164 != 0;
    float _168 = _112 * _144;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = 0.0;
    float _176 = _146;
    bool _178 = _166;
    if (!_158)
    {
        float _180 = _146 * _146;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = 0.0;
    float _194 = _184;
    if (!_158)
    {
        float _196 = _112 * _112;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    float _202 = abs(_138);
    float _204 = abs(_142);
    float _206 = precise::max(_202, _204);
    float _208 = _142;
    float _210 = _138;
    if (!_158)
    {
        float _212 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _206 >= 16.0;
    float _218 = fma(_168, 1.25, 0.75);
    float _220 = -_142;
    float _222 = fma(_218, _142, _220);
    float _224 = -_138;
    float _226 = fma(_218, _138, _224);
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    int _238 = as_type<int>(_222);
    float _240 = _214;
    if (_216)
    {
        float _242 = _142 * 0.0625;
        _208 = _242;
    }
    float _244 = _208;
    if (_216)
    {
        float _246 = _138 * 0.0625;
        _210 = _246;
    }
    float _248 = _210;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = abs(_244);
    bool _256 = _254 != 0.0;
    bool _258 = isnan(_254);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = abs(_248);
    bool _268 = _266 == 0.0;
    bool _270 = !_264;
    bool _272 = _268 && _270;
    bool _274 = false;
    if (_272)
    {
        bool _276 = as_type<int>(_248) >= 0;
        _274 = _276;
    }
    bool _278 = _274;
    if (_272)
    {
        int _280 = _278 ? 0 : 1078530011;
        _238 = _280;
    }
    int _282 = _238;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _286 = _284 != 0;
    float _288 = 0.0;
    float _290 = as_type<float>(_282);
    if (_272)
    {
        int _292 = int(0x80000000) & as_type<int>(_244);
        int _294 = _282 | _292;
        _288 = as_type<float>(_294);
    }
    float _296 = _288;
    float _298 = abs(_248);
    bool _300 = _298 == 0.0;
    bool _302 = !_158;
    int _304 = 0;
    float _306 = _296;
    float _308 = _296;
    float _310 = _148;
    if (!_302)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _146 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _146);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _330;
        _304 = as_type<int>(_324);
        _240 = _340;
    }
    float _342 = _290;
    int _344 = _304;
    float _346 = _240;
    bool _348 = !_158;
    float _350 = _342;
    int _352 = _344;
    if (!_348)
    {
        float _354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _356 = log2(_354);
        float _358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _360 = _358 + 1.0;
        float _362 = 1.0 / _360;
        float _364 = _146 * _356;
        float _366 = exp2(_364);
        float _368 = -_366;
        float _370 = _368 + 1.0;
        float _372 = _370 * _362;
        _350 = _360;
        _176 = _372;
    }
    float _374 = _350;
    float _376 = _176;
    float _378 = 0.0;
    float _380 = _374;
    if (!_158)
    {
        _378 = _112;
    }
    float _382 = _378;
    float _384 = _382;
    if (!_158)
    {
        float _386 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _380 = _386;
    }
    float _388 = _380;
    bool _390 = !_158;
    float _392 = _388;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _404 = _112 * _396;
        float _406 = 1.0 / _400;
        float _408 = _402 * 0.693147182464599609375;
        float _410 = exp2(_404);
        float _412 = 1.0 / _408;
        float _414 = _410 + (-1.0);
        float _416 = -_414;
        float _418 = fma(_416, _412, _112);
        float _420 = _418 * _406;
        float _422 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = as_type<int>(_412);
        _392 = _422;
    }
    int _424 = _352;
    float _426 = _392;
    bool _428 = !_158;
    int _430 = _424;
    if (!_428)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = 1.0 / _438;
        float _442 = _112 * _434;
        float _444 = exp2(_442);
        float _446 = -_444;
        float _448 = _446 + 1.0;
        float _450 = _448 * _440;
        _430 = as_type<int>(_438);
        _384 = _450;
    }
    int _452 = _430;
    float _454 = _384;
    bool _456 = _160 > 0.5;
    bool _458 = !_264;
    bool _460 = _458 && _300;
    int _462 = _452;
    int _464 = _456 ? (-1) : 0;
    if (!_460)
    {
        float _466 = abs(_244);
        bool _468 = _466 != as_type<float>(0x7f800000u /* inf */);
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _476 = _472 || _474;
        float _478 = abs(_248);
        bool _480 = _478 == as_type<float>(0x7f800000u /* inf */);
        bool _482 = !_476;
        bool _484 = _480 && _482;
        if (_484)
        {
            _462 = 1075235812;
        }
        int _486 = _462;
        int _488 = _486;
        if (_484)
        {
            bool _490 = as_type<int>(_248) >= 0;
            _464 = _490 ? (-1) : 0;
        }
        int _492 = _464;
        if (_484)
        {
            int _494 = ~_492;
            int _496 = (_494 != 0) ? _486 : 1061752795;
            _488 = _496;
        }
        int _498 = _488;
        if (_484)
        {
            int _500 = int(0x80000000) & as_type<int>(_244);
            int _502 = _498 | _500;
            _306 = as_type<float>(_502);
        }
        float _504 = _306;
        float _506 = abs(_248);
        bool _508 = _506 == as_type<float>(0x7f800000u /* inf */);
        bool _510 = !_476;
        bool _512 = _510 && _508;
        _308 = _504;
        if (!_512)
        {
            float _514 = abs(_248);
            float _516 = abs(_244);
            float _518 = precise::max(_514, _516);
            float _520 = abs(_248);
            float _522 = abs(_244);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _518;
            float _528 = abs(_244);
            float _530 = abs(_248);
            bool _532 = _528 > _530;
            float _534 = _524 * _526;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = abs(_248);
            float _548 = abs(_244);
            float _550 = _546 + _548;
            float _552 = fma(_536, _544, -6.565555095672607421875);
            float _554 = 1.0 / _542;
            float _556 = _536 * _552;
            float _558 = _534 * _556;
            float _560 = fma(_558, _554, _534);
            int _562 = as_type<int>(_244) & int(0x80000000);
            float _564 = _560;
            _308 = _550;
            if (_532)
            {
                float _566 = -_560;
                float _568 = _566 + 1.57079637050628662109375;
                _564 = _568;
            }
            float _570 = _564;
            bool _572 = as_type<int>(_248) >= 0;
            int _574 = as_type<int>(_570);
            if (!_572)
            {
                float _576 = -_570;
                float _578 = _576 + 3.1415927410125732421875;
                _574 = as_type<int>(_578);
            }
            int _580 = _574;
            bool _582 = _550 > as_type<float>(0x7f800000u /* inf */);
            bool _584 = isnan(_550);
            bool _586 = _582 || _584;
            bool _588 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _590 = _586 || _588;
            if (!_590)
            {
                int _592 = _562 | _580;
                _308 = as_type<float>(_592);
            }
        }
    }
    float _594 = _308;
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _604 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _606 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _608 = -_148;
    float _610 = _608 + 1.0;
    float _612 = fma(_376, _230, _602);
    float _614 = fma(_376, _228, _604);
    float _616 = fma(_376, _232, _606);
    float _618 = fma(_612, _162, _188);
    float _620 = fma(_614, _162, _186);
    bool _622 = _172 > 0.5;
    float _624 = fma(_616, _162, _190);
    float _626 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _640 = _622 ? _610 : _148;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _646 = _644 != 0;
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _650 = _636 * 6.283185482025146484375;
    float _652 = _598 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = _636 * 12.0;
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _658 = _650 * 0.15915493667125701904296875;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = fma(_594, 4.0, _654);
    float _664 = _636 * 6.0;
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _670 = _662 * 0.15915493667125701904296875;
    float _672 = -_664;
    float _674 = fma(_594, 3.0, _672);
    float _676 = _648 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = _666 + _678;
    float _682 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = 0.0;
    float _686 = _640;
    if (_252)
    {
        float _688 = in.m_55.x;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _676 + _692;
    float _696 = _680 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _682 + _698;
    float _702 = _674 * 0.15915493667125701904296875;
    float _704 = _670 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_694, _694, _696);
    float _710 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = _168 * 3.1415927410125732421875;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _716 = _714 != 0;
    float _718 = fma(_700, _700, _708);
    float _720 = -_660;
    float _722 = fma(_710, 2.0, _720);
    float _724 = _702 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = in.m_53.x;
    bool _730 = _160 > 0.5;
    float _732 = _712 * 0.15915493667125701904296875;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _716 ? _640 : _148;
    float _740 = _596;
    bool _742 = _716;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _746 = _738;
    if (_286)
    {
        float _748 = in.m_55.z;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = rsqrt(_718);
    float _754 = _594 + 3.1415927410125732421875;
    out.m_59.y = _148;
    if (_252)
    {
        bool _756 = _690 > 0.5;
        _742 = _756;
    }
    bool _758 = _742;
    float _760 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_646)
    {
        _686 = _172;
    }
    float _762 = _686;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = _732 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _762;
    if (_646)
    {
        _770 = _170;
    }
    float _772 = _770;
    float _774 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_166)
    {
        float _776 = _730 ? _610 : _148;
        _310 = _776;
    }
    float _778 = _310;
    float _780 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _782 = _706 + _726;
    float _784 = _754 * 0.15915493667125701904296875;
    float _786 = fma(_760, -2.0, _764);
    float _788 = _658 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _680 * _752;
    float _794 = _600 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_252)
    {
        _744 = _728;
    }
    float _796 = _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _800 = _798 + 2.0;
    float _802 = _694 * _752;
    float _804 = -_792;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _808 = _784 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = 0.0 + _768;
    float _814 = precise::clamp(_812, 0.0, 1.0);
    float _816 = -_802;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _820 = _806 * _806;
    float _822 = _700 * _752;
    float _824 = _750;
    float _826 = _796;
    if (_286)
    {
        bool _828 = _750 > 0.5;
        _178 = _828;
    }
    bool _830 = _178;
    float _832 = _680;
    if (!_646)
    {
        float _834 = in.m_55.z;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = fma(_818, _818, _820);
    float _840 = -_822;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _844 = fma(_790, 0.10000002384185791015625, 1.0);
    float _846 = -_140;
    float _848 = fma(_814, _140, _846);
    float _850 = fma(_842, _842, _838);
    if (!_252)
    {
        _824 = _796;
    }
    float _852 = _824;
    float _854 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = fma(_782, 0.25, 0.5);
    float _858 = _852;
    if (_252)
    {
        _826 = _728;
    }
    float _860 = _826;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _866 = fma(_856, _800, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _868 = fma(_810, 0.5, 0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _872 = _868 * _866;
    float _874 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _786);
    float _876 = sqrt(_850);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _880 = _872 * _870;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _884 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = fma(_880, _878, 1.0);
    float _888 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _882);
    float _890 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _894 = _236 * _886;
    float _896 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    float _898 = fma(_890, _738, -0.5);
    float _900 = _234 * _886;
    float _902 = _836;
    int _904 = as_type<int>(_886);
    float _906 = _860;
    if (!_646)
    {
        _746 = _836;
    }
    float _908 = _746;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _912 = _752 * _876;
    float _914 = _908;
    if (_646)
    {
        _914 = _172;
    }
    float _916 = _914;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_646)
    {
        _902 = _172;
    }
    float _920 = _902;
    float _922 = _774 * _912;
    float _924 = _854 * _912;
    float _926 = -_874;
    float _928 = fma(_896, _898, _926);
    float _930 = _922 * _892;
    float _932 = _884 * _912;
    float _934 = _924 * _910;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _900);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = _930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _944 = _932 * _936;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _940);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _952 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _942);
    float _954 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _948);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _962 = _918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _964 = _676 + _956;
    float _966 = _682 + _958;
    int _968 = as_type<int>(_948);
    float _970 = _952;
    float _972 = _964;
    float _974 = _966;
    if (_252)
    {
        float _976 = -_860;
        float _978 = _976 + 1.0;
        _968 = as_type<int>(_978);
    }
    int _980 = _968;
    float _982 = -_960;
    float _984 = fma(_954, 2.0, _982);
    float _986 = fma(_962, _778, -0.5);
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _964 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _966 + _992;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_252)
    {
        float _998 = _758 ? as_type<float>(_980) : _860;
        _858 = _998;
    }
    float _1000 = _858;
    float _1002 = _990 * _990;
    float _1004 = _994 * _994;
    float _1006 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].w, _996);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1012 = _1002 + _1004;
    float _1014 = fma(_1006, _1000, -0.5);
    float _1016 = _1002;
    float _1018 = _1004;
    if (_286)
    {
        float _1020 = -_860;
        float _1022 = _1020 + 1.0;
        _904 = as_type<int>(_1022);
    }
    int _1024 = _904;
    float _1026 = _930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _780);
    float _1030 = sqrt(_1012);
    if (_286)
    {
        float _1032 = _830 ? as_type<float>(_1024) : _860;
        _906 = _1032;
    }
    float _1034 = _906;
    float _1036 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1038 = -_112;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[81].x, _984);
    float _1042 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1036);
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1048 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1050 = -_112;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _1054 = fma(_1044, _1034, -0.5);
    float _1056 = fma(_1048, -2.0, _1046);
    float _1058 = fma(_1028, _1014, _1052);
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1064 = _666 + _1042;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _952);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1082 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    if (!_1060)
    {
        _970 = _1064;
    }
    float _1084 = _970;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1030 + _1092;
        float _1096 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = rsqrt(_1012);
        float _1100 = _1094 * _1090;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = fma(_1106, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = _1098 * _1112;
        float _1116 = fma(_990, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = _1110 + (-1.0);
        float _1120 = fma(_994, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1116 + _1122;
        float _1126 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1130 = _1120 + _1128;
        float _1132 = _1124 * _1124;
        float _1134 = fma(_1064, _1110, _1126);
        float _1136 = _1130 * _1130;
        _1088 = _1134;
        _1016 = _1132;
        _1018 = _1136;
        _972 = _1116;
        _974 = _1120;
    }
    float _1138 = _1088;
    float _1140 = _1016;
    float _1142 = _1018;
    float _1144 = _972;
    float _1146 = _974;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1072, _1054, _1040);
    float _1154 = -_1082;
    float _1156 = fma(_1062, _986, _1154);
    float _1158 = fma(_1150, _1150, _1140);
    float _1160 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1162 = _1158 + _1142;
    out.m_61.x = _1078;
    out.m_61.y = _1076;
    out.m_61.z = _1080;
    out.m_61.w = _1074;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1170 = sqrt(_1162);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1058 + 0.5;
    float _1182 = _928 + 0.5;
    float _1184 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1186 = fma(_454, _230, _1160);
    float _1188 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_63.x = _1174;
    out.m_63.y = _1176;
    out.m_63.z = _1178;
    out.m_63.w = _1172;
    float _1190 = fma(_454, _228, _1184);
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1200 = _1196 || _1198;
    float _1202 = -_1186;
    float _1204 = _612 + _1202;
    float _1206 = fma(_454, _232, _1188);
    float _1208 = -_1190;
    float _1210 = _614 + _1208;
    float _1212 = _1152 + 0.5;
    float _1214 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1216 = _1156 + 0.5;
    float _1218 = -_1206;
    float _1220 = _616 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1214);
    out.m_65.x = _1180;
    out.m_65.y = _1182;
    out.m_65.z = _1212;
    out.m_65.w = _1216;
    float _1224 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1226 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1228 = _1176;
    float _1230 = _1216;
    if (!_1200)
    {
        _1228 = 1.0;
    }
    float _1232 = _1228;
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1224);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1226);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    bool _1244 = !_1200;
    float _1246 = _1232;
    float _1248 = _1240;
    float _1250 = _1240;
    float _1252 = _1238;
    float _1254 = _1238;
    float _1256 = _1240;
    if (!_1244)
    {
        bool _1258 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1260 = isnan(_1170);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1266 = _1262 || _1264;
        if (!_1266)
        {
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = _1170 + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1274 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1272;
            float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1280 = 1.0 / _1274;
            float _1282 = _1270 * _1280;
            float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1284;
            _1286 = true;
        }
        else
        {
            bool _1288 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1290 = isnan(_1170);
            bool _1292 = _1288 || _1290;
            bool _1294 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1296 = _1292 || _1294;
            if (!_1296)
            {
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1170 + _1298;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1308 = _1306 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1310 = 1.0 / _1304;
                float _1312 = _1300 * _1310;
                float _1314 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1314;
                _1286 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1286 = false;
    float _1316 = _1246;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1320 = _1138 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1324 = _1144 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1328 = _1146 + _1326;
    float _1330 = fma(_1320, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1332 = fma(_1324, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1334 = fma(_1328, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = -_666;
    float _1338 = _1336 + _1330;
    float _1340 = -_676;
    float _1342 = _1340 + _1332;
    float _1344 = -_682;
    float _1346 = _1344 + _1334;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > 0.0;
    bool _1358 = !_1356;
    float _1360 = _1354;
    float _1362 = _1320;
    float _1364 = _1330;
    float _1366 = _1332;
    float _1368 = _1334;
    if (!_1358)
    {
        bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1372 = _1212;
        if (_1370)
        {
            float _1374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1372 = _1374;
        }
        float _1376 = _1372;
        if (_1370)
        {
            _1360 = _1242;
        }
        float _1378 = _1360;
        float _1380 = _1376;
        float _1382 = _1378;
        if (_1370)
        {
            float _1384 = _1238 * _1376;
            _1230 = _1384;
        }
        float _1386 = _1230;
        float _1388 = _1386;
        if (_1370)
        {
            float _1390 = _1240 * _1376;
            _1362 = _1390;
        }
        float _1392 = _1362;
        float _1394 = _1392;
        if (_1370)
        {
            float _1396 = _1242 * _1376;
            _1380 = _1396;
        }
        float _1398 = _1380;
        float _1400 = _1398;
        if (!_1370)
        {
            float _1402 = _112 + 1.0;
            float _1404 = _1402;
            if (!_158)
            {
                float _1406 = _1402 * _1402;
                float _1408 = _1406 * 0.5;
                _1248 = _1408;
            }
            float _1410 = _1248;
            float _1412 = _1410;
            if (!_158)
            {
                float _1414 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1412 = _1414;
            }
            float _1416 = _1412;
            bool _1418 = !_158;
            float _1420 = _1416;
            if (!_1418)
            {
                float _1422 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1424 = log2(_1422);
                float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1428 = _1426 + 1.0;
                float _1430 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1432 = _1424 * _1402;
                float _1434 = 1.0 / _1428;
                float _1436 = _1430 * 0.693147182464599609375;
                float _1438 = exp2(_1432);
                float _1440 = 1.0 / _1436;
                float _1442 = _1438 + (-1.0);
                float _1444 = -_1442;
                float _1446 = fma(_1444, _1440, _1402);
                float _1448 = _1446 * _1434;
                float _1450 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1420 = _1450;
            }
            float _1452 = _1420;
            float _1454 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1456 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1458 = !_158;
            if (!_1458)
            {
                float _1460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1462 = log2(_1460);
                float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1466 = _1464 + 1.0;
                float _1468 = 1.0 / _1466;
                float _1470 = _1462 * _1402;
                float _1472 = exp2(_1470);
                float _1474 = -_1472;
                float _1476 = _1474 + 1.0;
                float _1478 = _1476 * _1468;
                _1404 = _1478;
            }
            float _1480 = _1404;
            float _1482 = fma(_1480, _230, _1456);
            float _1484 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1486 = fma(_1480, _228, _1454);
            float _1488 = -_1186;
            float _1490 = _1488 + _1482;
            float _1492 = fma(_1480, _232, _1484);
            float _1494 = -_1190;
            float _1496 = _1494 + _1486;
            float _1498 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1500 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1502 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1504 = -_1206;
            float _1506 = _1504 + _1492;
            float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1498);
            float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1500);
            float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1502);
            float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1508);
            float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1510);
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1512);
            _1250 = _1516;
            _1252 = _1514;
            _1382 = _1518;
            _1388 = _1514;
            _1394 = _1516;
            _1400 = _1518;
        }
        float _1520 = _1250;
        float _1522 = _1252;
        float _1524 = _1382;
        float _1526 = _1388;
        float _1528 = _1394;
        float _1530 = _1400;
        float _1532 = _1520 * _1520;
        float _1534 = rsqrt(_1352);
        float _1536 = fma(_1522, _1522, _1532);
        float _1538 = fma(_1524, _1524, _1536);
        float _1540 = sqrt(_1538);
        float _1542 = _1342 * _1534;
        float _1544 = _1338 * _1534;
        float _1546 = _1346 * _1534;
        bool _1548 = _1540 > 0.0;
        bool _1550 = !_1548;
        _1254 = _1522;
        _1256 = _1520;
        if (!_1550)
        {
            float _1552 = rsqrt(_1538);
            float _1554 = _1552 * _1520;
            float _1556 = _1552 * _1522;
            float _1558 = _1552 * _1524;
            float _1560 = _1544 * _1554;
            float _1562 = fma(_1542, _1556, _1560);
            float _1564 = fma(_1546, _1558, _1562);
            float _1566 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1568 = fma(_1526, _1566, _1332);
            float _1570 = fma(_1528, _1566, _1330);
            float _1572 = fma(_1530, _1566, _1334);
            _1364 = _1570;
            _1366 = _1568;
            _1368 = _1572;
        }
    }
    float _1574 = _1364;
    float _1576 = _1366;
    float _1578 = _1368;
    float _1580 = _1254;
    float _1582 = _1256;
    float _1584 = -_792;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1588 = -_802;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1592 = -_822;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = sqrt(_1612);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1602 * _1618;
    float _1622 = _1606 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1614;
    float _1640 = _1578;
    float _1642 = _1636;
    float _1644 = _1580;
    float _1646 = _1598;
    float _1648 = _1582;
    float _1650 = _1620;
    if (_1632)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1632)
    {
        float _1656 = rsqrt(_1628);
        _1640 = _1656;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1632)
    {
        float _1662 = _1636 * _1654;
        _1642 = _1662;
    }
    float _1664 = _1642;
    if (_1632)
    {
        float _1666 = _1664 * 0.15915493667125701904296875;
        _1644 = _1666;
    }
    float _1668 = _1644;
    float _1670 = _1654;
    if (_1632)
    {
        float _1672 = _1668 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1606;
    float _1684 = _1680;
    if (_1632)
    {
        float _1686 = _1668 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = -_1618;
    float _1694 = -_1680;
    float _1696 = fma(_1598, _1692, _1694);
    if (!_1632)
    {
        _1646 = _1622;
    }
    float _1698 = _1646;
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1696 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1632)
    {
        float _1710 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1710;
    }
    float _1712 = _1648;
    float _1714 = _1712;
    if (!_1632)
    {
        _1706 = _1696;
    }
    float _1716 = _1706;
    float _1718 = _1716;
    float _1720 = _1690;
    if (_1632)
    {
        float _1722 = _1690 + (-1.0);
        _1708 = _1722;
    }
    float _1724 = _1708;
    float _1726 = _1724;
    if (_1632)
    {
        float _1728 = _1658 * _1712;
        _1714 = _1728;
    }
    float _1730 = _1714;
    if (_1632)
    {
        float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1732;
    }
    float _1734 = _1660;
    if (_1632)
    {
        float _1736 = _1620 * _1730;
        _1650 = _1736;
    }
    float _1738 = _1650;
    if (!_1632)
    {
        _1726 = _1624;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1730;
        _1700 = _1744;
    }
    float _1746 = _1700;
    if (_1632)
    {
        float _1748 = fma(_1696, _1690, _1734);
        _1718 = _1748;
    }
    float _1750 = _1718;
    if (_1632)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1632)
    {
        _1720 = _1626;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1632)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1768 = _1764 + _1762;
    float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1772 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1770);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1766);
    float _1778 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = rsqrt(_1768);
    float _1782 = -_1774;
    float _1784 = _1782 + 1.0;
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1778);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1784);
    float _1800 = log2(_1798);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1806 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1812 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1814 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1804);
    float _1816 = _1780 * _1738;
    float _1818 = -_1810;
    float _1820 = fma(_1818, _1808, 1.0);
    float _1822 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1824 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1826 = _1780 * _1750;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = _1780 * _1746;
    float _1832 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1824);
    float _1834 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1836 = -_1828;
    float _1838 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1844 = log2(_1820);
    float _1846 = -_1830;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1850 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1842);
    float _1854 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1848, -0.5, 0.5);
    float _1858 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1850);
    float _1860 = fma(_1848, 0.5, 0.5);
    float _1862 = exp2(_1840);
    float _1864 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = _1826 + 1.0;
    float _1870 = fma(_1860, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1872 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = 1.0 / _1852;
    float _1878 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1880 = fma(_1860, _1870, -0.212114393711090087890625);
    float _1882 = fma(_1860, _1880, 1.570728778839111328125);
    float _1884 = sqrt(_1856);
    float _1886 = -_1826;
    float _1888 = fma(_1862, _1868, _1886);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1896 = _1874 * _1876;
    float _1898 = _1878 * _1876;
    float _1900 = fma(_1896, 0.5, 0.5);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = _1884 * 0.636619746685028076171875;
    float _1906 = -_1882;
    float _1908 = fma(_1904, _1906, 1.0);
    float3 _4931 = float3(_1900, _1902, _1894);
    float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4931, float3(0.0), isnan(_4931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4931, float3(0.0), isnan(_4931)), level(0.0)).x;
    float3 _4942 = float3(_1900, _1902, _1894);
    float4 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4942, float3(0.0), isnan(_4942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4942, float3(0.0), isnan(_4942)), level(0.0)).xyzw;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = _1913.w;
    float2 _4959 = float2(_1908, _1892);
    float3 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1935 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1939 = exp2(_1933);
    float _1941 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1943 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _1945 = _1943 + _1852;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1878;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1852;
    float _1947 = _1945 * 0.5;
    float _1949 = -_1939;
    float _1951 = _1949 + 1.0;
    float _1953 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1947;
    out.m_67.w = _1852;
    float _1955 = _1953 * _1910;
    float _1957 = -_1953;
    float _1959 = _1957 + 1.0;
    float _1961 = _1921 * _1955;
    float _1963 = _1931 * _1955;
    float _1965 = fma(_1927, _1961, _1915);
    float _1967 = fma(_1929, _1961, _1917);
    float _1969 = _1921 * _1959;
    float _1971 = fma(_1921, _1963, _1919);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1965;
    out.m_69.y = _1967;
    out.m_69.z = _1971;
    out.m_69.w = _1969;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _98 = 0;
    if (!_92)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_102);
        out.gl_Position.z = _2027;
    }
    if (!_92)
    {
        return out;
    }
    float _106 = in.m_49.w;
    float _108 = float(_88);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _106;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_136);
        out.gl_Position.z = _2091;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_51.x;
    float _140 = in.m_51.y;
    float _142 = in.m_51.z;
    float _144 = 1.0 / _108;
    float _146 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.w;
    float _162 = in.m_57.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _166 = _164 != 0;
    float _168 = _112 * _144;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = 0.0;
    float _176 = _146;
    bool _178 = _166;
    if (!_158)
    {
        float _180 = _146 * _146;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = 0.0;
    float _194 = _184;
    if (!_158)
    {
        float _196 = _112 * _112;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    float _202 = abs(_138);
    float _204 = abs(_142);
    float _206 = precise::max(_202, _204);
    float _208 = _142;
    float _210 = _138;
    if (!_158)
    {
        float _212 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _206 >= 16.0;
    float _218 = fma(_168, 1.25, 0.75);
    float _220 = -_142;
    float _222 = fma(_218, _142, _220);
    float _224 = -_138;
    float _226 = fma(_218, _138, _224);
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    int _238 = as_type<int>(_222);
    float _240 = _214;
    if (_216)
    {
        float _242 = _142 * 0.0625;
        _208 = _242;
    }
    float _244 = _208;
    if (_216)
    {
        float _246 = _138 * 0.0625;
        _210 = _246;
    }
    float _248 = _210;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = abs(_244);
    bool _256 = _254 != 0.0;
    bool _258 = isnan(_254);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = abs(_248);
    bool _268 = _266 == 0.0;
    bool _270 = !_264;
    bool _272 = _268 && _270;
    bool _274 = false;
    if (_272)
    {
        bool _276 = as_type<int>(_248) >= 0;
        _274 = _276;
    }
    bool _278 = _274;
    if (_272)
    {
        int _280 = _278 ? 0 : 1078530011;
        _238 = _280;
    }
    int _282 = _238;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _286 = _284 != 0;
    float _288 = 0.0;
    float _290 = as_type<float>(_282);
    if (_272)
    {
        int _292 = int(0x80000000) & as_type<int>(_244);
        int _294 = _282 | _292;
        _288 = as_type<float>(_294);
    }
    float _296 = _288;
    float _298 = abs(_248);
    bool _300 = _298 == 0.0;
    bool _302 = !_158;
    int _304 = 0;
    float _306 = _296;
    float _308 = _296;
    float _310 = _148;
    if (!_302)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _146 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _146);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _330;
        _304 = as_type<int>(_324);
        _240 = _340;
    }
    float _342 = _290;
    int _344 = _304;
    float _346 = _240;
    bool _348 = !_158;
    float _350 = _342;
    int _352 = _344;
    if (!_348)
    {
        float _354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _356 = log2(_354);
        float _358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _360 = _358 + 1.0;
        float _362 = 1.0 / _360;
        float _364 = _146 * _356;
        float _366 = exp2(_364);
        float _368 = -_366;
        float _370 = _368 + 1.0;
        float _372 = _370 * _362;
        _350 = _360;
        _176 = _372;
    }
    float _374 = _350;
    float _376 = _176;
    float _378 = 0.0;
    float _380 = _374;
    if (!_158)
    {
        _378 = _112;
    }
    float _382 = _378;
    float _384 = _382;
    if (!_158)
    {
        float _386 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _380 = _386;
    }
    float _388 = _380;
    bool _390 = !_158;
    float _392 = _388;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _404 = _112 * _396;
        float _406 = 1.0 / _400;
        float _408 = _402 * 0.693147182464599609375;
        float _410 = exp2(_404);
        float _412 = 1.0 / _408;
        float _414 = _410 + (-1.0);
        float _416 = -_414;
        float _418 = fma(_416, _412, _112);
        float _420 = _418 * _406;
        float _422 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = as_type<int>(_412);
        _392 = _422;
    }
    int _424 = _352;
    float _426 = _392;
    bool _428 = !_158;
    int _430 = _424;
    if (!_428)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = 1.0 / _438;
        float _442 = _112 * _434;
        float _444 = exp2(_442);
        float _446 = -_444;
        float _448 = _446 + 1.0;
        float _450 = _448 * _440;
        _430 = as_type<int>(_438);
        _384 = _450;
    }
    int _452 = _430;
    float _454 = _384;
    bool _456 = _160 > 0.5;
    bool _458 = !_264;
    bool _460 = _458 && _300;
    int _462 = _452;
    int _464 = _456 ? (-1) : 0;
    if (!_460)
    {
        float _466 = abs(_244);
        bool _468 = _466 != as_type<float>(0x7f800000u /* inf */);
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _476 = _472 || _474;
        float _478 = abs(_248);
        bool _480 = _478 == as_type<float>(0x7f800000u /* inf */);
        bool _482 = !_476;
        bool _484 = _480 && _482;
        if (_484)
        {
            _462 = 1075235812;
        }
        int _486 = _462;
        int _488 = _486;
        if (_484)
        {
            bool _490 = as_type<int>(_248) >= 0;
            _464 = _490 ? (-1) : 0;
        }
        int _492 = _464;
        if (_484)
        {
            int _494 = ~_492;
            int _496 = (_494 != 0) ? _486 : 1061752795;
            _488 = _496;
        }
        int _498 = _488;
        if (_484)
        {
            int _500 = int(0x80000000) & as_type<int>(_244);
            int _502 = _498 | _500;
            _306 = as_type<float>(_502);
        }
        float _504 = _306;
        float _506 = abs(_248);
        bool _508 = _506 == as_type<float>(0x7f800000u /* inf */);
        bool _510 = !_476;
        bool _512 = _510 && _508;
        _308 = _504;
        if (!_512)
        {
            float _514 = abs(_248);
            float _516 = abs(_244);
            float _518 = precise::max(_514, _516);
            float _520 = abs(_248);
            float _522 = abs(_244);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _518;
            float _528 = abs(_244);
            float _530 = abs(_248);
            bool _532 = _528 > _530;
            float _534 = _524 * _526;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = abs(_248);
            float _548 = abs(_244);
            float _550 = _546 + _548;
            float _552 = fma(_536, _544, -6.565555095672607421875);
            float _554 = 1.0 / _542;
            float _556 = _536 * _552;
            float _558 = _534 * _556;
            float _560 = fma(_558, _554, _534);
            int _562 = as_type<int>(_244) & int(0x80000000);
            float _564 = _560;
            _308 = _550;
            if (_532)
            {
                float _566 = -_560;
                float _568 = _566 + 1.57079637050628662109375;
                _564 = _568;
            }
            float _570 = _564;
            bool _572 = as_type<int>(_248) >= 0;
            int _574 = as_type<int>(_570);
            if (!_572)
            {
                float _576 = -_570;
                float _578 = _576 + 3.1415927410125732421875;
                _574 = as_type<int>(_578);
            }
            int _580 = _574;
            bool _582 = _550 > as_type<float>(0x7f800000u /* inf */);
            bool _584 = isnan(_550);
            bool _586 = _582 || _584;
            bool _588 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _590 = _586 || _588;
            if (!_590)
            {
                int _592 = _562 | _580;
                _308 = as_type<float>(_592);
            }
        }
    }
    float _594 = _308;
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _604 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _606 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _608 = -_148;
    float _610 = _608 + 1.0;
    float _612 = fma(_376, _230, _602);
    float _614 = fma(_376, _228, _604);
    float _616 = fma(_376, _232, _606);
    float _618 = fma(_612, _162, _188);
    float _620 = fma(_614, _162, _186);
    bool _622 = _172 > 0.5;
    float _624 = fma(_616, _162, _190);
    float _626 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _640 = _622 ? _610 : _148;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _646 = _644 != 0;
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _650 = _636 * 6.283185482025146484375;
    float _652 = _598 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = _636 * 12.0;
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _658 = _650 * 0.15915493667125701904296875;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = fma(_594, 4.0, _654);
    float _664 = _636 * 6.0;
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _670 = _662 * 0.15915493667125701904296875;
    float _672 = -_664;
    float _674 = fma(_594, 3.0, _672);
    float _676 = _648 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = _666 + _678;
    float _682 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = 0.0;
    float _686 = _640;
    if (_252)
    {
        float _688 = in.m_55.x;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _676 + _692;
    float _696 = _680 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _682 + _698;
    float _702 = _674 * 0.15915493667125701904296875;
    float _704 = _670 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_694, _694, _696);
    float _710 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = _168 * 3.1415927410125732421875;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _716 = _714 != 0;
    float _718 = fma(_700, _700, _708);
    float _720 = -_660;
    float _722 = fma(_710, 2.0, _720);
    float _724 = _702 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = in.m_53.x;
    bool _730 = _160 > 0.5;
    float _732 = _712 * 0.15915493667125701904296875;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _716 ? _640 : _148;
    float _740 = _596;
    bool _742 = _716;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _746 = _738;
    if (_286)
    {
        float _748 = in.m_55.z;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = rsqrt(_718);
    float _754 = _594 + 3.1415927410125732421875;
    out.m_59.y = _148;
    if (_252)
    {
        bool _756 = _690 > 0.5;
        _742 = _756;
    }
    bool _758 = _742;
    float _760 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_646)
    {
        _686 = _172;
    }
    float _762 = _686;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = _732 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _762;
    if (_646)
    {
        _770 = _170;
    }
    float _772 = _770;
    float _774 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_166)
    {
        float _776 = _730 ? _610 : _148;
        _310 = _776;
    }
    float _778 = _310;
    float _780 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _782 = _706 + _726;
    float _784 = _754 * 0.15915493667125701904296875;
    float _786 = fma(_760, -2.0, _764);
    float _788 = _658 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _680 * _752;
    float _794 = _600 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_252)
    {
        _744 = _728;
    }
    float _796 = _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _800 = _798 + 2.0;
    float _802 = _694 * _752;
    float _804 = -_792;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _808 = _784 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = 0.0 + _768;
    float _814 = precise::clamp(_812, 0.0, 1.0);
    float _816 = -_802;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _820 = _806 * _806;
    float _822 = _700 * _752;
    float _824 = _750;
    float _826 = _796;
    if (_286)
    {
        bool _828 = _750 > 0.5;
        _178 = _828;
    }
    bool _830 = _178;
    float _832 = _680;
    if (!_646)
    {
        float _834 = in.m_55.z;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = fma(_818, _818, _820);
    float _840 = -_822;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _844 = fma(_790, 0.10000002384185791015625, 1.0);
    float _846 = -_140;
    float _848 = fma(_814, _140, _846);
    float _850 = fma(_842, _842, _838);
    if (!_252)
    {
        _824 = _796;
    }
    float _852 = _824;
    float _854 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = fma(_782, 0.25, 0.5);
    float _858 = _852;
    if (_252)
    {
        _826 = _728;
    }
    float _860 = _826;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _866 = fma(_856, _800, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _868 = fma(_810, 0.5, 0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _872 = _868 * _866;
    float _874 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _786);
    float _876 = sqrt(_850);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _880 = _872 * _870;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _884 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = fma(_880, _878, 1.0);
    float _888 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _882);
    float _890 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _894 = _236 * _886;
    float _896 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    float _898 = fma(_890, _738, -0.5);
    float _900 = _234 * _886;
    float _902 = _836;
    int _904 = as_type<int>(_886);
    float _906 = _860;
    if (!_646)
    {
        _746 = _836;
    }
    float _908 = _746;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _912 = _752 * _876;
    float _914 = _908;
    if (_646)
    {
        _914 = _172;
    }
    float _916 = _914;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_646)
    {
        _902 = _172;
    }
    float _920 = _902;
    float _922 = _774 * _912;
    float _924 = _854 * _912;
    float _926 = -_874;
    float _928 = fma(_896, _898, _926);
    float _930 = _922 * _892;
    float _932 = _884 * _912;
    float _934 = _924 * _910;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _900);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = _930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _944 = _932 * _936;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _940);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _952 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _942);
    float _954 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _948);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _962 = _918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _964 = _676 + _956;
    float _966 = _682 + _958;
    int _968 = as_type<int>(_948);
    float _970 = _952;
    float _972 = _964;
    float _974 = _966;
    if (_252)
    {
        float _976 = -_860;
        float _978 = _976 + 1.0;
        _968 = as_type<int>(_978);
    }
    int _980 = _968;
    float _982 = -_960;
    float _984 = fma(_954, 2.0, _982);
    float _986 = fma(_962, _778, -0.5);
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _964 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _966 + _992;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_252)
    {
        float _998 = _758 ? as_type<float>(_980) : _860;
        _858 = _998;
    }
    float _1000 = _858;
    float _1002 = _990 * _990;
    float _1004 = _994 * _994;
    float _1006 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].w, _996);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1012 = _1002 + _1004;
    float _1014 = fma(_1006, _1000, -0.5);
    float _1016 = _1002;
    float _1018 = _1004;
    if (_286)
    {
        float _1020 = -_860;
        float _1022 = _1020 + 1.0;
        _904 = as_type<int>(_1022);
    }
    int _1024 = _904;
    float _1026 = _930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _780);
    float _1030 = sqrt(_1012);
    if (_286)
    {
        float _1032 = _830 ? as_type<float>(_1024) : _860;
        _906 = _1032;
    }
    float _1034 = _906;
    float _1036 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1038 = -_112;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[81].x, _984);
    float _1042 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1036);
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1048 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1050 = -_112;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _1054 = fma(_1044, _1034, -0.5);
    float _1056 = fma(_1048, -2.0, _1046);
    float _1058 = fma(_1028, _1014, _1052);
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1064 = _666 + _1042;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _952);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1082 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    if (!_1060)
    {
        _970 = _1064;
    }
    float _1084 = _970;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1030 + _1092;
        float _1096 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = rsqrt(_1012);
        float _1100 = _1094 * _1090;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = fma(_1106, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = _1098 * _1112;
        float _1116 = fma(_990, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = _1110 + (-1.0);
        float _1120 = fma(_994, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1116 + _1122;
        float _1126 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1130 = _1120 + _1128;
        float _1132 = _1124 * _1124;
        float _1134 = fma(_1064, _1110, _1126);
        float _1136 = _1130 * _1130;
        _1088 = _1134;
        _1016 = _1132;
        _1018 = _1136;
        _972 = _1116;
        _974 = _1120;
    }
    float _1138 = _1088;
    float _1140 = _1016;
    float _1142 = _1018;
    float _1144 = _972;
    float _1146 = _974;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1072, _1054, _1040);
    float _1154 = -_1082;
    float _1156 = fma(_1062, _986, _1154);
    float _1158 = fma(_1150, _1150, _1140);
    float _1160 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1162 = _1158 + _1142;
    out.m_61.x = _1078;
    out.m_61.y = _1076;
    out.m_61.z = _1080;
    out.m_61.w = _1074;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1170 = sqrt(_1162);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1058 + 0.5;
    float _1182 = _928 + 0.5;
    float _1184 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1186 = fma(_454, _230, _1160);
    float _1188 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_63.x = _1174;
    out.m_63.y = _1176;
    out.m_63.z = _1178;
    out.m_63.w = _1172;
    float _1190 = fma(_454, _228, _1184);
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1200 = _1196 || _1198;
    float _1202 = -_1186;
    float _1204 = _612 + _1202;
    float _1206 = fma(_454, _232, _1188);
    float _1208 = -_1190;
    float _1210 = _614 + _1208;
    float _1212 = _1152 + 0.5;
    float _1214 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1216 = _1156 + 0.5;
    float _1218 = -_1206;
    float _1220 = _616 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1214);
    out.m_65.x = _1180;
    out.m_65.y = _1182;
    out.m_65.z = _1212;
    out.m_65.w = _1216;
    float _1224 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1226 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1228 = _1176;
    float _1230 = _1216;
    if (!_1200)
    {
        _1228 = 1.0;
    }
    float _1232 = _1228;
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1224);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1226);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    bool _1244 = !_1200;
    float _1246 = _1232;
    float _1248 = _1240;
    float _1250 = _1240;
    float _1252 = _1238;
    float _1254 = _1238;
    float _1256 = _1240;
    if (!_1244)
    {
        bool _1258 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1260 = isnan(_1170);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1266 = _1262 || _1264;
        if (!_1266)
        {
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = _1170 + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1274 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1272;
            float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1280 = 1.0 / _1274;
            float _1282 = _1270 * _1280;
            float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1284;
            _1286 = true;
        }
        else
        {
            bool _1288 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1290 = isnan(_1170);
            bool _1292 = _1288 || _1290;
            bool _1294 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1296 = _1292 || _1294;
            if (!_1296)
            {
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1170 + _1298;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1308 = _1306 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1310 = 1.0 / _1304;
                float _1312 = _1300 * _1310;
                float _1314 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1314;
                _1286 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1286 = false;
    float _1316 = _1246;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1320 = _1138 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1324 = _1144 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1328 = _1146 + _1326;
    float _1330 = fma(_1320, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1332 = fma(_1324, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1334 = fma(_1328, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = -_666;
    float _1338 = _1336 + _1330;
    float _1340 = -_676;
    float _1342 = _1340 + _1332;
    float _1344 = -_682;
    float _1346 = _1344 + _1334;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > 0.0;
    bool _1358 = !_1356;
    float _1360 = _1354;
    float _1362 = _1320;
    float _1364 = _1330;
    float _1366 = _1332;
    float _1368 = _1334;
    if (!_1358)
    {
        bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1372 = _1212;
        if (_1370)
        {
            float _1374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1372 = _1374;
        }
        float _1376 = _1372;
        if (_1370)
        {
            _1360 = _1242;
        }
        float _1378 = _1360;
        float _1380 = _1376;
        float _1382 = _1378;
        if (_1370)
        {
            float _1384 = _1238 * _1376;
            _1230 = _1384;
        }
        float _1386 = _1230;
        float _1388 = _1386;
        if (_1370)
        {
            float _1390 = _1240 * _1376;
            _1362 = _1390;
        }
        float _1392 = _1362;
        float _1394 = _1392;
        if (_1370)
        {
            float _1396 = _1242 * _1376;
            _1380 = _1396;
        }
        float _1398 = _1380;
        float _1400 = _1398;
        if (!_1370)
        {
            float _1402 = _112 + 1.0;
            float _1404 = _1402;
            if (!_158)
            {
                float _1406 = _1402 * _1402;
                float _1408 = _1406 * 0.5;
                _1248 = _1408;
            }
            float _1410 = _1248;
            float _1412 = _1410;
            if (!_158)
            {
                float _1414 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1412 = _1414;
            }
            float _1416 = _1412;
            bool _1418 = !_158;
            float _1420 = _1416;
            if (!_1418)
            {
                float _1422 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1424 = log2(_1422);
                float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1428 = _1426 + 1.0;
                float _1430 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1432 = _1424 * _1402;
                float _1434 = 1.0 / _1428;
                float _1436 = _1430 * 0.693147182464599609375;
                float _1438 = exp2(_1432);
                float _1440 = 1.0 / _1436;
                float _1442 = _1438 + (-1.0);
                float _1444 = -_1442;
                float _1446 = fma(_1444, _1440, _1402);
                float _1448 = _1446 * _1434;
                float _1450 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1420 = _1450;
            }
            float _1452 = _1420;
            float _1454 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1456 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1458 = !_158;
            if (!_1458)
            {
                float _1460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1462 = log2(_1460);
                float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1466 = _1464 + 1.0;
                float _1468 = 1.0 / _1466;
                float _1470 = _1462 * _1402;
                float _1472 = exp2(_1470);
                float _1474 = -_1472;
                float _1476 = _1474 + 1.0;
                float _1478 = _1476 * _1468;
                _1404 = _1478;
            }
            float _1480 = _1404;
            float _1482 = fma(_1480, _230, _1456);
            float _1484 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1486 = fma(_1480, _228, _1454);
            float _1488 = -_1186;
            float _1490 = _1488 + _1482;
            float _1492 = fma(_1480, _232, _1484);
            float _1494 = -_1190;
            float _1496 = _1494 + _1486;
            float _1498 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1500 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1502 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1504 = -_1206;
            float _1506 = _1504 + _1492;
            float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1498);
            float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1500);
            float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1502);
            float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1508);
            float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1510);
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1512);
            _1250 = _1516;
            _1252 = _1514;
            _1382 = _1518;
            _1388 = _1514;
            _1394 = _1516;
            _1400 = _1518;
        }
        float _1520 = _1250;
        float _1522 = _1252;
        float _1524 = _1382;
        float _1526 = _1388;
        float _1528 = _1394;
        float _1530 = _1400;
        float _1532 = _1520 * _1520;
        float _1534 = rsqrt(_1352);
        float _1536 = fma(_1522, _1522, _1532);
        float _1538 = fma(_1524, _1524, _1536);
        float _1540 = sqrt(_1538);
        float _1542 = _1342 * _1534;
        float _1544 = _1338 * _1534;
        float _1546 = _1346 * _1534;
        bool _1548 = _1540 > 0.0;
        bool _1550 = !_1548;
        _1254 = _1522;
        _1256 = _1520;
        if (!_1550)
        {
            float _1552 = rsqrt(_1538);
            float _1554 = _1552 * _1520;
            float _1556 = _1552 * _1522;
            float _1558 = _1552 * _1524;
            float _1560 = _1544 * _1554;
            float _1562 = fma(_1542, _1556, _1560);
            float _1564 = fma(_1546, _1558, _1562);
            float _1566 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1568 = fma(_1526, _1566, _1332);
            float _1570 = fma(_1528, _1566, _1330);
            float _1572 = fma(_1530, _1566, _1334);
            _1364 = _1570;
            _1366 = _1568;
            _1368 = _1572;
        }
    }
    float _1574 = _1364;
    float _1576 = _1366;
    float _1578 = _1368;
    float _1580 = _1254;
    float _1582 = _1256;
    float _1584 = -_792;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1588 = -_802;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1592 = -_822;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = sqrt(_1612);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1602 * _1618;
    float _1622 = _1606 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1614;
    float _1640 = _1578;
    float _1642 = _1636;
    float _1644 = _1580;
    float _1646 = _1598;
    float _1648 = _1582;
    float _1650 = _1620;
    if (_1632)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1632)
    {
        float _1656 = rsqrt(_1628);
        _1640 = _1656;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1632)
    {
        float _1662 = _1636 * _1654;
        _1642 = _1662;
    }
    float _1664 = _1642;
    if (_1632)
    {
        float _1666 = _1664 * 0.15915493667125701904296875;
        _1644 = _1666;
    }
    float _1668 = _1644;
    float _1670 = _1654;
    if (_1632)
    {
        float _1672 = _1668 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1606;
    float _1684 = _1680;
    if (_1632)
    {
        float _1686 = _1668 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = -_1618;
    float _1694 = -_1680;
    float _1696 = fma(_1598, _1692, _1694);
    if (!_1632)
    {
        _1646 = _1622;
    }
    float _1698 = _1646;
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1696 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1632)
    {
        float _1710 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1710;
    }
    float _1712 = _1648;
    float _1714 = _1712;
    if (!_1632)
    {
        _1706 = _1696;
    }
    float _1716 = _1706;
    float _1718 = _1716;
    float _1720 = _1690;
    if (_1632)
    {
        float _1722 = _1690 + (-1.0);
        _1708 = _1722;
    }
    float _1724 = _1708;
    float _1726 = _1724;
    if (_1632)
    {
        float _1728 = _1658 * _1712;
        _1714 = _1728;
    }
    float _1730 = _1714;
    if (_1632)
    {
        float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1732;
    }
    float _1734 = _1660;
    if (_1632)
    {
        float _1736 = _1620 * _1730;
        _1650 = _1736;
    }
    float _1738 = _1650;
    if (!_1632)
    {
        _1726 = _1624;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1730;
        _1700 = _1744;
    }
    float _1746 = _1700;
    if (_1632)
    {
        float _1748 = fma(_1696, _1690, _1734);
        _1718 = _1748;
    }
    float _1750 = _1718;
    if (_1632)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1632)
    {
        _1720 = _1626;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1632)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1768 = _1764 + _1762;
    float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1772 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1770);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1766);
    float _1778 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = rsqrt(_1768);
    float _1782 = -_1774;
    float _1784 = _1782 + 1.0;
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1778);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1784);
    float _1800 = log2(_1798);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1806 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1812 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1814 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1804);
    float _1816 = _1780 * _1738;
    float _1818 = -_1810;
    float _1820 = fma(_1818, _1808, 1.0);
    float _1822 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1824 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1826 = _1780 * _1750;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = _1780 * _1746;
    float _1832 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1824);
    float _1834 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1836 = -_1828;
    float _1838 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1844 = log2(_1820);
    float _1846 = -_1830;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1850 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1842);
    float _1854 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1848, -0.5, 0.5);
    float _1858 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1850);
    float _1860 = fma(_1848, 0.5, 0.5);
    float _1862 = exp2(_1840);
    float _1864 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = _1826 + 1.0;
    float _1870 = fma(_1860, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1872 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = 1.0 / _1852;
    float _1878 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1880 = fma(_1860, _1870, -0.212114393711090087890625);
    float _1882 = fma(_1860, _1880, 1.570728778839111328125);
    float _1884 = sqrt(_1856);
    float _1886 = -_1826;
    float _1888 = fma(_1862, _1868, _1886);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1896 = _1874 * _1876;
    float _1898 = _1878 * _1876;
    float _1900 = fma(_1896, 0.5, 0.5);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = _1884 * 0.636619746685028076171875;
    float _1906 = -_1882;
    float _1908 = fma(_1904, _1906, 1.0);
    float3 _4931 = float3(_1900, _1902, _1894);
    float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4931, float3(0.0), isnan(_4931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4931, float3(0.0), isnan(_4931)), level(0.0)).x;
    float3 _4942 = float3(_1900, _1902, _1894);
    float4 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4942, float3(0.0), isnan(_4942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4942, float3(0.0), isnan(_4942)), level(0.0)).xyzw;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = _1913.w;
    float2 _4959 = float2(_1908, _1892);
    float3 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1935 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1939 = exp2(_1933);
    float _1941 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1943 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _1945 = _1943 + _1852;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1878;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1852;
    float _1947 = _1945 * 0.5;
    float _1949 = -_1939;
    float _1951 = _1949 + 1.0;
    float _1953 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1947;
    out.m_67.w = _1852;
    float _1955 = _1953 * _1910;
    float _1957 = -_1953;
    float _1959 = _1957 + 1.0;
    float _1961 = _1921 * _1955;
    float _1963 = _1931 * _1955;
    float _1965 = fma(_1927, _1961, _1915);
    float _1967 = fma(_1929, _1961, _1917);
    float _1969 = _1921 * _1959;
    float _1971 = fma(_1921, _1963, _1919);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1965;
    out.m_69.y = _1967;
    out.m_69.z = _1971;
    out.m_69.w = _1969;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _98 = 0;
    if (!_92)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_102);
        out.gl_Position.z = _2027;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_49.w;
    float _108 = float(_88);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _106;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_136);
        out.gl_Position.z = _2091;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.x;
    float _140 = in.m_51.y;
    float _142 = in.m_51.z;
    float _144 = 1.0 / _108;
    float _146 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.y;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.w;
    float _162 = in.m_57.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _166 = _164 != 0;
    float _168 = _112 * _144;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = 0.0;
    float _176 = _146;
    bool _178 = _166;
    if (!_158)
    {
        float _180 = _146 * _146;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = in.m_44.x;
    float _188 = in.m_44.y;
    float _190 = in.m_44.z;
    float _192 = 0.0;
    float _194 = _184;
    if (!_158)
    {
        float _196 = _112 * _112;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    float _202 = abs(_138);
    float _204 = abs(_142);
    float _206 = precise::max(_202, _204);
    float _208 = _142;
    float _210 = _138;
    if (!_158)
    {
        float _212 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _206 >= 16.0;
    float _218 = fma(_168, 1.25, 0.75);
    float _220 = -_142;
    float _222 = fma(_218, _142, _220);
    float _224 = -_138;
    float _226 = fma(_218, _138, _224);
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    int _238 = as_type<int>(_222);
    float _240 = _214;
    if (_216)
    {
        float _242 = _142 * 0.0625;
        _208 = _242;
    }
    float _244 = _208;
    if (_216)
    {
        float _246 = _138 * 0.0625;
        _210 = _246;
    }
    float _248 = _210;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = abs(_244);
    bool _256 = _254 != 0.0;
    bool _258 = isnan(_254);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = abs(_248);
    bool _268 = _266 == 0.0;
    bool _270 = !_264;
    bool _272 = _268 && _270;
    bool _274 = false;
    if (_272)
    {
        bool _276 = as_type<int>(_248) >= 0;
        _274 = _276;
    }
    bool _278 = _274;
    if (_272)
    {
        int _280 = _278 ? 0 : 1078530011;
        _238 = _280;
    }
    int _282 = _238;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _286 = _284 != 0;
    float _288 = 0.0;
    float _290 = as_type<float>(_282);
    if (_272)
    {
        int _292 = int(0x80000000) & as_type<int>(_244);
        int _294 = _282 | _292;
        _288 = as_type<float>(_294);
    }
    float _296 = _288;
    float _298 = abs(_248);
    bool _300 = _298 == 0.0;
    bool _302 = !_158;
    int _304 = 0;
    float _306 = _296;
    float _308 = _296;
    float _310 = _148;
    if (!_302)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _146 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _146);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _330;
        _304 = as_type<int>(_324);
        _240 = _340;
    }
    float _342 = _290;
    int _344 = _304;
    float _346 = _240;
    bool _348 = !_158;
    float _350 = _342;
    int _352 = _344;
    if (!_348)
    {
        float _354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _356 = log2(_354);
        float _358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _360 = _358 + 1.0;
        float _362 = 1.0 / _360;
        float _364 = _146 * _356;
        float _366 = exp2(_364);
        float _368 = -_366;
        float _370 = _368 + 1.0;
        float _372 = _370 * _362;
        _350 = _360;
        _176 = _372;
    }
    float _374 = _350;
    float _376 = _176;
    float _378 = 0.0;
    float _380 = _374;
    if (!_158)
    {
        _378 = _112;
    }
    float _382 = _378;
    float _384 = _382;
    if (!_158)
    {
        float _386 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _380 = _386;
    }
    float _388 = _380;
    bool _390 = !_158;
    float _392 = _388;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _404 = _112 * _396;
        float _406 = 1.0 / _400;
        float _408 = _402 * 0.693147182464599609375;
        float _410 = exp2(_404);
        float _412 = 1.0 / _408;
        float _414 = _410 + (-1.0);
        float _416 = -_414;
        float _418 = fma(_416, _412, _112);
        float _420 = _418 * _406;
        float _422 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _352 = as_type<int>(_412);
        _392 = _422;
    }
    int _424 = _352;
    float _426 = _392;
    bool _428 = !_158;
    int _430 = _424;
    if (!_428)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = 1.0 / _438;
        float _442 = _112 * _434;
        float _444 = exp2(_442);
        float _446 = -_444;
        float _448 = _446 + 1.0;
        float _450 = _448 * _440;
        _430 = as_type<int>(_438);
        _384 = _450;
    }
    int _452 = _430;
    float _454 = _384;
    bool _456 = _160 > 0.5;
    bool _458 = !_264;
    bool _460 = _458 && _300;
    int _462 = _452;
    int _464 = _456 ? (-1) : 0;
    if (!_460)
    {
        float _466 = abs(_244);
        bool _468 = _466 != as_type<float>(0x7f800000u /* inf */);
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _476 = _472 || _474;
        float _478 = abs(_248);
        bool _480 = _478 == as_type<float>(0x7f800000u /* inf */);
        bool _482 = !_476;
        bool _484 = _480 && _482;
        if (_484)
        {
            _462 = 1075235812;
        }
        int _486 = _462;
        int _488 = _486;
        if (_484)
        {
            bool _490 = as_type<int>(_248) >= 0;
            _464 = _490 ? (-1) : 0;
        }
        int _492 = _464;
        if (_484)
        {
            int _494 = ~_492;
            int _496 = (_494 != 0) ? _486 : 1061752795;
            _488 = _496;
        }
        int _498 = _488;
        if (_484)
        {
            int _500 = int(0x80000000) & as_type<int>(_244);
            int _502 = _498 | _500;
            _306 = as_type<float>(_502);
        }
        float _504 = _306;
        float _506 = abs(_248);
        bool _508 = _506 == as_type<float>(0x7f800000u /* inf */);
        bool _510 = !_476;
        bool _512 = _510 && _508;
        _308 = _504;
        if (!_512)
        {
            float _514 = abs(_248);
            float _516 = abs(_244);
            float _518 = precise::max(_514, _516);
            float _520 = abs(_248);
            float _522 = abs(_244);
            float _524 = precise::min(_520, _522);
            float _526 = 1.0 / _518;
            float _528 = abs(_244);
            float _530 = abs(_248);
            bool _532 = _528 > _530;
            float _534 = _524 * _526;
            float _536 = _534 * _534;
            float _538 = _536 + 11.33538818359375;
            float _540 = fma(_536, _538, 28.84246826171875);
            float _542 = fma(_536, _540, 19.6966705322265625);
            float _544 = fma(_536, -0.82336294651031494140625, -5.674867153167724609375);
            float _546 = abs(_248);
            float _548 = abs(_244);
            float _550 = _546 + _548;
            float _552 = fma(_536, _544, -6.565555095672607421875);
            float _554 = 1.0 / _542;
            float _556 = _536 * _552;
            float _558 = _534 * _556;
            float _560 = fma(_558, _554, _534);
            int _562 = as_type<int>(_244) & int(0x80000000);
            float _564 = _560;
            _308 = _550;
            if (_532)
            {
                float _566 = -_560;
                float _568 = _566 + 1.57079637050628662109375;
                _564 = _568;
            }
            float _570 = _564;
            bool _572 = as_type<int>(_248) >= 0;
            int _574 = as_type<int>(_570);
            if (!_572)
            {
                float _576 = -_570;
                float _578 = _576 + 3.1415927410125732421875;
                _574 = as_type<int>(_578);
            }
            int _580 = _574;
            bool _582 = _550 > as_type<float>(0x7f800000u /* inf */);
            bool _584 = isnan(_550);
            bool _586 = _582 || _584;
            bool _588 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _590 = _586 || _588;
            if (!_590)
            {
                int _592 = _562 | _580;
                _308 = as_type<float>(_592);
            }
        }
    }
    float _594 = _308;
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _604 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _606 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _608 = -_148;
    float _610 = _608 + 1.0;
    float _612 = fma(_376, _230, _602);
    float _614 = fma(_376, _228, _604);
    float _616 = fma(_376, _232, _606);
    float _618 = fma(_612, _162, _188);
    float _620 = fma(_614, _162, _186);
    bool _622 = _172 > 0.5;
    float _624 = fma(_616, _162, _190);
    float _626 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _630 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = _628 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _638 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _640 = _622 ? _610 : _148;
    float _642 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _646 = _644 != 0;
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _650 = _636 * 6.283185482025146484375;
    float _652 = _598 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = _636 * 12.0;
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _638);
    float _658 = _650 * 0.15915493667125701904296875;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = fma(_594, 4.0, _654);
    float _664 = _636 * 6.0;
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _670 = _662 * 0.15915493667125701904296875;
    float _672 = -_664;
    float _674 = fma(_594, 3.0, _672);
    float _676 = _648 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _680 = _666 + _678;
    float _682 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = 0.0;
    float _686 = _640;
    if (_252)
    {
        float _688 = in.m_55.x;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = _676 + _692;
    float _696 = _680 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _682 + _698;
    float _702 = _674 * 0.15915493667125701904296875;
    float _704 = _670 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = fma(_694, _694, _696);
    float _710 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _712 = _168 * 3.1415927410125732421875;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _716 = _714 != 0;
    float _718 = fma(_700, _700, _708);
    float _720 = -_660;
    float _722 = fma(_710, 2.0, _720);
    float _724 = _702 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = in.m_53.x;
    bool _730 = _160 > 0.5;
    float _732 = _712 * 0.15915493667125701904296875;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _596 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _716 ? _640 : _148;
    float _740 = _596;
    bool _742 = _716;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _746 = _738;
    if (_286)
    {
        float _748 = in.m_55.z;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = rsqrt(_718);
    float _754 = _594 + 3.1415927410125732421875;
    out.m_59.y = _148;
    if (_252)
    {
        bool _756 = _690 > 0.5;
        _742 = _756;
    }
    bool _758 = _742;
    float _760 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_646)
    {
        _686 = _172;
    }
    float _762 = _686;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _766 = _732 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _762;
    if (_646)
    {
        _770 = _170;
    }
    float _772 = _770;
    float _774 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_166)
    {
        float _776 = _730 ? _610 : _148;
        _310 = _776;
    }
    float _778 = _310;
    float _780 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _782 = _706 + _726;
    float _784 = _754 * 0.15915493667125701904296875;
    float _786 = fma(_760, -2.0, _764);
    float _788 = _658 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _680 * _752;
    float _794 = _600 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_252)
    {
        _744 = _728;
    }
    float _796 = _744;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _800 = _798 + 2.0;
    float _802 = _694 * _752;
    float _804 = -_792;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _680);
    float _808 = _784 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = 0.0 + _768;
    float _814 = precise::clamp(_812, 0.0, 1.0);
    float _816 = -_802;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _820 = _806 * _806;
    float _822 = _700 * _752;
    float _824 = _750;
    float _826 = _796;
    if (_286)
    {
        bool _828 = _750 > 0.5;
        _178 = _828;
    }
    bool _830 = _178;
    float _832 = _680;
    if (!_646)
    {
        float _834 = in.m_55.z;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = fma(_818, _818, _820);
    float _840 = -_822;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _700);
    float _844 = fma(_790, 0.10000002384185791015625, 1.0);
    float _846 = -_140;
    float _848 = fma(_814, _140, _846);
    float _850 = fma(_842, _842, _838);
    if (!_252)
    {
        _824 = _796;
    }
    float _852 = _824;
    float _854 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = fma(_782, 0.25, 0.5);
    float _858 = _852;
    if (_252)
    {
        _826 = _728;
    }
    float _860 = _826;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _866 = fma(_856, _800, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _868 = fma(_810, 0.5, 0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _872 = _868 * _866;
    float _874 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _786);
    float _876 = sqrt(_850);
    float _878 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _880 = _872 * _870;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _884 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = fma(_880, _878, 1.0);
    float _888 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].w, _882);
    float _890 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _880);
    float _894 = _236 * _886;
    float _896 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _888);
    float _898 = fma(_890, _738, -0.5);
    float _900 = _234 * _886;
    float _902 = _836;
    int _904 = as_type<int>(_886);
    float _906 = _860;
    if (!_646)
    {
        _746 = _836;
    }
    float _908 = _746;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _912 = _752 * _876;
    float _914 = _908;
    if (_646)
    {
        _914 = _172;
    }
    float _916 = _914;
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_646)
    {
        _902 = _172;
    }
    float _920 = _902;
    float _922 = _774 * _912;
    float _924 = _854 * _912;
    float _926 = -_874;
    float _928 = fma(_896, _898, _926);
    float _930 = _922 * _892;
    float _932 = _884 * _912;
    float _934 = _924 * _910;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _900);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = _930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _944 = _932 * _936;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _940);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _952 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _942);
    float _954 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _948);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _962 = _918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _964 = _676 + _956;
    float _966 = _682 + _958;
    int _968 = as_type<int>(_948);
    float _970 = _952;
    float _972 = _964;
    float _974 = _966;
    if (_252)
    {
        float _976 = -_860;
        float _978 = _976 + 1.0;
        _968 = as_type<int>(_978);
    }
    int _980 = _968;
    float _982 = -_960;
    float _984 = fma(_954, 2.0, _982);
    float _986 = fma(_962, _778, -0.5);
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _964 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _966 + _992;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_252)
    {
        float _998 = _758 ? as_type<float>(_980) : _860;
        _858 = _998;
    }
    float _1000 = _858;
    float _1002 = _990 * _990;
    float _1004 = _994 * _994;
    float _1006 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1008 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[83].w, _996);
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1012 = _1002 + _1004;
    float _1014 = fma(_1006, _1000, -0.5);
    float _1016 = _1002;
    float _1018 = _1004;
    if (_286)
    {
        float _1020 = -_860;
        float _1022 = _1020 + 1.0;
        _904 = as_type<int>(_1022);
    }
    int _1024 = _904;
    float _1026 = _930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _780);
    float _1030 = sqrt(_1012);
    if (_286)
    {
        float _1032 = _830 ? as_type<float>(_1024) : _860;
        _906 = _1032;
    }
    float _1034 = _906;
    float _1036 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1038 = -_112;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[81].x, _984);
    float _1042 = fma(_944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1036);
    float _1044 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1048 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1050 = -_112;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _1054 = fma(_1044, _1034, -0.5);
    float _1056 = fma(_1048, -2.0, _1046);
    float _1058 = fma(_1028, _1014, _1052);
    bool _1060 = _1030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1064 = _666 + _1042;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _952);
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1082 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    if (!_1060)
    {
        _970 = _1064;
    }
    float _1084 = _970;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1030 + _1092;
        float _1096 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = rsqrt(_1012);
        float _1100 = _1094 * _1090;
        float _1102 = _1100 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = fma(_1106, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = _1098 * _1112;
        float _1116 = fma(_990, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = _1110 + (-1.0);
        float _1120 = fma(_994, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1124 = _1116 + _1122;
        float _1126 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1130 = _1120 + _1128;
        float _1132 = _1124 * _1124;
        float _1134 = fma(_1064, _1110, _1126);
        float _1136 = _1130 * _1130;
        _1088 = _1134;
        _1016 = _1132;
        _1018 = _1136;
        _972 = _1116;
        _974 = _1120;
    }
    float _1138 = _1088;
    float _1140 = _1016;
    float _1142 = _1018;
    float _1144 = _972;
    float _1146 = _974;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1072, _1054, _1040);
    float _1154 = -_1082;
    float _1156 = fma(_1062, _986, _1154);
    float _1158 = fma(_1150, _1150, _1140);
    float _1160 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1162 = _1158 + _1142;
    out.m_61.x = _1078;
    out.m_61.y = _1076;
    out.m_61.z = _1080;
    out.m_61.w = _1074;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1170 = sqrt(_1162);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1058 + 0.5;
    float _1182 = _928 + 0.5;
    float _1184 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1186 = fma(_454, _230, _1160);
    float _1188 = _426 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    out.m_63.x = _1174;
    out.m_63.y = _1176;
    out.m_63.z = _1178;
    out.m_63.w = _1172;
    float _1190 = fma(_454, _228, _1184);
    bool _1192 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1194 = isnan(_1170);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1200 = _1196 || _1198;
    float _1202 = -_1186;
    float _1204 = _612 + _1202;
    float _1206 = fma(_454, _232, _1188);
    float _1208 = -_1190;
    float _1210 = _614 + _1208;
    float _1212 = _1152 + 0.5;
    float _1214 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1216 = _1156 + 0.5;
    float _1218 = -_1206;
    float _1220 = _616 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1214);
    out.m_65.x = _1180;
    out.m_65.y = _1182;
    out.m_65.z = _1212;
    out.m_65.w = _1216;
    float _1224 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1226 = _1204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1228 = _1176;
    float _1230 = _1216;
    if (!_1200)
    {
        _1228 = 1.0;
    }
    float _1232 = _1228;
    float _1234 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1224);
    float _1236 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1226);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    bool _1244 = !_1200;
    float _1246 = _1232;
    float _1248 = _1240;
    float _1250 = _1240;
    float _1252 = _1238;
    float _1254 = _1238;
    float _1256 = _1240;
    if (!_1244)
    {
        bool _1258 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1260 = isnan(_1170);
        bool _1262 = _1258 || _1260;
        bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1266 = _1262 || _1264;
        if (!_1266)
        {
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = _1170 + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1274 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1272;
            float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1280 = 1.0 / _1274;
            float _1282 = _1270 * _1280;
            float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1284;
            _1286 = true;
        }
        else
        {
            bool _1288 = _1170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1290 = isnan(_1170);
            bool _1292 = _1288 || _1290;
            bool _1294 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1296 = _1292 || _1294;
            if (!_1296)
            {
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1170 + _1298;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1308 = _1306 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1310 = 1.0 / _1304;
                float _1312 = _1300 * _1310;
                float _1314 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1314;
                _1286 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1286 = false;
    float _1316 = _1246;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1320 = _1138 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1324 = _1144 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1328 = _1146 + _1326;
    float _1330 = fma(_1320, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1332 = fma(_1324, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1334 = fma(_1328, _1316, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = -_666;
    float _1338 = _1336 + _1330;
    float _1340 = -_676;
    float _1342 = _1340 + _1332;
    float _1344 = -_682;
    float _1346 = _1344 + _1334;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > 0.0;
    bool _1358 = !_1356;
    float _1360 = _1354;
    float _1362 = _1320;
    float _1364 = _1330;
    float _1366 = _1332;
    float _1368 = _1334;
    if (!_1358)
    {
        bool _1370 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1372 = _1212;
        if (_1370)
        {
            float _1374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1372 = _1374;
        }
        float _1376 = _1372;
        if (_1370)
        {
            _1360 = _1242;
        }
        float _1378 = _1360;
        float _1380 = _1376;
        float _1382 = _1378;
        if (_1370)
        {
            float _1384 = _1238 * _1376;
            _1230 = _1384;
        }
        float _1386 = _1230;
        float _1388 = _1386;
        if (_1370)
        {
            float _1390 = _1240 * _1376;
            _1362 = _1390;
        }
        float _1392 = _1362;
        float _1394 = _1392;
        if (_1370)
        {
            float _1396 = _1242 * _1376;
            _1380 = _1396;
        }
        float _1398 = _1380;
        float _1400 = _1398;
        if (!_1370)
        {
            float _1402 = _112 + 1.0;
            float _1404 = _1402;
            if (!_158)
            {
                float _1406 = _1402 * _1402;
                float _1408 = _1406 * 0.5;
                _1248 = _1408;
            }
            float _1410 = _1248;
            float _1412 = _1410;
            if (!_158)
            {
                float _1414 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1412 = _1414;
            }
            float _1416 = _1412;
            bool _1418 = !_158;
            float _1420 = _1416;
            if (!_1418)
            {
                float _1422 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1424 = log2(_1422);
                float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1428 = _1426 + 1.0;
                float _1430 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1432 = _1424 * _1402;
                float _1434 = 1.0 / _1428;
                float _1436 = _1430 * 0.693147182464599609375;
                float _1438 = exp2(_1432);
                float _1440 = 1.0 / _1436;
                float _1442 = _1438 + (-1.0);
                float _1444 = -_1442;
                float _1446 = fma(_1444, _1440, _1402);
                float _1448 = _1446 * _1434;
                float _1450 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1420 = _1450;
            }
            float _1452 = _1420;
            float _1454 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1456 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1458 = !_158;
            if (!_1458)
            {
                float _1460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1462 = log2(_1460);
                float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1466 = _1464 + 1.0;
                float _1468 = 1.0 / _1466;
                float _1470 = _1462 * _1402;
                float _1472 = exp2(_1470);
                float _1474 = -_1472;
                float _1476 = _1474 + 1.0;
                float _1478 = _1476 * _1468;
                _1404 = _1478;
            }
            float _1480 = _1404;
            float _1482 = fma(_1480, _230, _1456);
            float _1484 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1486 = fma(_1480, _228, _1454);
            float _1488 = -_1186;
            float _1490 = _1488 + _1482;
            float _1492 = fma(_1480, _232, _1484);
            float _1494 = -_1190;
            float _1496 = _1494 + _1486;
            float _1498 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1500 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1502 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1504 = -_1206;
            float _1506 = _1504 + _1492;
            float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1498);
            float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1500);
            float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1502);
            float _1514 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1508);
            float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1510);
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1512);
            _1250 = _1516;
            _1252 = _1514;
            _1382 = _1518;
            _1388 = _1514;
            _1394 = _1516;
            _1400 = _1518;
        }
        float _1520 = _1250;
        float _1522 = _1252;
        float _1524 = _1382;
        float _1526 = _1388;
        float _1528 = _1394;
        float _1530 = _1400;
        float _1532 = _1520 * _1520;
        float _1534 = rsqrt(_1352);
        float _1536 = fma(_1522, _1522, _1532);
        float _1538 = fma(_1524, _1524, _1536);
        float _1540 = sqrt(_1538);
        float _1542 = _1342 * _1534;
        float _1544 = _1338 * _1534;
        float _1546 = _1346 * _1534;
        bool _1548 = _1540 > 0.0;
        bool _1550 = !_1548;
        _1254 = _1522;
        _1256 = _1520;
        if (!_1550)
        {
            float _1552 = rsqrt(_1538);
            float _1554 = _1552 * _1520;
            float _1556 = _1552 * _1522;
            float _1558 = _1552 * _1524;
            float _1560 = _1544 * _1554;
            float _1562 = fma(_1542, _1556, _1560);
            float _1564 = fma(_1546, _1558, _1562);
            float _1566 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1568 = fma(_1526, _1566, _1332);
            float _1570 = fma(_1528, _1566, _1330);
            float _1572 = fma(_1530, _1566, _1334);
            _1364 = _1570;
            _1366 = _1568;
            _1368 = _1572;
        }
    }
    float _1574 = _1364;
    float _1576 = _1366;
    float _1578 = _1368;
    float _1580 = _1254;
    float _1582 = _1256;
    float _1584 = -_792;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1588 = -_802;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1592 = -_822;
    float _1594 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1598 = _1586 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1602 = _1590 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1598 * _1598;
    float _1610 = fma(_1602, _1602, _1608);
    float _1612 = fma(_1606, _1606, _1610);
    float _1614 = rsqrt(_1612);
    float _1616 = sqrt(_1612);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1602 * _1618;
    float _1622 = _1606 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1614;
    float _1640 = _1578;
    float _1642 = _1636;
    float _1644 = _1580;
    float _1646 = _1598;
    float _1648 = _1582;
    float _1650 = _1620;
    if (_1632)
    {
        float _1652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1632)
    {
        float _1656 = rsqrt(_1628);
        _1640 = _1656;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1632)
    {
        float _1662 = _1636 * _1654;
        _1642 = _1662;
    }
    float _1664 = _1642;
    if (_1632)
    {
        float _1666 = _1664 * 0.15915493667125701904296875;
        _1644 = _1666;
    }
    float _1668 = _1644;
    float _1670 = _1654;
    if (_1632)
    {
        float _1672 = _1668 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1606;
    float _1684 = _1680;
    if (_1632)
    {
        float _1686 = _1668 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        _1682 = _1688;
    }
    float _1690 = _1682;
    float _1692 = -_1618;
    float _1694 = -_1680;
    float _1696 = fma(_1598, _1692, _1694);
    if (!_1632)
    {
        _1646 = _1622;
    }
    float _1698 = _1646;
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1696 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1632)
    {
        float _1710 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1710;
    }
    float _1712 = _1648;
    float _1714 = _1712;
    if (!_1632)
    {
        _1706 = _1696;
    }
    float _1716 = _1706;
    float _1718 = _1716;
    float _1720 = _1690;
    if (_1632)
    {
        float _1722 = _1690 + (-1.0);
        _1708 = _1722;
    }
    float _1724 = _1708;
    float _1726 = _1724;
    if (_1632)
    {
        float _1728 = _1658 * _1712;
        _1714 = _1728;
    }
    float _1730 = _1714;
    if (_1632)
    {
        float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1732;
    }
    float _1734 = _1660;
    if (_1632)
    {
        float _1736 = _1620 * _1730;
        _1650 = _1736;
    }
    float _1738 = _1650;
    if (!_1632)
    {
        _1726 = _1624;
    }
    float _1740 = _1726;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1730;
        _1700 = _1744;
    }
    float _1746 = _1700;
    if (_1632)
    {
        float _1748 = fma(_1696, _1690, _1734);
        _1718 = _1748;
    }
    float _1750 = _1718;
    if (_1632)
    {
        float _1752 = _1738 * _1738;
        _1742 = _1752;
    }
    float _1754 = _1742;
    if (!_1632)
    {
        _1720 = _1626;
    }
    float _1756 = _1720;
    float _1758 = _1756;
    if (_1632)
    {
        float _1760 = _1746 * _1746;
        _1758 = _1760;
    }
    float _1762 = _1758;
    float _1764 = fma(_1750, _1750, _1754);
    float _1766 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1768 = _1764 + _1762;
    float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1772 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1770);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1766);
    float _1778 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = rsqrt(_1768);
    float _1782 = -_1774;
    float _1784 = _1782 + 1.0;
    float _1786 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1778);
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1784);
    float _1800 = log2(_1798);
    float _1802 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1792);
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1806 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1810 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1812 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1814 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1804);
    float _1816 = _1780 * _1738;
    float _1818 = -_1810;
    float _1820 = fma(_1818, _1808, 1.0);
    float _1822 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1824 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1826 = _1780 * _1750;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = _1780 * _1746;
    float _1832 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1824);
    float _1834 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1836 = -_1828;
    float _1838 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1832);
    float _1844 = log2(_1820);
    float _1846 = -_1830;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1850 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1842);
    float _1854 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1856 = fma(_1848, -0.5, 0.5);
    float _1858 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1850);
    float _1860 = fma(_1848, 0.5, 0.5);
    float _1862 = exp2(_1840);
    float _1864 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1854);
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1858);
    float _1868 = _1826 + 1.0;
    float _1870 = fma(_1860, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1872 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1864);
    float _1874 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1876 = 1.0 / _1852;
    float _1878 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1880 = fma(_1860, _1870, -0.212114393711090087890625);
    float _1882 = fma(_1860, _1880, 1.570728778839111328125);
    float _1884 = sqrt(_1856);
    float _1886 = -_1826;
    float _1888 = fma(_1862, _1868, _1886);
    float _1890 = _1844 * 0.693147182464599609375;
    float _1892 = fma(_1888, 0.5, 0.5);
    float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1896 = _1874 * _1876;
    float _1898 = _1878 * _1876;
    float _1900 = fma(_1896, 0.5, 0.5);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = _1884 * 0.636619746685028076171875;
    float _1906 = -_1882;
    float _1908 = fma(_1904, _1906, 1.0);
    float3 _4931 = float3(_1900, _1902, _1894);
    float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4931, float3(0.0), isnan(_4931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4931, float3(0.0), isnan(_4931)), level(0.0)).x;
    float3 _4942 = float3(_1900, _1902, _1894);
    float4 _1913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4942, float3(0.0), isnan(_4942)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4942, float3(0.0), isnan(_4942)), level(0.0)).xyzw;
    float _1915 = _1913.x;
    float _1917 = _1913.y;
    float _1919 = _1913.z;
    float _1921 = _1913.w;
    float2 _4959 = float2(_1908, _1892);
    float3 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4959, float2(0.0), isnan(_4959)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4959, float2(0.0), isnan(_4959)), level(0.0)).xyz;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1935 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1937 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1935);
    float _1939 = exp2(_1933);
    float _1941 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1943 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _1945 = _1943 + _1852;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1878;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1852;
    float _1947 = _1945 * 0.5;
    float _1949 = -_1939;
    float _1951 = _1949 + 1.0;
    float _1953 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1947;
    out.m_67.w = _1852;
    float _1955 = _1953 * _1910;
    float _1957 = -_1953;
    float _1959 = _1957 + 1.0;
    float _1961 = _1921 * _1955;
    float _1963 = _1931 * _1955;
    float _1965 = fma(_1927, _1961, _1915);
    float _1967 = fma(_1929, _1961, _1917);
    float _1969 = _1921 * _1959;
    float _1971 = fma(_1921, _1963, _1919);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1965;
    out.m_69.y = _1967;
    out.m_69.z = _1971;
    out.m_69.w = _1969;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

