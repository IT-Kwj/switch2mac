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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
    float4 m_95 [[user(locn14)]];
    float4 m_87 [[user(locn15)]];
    float4 m_89 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1635 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_134);
        out.gl_Position.z = _1922;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1990 = as_type<float>(_168);
        out.gl_Position.z = _1990;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = in.m_57.y;
    float _190 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _202 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = _196 * _198;
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _208 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    float _212 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _214 = _206 * _208;
    float _216 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _218 = _210 * _200;
    float _220 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _212);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _224 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _216);
    float _226 = _214 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _228 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _222);
    float _232 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _224);
    float _234 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _232 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _244 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _246 = _228 + _236;
    float _248 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _214 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _252 = _242 + _244;
    float _254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _256 = _246 + _254;
    float _258 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _250);
    float _262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _264 = _252 + _262;
    float _266 = _256 * _256;
    float _268 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _270 = 0.0;
    float _272 = _182;
    float _274 = _186;
    float _276 = _252;
    if (_240)
    {
        float _278 = in.m_57.x;
        _270 = _278;
    }
    float _280 = _270;
    float _282 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _260);
    float _284 = fma(_264, _264, _266);
    float _286 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _188;
    if (_240)
    {
        _288 = _188;
    }
    float _294 = _288;
    float _296 = sqrt(_284);
    int _298 = 0;
    float _300 = _294;
    if (_240)
    {
        _298 = 0;
    }
    int _302 = _298;
    float _304 = _286 + _282;
    int _306 = 0;
    int _308 = _302;
    float _310 = _304;
    if (_240)
    {
        _306 = 0;
    }
    int _312 = _306;
    bool _314 = _296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _316 = 0.0;
    int _318 = _312;
    float _320 = _280;
    float _322 = _296;
    if (_240)
    {
        _316 = _280;
    }
    float _324 = _316;
    float _326 = _324;
    if (!_240)
    {
        float _328 = in.m_57.x;
        float _330 = _188 * 3.1415927410125732421875;
        float _332 = _330 * 0.15915493667125701904296875;
        float _334 = _332 * 6.283185482025146484375;
        float _336 = sin(_334);
        float _338 = _328 * 3.1415927410125732421875;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = sin(_342);
        _272 = _340;
        _318 = 2;
        _308 = 1;
        _320 = _328;
        _326 = _344;
        _300 = _336;
    }
    float _346 = _272;
    int _348 = _318;
    int _350 = _308;
    float _352 = _320;
    float _354 = _326;
    float _356 = _300;
    float _358 = _346;
    float _360 = as_type<float>(_348);
    if (!_314)
    {
        _358 = _252;
    }
    float _362 = _358;
    float _364 = _362;
    if (!_314)
    {
        _274 = _246;
    }
    float _366 = _274;
    bool _368 = !_314;
    float _370 = _366;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _376 = _296 + _374;
        float _378 = _304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = rsqrt(_284);
        float _382 = _376 * _372;
        float _384 = _382 * 0.15915493667125701904296875;
        float _386 = _384 * 6.283185482025146484375;
        float _388 = cos(_386);
        float _390 = _384 * 6.283185482025146484375;
        float _392 = sin(_390);
        float _394 = _388 + (-1.0);
        float _396 = _394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = fma(_392, _378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _400 = fma(_304, _388, _396);
        float _402 = _380 * _398;
        float _404 = fma(_264, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _406 = fma(_256, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _310 = _400;
        _364 = _404;
        _370 = _406;
        _322 = _384;
        _290 = _380;
    }
    float _408 = _310;
    float _410 = _364;
    float _412 = _370;
    float _414 = _322;
    float _416 = _290;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _410 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _428 = _412 + _426;
    float _430 = _408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _432 = _420 * _420;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _430);
    float _436 = fma(_424, _424, _432);
    float _438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _440 = fma(_428, _428, _436);
    float _442 = rsqrt(_440);
    float _444 = sqrt(_440);
    float _446 = _442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _424 * _446;
    float _450 = _428 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _442;
    float _468 = _456;
    float _470 = _464;
    float _472 = _414;
    float _474 = _416;
    float _476 = _446;
    if (_460)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _478;
    }
    float _480 = _466;
    if (_460)
    {
        float _482 = rsqrt(_456);
        _468 = _482;
    }
    float _484 = _468;
    float _486 = _484;
    if (_460)
    {
        float _488 = _464 * _480;
        _470 = _488;
    }
    float _490 = _470;
    if (_460)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _472 = _492;
    }
    float _494 = _472;
    float _496 = _480;
    float _498 = _494;
    if (_460)
    {
        float _500 = _494 * 6.283185482025146484375;
        float _502 = sin(_500);
        _496 = _502;
    }
    float _504 = _496;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _428;
    if (_460)
    {
        float _512 = _494 * 6.283185482025146484375;
        float _514 = cos(_512);
        _510 = _514;
    }
    float _516 = _510;
    float _518 = -_446;
    float _520 = -_508;
    float _522 = fma(_420, _518, _520);
    if (_460)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _276 = _524;
    }
    float _526 = _276;
    float _528 = _526;
    if (!_460)
    {
        _498 = _452;
    }
    float _530 = _498;
    float _532 = _408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _534 = fma(_242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _536 = _504;
    float _538 = _530;
    if (_460)
    {
        float _540 = fma(_504, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _474 = _540;
    }
    float _542 = _474;
    float _544 = _542;
    if (!_460)
    {
        _536 = _448;
    }
    float _546 = _536;
    float _548 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _532);
    float _550 = floor(_534);
    float _552 = _546;
    float _554 = _516;
    if (_460)
    {
        float _556 = _516 + (-1.0);
        _528 = _556;
    }
    float _558 = _528;
    float _560 = 0.0;
    if (_460)
    {
        float _562 = _484 * _542;
        _560 = _562;
    }
    float _564 = _560;
    if (!_460)
    {
        _544 = _522;
    }
    float _566 = _544;
    float _568 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _548);
    float _570 = _566;
    if (_460)
    {
        float _572 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _572;
    }
    float _574 = _476;
    if (_460)
    {
        float _576 = _448 * _564;
        _552 = _576;
    }
    float _578 = _552;
    if (!_460)
    {
        _486 = _450;
    }
    float _580 = _486;
    float _582 = _580;
    if (_460)
    {
        float _584 = _450 * _564;
        _582 = _584;
    }
    float _586 = _582;
    if (_460)
    {
        float _588 = fma(_522, _516, _574);
        _570 = _588;
    }
    float _590 = _570;
    if (_460)
    {
        float _592 = _578 * _578;
        _538 = _592;
    }
    float _594 = _538;
    float _596 = _408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_460)
    {
        _554 = _454;
    }
    float _598 = _554;
    float _600 = _598;
    if (_460)
    {
        float _602 = _586 * _586;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_590, _590, _594);
    float _608 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _610 = _408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _614 = _606 + _604;
    float _616 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _618 = _568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _622 = floor(_608);
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _626 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[23].w, _624);
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _616);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = rsqrt(_614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _434);
    float _646 = _632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = -_550;
    float _652 = _534 + _650;
    float _654 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = -_646;
    float _658 = fma(_656, _438, 1.0);
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _662 = abs(_636);
    float _664 = log2(_662);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    float _670 = _642 * _578;
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _642 * _590;
    float _676 = _642 * _586;
    float _678 = _670 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _680 = log2(_658);
    float _682 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _668);
    float _684 = -_678;
    float _686 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _690 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _682);
    float _692 = -_676;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _696 = 1.0 / _672;
    float _698 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_694, -0.5, 0.5);
    float _702 = fma(_694, 0.5, 0.5);
    float _704 = -_622;
    float _706 = _608 + _704;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _674 + 1.0;
    float _712 = exp2(_688);
    float _714 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = _680 * 0.693147182464599609375;
    float _720 = fma(_702, _714, -0.212114393711090087890625);
    float _722 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _724 = sqrt(_700);
    float _726 = fma(_702, _720, 1.570728778839111328125);
    float _728 = _690 * _696;
    float2 _2896 = float2(_652, _706);
    float _730 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2896, float2(0.0), isnan(_2896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2896, float2(0.0), isnan(_2896)), level(0.0)).x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = fma(_728, 0.5, 0.5);
    float _736 = -_674;
    float _738 = fma(_712, _710, _736);
    float _740 = _722 * _696;
    float _742 = fma(_738, 0.5, 0.5);
    float _744 = fma(_740, -0.5, 0.5);
    float _746 = _724 * 0.636619746685028076171875;
    float3 _2929 = float3(_734, _744, _732);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2929, float3(0.0), isnan(_2929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2929, float3(0.0), isnan(_2929)), level(0.0)).x;
    float3 _2940 = float3(_734, _744, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2940, float3(0.0), isnan(_2940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2940, float3(0.0), isnan(_2940)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float _761 = -_726;
    float _763 = fma(_746, _761, 1.0);
    float2 _2961 = float2(_763, _742);
    float3 _767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2961, float2(0.0), isnan(_2961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2961, float2(0.0), isnan(_2961)), level(0.0)).xyz;
    float _769 = _767.x;
    float _771 = _767.y;
    float _773 = _767.z;
    float _775 = in.m_57.w;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _779 = in.m_59.y;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    float _785 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_57.z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _791 = in.m_59.x;
    out.m_61.x = _410;
    out.m_61.y = _408;
    out.m_61.z = _412;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _795 = _188 > 0.5;
    bool _797 = _775 > 0.5;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _801 = -_779;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _813 = _797 ? as_type<int>(_803) : as_type<int>(_779);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _817 = _777;
    float _819 = _779;
    float _821 = _787;
    float _823 = _672;
    float _825 = _722;
    if (_783)
    {
        float _827 = in.m_57.x;
        _815 = _827;
    }
    float _829 = _815;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _833 = _831 != 0;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _837 = _795 ? _803 : _779;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _841 = _787 > 0.5;
    float _843 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _849 = _847 != 0;
    float _851 = _188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = _833 ? _837 : _779;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _857 = _841 ? as_type<int>(_803) : as_type<int>(_779);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_63.x = _839;
    out.m_63.y = _843;
    out.m_63.z = _845;
    out.m_63.w = _835;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_851, -2.0, _855);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    float _871 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _837;
    bool _875 = _869;
    int _877 = as_type<int>(_839);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[78].w);
    if (!_783)
    {
        _873 = _791;
    }
    float _881 = _873;
    float _883 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _863 ? as_type<float>(_857) : _779;
    float _887 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _889 = _869 ? _813 : as_type<int>(_779);
    float _891 = 0.0;
    float _893 = _881;
    int _895 = _889;
    if (_849)
    {
        float _897 = in.m_57.z;
        _891 = _897;
    }
    float _899 = _891;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _915 = _913 != 0;
    float _917 = _777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _919 = _915;
    int _921 = as_type<int>(_899);
    if (_783)
    {
        bool _923 = _829 > 0.5;
        _875 = _923;
    }
    bool _925 = _875;
    float _927 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _929 = in.m_65.x;
    float _931 = in.m_65.y;
    float _933 = in.m_65.z;
    float _935 = in.m_65.w;
    if (!_783)
    {
        _817 = _881;
    }
    float _937 = _817;
    float _939 = fma(_917, _853, -0.5);
    float _941 = _937;
    float _943 = _939;
    if (_783)
    {
        _893 = _791;
    }
    float _945 = _893;
    out.m_67.x = _871;
    out.m_67.y = _883;
    out.m_67.z = _887;
    float _947 = _915 ? as_type<float>(_857) : _779;
    float _949 = _793 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _951 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _927);
    float _953 = _945;
    if (_783)
    {
        float _955 = -_945;
        float _957 = _955 + 1.0;
        _877 = as_type<int>(_957);
    }
    int _959 = _877;
    float _961 = _905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_909)
    {
        float _963 = -_945;
        float _965 = _963 + 1.0;
        _879 = as_type<int>(_965);
    }
    int _967 = _879;
    out.m_69.y = _779;
    float _969 = fma(_961, as_type<float>(_889), -0.5);
    if (_783)
    {
        float _971 = _925 ? as_type<float>(_959) : _945;
        _941 = _971;
    }
    float _973 = _941;
    if (_903)
    {
        float _975 = -_945;
        float _977 = _975 + 1.0;
        _895 = as_type<int>(_977);
    }
    int _979 = _895;
    float _981 = _789 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _983 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _865);
    bool _985 = _178 != 0.0;
    bool _987 = isnan(_178);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _997 = fma(_981, _885, -0.5);
    float _999 = fma(_949, _947, -0.5);
    float _1001 = -_983;
    float _1003 = fma(_951, _939, _1001);
    bool _1005 = _176 == 0.0;
    bool _1007 = !_993;
    bool _1009 = _1005 && _1007;
    float _1011 = in.m_71.x;
    float _1013 = in.m_71.y;
    float _1015 = in.m_71.z;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1019 = _931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1021 = _180 == 0.0;
    bool _1023 = _1021 && _1009;
    float _1025 = _931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1027 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1017);
    if (_849)
    {
        bool _1029 = _899 > 0.5;
        _919 = _1029;
    }
    bool _1031 = _919;
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1025);
    float _1037 = _1033;
    if (_849)
    {
        float _1039 = -_945;
        float _1041 = _1039 + 1.0;
        _921 = as_type<int>(_1041);
    }
    int _1043 = _921;
    float _1045 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1027);
    float _1047 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1049 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1051 = _1045;
    if (!_849)
    {
        _819 = _945;
    }
    float _1053 = _819;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1057 = _1053;
    if (!_903)
    {
        _1037 = _945;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (!_909)
    {
        _943 = _945;
    }
    float _1063 = _943;
    out.m_73.x = _1045;
    out.m_73.y = _1047;
    out.m_73.z = _1049;
    float _1065 = _1063;
    if (_849)
    {
        float _1067 = _1031 ? as_type<float>(_1043) : _945;
        _1057 = _1067;
    }
    float _1069 = _1057;
    if (_903)
    {
        float _1071 = _795 ? as_type<float>(_979) : _945;
        _1061 = _1071;
    }
    float _1073 = _1061;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_909)
    {
        float _1077 = _795 ? as_type<float>(_967) : _945;
        _1065 = _1077;
    }
    float _1079 = _1065;
    float _1081 = _1011;
    if (_1023)
    {
        _953 = _1011;
    }
    float _1083 = _953;
    bool _1085 = _348 != 2;
    float _1087 = _1083;
    if (_1023)
    {
        _360 = _1083;
    }
    float _1089 = _360;
    float _1091 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1093 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1095 = _1089;
    if (!_1023)
    {
        _1087 = _1011;
    }
    float _1097 = _1087;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1023)
    {
        _1081 = _1015;
    }
    float _1101 = _1081;
    float _1103 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1091);
    float _1105 = _1101;
    if (_1023)
    {
        _1051 = _1013;
    }
    float _1107 = _1051;
    float _1109 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1093);
    float _1111 = _1107;
    if (!_1023)
    {
        float _1113 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1015);
        _1105 = _1113;
    }
    float _1115 = _1105;
    bool _1117 = _350 != 1;
    if (!_1023)
    {
        float _1119 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1013);
        _1111 = _1119;
    }
    float _1121 = _1111;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1125 = _933 * _1097;
    float _1127 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1129 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1109);
    if (!_1023)
    {
        float _1131 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1097);
        _1095 = _1131;
    }
    float _1133 = _1095;
    float _1135 = _931 * _1015;
    float _1137 = -_1125;
    float _1139 = fma(_929, _1015, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _929 * _1013;
    float _1147 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1151 = -_1135;
    float _1153 = fma(_933, _1013, _1151);
    float _1155 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1159 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1161 = -_1145;
    float _1163 = fma(_931, _1097, _1161);
    float _1165 = fma(_1099, _1069, -0.5);
    float _1167 = 1.0 / _1147;
    float _1169 = fma(_1149, _1073, -0.5);
    float _1171 = -_1157;
    float _1173 = fma(_1159, 2.0, _1171);
    float _1175 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[93].z, _995);
    float _1185 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1189 = _354 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1191 = fma(_1177, _973, -0.5);
    float _1193 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1155);
    float _1195 = -_152;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1199 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1179);
    float _1201 = _356 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1203 = _1185 + _1147;
    float _1205 = -_1187;
    float _1207 = fma(_1189, 2.0, _1205);
    float _1209 = fma(_1193, _1191, _1197);
    float _1211 = _1203 * _1167;
    float _1213 = _1211 * 0.5;
    float _1215 = fma(_1175, _1079, -0.5);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1219 = fma(_1201, -2.0, _1181);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1227 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1183);
    float _1229 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1219);
    float _1231 = -_152;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1207);
    float _1235 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1237 = 1.0 / _1223;
    float _1239 = -_1229;
    float _1241 = fma(_1225, _999, _1239);
    float _1243 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1245 = fma(_1227, _1215, _1233);
    float _1247 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1227;
    float _1251 = _1247;
    float _1253 = _1217;
    if (!_1117)
    {
        _1249 = _188;
    }
    float _1255 = _1249;
    float _1257 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1243);
    float _1259 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1235);
    float _1261 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1263 = _1255;
    if (!_1117)
    {
        _1251 = _1255;
    }
    float _1265 = _1251;
    float _1267 = _1139 * _935;
    float _1269 = _1265;
    if (_1117)
    {
        _1263 = _352;
    }
    float _1271 = _1263;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1275 = _1153 * _935;
    float _1277 = _1163 * _935;
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1273);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1283 = _1237 * _1281;
    float _1285 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1217);
    if (_1085)
    {
        _1253 = _352;
    }
    float _1287 = _1253;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1291 = abs(_1283);
    float _1293 = log2(_1291);
    float _1295 = _1287;
    if (!_1085)
    {
        _1295 = _787;
    }
    float _1297 = _1295;
    float _1299 = _1245 + 0.5;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1303 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1289);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1307 = _1241 + 0.5;
    float _1309 = _1305;
    if (_1117)
    {
        _1269 = _352;
    }
    float _1311 = _1269;
    float _1313 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1303);
    float _1315 = -_1301;
    float _1317 = fma(_1305, 2.0, _1315);
    if (!_1117)
    {
        _1309 = _787;
    }
    float _1319 = _1309;
    out.m_75.x = _1299;
    out.m_75.y = _1307;
    float _1321 = _1319;
    if (_1117)
    {
        _821 = _188;
    }
    float _1323 = _821;
    float _1325 = -_152;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1317);
    if (_1117)
    {
        _1321 = _188;
    }
    float _1329 = _1321;
    float _1331 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1085)
    {
        _292 = _352;
    }
    float _1333 = _292;
    float _1335 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1339 = fma(_1313, _1169, _1327);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1343 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1345 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1335);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1341);
    float _1349 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1351 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1353 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1343);
    float _1355 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1347);
    float _1357 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1351);
    float _1359 = exp2(_1349);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1367 = -_1361;
    float _1369 = fma(_1331, 2.0, _1367);
    float _1371 = fma(_1337, -2.0, _1363);
    float _1373 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1279);
    float _1375 = -_152;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1379 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1371);
    float _1381 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = exp2(_785);
    float _1385 = fma(_1373, _1165, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1355, _969, _1387);
    float _1391 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1395 = precise::clamp(_1393, 0.0, 1.0);
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1399 = _1283 <= 8000.0;
    bool _1401 = isnan(_1283);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(8000.0);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1413 = fma(_1395, -2.0, 3.0);
    float _1415 = _1395 * _1395;
    float _1417 = fma(_1381, -2.0, _1397);
    float _1419 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    float _1421 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1285);
    float _1423 = _1415 * _1413;
    float _1425 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1345);
    float _1427 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1429 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1357);
    float _1431 = -_1423;
    float _1433 = _1431 + 1.0;
    float _1435 = in.m_77.x;
    float _1437 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1417);
    float _1439 = _1003 + 0.5;
    float _1441 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1423);
    float _1443 = _1209 + 0.5;
    float _1445 = _1385 + 0.5;
    float _1447 = _1389 + 0.5;
    out.m_79.x = _1425;
    out.m_79.y = _1365;
    out.m_79.z = _1429;
    float _1449 = _1409 * _1441;
    float _1451 = -_1383;
    float _1453 = _1451 + 1.0;
    float _1455 = -_730;
    float _1457 = _1455 + 1.0;
    out.m_81.x = _1443;
    out.m_81.y = _1439;
    out.m_81.z = _1445;
    out.m_81.w = _1447;
    float _1459 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = -_1437;
    float _1465 = fma(_1421, _997, _1463);
    out.gl_Position.x = _690;
    out.gl_Position.y = _722;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _672;
    float _1467 = _1457 * _1459;
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = _1339 + 0.5;
    float _1473 = _1461 * _748;
    float _1475 = _1427 + _672;
    float _1477 = _690 + _672;
    float _1479 = _672 * 0.5;
    float _1481 = -_1461;
    float _1483 = _1481 + 1.0;
    float _1485 = _1465 + 0.5;
    float _1487 = _1475 * 0.5;
    float _1489 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1259);
    float _1491 = _773 * _1473;
    float _1493 = _759 * _1473;
    float _1495 = _1477 * 0.5;
    float _1497 = fma(_722, -0.5, _1479);
    float _1499 = -_1469;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1503 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1505 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1507 = _1501 * _1435;
    float _1509 = fma(_769, _1493, _753);
    float _1511 = fma(_771, _1493, _755);
    float _1513 = _759 * _1483;
    float _1515 = _1507 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1517 = fma(_759, _1491, _757);
    out.m_83.x = _1471;
    out.m_83.y = _1485;
    bool _1519 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_444);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_85.z = _1487;
    out.m_85.w = _672;
    out.m_87.x = _1515;
    out.m_89.x = _1509;
    out.m_89.y = _1511;
    out.m_89.z = _1517;
    out.m_89.w = _1513;
    float _1529 = _1427;
    float _1531 = _1493;
    float _1533 = _1497;
    float _1535 = _1495;
    if (!_1527)
    {
        _823 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _823;
    out.m_91.x = _1503;
    out.m_91.y = _1489;
    out.m_91.z = _1505;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1527)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1527)
    {
        _825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _825;
    out.m_93.x = _1495;
    out.m_93.y = _1497;
    out.m_93.z = _1487;
    out.m_93.w = _672;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1527)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1531;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1527)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1533;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1527)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1535;
    bool _1569 = !_1527;
    float _1571 = _1567;
    float _1573 = _1567;
    if (!_1569)
    {
        bool _1575 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1577 = isnan(_444);
        bool _1579 = _1575 || _1577;
        bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1583 = _1579 || _1581;
        if (!_1583)
        {
            float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1587 = _444 + _1585;
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1597 = 1.0 / _1591;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1615 = _1587 * _1597;
            float _1617 = precise::clamp(_1615, 0.0, 1.0);
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1623 = fma(_1617, _1595, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1617, _1621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1627 = fma(_1617, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1617, _1605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1631 = fma(_1617, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1633 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1573 = _1627;
            _1553 = _1631;
            _1565 = _1623;
            _1547 = _1629;
            _1541 = _1625;
            _1559 = _1633;
            _1635 = true;
        }
        else
        {
            bool _1637 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1639 = isnan(_444);
            bool _1641 = _1637 || _1639;
            bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1645 = _1641 || _1643;
            if (!_1645)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1647 = _1563;
            _1565 = _1647;
            if (!_1645)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1649 = _1571;
            _1573 = _1649;
            if (!_1645)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1651 = _1539;
            _1541 = _1651;
            if (!_1645)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1653 = _1545;
            _1547 = _1653;
            if (!_1645)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1655 = _1551;
            _1553 = _1655;
            if (!_1645)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1657 = _1557;
            bool _1659 = !_1645;
            _1559 = _1657;
            if (!_1659)
            {
                bool _1661 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1663 = isnan(_444);
                bool _1665 = _1661 || _1663;
                bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1669 = _1665 || _1667;
                if (!_1669)
                {
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1673 = _444 + _1671;
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = 1.0 / _1677;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1701 = _1673 * _1683;
                    float _1703 = precise::clamp(_1701, 0.0, 1.0);
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = fma(_1703, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1711 = fma(_1703, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1713 = fma(_1703, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1703, _1691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1717 = fma(_1703, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1719 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1573 = _1713;
                    _1553 = _1717;
                    _1565 = _1709;
                    _1547 = _1715;
                    _1541 = _1711;
                    _1559 = _1719;
                    _1635 = true;
                }
                else
                {
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1635 = false;
    float _1721 = _1573;
    float _1723 = _1553;
    float _1725 = _1565;
    float _1727 = _1547;
    float _1729 = _1541;
    float _1731 = _1559;
    float _1733 = fma(_1489, -0.5, 0.5);
    float _1735 = precise::clamp(_1733, 0.0, 1.0);
    float _1737 = -_1721;
    float _1739 = _1737 + _1723;
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    bool _1749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1751 = fma(_1735, _1739, _1721);
    float _1753 = fma(_1735, _1743, _1725);
    float _1755 = fma(_1735, _1747, _1729);
    float _1757 = _1751 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1759 = fma(_1753, 0.298911988735198974609375, _1757);
    float _1761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1755, 0.114477999508380889892578125, _1759);
    out.m_49.x = _1761;
    float _1765 = -_1763;
    float _1767 = _1753 + _1765;
    float _1769 = -_1763;
    float _1771 = _1751 + _1769;
    float _1773 = -_1763;
    float _1775 = _1755 + _1773;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1779 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    out.m_97.x = _1777;
    out.m_97.y = _1779;
    out.m_97.z = _1781;
    if (!_1749)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1783 = -_408;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1787 = -_410;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1791 = -_412;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1795 = _1785 * _1785;
    float _1797 = fma(_1789, _1789, _1795);
    float _1799 = fma(_1793, _1793, _1797);
    float _1801 = sqrt(_1799);
    float _1803 = rsqrt(_1799);
    float _1805 = -_1801;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1809 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1789 * _1803;
    float _1815 = _1785 * _1803;
    float _1817 = abs(_1811);
    float _1819 = log2(_1817);
    float _1821 = _1793 * _1803;
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1825 = _1489 * _1815;
    float _1827 = -_1815;
    float _1829 = -_1823;
    float _1831 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1829);
    float _1833 = fma(_1503, _1813, _1825);
    float _1835 = -_1821;
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1831);
    float _1839 = fma(_1505, _1821, _1833);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1845 = _1837 + _1843;
    float _1847 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1849 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = exp2(_1847);
    float _1855 = _1853 * _1851;
    float _1857 = _1841 * _1855;
    float _1859 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1859;
    out.m_95.y = _1861;
    out.m_95.z = _1863;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1635 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_134);
        out.gl_Position.z = _1922;
    }
    if (!_120)
    {
        return out;
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1990 = as_type<float>(_168);
        out.gl_Position.z = _1990;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = in.m_57.y;
    float _190 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _202 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = _196 * _198;
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _208 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    float _212 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _214 = _206 * _208;
    float _216 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _218 = _210 * _200;
    float _220 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _212);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _224 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _216);
    float _226 = _214 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _228 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _222);
    float _232 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _224);
    float _234 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _232 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _244 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _246 = _228 + _236;
    float _248 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _214 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _252 = _242 + _244;
    float _254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _256 = _246 + _254;
    float _258 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _250);
    float _262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _264 = _252 + _262;
    float _266 = _256 * _256;
    float _268 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _270 = 0.0;
    float _272 = _182;
    float _274 = _186;
    float _276 = _252;
    if (_240)
    {
        float _278 = in.m_57.x;
        _270 = _278;
    }
    float _280 = _270;
    float _282 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _260);
    float _284 = fma(_264, _264, _266);
    float _286 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _188;
    if (_240)
    {
        _288 = _188;
    }
    float _294 = _288;
    float _296 = sqrt(_284);
    int _298 = 0;
    float _300 = _294;
    if (_240)
    {
        _298 = 0;
    }
    int _302 = _298;
    float _304 = _286 + _282;
    int _306 = 0;
    int _308 = _302;
    float _310 = _304;
    if (_240)
    {
        _306 = 0;
    }
    int _312 = _306;
    bool _314 = _296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _316 = 0.0;
    int _318 = _312;
    float _320 = _280;
    float _322 = _296;
    if (_240)
    {
        _316 = _280;
    }
    float _324 = _316;
    float _326 = _324;
    if (!_240)
    {
        float _328 = in.m_57.x;
        float _330 = _188 * 3.1415927410125732421875;
        float _332 = _330 * 0.15915493667125701904296875;
        float _334 = _332 * 6.283185482025146484375;
        float _336 = sin(_334);
        float _338 = _328 * 3.1415927410125732421875;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = sin(_342);
        _272 = _340;
        _318 = 2;
        _308 = 1;
        _320 = _328;
        _326 = _344;
        _300 = _336;
    }
    float _346 = _272;
    int _348 = _318;
    int _350 = _308;
    float _352 = _320;
    float _354 = _326;
    float _356 = _300;
    float _358 = _346;
    float _360 = as_type<float>(_348);
    if (!_314)
    {
        _358 = _252;
    }
    float _362 = _358;
    float _364 = _362;
    if (!_314)
    {
        _274 = _246;
    }
    float _366 = _274;
    bool _368 = !_314;
    float _370 = _366;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _376 = _296 + _374;
        float _378 = _304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = rsqrt(_284);
        float _382 = _376 * _372;
        float _384 = _382 * 0.15915493667125701904296875;
        float _386 = _384 * 6.283185482025146484375;
        float _388 = cos(_386);
        float _390 = _384 * 6.283185482025146484375;
        float _392 = sin(_390);
        float _394 = _388 + (-1.0);
        float _396 = _394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = fma(_392, _378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _400 = fma(_304, _388, _396);
        float _402 = _380 * _398;
        float _404 = fma(_264, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _406 = fma(_256, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _310 = _400;
        _364 = _404;
        _370 = _406;
        _322 = _384;
        _290 = _380;
    }
    float _408 = _310;
    float _410 = _364;
    float _412 = _370;
    float _414 = _322;
    float _416 = _290;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _410 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _428 = _412 + _426;
    float _430 = _408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _432 = _420 * _420;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _430);
    float _436 = fma(_424, _424, _432);
    float _438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _440 = fma(_428, _428, _436);
    float _442 = rsqrt(_440);
    float _444 = sqrt(_440);
    float _446 = _442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _424 * _446;
    float _450 = _428 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _442;
    float _468 = _456;
    float _470 = _464;
    float _472 = _414;
    float _474 = _416;
    float _476 = _446;
    if (_460)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _478;
    }
    float _480 = _466;
    if (_460)
    {
        float _482 = rsqrt(_456);
        _468 = _482;
    }
    float _484 = _468;
    float _486 = _484;
    if (_460)
    {
        float _488 = _464 * _480;
        _470 = _488;
    }
    float _490 = _470;
    if (_460)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _472 = _492;
    }
    float _494 = _472;
    float _496 = _480;
    float _498 = _494;
    if (_460)
    {
        float _500 = _494 * 6.283185482025146484375;
        float _502 = sin(_500);
        _496 = _502;
    }
    float _504 = _496;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _428;
    if (_460)
    {
        float _512 = _494 * 6.283185482025146484375;
        float _514 = cos(_512);
        _510 = _514;
    }
    float _516 = _510;
    float _518 = -_446;
    float _520 = -_508;
    float _522 = fma(_420, _518, _520);
    if (_460)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _276 = _524;
    }
    float _526 = _276;
    float _528 = _526;
    if (!_460)
    {
        _498 = _452;
    }
    float _530 = _498;
    float _532 = _408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _534 = fma(_242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _536 = _504;
    float _538 = _530;
    if (_460)
    {
        float _540 = fma(_504, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _474 = _540;
    }
    float _542 = _474;
    float _544 = _542;
    if (!_460)
    {
        _536 = _448;
    }
    float _546 = _536;
    float _548 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _532);
    float _550 = floor(_534);
    float _552 = _546;
    float _554 = _516;
    if (_460)
    {
        float _556 = _516 + (-1.0);
        _528 = _556;
    }
    float _558 = _528;
    float _560 = 0.0;
    if (_460)
    {
        float _562 = _484 * _542;
        _560 = _562;
    }
    float _564 = _560;
    if (!_460)
    {
        _544 = _522;
    }
    float _566 = _544;
    float _568 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _548);
    float _570 = _566;
    if (_460)
    {
        float _572 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _572;
    }
    float _574 = _476;
    if (_460)
    {
        float _576 = _448 * _564;
        _552 = _576;
    }
    float _578 = _552;
    if (!_460)
    {
        _486 = _450;
    }
    float _580 = _486;
    float _582 = _580;
    if (_460)
    {
        float _584 = _450 * _564;
        _582 = _584;
    }
    float _586 = _582;
    if (_460)
    {
        float _588 = fma(_522, _516, _574);
        _570 = _588;
    }
    float _590 = _570;
    if (_460)
    {
        float _592 = _578 * _578;
        _538 = _592;
    }
    float _594 = _538;
    float _596 = _408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_460)
    {
        _554 = _454;
    }
    float _598 = _554;
    float _600 = _598;
    if (_460)
    {
        float _602 = _586 * _586;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_590, _590, _594);
    float _608 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _610 = _408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _614 = _606 + _604;
    float _616 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _618 = _568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _622 = floor(_608);
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _626 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[23].w, _624);
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _616);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = rsqrt(_614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _434);
    float _646 = _632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = -_550;
    float _652 = _534 + _650;
    float _654 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = -_646;
    float _658 = fma(_656, _438, 1.0);
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _662 = abs(_636);
    float _664 = log2(_662);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    float _670 = _642 * _578;
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _642 * _590;
    float _676 = _642 * _586;
    float _678 = _670 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _680 = log2(_658);
    float _682 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _668);
    float _684 = -_678;
    float _686 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _690 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _682);
    float _692 = -_676;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _696 = 1.0 / _672;
    float _698 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_694, -0.5, 0.5);
    float _702 = fma(_694, 0.5, 0.5);
    float _704 = -_622;
    float _706 = _608 + _704;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _674 + 1.0;
    float _712 = exp2(_688);
    float _714 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = _680 * 0.693147182464599609375;
    float _720 = fma(_702, _714, -0.212114393711090087890625);
    float _722 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _724 = sqrt(_700);
    float _726 = fma(_702, _720, 1.570728778839111328125);
    float _728 = _690 * _696;
    float2 _2896 = float2(_652, _706);
    float _730 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2896, float2(0.0), isnan(_2896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2896, float2(0.0), isnan(_2896)), level(0.0)).x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = fma(_728, 0.5, 0.5);
    float _736 = -_674;
    float _738 = fma(_712, _710, _736);
    float _740 = _722 * _696;
    float _742 = fma(_738, 0.5, 0.5);
    float _744 = fma(_740, -0.5, 0.5);
    float _746 = _724 * 0.636619746685028076171875;
    float3 _2929 = float3(_734, _744, _732);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2929, float3(0.0), isnan(_2929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2929, float3(0.0), isnan(_2929)), level(0.0)).x;
    float3 _2940 = float3(_734, _744, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2940, float3(0.0), isnan(_2940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2940, float3(0.0), isnan(_2940)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float _761 = -_726;
    float _763 = fma(_746, _761, 1.0);
    float2 _2961 = float2(_763, _742);
    float3 _767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2961, float2(0.0), isnan(_2961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2961, float2(0.0), isnan(_2961)), level(0.0)).xyz;
    float _769 = _767.x;
    float _771 = _767.y;
    float _773 = _767.z;
    float _775 = in.m_57.w;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _779 = in.m_59.y;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    float _785 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_57.z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _791 = in.m_59.x;
    out.m_61.x = _410;
    out.m_61.y = _408;
    out.m_61.z = _412;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _795 = _188 > 0.5;
    bool _797 = _775 > 0.5;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _801 = -_779;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _813 = _797 ? as_type<int>(_803) : as_type<int>(_779);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _817 = _777;
    float _819 = _779;
    float _821 = _787;
    float _823 = _672;
    float _825 = _722;
    if (_783)
    {
        float _827 = in.m_57.x;
        _815 = _827;
    }
    float _829 = _815;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _833 = _831 != 0;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _837 = _795 ? _803 : _779;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _841 = _787 > 0.5;
    float _843 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _849 = _847 != 0;
    float _851 = _188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = _833 ? _837 : _779;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _857 = _841 ? as_type<int>(_803) : as_type<int>(_779);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_63.x = _839;
    out.m_63.y = _843;
    out.m_63.z = _845;
    out.m_63.w = _835;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_851, -2.0, _855);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    float _871 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _837;
    bool _875 = _869;
    int _877 = as_type<int>(_839);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[78].w);
    if (!_783)
    {
        _873 = _791;
    }
    float _881 = _873;
    float _883 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _863 ? as_type<float>(_857) : _779;
    float _887 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _889 = _869 ? _813 : as_type<int>(_779);
    float _891 = 0.0;
    float _893 = _881;
    int _895 = _889;
    if (_849)
    {
        float _897 = in.m_57.z;
        _891 = _897;
    }
    float _899 = _891;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _915 = _913 != 0;
    float _917 = _777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _919 = _915;
    int _921 = as_type<int>(_899);
    if (_783)
    {
        bool _923 = _829 > 0.5;
        _875 = _923;
    }
    bool _925 = _875;
    float _927 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _929 = in.m_65.x;
    float _931 = in.m_65.y;
    float _933 = in.m_65.z;
    float _935 = in.m_65.w;
    if (!_783)
    {
        _817 = _881;
    }
    float _937 = _817;
    float _939 = fma(_917, _853, -0.5);
    float _941 = _937;
    float _943 = _939;
    if (_783)
    {
        _893 = _791;
    }
    float _945 = _893;
    out.m_67.x = _871;
    out.m_67.y = _883;
    out.m_67.z = _887;
    float _947 = _915 ? as_type<float>(_857) : _779;
    float _949 = _793 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _951 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _927);
    float _953 = _945;
    if (_783)
    {
        float _955 = -_945;
        float _957 = _955 + 1.0;
        _877 = as_type<int>(_957);
    }
    int _959 = _877;
    float _961 = _905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_909)
    {
        float _963 = -_945;
        float _965 = _963 + 1.0;
        _879 = as_type<int>(_965);
    }
    int _967 = _879;
    out.m_69.y = _779;
    float _969 = fma(_961, as_type<float>(_889), -0.5);
    if (_783)
    {
        float _971 = _925 ? as_type<float>(_959) : _945;
        _941 = _971;
    }
    float _973 = _941;
    if (_903)
    {
        float _975 = -_945;
        float _977 = _975 + 1.0;
        _895 = as_type<int>(_977);
    }
    int _979 = _895;
    float _981 = _789 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _983 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _865);
    bool _985 = _178 != 0.0;
    bool _987 = isnan(_178);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _997 = fma(_981, _885, -0.5);
    float _999 = fma(_949, _947, -0.5);
    float _1001 = -_983;
    float _1003 = fma(_951, _939, _1001);
    bool _1005 = _176 == 0.0;
    bool _1007 = !_993;
    bool _1009 = _1005 && _1007;
    float _1011 = in.m_71.x;
    float _1013 = in.m_71.y;
    float _1015 = in.m_71.z;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1019 = _931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1021 = _180 == 0.0;
    bool _1023 = _1021 && _1009;
    float _1025 = _931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1027 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1017);
    if (_849)
    {
        bool _1029 = _899 > 0.5;
        _919 = _1029;
    }
    bool _1031 = _919;
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1025);
    float _1037 = _1033;
    if (_849)
    {
        float _1039 = -_945;
        float _1041 = _1039 + 1.0;
        _921 = as_type<int>(_1041);
    }
    int _1043 = _921;
    float _1045 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1027);
    float _1047 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1049 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1051 = _1045;
    if (!_849)
    {
        _819 = _945;
    }
    float _1053 = _819;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1057 = _1053;
    if (!_903)
    {
        _1037 = _945;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (!_909)
    {
        _943 = _945;
    }
    float _1063 = _943;
    out.m_73.x = _1045;
    out.m_73.y = _1047;
    out.m_73.z = _1049;
    float _1065 = _1063;
    if (_849)
    {
        float _1067 = _1031 ? as_type<float>(_1043) : _945;
        _1057 = _1067;
    }
    float _1069 = _1057;
    if (_903)
    {
        float _1071 = _795 ? as_type<float>(_979) : _945;
        _1061 = _1071;
    }
    float _1073 = _1061;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_909)
    {
        float _1077 = _795 ? as_type<float>(_967) : _945;
        _1065 = _1077;
    }
    float _1079 = _1065;
    float _1081 = _1011;
    if (_1023)
    {
        _953 = _1011;
    }
    float _1083 = _953;
    bool _1085 = _348 != 2;
    float _1087 = _1083;
    if (_1023)
    {
        _360 = _1083;
    }
    float _1089 = _360;
    float _1091 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1093 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1095 = _1089;
    if (!_1023)
    {
        _1087 = _1011;
    }
    float _1097 = _1087;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1023)
    {
        _1081 = _1015;
    }
    float _1101 = _1081;
    float _1103 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1091);
    float _1105 = _1101;
    if (_1023)
    {
        _1051 = _1013;
    }
    float _1107 = _1051;
    float _1109 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1093);
    float _1111 = _1107;
    if (!_1023)
    {
        float _1113 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1015);
        _1105 = _1113;
    }
    float _1115 = _1105;
    bool _1117 = _350 != 1;
    if (!_1023)
    {
        float _1119 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1013);
        _1111 = _1119;
    }
    float _1121 = _1111;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1125 = _933 * _1097;
    float _1127 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1129 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1109);
    if (!_1023)
    {
        float _1131 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1097);
        _1095 = _1131;
    }
    float _1133 = _1095;
    float _1135 = _931 * _1015;
    float _1137 = -_1125;
    float _1139 = fma(_929, _1015, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _929 * _1013;
    float _1147 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1151 = -_1135;
    float _1153 = fma(_933, _1013, _1151);
    float _1155 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1159 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1161 = -_1145;
    float _1163 = fma(_931, _1097, _1161);
    float _1165 = fma(_1099, _1069, -0.5);
    float _1167 = 1.0 / _1147;
    float _1169 = fma(_1149, _1073, -0.5);
    float _1171 = -_1157;
    float _1173 = fma(_1159, 2.0, _1171);
    float _1175 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[93].z, _995);
    float _1185 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1189 = _354 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1191 = fma(_1177, _973, -0.5);
    float _1193 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1155);
    float _1195 = -_152;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1199 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1179);
    float _1201 = _356 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1203 = _1185 + _1147;
    float _1205 = -_1187;
    float _1207 = fma(_1189, 2.0, _1205);
    float _1209 = fma(_1193, _1191, _1197);
    float _1211 = _1203 * _1167;
    float _1213 = _1211 * 0.5;
    float _1215 = fma(_1175, _1079, -0.5);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1219 = fma(_1201, -2.0, _1181);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1227 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1183);
    float _1229 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1219);
    float _1231 = -_152;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1207);
    float _1235 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1237 = 1.0 / _1223;
    float _1239 = -_1229;
    float _1241 = fma(_1225, _999, _1239);
    float _1243 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1245 = fma(_1227, _1215, _1233);
    float _1247 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1227;
    float _1251 = _1247;
    float _1253 = _1217;
    if (!_1117)
    {
        _1249 = _188;
    }
    float _1255 = _1249;
    float _1257 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1243);
    float _1259 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1235);
    float _1261 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1263 = _1255;
    if (!_1117)
    {
        _1251 = _1255;
    }
    float _1265 = _1251;
    float _1267 = _1139 * _935;
    float _1269 = _1265;
    if (_1117)
    {
        _1263 = _352;
    }
    float _1271 = _1263;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1275 = _1153 * _935;
    float _1277 = _1163 * _935;
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1273);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1283 = _1237 * _1281;
    float _1285 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1217);
    if (_1085)
    {
        _1253 = _352;
    }
    float _1287 = _1253;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1291 = abs(_1283);
    float _1293 = log2(_1291);
    float _1295 = _1287;
    if (!_1085)
    {
        _1295 = _787;
    }
    float _1297 = _1295;
    float _1299 = _1245 + 0.5;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1303 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1289);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1307 = _1241 + 0.5;
    float _1309 = _1305;
    if (_1117)
    {
        _1269 = _352;
    }
    float _1311 = _1269;
    float _1313 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1303);
    float _1315 = -_1301;
    float _1317 = fma(_1305, 2.0, _1315);
    if (!_1117)
    {
        _1309 = _787;
    }
    float _1319 = _1309;
    out.m_75.x = _1299;
    out.m_75.y = _1307;
    float _1321 = _1319;
    if (_1117)
    {
        _821 = _188;
    }
    float _1323 = _821;
    float _1325 = -_152;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1317);
    if (_1117)
    {
        _1321 = _188;
    }
    float _1329 = _1321;
    float _1331 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1085)
    {
        _292 = _352;
    }
    float _1333 = _292;
    float _1335 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1339 = fma(_1313, _1169, _1327);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1343 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1345 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1335);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1341);
    float _1349 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1351 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1353 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1343);
    float _1355 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1347);
    float _1357 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1351);
    float _1359 = exp2(_1349);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1367 = -_1361;
    float _1369 = fma(_1331, 2.0, _1367);
    float _1371 = fma(_1337, -2.0, _1363);
    float _1373 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1279);
    float _1375 = -_152;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1379 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1371);
    float _1381 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = exp2(_785);
    float _1385 = fma(_1373, _1165, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1355, _969, _1387);
    float _1391 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1395 = precise::clamp(_1393, 0.0, 1.0);
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1399 = _1283 <= 8000.0;
    bool _1401 = isnan(_1283);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(8000.0);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1413 = fma(_1395, -2.0, 3.0);
    float _1415 = _1395 * _1395;
    float _1417 = fma(_1381, -2.0, _1397);
    float _1419 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    float _1421 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1285);
    float _1423 = _1415 * _1413;
    float _1425 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1345);
    float _1427 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1429 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1357);
    float _1431 = -_1423;
    float _1433 = _1431 + 1.0;
    float _1435 = in.m_77.x;
    float _1437 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1417);
    float _1439 = _1003 + 0.5;
    float _1441 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1423);
    float _1443 = _1209 + 0.5;
    float _1445 = _1385 + 0.5;
    float _1447 = _1389 + 0.5;
    out.m_79.x = _1425;
    out.m_79.y = _1365;
    out.m_79.z = _1429;
    float _1449 = _1409 * _1441;
    float _1451 = -_1383;
    float _1453 = _1451 + 1.0;
    float _1455 = -_730;
    float _1457 = _1455 + 1.0;
    out.m_81.x = _1443;
    out.m_81.y = _1439;
    out.m_81.z = _1445;
    out.m_81.w = _1447;
    float _1459 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = -_1437;
    float _1465 = fma(_1421, _997, _1463);
    out.gl_Position.x = _690;
    out.gl_Position.y = _722;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _672;
    float _1467 = _1457 * _1459;
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = _1339 + 0.5;
    float _1473 = _1461 * _748;
    float _1475 = _1427 + _672;
    float _1477 = _690 + _672;
    float _1479 = _672 * 0.5;
    float _1481 = -_1461;
    float _1483 = _1481 + 1.0;
    float _1485 = _1465 + 0.5;
    float _1487 = _1475 * 0.5;
    float _1489 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1259);
    float _1491 = _773 * _1473;
    float _1493 = _759 * _1473;
    float _1495 = _1477 * 0.5;
    float _1497 = fma(_722, -0.5, _1479);
    float _1499 = -_1469;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1503 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1505 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1507 = _1501 * _1435;
    float _1509 = fma(_769, _1493, _753);
    float _1511 = fma(_771, _1493, _755);
    float _1513 = _759 * _1483;
    float _1515 = _1507 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1517 = fma(_759, _1491, _757);
    out.m_83.x = _1471;
    out.m_83.y = _1485;
    bool _1519 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_444);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_85.z = _1487;
    out.m_85.w = _672;
    out.m_87.x = _1515;
    out.m_89.x = _1509;
    out.m_89.y = _1511;
    out.m_89.z = _1517;
    out.m_89.w = _1513;
    float _1529 = _1427;
    float _1531 = _1493;
    float _1533 = _1497;
    float _1535 = _1495;
    if (!_1527)
    {
        _823 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _823;
    out.m_91.x = _1503;
    out.m_91.y = _1489;
    out.m_91.z = _1505;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1527)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1527)
    {
        _825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _825;
    out.m_93.x = _1495;
    out.m_93.y = _1497;
    out.m_93.z = _1487;
    out.m_93.w = _672;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1527)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1531;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1527)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1533;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1527)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1535;
    bool _1569 = !_1527;
    float _1571 = _1567;
    float _1573 = _1567;
    if (!_1569)
    {
        bool _1575 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1577 = isnan(_444);
        bool _1579 = _1575 || _1577;
        bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1583 = _1579 || _1581;
        if (!_1583)
        {
            float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1587 = _444 + _1585;
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1597 = 1.0 / _1591;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1615 = _1587 * _1597;
            float _1617 = precise::clamp(_1615, 0.0, 1.0);
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1623 = fma(_1617, _1595, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1617, _1621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1627 = fma(_1617, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1617, _1605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1631 = fma(_1617, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1633 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1573 = _1627;
            _1553 = _1631;
            _1565 = _1623;
            _1547 = _1629;
            _1541 = _1625;
            _1559 = _1633;
            _1635 = true;
        }
        else
        {
            bool _1637 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1639 = isnan(_444);
            bool _1641 = _1637 || _1639;
            bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1645 = _1641 || _1643;
            if (!_1645)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1647 = _1563;
            _1565 = _1647;
            if (!_1645)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1649 = _1571;
            _1573 = _1649;
            if (!_1645)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1651 = _1539;
            _1541 = _1651;
            if (!_1645)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1653 = _1545;
            _1547 = _1653;
            if (!_1645)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1655 = _1551;
            _1553 = _1655;
            if (!_1645)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1657 = _1557;
            bool _1659 = !_1645;
            _1559 = _1657;
            if (!_1659)
            {
                bool _1661 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1663 = isnan(_444);
                bool _1665 = _1661 || _1663;
                bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1669 = _1665 || _1667;
                if (!_1669)
                {
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1673 = _444 + _1671;
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = 1.0 / _1677;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1701 = _1673 * _1683;
                    float _1703 = precise::clamp(_1701, 0.0, 1.0);
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = fma(_1703, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1711 = fma(_1703, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1713 = fma(_1703, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1703, _1691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1717 = fma(_1703, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1719 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1573 = _1713;
                    _1553 = _1717;
                    _1565 = _1709;
                    _1547 = _1715;
                    _1541 = _1711;
                    _1559 = _1719;
                    _1635 = true;
                }
                else
                {
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1635 = false;
    float _1721 = _1573;
    float _1723 = _1553;
    float _1725 = _1565;
    float _1727 = _1547;
    float _1729 = _1541;
    float _1731 = _1559;
    float _1733 = fma(_1489, -0.5, 0.5);
    float _1735 = precise::clamp(_1733, 0.0, 1.0);
    float _1737 = -_1721;
    float _1739 = _1737 + _1723;
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    bool _1749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1751 = fma(_1735, _1739, _1721);
    float _1753 = fma(_1735, _1743, _1725);
    float _1755 = fma(_1735, _1747, _1729);
    float _1757 = _1751 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1759 = fma(_1753, 0.298911988735198974609375, _1757);
    float _1761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1755, 0.114477999508380889892578125, _1759);
    out.m_49.x = _1761;
    float _1765 = -_1763;
    float _1767 = _1753 + _1765;
    float _1769 = -_1763;
    float _1771 = _1751 + _1769;
    float _1773 = -_1763;
    float _1775 = _1755 + _1773;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1779 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    out.m_97.x = _1777;
    out.m_97.y = _1779;
    out.m_97.z = _1781;
    if (!_1749)
    {
        return out;
    }
    float _1783 = -_408;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1787 = -_410;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1791 = -_412;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1795 = _1785 * _1785;
    float _1797 = fma(_1789, _1789, _1795);
    float _1799 = fma(_1793, _1793, _1797);
    float _1801 = sqrt(_1799);
    float _1803 = rsqrt(_1799);
    float _1805 = -_1801;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1809 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1789 * _1803;
    float _1815 = _1785 * _1803;
    float _1817 = abs(_1811);
    float _1819 = log2(_1817);
    float _1821 = _1793 * _1803;
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1825 = _1489 * _1815;
    float _1827 = -_1815;
    float _1829 = -_1823;
    float _1831 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1829);
    float _1833 = fma(_1503, _1813, _1825);
    float _1835 = -_1821;
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1831);
    float _1839 = fma(_1505, _1821, _1833);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1845 = _1837 + _1843;
    float _1847 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1849 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = exp2(_1847);
    float _1855 = _1853 * _1851;
    float _1857 = _1841 * _1855;
    float _1859 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1859;
    out.m_95.y = _1861;
    out.m_95.z = _1863;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1635 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1922 = as_type<float>(_134);
        out.gl_Position.z = _1922;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1990 = as_type<float>(_168);
        out.gl_Position.z = _1990;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = in.m_57.y;
    float _190 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _192 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _194 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _200 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _202 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = _196 * _198;
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _208 = _192 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    float _212 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _214 = _206 * _208;
    float _216 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _218 = _210 * _200;
    float _220 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _212);
    float _222 = _214 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _224 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _216);
    float _226 = _214 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _228 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _222);
    float _232 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _224);
    float _234 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _226);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[10].z, _230);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _232 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _244 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[8].z, _234);
    float _246 = _228 + _236;
    float _248 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = _214 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _252 = _242 + _244;
    float _254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _256 = _246 + _254;
    float _258 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _260 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _250);
    float _262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _264 = _252 + _262;
    float _266 = _256 * _256;
    float _268 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _270 = 0.0;
    float _272 = _182;
    float _274 = _186;
    float _276 = _252;
    if (_240)
    {
        float _278 = in.m_57.x;
        _270 = _278;
    }
    float _280 = _270;
    float _282 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[9].z, _260);
    float _284 = fma(_264, _264, _266);
    float _286 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _188;
    if (_240)
    {
        _288 = _188;
    }
    float _294 = _288;
    float _296 = sqrt(_284);
    int _298 = 0;
    float _300 = _294;
    if (_240)
    {
        _298 = 0;
    }
    int _302 = _298;
    float _304 = _286 + _282;
    int _306 = 0;
    int _308 = _302;
    float _310 = _304;
    if (_240)
    {
        _306 = 0;
    }
    int _312 = _306;
    bool _314 = _296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _316 = 0.0;
    int _318 = _312;
    float _320 = _280;
    float _322 = _296;
    if (_240)
    {
        _316 = _280;
    }
    float _324 = _316;
    float _326 = _324;
    if (!_240)
    {
        float _328 = in.m_57.x;
        float _330 = _188 * 3.1415927410125732421875;
        float _332 = _330 * 0.15915493667125701904296875;
        float _334 = _332 * 6.283185482025146484375;
        float _336 = sin(_334);
        float _338 = _328 * 3.1415927410125732421875;
        float _340 = _338 * 0.15915493667125701904296875;
        float _342 = _340 * 6.283185482025146484375;
        float _344 = sin(_342);
        _272 = _340;
        _318 = 2;
        _308 = 1;
        _320 = _328;
        _326 = _344;
        _300 = _336;
    }
    float _346 = _272;
    int _348 = _318;
    int _350 = _308;
    float _352 = _320;
    float _354 = _326;
    float _356 = _300;
    float _358 = _346;
    float _360 = as_type<float>(_348);
    if (!_314)
    {
        _358 = _252;
    }
    float _362 = _358;
    float _364 = _362;
    if (!_314)
    {
        _274 = _246;
    }
    float _366 = _274;
    bool _368 = !_314;
    float _370 = _366;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _376 = _296 + _374;
        float _378 = _304 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = rsqrt(_284);
        float _382 = _376 * _372;
        float _384 = _382 * 0.15915493667125701904296875;
        float _386 = _384 * 6.283185482025146484375;
        float _388 = cos(_386);
        float _390 = _384 * 6.283185482025146484375;
        float _392 = sin(_390);
        float _394 = _388 + (-1.0);
        float _396 = _394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = fma(_392, _378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _400 = fma(_304, _388, _396);
        float _402 = _380 * _398;
        float _404 = fma(_264, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _406 = fma(_256, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _310 = _400;
        _364 = _404;
        _370 = _406;
        _322 = _384;
        _290 = _380;
    }
    float _408 = _310;
    float _410 = _364;
    float _412 = _370;
    float _414 = _322;
    float _416 = _290;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _424 = _410 + _422;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _428 = _412 + _426;
    float _430 = _408 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _432 = _420 * _420;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].x, _430);
    float _436 = fma(_424, _424, _432);
    float _438 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _440 = fma(_428, _428, _436);
    float _442 = rsqrt(_440);
    float _444 = sqrt(_440);
    float _446 = _442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _424 * _446;
    float _450 = _428 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _442;
    float _468 = _456;
    float _470 = _464;
    float _472 = _414;
    float _474 = _416;
    float _476 = _446;
    if (_460)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _478;
    }
    float _480 = _466;
    if (_460)
    {
        float _482 = rsqrt(_456);
        _468 = _482;
    }
    float _484 = _468;
    float _486 = _484;
    if (_460)
    {
        float _488 = _464 * _480;
        _470 = _488;
    }
    float _490 = _470;
    if (_460)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _472 = _492;
    }
    float _494 = _472;
    float _496 = _480;
    float _498 = _494;
    if (_460)
    {
        float _500 = _494 * 6.283185482025146484375;
        float _502 = sin(_500);
        _496 = _502;
    }
    float _504 = _496;
    float _506 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _508 = precise::max(0.0, _506);
    float _510 = _428;
    if (_460)
    {
        float _512 = _494 * 6.283185482025146484375;
        float _514 = cos(_512);
        _510 = _514;
    }
    float _516 = _510;
    float _518 = -_446;
    float _520 = -_508;
    float _522 = fma(_420, _518, _520);
    if (_460)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _276 = _524;
    }
    float _526 = _276;
    float _528 = _526;
    if (!_460)
    {
        _498 = _452;
    }
    float _530 = _498;
    float _532 = _408 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _534 = fma(_242, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _536 = _504;
    float _538 = _530;
    if (_460)
    {
        float _540 = fma(_504, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _474 = _540;
    }
    float _542 = _474;
    float _544 = _542;
    if (!_460)
    {
        _536 = _448;
    }
    float _546 = _536;
    float _548 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _532);
    float _550 = floor(_534);
    float _552 = _546;
    float _554 = _516;
    if (_460)
    {
        float _556 = _516 + (-1.0);
        _528 = _556;
    }
    float _558 = _528;
    float _560 = 0.0;
    if (_460)
    {
        float _562 = _484 * _542;
        _560 = _562;
    }
    float _564 = _560;
    if (!_460)
    {
        _544 = _522;
    }
    float _566 = _544;
    float _568 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[1].z, _548);
    float _570 = _566;
    if (_460)
    {
        float _572 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _476 = _572;
    }
    float _574 = _476;
    if (_460)
    {
        float _576 = _448 * _564;
        _552 = _576;
    }
    float _578 = _552;
    if (!_460)
    {
        _486 = _450;
    }
    float _580 = _486;
    float _582 = _580;
    if (_460)
    {
        float _584 = _450 * _564;
        _582 = _584;
    }
    float _586 = _582;
    if (_460)
    {
        float _588 = fma(_522, _516, _574);
        _570 = _588;
    }
    float _590 = _570;
    if (_460)
    {
        float _592 = _578 * _578;
        _538 = _592;
    }
    float _594 = _538;
    float _596 = _408 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_460)
    {
        _554 = _454;
    }
    float _598 = _554;
    float _600 = _598;
    if (_460)
    {
        float _602 = _586 * _586;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_590, _590, _594);
    float _608 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _610 = _408 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _614 = _606 + _604;
    float _616 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _618 = _568 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _622 = floor(_608);
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _626 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[23].w, _624);
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[0].z, _616);
    float _632 = _620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _634 = -_628;
    float _636 = _634 + 1.0;
    float _638 = _630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = rsqrt(_614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c8)._m0[3].z, _434);
    float _646 = _632 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = -_550;
    float _652 = _534 + _650;
    float _654 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = -_646;
    float _658 = fma(_656, _438, 1.0);
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _662 = abs(_636);
    float _664 = log2(_662);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    float _670 = _642 * _578;
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _642 * _590;
    float _676 = _642 * _586;
    float _678 = _670 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _680 = log2(_658);
    float _682 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[4].z, _668);
    float _684 = -_678;
    float _686 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].y, _684);
    float _688 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _690 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _682);
    float _692 = -_676;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c15)._m0[21].z, _686);
    float _696 = 1.0 / _672;
    float _698 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_694, -0.5, 0.5);
    float _702 = fma(_694, 0.5, 0.5);
    float _704 = -_622;
    float _706 = _608 + _704;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _674 + 1.0;
    float _712 = exp2(_688);
    float _714 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = _680 * 0.693147182464599609375;
    float _720 = fma(_702, _714, -0.212114393711090087890625);
    float _722 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _724 = sqrt(_700);
    float _726 = fma(_702, _720, 1.570728778839111328125);
    float _728 = _690 * _696;
    float2 _2896 = float2(_652, _706);
    float _730 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2896, float2(0.0), isnan(_2896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2896, float2(0.0), isnan(_2896)), level(0.0)).x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _734 = fma(_728, 0.5, 0.5);
    float _736 = -_674;
    float _738 = fma(_712, _710, _736);
    float _740 = _722 * _696;
    float _742 = fma(_738, 0.5, 0.5);
    float _744 = fma(_740, -0.5, 0.5);
    float _746 = _724 * 0.636619746685028076171875;
    float3 _2929 = float3(_734, _744, _732);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2929, float3(0.0), isnan(_2929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2929, float3(0.0), isnan(_2929)), level(0.0)).x;
    float3 _2940 = float3(_734, _744, _732);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2940, float3(0.0), isnan(_2940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2940, float3(0.0), isnan(_2940)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float _761 = -_726;
    float _763 = fma(_746, _761, 1.0);
    float2 _2961 = float2(_763, _742);
    float3 _767 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2961, float2(0.0), isnan(_2961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2961, float2(0.0), isnan(_2961)), level(0.0)).xyz;
    float _769 = _767.x;
    float _771 = _767.y;
    float _773 = _767.z;
    float _775 = in.m_57.w;
    float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _779 = in.m_59.y;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _783 = _781 != 0;
    float _785 = _664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _787 = in.m_57.z;
    float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _791 = in.m_59.x;
    out.m_61.x = _410;
    out.m_61.y = _408;
    out.m_61.z = _412;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _795 = _188 > 0.5;
    bool _797 = _775 > 0.5;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _801 = -_779;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _813 = _797 ? as_type<int>(_803) : as_type<int>(_779);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _817 = _777;
    float _819 = _779;
    float _821 = _787;
    float _823 = _672;
    float _825 = _722;
    if (_783)
    {
        float _827 = in.m_57.x;
        _815 = _827;
    }
    float _829 = _815;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _833 = _831 != 0;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _837 = _795 ? _803 : _779;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _841 = _787 > 0.5;
    float _843 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _845 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _849 = _847 != 0;
    float _851 = _188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = _833 ? _837 : _779;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _857 = _841 ? as_type<int>(_803) : as_type<int>(_779);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_63.x = _839;
    out.m_63.y = _843;
    out.m_63.z = _845;
    out.m_63.w = _835;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_851, -2.0, _855);
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _869 = _867 != 0;
    float _871 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _837;
    bool _875 = _869;
    int _877 = as_type<int>(_839);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[78].w);
    if (!_783)
    {
        _873 = _791;
    }
    float _881 = _873;
    float _883 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _863 ? as_type<float>(_857) : _779;
    float _887 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _889 = _869 ? _813 : as_type<int>(_779);
    float _891 = 0.0;
    float _893 = _881;
    int _895 = _889;
    if (_849)
    {
        float _897 = in.m_57.z;
        _891 = _897;
    }
    float _899 = _891;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _909 = _907 != 0;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _915 = _913 != 0;
    float _917 = _777 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _919 = _915;
    int _921 = as_type<int>(_899);
    if (_783)
    {
        bool _923 = _829 > 0.5;
        _875 = _923;
    }
    bool _925 = _875;
    float _927 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _929 = in.m_65.x;
    float _931 = in.m_65.y;
    float _933 = in.m_65.z;
    float _935 = in.m_65.w;
    if (!_783)
    {
        _817 = _881;
    }
    float _937 = _817;
    float _939 = fma(_917, _853, -0.5);
    float _941 = _937;
    float _943 = _939;
    if (_783)
    {
        _893 = _791;
    }
    float _945 = _893;
    out.m_67.x = _871;
    out.m_67.y = _883;
    out.m_67.z = _887;
    float _947 = _915 ? as_type<float>(_857) : _779;
    float _949 = _793 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _951 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _927);
    float _953 = _945;
    if (_783)
    {
        float _955 = -_945;
        float _957 = _955 + 1.0;
        _877 = as_type<int>(_957);
    }
    int _959 = _877;
    float _961 = _905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_909)
    {
        float _963 = -_945;
        float _965 = _963 + 1.0;
        _879 = as_type<int>(_965);
    }
    int _967 = _879;
    out.m_69.y = _779;
    float _969 = fma(_961, as_type<float>(_889), -0.5);
    if (_783)
    {
        float _971 = _925 ? as_type<float>(_959) : _945;
        _941 = _971;
    }
    float _973 = _941;
    if (_903)
    {
        float _975 = -_945;
        float _977 = _975 + 1.0;
        _895 = as_type<int>(_977);
    }
    int _979 = _895;
    float _981 = _789 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _983 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _865);
    bool _985 = _178 != 0.0;
    bool _987 = isnan(_178);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _997 = fma(_981, _885, -0.5);
    float _999 = fma(_949, _947, -0.5);
    float _1001 = -_983;
    float _1003 = fma(_951, _939, _1001);
    bool _1005 = _176 == 0.0;
    bool _1007 = !_993;
    bool _1009 = _1005 && _1007;
    float _1011 = in.m_71.x;
    float _1013 = in.m_71.y;
    float _1015 = in.m_71.z;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1019 = _931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1021 = _180 == 0.0;
    bool _1023 = _1021 && _1009;
    float _1025 = _931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1027 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1017);
    if (_849)
    {
        bool _1029 = _899 > 0.5;
        _919 = _1029;
    }
    bool _1031 = _919;
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1025);
    float _1037 = _1033;
    if (_849)
    {
        float _1039 = -_945;
        float _1041 = _1039 + 1.0;
        _921 = as_type<int>(_1041);
    }
    int _1043 = _921;
    float _1045 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1027);
    float _1047 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1033);
    float _1049 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1035);
    float _1051 = _1045;
    if (!_849)
    {
        _819 = _945;
    }
    float _1053 = _819;
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1057 = _1053;
    if (!_903)
    {
        _1037 = _945;
    }
    float _1059 = _1037;
    float _1061 = _1059;
    if (!_909)
    {
        _943 = _945;
    }
    float _1063 = _943;
    out.m_73.x = _1045;
    out.m_73.y = _1047;
    out.m_73.z = _1049;
    float _1065 = _1063;
    if (_849)
    {
        float _1067 = _1031 ? as_type<float>(_1043) : _945;
        _1057 = _1067;
    }
    float _1069 = _1057;
    if (_903)
    {
        float _1071 = _795 ? as_type<float>(_979) : _945;
        _1061 = _1071;
    }
    float _1073 = _1061;
    float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_909)
    {
        float _1077 = _795 ? as_type<float>(_967) : _945;
        _1065 = _1077;
    }
    float _1079 = _1065;
    float _1081 = _1011;
    if (_1023)
    {
        _953 = _1011;
    }
    float _1083 = _953;
    bool _1085 = _348 != 2;
    float _1087 = _1083;
    if (_1023)
    {
        _360 = _1083;
    }
    float _1089 = _360;
    float _1091 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1093 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1095 = _1089;
    if (!_1023)
    {
        _1087 = _1011;
    }
    float _1097 = _1087;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1023)
    {
        _1081 = _1015;
    }
    float _1101 = _1081;
    float _1103 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1091);
    float _1105 = _1101;
    if (_1023)
    {
        _1051 = _1013;
    }
    float _1107 = _1051;
    float _1109 = fma(_242, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1093);
    float _1111 = _1107;
    if (!_1023)
    {
        float _1113 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1015);
        _1105 = _1113;
    }
    float _1115 = _1105;
    bool _1117 = _350 != 1;
    if (!_1023)
    {
        float _1119 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1013);
        _1111 = _1119;
    }
    float _1121 = _1111;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1125 = _933 * _1097;
    float _1127 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1103);
    float _1129 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1109);
    if (!_1023)
    {
        float _1131 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1097);
        _1095 = _1131;
    }
    float _1133 = _1095;
    float _1135 = _931 * _1015;
    float _1137 = -_1125;
    float _1139 = fma(_929, _1015, _1137);
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _929 * _1013;
    float _1147 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1151 = -_1135;
    float _1153 = fma(_933, _1013, _1151);
    float _1155 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1159 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1161 = -_1145;
    float _1163 = fma(_931, _1097, _1161);
    float _1165 = fma(_1099, _1069, -0.5);
    float _1167 = 1.0 / _1147;
    float _1169 = fma(_1149, _1073, -0.5);
    float _1171 = -_1157;
    float _1173 = fma(_1159, 2.0, _1171);
    float _1175 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1177 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1183 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[93].z, _995);
    float _1185 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1189 = _354 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1191 = fma(_1177, _973, -0.5);
    float _1193 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1155);
    float _1195 = -_152;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1199 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1179);
    float _1201 = _356 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1203 = _1185 + _1147;
    float _1205 = -_1187;
    float _1207 = fma(_1189, 2.0, _1205);
    float _1209 = fma(_1193, _1191, _1197);
    float _1211 = _1203 * _1167;
    float _1213 = _1211 * 0.5;
    float _1215 = fma(_1175, _1079, -0.5);
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1219 = fma(_1201, -2.0, _1181);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1199);
    float _1227 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1183);
    float _1229 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1219);
    float _1231 = -_152;
    float _1233 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1207);
    float _1235 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1237 = 1.0 / _1223;
    float _1239 = -_1229;
    float _1241 = fma(_1225, _999, _1239);
    float _1243 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1245 = fma(_1227, _1215, _1233);
    float _1247 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1227;
    float _1251 = _1247;
    float _1253 = _1217;
    if (!_1117)
    {
        _1249 = _188;
    }
    float _1255 = _1249;
    float _1257 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1243);
    float _1259 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1235);
    float _1261 = fma(_1133, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1263 = _1255;
    if (!_1117)
    {
        _1251 = _1255;
    }
    float _1265 = _1251;
    float _1267 = _1139 * _935;
    float _1269 = _1265;
    if (_1117)
    {
        _1263 = _352;
    }
    float _1271 = _1263;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1275 = _1153 * _935;
    float _1277 = _1163 * _935;
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1273);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1283 = _1237 * _1281;
    float _1285 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1217);
    if (_1085)
    {
        _1253 = _352;
    }
    float _1287 = _1253;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1291 = abs(_1283);
    float _1293 = log2(_1291);
    float _1295 = _1287;
    if (!_1085)
    {
        _1295 = _787;
    }
    float _1297 = _1295;
    float _1299 = _1245 + 0.5;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1303 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1289);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1307 = _1241 + 0.5;
    float _1309 = _1305;
    if (_1117)
    {
        _1269 = _352;
    }
    float _1311 = _1269;
    float _1313 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1303);
    float _1315 = -_1301;
    float _1317 = fma(_1305, 2.0, _1315);
    if (!_1117)
    {
        _1309 = _787;
    }
    float _1319 = _1309;
    out.m_75.x = _1299;
    out.m_75.y = _1307;
    float _1321 = _1319;
    if (_1117)
    {
        _821 = _188;
    }
    float _1323 = _821;
    float _1325 = -_152;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1317);
    if (_1117)
    {
        _1321 = _188;
    }
    float _1329 = _1321;
    float _1331 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1085)
    {
        _292 = _352;
    }
    float _1333 = _292;
    float _1335 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1339 = fma(_1313, _1169, _1327);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1343 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1345 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1335);
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1341);
    float _1349 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1351 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1353 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1343);
    float _1355 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1347);
    float _1357 = fma(_1275, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1351);
    float _1359 = exp2(_1349);
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1365 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1353);
    float _1367 = -_1361;
    float _1369 = fma(_1331, 2.0, _1367);
    float _1371 = fma(_1337, -2.0, _1363);
    float _1373 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1279);
    float _1375 = -_152;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1369);
    float _1379 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1371);
    float _1381 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = exp2(_785);
    float _1385 = fma(_1373, _1165, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1355, _969, _1387);
    float _1391 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1393 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1395 = precise::clamp(_1393, 0.0, 1.0);
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1399 = _1283 <= 8000.0;
    bool _1401 = isnan(_1283);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(8000.0);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1391);
    float _1413 = fma(_1395, -2.0, 3.0);
    float _1415 = _1395 * _1395;
    float _1417 = fma(_1381, -2.0, _1397);
    float _1419 = fma(_632, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1411);
    float _1421 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1285);
    float _1423 = _1415 * _1413;
    float _1425 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1345);
    float _1427 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1429 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1357);
    float _1431 = -_1423;
    float _1433 = _1431 + 1.0;
    float _1435 = in.m_77.x;
    float _1437 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1417);
    float _1439 = _1003 + 0.5;
    float _1441 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1423);
    float _1443 = _1209 + 0.5;
    float _1445 = _1385 + 0.5;
    float _1447 = _1389 + 0.5;
    out.m_79.x = _1425;
    out.m_79.y = _1365;
    out.m_79.z = _1429;
    float _1449 = _1409 * _1441;
    float _1451 = -_1383;
    float _1453 = _1451 + 1.0;
    float _1455 = -_730;
    float _1457 = _1455 + 1.0;
    out.m_81.x = _1443;
    out.m_81.y = _1439;
    out.m_81.z = _1445;
    out.m_81.w = _1447;
    float _1459 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = -_1437;
    float _1465 = fma(_1421, _997, _1463);
    out.gl_Position.x = _690;
    out.gl_Position.y = _722;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _672;
    float _1467 = _1457 * _1459;
    float _1469 = precise::clamp(_1467, 0.0, 1.0);
    float _1471 = _1339 + 0.5;
    float _1473 = _1461 * _748;
    float _1475 = _1427 + _672;
    float _1477 = _690 + _672;
    float _1479 = _672 * 0.5;
    float _1481 = -_1461;
    float _1483 = _1481 + 1.0;
    float _1485 = _1465 + 0.5;
    float _1487 = _1475 * 0.5;
    float _1489 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1259);
    float _1491 = _773 * _1473;
    float _1493 = _759 * _1473;
    float _1495 = _1477 * 0.5;
    float _1497 = fma(_722, -0.5, _1479);
    float _1499 = -_1469;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1503 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1505 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1507 = _1501 * _1435;
    float _1509 = fma(_769, _1493, _753);
    float _1511 = fma(_771, _1493, _755);
    float _1513 = _759 * _1483;
    float _1515 = _1507 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1517 = fma(_759, _1491, _757);
    out.m_83.x = _1471;
    out.m_83.y = _1485;
    bool _1519 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1521 = isnan(_444);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1527 = _1523 || _1525;
    out.m_85.z = _1487;
    out.m_85.w = _672;
    out.m_87.x = _1515;
    out.m_89.x = _1509;
    out.m_89.y = _1511;
    out.m_89.z = _1517;
    out.m_89.w = _1513;
    float _1529 = _1427;
    float _1531 = _1493;
    float _1533 = _1497;
    float _1535 = _1495;
    if (!_1527)
    {
        _823 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _823;
    out.m_91.x = _1503;
    out.m_91.y = _1489;
    out.m_91.z = _1505;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1527)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1527)
    {
        _825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _825;
    out.m_93.x = _1495;
    out.m_93.y = _1497;
    out.m_93.z = _1487;
    out.m_93.w = _672;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1527)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1531;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1527)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1561 = _1533;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1527)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1567 = _1535;
    bool _1569 = !_1527;
    float _1571 = _1567;
    float _1573 = _1567;
    if (!_1569)
    {
        bool _1575 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1577 = isnan(_444);
        bool _1579 = _1575 || _1577;
        bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1583 = _1579 || _1581;
        if (!_1583)
        {
            float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1587 = _444 + _1585;
            float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1589;
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1597 = 1.0 / _1591;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1615 = _1587 * _1597;
            float _1617 = precise::clamp(_1615, 0.0, 1.0);
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1623 = fma(_1617, _1595, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1617, _1621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1627 = fma(_1617, _1601, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1617, _1605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1631 = fma(_1617, _1609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1633 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1573 = _1627;
            _1553 = _1631;
            _1565 = _1623;
            _1547 = _1629;
            _1541 = _1625;
            _1559 = _1633;
            _1635 = true;
        }
        else
        {
            bool _1637 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1639 = isnan(_444);
            bool _1641 = _1637 || _1639;
            bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1645 = _1641 || _1643;
            if (!_1645)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1647 = _1563;
            _1565 = _1647;
            if (!_1645)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1649 = _1571;
            _1573 = _1649;
            if (!_1645)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1651 = _1539;
            _1541 = _1651;
            if (!_1645)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1653 = _1545;
            _1547 = _1653;
            if (!_1645)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1655 = _1551;
            _1553 = _1655;
            if (!_1645)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1657 = _1557;
            bool _1659 = !_1645;
            _1559 = _1657;
            if (!_1659)
            {
                bool _1661 = _444 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1663 = isnan(_444);
                bool _1665 = _1661 || _1663;
                bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1669 = _1665 || _1667;
                if (!_1669)
                {
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1673 = _444 + _1671;
                    float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1675;
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = 1.0 / _1677;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1701 = _1673 * _1683;
                    float _1703 = precise::clamp(_1701, 0.0, 1.0);
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1709 = fma(_1703, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1711 = fma(_1703, _1707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1713 = fma(_1703, _1687, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1703, _1691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1717 = fma(_1703, _1695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1719 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1573 = _1713;
                    _1553 = _1717;
                    _1565 = _1709;
                    _1547 = _1715;
                    _1541 = _1711;
                    _1559 = _1719;
                    _1635 = true;
                }
                else
                {
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1635 = false;
    float _1721 = _1573;
    float _1723 = _1553;
    float _1725 = _1565;
    float _1727 = _1547;
    float _1729 = _1541;
    float _1731 = _1559;
    float _1733 = fma(_1489, -0.5, 0.5);
    float _1735 = precise::clamp(_1733, 0.0, 1.0);
    float _1737 = -_1721;
    float _1739 = _1737 + _1723;
    float _1741 = -_1725;
    float _1743 = _1741 + _1727;
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    bool _1749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1751 = fma(_1735, _1739, _1721);
    float _1753 = fma(_1735, _1743, _1725);
    float _1755 = fma(_1735, _1747, _1729);
    float _1757 = _1751 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1759 = fma(_1753, 0.298911988735198974609375, _1757);
    float _1761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1755, 0.114477999508380889892578125, _1759);
    out.m_49.x = _1761;
    float _1765 = -_1763;
    float _1767 = _1753 + _1765;
    float _1769 = -_1763;
    float _1771 = _1751 + _1769;
    float _1773 = -_1763;
    float _1775 = _1755 + _1773;
    float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1779 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1763);
    out.m_97.x = _1777;
    out.m_97.y = _1779;
    out.m_97.z = _1781;
    if (!_1749)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1783 = -_408;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1787 = -_410;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1791 = -_412;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1795 = _1785 * _1785;
    float _1797 = fma(_1789, _1789, _1795);
    float _1799 = fma(_1793, _1793, _1797);
    float _1801 = sqrt(_1799);
    float _1803 = rsqrt(_1799);
    float _1805 = -_1801;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1809 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = _1789 * _1803;
    float _1815 = _1785 * _1803;
    float _1817 = abs(_1811);
    float _1819 = log2(_1817);
    float _1821 = _1793 * _1803;
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1825 = _1489 * _1815;
    float _1827 = -_1815;
    float _1829 = -_1823;
    float _1831 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1829);
    float _1833 = fma(_1503, _1813, _1825);
    float _1835 = -_1821;
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1831);
    float _1839 = fma(_1505, _1821, _1833);
    float _1841 = precise::clamp(_1839, 0.0, 1.0);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1845 = _1837 + _1843;
    float _1847 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1849 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1851 = precise::clamp(_1849, 0.0, 1.0);
    float _1853 = exp2(_1847);
    float _1855 = _1853 * _1851;
    float _1857 = _1841 * _1855;
    float _1859 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1861 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1863 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1859;
    out.m_95.y = _1861;
    out.m_95.z = _1863;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

