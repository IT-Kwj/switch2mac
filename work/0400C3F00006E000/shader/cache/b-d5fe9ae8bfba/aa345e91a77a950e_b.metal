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
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
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
    bool _1148 = false;
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
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1648 = as_type<float>(_104);
        out.gl_Position.z = _1648;
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
    if (_128)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _96;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1711 = as_type<float>(_136);
        out.gl_Position.z = _1711;
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
    float _146 = in.m_53.w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_44.x;
    float _160 = in.m_44.y;
    float _162 = in.m_44.z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = _112 * _144;
    float _168 = fma(_166, 1.25, 0.75);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = abs(_138);
    float _178 = abs(_142);
    float _180 = precise::max(_176, _178);
    float _182 = -_142;
    float _184 = fma(_168, _142, _182);
    float _186 = -_138;
    float _188 = fma(_168, _138, _186);
    bool _190 = _180 >= 16.0;
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _194 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    float _196 = _180;
    float _198 = _142;
    float _200 = _138;
    float _202 = _164;
    bool _204 = _156;
    if (!_156)
    {
        float _206 = _164 * _164;
        float _208 = _206 * 0.5;
        _196 = _208;
    }
    float _210 = _196;
    float _212 = _210;
    if (!_156)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _216;
    if (_190)
    {
        float _220 = _142 * 0.0625;
        _198 = _220;
    }
    float _222 = _198;
    if (_190)
    {
        float _224 = _138 * 0.0625;
        _200 = _224;
    }
    float _226 = _200;
    float _228 = abs(_222);
    bool _230 = _228 != 0.0;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = abs(_226);
    bool _242 = _240 == 0.0;
    bool _244 = !_238;
    bool _246 = _242 && _244;
    bool _248 = !_156;
    int _250 = _238 ? (-1) : 0;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _164 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _164);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _280;
    }
    float _282 = _218;
    bool _284 = !_156;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _164 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _202 = _306;
    }
    float _308 = _202;
    float _310 = abs(_226);
    bool _312 = _310 == 0.0;
    float _314 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_246)
    {
        bool _320 = as_type<int>(_226) >= 0;
        _204 = _320;
    }
    bool _322 = _204;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = fma(_308, _170, _314);
    float _330 = fma(_308, _172, _316);
    float _332 = fma(_308, _174, _318);
    float _334 = fma(_328, _146, _158);
    int _336 = as_type<int>(_328);
    if (_246)
    {
        int _338 = _322 ? 0 : 1078530011;
        _336 = _338;
    }
    int _340 = _336;
    float _342 = fma(_330, _146, _160);
    float _344 = fma(_332, _146, _162);
    float _346 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    int _348 = _340;
    if (_246)
    {
        int _350 = int(0x80000000) & as_type<int>(_222);
        int _352 = _340 | _350;
        _286 = as_type<float>(_352);
    }
    float _354 = _286;
    bool _356 = !_238;
    bool _358 = _356 && _312;
    float _360 = _354;
    float _362 = _354;
    if (!_358)
    {
        float _364 = abs(_222);
        bool _366 = _364 != as_type<float>(0x7f800000u /* inf */);
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _374 = _370 || _372;
        float _376 = abs(_226);
        bool _378 = _376 == as_type<float>(0x7f800000u /* inf */);
        float _380 = abs(_226);
        bool _382 = _380 == as_type<float>(0x7f800000u /* inf */);
        bool _384 = !_374;
        bool _386 = _382 && _384;
        if (_386)
        {
            bool _388 = as_type<int>(_226) >= 0;
            _250 = _388 ? (-1) : 0;
        }
        int _390 = _250;
        if (_386)
        {
            _348 = 1075235812;
        }
        int _392 = _348;
        int _394 = _392;
        if (_386)
        {
            int _396 = ~_390;
            int _398 = (_396 != 0) ? _392 : 1061752795;
            _394 = _398;
        }
        int _400 = _394;
        if (_386)
        {
            int _402 = int(0x80000000) & as_type<int>(_222);
            int _404 = _400 | _402;
            _360 = as_type<float>(_404);
        }
        float _406 = _360;
        bool _408 = !_374;
        bool _410 = _408 && _378;
        _362 = _406;
        if (!_410)
        {
            float _412 = abs(_226);
            float _414 = abs(_222);
            float _416 = precise::max(_412, _414);
            float _418 = abs(_226);
            float _420 = abs(_222);
            float _422 = precise::min(_418, _420);
            float _424 = 1.0 / _416;
            float _426 = abs(_222);
            float _428 = abs(_226);
            bool _430 = _426 > _428;
            bool _432 = as_type<int>(_226) >= 0;
            float _434 = _422 * _424;
            float _436 = _434 * _434;
            float _438 = _436 + 11.33538818359375;
            float _440 = fma(_436, _438, 28.84246826171875);
            float _442 = fma(_436, _440, 19.6966705322265625);
            float _444 = fma(_436, -0.82336294651031494140625, -5.674867153167724609375);
            float _446 = fma(_436, _444, -6.565555095672607421875);
            float _448 = 1.0 / _442;
            float _450 = _436 * _446;
            float _452 = abs(_226);
            float _454 = abs(_222);
            float _456 = _452 + _454;
            int _458 = as_type<int>(_222) & int(0x80000000);
            float _460 = _434 * _450;
            bool _462 = _456 > as_type<float>(0x7f800000u /* inf */);
            bool _464 = isnan(_456);
            bool _466 = _462 || _464;
            bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _470 = _466 || _468;
            float _472 = fma(_460, _448, _434);
            float _474 = _472;
            _362 = _456;
            if (_430)
            {
                float _476 = -_472;
                float _478 = _476 + 1.57079637050628662109375;
                _474 = _478;
            }
            float _480 = _474;
            int _482 = as_type<int>(_480);
            if (!_432)
            {
                float _484 = -_480;
                float _486 = _484 + 3.1415927410125732421875;
                _482 = as_type<int>(_486);
            }
            int _488 = _482;
            if (!_470)
            {
                int _490 = _458 | _488;
                _362 = as_type<float>(_490);
            }
        }
    }
    float _492 = _362;
    float _494 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _500 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _504 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _506 = _498 * 12.0;
    float _508 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _498 * 6.0;
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _502);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _504);
    float _516 = fma(_492, 4.0, _506);
    float _518 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _520 = -_510;
    float _522 = fma(_492, 3.0, _520);
    float _524 = _512 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _526 = _516 * 0.15915493667125701904296875;
    float _528 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _522 * 0.15915493667125701904296875;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _524 + _532;
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = in.m_53.z;
    float _542 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _528 + _544;
    float _548 = _534 * _534;
    float _550 = in.m_55.w;
    float _552 = _526 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _542 + _556;
    float _560 = fma(_546, _546, _548);
    float _562 = in.m_55.x;
    float _564 = in.m_55.y;
    float _566 = _166 * 3.1415927410125732421875;
    float _568 = fma(_558, _558, _560);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    float _574 = _530 * 6.283185482025146484375;
    float _576 = sin(_574);
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = _566 * 0.15915493667125701904296875;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = _492 + 3.1415927410125732421875;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _498 * 6.283185482025146484375;
    float _596 = rsqrt(_568);
    float _598 = _588 * 0.15915493667125701904296875;
    float _600 = _594 * 0.15915493667125701904296875;
    float _602 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _606 = _604 + 2.0;
    float _608 = in.m_57.y;
    bool _610 = _550 > 0.5;
    float _612 = _554 + _576;
    float _614 = _582 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = _546 * _596;
    float _628 = _598 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _534 * _596;
    float _634 = -_618;
    float _636 = fma(_624, 2.0, _634);
    float _638 = -_626;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _642 = fma(_620, -2.0, _622);
    float _644 = -_632;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _648 = fma(_612, 0.25, 0.5);
    float _650 = in.m_57.x;
    float _652 = 0.0 + _616;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _646 * _646;
    float _658 = _558 * _596;
    float _660 = _600 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = -_140;
    float _666 = fma(_654, _140, _664);
    float _668 = fma(_640, _640, _656);
    float _670 = -_658;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _674 = fma(_648, _606, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _676 = fma(_630, 0.5, 0.5);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _680 = fma(_672, _672, _668);
    float _682 = _676 * _674;
    float _684 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _686 = _656;
    bool _688 = _580;
    float _690 = _524;
    if (_572)
    {
        float _692 = in.m_55.x;
        _686 = _692;
    }
    float _694 = _686;
    float _696 = sqrt(_680);
    float _698 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = fma(_662, 0.10000002384185791015625, 1.0);
    float _704 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _540 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _708 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _712 = _682 * _684;
    float _714 = _702;
    if (!_326)
    {
        _714 = _564;
    }
    float _716 = _714;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _716;
    if (_326)
    {
        _720 = _562;
    }
    float _722 = _720;
    float _724 = fma(_712, _710, 1.0);
    float _726 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _730 = _698;
    if (!_326)
    {
        float _732 = in.m_55.z;
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _596 * _696;
    float _738 = _194 * _724;
    float _740 = _192 * _724;
    float _742 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = _704 * _736;
    float _746 = _726 * _736;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _750 = -_608;
    float _752 = _750 + 1.0;
    float _754 = _744 * _728;
    bool _756 = _564 > 0.5;
    float _758 = _742 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _740);
    float _762 = _746 * _748;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _768 = _756 ? as_type<int>(_752) : as_type<int>(_608);
    float _770 = _758 * _760;
    float _772 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = _742;
    bool _776 = _756;
    float _778 = _740;
    float _780 = _608;
    if (!_572)
    {
        _774 = _650;
    }
    float _782 = _774;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _766);
    float _788 = _782;
    float _790 = _734;
    if (_572)
    {
        bool _792 = _694 > 0.5;
        _776 = _792;
    }
    bool _794 = _776;
    float _796 = 0.0;
    if (_586)
    {
        float _798 = in.m_55.z;
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _580 ? as_type<float>(_768) : _608;
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _806 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_572)
    {
        _778 = _782;
    }
    float _810 = _778;
    float _812 = _528 + _804;
    float _814 = _810;
    float _816 = _812;
    if (_572)
    {
        _788 = _650;
    }
    float _818 = _788;
    float _820 = fma(_772, _802, -0.5);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _824 = _542 + _806;
    float _826 = _818;
    if (!_326)
    {
        _808 = _734;
    }
    float _828 = _808;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _812 + _830;
    float _834 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _822);
    float _836 = _828;
    if (_326)
    {
        _836 = _564;
    }
    float _838 = _836;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_326)
    {
        _790 = _564;
    }
    float _842 = _790;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _824 + _844;
    float _848 = _832 * _832;
    float _850 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _852 = _846 * _846;
    float _854 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _860 = _848 + _852;
    float _862 = _848;
    if (_586)
    {
        bool _864 = _800 > 0.5;
        _688 = _864;
    }
    bool _866 = _688;
    float _868 = -_850;
    float _870 = fma(_854, _820, _868);
    out.m_59.y = _608;
    int _872 = 0;
    if (_586)
    {
        float _874 = -_818;
        float _876 = _874 + 1.0;
        _872 = as_type<int>(_876);
    }
    int _878 = _872;
    float _880 = sqrt(_860);
    float _882 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _886 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _888 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _858);
    float _890 = _722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _892 = as_type<int>(_882);
    if (_592)
    {
        float _894 = _610 ? _752 : _608;
        _780 = _894;
    }
    float _896 = _780;
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _884);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _902 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _886);
    float _904 = fma(_882, _896, -0.5);
    if (_572)
    {
        float _906 = -_818;
        float _908 = _906 + 1.0;
        _892 = as_type<int>(_908);
    }
    int _910 = _892;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _914 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _916 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _918 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].z, _902);
    float _920 = _912;
    if (_572)
    {
        float _922 = _794 ? as_type<float>(_910) : _818;
        _814 = _922;
    }
    float _924 = _814;
    float _926 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _928 = _924;
    if (_586)
    {
        float _930 = _866 ? as_type<float>(_878) : _818;
        _826 = _930;
    }
    float _932 = _826;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = fma(_926, -2.0, _912);
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _940 = fma(_914, _924, -0.5);
    float _942 = -_934;
    float _944 = fma(_890, 2.0, _942);
    float _946 = fma(_938, _932, -0.5);
    float _948 = _524 + _918;
    if (!_916)
    {
        _690 = _848;
    }
    float _950 = _690;
    float _952 = _950;
    if (!_916)
    {
        _862 = _812;
    }
    float _954 = _862;
    float _956 = _954;
    if (!_916)
    {
        _928 = _852;
    }
    float _958 = _928;
    float _960 = _958;
    if (!_916)
    {
        _816 = _824;
    }
    float _962 = _816;
    float _964 = _962;
    if (!_916)
    {
        _920 = _948;
    }
    float _966 = _920;
    bool _968 = !_916;
    float _970 = _966;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _880 + _974;
        float _978 = rsqrt(_860);
        float _980 = _976 * _972;
        float _982 = _948 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = cos(_990);
        float _994 = fma(_988, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _996 = _978 * _994;
        float _998 = _992 + (-1.0);
        float _1000 = fma(_832, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_846, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1004 = _998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1008 = _1000 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1012 = _1002 + _1010;
        float _1014 = fma(_948, _992, _1004);
        float _1016 = _1008 * _1008;
        float _1018 = _1012 * _1012;
        _970 = _1014;
        _952 = _1016;
        _960 = _1018;
        _956 = _1000;
        _964 = _1002;
    }
    float _1020 = _970;
    float _1022 = _952;
    float _1024 = _960;
    float _1026 = _956;
    float _1028 = _964;
    float _1030 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _708);
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1020 + _1032;
    float _1036 = -_112;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[76].x, _636);
    float _1040 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _888);
    float _1042 = -_112;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    float _1046 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _898);
    float _1048 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _936);
    float _1050 = fma(_1034, _1034, _1022);
    float _1052 = fma(_1030, _940, _1038);
    float _1054 = fma(_1040, _946, _1044);
    float _1056 = -_1048;
    float _1058 = fma(_1046, _904, _1056);
    float _1060 = _1050 + _1024;
    float _1062 = _870 + 0.5;
    float _1064 = sqrt(_1060);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1086 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1052 + 0.5;
    float _1096 = _1054 + 0.5;
    float _1098 = _1058 + 0.5;
    out.m_61.x = _1078;
    out.m_61.y = _1082;
    out.m_61.z = _1086;
    out.m_61.w = _1080;
    bool _1100 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1102 = isnan(_1064);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1108 = _1104 || _1106;
    out.m_63.x = _1088;
    out.m_63.y = _1090;
    out.m_63.z = _1092;
    out.m_63.w = _1084;
    out.m_65.x = _1094;
    out.m_65.y = _1062;
    out.m_65.z = _1096;
    out.m_65.w = _1098;
    float _1110 = _1060;
    float _1112 = _1082;
    if (!_1108)
    {
        _1110 = 1.0;
    }
    float _1114 = _1110;
    bool _1116 = !_1108;
    float _1118 = _1114;
    if (!_1116)
    {
        bool _1120 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1122 = isnan(_1064);
        bool _1124 = _1120 || _1122;
        bool _1126 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1128 = _1124 || _1126;
        if (!_1128)
        {
            float _1130 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1132 = _1064 + _1130;
            float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1136 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1134;
            float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1142 = 1.0 / _1136;
            float _1144 = _1132 * _1142;
            float _1146 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1118 = _1146;
            _1148 = true;
        }
        else
        {
            bool _1150 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1152 = isnan(_1064);
            bool _1154 = _1150 || _1152;
            bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1158 = _1154 || _1156;
            if (!_1158)
            {
                float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1162 = _1064 + _1160;
                float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1166 = _1164 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1172 = 1.0 / _1166;
                float _1174 = _1162 * _1172;
                float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1118 = _1176;
                _1148 = true;
            }
            else
            {
                _1118 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1148 = false;
    float _1178 = _1118;
    float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1182 = _1020 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1186 = _1026 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1190 = _1028 + _1188;
    float _1192 = fma(_1182, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = fma(_1186, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = fma(_1190, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1198 = -_632;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1202 = -_626;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1206 = -_658;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1204 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1216, _1216, _1222);
    float _1226 = fma(_1220, _1220, _1224);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1216 * _1232;
    float _1236 = _1220 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1220;
    float _1254 = _1228;
    float _1256 = _1250;
    float _1258 = _1212;
    float _1260 = _1186;
    float _1262 = _1234;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (_1246)
    {
        float _1268 = rsqrt(_1242);
        _1254 = _1268;
    }
    float _1270 = _1254;
    float _1272 = _1270;
    if (_1246)
    {
        float _1274 = _1250 * _1266;
        _1256 = _1274;
    }
    float _1276 = _1256;
    if (_1246)
    {
        float _1278 = _1276 * 0.15915493667125701904296875;
        _1112 = _1278;
    }
    float _1280 = _1112;
    float _1282 = _1266;
    if (_1246)
    {
        float _1284 = _1280 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1292 = precise::max(0.0, _1290);
    float _1294 = _1222;
    float _1296 = _1292;
    if (_1246)
    {
        float _1298 = _1280 * 6.283185482025146484375;
        float _1300 = cos(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = -_1232;
    float _1306 = -_1292;
    float _1308 = fma(_1212, _1304, _1306);
    if (!_1246)
    {
        _1258 = _1236;
    }
    float _1310 = _1258;
    float _1312 = _1310;
    if (_1246)
    {
        float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1314;
    }
    float _1316 = _1296;
    float _1318 = _1288;
    float _1320 = _1316;
    if (_1246)
    {
        float _1322 = fma(_1288, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    if (_1246)
    {
        float _1328 = _1302 + (-1.0);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _1330;
    if (_1246)
    {
        float _1334 = _1270 * _1324;
        _1260 = _1334;
    }
    float _1336 = _1260;
    if (!_1246)
    {
        _1272 = _1308;
    }
    float _1338 = _1272;
    float _1340 = _1338;
    if (_1246)
    {
        float _1342 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1342;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (_1246)
    {
        float _1348 = _1234 * _1336;
        _1262 = _1348;
    }
    float _1350 = _1262;
    if (!_1246)
    {
        _1326 = _1238;
    }
    float _1352 = _1326;
    float _1354 = _1352;
    if (_1246)
    {
        float _1356 = _1236 * _1336;
        _1312 = _1356;
    }
    float _1358 = _1312;
    if (_1246)
    {
        float _1360 = fma(_1308, _1302, _1344);
        _1340 = _1360;
    }
    float _1362 = _1340;
    if (_1246)
    {
        float _1364 = _1350 * _1350;
        _1354 = _1364;
    }
    float _1366 = _1354;
    if (!_1246)
    {
        _1346 = _1240;
    }
    float _1368 = _1346;
    float _1370 = _1368;
    if (_1246)
    {
        float _1372 = _1358 * _1358;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = _1376 + _1374;
    float _1380 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1384 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1382);
    float _1386 = precise::clamp(_1384, 0.0, 1.0);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1390 = rsqrt(_1378);
    float _1392 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1394 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = -_1386;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1392);
    float _1402 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1406 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1412 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1414 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1406);
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1418 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1410);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = abs(_1398);
    float _1424 = log2(_1422);
    float _1426 = -_1416;
    float _1428 = fma(_1426, _1388, 1.0);
    float _1430 = _1390 * _1350;
    float _1432 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1434 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1438 = _1390 * _1362;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1442 = _1390 * _1358;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = -_1440;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1448);
    float _1452 = log2(_1428);
    float _1454 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = -_1442;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1450);
    float _1460 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    float _1464 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1458, -0.5, 0.5);
    float _1468 = fma(_1458, 0.5, 0.5);
    float _1470 = 1.0 / _1462;
    float _1472 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1476 = fma(_1468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1478 = _1438 + 1.0;
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1474);
    float _1484 = fma(_1468, _1476, -0.212114393711090087890625);
    float _1486 = exp2(_1460);
    float _1488 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1490 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1482);
    float _1492 = _1452 * 0.693147182464599609375;
    float _1494 = fma(_1468, _1484, 1.570728778839111328125);
    float _1496 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1498 = sqrt(_1466);
    float _1500 = _1490 * _1470;
    float _1502 = _1496 * _1470;
    float _1504 = fma(_1500, 0.5, 0.5);
    float _1506 = fma(_1502, -0.5, 0.5);
    float _1508 = -_1438;
    float _1510 = fma(_1486, _1478, _1508);
    float _1512 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1510, 0.5, 0.5);
    float _1516 = _1498 * 0.636619746685028076171875;
    float _1518 = -_1494;
    float _1520 = fma(_1516, _1518, 1.0);
    float3 _3997 = float3(_1504, _1506, _1512);
    float _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3997, float3(0.0), isnan(_3997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3997, float3(0.0), isnan(_3997)), level(0.0)).x;
    float3 _4008 = float3(_1504, _1506, _1512);
    float4 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4008, float3(0.0), isnan(_4008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4008, float3(0.0), isnan(_4008)), level(0.0)).xyzw;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1525.w;
    float2 _4025 = float2(_1520, _1514);
    float3 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4025, float2(0.0), isnan(_4025)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4025, float2(0.0), isnan(_4025)), level(0.0)).xyz;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1547 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1549 = _1490 + _1462;
    float _1551 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1547);
    float _1553 = exp2(_1545);
    float _1555 = _1549 * 0.5;
    float _1557 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    float _1559 = _1462 * 0.5;
    float _1561 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1557);
    float _1563 = fma(_1496, -0.5, _1559);
    float _1565 = _1561 + _1462;
    out.gl_Position.x = _1490;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1561;
    out.gl_Position.w = _1462;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1553;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1567;
    out.m_67.w = _1462;
    float _1575 = _1573 * _1522;
    float _1577 = -_1573;
    float _1579 = _1577 + 1.0;
    float _1581 = _1533 * _1575;
    float _1583 = _1543 * _1575;
    float _1585 = _1533 * _1579;
    float _1587 = fma(_1539, _1581, _1527);
    float _1589 = fma(_1541, _1581, _1529);
    float _1591 = fma(_1533, _1583, _1531);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1587;
    out.m_69.y = _1589;
    out.m_69.z = _1591;
    out.m_69.w = _1585;
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
    bool _1148 = false;
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
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1648 = as_type<float>(_104);
        out.gl_Position.z = _1648;
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
    if (_128)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _96;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1711 = as_type<float>(_136);
        out.gl_Position.z = _1711;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_51.x;
    float _140 = in.m_51.y;
    float _142 = in.m_51.z;
    float _144 = 1.0 / _108;
    float _146 = in.m_53.w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_44.x;
    float _160 = in.m_44.y;
    float _162 = in.m_44.z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = _112 * _144;
    float _168 = fma(_166, 1.25, 0.75);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = abs(_138);
    float _178 = abs(_142);
    float _180 = precise::max(_176, _178);
    float _182 = -_142;
    float _184 = fma(_168, _142, _182);
    float _186 = -_138;
    float _188 = fma(_168, _138, _186);
    bool _190 = _180 >= 16.0;
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _194 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    float _196 = _180;
    float _198 = _142;
    float _200 = _138;
    float _202 = _164;
    bool _204 = _156;
    if (!_156)
    {
        float _206 = _164 * _164;
        float _208 = _206 * 0.5;
        _196 = _208;
    }
    float _210 = _196;
    float _212 = _210;
    if (!_156)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _216;
    if (_190)
    {
        float _220 = _142 * 0.0625;
        _198 = _220;
    }
    float _222 = _198;
    if (_190)
    {
        float _224 = _138 * 0.0625;
        _200 = _224;
    }
    float _226 = _200;
    float _228 = abs(_222);
    bool _230 = _228 != 0.0;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = abs(_226);
    bool _242 = _240 == 0.0;
    bool _244 = !_238;
    bool _246 = _242 && _244;
    bool _248 = !_156;
    int _250 = _238 ? (-1) : 0;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _164 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _164);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _280;
    }
    float _282 = _218;
    bool _284 = !_156;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _164 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _202 = _306;
    }
    float _308 = _202;
    float _310 = abs(_226);
    bool _312 = _310 == 0.0;
    float _314 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_246)
    {
        bool _320 = as_type<int>(_226) >= 0;
        _204 = _320;
    }
    bool _322 = _204;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = fma(_308, _170, _314);
    float _330 = fma(_308, _172, _316);
    float _332 = fma(_308, _174, _318);
    float _334 = fma(_328, _146, _158);
    int _336 = as_type<int>(_328);
    if (_246)
    {
        int _338 = _322 ? 0 : 1078530011;
        _336 = _338;
    }
    int _340 = _336;
    float _342 = fma(_330, _146, _160);
    float _344 = fma(_332, _146, _162);
    float _346 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    int _348 = _340;
    if (_246)
    {
        int _350 = int(0x80000000) & as_type<int>(_222);
        int _352 = _340 | _350;
        _286 = as_type<float>(_352);
    }
    float _354 = _286;
    bool _356 = !_238;
    bool _358 = _356 && _312;
    float _360 = _354;
    float _362 = _354;
    if (!_358)
    {
        float _364 = abs(_222);
        bool _366 = _364 != as_type<float>(0x7f800000u /* inf */);
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _374 = _370 || _372;
        float _376 = abs(_226);
        bool _378 = _376 == as_type<float>(0x7f800000u /* inf */);
        float _380 = abs(_226);
        bool _382 = _380 == as_type<float>(0x7f800000u /* inf */);
        bool _384 = !_374;
        bool _386 = _382 && _384;
        if (_386)
        {
            bool _388 = as_type<int>(_226) >= 0;
            _250 = _388 ? (-1) : 0;
        }
        int _390 = _250;
        if (_386)
        {
            _348 = 1075235812;
        }
        int _392 = _348;
        int _394 = _392;
        if (_386)
        {
            int _396 = ~_390;
            int _398 = (_396 != 0) ? _392 : 1061752795;
            _394 = _398;
        }
        int _400 = _394;
        if (_386)
        {
            int _402 = int(0x80000000) & as_type<int>(_222);
            int _404 = _400 | _402;
            _360 = as_type<float>(_404);
        }
        float _406 = _360;
        bool _408 = !_374;
        bool _410 = _408 && _378;
        _362 = _406;
        if (!_410)
        {
            float _412 = abs(_226);
            float _414 = abs(_222);
            float _416 = precise::max(_412, _414);
            float _418 = abs(_226);
            float _420 = abs(_222);
            float _422 = precise::min(_418, _420);
            float _424 = 1.0 / _416;
            float _426 = abs(_222);
            float _428 = abs(_226);
            bool _430 = _426 > _428;
            bool _432 = as_type<int>(_226) >= 0;
            float _434 = _422 * _424;
            float _436 = _434 * _434;
            float _438 = _436 + 11.33538818359375;
            float _440 = fma(_436, _438, 28.84246826171875);
            float _442 = fma(_436, _440, 19.6966705322265625);
            float _444 = fma(_436, -0.82336294651031494140625, -5.674867153167724609375);
            float _446 = fma(_436, _444, -6.565555095672607421875);
            float _448 = 1.0 / _442;
            float _450 = _436 * _446;
            float _452 = abs(_226);
            float _454 = abs(_222);
            float _456 = _452 + _454;
            int _458 = as_type<int>(_222) & int(0x80000000);
            float _460 = _434 * _450;
            bool _462 = _456 > as_type<float>(0x7f800000u /* inf */);
            bool _464 = isnan(_456);
            bool _466 = _462 || _464;
            bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _470 = _466 || _468;
            float _472 = fma(_460, _448, _434);
            float _474 = _472;
            _362 = _456;
            if (_430)
            {
                float _476 = -_472;
                float _478 = _476 + 1.57079637050628662109375;
                _474 = _478;
            }
            float _480 = _474;
            int _482 = as_type<int>(_480);
            if (!_432)
            {
                float _484 = -_480;
                float _486 = _484 + 3.1415927410125732421875;
                _482 = as_type<int>(_486);
            }
            int _488 = _482;
            if (!_470)
            {
                int _490 = _458 | _488;
                _362 = as_type<float>(_490);
            }
        }
    }
    float _492 = _362;
    float _494 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _500 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _504 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _506 = _498 * 12.0;
    float _508 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _498 * 6.0;
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _502);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _504);
    float _516 = fma(_492, 4.0, _506);
    float _518 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _520 = -_510;
    float _522 = fma(_492, 3.0, _520);
    float _524 = _512 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _526 = _516 * 0.15915493667125701904296875;
    float _528 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _522 * 0.15915493667125701904296875;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _524 + _532;
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = in.m_53.z;
    float _542 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _528 + _544;
    float _548 = _534 * _534;
    float _550 = in.m_55.w;
    float _552 = _526 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _542 + _556;
    float _560 = fma(_546, _546, _548);
    float _562 = in.m_55.x;
    float _564 = in.m_55.y;
    float _566 = _166 * 3.1415927410125732421875;
    float _568 = fma(_558, _558, _560);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    float _574 = _530 * 6.283185482025146484375;
    float _576 = sin(_574);
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = _566 * 0.15915493667125701904296875;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = _492 + 3.1415927410125732421875;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _498 * 6.283185482025146484375;
    float _596 = rsqrt(_568);
    float _598 = _588 * 0.15915493667125701904296875;
    float _600 = _594 * 0.15915493667125701904296875;
    float _602 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _606 = _604 + 2.0;
    float _608 = in.m_57.y;
    bool _610 = _550 > 0.5;
    float _612 = _554 + _576;
    float _614 = _582 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = _546 * _596;
    float _628 = _598 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _534 * _596;
    float _634 = -_618;
    float _636 = fma(_624, 2.0, _634);
    float _638 = -_626;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _642 = fma(_620, -2.0, _622);
    float _644 = -_632;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _648 = fma(_612, 0.25, 0.5);
    float _650 = in.m_57.x;
    float _652 = 0.0 + _616;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _646 * _646;
    float _658 = _558 * _596;
    float _660 = _600 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = -_140;
    float _666 = fma(_654, _140, _664);
    float _668 = fma(_640, _640, _656);
    float _670 = -_658;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _674 = fma(_648, _606, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _676 = fma(_630, 0.5, 0.5);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _680 = fma(_672, _672, _668);
    float _682 = _676 * _674;
    float _684 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _686 = _656;
    bool _688 = _580;
    float _690 = _524;
    if (_572)
    {
        float _692 = in.m_55.x;
        _686 = _692;
    }
    float _694 = _686;
    float _696 = sqrt(_680);
    float _698 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = fma(_662, 0.10000002384185791015625, 1.0);
    float _704 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _540 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _708 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _712 = _682 * _684;
    float _714 = _702;
    if (!_326)
    {
        _714 = _564;
    }
    float _716 = _714;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _716;
    if (_326)
    {
        _720 = _562;
    }
    float _722 = _720;
    float _724 = fma(_712, _710, 1.0);
    float _726 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _730 = _698;
    if (!_326)
    {
        float _732 = in.m_55.z;
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _596 * _696;
    float _738 = _194 * _724;
    float _740 = _192 * _724;
    float _742 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = _704 * _736;
    float _746 = _726 * _736;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _750 = -_608;
    float _752 = _750 + 1.0;
    float _754 = _744 * _728;
    bool _756 = _564 > 0.5;
    float _758 = _742 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _740);
    float _762 = _746 * _748;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _768 = _756 ? as_type<int>(_752) : as_type<int>(_608);
    float _770 = _758 * _760;
    float _772 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = _742;
    bool _776 = _756;
    float _778 = _740;
    float _780 = _608;
    if (!_572)
    {
        _774 = _650;
    }
    float _782 = _774;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _766);
    float _788 = _782;
    float _790 = _734;
    if (_572)
    {
        bool _792 = _694 > 0.5;
        _776 = _792;
    }
    bool _794 = _776;
    float _796 = 0.0;
    if (_586)
    {
        float _798 = in.m_55.z;
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _580 ? as_type<float>(_768) : _608;
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _806 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_572)
    {
        _778 = _782;
    }
    float _810 = _778;
    float _812 = _528 + _804;
    float _814 = _810;
    float _816 = _812;
    if (_572)
    {
        _788 = _650;
    }
    float _818 = _788;
    float _820 = fma(_772, _802, -0.5);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _824 = _542 + _806;
    float _826 = _818;
    if (!_326)
    {
        _808 = _734;
    }
    float _828 = _808;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _812 + _830;
    float _834 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _822);
    float _836 = _828;
    if (_326)
    {
        _836 = _564;
    }
    float _838 = _836;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_326)
    {
        _790 = _564;
    }
    float _842 = _790;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _824 + _844;
    float _848 = _832 * _832;
    float _850 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _852 = _846 * _846;
    float _854 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _860 = _848 + _852;
    float _862 = _848;
    if (_586)
    {
        bool _864 = _800 > 0.5;
        _688 = _864;
    }
    bool _866 = _688;
    float _868 = -_850;
    float _870 = fma(_854, _820, _868);
    out.m_59.y = _608;
    int _872 = 0;
    if (_586)
    {
        float _874 = -_818;
        float _876 = _874 + 1.0;
        _872 = as_type<int>(_876);
    }
    int _878 = _872;
    float _880 = sqrt(_860);
    float _882 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _886 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _888 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _858);
    float _890 = _722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _892 = as_type<int>(_882);
    if (_592)
    {
        float _894 = _610 ? _752 : _608;
        _780 = _894;
    }
    float _896 = _780;
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _884);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _902 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _886);
    float _904 = fma(_882, _896, -0.5);
    if (_572)
    {
        float _906 = -_818;
        float _908 = _906 + 1.0;
        _892 = as_type<int>(_908);
    }
    int _910 = _892;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _914 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _916 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _918 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].z, _902);
    float _920 = _912;
    if (_572)
    {
        float _922 = _794 ? as_type<float>(_910) : _818;
        _814 = _922;
    }
    float _924 = _814;
    float _926 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _928 = _924;
    if (_586)
    {
        float _930 = _866 ? as_type<float>(_878) : _818;
        _826 = _930;
    }
    float _932 = _826;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = fma(_926, -2.0, _912);
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _940 = fma(_914, _924, -0.5);
    float _942 = -_934;
    float _944 = fma(_890, 2.0, _942);
    float _946 = fma(_938, _932, -0.5);
    float _948 = _524 + _918;
    if (!_916)
    {
        _690 = _848;
    }
    float _950 = _690;
    float _952 = _950;
    if (!_916)
    {
        _862 = _812;
    }
    float _954 = _862;
    float _956 = _954;
    if (!_916)
    {
        _928 = _852;
    }
    float _958 = _928;
    float _960 = _958;
    if (!_916)
    {
        _816 = _824;
    }
    float _962 = _816;
    float _964 = _962;
    if (!_916)
    {
        _920 = _948;
    }
    float _966 = _920;
    bool _968 = !_916;
    float _970 = _966;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _880 + _974;
        float _978 = rsqrt(_860);
        float _980 = _976 * _972;
        float _982 = _948 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = cos(_990);
        float _994 = fma(_988, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _996 = _978 * _994;
        float _998 = _992 + (-1.0);
        float _1000 = fma(_832, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_846, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1004 = _998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1008 = _1000 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1012 = _1002 + _1010;
        float _1014 = fma(_948, _992, _1004);
        float _1016 = _1008 * _1008;
        float _1018 = _1012 * _1012;
        _970 = _1014;
        _952 = _1016;
        _960 = _1018;
        _956 = _1000;
        _964 = _1002;
    }
    float _1020 = _970;
    float _1022 = _952;
    float _1024 = _960;
    float _1026 = _956;
    float _1028 = _964;
    float _1030 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _708);
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1020 + _1032;
    float _1036 = -_112;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[76].x, _636);
    float _1040 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _888);
    float _1042 = -_112;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    float _1046 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _898);
    float _1048 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _936);
    float _1050 = fma(_1034, _1034, _1022);
    float _1052 = fma(_1030, _940, _1038);
    float _1054 = fma(_1040, _946, _1044);
    float _1056 = -_1048;
    float _1058 = fma(_1046, _904, _1056);
    float _1060 = _1050 + _1024;
    float _1062 = _870 + 0.5;
    float _1064 = sqrt(_1060);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1086 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1052 + 0.5;
    float _1096 = _1054 + 0.5;
    float _1098 = _1058 + 0.5;
    out.m_61.x = _1078;
    out.m_61.y = _1082;
    out.m_61.z = _1086;
    out.m_61.w = _1080;
    bool _1100 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1102 = isnan(_1064);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1108 = _1104 || _1106;
    out.m_63.x = _1088;
    out.m_63.y = _1090;
    out.m_63.z = _1092;
    out.m_63.w = _1084;
    out.m_65.x = _1094;
    out.m_65.y = _1062;
    out.m_65.z = _1096;
    out.m_65.w = _1098;
    float _1110 = _1060;
    float _1112 = _1082;
    if (!_1108)
    {
        _1110 = 1.0;
    }
    float _1114 = _1110;
    bool _1116 = !_1108;
    float _1118 = _1114;
    if (!_1116)
    {
        bool _1120 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1122 = isnan(_1064);
        bool _1124 = _1120 || _1122;
        bool _1126 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1128 = _1124 || _1126;
        if (!_1128)
        {
            float _1130 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1132 = _1064 + _1130;
            float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1136 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1134;
            float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1142 = 1.0 / _1136;
            float _1144 = _1132 * _1142;
            float _1146 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1118 = _1146;
            _1148 = true;
        }
        else
        {
            bool _1150 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1152 = isnan(_1064);
            bool _1154 = _1150 || _1152;
            bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1158 = _1154 || _1156;
            if (!_1158)
            {
                float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1162 = _1064 + _1160;
                float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1166 = _1164 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1172 = 1.0 / _1166;
                float _1174 = _1162 * _1172;
                float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1118 = _1176;
                _1148 = true;
            }
            else
            {
                _1118 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1148 = false;
    float _1178 = _1118;
    float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1182 = _1020 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1186 = _1026 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1190 = _1028 + _1188;
    float _1192 = fma(_1182, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = fma(_1186, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = fma(_1190, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1198 = -_632;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1202 = -_626;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1206 = -_658;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1204 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1216, _1216, _1222);
    float _1226 = fma(_1220, _1220, _1224);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1216 * _1232;
    float _1236 = _1220 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1220;
    float _1254 = _1228;
    float _1256 = _1250;
    float _1258 = _1212;
    float _1260 = _1186;
    float _1262 = _1234;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (_1246)
    {
        float _1268 = rsqrt(_1242);
        _1254 = _1268;
    }
    float _1270 = _1254;
    float _1272 = _1270;
    if (_1246)
    {
        float _1274 = _1250 * _1266;
        _1256 = _1274;
    }
    float _1276 = _1256;
    if (_1246)
    {
        float _1278 = _1276 * 0.15915493667125701904296875;
        _1112 = _1278;
    }
    float _1280 = _1112;
    float _1282 = _1266;
    if (_1246)
    {
        float _1284 = _1280 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1292 = precise::max(0.0, _1290);
    float _1294 = _1222;
    float _1296 = _1292;
    if (_1246)
    {
        float _1298 = _1280 * 6.283185482025146484375;
        float _1300 = cos(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = -_1232;
    float _1306 = -_1292;
    float _1308 = fma(_1212, _1304, _1306);
    if (!_1246)
    {
        _1258 = _1236;
    }
    float _1310 = _1258;
    float _1312 = _1310;
    if (_1246)
    {
        float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1314;
    }
    float _1316 = _1296;
    float _1318 = _1288;
    float _1320 = _1316;
    if (_1246)
    {
        float _1322 = fma(_1288, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    if (_1246)
    {
        float _1328 = _1302 + (-1.0);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _1330;
    if (_1246)
    {
        float _1334 = _1270 * _1324;
        _1260 = _1334;
    }
    float _1336 = _1260;
    if (!_1246)
    {
        _1272 = _1308;
    }
    float _1338 = _1272;
    float _1340 = _1338;
    if (_1246)
    {
        float _1342 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1342;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (_1246)
    {
        float _1348 = _1234 * _1336;
        _1262 = _1348;
    }
    float _1350 = _1262;
    if (!_1246)
    {
        _1326 = _1238;
    }
    float _1352 = _1326;
    float _1354 = _1352;
    if (_1246)
    {
        float _1356 = _1236 * _1336;
        _1312 = _1356;
    }
    float _1358 = _1312;
    if (_1246)
    {
        float _1360 = fma(_1308, _1302, _1344);
        _1340 = _1360;
    }
    float _1362 = _1340;
    if (_1246)
    {
        float _1364 = _1350 * _1350;
        _1354 = _1364;
    }
    float _1366 = _1354;
    if (!_1246)
    {
        _1346 = _1240;
    }
    float _1368 = _1346;
    float _1370 = _1368;
    if (_1246)
    {
        float _1372 = _1358 * _1358;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = _1376 + _1374;
    float _1380 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1384 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1382);
    float _1386 = precise::clamp(_1384, 0.0, 1.0);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1390 = rsqrt(_1378);
    float _1392 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1394 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = -_1386;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1392);
    float _1402 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1406 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1412 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1414 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1406);
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1418 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1410);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = abs(_1398);
    float _1424 = log2(_1422);
    float _1426 = -_1416;
    float _1428 = fma(_1426, _1388, 1.0);
    float _1430 = _1390 * _1350;
    float _1432 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1434 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1438 = _1390 * _1362;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1442 = _1390 * _1358;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = -_1440;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1448);
    float _1452 = log2(_1428);
    float _1454 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = -_1442;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1450);
    float _1460 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    float _1464 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1458, -0.5, 0.5);
    float _1468 = fma(_1458, 0.5, 0.5);
    float _1470 = 1.0 / _1462;
    float _1472 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1476 = fma(_1468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1478 = _1438 + 1.0;
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1474);
    float _1484 = fma(_1468, _1476, -0.212114393711090087890625);
    float _1486 = exp2(_1460);
    float _1488 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1490 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1482);
    float _1492 = _1452 * 0.693147182464599609375;
    float _1494 = fma(_1468, _1484, 1.570728778839111328125);
    float _1496 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1498 = sqrt(_1466);
    float _1500 = _1490 * _1470;
    float _1502 = _1496 * _1470;
    float _1504 = fma(_1500, 0.5, 0.5);
    float _1506 = fma(_1502, -0.5, 0.5);
    float _1508 = -_1438;
    float _1510 = fma(_1486, _1478, _1508);
    float _1512 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1510, 0.5, 0.5);
    float _1516 = _1498 * 0.636619746685028076171875;
    float _1518 = -_1494;
    float _1520 = fma(_1516, _1518, 1.0);
    float3 _3997 = float3(_1504, _1506, _1512);
    float _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3997, float3(0.0), isnan(_3997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3997, float3(0.0), isnan(_3997)), level(0.0)).x;
    float3 _4008 = float3(_1504, _1506, _1512);
    float4 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4008, float3(0.0), isnan(_4008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4008, float3(0.0), isnan(_4008)), level(0.0)).xyzw;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1525.w;
    float2 _4025 = float2(_1520, _1514);
    float3 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4025, float2(0.0), isnan(_4025)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4025, float2(0.0), isnan(_4025)), level(0.0)).xyz;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1547 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1549 = _1490 + _1462;
    float _1551 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1547);
    float _1553 = exp2(_1545);
    float _1555 = _1549 * 0.5;
    float _1557 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    float _1559 = _1462 * 0.5;
    float _1561 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1557);
    float _1563 = fma(_1496, -0.5, _1559);
    float _1565 = _1561 + _1462;
    out.gl_Position.x = _1490;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1561;
    out.gl_Position.w = _1462;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1553;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1567;
    out.m_67.w = _1462;
    float _1575 = _1573 * _1522;
    float _1577 = -_1573;
    float _1579 = _1577 + 1.0;
    float _1581 = _1533 * _1575;
    float _1583 = _1543 * _1575;
    float _1585 = _1533 * _1579;
    float _1587 = fma(_1539, _1581, _1527);
    float _1589 = fma(_1541, _1581, _1529);
    float _1591 = fma(_1533, _1583, _1531);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1587;
    out.m_69.y = _1589;
    out.m_69.z = _1591;
    out.m_69.w = _1585;
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
    bool _1148 = false;
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
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1648 = as_type<float>(_104);
        out.gl_Position.z = _1648;
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
    if (_128)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _96;
    if (_128)
    {
        out.m_47.x = 0.0;
    }
    int _132 = 0;
    if (_128)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1711 = as_type<float>(_136);
        out.gl_Position.z = _1711;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.x;
    float _140 = in.m_51.y;
    float _142 = in.m_51.z;
    float _144 = 1.0 / _108;
    float _146 = in.m_53.w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_44.x;
    float _160 = in.m_44.y;
    float _162 = in.m_44.z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = _112 * _144;
    float _168 = fma(_166, 1.25, 0.75);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = abs(_138);
    float _178 = abs(_142);
    float _180 = precise::max(_176, _178);
    float _182 = -_142;
    float _184 = fma(_168, _142, _182);
    float _186 = -_138;
    float _188 = fma(_168, _138, _186);
    bool _190 = _180 >= 16.0;
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[191].z, _142);
    float _194 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[191].z, _138);
    float _196 = _180;
    float _198 = _142;
    float _200 = _138;
    float _202 = _164;
    bool _204 = _156;
    if (!_156)
    {
        float _206 = _164 * _164;
        float _208 = _206 * 0.5;
        _196 = _208;
    }
    float _210 = _196;
    float _212 = _210;
    if (!_156)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    float _218 = _216;
    if (_190)
    {
        float _220 = _142 * 0.0625;
        _198 = _220;
    }
    float _222 = _198;
    if (_190)
    {
        float _224 = _138 * 0.0625;
        _200 = _224;
    }
    float _226 = _200;
    float _228 = abs(_222);
    bool _230 = _228 != 0.0;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = abs(_226);
    bool _242 = _240 == 0.0;
    bool _244 = !_238;
    bool _246 = _242 && _244;
    bool _248 = !_156;
    int _250 = _238 ? (-1) : 0;
    if (!_248)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _164 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _164);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _280;
    }
    float _282 = _218;
    bool _284 = !_156;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _164 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _202 = _306;
    }
    float _308 = _202;
    float _310 = abs(_226);
    bool _312 = _310 == 0.0;
    float _314 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_246)
    {
        bool _320 = as_type<int>(_226) >= 0;
        _204 = _320;
    }
    bool _322 = _204;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = fma(_308, _170, _314);
    float _330 = fma(_308, _172, _316);
    float _332 = fma(_308, _174, _318);
    float _334 = fma(_328, _146, _158);
    int _336 = as_type<int>(_328);
    if (_246)
    {
        int _338 = _322 ? 0 : 1078530011;
        _336 = _338;
    }
    int _340 = _336;
    float _342 = fma(_330, _146, _160);
    float _344 = fma(_332, _146, _162);
    float _346 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    int _348 = _340;
    if (_246)
    {
        int _350 = int(0x80000000) & as_type<int>(_222);
        int _352 = _340 | _350;
        _286 = as_type<float>(_352);
    }
    float _354 = _286;
    bool _356 = !_238;
    bool _358 = _356 && _312;
    float _360 = _354;
    float _362 = _354;
    if (!_358)
    {
        float _364 = abs(_222);
        bool _366 = _364 != as_type<float>(0x7f800000u /* inf */);
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _374 = _370 || _372;
        float _376 = abs(_226);
        bool _378 = _376 == as_type<float>(0x7f800000u /* inf */);
        float _380 = abs(_226);
        bool _382 = _380 == as_type<float>(0x7f800000u /* inf */);
        bool _384 = !_374;
        bool _386 = _382 && _384;
        if (_386)
        {
            bool _388 = as_type<int>(_226) >= 0;
            _250 = _388 ? (-1) : 0;
        }
        int _390 = _250;
        if (_386)
        {
            _348 = 1075235812;
        }
        int _392 = _348;
        int _394 = _392;
        if (_386)
        {
            int _396 = ~_390;
            int _398 = (_396 != 0) ? _392 : 1061752795;
            _394 = _398;
        }
        int _400 = _394;
        if (_386)
        {
            int _402 = int(0x80000000) & as_type<int>(_222);
            int _404 = _400 | _402;
            _360 = as_type<float>(_404);
        }
        float _406 = _360;
        bool _408 = !_374;
        bool _410 = _408 && _378;
        _362 = _406;
        if (!_410)
        {
            float _412 = abs(_226);
            float _414 = abs(_222);
            float _416 = precise::max(_412, _414);
            float _418 = abs(_226);
            float _420 = abs(_222);
            float _422 = precise::min(_418, _420);
            float _424 = 1.0 / _416;
            float _426 = abs(_222);
            float _428 = abs(_226);
            bool _430 = _426 > _428;
            bool _432 = as_type<int>(_226) >= 0;
            float _434 = _422 * _424;
            float _436 = _434 * _434;
            float _438 = _436 + 11.33538818359375;
            float _440 = fma(_436, _438, 28.84246826171875);
            float _442 = fma(_436, _440, 19.6966705322265625);
            float _444 = fma(_436, -0.82336294651031494140625, -5.674867153167724609375);
            float _446 = fma(_436, _444, -6.565555095672607421875);
            float _448 = 1.0 / _442;
            float _450 = _436 * _446;
            float _452 = abs(_226);
            float _454 = abs(_222);
            float _456 = _452 + _454;
            int _458 = as_type<int>(_222) & int(0x80000000);
            float _460 = _434 * _450;
            bool _462 = _456 > as_type<float>(0x7f800000u /* inf */);
            bool _464 = isnan(_456);
            bool _466 = _462 || _464;
            bool _468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _470 = _466 || _468;
            float _472 = fma(_460, _448, _434);
            float _474 = _472;
            _362 = _456;
            if (_430)
            {
                float _476 = -_472;
                float _478 = _476 + 1.57079637050628662109375;
                _474 = _478;
            }
            float _480 = _474;
            int _482 = as_type<int>(_480);
            if (!_432)
            {
                float _484 = -_480;
                float _486 = _484 + 3.1415927410125732421875;
                _482 = as_type<int>(_486);
            }
            int _488 = _482;
            if (!_470)
            {
                int _490 = _458 | _488;
                _362 = as_type<float>(_490);
            }
        }
    }
    float _492 = _362;
    float _494 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _498 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _500 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _504 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _506 = _498 * 12.0;
    float _508 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _498 * 6.0;
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _502);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _504);
    float _516 = fma(_492, 4.0, _506);
    float _518 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _520 = -_510;
    float _522 = fma(_492, 3.0, _520);
    float _524 = _512 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _526 = _516 * 0.15915493667125701904296875;
    float _528 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _522 * 0.15915493667125701904296875;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _524 + _532;
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = in.m_53.z;
    float _542 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _528 + _544;
    float _548 = _534 * _534;
    float _550 = in.m_55.w;
    float _552 = _526 * 6.283185482025146484375;
    float _554 = sin(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _542 + _556;
    float _560 = fma(_546, _546, _548);
    float _562 = in.m_55.x;
    float _564 = in.m_55.y;
    float _566 = _166 * 3.1415927410125732421875;
    float _568 = fma(_558, _558, _560);
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    float _574 = _530 * 6.283185482025146484375;
    float _576 = sin(_574);
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _580 = _578 != 0;
    float _582 = _566 * 0.15915493667125701904296875;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = _492 + 3.1415927410125732421875;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _498 * 6.283185482025146484375;
    float _596 = rsqrt(_568);
    float _598 = _588 * 0.15915493667125701904296875;
    float _600 = _594 * 0.15915493667125701904296875;
    float _602 = _538 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _606 = _604 + 2.0;
    float _608 = in.m_57.y;
    bool _610 = _550 > 0.5;
    float _612 = _554 + _576;
    float _614 = _582 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _562 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _626 = _546 * _596;
    float _628 = _598 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _534 * _596;
    float _634 = -_618;
    float _636 = fma(_624, 2.0, _634);
    float _638 = -_626;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _642 = fma(_620, -2.0, _622);
    float _644 = -_632;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _648 = fma(_612, 0.25, 0.5);
    float _650 = in.m_57.x;
    float _652 = 0.0 + _616;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = _646 * _646;
    float _658 = _558 * _596;
    float _660 = _600 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = -_140;
    float _666 = fma(_654, _140, _664);
    float _668 = fma(_640, _640, _656);
    float _670 = -_658;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _674 = fma(_648, _606, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _676 = fma(_630, 0.5, 0.5);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[191].z, _140);
    float _680 = fma(_672, _672, _668);
    float _682 = _676 * _674;
    float _684 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _686 = _656;
    bool _688 = _580;
    float _690 = _524;
    if (_572)
    {
        float _692 = in.m_55.x;
        _686 = _692;
    }
    float _694 = _686;
    float _696 = sqrt(_680);
    float _698 = _536 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _702 = fma(_662, 0.10000002384185791015625, 1.0);
    float _704 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = _540 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _708 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[78].z, _700);
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _712 = _682 * _684;
    float _714 = _702;
    if (!_326)
    {
        _714 = _564;
    }
    float _716 = _714;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _716;
    if (_326)
    {
        _720 = _562;
    }
    float _722 = _720;
    float _724 = fma(_712, _710, 1.0);
    float _726 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    float _730 = _698;
    if (!_326)
    {
        float _732 = in.m_55.z;
        _730 = _732;
    }
    float _734 = _730;
    float _736 = _596 * _696;
    float _738 = _194 * _724;
    float _740 = _192 * _724;
    float _742 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = _704 * _736;
    float _746 = _726 * _736;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _750 = -_608;
    float _752 = _750 + 1.0;
    float _754 = _744 * _728;
    bool _756 = _564 > 0.5;
    float _758 = _742 * _736;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _740);
    float _762 = _746 * _748;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _768 = _756 ? as_type<int>(_752) : as_type<int>(_608);
    float _770 = _758 * _760;
    float _772 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = _742;
    bool _776 = _756;
    float _778 = _740;
    float _780 = _608;
    if (!_572)
    {
        _774 = _650;
    }
    float _782 = _774;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _766);
    float _788 = _782;
    float _790 = _734;
    if (_572)
    {
        bool _792 = _694 > 0.5;
        _776 = _792;
    }
    bool _794 = _776;
    float _796 = 0.0;
    if (_586)
    {
        float _798 = in.m_55.z;
        _796 = _798;
    }
    float _800 = _796;
    float _802 = _580 ? as_type<float>(_768) : _608;
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _806 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_572)
    {
        _778 = _782;
    }
    float _810 = _778;
    float _812 = _528 + _804;
    float _814 = _810;
    float _816 = _812;
    if (_572)
    {
        _788 = _650;
    }
    float _818 = _788;
    float _820 = fma(_772, _802, -0.5);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _824 = _542 + _806;
    float _826 = _818;
    if (!_326)
    {
        _808 = _734;
    }
    float _828 = _808;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _812 + _830;
    float _834 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _822);
    float _836 = _828;
    if (_326)
    {
        _836 = _564;
    }
    float _838 = _836;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_326)
    {
        _790 = _564;
    }
    float _842 = _790;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _824 + _844;
    float _848 = _832 * _832;
    float _850 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _852 = _846 * _846;
    float _854 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _860 = _848 + _852;
    float _862 = _848;
    if (_586)
    {
        bool _864 = _800 > 0.5;
        _688 = _864;
    }
    bool _866 = _688;
    float _868 = -_850;
    float _870 = fma(_854, _820, _868);
    out.m_59.y = _608;
    int _872 = 0;
    if (_586)
    {
        float _874 = -_818;
        float _876 = _874 + 1.0;
        _872 = as_type<int>(_876);
    }
    int _878 = _872;
    float _880 = sqrt(_860);
    float _882 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _886 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _888 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _858);
    float _890 = _722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _892 = as_type<int>(_882);
    if (_592)
    {
        float _894 = _610 ? _752 : _608;
        _780 = _894;
    }
    float _896 = _780;
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _884);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _902 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _886);
    float _904 = fma(_882, _896, -0.5);
    if (_572)
    {
        float _906 = -_818;
        float _908 = _906 + 1.0;
        _892 = as_type<int>(_908);
    }
    int _910 = _892;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _914 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _916 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _918 = fma(_770, (*spvDescriptorSet0.vp_c10)._m0[9].z, _902);
    float _920 = _912;
    if (_572)
    {
        float _922 = _794 ? as_type<float>(_910) : _818;
        _814 = _922;
    }
    float _924 = _814;
    float _926 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _928 = _924;
    if (_586)
    {
        float _930 = _866 ? as_type<float>(_878) : _818;
        _826 = _930;
    }
    float _932 = _826;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = fma(_926, -2.0, _912);
    float _938 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _940 = fma(_914, _924, -0.5);
    float _942 = -_934;
    float _944 = fma(_890, 2.0, _942);
    float _946 = fma(_938, _932, -0.5);
    float _948 = _524 + _918;
    if (!_916)
    {
        _690 = _848;
    }
    float _950 = _690;
    float _952 = _950;
    if (!_916)
    {
        _862 = _812;
    }
    float _954 = _862;
    float _956 = _954;
    if (!_916)
    {
        _928 = _852;
    }
    float _958 = _928;
    float _960 = _958;
    if (!_916)
    {
        _816 = _824;
    }
    float _962 = _816;
    float _964 = _962;
    if (!_916)
    {
        _920 = _948;
    }
    float _966 = _920;
    bool _968 = !_916;
    float _970 = _966;
    if (!_968)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _880 + _974;
        float _978 = rsqrt(_860);
        float _980 = _976 * _972;
        float _982 = _948 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = cos(_990);
        float _994 = fma(_988, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _996 = _978 * _994;
        float _998 = _992 + (-1.0);
        float _1000 = fma(_832, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_846, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1004 = _998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1008 = _1000 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1012 = _1002 + _1010;
        float _1014 = fma(_948, _992, _1004);
        float _1016 = _1008 * _1008;
        float _1018 = _1012 * _1012;
        _970 = _1014;
        _952 = _1016;
        _960 = _1018;
        _956 = _1000;
        _964 = _1002;
    }
    float _1020 = _970;
    float _1022 = _952;
    float _1024 = _960;
    float _1026 = _956;
    float _1028 = _964;
    float _1030 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _708);
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1034 = _1020 + _1032;
    float _1036 = -_112;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[76].x, _636);
    float _1040 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _888);
    float _1042 = -_112;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _944);
    float _1046 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _898);
    float _1048 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _936);
    float _1050 = fma(_1034, _1034, _1022);
    float _1052 = fma(_1030, _940, _1038);
    float _1054 = fma(_1040, _946, _1044);
    float _1056 = -_1048;
    float _1058 = fma(_1046, _904, _1056);
    float _1060 = _1050 + _1024;
    float _1062 = _870 + 0.5;
    float _1064 = sqrt(_1060);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1082 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1086 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1052 + 0.5;
    float _1096 = _1054 + 0.5;
    float _1098 = _1058 + 0.5;
    out.m_61.x = _1078;
    out.m_61.y = _1082;
    out.m_61.z = _1086;
    out.m_61.w = _1080;
    bool _1100 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1102 = isnan(_1064);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1108 = _1104 || _1106;
    out.m_63.x = _1088;
    out.m_63.y = _1090;
    out.m_63.z = _1092;
    out.m_63.w = _1084;
    out.m_65.x = _1094;
    out.m_65.y = _1062;
    out.m_65.z = _1096;
    out.m_65.w = _1098;
    float _1110 = _1060;
    float _1112 = _1082;
    if (!_1108)
    {
        _1110 = 1.0;
    }
    float _1114 = _1110;
    bool _1116 = !_1108;
    float _1118 = _1114;
    if (!_1116)
    {
        bool _1120 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1122 = isnan(_1064);
        bool _1124 = _1120 || _1122;
        bool _1126 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1128 = _1124 || _1126;
        if (!_1128)
        {
            float _1130 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1132 = _1064 + _1130;
            float _1134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1136 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1134;
            float _1138 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1142 = 1.0 / _1136;
            float _1144 = _1132 * _1142;
            float _1146 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1118 = _1146;
            _1148 = true;
        }
        else
        {
            bool _1150 = _1064 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1152 = isnan(_1064);
            bool _1154 = _1150 || _1152;
            bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1158 = _1154 || _1156;
            if (!_1158)
            {
                float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1162 = _1064 + _1160;
                float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1166 = _1164 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1172 = 1.0 / _1166;
                float _1174 = _1162 * _1172;
                float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1118 = _1176;
                _1148 = true;
            }
            else
            {
                _1118 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1148 = false;
    float _1178 = _1118;
    float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1182 = _1020 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1186 = _1026 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1190 = _1028 + _1188;
    float _1192 = fma(_1182, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1194 = fma(_1186, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1196 = fma(_1190, _1178, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1198 = -_632;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1202 = -_626;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1194);
    float _1206 = -_658;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1212 = _1200 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1204 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1208 + _1218;
    float _1222 = _1212 * _1212;
    float _1224 = fma(_1216, _1216, _1222);
    float _1226 = fma(_1220, _1220, _1224);
    float _1228 = rsqrt(_1226);
    float _1230 = sqrt(_1226);
    float _1232 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1234 = _1216 * _1232;
    float _1236 = _1220 * _1232;
    float _1238 = _1234 * _1234;
    float _1240 = _1236 * _1236;
    float _1242 = _1238 + _1240;
    float _1244 = sqrt(_1242);
    bool _1246 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = _1244 + _1248;
    float _1252 = _1220;
    float _1254 = _1228;
    float _1256 = _1250;
    float _1258 = _1212;
    float _1260 = _1186;
    float _1262 = _1234;
    if (_1246)
    {
        float _1264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1264;
    }
    float _1266 = _1252;
    if (_1246)
    {
        float _1268 = rsqrt(_1242);
        _1254 = _1268;
    }
    float _1270 = _1254;
    float _1272 = _1270;
    if (_1246)
    {
        float _1274 = _1250 * _1266;
        _1256 = _1274;
    }
    float _1276 = _1256;
    if (_1246)
    {
        float _1278 = _1276 * 0.15915493667125701904296875;
        _1112 = _1278;
    }
    float _1280 = _1112;
    float _1282 = _1266;
    if (_1246)
    {
        float _1284 = _1280 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1292 = precise::max(0.0, _1290);
    float _1294 = _1222;
    float _1296 = _1292;
    if (_1246)
    {
        float _1298 = _1280 * 6.283185482025146484375;
        float _1300 = cos(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = -_1232;
    float _1306 = -_1292;
    float _1308 = fma(_1212, _1304, _1306);
    if (!_1246)
    {
        _1258 = _1236;
    }
    float _1310 = _1258;
    float _1312 = _1310;
    if (_1246)
    {
        float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1314;
    }
    float _1316 = _1296;
    float _1318 = _1288;
    float _1320 = _1316;
    if (_1246)
    {
        float _1322 = fma(_1288, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1318 = _1322;
    }
    float _1324 = _1318;
    float _1326 = _1324;
    if (_1246)
    {
        float _1328 = _1302 + (-1.0);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _1330;
    if (_1246)
    {
        float _1334 = _1270 * _1324;
        _1260 = _1334;
    }
    float _1336 = _1260;
    if (!_1246)
    {
        _1272 = _1308;
    }
    float _1338 = _1272;
    float _1340 = _1338;
    if (_1246)
    {
        float _1342 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1342;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (_1246)
    {
        float _1348 = _1234 * _1336;
        _1262 = _1348;
    }
    float _1350 = _1262;
    if (!_1246)
    {
        _1326 = _1238;
    }
    float _1352 = _1326;
    float _1354 = _1352;
    if (_1246)
    {
        float _1356 = _1236 * _1336;
        _1312 = _1356;
    }
    float _1358 = _1312;
    if (_1246)
    {
        float _1360 = fma(_1308, _1302, _1344);
        _1340 = _1360;
    }
    float _1362 = _1340;
    if (_1246)
    {
        float _1364 = _1350 * _1350;
        _1354 = _1364;
    }
    float _1366 = _1354;
    if (!_1246)
    {
        _1346 = _1240;
    }
    float _1368 = _1346;
    float _1370 = _1368;
    if (_1246)
    {
        float _1372 = _1358 * _1358;
        _1370 = _1372;
    }
    float _1374 = _1370;
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = _1376 + _1374;
    float _1380 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1384 = fma(_1230, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1382);
    float _1386 = precise::clamp(_1384, 0.0, 1.0);
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1390 = rsqrt(_1378);
    float _1392 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1380);
    float _1394 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1396 = -_1386;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1392);
    float _1402 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1394);
    float _1406 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1412 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1404);
    float _1414 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1406);
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1418 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1410);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = abs(_1398);
    float _1424 = log2(_1422);
    float _1426 = -_1416;
    float _1428 = fma(_1426, _1388, 1.0);
    float _1430 = _1390 * _1350;
    float _1432 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1434 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1438 = _1390 * _1362;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1442 = _1390 * _1358;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1448 = -_1440;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1448);
    float _1452 = log2(_1428);
    float _1454 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1444);
    float _1456 = -_1442;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1450);
    float _1460 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1454);
    float _1464 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1458, -0.5, 0.5);
    float _1468 = fma(_1458, 0.5, 0.5);
    float _1470 = 1.0 / _1462;
    float _1472 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1474 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1476 = fma(_1468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1478 = _1438 + 1.0;
    float _1480 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1472);
    float _1482 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1474);
    float _1484 = fma(_1468, _1476, -0.212114393711090087890625);
    float _1486 = exp2(_1460);
    float _1488 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1480);
    float _1490 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1482);
    float _1492 = _1452 * 0.693147182464599609375;
    float _1494 = fma(_1468, _1484, 1.570728778839111328125);
    float _1496 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1498 = sqrt(_1466);
    float _1500 = _1490 * _1470;
    float _1502 = _1496 * _1470;
    float _1504 = fma(_1500, 0.5, 0.5);
    float _1506 = fma(_1502, -0.5, 0.5);
    float _1508 = -_1438;
    float _1510 = fma(_1486, _1478, _1508);
    float _1512 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1514 = fma(_1510, 0.5, 0.5);
    float _1516 = _1498 * 0.636619746685028076171875;
    float _1518 = -_1494;
    float _1520 = fma(_1516, _1518, 1.0);
    float3 _3997 = float3(_1504, _1506, _1512);
    float _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3997, float3(0.0), isnan(_3997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3997, float3(0.0), isnan(_3997)), level(0.0)).x;
    float3 _4008 = float3(_1504, _1506, _1512);
    float4 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4008, float3(0.0), isnan(_4008)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4008, float3(0.0), isnan(_4008)), level(0.0)).xyzw;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1525.w;
    float2 _4025 = float2(_1520, _1514);
    float3 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4025, float2(0.0), isnan(_4025)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4025, float2(0.0), isnan(_4025)), level(0.0)).xyz;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1547 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1549 = _1490 + _1462;
    float _1551 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1547);
    float _1553 = exp2(_1545);
    float _1555 = _1549 * 0.5;
    float _1557 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1551);
    float _1559 = _1462 * 0.5;
    float _1561 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1557);
    float _1563 = fma(_1496, -0.5, _1559);
    float _1565 = _1561 + _1462;
    out.gl_Position.x = _1490;
    out.gl_Position.y = _1496;
    out.gl_Position.z = _1561;
    out.gl_Position.w = _1462;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1553;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1555;
    out.m_67.y = _1563;
    out.m_67.z = _1567;
    out.m_67.w = _1462;
    float _1575 = _1573 * _1522;
    float _1577 = -_1573;
    float _1579 = _1577 + 1.0;
    float _1581 = _1533 * _1575;
    float _1583 = _1543 * _1575;
    float _1585 = _1533 * _1579;
    float _1587 = fma(_1539, _1581, _1527);
    float _1589 = fma(_1541, _1581, _1529);
    float _1591 = fma(_1533, _1583, _1531);
    out.m_47.x = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1587;
    out.m_69.y = _1589;
    out.m_69.z = _1591;
    out.m_69.w = _1585;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

