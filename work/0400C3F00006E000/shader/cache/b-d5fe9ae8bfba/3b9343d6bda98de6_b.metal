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
    float4 m_71 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1959 = false;
    bool _1278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_120);
        out.gl_Position.z = _2243;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_53.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_154);
        out.gl_Position.z = _2307;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    float _160 = in.m_55.z;
    float _162 = 1.0 / _126;
    float _164 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_59.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = in.m_59.y;
    float _178 = _130 * _162;
    float _180 = in.m_57.y;
    float _182 = fma(_178, 1.25, 0.75);
    float _184 = in.m_59.w;
    float _186 = _178 * 3.1415927410125732421875;
    float _188 = abs(_156);
    float _190 = abs(_160);
    float _192 = precise::max(_188, _190);
    float _194 = -_160;
    float _196 = fma(_182, _160, _194);
    float _198 = -_156;
    float _200 = fma(_182, _156, _198);
    float _202 = in.m_48.x;
    float _204 = in.m_48.y;
    float _206 = in.m_48.z;
    bool _208 = _192 >= 16.0;
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[191].z, _160);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _214 = _164 * _174;
    float _216 = 0.0;
    float _218 = _160;
    float _220 = _156;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _224 = _166;
    if (!_170)
    {
        _216 = _166;
    }
    float _226 = _216;
    float _228 = _226;
    if (_208)
    {
        float _230 = _160 * 0.0625;
        _218 = _230;
    }
    float _232 = _218;
    if (_208)
    {
        float _234 = _156 * 0.0625;
        _220 = _234;
    }
    float _236 = _220;
    float _238 = abs(_232);
    bool _240 = _238 != 0.0;
    bool _242 = isnan(_238);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = abs(_236);
    bool _252 = _250 == 0.0;
    bool _254 = !_248;
    bool _256 = _252 && _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    int _266 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    bool _274 = !_264;
    int _276 = _274 ? 0 : 1;
    float _278 = abs(_236);
    bool _280 = _278 == 0.0;
    bool _282 = !_260;
    int _284 = _282 ? 0 : 1;
    bool _286 = _260;
    int _288 = _248 ? (-1) : 0;
    bool _290 = _256;
    if (_256)
    {
        bool _292 = as_type<int>(_236) >= 0;
        _286 = _292;
    }
    bool _294 = _286;
    int _296 = 0;
    if (_256)
    {
        int _298 = _294 ? 0 : 1078530011;
        _296 = _298;
    }
    int _300 = _296;
    int _302 = _300;
    if (_256)
    {
        int _304 = int(0x80000000) & as_type<int>(_232);
        int _306 = _300 | _304;
        _302 = _306;
    }
    int _308 = _302;
    bool _310 = !_248;
    bool _312 = _310 && _280;
    int _314 = _308;
    float _316 = as_type<float>(_308);
    float _318 = _180;
    if (!_312)
    {
        float _320 = abs(_232);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_236);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_236);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _290 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_236) >= 0;
            _288 = _344 ? (-1) : 0;
        }
        int _346 = _288;
        if (_342)
        {
            _314 = 1075235812;
        }
        int _348 = _314;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        float _358 = as_type<float>(_356);
        if (_342)
        {
            int _360 = int(0x80000000) & as_type<int>(_232);
            int _362 = _356 | _360;
            _358 = as_type<float>(_362);
        }
        float _364 = _358;
        bool _366 = !_330;
        bool _368 = _366 && _334;
        _316 = _364;
        if (!_368)
        {
            float _370 = abs(_236);
            float _372 = abs(_232);
            float _374 = precise::max(_370, _372);
            float _376 = abs(_236);
            float _378 = abs(_232);
            float _380 = precise::min(_376, _378);
            float _382 = 1.0 / _374;
            float _384 = abs(_232);
            float _386 = abs(_236);
            bool _388 = _384 > _386;
            bool _390 = as_type<int>(_236) >= 0;
            float _392 = _380 * _382;
            float _394 = _392 * _392;
            float _396 = _394 + 11.33538818359375;
            float _398 = fma(_394, _396, 28.84246826171875);
            float _400 = fma(_394, _398, 19.6966705322265625);
            float _402 = fma(_394, -0.82336294651031494140625, -5.674867153167724609375);
            float _404 = abs(_236);
            float _406 = abs(_232);
            float _408 = _404 + _406;
            float _410 = fma(_394, _402, -6.565555095672607421875);
            float _412 = 1.0 / _400;
            bool _414 = _408 > as_type<float>(0x7f800000u /* inf */);
            bool _416 = isnan(_408);
            bool _418 = _414 || _416;
            bool _420 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _422 = _418 || _420;
            float _424 = _394 * _410;
            float _426 = _392 * _424;
            float _428 = fma(_426, _412, _392);
            int _430 = as_type<int>(_232) & int(0x80000000);
            float _432 = _428;
            _222 = _430;
            _316 = _408;
            if (_388)
            {
                float _434 = -_428;
                float _436 = _434 + 1.57079637050628662109375;
                _432 = _436;
            }
            float _438 = _432;
            int _440 = as_type<int>(_438);
            if (!_390)
            {
                float _442 = -_438;
                float _444 = _442 + 3.1415927410125732421875;
                _440 = as_type<int>(_444);
            }
            int _446 = _440;
            if (!_422)
            {
                int _448 = _430 | _446;
                _316 = as_type<float>(_448);
            }
        }
    }
    bool _450 = _290;
    int _452 = _222;
    float _454 = _316;
    float _456 = _186 * 0.15915493667125701904296875;
    int _458 = _452;
    bool _460 = _450;
    if (_170)
    {
        float _462 = -_166;
        float _464 = _462 + 1.0;
        _458 = as_type<int>(_464);
    }
    int _466 = _458;
    float _468 = in.m_61.x;
    float _470 = in.m_61.y;
    float _472 = in.m_61.z;
    if (_170)
    {
        bool _474 = _172 > 0.5;
        _460 = _474;
    }
    bool _476 = _460;
    float _478 = -_180;
    float _480 = _478 + 1.0;
    bool _482 = _176 > 0.5;
    float _484 = _456 * 6.283185482025146484375;
    float _486 = sin(_484);
    if (_170)
    {
        float _488 = _476 ? as_type<float>(_466) : _166;
        _228 = _488;
    }
    float _490 = _228;
    float _492 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _498 = _184 > 0.5;
    float _500 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    int _508 = _482 ? as_type<int>(_480) : as_type<int>(_180);
    float _510 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _512 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _514 = _504 ? as_type<float>(_508) : _180;
    float _516 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    int _518 = _498 ? as_type<int>(_480) : as_type<int>(_180);
    float _520 = 0.0 + _486;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _526 = _524 != 0;
    float _528 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _532 = _530 != 0;
    float _534 = -_158;
    float _536 = fma(_522, _158, _534);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    float _548 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _552 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _558 = -_542;
    float _560 = fma(_548, 2.0, _558);
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _580 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _588 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _592 = _570 + _590;
    float _594 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _598 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.x = _580;
    out.m_63.y = _582;
    out.m_63.z = _584;
    out.m_63.w = _578;
    float _606 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _588 + _608;
    float _612 = fma(_594, -2.0, _604);
    out.m_65.x = _598;
    out.m_65.y = _600;
    out.m_65.z = _602;
    out.m_65.w = _596;
    float _614 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = in.m_59.z;
    float _620 = fma(_614, _514, -0.5);
    float _622 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    out.m_67.y = _180;
    int _624 = 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    int _628 = as_type<int>(_620);
    if (_532)
    {
        float _630 = -_166;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _592 * _592;
    float _638 = _586 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _640 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _606 + _642;
    float _646 = fma(_610, _610, _636);
    float _648 = _540 ? as_type<float>(_518) : _180;
    float _650 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _654 = fma(_644, _644, _646);
    float _656 = _646;
    if (!_272)
    {
        _656 = _176;
    }
    float _658 = _656;
    float _660 = fma(_648, _638, -0.5);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = _650 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _666 = rsqrt(_654);
    float _668 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _670 = _664 * 12.0;
    float _672 = _664 * 6.0;
    float _674 = _670;
    float _676 = _658;
    float _678 = _660;
    if (!_272)
    {
        _626 = _658;
    }
    float _680 = _626;
    float _682 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _652);
    float _684 = fma(_454, 4.0, _670);
    float _686 = _680;
    if (_272)
    {
        _674 = _172;
    }
    float _688 = _674;
    float _690 = -_672;
    float _692 = fma(_454, 3.0, _690);
    float _694 = _688;
    float _696 = _618;
    if (!_272)
    {
        _694 = _618;
    }
    float _698 = _694;
    float _700 = _684 * 0.15915493667125701904296875;
    if (_272)
    {
        _676 = _176;
    }
    float _702 = _676;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _706 = _618 > 0.5;
    float _708 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _668);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _592 * _666;
    float _714 = _698 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _716 = _610 * _666;
    float _718 = _714;
    if (_546)
    {
        float _720 = _706 ? _480 : _180;
        _318 = _720;
    }
    float _722 = _318;
    float _724 = -_712;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _728 = -_704;
    float _730 = fma(_714, 2.0, _728);
    float _732 = -_716;
    float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _736 = _644 * _666;
    float _738 = _726 * _726;
    float _740 = _700 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _454 + 3.1415927410125732421875;
    float _746 = -_736;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _750 = fma(_734, _734, _738);
    float _752 = -_622;
    float _754 = fma(_708, _620, _752);
    float _756 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _758 = _664 * 6.283185482025146484375;
    float _760 = fma(_748, _748, _750);
    float _762 = _710 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _744 * 0.15915493667125701904296875;
    if (_526)
    {
        float _768 = -_166;
        float _770 = _768 + 1.0;
        _628 = as_type<int>(_770);
    }
    int _772 = _628;
    float _774 = fma(_756, _722, -0.5);
    float _776 = _758 * 0.15915493667125701904296875;
    if (!_526)
    {
        _718 = _166;
    }
    float _778 = _718;
    float _780 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _766 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _778;
    if (_526)
    {
        float _788 = _706 ? as_type<float>(_772) : _166;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _792;
    if (_272)
    {
        _686 = _172;
    }
    float _796 = _686;
    float _798 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _214);
    float _802 = _742 + _764;
    float _804 = _776 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _812 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_802, 0.25, 0.5);
    if (!_532)
    {
        _794 = _166;
    }
    float _816 = _794;
    float _818 = fma(_784, 0.5, 0.5);
    float _820 = -_810;
    float _822 = fma(_812, 2.0, _820);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _826 = _824 + 2.0;
    float _828 = _816;
    if (_532)
    {
        float _830 = _482 ? as_type<float>(_634) : _166;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = sqrt(_760);
    if (!_272)
    {
        _224 = _618;
    }
    float _836 = _224;
    float _838 = fma(_814, _826, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _836;
    float _844 = 0.10000002384185791015625;
    if (_272)
    {
        _842 = _702;
    }
    float _846 = _842;
    float _848 = _818 * _838;
    float _850 = fma(_806, 0.10000002384185791015625, 1.0);
    float _852 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    if (_272)
    {
        _696 = _702;
    }
    float _856 = _696;
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _860 = _848 * _852;
    if (_272)
    {
        _844 = _702;
    }
    float _862 = _844;
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _866 = _666 * _834;
    float _868 = fma(_860, _858, 1.0);
    float _870 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _640 * _866;
    float _874 = _212 * _868;
    float _876 = _780 * _866;
    float _878 = _798 * _866;
    float _880 = _210 * _868;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _888 = _876 * _882;
    float _890 = _872 * _884;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _878 * _886;
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _908 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _900);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _904);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _906);
    float _914 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _916 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _902);
    float _918 = _588 + _910;
    float _920 = _606 + _912;
    float _922 = _862;
    float _924 = _918;
    float _926 = _920;
    if (!_272)
    {
        _922 = _172;
    }
    float _928 = _922;
    float _930 = fma(_914, _490, -0.5);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _918 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _938 = _920 + _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _942 = _892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = _934 * _934;
    float _946 = _938 * _938;
    float _948 = fma(_870, -2.0, _940);
    float _950 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _908);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _954 = _944 + _946;
    float _956 = fma(_942, _790, -0.5);
    bool _958 = _860 != 0.0;
    bool _960 = isnan(_860);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = in.m_69.x;
    float _970 = in.m_69.y;
    float _972 = in.m_69.z;
    float _974 = -_130;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _978 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = sqrt(_954);
    bool _982 = _874 == 0.0;
    bool _984 = !_966;
    bool _986 = _982 && _984;
    float _988 = fma(_950, _930, _976);
    float _990 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _992 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _978);
    bool _994 = _880 == 0.0;
    bool _996 = _994 && _986;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1000 = _928 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1002 = _952 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1004 = floor(_800);
    float _1006 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _916);
    float _1008 = -_130;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _1012 = fma(_1002, _832, -0.5);
    float _1014 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _992);
    float _1016 = fma(_1000, -2.0, _998);
    float _1018 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    bool _1020 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = fma(_1006, _1012, _1010);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1026 = _570 + _1014;
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[81].x, _822);
    float _1032 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _682);
    float _1034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1016);
    float _1036 = -_1024;
    float _1038 = fma(_1018, _660, _1036);
    float _1040 = fma(_990, _956, _1030);
    float _1042 = -_1034;
    float _1044 = fma(_1032, _774, _1042);
    float _1046 = _970;
    float _1048 = _944;
    float _1050 = _946;
    float _1052 = _968;
    float _1054 = _972;
    if (!_996)
    {
        float _1056 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1046 = _1056;
    }
    float _1058 = _1046;
    if (!_1020)
    {
        _678 = _1026;
    }
    float _1060 = _678;
    bool _1062 = !_1020;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _980 + _1068;
        float _1072 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_954);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = fma(_934, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = _1086 + (-1.0);
        float _1096 = fma(_938, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1100 = _1092 + _1098;
        float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1106 = _1096 + _1104;
        float _1108 = _1100 * _1100;
        float _1110 = fma(_1026, _1086, _1102);
        float _1112 = _1106 * _1106;
        _1064 = _1110;
        _1048 = _1108;
        _1050 = _1112;
        _924 = _1092;
        _926 = _1096;
    }
    float _1114 = _1064;
    float _1116 = _1048;
    float _1118 = _1050;
    float _1120 = _924;
    float _1122 = _926;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1126 = _1114 + _1124;
    float _1128 = _1122;
    if (!_996)
    {
        float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1052 = _1130;
    }
    float _1132 = _1052;
    float _1134 = -_1004;
    float _1136 = _800 + _1134;
    float _1138 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1140 = fma(_1126, _1126, _1116);
    float _1142 = _800 * 6.283185482025146484375;
    float _1144 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1146 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1148 = _1140 + _1118;
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1138);
    float _1152 = _1142 * 0.15915493667125701904296875;
    if (!_996)
    {
        float _1154 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _972);
        _1054 = _1154;
    }
    float _1156 = _1054;
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1144);
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1146);
    float _1162 = sqrt(_1148);
    int _1164 = abs(_284);
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1150);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1170 = _754 + 0.5;
    float _1172 = _1022 + 0.5;
    float _1174 = _988 + 0.5;
    float _1176 = _1040 + 0.5;
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1038 + 0.5;
    float _1184 = _1044 + 0.5;
    float _1186 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1160);
    bool _1188 = !_268;
    int _1190 = _1188 ? 0 : 1;
    out.m_71.x = _1174;
    out.m_71.y = _1170;
    out.m_71.z = _1176;
    out.m_71.w = _1182;
    int _1192 = abs(_1190);
    out.m_73.x = _1172;
    out.m_73.y = _1184;
    float _1194 = float(_1164);
    float _1196 = -_1136;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1200 = abs(_276);
    out.m_75.x = _1166;
    out.m_75.y = _1168;
    out.m_75.z = _1186;
    bool _1202 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1204 = isnan(_1162);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1180, 0.5, 0.5);
    float _1214 = abs(_1198);
    float _1216 = _1194 * _1214;
    bool _1218 = _1136 < 0.5;
    float _1220 = float(_1218);
    float _1222 = -_1212;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1192);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = float(_1200);
    float _1234 = fma(_1226, _1224, _1216);
    float _1236 = abs(_1230);
    float _1238 = fma(_1232, _1236, _1234);
    float _1240 = _1234;
    float _1242 = _1216;
    if (!_1210)
    {
        _1240 = 1.0;
    }
    float _1244 = _1240;
    bool _1246 = !_1210;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1162);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1162 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1162);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1162 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1312 = _1114 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1316 = _1120 + _1314;
    float _1318 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1122 + _1320;
    float _1324 = fma(_1316, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1326 = -_712;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1330 = fma(_1322, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1332 = -_716;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -_736;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1342 + _1350;
    float _1354 = fma(_1346, _1346, _1348);
    float _1356 = fma(_1352, _1352, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1362 = _1346 * _1360;
    float _1364 = _1352 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 + _1368;
    float _1372 = sqrt(_1370);
    bool _1374 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = _1372 + _1376;
    float _1380 = _1352;
    float _1382 = _1370;
    float _1384 = _1378;
    if (_1374)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1386;
    }
    float _1388 = _1380;
    if (_1374)
    {
        float _1390 = rsqrt(_1370);
        _1382 = _1390;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    if (_1374)
    {
        float _1396 = _1378 * _1388;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1374)
    {
        float _1400 = _1398 * 0.15915493667125701904296875;
        _1242 = _1400;
    }
    float _1402 = _1242;
    float _1404 = _1348;
    float _1406 = _1402;
    if (_1374)
    {
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        _1404 = _1410;
    }
    float _1412 = _1404;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1358;
    float _1420 = _1416;
    float _1422 = _1414;
    if (_1374)
    {
        float _1424 = _1402 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        _1418 = _1426;
    }
    float _1428 = _1418;
    float _1430 = -_1360;
    float _1432 = -_1416;
    float _1434 = fma(_1338, _1430, _1432);
    float _1436 = -_716;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    if (_1374)
    {
        float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1440;
    }
    float _1442 = _1420;
    float _1444 = _1442;
    float _1446 = _1412;
    if (_1374)
    {
        float _1448 = _1412 + (-1.0);
        _1422 = _1448;
    }
    float _1450 = _1422;
    float _1452 = _1450;
    if (!_1374)
    {
        _1406 = _1366;
    }
    float _1454 = _1406;
    float _1456 = sqrt(_1356);
    float _1458 = _1454;
    if (_1374)
    {
        float _1460 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1428;
    float _1466 = _1462;
    if (_1374)
    {
        float _1468 = fma(_1428, _1442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1444 = _1468;
    }
    float _1470 = _1444;
    if (!_1374)
    {
        _1464 = _1434;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (_1374)
    {
        float _1476 = fma(_1434, _1412, _1462);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1374)
    {
        _1446 = _1362;
    }
    float _1480 = _1446;
    float _1482 = _1480;
    if (_1374)
    {
        float _1484 = _1392 * _1470;
        _1128 = _1484;
    }
    float _1486 = _1128;
    if (!_1374)
    {
        _1466 = _1364;
    }
    float _1488 = _1466;
    float _1490 = _1488;
    if (!_1374)
    {
        _1394 = _1368;
    }
    float _1492 = _1394;
    float _1494 = _1492;
    if (_1374)
    {
        float _1496 = _1362 * _1486;
        _1482 = _1496;
    }
    float _1498 = _1482;
    if (_1374)
    {
        float _1500 = _1364 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1374)
    {
        float _1506 = _1498 * _1498;
        _1458 = _1506;
    }
    float _1508 = _1458;
    if (_1374)
    {
        float _1510 = _1502 * _1502;
        _1494 = _1510;
    }
    float _1512 = _1494;
    float _1514 = fma(_1478, _1478, _1508);
    float _1516 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1514 + _1512;
    float _1520 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = -_736;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _1532 = rsqrt(_1518);
    float _1534 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1542 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = -_1552;
    float _1558 = fma(_1556, _1540, 1.0);
    float _1560 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1542);
    float _1564 = _1532 * _1498;
    float _1566 = _1532 * _1478;
    float _1568 = _1532 * _1502;
    float _1570 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1560);
    float _1572 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    float _1574 = floor(_1546);
    float _1576 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1578 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1582 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1584 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = -_1582;
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = floor(_1554);
    float _1596 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = -_1568;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1606 = fma(_1602, -0.5, 0.5);
    float _1608 = log2(_1558);
    float _1610 = -_1574;
    float _1612 = _1546 + _1610;
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = _1566 + 1.0;
    float _1620 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1622 = exp2(_1596);
    float _1624 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1630 = -_1594;
    float _1632 = _1554 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1636 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1614, _1620, -0.212114393711090087890625);
    float _1640 = sqrt(_1606);
    float _1642 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1644 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1614, _1638, 1.570728778839111328125);
    float _1648 = _1608 * 0.693147182464599609375;
    float _1650 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1652 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1654 = 1.0 / _1634;
    float _1656 = -_1566;
    float _1658 = fma(_1622, _1618, _1656);
    float2 _4821 = float2(_1612, _1632);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4821, float2(0.0), isnan(_4821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4821, float2(0.0), isnan(_4821)), level(0.0)).x;
    float _1662 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1658, 0.5, 0.5);
    float _1666 = _1640 * 0.636619746685028076171875;
    float _1668 = -_1646;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = _1650 * _1654;
    float _1674 = _1652 * _1654;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float3 _4856 = float3(_1676, _1678, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4856, float3(0.0), isnan(_4856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4856, float3(0.0), isnan(_4856)), level(0.0)).x;
    float3 _4867 = float3(_1676, _1678, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4867, float3(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4867, float3(0.0), isnan(_4867)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4883 = float2(_1670, _1664);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4883, float2(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4883, float2(0.0), isnan(_4883)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = -_712;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _1707 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1709 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_1456);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    float _1719 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1721 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1707);
    float _1723 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1719);
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1723);
    float _1731 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1737 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1739 = 1.0 / _1735;
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1735;
    float _1745 = in.m_77.x;
    float _1747 = _1743 * _1739;
    float _1749 = _1747 * 0.5;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    float _1755 = 1.0 / _1753;
    float _1757 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1759 = exp2(_1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1755 * _1761;
    bool _1765 = _1763 <= 8000.0;
    bool _1767 = isnan(_1763);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(8000.0);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = abs(_1763);
    float _1779 = log2(_1777);
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    out.gl_Position.x = _1650;
    out.gl_Position.y = _1652;
    out.gl_Position.z = _1733;
    out.gl_Position.w = _1634;
    float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1787 = exp2(_1785);
    float _1789 = _1652;
    float _1791 = _1650;
    float _1793 = _1733;
    if (!_1717)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1717)
    {
        _1791 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1801 = _1791;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = fma(_1805, -2.0, 3.0);
    float _1809 = _1805 * _1805;
    float _1811 = _1809 * _1807;
    float _1813 = -_1811;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1811);
    float _1819 = _1733 + _1634;
    float _1821 = _1801;
    float _1823 = _1801;
    if (!_1717)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1793;
    float _1827 = _1775 * _1817;
    float _1829 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1831 = _1819 * 0.5;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1831;
    out.m_79.w = _1634;
    float _1835 = -_1660;
    float _1837 = _1835 + 1.0;
    float _1839 = _1837 * _1833;
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1841;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1847 = _1845 * _1745;
    float _1849 = _1847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1847;
    float _1853 = _1685;
    float _1855 = _1825;
    float _1857 = _1825;
    if (!_1717)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1859 = _1851;
    out.m_81.x = _1849;
    float _1861 = _1829 * _1680;
    float _1863 = -_1829;
    float _1865 = _1863 + 1.0;
    float _1867 = _1691 * _1861;
    float _1869 = _1701 * _1861;
    float _1871 = _1691 * _1865;
    float _1873 = fma(_1697, _1867, _1685);
    float _1875 = fma(_1699, _1867, _1687);
    float _1877 = fma(_1691, _1869, _1689);
    float _1879 = _1867;
    float _1881 = _1859;
    float _1883 = _1859;
    if (!_1717)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1885 = _1853;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1717)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1891 = _1879;
    out.m_83.x = _1873;
    out.m_83.y = _1875;
    out.m_83.z = _1877;
    out.m_83.w = _1871;
    bool _1893 = !_1717;
    float _1895 = _1891;
    float _1897 = _1891;
    if (!_1893)
    {
        bool _1899 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1901 = isnan(_1456);
        bool _1903 = _1899 || _1901;
        bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1907 = _1903 || _1905;
        if (!_1907)
        {
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1911 = _1456 + _1909;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1915 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1913;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1921 = 1.0 / _1915;
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1933 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1939 = _1911 * _1921;
            float _1941 = precise::clamp(_1939, 0.0, 1.0);
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = fma(_1941, _1919, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1949 = fma(_1941, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1951 = fma(_1941, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1953 = fma(_1941, _1929, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1955 = fma(_1941, _1933, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1957 = fma(_1941, _1937, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1889 = _1947;
            _1883 = _1955;
            _1799 = _1951;
            _1823 = _1953;
            _1857 = _1949;
            _1897 = _1957;
            _1959 = true;
        }
        else
        {
            bool _1961 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1963 = isnan(_1456);
            bool _1965 = _1961 || _1963;
            bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1969 = _1965 || _1967;
            if (!_1969)
            {
                _1797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1971 = _1797;
            _1799 = _1971;
            if (!_1969)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1973 = _1887;
            _1889 = _1973;
            if (!_1969)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1975 = _1855;
            _1857 = _1975;
            if (!_1969)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1977 = _1821;
            _1823 = _1977;
            if (!_1969)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1979 = _1881;
            _1883 = _1979;
            if (!_1969)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1981 = _1895;
            bool _1983 = !_1969;
            _1897 = _1981;
            if (!_1983)
            {
                bool _1985 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1987 = isnan(_1456);
                bool _1989 = _1985 || _1987;
                bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1993 = _1989 || _1991;
                if (!_1993)
                {
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1997 = _1456 + _1995;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1999;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2007 = 1.0 / _2001;
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2025 = _1997 * _2007;
                    float _2027 = precise::clamp(_2025, 0.0, 1.0);
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = fma(_2027, _2005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2035 = fma(_2027, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2037 = fma(_2027, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2039 = fma(_2027, _2015, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2041 = fma(_2027, _2019, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2043 = fma(_2027, _2023, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1889 = _2033;
                    _1883 = _2041;
                    _1799 = _2037;
                    _1823 = _2039;
                    _1857 = _2035;
                    _1897 = _2043;
                    _1959 = true;
                }
                else
                {
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1959 = false;
    float _2045 = _1889;
    float _2047 = _1883;
    float _2049 = _1799;
    float _2051 = _1823;
    float _2053 = _1857;
    float _2055 = _1897;
    float _2057 = fma(_1168, -0.5, 0.5);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = -_2045;
    float _2063 = _2061 + _2047;
    float _2065 = -_2049;
    float _2067 = _2065 + _2051;
    float _2069 = -_2053;
    float _2071 = _2069 + _2055;
    bool _2073 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2075 = fma(_2059, _2063, _2045);
    float _2077 = fma(_2059, _2067, _2049);
    float _2079 = fma(_2059, _2071, _2053);
    float _2081 = _1238 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _2075 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2085 = fma(_2077, 0.298911988735198974609375, _2083);
    out.m_51.x = _2081;
    float _2087 = fma(_2079, 0.114477999508380889892578125, _2085);
    float _2089 = -_2087;
    float _2091 = _2077 + _2089;
    float _2093 = -_2087;
    float _2095 = _2075 + _2093;
    float _2097 = -_2087;
    float _2099 = _2079 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    out.m_87.x = _2101;
    out.m_87.y = _2103;
    out.m_87.z = _2105;
    if (!_2073)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2107 = -_1328;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2111 = -_1334;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2115 = -_1342;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2119 = _2109 * _2109;
    float _2121 = fma(_2113, _2113, _2119);
    float _2123 = fma(_2117, _2117, _2121);
    float _2125 = sqrt(_2123);
    float _2127 = rsqrt(_2123);
    float _2129 = -_2125;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2113 * _2127;
    float _2139 = _2109 * _2127;
    float _2141 = abs(_2135);
    float _2143 = log2(_2141);
    float _2145 = _2117 * _2127;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2149 = _1168 * _2139;
    float _2151 = -_2139;
    float _2153 = -_2147;
    float _2155 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2153);
    float _2157 = fma(_1166, _2137, _2149);
    float _2159 = -_2145;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2155);
    float _2163 = fma(_1186, _2145, _2157);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2169 = _2161 + _2167;
    float _2171 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2175 = precise::clamp(_2173, 0.0, 1.0);
    float _2177 = exp2(_2171);
    float _2179 = _2177 * _2175;
    float _2181 = _2165 * _2179;
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1959 = false;
    bool _1278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_120);
        out.gl_Position.z = _2243;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_53.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_154);
        out.gl_Position.z = _2307;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    float _160 = in.m_55.z;
    float _162 = 1.0 / _126;
    float _164 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_59.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = in.m_59.y;
    float _178 = _130 * _162;
    float _180 = in.m_57.y;
    float _182 = fma(_178, 1.25, 0.75);
    float _184 = in.m_59.w;
    float _186 = _178 * 3.1415927410125732421875;
    float _188 = abs(_156);
    float _190 = abs(_160);
    float _192 = precise::max(_188, _190);
    float _194 = -_160;
    float _196 = fma(_182, _160, _194);
    float _198 = -_156;
    float _200 = fma(_182, _156, _198);
    float _202 = in.m_48.x;
    float _204 = in.m_48.y;
    float _206 = in.m_48.z;
    bool _208 = _192 >= 16.0;
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[191].z, _160);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _214 = _164 * _174;
    float _216 = 0.0;
    float _218 = _160;
    float _220 = _156;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _224 = _166;
    if (!_170)
    {
        _216 = _166;
    }
    float _226 = _216;
    float _228 = _226;
    if (_208)
    {
        float _230 = _160 * 0.0625;
        _218 = _230;
    }
    float _232 = _218;
    if (_208)
    {
        float _234 = _156 * 0.0625;
        _220 = _234;
    }
    float _236 = _220;
    float _238 = abs(_232);
    bool _240 = _238 != 0.0;
    bool _242 = isnan(_238);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = abs(_236);
    bool _252 = _250 == 0.0;
    bool _254 = !_248;
    bool _256 = _252 && _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    int _266 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    bool _274 = !_264;
    int _276 = _274 ? 0 : 1;
    float _278 = abs(_236);
    bool _280 = _278 == 0.0;
    bool _282 = !_260;
    int _284 = _282 ? 0 : 1;
    bool _286 = _260;
    int _288 = _248 ? (-1) : 0;
    bool _290 = _256;
    if (_256)
    {
        bool _292 = as_type<int>(_236) >= 0;
        _286 = _292;
    }
    bool _294 = _286;
    int _296 = 0;
    if (_256)
    {
        int _298 = _294 ? 0 : 1078530011;
        _296 = _298;
    }
    int _300 = _296;
    int _302 = _300;
    if (_256)
    {
        int _304 = int(0x80000000) & as_type<int>(_232);
        int _306 = _300 | _304;
        _302 = _306;
    }
    int _308 = _302;
    bool _310 = !_248;
    bool _312 = _310 && _280;
    int _314 = _308;
    float _316 = as_type<float>(_308);
    float _318 = _180;
    if (!_312)
    {
        float _320 = abs(_232);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_236);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_236);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _290 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_236) >= 0;
            _288 = _344 ? (-1) : 0;
        }
        int _346 = _288;
        if (_342)
        {
            _314 = 1075235812;
        }
        int _348 = _314;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        float _358 = as_type<float>(_356);
        if (_342)
        {
            int _360 = int(0x80000000) & as_type<int>(_232);
            int _362 = _356 | _360;
            _358 = as_type<float>(_362);
        }
        float _364 = _358;
        bool _366 = !_330;
        bool _368 = _366 && _334;
        _316 = _364;
        if (!_368)
        {
            float _370 = abs(_236);
            float _372 = abs(_232);
            float _374 = precise::max(_370, _372);
            float _376 = abs(_236);
            float _378 = abs(_232);
            float _380 = precise::min(_376, _378);
            float _382 = 1.0 / _374;
            float _384 = abs(_232);
            float _386 = abs(_236);
            bool _388 = _384 > _386;
            bool _390 = as_type<int>(_236) >= 0;
            float _392 = _380 * _382;
            float _394 = _392 * _392;
            float _396 = _394 + 11.33538818359375;
            float _398 = fma(_394, _396, 28.84246826171875);
            float _400 = fma(_394, _398, 19.6966705322265625);
            float _402 = fma(_394, -0.82336294651031494140625, -5.674867153167724609375);
            float _404 = abs(_236);
            float _406 = abs(_232);
            float _408 = _404 + _406;
            float _410 = fma(_394, _402, -6.565555095672607421875);
            float _412 = 1.0 / _400;
            bool _414 = _408 > as_type<float>(0x7f800000u /* inf */);
            bool _416 = isnan(_408);
            bool _418 = _414 || _416;
            bool _420 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _422 = _418 || _420;
            float _424 = _394 * _410;
            float _426 = _392 * _424;
            float _428 = fma(_426, _412, _392);
            int _430 = as_type<int>(_232) & int(0x80000000);
            float _432 = _428;
            _222 = _430;
            _316 = _408;
            if (_388)
            {
                float _434 = -_428;
                float _436 = _434 + 1.57079637050628662109375;
                _432 = _436;
            }
            float _438 = _432;
            int _440 = as_type<int>(_438);
            if (!_390)
            {
                float _442 = -_438;
                float _444 = _442 + 3.1415927410125732421875;
                _440 = as_type<int>(_444);
            }
            int _446 = _440;
            if (!_422)
            {
                int _448 = _430 | _446;
                _316 = as_type<float>(_448);
            }
        }
    }
    bool _450 = _290;
    int _452 = _222;
    float _454 = _316;
    float _456 = _186 * 0.15915493667125701904296875;
    int _458 = _452;
    bool _460 = _450;
    if (_170)
    {
        float _462 = -_166;
        float _464 = _462 + 1.0;
        _458 = as_type<int>(_464);
    }
    int _466 = _458;
    float _468 = in.m_61.x;
    float _470 = in.m_61.y;
    float _472 = in.m_61.z;
    if (_170)
    {
        bool _474 = _172 > 0.5;
        _460 = _474;
    }
    bool _476 = _460;
    float _478 = -_180;
    float _480 = _478 + 1.0;
    bool _482 = _176 > 0.5;
    float _484 = _456 * 6.283185482025146484375;
    float _486 = sin(_484);
    if (_170)
    {
        float _488 = _476 ? as_type<float>(_466) : _166;
        _228 = _488;
    }
    float _490 = _228;
    float _492 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _498 = _184 > 0.5;
    float _500 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    int _508 = _482 ? as_type<int>(_480) : as_type<int>(_180);
    float _510 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _512 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _514 = _504 ? as_type<float>(_508) : _180;
    float _516 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    int _518 = _498 ? as_type<int>(_480) : as_type<int>(_180);
    float _520 = 0.0 + _486;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _526 = _524 != 0;
    float _528 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _532 = _530 != 0;
    float _534 = -_158;
    float _536 = fma(_522, _158, _534);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    float _548 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _552 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _558 = -_542;
    float _560 = fma(_548, 2.0, _558);
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _580 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _588 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _592 = _570 + _590;
    float _594 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _598 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.x = _580;
    out.m_63.y = _582;
    out.m_63.z = _584;
    out.m_63.w = _578;
    float _606 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _588 + _608;
    float _612 = fma(_594, -2.0, _604);
    out.m_65.x = _598;
    out.m_65.y = _600;
    out.m_65.z = _602;
    out.m_65.w = _596;
    float _614 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = in.m_59.z;
    float _620 = fma(_614, _514, -0.5);
    float _622 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    out.m_67.y = _180;
    int _624 = 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    int _628 = as_type<int>(_620);
    if (_532)
    {
        float _630 = -_166;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _592 * _592;
    float _638 = _586 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _640 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _606 + _642;
    float _646 = fma(_610, _610, _636);
    float _648 = _540 ? as_type<float>(_518) : _180;
    float _650 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _654 = fma(_644, _644, _646);
    float _656 = _646;
    if (!_272)
    {
        _656 = _176;
    }
    float _658 = _656;
    float _660 = fma(_648, _638, -0.5);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = _650 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _666 = rsqrt(_654);
    float _668 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _670 = _664 * 12.0;
    float _672 = _664 * 6.0;
    float _674 = _670;
    float _676 = _658;
    float _678 = _660;
    if (!_272)
    {
        _626 = _658;
    }
    float _680 = _626;
    float _682 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _652);
    float _684 = fma(_454, 4.0, _670);
    float _686 = _680;
    if (_272)
    {
        _674 = _172;
    }
    float _688 = _674;
    float _690 = -_672;
    float _692 = fma(_454, 3.0, _690);
    float _694 = _688;
    float _696 = _618;
    if (!_272)
    {
        _694 = _618;
    }
    float _698 = _694;
    float _700 = _684 * 0.15915493667125701904296875;
    if (_272)
    {
        _676 = _176;
    }
    float _702 = _676;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _706 = _618 > 0.5;
    float _708 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _668);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _592 * _666;
    float _714 = _698 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _716 = _610 * _666;
    float _718 = _714;
    if (_546)
    {
        float _720 = _706 ? _480 : _180;
        _318 = _720;
    }
    float _722 = _318;
    float _724 = -_712;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _728 = -_704;
    float _730 = fma(_714, 2.0, _728);
    float _732 = -_716;
    float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _736 = _644 * _666;
    float _738 = _726 * _726;
    float _740 = _700 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _454 + 3.1415927410125732421875;
    float _746 = -_736;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _750 = fma(_734, _734, _738);
    float _752 = -_622;
    float _754 = fma(_708, _620, _752);
    float _756 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _758 = _664 * 6.283185482025146484375;
    float _760 = fma(_748, _748, _750);
    float _762 = _710 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _744 * 0.15915493667125701904296875;
    if (_526)
    {
        float _768 = -_166;
        float _770 = _768 + 1.0;
        _628 = as_type<int>(_770);
    }
    int _772 = _628;
    float _774 = fma(_756, _722, -0.5);
    float _776 = _758 * 0.15915493667125701904296875;
    if (!_526)
    {
        _718 = _166;
    }
    float _778 = _718;
    float _780 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _766 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _778;
    if (_526)
    {
        float _788 = _706 ? as_type<float>(_772) : _166;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _792;
    if (_272)
    {
        _686 = _172;
    }
    float _796 = _686;
    float _798 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _214);
    float _802 = _742 + _764;
    float _804 = _776 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _812 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_802, 0.25, 0.5);
    if (!_532)
    {
        _794 = _166;
    }
    float _816 = _794;
    float _818 = fma(_784, 0.5, 0.5);
    float _820 = -_810;
    float _822 = fma(_812, 2.0, _820);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _826 = _824 + 2.0;
    float _828 = _816;
    if (_532)
    {
        float _830 = _482 ? as_type<float>(_634) : _166;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = sqrt(_760);
    if (!_272)
    {
        _224 = _618;
    }
    float _836 = _224;
    float _838 = fma(_814, _826, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _836;
    float _844 = 0.10000002384185791015625;
    if (_272)
    {
        _842 = _702;
    }
    float _846 = _842;
    float _848 = _818 * _838;
    float _850 = fma(_806, 0.10000002384185791015625, 1.0);
    float _852 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    if (_272)
    {
        _696 = _702;
    }
    float _856 = _696;
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _860 = _848 * _852;
    if (_272)
    {
        _844 = _702;
    }
    float _862 = _844;
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _866 = _666 * _834;
    float _868 = fma(_860, _858, 1.0);
    float _870 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _640 * _866;
    float _874 = _212 * _868;
    float _876 = _780 * _866;
    float _878 = _798 * _866;
    float _880 = _210 * _868;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _888 = _876 * _882;
    float _890 = _872 * _884;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _878 * _886;
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _908 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _900);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _904);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _906);
    float _914 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _916 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _902);
    float _918 = _588 + _910;
    float _920 = _606 + _912;
    float _922 = _862;
    float _924 = _918;
    float _926 = _920;
    if (!_272)
    {
        _922 = _172;
    }
    float _928 = _922;
    float _930 = fma(_914, _490, -0.5);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _918 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _938 = _920 + _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _942 = _892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = _934 * _934;
    float _946 = _938 * _938;
    float _948 = fma(_870, -2.0, _940);
    float _950 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _908);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _954 = _944 + _946;
    float _956 = fma(_942, _790, -0.5);
    bool _958 = _860 != 0.0;
    bool _960 = isnan(_860);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = in.m_69.x;
    float _970 = in.m_69.y;
    float _972 = in.m_69.z;
    float _974 = -_130;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _978 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = sqrt(_954);
    bool _982 = _874 == 0.0;
    bool _984 = !_966;
    bool _986 = _982 && _984;
    float _988 = fma(_950, _930, _976);
    float _990 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _992 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _978);
    bool _994 = _880 == 0.0;
    bool _996 = _994 && _986;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1000 = _928 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1002 = _952 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1004 = floor(_800);
    float _1006 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _916);
    float _1008 = -_130;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _1012 = fma(_1002, _832, -0.5);
    float _1014 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _992);
    float _1016 = fma(_1000, -2.0, _998);
    float _1018 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    bool _1020 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = fma(_1006, _1012, _1010);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1026 = _570 + _1014;
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[81].x, _822);
    float _1032 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _682);
    float _1034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1016);
    float _1036 = -_1024;
    float _1038 = fma(_1018, _660, _1036);
    float _1040 = fma(_990, _956, _1030);
    float _1042 = -_1034;
    float _1044 = fma(_1032, _774, _1042);
    float _1046 = _970;
    float _1048 = _944;
    float _1050 = _946;
    float _1052 = _968;
    float _1054 = _972;
    if (!_996)
    {
        float _1056 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1046 = _1056;
    }
    float _1058 = _1046;
    if (!_1020)
    {
        _678 = _1026;
    }
    float _1060 = _678;
    bool _1062 = !_1020;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _980 + _1068;
        float _1072 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_954);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = fma(_934, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = _1086 + (-1.0);
        float _1096 = fma(_938, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1100 = _1092 + _1098;
        float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1106 = _1096 + _1104;
        float _1108 = _1100 * _1100;
        float _1110 = fma(_1026, _1086, _1102);
        float _1112 = _1106 * _1106;
        _1064 = _1110;
        _1048 = _1108;
        _1050 = _1112;
        _924 = _1092;
        _926 = _1096;
    }
    float _1114 = _1064;
    float _1116 = _1048;
    float _1118 = _1050;
    float _1120 = _924;
    float _1122 = _926;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1126 = _1114 + _1124;
    float _1128 = _1122;
    if (!_996)
    {
        float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1052 = _1130;
    }
    float _1132 = _1052;
    float _1134 = -_1004;
    float _1136 = _800 + _1134;
    float _1138 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1140 = fma(_1126, _1126, _1116);
    float _1142 = _800 * 6.283185482025146484375;
    float _1144 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1146 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1148 = _1140 + _1118;
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1138);
    float _1152 = _1142 * 0.15915493667125701904296875;
    if (!_996)
    {
        float _1154 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _972);
        _1054 = _1154;
    }
    float _1156 = _1054;
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1144);
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1146);
    float _1162 = sqrt(_1148);
    int _1164 = abs(_284);
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1150);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1170 = _754 + 0.5;
    float _1172 = _1022 + 0.5;
    float _1174 = _988 + 0.5;
    float _1176 = _1040 + 0.5;
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1038 + 0.5;
    float _1184 = _1044 + 0.5;
    float _1186 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1160);
    bool _1188 = !_268;
    int _1190 = _1188 ? 0 : 1;
    out.m_71.x = _1174;
    out.m_71.y = _1170;
    out.m_71.z = _1176;
    out.m_71.w = _1182;
    int _1192 = abs(_1190);
    out.m_73.x = _1172;
    out.m_73.y = _1184;
    float _1194 = float(_1164);
    float _1196 = -_1136;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1200 = abs(_276);
    out.m_75.x = _1166;
    out.m_75.y = _1168;
    out.m_75.z = _1186;
    bool _1202 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1204 = isnan(_1162);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1180, 0.5, 0.5);
    float _1214 = abs(_1198);
    float _1216 = _1194 * _1214;
    bool _1218 = _1136 < 0.5;
    float _1220 = float(_1218);
    float _1222 = -_1212;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1192);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = float(_1200);
    float _1234 = fma(_1226, _1224, _1216);
    float _1236 = abs(_1230);
    float _1238 = fma(_1232, _1236, _1234);
    float _1240 = _1234;
    float _1242 = _1216;
    if (!_1210)
    {
        _1240 = 1.0;
    }
    float _1244 = _1240;
    bool _1246 = !_1210;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1162);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1162 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1162);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1162 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1312 = _1114 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1316 = _1120 + _1314;
    float _1318 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1122 + _1320;
    float _1324 = fma(_1316, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1326 = -_712;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1330 = fma(_1322, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1332 = -_716;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -_736;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1342 + _1350;
    float _1354 = fma(_1346, _1346, _1348);
    float _1356 = fma(_1352, _1352, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1362 = _1346 * _1360;
    float _1364 = _1352 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 + _1368;
    float _1372 = sqrt(_1370);
    bool _1374 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = _1372 + _1376;
    float _1380 = _1352;
    float _1382 = _1370;
    float _1384 = _1378;
    if (_1374)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1386;
    }
    float _1388 = _1380;
    if (_1374)
    {
        float _1390 = rsqrt(_1370);
        _1382 = _1390;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    if (_1374)
    {
        float _1396 = _1378 * _1388;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1374)
    {
        float _1400 = _1398 * 0.15915493667125701904296875;
        _1242 = _1400;
    }
    float _1402 = _1242;
    float _1404 = _1348;
    float _1406 = _1402;
    if (_1374)
    {
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        _1404 = _1410;
    }
    float _1412 = _1404;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1358;
    float _1420 = _1416;
    float _1422 = _1414;
    if (_1374)
    {
        float _1424 = _1402 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        _1418 = _1426;
    }
    float _1428 = _1418;
    float _1430 = -_1360;
    float _1432 = -_1416;
    float _1434 = fma(_1338, _1430, _1432);
    float _1436 = -_716;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    if (_1374)
    {
        float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1440;
    }
    float _1442 = _1420;
    float _1444 = _1442;
    float _1446 = _1412;
    if (_1374)
    {
        float _1448 = _1412 + (-1.0);
        _1422 = _1448;
    }
    float _1450 = _1422;
    float _1452 = _1450;
    if (!_1374)
    {
        _1406 = _1366;
    }
    float _1454 = _1406;
    float _1456 = sqrt(_1356);
    float _1458 = _1454;
    if (_1374)
    {
        float _1460 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1428;
    float _1466 = _1462;
    if (_1374)
    {
        float _1468 = fma(_1428, _1442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1444 = _1468;
    }
    float _1470 = _1444;
    if (!_1374)
    {
        _1464 = _1434;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (_1374)
    {
        float _1476 = fma(_1434, _1412, _1462);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1374)
    {
        _1446 = _1362;
    }
    float _1480 = _1446;
    float _1482 = _1480;
    if (_1374)
    {
        float _1484 = _1392 * _1470;
        _1128 = _1484;
    }
    float _1486 = _1128;
    if (!_1374)
    {
        _1466 = _1364;
    }
    float _1488 = _1466;
    float _1490 = _1488;
    if (!_1374)
    {
        _1394 = _1368;
    }
    float _1492 = _1394;
    float _1494 = _1492;
    if (_1374)
    {
        float _1496 = _1362 * _1486;
        _1482 = _1496;
    }
    float _1498 = _1482;
    if (_1374)
    {
        float _1500 = _1364 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1374)
    {
        float _1506 = _1498 * _1498;
        _1458 = _1506;
    }
    float _1508 = _1458;
    if (_1374)
    {
        float _1510 = _1502 * _1502;
        _1494 = _1510;
    }
    float _1512 = _1494;
    float _1514 = fma(_1478, _1478, _1508);
    float _1516 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1514 + _1512;
    float _1520 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = -_736;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _1532 = rsqrt(_1518);
    float _1534 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1542 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = -_1552;
    float _1558 = fma(_1556, _1540, 1.0);
    float _1560 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1542);
    float _1564 = _1532 * _1498;
    float _1566 = _1532 * _1478;
    float _1568 = _1532 * _1502;
    float _1570 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1560);
    float _1572 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    float _1574 = floor(_1546);
    float _1576 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1578 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1582 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1584 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = -_1582;
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = floor(_1554);
    float _1596 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = -_1568;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1606 = fma(_1602, -0.5, 0.5);
    float _1608 = log2(_1558);
    float _1610 = -_1574;
    float _1612 = _1546 + _1610;
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = _1566 + 1.0;
    float _1620 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1622 = exp2(_1596);
    float _1624 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1630 = -_1594;
    float _1632 = _1554 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1636 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1614, _1620, -0.212114393711090087890625);
    float _1640 = sqrt(_1606);
    float _1642 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1644 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1614, _1638, 1.570728778839111328125);
    float _1648 = _1608 * 0.693147182464599609375;
    float _1650 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1652 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1654 = 1.0 / _1634;
    float _1656 = -_1566;
    float _1658 = fma(_1622, _1618, _1656);
    float2 _4821 = float2(_1612, _1632);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4821, float2(0.0), isnan(_4821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4821, float2(0.0), isnan(_4821)), level(0.0)).x;
    float _1662 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1658, 0.5, 0.5);
    float _1666 = _1640 * 0.636619746685028076171875;
    float _1668 = -_1646;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = _1650 * _1654;
    float _1674 = _1652 * _1654;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float3 _4856 = float3(_1676, _1678, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4856, float3(0.0), isnan(_4856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4856, float3(0.0), isnan(_4856)), level(0.0)).x;
    float3 _4867 = float3(_1676, _1678, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4867, float3(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4867, float3(0.0), isnan(_4867)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4883 = float2(_1670, _1664);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4883, float2(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4883, float2(0.0), isnan(_4883)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = -_712;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _1707 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1709 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_1456);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    float _1719 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1721 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1707);
    float _1723 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1719);
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1723);
    float _1731 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1737 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1739 = 1.0 / _1735;
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1735;
    float _1745 = in.m_77.x;
    float _1747 = _1743 * _1739;
    float _1749 = _1747 * 0.5;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    float _1755 = 1.0 / _1753;
    float _1757 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1759 = exp2(_1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1755 * _1761;
    bool _1765 = _1763 <= 8000.0;
    bool _1767 = isnan(_1763);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(8000.0);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = abs(_1763);
    float _1779 = log2(_1777);
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    out.gl_Position.x = _1650;
    out.gl_Position.y = _1652;
    out.gl_Position.z = _1733;
    out.gl_Position.w = _1634;
    float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1787 = exp2(_1785);
    float _1789 = _1652;
    float _1791 = _1650;
    float _1793 = _1733;
    if (!_1717)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1717)
    {
        _1791 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1801 = _1791;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = fma(_1805, -2.0, 3.0);
    float _1809 = _1805 * _1805;
    float _1811 = _1809 * _1807;
    float _1813 = -_1811;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1811);
    float _1819 = _1733 + _1634;
    float _1821 = _1801;
    float _1823 = _1801;
    if (!_1717)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1793;
    float _1827 = _1775 * _1817;
    float _1829 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1831 = _1819 * 0.5;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1831;
    out.m_79.w = _1634;
    float _1835 = -_1660;
    float _1837 = _1835 + 1.0;
    float _1839 = _1837 * _1833;
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1841;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1847 = _1845 * _1745;
    float _1849 = _1847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1847;
    float _1853 = _1685;
    float _1855 = _1825;
    float _1857 = _1825;
    if (!_1717)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1859 = _1851;
    out.m_81.x = _1849;
    float _1861 = _1829 * _1680;
    float _1863 = -_1829;
    float _1865 = _1863 + 1.0;
    float _1867 = _1691 * _1861;
    float _1869 = _1701 * _1861;
    float _1871 = _1691 * _1865;
    float _1873 = fma(_1697, _1867, _1685);
    float _1875 = fma(_1699, _1867, _1687);
    float _1877 = fma(_1691, _1869, _1689);
    float _1879 = _1867;
    float _1881 = _1859;
    float _1883 = _1859;
    if (!_1717)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1885 = _1853;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1717)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1891 = _1879;
    out.m_83.x = _1873;
    out.m_83.y = _1875;
    out.m_83.z = _1877;
    out.m_83.w = _1871;
    bool _1893 = !_1717;
    float _1895 = _1891;
    float _1897 = _1891;
    if (!_1893)
    {
        bool _1899 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1901 = isnan(_1456);
        bool _1903 = _1899 || _1901;
        bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1907 = _1903 || _1905;
        if (!_1907)
        {
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1911 = _1456 + _1909;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1915 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1913;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1921 = 1.0 / _1915;
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1933 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1939 = _1911 * _1921;
            float _1941 = precise::clamp(_1939, 0.0, 1.0);
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = fma(_1941, _1919, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1949 = fma(_1941, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1951 = fma(_1941, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1953 = fma(_1941, _1929, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1955 = fma(_1941, _1933, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1957 = fma(_1941, _1937, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1889 = _1947;
            _1883 = _1955;
            _1799 = _1951;
            _1823 = _1953;
            _1857 = _1949;
            _1897 = _1957;
            _1959 = true;
        }
        else
        {
            bool _1961 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1963 = isnan(_1456);
            bool _1965 = _1961 || _1963;
            bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1969 = _1965 || _1967;
            if (!_1969)
            {
                _1797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1971 = _1797;
            _1799 = _1971;
            if (!_1969)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1973 = _1887;
            _1889 = _1973;
            if (!_1969)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1975 = _1855;
            _1857 = _1975;
            if (!_1969)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1977 = _1821;
            _1823 = _1977;
            if (!_1969)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1979 = _1881;
            _1883 = _1979;
            if (!_1969)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1981 = _1895;
            bool _1983 = !_1969;
            _1897 = _1981;
            if (!_1983)
            {
                bool _1985 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1987 = isnan(_1456);
                bool _1989 = _1985 || _1987;
                bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1993 = _1989 || _1991;
                if (!_1993)
                {
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1997 = _1456 + _1995;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1999;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2007 = 1.0 / _2001;
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2025 = _1997 * _2007;
                    float _2027 = precise::clamp(_2025, 0.0, 1.0);
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = fma(_2027, _2005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2035 = fma(_2027, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2037 = fma(_2027, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2039 = fma(_2027, _2015, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2041 = fma(_2027, _2019, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2043 = fma(_2027, _2023, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1889 = _2033;
                    _1883 = _2041;
                    _1799 = _2037;
                    _1823 = _2039;
                    _1857 = _2035;
                    _1897 = _2043;
                    _1959 = true;
                }
                else
                {
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1959 = false;
    float _2045 = _1889;
    float _2047 = _1883;
    float _2049 = _1799;
    float _2051 = _1823;
    float _2053 = _1857;
    float _2055 = _1897;
    float _2057 = fma(_1168, -0.5, 0.5);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = -_2045;
    float _2063 = _2061 + _2047;
    float _2065 = -_2049;
    float _2067 = _2065 + _2051;
    float _2069 = -_2053;
    float _2071 = _2069 + _2055;
    bool _2073 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2075 = fma(_2059, _2063, _2045);
    float _2077 = fma(_2059, _2067, _2049);
    float _2079 = fma(_2059, _2071, _2053);
    float _2081 = _1238 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _2075 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2085 = fma(_2077, 0.298911988735198974609375, _2083);
    out.m_51.x = _2081;
    float _2087 = fma(_2079, 0.114477999508380889892578125, _2085);
    float _2089 = -_2087;
    float _2091 = _2077 + _2089;
    float _2093 = -_2087;
    float _2095 = _2075 + _2093;
    float _2097 = -_2087;
    float _2099 = _2079 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    out.m_87.x = _2101;
    out.m_87.y = _2103;
    out.m_87.z = _2105;
    if (!_2073)
    {
        return out;
    }
    float _2107 = -_1328;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2111 = -_1334;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2115 = -_1342;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2119 = _2109 * _2109;
    float _2121 = fma(_2113, _2113, _2119);
    float _2123 = fma(_2117, _2117, _2121);
    float _2125 = sqrt(_2123);
    float _2127 = rsqrt(_2123);
    float _2129 = -_2125;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2113 * _2127;
    float _2139 = _2109 * _2127;
    float _2141 = abs(_2135);
    float _2143 = log2(_2141);
    float _2145 = _2117 * _2127;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2149 = _1168 * _2139;
    float _2151 = -_2139;
    float _2153 = -_2147;
    float _2155 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2153);
    float _2157 = fma(_1166, _2137, _2149);
    float _2159 = -_2145;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2155);
    float _2163 = fma(_1186, _2145, _2157);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2169 = _2161 + _2167;
    float _2171 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2175 = precise::clamp(_2173, 0.0, 1.0);
    float _2177 = exp2(_2171);
    float _2179 = _2177 * _2175;
    float _2181 = _2165 * _2179;
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1959 = false;
    bool _1278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2243 = as_type<float>(_120);
        out.gl_Position.z = _2243;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_53.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_154);
        out.gl_Position.z = _2307;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_55.x;
    float _158 = in.m_55.y;
    float _160 = in.m_55.z;
    float _162 = 1.0 / _126;
    float _164 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = in.m_59.x;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _176 = in.m_59.y;
    float _178 = _130 * _162;
    float _180 = in.m_57.y;
    float _182 = fma(_178, 1.25, 0.75);
    float _184 = in.m_59.w;
    float _186 = _178 * 3.1415927410125732421875;
    float _188 = abs(_156);
    float _190 = abs(_160);
    float _192 = precise::max(_188, _190);
    float _194 = -_160;
    float _196 = fma(_182, _160, _194);
    float _198 = -_156;
    float _200 = fma(_182, _156, _198);
    float _202 = in.m_48.x;
    float _204 = in.m_48.y;
    float _206 = in.m_48.z;
    bool _208 = _192 >= 16.0;
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[191].z, _160);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[191].z, _156);
    float _214 = _164 * _174;
    float _216 = 0.0;
    float _218 = _160;
    float _220 = _156;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _224 = _166;
    if (!_170)
    {
        _216 = _166;
    }
    float _226 = _216;
    float _228 = _226;
    if (_208)
    {
        float _230 = _160 * 0.0625;
        _218 = _230;
    }
    float _232 = _218;
    if (_208)
    {
        float _234 = _156 * 0.0625;
        _220 = _234;
    }
    float _236 = _220;
    float _238 = abs(_232);
    bool _240 = _238 != 0.0;
    bool _242 = isnan(_238);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = abs(_236);
    bool _252 = _250 == 0.0;
    bool _254 = !_248;
    bool _256 = _252 && _254;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    int _266 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    bool _274 = !_264;
    int _276 = _274 ? 0 : 1;
    float _278 = abs(_236);
    bool _280 = _278 == 0.0;
    bool _282 = !_260;
    int _284 = _282 ? 0 : 1;
    bool _286 = _260;
    int _288 = _248 ? (-1) : 0;
    bool _290 = _256;
    if (_256)
    {
        bool _292 = as_type<int>(_236) >= 0;
        _286 = _292;
    }
    bool _294 = _286;
    int _296 = 0;
    if (_256)
    {
        int _298 = _294 ? 0 : 1078530011;
        _296 = _298;
    }
    int _300 = _296;
    int _302 = _300;
    if (_256)
    {
        int _304 = int(0x80000000) & as_type<int>(_232);
        int _306 = _300 | _304;
        _302 = _306;
    }
    int _308 = _302;
    bool _310 = !_248;
    bool _312 = _310 && _280;
    int _314 = _308;
    float _316 = as_type<float>(_308);
    float _318 = _180;
    if (!_312)
    {
        float _320 = abs(_232);
        bool _322 = _320 != as_type<float>(0x7f800000u /* inf */);
        bool _324 = isnan(_320);
        bool _326 = _322 || _324;
        bool _328 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _330 = _326 || _328;
        float _332 = abs(_236);
        bool _334 = _332 == as_type<float>(0x7f800000u /* inf */);
        float _336 = abs(_236);
        bool _338 = _336 == as_type<float>(0x7f800000u /* inf */);
        bool _340 = !_330;
        bool _342 = _338 && _340;
        _290 = _334;
        if (_342)
        {
            bool _344 = as_type<int>(_236) >= 0;
            _288 = _344 ? (-1) : 0;
        }
        int _346 = _288;
        if (_342)
        {
            _314 = 1075235812;
        }
        int _348 = _314;
        int _350 = _348;
        if (_342)
        {
            int _352 = ~_346;
            int _354 = (_352 != 0) ? _348 : 1061752795;
            _350 = _354;
        }
        int _356 = _350;
        float _358 = as_type<float>(_356);
        if (_342)
        {
            int _360 = int(0x80000000) & as_type<int>(_232);
            int _362 = _356 | _360;
            _358 = as_type<float>(_362);
        }
        float _364 = _358;
        bool _366 = !_330;
        bool _368 = _366 && _334;
        _316 = _364;
        if (!_368)
        {
            float _370 = abs(_236);
            float _372 = abs(_232);
            float _374 = precise::max(_370, _372);
            float _376 = abs(_236);
            float _378 = abs(_232);
            float _380 = precise::min(_376, _378);
            float _382 = 1.0 / _374;
            float _384 = abs(_232);
            float _386 = abs(_236);
            bool _388 = _384 > _386;
            bool _390 = as_type<int>(_236) >= 0;
            float _392 = _380 * _382;
            float _394 = _392 * _392;
            float _396 = _394 + 11.33538818359375;
            float _398 = fma(_394, _396, 28.84246826171875);
            float _400 = fma(_394, _398, 19.6966705322265625);
            float _402 = fma(_394, -0.82336294651031494140625, -5.674867153167724609375);
            float _404 = abs(_236);
            float _406 = abs(_232);
            float _408 = _404 + _406;
            float _410 = fma(_394, _402, -6.565555095672607421875);
            float _412 = 1.0 / _400;
            bool _414 = _408 > as_type<float>(0x7f800000u /* inf */);
            bool _416 = isnan(_408);
            bool _418 = _414 || _416;
            bool _420 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _422 = _418 || _420;
            float _424 = _394 * _410;
            float _426 = _392 * _424;
            float _428 = fma(_426, _412, _392);
            int _430 = as_type<int>(_232) & int(0x80000000);
            float _432 = _428;
            _222 = _430;
            _316 = _408;
            if (_388)
            {
                float _434 = -_428;
                float _436 = _434 + 1.57079637050628662109375;
                _432 = _436;
            }
            float _438 = _432;
            int _440 = as_type<int>(_438);
            if (!_390)
            {
                float _442 = -_438;
                float _444 = _442 + 3.1415927410125732421875;
                _440 = as_type<int>(_444);
            }
            int _446 = _440;
            if (!_422)
            {
                int _448 = _430 | _446;
                _316 = as_type<float>(_448);
            }
        }
    }
    bool _450 = _290;
    int _452 = _222;
    float _454 = _316;
    float _456 = _186 * 0.15915493667125701904296875;
    int _458 = _452;
    bool _460 = _450;
    if (_170)
    {
        float _462 = -_166;
        float _464 = _462 + 1.0;
        _458 = as_type<int>(_464);
    }
    int _466 = _458;
    float _468 = in.m_61.x;
    float _470 = in.m_61.y;
    float _472 = in.m_61.z;
    if (_170)
    {
        bool _474 = _172 > 0.5;
        _460 = _474;
    }
    bool _476 = _460;
    float _478 = -_180;
    float _480 = _478 + 1.0;
    bool _482 = _176 > 0.5;
    float _484 = _456 * 6.283185482025146484375;
    float _486 = sin(_484);
    if (_170)
    {
        float _488 = _476 ? as_type<float>(_466) : _166;
        _228 = _488;
    }
    float _490 = _228;
    float _492 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _498 = _184 > 0.5;
    float _500 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    int _508 = _482 ? as_type<int>(_480) : as_type<int>(_180);
    float _510 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _496);
    float _512 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _500);
    float _514 = _504 ? as_type<float>(_508) : _180;
    float _516 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    int _518 = _498 ? as_type<int>(_480) : as_type<int>(_180);
    float _520 = 0.0 + _486;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _526 = _524 != 0;
    float _528 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _532 = _530 != 0;
    float _534 = -_158;
    float _536 = fma(_522, _158, _534);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _540 = _538 != 0;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _546 = _544 != 0;
    float _548 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _550 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _552 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _554 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].z, _158);
    float _558 = -_542;
    float _560 = fma(_548, 2.0, _558);
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _516 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _580 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _582 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _588 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _592 = _570 + _590;
    float _594 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _598 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.x = _580;
    out.m_63.y = _582;
    out.m_63.z = _584;
    out.m_63.w = _578;
    float _606 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _588 + _608;
    float _612 = fma(_594, -2.0, _604);
    out.m_65.x = _598;
    out.m_65.y = _600;
    out.m_65.z = _602;
    out.m_65.w = _596;
    float _614 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _618 = in.m_59.z;
    float _620 = fma(_614, _514, -0.5);
    float _622 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    out.m_67.y = _180;
    int _624 = 0;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    int _628 = as_type<int>(_620);
    if (_532)
    {
        float _630 = -_166;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _592 * _592;
    float _638 = _586 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _640 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _606 + _642;
    float _646 = fma(_610, _610, _636);
    float _648 = _540 ? as_type<float>(_518) : _180;
    float _650 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _654 = fma(_644, _644, _646);
    float _656 = _646;
    if (!_272)
    {
        _656 = _176;
    }
    float _658 = _656;
    float _660 = fma(_648, _638, -0.5);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = _650 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _666 = rsqrt(_654);
    float _668 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _670 = _664 * 12.0;
    float _672 = _664 * 6.0;
    float _674 = _670;
    float _676 = _658;
    float _678 = _660;
    if (!_272)
    {
        _626 = _658;
    }
    float _680 = _626;
    float _682 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _652);
    float _684 = fma(_454, 4.0, _670);
    float _686 = _680;
    if (_272)
    {
        _674 = _172;
    }
    float _688 = _674;
    float _690 = -_672;
    float _692 = fma(_454, 3.0, _690);
    float _694 = _688;
    float _696 = _618;
    if (!_272)
    {
        _694 = _618;
    }
    float _698 = _694;
    float _700 = _684 * 0.15915493667125701904296875;
    if (_272)
    {
        _676 = _176;
    }
    float _702 = _676;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _706 = _618 > 0.5;
    float _708 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _668);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _592 * _666;
    float _714 = _698 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _716 = _610 * _666;
    float _718 = _714;
    if (_546)
    {
        float _720 = _706 ? _480 : _180;
        _318 = _720;
    }
    float _722 = _318;
    float _724 = -_712;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _728 = -_704;
    float _730 = fma(_714, 2.0, _728);
    float _732 = -_716;
    float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _736 = _644 * _666;
    float _738 = _726 * _726;
    float _740 = _700 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _454 + 3.1415927410125732421875;
    float _746 = -_736;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _750 = fma(_734, _734, _738);
    float _752 = -_622;
    float _754 = fma(_708, _620, _752);
    float _756 = _616 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _758 = _664 * 6.283185482025146484375;
    float _760 = fma(_748, _748, _750);
    float _762 = _710 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _744 * 0.15915493667125701904296875;
    if (_526)
    {
        float _768 = -_166;
        float _770 = _768 + 1.0;
        _628 = as_type<int>(_770);
    }
    int _772 = _628;
    float _774 = fma(_756, _722, -0.5);
    float _776 = _758 * 0.15915493667125701904296875;
    if (!_526)
    {
        _718 = _166;
    }
    float _778 = _718;
    float _780 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _766 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _778;
    if (_526)
    {
        float _788 = _706 ? as_type<float>(_772) : _166;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _794 = _792;
    if (_272)
    {
        _686 = _172;
    }
    float _796 = _686;
    float _798 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[20].x, _214);
    float _802 = _742 + _764;
    float _804 = _776 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[83].z, _792);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _812 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_802, 0.25, 0.5);
    if (!_532)
    {
        _794 = _166;
    }
    float _816 = _794;
    float _818 = fma(_784, 0.5, 0.5);
    float _820 = -_810;
    float _822 = fma(_812, 2.0, _820);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _826 = _824 + 2.0;
    float _828 = _816;
    if (_532)
    {
        float _830 = _482 ? as_type<float>(_634) : _166;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = sqrt(_760);
    if (!_272)
    {
        _224 = _618;
    }
    float _836 = _224;
    float _838 = fma(_814, _826, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _836;
    float _844 = 0.10000002384185791015625;
    if (_272)
    {
        _842 = _702;
    }
    float _846 = _842;
    float _848 = _818 * _838;
    float _850 = fma(_806, 0.10000002384185791015625, 1.0);
    float _852 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    if (_272)
    {
        _696 = _702;
    }
    float _856 = _696;
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[191].y, -1.0);
    float _860 = _848 * _852;
    if (_272)
    {
        _844 = _702;
    }
    float _862 = _844;
    float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _866 = _666 * _834;
    float _868 = fma(_860, _858, 1.0);
    float _870 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _872 = _640 * _866;
    float _874 = _212 * _868;
    float _876 = _780 * _866;
    float _878 = _798 * _866;
    float _880 = _210 * _868;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _874);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _888 = _876 * _882;
    float _890 = _872 * _884;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _878 * _886;
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _908 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _900);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _904);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _906);
    float _914 = _864 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _916 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _902);
    float _918 = _588 + _910;
    float _920 = _606 + _912;
    float _922 = _862;
    float _924 = _918;
    float _926 = _920;
    if (!_272)
    {
        _922 = _172;
    }
    float _928 = _922;
    float _930 = fma(_914, _490, -0.5);
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _918 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _938 = _920 + _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _942 = _892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _944 = _934 * _934;
    float _946 = _938 * _938;
    float _948 = fma(_870, -2.0, _940);
    float _950 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _908);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _954 = _944 + _946;
    float _956 = fma(_942, _790, -0.5);
    bool _958 = _860 != 0.0;
    bool _960 = isnan(_860);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = in.m_69.x;
    float _970 = in.m_69.y;
    float _972 = in.m_69.z;
    float _974 = -_130;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _978 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _980 = sqrt(_954);
    bool _982 = _874 == 0.0;
    bool _984 = !_966;
    bool _986 = _982 && _984;
    float _988 = fma(_950, _930, _976);
    float _990 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _992 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _978);
    bool _994 = _880 == 0.0;
    bool _996 = _994 && _986;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1000 = _928 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1002 = _952 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1004 = floor(_800);
    float _1006 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _916);
    float _1008 = -_130;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _1012 = fma(_1002, _832, -0.5);
    float _1014 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _992);
    float _1016 = fma(_1000, -2.0, _998);
    float _1018 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    bool _1020 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = fma(_1006, _1012, _1010);
    float _1024 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1026 = _570 + _1014;
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[81].x, _822);
    float _1032 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _682);
    float _1034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1016);
    float _1036 = -_1024;
    float _1038 = fma(_1018, _660, _1036);
    float _1040 = fma(_990, _956, _1030);
    float _1042 = -_1034;
    float _1044 = fma(_1032, _774, _1042);
    float _1046 = _970;
    float _1048 = _944;
    float _1050 = _946;
    float _1052 = _968;
    float _1054 = _972;
    if (!_996)
    {
        float _1056 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1046 = _1056;
    }
    float _1058 = _1046;
    if (!_1020)
    {
        _678 = _1026;
    }
    float _1060 = _678;
    bool _1062 = !_1020;
    float _1064 = _1060;
    if (!_1062)
    {
        float _1066 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1070 = _980 + _1068;
        float _1072 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1074 = rsqrt(_954);
        float _1076 = _1070 * _1066;
        float _1078 = _1076 * 0.15915493667125701904296875;
        float _1080 = _1078 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = fma(_1082, _1072, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = _1074 * _1088;
        float _1092 = fma(_934, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = _1086 + (-1.0);
        float _1096 = fma(_938, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1100 = _1092 + _1098;
        float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1106 = _1096 + _1104;
        float _1108 = _1100 * _1100;
        float _1110 = fma(_1026, _1086, _1102);
        float _1112 = _1106 * _1106;
        _1064 = _1110;
        _1048 = _1108;
        _1050 = _1112;
        _924 = _1092;
        _926 = _1096;
    }
    float _1114 = _1064;
    float _1116 = _1048;
    float _1118 = _1050;
    float _1120 = _924;
    float _1122 = _926;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1126 = _1114 + _1124;
    float _1128 = _1122;
    if (!_996)
    {
        float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1052 = _1130;
    }
    float _1132 = _1052;
    float _1134 = -_1004;
    float _1136 = _800 + _1134;
    float _1138 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1140 = fma(_1126, _1126, _1116);
    float _1142 = _800 * 6.283185482025146484375;
    float _1144 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1146 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1148 = _1140 + _1118;
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1138);
    float _1152 = _1142 * 0.15915493667125701904296875;
    if (!_996)
    {
        float _1154 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _972);
        _1054 = _1154;
    }
    float _1156 = _1054;
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1144);
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1146);
    float _1162 = sqrt(_1148);
    int _1164 = abs(_284);
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1150);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1170 = _754 + 0.5;
    float _1172 = _1022 + 0.5;
    float _1174 = _988 + 0.5;
    float _1176 = _1040 + 0.5;
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1038 + 0.5;
    float _1184 = _1044 + 0.5;
    float _1186 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1160);
    bool _1188 = !_268;
    int _1190 = _1188 ? 0 : 1;
    out.m_71.x = _1174;
    out.m_71.y = _1170;
    out.m_71.z = _1176;
    out.m_71.w = _1182;
    int _1192 = abs(_1190);
    out.m_73.x = _1172;
    out.m_73.y = _1184;
    float _1194 = float(_1164);
    float _1196 = -_1136;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1200 = abs(_276);
    out.m_75.x = _1166;
    out.m_75.y = _1168;
    out.m_75.z = _1186;
    bool _1202 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1204 = isnan(_1162);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1180, 0.5, 0.5);
    float _1214 = abs(_1198);
    float _1216 = _1194 * _1214;
    bool _1218 = _1136 < 0.5;
    float _1220 = float(_1218);
    float _1222 = -_1212;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1226 = float(_1192);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = float(_1200);
    float _1234 = fma(_1226, _1224, _1216);
    float _1236 = abs(_1230);
    float _1238 = fma(_1232, _1236, _1234);
    float _1240 = _1234;
    float _1242 = _1216;
    if (!_1210)
    {
        _1240 = 1.0;
    }
    float _1244 = _1240;
    bool _1246 = !_1210;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1162);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1162 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1162 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1162);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1162 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1312 = _1114 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1316 = _1120 + _1314;
    float _1318 = fma(_1312, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1122 + _1320;
    float _1324 = fma(_1316, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1326 = -_712;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1318);
    float _1330 = fma(_1322, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1332 = -_716;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -_736;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1330);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1342 + _1350;
    float _1354 = fma(_1346, _1346, _1348);
    float _1356 = fma(_1352, _1352, _1354);
    float _1358 = rsqrt(_1356);
    float _1360 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1362 = _1346 * _1360;
    float _1364 = _1352 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 + _1368;
    float _1372 = sqrt(_1370);
    bool _1374 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = _1372 + _1376;
    float _1380 = _1352;
    float _1382 = _1370;
    float _1384 = _1378;
    if (_1374)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1386;
    }
    float _1388 = _1380;
    if (_1374)
    {
        float _1390 = rsqrt(_1370);
        _1382 = _1390;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    if (_1374)
    {
        float _1396 = _1378 * _1388;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1374)
    {
        float _1400 = _1398 * 0.15915493667125701904296875;
        _1242 = _1400;
    }
    float _1402 = _1242;
    float _1404 = _1348;
    float _1406 = _1402;
    if (_1374)
    {
        float _1408 = _1402 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        _1404 = _1410;
    }
    float _1412 = _1404;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1358;
    float _1420 = _1416;
    float _1422 = _1414;
    if (_1374)
    {
        float _1424 = _1402 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        _1418 = _1426;
    }
    float _1428 = _1418;
    float _1430 = -_1360;
    float _1432 = -_1416;
    float _1434 = fma(_1338, _1430, _1432);
    float _1436 = -_716;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _588);
    if (_1374)
    {
        float _1440 = _1434 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1440;
    }
    float _1442 = _1420;
    float _1444 = _1442;
    float _1446 = _1412;
    if (_1374)
    {
        float _1448 = _1412 + (-1.0);
        _1422 = _1448;
    }
    float _1450 = _1422;
    float _1452 = _1450;
    if (!_1374)
    {
        _1406 = _1366;
    }
    float _1454 = _1406;
    float _1456 = sqrt(_1356);
    float _1458 = _1454;
    if (_1374)
    {
        float _1460 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1428;
    float _1466 = _1462;
    if (_1374)
    {
        float _1468 = fma(_1428, _1442, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1444 = _1468;
    }
    float _1470 = _1444;
    if (!_1374)
    {
        _1464 = _1434;
    }
    float _1472 = _1464;
    float _1474 = _1472;
    if (_1374)
    {
        float _1476 = fma(_1434, _1412, _1462);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1374)
    {
        _1446 = _1362;
    }
    float _1480 = _1446;
    float _1482 = _1480;
    if (_1374)
    {
        float _1484 = _1392 * _1470;
        _1128 = _1484;
    }
    float _1486 = _1128;
    if (!_1374)
    {
        _1466 = _1364;
    }
    float _1488 = _1466;
    float _1490 = _1488;
    if (!_1374)
    {
        _1394 = _1368;
    }
    float _1492 = _1394;
    float _1494 = _1492;
    if (_1374)
    {
        float _1496 = _1362 * _1486;
        _1482 = _1496;
    }
    float _1498 = _1482;
    if (_1374)
    {
        float _1500 = _1364 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1374)
    {
        float _1506 = _1498 * _1498;
        _1458 = _1506;
    }
    float _1508 = _1458;
    if (_1374)
    {
        float _1510 = _1502 * _1502;
        _1494 = _1510;
    }
    float _1512 = _1494;
    float _1514 = fma(_1478, _1478, _1508);
    float _1516 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1514 + _1512;
    float _1520 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = -_736;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _1532 = rsqrt(_1518);
    float _1534 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1542 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1556 = -_1552;
    float _1558 = fma(_1556, _1540, 1.0);
    float _1560 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1542);
    float _1564 = _1532 * _1498;
    float _1566 = _1532 * _1478;
    float _1568 = _1532 * _1502;
    float _1570 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1560);
    float _1572 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    float _1574 = floor(_1546);
    float _1576 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1578 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1582 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1584 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1590 = -_1582;
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = floor(_1554);
    float _1596 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1588);
    float _1600 = -_1568;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1606 = fma(_1602, -0.5, 0.5);
    float _1608 = log2(_1558);
    float _1610 = -_1574;
    float _1612 = _1546 + _1610;
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = _1566 + 1.0;
    float _1620 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1622 = exp2(_1596);
    float _1624 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1630 = -_1594;
    float _1632 = _1554 + _1630;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1604);
    float _1636 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1614, _1620, -0.212114393711090087890625);
    float _1640 = sqrt(_1606);
    float _1642 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1644 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1614, _1638, 1.570728778839111328125);
    float _1648 = _1608 * 0.693147182464599609375;
    float _1650 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1652 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1654 = 1.0 / _1634;
    float _1656 = -_1566;
    float _1658 = fma(_1622, _1618, _1656);
    float2 _4821 = float2(_1612, _1632);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4821, float2(0.0), isnan(_4821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4821, float2(0.0), isnan(_4821)), level(0.0)).x;
    float _1662 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1658, 0.5, 0.5);
    float _1666 = _1640 * 0.636619746685028076171875;
    float _1668 = -_1646;
    float _1670 = fma(_1666, _1668, 1.0);
    float _1672 = _1650 * _1654;
    float _1674 = _1652 * _1654;
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = fma(_1674, -0.5, 0.5);
    float3 _4856 = float3(_1676, _1678, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4856, float3(0.0), isnan(_4856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4856, float3(0.0), isnan(_4856)), level(0.0)).x;
    float3 _4867 = float3(_1676, _1678, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4867, float3(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4867, float3(0.0), isnan(_4867)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4883 = float2(_1670, _1664);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4883, float2(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4883, float2(0.0), isnan(_4883)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = -_712;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _570);
    float _1707 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1709 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1711 = isnan(_1456);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1717 = _1713 || _1715;
    float _1719 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1721 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1707);
    float _1723 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1719);
    float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1727 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1723);
    float _1731 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1725);
    float _1733 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1735 = _1729 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1737 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1731);
    float _1739 = 1.0 / _1735;
    float _1741 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1743 = _1741 + _1735;
    float _1745 = in.m_77.x;
    float _1747 = _1743 * _1739;
    float _1749 = _1747 * 0.5;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1753 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1751);
    float _1755 = 1.0 / _1753;
    float _1757 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1759 = exp2(_1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1755 * _1761;
    bool _1765 = _1763 <= 8000.0;
    bool _1767 = isnan(_1763);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(8000.0);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = abs(_1763);
    float _1779 = log2(_1777);
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    out.gl_Position.x = _1650;
    out.gl_Position.y = _1652;
    out.gl_Position.z = _1733;
    out.gl_Position.w = _1634;
    float _1785 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1787 = exp2(_1785);
    float _1789 = _1652;
    float _1791 = _1650;
    float _1793 = _1733;
    if (!_1717)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    float _1799 = _1795;
    if (!_1717)
    {
        _1791 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1801 = _1791;
    float _1803 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1805 = precise::clamp(_1803, 0.0, 1.0);
    float _1807 = fma(_1805, -2.0, 3.0);
    float _1809 = _1805 * _1805;
    float _1811 = _1809 * _1807;
    float _1813 = -_1811;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1811);
    float _1819 = _1733 + _1634;
    float _1821 = _1801;
    float _1823 = _1801;
    if (!_1717)
    {
        _1793 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1793;
    float _1827 = _1775 * _1817;
    float _1829 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1831 = _1819 * 0.5;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1831;
    out.m_79.w = _1634;
    float _1835 = -_1660;
    float _1837 = _1835 + 1.0;
    float _1839 = _1837 * _1833;
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -_1841;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1847 = _1845 * _1745;
    float _1849 = _1847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1851 = _1847;
    float _1853 = _1685;
    float _1855 = _1825;
    float _1857 = _1825;
    if (!_1717)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1859 = _1851;
    out.m_81.x = _1849;
    float _1861 = _1829 * _1680;
    float _1863 = -_1829;
    float _1865 = _1863 + 1.0;
    float _1867 = _1691 * _1861;
    float _1869 = _1701 * _1861;
    float _1871 = _1691 * _1865;
    float _1873 = fma(_1697, _1867, _1685);
    float _1875 = fma(_1699, _1867, _1687);
    float _1877 = fma(_1691, _1869, _1689);
    float _1879 = _1867;
    float _1881 = _1859;
    float _1883 = _1859;
    if (!_1717)
    {
        _1853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1885 = _1853;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1717)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1891 = _1879;
    out.m_83.x = _1873;
    out.m_83.y = _1875;
    out.m_83.z = _1877;
    out.m_83.w = _1871;
    bool _1893 = !_1717;
    float _1895 = _1891;
    float _1897 = _1891;
    if (!_1893)
    {
        bool _1899 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1901 = isnan(_1456);
        bool _1903 = _1899 || _1901;
        bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1907 = _1903 || _1905;
        if (!_1907)
        {
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1911 = _1456 + _1909;
            float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1915 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1913;
            float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1921 = 1.0 / _1915;
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1933 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1939 = _1911 * _1921;
            float _1941 = precise::clamp(_1939, 0.0, 1.0);
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1947 = fma(_1941, _1919, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1949 = fma(_1941, _1945, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1951 = fma(_1941, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1953 = fma(_1941, _1929, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1955 = fma(_1941, _1933, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1957 = fma(_1941, _1937, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1889 = _1947;
            _1883 = _1955;
            _1799 = _1951;
            _1823 = _1953;
            _1857 = _1949;
            _1897 = _1957;
            _1959 = true;
        }
        else
        {
            bool _1961 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1963 = isnan(_1456);
            bool _1965 = _1961 || _1963;
            bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1969 = _1965 || _1967;
            if (!_1969)
            {
                _1797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1971 = _1797;
            _1799 = _1971;
            if (!_1969)
            {
                _1887 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1973 = _1887;
            _1889 = _1973;
            if (!_1969)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1975 = _1855;
            _1857 = _1975;
            if (!_1969)
            {
                _1821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1977 = _1821;
            _1823 = _1977;
            if (!_1969)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1979 = _1881;
            _1883 = _1979;
            if (!_1969)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1981 = _1895;
            bool _1983 = !_1969;
            _1897 = _1981;
            if (!_1983)
            {
                bool _1985 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1987 = isnan(_1456);
                bool _1989 = _1985 || _1987;
                bool _1991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1993 = _1989 || _1991;
                if (!_1993)
                {
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1997 = _1456 + _1995;
                    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1999;
                    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2007 = 1.0 / _2001;
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2025 = _1997 * _2007;
                    float _2027 = precise::clamp(_2025, 0.0, 1.0);
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2033 = fma(_2027, _2005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2035 = fma(_2027, _2031, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2037 = fma(_2027, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2039 = fma(_2027, _2015, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2041 = fma(_2027, _2019, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2043 = fma(_2027, _2023, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1889 = _2033;
                    _1883 = _2041;
                    _1799 = _2037;
                    _1823 = _2039;
                    _1857 = _2035;
                    _1897 = _2043;
                    _1959 = true;
                }
                else
                {
                    _1889 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1959 = false;
    float _2045 = _1889;
    float _2047 = _1883;
    float _2049 = _1799;
    float _2051 = _1823;
    float _2053 = _1857;
    float _2055 = _1897;
    float _2057 = fma(_1168, -0.5, 0.5);
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = -_2045;
    float _2063 = _2061 + _2047;
    float _2065 = -_2049;
    float _2067 = _2065 + _2051;
    float _2069 = -_2053;
    float _2071 = _2069 + _2055;
    bool _2073 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2075 = fma(_2059, _2063, _2045);
    float _2077 = fma(_2059, _2067, _2049);
    float _2079 = fma(_2059, _2071, _2053);
    float _2081 = _1238 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _2075 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2085 = fma(_2077, 0.298911988735198974609375, _2083);
    out.m_51.x = _2081;
    float _2087 = fma(_2079, 0.114477999508380889892578125, _2085);
    float _2089 = -_2087;
    float _2091 = _2077 + _2089;
    float _2093 = -_2087;
    float _2095 = _2075 + _2093;
    float _2097 = -_2087;
    float _2099 = _2079 + _2097;
    float _2101 = fma(_2091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2103 = fma(_2095, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    float _2105 = fma(_2099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2087);
    out.m_87.x = _2101;
    out.m_87.y = _2103;
    out.m_87.z = _2105;
    if (!_2073)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2107 = -_1328;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2111 = -_1334;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2115 = -_1342;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2119 = _2109 * _2109;
    float _2121 = fma(_2113, _2113, _2119);
    float _2123 = fma(_2117, _2117, _2121);
    float _2125 = sqrt(_2123);
    float _2127 = rsqrt(_2123);
    float _2129 = -_2125;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = _2113 * _2127;
    float _2139 = _2109 * _2127;
    float _2141 = abs(_2135);
    float _2143 = log2(_2141);
    float _2145 = _2117 * _2127;
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2149 = _1168 * _2139;
    float _2151 = -_2139;
    float _2153 = -_2147;
    float _2155 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2153);
    float _2157 = fma(_1166, _2137, _2149);
    float _2159 = -_2145;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2155);
    float _2163 = fma(_1186, _2145, _2157);
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2169 = _2161 + _2167;
    float _2171 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2173 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2175 = precise::clamp(_2173, 0.0, 1.0);
    float _2177 = exp2(_2171);
    float _2179 = _2177 * _2175;
    float _2181 = _2165 * _2179;
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2183;
    out.m_85.y = _2185;
    out.m_85.z = _2187;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

