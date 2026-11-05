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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1999 = false;
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_118);
        out.gl_Position.z = _2305;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_53.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_152);
        out.gl_Position.z = _2369;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    float _160 = 1.0 / _124;
    float _162 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_57.y;
    float _166 = in.m_59.y;
    float _168 = in.m_59.w;
    float _170 = in.m_48.x;
    float _172 = in.m_48.y;
    float _174 = in.m_48.z;
    float _176 = _128 * _160;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = abs(_154);
    float _184 = abs(_158);
    float _186 = precise::max(_182, _184);
    float _188 = -_158;
    float _190 = fma(_180, _158, _188);
    float _192 = -_154;
    float _194 = fma(_180, _154, _192);
    bool _196 = _186 >= 16.0;
    float _198 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _200 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = _162 * _178;
    float _210 = _158;
    float _212 = _154;
    int _214 = as_type<int>(_178);
    float _216 = _208;
    float _218 = _156;
    if (_196)
    {
        float _220 = _158 * 0.0625;
        _210 = _220;
    }
    float _222 = _210;
    if (_196)
    {
        float _224 = _154 * 0.0625;
        _212 = _224;
    }
    float _226 = _212;
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
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _254 = _252 != 0;
    float _256 = abs(_226);
    bool _258 = _256 == 0.0;
    bool _260 = !_250;
    int _262 = _260 ? 0 : 1;
    int _264 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _266 = _264 != 0;
    bool _268 = false;
    int _270 = _254 ? (-1) : 0;
    if (_246)
    {
        bool _272 = as_type<int>(_226) >= 0;
        _268 = _272;
    }
    bool _274 = _268;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    if (_246)
    {
        int _280 = _274 ? 0 : 1078530011;
        _214 = _280;
    }
    int _282 = _214;
    float _284 = 0.0;
    int _286 = _282;
    if (_246)
    {
        int _288 = int(0x80000000) & as_type<int>(_222);
        int _290 = _282 | _288;
        _284 = as_type<float>(_290);
    }
    float _292 = _284;
    bool _294 = !_238;
    bool _296 = _294 && _258;
    float _298 = _292;
    float _300 = _292;
    float _302 = _164;
    if (!_296)
    {
        float _304 = abs(_222);
        bool _306 = _304 != as_type<float>(0x7f800000u /* inf */);
        bool _308 = isnan(_304);
        bool _310 = _306 || _308;
        bool _312 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _314 = _310 || _312;
        float _316 = abs(_226);
        bool _318 = _316 == as_type<float>(0x7f800000u /* inf */);
        float _320 = abs(_226);
        bool _322 = _320 == as_type<float>(0x7f800000u /* inf */);
        bool _324 = !_314;
        bool _326 = _322 && _324;
        if (_326)
        {
            bool _328 = as_type<int>(_226) >= 0;
            _270 = _328 ? (-1) : 0;
        }
        int _330 = _270;
        if (_326)
        {
            _286 = 1075235812;
        }
        int _332 = _286;
        int _334 = _332;
        if (_326)
        {
            int _336 = ~_330;
            int _338 = (_336 != 0) ? _332 : 1061752795;
            _334 = _338;
        }
        int _340 = _334;
        if (_326)
        {
            int _342 = int(0x80000000) & as_type<int>(_222);
            int _344 = _340 | _342;
            _298 = as_type<float>(_344);
        }
        float _346 = _298;
        bool _348 = !_314;
        bool _350 = _348 && _318;
        _300 = _346;
        if (!_350)
        {
            float _352 = abs(_226);
            float _354 = abs(_222);
            float _356 = precise::max(_352, _354);
            float _358 = abs(_226);
            float _360 = abs(_222);
            float _362 = precise::min(_358, _360);
            float _364 = 1.0 / _356;
            float _366 = abs(_222);
            float _368 = abs(_226);
            bool _370 = _366 > _368;
            bool _372 = as_type<int>(_226) >= 0;
            float _374 = _362 * _364;
            float _376 = _374 * _374;
            float _378 = _376 + 11.33538818359375;
            float _380 = fma(_376, _378, 28.84246826171875);
            float _382 = fma(_376, _380, 19.6966705322265625);
            float _384 = fma(_376, -0.82336294651031494140625, -5.674867153167724609375);
            float _386 = abs(_226);
            float _388 = abs(_222);
            float _390 = _386 + _388;
            int _392 = as_type<int>(_222) & int(0x80000000);
            float _394 = fma(_376, _384, -6.565555095672607421875);
            float _396 = 1.0 / _382;
            bool _398 = _390 > as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_390);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = _376 * _394;
            float _410 = _374 * _408;
            float _412 = fma(_410, _396, _374);
            float _414 = _412;
            _300 = _390;
            if (_370)
            {
                float _416 = -_412;
                float _418 = _416 + 1.57079637050628662109375;
                _414 = _418;
            }
            float _420 = _414;
            int _422 = as_type<int>(_420);
            if (!_372)
            {
                float _424 = -_420;
                float _426 = _424 + 3.1415927410125732421875;
                _422 = as_type<int>(_426);
            }
            int _428 = _422;
            if (!_406)
            {
                int _430 = _392 | _428;
                _300 = as_type<float>(_430);
            }
        }
    }
    float _432 = _300;
    float _434 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = -_164;
    float _442 = _440 + 1.0;
    float _444 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _446 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _448 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    bool _450 = _166 > 0.5;
    float _452 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
    float _454 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
    float _456 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _462 = _450 ? as_type<int>(_442) : as_type<int>(_164);
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _460 + _466;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _458 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _464 + _478;
    float _482 = _468 * _468;
    float _484 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _486 = in.m_59.x;
    bool _488 = _168 > 0.5;
    float _490 = fma(_476, _476, _482);
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _494 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = fma(_480, _480, _490);
    float _500 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = in.m_57.x;
    float _504 = _492 * 12.0;
    float _506 = rsqrt(_498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _518 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _528 = _526 != 0;
    float _530 = _492 * 6.0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _534 = _532 != 0;
    float _536 = fma(_432, 4.0, _504);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    out.m_63.x = _518;
    out.m_63.y = _522;
    out.m_63.z = _524;
    out.m_63.w = _520;
    float _542 = -_530;
    float _544 = fma(_432, 3.0, _542);
    float _546 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _548 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _552 = _176 * 3.1415927410125732421875;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _536 * 0.15915493667125701904296875;
    float _558 = _544 * 0.15915493667125701904296875;
    float _560 = fma(_546, -2.0, _550);
    float _562 = -_554;
    float _564 = fma(_548, 2.0, _562);
    float _566 = _552 * 0.15915493667125701904296875;
    float _568 = _468 * _506;
    float _570 = _476 * _506;
    float _572 = 0.0;
    bool _574 = _540;
    bool _576 = _528;
    float _578 = _570;
    if (_534)
    {
        float _580 = in.m_59.z;
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_568;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _476);
    float _592 = _528 ? as_type<float>(_462) : _164;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _586 * _586;
    float _600 = _480 * _506;
    float _602 = _590;
    if (_540)
    {
        float _604 = _488 ? _442 : _164;
        _302 = _604;
    }
    float _606 = _302;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_590, _590, _598);
    float _612 = _432 + 3.1415927410125732421875;
    float _614 = _608;
    if (!_514)
    {
        _602 = _502;
    }
    float _616 = _602;
    float _618 = _558 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = _492 * 6.283185482025146484375;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _626 = _616;
    if (!_472)
    {
        float _628 = in.m_59.z;
        _624 = _628;
    }
    float _630 = _624;
    float _632 = -_600;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _636 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _638 = _612 * 0.15915493667125701904296875;
    if (!_514)
    {
        _614 = _616;
    }
    float _640 = _614;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = _566 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _640;
    if (_514)
    {
        _626 = _502;
    }
    float _650 = _626;
    float _652 = fma(_634, _634, _610);
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[20].x, _208);
    float _656 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650;
    if (!_472)
    {
        _216 = _166;
    }
    float _660 = _216;
    float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _664 = _596 + _620;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _668 = _666 + 2.0;
    float _670 = _660;
    if (_514)
    {
        bool _672 = _486 > 0.5;
        _574 = _672;
    }
    bool _674 = _574;
    float _676 = fma(_664, 0.25, 0.5);
    if (_472)
    {
        _670 = _486;
    }
    float _678 = _670;
    float _680 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = 0.0 + _646;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    if (_534)
    {
        bool _690 = _582 > 0.5;
        _576 = _690;
    }
    bool _692 = _576;
    int _694 = 0;
    if (_534)
    {
        float _696 = -_650;
        float _698 = _696 + 1.0;
        _694 = as_type<int>(_698);
    }
    int _700 = _694;
    float _702 = -_156;
    float _704 = fma(_688, _156, _702);
    float _706 = -_128;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _564);
    float _710 = _642 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _716 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _722 = fma(_714, _592, -0.5);
    float _724 = _630;
    if (!_472)
    {
        _218 = _630;
    }
    float _726 = _218;
    float _728 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _730 = sqrt(_652);
    float _732 = fma(_684, 0.5, 0.5);
    float _734 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _736 = _726;
    if (_472)
    {
        _736 = _166;
    }
    float _738 = _736;
    float _740 = _732 * _716;
    if (_472)
    {
        _724 = _166;
    }
    float _742 = _724;
    float _744 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _746 = fma(_712, 0.10000002384185791015625, 1.0);
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _750 = _740 * _744;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _754 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _560);
    float _756 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = _506 * _730;
    float _762 = fma(_750, _752, 1.0);
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _766 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _768 = _734 * _760;
    float _770 = _656 * _760;
    float _772 = _680 * _760;
    float _774 = _200 * _762;
    float _776 = _198 * _762;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _780 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _774);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _776);
    float _786 = _770 * _778;
    float _788 = -_754;
    float _790 = fma(_780, _722, _788);
    float _792 = _768 * _782;
    float _794 = _772 * _784;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _814 = fma(_800, _606, -0.5);
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _808);
    float _818 = _458 + _810;
    float _820 = _464 + _812;
    int _822 = as_type<int>(_758);
    float _824 = _818;
    float _826 = _820;
    if (_514)
    {
        float _828 = -_650;
        float _830 = _828 + 1.0;
        _822 = as_type<int>(_830);
    }
    int _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _818 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _820 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _836 * _836;
    float _846 = _840 * _840;
    float _848 = _844;
    float _850 = _846;
    if (_514)
    {
        float _852 = _674 ? as_type<float>(_832) : _650;
        _648 = _852;
    }
    float _854 = _648;
    float _856 = -_842;
    float _858 = fma(_756, 2.0, _856);
    float _860 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _862 = _844 + _846;
    if (_534)
    {
        float _864 = _692 ? as_type<float>(_700) : _650;
        _658 = _864;
    }
    float _866 = _658;
    float _868 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _870 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _872 = sqrt(_862);
    float _874 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = fma(_868, _854, -0.5);
    float _878 = fma(_870, _866, -0.5);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    bool _890 = _750 != 0.0;
    bool _892 = isnan(_750);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_860, -2.0, _880);
    float _902 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    float _904 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _906 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _766);
    float _908 = -_128;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _858);
    float _912 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _816);
    float _914 = _460 + _904;
    float _916 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    bool _918 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = fma(_902, _876, _708);
    bool _922 = _774 == 0.0;
    bool _924 = !_898;
    bool _926 = _922 && _924;
    float _928 = fma(_906, _878, _910);
    float _930 = -_916;
    float _932 = fma(_912, _814, _930);
    bool _934 = _776 == 0.0;
    bool _936 = _934 && _926;
    if (!_918)
    {
        _146 = _914;
    }
    float _938 = _146;
    bool _940 = !_918;
    float _942 = _938;
    float _944 = _884;
    float _946 = _882;
    float _948 = _886;
    if (!_940)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_862);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = fma(_966, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _974 = _958 * _972;
        float _976 = fma(_836, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = _970 + (-1.0);
        float _980 = fma(_840, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _984 = _976 + _982;
        float _986 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _990 = _980 + _988;
        float _992 = _984 * _984;
        float _994 = fma(_914, _970, _986);
        float _996 = _990 * _990;
        _942 = _994;
        _848 = _992;
        _850 = _996;
        _824 = _976;
        _826 = _980;
    }
    float _998 = _942;
    float _1000 = _848;
    float _1002 = _850;
    float _1004 = _824;
    float _1006 = _826;
    if (!_936)
    {
        float _1008 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _944 = _1008;
    }
    float _1010 = _944;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _998 + _1012;
    float _1016 = floor(_654);
    if (!_936)
    {
        float _1018 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _946 = _1018;
    }
    float _1020 = _946;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1014, _1014, _1000);
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = _1024 + _1002;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    if (!_936)
    {
        float _1038 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _886);
        _948 = _1038;
    }
    float _1040 = _948;
    float _1042 = sqrt(_1032);
    float _1044 = _790 + 0.5;
    float _1046 = -_1016;
    float _1048 = _654 + _1046;
    float _1050 = _654 * 6.283185482025146484375;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1056 = _1050 * 0.15915493667125701904296875;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1034);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1056 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _920 + 0.5;
    float _1078 = _928 + 0.5;
    float _1080 = _932 + 0.5;
    float _1082 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    out.m_67.x = _1066;
    out.m_67.y = _1072;
    out.m_67.z = _1074;
    out.m_67.w = _1064;
    int _1084 = abs(_262);
    out.m_69.x = _1076;
    out.m_69.y = _1044;
    out.m_69.z = _1078;
    out.m_69.w = _1080;
    bool _1086 = !_266;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -_1048;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1094 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1096 = isnan(_1042);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1102 = _1098 || _1100;
    out.m_71.x = _1060;
    out.m_71.y = _1062;
    out.m_71.z = _1082;
    float _1104 = float(_1084);
    float _1106 = fma(_1070, 0.5, 0.5);
    int _1108 = abs(_1088);
    int _1110 = abs(_278);
    float _1112 = abs(_1092);
    float _1114 = _1104 * _1112;
    bool _1116 = _1048 < 0.5;
    float _1118 = float(_1116);
    float _1120 = -_1106;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1124 = float(_1108);
    float _1126 = float(_1110);
    float _1128 = -_1118;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1132 = fma(_1124, _1122, _1114);
    float _1134 = _1124;
    float _1136 = _1066;
    float _1138 = _1106;
    if (!_1102)
    {
        _1134 = 1.0;
    }
    float _1140 = _1134;
    float _1142 = abs(_1130);
    float _1144 = fma(_1126, _1142, _1132);
    bool _1146 = !_1102;
    float _1148 = _1140;
    if (!_1146)
    {
        bool _1150 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1042);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1042 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1136 = _1170;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1042);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1042 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1136 = _1200;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _1136;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _998 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _1004 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _1006 + _1220;
    float _1224 = -_570;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _1228 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1230 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1232 = fma(_1222, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = -_568;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1238 = -_570;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_600;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_600;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1236 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1240 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1244 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1268 = fma(_1260, _1260, _1264);
    float _1270 = rsqrt(_1268);
    float _1272 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1260 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1270;
    float _1294 = _1290;
    float _1296 = _1210;
    float _1298 = _1252;
    float _1300 = _1276;
    if (_1286)
    {
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1302;
    }
    float _1304 = _1292;
    if (_1286)
    {
        float _1306 = rsqrt(_1282);
        _1138 = _1306;
    }
    float _1308 = _1138;
    float _1310 = _1308;
    if (_1286)
    {
        float _1312 = _1290 * _1304;
        _1294 = _1312;
    }
    float _1314 = _1294;
    if (_1286)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1296 = _1316;
    }
    float _1318 = _1296;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = _1260;
    float _1324 = _1318;
    if (_1286)
    {
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = precise::max(0.0, _1320);
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1286)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = -_1272;
    float _1344 = -_1332;
    float _1346 = fma(_1252, _1342, _1344);
    float _1348 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1350 = _1346;
    if (_1286)
    {
        float _1352 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1352;
    }
    float _1354 = _1298;
    float _1356 = floor(_1348);
    float _1358 = _1330;
    float _1360 = _1354;
    if (_1286)
    {
        float _1362 = fma(_1330, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1286)
    {
        _1360 = _1274;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1308 * _1364;
        _1310 = _1372;
    }
    float _1374 = _1310;
    if (!_1286)
    {
        _1366 = _1278;
    }
    float _1376 = _1366;
    float _1378 = _1376;
    float _1380 = _1340;
    if (_1286)
    {
        float _1382 = _1340 + (-1.0);
        _578 = _1382;
    }
    float _1384 = _578;
    if (_1286)
    {
        float _1386 = _1274 * _1374;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1286)
    {
        float _1390 = _1276 * _1374;
        _1300 = _1390;
    }
    float _1392 = _1300;
    if (_1286)
    {
        float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1394;
    }
    float _1396 = _1324;
    if (_1286)
    {
        float _1398 = _1388 * _1388;
        _1378 = _1398;
    }
    float _1400 = _1378;
    float _1402 = sqrt(_1268);
    float _1404 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1286)
    {
        float _1406 = fma(_1346, _1340, _1396);
        _1350 = _1406;
    }
    float _1408 = _1350;
    if (!_1286)
    {
        _1380 = _1280;
    }
    float _1410 = _1380;
    float _1412 = _1410;
    if (_1286)
    {
        float _1414 = _1392 * _1392;
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1420 = fma(_1408, _1408, _1400);
    float _1422 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1426 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1428 = _1420 + _1416;
    float _1430 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1426);
    float _1438 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1440 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1444 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1442);
    float _1446 = precise::clamp(_1444, 0.0, 1.0);
    float _1448 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = rsqrt(_1428);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = -_1446;
    float _1460 = _1458 + 1.0;
    float _1462 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1468 = floor(_1418);
    float _1470 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1472 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1464);
    float _1474 = -_1466;
    float _1476 = fma(_1474, _1266, 1.0);
    float _1478 = -_1356;
    float _1480 = _1348 + _1478;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1472);
    float _1486 = abs(_1460);
    float _1488 = log2(_1486);
    float _1490 = _1450 * _1388;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1494 = _1450 * _1408;
    float _1496 = _1450 * _1392;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = 1.0 / _1492;
    float _1504 = -_1498;
    float _1506 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1504);
    float _1508 = -_1468;
    float _1510 = _1418 + _1508;
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1514 = -_1496;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1506);
    float _1518 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1512);
    float _1522 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1524 = fma(_1516, -0.5, 0.5);
    float _1526 = log2(_1476);
    float _1528 = fma(_1516, 0.5, 0.5);
    float _1530 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1532 = _1494 + 1.0;
    float _1534 = fma(_1528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1536 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1530);
    float _1538 = exp2(_1522);
    float _1540 = fma(_1528, _1534, -0.212114393711090087890625);
    float _1542 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1544 = fma(_1528, _1540, 1.570728778839111328125);
    float _1546 = _1520 * _1502;
    float _1548 = sqrt(_1524);
    float _1550 = _1526 * 0.693147182464599609375;
    float _1552 = fma(_1546, 0.5, 0.5);
    float _1554 = -_1494;
    float _1556 = fma(_1538, _1532, _1554);
    float _1558 = _1542 * _1502;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1562 = fma(_1556, 0.5, 0.5);
    float _1564 = fma(_1558, -0.5, 0.5);
    float _1566 = _1548 * 0.636619746685028076171875;
    float2 _4706 = float2(_1480, _1510);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4706, float2(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4706, float2(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1552, _1564, _1560);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).x;
    float3 _4728 = float3(_1552, _1564, _1560);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4728, float3(0.0), isnan(_4728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4728, float3(0.0), isnan(_4728)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float _1583 = -_1544;
    float _1585 = fma(_1566, _1583, 1.0);
    float2 _4749 = float2(_1585, _1562);
    float3 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = -_568;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _1601 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1603);
    float _1609 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1611 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1613 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1615 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1619 = 1.0 / _1615;
    float _1621 = _1617 + _1615;
    float _1623 = _1621 * _1619;
    float _1625 = _1623 * 0.5;
    float _1627 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    float _1633 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1635 = _1492 * 0.5;
    float _1637 = 1.0 / _1631;
    float _1639 = fma(_1542, -0.5, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1653 = _1637 * _1651;
    float _1655 = abs(_1653);
    float _1657 = log2(_1655);
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1661 = _1492;
    if (_1649)
    {
        _1659 = 1.0;
    }
    float _1663 = _1659;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1667 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1633);
    float _1669 = _1520 + _1492;
    float _1671 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1673 = exp2(_1665);
    float _1675 = _1669 * 0.5;
    float _1677 = _1671 + _1492;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1542;
    out.gl_Position.z = _1671;
    out.gl_Position.w = _1492;
    float _1679 = _1677 * 0.5;
    out.m_73.x = _1675;
    out.m_73.y = _1639;
    out.m_73.z = _1679;
    out.m_73.w = _1492;
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = in.m_75.x;
    float _1687 = exp2(_1601);
    float _1689 = fma(_1683, -2.0, 3.0);
    float _1691 = _1683 * _1683;
    bool _1693 = _1653 <= 8000.0;
    bool _1695 = isnan(_1653);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(8000.0);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1691 * _1689;
    float _1707 = -_1705;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1705);
    float _1713 = _1703 * _1711;
    float _1715 = _1711;
    float _1717 = _1663;
    if (_1649)
    {
        _1715 = 1.0;
    }
    float _1719 = _1715;
    float _1721 = _1719;
    float _1723 = _1581;
    float _1725 = _1579;
    if (!_1649)
    {
        float _1727 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = _1727 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1737;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1731;
        float _1763 = 1.0 / _1759;
        float _1765 = _1757 * _1763;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = fma(_1653, _1765, _1767);
        float _1771 = _1769 * _1761;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1721 = _1773;
        _1661 = _1759;
    }
    float _1775 = _1721;
    float _1777 = _1661;
    float _1779 = _1777;
    if (!_1649)
    {
        float _1781 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1783 = _1781 * 0.15915493667125701904296875;
        float _1785 = _1783 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1783 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1787;
        float _1799 = _1791 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1791 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1809;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1813;
        float _1817 = 1.0 / _1815;
        float _1819 = _1807 * _1811;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1823 = fma(_1653, _1819, _1821);
        float _1825 = _1823 * _1817;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = -_1827;
        float _1831 = _1829 + 1.0;
        _1717 = _1831;
        _1779 = _1815;
    }
    float _1833 = _1717;
    float _1835 = _1779;
    float _1837 = -_1687;
    float _1839 = _1837 + 1.0;
    float _1841 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1843 = -_1568;
    float _1845 = _1843 + 1.0;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1849 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1402);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = _1845 * _1841;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = _1847 * _1570;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = -_1861;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1873 = _1581 * _1863;
    float _1875 = _1595 * _1863;
    float _1877 = _1871 * _1685;
    float _1879 = _1581 * _1867;
    float _1881 = fma(_1591, _1873, _1575);
    float _1883 = fma(_1593, _1873, _1577);
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1887 = fma(_1581, _1875, _1579);
    float _1889 = _1775 * _1833;
    float _1891 = _1835;
    float _1893 = _1867;
    float _1895 = _1889;
    float _1897 = _1861;
    if (!_1857)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1899 = _1723;
    out.m_77.x = _1885;
    float _1901 = _1144 * _1889;
    float _1903 = _1899;
    float _1905 = _1899;
    if (!_1857)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1907 = _1891;
    out.m_79.x = _1881;
    out.m_79.y = _1883;
    out.m_79.z = _1887;
    out.m_79.w = _1879;
    float _1909 = _1907;
    float _1911 = _1907;
    if (!_1857)
    {
        _1725 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1725;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1857)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1893;
    float _1921 = _1919;
    float _1923 = _1919;
    if (!_1857)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1925 = _1895;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1857)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1931 = _1897;
    bool _1933 = !_1857;
    float _1935 = _1931;
    float _1937 = _1931;
    if (!_1933)
    {
        bool _1939 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1941 = isnan(_1402);
        bool _1943 = _1939 || _1941;
        bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1947 = _1943 || _1945;
        if (!_1947)
        {
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = _1402 + _1949;
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1953;
            float _1957 = 1.0 / _1955;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1951 * _1957;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1977, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1993 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1995 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1997 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1991;
            _1929 = _1995;
            _1905 = _1989;
            _1923 = _1993;
            _1917 = _1987;
            _1937 = _1997;
            _1999 = true;
        }
        else
        {
            bool _2001 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2003 = isnan(_1402);
            bool _2005 = _2001 || _2003;
            bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2009 = _2005 || _2007;
            if (!_2009)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2011 = _1903;
            _1905 = _2011;
            if (!_2009)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2013 = _1909;
            _1911 = _2013;
            if (!_2009)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2015 = _1915;
            _1917 = _2015;
            if (!_2009)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2017 = _1921;
            _1923 = _2017;
            if (!_2009)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2019 = _1927;
            _1929 = _2019;
            if (!_2009)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2021 = _1935;
            bool _2023 = !_2009;
            _1937 = _2021;
            if (!_2023)
            {
                bool _2025 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2027 = isnan(_1402);
                bool _2029 = _2025 || _2027;
                bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2033 = _2029 || _2031;
                if (!_2033)
                {
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = _1402 + _2035;
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2039;
                    float _2043 = 1.0 / _2041;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2037 * _2043;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2063, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2079 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2081 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2083 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2077;
                    _1929 = _2081;
                    _1905 = _2075;
                    _1923 = _2079;
                    _1917 = _2073;
                    _1937 = _2083;
                    _1999 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1999 = false;
    float _2085 = _1911;
    float _2087 = _1929;
    float _2089 = _1905;
    float _2091 = _1923;
    float _2093 = _1917;
    float _2095 = _1937;
    float _2097 = fma(_1062, -0.5, 0.5);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = _1901 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    out.m_81.x = 0.0;
    float _2111 = fma(_2099, _2103, _2085);
    float _2113 = -_2093;
    float _2115 = _2113 + _2095;
    out.m_51.x = _2105;
    float _2117 = fma(_2099, _2109, _2089);
    float _2119 = _2111 * 0.586610972881317138671875;
    bool _2121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = fma(_2099, _2115, _2093);
    float _2125 = fma(_2117, 0.298911988735198974609375, _2119);
    bool _2127 = _1775 > 0.0;
    bool _2129 = isnan(_1775);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = fma(_2123, 0.114477999508380889892578125, _2125);
    bool _2139 = _1833 <= 0.0;
    bool _2141 = !_2135;
    bool _2143 = _2139 || _2141;
    float _2145 = -_2137;
    float _2147 = _2117 + _2145;
    float _2149 = -_2137;
    float _2151 = _2111 + _2149;
    float _2153 = -_2137;
    float _2155 = _2123 + _2153;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2161 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    bool _2163 = !_2121;
    if (!_2163)
    {
        float _2165 = -_1236;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2169 = -_1240;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2173 = -_1244;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2177 = _2167 * _2167;
        float _2179 = fma(_2171, _2171, _2177);
        float _2181 = fma(_2175, _2175, _2179);
        float _2183 = sqrt(_2181);
        float _2185 = rsqrt(_2181);
        float _2187 = -_2183;
        float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = _2171 * _2185;
        float _2197 = _2167 * _2185;
        float _2199 = abs(_2193);
        float _2201 = log2(_2199);
        float _2203 = _2175 * _2185;
        float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2207 = _1062 * _2197;
        float _2209 = -_2197;
        float _2211 = -_2205;
        float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
        float _2215 = fma(_1060, _2195, _2207);
        float _2217 = -_2203;
        float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
        float _2221 = fma(_1082, _2203, _2215);
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2227 = _2219 + _2225;
        float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        float _2235 = exp2(_2229);
        float _2237 = _2235 * _2233;
        float _2239 = _2223 * _2237;
        float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2241;
        out.m_81.y = _2243;
        out.m_81.z = _2245;
    }
    out.m_83.x = _2157;
    out.m_83.y = _2159;
    out.m_83.z = _2161;
    if (!_2143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2247;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1999 = false;
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_118);
        out.gl_Position.z = _2305;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_53.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_152);
        out.gl_Position.z = _2369;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    float _160 = 1.0 / _124;
    float _162 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_57.y;
    float _166 = in.m_59.y;
    float _168 = in.m_59.w;
    float _170 = in.m_48.x;
    float _172 = in.m_48.y;
    float _174 = in.m_48.z;
    float _176 = _128 * _160;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = abs(_154);
    float _184 = abs(_158);
    float _186 = precise::max(_182, _184);
    float _188 = -_158;
    float _190 = fma(_180, _158, _188);
    float _192 = -_154;
    float _194 = fma(_180, _154, _192);
    bool _196 = _186 >= 16.0;
    float _198 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _200 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = _162 * _178;
    float _210 = _158;
    float _212 = _154;
    int _214 = as_type<int>(_178);
    float _216 = _208;
    float _218 = _156;
    if (_196)
    {
        float _220 = _158 * 0.0625;
        _210 = _220;
    }
    float _222 = _210;
    if (_196)
    {
        float _224 = _154 * 0.0625;
        _212 = _224;
    }
    float _226 = _212;
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
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _254 = _252 != 0;
    float _256 = abs(_226);
    bool _258 = _256 == 0.0;
    bool _260 = !_250;
    int _262 = _260 ? 0 : 1;
    int _264 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _266 = _264 != 0;
    bool _268 = false;
    int _270 = _254 ? (-1) : 0;
    if (_246)
    {
        bool _272 = as_type<int>(_226) >= 0;
        _268 = _272;
    }
    bool _274 = _268;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    if (_246)
    {
        int _280 = _274 ? 0 : 1078530011;
        _214 = _280;
    }
    int _282 = _214;
    float _284 = 0.0;
    int _286 = _282;
    if (_246)
    {
        int _288 = int(0x80000000) & as_type<int>(_222);
        int _290 = _282 | _288;
        _284 = as_type<float>(_290);
    }
    float _292 = _284;
    bool _294 = !_238;
    bool _296 = _294 && _258;
    float _298 = _292;
    float _300 = _292;
    float _302 = _164;
    if (!_296)
    {
        float _304 = abs(_222);
        bool _306 = _304 != as_type<float>(0x7f800000u /* inf */);
        bool _308 = isnan(_304);
        bool _310 = _306 || _308;
        bool _312 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _314 = _310 || _312;
        float _316 = abs(_226);
        bool _318 = _316 == as_type<float>(0x7f800000u /* inf */);
        float _320 = abs(_226);
        bool _322 = _320 == as_type<float>(0x7f800000u /* inf */);
        bool _324 = !_314;
        bool _326 = _322 && _324;
        if (_326)
        {
            bool _328 = as_type<int>(_226) >= 0;
            _270 = _328 ? (-1) : 0;
        }
        int _330 = _270;
        if (_326)
        {
            _286 = 1075235812;
        }
        int _332 = _286;
        int _334 = _332;
        if (_326)
        {
            int _336 = ~_330;
            int _338 = (_336 != 0) ? _332 : 1061752795;
            _334 = _338;
        }
        int _340 = _334;
        if (_326)
        {
            int _342 = int(0x80000000) & as_type<int>(_222);
            int _344 = _340 | _342;
            _298 = as_type<float>(_344);
        }
        float _346 = _298;
        bool _348 = !_314;
        bool _350 = _348 && _318;
        _300 = _346;
        if (!_350)
        {
            float _352 = abs(_226);
            float _354 = abs(_222);
            float _356 = precise::max(_352, _354);
            float _358 = abs(_226);
            float _360 = abs(_222);
            float _362 = precise::min(_358, _360);
            float _364 = 1.0 / _356;
            float _366 = abs(_222);
            float _368 = abs(_226);
            bool _370 = _366 > _368;
            bool _372 = as_type<int>(_226) >= 0;
            float _374 = _362 * _364;
            float _376 = _374 * _374;
            float _378 = _376 + 11.33538818359375;
            float _380 = fma(_376, _378, 28.84246826171875);
            float _382 = fma(_376, _380, 19.6966705322265625);
            float _384 = fma(_376, -0.82336294651031494140625, -5.674867153167724609375);
            float _386 = abs(_226);
            float _388 = abs(_222);
            float _390 = _386 + _388;
            int _392 = as_type<int>(_222) & int(0x80000000);
            float _394 = fma(_376, _384, -6.565555095672607421875);
            float _396 = 1.0 / _382;
            bool _398 = _390 > as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_390);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = _376 * _394;
            float _410 = _374 * _408;
            float _412 = fma(_410, _396, _374);
            float _414 = _412;
            _300 = _390;
            if (_370)
            {
                float _416 = -_412;
                float _418 = _416 + 1.57079637050628662109375;
                _414 = _418;
            }
            float _420 = _414;
            int _422 = as_type<int>(_420);
            if (!_372)
            {
                float _424 = -_420;
                float _426 = _424 + 3.1415927410125732421875;
                _422 = as_type<int>(_426);
            }
            int _428 = _422;
            if (!_406)
            {
                int _430 = _392 | _428;
                _300 = as_type<float>(_430);
            }
        }
    }
    float _432 = _300;
    float _434 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = -_164;
    float _442 = _440 + 1.0;
    float _444 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _446 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _448 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    bool _450 = _166 > 0.5;
    float _452 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
    float _454 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
    float _456 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _462 = _450 ? as_type<int>(_442) : as_type<int>(_164);
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _460 + _466;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _458 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _464 + _478;
    float _482 = _468 * _468;
    float _484 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _486 = in.m_59.x;
    bool _488 = _168 > 0.5;
    float _490 = fma(_476, _476, _482);
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _494 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = fma(_480, _480, _490);
    float _500 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = in.m_57.x;
    float _504 = _492 * 12.0;
    float _506 = rsqrt(_498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _518 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _528 = _526 != 0;
    float _530 = _492 * 6.0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _534 = _532 != 0;
    float _536 = fma(_432, 4.0, _504);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    out.m_63.x = _518;
    out.m_63.y = _522;
    out.m_63.z = _524;
    out.m_63.w = _520;
    float _542 = -_530;
    float _544 = fma(_432, 3.0, _542);
    float _546 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _548 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _552 = _176 * 3.1415927410125732421875;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _536 * 0.15915493667125701904296875;
    float _558 = _544 * 0.15915493667125701904296875;
    float _560 = fma(_546, -2.0, _550);
    float _562 = -_554;
    float _564 = fma(_548, 2.0, _562);
    float _566 = _552 * 0.15915493667125701904296875;
    float _568 = _468 * _506;
    float _570 = _476 * _506;
    float _572 = 0.0;
    bool _574 = _540;
    bool _576 = _528;
    float _578 = _570;
    if (_534)
    {
        float _580 = in.m_59.z;
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_568;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _476);
    float _592 = _528 ? as_type<float>(_462) : _164;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _586 * _586;
    float _600 = _480 * _506;
    float _602 = _590;
    if (_540)
    {
        float _604 = _488 ? _442 : _164;
        _302 = _604;
    }
    float _606 = _302;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_590, _590, _598);
    float _612 = _432 + 3.1415927410125732421875;
    float _614 = _608;
    if (!_514)
    {
        _602 = _502;
    }
    float _616 = _602;
    float _618 = _558 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = _492 * 6.283185482025146484375;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _626 = _616;
    if (!_472)
    {
        float _628 = in.m_59.z;
        _624 = _628;
    }
    float _630 = _624;
    float _632 = -_600;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _636 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _638 = _612 * 0.15915493667125701904296875;
    if (!_514)
    {
        _614 = _616;
    }
    float _640 = _614;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = _566 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _640;
    if (_514)
    {
        _626 = _502;
    }
    float _650 = _626;
    float _652 = fma(_634, _634, _610);
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[20].x, _208);
    float _656 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650;
    if (!_472)
    {
        _216 = _166;
    }
    float _660 = _216;
    float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _664 = _596 + _620;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _668 = _666 + 2.0;
    float _670 = _660;
    if (_514)
    {
        bool _672 = _486 > 0.5;
        _574 = _672;
    }
    bool _674 = _574;
    float _676 = fma(_664, 0.25, 0.5);
    if (_472)
    {
        _670 = _486;
    }
    float _678 = _670;
    float _680 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = 0.0 + _646;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    if (_534)
    {
        bool _690 = _582 > 0.5;
        _576 = _690;
    }
    bool _692 = _576;
    int _694 = 0;
    if (_534)
    {
        float _696 = -_650;
        float _698 = _696 + 1.0;
        _694 = as_type<int>(_698);
    }
    int _700 = _694;
    float _702 = -_156;
    float _704 = fma(_688, _156, _702);
    float _706 = -_128;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _564);
    float _710 = _642 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _716 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _722 = fma(_714, _592, -0.5);
    float _724 = _630;
    if (!_472)
    {
        _218 = _630;
    }
    float _726 = _218;
    float _728 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _730 = sqrt(_652);
    float _732 = fma(_684, 0.5, 0.5);
    float _734 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _736 = _726;
    if (_472)
    {
        _736 = _166;
    }
    float _738 = _736;
    float _740 = _732 * _716;
    if (_472)
    {
        _724 = _166;
    }
    float _742 = _724;
    float _744 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _746 = fma(_712, 0.10000002384185791015625, 1.0);
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _750 = _740 * _744;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _754 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _560);
    float _756 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = _506 * _730;
    float _762 = fma(_750, _752, 1.0);
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _766 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _768 = _734 * _760;
    float _770 = _656 * _760;
    float _772 = _680 * _760;
    float _774 = _200 * _762;
    float _776 = _198 * _762;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _780 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _774);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _776);
    float _786 = _770 * _778;
    float _788 = -_754;
    float _790 = fma(_780, _722, _788);
    float _792 = _768 * _782;
    float _794 = _772 * _784;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _814 = fma(_800, _606, -0.5);
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _808);
    float _818 = _458 + _810;
    float _820 = _464 + _812;
    int _822 = as_type<int>(_758);
    float _824 = _818;
    float _826 = _820;
    if (_514)
    {
        float _828 = -_650;
        float _830 = _828 + 1.0;
        _822 = as_type<int>(_830);
    }
    int _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _818 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _820 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _836 * _836;
    float _846 = _840 * _840;
    float _848 = _844;
    float _850 = _846;
    if (_514)
    {
        float _852 = _674 ? as_type<float>(_832) : _650;
        _648 = _852;
    }
    float _854 = _648;
    float _856 = -_842;
    float _858 = fma(_756, 2.0, _856);
    float _860 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _862 = _844 + _846;
    if (_534)
    {
        float _864 = _692 ? as_type<float>(_700) : _650;
        _658 = _864;
    }
    float _866 = _658;
    float _868 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _870 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _872 = sqrt(_862);
    float _874 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = fma(_868, _854, -0.5);
    float _878 = fma(_870, _866, -0.5);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    bool _890 = _750 != 0.0;
    bool _892 = isnan(_750);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_860, -2.0, _880);
    float _902 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    float _904 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _906 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _766);
    float _908 = -_128;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _858);
    float _912 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _816);
    float _914 = _460 + _904;
    float _916 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    bool _918 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = fma(_902, _876, _708);
    bool _922 = _774 == 0.0;
    bool _924 = !_898;
    bool _926 = _922 && _924;
    float _928 = fma(_906, _878, _910);
    float _930 = -_916;
    float _932 = fma(_912, _814, _930);
    bool _934 = _776 == 0.0;
    bool _936 = _934 && _926;
    if (!_918)
    {
        _146 = _914;
    }
    float _938 = _146;
    bool _940 = !_918;
    float _942 = _938;
    float _944 = _884;
    float _946 = _882;
    float _948 = _886;
    if (!_940)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_862);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = fma(_966, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _974 = _958 * _972;
        float _976 = fma(_836, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = _970 + (-1.0);
        float _980 = fma(_840, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _984 = _976 + _982;
        float _986 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _990 = _980 + _988;
        float _992 = _984 * _984;
        float _994 = fma(_914, _970, _986);
        float _996 = _990 * _990;
        _942 = _994;
        _848 = _992;
        _850 = _996;
        _824 = _976;
        _826 = _980;
    }
    float _998 = _942;
    float _1000 = _848;
    float _1002 = _850;
    float _1004 = _824;
    float _1006 = _826;
    if (!_936)
    {
        float _1008 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _944 = _1008;
    }
    float _1010 = _944;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _998 + _1012;
    float _1016 = floor(_654);
    if (!_936)
    {
        float _1018 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _946 = _1018;
    }
    float _1020 = _946;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1014, _1014, _1000);
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = _1024 + _1002;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    if (!_936)
    {
        float _1038 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _886);
        _948 = _1038;
    }
    float _1040 = _948;
    float _1042 = sqrt(_1032);
    float _1044 = _790 + 0.5;
    float _1046 = -_1016;
    float _1048 = _654 + _1046;
    float _1050 = _654 * 6.283185482025146484375;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1056 = _1050 * 0.15915493667125701904296875;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1034);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1056 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _920 + 0.5;
    float _1078 = _928 + 0.5;
    float _1080 = _932 + 0.5;
    float _1082 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    out.m_67.x = _1066;
    out.m_67.y = _1072;
    out.m_67.z = _1074;
    out.m_67.w = _1064;
    int _1084 = abs(_262);
    out.m_69.x = _1076;
    out.m_69.y = _1044;
    out.m_69.z = _1078;
    out.m_69.w = _1080;
    bool _1086 = !_266;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -_1048;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1094 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1096 = isnan(_1042);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1102 = _1098 || _1100;
    out.m_71.x = _1060;
    out.m_71.y = _1062;
    out.m_71.z = _1082;
    float _1104 = float(_1084);
    float _1106 = fma(_1070, 0.5, 0.5);
    int _1108 = abs(_1088);
    int _1110 = abs(_278);
    float _1112 = abs(_1092);
    float _1114 = _1104 * _1112;
    bool _1116 = _1048 < 0.5;
    float _1118 = float(_1116);
    float _1120 = -_1106;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1124 = float(_1108);
    float _1126 = float(_1110);
    float _1128 = -_1118;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1132 = fma(_1124, _1122, _1114);
    float _1134 = _1124;
    float _1136 = _1066;
    float _1138 = _1106;
    if (!_1102)
    {
        _1134 = 1.0;
    }
    float _1140 = _1134;
    float _1142 = abs(_1130);
    float _1144 = fma(_1126, _1142, _1132);
    bool _1146 = !_1102;
    float _1148 = _1140;
    if (!_1146)
    {
        bool _1150 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1042);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1042 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1136 = _1170;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1042);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1042 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1136 = _1200;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _1136;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _998 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _1004 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _1006 + _1220;
    float _1224 = -_570;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _1228 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1230 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1232 = fma(_1222, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = -_568;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1238 = -_570;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_600;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_600;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1236 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1240 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1244 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1268 = fma(_1260, _1260, _1264);
    float _1270 = rsqrt(_1268);
    float _1272 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1260 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1270;
    float _1294 = _1290;
    float _1296 = _1210;
    float _1298 = _1252;
    float _1300 = _1276;
    if (_1286)
    {
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1302;
    }
    float _1304 = _1292;
    if (_1286)
    {
        float _1306 = rsqrt(_1282);
        _1138 = _1306;
    }
    float _1308 = _1138;
    float _1310 = _1308;
    if (_1286)
    {
        float _1312 = _1290 * _1304;
        _1294 = _1312;
    }
    float _1314 = _1294;
    if (_1286)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1296 = _1316;
    }
    float _1318 = _1296;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = _1260;
    float _1324 = _1318;
    if (_1286)
    {
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = precise::max(0.0, _1320);
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1286)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = -_1272;
    float _1344 = -_1332;
    float _1346 = fma(_1252, _1342, _1344);
    float _1348 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1350 = _1346;
    if (_1286)
    {
        float _1352 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1352;
    }
    float _1354 = _1298;
    float _1356 = floor(_1348);
    float _1358 = _1330;
    float _1360 = _1354;
    if (_1286)
    {
        float _1362 = fma(_1330, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1286)
    {
        _1360 = _1274;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1308 * _1364;
        _1310 = _1372;
    }
    float _1374 = _1310;
    if (!_1286)
    {
        _1366 = _1278;
    }
    float _1376 = _1366;
    float _1378 = _1376;
    float _1380 = _1340;
    if (_1286)
    {
        float _1382 = _1340 + (-1.0);
        _578 = _1382;
    }
    float _1384 = _578;
    if (_1286)
    {
        float _1386 = _1274 * _1374;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1286)
    {
        float _1390 = _1276 * _1374;
        _1300 = _1390;
    }
    float _1392 = _1300;
    if (_1286)
    {
        float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1394;
    }
    float _1396 = _1324;
    if (_1286)
    {
        float _1398 = _1388 * _1388;
        _1378 = _1398;
    }
    float _1400 = _1378;
    float _1402 = sqrt(_1268);
    float _1404 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1286)
    {
        float _1406 = fma(_1346, _1340, _1396);
        _1350 = _1406;
    }
    float _1408 = _1350;
    if (!_1286)
    {
        _1380 = _1280;
    }
    float _1410 = _1380;
    float _1412 = _1410;
    if (_1286)
    {
        float _1414 = _1392 * _1392;
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1420 = fma(_1408, _1408, _1400);
    float _1422 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1426 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1428 = _1420 + _1416;
    float _1430 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1426);
    float _1438 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1440 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1444 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1442);
    float _1446 = precise::clamp(_1444, 0.0, 1.0);
    float _1448 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = rsqrt(_1428);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = -_1446;
    float _1460 = _1458 + 1.0;
    float _1462 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1468 = floor(_1418);
    float _1470 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1472 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1464);
    float _1474 = -_1466;
    float _1476 = fma(_1474, _1266, 1.0);
    float _1478 = -_1356;
    float _1480 = _1348 + _1478;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1472);
    float _1486 = abs(_1460);
    float _1488 = log2(_1486);
    float _1490 = _1450 * _1388;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1494 = _1450 * _1408;
    float _1496 = _1450 * _1392;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = 1.0 / _1492;
    float _1504 = -_1498;
    float _1506 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1504);
    float _1508 = -_1468;
    float _1510 = _1418 + _1508;
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1514 = -_1496;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1506);
    float _1518 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1512);
    float _1522 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1524 = fma(_1516, -0.5, 0.5);
    float _1526 = log2(_1476);
    float _1528 = fma(_1516, 0.5, 0.5);
    float _1530 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1532 = _1494 + 1.0;
    float _1534 = fma(_1528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1536 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1530);
    float _1538 = exp2(_1522);
    float _1540 = fma(_1528, _1534, -0.212114393711090087890625);
    float _1542 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1544 = fma(_1528, _1540, 1.570728778839111328125);
    float _1546 = _1520 * _1502;
    float _1548 = sqrt(_1524);
    float _1550 = _1526 * 0.693147182464599609375;
    float _1552 = fma(_1546, 0.5, 0.5);
    float _1554 = -_1494;
    float _1556 = fma(_1538, _1532, _1554);
    float _1558 = _1542 * _1502;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1562 = fma(_1556, 0.5, 0.5);
    float _1564 = fma(_1558, -0.5, 0.5);
    float _1566 = _1548 * 0.636619746685028076171875;
    float2 _4706 = float2(_1480, _1510);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4706, float2(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4706, float2(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1552, _1564, _1560);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).x;
    float3 _4728 = float3(_1552, _1564, _1560);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4728, float3(0.0), isnan(_4728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4728, float3(0.0), isnan(_4728)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float _1583 = -_1544;
    float _1585 = fma(_1566, _1583, 1.0);
    float2 _4749 = float2(_1585, _1562);
    float3 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = -_568;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _1601 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1603);
    float _1609 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1611 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1613 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1615 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1619 = 1.0 / _1615;
    float _1621 = _1617 + _1615;
    float _1623 = _1621 * _1619;
    float _1625 = _1623 * 0.5;
    float _1627 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    float _1633 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1635 = _1492 * 0.5;
    float _1637 = 1.0 / _1631;
    float _1639 = fma(_1542, -0.5, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1653 = _1637 * _1651;
    float _1655 = abs(_1653);
    float _1657 = log2(_1655);
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1661 = _1492;
    if (_1649)
    {
        _1659 = 1.0;
    }
    float _1663 = _1659;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1667 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1633);
    float _1669 = _1520 + _1492;
    float _1671 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1673 = exp2(_1665);
    float _1675 = _1669 * 0.5;
    float _1677 = _1671 + _1492;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1542;
    out.gl_Position.z = _1671;
    out.gl_Position.w = _1492;
    float _1679 = _1677 * 0.5;
    out.m_73.x = _1675;
    out.m_73.y = _1639;
    out.m_73.z = _1679;
    out.m_73.w = _1492;
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = in.m_75.x;
    float _1687 = exp2(_1601);
    float _1689 = fma(_1683, -2.0, 3.0);
    float _1691 = _1683 * _1683;
    bool _1693 = _1653 <= 8000.0;
    bool _1695 = isnan(_1653);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(8000.0);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1691 * _1689;
    float _1707 = -_1705;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1705);
    float _1713 = _1703 * _1711;
    float _1715 = _1711;
    float _1717 = _1663;
    if (_1649)
    {
        _1715 = 1.0;
    }
    float _1719 = _1715;
    float _1721 = _1719;
    float _1723 = _1581;
    float _1725 = _1579;
    if (!_1649)
    {
        float _1727 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = _1727 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1737;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1731;
        float _1763 = 1.0 / _1759;
        float _1765 = _1757 * _1763;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = fma(_1653, _1765, _1767);
        float _1771 = _1769 * _1761;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1721 = _1773;
        _1661 = _1759;
    }
    float _1775 = _1721;
    float _1777 = _1661;
    float _1779 = _1777;
    if (!_1649)
    {
        float _1781 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1783 = _1781 * 0.15915493667125701904296875;
        float _1785 = _1783 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1783 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1787;
        float _1799 = _1791 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1791 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1809;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1813;
        float _1817 = 1.0 / _1815;
        float _1819 = _1807 * _1811;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1823 = fma(_1653, _1819, _1821);
        float _1825 = _1823 * _1817;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = -_1827;
        float _1831 = _1829 + 1.0;
        _1717 = _1831;
        _1779 = _1815;
    }
    float _1833 = _1717;
    float _1835 = _1779;
    float _1837 = -_1687;
    float _1839 = _1837 + 1.0;
    float _1841 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1843 = -_1568;
    float _1845 = _1843 + 1.0;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1849 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1402);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = _1845 * _1841;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = _1847 * _1570;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = -_1861;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1873 = _1581 * _1863;
    float _1875 = _1595 * _1863;
    float _1877 = _1871 * _1685;
    float _1879 = _1581 * _1867;
    float _1881 = fma(_1591, _1873, _1575);
    float _1883 = fma(_1593, _1873, _1577);
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1887 = fma(_1581, _1875, _1579);
    float _1889 = _1775 * _1833;
    float _1891 = _1835;
    float _1893 = _1867;
    float _1895 = _1889;
    float _1897 = _1861;
    if (!_1857)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1899 = _1723;
    out.m_77.x = _1885;
    float _1901 = _1144 * _1889;
    float _1903 = _1899;
    float _1905 = _1899;
    if (!_1857)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1907 = _1891;
    out.m_79.x = _1881;
    out.m_79.y = _1883;
    out.m_79.z = _1887;
    out.m_79.w = _1879;
    float _1909 = _1907;
    float _1911 = _1907;
    if (!_1857)
    {
        _1725 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1725;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1857)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1893;
    float _1921 = _1919;
    float _1923 = _1919;
    if (!_1857)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1925 = _1895;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1857)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1931 = _1897;
    bool _1933 = !_1857;
    float _1935 = _1931;
    float _1937 = _1931;
    if (!_1933)
    {
        bool _1939 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1941 = isnan(_1402);
        bool _1943 = _1939 || _1941;
        bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1947 = _1943 || _1945;
        if (!_1947)
        {
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = _1402 + _1949;
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1953;
            float _1957 = 1.0 / _1955;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1951 * _1957;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1977, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1993 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1995 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1997 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1991;
            _1929 = _1995;
            _1905 = _1989;
            _1923 = _1993;
            _1917 = _1987;
            _1937 = _1997;
            _1999 = true;
        }
        else
        {
            bool _2001 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2003 = isnan(_1402);
            bool _2005 = _2001 || _2003;
            bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2009 = _2005 || _2007;
            if (!_2009)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2011 = _1903;
            _1905 = _2011;
            if (!_2009)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2013 = _1909;
            _1911 = _2013;
            if (!_2009)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2015 = _1915;
            _1917 = _2015;
            if (!_2009)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2017 = _1921;
            _1923 = _2017;
            if (!_2009)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2019 = _1927;
            _1929 = _2019;
            if (!_2009)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2021 = _1935;
            bool _2023 = !_2009;
            _1937 = _2021;
            if (!_2023)
            {
                bool _2025 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2027 = isnan(_1402);
                bool _2029 = _2025 || _2027;
                bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2033 = _2029 || _2031;
                if (!_2033)
                {
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = _1402 + _2035;
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2039;
                    float _2043 = 1.0 / _2041;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2037 * _2043;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2063, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2079 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2081 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2083 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2077;
                    _1929 = _2081;
                    _1905 = _2075;
                    _1923 = _2079;
                    _1917 = _2073;
                    _1937 = _2083;
                    _1999 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1999 = false;
    float _2085 = _1911;
    float _2087 = _1929;
    float _2089 = _1905;
    float _2091 = _1923;
    float _2093 = _1917;
    float _2095 = _1937;
    float _2097 = fma(_1062, -0.5, 0.5);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = _1901 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    out.m_81.x = 0.0;
    float _2111 = fma(_2099, _2103, _2085);
    float _2113 = -_2093;
    float _2115 = _2113 + _2095;
    out.m_51.x = _2105;
    float _2117 = fma(_2099, _2109, _2089);
    float _2119 = _2111 * 0.586610972881317138671875;
    bool _2121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = fma(_2099, _2115, _2093);
    float _2125 = fma(_2117, 0.298911988735198974609375, _2119);
    bool _2127 = _1775 > 0.0;
    bool _2129 = isnan(_1775);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = fma(_2123, 0.114477999508380889892578125, _2125);
    bool _2139 = _1833 <= 0.0;
    bool _2141 = !_2135;
    bool _2143 = _2139 || _2141;
    float _2145 = -_2137;
    float _2147 = _2117 + _2145;
    float _2149 = -_2137;
    float _2151 = _2111 + _2149;
    float _2153 = -_2137;
    float _2155 = _2123 + _2153;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2161 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    bool _2163 = !_2121;
    if (!_2163)
    {
        float _2165 = -_1236;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2169 = -_1240;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2173 = -_1244;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2177 = _2167 * _2167;
        float _2179 = fma(_2171, _2171, _2177);
        float _2181 = fma(_2175, _2175, _2179);
        float _2183 = sqrt(_2181);
        float _2185 = rsqrt(_2181);
        float _2187 = -_2183;
        float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = _2171 * _2185;
        float _2197 = _2167 * _2185;
        float _2199 = abs(_2193);
        float _2201 = log2(_2199);
        float _2203 = _2175 * _2185;
        float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2207 = _1062 * _2197;
        float _2209 = -_2197;
        float _2211 = -_2205;
        float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
        float _2215 = fma(_1060, _2195, _2207);
        float _2217 = -_2203;
        float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
        float _2221 = fma(_1082, _2203, _2215);
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2227 = _2219 + _2225;
        float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        float _2235 = exp2(_2229);
        float _2237 = _2235 * _2233;
        float _2239 = _2223 * _2237;
        float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2241;
        out.m_81.y = _2243;
        out.m_81.z = _2245;
    }
    out.m_83.x = _2157;
    out.m_83.y = _2159;
    out.m_83.z = _2161;
    if (!_2143)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2247;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1999 = false;
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2305 = as_type<float>(_118);
        out.gl_Position.z = _2305;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_53.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2369 = as_type<float>(_152);
        out.gl_Position.z = _2369;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    float _160 = 1.0 / _124;
    float _162 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_57.y;
    float _166 = in.m_59.y;
    float _168 = in.m_59.w;
    float _170 = in.m_48.x;
    float _172 = in.m_48.y;
    float _174 = in.m_48.z;
    float _176 = _128 * _160;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = abs(_154);
    float _184 = abs(_158);
    float _186 = precise::max(_182, _184);
    float _188 = -_158;
    float _190 = fma(_180, _158, _188);
    float _192 = -_154;
    float _194 = fma(_180, _154, _192);
    bool _196 = _186 >= 16.0;
    float _198 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _200 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = _162 * _178;
    float _210 = _158;
    float _212 = _154;
    int _214 = as_type<int>(_178);
    float _216 = _208;
    float _218 = _156;
    if (_196)
    {
        float _220 = _158 * 0.0625;
        _210 = _220;
    }
    float _222 = _210;
    if (_196)
    {
        float _224 = _154 * 0.0625;
        _212 = _224;
    }
    float _226 = _212;
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
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _254 = _252 != 0;
    float _256 = abs(_226);
    bool _258 = _256 == 0.0;
    bool _260 = !_250;
    int _262 = _260 ? 0 : 1;
    int _264 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _266 = _264 != 0;
    bool _268 = false;
    int _270 = _254 ? (-1) : 0;
    if (_246)
    {
        bool _272 = as_type<int>(_226) >= 0;
        _268 = _272;
    }
    bool _274 = _268;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    if (_246)
    {
        int _280 = _274 ? 0 : 1078530011;
        _214 = _280;
    }
    int _282 = _214;
    float _284 = 0.0;
    int _286 = _282;
    if (_246)
    {
        int _288 = int(0x80000000) & as_type<int>(_222);
        int _290 = _282 | _288;
        _284 = as_type<float>(_290);
    }
    float _292 = _284;
    bool _294 = !_238;
    bool _296 = _294 && _258;
    float _298 = _292;
    float _300 = _292;
    float _302 = _164;
    if (!_296)
    {
        float _304 = abs(_222);
        bool _306 = _304 != as_type<float>(0x7f800000u /* inf */);
        bool _308 = isnan(_304);
        bool _310 = _306 || _308;
        bool _312 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _314 = _310 || _312;
        float _316 = abs(_226);
        bool _318 = _316 == as_type<float>(0x7f800000u /* inf */);
        float _320 = abs(_226);
        bool _322 = _320 == as_type<float>(0x7f800000u /* inf */);
        bool _324 = !_314;
        bool _326 = _322 && _324;
        if (_326)
        {
            bool _328 = as_type<int>(_226) >= 0;
            _270 = _328 ? (-1) : 0;
        }
        int _330 = _270;
        if (_326)
        {
            _286 = 1075235812;
        }
        int _332 = _286;
        int _334 = _332;
        if (_326)
        {
            int _336 = ~_330;
            int _338 = (_336 != 0) ? _332 : 1061752795;
            _334 = _338;
        }
        int _340 = _334;
        if (_326)
        {
            int _342 = int(0x80000000) & as_type<int>(_222);
            int _344 = _340 | _342;
            _298 = as_type<float>(_344);
        }
        float _346 = _298;
        bool _348 = !_314;
        bool _350 = _348 && _318;
        _300 = _346;
        if (!_350)
        {
            float _352 = abs(_226);
            float _354 = abs(_222);
            float _356 = precise::max(_352, _354);
            float _358 = abs(_226);
            float _360 = abs(_222);
            float _362 = precise::min(_358, _360);
            float _364 = 1.0 / _356;
            float _366 = abs(_222);
            float _368 = abs(_226);
            bool _370 = _366 > _368;
            bool _372 = as_type<int>(_226) >= 0;
            float _374 = _362 * _364;
            float _376 = _374 * _374;
            float _378 = _376 + 11.33538818359375;
            float _380 = fma(_376, _378, 28.84246826171875);
            float _382 = fma(_376, _380, 19.6966705322265625);
            float _384 = fma(_376, -0.82336294651031494140625, -5.674867153167724609375);
            float _386 = abs(_226);
            float _388 = abs(_222);
            float _390 = _386 + _388;
            int _392 = as_type<int>(_222) & int(0x80000000);
            float _394 = fma(_376, _384, -6.565555095672607421875);
            float _396 = 1.0 / _382;
            bool _398 = _390 > as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_390);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = _376 * _394;
            float _410 = _374 * _408;
            float _412 = fma(_410, _396, _374);
            float _414 = _412;
            _300 = _390;
            if (_370)
            {
                float _416 = -_412;
                float _418 = _416 + 1.57079637050628662109375;
                _414 = _418;
            }
            float _420 = _414;
            int _422 = as_type<int>(_420);
            if (!_372)
            {
                float _424 = -_420;
                float _426 = _424 + 3.1415927410125732421875;
                _422 = as_type<int>(_426);
            }
            int _428 = _422;
            if (!_406)
            {
                int _430 = _392 | _428;
                _300 = as_type<float>(_430);
            }
        }
    }
    float _432 = _300;
    float _434 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _440 = -_164;
    float _442 = _440 + 1.0;
    float _444 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _446 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _448 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    bool _450 = _166 > 0.5;
    float _452 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
    float _454 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _446);
    float _456 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _462 = _450 ? as_type<int>(_442) : as_type<int>(_164);
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _460 + _466;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _472 = _470 != 0;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _458 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _464 + _478;
    float _482 = _468 * _468;
    float _484 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _486 = in.m_59.x;
    bool _488 = _168 > 0.5;
    float _490 = fma(_476, _476, _482);
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _494 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = fma(_480, _480, _490);
    float _500 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = in.m_57.x;
    float _504 = _492 * 12.0;
    float _506 = rsqrt(_498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _514 = _512 != 0;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _518 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _528 = _526 != 0;
    float _530 = _492 * 6.0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _534 = _532 != 0;
    float _536 = fma(_432, 4.0, _504);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    out.m_63.x = _518;
    out.m_63.y = _522;
    out.m_63.z = _524;
    out.m_63.w = _520;
    float _542 = -_530;
    float _544 = fma(_432, 3.0, _542);
    float _546 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _548 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _552 = _176 * 3.1415927410125732421875;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _536 * 0.15915493667125701904296875;
    float _558 = _544 * 0.15915493667125701904296875;
    float _560 = fma(_546, -2.0, _550);
    float _562 = -_554;
    float _564 = fma(_548, 2.0, _562);
    float _566 = _552 * 0.15915493667125701904296875;
    float _568 = _468 * _506;
    float _570 = _476 * _506;
    float _572 = 0.0;
    bool _574 = _540;
    bool _576 = _528;
    float _578 = _570;
    if (_534)
    {
        float _580 = in.m_59.z;
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_568;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _588 = -_570;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _476);
    float _592 = _528 ? as_type<float>(_462) : _164;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _586 * _586;
    float _600 = _480 * _506;
    float _602 = _590;
    if (_540)
    {
        float _604 = _488 ? _442 : _164;
        _302 = _604;
    }
    float _606 = _302;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_590, _590, _598);
    float _612 = _432 + 3.1415927410125732421875;
    float _614 = _608;
    if (!_514)
    {
        _602 = _502;
    }
    float _616 = _602;
    float _618 = _558 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = _492 * 6.283185482025146484375;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _626 = _616;
    if (!_472)
    {
        float _628 = in.m_59.z;
        _624 = _628;
    }
    float _630 = _624;
    float _632 = -_600;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _480);
    float _636 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _638 = _612 * 0.15915493667125701904296875;
    if (!_514)
    {
        _614 = _616;
    }
    float _640 = _614;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = _566 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _640;
    if (_514)
    {
        _626 = _502;
    }
    float _650 = _626;
    float _652 = fma(_634, _634, _610);
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[20].x, _208);
    float _656 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650;
    if (!_472)
    {
        _216 = _166;
    }
    float _660 = _216;
    float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _664 = _596 + _620;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _668 = _666 + 2.0;
    float _670 = _660;
    if (_514)
    {
        bool _672 = _486 > 0.5;
        _574 = _672;
    }
    bool _674 = _574;
    float _676 = fma(_664, 0.25, 0.5);
    if (_472)
    {
        _670 = _486;
    }
    float _678 = _670;
    float _680 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _638 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = 0.0 + _646;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    if (_534)
    {
        bool _690 = _582 > 0.5;
        _576 = _690;
    }
    bool _692 = _576;
    int _694 = 0;
    if (_534)
    {
        float _696 = -_650;
        float _698 = _696 + 1.0;
        _694 = as_type<int>(_698);
    }
    int _700 = _694;
    float _702 = -_156;
    float _704 = fma(_688, _156, _702);
    float _706 = -_128;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _564);
    float _710 = _642 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _716 = fma(_676, _668, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _722 = fma(_714, _592, -0.5);
    float _724 = _630;
    if (!_472)
    {
        _218 = _630;
    }
    float _726 = _218;
    float _728 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _730 = sqrt(_652);
    float _732 = fma(_684, 0.5, 0.5);
    float _734 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _736 = _726;
    if (_472)
    {
        _736 = _166;
    }
    float _738 = _736;
    float _740 = _732 * _716;
    if (_472)
    {
        _724 = _166;
    }
    float _742 = _724;
    float _744 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _746 = fma(_712, 0.10000002384185791015625, 1.0);
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _750 = _740 * _744;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _754 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _560);
    float _756 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = _506 * _730;
    float _762 = fma(_750, _752, 1.0);
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _766 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _768 = _734 * _760;
    float _770 = _656 * _760;
    float _772 = _680 * _760;
    float _774 = _200 * _762;
    float _776 = _198 * _762;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _780 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _774);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _776);
    float _786 = _770 * _778;
    float _788 = -_754;
    float _790 = fma(_780, _722, _788);
    float _792 = _768 * _782;
    float _794 = _772 * _784;
    float _796 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _800 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _802 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[10].x, _798);
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _814 = fma(_800, _606, -0.5);
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _808);
    float _818 = _458 + _810;
    float _820 = _464 + _812;
    int _822 = as_type<int>(_758);
    float _824 = _818;
    float _826 = _820;
    if (_514)
    {
        float _828 = -_650;
        float _830 = _828 + 1.0;
        _822 = as_type<int>(_830);
    }
    int _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _818 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _820 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = _836 * _836;
    float _846 = _840 * _840;
    float _848 = _844;
    float _850 = _846;
    if (_514)
    {
        float _852 = _674 ? as_type<float>(_832) : _650;
        _648 = _852;
    }
    float _854 = _648;
    float _856 = -_842;
    float _858 = fma(_756, 2.0, _856);
    float _860 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _862 = _844 + _846;
    if (_534)
    {
        float _864 = _692 ? as_type<float>(_700) : _650;
        _658 = _864;
    }
    float _866 = _658;
    float _868 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _870 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _872 = sqrt(_862);
    float _874 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _876 = fma(_868, _854, -0.5);
    float _878 = fma(_870, _866, -0.5);
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = fma(_792, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    bool _890 = _750 != 0.0;
    bool _892 = isnan(_750);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    float _900 = fma(_860, -2.0, _880);
    float _902 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _636);
    float _904 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _906 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _766);
    float _908 = -_128;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _858);
    float _912 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _816);
    float _914 = _460 + _904;
    float _916 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _900);
    bool _918 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = fma(_902, _876, _708);
    bool _922 = _774 == 0.0;
    bool _924 = !_898;
    bool _926 = _922 && _924;
    float _928 = fma(_906, _878, _910);
    float _930 = -_916;
    float _932 = fma(_912, _814, _930);
    bool _934 = _776 == 0.0;
    bool _936 = _934 && _926;
    if (!_918)
    {
        _146 = _914;
    }
    float _938 = _146;
    bool _940 = !_918;
    float _942 = _938;
    float _944 = _884;
    float _946 = _882;
    float _948 = _886;
    if (!_940)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = _914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_862);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = fma(_966, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _974 = _958 * _972;
        float _976 = fma(_836, _974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _978 = _970 + (-1.0);
        float _980 = fma(_840, _974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _984 = _976 + _982;
        float _986 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _990 = _980 + _988;
        float _992 = _984 * _984;
        float _994 = fma(_914, _970, _986);
        float _996 = _990 * _990;
        _942 = _994;
        _848 = _992;
        _850 = _996;
        _824 = _976;
        _826 = _980;
    }
    float _998 = _942;
    float _1000 = _848;
    float _1002 = _850;
    float _1004 = _824;
    float _1006 = _826;
    if (!_936)
    {
        float _1008 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _884);
        _944 = _1008;
    }
    float _1010 = _944;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1014 = _998 + _1012;
    float _1016 = floor(_654);
    if (!_936)
    {
        float _1018 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _946 = _1018;
    }
    float _1020 = _946;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1014, _1014, _1000);
    float _1026 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1028 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = _1024 + _1002;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1026);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1028);
    if (!_936)
    {
        float _1038 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _886);
        _948 = _1038;
    }
    float _1040 = _948;
    float _1042 = sqrt(_1032);
    float _1044 = _790 + 0.5;
    float _1046 = -_1016;
    float _1048 = _654 + _1046;
    float _1050 = _654 * 6.283185482025146484375;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1056 = _1050 * 0.15915493667125701904296875;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1034);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1056 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = _920 + 0.5;
    float _1078 = _928 + 0.5;
    float _1080 = _932 + 0.5;
    float _1082 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1036);
    out.m_67.x = _1066;
    out.m_67.y = _1072;
    out.m_67.z = _1074;
    out.m_67.w = _1064;
    int _1084 = abs(_262);
    out.m_69.x = _1076;
    out.m_69.y = _1044;
    out.m_69.z = _1078;
    out.m_69.w = _1080;
    bool _1086 = !_266;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -_1048;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1094 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1096 = isnan(_1042);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1102 = _1098 || _1100;
    out.m_71.x = _1060;
    out.m_71.y = _1062;
    out.m_71.z = _1082;
    float _1104 = float(_1084);
    float _1106 = fma(_1070, 0.5, 0.5);
    int _1108 = abs(_1088);
    int _1110 = abs(_278);
    float _1112 = abs(_1092);
    float _1114 = _1104 * _1112;
    bool _1116 = _1048 < 0.5;
    float _1118 = float(_1116);
    float _1120 = -_1106;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1124 = float(_1108);
    float _1126 = float(_1110);
    float _1128 = -_1118;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1132 = fma(_1124, _1122, _1114);
    float _1134 = _1124;
    float _1136 = _1066;
    float _1138 = _1106;
    if (!_1102)
    {
        _1134 = 1.0;
    }
    float _1140 = _1134;
    float _1142 = abs(_1130);
    float _1144 = fma(_1126, _1142, _1132);
    bool _1146 = !_1102;
    float _1148 = _1140;
    if (!_1146)
    {
        bool _1150 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1042);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1042 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1136 = _1170;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1042 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1042);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1042 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1136 = _1200;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _1136;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _998 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1218 = _1004 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1222 = _1006 + _1220;
    float _1224 = -_570;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _1228 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1230 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1232 = fma(_1222, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1234 = -_568;
    float _1236 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1238 = -_570;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_600;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_600;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1236 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1240 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1244 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1268 = fma(_1260, _1260, _1264);
    float _1270 = rsqrt(_1268);
    float _1272 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1274 = _1256 * _1272;
    float _1276 = _1260 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 * _1276;
    float _1282 = _1278 + _1280;
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1290 = _1284 + _1288;
    float _1292 = _1270;
    float _1294 = _1290;
    float _1296 = _1210;
    float _1298 = _1252;
    float _1300 = _1276;
    if (_1286)
    {
        float _1302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1302;
    }
    float _1304 = _1292;
    if (_1286)
    {
        float _1306 = rsqrt(_1282);
        _1138 = _1306;
    }
    float _1308 = _1138;
    float _1310 = _1308;
    if (_1286)
    {
        float _1312 = _1290 * _1304;
        _1294 = _1312;
    }
    float _1314 = _1294;
    if (_1286)
    {
        float _1316 = _1314 * 0.15915493667125701904296875;
        _1296 = _1316;
    }
    float _1318 = _1296;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = _1260;
    float _1324 = _1318;
    if (_1286)
    {
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        _1322 = _1328;
    }
    float _1330 = _1322;
    float _1332 = precise::max(0.0, _1320);
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1286)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = cos(_1336);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = -_1272;
    float _1344 = -_1332;
    float _1346 = fma(_1252, _1342, _1344);
    float _1348 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1350 = _1346;
    if (_1286)
    {
        float _1352 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1298 = _1352;
    }
    float _1354 = _1298;
    float _1356 = floor(_1348);
    float _1358 = _1330;
    float _1360 = _1354;
    if (_1286)
    {
        float _1362 = fma(_1330, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1286)
    {
        _1360 = _1274;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    if (_1286)
    {
        float _1372 = _1308 * _1364;
        _1310 = _1372;
    }
    float _1374 = _1310;
    if (!_1286)
    {
        _1366 = _1278;
    }
    float _1376 = _1366;
    float _1378 = _1376;
    float _1380 = _1340;
    if (_1286)
    {
        float _1382 = _1340 + (-1.0);
        _578 = _1382;
    }
    float _1384 = _578;
    if (_1286)
    {
        float _1386 = _1274 * _1374;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1286)
    {
        float _1390 = _1276 * _1374;
        _1300 = _1390;
    }
    float _1392 = _1300;
    if (_1286)
    {
        float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1324 = _1394;
    }
    float _1396 = _1324;
    if (_1286)
    {
        float _1398 = _1388 * _1388;
        _1378 = _1398;
    }
    float _1400 = _1378;
    float _1402 = sqrt(_1268);
    float _1404 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1286)
    {
        float _1406 = fma(_1346, _1340, _1396);
        _1350 = _1406;
    }
    float _1408 = _1350;
    if (!_1286)
    {
        _1380 = _1280;
    }
    float _1410 = _1380;
    float _1412 = _1410;
    if (_1286)
    {
        float _1414 = _1392 * _1392;
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1420 = fma(_1408, _1408, _1400);
    float _1422 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1404);
    float _1426 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1428 = _1420 + _1416;
    float _1430 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1426);
    float _1438 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1440 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1444 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1442);
    float _1446 = precise::clamp(_1444, 0.0, 1.0);
    float _1448 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1450 = rsqrt(_1428);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1438);
    float _1454 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = -_1446;
    float _1460 = _1458 + 1.0;
    float _1462 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1466 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1468 = floor(_1418);
    float _1470 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1472 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1464);
    float _1474 = -_1466;
    float _1476 = fma(_1474, _1266, 1.0);
    float _1478 = -_1356;
    float _1480 = _1348 + _1478;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1472);
    float _1486 = abs(_1460);
    float _1488 = log2(_1486);
    float _1490 = _1450 * _1388;
    float _1492 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1494 = _1450 * _1408;
    float _1496 = _1450 * _1392;
    float _1498 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = 1.0 / _1492;
    float _1504 = -_1498;
    float _1506 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1504);
    float _1508 = -_1468;
    float _1510 = _1418 + _1508;
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1514 = -_1496;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1506);
    float _1518 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1512);
    float _1522 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1524 = fma(_1516, -0.5, 0.5);
    float _1526 = log2(_1476);
    float _1528 = fma(_1516, 0.5, 0.5);
    float _1530 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1532 = _1494 + 1.0;
    float _1534 = fma(_1528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1536 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1530);
    float _1538 = exp2(_1522);
    float _1540 = fma(_1528, _1534, -0.212114393711090087890625);
    float _1542 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1536);
    float _1544 = fma(_1528, _1540, 1.570728778839111328125);
    float _1546 = _1520 * _1502;
    float _1548 = sqrt(_1524);
    float _1550 = _1526 * 0.693147182464599609375;
    float _1552 = fma(_1546, 0.5, 0.5);
    float _1554 = -_1494;
    float _1556 = fma(_1538, _1532, _1554);
    float _1558 = _1542 * _1502;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1562 = fma(_1556, 0.5, 0.5);
    float _1564 = fma(_1558, -0.5, 0.5);
    float _1566 = _1548 * 0.636619746685028076171875;
    float2 _4706 = float2(_1480, _1510);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4706, float2(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4706, float2(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1552, _1564, _1560);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).x;
    float3 _4728 = float3(_1552, _1564, _1560);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4728, float3(0.0), isnan(_4728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4728, float3(0.0), isnan(_4728)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float _1583 = -_1544;
    float _1585 = fma(_1566, _1583, 1.0);
    float2 _4749 = float2(_1585, _1562);
    float3 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = -_568;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _1601 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1605 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1607 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1603);
    float _1609 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1605);
    float _1611 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1613 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1609);
    float _1615 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1619 = 1.0 / _1615;
    float _1621 = _1617 + _1615;
    float _1623 = _1621 * _1619;
    float _1625 = _1623 * 0.5;
    float _1627 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1631 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1629);
    float _1633 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1635 = _1492 * 0.5;
    float _1637 = 1.0 / _1631;
    float _1639 = fma(_1542, -0.5, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1653 = _1637 * _1651;
    float _1655 = abs(_1653);
    float _1657 = log2(_1655);
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1661 = _1492;
    if (_1649)
    {
        _1659 = 1.0;
    }
    float _1663 = _1659;
    float _1665 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1667 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1633);
    float _1669 = _1520 + _1492;
    float _1671 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1673 = exp2(_1665);
    float _1675 = _1669 * 0.5;
    float _1677 = _1671 + _1492;
    out.gl_Position.x = _1520;
    out.gl_Position.y = _1542;
    out.gl_Position.z = _1671;
    out.gl_Position.w = _1492;
    float _1679 = _1677 * 0.5;
    out.m_73.x = _1675;
    out.m_73.y = _1639;
    out.m_73.z = _1679;
    out.m_73.w = _1492;
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = in.m_75.x;
    float _1687 = exp2(_1601);
    float _1689 = fma(_1683, -2.0, 3.0);
    float _1691 = _1683 * _1683;
    bool _1693 = _1653 <= 8000.0;
    bool _1695 = isnan(_1653);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(8000.0);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1691 * _1689;
    float _1707 = -_1705;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1705);
    float _1713 = _1703 * _1711;
    float _1715 = _1711;
    float _1717 = _1663;
    if (_1649)
    {
        _1715 = 1.0;
    }
    float _1719 = _1715;
    float _1721 = _1719;
    float _1723 = _1581;
    float _1725 = _1579;
    if (!_1649)
    {
        float _1727 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = _1727 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = 1.0 / _1737;
        float _1749 = _1741 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = _1741 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        float _1759 = _1751 * _1753;
        float _1761 = 1.0 / _1731;
        float _1763 = 1.0 / _1759;
        float _1765 = _1757 * _1763;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = fma(_1653, _1765, _1767);
        float _1771 = _1769 * _1761;
        float _1773 = precise::clamp(_1771, 0.0, 1.0);
        _1721 = _1773;
        _1661 = _1759;
    }
    float _1775 = _1721;
    float _1777 = _1661;
    float _1779 = _1777;
    if (!_1649)
    {
        float _1781 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1783 = _1781 * 0.15915493667125701904296875;
        float _1785 = _1783 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        float _1789 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1783 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = 1.0 / _1787;
        float _1799 = _1791 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = _1795 * _1797;
        float _1805 = _1791 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = _1801 * _1803;
        float _1811 = 1.0 / _1809;
        float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1815 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1813;
        float _1817 = 1.0 / _1815;
        float _1819 = _1807 * _1811;
        float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1823 = fma(_1653, _1819, _1821);
        float _1825 = _1823 * _1817;
        float _1827 = precise::clamp(_1825, 0.0, 1.0);
        float _1829 = -_1827;
        float _1831 = _1829 + 1.0;
        _1717 = _1831;
        _1779 = _1815;
    }
    float _1833 = _1717;
    float _1835 = _1779;
    float _1837 = -_1687;
    float _1839 = _1837 + 1.0;
    float _1841 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1843 = -_1568;
    float _1845 = _1843 + 1.0;
    float _1847 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1849 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1402);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = _1845 * _1841;
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = _1847 * _1570;
    float _1865 = -_1847;
    float _1867 = _1865 + 1.0;
    float _1869 = -_1861;
    float _1871 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1873 = _1581 * _1863;
    float _1875 = _1595 * _1863;
    float _1877 = _1871 * _1685;
    float _1879 = _1581 * _1867;
    float _1881 = fma(_1591, _1873, _1575);
    float _1883 = fma(_1593, _1873, _1577);
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1887 = fma(_1581, _1875, _1579);
    float _1889 = _1775 * _1833;
    float _1891 = _1835;
    float _1893 = _1867;
    float _1895 = _1889;
    float _1897 = _1861;
    if (!_1857)
    {
        _1723 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1899 = _1723;
    out.m_77.x = _1885;
    float _1901 = _1144 * _1889;
    float _1903 = _1899;
    float _1905 = _1899;
    if (!_1857)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1907 = _1891;
    out.m_79.x = _1881;
    out.m_79.y = _1883;
    out.m_79.z = _1887;
    out.m_79.w = _1879;
    float _1909 = _1907;
    float _1911 = _1907;
    if (!_1857)
    {
        _1725 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1725;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1857)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1893;
    float _1921 = _1919;
    float _1923 = _1919;
    if (!_1857)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1925 = _1895;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1857)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1931 = _1897;
    bool _1933 = !_1857;
    float _1935 = _1931;
    float _1937 = _1931;
    if (!_1933)
    {
        bool _1939 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1941 = isnan(_1402);
        bool _1943 = _1939 || _1941;
        bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1947 = _1943 || _1945;
        if (!_1947)
        {
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = _1402 + _1949;
            float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1953;
            float _1957 = 1.0 / _1955;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1951 * _1957;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1977, _1985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1993 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1995 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1997 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1991;
            _1929 = _1995;
            _1905 = _1989;
            _1923 = _1993;
            _1917 = _1987;
            _1937 = _1997;
            _1999 = true;
        }
        else
        {
            bool _2001 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2003 = isnan(_1402);
            bool _2005 = _2001 || _2003;
            bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2009 = _2005 || _2007;
            if (!_2009)
            {
                _1903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2011 = _1903;
            _1905 = _2011;
            if (!_2009)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2013 = _1909;
            _1911 = _2013;
            if (!_2009)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2015 = _1915;
            _1917 = _2015;
            if (!_2009)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2017 = _1921;
            _1923 = _2017;
            if (!_2009)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2019 = _1927;
            _1929 = _2019;
            if (!_2009)
            {
                _1935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2021 = _1935;
            bool _2023 = !_2009;
            _1937 = _2021;
            if (!_2023)
            {
                bool _2025 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2027 = isnan(_1402);
                bool _2029 = _2025 || _2027;
                bool _2031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2033 = _2029 || _2031;
                if (!_2033)
                {
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = _1402 + _2035;
                    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2039;
                    float _2043 = 1.0 / _2041;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2037 * _2043;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2063, _2071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2079 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2081 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2083 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2077;
                    _1929 = _2081;
                    _1905 = _2075;
                    _1923 = _2079;
                    _1917 = _2073;
                    _1937 = _2083;
                    _1999 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1999 = false;
    float _2085 = _1911;
    float _2087 = _1929;
    float _2089 = _1905;
    float _2091 = _1923;
    float _2093 = _1917;
    float _2095 = _1937;
    float _2097 = fma(_1062, -0.5, 0.5);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = _1901 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2107 = -_2089;
    float _2109 = _2107 + _2091;
    out.m_81.x = 0.0;
    float _2111 = fma(_2099, _2103, _2085);
    float _2113 = -_2093;
    float _2115 = _2113 + _2095;
    out.m_51.x = _2105;
    float _2117 = fma(_2099, _2109, _2089);
    float _2119 = _2111 * 0.586610972881317138671875;
    bool _2121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = fma(_2099, _2115, _2093);
    float _2125 = fma(_2117, 0.298911988735198974609375, _2119);
    bool _2127 = _1775 > 0.0;
    bool _2129 = isnan(_1775);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan(0.0);
    bool _2135 = _2131 || _2133;
    float _2137 = fma(_2123, 0.114477999508380889892578125, _2125);
    bool _2139 = _1833 <= 0.0;
    bool _2141 = !_2135;
    bool _2143 = _2139 || _2141;
    float _2145 = -_2137;
    float _2147 = _2117 + _2145;
    float _2149 = -_2137;
    float _2151 = _2111 + _2149;
    float _2153 = -_2137;
    float _2155 = _2123 + _2153;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    float _2161 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2137);
    bool _2163 = !_2121;
    if (!_2163)
    {
        float _2165 = -_1236;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2169 = -_1240;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2173 = -_1244;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2177 = _2167 * _2167;
        float _2179 = fma(_2171, _2171, _2177);
        float _2181 = fma(_2175, _2175, _2179);
        float _2183 = sqrt(_2181);
        float _2185 = rsqrt(_2181);
        float _2187 = -_2183;
        float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = _2171 * _2185;
        float _2197 = _2167 * _2185;
        float _2199 = abs(_2193);
        float _2201 = log2(_2199);
        float _2203 = _2175 * _2185;
        float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2207 = _1062 * _2197;
        float _2209 = -_2197;
        float _2211 = -_2205;
        float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
        float _2215 = fma(_1060, _2195, _2207);
        float _2217 = -_2203;
        float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
        float _2221 = fma(_1082, _2203, _2215);
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2227 = _2219 + _2225;
        float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        float _2235 = exp2(_2229);
        float _2237 = _2235 * _2233;
        float _2239 = _2223 * _2237;
        float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2241;
        out.m_81.y = _2243;
        out.m_81.z = _2245;
    }
    out.m_83.x = _2157;
    out.m_83.y = _2159;
    out.m_83.z = _2161;
    if (!_2143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2247;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

