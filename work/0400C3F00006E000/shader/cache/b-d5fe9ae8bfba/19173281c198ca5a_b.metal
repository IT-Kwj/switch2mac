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
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_85 [[user(locn15)]];
    float4 m_87 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_130);
        out.gl_Position.z = _2011;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_166);
        out.gl_Position.z = _2080;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _182 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _184 = isnan(0.5);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _190 = _186 || _188;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.y;
    float _200 = 0.0;
    float _202 = _174;
    if (_190)
    {
        _200 = 1.0;
    }
    float _204 = _200;
    float _206 = fma(_170, 16.0, _180);
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_46.x;
    float _212 = in.m_46.y;
    float _214 = in.m_46.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_218, 0.5, 0.5);
    float _232 = _230 * 0.004999999888241291046142578125;
    float _234 = fma(_174, _232, _168);
    float _236 = fma(_176, _232, _170);
    float _238 = _212 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _240 = fma(_178, _232, _172);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _234);
    float _244 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _238);
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _240);
    float _250 = _242 * _226;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _236);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].z, _246);
    float _256 = _248 * _228;
    float _258 = _252 * _244;
    float _260 = _212 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _262 = _254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _266 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _260);
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _276 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _268);
    float _280 = _212 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[8].z, _278);
    float _288 = _258 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _262 + _282;
    float _292 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = _284 + _286;
    float _296 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _300 = _290 + _298;
    float _302 = 0.0;
    float _304 = _210;
    float _306 = _214;
    float _308 = _204;
    float _310 = _294;
    float _312 = _236;
    if (_272)
    {
        float _314 = in.m_59.x;
        _302 = _314;
    }
    float _316 = _302;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _320 = _294 + _318;
    float _322 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _324 = _300 * _300;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _328 = 0.0;
    if (_272)
    {
        _328 = _198;
    }
    float _330 = _328;
    float _332 = _322 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _334 = fma(_320, _320, _324);
    int _336 = 0;
    float _338 = _330;
    if (_272)
    {
        _336 = 0;
    }
    int _340 = _336;
    int _342 = 0;
    int _344 = _340;
    if (_272)
    {
        _342 = 0;
    }
    int _346 = _342;
    float _348 = sqrt(_334);
    float _350 = _332 + _326;
    float _352 = 0.0;
    int _354 = _346;
    float _356 = _316;
    float _358 = _350;
    if (_272)
    {
        _352 = _316;
    }
    float _360 = _352;
    bool _362 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _360;
    if (!_272)
    {
        float _366 = in.m_59.x;
        float _368 = _198 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _366 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        _304 = _378;
        _354 = 2;
        _344 = 1;
        _356 = _366;
        _364 = _382;
        _338 = _374;
    }
    float _384 = _304;
    int _386 = _354;
    int _388 = _344;
    float _390 = _356;
    float _392 = _364;
    float _394 = _338;
    float _396 = _384;
    if (!_362)
    {
        _396 = _294;
    }
    float _398 = _396;
    float _400 = _398;
    if (!_362)
    {
        _306 = _290;
    }
    float _402 = _306;
    bool _404 = !_362;
    float _406 = _402;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _412 = _348 + _410;
        float _414 = _350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = rsqrt(_334);
        float _418 = _412 * _408;
        float _420 = _418 * 0.15915493667125701904296875;
        float _422 = _420 * 6.283185482025146484375;
        float _424 = cos(_422);
        float _426 = _420 * 6.283185482025146484375;
        float _428 = sin(_426);
        float _430 = _424 + (-1.0);
        float _432 = _430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = fma(_428, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _436 = fma(_350, _424, _432);
        float _438 = _416 * _434;
        float _440 = fma(_320, _438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _442 = fma(_300, _438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _436;
        _400 = _440;
        _406 = _442;
    }
    float _444 = _358;
    float _446 = _400;
    float _448 = _406;
    if (!_190)
    {
        float _450 = in.m_61.w;
        int _452 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _454 = _452 == 4;
        bool _456 = _452 == 8;
        bool _458 = _452 == 12;
        int _460 = as_type<int>(_450) << 16;
        int _462 = as_type<int>(_450) << 8;
        int _464 = as_type<int>(_450) << 24;
        int _466 = _460 >> 24;
        int _468 = _462 >> 24;
        int _470 = as_type<int>(_450) >> 24;
        int _472 = _464 >> 24;
        float _474 = float(_466);
        float _476 = float(_468);
        float _478 = float(_470);
        float _480 = _474 * 0.0078740157186985015869140625;
        float _482 = float(_472);
        float _484 = _476 * 0.0078740157186985015869140625;
        float _486 = _478 * 0.0078740157186985015869140625;
        float _488 = precise::min(_480, 1.0);
        float _490 = _482 * 0.0078740157186985015869140625;
        float _492 = precise::min(_484, 1.0);
        float _494 = precise::min(_486, 1.0);
        float _496 = precise::min(_490, 1.0);
        float _498 = precise::max(_488, -1.0);
        float _500 = precise::max(_492, -1.0);
        float _502 = precise::max(_494, -1.0);
        float _504 = precise::max(_496, -1.0);
        float _506 = _504;
        _310 = as_type<float>(_452);
        if (_454)
        {
            _506 = _498;
        }
        float _508 = _506;
        float _510 = _508;
        if (_456)
        {
            _510 = _500;
        }
        float _512 = _510;
        float _514 = _512;
        if (_458)
        {
            _514 = _502;
        }
        float _516 = _514;
        float _518 = abs(_516);
        float _520 = (-0.0) + _518;
        _308 = _520;
    }
    float _522 = _308;
    float _524 = _310;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _444 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _532 = _446 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _448 + _534;
    float _538 = _444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _540 = _528 * _528;
    float _542 = _444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _544 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _538);
    float _546 = fma(_532, _532, _540);
    bool _548 = _522 != 0.0;
    bool _550 = isnan(_522);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _560 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _544);
    float _562 = fma(_536, _536, _546);
    float _564 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _542);
    float _566 = _560 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _568 = rsqrt(_562);
    float _570 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _532 * _570;
    float _574 = _536 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _250;
    float _592 = _580;
    float _594 = _588;
    float _596 = _524;
    float _598 = _528;
    float _600 = _572;
    bool _602 = _584;
    if (_584)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    if (_584)
    {
        float _608 = rsqrt(_580);
        _592 = _608;
    }
    float _610 = _592;
    float _612 = _610;
    if (_584)
    {
        float _614 = _588 * _606;
        _594 = _614;
    }
    float _616 = _594;
    if (_584)
    {
        float _618 = _616 * 0.15915493667125701904296875;
        _596 = _618;
    }
    float _620 = _596;
    float _622 = _536;
    float _624 = _620;
    if (_584)
    {
        float _626 = _620 * 6.283185482025146484375;
        float _628 = sin(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _634 = precise::max(0.0, _632);
    float _636 = _300;
    if (_584)
    {
        float _638 = _620 * 6.283185482025146484375;
        float _640 = cos(_638);
        _636 = _640;
    }
    float _642 = _636;
    float _644 = -_570;
    float _646 = -_634;
    float _648 = fma(_528, _644, _646);
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_584)
    {
        float _652 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _652;
    }
    float _654 = _598;
    float _656 = _654;
    if (!_584)
    {
        _624 = _572;
    }
    float _658 = _624;
    float _660 = fma(_284, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _662 = _630;
    float _664 = _658;
    if (_584)
    {
        float _666 = fma(_630, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _662 = _666;
    }
    float _668 = _662;
    float _670 = _668;
    if (!_584)
    {
        _656 = _574;
    }
    float _672 = _656;
    float _674 = floor(_660);
    float _676 = _672;
    if (_584)
    {
        float _678 = _642 + (-1.0);
        _650 = _678;
    }
    float _680 = _650;
    float _682 = 0.0;
    float _684 = _680;
    if (_584)
    {
        float _686 = _610 * _668;
        _682 = _686;
    }
    float _688 = _682;
    if (!_584)
    {
        _670 = _648;
    }
    float _690 = _670;
    float _692 = _690;
    if (_584)
    {
        float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _684 = _694;
    }
    float _696 = _684;
    if (_584)
    {
        float _698 = _572 * _688;
        _664 = _698;
    }
    float _700 = _664;
    if (!_584)
    {
        _612 = _576;
    }
    float _702 = _612;
    float _704 = _702;
    if (_584)
    {
        float _706 = _574 * _688;
        _676 = _706;
    }
    float _708 = _676;
    if (_584)
    {
        float _710 = fma(_648, _642, _696);
        _692 = _710;
    }
    float _712 = _692;
    if (_584)
    {
        float _714 = _700 * _700;
        _704 = _714;
    }
    float _716 = _704;
    if (!_584)
    {
        _600 = _578;
    }
    float _718 = _600;
    float _720 = sqrt(_562);
    float _722 = _718;
    if (_584)
    {
        float _724 = _708 * _708;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_712, _712, _716);
    float _730 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = _728 + _726;
    float _734 = fma(_262, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _736 = _444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _740 = _566 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _742 = rsqrt(_732);
    float _744 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _738);
    float _748 = -_740;
    float _750 = fma(_748, _558, 1.0);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _760 = _746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _762 = -_756;
    float _764 = _762 + 1.0;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _760 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _564);
    float _772 = floor(_734);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = _742 * _700;
    float _780 = _742 * _712;
    float _782 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[7].z, _774);
    float _784 = _742 * _708;
    float _786 = abs(_764);
    float _788 = log2(_786);
    float _790 = _778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _760 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = _760 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _798 = -_790;
    float _800 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _798);
    float _802 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _804 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _796);
    float _806 = -_784;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _800);
    float _810 = 1.0 / _792;
    float _812 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[4].z, _802);
    float _814 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[5].z, _804);
    float _816 = fma(_808, -0.5, 0.5);
    float _818 = fma(_808, 0.5, 0.5);
    float _820 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _822 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _826 = log2(_750);
    float _828 = fma(_818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _830 = _804;
    float _832 = _814;
    float _834 = _792;
    if (_556)
    {
        _830 = _820;
    }
    float _836 = _830;
    float _838 = -_772;
    float _840 = _734 + _838;
    float _842 = _836;
    if (_556)
    {
        _832 = _824;
    }
    float _844 = _832;
    float _846 = fma(_818, _828, -0.212114393711090087890625);
    float _848 = _844;
    if (!_556)
    {
        _842 = 0.0;
    }
    float _850 = _842;
    float _852 = exp2(_822);
    float _854 = -_674;
    float _856 = _660 + _854;
    if (!_556)
    {
        _848 = 0.0;
    }
    float _858 = _848;
    float _860 = _780 + 1.0;
    float _862 = _810 * _850;
    float _864 = fma(_818, _846, 1.570728778839111328125);
    float _866 = _810 * _858;
    float _868 = sqrt(_816);
    float _870 = _826 * 0.693147182464599609375;
    float2 _3175 = float2(_856, _840);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3175, float2(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3175, float2(0.0), isnan(_3175)), level(0.0)).x;
    float _874 = -_780;
    float _876 = fma(_852, _860, _874);
    float _878 = fma(_862, 0.5, 0.5);
    float _880 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _882 = fma(_866, -0.5, 0.5);
    float _884 = fma(_876, 0.5, 0.5);
    float _886 = _868 * 0.636619746685028076171875;
    float3 _3205 = float3(_878, _882, _880);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).x;
    float _890 = -_864;
    float _892 = fma(_886, _890, 1.0);
    float3 _3221 = float3(_878, _882, _880);
    float4 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3221, float3(0.0), isnan(_3221)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3221, float3(0.0), isnan(_3221)), level(0.0)).xyzw;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float _903 = _895.w;
    float2 _3237 = float2(_892, _884);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_63.x;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _919 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_63.y;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = in.m_59.w;
    float _935 = in.m_59.z;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = _870;
    int _945 = as_type<int>(_878);
    int _947 = as_type<int>(_937);
    if (_923)
    {
        float _949 = in.m_59.x;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _955 = 0.0;
    if (_929)
    {
        float _957 = in.m_59.z;
        _955 = _957;
    }
    float _959 = _955;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _963 = _915;
    if (_923)
    {
        float _965 = -_915;
        float _967 = _965 + 1.0;
        _945 = as_type<int>(_967);
    }
    int _969 = _945;
    float _971 = 0.0;
    if (!_923)
    {
        _971 = _915;
    }
    float _973 = _971;
    float _975 = fma(_919, -2.0, _931);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _981 = -_925;
    float _983 = _981 + 1.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _917 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _991 = _933 > 0.5;
    float _993 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _997 = _991 ? as_type<int>(_983) : as_type<int>(_925);
    out.m_65.y = _925;
    bool _999 = _935 > 0.5;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1003 = _973;
    float _1005 = _925;
    float _1007 = _985;
    float _1009 = _935;
    if (_923)
    {
        bool _1011 = _951 > 0.5;
        _602 = _1011;
    }
    bool _1013 = _602;
    float _1015 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1017 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_923)
    {
        float _1019 = _1013 ? as_type<float>(_969) : _915;
        _1003 = _1019;
    }
    float _1021 = _1003;
    float _1023 = _760 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1025 = _198 > 0.5;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1023);
    int _1031 = _1025 ? as_type<int>(_983) : as_type<int>(_925);
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1035 = _999 ? as_type<int>(_983) : as_type<int>(_925);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1041 = _1039 != 0;
    float _1043 = exp2(_1015);
    float _1045 = _941 ? as_type<float>(_1031) : _925;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1051 = _1049 != 0;
    out.m_67.x = _1033;
    out.m_67.y = _1017;
    out.m_67.z = _987;
    out.m_67.w = _985;
    float _1053 = _1041 ? as_type<float>(_1035) : _925;
    float _1055 = fma(_989, _1045, -0.5);
    bool _1057 = _1041;
    int _1059 = _1035;
    int _1061 = as_type<int>(_1055);
    if (_929)
    {
        bool _1063 = _959 > 0.5;
        _1057 = _1063;
    }
    bool _1065 = _1057;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1071 = _1069 != 0;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1075 = _1051 ? as_type<float>(_997) : _925;
    out.m_69.x = _1047;
    out.m_69.y = _993;
    out.m_69.z = _995;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1079 = _1077 != 0;
    float _1081 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1085 = _1083 != 0;
    float _1087 = in.m_61.x;
    float _1089 = -_1043;
    float _1091 = _1089 + 1.0;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1095 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1067);
    float _1097 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_929)
    {
        float _1099 = -_915;
        float _1101 = _1099 + 1.0;
        _947 = as_type<int>(_1101);
    }
    int _1103 = _947;
    float _1105 = _1085 ? as_type<float>(_1035) : _925;
    float _1107 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1081);
    float _1109 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1111 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    float _1113 = _961 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1115 = _1107;
    if (_1079)
    {
        float _1117 = -_915;
        float _1119 = _1117 + 1.0;
        _1059 = as_type<int>(_1119);
    }
    int _1121 = _1059;
    float _1123 = fma(_1097, _1075, -0.5);
    float _1125 = -_1111;
    float _1127 = fma(_1109, _1055, _1125);
    if (_1071)
    {
        float _1129 = -_915;
        float _1131 = _1129 + 1.0;
        _1061 = as_type<int>(_1131);
    }
    int _1133 = _1061;
    float _1135 = fma(_1113, _1053, -0.5);
    if (!_929)
    {
        _1005 = _915;
    }
    float _1137 = _1005;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1141 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    out.gl_Position.x = _820;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _792;
    float _1143 = fma(_1141, _1105, -0.5);
    float _1145 = _1137;
    if (!_1071)
    {
        _1007 = _915;
    }
    float _1147 = _1007;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1151 = _1147;
    if (_929)
    {
        float _1153 = _1065 ? as_type<float>(_1103) : _915;
        _1145 = _1153;
    }
    float _1155 = _1145;
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    if (_1071)
    {
        float _1157 = _1025 ? as_type<float>(_1133) : _915;
        _1151 = _1157;
    }
    float _1159 = _1151;
    out.m_73.x = _446;
    out.m_73.y = _444;
    out.m_73.z = _448;
    if (_1079)
    {
        float _1161 = _1025 ? as_type<float>(_1121) : _915;
        _963 = _1161;
    }
    float _1163 = _963;
    bool _1165 = _386 != 2;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1169 = _388 != 1;
    float _1171 = _332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1173 = _332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1175 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1179 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1171);
    float _1181 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1173);
    float _1183 = -_1177;
    float _1185 = fma(_1175, 2.0, _1183);
    float _1187 = fma(_1167, _1155, -0.5);
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1195 = fma(_1191, _1159, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1199 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1203 = _392 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1205 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1193);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1209 = _394 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1211 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1197);
    float _1213 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1215 = -_1201;
    float _1217 = fma(_1203, 2.0, _1215);
    float _1219 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1181);
    float _1221 = fma(_1209, -2.0, _1207);
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1225 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1211);
    float _1227 = fma(_1199, _1163, -0.5);
    float _1229 = fma(_1213, _1021, -0.5);
    float _1231 = -_148;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1217);
    float _1235 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1221);
    float _1239 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1223);
    float _1241 = fma(_1225, _1227, _1233);
    float _1243 = 1.0 / _1235;
    float _1245 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1239);
    float _1247 = -_148;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1185);
    float _1251 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1179);
    float _1253 = _1185;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1165)
    {
        _1253 = _390;
    }
    float _1257 = _1253;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1205);
    float _1263 = _1257;
    if (!_1165)
    {
        _1263 = _935;
    }
    float _1265 = _1263;
    float _1267 = fma(_1245, _1229, _1249);
    float _1269 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1259);
    float _1271 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1275 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1277 = -_1237;
    float _1279 = fma(_1261, _1143, _1277);
    float _1281 = _1271 + _1235;
    float _1283 = _1271;
    if (!_1169)
    {
        _1255 = _198;
    }
    float _1285 = _1255;
    float _1287 = -_1273;
    float _1289 = fma(_1275, 2.0, _1287);
    float _1291 = _1279 + 0.5;
    float _1293 = _1281 * _1243;
    float _1295 = _1293 * 0.5;
    float _1297 = _1241 + 0.5;
    float _1299 = _1285;
    float _1301 = _1297;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    if (!_1169)
    {
        _1283 = _1285;
    }
    float _1305 = _1283;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1307);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1313 = _1305;
    if (_1169)
    {
        _1299 = _390;
    }
    float _1315 = _1299;
    out.m_75.x = _1297;
    out.m_75.y = _1291;
    bool _1317 = _236 != 0.0;
    bool _1319 = isnan(_236);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = 1.0 / _1309;
    if (_1169)
    {
        _1313 = _390;
    }
    float _1329 = _1313;
    float _1331 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1311);
    float _1333 = -_148;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1289);
    bool _1337 = _234 == 0.0;
    bool _1339 = !_1325;
    bool _1341 = _1337 && _1339;
    float _1343 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = _1345;
    if (!_1169)
    {
        _1301 = _935;
    }
    float _1349 = _1301;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1353 = _1349;
    if (_1169)
    {
        _1353 = _198;
    }
    float _1355 = _1353;
    float _1357 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    if (_1165)
    {
        _1347 = _198;
    }
    float _1359 = _1347;
    float _1361 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1331);
    float _1363 = _1359;
    if (!_1165)
    {
        _1363 = _390;
    }
    float _1365 = _1363;
    float _1367 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1357);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1371 = _1327 * _1369;
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1351);
    bool _1375 = _240 == 0.0;
    bool _1377 = _1375 && _1341;
    float _1379 = fma(_1367, _1195, _1335);
    float _1381 = abs(_1371);
    float _1383 = log2(_1381);
    if (_1169)
    {
        _1009 = _198;
    }
    float _1385 = _1009;
    float _1387 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _176);
    float _1389 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[17].y, _178);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1397 = -_1391;
    float _1399 = fma(_1343, 2.0, _1397);
    float _1401 = _1395;
    if (!_1377)
    {
        float _1403 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _174);
        _202 = _1403;
    }
    float _1405 = _202;
    if (_1377)
    {
        _312 = _176;
    }
    float _1407 = _312;
    float _1409 = fma(_1393, -2.0, _1395);
    bool _1411 = !_1377;
    float _1413 = _1411 ? _1387 : _176;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1417 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1419 = _1407;
    if (_1377)
    {
        _1401 = _178;
    }
    float _1421 = _1401;
    float _1423 = _1421;
    if (!_556)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1303 = as_type<int>(_1425);
    }
    int _1427 = _1303;
    if (!_1377)
    {
        _1423 = _1389;
    }
    float _1429 = _1423;
    bool _1431 = !_1377;
    float _1433 = _1431 ? _1389 : _178;
    float _1435 = _1413 * _1413;
    float _1437 = exp2(_1417);
    if (!_1377)
    {
        _1419 = _1387;
    }
    float _1439 = _1419;
    float _1441 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1443 = fma(_1433, _1433, _1435);
    float _1445 = -_148;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1373);
    float _1451 = fma(_1441, -2.0, _1415);
    float _1453 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1409);
    float _1455 = rsqrt(_1443);
    float _1457 = fma(_1361, _1187, _1447);
    float _1459 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1269);
    float _1461 = -_1453;
    float _1463 = fma(_1449, _1123, _1461);
    float _1465 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1467 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    bool _1469 = _1371 <= 8000.0;
    bool _1471 = isnan(_1371);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(8000.0);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1487 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1489 = -_1467;
    float _1491 = fma(_1459, _1135, _1489);
    float _1493 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1465);
    float _1495 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1485);
    float _1497 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1487);
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1433 * _1455;
    float _1505 = _1413 * _1455;
    float _1507 = _1457 + 0.5;
    float _1509 = _1501 * _1499;
    float _1511 = _1127 + 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1515 = _1505 * _1513;
    float _1517 = _1379 + 0.5;
    float _1519 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1521 = _1505 * _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1525 = _1505 * _1523;
    float _1527 = _1491 + 0.5;
    float _1529 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1515);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1521);
    float _1533 = -_1509;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1525);
    float _1539 = _1267 + 0.5;
    float _1541 = _1463 + 0.5;
    float _1543 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1509);
    out.m_77.x = _1517;
    out.m_77.y = _1527;
    float _1545 = _1479 * _1543;
    out.m_79.x = _1537;
    out.m_79.y = _1529;
    out.m_79.z = _1531;
    bool _1547 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1549 = isnan(_720);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1555 = _1551 || _1553;
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1539;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1541;
    float _1559 = -_872;
    float _1561 = _1559 + 1.0;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4472 = as_type<float>(_1427);
        out.gl_Position.z = _4472;
    }
    float _1563 = _1561 * _1557;
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = _792 * 0.5;
    float _1569 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1571 = -_1565;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1575 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    float _1577 = fma(_824, -0.5, _1567);
    float _1579 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1581 = _1107 + _792;
    float _1583 = _820 + _792;
    float _1585 = _1573 * _1087;
    float _1587 = _1579 * _888;
    float _1589 = _1581 * 0.5;
    float _1591 = -_1579;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1597 = _903 * _1587;
    float _1599 = _1585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _913 * _1587;
    float _1603 = fma(_909, _1597, _897);
    float _1605 = fma(_911, _1597, _899);
    float _1607 = _903 * _1593;
    float _1609 = fma(_903, _1601, _901);
    out.m_83.z = _1589;
    out.m_83.w = _792;
    float _1611 = _1583 * 0.5;
    float _1613 = _1579;
    float _1615 = _1593;
    float _1617 = _1577;
    float _1619 = _1611;
    if (!_1555)
    {
        _834 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1621 = _834;
    out.m_85.x = _1599;
    float _1623 = _1621;
    float _1625 = _1621;
    if (!_1555)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1627 = _1115;
    float _1629 = _1627;
    float _1631 = _1627;
    if (!_1555)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1613;
    out.m_87.x = _1603;
    out.m_87.y = _1605;
    out.m_87.z = _1609;
    out.m_87.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1555)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1615;
    out.m_89.x = _1595;
    out.m_89.y = _1569;
    out.m_89.z = _1575;
    out.m_91.x = _1611;
    out.m_91.y = _1577;
    out.m_91.z = _1589;
    out.m_91.w = _792;
    float _1641 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = _1641;
    float _1645 = _1639;
    float _1647 = _1639;
    if (!_556)
    {
        _1643 = 0.0;
    }
    float _1649 = _1643;
    if (!_1555)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1651 = _1617;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1555)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1657 = _1619;
    bool _1659 = !_1555;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_720);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _720 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1691;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1715 = fma(_1707, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1713;
            _1663 = _1721;
            _1631 = _1715;
            _1655 = _1719;
            _1647 = _1717;
            _1625 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_720);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1737 = _1653;
            _1655 = _1737;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1739 = _1661;
            _1663 = _1739;
            if (!_1735)
            {
                _1623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1741 = _1623;
            _1625 = _1741;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1743 = _1629;
            _1631 = _1743;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1745 = _1635;
            _1637 = _1745;
            if (!_1735)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1747 = _1645;
            bool _1749 = !_1735;
            _1647 = _1747;
            if (!_1749)
            {
                bool _1751 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_720);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _720 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = 1.0 / _1767;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1777;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1801 = fma(_1793, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1799;
                    _1663 = _1807;
                    _1631 = _1801;
                    _1655 = _1805;
                    _1647 = _1803;
                    _1625 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1663;
    float _1815 = _1631;
    float _1817 = _1655;
    float _1819 = _1647;
    float _1821 = _1625;
    float _1823 = fma(_1569, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1813 + _1827;
    float _1831 = -_1815;
    float _1833 = _1817 + _1831;
    float _1835 = -_1819;
    float _1837 = _1821 + _1835;
    bool _1839 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1841 = fma(_1825, _1829, _1811);
    float _1843 = fma(_1825, _1833, _1815);
    float _1845 = fma(_1825, _1837, _1819);
    float _1847 = _1649 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = _1841 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1851 = fma(_1843, 0.298911988735198974609375, _1849);
    out.m_49.x = _1847;
    float _1853 = fma(_1845, 0.114477999508380889892578125, _1851);
    float _1855 = -_1853;
    float _1857 = _1843 + _1855;
    float _1859 = -_1853;
    float _1861 = _1841 + _1859;
    float _1863 = -_1853;
    float _1865 = _1845 + _1863;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1869 = fma(_1861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1871 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    out.m_95.x = _1867;
    out.m_95.y = _1869;
    out.m_95.z = _1871;
    if (!_1839)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1873 = -_444;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1877 = -_446;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1881 = -_448;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1885 = _1875 * _1875;
    float _1887 = fma(_1879, _1879, _1885);
    float _1889 = fma(_1883, _1883, _1887);
    float _1891 = sqrt(_1889);
    float _1893 = rsqrt(_1889);
    float _1895 = -_1891;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1879 * _1893;
    float _1905 = _1875 * _1893;
    float _1907 = abs(_1901);
    float _1909 = log2(_1907);
    float _1911 = _1883 * _1893;
    float _1913 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1915 = _1569 * _1905;
    float _1917 = -_1905;
    float _1919 = -_1913;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1919);
    float _1923 = fma(_1595, _1903, _1915);
    float _1925 = -_1911;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1921);
    float _1929 = fma(_1575, _1911, _1923);
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1935 = _1927 + _1933;
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = exp2(_1937);
    float _1945 = _1943 * _1941;
    float _1947 = _1931 * _1945;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1953 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _1949;
    out.m_93.y = _1951;
    out.m_93.z = _1953;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_130);
        out.gl_Position.z = _2011;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_166);
        out.gl_Position.z = _2080;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _182 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _184 = isnan(0.5);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _190 = _186 || _188;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.y;
    float _200 = 0.0;
    float _202 = _174;
    if (_190)
    {
        _200 = 1.0;
    }
    float _204 = _200;
    float _206 = fma(_170, 16.0, _180);
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_46.x;
    float _212 = in.m_46.y;
    float _214 = in.m_46.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_218, 0.5, 0.5);
    float _232 = _230 * 0.004999999888241291046142578125;
    float _234 = fma(_174, _232, _168);
    float _236 = fma(_176, _232, _170);
    float _238 = _212 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _240 = fma(_178, _232, _172);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _234);
    float _244 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _238);
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _240);
    float _250 = _242 * _226;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _236);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].z, _246);
    float _256 = _248 * _228;
    float _258 = _252 * _244;
    float _260 = _212 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _262 = _254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _266 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _260);
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _276 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _268);
    float _280 = _212 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[8].z, _278);
    float _288 = _258 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _262 + _282;
    float _292 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = _284 + _286;
    float _296 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _300 = _290 + _298;
    float _302 = 0.0;
    float _304 = _210;
    float _306 = _214;
    float _308 = _204;
    float _310 = _294;
    float _312 = _236;
    if (_272)
    {
        float _314 = in.m_59.x;
        _302 = _314;
    }
    float _316 = _302;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _320 = _294 + _318;
    float _322 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _324 = _300 * _300;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _328 = 0.0;
    if (_272)
    {
        _328 = _198;
    }
    float _330 = _328;
    float _332 = _322 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _334 = fma(_320, _320, _324);
    int _336 = 0;
    float _338 = _330;
    if (_272)
    {
        _336 = 0;
    }
    int _340 = _336;
    int _342 = 0;
    int _344 = _340;
    if (_272)
    {
        _342 = 0;
    }
    int _346 = _342;
    float _348 = sqrt(_334);
    float _350 = _332 + _326;
    float _352 = 0.0;
    int _354 = _346;
    float _356 = _316;
    float _358 = _350;
    if (_272)
    {
        _352 = _316;
    }
    float _360 = _352;
    bool _362 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _360;
    if (!_272)
    {
        float _366 = in.m_59.x;
        float _368 = _198 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _366 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        _304 = _378;
        _354 = 2;
        _344 = 1;
        _356 = _366;
        _364 = _382;
        _338 = _374;
    }
    float _384 = _304;
    int _386 = _354;
    int _388 = _344;
    float _390 = _356;
    float _392 = _364;
    float _394 = _338;
    float _396 = _384;
    if (!_362)
    {
        _396 = _294;
    }
    float _398 = _396;
    float _400 = _398;
    if (!_362)
    {
        _306 = _290;
    }
    float _402 = _306;
    bool _404 = !_362;
    float _406 = _402;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _412 = _348 + _410;
        float _414 = _350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = rsqrt(_334);
        float _418 = _412 * _408;
        float _420 = _418 * 0.15915493667125701904296875;
        float _422 = _420 * 6.283185482025146484375;
        float _424 = cos(_422);
        float _426 = _420 * 6.283185482025146484375;
        float _428 = sin(_426);
        float _430 = _424 + (-1.0);
        float _432 = _430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = fma(_428, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _436 = fma(_350, _424, _432);
        float _438 = _416 * _434;
        float _440 = fma(_320, _438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _442 = fma(_300, _438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _436;
        _400 = _440;
        _406 = _442;
    }
    float _444 = _358;
    float _446 = _400;
    float _448 = _406;
    if (!_190)
    {
        float _450 = in.m_61.w;
        int _452 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _454 = _452 == 4;
        bool _456 = _452 == 8;
        bool _458 = _452 == 12;
        int _460 = as_type<int>(_450) << 16;
        int _462 = as_type<int>(_450) << 8;
        int _464 = as_type<int>(_450) << 24;
        int _466 = _460 >> 24;
        int _468 = _462 >> 24;
        int _470 = as_type<int>(_450) >> 24;
        int _472 = _464 >> 24;
        float _474 = float(_466);
        float _476 = float(_468);
        float _478 = float(_470);
        float _480 = _474 * 0.0078740157186985015869140625;
        float _482 = float(_472);
        float _484 = _476 * 0.0078740157186985015869140625;
        float _486 = _478 * 0.0078740157186985015869140625;
        float _488 = precise::min(_480, 1.0);
        float _490 = _482 * 0.0078740157186985015869140625;
        float _492 = precise::min(_484, 1.0);
        float _494 = precise::min(_486, 1.0);
        float _496 = precise::min(_490, 1.0);
        float _498 = precise::max(_488, -1.0);
        float _500 = precise::max(_492, -1.0);
        float _502 = precise::max(_494, -1.0);
        float _504 = precise::max(_496, -1.0);
        float _506 = _504;
        _310 = as_type<float>(_452);
        if (_454)
        {
            _506 = _498;
        }
        float _508 = _506;
        float _510 = _508;
        if (_456)
        {
            _510 = _500;
        }
        float _512 = _510;
        float _514 = _512;
        if (_458)
        {
            _514 = _502;
        }
        float _516 = _514;
        float _518 = abs(_516);
        float _520 = (-0.0) + _518;
        _308 = _520;
    }
    float _522 = _308;
    float _524 = _310;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _444 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _532 = _446 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _448 + _534;
    float _538 = _444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _540 = _528 * _528;
    float _542 = _444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _544 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _538);
    float _546 = fma(_532, _532, _540);
    bool _548 = _522 != 0.0;
    bool _550 = isnan(_522);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _560 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _544);
    float _562 = fma(_536, _536, _546);
    float _564 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _542);
    float _566 = _560 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _568 = rsqrt(_562);
    float _570 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _532 * _570;
    float _574 = _536 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _250;
    float _592 = _580;
    float _594 = _588;
    float _596 = _524;
    float _598 = _528;
    float _600 = _572;
    bool _602 = _584;
    if (_584)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    if (_584)
    {
        float _608 = rsqrt(_580);
        _592 = _608;
    }
    float _610 = _592;
    float _612 = _610;
    if (_584)
    {
        float _614 = _588 * _606;
        _594 = _614;
    }
    float _616 = _594;
    if (_584)
    {
        float _618 = _616 * 0.15915493667125701904296875;
        _596 = _618;
    }
    float _620 = _596;
    float _622 = _536;
    float _624 = _620;
    if (_584)
    {
        float _626 = _620 * 6.283185482025146484375;
        float _628 = sin(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _634 = precise::max(0.0, _632);
    float _636 = _300;
    if (_584)
    {
        float _638 = _620 * 6.283185482025146484375;
        float _640 = cos(_638);
        _636 = _640;
    }
    float _642 = _636;
    float _644 = -_570;
    float _646 = -_634;
    float _648 = fma(_528, _644, _646);
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_584)
    {
        float _652 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _652;
    }
    float _654 = _598;
    float _656 = _654;
    if (!_584)
    {
        _624 = _572;
    }
    float _658 = _624;
    float _660 = fma(_284, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _662 = _630;
    float _664 = _658;
    if (_584)
    {
        float _666 = fma(_630, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _662 = _666;
    }
    float _668 = _662;
    float _670 = _668;
    if (!_584)
    {
        _656 = _574;
    }
    float _672 = _656;
    float _674 = floor(_660);
    float _676 = _672;
    if (_584)
    {
        float _678 = _642 + (-1.0);
        _650 = _678;
    }
    float _680 = _650;
    float _682 = 0.0;
    float _684 = _680;
    if (_584)
    {
        float _686 = _610 * _668;
        _682 = _686;
    }
    float _688 = _682;
    if (!_584)
    {
        _670 = _648;
    }
    float _690 = _670;
    float _692 = _690;
    if (_584)
    {
        float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _684 = _694;
    }
    float _696 = _684;
    if (_584)
    {
        float _698 = _572 * _688;
        _664 = _698;
    }
    float _700 = _664;
    if (!_584)
    {
        _612 = _576;
    }
    float _702 = _612;
    float _704 = _702;
    if (_584)
    {
        float _706 = _574 * _688;
        _676 = _706;
    }
    float _708 = _676;
    if (_584)
    {
        float _710 = fma(_648, _642, _696);
        _692 = _710;
    }
    float _712 = _692;
    if (_584)
    {
        float _714 = _700 * _700;
        _704 = _714;
    }
    float _716 = _704;
    if (!_584)
    {
        _600 = _578;
    }
    float _718 = _600;
    float _720 = sqrt(_562);
    float _722 = _718;
    if (_584)
    {
        float _724 = _708 * _708;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_712, _712, _716);
    float _730 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = _728 + _726;
    float _734 = fma(_262, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _736 = _444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _740 = _566 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _742 = rsqrt(_732);
    float _744 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _738);
    float _748 = -_740;
    float _750 = fma(_748, _558, 1.0);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _760 = _746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _762 = -_756;
    float _764 = _762 + 1.0;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _760 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _564);
    float _772 = floor(_734);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = _742 * _700;
    float _780 = _742 * _712;
    float _782 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[7].z, _774);
    float _784 = _742 * _708;
    float _786 = abs(_764);
    float _788 = log2(_786);
    float _790 = _778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _760 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = _760 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _798 = -_790;
    float _800 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _798);
    float _802 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _804 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _796);
    float _806 = -_784;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _800);
    float _810 = 1.0 / _792;
    float _812 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[4].z, _802);
    float _814 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[5].z, _804);
    float _816 = fma(_808, -0.5, 0.5);
    float _818 = fma(_808, 0.5, 0.5);
    float _820 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _822 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _826 = log2(_750);
    float _828 = fma(_818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _830 = _804;
    float _832 = _814;
    float _834 = _792;
    if (_556)
    {
        _830 = _820;
    }
    float _836 = _830;
    float _838 = -_772;
    float _840 = _734 + _838;
    float _842 = _836;
    if (_556)
    {
        _832 = _824;
    }
    float _844 = _832;
    float _846 = fma(_818, _828, -0.212114393711090087890625);
    float _848 = _844;
    if (!_556)
    {
        _842 = 0.0;
    }
    float _850 = _842;
    float _852 = exp2(_822);
    float _854 = -_674;
    float _856 = _660 + _854;
    if (!_556)
    {
        _848 = 0.0;
    }
    float _858 = _848;
    float _860 = _780 + 1.0;
    float _862 = _810 * _850;
    float _864 = fma(_818, _846, 1.570728778839111328125);
    float _866 = _810 * _858;
    float _868 = sqrt(_816);
    float _870 = _826 * 0.693147182464599609375;
    float2 _3175 = float2(_856, _840);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3175, float2(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3175, float2(0.0), isnan(_3175)), level(0.0)).x;
    float _874 = -_780;
    float _876 = fma(_852, _860, _874);
    float _878 = fma(_862, 0.5, 0.5);
    float _880 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _882 = fma(_866, -0.5, 0.5);
    float _884 = fma(_876, 0.5, 0.5);
    float _886 = _868 * 0.636619746685028076171875;
    float3 _3205 = float3(_878, _882, _880);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).x;
    float _890 = -_864;
    float _892 = fma(_886, _890, 1.0);
    float3 _3221 = float3(_878, _882, _880);
    float4 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3221, float3(0.0), isnan(_3221)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3221, float3(0.0), isnan(_3221)), level(0.0)).xyzw;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float _903 = _895.w;
    float2 _3237 = float2(_892, _884);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_63.x;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _919 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_63.y;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = in.m_59.w;
    float _935 = in.m_59.z;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = _870;
    int _945 = as_type<int>(_878);
    int _947 = as_type<int>(_937);
    if (_923)
    {
        float _949 = in.m_59.x;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _955 = 0.0;
    if (_929)
    {
        float _957 = in.m_59.z;
        _955 = _957;
    }
    float _959 = _955;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _963 = _915;
    if (_923)
    {
        float _965 = -_915;
        float _967 = _965 + 1.0;
        _945 = as_type<int>(_967);
    }
    int _969 = _945;
    float _971 = 0.0;
    if (!_923)
    {
        _971 = _915;
    }
    float _973 = _971;
    float _975 = fma(_919, -2.0, _931);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _981 = -_925;
    float _983 = _981 + 1.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _917 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _991 = _933 > 0.5;
    float _993 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _997 = _991 ? as_type<int>(_983) : as_type<int>(_925);
    out.m_65.y = _925;
    bool _999 = _935 > 0.5;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1003 = _973;
    float _1005 = _925;
    float _1007 = _985;
    float _1009 = _935;
    if (_923)
    {
        bool _1011 = _951 > 0.5;
        _602 = _1011;
    }
    bool _1013 = _602;
    float _1015 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1017 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_923)
    {
        float _1019 = _1013 ? as_type<float>(_969) : _915;
        _1003 = _1019;
    }
    float _1021 = _1003;
    float _1023 = _760 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1025 = _198 > 0.5;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1023);
    int _1031 = _1025 ? as_type<int>(_983) : as_type<int>(_925);
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1035 = _999 ? as_type<int>(_983) : as_type<int>(_925);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1041 = _1039 != 0;
    float _1043 = exp2(_1015);
    float _1045 = _941 ? as_type<float>(_1031) : _925;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1051 = _1049 != 0;
    out.m_67.x = _1033;
    out.m_67.y = _1017;
    out.m_67.z = _987;
    out.m_67.w = _985;
    float _1053 = _1041 ? as_type<float>(_1035) : _925;
    float _1055 = fma(_989, _1045, -0.5);
    bool _1057 = _1041;
    int _1059 = _1035;
    int _1061 = as_type<int>(_1055);
    if (_929)
    {
        bool _1063 = _959 > 0.5;
        _1057 = _1063;
    }
    bool _1065 = _1057;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1071 = _1069 != 0;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1075 = _1051 ? as_type<float>(_997) : _925;
    out.m_69.x = _1047;
    out.m_69.y = _993;
    out.m_69.z = _995;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1079 = _1077 != 0;
    float _1081 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1085 = _1083 != 0;
    float _1087 = in.m_61.x;
    float _1089 = -_1043;
    float _1091 = _1089 + 1.0;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1095 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1067);
    float _1097 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_929)
    {
        float _1099 = -_915;
        float _1101 = _1099 + 1.0;
        _947 = as_type<int>(_1101);
    }
    int _1103 = _947;
    float _1105 = _1085 ? as_type<float>(_1035) : _925;
    float _1107 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1081);
    float _1109 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1111 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    float _1113 = _961 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1115 = _1107;
    if (_1079)
    {
        float _1117 = -_915;
        float _1119 = _1117 + 1.0;
        _1059 = as_type<int>(_1119);
    }
    int _1121 = _1059;
    float _1123 = fma(_1097, _1075, -0.5);
    float _1125 = -_1111;
    float _1127 = fma(_1109, _1055, _1125);
    if (_1071)
    {
        float _1129 = -_915;
        float _1131 = _1129 + 1.0;
        _1061 = as_type<int>(_1131);
    }
    int _1133 = _1061;
    float _1135 = fma(_1113, _1053, -0.5);
    if (!_929)
    {
        _1005 = _915;
    }
    float _1137 = _1005;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1141 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    out.gl_Position.x = _820;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _792;
    float _1143 = fma(_1141, _1105, -0.5);
    float _1145 = _1137;
    if (!_1071)
    {
        _1007 = _915;
    }
    float _1147 = _1007;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1151 = _1147;
    if (_929)
    {
        float _1153 = _1065 ? as_type<float>(_1103) : _915;
        _1145 = _1153;
    }
    float _1155 = _1145;
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    if (_1071)
    {
        float _1157 = _1025 ? as_type<float>(_1133) : _915;
        _1151 = _1157;
    }
    float _1159 = _1151;
    out.m_73.x = _446;
    out.m_73.y = _444;
    out.m_73.z = _448;
    if (_1079)
    {
        float _1161 = _1025 ? as_type<float>(_1121) : _915;
        _963 = _1161;
    }
    float _1163 = _963;
    bool _1165 = _386 != 2;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1169 = _388 != 1;
    float _1171 = _332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1173 = _332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1175 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1179 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1171);
    float _1181 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1173);
    float _1183 = -_1177;
    float _1185 = fma(_1175, 2.0, _1183);
    float _1187 = fma(_1167, _1155, -0.5);
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1195 = fma(_1191, _1159, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1199 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1203 = _392 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1205 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1193);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1209 = _394 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1211 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1197);
    float _1213 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1215 = -_1201;
    float _1217 = fma(_1203, 2.0, _1215);
    float _1219 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1181);
    float _1221 = fma(_1209, -2.0, _1207);
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1225 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1211);
    float _1227 = fma(_1199, _1163, -0.5);
    float _1229 = fma(_1213, _1021, -0.5);
    float _1231 = -_148;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1217);
    float _1235 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1221);
    float _1239 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1223);
    float _1241 = fma(_1225, _1227, _1233);
    float _1243 = 1.0 / _1235;
    float _1245 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1239);
    float _1247 = -_148;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1185);
    float _1251 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1179);
    float _1253 = _1185;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1165)
    {
        _1253 = _390;
    }
    float _1257 = _1253;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1205);
    float _1263 = _1257;
    if (!_1165)
    {
        _1263 = _935;
    }
    float _1265 = _1263;
    float _1267 = fma(_1245, _1229, _1249);
    float _1269 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1259);
    float _1271 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1275 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1277 = -_1237;
    float _1279 = fma(_1261, _1143, _1277);
    float _1281 = _1271 + _1235;
    float _1283 = _1271;
    if (!_1169)
    {
        _1255 = _198;
    }
    float _1285 = _1255;
    float _1287 = -_1273;
    float _1289 = fma(_1275, 2.0, _1287);
    float _1291 = _1279 + 0.5;
    float _1293 = _1281 * _1243;
    float _1295 = _1293 * 0.5;
    float _1297 = _1241 + 0.5;
    float _1299 = _1285;
    float _1301 = _1297;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    if (!_1169)
    {
        _1283 = _1285;
    }
    float _1305 = _1283;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1307);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1313 = _1305;
    if (_1169)
    {
        _1299 = _390;
    }
    float _1315 = _1299;
    out.m_75.x = _1297;
    out.m_75.y = _1291;
    bool _1317 = _236 != 0.0;
    bool _1319 = isnan(_236);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = 1.0 / _1309;
    if (_1169)
    {
        _1313 = _390;
    }
    float _1329 = _1313;
    float _1331 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1311);
    float _1333 = -_148;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1289);
    bool _1337 = _234 == 0.0;
    bool _1339 = !_1325;
    bool _1341 = _1337 && _1339;
    float _1343 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = _1345;
    if (!_1169)
    {
        _1301 = _935;
    }
    float _1349 = _1301;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1353 = _1349;
    if (_1169)
    {
        _1353 = _198;
    }
    float _1355 = _1353;
    float _1357 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    if (_1165)
    {
        _1347 = _198;
    }
    float _1359 = _1347;
    float _1361 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1331);
    float _1363 = _1359;
    if (!_1165)
    {
        _1363 = _390;
    }
    float _1365 = _1363;
    float _1367 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1357);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1371 = _1327 * _1369;
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1351);
    bool _1375 = _240 == 0.0;
    bool _1377 = _1375 && _1341;
    float _1379 = fma(_1367, _1195, _1335);
    float _1381 = abs(_1371);
    float _1383 = log2(_1381);
    if (_1169)
    {
        _1009 = _198;
    }
    float _1385 = _1009;
    float _1387 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _176);
    float _1389 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[17].y, _178);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1397 = -_1391;
    float _1399 = fma(_1343, 2.0, _1397);
    float _1401 = _1395;
    if (!_1377)
    {
        float _1403 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _174);
        _202 = _1403;
    }
    float _1405 = _202;
    if (_1377)
    {
        _312 = _176;
    }
    float _1407 = _312;
    float _1409 = fma(_1393, -2.0, _1395);
    bool _1411 = !_1377;
    float _1413 = _1411 ? _1387 : _176;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1417 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1419 = _1407;
    if (_1377)
    {
        _1401 = _178;
    }
    float _1421 = _1401;
    float _1423 = _1421;
    if (!_556)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1303 = as_type<int>(_1425);
    }
    int _1427 = _1303;
    if (!_1377)
    {
        _1423 = _1389;
    }
    float _1429 = _1423;
    bool _1431 = !_1377;
    float _1433 = _1431 ? _1389 : _178;
    float _1435 = _1413 * _1413;
    float _1437 = exp2(_1417);
    if (!_1377)
    {
        _1419 = _1387;
    }
    float _1439 = _1419;
    float _1441 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1443 = fma(_1433, _1433, _1435);
    float _1445 = -_148;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1373);
    float _1451 = fma(_1441, -2.0, _1415);
    float _1453 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1409);
    float _1455 = rsqrt(_1443);
    float _1457 = fma(_1361, _1187, _1447);
    float _1459 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1269);
    float _1461 = -_1453;
    float _1463 = fma(_1449, _1123, _1461);
    float _1465 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1467 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    bool _1469 = _1371 <= 8000.0;
    bool _1471 = isnan(_1371);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(8000.0);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1487 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1489 = -_1467;
    float _1491 = fma(_1459, _1135, _1489);
    float _1493 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1465);
    float _1495 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1485);
    float _1497 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1487);
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1433 * _1455;
    float _1505 = _1413 * _1455;
    float _1507 = _1457 + 0.5;
    float _1509 = _1501 * _1499;
    float _1511 = _1127 + 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1515 = _1505 * _1513;
    float _1517 = _1379 + 0.5;
    float _1519 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1521 = _1505 * _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1525 = _1505 * _1523;
    float _1527 = _1491 + 0.5;
    float _1529 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1515);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1521);
    float _1533 = -_1509;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1525);
    float _1539 = _1267 + 0.5;
    float _1541 = _1463 + 0.5;
    float _1543 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1509);
    out.m_77.x = _1517;
    out.m_77.y = _1527;
    float _1545 = _1479 * _1543;
    out.m_79.x = _1537;
    out.m_79.y = _1529;
    out.m_79.z = _1531;
    bool _1547 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1549 = isnan(_720);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1555 = _1551 || _1553;
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1539;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1541;
    float _1559 = -_872;
    float _1561 = _1559 + 1.0;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4472 = as_type<float>(_1427);
        out.gl_Position.z = _4472;
    }
    float _1563 = _1561 * _1557;
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = _792 * 0.5;
    float _1569 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1571 = -_1565;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1575 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    float _1577 = fma(_824, -0.5, _1567);
    float _1579 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1581 = _1107 + _792;
    float _1583 = _820 + _792;
    float _1585 = _1573 * _1087;
    float _1587 = _1579 * _888;
    float _1589 = _1581 * 0.5;
    float _1591 = -_1579;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1597 = _903 * _1587;
    float _1599 = _1585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _913 * _1587;
    float _1603 = fma(_909, _1597, _897);
    float _1605 = fma(_911, _1597, _899);
    float _1607 = _903 * _1593;
    float _1609 = fma(_903, _1601, _901);
    out.m_83.z = _1589;
    out.m_83.w = _792;
    float _1611 = _1583 * 0.5;
    float _1613 = _1579;
    float _1615 = _1593;
    float _1617 = _1577;
    float _1619 = _1611;
    if (!_1555)
    {
        _834 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1621 = _834;
    out.m_85.x = _1599;
    float _1623 = _1621;
    float _1625 = _1621;
    if (!_1555)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1627 = _1115;
    float _1629 = _1627;
    float _1631 = _1627;
    if (!_1555)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1613;
    out.m_87.x = _1603;
    out.m_87.y = _1605;
    out.m_87.z = _1609;
    out.m_87.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1555)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1615;
    out.m_89.x = _1595;
    out.m_89.y = _1569;
    out.m_89.z = _1575;
    out.m_91.x = _1611;
    out.m_91.y = _1577;
    out.m_91.z = _1589;
    out.m_91.w = _792;
    float _1641 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = _1641;
    float _1645 = _1639;
    float _1647 = _1639;
    if (!_556)
    {
        _1643 = 0.0;
    }
    float _1649 = _1643;
    if (!_1555)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1651 = _1617;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1555)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1657 = _1619;
    bool _1659 = !_1555;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_720);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _720 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1691;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1715 = fma(_1707, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1713;
            _1663 = _1721;
            _1631 = _1715;
            _1655 = _1719;
            _1647 = _1717;
            _1625 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_720);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1737 = _1653;
            _1655 = _1737;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1739 = _1661;
            _1663 = _1739;
            if (!_1735)
            {
                _1623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1741 = _1623;
            _1625 = _1741;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1743 = _1629;
            _1631 = _1743;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1745 = _1635;
            _1637 = _1745;
            if (!_1735)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1747 = _1645;
            bool _1749 = !_1735;
            _1647 = _1747;
            if (!_1749)
            {
                bool _1751 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_720);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _720 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = 1.0 / _1767;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1777;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1801 = fma(_1793, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1799;
                    _1663 = _1807;
                    _1631 = _1801;
                    _1655 = _1805;
                    _1647 = _1803;
                    _1625 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1663;
    float _1815 = _1631;
    float _1817 = _1655;
    float _1819 = _1647;
    float _1821 = _1625;
    float _1823 = fma(_1569, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1813 + _1827;
    float _1831 = -_1815;
    float _1833 = _1817 + _1831;
    float _1835 = -_1819;
    float _1837 = _1821 + _1835;
    bool _1839 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1841 = fma(_1825, _1829, _1811);
    float _1843 = fma(_1825, _1833, _1815);
    float _1845 = fma(_1825, _1837, _1819);
    float _1847 = _1649 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = _1841 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1851 = fma(_1843, 0.298911988735198974609375, _1849);
    out.m_49.x = _1847;
    float _1853 = fma(_1845, 0.114477999508380889892578125, _1851);
    float _1855 = -_1853;
    float _1857 = _1843 + _1855;
    float _1859 = -_1853;
    float _1861 = _1841 + _1859;
    float _1863 = -_1853;
    float _1865 = _1845 + _1863;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1869 = fma(_1861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1871 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    out.m_95.x = _1867;
    out.m_95.y = _1869;
    out.m_95.z = _1871;
    if (!_1839)
    {
        return out;
    }
    float _1873 = -_444;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1877 = -_446;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1881 = -_448;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1885 = _1875 * _1875;
    float _1887 = fma(_1879, _1879, _1885);
    float _1889 = fma(_1883, _1883, _1887);
    float _1891 = sqrt(_1889);
    float _1893 = rsqrt(_1889);
    float _1895 = -_1891;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1879 * _1893;
    float _1905 = _1875 * _1893;
    float _1907 = abs(_1901);
    float _1909 = log2(_1907);
    float _1911 = _1883 * _1893;
    float _1913 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1915 = _1569 * _1905;
    float _1917 = -_1905;
    float _1919 = -_1913;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1919);
    float _1923 = fma(_1595, _1903, _1915);
    float _1925 = -_1911;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1921);
    float _1929 = fma(_1575, _1911, _1923);
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1935 = _1927 + _1933;
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = exp2(_1937);
    float _1945 = _1943 * _1941;
    float _1947 = _1931 * _1945;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1953 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _1949;
    out.m_93.y = _1951;
    out.m_93.z = _1953;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_130);
        out.gl_Position.z = _2011;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_166);
        out.gl_Position.z = _2080;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _182 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _184 = isnan(0.5);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _190 = _186 || _188;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.y;
    float _200 = 0.0;
    float _202 = _174;
    if (_190)
    {
        _200 = 1.0;
    }
    float _204 = _200;
    float _206 = fma(_170, 16.0, _180);
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_46.x;
    float _212 = in.m_46.y;
    float _214 = in.m_46.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _226 = _220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _228 = _224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _230 = fma(_218, 0.5, 0.5);
    float _232 = _230 * 0.004999999888241291046142578125;
    float _234 = fma(_174, _232, _168);
    float _236 = fma(_176, _232, _170);
    float _238 = _212 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _240 = fma(_178, _232, _172);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _234);
    float _244 = _222 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _238);
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _240);
    float _250 = _242 * _226;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _236);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].z, _246);
    float _256 = _248 * _228;
    float _258 = _252 * _244;
    float _260 = _212 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _262 = _254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _266 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _260);
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _276 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _268);
    float _280 = _212 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[8].z, _278);
    float _288 = _258 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _262 + _282;
    float _292 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = _284 + _286;
    float _296 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _300 = _290 + _298;
    float _302 = 0.0;
    float _304 = _210;
    float _306 = _214;
    float _308 = _204;
    float _310 = _294;
    float _312 = _236;
    if (_272)
    {
        float _314 = in.m_59.x;
        _302 = _314;
    }
    float _316 = _302;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _320 = _294 + _318;
    float _322 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _324 = _300 * _300;
    float _326 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _328 = 0.0;
    if (_272)
    {
        _328 = _198;
    }
    float _330 = _328;
    float _332 = _322 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _334 = fma(_320, _320, _324);
    int _336 = 0;
    float _338 = _330;
    if (_272)
    {
        _336 = 0;
    }
    int _340 = _336;
    int _342 = 0;
    int _344 = _340;
    if (_272)
    {
        _342 = 0;
    }
    int _346 = _342;
    float _348 = sqrt(_334);
    float _350 = _332 + _326;
    float _352 = 0.0;
    int _354 = _346;
    float _356 = _316;
    float _358 = _350;
    if (_272)
    {
        _352 = _316;
    }
    float _360 = _352;
    bool _362 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _360;
    if (!_272)
    {
        float _366 = in.m_59.x;
        float _368 = _198 * 3.1415927410125732421875;
        float _370 = _368 * 0.15915493667125701904296875;
        float _372 = _370 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _366 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        _304 = _378;
        _354 = 2;
        _344 = 1;
        _356 = _366;
        _364 = _382;
        _338 = _374;
    }
    float _384 = _304;
    int _386 = _354;
    int _388 = _344;
    float _390 = _356;
    float _392 = _364;
    float _394 = _338;
    float _396 = _384;
    if (!_362)
    {
        _396 = _294;
    }
    float _398 = _396;
    float _400 = _398;
    if (!_362)
    {
        _306 = _290;
    }
    float _402 = _306;
    bool _404 = !_362;
    float _406 = _402;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _412 = _348 + _410;
        float _414 = _350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = rsqrt(_334);
        float _418 = _412 * _408;
        float _420 = _418 * 0.15915493667125701904296875;
        float _422 = _420 * 6.283185482025146484375;
        float _424 = cos(_422);
        float _426 = _420 * 6.283185482025146484375;
        float _428 = sin(_426);
        float _430 = _424 + (-1.0);
        float _432 = _430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = fma(_428, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _436 = fma(_350, _424, _432);
        float _438 = _416 * _434;
        float _440 = fma(_320, _438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _442 = fma(_300, _438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _436;
        _400 = _440;
        _406 = _442;
    }
    float _444 = _358;
    float _446 = _400;
    float _448 = _406;
    if (!_190)
    {
        float _450 = in.m_61.w;
        int _452 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _454 = _452 == 4;
        bool _456 = _452 == 8;
        bool _458 = _452 == 12;
        int _460 = as_type<int>(_450) << 16;
        int _462 = as_type<int>(_450) << 8;
        int _464 = as_type<int>(_450) << 24;
        int _466 = _460 >> 24;
        int _468 = _462 >> 24;
        int _470 = as_type<int>(_450) >> 24;
        int _472 = _464 >> 24;
        float _474 = float(_466);
        float _476 = float(_468);
        float _478 = float(_470);
        float _480 = _474 * 0.0078740157186985015869140625;
        float _482 = float(_472);
        float _484 = _476 * 0.0078740157186985015869140625;
        float _486 = _478 * 0.0078740157186985015869140625;
        float _488 = precise::min(_480, 1.0);
        float _490 = _482 * 0.0078740157186985015869140625;
        float _492 = precise::min(_484, 1.0);
        float _494 = precise::min(_486, 1.0);
        float _496 = precise::min(_490, 1.0);
        float _498 = precise::max(_488, -1.0);
        float _500 = precise::max(_492, -1.0);
        float _502 = precise::max(_494, -1.0);
        float _504 = precise::max(_496, -1.0);
        float _506 = _504;
        _310 = as_type<float>(_452);
        if (_454)
        {
            _506 = _498;
        }
        float _508 = _506;
        float _510 = _508;
        if (_456)
        {
            _510 = _500;
        }
        float _512 = _510;
        float _514 = _512;
        if (_458)
        {
            _514 = _502;
        }
        float _516 = _514;
        float _518 = abs(_516);
        float _520 = (-0.0) + _518;
        _308 = _520;
    }
    float _522 = _308;
    float _524 = _310;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _444 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _532 = _446 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _536 = _448 + _534;
    float _538 = _444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _540 = _528 * _528;
    float _542 = _444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _544 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _538);
    float _546 = fma(_532, _532, _540);
    bool _548 = _522 != 0.0;
    bool _550 = isnan(_522);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _560 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _544);
    float _562 = fma(_536, _536, _546);
    float _564 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _542);
    float _566 = _560 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _568 = rsqrt(_562);
    float _570 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _572 = _532 * _570;
    float _574 = _536 * _570;
    float _576 = _572 * _572;
    float _578 = _574 * _574;
    float _580 = _576 + _578;
    float _582 = sqrt(_580);
    bool _584 = _582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = _582 + _586;
    float _590 = _250;
    float _592 = _580;
    float _594 = _588;
    float _596 = _524;
    float _598 = _528;
    float _600 = _572;
    bool _602 = _584;
    if (_584)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    if (_584)
    {
        float _608 = rsqrt(_580);
        _592 = _608;
    }
    float _610 = _592;
    float _612 = _610;
    if (_584)
    {
        float _614 = _588 * _606;
        _594 = _614;
    }
    float _616 = _594;
    if (_584)
    {
        float _618 = _616 * 0.15915493667125701904296875;
        _596 = _618;
    }
    float _620 = _596;
    float _622 = _536;
    float _624 = _620;
    if (_584)
    {
        float _626 = _620 * 6.283185482025146484375;
        float _628 = sin(_626);
        _622 = _628;
    }
    float _630 = _622;
    float _632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _634 = precise::max(0.0, _632);
    float _636 = _300;
    if (_584)
    {
        float _638 = _620 * 6.283185482025146484375;
        float _640 = cos(_638);
        _636 = _640;
    }
    float _642 = _636;
    float _644 = -_570;
    float _646 = -_634;
    float _648 = fma(_528, _644, _646);
    float _650 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_584)
    {
        float _652 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _652;
    }
    float _654 = _598;
    float _656 = _654;
    if (!_584)
    {
        _624 = _572;
    }
    float _658 = _624;
    float _660 = fma(_284, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _662 = _630;
    float _664 = _658;
    if (_584)
    {
        float _666 = fma(_630, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _662 = _666;
    }
    float _668 = _662;
    float _670 = _668;
    if (!_584)
    {
        _656 = _574;
    }
    float _672 = _656;
    float _674 = floor(_660);
    float _676 = _672;
    if (_584)
    {
        float _678 = _642 + (-1.0);
        _650 = _678;
    }
    float _680 = _650;
    float _682 = 0.0;
    float _684 = _680;
    if (_584)
    {
        float _686 = _610 * _668;
        _682 = _686;
    }
    float _688 = _682;
    if (!_584)
    {
        _670 = _648;
    }
    float _690 = _670;
    float _692 = _690;
    if (_584)
    {
        float _694 = _680 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _684 = _694;
    }
    float _696 = _684;
    if (_584)
    {
        float _698 = _572 * _688;
        _664 = _698;
    }
    float _700 = _664;
    if (!_584)
    {
        _612 = _576;
    }
    float _702 = _612;
    float _704 = _702;
    if (_584)
    {
        float _706 = _574 * _688;
        _676 = _706;
    }
    float _708 = _676;
    if (_584)
    {
        float _710 = fma(_648, _642, _696);
        _692 = _710;
    }
    float _712 = _692;
    if (_584)
    {
        float _714 = _700 * _700;
        _704 = _714;
    }
    float _716 = _704;
    if (!_584)
    {
        _600 = _578;
    }
    float _718 = _600;
    float _720 = sqrt(_562);
    float _722 = _718;
    if (_584)
    {
        float _724 = _708 * _708;
        _722 = _724;
    }
    float _726 = _722;
    float _728 = fma(_712, _712, _716);
    float _730 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _732 = _728 + _726;
    float _734 = fma(_262, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _736 = _444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _730);
    float _740 = _566 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _742 = rsqrt(_732);
    float _744 = fma(_446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _746 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _738);
    float _748 = -_740;
    float _750 = fma(_748, _558, 1.0);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _754 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _752);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _744);
    float _760 = _746 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _762 = -_756;
    float _764 = _762 + 1.0;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _768 = _760 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _770 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _564);
    float _772 = floor(_734);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _768);
    float _776 = _770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _778 = _742 * _700;
    float _780 = _742 * _712;
    float _782 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[7].z, _774);
    float _784 = _742 * _708;
    float _786 = abs(_764);
    float _788 = log2(_786);
    float _790 = _778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _794 = _760 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _796 = _760 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _798 = -_790;
    float _800 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _798);
    float _802 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _794);
    float _804 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _796);
    float _806 = -_784;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c15)._m0[21].z, _800);
    float _810 = 1.0 / _792;
    float _812 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[4].z, _802);
    float _814 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[5].z, _804);
    float _816 = fma(_808, -0.5, 0.5);
    float _818 = fma(_808, 0.5, 0.5);
    float _820 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[4].w, _812);
    float _822 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _824 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[5].w, _814);
    float _826 = log2(_750);
    float _828 = fma(_818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _830 = _804;
    float _832 = _814;
    float _834 = _792;
    if (_556)
    {
        _830 = _820;
    }
    float _836 = _830;
    float _838 = -_772;
    float _840 = _734 + _838;
    float _842 = _836;
    if (_556)
    {
        _832 = _824;
    }
    float _844 = _832;
    float _846 = fma(_818, _828, -0.212114393711090087890625);
    float _848 = _844;
    if (!_556)
    {
        _842 = 0.0;
    }
    float _850 = _842;
    float _852 = exp2(_822);
    float _854 = -_674;
    float _856 = _660 + _854;
    if (!_556)
    {
        _848 = 0.0;
    }
    float _858 = _848;
    float _860 = _780 + 1.0;
    float _862 = _810 * _850;
    float _864 = fma(_818, _846, 1.570728778839111328125);
    float _866 = _810 * _858;
    float _868 = sqrt(_816);
    float _870 = _826 * 0.693147182464599609375;
    float2 _3175 = float2(_856, _840);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3175, float2(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3175, float2(0.0), isnan(_3175)), level(0.0)).x;
    float _874 = -_780;
    float _876 = fma(_852, _860, _874);
    float _878 = fma(_862, 0.5, 0.5);
    float _880 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _882 = fma(_866, -0.5, 0.5);
    float _884 = fma(_876, 0.5, 0.5);
    float _886 = _868 * 0.636619746685028076171875;
    float3 _3205 = float3(_878, _882, _880);
    float _888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).x;
    float _890 = -_864;
    float _892 = fma(_886, _890, 1.0);
    float3 _3221 = float3(_878, _882, _880);
    float4 _895 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3221, float3(0.0), isnan(_3221)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3221, float3(0.0), isnan(_3221)), level(0.0)).xyzw;
    float _897 = _895.x;
    float _899 = _895.y;
    float _901 = _895.z;
    float _903 = _895.w;
    float2 _3237 = float2(_892, _884);
    float3 _907 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _909 = _907.x;
    float _911 = _907.y;
    float _913 = _907.z;
    float _915 = in.m_63.x;
    float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _919 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_63.y;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _933 = in.m_59.w;
    float _935 = in.m_59.z;
    float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = _870;
    int _945 = as_type<int>(_878);
    int _947 = as_type<int>(_937);
    if (_923)
    {
        float _949 = in.m_59.x;
        _943 = _949;
    }
    float _951 = _943;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _955 = 0.0;
    if (_929)
    {
        float _957 = in.m_59.z;
        _955 = _957;
    }
    float _959 = _955;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _963 = _915;
    if (_923)
    {
        float _965 = -_915;
        float _967 = _965 + 1.0;
        _945 = as_type<int>(_967);
    }
    int _969 = _945;
    float _971 = 0.0;
    if (!_923)
    {
        _971 = _915;
    }
    float _973 = _971;
    float _975 = fma(_919, -2.0, _931);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _981 = -_925;
    float _983 = _981 + 1.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _917 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _991 = _933 > 0.5;
    float _993 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _997 = _991 ? as_type<int>(_983) : as_type<int>(_925);
    out.m_65.y = _925;
    bool _999 = _935 > 0.5;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1003 = _973;
    float _1005 = _925;
    float _1007 = _985;
    float _1009 = _935;
    if (_923)
    {
        bool _1011 = _951 > 0.5;
        _602 = _1011;
    }
    bool _1013 = _602;
    float _1015 = _788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1017 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_923)
    {
        float _1019 = _1013 ? as_type<float>(_969) : _915;
        _1003 = _1019;
    }
    float _1021 = _1003;
    float _1023 = _760 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1025 = _198 > 0.5;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1023);
    int _1031 = _1025 ? as_type<int>(_983) : as_type<int>(_925);
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1035 = _999 ? as_type<int>(_983) : as_type<int>(_925);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1041 = _1039 != 0;
    float _1043 = exp2(_1015);
    float _1045 = _941 ? as_type<float>(_1031) : _925;
    float _1047 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1051 = _1049 != 0;
    out.m_67.x = _1033;
    out.m_67.y = _1017;
    out.m_67.z = _987;
    out.m_67.w = _985;
    float _1053 = _1041 ? as_type<float>(_1035) : _925;
    float _1055 = fma(_989, _1045, -0.5);
    bool _1057 = _1041;
    int _1059 = _1035;
    int _1061 = as_type<int>(_1055);
    if (_929)
    {
        bool _1063 = _959 > 0.5;
        _1057 = _1063;
    }
    bool _1065 = _1057;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1071 = _1069 != 0;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1075 = _1051 ? as_type<float>(_997) : _925;
    out.m_69.x = _1047;
    out.m_69.y = _993;
    out.m_69.z = _995;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1079 = _1077 != 0;
    float _1081 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1029);
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1085 = _1083 != 0;
    float _1087 = in.m_61.x;
    float _1089 = -_1043;
    float _1091 = _1089 + 1.0;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1095 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1067);
    float _1097 = _937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_929)
    {
        float _1099 = -_915;
        float _1101 = _1099 + 1.0;
        _947 = as_type<int>(_1101);
    }
    int _1103 = _947;
    float _1105 = _1085 ? as_type<float>(_1035) : _925;
    float _1107 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1081);
    float _1109 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1095);
    float _1111 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _975);
    float _1113 = _961 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1115 = _1107;
    if (_1079)
    {
        float _1117 = -_915;
        float _1119 = _1117 + 1.0;
        _1059 = as_type<int>(_1119);
    }
    int _1121 = _1059;
    float _1123 = fma(_1097, _1075, -0.5);
    float _1125 = -_1111;
    float _1127 = fma(_1109, _1055, _1125);
    if (_1071)
    {
        float _1129 = -_915;
        float _1131 = _1129 + 1.0;
        _1061 = as_type<int>(_1131);
    }
    int _1133 = _1061;
    float _1135 = fma(_1113, _1053, -0.5);
    if (!_929)
    {
        _1005 = _915;
    }
    float _1137 = _1005;
    float _1139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1141 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    out.gl_Position.x = _820;
    out.gl_Position.y = _824;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _792;
    float _1143 = fma(_1141, _1105, -0.5);
    float _1145 = _1137;
    if (!_1071)
    {
        _1007 = _915;
    }
    float _1147 = _1007;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1151 = _1147;
    if (_929)
    {
        float _1153 = _1065 ? as_type<float>(_1103) : _915;
        _1145 = _1153;
    }
    float _1155 = _1145;
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    if (_1071)
    {
        float _1157 = _1025 ? as_type<float>(_1133) : _915;
        _1151 = _1157;
    }
    float _1159 = _1151;
    out.m_73.x = _446;
    out.m_73.y = _444;
    out.m_73.z = _448;
    if (_1079)
    {
        float _1161 = _1025 ? as_type<float>(_1121) : _915;
        _963 = _1161;
    }
    float _1163 = _963;
    bool _1165 = _386 != 2;
    float _1167 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1169 = _388 != 1;
    float _1171 = _332 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1173 = _332 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1175 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1179 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1171);
    float _1181 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1173);
    float _1183 = -_1177;
    float _1185 = fma(_1175, 2.0, _1183);
    float _1187 = fma(_1167, _1155, -0.5);
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1195 = fma(_1191, _1159, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1199 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1203 = _392 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1205 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1193);
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1209 = _394 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1211 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1197);
    float _1213 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1215 = -_1201;
    float _1217 = fma(_1203, 2.0, _1215);
    float _1219 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1181);
    float _1221 = fma(_1209, -2.0, _1207);
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1225 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1211);
    float _1227 = fma(_1199, _1163, -0.5);
    float _1229 = fma(_1213, _1021, -0.5);
    float _1231 = -_148;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1217);
    float _1235 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1237 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1221);
    float _1239 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1223);
    float _1241 = fma(_1225, _1227, _1233);
    float _1243 = 1.0 / _1235;
    float _1245 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1239);
    float _1247 = -_148;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1185);
    float _1251 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1179);
    float _1253 = _1185;
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1165)
    {
        _1253 = _390;
    }
    float _1257 = _1253;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1261 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1205);
    float _1263 = _1257;
    if (!_1165)
    {
        _1263 = _935;
    }
    float _1265 = _1263;
    float _1267 = fma(_1245, _1229, _1249);
    float _1269 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1259);
    float _1271 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1275 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1277 = -_1237;
    float _1279 = fma(_1261, _1143, _1277);
    float _1281 = _1271 + _1235;
    float _1283 = _1271;
    if (!_1169)
    {
        _1255 = _198;
    }
    float _1285 = _1255;
    float _1287 = -_1273;
    float _1289 = fma(_1275, 2.0, _1287);
    float _1291 = _1279 + 0.5;
    float _1293 = _1281 * _1243;
    float _1295 = _1293 * 0.5;
    float _1297 = _1241 + 0.5;
    float _1299 = _1285;
    float _1301 = _1297;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    if (!_1169)
    {
        _1283 = _1285;
    }
    float _1305 = _1283;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1309 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1307);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1313 = _1305;
    if (_1169)
    {
        _1299 = _390;
    }
    float _1315 = _1299;
    out.m_75.x = _1297;
    out.m_75.y = _1291;
    bool _1317 = _236 != 0.0;
    bool _1319 = isnan(_236);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = 1.0 / _1309;
    if (_1169)
    {
        _1313 = _390;
    }
    float _1329 = _1313;
    float _1331 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1311);
    float _1333 = -_148;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1289);
    bool _1337 = _234 == 0.0;
    bool _1339 = !_1325;
    bool _1341 = _1337 && _1339;
    float _1343 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1347 = _1345;
    if (!_1169)
    {
        _1301 = _935;
    }
    float _1349 = _1301;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1353 = _1349;
    if (_1169)
    {
        _1353 = _198;
    }
    float _1355 = _1353;
    float _1357 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1345);
    if (_1165)
    {
        _1347 = _198;
    }
    float _1359 = _1347;
    float _1361 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1331);
    float _1363 = _1359;
    if (!_1165)
    {
        _1363 = _390;
    }
    float _1365 = _1363;
    float _1367 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1357);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1371 = _1327 * _1369;
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1351);
    bool _1375 = _240 == 0.0;
    bool _1377 = _1375 && _1341;
    float _1379 = fma(_1367, _1195, _1335);
    float _1381 = abs(_1371);
    float _1383 = log2(_1381);
    if (_1169)
    {
        _1009 = _198;
    }
    float _1385 = _1009;
    float _1387 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _176);
    float _1389 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[17].y, _178);
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1397 = -_1391;
    float _1399 = fma(_1343, 2.0, _1397);
    float _1401 = _1395;
    if (!_1377)
    {
        float _1403 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _174);
        _202 = _1403;
    }
    float _1405 = _202;
    if (_1377)
    {
        _312 = _176;
    }
    float _1407 = _312;
    float _1409 = fma(_1393, -2.0, _1395);
    bool _1411 = !_1377;
    float _1413 = _1411 ? _1387 : _176;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1417 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1419 = _1407;
    if (_1377)
    {
        _1401 = _178;
    }
    float _1421 = _1401;
    float _1423 = _1421;
    if (!_556)
    {
        float _1425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1303 = as_type<int>(_1425);
    }
    int _1427 = _1303;
    if (!_1377)
    {
        _1423 = _1389;
    }
    float _1429 = _1423;
    bool _1431 = !_1377;
    float _1433 = _1431 ? _1389 : _178;
    float _1435 = _1413 * _1413;
    float _1437 = exp2(_1417);
    if (!_1377)
    {
        _1419 = _1387;
    }
    float _1439 = _1419;
    float _1441 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1443 = fma(_1433, _1433, _1435);
    float _1445 = -_148;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1449 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1373);
    float _1451 = fma(_1441, -2.0, _1415);
    float _1453 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1409);
    float _1455 = rsqrt(_1443);
    float _1457 = fma(_1361, _1187, _1447);
    float _1459 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1269);
    float _1461 = -_1453;
    float _1463 = fma(_1449, _1123, _1461);
    float _1465 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1467 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1451);
    bool _1469 = _1371 <= 8000.0;
    bool _1471 = isnan(_1371);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(8000.0);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1487 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1489 = -_1467;
    float _1491 = fma(_1459, _1135, _1489);
    float _1493 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1465);
    float _1495 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1485);
    float _1497 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1487);
    float _1499 = fma(_1483, -2.0, 3.0);
    float _1501 = _1483 * _1483;
    float _1503 = _1433 * _1455;
    float _1505 = _1413 * _1455;
    float _1507 = _1457 + 0.5;
    float _1509 = _1501 * _1499;
    float _1511 = _1127 + 0.5;
    float _1513 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1515 = _1505 * _1513;
    float _1517 = _1379 + 0.5;
    float _1519 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1521 = _1505 * _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1525 = _1505 * _1523;
    float _1527 = _1491 + 0.5;
    float _1529 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1515);
    float _1531 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1521);
    float _1533 = -_1509;
    float _1535 = _1533 + 1.0;
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1525);
    float _1539 = _1267 + 0.5;
    float _1541 = _1463 + 0.5;
    float _1543 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1509);
    out.m_77.x = _1517;
    out.m_77.y = _1527;
    float _1545 = _1479 * _1543;
    out.m_79.x = _1537;
    out.m_79.y = _1529;
    out.m_79.z = _1531;
    bool _1547 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1549 = isnan(_720);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1555 = _1551 || _1553;
    float _1557 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.x = _1539;
    out.m_81.y = _1511;
    out.m_81.z = _1507;
    out.m_81.w = _1541;
    float _1559 = -_872;
    float _1561 = _1559 + 1.0;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4472 = as_type<float>(_1427);
        out.gl_Position.z = _4472;
    }
    float _1563 = _1561 * _1557;
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = _792 * 0.5;
    float _1569 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1571 = -_1565;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1575 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    float _1577 = fma(_824, -0.5, _1567);
    float _1579 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1581 = _1107 + _792;
    float _1583 = _820 + _792;
    float _1585 = _1573 * _1087;
    float _1587 = _1579 * _888;
    float _1589 = _1581 * 0.5;
    float _1591 = -_1579;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1597 = _903 * _1587;
    float _1599 = _1585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1601 = _913 * _1587;
    float _1603 = fma(_909, _1597, _897);
    float _1605 = fma(_911, _1597, _899);
    float _1607 = _903 * _1593;
    float _1609 = fma(_903, _1601, _901);
    out.m_83.z = _1589;
    out.m_83.w = _792;
    float _1611 = _1583 * 0.5;
    float _1613 = _1579;
    float _1615 = _1593;
    float _1617 = _1577;
    float _1619 = _1611;
    if (!_1555)
    {
        _834 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1621 = _834;
    out.m_85.x = _1599;
    float _1623 = _1621;
    float _1625 = _1621;
    if (!_1555)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1627 = _1115;
    float _1629 = _1627;
    float _1631 = _1627;
    if (!_1555)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1613;
    out.m_87.x = _1603;
    out.m_87.y = _1605;
    out.m_87.z = _1609;
    out.m_87.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1555)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1615;
    out.m_89.x = _1595;
    out.m_89.y = _1569;
    out.m_89.z = _1575;
    out.m_91.x = _1611;
    out.m_91.y = _1577;
    out.m_91.z = _1589;
    out.m_91.w = _792;
    float _1641 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = _1641;
    float _1645 = _1639;
    float _1647 = _1639;
    if (!_556)
    {
        _1643 = 0.0;
    }
    float _1649 = _1643;
    if (!_1555)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1651 = _1617;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1555)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1657 = _1619;
    bool _1659 = !_1555;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_720);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _720 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1691;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1715 = fma(_1707, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1713;
            _1663 = _1721;
            _1631 = _1715;
            _1655 = _1719;
            _1647 = _1717;
            _1625 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_720);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1737 = _1653;
            _1655 = _1737;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1739 = _1661;
            _1663 = _1739;
            if (!_1735)
            {
                _1623 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1741 = _1623;
            _1625 = _1741;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1743 = _1629;
            _1631 = _1743;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1745 = _1635;
            _1637 = _1745;
            if (!_1735)
            {
                _1645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1747 = _1645;
            bool _1749 = !_1735;
            _1647 = _1747;
            if (!_1749)
            {
                bool _1751 = _720 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_720);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _720 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = 1.0 / _1767;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1777;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1801 = fma(_1793, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1799;
                    _1663 = _1807;
                    _1631 = _1801;
                    _1655 = _1805;
                    _1647 = _1803;
                    _1625 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1625 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1663;
    float _1815 = _1631;
    float _1817 = _1655;
    float _1819 = _1647;
    float _1821 = _1625;
    float _1823 = fma(_1569, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1813 + _1827;
    float _1831 = -_1815;
    float _1833 = _1817 + _1831;
    float _1835 = -_1819;
    float _1837 = _1821 + _1835;
    bool _1839 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1841 = fma(_1825, _1829, _1811);
    float _1843 = fma(_1825, _1833, _1815);
    float _1845 = fma(_1825, _1837, _1819);
    float _1847 = _1649 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1849 = _1841 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _1851 = fma(_1843, 0.298911988735198974609375, _1849);
    out.m_49.x = _1847;
    float _1853 = fma(_1845, 0.114477999508380889892578125, _1851);
    float _1855 = -_1853;
    float _1857 = _1843 + _1855;
    float _1859 = -_1853;
    float _1861 = _1841 + _1859;
    float _1863 = -_1853;
    float _1865 = _1845 + _1863;
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1869 = fma(_1861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    float _1871 = fma(_1865, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1853);
    out.m_95.x = _1867;
    out.m_95.y = _1869;
    out.m_95.z = _1871;
    if (!_1839)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1873 = -_444;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1877 = -_446;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1881 = -_448;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1885 = _1875 * _1875;
    float _1887 = fma(_1879, _1879, _1885);
    float _1889 = fma(_1883, _1883, _1887);
    float _1891 = sqrt(_1889);
    float _1893 = rsqrt(_1889);
    float _1895 = -_1891;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1879 * _1893;
    float _1905 = _1875 * _1893;
    float _1907 = abs(_1901);
    float _1909 = log2(_1907);
    float _1911 = _1883 * _1893;
    float _1913 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1915 = _1569 * _1905;
    float _1917 = -_1905;
    float _1919 = -_1913;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1919);
    float _1923 = fma(_1595, _1903, _1915);
    float _1925 = -_1911;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1921);
    float _1929 = fma(_1575, _1911, _1923);
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1935 = _1927 + _1933;
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = exp2(_1937);
    float _1945 = _1943 * _1941;
    float _1947 = _1931 * _1945;
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1951 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1953 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _1949;
    out.m_93.y = _1951;
    out.m_93.z = _1953;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

