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
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 m_95 [[user(locn14)]];
    float4 m_87 [[user(locn15)]];
    float4 m_89 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1739 = false;
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
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_132);
        out.gl_Position.z = _2025;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_168);
        out.gl_Position.z = _2094;
    }
    if (_160)
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
    float _182 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _186 = isnan(0.5);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _192 = _188 || _190;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.y;
    float _202 = fma(_172, 16.0, _182);
    float _204 = _202 * 0.15915493667125701904296875;
    float _206 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = in.m_46.x;
    float _210 = in.m_46.y;
    float _212 = in.m_46.z;
    float _214 = _204 * 6.283185482025146484375;
    float _216 = sin(_214);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _222 = fma(_216, 0.5, 0.5);
    float _224 = _222 * 0.004999999888241291046142578125;
    float _226 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _228 = fma(_194, _224, _170);
    float _230 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _232 = fma(_196, _224, _172);
    float _234 = fma(_198, _224, _174);
    float _236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _238 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _236 * _230;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _232);
    float _246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _234);
    float _248 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _244 * _238;
    float _252 = _246 * _220;
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _256 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _258 = _250 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _250 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _254);
    float _264 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _268 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _272 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _274 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _276 = _270 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _280 = _264 + _274;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _284 = _282 != 0;
    float _286 = _250 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _288 = _276 + _278;
    float _290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _292 = _280 + _290;
    float _294 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _272);
    float _296 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _286);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _306 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _308 = _268;
    float _310 = _208;
    float _312 = _212;
    float _314 = _292;
    float _316 = _280;
    float _318 = _194;
    float _320 = _196;
    float _322 = _198;
    float _324 = _200;
    if (_192)
    {
        _308 = 1.0;
    }
    float _326 = _308;
    float _328 = fma(_300, _300, _302);
    float _330 = _304 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _332 = 0.0;
    float _334 = _326;
    if (_284)
    {
        float _336 = in.m_59.x;
        _332 = _336;
    }
    float _338 = _332;
    float _340 = 0.0;
    if (_284)
    {
        _340 = _200;
    }
    float _342 = _340;
    float _344 = sqrt(_328);
    int _346 = 0;
    float _348 = _342;
    if (_284)
    {
        _346 = 0;
    }
    int _350 = _346;
    float _352 = _330 + _306;
    int _354 = 0;
    int _356 = _350;
    float _358 = _352;
    if (_284)
    {
        _354 = 0;
    }
    int _360 = _354;
    bool _362 = _344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = 0.0;
    int _366 = _360;
    float _368 = _338;
    if (_284)
    {
        _364 = _338;
    }
    float _370 = _364;
    float _372 = _370;
    if (!_284)
    {
        float _374 = in.m_59.x;
        float _376 = _200 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        float _384 = _374 * 3.1415927410125732421875;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = sin(_388);
        _310 = _386;
        _366 = 2;
        _356 = 1;
        _368 = _374;
        _372 = _390;
        _348 = _382;
    }
    float _392 = _310;
    int _394 = _366;
    int _396 = _356;
    float _398 = _368;
    float _400 = _372;
    float _402 = _348;
    float _404 = _392;
    if (!_362)
    {
        _404 = _288;
    }
    float _406 = _404;
    float _408 = _406;
    if (!_362)
    {
        _312 = _280;
    }
    float _410 = _312;
    bool _412 = !_362;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _344 + _418;
        float _422 = _352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_328);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = cos(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = sin(_434);
        float _438 = _432 + (-1.0);
        float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _442 = fma(_436, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = fma(_352, _432, _440);
        float _446 = _424 * _442;
        float _448 = fma(_300, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _450 = fma(_292, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _444;
        _408 = _448;
        _414 = _450;
    }
    float _452 = _358;
    float _454 = _408;
    float _456 = _414;
    if (!_192)
    {
        float _458 = in.m_61.w;
        int _460 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _462 = _460 == 4;
        bool _464 = _460 == 8;
        bool _466 = _460 == 12;
        int _468 = as_type<int>(_458) << 16;
        int _470 = as_type<int>(_458) << 8;
        int _472 = as_type<int>(_458) << 24;
        int _474 = _468 >> 24;
        int _476 = _470 >> 24;
        int _478 = as_type<int>(_458) >> 24;
        int _480 = _472 >> 24;
        float _482 = float(_474);
        float _484 = float(_476);
        float _486 = float(_478);
        float _488 = _482 * 0.0078740157186985015869140625;
        float _490 = float(_480);
        float _492 = _484 * 0.0078740157186985015869140625;
        float _494 = _486 * 0.0078740157186985015869140625;
        float _496 = precise::min(_488, 1.0);
        float _498 = _490 * 0.0078740157186985015869140625;
        float _500 = precise::min(_492, 1.0);
        float _502 = precise::min(_494, 1.0);
        float _504 = precise::min(_498, 1.0);
        float _506 = precise::max(_496, -1.0);
        float _508 = precise::max(_500, -1.0);
        float _510 = precise::max(_502, -1.0);
        float _512 = precise::max(_504, -1.0);
        float _514 = _512;
        if (_462)
        {
            _514 = _506;
        }
        float _516 = _514;
        float _518 = _516;
        if (_464)
        {
            _518 = _508;
        }
        float _520 = _518;
        float _522 = _520;
        if (_466)
        {
            _522 = _510;
        }
        float _524 = _522;
        float _526 = abs(_524);
        float _528 = (-0.0) + _526;
        _334 = _528;
    }
    float _530 = _334;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _452 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _454 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _542 = _456 + _540;
    float _544 = _534 * _534;
    float _546 = _452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _548 = _530 != 0.0;
    bool _550 = isnan(_530);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = fma(_538, _538, _544);
    float _560 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _546);
    float _562 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _564 = fma(_542, _542, _558);
    float _566 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _560);
    float _568 = rsqrt(_564);
    float _570 = _566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _572 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _574 = _538 * _572;
    float _576 = _542 * _572;
    float _578 = _574 * _574;
    float _580 = _576 * _576;
    float _582 = _578 + _580;
    float _584 = sqrt(_582);
    bool _586 = _584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _590 = _584 + _588;
    float _592 = _568;
    float _594 = _590;
    float _596 = _534;
    float _598 = _578;
    bool _600 = _586;
    float _602 = _530;
    if (_586)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _604;
    }
    float _606 = _592;
    if (_586)
    {
        float _608 = rsqrt(_582);
        _314 = _608;
    }
    float _610 = _314;
    float _612 = _610;
    if (_586)
    {
        float _614 = _590 * _606;
        _594 = _614;
    }
    float _616 = _594;
    float _618 = _452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_586)
    {
        float _620 = _616 * 0.15915493667125701904296875;
        _316 = _620;
    }
    float _622 = _316;
    float _624 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _626 = fma(_276, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _628 = _542;
    float _630 = _622;
    if (_586)
    {
        float _632 = _622 * 6.283185482025146484375;
        float _634 = sin(_632);
        _628 = _634;
    }
    float _636 = _628;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _640 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _624);
    float _642 = precise::max(0.0, _638);
    float _644 = _288;
    float _646 = _642;
    if (_586)
    {
        float _648 = _622 * 6.283185482025146484375;
        float _650 = cos(_648);
        _644 = _650;
    }
    float _652 = _644;
    float _654 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _656 = -_572;
    float _658 = -_642;
    float _660 = fma(_534, _656, _658);
    if (_586)
    {
        float _662 = _660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _662;
    }
    float _664 = _596;
    float _666 = _664;
    if (!_586)
    {
        _630 = _580;
    }
    float _668 = _630;
    float _670 = floor(_626);
    float _672 = _636;
    float _674 = _668;
    if (_586)
    {
        float _676 = fma(_636, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _666 = _676;
    }
    float _678 = _666;
    float _680 = _678;
    if (!_586)
    {
        _672 = _576;
    }
    float _682 = _672;
    float _684 = _682;
    if (_586)
    {
        float _686 = _652 + (-1.0);
        _646 = _686;
    }
    float _688 = _646;
    float _690 = 0.0;
    float _692 = _688;
    if (_586)
    {
        float _694 = _610 * _678;
        _690 = _694;
    }
    float _696 = _690;
    if (!_586)
    {
        _612 = _574;
    }
    float _698 = _612;
    float _700 = _698;
    if (_586)
    {
        float _702 = _688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _692 = _702;
    }
    float _704 = _692;
    if (_586)
    {
        float _706 = _574 * _696;
        _700 = _706;
    }
    float _708 = _700;
    if (!_586)
    {
        _680 = _660;
    }
    float _710 = _680;
    float _712 = _710;
    if (_586)
    {
        float _714 = _576 * _696;
        _684 = _714;
    }
    float _716 = _684;
    if (_586)
    {
        float _718 = fma(_660, _652, _704);
        _712 = _718;
    }
    float _720 = _712;
    if (_586)
    {
        float _722 = _708 * _708;
        _598 = _722;
    }
    float _724 = _598;
    float _726 = sqrt(_564);
    if (_586)
    {
        float _728 = _716 * _716;
        _674 = _728;
    }
    float _730 = _674;
    float _732 = _452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_720, _720, _724);
    float _736 = _452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _740 = _734 + _730;
    float _742 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _744 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _738);
    float _746 = fma(_264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _748 = -_670;
    float _750 = _626 + _748;
    float _752 = rsqrt(_740);
    float _754 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _742);
    float _756 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[23].w, _758);
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _768 = -_762;
    float _770 = _768 + 1.0;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _774 = floor(_746);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _766);
    float _778 = -_772;
    float _780 = fma(_778, _562, 1.0);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _784 = _654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _752 * _708;
    float _788 = abs(_770);
    float _790 = log2(_788);
    float _792 = _752 * _720;
    float _794 = _752 * _716;
    float _796 = _786 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _798 = _654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _800 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _802 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _804 = -_796;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _804);
    float _808 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _798);
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _800);
    float _812 = 1.0 / _802;
    float _814 = -_794;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _806);
    float _818 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _808);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _822 = fma(_816, -0.5, 0.5);
    float _824 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _826 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = log2(_780);
    float _830 = fma(_816, 0.5, 0.5);
    float _832 = _810;
    float _834 = _796;
    float _836 = _802;
    float _838 = _820;
    if (_556)
    {
        _832 = _820;
    }
    float _840 = _832;
    float _842 = -_774;
    float _844 = _746 + _842;
    float _846 = _840;
    if (_556)
    {
        _834 = _826;
    }
    float _848 = _834;
    float _850 = fma(_830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _852 = _848;
    if (!_556)
    {
        _852 = 0.0;
    }
    float _854 = _852;
    float _856 = _792 + 1.0;
    float _858 = exp2(_824);
    if (!_556)
    {
        _846 = 0.0;
    }
    float _860 = _846;
    float _862 = fma(_830, _850, -0.212114393711090087890625);
    float _864 = _812 * _854;
    float _866 = sqrt(_822);
    float _868 = _812 * _860;
    float _870 = _828 * 0.693147182464599609375;
    float2 _3178 = float2(_750, _844);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3178, float2(0.0), isnan(_3178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3178, float2(0.0), isnan(_3178)), level(0.0)).x;
    float _874 = fma(_830, _862, 1.570728778839111328125);
    float _876 = -_792;
    float _878 = fma(_858, _856, _876);
    float _880 = fma(_864, 0.5, 0.5);
    float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _884 = fma(_868, -0.5, 0.5);
    float _886 = fma(_878, 0.5, 0.5);
    float _888 = _866 * 0.636619746685028076171875;
    float3 _3212 = float3(_880, _884, _882);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3212, float3(0.0), isnan(_3212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3212, float3(0.0), isnan(_3212)), level(0.0)).x;
    float3 _3223 = float3(_880, _884, _882);
    float4 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3223, float3(0.0), isnan(_3223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3223, float3(0.0), isnan(_3223)), level(0.0)).xyzw;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float _901 = _893.w;
    float _903 = -_874;
    float _905 = fma(_888, _903, 1.0);
    float2 _3244 = float2(_905, _886);
    float3 _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3244, float2(0.0), isnan(_3244)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3244, float2(0.0), isnan(_3244)), level(0.0)).xyz;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = in.m_63.x;
    float _919 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_59.w;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = in.m_63.y;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _941 = _939 != 0;
    float _943 = fma(_919, -2.0, _931);
    float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _947 = in.m_59.z;
    float _949 = _654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = _860;
    int _953 = as_type<int>(_880);
    if (_923)
    {
        float _955 = in.m_59.x;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 0.0;
    if (_929)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _917;
    if (_923)
    {
        float _973 = -_917;
        float _975 = _973 + 1.0;
        _953 = as_type<int>(_975);
    }
    int _977 = _953;
    float _979 = 0.0;
    if (!_923)
    {
        _979 = _917;
    }
    float _981 = _979;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _985 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _987 = _925 > 0.5;
    float _989 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _993 = -_937;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_65.y = _937;
    int _1003 = _987 ? as_type<int>(_995) : as_type<int>(_937);
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1007 = _947 > 0.5;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _981;
    int _1013 = as_type<int>(_991);
    float _1015 = _947;
    if (_923)
    {
        bool _1017 = _957 > 0.5;
        _600 = _1017;
    }
    bool _1019 = _600;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1025 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    if (_923)
    {
        float _1027 = _1019 ? as_type<float>(_977) : _917;
        _1011 = _1027;
    }
    float _1029 = _1011;
    out.m_67.x = _454;
    out.m_67.y = _452;
    out.m_67.z = _456;
    bool _1031 = _200 > 0.5;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    float _1043 = in.m_69.w;
    int _1045 = _1031 ? as_type<int>(_995) : as_type<int>(_937);
    float _1047 = exp2(_1023);
    int _1049 = _1007 ? as_type<int>(_995) : as_type<int>(_937);
    out.m_71.x = _1005;
    out.m_71.y = _1009;
    out.m_71.z = _1021;
    float _1051 = _935 ? as_type<float>(_1045) : _937;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1059 = _1057 != 0;
    float _1061 = _1055 ? as_type<float>(_1003) : _937;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1065 = _1063 != 0;
    float _1067 = _967 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = _196 * _1037;
    float _1077 = _194 * _1041;
    float _1079 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1083 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1085 = -_1075;
    float _1087 = fma(_194, _1039, _1085);
    float _1089 = -_1077;
    float _1091 = fma(_198, _1037, _1089);
    float _1093 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1079);
    float _1095 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1081);
    float _1097 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1083);
    float _1099 = _1059 ? as_type<float>(_1049) : _937;
    float _1101 = _198 * _1039;
    bool _1103 = _1059;
    if (_929)
    {
        bool _1105 = _965 > 0.5;
        _1103 = _1105;
    }
    bool _1107 = _1103;
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1113 = -_1101;
    float _1115 = fma(_196, _1041, _1113);
    float _1117 = _1091 * _1043;
    float _1119 = _1065 ? as_type<float>(_1049) : _937;
    out.m_73.x = _1109;
    out.m_73.y = _985;
    out.m_73.z = _989;
    out.m_73.w = _983;
    float _1121 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1127 = _1115 * _1043;
    float _1129 = _1087 * _1043;
    float _1131 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1133 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1123);
    float _1137 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1093);
    float _1139 = fma(_1131, _1051, -0.5);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1143 = _991 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1125);
    float _1147 = _1123;
    int _1149 = as_type<int>(_1139);
    int _1151 = as_type<int>(_1127);
    if (!_941)
    {
        _1147 = _917;
    }
    float _1153 = _1147;
    float _1155 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1141);
    float _1157 = fma(_1067, _1099, -0.5);
    float _1159 = fma(_1133, _1119, -0.5);
    float _1161 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1163 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1167 = fma(_1143, _1061, -0.5);
    float _1169 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1171 = -_1161;
    float _1173 = fma(_1163, _1139, _1171);
    float _1175 = _1153;
    float _1177 = _1163;
    if (_941)
    {
        float _1179 = -_917;
        float _1181 = _1179 + 1.0;
        _1149 = as_type<int>(_1181);
    }
    int _1183 = _1149;
    float _1185 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1097);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1169);
    if (_929)
    {
        float _1189 = -_917;
        float _1191 = _1189 + 1.0;
        _1151 = as_type<int>(_1191);
    }
    int _1193 = _1151;
    if (_1035)
    {
        float _1195 = -_917;
        float _1197 = _1195 + 1.0;
        _1013 = as_type<int>(_1197);
    }
    int _1199 = _1013;
    if (_941)
    {
        float _1201 = _1031 ? as_type<float>(_1183) : _917;
        _1175 = _1201;
    }
    float _1203 = _1175;
    float _1205 = _330 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _330 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_929)
    {
        _1177 = _917;
    }
    float _1209 = _1177;
    out.m_75.x = _1137;
    out.m_75.y = _1121;
    out.m_75.z = _1185;
    float _1211 = _1209;
    if (_929)
    {
        float _1213 = _1107 ? as_type<float>(_1193) : _917;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    bool _1219 = _394 != 2;
    float _1221 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1187);
    if (_1035)
    {
        float _1223 = _1031 ? as_type<float>(_1199) : _917;
        _971 = _1223;
    }
    float _1225 = _971;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1229 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1135);
    bool _1231 = _396 != 1;
    float _1233 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1145);
    float _1235 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1217);
    float _1237 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1239 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1243 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = fma(_1239, _1215, -0.5);
    out.m_77.x = _1221;
    out.m_77.y = _1229;
    out.m_77.z = _1233;
    float _1247 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1251 = _232 != 0.0;
    bool _1253 = isnan(_232);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1263 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1265 = -_1249;
    float _1267 = fma(_1243, 2.0, _1265);
    float _1269 = _400 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1271 = _228 == 0.0;
    bool _1273 = !_1259;
    bool _1275 = _1271 && _1273;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1281 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1285 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1277);
    float _1287 = fma(_1279, _1225, -0.5);
    float _1289 = fma(_1281, _1203, -0.5);
    float _1291 = -_1283;
    float _1293 = fma(_1269, 2.0, _1291);
    float _1295 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1299 = _402 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1301 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1285);
    float _1305 = fma(_1299, -2.0, _1297);
    float _1307 = -_150;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1293);
    float _1311 = 1.0 / _1301;
    float _1313 = _1263 + _1301;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1317 = fma(_1303, _1287, _1309);
    float _1319 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1315);
    float _1321 = fma(_1295, _1029, -0.5);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1325 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1319);
    bool _1327 = _234 == 0.0;
    bool _1329 = _1327 && _1275;
    float _1331 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1323);
    float _1333 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1305);
    float _1335 = _1313 * _1311;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1331);
    float _1341 = -_150;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1267);
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1159, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = _1333;
    float _1355 = _1267;
    float _1357 = _1313;
    if (!_1231)
    {
        _1353 = _200;
    }
    float _1359 = _1353;
    float _1361 = fma(_1339, _1321, _1343);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1365 = _1359;
    if (!_1231)
    {
        _1355 = _1359;
    }
    float _1367 = _1355;
    float _1369 = 1.0 / _1351;
    float _1371 = _1367;
    if (_1231)
    {
        _1365 = _398;
    }
    float _1373 = _1365;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1219)
    {
        _1357 = _398;
    }
    float _1377 = _1357;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1381 = _1377;
    float _1383 = _1379;
    if (!_1219)
    {
        _1381 = _947;
    }
    float _1385 = _1381;
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1375);
    float _1389 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1363);
    float _1391 = _1347 + 0.5;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1395 = _1317 + 0.5;
    if (_1231)
    {
        _1371 = _398;
    }
    float _1397 = _1371;
    if (!_1329)
    {
        float _1399 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _194);
        _318 = _1399;
    }
    float _1401 = _318;
    float _1403 = -_1379;
    float _1405 = fma(_1393, 2.0, _1403);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1411 = _1369 * _1409;
    out.m_79.x = _1395;
    out.m_79.y = _1391;
    float _1413 = -_150;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1405);
    float _1417 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1407);
    float _1419 = abs(_1411);
    float _1421 = log2(_1419);
    if (!_1231)
    {
        _1383 = _947;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (!_1329)
    {
        float _1427 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _196);
        _320 = _1427;
    }
    float _1429 = _320;
    if (_1231)
    {
        _1425 = _200;
    }
    float _1431 = _1425;
    float _1433 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1387);
    if (_1231)
    {
        _1015 = _200;
    }
    float _1435 = _1015;
    if (!_1329)
    {
        float _1437 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _198);
        _322 = _1437;
    }
    float _1439 = _322;
    float _1441 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1417);
    float _1443 = fma(_1441, _1289, _1415);
    if (!_1219)
    {
        _324 = _398;
    }
    float _1445 = _324;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1449 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1453 = -_1447;
    float _1455 = fma(_1449, 2.0, _1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1461 = exp2(_1451);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1465 = -_150;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1455);
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1457);
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1473 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1475 = fma(_1433, _1245, _1467);
    float _1477 = fma(_1471, -2.0, _1463);
    float _1479 = fma(_1473, -2.0, _1459);
    float _1481 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1389);
    float _1483 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1469);
    float _1485 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1477);
    float _1487 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1479);
    bool _1489 = _1411 <= 8000.0;
    bool _1491 = isnan(_1411);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(8000.0);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = _1361 + 0.5;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1485;
    float _1509 = fma(_1481, _1157, _1507);
    float _1511 = -_1487;
    float _1513 = fma(_1483, _1167, _1511);
    float _1515 = _1173 + 0.5;
    float _1517 = fma(_1505, -2.0, 3.0);
    float _1519 = _1505 * _1505;
    float _1521 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1523 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1525 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1527 = _1519 * _1517;
    float _1529 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1521);
    float _1533 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1523);
    float _1535 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1525);
    float _1537 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1529);
    float _1539 = -_1527;
    float _1541 = _1539 + 1.0;
    float _1543 = in.m_61.x;
    float _1545 = _1475 + 0.5;
    float _1547 = _1513 + 0.5;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1527);
    int _1551 = as_type<int>(_1455);
    float _1553 = _1537;
    if (!_556)
    {
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1551 = as_type<int>(_1555);
    }
    int _1557 = _1551;
    float _1559 = _1537 + _802;
    float _1561 = -_872;
    float _1563 = _1561 + 1.0;
    float _1565 = _1499 * _1549;
    out.m_81.x = _1501;
    out.m_81.y = _1515;
    out.m_81.z = _1545;
    out.m_81.w = _1547;
    float _1567 = _1443 + 0.5;
    float _1569 = _802 * 0.5;
    out.gl_Position.x = _826;
    out.gl_Position.y = _820;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _802;
    float _1571 = _1509 + 0.5;
    bool _1573 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1575 = isnan(_726);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1581 = _1577 || _1579;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4520 = as_type<float>(_1557);
        out.gl_Position.z = _4520;
    }
    out.m_83.x = _1567;
    out.m_83.y = _1571;
    float _1583 = _1559 * 0.5;
    float _1585 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1587 = _826 + _802;
    float _1589 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1591 = _1563 * _1585;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = fma(_820, -0.5, _1569);
    float _1597 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1531);
    float _1599 = _1589 * _890;
    float _1601 = -_1593;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1605 = -_1589;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1533);
    float _1611 = _901 * _1599;
    float _1613 = _1603 * _1543;
    float _1615 = _915 * _1599;
    float _1617 = fma(_911, _1611, _895);
    float _1619 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1535);
    float _1621 = fma(_913, _1611, _897);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1625 = _901 * _1607;
    float _1627 = fma(_901, _1615, _899);
    out.m_85.z = _1583;
    out.m_85.w = _802;
    float _1629 = _1587 * 0.5;
    float _1631 = _1607;
    float _1633 = _1629;
    if (!_1581)
    {
        _836 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1635 = _836;
    out.m_87.x = _1623;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1581)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1641 = _1553;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1581)
    {
        _838 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1647 = _838;
    out.m_89.x = _1617;
    out.m_89.y = _1621;
    out.m_89.z = _1627;
    out.m_89.w = _1625;
    float _1649 = _1647;
    float _1651 = _1647;
    if (!_1581)
    {
        _1631 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1653 = _1631;
    out.m_91.x = _1597;
    out.m_91.y = _1609;
    out.m_91.z = _1619;
    out.m_93.x = _1629;
    out.m_93.y = _1595;
    out.m_93.z = _1583;
    out.m_93.w = _802;
    float _1655 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1657 = _1655;
    float _1659 = _1653;
    float _1661 = _1653;
    if (!_556)
    {
        _1657 = 0.0;
    }
    float _1663 = _1657;
    if (!_1581)
    {
        _1633 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1665 = _1633;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1581)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1671 = _602;
    bool _1673 = !_1581;
    float _1675 = _1671;
    float _1677 = _1671;
    if (!_1673)
    {
        bool _1679 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1681 = isnan(_726);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = _726 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1695 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1693;
            float _1697 = 1.0 / _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1719 = _1691 * _1697;
            float _1721 = precise::clamp(_1719, 0.0, 1.0);
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1727 = fma(_1721, _1705, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1721, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1733 = fma(_1721, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1735 = fma(_1721, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1737 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1661 = _1731;
            _1639 = _1735;
            _1651 = _1729;
            _1669 = _1733;
            _1677 = _1727;
            _1645 = _1737;
            _1739 = true;
        }
        else
        {
            bool _1741 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1743 = isnan(_726);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1749 = _1745 || _1747;
            if (!_1749)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1751 = _1667;
            _1669 = _1751;
            if (!_1749)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1753 = _1637;
            _1639 = _1753;
            if (!_1749)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1755 = _1643;
            _1645 = _1755;
            if (!_1749)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1757 = _1649;
            _1651 = _1757;
            if (!_1749)
            {
                _1659 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1759 = _1659;
            _1661 = _1759;
            if (!_1749)
            {
                _1675 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1761 = _1675;
            bool _1763 = !_1749;
            _1677 = _1761;
            if (!_1763)
            {
                bool _1765 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1767 = isnan(_726);
                bool _1769 = _1765 || _1767;
                bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1773 = _1769 || _1771;
                if (!_1773)
                {
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = _726 + _1775;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1779;
                    float _1783 = 1.0 / _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1805 = _1777 * _1783;
                    float _1807 = precise::clamp(_1805, 0.0, 1.0);
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1813 = fma(_1807, _1791, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1807, _1811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1807, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1819 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1821 = fma(_1807, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1823 = fma(_1807, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1661 = _1817;
                    _1639 = _1821;
                    _1651 = _1815;
                    _1669 = _1819;
                    _1677 = _1813;
                    _1645 = _1823;
                    _1739 = true;
                }
                else
                {
                    _1661 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1677 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1739 = false;
    float _1825 = _1661;
    float _1827 = _1639;
    float _1829 = _1651;
    float _1831 = _1669;
    float _1833 = _1677;
    float _1835 = _1645;
    float _1837 = fma(_1609, -0.5, 0.5);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = -_1825;
    float _1843 = _1827 + _1841;
    float _1845 = -_1829;
    float _1847 = _1831 + _1845;
    float _1849 = -_1833;
    float _1851 = _1835 + _1849;
    bool _1853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1855 = fma(_1839, _1843, _1825);
    float _1857 = fma(_1839, _1847, _1829);
    float _1859 = fma(_1839, _1851, _1833);
    float _1861 = _1663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = _1855 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1865 = fma(_1857, 0.298911988735198974609375, _1863);
    out.m_49.x = _1861;
    float _1867 = fma(_1859, 0.114477999508380889892578125, _1865);
    float _1869 = -_1867;
    float _1871 = _1857 + _1869;
    float _1873 = -_1867;
    float _1875 = _1855 + _1873;
    float _1877 = -_1867;
    float _1879 = _1859 + _1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1883 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1885 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    out.m_97.x = _1881;
    out.m_97.y = _1883;
    out.m_97.z = _1885;
    if (!_1853)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1887 = -_452;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1891 = -_454;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1895 = -_456;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = sqrt(_1903);
    float _1907 = rsqrt(_1903);
    float _1909 = -_1905;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1913 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1915 = precise::clamp(_1913, 0.0, 1.0);
    float _1917 = _1893 * _1907;
    float _1919 = _1889 * _1907;
    float _1921 = abs(_1915);
    float _1923 = log2(_1921);
    float _1925 = _1897 * _1907;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1929 = _1609 * _1919;
    float _1931 = -_1919;
    float _1933 = -_1927;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1933);
    float _1937 = fma(_1597, _1917, _1929);
    float _1939 = -_1925;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1935);
    float _1943 = fma(_1619, _1925, _1937);
    float _1945 = precise::clamp(_1943, 0.0, 1.0);
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1949 = _1941 + _1947;
    float _1951 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = exp2(_1951);
    float _1959 = _1957 * _1955;
    float _1961 = _1945 * _1959;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1965 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1967 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1963;
    out.m_95.y = _1965;
    out.m_95.z = _1967;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1739 = false;
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
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_132);
        out.gl_Position.z = _2025;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_168);
        out.gl_Position.z = _2094;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _186 = isnan(0.5);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _192 = _188 || _190;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.y;
    float _202 = fma(_172, 16.0, _182);
    float _204 = _202 * 0.15915493667125701904296875;
    float _206 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = in.m_46.x;
    float _210 = in.m_46.y;
    float _212 = in.m_46.z;
    float _214 = _204 * 6.283185482025146484375;
    float _216 = sin(_214);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _222 = fma(_216, 0.5, 0.5);
    float _224 = _222 * 0.004999999888241291046142578125;
    float _226 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _228 = fma(_194, _224, _170);
    float _230 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _232 = fma(_196, _224, _172);
    float _234 = fma(_198, _224, _174);
    float _236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _238 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _236 * _230;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _232);
    float _246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _234);
    float _248 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _244 * _238;
    float _252 = _246 * _220;
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _256 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _258 = _250 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _250 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _254);
    float _264 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _268 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _272 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _274 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _276 = _270 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _280 = _264 + _274;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _284 = _282 != 0;
    float _286 = _250 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _288 = _276 + _278;
    float _290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _292 = _280 + _290;
    float _294 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _272);
    float _296 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _286);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _306 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _308 = _268;
    float _310 = _208;
    float _312 = _212;
    float _314 = _292;
    float _316 = _280;
    float _318 = _194;
    float _320 = _196;
    float _322 = _198;
    float _324 = _200;
    if (_192)
    {
        _308 = 1.0;
    }
    float _326 = _308;
    float _328 = fma(_300, _300, _302);
    float _330 = _304 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _332 = 0.0;
    float _334 = _326;
    if (_284)
    {
        float _336 = in.m_59.x;
        _332 = _336;
    }
    float _338 = _332;
    float _340 = 0.0;
    if (_284)
    {
        _340 = _200;
    }
    float _342 = _340;
    float _344 = sqrt(_328);
    int _346 = 0;
    float _348 = _342;
    if (_284)
    {
        _346 = 0;
    }
    int _350 = _346;
    float _352 = _330 + _306;
    int _354 = 0;
    int _356 = _350;
    float _358 = _352;
    if (_284)
    {
        _354 = 0;
    }
    int _360 = _354;
    bool _362 = _344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = 0.0;
    int _366 = _360;
    float _368 = _338;
    if (_284)
    {
        _364 = _338;
    }
    float _370 = _364;
    float _372 = _370;
    if (!_284)
    {
        float _374 = in.m_59.x;
        float _376 = _200 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        float _384 = _374 * 3.1415927410125732421875;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = sin(_388);
        _310 = _386;
        _366 = 2;
        _356 = 1;
        _368 = _374;
        _372 = _390;
        _348 = _382;
    }
    float _392 = _310;
    int _394 = _366;
    int _396 = _356;
    float _398 = _368;
    float _400 = _372;
    float _402 = _348;
    float _404 = _392;
    if (!_362)
    {
        _404 = _288;
    }
    float _406 = _404;
    float _408 = _406;
    if (!_362)
    {
        _312 = _280;
    }
    float _410 = _312;
    bool _412 = !_362;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _344 + _418;
        float _422 = _352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_328);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = cos(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = sin(_434);
        float _438 = _432 + (-1.0);
        float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _442 = fma(_436, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = fma(_352, _432, _440);
        float _446 = _424 * _442;
        float _448 = fma(_300, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _450 = fma(_292, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _444;
        _408 = _448;
        _414 = _450;
    }
    float _452 = _358;
    float _454 = _408;
    float _456 = _414;
    if (!_192)
    {
        float _458 = in.m_61.w;
        int _460 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _462 = _460 == 4;
        bool _464 = _460 == 8;
        bool _466 = _460 == 12;
        int _468 = as_type<int>(_458) << 16;
        int _470 = as_type<int>(_458) << 8;
        int _472 = as_type<int>(_458) << 24;
        int _474 = _468 >> 24;
        int _476 = _470 >> 24;
        int _478 = as_type<int>(_458) >> 24;
        int _480 = _472 >> 24;
        float _482 = float(_474);
        float _484 = float(_476);
        float _486 = float(_478);
        float _488 = _482 * 0.0078740157186985015869140625;
        float _490 = float(_480);
        float _492 = _484 * 0.0078740157186985015869140625;
        float _494 = _486 * 0.0078740157186985015869140625;
        float _496 = precise::min(_488, 1.0);
        float _498 = _490 * 0.0078740157186985015869140625;
        float _500 = precise::min(_492, 1.0);
        float _502 = precise::min(_494, 1.0);
        float _504 = precise::min(_498, 1.0);
        float _506 = precise::max(_496, -1.0);
        float _508 = precise::max(_500, -1.0);
        float _510 = precise::max(_502, -1.0);
        float _512 = precise::max(_504, -1.0);
        float _514 = _512;
        if (_462)
        {
            _514 = _506;
        }
        float _516 = _514;
        float _518 = _516;
        if (_464)
        {
            _518 = _508;
        }
        float _520 = _518;
        float _522 = _520;
        if (_466)
        {
            _522 = _510;
        }
        float _524 = _522;
        float _526 = abs(_524);
        float _528 = (-0.0) + _526;
        _334 = _528;
    }
    float _530 = _334;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _452 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _454 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _542 = _456 + _540;
    float _544 = _534 * _534;
    float _546 = _452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _548 = _530 != 0.0;
    bool _550 = isnan(_530);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = fma(_538, _538, _544);
    float _560 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _546);
    float _562 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _564 = fma(_542, _542, _558);
    float _566 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _560);
    float _568 = rsqrt(_564);
    float _570 = _566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _572 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _574 = _538 * _572;
    float _576 = _542 * _572;
    float _578 = _574 * _574;
    float _580 = _576 * _576;
    float _582 = _578 + _580;
    float _584 = sqrt(_582);
    bool _586 = _584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _590 = _584 + _588;
    float _592 = _568;
    float _594 = _590;
    float _596 = _534;
    float _598 = _578;
    bool _600 = _586;
    float _602 = _530;
    if (_586)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _604;
    }
    float _606 = _592;
    if (_586)
    {
        float _608 = rsqrt(_582);
        _314 = _608;
    }
    float _610 = _314;
    float _612 = _610;
    if (_586)
    {
        float _614 = _590 * _606;
        _594 = _614;
    }
    float _616 = _594;
    float _618 = _452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_586)
    {
        float _620 = _616 * 0.15915493667125701904296875;
        _316 = _620;
    }
    float _622 = _316;
    float _624 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _626 = fma(_276, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _628 = _542;
    float _630 = _622;
    if (_586)
    {
        float _632 = _622 * 6.283185482025146484375;
        float _634 = sin(_632);
        _628 = _634;
    }
    float _636 = _628;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _640 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _624);
    float _642 = precise::max(0.0, _638);
    float _644 = _288;
    float _646 = _642;
    if (_586)
    {
        float _648 = _622 * 6.283185482025146484375;
        float _650 = cos(_648);
        _644 = _650;
    }
    float _652 = _644;
    float _654 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _656 = -_572;
    float _658 = -_642;
    float _660 = fma(_534, _656, _658);
    if (_586)
    {
        float _662 = _660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _662;
    }
    float _664 = _596;
    float _666 = _664;
    if (!_586)
    {
        _630 = _580;
    }
    float _668 = _630;
    float _670 = floor(_626);
    float _672 = _636;
    float _674 = _668;
    if (_586)
    {
        float _676 = fma(_636, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _666 = _676;
    }
    float _678 = _666;
    float _680 = _678;
    if (!_586)
    {
        _672 = _576;
    }
    float _682 = _672;
    float _684 = _682;
    if (_586)
    {
        float _686 = _652 + (-1.0);
        _646 = _686;
    }
    float _688 = _646;
    float _690 = 0.0;
    float _692 = _688;
    if (_586)
    {
        float _694 = _610 * _678;
        _690 = _694;
    }
    float _696 = _690;
    if (!_586)
    {
        _612 = _574;
    }
    float _698 = _612;
    float _700 = _698;
    if (_586)
    {
        float _702 = _688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _692 = _702;
    }
    float _704 = _692;
    if (_586)
    {
        float _706 = _574 * _696;
        _700 = _706;
    }
    float _708 = _700;
    if (!_586)
    {
        _680 = _660;
    }
    float _710 = _680;
    float _712 = _710;
    if (_586)
    {
        float _714 = _576 * _696;
        _684 = _714;
    }
    float _716 = _684;
    if (_586)
    {
        float _718 = fma(_660, _652, _704);
        _712 = _718;
    }
    float _720 = _712;
    if (_586)
    {
        float _722 = _708 * _708;
        _598 = _722;
    }
    float _724 = _598;
    float _726 = sqrt(_564);
    if (_586)
    {
        float _728 = _716 * _716;
        _674 = _728;
    }
    float _730 = _674;
    float _732 = _452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_720, _720, _724);
    float _736 = _452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _740 = _734 + _730;
    float _742 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _744 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _738);
    float _746 = fma(_264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _748 = -_670;
    float _750 = _626 + _748;
    float _752 = rsqrt(_740);
    float _754 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _742);
    float _756 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[23].w, _758);
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _768 = -_762;
    float _770 = _768 + 1.0;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _774 = floor(_746);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _766);
    float _778 = -_772;
    float _780 = fma(_778, _562, 1.0);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _784 = _654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _752 * _708;
    float _788 = abs(_770);
    float _790 = log2(_788);
    float _792 = _752 * _720;
    float _794 = _752 * _716;
    float _796 = _786 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _798 = _654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _800 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _802 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _804 = -_796;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _804);
    float _808 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _798);
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _800);
    float _812 = 1.0 / _802;
    float _814 = -_794;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _806);
    float _818 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _808);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _822 = fma(_816, -0.5, 0.5);
    float _824 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _826 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = log2(_780);
    float _830 = fma(_816, 0.5, 0.5);
    float _832 = _810;
    float _834 = _796;
    float _836 = _802;
    float _838 = _820;
    if (_556)
    {
        _832 = _820;
    }
    float _840 = _832;
    float _842 = -_774;
    float _844 = _746 + _842;
    float _846 = _840;
    if (_556)
    {
        _834 = _826;
    }
    float _848 = _834;
    float _850 = fma(_830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _852 = _848;
    if (!_556)
    {
        _852 = 0.0;
    }
    float _854 = _852;
    float _856 = _792 + 1.0;
    float _858 = exp2(_824);
    if (!_556)
    {
        _846 = 0.0;
    }
    float _860 = _846;
    float _862 = fma(_830, _850, -0.212114393711090087890625);
    float _864 = _812 * _854;
    float _866 = sqrt(_822);
    float _868 = _812 * _860;
    float _870 = _828 * 0.693147182464599609375;
    float2 _3178 = float2(_750, _844);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3178, float2(0.0), isnan(_3178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3178, float2(0.0), isnan(_3178)), level(0.0)).x;
    float _874 = fma(_830, _862, 1.570728778839111328125);
    float _876 = -_792;
    float _878 = fma(_858, _856, _876);
    float _880 = fma(_864, 0.5, 0.5);
    float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _884 = fma(_868, -0.5, 0.5);
    float _886 = fma(_878, 0.5, 0.5);
    float _888 = _866 * 0.636619746685028076171875;
    float3 _3212 = float3(_880, _884, _882);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3212, float3(0.0), isnan(_3212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3212, float3(0.0), isnan(_3212)), level(0.0)).x;
    float3 _3223 = float3(_880, _884, _882);
    float4 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3223, float3(0.0), isnan(_3223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3223, float3(0.0), isnan(_3223)), level(0.0)).xyzw;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float _901 = _893.w;
    float _903 = -_874;
    float _905 = fma(_888, _903, 1.0);
    float2 _3244 = float2(_905, _886);
    float3 _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3244, float2(0.0), isnan(_3244)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3244, float2(0.0), isnan(_3244)), level(0.0)).xyz;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = in.m_63.x;
    float _919 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_59.w;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = in.m_63.y;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _941 = _939 != 0;
    float _943 = fma(_919, -2.0, _931);
    float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _947 = in.m_59.z;
    float _949 = _654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = _860;
    int _953 = as_type<int>(_880);
    if (_923)
    {
        float _955 = in.m_59.x;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 0.0;
    if (_929)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _917;
    if (_923)
    {
        float _973 = -_917;
        float _975 = _973 + 1.0;
        _953 = as_type<int>(_975);
    }
    int _977 = _953;
    float _979 = 0.0;
    if (!_923)
    {
        _979 = _917;
    }
    float _981 = _979;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _985 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _987 = _925 > 0.5;
    float _989 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _993 = -_937;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_65.y = _937;
    int _1003 = _987 ? as_type<int>(_995) : as_type<int>(_937);
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1007 = _947 > 0.5;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _981;
    int _1013 = as_type<int>(_991);
    float _1015 = _947;
    if (_923)
    {
        bool _1017 = _957 > 0.5;
        _600 = _1017;
    }
    bool _1019 = _600;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1025 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    if (_923)
    {
        float _1027 = _1019 ? as_type<float>(_977) : _917;
        _1011 = _1027;
    }
    float _1029 = _1011;
    out.m_67.x = _454;
    out.m_67.y = _452;
    out.m_67.z = _456;
    bool _1031 = _200 > 0.5;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    float _1043 = in.m_69.w;
    int _1045 = _1031 ? as_type<int>(_995) : as_type<int>(_937);
    float _1047 = exp2(_1023);
    int _1049 = _1007 ? as_type<int>(_995) : as_type<int>(_937);
    out.m_71.x = _1005;
    out.m_71.y = _1009;
    out.m_71.z = _1021;
    float _1051 = _935 ? as_type<float>(_1045) : _937;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1059 = _1057 != 0;
    float _1061 = _1055 ? as_type<float>(_1003) : _937;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1065 = _1063 != 0;
    float _1067 = _967 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = _196 * _1037;
    float _1077 = _194 * _1041;
    float _1079 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1083 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1085 = -_1075;
    float _1087 = fma(_194, _1039, _1085);
    float _1089 = -_1077;
    float _1091 = fma(_198, _1037, _1089);
    float _1093 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1079);
    float _1095 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1081);
    float _1097 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1083);
    float _1099 = _1059 ? as_type<float>(_1049) : _937;
    float _1101 = _198 * _1039;
    bool _1103 = _1059;
    if (_929)
    {
        bool _1105 = _965 > 0.5;
        _1103 = _1105;
    }
    bool _1107 = _1103;
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1113 = -_1101;
    float _1115 = fma(_196, _1041, _1113);
    float _1117 = _1091 * _1043;
    float _1119 = _1065 ? as_type<float>(_1049) : _937;
    out.m_73.x = _1109;
    out.m_73.y = _985;
    out.m_73.z = _989;
    out.m_73.w = _983;
    float _1121 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1127 = _1115 * _1043;
    float _1129 = _1087 * _1043;
    float _1131 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1133 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1123);
    float _1137 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1093);
    float _1139 = fma(_1131, _1051, -0.5);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1143 = _991 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1125);
    float _1147 = _1123;
    int _1149 = as_type<int>(_1139);
    int _1151 = as_type<int>(_1127);
    if (!_941)
    {
        _1147 = _917;
    }
    float _1153 = _1147;
    float _1155 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1141);
    float _1157 = fma(_1067, _1099, -0.5);
    float _1159 = fma(_1133, _1119, -0.5);
    float _1161 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1163 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1167 = fma(_1143, _1061, -0.5);
    float _1169 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1171 = -_1161;
    float _1173 = fma(_1163, _1139, _1171);
    float _1175 = _1153;
    float _1177 = _1163;
    if (_941)
    {
        float _1179 = -_917;
        float _1181 = _1179 + 1.0;
        _1149 = as_type<int>(_1181);
    }
    int _1183 = _1149;
    float _1185 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1097);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1169);
    if (_929)
    {
        float _1189 = -_917;
        float _1191 = _1189 + 1.0;
        _1151 = as_type<int>(_1191);
    }
    int _1193 = _1151;
    if (_1035)
    {
        float _1195 = -_917;
        float _1197 = _1195 + 1.0;
        _1013 = as_type<int>(_1197);
    }
    int _1199 = _1013;
    if (_941)
    {
        float _1201 = _1031 ? as_type<float>(_1183) : _917;
        _1175 = _1201;
    }
    float _1203 = _1175;
    float _1205 = _330 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _330 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_929)
    {
        _1177 = _917;
    }
    float _1209 = _1177;
    out.m_75.x = _1137;
    out.m_75.y = _1121;
    out.m_75.z = _1185;
    float _1211 = _1209;
    if (_929)
    {
        float _1213 = _1107 ? as_type<float>(_1193) : _917;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    bool _1219 = _394 != 2;
    float _1221 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1187);
    if (_1035)
    {
        float _1223 = _1031 ? as_type<float>(_1199) : _917;
        _971 = _1223;
    }
    float _1225 = _971;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1229 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1135);
    bool _1231 = _396 != 1;
    float _1233 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1145);
    float _1235 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1217);
    float _1237 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1239 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1243 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = fma(_1239, _1215, -0.5);
    out.m_77.x = _1221;
    out.m_77.y = _1229;
    out.m_77.z = _1233;
    float _1247 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1251 = _232 != 0.0;
    bool _1253 = isnan(_232);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1263 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1265 = -_1249;
    float _1267 = fma(_1243, 2.0, _1265);
    float _1269 = _400 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1271 = _228 == 0.0;
    bool _1273 = !_1259;
    bool _1275 = _1271 && _1273;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1281 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1285 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1277);
    float _1287 = fma(_1279, _1225, -0.5);
    float _1289 = fma(_1281, _1203, -0.5);
    float _1291 = -_1283;
    float _1293 = fma(_1269, 2.0, _1291);
    float _1295 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1299 = _402 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1301 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1285);
    float _1305 = fma(_1299, -2.0, _1297);
    float _1307 = -_150;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1293);
    float _1311 = 1.0 / _1301;
    float _1313 = _1263 + _1301;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1317 = fma(_1303, _1287, _1309);
    float _1319 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1315);
    float _1321 = fma(_1295, _1029, -0.5);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1325 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1319);
    bool _1327 = _234 == 0.0;
    bool _1329 = _1327 && _1275;
    float _1331 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1323);
    float _1333 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1305);
    float _1335 = _1313 * _1311;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1331);
    float _1341 = -_150;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1267);
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1159, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = _1333;
    float _1355 = _1267;
    float _1357 = _1313;
    if (!_1231)
    {
        _1353 = _200;
    }
    float _1359 = _1353;
    float _1361 = fma(_1339, _1321, _1343);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1365 = _1359;
    if (!_1231)
    {
        _1355 = _1359;
    }
    float _1367 = _1355;
    float _1369 = 1.0 / _1351;
    float _1371 = _1367;
    if (_1231)
    {
        _1365 = _398;
    }
    float _1373 = _1365;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1219)
    {
        _1357 = _398;
    }
    float _1377 = _1357;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1381 = _1377;
    float _1383 = _1379;
    if (!_1219)
    {
        _1381 = _947;
    }
    float _1385 = _1381;
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1375);
    float _1389 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1363);
    float _1391 = _1347 + 0.5;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1395 = _1317 + 0.5;
    if (_1231)
    {
        _1371 = _398;
    }
    float _1397 = _1371;
    if (!_1329)
    {
        float _1399 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _194);
        _318 = _1399;
    }
    float _1401 = _318;
    float _1403 = -_1379;
    float _1405 = fma(_1393, 2.0, _1403);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1411 = _1369 * _1409;
    out.m_79.x = _1395;
    out.m_79.y = _1391;
    float _1413 = -_150;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1405);
    float _1417 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1407);
    float _1419 = abs(_1411);
    float _1421 = log2(_1419);
    if (!_1231)
    {
        _1383 = _947;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (!_1329)
    {
        float _1427 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _196);
        _320 = _1427;
    }
    float _1429 = _320;
    if (_1231)
    {
        _1425 = _200;
    }
    float _1431 = _1425;
    float _1433 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1387);
    if (_1231)
    {
        _1015 = _200;
    }
    float _1435 = _1015;
    if (!_1329)
    {
        float _1437 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _198);
        _322 = _1437;
    }
    float _1439 = _322;
    float _1441 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1417);
    float _1443 = fma(_1441, _1289, _1415);
    if (!_1219)
    {
        _324 = _398;
    }
    float _1445 = _324;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1449 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1453 = -_1447;
    float _1455 = fma(_1449, 2.0, _1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1461 = exp2(_1451);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1465 = -_150;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1455);
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1457);
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1473 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1475 = fma(_1433, _1245, _1467);
    float _1477 = fma(_1471, -2.0, _1463);
    float _1479 = fma(_1473, -2.0, _1459);
    float _1481 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1389);
    float _1483 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1469);
    float _1485 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1477);
    float _1487 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1479);
    bool _1489 = _1411 <= 8000.0;
    bool _1491 = isnan(_1411);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(8000.0);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = _1361 + 0.5;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1485;
    float _1509 = fma(_1481, _1157, _1507);
    float _1511 = -_1487;
    float _1513 = fma(_1483, _1167, _1511);
    float _1515 = _1173 + 0.5;
    float _1517 = fma(_1505, -2.0, 3.0);
    float _1519 = _1505 * _1505;
    float _1521 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1523 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1525 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1527 = _1519 * _1517;
    float _1529 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1521);
    float _1533 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1523);
    float _1535 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1525);
    float _1537 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1529);
    float _1539 = -_1527;
    float _1541 = _1539 + 1.0;
    float _1543 = in.m_61.x;
    float _1545 = _1475 + 0.5;
    float _1547 = _1513 + 0.5;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1527);
    int _1551 = as_type<int>(_1455);
    float _1553 = _1537;
    if (!_556)
    {
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1551 = as_type<int>(_1555);
    }
    int _1557 = _1551;
    float _1559 = _1537 + _802;
    float _1561 = -_872;
    float _1563 = _1561 + 1.0;
    float _1565 = _1499 * _1549;
    out.m_81.x = _1501;
    out.m_81.y = _1515;
    out.m_81.z = _1545;
    out.m_81.w = _1547;
    float _1567 = _1443 + 0.5;
    float _1569 = _802 * 0.5;
    out.gl_Position.x = _826;
    out.gl_Position.y = _820;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _802;
    float _1571 = _1509 + 0.5;
    bool _1573 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1575 = isnan(_726);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1581 = _1577 || _1579;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4520 = as_type<float>(_1557);
        out.gl_Position.z = _4520;
    }
    out.m_83.x = _1567;
    out.m_83.y = _1571;
    float _1583 = _1559 * 0.5;
    float _1585 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1587 = _826 + _802;
    float _1589 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1591 = _1563 * _1585;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = fma(_820, -0.5, _1569);
    float _1597 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1531);
    float _1599 = _1589 * _890;
    float _1601 = -_1593;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1605 = -_1589;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1533);
    float _1611 = _901 * _1599;
    float _1613 = _1603 * _1543;
    float _1615 = _915 * _1599;
    float _1617 = fma(_911, _1611, _895);
    float _1619 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1535);
    float _1621 = fma(_913, _1611, _897);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1625 = _901 * _1607;
    float _1627 = fma(_901, _1615, _899);
    out.m_85.z = _1583;
    out.m_85.w = _802;
    float _1629 = _1587 * 0.5;
    float _1631 = _1607;
    float _1633 = _1629;
    if (!_1581)
    {
        _836 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1635 = _836;
    out.m_87.x = _1623;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1581)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1641 = _1553;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1581)
    {
        _838 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1647 = _838;
    out.m_89.x = _1617;
    out.m_89.y = _1621;
    out.m_89.z = _1627;
    out.m_89.w = _1625;
    float _1649 = _1647;
    float _1651 = _1647;
    if (!_1581)
    {
        _1631 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1653 = _1631;
    out.m_91.x = _1597;
    out.m_91.y = _1609;
    out.m_91.z = _1619;
    out.m_93.x = _1629;
    out.m_93.y = _1595;
    out.m_93.z = _1583;
    out.m_93.w = _802;
    float _1655 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1657 = _1655;
    float _1659 = _1653;
    float _1661 = _1653;
    if (!_556)
    {
        _1657 = 0.0;
    }
    float _1663 = _1657;
    if (!_1581)
    {
        _1633 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1665 = _1633;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1581)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1671 = _602;
    bool _1673 = !_1581;
    float _1675 = _1671;
    float _1677 = _1671;
    if (!_1673)
    {
        bool _1679 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1681 = isnan(_726);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = _726 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1695 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1693;
            float _1697 = 1.0 / _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1719 = _1691 * _1697;
            float _1721 = precise::clamp(_1719, 0.0, 1.0);
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1727 = fma(_1721, _1705, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1721, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1733 = fma(_1721, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1735 = fma(_1721, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1737 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1661 = _1731;
            _1639 = _1735;
            _1651 = _1729;
            _1669 = _1733;
            _1677 = _1727;
            _1645 = _1737;
            _1739 = true;
        }
        else
        {
            bool _1741 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1743 = isnan(_726);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1749 = _1745 || _1747;
            if (!_1749)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1751 = _1667;
            _1669 = _1751;
            if (!_1749)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1753 = _1637;
            _1639 = _1753;
            if (!_1749)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1755 = _1643;
            _1645 = _1755;
            if (!_1749)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1757 = _1649;
            _1651 = _1757;
            if (!_1749)
            {
                _1659 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1759 = _1659;
            _1661 = _1759;
            if (!_1749)
            {
                _1675 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1761 = _1675;
            bool _1763 = !_1749;
            _1677 = _1761;
            if (!_1763)
            {
                bool _1765 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1767 = isnan(_726);
                bool _1769 = _1765 || _1767;
                bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1773 = _1769 || _1771;
                if (!_1773)
                {
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = _726 + _1775;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1779;
                    float _1783 = 1.0 / _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1805 = _1777 * _1783;
                    float _1807 = precise::clamp(_1805, 0.0, 1.0);
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1813 = fma(_1807, _1791, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1807, _1811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1807, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1819 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1821 = fma(_1807, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1823 = fma(_1807, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1661 = _1817;
                    _1639 = _1821;
                    _1651 = _1815;
                    _1669 = _1819;
                    _1677 = _1813;
                    _1645 = _1823;
                    _1739 = true;
                }
                else
                {
                    _1661 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1677 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1739 = false;
    float _1825 = _1661;
    float _1827 = _1639;
    float _1829 = _1651;
    float _1831 = _1669;
    float _1833 = _1677;
    float _1835 = _1645;
    float _1837 = fma(_1609, -0.5, 0.5);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = -_1825;
    float _1843 = _1827 + _1841;
    float _1845 = -_1829;
    float _1847 = _1831 + _1845;
    float _1849 = -_1833;
    float _1851 = _1835 + _1849;
    bool _1853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1855 = fma(_1839, _1843, _1825);
    float _1857 = fma(_1839, _1847, _1829);
    float _1859 = fma(_1839, _1851, _1833);
    float _1861 = _1663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = _1855 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1865 = fma(_1857, 0.298911988735198974609375, _1863);
    out.m_49.x = _1861;
    float _1867 = fma(_1859, 0.114477999508380889892578125, _1865);
    float _1869 = -_1867;
    float _1871 = _1857 + _1869;
    float _1873 = -_1867;
    float _1875 = _1855 + _1873;
    float _1877 = -_1867;
    float _1879 = _1859 + _1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1883 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1885 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    out.m_97.x = _1881;
    out.m_97.y = _1883;
    out.m_97.z = _1885;
    if (!_1853)
    {
        return out;
    }
    float _1887 = -_452;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1891 = -_454;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1895 = -_456;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = sqrt(_1903);
    float _1907 = rsqrt(_1903);
    float _1909 = -_1905;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1913 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1915 = precise::clamp(_1913, 0.0, 1.0);
    float _1917 = _1893 * _1907;
    float _1919 = _1889 * _1907;
    float _1921 = abs(_1915);
    float _1923 = log2(_1921);
    float _1925 = _1897 * _1907;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1929 = _1609 * _1919;
    float _1931 = -_1919;
    float _1933 = -_1927;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1933);
    float _1937 = fma(_1597, _1917, _1929);
    float _1939 = -_1925;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1935);
    float _1943 = fma(_1619, _1925, _1937);
    float _1945 = precise::clamp(_1943, 0.0, 1.0);
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1949 = _1941 + _1947;
    float _1951 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = exp2(_1951);
    float _1959 = _1957 * _1955;
    float _1961 = _1945 * _1959;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1965 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1967 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1963;
    out.m_95.y = _1965;
    out.m_95.z = _1967;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1739 = false;
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
    if (!_120)
    {
        out.m_49.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_132);
        out.gl_Position.z = _2025;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_116);
        _124 = _152;
    }
    float _154 = _124;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _134 = as_type<int>(_166);
    }
    int _168 = _134;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_168);
        out.gl_Position.z = _2094;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    bool _184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _186 = isnan(0.5);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _192 = _188 || _190;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.y;
    float _202 = fma(_172, 16.0, _182);
    float _204 = _202 * 0.15915493667125701904296875;
    float _206 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = in.m_46.x;
    float _210 = in.m_46.y;
    float _212 = in.m_46.z;
    float _214 = _204 * 6.283185482025146484375;
    float _216 = sin(_214);
    float _218 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _222 = fma(_216, 0.5, 0.5);
    float _224 = _222 * 0.004999999888241291046142578125;
    float _226 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _228 = fma(_194, _224, _170);
    float _230 = _226 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _232 = fma(_196, _224, _172);
    float _234 = fma(_198, _224, _174);
    float _236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _238 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _236 * _230;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _232);
    float _246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _234);
    float _248 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _244 * _238;
    float _252 = _246 * _220;
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _256 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _258 = _250 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _250 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _254);
    float _264 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _266 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _268 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _272 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _274 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _266);
    float _276 = _270 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _280 = _264 + _274;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _284 = _282 != 0;
    float _286 = _250 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _288 = _276 + _278;
    float _290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _292 = _280 + _290;
    float _294 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _272);
    float _296 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _286);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _306 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _296);
    float _308 = _268;
    float _310 = _208;
    float _312 = _212;
    float _314 = _292;
    float _316 = _280;
    float _318 = _194;
    float _320 = _196;
    float _322 = _198;
    float _324 = _200;
    if (_192)
    {
        _308 = 1.0;
    }
    float _326 = _308;
    float _328 = fma(_300, _300, _302);
    float _330 = _304 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _332 = 0.0;
    float _334 = _326;
    if (_284)
    {
        float _336 = in.m_59.x;
        _332 = _336;
    }
    float _338 = _332;
    float _340 = 0.0;
    if (_284)
    {
        _340 = _200;
    }
    float _342 = _340;
    float _344 = sqrt(_328);
    int _346 = 0;
    float _348 = _342;
    if (_284)
    {
        _346 = 0;
    }
    int _350 = _346;
    float _352 = _330 + _306;
    int _354 = 0;
    int _356 = _350;
    float _358 = _352;
    if (_284)
    {
        _354 = 0;
    }
    int _360 = _354;
    bool _362 = _344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = 0.0;
    int _366 = _360;
    float _368 = _338;
    if (_284)
    {
        _364 = _338;
    }
    float _370 = _364;
    float _372 = _370;
    if (!_284)
    {
        float _374 = in.m_59.x;
        float _376 = _200 * 3.1415927410125732421875;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = sin(_380);
        float _384 = _374 * 3.1415927410125732421875;
        float _386 = _384 * 0.15915493667125701904296875;
        float _388 = _386 * 6.283185482025146484375;
        float _390 = sin(_388);
        _310 = _386;
        _366 = 2;
        _356 = 1;
        _368 = _374;
        _372 = _390;
        _348 = _382;
    }
    float _392 = _310;
    int _394 = _366;
    int _396 = _356;
    float _398 = _368;
    float _400 = _372;
    float _402 = _348;
    float _404 = _392;
    if (!_362)
    {
        _404 = _288;
    }
    float _406 = _404;
    float _408 = _406;
    if (!_362)
    {
        _312 = _280;
    }
    float _410 = _312;
    bool _412 = !_362;
    float _414 = _410;
    if (!_412)
    {
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _420 = _344 + _418;
        float _422 = _352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = rsqrt(_328);
        float _426 = _420 * _416;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _428 * 6.283185482025146484375;
        float _432 = cos(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = sin(_434);
        float _438 = _432 + (-1.0);
        float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _442 = fma(_436, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _444 = fma(_352, _432, _440);
        float _446 = _424 * _442;
        float _448 = fma(_300, _446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _450 = fma(_292, _446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _358 = _444;
        _408 = _448;
        _414 = _450;
    }
    float _452 = _358;
    float _454 = _408;
    float _456 = _414;
    if (!_192)
    {
        float _458 = in.m_61.w;
        int _460 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _462 = _460 == 4;
        bool _464 = _460 == 8;
        bool _466 = _460 == 12;
        int _468 = as_type<int>(_458) << 16;
        int _470 = as_type<int>(_458) << 8;
        int _472 = as_type<int>(_458) << 24;
        int _474 = _468 >> 24;
        int _476 = _470 >> 24;
        int _478 = as_type<int>(_458) >> 24;
        int _480 = _472 >> 24;
        float _482 = float(_474);
        float _484 = float(_476);
        float _486 = float(_478);
        float _488 = _482 * 0.0078740157186985015869140625;
        float _490 = float(_480);
        float _492 = _484 * 0.0078740157186985015869140625;
        float _494 = _486 * 0.0078740157186985015869140625;
        float _496 = precise::min(_488, 1.0);
        float _498 = _490 * 0.0078740157186985015869140625;
        float _500 = precise::min(_492, 1.0);
        float _502 = precise::min(_494, 1.0);
        float _504 = precise::min(_498, 1.0);
        float _506 = precise::max(_496, -1.0);
        float _508 = precise::max(_500, -1.0);
        float _510 = precise::max(_502, -1.0);
        float _512 = precise::max(_504, -1.0);
        float _514 = _512;
        if (_462)
        {
            _514 = _506;
        }
        float _516 = _514;
        float _518 = _516;
        if (_464)
        {
            _518 = _508;
        }
        float _520 = _518;
        float _522 = _520;
        if (_466)
        {
            _522 = _510;
        }
        float _524 = _522;
        float _526 = abs(_524);
        float _528 = (-0.0) + _526;
        _334 = _528;
    }
    float _530 = _334;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = _452 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _454 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _542 = _456 + _540;
    float _544 = _534 * _534;
    float _546 = _452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _548 = _530 != 0.0;
    bool _550 = isnan(_530);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = fma(_538, _538, _544);
    float _560 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _546);
    float _562 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _564 = fma(_542, _542, _558);
    float _566 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _560);
    float _568 = rsqrt(_564);
    float _570 = _566 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _572 = _568 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _574 = _538 * _572;
    float _576 = _542 * _572;
    float _578 = _574 * _574;
    float _580 = _576 * _576;
    float _582 = _578 + _580;
    float _584 = sqrt(_582);
    bool _586 = _584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _588 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _590 = _584 + _588;
    float _592 = _568;
    float _594 = _590;
    float _596 = _534;
    float _598 = _578;
    bool _600 = _586;
    float _602 = _530;
    if (_586)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _604;
    }
    float _606 = _592;
    if (_586)
    {
        float _608 = rsqrt(_582);
        _314 = _608;
    }
    float _610 = _314;
    float _612 = _610;
    if (_586)
    {
        float _614 = _590 * _606;
        _594 = _614;
    }
    float _616 = _594;
    float _618 = _452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_586)
    {
        float _620 = _616 * 0.15915493667125701904296875;
        _316 = _620;
    }
    float _622 = _316;
    float _624 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _618);
    float _626 = fma(_276, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _628 = _542;
    float _630 = _622;
    if (_586)
    {
        float _632 = _622 * 6.283185482025146484375;
        float _634 = sin(_632);
        _628 = _634;
    }
    float _636 = _628;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _640 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _624);
    float _642 = precise::max(0.0, _638);
    float _644 = _288;
    float _646 = _642;
    if (_586)
    {
        float _648 = _622 * 6.283185482025146484375;
        float _650 = cos(_648);
        _644 = _650;
    }
    float _652 = _644;
    float _654 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _656 = -_572;
    float _658 = -_642;
    float _660 = fma(_534, _656, _658);
    if (_586)
    {
        float _662 = _660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _662;
    }
    float _664 = _596;
    float _666 = _664;
    if (!_586)
    {
        _630 = _580;
    }
    float _668 = _630;
    float _670 = floor(_626);
    float _672 = _636;
    float _674 = _668;
    if (_586)
    {
        float _676 = fma(_636, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _666 = _676;
    }
    float _678 = _666;
    float _680 = _678;
    if (!_586)
    {
        _672 = _576;
    }
    float _682 = _672;
    float _684 = _682;
    if (_586)
    {
        float _686 = _652 + (-1.0);
        _646 = _686;
    }
    float _688 = _646;
    float _690 = 0.0;
    float _692 = _688;
    if (_586)
    {
        float _694 = _610 * _678;
        _690 = _694;
    }
    float _696 = _690;
    if (!_586)
    {
        _612 = _574;
    }
    float _698 = _612;
    float _700 = _698;
    if (_586)
    {
        float _702 = _688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _692 = _702;
    }
    float _704 = _692;
    if (_586)
    {
        float _706 = _574 * _696;
        _700 = _706;
    }
    float _708 = _700;
    if (!_586)
    {
        _680 = _660;
    }
    float _710 = _680;
    float _712 = _710;
    if (_586)
    {
        float _714 = _576 * _696;
        _684 = _714;
    }
    float _716 = _684;
    if (_586)
    {
        float _718 = fma(_660, _652, _704);
        _712 = _718;
    }
    float _720 = _712;
    if (_586)
    {
        float _722 = _708 * _708;
        _598 = _722;
    }
    float _724 = _598;
    float _726 = sqrt(_564);
    if (_586)
    {
        float _728 = _716 * _716;
        _674 = _728;
    }
    float _730 = _674;
    float _732 = _452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_720, _720, _724);
    float _736 = _452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _738 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _740 = _734 + _730;
    float _742 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _736);
    float _744 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _738);
    float _746 = fma(_264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _748 = -_670;
    float _750 = _626 + _748;
    float _752 = rsqrt(_740);
    float _754 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _742);
    float _756 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _760 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[23].w, _758);
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _754 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _654 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _768 = -_762;
    float _770 = _768 + 1.0;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _774 = floor(_746);
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _766);
    float _778 = -_772;
    float _780 = fma(_778, _562, 1.0);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _776);
    float _784 = _654 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _752 * _708;
    float _788 = abs(_770);
    float _790 = log2(_788);
    float _792 = _752 * _720;
    float _794 = _752 * _716;
    float _796 = _786 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _798 = _654 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _800 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _802 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _804 = -_796;
    float _806 = fma(_792, (*spvDescriptorSet0.vp_c15)._m0[21].y, _804);
    float _808 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _798);
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _800);
    float _812 = 1.0 / _802;
    float _814 = -_794;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _806);
    float _818 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _808);
    float _820 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _810);
    float _822 = fma(_816, -0.5, 0.5);
    float _824 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _826 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _818);
    float _828 = log2(_780);
    float _830 = fma(_816, 0.5, 0.5);
    float _832 = _810;
    float _834 = _796;
    float _836 = _802;
    float _838 = _820;
    if (_556)
    {
        _832 = _820;
    }
    float _840 = _832;
    float _842 = -_774;
    float _844 = _746 + _842;
    float _846 = _840;
    if (_556)
    {
        _834 = _826;
    }
    float _848 = _834;
    float _850 = fma(_830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _852 = _848;
    if (!_556)
    {
        _852 = 0.0;
    }
    float _854 = _852;
    float _856 = _792 + 1.0;
    float _858 = exp2(_824);
    if (!_556)
    {
        _846 = 0.0;
    }
    float _860 = _846;
    float _862 = fma(_830, _850, -0.212114393711090087890625);
    float _864 = _812 * _854;
    float _866 = sqrt(_822);
    float _868 = _812 * _860;
    float _870 = _828 * 0.693147182464599609375;
    float2 _3178 = float2(_750, _844);
    float _872 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3178, float2(0.0), isnan(_3178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3178, float2(0.0), isnan(_3178)), level(0.0)).x;
    float _874 = fma(_830, _862, 1.570728778839111328125);
    float _876 = -_792;
    float _878 = fma(_858, _856, _876);
    float _880 = fma(_864, 0.5, 0.5);
    float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _884 = fma(_868, -0.5, 0.5);
    float _886 = fma(_878, 0.5, 0.5);
    float _888 = _866 * 0.636619746685028076171875;
    float3 _3212 = float3(_880, _884, _882);
    float _890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3212, float3(0.0), isnan(_3212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3212, float3(0.0), isnan(_3212)), level(0.0)).x;
    float3 _3223 = float3(_880, _884, _882);
    float4 _893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3223, float3(0.0), isnan(_3223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3223, float3(0.0), isnan(_3223)), level(0.0)).xyzw;
    float _895 = _893.x;
    float _897 = _893.y;
    float _899 = _893.z;
    float _901 = _893.w;
    float _903 = -_874;
    float _905 = fma(_888, _903, 1.0);
    float2 _3244 = float2(_905, _886);
    float3 _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3244, float2(0.0), isnan(_3244)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3244, float2(0.0), isnan(_3244)), level(0.0)).xyz;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = in.m_63.x;
    float _919 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _923 = _921 != 0;
    float _925 = in.m_59.w;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _929 = _927 != 0;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _935 = _933 != 0;
    float _937 = in.m_63.y;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _941 = _939 != 0;
    float _943 = fma(_919, -2.0, _931);
    float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _947 = in.m_59.z;
    float _949 = _654 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = _860;
    int _953 = as_type<int>(_880);
    if (_923)
    {
        float _955 = in.m_59.x;
        _951 = _955;
    }
    float _957 = _951;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _961 = 0.0;
    if (_929)
    {
        float _963 = in.m_59.z;
        _961 = _963;
    }
    float _965 = _961;
    float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _917;
    if (_923)
    {
        float _973 = -_917;
        float _975 = _973 + 1.0;
        _953 = as_type<int>(_975);
    }
    int _977 = _953;
    float _979 = 0.0;
    if (!_923)
    {
        _979 = _917;
    }
    float _981 = _979;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _985 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _987 = _925 > 0.5;
    float _989 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _993 = -_937;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_65.y = _937;
    int _1003 = _987 ? as_type<int>(_995) : as_type<int>(_937);
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1007 = _947 > 0.5;
    float _1009 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _981;
    int _1013 = as_type<int>(_991);
    float _1015 = _947;
    if (_923)
    {
        bool _1017 = _957 > 0.5;
        _600 = _1017;
    }
    bool _1019 = _600;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _790 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1025 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    if (_923)
    {
        float _1027 = _1019 ? as_type<float>(_977) : _917;
        _1011 = _1027;
    }
    float _1029 = _1011;
    out.m_67.x = _454;
    out.m_67.y = _452;
    out.m_67.z = _456;
    bool _1031 = _200 > 0.5;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    float _1043 = in.m_69.w;
    int _1045 = _1031 ? as_type<int>(_995) : as_type<int>(_937);
    float _1047 = exp2(_1023);
    int _1049 = _1007 ? as_type<int>(_995) : as_type<int>(_937);
    out.m_71.x = _1005;
    out.m_71.y = _1009;
    out.m_71.z = _1021;
    float _1051 = _935 ? as_type<float>(_1045) : _937;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1059 = _1057 != 0;
    float _1061 = _1055 ? as_type<float>(_1003) : _937;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1065 = _1063 != 0;
    float _1067 = _967 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = _196 * _1037;
    float _1077 = _194 * _1041;
    float _1079 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1083 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1085 = -_1075;
    float _1087 = fma(_194, _1039, _1085);
    float _1089 = -_1077;
    float _1091 = fma(_198, _1037, _1089);
    float _1093 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1079);
    float _1095 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1081);
    float _1097 = fma(_1037, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1083);
    float _1099 = _1059 ? as_type<float>(_1049) : _937;
    float _1101 = _198 * _1039;
    bool _1103 = _1059;
    if (_929)
    {
        bool _1105 = _965 > 0.5;
        _1103 = _1105;
    }
    bool _1107 = _1103;
    float _1109 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1113 = -_1101;
    float _1115 = fma(_196, _1041, _1113);
    float _1117 = _1091 * _1043;
    float _1119 = _1065 ? as_type<float>(_1049) : _937;
    out.m_73.x = _1109;
    out.m_73.y = _985;
    out.m_73.z = _989;
    out.m_73.w = _983;
    float _1121 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1127 = _1115 * _1043;
    float _1129 = _1087 * _1043;
    float _1131 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1133 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1123);
    float _1137 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1093);
    float _1139 = fma(_1131, _1051, -0.5);
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1143 = _991 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1125);
    float _1147 = _1123;
    int _1149 = as_type<int>(_1139);
    int _1151 = as_type<int>(_1127);
    if (!_941)
    {
        _1147 = _917;
    }
    float _1153 = _1147;
    float _1155 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1141);
    float _1157 = fma(_1067, _1099, -0.5);
    float _1159 = fma(_1133, _1119, -0.5);
    float _1161 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _943);
    float _1163 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1167 = fma(_1143, _1061, -0.5);
    float _1169 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1171 = -_1161;
    float _1173 = fma(_1163, _1139, _1171);
    float _1175 = _1153;
    float _1177 = _1163;
    if (_941)
    {
        float _1179 = -_917;
        float _1181 = _1179 + 1.0;
        _1149 = as_type<int>(_1181);
    }
    int _1183 = _1149;
    float _1185 = fma(_1041, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1097);
    float _1187 = fma(_1127, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1169);
    if (_929)
    {
        float _1189 = -_917;
        float _1191 = _1189 + 1.0;
        _1151 = as_type<int>(_1191);
    }
    int _1193 = _1151;
    if (_1035)
    {
        float _1195 = -_917;
        float _1197 = _1195 + 1.0;
        _1013 = as_type<int>(_1197);
    }
    int _1199 = _1013;
    if (_941)
    {
        float _1201 = _1031 ? as_type<float>(_1183) : _917;
        _1175 = _1201;
    }
    float _1203 = _1175;
    float _1205 = _330 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1207 = _330 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_929)
    {
        _1177 = _917;
    }
    float _1209 = _1177;
    out.m_75.x = _1137;
    out.m_75.y = _1121;
    out.m_75.z = _1185;
    float _1211 = _1209;
    if (_929)
    {
        float _1213 = _1107 ? as_type<float>(_1193) : _917;
        _1211 = _1213;
    }
    float _1215 = _1211;
    float _1217 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    bool _1219 = _394 != 2;
    float _1221 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1187);
    if (_1035)
    {
        float _1223 = _1031 ? as_type<float>(_1199) : _917;
        _971 = _1223;
    }
    float _1225 = _971;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1229 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1135);
    bool _1231 = _396 != 1;
    float _1233 = fma(_1129, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1145);
    float _1235 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1217);
    float _1237 = fma(_276, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1205);
    float _1239 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1243 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = fma(_1239, _1215, -0.5);
    out.m_77.x = _1221;
    out.m_77.y = _1229;
    out.m_77.z = _1233;
    float _1247 = fma(_264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1237);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1251 = _232 != 0.0;
    bool _1253 = isnan(_232);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan(0.0);
    bool _1259 = _1255 || _1257;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1263 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1265 = -_1249;
    float _1267 = fma(_1243, 2.0, _1265);
    float _1269 = _400 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1271 = _228 == 0.0;
    bool _1273 = !_1259;
    bool _1275 = _1271 && _1273;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1281 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1285 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1277);
    float _1287 = fma(_1279, _1225, -0.5);
    float _1289 = fma(_1281, _1203, -0.5);
    float _1291 = -_1283;
    float _1293 = fma(_1269, 2.0, _1291);
    float _1295 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1299 = _402 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1301 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1303 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1285);
    float _1305 = fma(_1299, -2.0, _1297);
    float _1307 = -_150;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1293);
    float _1311 = 1.0 / _1301;
    float _1313 = _1263 + _1301;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1317 = fma(_1303, _1287, _1309);
    float _1319 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1315);
    float _1321 = fma(_1295, _1029, -0.5);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1325 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1319);
    bool _1327 = _234 == 0.0;
    bool _1329 = _1327 && _1275;
    float _1331 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1323);
    float _1333 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1305);
    float _1335 = _1313 * _1311;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1331);
    float _1341 = -_150;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1267);
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1159, _1345);
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    float _1353 = _1333;
    float _1355 = _1267;
    float _1357 = _1313;
    if (!_1231)
    {
        _1353 = _200;
    }
    float _1359 = _1353;
    float _1361 = fma(_1339, _1321, _1343);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1365 = _1359;
    if (!_1231)
    {
        _1355 = _1359;
    }
    float _1367 = _1355;
    float _1369 = 1.0 / _1351;
    float _1371 = _1367;
    if (_1231)
    {
        _1365 = _398;
    }
    float _1373 = _1365;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1219)
    {
        _1357 = _398;
    }
    float _1377 = _1357;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1381 = _1377;
    float _1383 = _1379;
    if (!_1219)
    {
        _1381 = _947;
    }
    float _1385 = _1381;
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1375);
    float _1389 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1363);
    float _1391 = _1347 + 0.5;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1395 = _1317 + 0.5;
    if (_1231)
    {
        _1371 = _398;
    }
    float _1397 = _1371;
    if (!_1329)
    {
        float _1399 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _194);
        _318 = _1399;
    }
    float _1401 = _318;
    float _1403 = -_1379;
    float _1405 = fma(_1393, 2.0, _1403);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1411 = _1369 * _1409;
    out.m_79.x = _1395;
    out.m_79.y = _1391;
    float _1413 = -_150;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1405);
    float _1417 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1407);
    float _1419 = abs(_1411);
    float _1421 = log2(_1419);
    if (!_1231)
    {
        _1383 = _947;
    }
    float _1423 = _1383;
    float _1425 = _1423;
    if (!_1329)
    {
        float _1427 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _196);
        _320 = _1427;
    }
    float _1429 = _320;
    if (_1231)
    {
        _1425 = _200;
    }
    float _1431 = _1425;
    float _1433 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1387);
    if (_1231)
    {
        _1015 = _200;
    }
    float _1435 = _1015;
    if (!_1329)
    {
        float _1437 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _198);
        _322 = _1437;
    }
    float _1439 = _322;
    float _1441 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1417);
    float _1443 = fma(_1441, _1289, _1415);
    if (!_1219)
    {
        _324 = _398;
    }
    float _1445 = _324;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1449 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1453 = -_1447;
    float _1455 = fma(_1449, 2.0, _1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1461 = exp2(_1451);
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1465 = -_150;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1455);
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1457);
    float _1471 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1473 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1475 = fma(_1433, _1245, _1467);
    float _1477 = fma(_1471, -2.0, _1463);
    float _1479 = fma(_1473, -2.0, _1459);
    float _1481 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1389);
    float _1483 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1469);
    float _1485 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1477);
    float _1487 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1479);
    bool _1489 = _1411 <= 8000.0;
    bool _1491 = isnan(_1411);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(8000.0);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = _1361 + 0.5;
    float _1503 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1505 = precise::clamp(_1503, 0.0, 1.0);
    float _1507 = -_1485;
    float _1509 = fma(_1481, _1157, _1507);
    float _1511 = -_1487;
    float _1513 = fma(_1483, _1167, _1511);
    float _1515 = _1173 + 0.5;
    float _1517 = fma(_1505, -2.0, 3.0);
    float _1519 = _1505 * _1505;
    float _1521 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1523 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1525 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1527 = _1519 * _1517;
    float _1529 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    float _1531 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1521);
    float _1533 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1523);
    float _1535 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1525);
    float _1537 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1529);
    float _1539 = -_1527;
    float _1541 = _1539 + 1.0;
    float _1543 = in.m_61.x;
    float _1545 = _1475 + 0.5;
    float _1547 = _1513 + 0.5;
    float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1527);
    int _1551 = as_type<int>(_1455);
    float _1553 = _1537;
    if (!_556)
    {
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1551 = as_type<int>(_1555);
    }
    int _1557 = _1551;
    float _1559 = _1537 + _802;
    float _1561 = -_872;
    float _1563 = _1561 + 1.0;
    float _1565 = _1499 * _1549;
    out.m_81.x = _1501;
    out.m_81.y = _1515;
    out.m_81.z = _1545;
    out.m_81.w = _1547;
    float _1567 = _1443 + 0.5;
    float _1569 = _802 * 0.5;
    out.gl_Position.x = _826;
    out.gl_Position.y = _820;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _802;
    float _1571 = _1509 + 0.5;
    bool _1573 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1575 = isnan(_726);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1581 = _1577 || _1579;
    if (!_556)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4520 = as_type<float>(_1557);
        out.gl_Position.z = _4520;
    }
    out.m_83.x = _1567;
    out.m_83.y = _1571;
    float _1583 = _1559 * 0.5;
    float _1585 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1587 = _826 + _802;
    float _1589 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1591 = _1563 * _1585;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = fma(_820, -0.5, _1569);
    float _1597 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1531);
    float _1599 = _1589 * _890;
    float _1601 = -_1593;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1605 = -_1589;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1533);
    float _1611 = _901 * _1599;
    float _1613 = _1603 * _1543;
    float _1615 = _915 * _1599;
    float _1617 = fma(_911, _1611, _895);
    float _1619 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1535);
    float _1621 = fma(_913, _1611, _897);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1625 = _901 * _1607;
    float _1627 = fma(_901, _1615, _899);
    out.m_85.z = _1583;
    out.m_85.w = _802;
    float _1629 = _1587 * 0.5;
    float _1631 = _1607;
    float _1633 = _1629;
    if (!_1581)
    {
        _836 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1635 = _836;
    out.m_87.x = _1623;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1581)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1641 = _1553;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1581)
    {
        _838 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1647 = _838;
    out.m_89.x = _1617;
    out.m_89.y = _1621;
    out.m_89.z = _1627;
    out.m_89.w = _1625;
    float _1649 = _1647;
    float _1651 = _1647;
    if (!_1581)
    {
        _1631 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1653 = _1631;
    out.m_91.x = _1597;
    out.m_91.y = _1609;
    out.m_91.z = _1619;
    out.m_93.x = _1629;
    out.m_93.y = _1595;
    out.m_93.z = _1583;
    out.m_93.w = _802;
    float _1655 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1657 = _1655;
    float _1659 = _1653;
    float _1661 = _1653;
    if (!_556)
    {
        _1657 = 0.0;
    }
    float _1663 = _1657;
    if (!_1581)
    {
        _1633 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1665 = _1633;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1581)
    {
        _602 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1671 = _602;
    bool _1673 = !_1581;
    float _1675 = _1671;
    float _1677 = _1671;
    if (!_1673)
    {
        bool _1679 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1681 = isnan(_726);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = _726 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1695 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1693;
            float _1697 = 1.0 / _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1719 = _1691 * _1697;
            float _1721 = precise::clamp(_1719, 0.0, 1.0);
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1727 = fma(_1721, _1705, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1731 = fma(_1721, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1733 = fma(_1721, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1735 = fma(_1721, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1737 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1661 = _1731;
            _1639 = _1735;
            _1651 = _1729;
            _1669 = _1733;
            _1677 = _1727;
            _1645 = _1737;
            _1739 = true;
        }
        else
        {
            bool _1741 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1743 = isnan(_726);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1749 = _1745 || _1747;
            if (!_1749)
            {
                _1667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1751 = _1667;
            _1669 = _1751;
            if (!_1749)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1753 = _1637;
            _1639 = _1753;
            if (!_1749)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1755 = _1643;
            _1645 = _1755;
            if (!_1749)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1757 = _1649;
            _1651 = _1757;
            if (!_1749)
            {
                _1659 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1759 = _1659;
            _1661 = _1759;
            if (!_1749)
            {
                _1675 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1761 = _1675;
            bool _1763 = !_1749;
            _1677 = _1761;
            if (!_1763)
            {
                bool _1765 = _726 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1767 = isnan(_726);
                bool _1769 = _1765 || _1767;
                bool _1771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1773 = _1769 || _1771;
                if (!_1773)
                {
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = _726 + _1775;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1779;
                    float _1783 = 1.0 / _1781;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1805 = _1777 * _1783;
                    float _1807 = precise::clamp(_1805, 0.0, 1.0);
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1813 = fma(_1807, _1791, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1807, _1811, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1817 = fma(_1807, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1819 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1821 = fma(_1807, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1823 = fma(_1807, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1661 = _1817;
                    _1639 = _1821;
                    _1651 = _1815;
                    _1669 = _1819;
                    _1677 = _1813;
                    _1645 = _1823;
                    _1739 = true;
                }
                else
                {
                    _1661 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1677 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1739 = false;
    float _1825 = _1661;
    float _1827 = _1639;
    float _1829 = _1651;
    float _1831 = _1669;
    float _1833 = _1677;
    float _1835 = _1645;
    float _1837 = fma(_1609, -0.5, 0.5);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = -_1825;
    float _1843 = _1827 + _1841;
    float _1845 = -_1829;
    float _1847 = _1831 + _1845;
    float _1849 = -_1833;
    float _1851 = _1835 + _1849;
    bool _1853 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1855 = fma(_1839, _1843, _1825);
    float _1857 = fma(_1839, _1847, _1829);
    float _1859 = fma(_1839, _1851, _1833);
    float _1861 = _1663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = _1855 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _1865 = fma(_1857, 0.298911988735198974609375, _1863);
    out.m_49.x = _1861;
    float _1867 = fma(_1859, 0.114477999508380889892578125, _1865);
    float _1869 = -_1867;
    float _1871 = _1857 + _1869;
    float _1873 = -_1867;
    float _1875 = _1855 + _1873;
    float _1877 = -_1867;
    float _1879 = _1859 + _1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1883 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    float _1885 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1867);
    out.m_97.x = _1881;
    out.m_97.y = _1883;
    out.m_97.z = _1885;
    if (!_1853)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1887 = -_452;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1891 = -_454;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1895 = -_456;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = sqrt(_1903);
    float _1907 = rsqrt(_1903);
    float _1909 = -_1905;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1913 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1915 = precise::clamp(_1913, 0.0, 1.0);
    float _1917 = _1893 * _1907;
    float _1919 = _1889 * _1907;
    float _1921 = abs(_1915);
    float _1923 = log2(_1921);
    float _1925 = _1897 * _1907;
    float _1927 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1929 = _1609 * _1919;
    float _1931 = -_1919;
    float _1933 = -_1927;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1933);
    float _1937 = fma(_1597, _1917, _1929);
    float _1939 = -_1925;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1935);
    float _1943 = fma(_1619, _1925, _1937);
    float _1945 = precise::clamp(_1943, 0.0, 1.0);
    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1949 = _1941 + _1947;
    float _1951 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = exp2(_1951);
    float _1959 = _1957 * _1955;
    float _1961 = _1945 * _1959;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1965 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1967 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _1963;
    out.m_95.y = _1965;
    out.m_95.z = _1967;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

