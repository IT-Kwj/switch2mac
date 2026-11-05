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
    float4 m_55 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_128);
        out.gl_Position.z = _1942;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_142)
    {
        float _148 = float(_112);
        _122 = _148;
    }
    float _150 = _122;
    bool _152 = _146 >= _150;
    bool _154 = !_142;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_164);
        out.gl_Position.z = _2011;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.y;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _176 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _176;
    out.m_55.y = _178;
    out.m_55.z = _180;
    out.m_57.y = _166;
    bool _182 = !_170;
    float _184 = _166;
    float _202;
    if (!_182)
    {
        float _186 = in.m_59.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_112);
        float _208 = 1.0 / _206;
        float _210 = _146 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = in.m_61.x;
    float _216 = in.m_61.y;
    float _218 = in.m_61.z;
    float _220 = -_166;
    float _222 = _220 + 1.0;
    float _224 = in.m_63.x;
    float _226 = in.m_63.y;
    float _228 = in.m_63.z;
    float _230 = in.m_65.x;
    float _232 = in.m_65.y;
    float _234 = in.m_65.z;
    float _236 = in.m_46.x;
    float _238 = in.m_46.y;
    float _240 = in.m_46.z;
    float _242 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _218);
    float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _246 = _226 * _226;
    float _248 = _244 * 0.15915493667125701904296875;
    float _250 = fma(_224, _224, _246);
    float _252 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = fma(_228, _228, _250);
    float _260 = _248 * 6.283185482025146484375;
    float _262 = sin(_260);
    float _264 = _254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = rsqrt(_258);
    float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _272 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _268 * _270;
    float _276 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = _222 * _274;
    float _280 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _282 = fma(_224, _278, _214);
    float _284 = fma(_226, _278, _216);
    float _286 = fma(_228, _278, _218);
    float _288 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _282);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _286);
    float _296 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = _290 * _272;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _284);
    float _302 = _294 * _266;
    float _304 = _292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _308 = _300 * _264;
    float _310 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _318 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _320 = _308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _316);
    float _326 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _318);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].x, _320);
    float _330 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[9].z, _328);
    float _338 = _304 + _330;
    float _340 = _312 + _332;
    float _342 = _334 + _336;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _350 = _340 + _348;
    float _352 = _346 * _346;
    float _354 = fma(_350, _350, _352);
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = _320;
    float _362 = _302;
    float _364 = _352;
    float _366 = _354;
    float _368 = _264;
    float _370 = _212;
    float _372 = _224;
    float _374 = _226;
    float _376 = _228;
    if (!_358)
    {
        _360 = _340;
    }
    float _378 = _360;
    float _380 = _378;
    if (!_358)
    {
        _362 = _338;
    }
    float _382 = _362;
    float _384 = _382;
    if (!_358)
    {
        _364 = _342;
    }
    float _386 = _364;
    bool _388 = !_358;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_354);
        float _400 = _396 * _392;
        float _402 = _342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_342, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_350, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_346, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _366 = _484;
    }
    float _486 = _366;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _368 = _494;
    }
    float _496 = _368;
    float _498 = _446;
    float _500 = _496;
    if (_468)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _452;
    float _514 = _508;
    float _516 = _510;
    if (_468)
    {
        float _518 = _496 * 6.283185482025146484375;
        float _520 = cos(_518);
        _512 = _520;
    }
    float _522 = _512;
    float _524 = -_454;
    float _526 = -_510;
    float _528 = fma(_436, _524, _526);
    float _530 = _528;
    if (_468)
    {
        float _532 = _528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    if (!_468)
    {
        _500 = _462;
    }
    float _536 = _500;
    float _538 = _506;
    float _540 = _536;
    if (_468)
    {
        float _542 = fma(_506, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = sqrt(_450);
    float _548 = _544;
    if (_468)
    {
        float _550 = _522 + (-1.0);
        _478 = _550;
    }
    float _552 = _478;
    float _554 = 0.0;
    float _556 = _552;
    if (_468)
    {
        float _558 = _486 * _544;
        _554 = _558;
    }
    float _560 = _554;
    if (!_468)
    {
        _488 = _456;
    }
    float _562 = _488;
    float _564 = _562;
    if (_468)
    {
        float _566 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _566;
    }
    float _568 = _516;
    if (_468)
    {
        float _570 = _456 * _560;
        _564 = _570;
    }
    float _572 = _564;
    if (!_468)
    {
        _556 = _460;
    }
    float _574 = _556;
    float _576 = _574;
    if (_468)
    {
        float _578 = fma(_528, _522, _568);
        _530 = _578;
    }
    float _580 = _530;
    if (!_468)
    {
        _548 = _458;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _572 * _572;
        _576 = _586;
    }
    float _588 = _576;
    if (_468)
    {
        float _590 = _458 * _560;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _596 = fma(_580, _580, _588);
    if (_468)
    {
        float _598 = _592 * _592;
        _540 = _598;
    }
    float _600 = _540;
    float _602 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _594);
    float _606 = _596 + _600;
    float _608 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = rsqrt(_606);
    float _618 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = -_614;
    float _622 = _620 + 1.0;
    float _624 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _640 = -_634;
    float _642 = fma(_640, _626, 1.0);
    float _644 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _636);
    float _648 = _616 * _572;
    float _650 = _616 * _580;
    float _652 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _646);
    float _656 = _616 * _592;
    float _658 = _648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = _654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _664 = floor(_624);
    float _666 = -_658;
    float _668 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_656;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _604);
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _672);
    float _684 = floor(_638);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _682);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _690);
    float _696 = exp2(_674);
    float _698 = -_664;
    float _700 = _624 + _698;
    float _702 = _662 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _702);
    float _706 = log2(_642);
    float _708 = _662 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _710 = -_684;
    float _712 = _638 + _710;
    float _714 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = _650 + 1.0;
    float _718 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _708);
    float _720 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _722 = fma(_692, _714, -0.212114393711090087890625);
    float _724 = 1.0 / _694;
    float _726 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _728 = -_650;
    float _730 = fma(_696, _716, _728);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _720);
    float _734 = sqrt(_686);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    float _738 = _706 * 0.693147182464599609375;
    float2 _2988 = float2(_700, _712);
    float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).x;
    float _742 = fma(_692, _722, 1.570728778839111328125);
    float _744 = fma(_730, 0.5, 0.5);
    float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = _732 * _724;
    float _750 = _736 * _724;
    float _752 = fma(_748, 0.5, 0.5);
    float _754 = fma(_750, -0.5, 0.5);
    float _756 = _734 * 0.636619746685028076171875;
    float3 _3022 = float3(_752, _754, _746);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3022, float3(0.0), isnan(_3022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3022, float3(0.0), isnan(_3022)), level(0.0)).x;
    float3 _3033 = float3(_752, _754, _746);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3033, float3(0.0), isnan(_3033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3033, float3(0.0), isnan(_3033)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_742;
    float _773 = fma(_756, _771, 1.0);
    float2 _3054 = float2(_773, _744);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3054, float2(0.0), isnan(_3054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3054, float2(0.0), isnan(_3054)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_59.w;
    float _787 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _789 = in.m_59.y;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = in.m_59.x;
    float _801 = exp2(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = in.m_53.x;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _815 = _813 != 0;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _793;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _827 = _785 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = in.m_69.x;
    float _833 = in.m_69.y;
    float _835 = in.m_69.z;
    float _837 = in.m_69.w;
    bool _839 = _789 > 0.5;
    float _841 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _843 = _827 ? as_type<int>(_222) : as_type<int>(_166);
    float _845 = 1.0 / _825;
    int _847 = _839 ? as_type<int>(_222) : as_type<int>(_166);
    float _849 = _799 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = fma(_841, -2.0, _829);
    float _857 = _797 ? as_type<float>(_847) : _166;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _855);
    float _867 = -_801;
    float _869 = _867 + 1.0;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _873 = -_871;
    float _875 = fma(_849, 2.0, _873);
    float _877 = _224 * _835;
    float _879 = _833 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _881 = _833 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _883 = _833 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _885 = -_877;
    float _887 = fma(_228, _831, _885);
    float _889 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _891;
    float _895 = in.m_59.z;
    float _897 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _881);
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _883);
    float _901 = _893 * _821;
    float _903 = _226 * _831;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = _228 * _833;
    float _909 = _887 * _837;
    float _911 = -_903;
    float _913 = fma(_224, _833, _911);
    float _915 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _899);
    float _917 = -_907;
    float _919 = fma(_226, _835, _917);
    float _921 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _897);
    float _923 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _889);
    float _925 = _913 * _837;
    float _927 = _919 * _837;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _212 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _212 + _937;
    out.m_71.x = _921;
    out.m_71.y = _915;
    out.m_71.z = _923;
    float _941 = fma(_901, _931, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _943 = _819 ? as_type<float>(_843) : _166;
    float _945 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _947 = _935 * _845;
    bool _949 = _895 > 0.5;
    float _951 = fma(_945, _857, -0.5);
    bool _953 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _955 = isnan(_212);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _967 = fma(_947, _939, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _969 = _921;
    bool _971 = _863;
    float _973 = _919;
    int _975 = as_type<int>(_935);
    int _977 = as_type<int>(_903);
    float _979 = _807;
    float _981 = _694;
    float _983 = _736;
    float _985 = _732;
    if (_863)
    {
        float _987 = _949 ? _222 : _166;
        _184 = _987;
    }
    float _989 = _184;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _993 = _991;
    if (!_853)
    {
        _969 = _789;
    }
    float _995 = _969;
    float _997 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _859);
    bool _999 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1001 = isnan(_212);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _991);
    float _1013 = _995;
    if (!_853)
    {
        _993 = _995;
    }
    float _1015 = _993;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1019 = _1015;
    if (_853)
    {
        _1013 = _789;
    }
    float _1021 = _1013;
    float _1023 = -_963;
    float _1025 = _1023 + 1.0;
    float _1027 = -_1009;
    float _1029 = _1027 + 1.0;
    bool _1031 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1033 = isnan(_212);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _1009 * _1025;
    float _1045 = _965 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_853)
    {
        _370 = _799;
    }
    float _1049 = _370;
    float _1051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1053 = _1049;
    int _1055 = as_type<int>(_1051);
    if (!_853)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = fma(_943, _1045, -0.5);
    if (_805)
    {
        bool _1061 = _799 > 0.5;
        _971 = _1061;
    }
    bool _1063 = _971;
    float _1065 = -_865;
    float _1067 = fma(_1051, _951, _1065);
    if (_805)
    {
        float _1069 = -_807;
        float _1071 = _1069 + 1.0;
        _1055 = as_type<int>(_1071);
    }
    int _1073 = _1055;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_805)
    {
        _973 = _807;
    }
    float _1077 = _973;
    float _1079 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1081 = _1041 * _1029;
    float _1083 = -_1047;
    float _1085 = fma(_1075, 2.0, _1083);
    float _1087 = _1077;
    if (_805)
    {
        float _1089 = _1063 ? as_type<float>(_1073) : _807;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1095 = fma(_1079, _989, -0.5);
    float _1097 = _334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1099 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    if (_853)
    {
        _1019 = _799;
    }
    float _1101 = _1019;
    float _1103 = _334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1107 = -_1041;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1113 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1097);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1105);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1119 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1121 = _941 * _1081;
    float _1123 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1125 = _909 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1127 = _909 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1129 = -_1117;
    float _1131 = fma(_1119, 2.0, _1129);
    float _1133 = _1127;
    float _1135 = _1123;
    float _1137 = _1117;
    float _1139 = _1109;
    if (_811)
    {
        float _1141 = -_807;
        float _1143 = _1141 + 1.0;
        _975 = as_type<int>(_1143);
    }
    int _1145 = _975;
    float _1147 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    if (_815)
    {
        float _1149 = -_807;
        float _1151 = _1149 + 1.0;
        _977 = as_type<int>(_1151);
    }
    int _1153 = _977;
    float _1155 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1125);
    float _1159 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1127);
    if (!_811)
    {
        _1133 = _807;
    }
    float _1161 = _1133;
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1165 = _1161;
    if (!_853)
    {
        _1135 = _895;
    }
    float _1167 = _1135;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1171 = _1167;
    if (!_853)
    {
        _1137 = _895;
    }
    float _1173 = _1137;
    float _1175 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1099);
    float _1177 = _1173;
    if (_811)
    {
        float _1179 = _949 ? as_type<float>(_1145) : _807;
        _1165 = _1179;
    }
    float _1181 = _1165;
    float _1183 = fma(_967, _1043, _1163);
    if (_815)
    {
        float _1185 = _839 ? as_type<float>(_1153) : _807;
        _979 = _1185;
    }
    float _1187 = _979;
    float _1189 = -_146;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _875);
    float _1193 = 1.0 / _1155;
    if (_853)
    {
        _1171 = _1021;
    }
    float _1195 = _1171;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1183);
    if (_853)
    {
        _1177 = _1021;
    }
    float _1199 = _1177;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_853)
    {
        _1139 = _1021;
    }
    float _1203 = _1139;
    float _1205 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1201);
    float _1209 = _1205 + _1155;
    float _1211 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1219 = _1209 * _1193;
    float _1221 = _1219 * 0.5;
    float _1223 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1159);
    float _1225 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1217);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1227);
    float _1231 = _1203;
    if (!_853)
    {
        _1231 = _799;
    }
    float _1233 = _1231;
    float _1235 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    out.m_73.x = _1211;
    out.m_73.y = _1175;
    out.m_73.z = _1223;
    float _1243 = fma(_1235, _1181, -0.5);
    float _1245 = -_146;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1249 = -_146;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1085);
    float _1253 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = 1.0 / _1229;
    float _1257 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1253, _1091, -0.5);
    bool _1271 = _284 != 0.0;
    bool _1273 = isnan(_284);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1283 = fma(_1241, -2.0, _1239);
    float _1285 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1289 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1225);
    float _1291 = fma(_1285, _1243, _1247);
    float _1293 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1297 = fma(_1289, _1269, _1191);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1301 = _1255 * _1299;
    float _1303 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1305 = fma(_1287, _1187, -0.5);
    float _1307 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1283);
    float _1309 = abs(_1301);
    float _1311 = log2(_1309);
    float _1313 = fma(_1303, -2.0, _1295);
    float _1315 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _997);
    float _1317 = fma(_1293, _1305, _1251);
    float _1319 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1321 = -_1307;
    float _1323 = fma(_1281, _1059, _1321);
    float _1325 = -_1319;
    float _1327 = fma(_1315, _1095, _1325);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1333 = _1307;
    float _1335 = _1317;
    if (!_1267)
    {
        _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1337 = _1333;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1297 + 0.5;
    float _1343 = _1291 + 0.5;
    float _1345 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1347 = _1323 + 0.5;
    float _1349 = _1327 + 0.5;
    bool _1351 = _282 == 0.0;
    bool _1353 = !_1279;
    bool _1355 = _1351 && _1353;
    float _1357 = _1317 + 0.5;
    float _1359 = exp2(_1345);
    float _1361 = _1067 + 0.5;
    float _1363 = _1343;
    if (!_1267)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1367 = _1337 + _1365;
        _1335 = _1367;
    }
    float _1369 = _1335;
    float _1371 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1379 = _286 == 0.0;
    bool _1381 = _1379 && _1355;
    out.m_75.x = _1341;
    out.m_75.y = _1361;
    out.m_75.z = _1343;
    out.m_75.w = _1347;
    float _1383 = _1369;
    float _1385 = _1371;
    if (!_1267)
    {
        float _1387 = 1.0 / _1369;
        _1383 = _1387;
    }
    float _1389 = _1383;
    out.m_77.x = _1371;
    out.m_77.y = _1373;
    out.m_77.z = _1375;
    out.m_77.w = _1377;
    float _1391 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    out.m_79.x = _1357;
    out.m_79.y = _1349;
    float _1395 = fma(_1393, -2.0, 3.0);
    float _1397 = _1393 * _1393;
    if (!_1381)
    {
        float _1399 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _224);
        _372 = _1399;
    }
    float _1401 = _372;
    if (!_1381)
    {
        float _1403 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _226);
        _374 = _1403;
    }
    float _1405 = _374;
    float _1407 = in.m_81.x;
    float _1409 = _1397 * _1395;
    float _1411 = _662 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1267)
    {
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = _1301 + _1413;
        _1385 = _1415;
    }
    float _1417 = _1385;
    if (!_1381)
    {
        float _1419 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _228);
        _376 = _1419;
    }
    float _1421 = _376;
    float _1423 = -_1409;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1411);
    bool _1429 = _1301 <= 8000.0;
    bool _1431 = isnan(_1301);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(8000.0);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1409);
    float _1445 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1427);
    float _1447 = _694 * 0.5;
    float _1449 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1451 = _1439 * _1443;
    float _1453 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1445);
    float _1455 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1441);
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1449);
    float _1461 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1465 = fma(_736, -0.5, _1447);
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1469 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1471 = isnan(_546);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1477 = _1473 || _1475;
    float _1479 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1463);
    float _1481 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1457);
    float _1483 = -_740;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1489 = _1453;
    if (_1267)
    {
        _1363 = 1.0;
    }
    float _1491 = _1363;
    float _1493 = _1491;
    if (!_1267)
    {
        float _1495 = _1417 * _1389;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        _1493 = _1497;
    }
    float _1499 = _1493;
    float _1501 = _1485 * _1467;
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1453 + _694;
    out.m_83.x = _1479;
    out.m_83.y = _1481;
    out.m_83.z = _1487;
    float _1507 = _732 + _694;
    float _1509 = -_1503;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1513 = _1505 * 0.5;
    float _1515 = _1507 * 0.5;
    float _1517 = _1511 * _1407;
    out.gl_Position.x = _732;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1453;
    out.gl_Position.w = _694;
    float _1519 = _1461 * _758;
    float _1521 = -_1461;
    float _1523 = _1521 + 1.0;
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1515;
    out.m_85.y = _1465;
    out.m_85.z = _1513;
    out.m_85.w = _694;
    float _1527 = _769 * _1519;
    float _1529 = _769 * _1523;
    out.m_87.x = _1525;
    float _1531 = _783 * _1519;
    float _1533 = fma(_779, _1527, _763);
    float _1535 = fma(_781, _1527, _765);
    float _1537 = _1527;
    float _1539 = _1515;
    if (!_1477)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1541 = _1537;
    float _1543 = fma(_769, _1531, _767);
    float _1545 = _1541;
    float _1547 = _1541;
    if (!_1477)
    {
        _981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1549 = _981;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1477)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1555 = _1489;
    float _1557 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_89.x = _1533;
    out.m_89.y = _1535;
    out.m_89.z = _1543;
    out.m_89.w = _1529;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1477)
    {
        _1539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1563 = _1539;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1477)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1569 = _983;
    float _1571 = _1569;
    float _1573 = _1569;
    if (!_1477)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1575 = _985;
    bool _1577 = !_1477;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_546);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _546 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = 1.0 / _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1601;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1631 = fma(_1625, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1553 = _1633;
            _1581 = _1639;
            _1567 = _1631;
            _1573 = _1637;
            _1561 = _1635;
            _1547 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_546);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1565;
            _1567 = _1655;
            if (!_1653)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1551;
            _1553 = _1657;
            if (!_1653)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1571;
            _1573 = _1661;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1579;
            _1581 = _1663;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1545;
            bool _1667 = !_1653;
            _1547 = _1665;
            if (!_1667)
            {
                bool _1669 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_546);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _546 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = 1.0 / _1685;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1687;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1717 = fma(_1711, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1553 = _1719;
                    _1581 = _1725;
                    _1567 = _1717;
                    _1573 = _1723;
                    _1561 = _1721;
                    _1547 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1553;
    float _1731 = _1581;
    float _1733 = _1567;
    float _1735 = _1573;
    float _1737 = _1561;
    float _1739 = _1547;
    float _1741 = fma(_1481, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    out.m_91.x = 0.0;
    float _1755 = fma(_1743, _1747, _1729);
    float _1757 = fma(_1743, _1753, _1733);
    out.m_49.x = _1749;
    float _1759 = -_1737;
    float _1761 = _1759 + _1739;
    float _1763 = _1755 * 0.586610972881317138671875;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1761, _1737);
    float _1769 = fma(_1757, 0.298911988735198974609375, _1763);
    bool _1771 = _1499 > 0.0;
    bool _1773 = isnan(_1499);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    float _1783 = -_1781;
    float _1785 = _1757 + _1783;
    float _1787 = -_1781;
    float _1789 = _1755 + _1787;
    float _1791 = -_1781;
    float _1793 = _1767 + _1791;
    float _1795 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1797 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1799 = fma(_1793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1801 = !_1765;
    if (!_1801)
    {
        float _1803 = -_428;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1807 = -_430;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1811 = -_432;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1815 = _1805 * _1805;
        float _1817 = fma(_1809, _1809, _1815);
        float _1819 = fma(_1813, _1813, _1817);
        float _1821 = sqrt(_1819);
        float _1823 = rsqrt(_1819);
        float _1825 = -_1821;
        float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = _1809 * _1823;
        float _1835 = _1805 * _1823;
        float _1837 = abs(_1831);
        float _1839 = log2(_1837);
        float _1841 = _1813 * _1823;
        float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1845 = _1481 * _1835;
        float _1847 = -_1835;
        float _1849 = -_1843;
        float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
        float _1853 = fma(_1479, _1833, _1845);
        float _1855 = -_1841;
        float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
        float _1859 = fma(_1487, _1841, _1853);
        float _1861 = precise::clamp(_1859, 0.0, 1.0);
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1865 = _1857 + _1863;
        float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = exp2(_1867);
        float _1875 = _1873 * _1871;
        float _1877 = _1861 * _1875;
        float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _1879;
        out.m_91.y = _1881;
        out.m_91.z = _1883;
    }
    out.m_93.x = _1795;
    out.m_93.y = _1797;
    out.m_93.z = _1799;
    if (_1779)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1885;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_128);
        out.gl_Position.z = _1942;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_142)
    {
        float _148 = float(_112);
        _122 = _148;
    }
    float _150 = _122;
    bool _152 = _146 >= _150;
    bool _154 = !_142;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_164);
        out.gl_Position.z = _2011;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_53.y;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _176 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _176;
    out.m_55.y = _178;
    out.m_55.z = _180;
    out.m_57.y = _166;
    bool _182 = !_170;
    float _184 = _166;
    float _202;
    if (!_182)
    {
        float _186 = in.m_59.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_112);
        float _208 = 1.0 / _206;
        float _210 = _146 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = in.m_61.x;
    float _216 = in.m_61.y;
    float _218 = in.m_61.z;
    float _220 = -_166;
    float _222 = _220 + 1.0;
    float _224 = in.m_63.x;
    float _226 = in.m_63.y;
    float _228 = in.m_63.z;
    float _230 = in.m_65.x;
    float _232 = in.m_65.y;
    float _234 = in.m_65.z;
    float _236 = in.m_46.x;
    float _238 = in.m_46.y;
    float _240 = in.m_46.z;
    float _242 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _218);
    float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _246 = _226 * _226;
    float _248 = _244 * 0.15915493667125701904296875;
    float _250 = fma(_224, _224, _246);
    float _252 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = fma(_228, _228, _250);
    float _260 = _248 * 6.283185482025146484375;
    float _262 = sin(_260);
    float _264 = _254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = rsqrt(_258);
    float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _272 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _268 * _270;
    float _276 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = _222 * _274;
    float _280 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _282 = fma(_224, _278, _214);
    float _284 = fma(_226, _278, _216);
    float _286 = fma(_228, _278, _218);
    float _288 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _282);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _286);
    float _296 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = _290 * _272;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _284);
    float _302 = _294 * _266;
    float _304 = _292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _308 = _300 * _264;
    float _310 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _318 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _320 = _308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _316);
    float _326 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _318);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].x, _320);
    float _330 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[9].z, _328);
    float _338 = _304 + _330;
    float _340 = _312 + _332;
    float _342 = _334 + _336;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _350 = _340 + _348;
    float _352 = _346 * _346;
    float _354 = fma(_350, _350, _352);
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = _320;
    float _362 = _302;
    float _364 = _352;
    float _366 = _354;
    float _368 = _264;
    float _370 = _212;
    float _372 = _224;
    float _374 = _226;
    float _376 = _228;
    if (!_358)
    {
        _360 = _340;
    }
    float _378 = _360;
    float _380 = _378;
    if (!_358)
    {
        _362 = _338;
    }
    float _382 = _362;
    float _384 = _382;
    if (!_358)
    {
        _364 = _342;
    }
    float _386 = _364;
    bool _388 = !_358;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_354);
        float _400 = _396 * _392;
        float _402 = _342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_342, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_350, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_346, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _366 = _484;
    }
    float _486 = _366;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _368 = _494;
    }
    float _496 = _368;
    float _498 = _446;
    float _500 = _496;
    if (_468)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _452;
    float _514 = _508;
    float _516 = _510;
    if (_468)
    {
        float _518 = _496 * 6.283185482025146484375;
        float _520 = cos(_518);
        _512 = _520;
    }
    float _522 = _512;
    float _524 = -_454;
    float _526 = -_510;
    float _528 = fma(_436, _524, _526);
    float _530 = _528;
    if (_468)
    {
        float _532 = _528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    if (!_468)
    {
        _500 = _462;
    }
    float _536 = _500;
    float _538 = _506;
    float _540 = _536;
    if (_468)
    {
        float _542 = fma(_506, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = sqrt(_450);
    float _548 = _544;
    if (_468)
    {
        float _550 = _522 + (-1.0);
        _478 = _550;
    }
    float _552 = _478;
    float _554 = 0.0;
    float _556 = _552;
    if (_468)
    {
        float _558 = _486 * _544;
        _554 = _558;
    }
    float _560 = _554;
    if (!_468)
    {
        _488 = _456;
    }
    float _562 = _488;
    float _564 = _562;
    if (_468)
    {
        float _566 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _566;
    }
    float _568 = _516;
    if (_468)
    {
        float _570 = _456 * _560;
        _564 = _570;
    }
    float _572 = _564;
    if (!_468)
    {
        _556 = _460;
    }
    float _574 = _556;
    float _576 = _574;
    if (_468)
    {
        float _578 = fma(_528, _522, _568);
        _530 = _578;
    }
    float _580 = _530;
    if (!_468)
    {
        _548 = _458;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _572 * _572;
        _576 = _586;
    }
    float _588 = _576;
    if (_468)
    {
        float _590 = _458 * _560;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _596 = fma(_580, _580, _588);
    if (_468)
    {
        float _598 = _592 * _592;
        _540 = _598;
    }
    float _600 = _540;
    float _602 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _594);
    float _606 = _596 + _600;
    float _608 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = rsqrt(_606);
    float _618 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = -_614;
    float _622 = _620 + 1.0;
    float _624 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _640 = -_634;
    float _642 = fma(_640, _626, 1.0);
    float _644 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _636);
    float _648 = _616 * _572;
    float _650 = _616 * _580;
    float _652 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _646);
    float _656 = _616 * _592;
    float _658 = _648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = _654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _664 = floor(_624);
    float _666 = -_658;
    float _668 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_656;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _604);
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _672);
    float _684 = floor(_638);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _682);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _690);
    float _696 = exp2(_674);
    float _698 = -_664;
    float _700 = _624 + _698;
    float _702 = _662 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _702);
    float _706 = log2(_642);
    float _708 = _662 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _710 = -_684;
    float _712 = _638 + _710;
    float _714 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = _650 + 1.0;
    float _718 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _708);
    float _720 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _722 = fma(_692, _714, -0.212114393711090087890625);
    float _724 = 1.0 / _694;
    float _726 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _728 = -_650;
    float _730 = fma(_696, _716, _728);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _720);
    float _734 = sqrt(_686);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    float _738 = _706 * 0.693147182464599609375;
    float2 _2988 = float2(_700, _712);
    float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).x;
    float _742 = fma(_692, _722, 1.570728778839111328125);
    float _744 = fma(_730, 0.5, 0.5);
    float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = _732 * _724;
    float _750 = _736 * _724;
    float _752 = fma(_748, 0.5, 0.5);
    float _754 = fma(_750, -0.5, 0.5);
    float _756 = _734 * 0.636619746685028076171875;
    float3 _3022 = float3(_752, _754, _746);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3022, float3(0.0), isnan(_3022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3022, float3(0.0), isnan(_3022)), level(0.0)).x;
    float3 _3033 = float3(_752, _754, _746);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3033, float3(0.0), isnan(_3033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3033, float3(0.0), isnan(_3033)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_742;
    float _773 = fma(_756, _771, 1.0);
    float2 _3054 = float2(_773, _744);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3054, float2(0.0), isnan(_3054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3054, float2(0.0), isnan(_3054)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_59.w;
    float _787 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _789 = in.m_59.y;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = in.m_59.x;
    float _801 = exp2(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = in.m_53.x;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _815 = _813 != 0;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _793;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _827 = _785 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = in.m_69.x;
    float _833 = in.m_69.y;
    float _835 = in.m_69.z;
    float _837 = in.m_69.w;
    bool _839 = _789 > 0.5;
    float _841 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _843 = _827 ? as_type<int>(_222) : as_type<int>(_166);
    float _845 = 1.0 / _825;
    int _847 = _839 ? as_type<int>(_222) : as_type<int>(_166);
    float _849 = _799 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = fma(_841, -2.0, _829);
    float _857 = _797 ? as_type<float>(_847) : _166;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _855);
    float _867 = -_801;
    float _869 = _867 + 1.0;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _873 = -_871;
    float _875 = fma(_849, 2.0, _873);
    float _877 = _224 * _835;
    float _879 = _833 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _881 = _833 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _883 = _833 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _885 = -_877;
    float _887 = fma(_228, _831, _885);
    float _889 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _891;
    float _895 = in.m_59.z;
    float _897 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _881);
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _883);
    float _901 = _893 * _821;
    float _903 = _226 * _831;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = _228 * _833;
    float _909 = _887 * _837;
    float _911 = -_903;
    float _913 = fma(_224, _833, _911);
    float _915 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _899);
    float _917 = -_907;
    float _919 = fma(_226, _835, _917);
    float _921 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _897);
    float _923 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _889);
    float _925 = _913 * _837;
    float _927 = _919 * _837;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _212 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _212 + _937;
    out.m_71.x = _921;
    out.m_71.y = _915;
    out.m_71.z = _923;
    float _941 = fma(_901, _931, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _943 = _819 ? as_type<float>(_843) : _166;
    float _945 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _947 = _935 * _845;
    bool _949 = _895 > 0.5;
    float _951 = fma(_945, _857, -0.5);
    bool _953 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _955 = isnan(_212);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _967 = fma(_947, _939, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _969 = _921;
    bool _971 = _863;
    float _973 = _919;
    int _975 = as_type<int>(_935);
    int _977 = as_type<int>(_903);
    float _979 = _807;
    float _981 = _694;
    float _983 = _736;
    float _985 = _732;
    if (_863)
    {
        float _987 = _949 ? _222 : _166;
        _184 = _987;
    }
    float _989 = _184;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _993 = _991;
    if (!_853)
    {
        _969 = _789;
    }
    float _995 = _969;
    float _997 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _859);
    bool _999 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1001 = isnan(_212);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _991);
    float _1013 = _995;
    if (!_853)
    {
        _993 = _995;
    }
    float _1015 = _993;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1019 = _1015;
    if (_853)
    {
        _1013 = _789;
    }
    float _1021 = _1013;
    float _1023 = -_963;
    float _1025 = _1023 + 1.0;
    float _1027 = -_1009;
    float _1029 = _1027 + 1.0;
    bool _1031 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1033 = isnan(_212);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _1009 * _1025;
    float _1045 = _965 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_853)
    {
        _370 = _799;
    }
    float _1049 = _370;
    float _1051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1053 = _1049;
    int _1055 = as_type<int>(_1051);
    if (!_853)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = fma(_943, _1045, -0.5);
    if (_805)
    {
        bool _1061 = _799 > 0.5;
        _971 = _1061;
    }
    bool _1063 = _971;
    float _1065 = -_865;
    float _1067 = fma(_1051, _951, _1065);
    if (_805)
    {
        float _1069 = -_807;
        float _1071 = _1069 + 1.0;
        _1055 = as_type<int>(_1071);
    }
    int _1073 = _1055;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_805)
    {
        _973 = _807;
    }
    float _1077 = _973;
    float _1079 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1081 = _1041 * _1029;
    float _1083 = -_1047;
    float _1085 = fma(_1075, 2.0, _1083);
    float _1087 = _1077;
    if (_805)
    {
        float _1089 = _1063 ? as_type<float>(_1073) : _807;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1095 = fma(_1079, _989, -0.5);
    float _1097 = _334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1099 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    if (_853)
    {
        _1019 = _799;
    }
    float _1101 = _1019;
    float _1103 = _334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1107 = -_1041;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1113 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1097);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1105);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1119 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1121 = _941 * _1081;
    float _1123 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1125 = _909 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1127 = _909 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1129 = -_1117;
    float _1131 = fma(_1119, 2.0, _1129);
    float _1133 = _1127;
    float _1135 = _1123;
    float _1137 = _1117;
    float _1139 = _1109;
    if (_811)
    {
        float _1141 = -_807;
        float _1143 = _1141 + 1.0;
        _975 = as_type<int>(_1143);
    }
    int _1145 = _975;
    float _1147 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    if (_815)
    {
        float _1149 = -_807;
        float _1151 = _1149 + 1.0;
        _977 = as_type<int>(_1151);
    }
    int _1153 = _977;
    float _1155 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1125);
    float _1159 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1127);
    if (!_811)
    {
        _1133 = _807;
    }
    float _1161 = _1133;
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1165 = _1161;
    if (!_853)
    {
        _1135 = _895;
    }
    float _1167 = _1135;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1171 = _1167;
    if (!_853)
    {
        _1137 = _895;
    }
    float _1173 = _1137;
    float _1175 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1099);
    float _1177 = _1173;
    if (_811)
    {
        float _1179 = _949 ? as_type<float>(_1145) : _807;
        _1165 = _1179;
    }
    float _1181 = _1165;
    float _1183 = fma(_967, _1043, _1163);
    if (_815)
    {
        float _1185 = _839 ? as_type<float>(_1153) : _807;
        _979 = _1185;
    }
    float _1187 = _979;
    float _1189 = -_146;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _875);
    float _1193 = 1.0 / _1155;
    if (_853)
    {
        _1171 = _1021;
    }
    float _1195 = _1171;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1183);
    if (_853)
    {
        _1177 = _1021;
    }
    float _1199 = _1177;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_853)
    {
        _1139 = _1021;
    }
    float _1203 = _1139;
    float _1205 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1201);
    float _1209 = _1205 + _1155;
    float _1211 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1219 = _1209 * _1193;
    float _1221 = _1219 * 0.5;
    float _1223 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1159);
    float _1225 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1217);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1227);
    float _1231 = _1203;
    if (!_853)
    {
        _1231 = _799;
    }
    float _1233 = _1231;
    float _1235 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    out.m_73.x = _1211;
    out.m_73.y = _1175;
    out.m_73.z = _1223;
    float _1243 = fma(_1235, _1181, -0.5);
    float _1245 = -_146;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1249 = -_146;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1085);
    float _1253 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = 1.0 / _1229;
    float _1257 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1253, _1091, -0.5);
    bool _1271 = _284 != 0.0;
    bool _1273 = isnan(_284);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1283 = fma(_1241, -2.0, _1239);
    float _1285 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1289 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1225);
    float _1291 = fma(_1285, _1243, _1247);
    float _1293 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1297 = fma(_1289, _1269, _1191);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1301 = _1255 * _1299;
    float _1303 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1305 = fma(_1287, _1187, -0.5);
    float _1307 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1283);
    float _1309 = abs(_1301);
    float _1311 = log2(_1309);
    float _1313 = fma(_1303, -2.0, _1295);
    float _1315 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _997);
    float _1317 = fma(_1293, _1305, _1251);
    float _1319 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1321 = -_1307;
    float _1323 = fma(_1281, _1059, _1321);
    float _1325 = -_1319;
    float _1327 = fma(_1315, _1095, _1325);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1333 = _1307;
    float _1335 = _1317;
    if (!_1267)
    {
        _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1337 = _1333;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1297 + 0.5;
    float _1343 = _1291 + 0.5;
    float _1345 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1347 = _1323 + 0.5;
    float _1349 = _1327 + 0.5;
    bool _1351 = _282 == 0.0;
    bool _1353 = !_1279;
    bool _1355 = _1351 && _1353;
    float _1357 = _1317 + 0.5;
    float _1359 = exp2(_1345);
    float _1361 = _1067 + 0.5;
    float _1363 = _1343;
    if (!_1267)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1367 = _1337 + _1365;
        _1335 = _1367;
    }
    float _1369 = _1335;
    float _1371 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1379 = _286 == 0.0;
    bool _1381 = _1379 && _1355;
    out.m_75.x = _1341;
    out.m_75.y = _1361;
    out.m_75.z = _1343;
    out.m_75.w = _1347;
    float _1383 = _1369;
    float _1385 = _1371;
    if (!_1267)
    {
        float _1387 = 1.0 / _1369;
        _1383 = _1387;
    }
    float _1389 = _1383;
    out.m_77.x = _1371;
    out.m_77.y = _1373;
    out.m_77.z = _1375;
    out.m_77.w = _1377;
    float _1391 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    out.m_79.x = _1357;
    out.m_79.y = _1349;
    float _1395 = fma(_1393, -2.0, 3.0);
    float _1397 = _1393 * _1393;
    if (!_1381)
    {
        float _1399 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _224);
        _372 = _1399;
    }
    float _1401 = _372;
    if (!_1381)
    {
        float _1403 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _226);
        _374 = _1403;
    }
    float _1405 = _374;
    float _1407 = in.m_81.x;
    float _1409 = _1397 * _1395;
    float _1411 = _662 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1267)
    {
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = _1301 + _1413;
        _1385 = _1415;
    }
    float _1417 = _1385;
    if (!_1381)
    {
        float _1419 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _228);
        _376 = _1419;
    }
    float _1421 = _376;
    float _1423 = -_1409;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1411);
    bool _1429 = _1301 <= 8000.0;
    bool _1431 = isnan(_1301);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(8000.0);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1409);
    float _1445 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1427);
    float _1447 = _694 * 0.5;
    float _1449 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1451 = _1439 * _1443;
    float _1453 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1445);
    float _1455 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1441);
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1449);
    float _1461 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1465 = fma(_736, -0.5, _1447);
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1469 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1471 = isnan(_546);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1477 = _1473 || _1475;
    float _1479 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1463);
    float _1481 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1457);
    float _1483 = -_740;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1489 = _1453;
    if (_1267)
    {
        _1363 = 1.0;
    }
    float _1491 = _1363;
    float _1493 = _1491;
    if (!_1267)
    {
        float _1495 = _1417 * _1389;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        _1493 = _1497;
    }
    float _1499 = _1493;
    float _1501 = _1485 * _1467;
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1453 + _694;
    out.m_83.x = _1479;
    out.m_83.y = _1481;
    out.m_83.z = _1487;
    float _1507 = _732 + _694;
    float _1509 = -_1503;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1513 = _1505 * 0.5;
    float _1515 = _1507 * 0.5;
    float _1517 = _1511 * _1407;
    out.gl_Position.x = _732;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1453;
    out.gl_Position.w = _694;
    float _1519 = _1461 * _758;
    float _1521 = -_1461;
    float _1523 = _1521 + 1.0;
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1515;
    out.m_85.y = _1465;
    out.m_85.z = _1513;
    out.m_85.w = _694;
    float _1527 = _769 * _1519;
    float _1529 = _769 * _1523;
    out.m_87.x = _1525;
    float _1531 = _783 * _1519;
    float _1533 = fma(_779, _1527, _763);
    float _1535 = fma(_781, _1527, _765);
    float _1537 = _1527;
    float _1539 = _1515;
    if (!_1477)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1541 = _1537;
    float _1543 = fma(_769, _1531, _767);
    float _1545 = _1541;
    float _1547 = _1541;
    if (!_1477)
    {
        _981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1549 = _981;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1477)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1555 = _1489;
    float _1557 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_89.x = _1533;
    out.m_89.y = _1535;
    out.m_89.z = _1543;
    out.m_89.w = _1529;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1477)
    {
        _1539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1563 = _1539;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1477)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1569 = _983;
    float _1571 = _1569;
    float _1573 = _1569;
    if (!_1477)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1575 = _985;
    bool _1577 = !_1477;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_546);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _546 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = 1.0 / _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1601;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1631 = fma(_1625, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1553 = _1633;
            _1581 = _1639;
            _1567 = _1631;
            _1573 = _1637;
            _1561 = _1635;
            _1547 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_546);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1565;
            _1567 = _1655;
            if (!_1653)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1551;
            _1553 = _1657;
            if (!_1653)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1571;
            _1573 = _1661;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1579;
            _1581 = _1663;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1545;
            bool _1667 = !_1653;
            _1547 = _1665;
            if (!_1667)
            {
                bool _1669 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_546);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _546 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = 1.0 / _1685;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1687;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1717 = fma(_1711, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1553 = _1719;
                    _1581 = _1725;
                    _1567 = _1717;
                    _1573 = _1723;
                    _1561 = _1721;
                    _1547 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1553;
    float _1731 = _1581;
    float _1733 = _1567;
    float _1735 = _1573;
    float _1737 = _1561;
    float _1739 = _1547;
    float _1741 = fma(_1481, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    out.m_91.x = 0.0;
    float _1755 = fma(_1743, _1747, _1729);
    float _1757 = fma(_1743, _1753, _1733);
    out.m_49.x = _1749;
    float _1759 = -_1737;
    float _1761 = _1759 + _1739;
    float _1763 = _1755 * 0.586610972881317138671875;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1761, _1737);
    float _1769 = fma(_1757, 0.298911988735198974609375, _1763);
    bool _1771 = _1499 > 0.0;
    bool _1773 = isnan(_1499);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    float _1783 = -_1781;
    float _1785 = _1757 + _1783;
    float _1787 = -_1781;
    float _1789 = _1755 + _1787;
    float _1791 = -_1781;
    float _1793 = _1767 + _1791;
    float _1795 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1797 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1799 = fma(_1793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1801 = !_1765;
    if (!_1801)
    {
        float _1803 = -_428;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1807 = -_430;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1811 = -_432;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1815 = _1805 * _1805;
        float _1817 = fma(_1809, _1809, _1815);
        float _1819 = fma(_1813, _1813, _1817);
        float _1821 = sqrt(_1819);
        float _1823 = rsqrt(_1819);
        float _1825 = -_1821;
        float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = _1809 * _1823;
        float _1835 = _1805 * _1823;
        float _1837 = abs(_1831);
        float _1839 = log2(_1837);
        float _1841 = _1813 * _1823;
        float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1845 = _1481 * _1835;
        float _1847 = -_1835;
        float _1849 = -_1843;
        float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
        float _1853 = fma(_1479, _1833, _1845);
        float _1855 = -_1841;
        float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
        float _1859 = fma(_1487, _1841, _1853);
        float _1861 = precise::clamp(_1859, 0.0, 1.0);
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1865 = _1857 + _1863;
        float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = exp2(_1867);
        float _1875 = _1873 * _1871;
        float _1877 = _1861 * _1875;
        float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _1879;
        out.m_91.y = _1881;
        out.m_91.z = _1883;
    }
    out.m_93.x = _1795;
    out.m_93.y = _1797;
    out.m_93.z = _1799;
    if (_1779)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1885;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_128);
        out.gl_Position.z = _1942;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_142)
    {
        float _148 = float(_112);
        _122 = _148;
    }
    float _150 = _122;
    bool _152 = _146 >= _150;
    bool _154 = !_142;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_164);
        out.gl_Position.z = _2011;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.y;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _176 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _176;
    out.m_55.y = _178;
    out.m_55.z = _180;
    out.m_57.y = _166;
    bool _182 = !_170;
    float _184 = _166;
    float _202;
    if (!_182)
    {
        float _186 = in.m_59.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_112);
        float _208 = 1.0 / _206;
        float _210 = _146 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    float _214 = in.m_61.x;
    float _216 = in.m_61.y;
    float _218 = in.m_61.z;
    float _220 = -_166;
    float _222 = _220 + 1.0;
    float _224 = in.m_63.x;
    float _226 = in.m_63.y;
    float _228 = in.m_63.z;
    float _230 = in.m_65.x;
    float _232 = in.m_65.y;
    float _234 = in.m_65.z;
    float _236 = in.m_46.x;
    float _238 = in.m_46.y;
    float _240 = in.m_46.z;
    float _242 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c10)._m0[2].x, _218);
    float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _246 = _226 * _226;
    float _248 = _244 * 0.15915493667125701904296875;
    float _250 = fma(_224, _224, _246);
    float _252 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _258 = fma(_228, _228, _250);
    float _260 = _248 * 6.283185482025146484375;
    float _262 = sin(_260);
    float _264 = _254 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = rsqrt(_258);
    float _270 = _262 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _272 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _268 * _270;
    float _276 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _278 = _222 * _274;
    float _280 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _276);
    float _282 = fma(_224, _278, _214);
    float _284 = fma(_226, _278, _216);
    float _286 = fma(_228, _278, _218);
    float _288 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _282);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _280);
    float _294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _286);
    float _296 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = _290 * _272;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _284);
    float _302 = _294 * _266;
    float _304 = _292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _308 = _300 * _264;
    float _310 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _312 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = _308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _316 = _308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _318 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _310);
    float _320 = _308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _314);
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _316);
    float _326 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _318);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].x, _320);
    float _330 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[9].z, _328);
    float _338 = _304 + _330;
    float _340 = _312 + _332;
    float _342 = _334 + _336;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _350 = _340 + _348;
    float _352 = _346 * _346;
    float _354 = fma(_350, _350, _352);
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = _320;
    float _362 = _302;
    float _364 = _352;
    float _366 = _354;
    float _368 = _264;
    float _370 = _212;
    float _372 = _224;
    float _374 = _226;
    float _376 = _228;
    if (!_358)
    {
        _360 = _340;
    }
    float _378 = _360;
    float _380 = _378;
    if (!_358)
    {
        _362 = _338;
    }
    float _382 = _362;
    float _384 = _382;
    if (!_358)
    {
        _364 = _342;
    }
    float _386 = _364;
    bool _388 = !_358;
    float _390 = _386;
    if (!_388)
    {
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _396 = _356 + _394;
        float _398 = rsqrt(_354);
        float _400 = _396 * _392;
        float _402 = _342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _404 = _400 * 0.15915493667125701904296875;
        float _406 = _404 * 6.283185482025146484375;
        float _408 = cos(_406);
        float _410 = _404 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _408 + (-1.0);
        float _416 = _414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = fma(_412, _402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _420 = fma(_342, _408, _416);
        float _422 = _398 * _418;
        float _424 = fma(_350, _422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _426 = fma(_346, _422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _390 = _420;
        _380 = _424;
        _384 = _426;
    }
    float _428 = _390;
    float _430 = _380;
    float _432 = _384;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _436 = _428 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _440 = _430 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _444 = _432 + _442;
    float _446 = _436 * _436;
    float _448 = fma(_440, _440, _446);
    float _450 = fma(_444, _444, _448);
    float _452 = rsqrt(_450);
    float _454 = _452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _440 * _454;
    float _458 = _444 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _444;
    float _476 = _472;
    float _478 = _436;
    if (_468)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _480;
    }
    float _482 = _474;
    if (_468)
    {
        float _484 = rsqrt(_464);
        _366 = _484;
    }
    float _486 = _366;
    float _488 = _486;
    if (_468)
    {
        float _490 = _472 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_468)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _368 = _494;
    }
    float _496 = _368;
    float _498 = _446;
    float _500 = _496;
    if (_468)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _452;
    float _514 = _508;
    float _516 = _510;
    if (_468)
    {
        float _518 = _496 * 6.283185482025146484375;
        float _520 = cos(_518);
        _512 = _520;
    }
    float _522 = _512;
    float _524 = -_454;
    float _526 = -_510;
    float _528 = fma(_436, _524, _526);
    float _530 = _528;
    if (_468)
    {
        float _532 = _528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _532;
    }
    float _534 = _514;
    if (!_468)
    {
        _500 = _462;
    }
    float _536 = _500;
    float _538 = _506;
    float _540 = _536;
    if (_468)
    {
        float _542 = fma(_506, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = sqrt(_450);
    float _548 = _544;
    if (_468)
    {
        float _550 = _522 + (-1.0);
        _478 = _550;
    }
    float _552 = _478;
    float _554 = 0.0;
    float _556 = _552;
    if (_468)
    {
        float _558 = _486 * _544;
        _554 = _558;
    }
    float _560 = _554;
    if (!_468)
    {
        _488 = _456;
    }
    float _562 = _488;
    float _564 = _562;
    if (_468)
    {
        float _566 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _566;
    }
    float _568 = _516;
    if (_468)
    {
        float _570 = _456 * _560;
        _564 = _570;
    }
    float _572 = _564;
    if (!_468)
    {
        _556 = _460;
    }
    float _574 = _556;
    float _576 = _574;
    if (_468)
    {
        float _578 = fma(_528, _522, _568);
        _530 = _578;
    }
    float _580 = _530;
    if (!_468)
    {
        _548 = _458;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _572 * _572;
        _576 = _586;
    }
    float _588 = _576;
    if (_468)
    {
        float _590 = _458 * _560;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _596 = fma(_580, _580, _588);
    if (_468)
    {
        float _598 = _592 * _592;
        _540 = _598;
    }
    float _600 = _540;
    float _602 = _428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _594);
    float _606 = _596 + _600;
    float _608 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = rsqrt(_606);
    float _618 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = -_614;
    float _622 = _620 + 1.0;
    float _624 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = abs(_622);
    float _632 = log2(_630);
    float _634 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _636 = _428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _640 = -_634;
    float _642 = fma(_640, _626, 1.0);
    float _644 = _428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _636);
    float _648 = _616 * _572;
    float _650 = _616 * _580;
    float _652 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _646);
    float _656 = _616 * _592;
    float _658 = _648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = _654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _664 = floor(_624);
    float _666 = -_658;
    float _668 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _666);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _672 = _662 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _674 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _676 = -_656;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c15)._m0[21].z, _668);
    float _680 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _604);
    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].x, _672);
    float _684 = floor(_638);
    float _686 = fma(_678, -0.5, 0.5);
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _682);
    float _692 = fma(_678, 0.5, 0.5);
    float _694 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _690);
    float _696 = exp2(_674);
    float _698 = -_664;
    float _700 = _624 + _698;
    float _702 = _662 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _704 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].x, _702);
    float _706 = log2(_642);
    float _708 = _662 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _710 = -_684;
    float _712 = _638 + _710;
    float _714 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _716 = _650 + 1.0;
    float _718 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].x, _708);
    float _720 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _722 = fma(_692, _714, -0.212114393711090087890625);
    float _724 = 1.0 / _694;
    float _726 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _728 = -_650;
    float _730 = fma(_696, _716, _728);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _720);
    float _734 = sqrt(_686);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    float _738 = _706 * 0.693147182464599609375;
    float2 _2988 = float2(_700, _712);
    float _740 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2988, float2(0.0), isnan(_2988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2988, float2(0.0), isnan(_2988)), level(0.0)).x;
    float _742 = fma(_692, _722, 1.570728778839111328125);
    float _744 = fma(_730, 0.5, 0.5);
    float _746 = _738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = _732 * _724;
    float _750 = _736 * _724;
    float _752 = fma(_748, 0.5, 0.5);
    float _754 = fma(_750, -0.5, 0.5);
    float _756 = _734 * 0.636619746685028076171875;
    float3 _3022 = float3(_752, _754, _746);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3022, float3(0.0), isnan(_3022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3022, float3(0.0), isnan(_3022)), level(0.0)).x;
    float3 _3033 = float3(_752, _754, _746);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3033, float3(0.0), isnan(_3033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3033, float3(0.0), isnan(_3033)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_742;
    float _773 = fma(_756, _771, 1.0);
    float2 _3054 = float2(_773, _744);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3054, float2(0.0), isnan(_3054)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3054, float2(0.0), isnan(_3054)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_59.w;
    float _787 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _789 = in.m_59.y;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = in.m_59.x;
    float _801 = exp2(_787);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = in.m_53.x;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _815 = _813 != 0;
    out.m_67.x = _430;
    out.m_67.y = _428;
    out.m_67.z = _432;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _793;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _827 = _785 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = in.m_69.x;
    float _833 = in.m_69.y;
    float _835 = in.m_69.z;
    float _837 = in.m_69.w;
    bool _839 = _789 > 0.5;
    float _841 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _843 = _827 ? as_type<int>(_222) : as_type<int>(_166);
    float _845 = 1.0 / _825;
    int _847 = _839 ? as_type<int>(_222) : as_type<int>(_166);
    float _849 = _799 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = fma(_841, -2.0, _829);
    float _857 = _797 ? as_type<float>(_847) : _166;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _863 = _861 != 0;
    float _865 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _855);
    float _867 = -_801;
    float _869 = _867 + 1.0;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _873 = -_871;
    float _875 = fma(_849, 2.0, _873);
    float _877 = _224 * _835;
    float _879 = _833 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _881 = _833 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _883 = _833 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _885 = -_877;
    float _887 = fma(_228, _831, _885);
    float _889 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _891;
    float _895 = in.m_59.z;
    float _897 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[8].x, _881);
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c10)._m0[9].x, _883);
    float _901 = _893 * _821;
    float _903 = _226 * _831;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = _228 * _833;
    float _909 = _887 * _837;
    float _911 = -_903;
    float _913 = fma(_224, _833, _911);
    float _915 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].z, _899);
    float _917 = -_907;
    float _919 = fma(_226, _835, _917);
    float _921 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].z, _897);
    float _923 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].z, _889);
    float _925 = _913 * _837;
    float _927 = _919 * _837;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _931 = _212 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _939 = _212 + _937;
    out.m_71.x = _921;
    out.m_71.y = _915;
    out.m_71.z = _923;
    float _941 = fma(_901, _931, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _943 = _819 ? as_type<float>(_843) : _166;
    float _945 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _947 = _935 * _845;
    bool _949 = _895 > 0.5;
    float _951 = fma(_945, _857, -0.5);
    bool _953 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _955 = isnan(_212);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _967 = fma(_947, _939, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _969 = _921;
    bool _971 = _863;
    float _973 = _919;
    int _975 = as_type<int>(_935);
    int _977 = as_type<int>(_903);
    float _979 = _807;
    float _981 = _694;
    float _983 = _736;
    float _985 = _732;
    if (_863)
    {
        float _987 = _949 ? _222 : _166;
        _184 = _987;
    }
    float _989 = _184;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _993 = _991;
    if (!_853)
    {
        _969 = _789;
    }
    float _995 = _969;
    float _997 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _859);
    bool _999 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1001 = isnan(_212);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _991);
    float _1013 = _995;
    if (!_853)
    {
        _993 = _995;
    }
    float _1015 = _993;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1019 = _1015;
    if (_853)
    {
        _1013 = _789;
    }
    float _1021 = _1013;
    float _1023 = -_963;
    float _1025 = _1023 + 1.0;
    float _1027 = -_1009;
    float _1029 = _1027 + 1.0;
    bool _1031 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1033 = isnan(_212);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _1009 * _1025;
    float _1045 = _965 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_853)
    {
        _370 = _799;
    }
    float _1049 = _370;
    float _1051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1011);
    float _1053 = _1049;
    int _1055 = as_type<int>(_1051);
    if (!_853)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = fma(_943, _1045, -0.5);
    if (_805)
    {
        bool _1061 = _799 > 0.5;
        _971 = _1061;
    }
    bool _1063 = _971;
    float _1065 = -_865;
    float _1067 = fma(_1051, _951, _1065);
    if (_805)
    {
        float _1069 = -_807;
        float _1071 = _1069 + 1.0;
        _1055 = as_type<int>(_1071);
    }
    int _1073 = _1055;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_805)
    {
        _973 = _807;
    }
    float _1077 = _973;
    float _1079 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1081 = _1041 * _1029;
    float _1083 = -_1047;
    float _1085 = fma(_1075, 2.0, _1083);
    float _1087 = _1077;
    if (_805)
    {
        float _1089 = _1063 ? as_type<float>(_1073) : _807;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = _909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1095 = fma(_1079, _989, -0.5);
    float _1097 = _334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1099 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    if (_853)
    {
        _1019 = _799;
    }
    float _1101 = _1019;
    float _1103 = _334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1107 = -_1041;
    float _1109 = _1107 + 1.0;
    float _1111 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1113 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1097);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1105);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1119 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1121 = _941 * _1081;
    float _1123 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1125 = _909 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1127 = _909 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1129 = -_1117;
    float _1131 = fma(_1119, 2.0, _1129);
    float _1133 = _1127;
    float _1135 = _1123;
    float _1137 = _1117;
    float _1139 = _1109;
    if (_811)
    {
        float _1141 = -_807;
        float _1143 = _1141 + 1.0;
        _975 = as_type<int>(_1143);
    }
    int _1145 = _975;
    float _1147 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    if (_815)
    {
        float _1149 = -_807;
        float _1151 = _1149 + 1.0;
        _977 = as_type<int>(_1151);
    }
    int _1153 = _977;
    float _1155 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1125);
    float _1159 = fma(_927, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1127);
    if (!_811)
    {
        _1133 = _807;
    }
    float _1161 = _1133;
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1121);
    float _1165 = _1161;
    if (!_853)
    {
        _1135 = _895;
    }
    float _1167 = _1135;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1171 = _1167;
    if (!_853)
    {
        _1137 = _895;
    }
    float _1173 = _1137;
    float _1175 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1099);
    float _1177 = _1173;
    if (_811)
    {
        float _1179 = _949 ? as_type<float>(_1145) : _807;
        _1165 = _1179;
    }
    float _1181 = _1165;
    float _1183 = fma(_967, _1043, _1163);
    if (_815)
    {
        float _1185 = _839 ? as_type<float>(_1153) : _807;
        _979 = _1185;
    }
    float _1187 = _979;
    float _1189 = -_146;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _875);
    float _1193 = 1.0 / _1155;
    if (_853)
    {
        _1171 = _1021;
    }
    float _1195 = _1171;
    float _1197 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1183);
    if (_853)
    {
        _1177 = _1021;
    }
    float _1199 = _1177;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_853)
    {
        _1139 = _1021;
    }
    float _1203 = _1139;
    float _1205 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1207 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1201);
    float _1209 = _1205 + _1155;
    float _1211 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1219 = _1209 * _1193;
    float _1221 = _1219 * 0.5;
    float _1223 = fma(_925, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1159);
    float _1225 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1217);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1227);
    float _1231 = _1203;
    if (!_853)
    {
        _1231 = _799;
    }
    float _1233 = _1231;
    float _1235 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    out.m_73.x = _1211;
    out.m_73.y = _1175;
    out.m_73.z = _1223;
    float _1243 = fma(_1235, _1181, -0.5);
    float _1245 = -_146;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1249 = -_146;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1085);
    float _1253 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = 1.0 / _1229;
    float _1257 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    bool _1259 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1261 = isnan(0.5);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1267 = _1263 || _1265;
    float _1269 = fma(_1253, _1091, -0.5);
    bool _1271 = _284 != 0.0;
    bool _1273 = isnan(_284);
    bool _1275 = _1271 || _1273;
    bool _1277 = isnan(0.0);
    bool _1279 = _1275 || _1277;
    float _1281 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1283 = fma(_1241, -2.0, _1239);
    float _1285 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1289 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1225);
    float _1291 = fma(_1285, _1243, _1247);
    float _1293 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1297 = fma(_1289, _1269, _1191);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1301 = _1255 * _1299;
    float _1303 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1305 = fma(_1287, _1187, -0.5);
    float _1307 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1283);
    float _1309 = abs(_1301);
    float _1311 = log2(_1309);
    float _1313 = fma(_1303, -2.0, _1295);
    float _1315 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _997);
    float _1317 = fma(_1293, _1305, _1251);
    float _1319 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1321 = -_1307;
    float _1323 = fma(_1281, _1059, _1321);
    float _1325 = -_1319;
    float _1327 = fma(_1315, _1095, _1325);
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1333 = _1307;
    float _1335 = _1317;
    if (!_1267)
    {
        _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1337 = _1333;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1297 + 0.5;
    float _1343 = _1291 + 0.5;
    float _1345 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1347 = _1323 + 0.5;
    float _1349 = _1327 + 0.5;
    bool _1351 = _282 == 0.0;
    bool _1353 = !_1279;
    bool _1355 = _1351 && _1353;
    float _1357 = _1317 + 0.5;
    float _1359 = exp2(_1345);
    float _1361 = _1067 + 0.5;
    float _1363 = _1343;
    if (!_1267)
    {
        float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1367 = _1337 + _1365;
        _1335 = _1367;
    }
    float _1369 = _1335;
    float _1371 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1379 = _286 == 0.0;
    bool _1381 = _1379 && _1355;
    out.m_75.x = _1341;
    out.m_75.y = _1361;
    out.m_75.z = _1343;
    out.m_75.w = _1347;
    float _1383 = _1369;
    float _1385 = _1371;
    if (!_1267)
    {
        float _1387 = 1.0 / _1369;
        _1383 = _1387;
    }
    float _1389 = _1383;
    out.m_77.x = _1371;
    out.m_77.y = _1373;
    out.m_77.z = _1375;
    out.m_77.w = _1377;
    float _1391 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    out.m_79.x = _1357;
    out.m_79.y = _1349;
    float _1395 = fma(_1393, -2.0, 3.0);
    float _1397 = _1393 * _1393;
    if (!_1381)
    {
        float _1399 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _224);
        _372 = _1399;
    }
    float _1401 = _372;
    if (!_1381)
    {
        float _1403 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _226);
        _374 = _1403;
    }
    float _1405 = _374;
    float _1407 = in.m_81.x;
    float _1409 = _1397 * _1395;
    float _1411 = _662 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1267)
    {
        float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1415 = _1301 + _1413;
        _1385 = _1415;
    }
    float _1417 = _1385;
    if (!_1381)
    {
        float _1419 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _228);
        _376 = _1419;
    }
    float _1421 = _376;
    float _1423 = -_1409;
    float _1425 = _1423 + 1.0;
    float _1427 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1411);
    bool _1429 = _1301 <= 8000.0;
    bool _1431 = isnan(_1301);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(8000.0);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1409);
    float _1445 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1427);
    float _1447 = _694 * 0.5;
    float _1449 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1451 = _1439 * _1443;
    float _1453 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1445);
    float _1455 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1441);
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1449);
    float _1461 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1463 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1465 = fma(_736, -0.5, _1447);
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1469 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1471 = isnan(_546);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1477 = _1473 || _1475;
    float _1479 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1463);
    float _1481 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1457);
    float _1483 = -_740;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1421, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1489 = _1453;
    if (_1267)
    {
        _1363 = 1.0;
    }
    float _1491 = _1363;
    float _1493 = _1491;
    if (!_1267)
    {
        float _1495 = _1417 * _1389;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        _1493 = _1497;
    }
    float _1499 = _1493;
    float _1501 = _1485 * _1467;
    float _1503 = precise::clamp(_1501, 0.0, 1.0);
    float _1505 = _1453 + _694;
    out.m_83.x = _1479;
    out.m_83.y = _1481;
    out.m_83.z = _1487;
    float _1507 = _732 + _694;
    float _1509 = -_1503;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1513 = _1505 * 0.5;
    float _1515 = _1507 * 0.5;
    float _1517 = _1511 * _1407;
    out.gl_Position.x = _732;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1453;
    out.gl_Position.w = _694;
    float _1519 = _1461 * _758;
    float _1521 = -_1461;
    float _1523 = _1521 + 1.0;
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _1515;
    out.m_85.y = _1465;
    out.m_85.z = _1513;
    out.m_85.w = _694;
    float _1527 = _769 * _1519;
    float _1529 = _769 * _1523;
    out.m_87.x = _1525;
    float _1531 = _783 * _1519;
    float _1533 = fma(_779, _1527, _763);
    float _1535 = fma(_781, _1527, _765);
    float _1537 = _1527;
    float _1539 = _1515;
    if (!_1477)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1541 = _1537;
    float _1543 = fma(_769, _1531, _767);
    float _1545 = _1541;
    float _1547 = _1541;
    if (!_1477)
    {
        _981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1549 = _981;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1477)
    {
        _1489 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1555 = _1489;
    float _1557 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_89.x = _1533;
    out.m_89.y = _1535;
    out.m_89.z = _1543;
    out.m_89.w = _1529;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1477)
    {
        _1539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1563 = _1539;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1477)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1569 = _983;
    float _1571 = _1569;
    float _1573 = _1569;
    if (!_1477)
    {
        _985 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1575 = _985;
    bool _1577 = !_1477;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_546);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _546 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = 1.0 / _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1605 = _1603 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1601;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1631 = fma(_1625, _1605, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1553 = _1633;
            _1581 = _1639;
            _1567 = _1631;
            _1573 = _1637;
            _1561 = _1635;
            _1547 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_546);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1565;
            _1567 = _1655;
            if (!_1653)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1551;
            _1553 = _1657;
            if (!_1653)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1559;
            _1561 = _1659;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1571;
            _1573 = _1661;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1579;
            _1581 = _1663;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1545;
            bool _1667 = !_1653;
            _1547 = _1665;
            if (!_1667)
            {
                bool _1669 = _546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_546);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _546 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = 1.0 / _1685;
                    float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1687;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1717 = fma(_1711, _1691, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1553 = _1719;
                    _1581 = _1725;
                    _1567 = _1717;
                    _1573 = _1723;
                    _1561 = _1721;
                    _1547 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1553;
    float _1731 = _1581;
    float _1733 = _1567;
    float _1735 = _1573;
    float _1737 = _1561;
    float _1739 = _1547;
    float _1741 = fma(_1481, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    out.m_91.x = 0.0;
    float _1755 = fma(_1743, _1747, _1729);
    float _1757 = fma(_1743, _1753, _1733);
    out.m_49.x = _1749;
    float _1759 = -_1737;
    float _1761 = _1759 + _1739;
    float _1763 = _1755 * 0.586610972881317138671875;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1761, _1737);
    float _1769 = fma(_1757, 0.298911988735198974609375, _1763);
    bool _1771 = _1499 > 0.0;
    bool _1773 = isnan(_1499);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    float _1783 = -_1781;
    float _1785 = _1757 + _1783;
    float _1787 = -_1781;
    float _1789 = _1755 + _1787;
    float _1791 = -_1781;
    float _1793 = _1767 + _1791;
    float _1795 = fma(_1785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1797 = fma(_1789, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1799 = fma(_1793, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1801 = !_1765;
    if (!_1801)
    {
        float _1803 = -_428;
        float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1807 = -_430;
        float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1811 = -_432;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1815 = _1805 * _1805;
        float _1817 = fma(_1809, _1809, _1815);
        float _1819 = fma(_1813, _1813, _1817);
        float _1821 = sqrt(_1819);
        float _1823 = rsqrt(_1819);
        float _1825 = -_1821;
        float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1831 = precise::clamp(_1829, 0.0, 1.0);
        float _1833 = _1809 * _1823;
        float _1835 = _1805 * _1823;
        float _1837 = abs(_1831);
        float _1839 = log2(_1837);
        float _1841 = _1813 * _1823;
        float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1845 = _1481 * _1835;
        float _1847 = -_1835;
        float _1849 = -_1843;
        float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
        float _1853 = fma(_1479, _1833, _1845);
        float _1855 = -_1841;
        float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
        float _1859 = fma(_1487, _1841, _1853);
        float _1861 = precise::clamp(_1859, 0.0, 1.0);
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1865 = _1857 + _1863;
        float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        float _1873 = exp2(_1867);
        float _1875 = _1873 * _1871;
        float _1877 = _1861 * _1875;
        float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _1879;
        out.m_91.y = _1881;
        out.m_91.z = _1883;
    }
    out.m_93.x = _1795;
    out.m_93.y = _1797;
    out.m_93.z = _1799;
    if (_1779)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1885;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

