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
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2051 = false;
    bool _1274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_48.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2355 = as_type<float>(_118);
        out.gl_Position.z = _2355;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_53.w;
    float _124 = float(_104);
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
    float _146 = _122;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
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
        float _2419 = as_type<float>(_152);
        out.gl_Position.z = _2419;
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
    float _164 = in.m_57.x;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _168 = _166 != 0;
    float _170 = in.m_59.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = in.m_59.y;
    float _176 = _128 * _160;
    float _178 = in.m_57.y;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = in.m_59.w;
    float _184 = _176 * 3.1415927410125732421875;
    float _186 = abs(_154);
    float _188 = abs(_158);
    float _190 = precise::max(_186, _188);
    float _192 = -_158;
    float _194 = fma(_180, _158, _192);
    float _196 = -_154;
    float _198 = fma(_180, _154, _196);
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    bool _206 = _190 >= 16.0;
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _212 = _162 * _172;
    float _214 = 0.0;
    float _216 = _158;
    float _218 = _154;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _222 = _164;
    if (!_168)
    {
        _214 = _164;
    }
    float _224 = _214;
    float _226 = _224;
    if (_206)
    {
        float _228 = _158 * 0.0625;
        _216 = _228;
    }
    float _230 = _216;
    if (_206)
    {
        float _232 = _154 * 0.0625;
        _218 = _232;
    }
    float _234 = _218;
    float _236 = abs(_230);
    bool _238 = _236 != 0.0;
    bool _240 = isnan(_236);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = abs(_234);
    bool _250 = _248 == 0.0;
    bool _252 = !_246;
    bool _254 = _250 && _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _266 = _264 != 0;
    int _268 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _270 = _268 != 0;
    bool _272 = !_262;
    int _274 = _272 ? 0 : 1;
    float _276 = abs(_234);
    bool _278 = _276 == 0.0;
    bool _280 = !_258;
    int _282 = _280 ? 0 : 1;
    bool _284 = _258;
    int _286 = _246 ? (-1) : 0;
    bool _288 = _254;
    int _290 = as_type<int>(_234);
    if (_254)
    {
        bool _292 = as_type<int>(_234) >= 0;
        _284 = _292;
    }
    bool _294 = _284;
    if (_254)
    {
        int _296 = _294 ? 0 : 1078530011;
        _220 = _296;
    }
    int _298 = _220;
    float _300 = 0.0;
    int _302 = _298;
    if (_254)
    {
        int _304 = int(0x80000000) & as_type<int>(_230);
        int _306 = _298 | _304;
        _300 = as_type<float>(_306);
    }
    float _308 = _300;
    bool _310 = !_246;
    bool _312 = _310 && _278;
    float _314 = _308;
    float _316 = _308;
    float _318 = _178;
    if (!_312)
    {
        float _320 = abs(_230);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_234);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_234);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _288 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_234) >= 0;
            _286 = _344 ? (-1) : 0;
        }
        int _346 = _286;
        if (_342)
        {
            _302 = 1075235812;
        }
        int _348 = _302;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        if (_342)
        {
            int _358 = int(0x80000000) & as_type<int>(_230);
            int _360 = _356 | _358;
            _314 = as_type<float>(_360);
        }
        float _362 = _314;
        bool _364 = !_330;
        bool _366 = _364 && _334;
        _316 = _362;
        if (!_366)
        {
            float _368 = abs(_234);
            float _370 = abs(_230);
            float _372 = precise::max(_368, _370);
            float _374 = abs(_234);
            float _376 = abs(_230);
            float _378 = _374 + _376;
            float _380 = abs(_234);
            float _382 = abs(_230);
            float _384 = precise::min(_380, _382);
            float _386 = 1.0 / _372;
            float _388 = abs(_230);
            float _390 = abs(_234);
            bool _392 = _388 > _390;
            bool _394 = as_type<int>(_234) >= 0;
            bool _396 = _378 > as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_378);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = _384 * _386;
            float _408 = _406 * _406;
            float _410 = _408 + 11.33538818359375;
            float _412 = fma(_408, _410, 28.84246826171875);
            float _414 = fma(_408, _412, 19.6966705322265625);
            float _416 = fma(_408, -0.82336294651031494140625, -5.674867153167724609375);
            float _418 = fma(_408, _416, -6.565555095672607421875);
            float _420 = 1.0 / _414;
            float _422 = _408 * _418;
            float _424 = _406 * _422;
            float _426 = fma(_424, _420, _406);
            int _428 = as_type<int>(_230) & int(0x80000000);
            float _430 = _426;
            _316 = _378;
            if (_392)
            {
                float _432 = -_426;
                float _434 = _432 + 1.57079637050628662109375;
                _430 = _434;
            }
            float _436 = _430;
            int _438 = as_type<int>(_436);
            if (!_394)
            {
                float _440 = -_436;
                float _442 = _440 + 3.1415927410125732421875;
                _438 = as_type<int>(_442);
            }
            int _444 = _438;
            if (!_404)
            {
                int _446 = _428 | _444;
                _316 = as_type<float>(_446);
            }
        }
    }
    bool _448 = _288;
    float _450 = _316;
    float _452 = _184 * 0.15915493667125701904296875;
    float _454 = -_178;
    float _456 = _454 + 1.0;
    float _458 = in.m_61.x;
    float _460 = in.m_61.y;
    float _462 = in.m_61.z;
    bool _464 = _174 > 0.5;
    bool _466 = _448;
    if (_168)
    {
        float _468 = -_164;
        float _470 = _468 + 1.0;
        _290 = as_type<int>(_470);
    }
    int _472 = _290;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = _452 * 6.283185482025146484375;
    float _480 = sin(_478);
    int _482 = _464 ? as_type<int>(_456) : as_type<int>(_178);
    float _484 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_168)
    {
        bool _486 = _170 > 0.5;
        _466 = _486;
    }
    bool _488 = _466;
    float _490 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _182 > 0.5;
    float _494 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _496 = _476 ? as_type<float>(_482) : _178;
    float _498 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_168)
    {
        float _502 = _488 ? as_type<float>(_472) : _164;
        _226 = _502;
    }
    float _504 = _226;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _508 = _492 ? as_type<int>(_456) : as_type<int>(_178);
    float _510 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _514 = _512 != 0;
    float _516 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _520 = _518 != 0;
    float _522 = 0.0 + _480;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _534 = _532 != 0;
    float _536 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _538 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _540 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _542 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _544 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = -_156;
    float _552 = fma(_524, _156, _550);
    float _554 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _554 + _580;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _566;
    out.m_63.y = _568;
    out.m_63.z = _570;
    out.m_63.w = _564;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _578 + _594;
    float _598 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _600 = -_584;
    float _602 = fma(_490, 2.0, _600);
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.x = _588;
    out.m_65.y = _590;
    out.m_65.z = _592;
    out.m_65.w = _586;
    float _606 = _528 ? as_type<float>(_508) : _178;
    float _608 = fma(_604, _496, -0.5);
    float _610 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _614 = in.m_59.z;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = _582 * _582;
    float _620 = fma(_516, -2.0, _612);
    float _622 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _624 = fma(_596, _596, _618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _598 + _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _632 = fma(_606, _610, -0.5);
    float _634 = fma(_628, _628, _624);
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _640 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].w, _630);
    float _642 = _624;
    float _644 = _530;
    float _646 = _636;
    int _648 = as_type<int>(_620);
    int _650 = as_type<int>(_616);
    float _652 = _632;
    if (!_266)
    {
        _642 = _174;
    }
    float _654 = _642;
    float _656 = _636 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _658 = rsqrt(_634);
    float _660 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].w, _638);
    float _662 = _654;
    if (!_266)
    {
        _644 = _654;
    }
    float _664 = _644;
    float _666 = _656 * 12.0;
    float _668 = _656 * 6.0;
    float _670 = _664;
    if (_266)
    {
        _662 = _174;
    }
    float _672 = _662;
    float _674 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _640);
    float _676 = fma(_450, 4.0, _666);
    float _678 = -_668;
    float _680 = fma(_450, 3.0, _678);
    bool _682 = _614 > 0.5;
    float _684 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _620);
    float _686 = _676 * 0.15915493667125701904296875;
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _614;
    if (_534)
    {
        float _692 = _682 ? _456 : _178;
        _318 = _692;
    }
    float _694 = _318;
    float _696 = -_684;
    float _698 = fma(_674, _608, _696);
    if (_266)
    {
        _646 = _170;
    }
    float _700 = _646;
    float _702 = _582 * _658;
    float _704 = _686 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _596 * _658;
    float _710 = _628 * _658;
    float _712 = -_702;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _720 = _700;
    if (!_266)
    {
        _720 = _614;
    }
    float _722 = _720;
    float _724 = _714 * _714;
    float _726 = _688 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _628);
    float _734 = _450 + 3.1415927410125732421875;
    float _736 = fma(_718, _718, _724);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _656 * 6.283185482025146484375;
    float _744 = fma(_732, _732, _736);
    float _746 = _740;
    if (_514)
    {
        float _748 = -_164;
        float _750 = _748 + 1.0;
        _648 = as_type<int>(_750);
    }
    int _752 = _648;
    float _754 = -_738;
    float _756 = fma(_740, 2.0, _754);
    float _758 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _760 = _742 * 0.15915493667125701904296875;
    float _762 = as_type<float>(_752);
    if (_520)
    {
        float _764 = -_164;
        float _766 = _764 + 1.0;
        _650 = as_type<int>(_766);
    }
    int _768 = _650;
    float _770 = fma(_758, _694, -0.5);
    float _772 = _706 + _728;
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = _760 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_266)
    {
        _670 = _170;
    }
    float _782 = _670;
    float _784 = fma(_772, 0.25, 0.5);
    if (!_514)
    {
        _746 = _164;
    }
    float _786 = _746;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _790 = _788 + 2.0;
    float _792 = _786;
    if (_514)
    {
        float _794 = _682 ? as_type<float>(_752) : _164;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _774 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    if (!_520)
    {
        _762 = _164;
    }
    float _804 = _762;
    float _806 = _782 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _808 = _804;
    if (_520)
    {
        float _810 = _464 ? as_type<float>(_768) : _164;
        _808 = _810;
    }
    float _812 = _808;
    float _814 = fma(_784, _790, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _816 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = sqrt(_744);
    float _820 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_266)
    {
        _222 = _614;
    }
    float _822 = _222;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _826 = _822;
    if (_266)
    {
        _826 = _672;
    }
    float _828 = _826;
    float _830 = fma(_778, 0.10000002384185791015625, 1.0);
    float _832 = fma(_800, 0.5, 0.5);
    float _834 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _824);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _840 = _832 * _814;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _846 = _840 * _622;
    float _848 = _658 * _818;
    float _850 = -_842;
    float _852 = fma(_806, 2.0, _850);
    float _854 = _832;
    if (_266)
    {
        _690 = _672;
    }
    float _856 = _690;
    float _858 = fma(_846, _838, 1.0);
    float _860 = _816 * _848;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _864 = _820 * _848;
    float _866 = _210 * _858;
    float _868 = _208 * _858;
    float _870 = _860 * _862;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _874 = _834 * _848;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _868);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _880 = _864 * _872;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _884 = _874 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_266)
    {
        _854 = _672;
    }
    float _890 = _854;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _894 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[8].x, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[10].x, _888);
    float _898 = _844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, _894);
    float _902 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, _896);
    float _904 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _212);
    float _906 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _882);
    float _908 = _578 + _900;
    float _910 = _598 + _902;
    float _912 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _892);
    float _914 = _890;
    float _916 = _908;
    float _918 = _910;
    if (!_266)
    {
        _914 = _170;
    }
    float _920 = _914;
    float _922 = fma(_898, _504, -0.5);
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _908 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _910 + _928;
    float _932 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _936 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _938 = _926 * _926;
    float _940 = _930 * _930;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _944 = fma(_936, -2.0, _934);
    float _946 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _906);
    float _948 = _938 + _940;
    float _950 = fma(_932, _796, -0.5);
    bool _952 = _846 != 0.0;
    bool _954 = isnan(_846);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = in.m_67.x;
    float _964 = in.m_67.y;
    float _966 = in.m_67.z;
    float _968 = sqrt(_948);
    float _970 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _802);
    float _972 = -_128;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    bool _976 = _866 == 0.0;
    bool _978 = !_960;
    bool _980 = _976 && _978;
    float _982 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _984 = _920 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _986 = -_128;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    bool _990 = _868 == 0.0;
    bool _992 = _990 && _980;
    float _994 = _942 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _996 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _998 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _1000 = floor(_904);
    float _1002 = fma(_994, _812, -0.5);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1006 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _944);
    float _1008 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    bool _1010 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = fma(_984, -2.0, _1004);
    float _1014 = fma(_946, _922, _988);
    float _1016 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _912);
    float _1018 = -_128;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[86].x, _756);
    float _1022 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _660);
    float _1024 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    float _1026 = -_1006;
    float _1028 = fma(_998, _632, _1026);
    float _1030 = _554 + _1008;
    float _1032 = fma(_970, _950, _974);
    float _1034 = fma(_1016, _1002, _1020);
    float _1036 = -_1024;
    float _1038 = fma(_1022, _770, _1036);
    float _1040 = _964;
    float _1042 = _938;
    float _1044 = _940;
    float _1046 = _962;
    float _1048 = _966;
    if (!_992)
    {
        float _1050 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (!_1010)
    {
        _652 = _1030;
    }
    float _1054 = _652;
    bool _1056 = !_1010;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _968 + _1062;
        float _1066 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_948);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = _1068 * _1082;
        float _1086 = fma(_926, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = _1080 + (-1.0);
        float _1090 = fma(_930, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1094 = _1086 + _1092;
        float _1096 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1100 = _1090 + _1098;
        float _1102 = _1094 * _1094;
        float _1104 = fma(_1030, _1080, _1096);
        float _1106 = _1100 * _1100;
        _1058 = _1104;
        _1042 = _1102;
        _1044 = _1106;
        _916 = _1086;
        _918 = _1090;
    }
    float _1108 = _1058;
    float _1110 = _1042;
    float _1112 = _1044;
    float _1114 = _916;
    float _1116 = _918;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1120 = _1108 + _1118;
    float _1122 = _1116;
    if (!_992)
    {
        float _1124 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1046 = _1124;
    }
    float _1126 = _1046;
    float _1128 = -_1000;
    float _1130 = _904 + _1128;
    float _1132 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1134 = fma(_1120, _1120, _1110);
    float _1136 = _904 * 6.283185482025146484375;
    float _1138 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1140 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = _1134 + _1112;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1132);
    float _1146 = _1136 * 0.15915493667125701904296875;
    if (!_992)
    {
        float _1148 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1048 = _1148;
    }
    float _1150 = _1048;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1138);
    float _1154 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1156 = sqrt(_1142);
    int _1158 = abs(_282);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1162 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1152);
    float _1164 = _698 + 0.5;
    float _1166 = _1034 + 0.5;
    float _1168 = _1014 + 0.5;
    float _1170 = _1032 + 0.5;
    float _1172 = _1146 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1028 + 0.5;
    float _1178 = _1038 + 0.5;
    float _1180 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1154);
    bool _1182 = !_270;
    int _1184 = _1182 ? 0 : 1;
    out.m_69.x = _1168;
    out.m_69.y = _1164;
    out.m_69.z = _1170;
    out.m_69.w = _1176;
    int _1186 = abs(_1184);
    out.m_71.x = _1166;
    out.m_71.y = _1178;
    float _1188 = float(_1158);
    float _1190 = -_1130;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1194 = abs(_274);
    out.m_73.x = _1160;
    out.m_73.y = _1162;
    out.m_73.z = _1180;
    bool _1196 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1204 = _1200 || _1202;
    float _1206 = fma(_1174, 0.5, 0.5);
    float _1208 = abs(_1192);
    float _1210 = _1188 * _1208;
    bool _1212 = _1130 < 0.5;
    float _1214 = float(_1212);
    float _1216 = -_1206;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1220 = float(_1186);
    float _1222 = -_1214;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1194);
    float _1228 = fma(_1220, _1218, _1210);
    float _1230 = abs(_1224);
    float _1232 = fma(_1226, _1230, _1228);
    float _1234 = _1228;
    float _1236 = _1210;
    float _1238 = _1232;
    if (!_1204)
    {
        _1234 = 1.0;
    }
    float _1240 = _1234;
    bool _1242 = !_1204;
    float _1244 = _1240;
    if (!_1242)
    {
        bool _1246 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1248 = isnan(_1156);
        bool _1250 = _1246 || _1248;
        bool _1252 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1254 = _1250 || _1252;
        if (!_1254)
        {
            float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1258 = _1156 + _1256;
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1266 = _1264 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1268 = 1.0 / _1262;
            float _1270 = _1258 * _1268;
            float _1272 = fma(_1270, _1266, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1244 = _1272;
            _1274 = true;
        }
        else
        {
            bool _1276 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1278 = isnan(_1156);
            bool _1280 = _1276 || _1278;
            bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1284 = _1280 || _1282;
            if (!_1284)
            {
                float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1288 = _1156 + _1286;
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1290 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1298 = 1.0 / _1292;
                float _1300 = _1288 * _1298;
                float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1244 = _1302;
                _1274 = true;
            }
            else
            {
                _1244 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1274 = false;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1308 = _1108 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1312 = _1114 + _1310;
    float _1314 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1116 + _1316;
    float _1320 = fma(_1312, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1322 = -_702;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1326 = fma(_1318, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1328 = -_708;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1334 = _1324 + _1332;
    float _1336 = -_710;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = _1334 * _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1348 = _1338 + _1346;
    float _1350 = fma(_1342, _1342, _1344);
    float _1352 = fma(_1348, _1348, _1350);
    float _1354 = rsqrt(_1352);
    float _1356 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1358 = _1342 * _1356;
    float _1360 = _1348 * _1356;
    float _1362 = _1358 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 + _1364;
    float _1368 = sqrt(_1366);
    bool _1370 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1368 + _1372;
    float _1376 = _1348;
    float _1378 = _1366;
    float _1380 = _1374;
    if (_1370)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (_1370)
    {
        float _1386 = rsqrt(_1366);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (_1370)
    {
        float _1392 = _1374 * _1384;
        _1380 = _1392;
    }
    float _1394 = _1380;
    if (_1370)
    {
        float _1396 = _1394 * 0.15915493667125701904296875;
        _1236 = _1396;
    }
    float _1398 = _1236;
    float _1400 = _1344;
    float _1402 = _1398;
    if (_1370)
    {
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1412 = precise::max(0.0, _1410);
    float _1414 = _1354;
    float _1416 = _1412;
    float _1418 = _1410;
    if (_1370)
    {
        float _1420 = _1398 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = -_1356;
    float _1428 = -_1412;
    float _1430 = fma(_1334, _1426, _1428);
    float _1432 = -_708;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    if (_1370)
    {
        float _1436 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = _1438;
    float _1442 = _1408;
    if (_1370)
    {
        float _1444 = _1408 + (-1.0);
        _1418 = _1444;
    }
    float _1446 = _1418;
    float _1448 = _1446;
    if (!_1370)
    {
        _1402 = _1362;
    }
    float _1450 = _1402;
    float _1452 = sqrt(_1352);
    float _1454 = _1450;
    if (_1370)
    {
        float _1456 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1456;
    }
    float _1458 = _1448;
    float _1460 = _1424;
    float _1462 = _1458;
    if (_1370)
    {
        float _1464 = fma(_1424, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1464;
    }
    float _1466 = _1440;
    if (!_1370)
    {
        _1460 = _1430;
    }
    float _1468 = _1460;
    float _1470 = _1468;
    if (_1370)
    {
        float _1472 = fma(_1430, _1408, _1458);
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (!_1370)
    {
        _1442 = _1358;
    }
    float _1476 = _1442;
    float _1478 = _1476;
    if (_1370)
    {
        float _1480 = _1388 * _1466;
        _1122 = _1480;
    }
    float _1482 = _1122;
    if (!_1370)
    {
        _1462 = _1360;
    }
    float _1484 = _1462;
    float _1486 = _1484;
    if (!_1370)
    {
        _1390 = _1364;
    }
    float _1488 = _1390;
    float _1490 = _1488;
    if (_1370)
    {
        float _1492 = _1358 * _1482;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1370)
    {
        float _1496 = _1360 * _1482;
        _1486 = _1496;
    }
    float _1498 = _1486;
    float _1500 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1370)
    {
        float _1502 = _1494 * _1494;
        _1454 = _1502;
    }
    float _1504 = _1454;
    if (_1370)
    {
        float _1506 = _1498 * _1498;
        _1490 = _1506;
    }
    float _1508 = _1490;
    float _1510 = fma(_1474, _1474, _1504);
    float _1512 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1514 = _1510 + _1508;
    float _1516 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1512);
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1518);
    float _1522 = precise::clamp(_1520, 0.0, 1.0);
    float _1524 = -_710;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1528 = rsqrt(_1514);
    float _1530 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1516);
    float _1532 = -_1522;
    float _1534 = _1532 + 1.0;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1544 = abs(_1534);
    float _1546 = log2(_1544);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1552 = -_1548;
    float _1554 = fma(_1552, _1536, 1.0);
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1560 = _1528 * _1494;
    float _1562 = _1528 * _1474;
    float _1564 = _1528 * _1498;
    float _1566 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1568 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1572 = floor(_1542);
    float _1574 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1578 = -_1570;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = floor(_1550);
    float _1592 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1582);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1564;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1600 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1602 = fma(_1598, -0.5, 0.5);
    float _1604 = log2(_1554);
    float _1606 = -_1572;
    float _1608 = _1542 + _1606;
    float _1610 = fma(_1598, 0.5, 0.5);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1614 = _1562 + 1.0;
    float _1616 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1612);
    float _1618 = exp2(_1588);
    float _1620 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1622 = -_1590;
    float _1624 = _1550 + _1622;
    float _1626 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1616);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1632 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = fma(_1610, _1626, -0.212114393711090087890625);
    float _1636 = sqrt(_1602);
    float _1638 = _1604 * 0.693147182464599609375;
    float _1640 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1642 = fma(_1610, _1634, 1.570728778839111328125);
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1640);
    float _1650 = 1.0 / _1630;
    float _1652 = -_1562;
    float _1654 = fma(_1618, _1614, _1652);
    float _1656 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float2 _4936 = float2(_1608, _1624);
    float _1658 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1660 = fma(_1654, 0.5, 0.5);
    float _1662 = _1636 * 0.636619746685028076171875;
    float _1664 = _1644 * _1650;
    float _1666 = _1656 * _1650;
    float _1668 = -_1642;
    float _1670 = fma(_1662, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float _1674 = fma(_1666, -0.5, 0.5);
    float3 _4967 = float3(_1672, _1674, _1646);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4967, float3(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4967, float3(0.0), isnan(_4967)), level(0.0)).x;
    float3 _4978 = float3(_1672, _1674, _1646);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4978, float3(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4978, float3(0.0), isnan(_4978)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float2 _4994 = float2(_1670, _1660);
    float3 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4994, float2(0.0), isnan(_4994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4994, float2(0.0), isnan(_4994)), level(0.0)).xyz;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = -_702;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1705 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1707 = isnan(_1452);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1717 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1719 = in.m_75.x;
    float _1721 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1715);
    float _1723 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1725 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1717);
    float _1727 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1721);
    float _1729 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1723);
    float _1731 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1725);
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1729);
    float _1737 = 1.0 / _1733;
    float _1739 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1741 = _1739 + _1733;
    float _1743 = _1741 * _1737;
    float _1745 = _1743 * 0.5;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1749 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
    float _1751 = 1.0 / _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1755 = _1751 * _1753;
    float _1757 = abs(_1755);
    float _1759 = log2(_1757);
    bool _1761 = _1755 <= 8000.0;
    bool _1763 = isnan(_1755);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(8000.0);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    float _1773 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1775 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(0.5);
    bool _1783 = _1779 || _1781;
    float _1785 = exp2(_1773);
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1789 = _1703;
    float _1791 = _1755;
    float _1793 = _1630;
    if (!_1783)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1795 = _1787;
    float _1797 = _1795;
    if (!_1783)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1755 + _1799;
        _1789 = _1801;
    }
    float _1803 = _1789;
    if (!_1783)
    {
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = _1755 + _1805;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1817 = _1809;
    if (!_1783)
    {
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1821 = _1795 + _1819;
        _1797 = _1821;
    }
    float _1823 = _1797;
    float _1825 = _1731 + _1630;
    float _1827 = fma(_1813, -2.0, 3.0);
    float _1829 = _1813 * _1813;
    float _1831 = 2.0;
    float _1833 = _1825;
    if (!_1783)
    {
        float _1835 = 1.0 / _1823;
        _1831 = _1835;
    }
    float _1837 = _1831;
    float _1839 = _1829 * _1827;
    float _1841 = -_1839;
    float _1843 = _1841 + 1.0;
    float _1845 = exp2(_1815);
    float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1839);
    float _1849 = _1839;
    if (_1783)
    {
        _1849 = 1.0;
    }
    float _1851 = _1849;
    float _1853 = _1825 * 0.5;
    float _1855 = _1851;
    if (!_1783)
    {
        _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1857 = _1833;
    float _1859 = _1771 * _1847;
    float _1861 = _1857;
    if (!_1783)
    {
        float _1863 = _1803 * _1837;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        _1855 = _1865;
    }
    float _1867 = _1855;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1630;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1783)
    {
        float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1873 = _1857 + _1871;
        _1861 = _1873;
    }
    float _1875 = _1861;
    out.m_77.z = _1853;
    out.m_77.w = _1630;
    float _1877 = -_1845;
    float _1879 = _1877 + 1.0;
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1731;
    if (!_1783)
    {
        float _1885 = 1.0 / _1875;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1881;
    float _1891 = _1889 + 1.0;
    float _1893 = _1891;
    if (!_1713)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1895 = _1793;
    float _1897 = _1887;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1783)
    {
        float _1903 = _1809 * _1887;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1817 = _1905;
    }
    float _1907 = _1817;
    if (!_1713)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1909 = _1897;
    float _1911 = -_1658;
    float _1913 = _1911 + 1.0;
    float _1915 = _1913 * _1869;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -_1917;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = _1921 * _1719;
    float _1925 = _1923 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = _1925;
    float _1927 = _1881 * _1676;
    float _1929 = _1687 * _1927;
    float _1931 = _1697 * _1927;
    float _1933 = _1687 * _1891;
    float _1935 = _1685;
    float _1937 = _1929;
    float _1939 = _1909;
    float _1941 = _1909;
    if (_1783)
    {
        _1893 = 1.0;
    }
    float _1943 = _1893;
    float _1945 = fma(_1693, _1929, _1681);
    float _1947 = fma(_1695, _1929, _1683);
    float _1949 = fma(_1687, _1931, _1685);
    float _1951 = _1943;
    if (!_1783)
    {
        float _1953 = -_1907;
        float _1955 = _1953 + 1.0;
        _1951 = _1955;
    }
    float _1957 = _1951;
    if (!_1713)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1959 = _1935;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1713)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1937;
    out.m_81.x = _1945;
    out.m_81.y = _1947;
    out.m_81.z = _1949;
    out.m_81.w = _1933;
    float _1967 = _1867 * _1957;
    float _1969 = _1232 * _1967;
    float _1971 = _1967;
    float _1973 = _1965;
    float _1975 = _1965;
    if (!_1713)
    {
        _1238 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1977 = _1238;
    float _1979 = _1977;
    float _1981 = _1977;
    if (!_1713)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1983 = _1971;
    bool _1985 = !_1713;
    float _1987 = _1983;
    float _1989 = _1983;
    if (!_1985)
    {
        bool _1991 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1993 = isnan(_1452);
        bool _1995 = _1991 || _1993;
        bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1999 = _1995 || _1997;
        if (!_1999)
        {
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2003 = _1452 + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2005;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2013 = 1.0 / _2007;
            float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2031 = _2003 * _2013;
            float _2033 = precise::clamp(_2031, 0.0, 1.0);
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = fma(_2033, _2011, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2041 = fma(_2033, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2043 = fma(_2033, _2017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2045 = fma(_2033, _2021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2047 = fma(_2033, _2025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2049 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1963 = _2039;
            _1975 = _2047;
            _1901 = _2043;
            _1941 = _2045;
            _1981 = _2041;
            _1989 = _2049;
            _2051 = true;
        }
        else
        {
            bool _2053 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2055 = isnan(_1452);
            bool _2057 = _2053 || _2055;
            bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2061 = _2057 || _2059;
            if (!_2061)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2063 = _1899;
            _1901 = _2063;
            if (!_2061)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2065 = _1961;
            _1963 = _2065;
            if (!_2061)
            {
                _1979 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2067 = _1979;
            _1981 = _2067;
            if (!_2061)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2069 = _1939;
            _1941 = _2069;
            if (!_2061)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2071 = _1973;
            _1975 = _2071;
            if (!_2061)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2073 = _1987;
            bool _2075 = !_2061;
            _1989 = _2073;
            if (!_2075)
            {
                bool _2077 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2079 = isnan(_1452);
                bool _2081 = _2077 || _2079;
                bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2085 = _2081 || _2083;
                if (!_2085)
                {
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2089 = _1452 + _2087;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2091;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2099 = 1.0 / _2093;
                    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2117 = _2089 * _2099;
                    float _2119 = precise::clamp(_2117, 0.0, 1.0);
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = fma(_2119, _2097, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1963 = _2125;
                    _1975 = _2133;
                    _1901 = _2129;
                    _1941 = _2131;
                    _1981 = _2127;
                    _1989 = _2135;
                    _2051 = true;
                }
                else
                {
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1981 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2051 = false;
    float _2137 = _1963;
    float _2139 = _1975;
    float _2141 = _1901;
    float _2143 = _1941;
    float _2145 = _1981;
    float _2147 = _1989;
    float _2149 = fma(_1162, -0.5, 0.5);
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = -_2137;
    float _2155 = _2153 + _2139;
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = -_2141;
    float _2161 = _2159 + _2143;
    out.m_83.x = 0.0;
    float _2163 = fma(_2151, _2155, _2137);
    float _2165 = fma(_2151, _2161, _2141);
    out.m_51.x = _2157;
    float _2167 = -_2145;
    float _2169 = _2167 + _2147;
    float _2171 = _2163 * 0.586610972881317138671875;
    bool _2173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2175 = fma(_2151, _2169, _2145);
    float _2177 = fma(_2165, 0.298911988735198974609375, _2171);
    bool _2179 = _1867 > 0.0;
    bool _2181 = isnan(_1867);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = fma(_2175, 0.114477999508380889892578125, _2177);
    bool _2191 = _1957 <= 0.0;
    bool _2193 = !_2187;
    bool _2195 = _2191 || _2193;
    float _2197 = -_2189;
    float _2199 = _2165 + _2197;
    float _2201 = -_2189;
    float _2203 = _2163 + _2201;
    float _2205 = -_2189;
    float _2207 = _2175 + _2205;
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2211 = fma(_2203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    bool _2215 = !_2173;
    if (!_2215)
    {
        float _2217 = -_1324;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2221 = -_1330;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2225 = -_1338;
        float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2229 = _2219 * _2219;
        float _2231 = fma(_2223, _2223, _2229);
        float _2233 = fma(_2227, _2227, _2231);
        float _2235 = sqrt(_2233);
        float _2237 = rsqrt(_2233);
        float _2239 = -_2235;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2243 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = _2223 * _2237;
        float _2249 = _2219 * _2237;
        float _2251 = abs(_2245);
        float _2253 = log2(_2251);
        float _2255 = _2227 * _2237;
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2259 = _1162 * _2249;
        float _2261 = -_2249;
        float _2263 = -_2257;
        float _2265 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2263);
        float _2267 = fma(_1160, _2247, _2259);
        float _2269 = -_2255;
        float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2265);
        float _2273 = fma(_1180, _2255, _2267);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2279 = _2271 + _2277;
        float _2281 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = exp2(_2281);
        float _2289 = _2287 * _2285;
        float _2291 = _2275 * _2289;
        float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2297 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2293;
        out.m_83.y = _2295;
        out.m_83.z = _2297;
    }
    out.m_85.x = _2209;
    out.m_85.y = _2211;
    out.m_85.z = _2213;
    if (!_2195)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2299;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2051 = false;
    bool _1274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_48.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2355 = as_type<float>(_118);
        out.gl_Position.z = _2355;
    }
    if (!_108)
    {
        return out;
    }
    float _122 = in.m_53.w;
    float _124 = float(_104);
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
    float _146 = _122;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
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
        float _2419 = as_type<float>(_152);
        out.gl_Position.z = _2419;
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
    float _164 = in.m_57.x;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _168 = _166 != 0;
    float _170 = in.m_59.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = in.m_59.y;
    float _176 = _128 * _160;
    float _178 = in.m_57.y;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = in.m_59.w;
    float _184 = _176 * 3.1415927410125732421875;
    float _186 = abs(_154);
    float _188 = abs(_158);
    float _190 = precise::max(_186, _188);
    float _192 = -_158;
    float _194 = fma(_180, _158, _192);
    float _196 = -_154;
    float _198 = fma(_180, _154, _196);
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    bool _206 = _190 >= 16.0;
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _212 = _162 * _172;
    float _214 = 0.0;
    float _216 = _158;
    float _218 = _154;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _222 = _164;
    if (!_168)
    {
        _214 = _164;
    }
    float _224 = _214;
    float _226 = _224;
    if (_206)
    {
        float _228 = _158 * 0.0625;
        _216 = _228;
    }
    float _230 = _216;
    if (_206)
    {
        float _232 = _154 * 0.0625;
        _218 = _232;
    }
    float _234 = _218;
    float _236 = abs(_230);
    bool _238 = _236 != 0.0;
    bool _240 = isnan(_236);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = abs(_234);
    bool _250 = _248 == 0.0;
    bool _252 = !_246;
    bool _254 = _250 && _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _266 = _264 != 0;
    int _268 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _270 = _268 != 0;
    bool _272 = !_262;
    int _274 = _272 ? 0 : 1;
    float _276 = abs(_234);
    bool _278 = _276 == 0.0;
    bool _280 = !_258;
    int _282 = _280 ? 0 : 1;
    bool _284 = _258;
    int _286 = _246 ? (-1) : 0;
    bool _288 = _254;
    int _290 = as_type<int>(_234);
    if (_254)
    {
        bool _292 = as_type<int>(_234) >= 0;
        _284 = _292;
    }
    bool _294 = _284;
    if (_254)
    {
        int _296 = _294 ? 0 : 1078530011;
        _220 = _296;
    }
    int _298 = _220;
    float _300 = 0.0;
    int _302 = _298;
    if (_254)
    {
        int _304 = int(0x80000000) & as_type<int>(_230);
        int _306 = _298 | _304;
        _300 = as_type<float>(_306);
    }
    float _308 = _300;
    bool _310 = !_246;
    bool _312 = _310 && _278;
    float _314 = _308;
    float _316 = _308;
    float _318 = _178;
    if (!_312)
    {
        float _320 = abs(_230);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_234);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_234);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _288 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_234) >= 0;
            _286 = _344 ? (-1) : 0;
        }
        int _346 = _286;
        if (_342)
        {
            _302 = 1075235812;
        }
        int _348 = _302;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        if (_342)
        {
            int _358 = int(0x80000000) & as_type<int>(_230);
            int _360 = _356 | _358;
            _314 = as_type<float>(_360);
        }
        float _362 = _314;
        bool _364 = !_330;
        bool _366 = _364 && _334;
        _316 = _362;
        if (!_366)
        {
            float _368 = abs(_234);
            float _370 = abs(_230);
            float _372 = precise::max(_368, _370);
            float _374 = abs(_234);
            float _376 = abs(_230);
            float _378 = _374 + _376;
            float _380 = abs(_234);
            float _382 = abs(_230);
            float _384 = precise::min(_380, _382);
            float _386 = 1.0 / _372;
            float _388 = abs(_230);
            float _390 = abs(_234);
            bool _392 = _388 > _390;
            bool _394 = as_type<int>(_234) >= 0;
            bool _396 = _378 > as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_378);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = _384 * _386;
            float _408 = _406 * _406;
            float _410 = _408 + 11.33538818359375;
            float _412 = fma(_408, _410, 28.84246826171875);
            float _414 = fma(_408, _412, 19.6966705322265625);
            float _416 = fma(_408, -0.82336294651031494140625, -5.674867153167724609375);
            float _418 = fma(_408, _416, -6.565555095672607421875);
            float _420 = 1.0 / _414;
            float _422 = _408 * _418;
            float _424 = _406 * _422;
            float _426 = fma(_424, _420, _406);
            int _428 = as_type<int>(_230) & int(0x80000000);
            float _430 = _426;
            _316 = _378;
            if (_392)
            {
                float _432 = -_426;
                float _434 = _432 + 1.57079637050628662109375;
                _430 = _434;
            }
            float _436 = _430;
            int _438 = as_type<int>(_436);
            if (!_394)
            {
                float _440 = -_436;
                float _442 = _440 + 3.1415927410125732421875;
                _438 = as_type<int>(_442);
            }
            int _444 = _438;
            if (!_404)
            {
                int _446 = _428 | _444;
                _316 = as_type<float>(_446);
            }
        }
    }
    bool _448 = _288;
    float _450 = _316;
    float _452 = _184 * 0.15915493667125701904296875;
    float _454 = -_178;
    float _456 = _454 + 1.0;
    float _458 = in.m_61.x;
    float _460 = in.m_61.y;
    float _462 = in.m_61.z;
    bool _464 = _174 > 0.5;
    bool _466 = _448;
    if (_168)
    {
        float _468 = -_164;
        float _470 = _468 + 1.0;
        _290 = as_type<int>(_470);
    }
    int _472 = _290;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = _452 * 6.283185482025146484375;
    float _480 = sin(_478);
    int _482 = _464 ? as_type<int>(_456) : as_type<int>(_178);
    float _484 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_168)
    {
        bool _486 = _170 > 0.5;
        _466 = _486;
    }
    bool _488 = _466;
    float _490 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _182 > 0.5;
    float _494 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _496 = _476 ? as_type<float>(_482) : _178;
    float _498 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_168)
    {
        float _502 = _488 ? as_type<float>(_472) : _164;
        _226 = _502;
    }
    float _504 = _226;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _508 = _492 ? as_type<int>(_456) : as_type<int>(_178);
    float _510 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _514 = _512 != 0;
    float _516 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _520 = _518 != 0;
    float _522 = 0.0 + _480;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _534 = _532 != 0;
    float _536 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _538 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _540 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _542 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _544 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = -_156;
    float _552 = fma(_524, _156, _550);
    float _554 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _554 + _580;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _566;
    out.m_63.y = _568;
    out.m_63.z = _570;
    out.m_63.w = _564;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _578 + _594;
    float _598 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _600 = -_584;
    float _602 = fma(_490, 2.0, _600);
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.x = _588;
    out.m_65.y = _590;
    out.m_65.z = _592;
    out.m_65.w = _586;
    float _606 = _528 ? as_type<float>(_508) : _178;
    float _608 = fma(_604, _496, -0.5);
    float _610 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _614 = in.m_59.z;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = _582 * _582;
    float _620 = fma(_516, -2.0, _612);
    float _622 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _624 = fma(_596, _596, _618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _598 + _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _632 = fma(_606, _610, -0.5);
    float _634 = fma(_628, _628, _624);
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _640 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].w, _630);
    float _642 = _624;
    float _644 = _530;
    float _646 = _636;
    int _648 = as_type<int>(_620);
    int _650 = as_type<int>(_616);
    float _652 = _632;
    if (!_266)
    {
        _642 = _174;
    }
    float _654 = _642;
    float _656 = _636 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _658 = rsqrt(_634);
    float _660 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].w, _638);
    float _662 = _654;
    if (!_266)
    {
        _644 = _654;
    }
    float _664 = _644;
    float _666 = _656 * 12.0;
    float _668 = _656 * 6.0;
    float _670 = _664;
    if (_266)
    {
        _662 = _174;
    }
    float _672 = _662;
    float _674 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _640);
    float _676 = fma(_450, 4.0, _666);
    float _678 = -_668;
    float _680 = fma(_450, 3.0, _678);
    bool _682 = _614 > 0.5;
    float _684 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _620);
    float _686 = _676 * 0.15915493667125701904296875;
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _614;
    if (_534)
    {
        float _692 = _682 ? _456 : _178;
        _318 = _692;
    }
    float _694 = _318;
    float _696 = -_684;
    float _698 = fma(_674, _608, _696);
    if (_266)
    {
        _646 = _170;
    }
    float _700 = _646;
    float _702 = _582 * _658;
    float _704 = _686 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _596 * _658;
    float _710 = _628 * _658;
    float _712 = -_702;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _720 = _700;
    if (!_266)
    {
        _720 = _614;
    }
    float _722 = _720;
    float _724 = _714 * _714;
    float _726 = _688 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _628);
    float _734 = _450 + 3.1415927410125732421875;
    float _736 = fma(_718, _718, _724);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _656 * 6.283185482025146484375;
    float _744 = fma(_732, _732, _736);
    float _746 = _740;
    if (_514)
    {
        float _748 = -_164;
        float _750 = _748 + 1.0;
        _648 = as_type<int>(_750);
    }
    int _752 = _648;
    float _754 = -_738;
    float _756 = fma(_740, 2.0, _754);
    float _758 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _760 = _742 * 0.15915493667125701904296875;
    float _762 = as_type<float>(_752);
    if (_520)
    {
        float _764 = -_164;
        float _766 = _764 + 1.0;
        _650 = as_type<int>(_766);
    }
    int _768 = _650;
    float _770 = fma(_758, _694, -0.5);
    float _772 = _706 + _728;
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = _760 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_266)
    {
        _670 = _170;
    }
    float _782 = _670;
    float _784 = fma(_772, 0.25, 0.5);
    if (!_514)
    {
        _746 = _164;
    }
    float _786 = _746;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _790 = _788 + 2.0;
    float _792 = _786;
    if (_514)
    {
        float _794 = _682 ? as_type<float>(_752) : _164;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _774 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    if (!_520)
    {
        _762 = _164;
    }
    float _804 = _762;
    float _806 = _782 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _808 = _804;
    if (_520)
    {
        float _810 = _464 ? as_type<float>(_768) : _164;
        _808 = _810;
    }
    float _812 = _808;
    float _814 = fma(_784, _790, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _816 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = sqrt(_744);
    float _820 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_266)
    {
        _222 = _614;
    }
    float _822 = _222;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _826 = _822;
    if (_266)
    {
        _826 = _672;
    }
    float _828 = _826;
    float _830 = fma(_778, 0.10000002384185791015625, 1.0);
    float _832 = fma(_800, 0.5, 0.5);
    float _834 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _824);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _840 = _832 * _814;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _846 = _840 * _622;
    float _848 = _658 * _818;
    float _850 = -_842;
    float _852 = fma(_806, 2.0, _850);
    float _854 = _832;
    if (_266)
    {
        _690 = _672;
    }
    float _856 = _690;
    float _858 = fma(_846, _838, 1.0);
    float _860 = _816 * _848;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _864 = _820 * _848;
    float _866 = _210 * _858;
    float _868 = _208 * _858;
    float _870 = _860 * _862;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _874 = _834 * _848;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _868);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _880 = _864 * _872;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _884 = _874 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_266)
    {
        _854 = _672;
    }
    float _890 = _854;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _894 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[8].x, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[10].x, _888);
    float _898 = _844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, _894);
    float _902 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, _896);
    float _904 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _212);
    float _906 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _882);
    float _908 = _578 + _900;
    float _910 = _598 + _902;
    float _912 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _892);
    float _914 = _890;
    float _916 = _908;
    float _918 = _910;
    if (!_266)
    {
        _914 = _170;
    }
    float _920 = _914;
    float _922 = fma(_898, _504, -0.5);
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _908 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _910 + _928;
    float _932 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _936 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _938 = _926 * _926;
    float _940 = _930 * _930;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _944 = fma(_936, -2.0, _934);
    float _946 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _906);
    float _948 = _938 + _940;
    float _950 = fma(_932, _796, -0.5);
    bool _952 = _846 != 0.0;
    bool _954 = isnan(_846);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = in.m_67.x;
    float _964 = in.m_67.y;
    float _966 = in.m_67.z;
    float _968 = sqrt(_948);
    float _970 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _802);
    float _972 = -_128;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    bool _976 = _866 == 0.0;
    bool _978 = !_960;
    bool _980 = _976 && _978;
    float _982 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _984 = _920 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _986 = -_128;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    bool _990 = _868 == 0.0;
    bool _992 = _990 && _980;
    float _994 = _942 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _996 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _998 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _1000 = floor(_904);
    float _1002 = fma(_994, _812, -0.5);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1006 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _944);
    float _1008 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    bool _1010 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = fma(_984, -2.0, _1004);
    float _1014 = fma(_946, _922, _988);
    float _1016 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _912);
    float _1018 = -_128;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[86].x, _756);
    float _1022 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _660);
    float _1024 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    float _1026 = -_1006;
    float _1028 = fma(_998, _632, _1026);
    float _1030 = _554 + _1008;
    float _1032 = fma(_970, _950, _974);
    float _1034 = fma(_1016, _1002, _1020);
    float _1036 = -_1024;
    float _1038 = fma(_1022, _770, _1036);
    float _1040 = _964;
    float _1042 = _938;
    float _1044 = _940;
    float _1046 = _962;
    float _1048 = _966;
    if (!_992)
    {
        float _1050 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (!_1010)
    {
        _652 = _1030;
    }
    float _1054 = _652;
    bool _1056 = !_1010;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _968 + _1062;
        float _1066 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_948);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = _1068 * _1082;
        float _1086 = fma(_926, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = _1080 + (-1.0);
        float _1090 = fma(_930, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1094 = _1086 + _1092;
        float _1096 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1100 = _1090 + _1098;
        float _1102 = _1094 * _1094;
        float _1104 = fma(_1030, _1080, _1096);
        float _1106 = _1100 * _1100;
        _1058 = _1104;
        _1042 = _1102;
        _1044 = _1106;
        _916 = _1086;
        _918 = _1090;
    }
    float _1108 = _1058;
    float _1110 = _1042;
    float _1112 = _1044;
    float _1114 = _916;
    float _1116 = _918;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1120 = _1108 + _1118;
    float _1122 = _1116;
    if (!_992)
    {
        float _1124 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1046 = _1124;
    }
    float _1126 = _1046;
    float _1128 = -_1000;
    float _1130 = _904 + _1128;
    float _1132 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1134 = fma(_1120, _1120, _1110);
    float _1136 = _904 * 6.283185482025146484375;
    float _1138 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1140 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = _1134 + _1112;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1132);
    float _1146 = _1136 * 0.15915493667125701904296875;
    if (!_992)
    {
        float _1148 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1048 = _1148;
    }
    float _1150 = _1048;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1138);
    float _1154 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1156 = sqrt(_1142);
    int _1158 = abs(_282);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1162 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1152);
    float _1164 = _698 + 0.5;
    float _1166 = _1034 + 0.5;
    float _1168 = _1014 + 0.5;
    float _1170 = _1032 + 0.5;
    float _1172 = _1146 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1028 + 0.5;
    float _1178 = _1038 + 0.5;
    float _1180 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1154);
    bool _1182 = !_270;
    int _1184 = _1182 ? 0 : 1;
    out.m_69.x = _1168;
    out.m_69.y = _1164;
    out.m_69.z = _1170;
    out.m_69.w = _1176;
    int _1186 = abs(_1184);
    out.m_71.x = _1166;
    out.m_71.y = _1178;
    float _1188 = float(_1158);
    float _1190 = -_1130;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1194 = abs(_274);
    out.m_73.x = _1160;
    out.m_73.y = _1162;
    out.m_73.z = _1180;
    bool _1196 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1204 = _1200 || _1202;
    float _1206 = fma(_1174, 0.5, 0.5);
    float _1208 = abs(_1192);
    float _1210 = _1188 * _1208;
    bool _1212 = _1130 < 0.5;
    float _1214 = float(_1212);
    float _1216 = -_1206;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1220 = float(_1186);
    float _1222 = -_1214;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1194);
    float _1228 = fma(_1220, _1218, _1210);
    float _1230 = abs(_1224);
    float _1232 = fma(_1226, _1230, _1228);
    float _1234 = _1228;
    float _1236 = _1210;
    float _1238 = _1232;
    if (!_1204)
    {
        _1234 = 1.0;
    }
    float _1240 = _1234;
    bool _1242 = !_1204;
    float _1244 = _1240;
    if (!_1242)
    {
        bool _1246 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1248 = isnan(_1156);
        bool _1250 = _1246 || _1248;
        bool _1252 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1254 = _1250 || _1252;
        if (!_1254)
        {
            float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1258 = _1156 + _1256;
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1266 = _1264 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1268 = 1.0 / _1262;
            float _1270 = _1258 * _1268;
            float _1272 = fma(_1270, _1266, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1244 = _1272;
            _1274 = true;
        }
        else
        {
            bool _1276 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1278 = isnan(_1156);
            bool _1280 = _1276 || _1278;
            bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1284 = _1280 || _1282;
            if (!_1284)
            {
                float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1288 = _1156 + _1286;
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1290 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1298 = 1.0 / _1292;
                float _1300 = _1288 * _1298;
                float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1244 = _1302;
                _1274 = true;
            }
            else
            {
                _1244 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1274 = false;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1308 = _1108 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1312 = _1114 + _1310;
    float _1314 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1116 + _1316;
    float _1320 = fma(_1312, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1322 = -_702;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1326 = fma(_1318, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1328 = -_708;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1334 = _1324 + _1332;
    float _1336 = -_710;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = _1334 * _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1348 = _1338 + _1346;
    float _1350 = fma(_1342, _1342, _1344);
    float _1352 = fma(_1348, _1348, _1350);
    float _1354 = rsqrt(_1352);
    float _1356 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1358 = _1342 * _1356;
    float _1360 = _1348 * _1356;
    float _1362 = _1358 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 + _1364;
    float _1368 = sqrt(_1366);
    bool _1370 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1368 + _1372;
    float _1376 = _1348;
    float _1378 = _1366;
    float _1380 = _1374;
    if (_1370)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (_1370)
    {
        float _1386 = rsqrt(_1366);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (_1370)
    {
        float _1392 = _1374 * _1384;
        _1380 = _1392;
    }
    float _1394 = _1380;
    if (_1370)
    {
        float _1396 = _1394 * 0.15915493667125701904296875;
        _1236 = _1396;
    }
    float _1398 = _1236;
    float _1400 = _1344;
    float _1402 = _1398;
    if (_1370)
    {
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1412 = precise::max(0.0, _1410);
    float _1414 = _1354;
    float _1416 = _1412;
    float _1418 = _1410;
    if (_1370)
    {
        float _1420 = _1398 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = -_1356;
    float _1428 = -_1412;
    float _1430 = fma(_1334, _1426, _1428);
    float _1432 = -_708;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    if (_1370)
    {
        float _1436 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = _1438;
    float _1442 = _1408;
    if (_1370)
    {
        float _1444 = _1408 + (-1.0);
        _1418 = _1444;
    }
    float _1446 = _1418;
    float _1448 = _1446;
    if (!_1370)
    {
        _1402 = _1362;
    }
    float _1450 = _1402;
    float _1452 = sqrt(_1352);
    float _1454 = _1450;
    if (_1370)
    {
        float _1456 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1456;
    }
    float _1458 = _1448;
    float _1460 = _1424;
    float _1462 = _1458;
    if (_1370)
    {
        float _1464 = fma(_1424, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1464;
    }
    float _1466 = _1440;
    if (!_1370)
    {
        _1460 = _1430;
    }
    float _1468 = _1460;
    float _1470 = _1468;
    if (_1370)
    {
        float _1472 = fma(_1430, _1408, _1458);
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (!_1370)
    {
        _1442 = _1358;
    }
    float _1476 = _1442;
    float _1478 = _1476;
    if (_1370)
    {
        float _1480 = _1388 * _1466;
        _1122 = _1480;
    }
    float _1482 = _1122;
    if (!_1370)
    {
        _1462 = _1360;
    }
    float _1484 = _1462;
    float _1486 = _1484;
    if (!_1370)
    {
        _1390 = _1364;
    }
    float _1488 = _1390;
    float _1490 = _1488;
    if (_1370)
    {
        float _1492 = _1358 * _1482;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1370)
    {
        float _1496 = _1360 * _1482;
        _1486 = _1496;
    }
    float _1498 = _1486;
    float _1500 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1370)
    {
        float _1502 = _1494 * _1494;
        _1454 = _1502;
    }
    float _1504 = _1454;
    if (_1370)
    {
        float _1506 = _1498 * _1498;
        _1490 = _1506;
    }
    float _1508 = _1490;
    float _1510 = fma(_1474, _1474, _1504);
    float _1512 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1514 = _1510 + _1508;
    float _1516 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1512);
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1518);
    float _1522 = precise::clamp(_1520, 0.0, 1.0);
    float _1524 = -_710;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1528 = rsqrt(_1514);
    float _1530 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1516);
    float _1532 = -_1522;
    float _1534 = _1532 + 1.0;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1544 = abs(_1534);
    float _1546 = log2(_1544);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1552 = -_1548;
    float _1554 = fma(_1552, _1536, 1.0);
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1560 = _1528 * _1494;
    float _1562 = _1528 * _1474;
    float _1564 = _1528 * _1498;
    float _1566 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1568 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1572 = floor(_1542);
    float _1574 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1578 = -_1570;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = floor(_1550);
    float _1592 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1582);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1564;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1600 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1602 = fma(_1598, -0.5, 0.5);
    float _1604 = log2(_1554);
    float _1606 = -_1572;
    float _1608 = _1542 + _1606;
    float _1610 = fma(_1598, 0.5, 0.5);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1614 = _1562 + 1.0;
    float _1616 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1612);
    float _1618 = exp2(_1588);
    float _1620 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1622 = -_1590;
    float _1624 = _1550 + _1622;
    float _1626 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1616);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1632 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = fma(_1610, _1626, -0.212114393711090087890625);
    float _1636 = sqrt(_1602);
    float _1638 = _1604 * 0.693147182464599609375;
    float _1640 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1642 = fma(_1610, _1634, 1.570728778839111328125);
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1640);
    float _1650 = 1.0 / _1630;
    float _1652 = -_1562;
    float _1654 = fma(_1618, _1614, _1652);
    float _1656 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float2 _4936 = float2(_1608, _1624);
    float _1658 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1660 = fma(_1654, 0.5, 0.5);
    float _1662 = _1636 * 0.636619746685028076171875;
    float _1664 = _1644 * _1650;
    float _1666 = _1656 * _1650;
    float _1668 = -_1642;
    float _1670 = fma(_1662, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float _1674 = fma(_1666, -0.5, 0.5);
    float3 _4967 = float3(_1672, _1674, _1646);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4967, float3(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4967, float3(0.0), isnan(_4967)), level(0.0)).x;
    float3 _4978 = float3(_1672, _1674, _1646);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4978, float3(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4978, float3(0.0), isnan(_4978)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float2 _4994 = float2(_1670, _1660);
    float3 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4994, float2(0.0), isnan(_4994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4994, float2(0.0), isnan(_4994)), level(0.0)).xyz;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = -_702;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1705 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1707 = isnan(_1452);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1717 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1719 = in.m_75.x;
    float _1721 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1715);
    float _1723 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1725 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1717);
    float _1727 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1721);
    float _1729 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1723);
    float _1731 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1725);
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1729);
    float _1737 = 1.0 / _1733;
    float _1739 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1741 = _1739 + _1733;
    float _1743 = _1741 * _1737;
    float _1745 = _1743 * 0.5;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1749 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
    float _1751 = 1.0 / _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1755 = _1751 * _1753;
    float _1757 = abs(_1755);
    float _1759 = log2(_1757);
    bool _1761 = _1755 <= 8000.0;
    bool _1763 = isnan(_1755);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(8000.0);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    float _1773 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1775 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(0.5);
    bool _1783 = _1779 || _1781;
    float _1785 = exp2(_1773);
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1789 = _1703;
    float _1791 = _1755;
    float _1793 = _1630;
    if (!_1783)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1795 = _1787;
    float _1797 = _1795;
    if (!_1783)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1755 + _1799;
        _1789 = _1801;
    }
    float _1803 = _1789;
    if (!_1783)
    {
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = _1755 + _1805;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1817 = _1809;
    if (!_1783)
    {
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1821 = _1795 + _1819;
        _1797 = _1821;
    }
    float _1823 = _1797;
    float _1825 = _1731 + _1630;
    float _1827 = fma(_1813, -2.0, 3.0);
    float _1829 = _1813 * _1813;
    float _1831 = 2.0;
    float _1833 = _1825;
    if (!_1783)
    {
        float _1835 = 1.0 / _1823;
        _1831 = _1835;
    }
    float _1837 = _1831;
    float _1839 = _1829 * _1827;
    float _1841 = -_1839;
    float _1843 = _1841 + 1.0;
    float _1845 = exp2(_1815);
    float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1839);
    float _1849 = _1839;
    if (_1783)
    {
        _1849 = 1.0;
    }
    float _1851 = _1849;
    float _1853 = _1825 * 0.5;
    float _1855 = _1851;
    if (!_1783)
    {
        _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1857 = _1833;
    float _1859 = _1771 * _1847;
    float _1861 = _1857;
    if (!_1783)
    {
        float _1863 = _1803 * _1837;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        _1855 = _1865;
    }
    float _1867 = _1855;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1630;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1783)
    {
        float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1873 = _1857 + _1871;
        _1861 = _1873;
    }
    float _1875 = _1861;
    out.m_77.z = _1853;
    out.m_77.w = _1630;
    float _1877 = -_1845;
    float _1879 = _1877 + 1.0;
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1731;
    if (!_1783)
    {
        float _1885 = 1.0 / _1875;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1881;
    float _1891 = _1889 + 1.0;
    float _1893 = _1891;
    if (!_1713)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1895 = _1793;
    float _1897 = _1887;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1783)
    {
        float _1903 = _1809 * _1887;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1817 = _1905;
    }
    float _1907 = _1817;
    if (!_1713)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1909 = _1897;
    float _1911 = -_1658;
    float _1913 = _1911 + 1.0;
    float _1915 = _1913 * _1869;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -_1917;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = _1921 * _1719;
    float _1925 = _1923 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = _1925;
    float _1927 = _1881 * _1676;
    float _1929 = _1687 * _1927;
    float _1931 = _1697 * _1927;
    float _1933 = _1687 * _1891;
    float _1935 = _1685;
    float _1937 = _1929;
    float _1939 = _1909;
    float _1941 = _1909;
    if (_1783)
    {
        _1893 = 1.0;
    }
    float _1943 = _1893;
    float _1945 = fma(_1693, _1929, _1681);
    float _1947 = fma(_1695, _1929, _1683);
    float _1949 = fma(_1687, _1931, _1685);
    float _1951 = _1943;
    if (!_1783)
    {
        float _1953 = -_1907;
        float _1955 = _1953 + 1.0;
        _1951 = _1955;
    }
    float _1957 = _1951;
    if (!_1713)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1959 = _1935;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1713)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1937;
    out.m_81.x = _1945;
    out.m_81.y = _1947;
    out.m_81.z = _1949;
    out.m_81.w = _1933;
    float _1967 = _1867 * _1957;
    float _1969 = _1232 * _1967;
    float _1971 = _1967;
    float _1973 = _1965;
    float _1975 = _1965;
    if (!_1713)
    {
        _1238 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1977 = _1238;
    float _1979 = _1977;
    float _1981 = _1977;
    if (!_1713)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1983 = _1971;
    bool _1985 = !_1713;
    float _1987 = _1983;
    float _1989 = _1983;
    if (!_1985)
    {
        bool _1991 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1993 = isnan(_1452);
        bool _1995 = _1991 || _1993;
        bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1999 = _1995 || _1997;
        if (!_1999)
        {
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2003 = _1452 + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2005;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2013 = 1.0 / _2007;
            float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2031 = _2003 * _2013;
            float _2033 = precise::clamp(_2031, 0.0, 1.0);
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = fma(_2033, _2011, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2041 = fma(_2033, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2043 = fma(_2033, _2017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2045 = fma(_2033, _2021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2047 = fma(_2033, _2025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2049 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1963 = _2039;
            _1975 = _2047;
            _1901 = _2043;
            _1941 = _2045;
            _1981 = _2041;
            _1989 = _2049;
            _2051 = true;
        }
        else
        {
            bool _2053 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2055 = isnan(_1452);
            bool _2057 = _2053 || _2055;
            bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2061 = _2057 || _2059;
            if (!_2061)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2063 = _1899;
            _1901 = _2063;
            if (!_2061)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2065 = _1961;
            _1963 = _2065;
            if (!_2061)
            {
                _1979 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2067 = _1979;
            _1981 = _2067;
            if (!_2061)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2069 = _1939;
            _1941 = _2069;
            if (!_2061)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2071 = _1973;
            _1975 = _2071;
            if (!_2061)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2073 = _1987;
            bool _2075 = !_2061;
            _1989 = _2073;
            if (!_2075)
            {
                bool _2077 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2079 = isnan(_1452);
                bool _2081 = _2077 || _2079;
                bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2085 = _2081 || _2083;
                if (!_2085)
                {
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2089 = _1452 + _2087;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2091;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2099 = 1.0 / _2093;
                    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2117 = _2089 * _2099;
                    float _2119 = precise::clamp(_2117, 0.0, 1.0);
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = fma(_2119, _2097, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1963 = _2125;
                    _1975 = _2133;
                    _1901 = _2129;
                    _1941 = _2131;
                    _1981 = _2127;
                    _1989 = _2135;
                    _2051 = true;
                }
                else
                {
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1981 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2051 = false;
    float _2137 = _1963;
    float _2139 = _1975;
    float _2141 = _1901;
    float _2143 = _1941;
    float _2145 = _1981;
    float _2147 = _1989;
    float _2149 = fma(_1162, -0.5, 0.5);
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = -_2137;
    float _2155 = _2153 + _2139;
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = -_2141;
    float _2161 = _2159 + _2143;
    out.m_83.x = 0.0;
    float _2163 = fma(_2151, _2155, _2137);
    float _2165 = fma(_2151, _2161, _2141);
    out.m_51.x = _2157;
    float _2167 = -_2145;
    float _2169 = _2167 + _2147;
    float _2171 = _2163 * 0.586610972881317138671875;
    bool _2173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2175 = fma(_2151, _2169, _2145);
    float _2177 = fma(_2165, 0.298911988735198974609375, _2171);
    bool _2179 = _1867 > 0.0;
    bool _2181 = isnan(_1867);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = fma(_2175, 0.114477999508380889892578125, _2177);
    bool _2191 = _1957 <= 0.0;
    bool _2193 = !_2187;
    bool _2195 = _2191 || _2193;
    float _2197 = -_2189;
    float _2199 = _2165 + _2197;
    float _2201 = -_2189;
    float _2203 = _2163 + _2201;
    float _2205 = -_2189;
    float _2207 = _2175 + _2205;
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2211 = fma(_2203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    bool _2215 = !_2173;
    if (!_2215)
    {
        float _2217 = -_1324;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2221 = -_1330;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2225 = -_1338;
        float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2229 = _2219 * _2219;
        float _2231 = fma(_2223, _2223, _2229);
        float _2233 = fma(_2227, _2227, _2231);
        float _2235 = sqrt(_2233);
        float _2237 = rsqrt(_2233);
        float _2239 = -_2235;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2243 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = _2223 * _2237;
        float _2249 = _2219 * _2237;
        float _2251 = abs(_2245);
        float _2253 = log2(_2251);
        float _2255 = _2227 * _2237;
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2259 = _1162 * _2249;
        float _2261 = -_2249;
        float _2263 = -_2257;
        float _2265 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2263);
        float _2267 = fma(_1160, _2247, _2259);
        float _2269 = -_2255;
        float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2265);
        float _2273 = fma(_1180, _2255, _2267);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2279 = _2271 + _2277;
        float _2281 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = exp2(_2281);
        float _2289 = _2287 * _2285;
        float _2291 = _2275 * _2289;
        float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2297 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2293;
        out.m_83.y = _2295;
        out.m_83.z = _2297;
    }
    out.m_85.x = _2209;
    out.m_85.y = _2211;
    out.m_85.z = _2213;
    if (!_2195)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2299;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2051 = false;
    bool _1274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_48.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2355 = as_type<float>(_118);
        out.gl_Position.z = _2355;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_53.w;
    float _124 = float(_104);
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
    float _146 = _122;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
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
        float _2419 = as_type<float>(_152);
        out.gl_Position.z = _2419;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.x;
    float _156 = in.m_55.y;
    float _158 = in.m_55.z;
    float _160 = 1.0 / _124;
    float _162 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_57.x;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _168 = _166 != 0;
    float _170 = in.m_59.x;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _174 = in.m_59.y;
    float _176 = _128 * _160;
    float _178 = in.m_57.y;
    float _180 = fma(_176, 1.25, 0.75);
    float _182 = in.m_59.w;
    float _184 = _176 * 3.1415927410125732421875;
    float _186 = abs(_154);
    float _188 = abs(_158);
    float _190 = precise::max(_186, _188);
    float _192 = -_158;
    float _194 = fma(_180, _158, _192);
    float _196 = -_154;
    float _198 = fma(_180, _154, _196);
    float _200 = in.m_48.x;
    float _202 = in.m_48.y;
    float _204 = in.m_48.z;
    bool _206 = _190 >= 16.0;
    float _208 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[191].z, _154);
    float _212 = _162 * _172;
    float _214 = 0.0;
    float _216 = _158;
    float _218 = _154;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _222 = _164;
    if (!_168)
    {
        _214 = _164;
    }
    float _224 = _214;
    float _226 = _224;
    if (_206)
    {
        float _228 = _158 * 0.0625;
        _216 = _228;
    }
    float _230 = _216;
    if (_206)
    {
        float _232 = _154 * 0.0625;
        _218 = _232;
    }
    float _234 = _218;
    float _236 = abs(_230);
    bool _238 = _236 != 0.0;
    bool _240 = isnan(_236);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = abs(_234);
    bool _250 = _248 == 0.0;
    bool _252 = !_246;
    bool _254 = _250 && _252;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _258 = _256 != 0;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _266 = _264 != 0;
    int _268 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _270 = _268 != 0;
    bool _272 = !_262;
    int _274 = _272 ? 0 : 1;
    float _276 = abs(_234);
    bool _278 = _276 == 0.0;
    bool _280 = !_258;
    int _282 = _280 ? 0 : 1;
    bool _284 = _258;
    int _286 = _246 ? (-1) : 0;
    bool _288 = _254;
    int _290 = as_type<int>(_234);
    if (_254)
    {
        bool _292 = as_type<int>(_234) >= 0;
        _284 = _292;
    }
    bool _294 = _284;
    if (_254)
    {
        int _296 = _294 ? 0 : 1078530011;
        _220 = _296;
    }
    int _298 = _220;
    float _300 = 0.0;
    int _302 = _298;
    if (_254)
    {
        int _304 = int(0x80000000) & as_type<int>(_230);
        int _306 = _298 | _304;
        _300 = as_type<float>(_306);
    }
    float _308 = _300;
    bool _310 = !_246;
    bool _312 = _310 && _278;
    float _314 = _308;
    float _316 = _308;
    float _318 = _178;
    if (!_312)
    {
        float _320 = abs(_230);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_234);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_234);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _288 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_234) >= 0;
            _286 = _344 ? (-1) : 0;
        }
        int _346 = _286;
        if (_342)
        {
            _302 = 1075235812;
        }
        int _348 = _302;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        if (_342)
        {
            int _358 = int(0x80000000) & as_type<int>(_230);
            int _360 = _356 | _358;
            _314 = as_type<float>(_360);
        }
        float _362 = _314;
        bool _364 = !_330;
        bool _366 = _364 && _334;
        _316 = _362;
        if (!_366)
        {
            float _368 = abs(_234);
            float _370 = abs(_230);
            float _372 = precise::max(_368, _370);
            float _374 = abs(_234);
            float _376 = abs(_230);
            float _378 = _374 + _376;
            float _380 = abs(_234);
            float _382 = abs(_230);
            float _384 = precise::min(_380, _382);
            float _386 = 1.0 / _372;
            float _388 = abs(_230);
            float _390 = abs(_234);
            bool _392 = _388 > _390;
            bool _394 = as_type<int>(_234) >= 0;
            bool _396 = _378 > as_type<float>(0x7f800000u /* inf */);
            bool _398 = isnan(_378);
            bool _400 = _396 || _398;
            bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _404 = _400 || _402;
            float _406 = _384 * _386;
            float _408 = _406 * _406;
            float _410 = _408 + 11.33538818359375;
            float _412 = fma(_408, _410, 28.84246826171875);
            float _414 = fma(_408, _412, 19.6966705322265625);
            float _416 = fma(_408, -0.82336294651031494140625, -5.674867153167724609375);
            float _418 = fma(_408, _416, -6.565555095672607421875);
            float _420 = 1.0 / _414;
            float _422 = _408 * _418;
            float _424 = _406 * _422;
            float _426 = fma(_424, _420, _406);
            int _428 = as_type<int>(_230) & int(0x80000000);
            float _430 = _426;
            _316 = _378;
            if (_392)
            {
                float _432 = -_426;
                float _434 = _432 + 1.57079637050628662109375;
                _430 = _434;
            }
            float _436 = _430;
            int _438 = as_type<int>(_436);
            if (!_394)
            {
                float _440 = -_436;
                float _442 = _440 + 3.1415927410125732421875;
                _438 = as_type<int>(_442);
            }
            int _444 = _438;
            if (!_404)
            {
                int _446 = _428 | _444;
                _316 = as_type<float>(_446);
            }
        }
    }
    bool _448 = _288;
    float _450 = _316;
    float _452 = _184 * 0.15915493667125701904296875;
    float _454 = -_178;
    float _456 = _454 + 1.0;
    float _458 = in.m_61.x;
    float _460 = in.m_61.y;
    float _462 = in.m_61.z;
    bool _464 = _174 > 0.5;
    bool _466 = _448;
    if (_168)
    {
        float _468 = -_164;
        float _470 = _468 + 1.0;
        _290 = as_type<int>(_470);
    }
    int _472 = _290;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _476 = _474 != 0;
    float _478 = _452 * 6.283185482025146484375;
    float _480 = sin(_478);
    int _482 = _464 ? as_type<int>(_456) : as_type<int>(_178);
    float _484 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_168)
    {
        bool _486 = _170 > 0.5;
        _466 = _486;
    }
    bool _488 = _466;
    float _490 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _182 > 0.5;
    float _494 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _496 = _476 ? as_type<float>(_482) : _178;
    float _498 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_168)
    {
        float _502 = _488 ? as_type<float>(_472) : _164;
        _226 = _502;
    }
    float _504 = _226;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _508 = _492 ? as_type<int>(_456) : as_type<int>(_178);
    float _510 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _514 = _512 != 0;
    float _516 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _520 = _518 != 0;
    float _522 = 0.0 + _480;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _528 = _526 != 0;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _534 = _532 != 0;
    float _536 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _500);
    float _538 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _540 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _542 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _544 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _536);
    float _546 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = -_156;
    float _552 = fma(_524, _156, _550);
    float _554 = _540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _554 + _580;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _588 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _566;
    out.m_63.y = _568;
    out.m_63.z = _570;
    out.m_63.w = _564;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _578 + _594;
    float _598 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _600 = -_584;
    float _602 = fma(_490, 2.0, _600);
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_65.x = _588;
    out.m_65.y = _590;
    out.m_65.z = _592;
    out.m_65.w = _586;
    float _606 = _528 ? as_type<float>(_508) : _178;
    float _608 = fma(_604, _496, -0.5);
    float _610 = _530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _614 = in.m_59.z;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = _582 * _582;
    float _620 = fma(_516, -2.0, _612);
    float _622 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _624 = fma(_596, _596, _618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _628 = _598 + _626;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _632 = fma(_606, _610, -0.5);
    float _634 = fma(_628, _628, _624);
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _640 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].w, _630);
    float _642 = _624;
    float _644 = _530;
    float _646 = _636;
    int _648 = as_type<int>(_620);
    int _650 = as_type<int>(_616);
    float _652 = _632;
    if (!_266)
    {
        _642 = _174;
    }
    float _654 = _642;
    float _656 = _636 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _658 = rsqrt(_634);
    float _660 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].w, _638);
    float _662 = _654;
    if (!_266)
    {
        _644 = _654;
    }
    float _664 = _644;
    float _666 = _656 * 12.0;
    float _668 = _656 * 6.0;
    float _670 = _664;
    if (_266)
    {
        _662 = _174;
    }
    float _672 = _662;
    float _674 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _640);
    float _676 = fma(_450, 4.0, _666);
    float _678 = -_668;
    float _680 = fma(_450, 3.0, _678);
    bool _682 = _614 > 0.5;
    float _684 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _620);
    float _686 = _676 * 0.15915493667125701904296875;
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _614;
    if (_534)
    {
        float _692 = _682 ? _456 : _178;
        _318 = _692;
    }
    float _694 = _318;
    float _696 = -_684;
    float _698 = fma(_674, _608, _696);
    if (_266)
    {
        _646 = _170;
    }
    float _700 = _646;
    float _702 = _582 * _658;
    float _704 = _686 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _596 * _658;
    float _710 = _628 * _658;
    float _712 = -_702;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _582);
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _720 = _700;
    if (!_266)
    {
        _720 = _614;
    }
    float _722 = _720;
    float _724 = _714 * _714;
    float _726 = _688 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = -_710;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _628);
    float _734 = _450 + 3.1415927410125732421875;
    float _736 = fma(_718, _718, _724);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _742 = _656 * 6.283185482025146484375;
    float _744 = fma(_732, _732, _736);
    float _746 = _740;
    if (_514)
    {
        float _748 = -_164;
        float _750 = _748 + 1.0;
        _648 = as_type<int>(_750);
    }
    int _752 = _648;
    float _754 = -_738;
    float _756 = fma(_740, 2.0, _754);
    float _758 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _760 = _742 * 0.15915493667125701904296875;
    float _762 = as_type<float>(_752);
    if (_520)
    {
        float _764 = -_164;
        float _766 = _764 + 1.0;
        _650 = as_type<int>(_766);
    }
    int _768 = _650;
    float _770 = fma(_758, _694, -0.5);
    float _772 = _706 + _728;
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = _760 * 6.283185482025146484375;
    float _778 = sin(_776);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_266)
    {
        _670 = _170;
    }
    float _782 = _670;
    float _784 = fma(_772, 0.25, 0.5);
    if (!_514)
    {
        _746 = _164;
    }
    float _786 = _746;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _790 = _788 + 2.0;
    float _792 = _786;
    if (_514)
    {
        float _794 = _682 ? as_type<float>(_752) : _164;
        _792 = _794;
    }
    float _796 = _792;
    float _798 = _774 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[83].z, _780);
    if (!_520)
    {
        _762 = _164;
    }
    float _804 = _762;
    float _806 = _782 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _808 = _804;
    if (_520)
    {
        float _810 = _464 ? as_type<float>(_768) : _164;
        _808 = _810;
    }
    float _812 = _808;
    float _814 = fma(_784, _790, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _816 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _818 = sqrt(_744);
    float _820 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_266)
    {
        _222 = _614;
    }
    float _822 = _222;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _826 = _822;
    if (_266)
    {
        _826 = _672;
    }
    float _828 = _826;
    float _830 = fma(_778, 0.10000002384185791015625, 1.0);
    float _832 = fma(_800, 0.5, 0.5);
    float _834 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _824);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _840 = _832 * _814;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _846 = _840 * _622;
    float _848 = _658 * _818;
    float _850 = -_842;
    float _852 = fma(_806, 2.0, _850);
    float _854 = _832;
    if (_266)
    {
        _690 = _672;
    }
    float _856 = _690;
    float _858 = fma(_846, _838, 1.0);
    float _860 = _816 * _848;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _864 = _820 * _848;
    float _866 = _210 * _858;
    float _868 = _208 * _858;
    float _870 = _860 * _862;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _874 = _834 * _848;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _868);
    float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _880 = _864 * _872;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _884 = _874 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _888 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_266)
    {
        _854 = _672;
    }
    float _890 = _854;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _894 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[8].x, _886);
    float _896 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[10].x, _888);
    float _898 = _844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[8].z, _894);
    float _902 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[10].z, _896);
    float _904 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _212);
    float _906 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _882);
    float _908 = _578 + _900;
    float _910 = _598 + _902;
    float _912 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].z, _892);
    float _914 = _890;
    float _916 = _908;
    float _918 = _910;
    if (!_266)
    {
        _914 = _170;
    }
    float _920 = _914;
    float _922 = fma(_898, _504, -0.5);
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _926 = _908 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _910 + _928;
    float _932 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _936 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _938 = _926 * _926;
    float _940 = _930 * _930;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _944 = fma(_936, -2.0, _934);
    float _946 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _906);
    float _948 = _938 + _940;
    float _950 = fma(_932, _796, -0.5);
    bool _952 = _846 != 0.0;
    bool _954 = isnan(_846);
    bool _956 = _952 || _954;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    float _962 = in.m_67.x;
    float _964 = in.m_67.y;
    float _966 = in.m_67.z;
    float _968 = sqrt(_948);
    float _970 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _802);
    float _972 = -_128;
    float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _852);
    bool _976 = _866 == 0.0;
    bool _978 = !_960;
    bool _980 = _976 && _978;
    float _982 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _984 = _920 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _986 = -_128;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    bool _990 = _868 == 0.0;
    bool _992 = _990 && _980;
    float _994 = _942 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _996 = fma(_880, (*spvDescriptorSet0.vp_c10)._m0[9].x, _982);
    float _998 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    float _1000 = floor(_904);
    float _1002 = fma(_994, _812, -0.5);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1006 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _944);
    float _1008 = fma(_884, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    bool _1010 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = fma(_984, -2.0, _1004);
    float _1014 = fma(_946, _922, _988);
    float _1016 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _912);
    float _1018 = -_128;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[86].x, _756);
    float _1022 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _660);
    float _1024 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    float _1026 = -_1006;
    float _1028 = fma(_998, _632, _1026);
    float _1030 = _554 + _1008;
    float _1032 = fma(_970, _950, _974);
    float _1034 = fma(_1016, _1002, _1020);
    float _1036 = -_1024;
    float _1038 = fma(_1022, _770, _1036);
    float _1040 = _964;
    float _1042 = _938;
    float _1044 = _940;
    float _1046 = _962;
    float _1048 = _966;
    if (!_992)
    {
        float _1050 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1040 = _1050;
    }
    float _1052 = _1040;
    if (!_1010)
    {
        _652 = _1030;
    }
    float _1054 = _652;
    bool _1056 = !_1010;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _968 + _1062;
        float _1066 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = rsqrt(_948);
        float _1070 = _1064 * _1060;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = fma(_1076, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1084 = _1068 * _1082;
        float _1086 = fma(_926, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1088 = _1080 + (-1.0);
        float _1090 = fma(_930, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1094 = _1086 + _1092;
        float _1096 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1100 = _1090 + _1098;
        float _1102 = _1094 * _1094;
        float _1104 = fma(_1030, _1080, _1096);
        float _1106 = _1100 * _1100;
        _1058 = _1104;
        _1042 = _1102;
        _1044 = _1106;
        _916 = _1086;
        _918 = _1090;
    }
    float _1108 = _1058;
    float _1110 = _1042;
    float _1112 = _1044;
    float _1114 = _916;
    float _1116 = _918;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1120 = _1108 + _1118;
    float _1122 = _1116;
    if (!_992)
    {
        float _1124 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1046 = _1124;
    }
    float _1126 = _1046;
    float _1128 = -_1000;
    float _1130 = _904 + _1128;
    float _1132 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1134 = fma(_1120, _1120, _1110);
    float _1136 = _904 * 6.283185482025146484375;
    float _1138 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1140 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = _1134 + _1112;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1132);
    float _1146 = _1136 * 0.15915493667125701904296875;
    if (!_992)
    {
        float _1148 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1048 = _1148;
    }
    float _1150 = _1048;
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1138);
    float _1154 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1156 = sqrt(_1142);
    int _1158 = abs(_282);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1162 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1152);
    float _1164 = _698 + 0.5;
    float _1166 = _1034 + 0.5;
    float _1168 = _1014 + 0.5;
    float _1170 = _1032 + 0.5;
    float _1172 = _1146 * 6.283185482025146484375;
    float _1174 = cos(_1172);
    float _1176 = _1028 + 0.5;
    float _1178 = _1038 + 0.5;
    float _1180 = fma(_1150, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1154);
    bool _1182 = !_270;
    int _1184 = _1182 ? 0 : 1;
    out.m_69.x = _1168;
    out.m_69.y = _1164;
    out.m_69.z = _1170;
    out.m_69.w = _1176;
    int _1186 = abs(_1184);
    out.m_71.x = _1166;
    out.m_71.y = _1178;
    float _1188 = float(_1158);
    float _1190 = -_1130;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1194 = abs(_274);
    out.m_73.x = _1160;
    out.m_73.y = _1162;
    out.m_73.z = _1180;
    bool _1196 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1204 = _1200 || _1202;
    float _1206 = fma(_1174, 0.5, 0.5);
    float _1208 = abs(_1192);
    float _1210 = _1188 * _1208;
    bool _1212 = _1130 < 0.5;
    float _1214 = float(_1212);
    float _1216 = -_1206;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1220 = float(_1186);
    float _1222 = -_1214;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1194);
    float _1228 = fma(_1220, _1218, _1210);
    float _1230 = abs(_1224);
    float _1232 = fma(_1226, _1230, _1228);
    float _1234 = _1228;
    float _1236 = _1210;
    float _1238 = _1232;
    if (!_1204)
    {
        _1234 = 1.0;
    }
    float _1240 = _1234;
    bool _1242 = !_1204;
    float _1244 = _1240;
    if (!_1242)
    {
        bool _1246 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1248 = isnan(_1156);
        bool _1250 = _1246 || _1248;
        bool _1252 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1254 = _1250 || _1252;
        if (!_1254)
        {
            float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1258 = _1156 + _1256;
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1266 = _1264 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1268 = 1.0 / _1262;
            float _1270 = _1258 * _1268;
            float _1272 = fma(_1270, _1266, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1244 = _1272;
            _1274 = true;
        }
        else
        {
            bool _1276 = _1156 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1278 = isnan(_1156);
            bool _1280 = _1276 || _1278;
            bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1284 = _1280 || _1282;
            if (!_1284)
            {
                float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1288 = _1156 + _1286;
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1290 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1298 = 1.0 / _1292;
                float _1300 = _1288 * _1298;
                float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1244 = _1302;
                _1274 = true;
            }
            else
            {
                _1244 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1274 = false;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1308 = _1108 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1312 = _1114 + _1310;
    float _1314 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1116 + _1316;
    float _1320 = fma(_1312, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1322 = -_702;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1326 = fma(_1318, _1304, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1328 = -_708;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1334 = _1324 + _1332;
    float _1336 = -_710;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = _1334 * _1334;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1348 = _1338 + _1346;
    float _1350 = fma(_1342, _1342, _1344);
    float _1352 = fma(_1348, _1348, _1350);
    float _1354 = rsqrt(_1352);
    float _1356 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1358 = _1342 * _1356;
    float _1360 = _1348 * _1356;
    float _1362 = _1358 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 + _1364;
    float _1368 = sqrt(_1366);
    bool _1370 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = _1368 + _1372;
    float _1376 = _1348;
    float _1378 = _1366;
    float _1380 = _1374;
    if (_1370)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (_1370)
    {
        float _1386 = rsqrt(_1366);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (_1370)
    {
        float _1392 = _1374 * _1384;
        _1380 = _1392;
    }
    float _1394 = _1380;
    if (_1370)
    {
        float _1396 = _1394 * 0.15915493667125701904296875;
        _1236 = _1396;
    }
    float _1398 = _1236;
    float _1400 = _1344;
    float _1402 = _1398;
    if (_1370)
    {
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1412 = precise::max(0.0, _1410);
    float _1414 = _1354;
    float _1416 = _1412;
    float _1418 = _1410;
    if (_1370)
    {
        float _1420 = _1398 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        _1414 = _1422;
    }
    float _1424 = _1414;
    float _1426 = -_1356;
    float _1428 = -_1412;
    float _1430 = fma(_1334, _1426, _1428);
    float _1432 = -_708;
    float _1434 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    if (_1370)
    {
        float _1436 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = _1438;
    float _1442 = _1408;
    if (_1370)
    {
        float _1444 = _1408 + (-1.0);
        _1418 = _1444;
    }
    float _1446 = _1418;
    float _1448 = _1446;
    if (!_1370)
    {
        _1402 = _1362;
    }
    float _1450 = _1402;
    float _1452 = sqrt(_1352);
    float _1454 = _1450;
    if (_1370)
    {
        float _1456 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1456;
    }
    float _1458 = _1448;
    float _1460 = _1424;
    float _1462 = _1458;
    if (_1370)
    {
        float _1464 = fma(_1424, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1464;
    }
    float _1466 = _1440;
    if (!_1370)
    {
        _1460 = _1430;
    }
    float _1468 = _1460;
    float _1470 = _1468;
    if (_1370)
    {
        float _1472 = fma(_1430, _1408, _1458);
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (!_1370)
    {
        _1442 = _1358;
    }
    float _1476 = _1442;
    float _1478 = _1476;
    if (_1370)
    {
        float _1480 = _1388 * _1466;
        _1122 = _1480;
    }
    float _1482 = _1122;
    if (!_1370)
    {
        _1462 = _1360;
    }
    float _1484 = _1462;
    float _1486 = _1484;
    if (!_1370)
    {
        _1390 = _1364;
    }
    float _1488 = _1390;
    float _1490 = _1488;
    if (_1370)
    {
        float _1492 = _1358 * _1482;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1370)
    {
        float _1496 = _1360 * _1482;
        _1486 = _1496;
    }
    float _1498 = _1486;
    float _1500 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1370)
    {
        float _1502 = _1494 * _1494;
        _1454 = _1502;
    }
    float _1504 = _1454;
    if (_1370)
    {
        float _1506 = _1498 * _1498;
        _1490 = _1506;
    }
    float _1508 = _1490;
    float _1510 = fma(_1474, _1474, _1504);
    float _1512 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1514 = _1510 + _1508;
    float _1516 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1512);
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1518);
    float _1522 = precise::clamp(_1520, 0.0, 1.0);
    float _1524 = -_710;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _598);
    float _1528 = rsqrt(_1514);
    float _1530 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1516);
    float _1532 = -_1522;
    float _1534 = _1532 + 1.0;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1544 = abs(_1534);
    float _1546 = log2(_1544);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1552 = -_1548;
    float _1554 = fma(_1552, _1536, 1.0);
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1558 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1538);
    float _1560 = _1528 * _1494;
    float _1562 = _1528 * _1474;
    float _1564 = _1528 * _1498;
    float _1566 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1556);
    float _1568 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1572 = floor(_1542);
    float _1574 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1578 = -_1570;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1500);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = floor(_1550);
    float _1592 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1582);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1596 = -_1564;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1600 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1594);
    float _1602 = fma(_1598, -0.5, 0.5);
    float _1604 = log2(_1554);
    float _1606 = -_1572;
    float _1608 = _1542 + _1606;
    float _1610 = fma(_1598, 0.5, 0.5);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1614 = _1562 + 1.0;
    float _1616 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1612);
    float _1618 = exp2(_1588);
    float _1620 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1622 = -_1590;
    float _1624 = _1550 + _1622;
    float _1626 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1616);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1600);
    float _1632 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = fma(_1610, _1626, -0.212114393711090087890625);
    float _1636 = sqrt(_1602);
    float _1638 = _1604 * 0.693147182464599609375;
    float _1640 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1642 = fma(_1610, _1634, 1.570728778839111328125);
    float _1644 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1640);
    float _1650 = 1.0 / _1630;
    float _1652 = -_1562;
    float _1654 = fma(_1618, _1614, _1652);
    float _1656 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float2 _4936 = float2(_1608, _1624);
    float _1658 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4936, float2(0.0), isnan(_4936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4936, float2(0.0), isnan(_4936)), level(0.0)).x;
    float _1660 = fma(_1654, 0.5, 0.5);
    float _1662 = _1636 * 0.636619746685028076171875;
    float _1664 = _1644 * _1650;
    float _1666 = _1656 * _1650;
    float _1668 = -_1642;
    float _1670 = fma(_1662, _1668, 1.0);
    float _1672 = fma(_1664, 0.5, 0.5);
    float _1674 = fma(_1666, -0.5, 0.5);
    float3 _4967 = float3(_1672, _1674, _1646);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4967, float3(0.0), isnan(_4967)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4967, float3(0.0), isnan(_4967)), level(0.0)).x;
    float3 _4978 = float3(_1672, _1674, _1646);
    float4 _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4978, float3(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4978, float3(0.0), isnan(_4978)), level(0.0)).xyzw;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float _1687 = _1679.w;
    float2 _4994 = float2(_1670, _1660);
    float3 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4994, float2(0.0), isnan(_4994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4994, float2(0.0), isnan(_4994)), level(0.0)).xyz;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = -_702;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1703 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1705 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1707 = isnan(_1452);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1713 = _1709 || _1711;
    float _1715 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1717 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1719 = in.m_75.x;
    float _1721 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1715);
    float _1723 = _1701 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1725 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1717);
    float _1727 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1721);
    float _1729 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1723);
    float _1731 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1725);
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1729);
    float _1737 = 1.0 / _1733;
    float _1739 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1741 = _1739 + _1733;
    float _1743 = _1741 * _1737;
    float _1745 = _1743 * 0.5;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1749 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
    float _1751 = 1.0 / _1749;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1755 = _1751 * _1753;
    float _1757 = abs(_1755);
    float _1759 = log2(_1757);
    bool _1761 = _1755 <= 8000.0;
    bool _1763 = isnan(_1755);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(8000.0);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    float _1773 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1775 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(0.5);
    bool _1783 = _1779 || _1781;
    float _1785 = exp2(_1773);
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1789 = _1703;
    float _1791 = _1755;
    float _1793 = _1630;
    if (!_1783)
    {
        _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1795 = _1787;
    float _1797 = _1795;
    if (!_1783)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1801 = _1755 + _1799;
        _1789 = _1801;
    }
    float _1803 = _1789;
    if (!_1783)
    {
        float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1807 = _1755 + _1805;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1817 = _1809;
    if (!_1783)
    {
        float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1821 = _1795 + _1819;
        _1797 = _1821;
    }
    float _1823 = _1797;
    float _1825 = _1731 + _1630;
    float _1827 = fma(_1813, -2.0, 3.0);
    float _1829 = _1813 * _1813;
    float _1831 = 2.0;
    float _1833 = _1825;
    if (!_1783)
    {
        float _1835 = 1.0 / _1823;
        _1831 = _1835;
    }
    float _1837 = _1831;
    float _1839 = _1829 * _1827;
    float _1841 = -_1839;
    float _1843 = _1841 + 1.0;
    float _1845 = exp2(_1815);
    float _1847 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1839);
    float _1849 = _1839;
    if (_1783)
    {
        _1849 = 1.0;
    }
    float _1851 = _1849;
    float _1853 = _1825 * 0.5;
    float _1855 = _1851;
    if (!_1783)
    {
        _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _1857 = _1833;
    float _1859 = _1771 * _1847;
    float _1861 = _1857;
    if (!_1783)
    {
        float _1863 = _1803 * _1837;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        _1855 = _1865;
    }
    float _1867 = _1855;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1630;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_1783)
    {
        float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1873 = _1857 + _1871;
        _1861 = _1873;
    }
    float _1875 = _1861;
    out.m_77.z = _1853;
    out.m_77.w = _1630;
    float _1877 = -_1845;
    float _1879 = _1877 + 1.0;
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1731;
    if (!_1783)
    {
        float _1885 = 1.0 / _1875;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1881;
    float _1891 = _1889 + 1.0;
    float _1893 = _1891;
    if (!_1713)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1895 = _1793;
    float _1897 = _1887;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1783)
    {
        float _1903 = _1809 * _1887;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1817 = _1905;
    }
    float _1907 = _1817;
    if (!_1713)
    {
        _1897 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1909 = _1897;
    float _1911 = -_1658;
    float _1913 = _1911 + 1.0;
    float _1915 = _1913 * _1869;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = -_1917;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = _1921 * _1719;
    float _1925 = _1923 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_79.x = _1925;
    float _1927 = _1881 * _1676;
    float _1929 = _1687 * _1927;
    float _1931 = _1697 * _1927;
    float _1933 = _1687 * _1891;
    float _1935 = _1685;
    float _1937 = _1929;
    float _1939 = _1909;
    float _1941 = _1909;
    if (_1783)
    {
        _1893 = 1.0;
    }
    float _1943 = _1893;
    float _1945 = fma(_1693, _1929, _1681);
    float _1947 = fma(_1695, _1929, _1683);
    float _1949 = fma(_1687, _1931, _1685);
    float _1951 = _1943;
    if (!_1783)
    {
        float _1953 = -_1907;
        float _1955 = _1953 + 1.0;
        _1951 = _1955;
    }
    float _1957 = _1951;
    if (!_1713)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1959 = _1935;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1713)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1937;
    out.m_81.x = _1945;
    out.m_81.y = _1947;
    out.m_81.z = _1949;
    out.m_81.w = _1933;
    float _1967 = _1867 * _1957;
    float _1969 = _1232 * _1967;
    float _1971 = _1967;
    float _1973 = _1965;
    float _1975 = _1965;
    if (!_1713)
    {
        _1238 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1977 = _1238;
    float _1979 = _1977;
    float _1981 = _1977;
    if (!_1713)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1983 = _1971;
    bool _1985 = !_1713;
    float _1987 = _1983;
    float _1989 = _1983;
    if (!_1985)
    {
        bool _1991 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1993 = isnan(_1452);
        bool _1995 = _1991 || _1993;
        bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1999 = _1995 || _1997;
        if (!_1999)
        {
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2003 = _1452 + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2005;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2013 = 1.0 / _2007;
            float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2025 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2029 = _2027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2031 = _2003 * _2013;
            float _2033 = precise::clamp(_2031, 0.0, 1.0);
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = fma(_2033, _2011, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2041 = fma(_2033, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2043 = fma(_2033, _2017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2045 = fma(_2033, _2021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2047 = fma(_2033, _2025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2049 = fma(_2033, _2029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1963 = _2039;
            _1975 = _2047;
            _1901 = _2043;
            _1941 = _2045;
            _1981 = _2041;
            _1989 = _2049;
            _2051 = true;
        }
        else
        {
            bool _2053 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2055 = isnan(_1452);
            bool _2057 = _2053 || _2055;
            bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2061 = _2057 || _2059;
            if (!_2061)
            {
                _1899 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2063 = _1899;
            _1901 = _2063;
            if (!_2061)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2065 = _1961;
            _1963 = _2065;
            if (!_2061)
            {
                _1979 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2067 = _1979;
            _1981 = _2067;
            if (!_2061)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2069 = _1939;
            _1941 = _2069;
            if (!_2061)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2071 = _1973;
            _1975 = _2071;
            if (!_2061)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2073 = _1987;
            bool _2075 = !_2061;
            _1989 = _2073;
            if (!_2075)
            {
                bool _2077 = _1452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2079 = isnan(_1452);
                bool _2081 = _2077 || _2079;
                bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2085 = _2081 || _2083;
                if (!_2085)
                {
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2089 = _1452 + _2087;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2091;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2099 = 1.0 / _2093;
                    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2117 = _2089 * _2099;
                    float _2119 = precise::clamp(_2117, 0.0, 1.0);
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = fma(_2119, _2097, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2127 = fma(_2119, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2129 = fma(_2119, _2103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2131 = fma(_2119, _2107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2133 = fma(_2119, _2111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2135 = fma(_2119, _2115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1963 = _2125;
                    _1975 = _2133;
                    _1901 = _2129;
                    _1941 = _2131;
                    _1981 = _2127;
                    _1989 = _2135;
                    _2051 = true;
                }
                else
                {
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1901 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1981 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2051 = false;
    float _2137 = _1963;
    float _2139 = _1975;
    float _2141 = _1901;
    float _2143 = _1941;
    float _2145 = _1981;
    float _2147 = _1989;
    float _2149 = fma(_1162, -0.5, 0.5);
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = -_2137;
    float _2155 = _2153 + _2139;
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = -_2141;
    float _2161 = _2159 + _2143;
    out.m_83.x = 0.0;
    float _2163 = fma(_2151, _2155, _2137);
    float _2165 = fma(_2151, _2161, _2141);
    out.m_51.x = _2157;
    float _2167 = -_2145;
    float _2169 = _2167 + _2147;
    float _2171 = _2163 * 0.586610972881317138671875;
    bool _2173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2175 = fma(_2151, _2169, _2145);
    float _2177 = fma(_2165, 0.298911988735198974609375, _2171);
    bool _2179 = _1867 > 0.0;
    bool _2181 = isnan(_1867);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = fma(_2175, 0.114477999508380889892578125, _2177);
    bool _2191 = _1957 <= 0.0;
    bool _2193 = !_2187;
    bool _2195 = _2191 || _2193;
    float _2197 = -_2189;
    float _2199 = _2165 + _2197;
    float _2201 = -_2189;
    float _2203 = _2163 + _2201;
    float _2205 = -_2189;
    float _2207 = _2175 + _2205;
    float _2209 = fma(_2199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2211 = fma(_2203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    float _2213 = fma(_2207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2189);
    bool _2215 = !_2173;
    if (!_2215)
    {
        float _2217 = -_1324;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2221 = -_1330;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2225 = -_1338;
        float _2227 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2229 = _2219 * _2219;
        float _2231 = fma(_2223, _2223, _2229);
        float _2233 = fma(_2227, _2227, _2231);
        float _2235 = sqrt(_2233);
        float _2237 = rsqrt(_2233);
        float _2239 = -_2235;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2243 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = _2223 * _2237;
        float _2249 = _2219 * _2237;
        float _2251 = abs(_2245);
        float _2253 = log2(_2251);
        float _2255 = _2227 * _2237;
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2259 = _1162 * _2249;
        float _2261 = -_2249;
        float _2263 = -_2257;
        float _2265 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2263);
        float _2267 = fma(_1160, _2247, _2259);
        float _2269 = -_2255;
        float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2265);
        float _2273 = fma(_1180, _2255, _2267);
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2279 = _2271 + _2277;
        float _2281 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2285 = precise::clamp(_2283, 0.0, 1.0);
        float _2287 = exp2(_2281);
        float _2289 = _2287 * _2285;
        float _2291 = _2275 * _2289;
        float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2297 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _2293;
        out.m_83.y = _2295;
        out.m_83.z = _2297;
    }
    out.m_85.x = _2209;
    out.m_85.y = _2211;
    out.m_85.z = _2213;
    if (!_2195)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2299;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

