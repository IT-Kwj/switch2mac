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
    texture2d<float> vp_t_tcb_2C [[id(6)]];
    sampler vp_t_tcb_2CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_28 [[id(8)]];
    sampler vp_t_tcb_28Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_2CSmplr_w [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_48.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_51.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1159 = as_type<float>(_110);
        out.gl_Position.z = _1159;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_53.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_51.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _112 = as_type<int>(_142);
    }
    int _144 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1227 = as_type<float>(_144);
        out.gl_Position.z = _1227;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_55.x;
    float _148 = in.m_55.y;
    float _150 = in.m_55.z;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_55.w;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 0.0;
    float _186 = _152;
    if (!_168)
    {
        float _188 = _152 * _152;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _210 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _214 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _216 = !_168;
    float _218 = _198;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _152 * _222;
        float _232 = exp2(_230);
        float _234 = _228 * 0.693147182464599609375;
        float _236 = 1.0 / _234;
        float _238 = 1.0 / _226;
        float _240 = _232 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _236, _152);
        float _246 = _244 * _238;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_168;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _152 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _186 = _272;
    }
    float _274 = _186;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _206 * _214;
    float _284 = fma(_274, _174, _276);
    float _286 = fma(_274, _172, _278);
    float _288 = fma(_274, _176, _280);
    float _290 = _204 * _212;
    float _292 = fma(_284, _170, _180);
    float _294 = fma(_286, _170, _178);
    float _296 = _210 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_288, _170, _182);
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _208 * _296;
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _324 + _320;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _328 + _326;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _340);
    float _350 = fma(_344, _344, _346);
    float _352 = sqrt(_350);
    bool _354 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _358 = _352 + _356;
    float _360 = _316;
    float _362 = _332;
    float _364 = _350;
    float _366 = _302;
    if (_354)
    {
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _360 = _368;
    }
    float _370 = _360;
    if (!_354)
    {
        _362 = _334;
    }
    float _372 = _362;
    float _374 = _372;
    if (_354)
    {
        float _376 = rsqrt(_350);
        _364 = _376;
    }
    float _378 = _364;
    float _380 = _370;
    if (_354)
    {
        float _382 = _358 * _370;
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = _384;
    if (_354)
    {
        float _390 = _384 * 0.15915493667125701904296875;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _396 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _398 = _392;
    if (_354)
    {
        float _400 = _392 * 6.283185482025146484375;
        float _402 = sin(_400);
        _398 = _402;
    }
    float _404 = _398;
    float _406 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _406 + _348;
    float _410 = _408;
    if (_354)
    {
        float _412 = _408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _414;
    if (_354)
    {
        float _418 = fma(_404, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _366 = _418;
    }
    float _420 = _366;
    float _422 = _420;
    if (!_354)
    {
        _416 = _330;
    }
    float _424 = _416;
    float _426 = _424;
    if (_354)
    {
        float _428 = _378 * _420;
        _422 = _428;
    }
    float _430 = _422;
    if (_354)
    {
        float _432 = fma(_344, _430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _374 = _432;
    }
    float _434 = _374;
    if (_354)
    {
        float _436 = fma(_338, _430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _436;
    }
    float _438 = _426;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _442 = _434 + _440;
    float _444 = fma(_434, 6.2500002968590706586837768554688e-05, 0.5);
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _448 = _438 + _446;
    float _450 = fma(_438, 6.2500002968590706586837768554688e-05, 0.5);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1750 = float2(_444, _450);
    float _456 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1750, float2(0.0), isnan(_1750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1750, float2(0.0), isnan(_1750)), level(0.0)).y;
    float2 _1760 = float2(_452, _454);
    float _458 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1760, float2(0.0), isnan(_1760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1760, float2(0.0), isnan(_1760)), level(0.0)).x;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _438 + _460;
    float _464 = fma(_456, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _466 = fma(_458, 100.0, _464);
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _434 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = _474 * _474;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_462, _462, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _462 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _496);
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _492 + _494;
    float _504 = sqrt(_502);
    bool _506 = _504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _508;
    float _512 = _450;
    float _514 = _454;
    float _516 = _510;
    float _518 = _462;
    float _520 = _486;
    if (_506)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _522;
    }
    float _524 = _512;
    if (_506)
    {
        float _526 = rsqrt(_502);
        _514 = _526;
    }
    float _528 = _514;
    float _530 = _528;
    if (_506)
    {
        float _532 = _510 * _524;
        _516 = _532;
    }
    float _534 = _516;
    if (_506)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _518 = _536;
    }
    float _538 = _518;
    float _540 = _470;
    if (_506)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _524;
    float _554 = _550;
    if (_506)
    {
        float _556 = _538 * 6.283185482025146484375;
        float _558 = cos(_556);
        _552 = _558;
    }
    float _560 = _552;
    float _562 = -_486;
    float _564 = -_550;
    float _566 = fma(_474, _562, _564);
    float _568 = _566;
    if (_506)
    {
        float _570 = _566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _570;
    }
    float _572 = _520;
    float _574 = _466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _576 = _572;
    float _578 = _546;
    if (_506)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_506)
    {
        _578 = _488;
    }
    float _586 = _578;
    float _588 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _574);
    float _590 = _586;
    if (_506)
    {
        float _592 = _560 + (-1.0);
        _554 = _592;
    }
    float _594 = _554;
    float _596 = _594;
    if (_506)
    {
        float _598 = _528 * _582;
        _584 = _598;
    }
    float _600 = _584;
    float _602 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _588);
    float _604 = _600;
    if (_506)
    {
        float _606 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _530 = _606;
    }
    float _608 = _530;
    float _610 = _608;
    if (_506)
    {
        float _612 = _488 * _600;
        _590 = _612;
    }
    float _614 = _590;
    if (!_506)
    {
        _596 = _490;
    }
    float _616 = _596;
    float _618 = _616;
    if (_506)
    {
        float _620 = _490 * _600;
        _618 = _620;
    }
    float _622 = _618;
    if (_506)
    {
        float _624 = fma(_566, _560, _608);
        _568 = _624;
    }
    float _626 = _568;
    if (!_506)
    {
        _610 = _492;
    }
    float _628 = _610;
    float _630 = _628;
    if (_506)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    if (!_506)
    {
        _604 = _494;
    }
    float _636 = _604;
    float _638 = _636;
    if (_506)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = _466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _646 = fma(_626, _626, _634);
    float _648 = _466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = _466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _652 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _644);
    float _654 = _646 + _642;
    float _656 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _658 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _650);
    float _660 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _652);
    float _662 = -_500;
    float _664 = _662 + 1.0;
    float _666 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _656);
    float _668 = rsqrt(_654);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _672 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _674 = _666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _676 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _658);
    float _678 = _670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _680 = _674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _682 = abs(_664);
    float _684 = log2(_682);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _678);
    float _688 = _676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _686);
    float _694 = -_680;
    float _696 = fma(_694, _690, 1.0);
    float _698 = _668 * _614;
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _692);
    float _702 = _668 * _626;
    float _704 = _668 * _622;
    float _706 = _698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _708 = log2(_696);
    float _710 = _670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _712 = -_706;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _712);
    float _716 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _718 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _710);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].z, _714);
    float _724 = _670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = 1.0 / _700;
    float _728 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _730 = fma(_722, -0.5, 0.5);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _734 = fma(_722, 0.5, 0.5);
    float _736 = _702 + 1.0;
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _732);
    float _740 = exp2(_716);
    float _742 = fma(_734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _744 = _708 * 0.693147182464599609375;
    float _746 = fma(_734, _742, -0.212114393711090087890625);
    float _748 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _750 = sqrt(_730);
    float _752 = fma(_734, _746, 1.570728778839111328125);
    float _754 = -_702;
    float _756 = fma(_740, _736, _754);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _738);
    float _760 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _728);
    float _762 = _758 * _726;
    float _764 = _760 * _726;
    float _766 = fma(_756, 0.5, 0.5);
    float _768 = _750 * 0.636619746685028076171875;
    float _770 = fma(_762, 0.5, 0.5);
    float _772 = fma(_764, -0.5, 0.5);
    float _774 = -_752;
    float _776 = fma(_768, _774, 1.0);
    float3 _2297 = float3(_770, _772, _748);
    float _778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2297, float3(0.0), isnan(_2297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2297, float3(0.0), isnan(_2297)), level(0.0)).x;
    float3 _2308 = float3(_770, _772, _748);
    float4 _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2308, float3(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2308, float3(0.0), isnan(_2308)), level(0.0)).xyzw;
    float _783 = _781.x;
    float _785 = _781.y;
    float _787 = _781.z;
    float _789 = _781.w;
    float2 _2324 = float2(_776, _766);
    float3 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2324, float2(0.0), isnan(_2324)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(0.0)).xyz;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = in.m_59.x;
    float _803 = in.m_59.y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = in.m_61.y;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _819 = in.m_61.x;
    float _821 = 0.0;
    if (_809)
    {
        float _823 = in.m_59.x;
        _821 = _823;
    }
    float _825 = _821;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = _803 > 0.5;
    float _833 = -_817;
    float _835 = fma(_829, 2.0, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _839 = -_811;
    float _841 = _839 + 1.0;
    float _843 = -_128;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _847 = 0.0;
    float _849 = _811;
    float _851 = _801;
    if (_809)
    {
        _847 = _819;
    }
    float _853 = _847;
    float _855 = _853;
    if (_815)
    {
        float _857 = _831 ? _841 : _811;
        _849 = _857;
    }
    float _859 = _849;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _863 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = _825 > 0.5;
    bool _879 = _877 && _809;
    float _881 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _837);
    if (!_809)
    {
        _851 = _819;
    }
    float _883 = _851;
    float _885 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _887 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _891 = fma(_863, -2.0, _889);
    float _893 = fma(_861, _859, -0.5);
    float _895 = _883;
    if (_879)
    {
        float _897 = -_853;
        float _899 = _897 + 1.0;
        _855 = _899;
    }
    float _901 = _855;
    float _903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _905 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _909 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _891);
    if (_809)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _915 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _907);
    float _917 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _885);
    float _919 = fma(_887, _911, -0.5);
    float _921 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = -_909;
    float _925 = fma(_917, _893, _923);
    float _927 = fma(_903, _919, _845);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _925 + 0.5;
    float _947 = _927 + 0.5;
    float _949 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _951 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _913);
    out.m_63.x = _941;
    out.m_63.y = _937;
    out.m_63.z = _943;
    float _953 = 1.0 / _933;
    float _955 = _670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _947;
    out.m_65.y = _945;
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = exp2(_949);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _969 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _957 + _933;
    float _975 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _979 = _973 * _953;
    float _981 = _979 * 0.5;
    out.m_67.x = _969;
    out.m_67.y = _971;
    out.m_67.z = _975;
    out.m_67.w = _939;
    float _983 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    float _985 = _969;
    if (_875)
    {
        _985 = 1.0;
    }
    float _987 = _985;
    float _989 = _987;
    if (!_875)
    {
        float _991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _993 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _995 = _991 * 0.15915493667125701904296875;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1001 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
        float _1003 = _995 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _995 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = 1.0 / _1005;
        float _1013 = _997 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = _1009 * _1011;
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1015 * _1017;
        float _1025 = 1.0 / _1001;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1027;
        float _1031 = 1.0 / _1023;
        float _1033 = 1.0 / _1029;
        float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1037 = _1025 * _1035;
        float _1039 = _1021 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1043 = fma(_1039, _1037, _1041);
        float _1045 = _1043 * _1033;
        float _1047 = precise::clamp(_1045, 0.0, 1.0);
        float _1049 = -_1047;
        float _1051 = _1049 + 1.0;
        _989 = _1051;
    }
    float _1053 = _989;
    float _1055 = -_961;
    float _1057 = _1055 + 1.0;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1061 = _983 + _1059;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1065 = _1053 > 0.0;
    bool _1067 = isnan(_1053);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1077 = _700 + _1061;
    out.gl_Position.x = _758;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1061;
    out.gl_Position.w = _700;
    float _1079 = _1075 * _778;
    float _1081 = _1077 * 0.5;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = -_1075;
    float _1087 = _1085 + 1.0;
    float _1089 = _789 * _1079;
    float _1091 = _799 * _1079;
    float _1093 = _789 * _1087;
    float _1095 = fma(_795, _1089, _783);
    float _1097 = fma(_797, _1089, _785);
    float _1099 = fma(_789, _1091, _787);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    out.m_71.z = _1081;
    out.m_71.w = _700;
    out.m_51.x = _1083;
    out.m_73.x = _1095;
    out.m_73.y = _1097;
    out.m_73.z = _1099;
    out.m_73.w = _1093;
    if (_1073)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_48.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_51.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1159 = as_type<float>(_110);
        out.gl_Position.z = _1159;
    }
    if (!_96)
    {
        return out;
    }
    float _114 = in.m_53.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_51.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _112 = as_type<int>(_142);
    }
    int _144 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1227 = as_type<float>(_144);
        out.gl_Position.z = _1227;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_55.x;
    float _148 = in.m_55.y;
    float _150 = in.m_55.z;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_55.w;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 0.0;
    float _186 = _152;
    if (!_168)
    {
        float _188 = _152 * _152;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _210 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _214 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _216 = !_168;
    float _218 = _198;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _152 * _222;
        float _232 = exp2(_230);
        float _234 = _228 * 0.693147182464599609375;
        float _236 = 1.0 / _234;
        float _238 = 1.0 / _226;
        float _240 = _232 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _236, _152);
        float _246 = _244 * _238;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_168;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _152 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _186 = _272;
    }
    float _274 = _186;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _206 * _214;
    float _284 = fma(_274, _174, _276);
    float _286 = fma(_274, _172, _278);
    float _288 = fma(_274, _176, _280);
    float _290 = _204 * _212;
    float _292 = fma(_284, _170, _180);
    float _294 = fma(_286, _170, _178);
    float _296 = _210 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_288, _170, _182);
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _208 * _296;
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _324 + _320;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _328 + _326;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _340);
    float _350 = fma(_344, _344, _346);
    float _352 = sqrt(_350);
    bool _354 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _358 = _352 + _356;
    float _360 = _316;
    float _362 = _332;
    float _364 = _350;
    float _366 = _302;
    if (_354)
    {
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _360 = _368;
    }
    float _370 = _360;
    if (!_354)
    {
        _362 = _334;
    }
    float _372 = _362;
    float _374 = _372;
    if (_354)
    {
        float _376 = rsqrt(_350);
        _364 = _376;
    }
    float _378 = _364;
    float _380 = _370;
    if (_354)
    {
        float _382 = _358 * _370;
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = _384;
    if (_354)
    {
        float _390 = _384 * 0.15915493667125701904296875;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _396 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _398 = _392;
    if (_354)
    {
        float _400 = _392 * 6.283185482025146484375;
        float _402 = sin(_400);
        _398 = _402;
    }
    float _404 = _398;
    float _406 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _406 + _348;
    float _410 = _408;
    if (_354)
    {
        float _412 = _408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _414;
    if (_354)
    {
        float _418 = fma(_404, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _366 = _418;
    }
    float _420 = _366;
    float _422 = _420;
    if (!_354)
    {
        _416 = _330;
    }
    float _424 = _416;
    float _426 = _424;
    if (_354)
    {
        float _428 = _378 * _420;
        _422 = _428;
    }
    float _430 = _422;
    if (_354)
    {
        float _432 = fma(_344, _430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _374 = _432;
    }
    float _434 = _374;
    if (_354)
    {
        float _436 = fma(_338, _430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _436;
    }
    float _438 = _426;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _442 = _434 + _440;
    float _444 = fma(_434, 6.2500002968590706586837768554688e-05, 0.5);
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _448 = _438 + _446;
    float _450 = fma(_438, 6.2500002968590706586837768554688e-05, 0.5);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1750 = float2(_444, _450);
    float _456 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1750, float2(0.0), isnan(_1750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1750, float2(0.0), isnan(_1750)), level(0.0)).y;
    float2 _1760 = float2(_452, _454);
    float _458 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1760, float2(0.0), isnan(_1760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1760, float2(0.0), isnan(_1760)), level(0.0)).x;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _438 + _460;
    float _464 = fma(_456, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _466 = fma(_458, 100.0, _464);
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _434 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = _474 * _474;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_462, _462, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _462 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _496);
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _492 + _494;
    float _504 = sqrt(_502);
    bool _506 = _504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _508;
    float _512 = _450;
    float _514 = _454;
    float _516 = _510;
    float _518 = _462;
    float _520 = _486;
    if (_506)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _522;
    }
    float _524 = _512;
    if (_506)
    {
        float _526 = rsqrt(_502);
        _514 = _526;
    }
    float _528 = _514;
    float _530 = _528;
    if (_506)
    {
        float _532 = _510 * _524;
        _516 = _532;
    }
    float _534 = _516;
    if (_506)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _518 = _536;
    }
    float _538 = _518;
    float _540 = _470;
    if (_506)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _524;
    float _554 = _550;
    if (_506)
    {
        float _556 = _538 * 6.283185482025146484375;
        float _558 = cos(_556);
        _552 = _558;
    }
    float _560 = _552;
    float _562 = -_486;
    float _564 = -_550;
    float _566 = fma(_474, _562, _564);
    float _568 = _566;
    if (_506)
    {
        float _570 = _566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _570;
    }
    float _572 = _520;
    float _574 = _466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _576 = _572;
    float _578 = _546;
    if (_506)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_506)
    {
        _578 = _488;
    }
    float _586 = _578;
    float _588 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _574);
    float _590 = _586;
    if (_506)
    {
        float _592 = _560 + (-1.0);
        _554 = _592;
    }
    float _594 = _554;
    float _596 = _594;
    if (_506)
    {
        float _598 = _528 * _582;
        _584 = _598;
    }
    float _600 = _584;
    float _602 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _588);
    float _604 = _600;
    if (_506)
    {
        float _606 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _530 = _606;
    }
    float _608 = _530;
    float _610 = _608;
    if (_506)
    {
        float _612 = _488 * _600;
        _590 = _612;
    }
    float _614 = _590;
    if (!_506)
    {
        _596 = _490;
    }
    float _616 = _596;
    float _618 = _616;
    if (_506)
    {
        float _620 = _490 * _600;
        _618 = _620;
    }
    float _622 = _618;
    if (_506)
    {
        float _624 = fma(_566, _560, _608);
        _568 = _624;
    }
    float _626 = _568;
    if (!_506)
    {
        _610 = _492;
    }
    float _628 = _610;
    float _630 = _628;
    if (_506)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    if (!_506)
    {
        _604 = _494;
    }
    float _636 = _604;
    float _638 = _636;
    if (_506)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = _466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _646 = fma(_626, _626, _634);
    float _648 = _466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = _466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _652 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _644);
    float _654 = _646 + _642;
    float _656 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _658 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _650);
    float _660 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _652);
    float _662 = -_500;
    float _664 = _662 + 1.0;
    float _666 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _656);
    float _668 = rsqrt(_654);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _672 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _674 = _666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _676 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _658);
    float _678 = _670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _680 = _674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _682 = abs(_664);
    float _684 = log2(_682);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _678);
    float _688 = _676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _686);
    float _694 = -_680;
    float _696 = fma(_694, _690, 1.0);
    float _698 = _668 * _614;
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _692);
    float _702 = _668 * _626;
    float _704 = _668 * _622;
    float _706 = _698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _708 = log2(_696);
    float _710 = _670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _712 = -_706;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _712);
    float _716 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _718 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _710);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].z, _714);
    float _724 = _670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = 1.0 / _700;
    float _728 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _730 = fma(_722, -0.5, 0.5);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _734 = fma(_722, 0.5, 0.5);
    float _736 = _702 + 1.0;
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _732);
    float _740 = exp2(_716);
    float _742 = fma(_734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _744 = _708 * 0.693147182464599609375;
    float _746 = fma(_734, _742, -0.212114393711090087890625);
    float _748 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _750 = sqrt(_730);
    float _752 = fma(_734, _746, 1.570728778839111328125);
    float _754 = -_702;
    float _756 = fma(_740, _736, _754);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _738);
    float _760 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _728);
    float _762 = _758 * _726;
    float _764 = _760 * _726;
    float _766 = fma(_756, 0.5, 0.5);
    float _768 = _750 * 0.636619746685028076171875;
    float _770 = fma(_762, 0.5, 0.5);
    float _772 = fma(_764, -0.5, 0.5);
    float _774 = -_752;
    float _776 = fma(_768, _774, 1.0);
    float3 _2297 = float3(_770, _772, _748);
    float _778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2297, float3(0.0), isnan(_2297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2297, float3(0.0), isnan(_2297)), level(0.0)).x;
    float3 _2308 = float3(_770, _772, _748);
    float4 _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2308, float3(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2308, float3(0.0), isnan(_2308)), level(0.0)).xyzw;
    float _783 = _781.x;
    float _785 = _781.y;
    float _787 = _781.z;
    float _789 = _781.w;
    float2 _2324 = float2(_776, _766);
    float3 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2324, float2(0.0), isnan(_2324)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(0.0)).xyz;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = in.m_59.x;
    float _803 = in.m_59.y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = in.m_61.y;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _819 = in.m_61.x;
    float _821 = 0.0;
    if (_809)
    {
        float _823 = in.m_59.x;
        _821 = _823;
    }
    float _825 = _821;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = _803 > 0.5;
    float _833 = -_817;
    float _835 = fma(_829, 2.0, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _839 = -_811;
    float _841 = _839 + 1.0;
    float _843 = -_128;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _847 = 0.0;
    float _849 = _811;
    float _851 = _801;
    if (_809)
    {
        _847 = _819;
    }
    float _853 = _847;
    float _855 = _853;
    if (_815)
    {
        float _857 = _831 ? _841 : _811;
        _849 = _857;
    }
    float _859 = _849;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _863 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = _825 > 0.5;
    bool _879 = _877 && _809;
    float _881 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _837);
    if (!_809)
    {
        _851 = _819;
    }
    float _883 = _851;
    float _885 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _887 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _891 = fma(_863, -2.0, _889);
    float _893 = fma(_861, _859, -0.5);
    float _895 = _883;
    if (_879)
    {
        float _897 = -_853;
        float _899 = _897 + 1.0;
        _855 = _899;
    }
    float _901 = _855;
    float _903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _905 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _909 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _891);
    if (_809)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _915 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _907);
    float _917 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _885);
    float _919 = fma(_887, _911, -0.5);
    float _921 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = -_909;
    float _925 = fma(_917, _893, _923);
    float _927 = fma(_903, _919, _845);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _925 + 0.5;
    float _947 = _927 + 0.5;
    float _949 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _951 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _913);
    out.m_63.x = _941;
    out.m_63.y = _937;
    out.m_63.z = _943;
    float _953 = 1.0 / _933;
    float _955 = _670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _947;
    out.m_65.y = _945;
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = exp2(_949);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _969 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _957 + _933;
    float _975 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _979 = _973 * _953;
    float _981 = _979 * 0.5;
    out.m_67.x = _969;
    out.m_67.y = _971;
    out.m_67.z = _975;
    out.m_67.w = _939;
    float _983 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    float _985 = _969;
    if (_875)
    {
        _985 = 1.0;
    }
    float _987 = _985;
    float _989 = _987;
    if (!_875)
    {
        float _991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _993 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _995 = _991 * 0.15915493667125701904296875;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1001 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
        float _1003 = _995 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _995 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = 1.0 / _1005;
        float _1013 = _997 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = _1009 * _1011;
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1015 * _1017;
        float _1025 = 1.0 / _1001;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1027;
        float _1031 = 1.0 / _1023;
        float _1033 = 1.0 / _1029;
        float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1037 = _1025 * _1035;
        float _1039 = _1021 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1043 = fma(_1039, _1037, _1041);
        float _1045 = _1043 * _1033;
        float _1047 = precise::clamp(_1045, 0.0, 1.0);
        float _1049 = -_1047;
        float _1051 = _1049 + 1.0;
        _989 = _1051;
    }
    float _1053 = _989;
    float _1055 = -_961;
    float _1057 = _1055 + 1.0;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1061 = _983 + _1059;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1065 = _1053 > 0.0;
    bool _1067 = isnan(_1053);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1077 = _700 + _1061;
    out.gl_Position.x = _758;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1061;
    out.gl_Position.w = _700;
    float _1079 = _1075 * _778;
    float _1081 = _1077 * 0.5;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = -_1075;
    float _1087 = _1085 + 1.0;
    float _1089 = _789 * _1079;
    float _1091 = _799 * _1079;
    float _1093 = _789 * _1087;
    float _1095 = fma(_795, _1089, _783);
    float _1097 = fma(_797, _1089, _785);
    float _1099 = fma(_789, _1091, _787);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    out.m_71.z = _1081;
    out.m_71.w = _700;
    out.m_51.x = _1083;
    out.m_73.x = _1095;
    out.m_73.y = _1097;
    out.m_73.z = _1099;
    out.m_73.w = _1093;
    if (_1073)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_48.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_51.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1159 = as_type<float>(_110);
        out.gl_Position.z = _1159;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_53.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_92);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_51.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _112 = as_type<int>(_142);
    }
    int _144 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1227 = as_type<float>(_144);
        out.gl_Position.z = _1227;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_55.x;
    float _148 = in.m_55.y;
    float _150 = in.m_55.z;
    float _152 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _154 = in.m_57.x;
    float _156 = in.m_57.y;
    float _158 = in.m_57.z;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_55.w;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 0.0;
    float _186 = _152;
    if (!_168)
    {
        float _188 = _152 * _152;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_168)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _210 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _214 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _216 = !_168;
    float _218 = _198;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _152 * _222;
        float _232 = exp2(_230);
        float _234 = _228 * 0.693147182464599609375;
        float _236 = 1.0 / _234;
        float _238 = 1.0 / _226;
        float _240 = _232 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _236, _152);
        float _246 = _244 * _238;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_168;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _152 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _186 = _272;
    }
    float _274 = _186;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _206 * _214;
    float _284 = fma(_274, _174, _276);
    float _286 = fma(_274, _172, _278);
    float _288 = fma(_274, _176, _280);
    float _290 = _204 * _212;
    float _292 = fma(_284, _170, _180);
    float _294 = fma(_286, _170, _178);
    float _296 = _210 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_288, _170, _182);
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _208 * _296;
    float _312 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _324 + _320;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _328 + _326;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[9].z, _340);
    float _350 = fma(_344, _344, _346);
    float _352 = sqrt(_350);
    bool _354 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _358 = _352 + _356;
    float _360 = _316;
    float _362 = _332;
    float _364 = _350;
    float _366 = _302;
    if (_354)
    {
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _360 = _368;
    }
    float _370 = _360;
    if (!_354)
    {
        _362 = _334;
    }
    float _372 = _362;
    float _374 = _372;
    if (_354)
    {
        float _376 = rsqrt(_350);
        _364 = _376;
    }
    float _378 = _364;
    float _380 = _370;
    if (_354)
    {
        float _382 = _358 * _370;
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = _384;
    if (_354)
    {
        float _390 = _384 * 0.15915493667125701904296875;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _396 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _398 = _392;
    if (_354)
    {
        float _400 = _392 * 6.283185482025146484375;
        float _402 = sin(_400);
        _398 = _402;
    }
    float _404 = _398;
    float _406 = _396 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _406 + _348;
    float _410 = _408;
    if (_354)
    {
        float _412 = _408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _414;
    if (_354)
    {
        float _418 = fma(_404, _414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _366 = _418;
    }
    float _420 = _366;
    float _422 = _420;
    if (!_354)
    {
        _416 = _330;
    }
    float _424 = _416;
    float _426 = _424;
    if (_354)
    {
        float _428 = _378 * _420;
        _422 = _428;
    }
    float _430 = _422;
    if (_354)
    {
        float _432 = fma(_344, _430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _374 = _432;
    }
    float _434 = _374;
    if (_354)
    {
        float _436 = fma(_338, _430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _436;
    }
    float _438 = _426;
    float _440 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _442 = _434 + _440;
    float _444 = fma(_434, 6.2500002968590706586837768554688e-05, 0.5);
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _448 = _438 + _446;
    float _450 = fma(_438, 6.2500002968590706586837768554688e-05, 0.5);
    float _452 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _454 = fma(_448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _1750 = float2(_444, _450);
    float _456 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_1750, float2(0.0), isnan(_1750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_1750, float2(0.0), isnan(_1750)), level(0.0)).y;
    float2 _1760 = float2(_452, _454);
    float _458 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_1760, float2(0.0), isnan(_1760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_1760, float2(0.0), isnan(_1760)), level(0.0)).x;
    float _460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _462 = _438 + _460;
    float _464 = fma(_456, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _466 = fma(_458, 100.0, _464);
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _434 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _474 = _466 + _472;
    float _476 = _474 * _474;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_462, _462, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _462 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _496);
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _492 + _494;
    float _504 = sqrt(_502);
    bool _506 = _504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _510 = _504 + _508;
    float _512 = _450;
    float _514 = _454;
    float _516 = _510;
    float _518 = _462;
    float _520 = _486;
    if (_506)
    {
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _522;
    }
    float _524 = _512;
    if (_506)
    {
        float _526 = rsqrt(_502);
        _514 = _526;
    }
    float _528 = _514;
    float _530 = _528;
    if (_506)
    {
        float _532 = _510 * _524;
        _516 = _532;
    }
    float _534 = _516;
    if (_506)
    {
        float _536 = _534 * 0.15915493667125701904296875;
        _518 = _536;
    }
    float _538 = _518;
    float _540 = _470;
    if (_506)
    {
        float _542 = _538 * 6.283185482025146484375;
        float _544 = sin(_542);
        _540 = _544;
    }
    float _546 = _540;
    float _548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _550 = precise::max(0.0, _548);
    float _552 = _524;
    float _554 = _550;
    if (_506)
    {
        float _556 = _538 * 6.283185482025146484375;
        float _558 = cos(_556);
        _552 = _558;
    }
    float _560 = _552;
    float _562 = -_486;
    float _564 = -_550;
    float _566 = fma(_474, _562, _564);
    float _568 = _566;
    if (_506)
    {
        float _570 = _566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _520 = _570;
    }
    float _572 = _520;
    float _574 = _466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _576 = _572;
    float _578 = _546;
    if (_506)
    {
        float _580 = fma(_546, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (!_506)
    {
        _578 = _488;
    }
    float _586 = _578;
    float _588 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _574);
    float _590 = _586;
    if (_506)
    {
        float _592 = _560 + (-1.0);
        _554 = _592;
    }
    float _594 = _554;
    float _596 = _594;
    if (_506)
    {
        float _598 = _528 * _582;
        _584 = _598;
    }
    float _600 = _584;
    float _602 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _588);
    float _604 = _600;
    if (_506)
    {
        float _606 = _594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _530 = _606;
    }
    float _608 = _530;
    float _610 = _608;
    if (_506)
    {
        float _612 = _488 * _600;
        _590 = _612;
    }
    float _614 = _590;
    if (!_506)
    {
        _596 = _490;
    }
    float _616 = _596;
    float _618 = _616;
    if (_506)
    {
        float _620 = _490 * _600;
        _618 = _620;
    }
    float _622 = _618;
    if (_506)
    {
        float _624 = fma(_566, _560, _608);
        _568 = _624;
    }
    float _626 = _568;
    if (!_506)
    {
        _610 = _492;
    }
    float _628 = _610;
    float _630 = _628;
    if (_506)
    {
        float _632 = _614 * _614;
        _630 = _632;
    }
    float _634 = _630;
    if (!_506)
    {
        _604 = _494;
    }
    float _636 = _604;
    float _638 = _636;
    if (_506)
    {
        float _640 = _622 * _622;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = _466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _646 = fma(_626, _626, _634);
    float _648 = _466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _650 = _466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _652 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _644);
    float _654 = _646 + _642;
    float _656 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[2].x, _648);
    float _658 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[3].x, _650);
    float _660 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _652);
    float _662 = -_500;
    float _664 = _662 + 1.0;
    float _666 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _656);
    float _668 = rsqrt(_654);
    float _670 = _660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _672 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _674 = _666 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _676 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _658);
    float _678 = _670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _680 = _674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _682 = abs(_664);
    float _684 = log2(_682);
    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _678);
    float _688 = _676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _686);
    float _694 = -_680;
    float _696 = fma(_694, _690, 1.0);
    float _698 = _668 * _614;
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _692);
    float _702 = _668 * _626;
    float _704 = _668 * _622;
    float _706 = _698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _708 = log2(_696);
    float _710 = _670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _712 = -_706;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _712);
    float _716 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _718 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _710);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].z, _714);
    float _724 = _670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _726 = 1.0 / _700;
    float _728 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _718);
    float _730 = fma(_722, -0.5, 0.5);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _724);
    float _734 = fma(_722, 0.5, 0.5);
    float _736 = _702 + 1.0;
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _732);
    float _740 = exp2(_716);
    float _742 = fma(_734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _744 = _708 * 0.693147182464599609375;
    float _746 = fma(_734, _742, -0.212114393711090087890625);
    float _748 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _750 = sqrt(_730);
    float _752 = fma(_734, _746, 1.570728778839111328125);
    float _754 = -_702;
    float _756 = fma(_740, _736, _754);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _738);
    float _760 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _728);
    float _762 = _758 * _726;
    float _764 = _760 * _726;
    float _766 = fma(_756, 0.5, 0.5);
    float _768 = _750 * 0.636619746685028076171875;
    float _770 = fma(_762, 0.5, 0.5);
    float _772 = fma(_764, -0.5, 0.5);
    float _774 = -_752;
    float _776 = fma(_768, _774, 1.0);
    float3 _2297 = float3(_770, _772, _748);
    float _778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2297, float3(0.0), isnan(_2297)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2297, float3(0.0), isnan(_2297)), level(0.0)).x;
    float3 _2308 = float3(_770, _772, _748);
    float4 _781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2308, float3(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2308, float3(0.0), isnan(_2308)), level(0.0)).xyzw;
    float _783 = _781.x;
    float _785 = _781.y;
    float _787 = _781.z;
    float _789 = _781.w;
    float2 _2324 = float2(_776, _766);
    float3 _793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2324, float2(0.0), isnan(_2324)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(0.0)).xyz;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float _801 = in.m_59.x;
    float _803 = in.m_59.y;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _809 = _807 != 0;
    float _811 = in.m_61.y;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _815 = _813 != 0;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _819 = in.m_61.x;
    float _821 = 0.0;
    if (_809)
    {
        float _823 = in.m_59.x;
        _821 = _823;
    }
    float _825 = _821;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = _803 > 0.5;
    float _833 = -_817;
    float _835 = fma(_829, 2.0, _833);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _839 = -_811;
    float _841 = _839 + 1.0;
    float _843 = -_128;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _847 = 0.0;
    float _849 = _811;
    float _851 = _801;
    if (_809)
    {
        _847 = _819;
    }
    float _853 = _847;
    float _855 = _853;
    if (_815)
    {
        float _857 = _831 ? _841 : _811;
        _849 = _857;
    }
    float _859 = _849;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _863 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _867 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _875 = _871 || _873;
    bool _877 = _825 > 0.5;
    bool _879 = _877 && _809;
    float _881 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].z, _837);
    if (!_809)
    {
        _851 = _819;
    }
    float _883 = _851;
    float _885 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _887 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _891 = fma(_863, -2.0, _889);
    float _893 = fma(_861, _859, -0.5);
    float _895 = _883;
    if (_879)
    {
        float _897 = -_853;
        float _899 = _897 + 1.0;
        _855 = _899;
    }
    float _901 = _855;
    float _903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _905 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _909 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _891);
    if (_809)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _915 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _907);
    float _917 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _885);
    float _919 = fma(_887, _911, -0.5);
    float _921 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _915);
    float _923 = -_909;
    float _925 = fma(_917, _893, _923);
    float _927 = fma(_903, _919, _845);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _933 = _921 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _937 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _941 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _943 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _925 + 0.5;
    float _947 = _927 + 0.5;
    float _949 = _684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _951 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _913);
    out.m_63.x = _941;
    out.m_63.y = _937;
    out.m_63.z = _943;
    float _953 = 1.0 / _933;
    float _955 = _670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _947;
    out.m_65.y = _945;
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = exp2(_949);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _969 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _971 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _973 = _957 + _933;
    float _975 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _977 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _979 = _973 * _953;
    float _981 = _979 * 0.5;
    out.m_67.x = _969;
    out.m_67.y = _971;
    out.m_67.z = _975;
    out.m_67.w = _939;
    float _983 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    float _985 = _969;
    if (_875)
    {
        _985 = 1.0;
    }
    float _987 = _985;
    float _989 = _987;
    if (!_875)
    {
        float _991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _993 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _995 = _991 * 0.15915493667125701904296875;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1001 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[30].w, _999);
        float _1003 = _995 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _995 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = 1.0 / _1005;
        float _1013 = _997 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = _1009 * _1011;
        float _1019 = _997 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _1015 * _1017;
        float _1025 = 1.0 / _1001;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1027;
        float _1031 = 1.0 / _1023;
        float _1033 = 1.0 / _1029;
        float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1037 = _1025 * _1035;
        float _1039 = _1021 * _1031;
        float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1043 = fma(_1039, _1037, _1041);
        float _1045 = _1043 * _1033;
        float _1047 = precise::clamp(_1045, 0.0, 1.0);
        float _1049 = -_1047;
        float _1051 = _1049 + 1.0;
        _989 = _1051;
    }
    float _1053 = _989;
    float _1055 = -_961;
    float _1057 = _1055 + 1.0;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1061 = _983 + _1059;
    float _1063 = _1053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1065 = _1053 > 0.0;
    bool _1067 = isnan(_1053);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan(0.0);
    bool _1073 = _1069 || _1071;
    float _1075 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1077 = _700 + _1061;
    out.gl_Position.x = _758;
    out.gl_Position.y = _760;
    out.gl_Position.z = _1061;
    out.gl_Position.w = _700;
    float _1079 = _1075 * _778;
    float _1081 = _1077 * 0.5;
    float _1083 = _1063 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1085 = -_1075;
    float _1087 = _1085 + 1.0;
    float _1089 = _789 * _1079;
    float _1091 = _799 * _1079;
    float _1093 = _789 * _1087;
    float _1095 = fma(_795, _1089, _783);
    float _1097 = fma(_797, _1089, _785);
    float _1099 = fma(_789, _1091, _787);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    out.m_71.z = _1081;
    out.m_71.w = _700;
    out.m_51.x = _1083;
    out.m_73.x = _1095;
    out.m_73.y = _1097;
    out.m_73.z = _1099;
    out.m_73.w = _1093;
    if (_1073)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1101;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

