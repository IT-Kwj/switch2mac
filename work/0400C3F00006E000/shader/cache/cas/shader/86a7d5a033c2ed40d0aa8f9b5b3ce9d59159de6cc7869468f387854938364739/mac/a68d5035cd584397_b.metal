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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_55 [[attribute(0)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1162 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_122);
        out.gl_Position.z = _1449;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1517 = as_type<float>(_156);
        out.gl_Position.z = _1517;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _174 = _172 * 0.15915493667125701904296875;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = sin(_178);
    float _182 = _176 * 0.15915493667125701904296875;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _174 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _160 + (-0.5);
    float _196 = abs(_194);
    float _198 = fma(_196, -2.0, 1.0);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = _182 * 6.283185482025146484375;
    float _206 = sin(_204);
    float _208 = fma(_200, -2.0, 3.0);
    float _210 = _180 * _158;
    float _212 = _200 * _200;
    float _214 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _208 * _212;
    float _222 = _220 * 0.125;
    float _224 = _182 * 6.283185482025146484375;
    float _226 = cos(_224);
    float _228 = _192 * _158;
    float _230 = -_210;
    float _232 = fma(_192, _162, _230);
    float _234 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _238 = fma(_180, _162, _228);
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    bool _242 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _244 = isnan(0.5);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _250 = _246 || _248;
    float _252 = fma(_206, _222, _238);
    float _254 = _216 * _240;
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _252);
    float _258 = _254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_222, _226, _232);
    float _264 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = _234 * _256;
    float _268 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _262);
    float _272 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _276 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _278 = _236 * _270;
    float _280 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _282 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _284 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _286 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _288 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _282);
    float _292 = _284 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _294 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _296 = _288 + _286;
    float _298 = _292 + _290;
    float _300 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _294);
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _308 = _298 + _306;
    float _310 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _312 = _304 * _304;
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _316 = fma(_308, _308, _312);
    float _318 = _254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = sqrt(_316);
    float _322 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[9].x, _318);
    float _324 = _318;
    float _326 = _184;
    float _328 = _188;
    float _330 = _304;
    if (_250)
    {
        _324 = 1.0;
    }
    float _332 = _324;
    float _334 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _322);
    float _336 = _314 + _334;
    bool _338 = _320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _340 = _336;
    float _342 = _332;
    if (!_338)
    {
        _326 = _298;
    }
    float _344 = _326;
    float _346 = _344;
    if (!_338)
    {
        _328 = _296;
    }
    float _348 = _328;
    bool _350 = !_338;
    float _352 = _348;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _358 = _320 + _356;
        float _360 = rsqrt(_316);
        float _362 = _358 * _354;
        float _364 = _336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = _362 * 0.15915493667125701904296875;
        float _368 = _366 * 6.283185482025146484375;
        float _370 = cos(_368);
        float _372 = _366 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _370 + (-1.0);
        float _378 = _376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = fma(_374, _364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _382 = fma(_336, _370, _378);
        float _384 = _360 * _380;
        float _386 = fma(_308, _384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _388 = fma(_304, _384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _340 = _382;
        _346 = _386;
        _352 = _388;
    }
    float _390 = _340;
    float _392 = _346;
    float _394 = _352;
    if (!_250)
    {
        float _396 = as_type<float>(in.m_55.w);
        int _398 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _400 = _398 == 4;
        bool _402 = _398 == 8;
        bool _404 = _398 == 12;
        int _406 = as_type<int>(_396) << 16;
        int _408 = as_type<int>(_396) << 8;
        int _410 = as_type<int>(_396) << 24;
        int _412 = _406 >> 24;
        int _414 = _408 >> 24;
        int _416 = as_type<int>(_396) >> 24;
        int _418 = _410 >> 24;
        float _420 = float(_412);
        float _422 = float(_414);
        float _424 = float(_416);
        float _426 = _420 * 0.0078740157186985015869140625;
        float _428 = float(_418);
        float _430 = _422 * 0.0078740157186985015869140625;
        float _432 = _424 * 0.0078740157186985015869140625;
        float _434 = precise::min(_426, 1.0);
        float _436 = _428 * 0.0078740157186985015869140625;
        float _438 = precise::min(_430, 1.0);
        float _440 = precise::min(_432, 1.0);
        float _442 = precise::min(_436, 1.0);
        float _444 = precise::max(_434, -1.0);
        float _446 = precise::max(_438, -1.0);
        float _448 = precise::max(_440, -1.0);
        float _450 = precise::max(_442, -1.0);
        float _452 = _450;
        if (_400)
        {
            _452 = _444;
        }
        float _454 = _452;
        float _456 = _454;
        if (_402)
        {
            _456 = _446;
        }
        float _458 = _456;
        float _460 = _458;
        if (_404)
        {
            _460 = _448;
        }
        float _462 = _460;
        float _464 = abs(_462);
        float _466 = (-0.0) + _464;
        _342 = _466;
    }
    float _468 = _342;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _472 = _390 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _392 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _394 + _478;
    float _482 = _472 * _472;
    float _484 = fma(_476, _476, _482);
    float _486 = fma(_480, _480, _484);
    float _488 = rsqrt(_486);
    float _490 = _488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _492 = _476 * _490;
    float _494 = _480 * _490;
    float _496 = _492 * _492;
    float _498 = _494 * _494;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = _496 + _498;
    float _504 = precise::max(0.0, _500);
    float _506 = sqrt(_502);
    float _508 = -_490;
    float _510 = -_504;
    float _512 = fma(_472, _508, _510);
    bool _514 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _516 = _472;
    float _518 = _496;
    float _520 = _498;
    float _522 = _494;
    float _524 = _468;
    if (!_514)
    {
        _516 = _496;
    }
    float _526 = _516;
    float _528 = _526;
    if (!_514)
    {
        _330 = _492;
    }
    float _530 = _330;
    float _532 = _530;
    if (!_514)
    {
        _518 = _512;
    }
    float _534 = _518;
    bool _536 = !_514;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _506 + _542;
        float _546 = rsqrt(_502);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = fma(_556, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _546 * _562;
        float _566 = _560 + (-1.0);
        float _568 = _492 * _564;
        float _570 = _494 * _564;
        float _572 = _566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * _570;
        float _576 = fma(_512, _560, _572);
        float _578 = _568 * _568;
        _538 = _576;
        _528 = _578;
        _520 = _574;
        _532 = _568;
        _522 = _570;
    }
    float _580 = _538;
    float _582 = _528;
    float _584 = _520;
    float _586 = _532;
    float _588 = _522;
    float _590 = fma(_580, _580, _582);
    float _592 = sqrt(_486);
    float _594 = _390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _596 = _390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = _590 + _584;
    float _600 = _390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _602 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _594);
    float _604 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _606 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _600);
    float _608 = rsqrt(_598);
    float _610 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _602);
    float _612 = _390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _614 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _604);
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _606);
    float _618 = _610 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _612);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _624 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _622);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = _616 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _632 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _634 = -_626;
    float _636 = _634 + 1.0;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _632);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _620);
    float _646 = _608 * _586;
    float _648 = abs(_636);
    float _650 = log2(_648);
    float _652 = -_640;
    float _654 = fma(_638, _652, 1.0);
    float _656 = _608 * _580;
    float _658 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = _608 * _588;
    float _662 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _642);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = log2(_654);
    float _670 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    bool _676 = _468 != 0.0;
    bool _678 = isnan(_468);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _670);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _674);
    float _690 = 1.0 / _672;
    float _692 = -_658;
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _692);
    float _696 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _698 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _700 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _688);
    float _702 = -_660;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _694);
    float _706 = _656 + 1.0;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _710 = exp2(_696);
    float _712 = fma(_704, -0.5, 0.5);
    float _714 = fma(_704, 0.5, 0.5);
    float _716 = _698;
    float _718 = _670;
    float _720 = _672;
    float _722 = _700;
    if (_684)
    {
        _716 = _700;
    }
    float _724 = _716;
    float _726 = _668 * 0.693147182464599609375;
    float _728 = _724;
    if (_684)
    {
        _718 = _708;
    }
    float _730 = _718;
    float _732 = _730;
    if (!_684)
    {
        _728 = 0.0;
        _732 = 0.0;
    }
    float _734 = _728;
    float _736 = _732;
    float _738 = fma(_714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _740 = sqrt(_712);
    float _742 = _726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _744 = fma(_714, _738, -0.212114393711090087890625);
    float _746 = _690 * _734;
    float _748 = _690 * _736;
    float _750 = fma(_714, _744, 1.570728778839111328125);
    float _752 = -_656;
    float _754 = fma(_710, _706, _752);
    float _756 = fma(_746, 0.5, 0.5);
    float _758 = fma(_748, -0.5, 0.5);
    float _760 = fma(_754, 0.5, 0.5);
    float _762 = _740 * 0.636619746685028076171875;
    float _764 = -_750;
    float _766 = fma(_762, _764, 1.0);
    float3 _2483 = float3(_756, _758, _742);
    float _768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2483, float3(0.0), isnan(_2483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2483, float3(0.0), isnan(_2483)), level(0.0)).x;
    float2 _2494 = float2(_766, _760);
    float3 _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2494, float2(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2494, float2(0.0), isnan(_2494)), level(0.0)).xyz;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float _780 = in.m_57.y;
    float _782 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_59.x;
    float _790 = in.m_59.y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _794 = _792 != 0;
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _782);
    float _798 = in.m_57.x;
    float _800 = in.m_61.w;
    float _802 = _706;
    float _804 = _780;
    if (_786)
    {
        float _806 = in.m_59.x;
        _802 = _806;
    }
    float _808 = _802;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _796);
    out.m_63.x = _392;
    out.m_63.y = _390;
    out.m_63.z = _394;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_65.w = _672;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _820 = _790 > 0.5;
    float _822 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _826 = 0.0;
    float _828 = _816;
    if (_786)
    {
        _826 = _798;
    }
    float _830 = _826;
    float _832 = -_812;
    float _834 = fma(_822, 2.0, _832);
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.w = _800;
    float _840 = _830;
    if (!_786)
    {
        _828 = _798;
    }
    float _842 = _828;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _846 = _808 > 0.5;
    bool _848 = _846 && _786;
    float _850 = -_780;
    float _852 = _850 + 1.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _856 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _858 = in.m_69.x;
    float _860 = _842;
    if (_794)
    {
        float _862 = _820 ? _852 : _780;
        _804 = _862;
    }
    float _864 = _804;
    float _866 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _868 = -_140;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[76].x, _834);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _874 = fma(_838, _864, -0.5);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_848)
    {
        float _878 = -_830;
        float _880 = _878 + 1.0;
        _840 = _880;
    }
    float _882 = _840;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _886 = _160 != 0.0;
    bool _888 = isnan(_160);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = fma(_836, -2.0, _876);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_786)
    {
        _860 = _882;
    }
    float _900 = _860;
    float _902 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _896);
    float _904 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _824);
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _908 = -_902;
    float _910 = fma(_866, _874, _908);
    float _912 = fma(_854, _900, -0.5);
    float _914 = in.m_69.z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _918 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = fma(_904, _912, _870);
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = in.m_69.y;
    bool _926 = _252 == 0.0;
    bool _928 = !_894;
    bool _930 = _926 && _928;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_71.x = _918;
    out.m_71.y = _884;
    out.m_71.z = _922;
    out.m_71.w = _916;
    bool _934 = _262 == 0.0;
    bool _936 = _934 && _930;
    float _938 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _180 * _858;
    float _942 = _192 * _858;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = -_940;
    float _950 = fma(_192, _914, _948);
    float _952 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = exp2(_952);
    float _962 = fma(_180, _914, _942);
    float _964 = _924;
    float _966 = _962;
    float _968 = _950;
    float _970 = _958;
    if (!_936)
    {
        float _972 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _814);
    out.m_73.x = _938;
    out.m_73.y = _956;
    out.m_73.z = _958;
    out.m_73.w = _954;
    float _978 = _976;
    if (!_936)
    {
        float _980 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _966 = _980;
    }
    float _982 = _966;
    float _984 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _672 * 0.5;
    float _988 = _700 + _672;
    if (!_936)
    {
        float _990 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _968 = _990;
    }
    float _992 = _968;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _984);
    float _996 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _700;
    out.gl_Position.y = _708;
    out.gl_Position.z = _976;
    out.gl_Position.w = _672;
    float _998 = fma(_708, -0.5, _986);
    float _1000 = _988 * 0.5;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[8].z, _994);
    float _1004 = -_960;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1010 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _910 + 0.5;
    float _1014 = _920 + 0.5;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1008);
    float _1018 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1010);
    out.m_65.x = _1000;
    bool _1020 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1022 = isnan(_592);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1028 = _1024 || _1026;
    float _1030 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    out.m_75.x = _1014;
    out.m_75.y = _1012;
    float _1034 = 0.0;
    float _1036 = _1030;
    if (!_684)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1038 = _970;
    float _1040 = -_1030;
    float _1042 = _1040 + 1.0;
    out.m_65.y = _998;
    int _1044 = as_type<int>(_1038);
    if (!_684)
    {
        float _1046 = _1038 * 5.0;
        _1044 = as_type<int>(_1046);
    }
    int _1048 = _1044;
    out.m_77.x = _1002;
    out.m_77.y = _1032;
    out.m_77.z = _1016;
    if (!_1028)
    {
        _720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1050 = _720;
    float _1052 = _1050;
    float _1054 = _1050;
    if (!_1028)
    {
        _978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1056 = _978;
    float _1058 = _1056;
    float _1060 = _1056;
    if (!_684)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3044 = as_type<float>(_1048);
        out.gl_Position.z = _3044;
    }
    if (!_1028)
    {
        _722 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1062 = _722;
    float _1064 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1066 = _1064;
    float _1068 = _1062;
    float _1070 = _1062;
    if (!_684)
    {
        _1066 = 0.0;
    }
    float _1072 = _1066;
    if (!_1028)
    {
        _1034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1074 = _1034;
    float _1076 = _1074;
    float _1078 = _1074;
    if (!_1028)
    {
        _524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1080 = _524;
    float _1082 = _1030 * _768;
    float _1084 = _1080;
    float _1086 = _1080;
    if (!_1028)
    {
        _1036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1088 = _1036;
    float _1090 = _774 * _1082;
    float _1092 = _776 * _1082;
    float _1094 = _778 * _1082;
    out.m_79.x = _1090;
    out.m_79.y = _1092;
    out.m_79.z = _1094;
    out.m_79.w = _1042;
    bool _1096 = !_1028;
    float _1098 = _1088;
    float _1100 = _1088;
    if (!_1096)
    {
        bool _1102 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1104 = isnan(_592);
        bool _1106 = _1102 || _1104;
        bool _1108 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1110 = _1106 || _1108;
        if (!_1110)
        {
            float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1114 = _592 + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1118 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1116;
            float _1120 = 1.0 / _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1132 = _1130 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1136 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1142 = _1114 * _1120;
            float _1144 = precise::clamp(_1142, 0.0, 1.0);
            float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1148 = _1146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1150 = fma(_1144, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1152 = fma(_1144, _1148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1154 = fma(_1144, _1128, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1156 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1158 = fma(_1144, _1136, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1160 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1054 = _1152;
            _1070 = _1158;
            _1078 = _1150;
            _1100 = _1156;
            _1060 = _1154;
            _1086 = _1160;
            _1162 = true;
        }
        else
        {
            bool _1164 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1166 = isnan(_592);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1172 = _1168 || _1170;
            if (!_1172)
            {
                _1076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1174 = _1076;
            _1078 = _1174;
            if (!_1172)
            {
                _1052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1176 = _1052;
            _1054 = _1176;
            if (!_1172)
            {
                _1058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1178 = _1058;
            _1060 = _1178;
            if (!_1172)
            {
                _1098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1180 = _1098;
            _1100 = _1180;
            if (!_1172)
            {
                _1068 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1182 = _1068;
            _1070 = _1182;
            if (!_1172)
            {
                _1084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1184 = _1084;
            bool _1186 = !_1172;
            _1086 = _1184;
            if (!_1186)
            {
                bool _1188 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1190 = isnan(_592);
                bool _1192 = _1188 || _1190;
                bool _1194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1196 = _1192 || _1194;
                if (!_1196)
                {
                    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1200 = _592 + _1198;
                    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1202;
                    float _1206 = 1.0 / _1204;
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1218 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1222 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1226 = _1224 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1228 = _1200 * _1206;
                    float _1230 = precise::clamp(_1228, 0.0, 1.0);
                    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1236 = fma(_1230, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1238 = fma(_1230, _1234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1240 = fma(_1230, _1214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1242 = fma(_1230, _1218, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1244 = fma(_1230, _1222, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1246 = fma(_1230, _1226, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1054 = _1238;
                    _1070 = _1244;
                    _1078 = _1236;
                    _1100 = _1242;
                    _1060 = _1240;
                    _1086 = _1246;
                    _1162 = true;
                }
                else
                {
                    _1054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1070 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1162 = false;
    float _1248 = _1054;
    float _1250 = _1070;
    float _1252 = _1078;
    float _1254 = _1100;
    float _1256 = _1060;
    float _1258 = _1086;
    float _1260 = fma(_1032, -0.5, 0.5);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = -_1248;
    float _1266 = _1264 + _1250;
    float _1268 = -_1252;
    float _1270 = _1268 + _1254;
    float _1272 = -_1256;
    float _1274 = _1272 + _1258;
    bool _1276 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1278 = fma(_1262, _1266, _1248);
    float _1280 = fma(_1262, _1270, _1252);
    float _1282 = fma(_1262, _1274, _1256);
    float _1284 = _1072 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1286 = _1278 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1288 = fma(_1280, 0.298911988735198974609375, _1286);
    out.m_83.w = _1284;
    float _1290 = fma(_1282, 0.114477999508380889892578125, _1288);
    out.m_45.x = 1.0;
    float _1292 = -_1290;
    float _1294 = _1280 + _1292;
    float _1296 = -_1290;
    float _1298 = _1278 + _1296;
    float _1300 = -_1290;
    float _1302 = _1282 + _1300;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1306 = fma(_1298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1308 = fma(_1302, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    out.m_85.x = _1304;
    out.m_85.y = _1306;
    out.m_85.z = _1308;
    if (!_1276)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1310 = -_390;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1314 = -_392;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1318 = -_394;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1322 = _1312 * _1312;
    float _1324 = fma(_1316, _1316, _1322);
    float _1326 = fma(_1320, _1320, _1324);
    float _1328 = sqrt(_1326);
    float _1330 = rsqrt(_1326);
    float _1332 = -_1328;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1336 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1338 = precise::clamp(_1336, 0.0, 1.0);
    float _1340 = _1316 * _1330;
    float _1342 = _1312 * _1330;
    float _1344 = abs(_1338);
    float _1346 = log2(_1344);
    float _1348 = _1320 * _1330;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1352 = _1032 * _1342;
    float _1354 = -_1342;
    float _1356 = -_1350;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1356);
    float _1360 = fma(_1002, _1340, _1352);
    float _1362 = -_1348;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1358);
    float _1366 = fma(_1016, _1348, _1360);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1372 = _1364 + _1370;
    float _1374 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1376 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = exp2(_1374);
    float _1382 = _1380 * _1378;
    float _1384 = _1368 * _1382;
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1386;
    out.m_81.y = _1388;
    out.m_81.z = _1390;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1162 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_122);
        out.gl_Position.z = _1449;
    }
    if (!_108)
    {
        return out;
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1517 = as_type<float>(_156);
        out.gl_Position.z = _1517;
    }
    if (_150)
    {
        return out;
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _174 = _172 * 0.15915493667125701904296875;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = sin(_178);
    float _182 = _176 * 0.15915493667125701904296875;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _174 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _160 + (-0.5);
    float _196 = abs(_194);
    float _198 = fma(_196, -2.0, 1.0);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = _182 * 6.283185482025146484375;
    float _206 = sin(_204);
    float _208 = fma(_200, -2.0, 3.0);
    float _210 = _180 * _158;
    float _212 = _200 * _200;
    float _214 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _208 * _212;
    float _222 = _220 * 0.125;
    float _224 = _182 * 6.283185482025146484375;
    float _226 = cos(_224);
    float _228 = _192 * _158;
    float _230 = -_210;
    float _232 = fma(_192, _162, _230);
    float _234 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _238 = fma(_180, _162, _228);
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    bool _242 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _244 = isnan(0.5);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _250 = _246 || _248;
    float _252 = fma(_206, _222, _238);
    float _254 = _216 * _240;
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _252);
    float _258 = _254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_222, _226, _232);
    float _264 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = _234 * _256;
    float _268 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _262);
    float _272 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _276 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _278 = _236 * _270;
    float _280 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _282 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _284 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _286 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _288 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _282);
    float _292 = _284 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _294 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _296 = _288 + _286;
    float _298 = _292 + _290;
    float _300 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _294);
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _308 = _298 + _306;
    float _310 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _312 = _304 * _304;
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _316 = fma(_308, _308, _312);
    float _318 = _254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = sqrt(_316);
    float _322 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[9].x, _318);
    float _324 = _318;
    float _326 = _184;
    float _328 = _188;
    float _330 = _304;
    if (_250)
    {
        _324 = 1.0;
    }
    float _332 = _324;
    float _334 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _322);
    float _336 = _314 + _334;
    bool _338 = _320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _340 = _336;
    float _342 = _332;
    if (!_338)
    {
        _326 = _298;
    }
    float _344 = _326;
    float _346 = _344;
    if (!_338)
    {
        _328 = _296;
    }
    float _348 = _328;
    bool _350 = !_338;
    float _352 = _348;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _358 = _320 + _356;
        float _360 = rsqrt(_316);
        float _362 = _358 * _354;
        float _364 = _336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = _362 * 0.15915493667125701904296875;
        float _368 = _366 * 6.283185482025146484375;
        float _370 = cos(_368);
        float _372 = _366 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _370 + (-1.0);
        float _378 = _376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = fma(_374, _364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _382 = fma(_336, _370, _378);
        float _384 = _360 * _380;
        float _386 = fma(_308, _384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _388 = fma(_304, _384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _340 = _382;
        _346 = _386;
        _352 = _388;
    }
    float _390 = _340;
    float _392 = _346;
    float _394 = _352;
    if (!_250)
    {
        float _396 = as_type<float>(in.m_55.w);
        int _398 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _400 = _398 == 4;
        bool _402 = _398 == 8;
        bool _404 = _398 == 12;
        int _406 = as_type<int>(_396) << 16;
        int _408 = as_type<int>(_396) << 8;
        int _410 = as_type<int>(_396) << 24;
        int _412 = _406 >> 24;
        int _414 = _408 >> 24;
        int _416 = as_type<int>(_396) >> 24;
        int _418 = _410 >> 24;
        float _420 = float(_412);
        float _422 = float(_414);
        float _424 = float(_416);
        float _426 = _420 * 0.0078740157186985015869140625;
        float _428 = float(_418);
        float _430 = _422 * 0.0078740157186985015869140625;
        float _432 = _424 * 0.0078740157186985015869140625;
        float _434 = precise::min(_426, 1.0);
        float _436 = _428 * 0.0078740157186985015869140625;
        float _438 = precise::min(_430, 1.0);
        float _440 = precise::min(_432, 1.0);
        float _442 = precise::min(_436, 1.0);
        float _444 = precise::max(_434, -1.0);
        float _446 = precise::max(_438, -1.0);
        float _448 = precise::max(_440, -1.0);
        float _450 = precise::max(_442, -1.0);
        float _452 = _450;
        if (_400)
        {
            _452 = _444;
        }
        float _454 = _452;
        float _456 = _454;
        if (_402)
        {
            _456 = _446;
        }
        float _458 = _456;
        float _460 = _458;
        if (_404)
        {
            _460 = _448;
        }
        float _462 = _460;
        float _464 = abs(_462);
        float _466 = (-0.0) + _464;
        _342 = _466;
    }
    float _468 = _342;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _472 = _390 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _392 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _394 + _478;
    float _482 = _472 * _472;
    float _484 = fma(_476, _476, _482);
    float _486 = fma(_480, _480, _484);
    float _488 = rsqrt(_486);
    float _490 = _488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _492 = _476 * _490;
    float _494 = _480 * _490;
    float _496 = _492 * _492;
    float _498 = _494 * _494;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = _496 + _498;
    float _504 = precise::max(0.0, _500);
    float _506 = sqrt(_502);
    float _508 = -_490;
    float _510 = -_504;
    float _512 = fma(_472, _508, _510);
    bool _514 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _516 = _472;
    float _518 = _496;
    float _520 = _498;
    float _522 = _494;
    float _524 = _468;
    if (!_514)
    {
        _516 = _496;
    }
    float _526 = _516;
    float _528 = _526;
    if (!_514)
    {
        _330 = _492;
    }
    float _530 = _330;
    float _532 = _530;
    if (!_514)
    {
        _518 = _512;
    }
    float _534 = _518;
    bool _536 = !_514;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _506 + _542;
        float _546 = rsqrt(_502);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = fma(_556, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _546 * _562;
        float _566 = _560 + (-1.0);
        float _568 = _492 * _564;
        float _570 = _494 * _564;
        float _572 = _566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * _570;
        float _576 = fma(_512, _560, _572);
        float _578 = _568 * _568;
        _538 = _576;
        _528 = _578;
        _520 = _574;
        _532 = _568;
        _522 = _570;
    }
    float _580 = _538;
    float _582 = _528;
    float _584 = _520;
    float _586 = _532;
    float _588 = _522;
    float _590 = fma(_580, _580, _582);
    float _592 = sqrt(_486);
    float _594 = _390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _596 = _390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = _590 + _584;
    float _600 = _390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _602 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _594);
    float _604 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _606 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _600);
    float _608 = rsqrt(_598);
    float _610 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _602);
    float _612 = _390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _614 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _604);
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _606);
    float _618 = _610 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _612);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _624 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _622);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = _616 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _632 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _634 = -_626;
    float _636 = _634 + 1.0;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _632);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _620);
    float _646 = _608 * _586;
    float _648 = abs(_636);
    float _650 = log2(_648);
    float _652 = -_640;
    float _654 = fma(_638, _652, 1.0);
    float _656 = _608 * _580;
    float _658 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = _608 * _588;
    float _662 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _642);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = log2(_654);
    float _670 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    bool _676 = _468 != 0.0;
    bool _678 = isnan(_468);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _670);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _674);
    float _690 = 1.0 / _672;
    float _692 = -_658;
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _692);
    float _696 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _698 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _700 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _688);
    float _702 = -_660;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _694);
    float _706 = _656 + 1.0;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _710 = exp2(_696);
    float _712 = fma(_704, -0.5, 0.5);
    float _714 = fma(_704, 0.5, 0.5);
    float _716 = _698;
    float _718 = _670;
    float _720 = _672;
    float _722 = _700;
    if (_684)
    {
        _716 = _700;
    }
    float _724 = _716;
    float _726 = _668 * 0.693147182464599609375;
    float _728 = _724;
    if (_684)
    {
        _718 = _708;
    }
    float _730 = _718;
    float _732 = _730;
    if (!_684)
    {
        _728 = 0.0;
        _732 = 0.0;
    }
    float _734 = _728;
    float _736 = _732;
    float _738 = fma(_714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _740 = sqrt(_712);
    float _742 = _726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _744 = fma(_714, _738, -0.212114393711090087890625);
    float _746 = _690 * _734;
    float _748 = _690 * _736;
    float _750 = fma(_714, _744, 1.570728778839111328125);
    float _752 = -_656;
    float _754 = fma(_710, _706, _752);
    float _756 = fma(_746, 0.5, 0.5);
    float _758 = fma(_748, -0.5, 0.5);
    float _760 = fma(_754, 0.5, 0.5);
    float _762 = _740 * 0.636619746685028076171875;
    float _764 = -_750;
    float _766 = fma(_762, _764, 1.0);
    float3 _2483 = float3(_756, _758, _742);
    float _768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2483, float3(0.0), isnan(_2483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2483, float3(0.0), isnan(_2483)), level(0.0)).x;
    float2 _2494 = float2(_766, _760);
    float3 _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2494, float2(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2494, float2(0.0), isnan(_2494)), level(0.0)).xyz;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float _780 = in.m_57.y;
    float _782 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_59.x;
    float _790 = in.m_59.y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _794 = _792 != 0;
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _782);
    float _798 = in.m_57.x;
    float _800 = in.m_61.w;
    float _802 = _706;
    float _804 = _780;
    if (_786)
    {
        float _806 = in.m_59.x;
        _802 = _806;
    }
    float _808 = _802;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _796);
    out.m_63.x = _392;
    out.m_63.y = _390;
    out.m_63.z = _394;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_65.w = _672;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _820 = _790 > 0.5;
    float _822 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _826 = 0.0;
    float _828 = _816;
    if (_786)
    {
        _826 = _798;
    }
    float _830 = _826;
    float _832 = -_812;
    float _834 = fma(_822, 2.0, _832);
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.w = _800;
    float _840 = _830;
    if (!_786)
    {
        _828 = _798;
    }
    float _842 = _828;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _846 = _808 > 0.5;
    bool _848 = _846 && _786;
    float _850 = -_780;
    float _852 = _850 + 1.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _856 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _858 = in.m_69.x;
    float _860 = _842;
    if (_794)
    {
        float _862 = _820 ? _852 : _780;
        _804 = _862;
    }
    float _864 = _804;
    float _866 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _868 = -_140;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[76].x, _834);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _874 = fma(_838, _864, -0.5);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_848)
    {
        float _878 = -_830;
        float _880 = _878 + 1.0;
        _840 = _880;
    }
    float _882 = _840;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _886 = _160 != 0.0;
    bool _888 = isnan(_160);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = fma(_836, -2.0, _876);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_786)
    {
        _860 = _882;
    }
    float _900 = _860;
    float _902 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _896);
    float _904 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _824);
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _908 = -_902;
    float _910 = fma(_866, _874, _908);
    float _912 = fma(_854, _900, -0.5);
    float _914 = in.m_69.z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _918 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = fma(_904, _912, _870);
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = in.m_69.y;
    bool _926 = _252 == 0.0;
    bool _928 = !_894;
    bool _930 = _926 && _928;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_71.x = _918;
    out.m_71.y = _884;
    out.m_71.z = _922;
    out.m_71.w = _916;
    bool _934 = _262 == 0.0;
    bool _936 = _934 && _930;
    float _938 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _180 * _858;
    float _942 = _192 * _858;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = -_940;
    float _950 = fma(_192, _914, _948);
    float _952 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = exp2(_952);
    float _962 = fma(_180, _914, _942);
    float _964 = _924;
    float _966 = _962;
    float _968 = _950;
    float _970 = _958;
    if (!_936)
    {
        float _972 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _814);
    out.m_73.x = _938;
    out.m_73.y = _956;
    out.m_73.z = _958;
    out.m_73.w = _954;
    float _978 = _976;
    if (!_936)
    {
        float _980 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _966 = _980;
    }
    float _982 = _966;
    float _984 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _672 * 0.5;
    float _988 = _700 + _672;
    if (!_936)
    {
        float _990 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _968 = _990;
    }
    float _992 = _968;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _984);
    float _996 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _700;
    out.gl_Position.y = _708;
    out.gl_Position.z = _976;
    out.gl_Position.w = _672;
    float _998 = fma(_708, -0.5, _986);
    float _1000 = _988 * 0.5;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[8].z, _994);
    float _1004 = -_960;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1010 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _910 + 0.5;
    float _1014 = _920 + 0.5;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1008);
    float _1018 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1010);
    out.m_65.x = _1000;
    bool _1020 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1022 = isnan(_592);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1028 = _1024 || _1026;
    float _1030 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    out.m_75.x = _1014;
    out.m_75.y = _1012;
    float _1034 = 0.0;
    float _1036 = _1030;
    if (!_684)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1038 = _970;
    float _1040 = -_1030;
    float _1042 = _1040 + 1.0;
    out.m_65.y = _998;
    int _1044 = as_type<int>(_1038);
    if (!_684)
    {
        float _1046 = _1038 * 5.0;
        _1044 = as_type<int>(_1046);
    }
    int _1048 = _1044;
    out.m_77.x = _1002;
    out.m_77.y = _1032;
    out.m_77.z = _1016;
    if (!_1028)
    {
        _720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1050 = _720;
    float _1052 = _1050;
    float _1054 = _1050;
    if (!_1028)
    {
        _978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1056 = _978;
    float _1058 = _1056;
    float _1060 = _1056;
    if (!_684)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3044 = as_type<float>(_1048);
        out.gl_Position.z = _3044;
    }
    if (!_1028)
    {
        _722 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1062 = _722;
    float _1064 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1066 = _1064;
    float _1068 = _1062;
    float _1070 = _1062;
    if (!_684)
    {
        _1066 = 0.0;
    }
    float _1072 = _1066;
    if (!_1028)
    {
        _1034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1074 = _1034;
    float _1076 = _1074;
    float _1078 = _1074;
    if (!_1028)
    {
        _524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1080 = _524;
    float _1082 = _1030 * _768;
    float _1084 = _1080;
    float _1086 = _1080;
    if (!_1028)
    {
        _1036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1088 = _1036;
    float _1090 = _774 * _1082;
    float _1092 = _776 * _1082;
    float _1094 = _778 * _1082;
    out.m_79.x = _1090;
    out.m_79.y = _1092;
    out.m_79.z = _1094;
    out.m_79.w = _1042;
    bool _1096 = !_1028;
    float _1098 = _1088;
    float _1100 = _1088;
    if (!_1096)
    {
        bool _1102 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1104 = isnan(_592);
        bool _1106 = _1102 || _1104;
        bool _1108 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1110 = _1106 || _1108;
        if (!_1110)
        {
            float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1114 = _592 + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1118 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1116;
            float _1120 = 1.0 / _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1132 = _1130 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1136 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1142 = _1114 * _1120;
            float _1144 = precise::clamp(_1142, 0.0, 1.0);
            float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1148 = _1146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1150 = fma(_1144, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1152 = fma(_1144, _1148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1154 = fma(_1144, _1128, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1156 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1158 = fma(_1144, _1136, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1160 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1054 = _1152;
            _1070 = _1158;
            _1078 = _1150;
            _1100 = _1156;
            _1060 = _1154;
            _1086 = _1160;
            _1162 = true;
        }
        else
        {
            bool _1164 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1166 = isnan(_592);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1172 = _1168 || _1170;
            if (!_1172)
            {
                _1076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1174 = _1076;
            _1078 = _1174;
            if (!_1172)
            {
                _1052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1176 = _1052;
            _1054 = _1176;
            if (!_1172)
            {
                _1058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1178 = _1058;
            _1060 = _1178;
            if (!_1172)
            {
                _1098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1180 = _1098;
            _1100 = _1180;
            if (!_1172)
            {
                _1068 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1182 = _1068;
            _1070 = _1182;
            if (!_1172)
            {
                _1084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1184 = _1084;
            bool _1186 = !_1172;
            _1086 = _1184;
            if (!_1186)
            {
                bool _1188 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1190 = isnan(_592);
                bool _1192 = _1188 || _1190;
                bool _1194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1196 = _1192 || _1194;
                if (!_1196)
                {
                    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1200 = _592 + _1198;
                    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1202;
                    float _1206 = 1.0 / _1204;
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1218 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1222 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1226 = _1224 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1228 = _1200 * _1206;
                    float _1230 = precise::clamp(_1228, 0.0, 1.0);
                    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1236 = fma(_1230, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1238 = fma(_1230, _1234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1240 = fma(_1230, _1214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1242 = fma(_1230, _1218, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1244 = fma(_1230, _1222, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1246 = fma(_1230, _1226, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1054 = _1238;
                    _1070 = _1244;
                    _1078 = _1236;
                    _1100 = _1242;
                    _1060 = _1240;
                    _1086 = _1246;
                    _1162 = true;
                }
                else
                {
                    _1054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1070 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1162 = false;
    float _1248 = _1054;
    float _1250 = _1070;
    float _1252 = _1078;
    float _1254 = _1100;
    float _1256 = _1060;
    float _1258 = _1086;
    float _1260 = fma(_1032, -0.5, 0.5);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = -_1248;
    float _1266 = _1264 + _1250;
    float _1268 = -_1252;
    float _1270 = _1268 + _1254;
    float _1272 = -_1256;
    float _1274 = _1272 + _1258;
    bool _1276 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1278 = fma(_1262, _1266, _1248);
    float _1280 = fma(_1262, _1270, _1252);
    float _1282 = fma(_1262, _1274, _1256);
    float _1284 = _1072 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1286 = _1278 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1288 = fma(_1280, 0.298911988735198974609375, _1286);
    out.m_83.w = _1284;
    float _1290 = fma(_1282, 0.114477999508380889892578125, _1288);
    out.m_45.x = 1.0;
    float _1292 = -_1290;
    float _1294 = _1280 + _1292;
    float _1296 = -_1290;
    float _1298 = _1278 + _1296;
    float _1300 = -_1290;
    float _1302 = _1282 + _1300;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1306 = fma(_1298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1308 = fma(_1302, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    out.m_85.x = _1304;
    out.m_85.y = _1306;
    out.m_85.z = _1308;
    if (!_1276)
    {
        return out;
    }
    float _1310 = -_390;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1314 = -_392;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1318 = -_394;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1322 = _1312 * _1312;
    float _1324 = fma(_1316, _1316, _1322);
    float _1326 = fma(_1320, _1320, _1324);
    float _1328 = sqrt(_1326);
    float _1330 = rsqrt(_1326);
    float _1332 = -_1328;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1336 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1338 = precise::clamp(_1336, 0.0, 1.0);
    float _1340 = _1316 * _1330;
    float _1342 = _1312 * _1330;
    float _1344 = abs(_1338);
    float _1346 = log2(_1344);
    float _1348 = _1320 * _1330;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1352 = _1032 * _1342;
    float _1354 = -_1342;
    float _1356 = -_1350;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1356);
    float _1360 = fma(_1002, _1340, _1352);
    float _1362 = -_1348;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1358);
    float _1366 = fma(_1016, _1348, _1360);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1372 = _1364 + _1370;
    float _1374 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1376 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = exp2(_1374);
    float _1382 = _1380 * _1378;
    float _1384 = _1368 * _1382;
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1386;
    out.m_81.y = _1388;
    out.m_81.z = _1390;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1162 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1449 = as_type<float>(_122);
        out.gl_Position.z = _1449;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1517 = as_type<float>(_156);
        out.gl_Position.z = _1517;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _174 = _172 * 0.15915493667125701904296875;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = sin(_178);
    float _182 = _176 * 0.15915493667125701904296875;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _174 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _160 + (-0.5);
    float _196 = abs(_194);
    float _198 = fma(_196, -2.0, 1.0);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = _182 * 6.283185482025146484375;
    float _206 = sin(_204);
    float _208 = fma(_200, -2.0, 3.0);
    float _210 = _180 * _158;
    float _212 = _200 * _200;
    float _214 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = _208 * _212;
    float _222 = _220 * 0.125;
    float _224 = _182 * 6.283185482025146484375;
    float _226 = cos(_224);
    float _228 = _192 * _158;
    float _230 = -_210;
    float _232 = fma(_192, _162, _230);
    float _234 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _236 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _238 = fma(_180, _162, _228);
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    bool _242 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _244 = isnan(0.5);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _250 = _246 || _248;
    float _252 = fma(_206, _222, _238);
    float _254 = _216 * _240;
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _252);
    float _258 = _254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _260 = _254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _262 = fma(_222, _226, _232);
    float _264 = _186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = _234 * _256;
    float _268 = _186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _262);
    float _272 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[10].x, _258);
    float _276 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _268);
    float _278 = _236 * _270;
    float _280 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _282 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _284 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _276);
    float _286 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _274);
    float _288 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _282);
    float _292 = _284 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _294 = _186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _296 = _288 + _286;
    float _298 = _292 + _290;
    float _300 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _294);
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _308 = _298 + _306;
    float _310 = fma(_188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _312 = _304 * _304;
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _316 = fma(_308, _308, _312);
    float _318 = _254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _320 = sqrt(_316);
    float _322 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[9].x, _318);
    float _324 = _318;
    float _326 = _184;
    float _328 = _188;
    float _330 = _304;
    if (_250)
    {
        _324 = 1.0;
    }
    float _332 = _324;
    float _334 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _322);
    float _336 = _314 + _334;
    bool _338 = _320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _340 = _336;
    float _342 = _332;
    if (!_338)
    {
        _326 = _298;
    }
    float _344 = _326;
    float _346 = _344;
    if (!_338)
    {
        _328 = _296;
    }
    float _348 = _328;
    bool _350 = !_338;
    float _352 = _348;
    if (!_350)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _358 = _320 + _356;
        float _360 = rsqrt(_316);
        float _362 = _358 * _354;
        float _364 = _336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _366 = _362 * 0.15915493667125701904296875;
        float _368 = _366 * 6.283185482025146484375;
        float _370 = cos(_368);
        float _372 = _366 * 6.283185482025146484375;
        float _374 = sin(_372);
        float _376 = _370 + (-1.0);
        float _378 = _376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = fma(_374, _364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _382 = fma(_336, _370, _378);
        float _384 = _360 * _380;
        float _386 = fma(_308, _384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _388 = fma(_304, _384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _340 = _382;
        _346 = _386;
        _352 = _388;
    }
    float _390 = _340;
    float _392 = _346;
    float _394 = _352;
    if (!_250)
    {
        float _396 = as_type<float>(in.m_55.w);
        int _398 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _400 = _398 == 4;
        bool _402 = _398 == 8;
        bool _404 = _398 == 12;
        int _406 = as_type<int>(_396) << 16;
        int _408 = as_type<int>(_396) << 8;
        int _410 = as_type<int>(_396) << 24;
        int _412 = _406 >> 24;
        int _414 = _408 >> 24;
        int _416 = as_type<int>(_396) >> 24;
        int _418 = _410 >> 24;
        float _420 = float(_412);
        float _422 = float(_414);
        float _424 = float(_416);
        float _426 = _420 * 0.0078740157186985015869140625;
        float _428 = float(_418);
        float _430 = _422 * 0.0078740157186985015869140625;
        float _432 = _424 * 0.0078740157186985015869140625;
        float _434 = precise::min(_426, 1.0);
        float _436 = _428 * 0.0078740157186985015869140625;
        float _438 = precise::min(_430, 1.0);
        float _440 = precise::min(_432, 1.0);
        float _442 = precise::min(_436, 1.0);
        float _444 = precise::max(_434, -1.0);
        float _446 = precise::max(_438, -1.0);
        float _448 = precise::max(_440, -1.0);
        float _450 = precise::max(_442, -1.0);
        float _452 = _450;
        if (_400)
        {
            _452 = _444;
        }
        float _454 = _452;
        float _456 = _454;
        if (_402)
        {
            _456 = _446;
        }
        float _458 = _456;
        float _460 = _458;
        if (_404)
        {
            _460 = _448;
        }
        float _462 = _460;
        float _464 = abs(_462);
        float _466 = (-0.0) + _464;
        _342 = _466;
    }
    float _468 = _342;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _472 = _390 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _392 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _480 = _394 + _478;
    float _482 = _472 * _472;
    float _484 = fma(_476, _476, _482);
    float _486 = fma(_480, _480, _484);
    float _488 = rsqrt(_486);
    float _490 = _488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _492 = _476 * _490;
    float _494 = _480 * _490;
    float _496 = _492 * _492;
    float _498 = _494 * _494;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = _496 + _498;
    float _504 = precise::max(0.0, _500);
    float _506 = sqrt(_502);
    float _508 = -_490;
    float _510 = -_504;
    float _512 = fma(_472, _508, _510);
    bool _514 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _516 = _472;
    float _518 = _496;
    float _520 = _498;
    float _522 = _494;
    float _524 = _468;
    if (!_514)
    {
        _516 = _496;
    }
    float _526 = _516;
    float _528 = _526;
    if (!_514)
    {
        _330 = _492;
    }
    float _530 = _330;
    float _532 = _530;
    if (!_514)
    {
        _518 = _512;
    }
    float _534 = _518;
    bool _536 = !_514;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _506 + _542;
        float _546 = rsqrt(_502);
        float _548 = _544 * _540;
        float _550 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _552 = _548 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = fma(_556, _550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = _546 * _562;
        float _566 = _560 + (-1.0);
        float _568 = _492 * _564;
        float _570 = _494 * _564;
        float _572 = _566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * _570;
        float _576 = fma(_512, _560, _572);
        float _578 = _568 * _568;
        _538 = _576;
        _528 = _578;
        _520 = _574;
        _532 = _568;
        _522 = _570;
    }
    float _580 = _538;
    float _582 = _528;
    float _584 = _520;
    float _586 = _532;
    float _588 = _522;
    float _590 = fma(_580, _580, _582);
    float _592 = sqrt(_486);
    float _594 = _390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _596 = _390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = _590 + _584;
    float _600 = _390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _602 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _594);
    float _604 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _606 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _600);
    float _608 = rsqrt(_598);
    float _610 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _602);
    float _612 = _390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _614 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _604);
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _606);
    float _618 = _610 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _620 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _612);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _624 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _622);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _614 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = _616 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _632 = _618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _634 = -_626;
    float _636 = _634 + 1.0;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _632);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _620);
    float _646 = _608 * _586;
    float _648 = abs(_636);
    float _650 = log2(_648);
    float _652 = -_640;
    float _654 = fma(_638, _652, 1.0);
    float _656 = _608 * _580;
    float _658 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _660 = _608 * _588;
    float _662 = _644 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _642);
    float _666 = _618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _668 = log2(_654);
    float _670 = _618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _666);
    bool _676 = _468 != 0.0;
    bool _678 = isnan(_468);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _670);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _674);
    float _690 = 1.0 / _672;
    float _692 = -_658;
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _692);
    float _696 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _698 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _700 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _688);
    float _702 = -_660;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _694);
    float _706 = _656 + 1.0;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _710 = exp2(_696);
    float _712 = fma(_704, -0.5, 0.5);
    float _714 = fma(_704, 0.5, 0.5);
    float _716 = _698;
    float _718 = _670;
    float _720 = _672;
    float _722 = _700;
    if (_684)
    {
        _716 = _700;
    }
    float _724 = _716;
    float _726 = _668 * 0.693147182464599609375;
    float _728 = _724;
    if (_684)
    {
        _718 = _708;
    }
    float _730 = _718;
    float _732 = _730;
    if (!_684)
    {
        _728 = 0.0;
        _732 = 0.0;
    }
    float _734 = _728;
    float _736 = _732;
    float _738 = fma(_714, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _740 = sqrt(_712);
    float _742 = _726 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _744 = fma(_714, _738, -0.212114393711090087890625);
    float _746 = _690 * _734;
    float _748 = _690 * _736;
    float _750 = fma(_714, _744, 1.570728778839111328125);
    float _752 = -_656;
    float _754 = fma(_710, _706, _752);
    float _756 = fma(_746, 0.5, 0.5);
    float _758 = fma(_748, -0.5, 0.5);
    float _760 = fma(_754, 0.5, 0.5);
    float _762 = _740 * 0.636619746685028076171875;
    float _764 = -_750;
    float _766 = fma(_762, _764, 1.0);
    float3 _2483 = float3(_756, _758, _742);
    float _768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2483, float3(0.0), isnan(_2483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2483, float3(0.0), isnan(_2483)), level(0.0)).x;
    float2 _2494 = float2(_766, _760);
    float3 _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2494, float2(0.0), isnan(_2494)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2494, float2(0.0), isnan(_2494)), level(0.0)).xyz;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float _780 = in.m_57.y;
    float _782 = _618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_59.x;
    float _790 = in.m_59.y;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _794 = _792 != 0;
    float _796 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _782);
    float _798 = in.m_57.x;
    float _800 = in.m_61.w;
    float _802 = _706;
    float _804 = _780;
    if (_786)
    {
        float _806 = in.m_59.x;
        _802 = _806;
    }
    float _808 = _802;
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _796);
    out.m_63.x = _392;
    out.m_63.y = _390;
    out.m_63.z = _394;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_65.w = _672;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _820 = _790 > 0.5;
    float _822 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _826 = 0.0;
    float _828 = _816;
    if (_786)
    {
        _826 = _798;
    }
    float _830 = _826;
    float _832 = -_812;
    float _834 = fma(_822, 2.0, _832);
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = _810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.w = _800;
    float _840 = _830;
    if (!_786)
    {
        _828 = _798;
    }
    float _842 = _828;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _846 = _808 > 0.5;
    bool _848 = _846 && _786;
    float _850 = -_780;
    float _852 = _850 + 1.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _856 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    float _858 = in.m_69.x;
    float _860 = _842;
    if (_794)
    {
        float _862 = _820 ? _852 : _780;
        _804 = _862;
    }
    float _864 = _804;
    float _866 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _868 = -_140;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[76].x, _834);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _874 = fma(_838, _864, -0.5);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_848)
    {
        float _878 = -_830;
        float _880 = _878 + 1.0;
        _840 = _880;
    }
    float _882 = _840;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _886 = _160 != 0.0;
    bool _888 = isnan(_160);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = fma(_836, -2.0, _876);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_786)
    {
        _860 = _882;
    }
    float _900 = _860;
    float _902 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _896);
    float _904 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _824);
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _908 = -_902;
    float _910 = fma(_866, _874, _908);
    float _912 = fma(_854, _900, -0.5);
    float _914 = in.m_69.z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _918 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = fma(_904, _912, _870);
    float _922 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = in.m_69.y;
    bool _926 = _252 == 0.0;
    bool _928 = !_894;
    bool _930 = _926 && _928;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_71.x = _918;
    out.m_71.y = _884;
    out.m_71.z = _922;
    out.m_71.w = _916;
    bool _934 = _262 == 0.0;
    bool _936 = _934 && _930;
    float _938 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = _180 * _858;
    float _942 = _192 * _858;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = -_940;
    float _950 = fma(_192, _914, _948);
    float _952 = _650 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = exp2(_952);
    float _962 = fma(_180, _914, _942);
    float _964 = _924;
    float _966 = _962;
    float _968 = _950;
    float _970 = _958;
    if (!_936)
    {
        float _972 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _814);
    out.m_73.x = _938;
    out.m_73.y = _956;
    out.m_73.z = _958;
    out.m_73.w = _954;
    float _978 = _976;
    if (!_936)
    {
        float _980 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _966 = _980;
    }
    float _982 = _966;
    float _984 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _986 = _672 * 0.5;
    float _988 = _700 + _672;
    if (!_936)
    {
        float _990 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _968 = _990;
    }
    float _992 = _968;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _984);
    float _996 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _700;
    out.gl_Position.y = _708;
    out.gl_Position.z = _976;
    out.gl_Position.w = _672;
    float _998 = fma(_708, -0.5, _986);
    float _1000 = _988 * 0.5;
    float _1002 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[8].z, _994);
    float _1004 = -_960;
    float _1006 = _1004 + 1.0;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1010 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1012 = _910 + 0.5;
    float _1014 = _920 + 0.5;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1008);
    float _1018 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1010);
    out.m_65.x = _1000;
    bool _1020 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1022 = isnan(_592);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1028 = _1024 || _1026;
    float _1030 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    out.m_75.x = _1014;
    out.m_75.y = _1012;
    float _1034 = 0.0;
    float _1036 = _1030;
    if (!_684)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1038 = _970;
    float _1040 = -_1030;
    float _1042 = _1040 + 1.0;
    out.m_65.y = _998;
    int _1044 = as_type<int>(_1038);
    if (!_684)
    {
        float _1046 = _1038 * 5.0;
        _1044 = as_type<int>(_1046);
    }
    int _1048 = _1044;
    out.m_77.x = _1002;
    out.m_77.y = _1032;
    out.m_77.z = _1016;
    if (!_1028)
    {
        _720 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1050 = _720;
    float _1052 = _1050;
    float _1054 = _1050;
    if (!_1028)
    {
        _978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1056 = _978;
    float _1058 = _1056;
    float _1060 = _1056;
    if (!_684)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3044 = as_type<float>(_1048);
        out.gl_Position.z = _3044;
    }
    if (!_1028)
    {
        _722 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1062 = _722;
    float _1064 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1066 = _1064;
    float _1068 = _1062;
    float _1070 = _1062;
    if (!_684)
    {
        _1066 = 0.0;
    }
    float _1072 = _1066;
    if (!_1028)
    {
        _1034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1074 = _1034;
    float _1076 = _1074;
    float _1078 = _1074;
    if (!_1028)
    {
        _524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1080 = _524;
    float _1082 = _1030 * _768;
    float _1084 = _1080;
    float _1086 = _1080;
    if (!_1028)
    {
        _1036 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1088 = _1036;
    float _1090 = _774 * _1082;
    float _1092 = _776 * _1082;
    float _1094 = _778 * _1082;
    out.m_79.x = _1090;
    out.m_79.y = _1092;
    out.m_79.z = _1094;
    out.m_79.w = _1042;
    bool _1096 = !_1028;
    float _1098 = _1088;
    float _1100 = _1088;
    if (!_1096)
    {
        bool _1102 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1104 = isnan(_592);
        bool _1106 = _1102 || _1104;
        bool _1108 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1110 = _1106 || _1108;
        if (!_1110)
        {
            float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1114 = _592 + _1112;
            float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1118 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1116;
            float _1120 = 1.0 / _1118;
            float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1128 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1132 = _1130 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1136 = _1134 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1140 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1142 = _1114 * _1120;
            float _1144 = precise::clamp(_1142, 0.0, 1.0);
            float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1148 = _1146 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1150 = fma(_1144, _1124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1152 = fma(_1144, _1148, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1154 = fma(_1144, _1128, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1156 = fma(_1144, _1132, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1158 = fma(_1144, _1136, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1160 = fma(_1144, _1140, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1054 = _1152;
            _1070 = _1158;
            _1078 = _1150;
            _1100 = _1156;
            _1060 = _1154;
            _1086 = _1160;
            _1162 = true;
        }
        else
        {
            bool _1164 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1166 = isnan(_592);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1172 = _1168 || _1170;
            if (!_1172)
            {
                _1076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1174 = _1076;
            _1078 = _1174;
            if (!_1172)
            {
                _1052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1176 = _1052;
            _1054 = _1176;
            if (!_1172)
            {
                _1058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1178 = _1058;
            _1060 = _1178;
            if (!_1172)
            {
                _1098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1180 = _1098;
            _1100 = _1180;
            if (!_1172)
            {
                _1068 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1182 = _1068;
            _1070 = _1182;
            if (!_1172)
            {
                _1084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1184 = _1084;
            bool _1186 = !_1172;
            _1086 = _1184;
            if (!_1186)
            {
                bool _1188 = _592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1190 = isnan(_592);
                bool _1192 = _1188 || _1190;
                bool _1194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1196 = _1192 || _1194;
                if (!_1196)
                {
                    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1200 = _592 + _1198;
                    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1202;
                    float _1206 = 1.0 / _1204;
                    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1210 = _1208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1214 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1218 = _1216 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1222 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1226 = _1224 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1228 = _1200 * _1206;
                    float _1230 = precise::clamp(_1228, 0.0, 1.0);
                    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1236 = fma(_1230, _1210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1238 = fma(_1230, _1234, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1240 = fma(_1230, _1214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1242 = fma(_1230, _1218, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1244 = fma(_1230, _1222, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1246 = fma(_1230, _1226, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1054 = _1238;
                    _1070 = _1244;
                    _1078 = _1236;
                    _1100 = _1242;
                    _1060 = _1240;
                    _1086 = _1246;
                    _1162 = true;
                }
                else
                {
                    _1054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1070 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1162 = false;
    float _1248 = _1054;
    float _1250 = _1070;
    float _1252 = _1078;
    float _1254 = _1100;
    float _1256 = _1060;
    float _1258 = _1086;
    float _1260 = fma(_1032, -0.5, 0.5);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = -_1248;
    float _1266 = _1264 + _1250;
    float _1268 = -_1252;
    float _1270 = _1268 + _1254;
    float _1272 = -_1256;
    float _1274 = _1272 + _1258;
    bool _1276 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1278 = fma(_1262, _1266, _1248);
    float _1280 = fma(_1262, _1270, _1252);
    float _1282 = fma(_1262, _1274, _1256);
    float _1284 = _1072 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1286 = _1278 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _1288 = fma(_1280, 0.298911988735198974609375, _1286);
    out.m_83.w = _1284;
    float _1290 = fma(_1282, 0.114477999508380889892578125, _1288);
    out.m_45.x = 1.0;
    float _1292 = -_1290;
    float _1294 = _1280 + _1292;
    float _1296 = -_1290;
    float _1298 = _1278 + _1296;
    float _1300 = -_1290;
    float _1302 = _1282 + _1300;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1306 = fma(_1298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    float _1308 = fma(_1302, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1290);
    out.m_85.x = _1304;
    out.m_85.y = _1306;
    out.m_85.z = _1308;
    if (!_1276)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1310 = -_390;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1314 = -_392;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1318 = -_394;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1322 = _1312 * _1312;
    float _1324 = fma(_1316, _1316, _1322);
    float _1326 = fma(_1320, _1320, _1324);
    float _1328 = sqrt(_1326);
    float _1330 = rsqrt(_1326);
    float _1332 = -_1328;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1336 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1338 = precise::clamp(_1336, 0.0, 1.0);
    float _1340 = _1316 * _1330;
    float _1342 = _1312 * _1330;
    float _1344 = abs(_1338);
    float _1346 = log2(_1344);
    float _1348 = _1320 * _1330;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1352 = _1032 * _1342;
    float _1354 = -_1342;
    float _1356 = -_1350;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1356);
    float _1360 = fma(_1002, _1340, _1352);
    float _1362 = -_1348;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1358);
    float _1366 = fma(_1016, _1348, _1360);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1372 = _1364 + _1370;
    float _1374 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1376 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = exp2(_1374);
    float _1382 = _1380 * _1378;
    float _1384 = _1368 * _1382;
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1386;
    out.m_81.y = _1388;
    out.m_81.z = _1390;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

