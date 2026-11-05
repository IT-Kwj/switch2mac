#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _1585, thread const int& _1586, thread const int& _1587, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _1590 = 1 + _1586;
    float _1592 = support_buffer._m5[_1590].x;
    bool _1594 = _1592 == 1.0;
    if (_1594)
    {
        return _1585;
    }
    bool _1596 = _1592 < 0.0;
    if (_1596)
    {
        float _1598 = -_1592;
        float _1600 = float(_1585);
        float _1602 = _1600 * _1598;
        float _1604 = gl_FragCoord.x;
        float _1606 = gl_FragCoord.y;
        float _1608 = (_1587 != 0) ? _1606 : _1604;
        float _1610 = mod(_1608, _1598);
        float _1612 = _1602 + _1610;
        int _1614 = int(_1612);
        return _1614;
    }
    float _1616 = float(_1585);
    float _1618 = _1616 * _1592;
    int _1620 = int(_1618);
    return _1620;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _777 = float2(_58, _60);
    float2 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_777, float2(0.0), isnan(_777))).xy;
    float _66 = _64.x;
    float _68 = _64.y;
    bool _72 = 0.0 <= (*spvDescriptorSet0.fp_c3)._m0[21].x;
    bool _74 = (*spvDescriptorSet0.fp_c3)._m0[21].x >= 1.0;
    bool _76 = (*spvDescriptorSet0.fp_c3)._m0[21].x >= 2.0;
    bool _78 = (*spvDescriptorSet0.fp_c3)._m0[21].x >= 3.0;
    bool _80 = (*spvDescriptorSet0.fp_c3)._m0[21].x >= 4.0;
    bool _82 = (*spvDescriptorSet0.fp_c3)._m0[21].x >= 5.0;
    float _84 = _56;
    if (!_72)
    {
        _84 = (*spvDescriptorSet0.fp_c3)._m0[14].x;
    }
    float _86 = _84;
    float _88 = 1.0 / _68;
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    bool _92 = !_72;
    float _94 = _90;
    float _96 = _86;
    if (!_92)
    {
        float _98 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _100 = _60 + _98;
        float _102 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _104 = _60 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = _104 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _110 = trunc(_102);
        int _112 = int(_110);
        float _114 = trunc(_106);
        int _116 = int(_114);
        float _118 = trunc(_108);
        int _120 = int(_118);
        int _122 = _112;
        int _124 = 0;
        int _126 = 0;
        int _128 = _38(_122, _124, _126, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _130 = _116;
        int _132 = 0;
        int _134 = 1;
        int _136 = _38(_130, _132, _134, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _138 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_128, _136)), 0).xy;
        float _140 = _138.x;
        float _142 = _138.y;
        int _144 = _112;
        int _146 = 0;
        int _148 = 0;
        int _150 = _38(_144, _146, _148, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _152 = _120;
        int _154 = 0;
        int _156 = 1;
        int _158 = _38(_152, _154, _156, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _160 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_150, _158)), 0).xy;
        float _162 = _160.x;
        float _164 = _160.y;
        float _166 = fma(_142, _88, -1.0);
        float _168 = abs(_166);
        float _170 = -_168;
        float _172 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _174 = precise::clamp(_172, 0.0, 1.0);
        float _176 = fma(_164, _88, -1.0);
        float _178 = _174 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
        float _180 = abs(_176);
        float _182 = -_180;
        float _184 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _186 = precise::clamp(_184, 0.0, 1.0);
        float _188 = fma(_140, _178, _90);
        float _190 = _178 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
        float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
        float _194 = fma(_162, _192, _188);
        float _196 = _190 + _192;
        _94 = _194;
        _96 = _196;
    }
    float _198 = _94;
    float _200 = _96;
    bool _202 = !_74;
    float _204 = _198;
    float _206 = _200;
    if (!_202)
    {
        float _208 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _210 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _60);
        float _212 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _60);
        float _214 = trunc(_208);
        int _216 = int(_214);
        float _218 = _210 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _222 = trunc(_218);
        int _224 = int(_222);
        float _226 = trunc(_220);
        int _228 = int(_226);
        int _230 = _216;
        int _232 = 0;
        int _234 = 0;
        int _236 = _38(_230, _232, _234, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _238 = _224;
        int _240 = 0;
        int _242 = 1;
        int _244 = _38(_238, _240, _242, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _246 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_236, _244)), 0).xy;
        float _248 = _246.x;
        float _250 = _246.y;
        int _252 = _216;
        int _254 = 0;
        int _256 = 0;
        int _258 = _38(_252, _254, _256, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _260 = _228;
        int _262 = 0;
        int _264 = 1;
        int _266 = _38(_260, _262, _264, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _268 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_258, _266)), 0).xy;
        float _270 = _268.x;
        float _272 = _268.y;
        float _274 = fma(_250, _88, -1.0);
        float _276 = abs(_274);
        float _278 = -_276;
        float _280 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _282 = precise::clamp(_280, 0.0, 1.0);
        float _284 = fma(_272, _88, -1.0);
        float _286 = _282 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
        float _288 = abs(_284);
        float _290 = -_288;
        float _292 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_248, _286, _198);
        float _298 = _286 + _200;
        float _300 = _294 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
        float _302 = fma(_270, _300, _296);
        float _304 = _298 + _300;
        _204 = _302;
        _206 = _304;
    }
    float _306 = _204;
    float _308 = _206;
    bool _310 = !_76;
    float _312 = _306;
    float _314 = _308;
    if (!_310)
    {
        float _316 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _318 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -3.0, _60);
        float _320 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 3.0, _60);
        float _322 = trunc(_316);
        int _324 = int(_322);
        float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _328 = _320 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _330 = trunc(_326);
        int _332 = int(_330);
        float _334 = trunc(_328);
        int _336 = int(_334);
        int _338 = _324;
        int _340 = 0;
        int _342 = 0;
        int _344 = _38(_338, _340, _342, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _346 = _332;
        int _348 = 0;
        int _350 = 1;
        int _352 = _38(_346, _348, _350, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _354 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_344, _352)), 0).xy;
        float _356 = _354.x;
        float _358 = _354.y;
        int _360 = _324;
        int _362 = 0;
        int _364 = 0;
        int _366 = _38(_360, _362, _364, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _368 = _336;
        int _370 = 0;
        int _372 = 1;
        int _374 = _38(_368, _370, _372, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _376 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_366, _374)), 0).xy;
        float _378 = _376.x;
        float _380 = _376.y;
        float _382 = fma(_358, _88, -1.0);
        float _384 = abs(_382);
        float _386 = -_384;
        float _388 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _390 = precise::clamp(_388, 0.0, 1.0);
        float _392 = fma(_380, _88, -1.0);
        float _394 = _390 * (*spvDescriptorSet0.fp_c3)._m0[14].w;
        float _396 = abs(_392);
        float _398 = -_396;
        float _400 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _402 = precise::clamp(_400, 0.0, 1.0);
        float _404 = fma(_356, _394, _306);
        float _406 = _394 + _308;
        float _408 = _402 * (*spvDescriptorSet0.fp_c3)._m0[14].w;
        float _410 = fma(_378, _408, _404);
        float _412 = _406 + _408;
        _312 = _410;
        _314 = _412;
    }
    float _414 = _312;
    float _416 = _314;
    bool _418 = !_78;
    float _420 = _414;
    float _422 = _416;
    if (!_418)
    {
        float _424 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _426 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -4.0, _60);
        float _428 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 4.0, _60);
        float _430 = trunc(_424);
        int _432 = int(_430);
        float _434 = _426 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _436 = _428 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _438 = trunc(_434);
        int _440 = int(_438);
        float _442 = trunc(_436);
        int _444 = int(_442);
        int _446 = _432;
        int _448 = 0;
        int _450 = 0;
        int _452 = _38(_446, _448, _450, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _454 = _440;
        int _456 = 0;
        int _458 = 1;
        int _460 = _38(_454, _456, _458, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _462 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_452, _460)), 0).xy;
        float _464 = _462.x;
        float _466 = _462.y;
        int _468 = _432;
        int _470 = 0;
        int _472 = 0;
        int _474 = _38(_468, _470, _472, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _476 = _444;
        int _478 = 0;
        int _480 = 1;
        int _482 = _38(_476, _478, _480, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _484 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_474, _482)), 0).xy;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = fma(_466, _88, -1.0);
        float _492 = abs(_490);
        float _494 = -_492;
        float _496 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _498 = precise::clamp(_496, 0.0, 1.0);
        float _500 = fma(_488, _88, -1.0);
        float _502 = _498 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
        float _504 = abs(_500);
        float _506 = -_504;
        float _508 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = fma(_464, _502, _414);
        float _514 = _502 + _416;
        float _516 = _510 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
        float _518 = fma(_486, _516, _512);
        float _520 = _514 + _516;
        _420 = _518;
        _422 = _520;
    }
    float _522 = _420;
    float _524 = _422;
    bool _526 = !_80;
    float _528 = _522;
    float _530 = _524;
    if (!_526)
    {
        float _532 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _534 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -5.0, _60);
        float _536 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 5.0, _60);
        float _538 = trunc(_532);
        int _540 = int(_538);
        float _542 = _534 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _544 = _536 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _546 = trunc(_542);
        int _548 = int(_546);
        float _550 = trunc(_544);
        int _552 = int(_550);
        int _554 = _540;
        int _556 = 0;
        int _558 = 0;
        int _560 = _38(_554, _556, _558, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _562 = _548;
        int _564 = 0;
        int _566 = 1;
        int _568 = _38(_562, _564, _566, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _570 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_560, _568)), 0).xy;
        float _572 = _570.x;
        float _574 = _570.y;
        int _576 = _540;
        int _578 = 0;
        int _580 = 0;
        int _582 = _38(_576, _578, _580, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _584 = _552;
        int _586 = 0;
        int _588 = 1;
        int _590 = _38(_584, _586, _588, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _592 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_582, _590)), 0).xy;
        float _594 = _592.x;
        float _596 = _592.y;
        float _598 = fma(_574, _88, -1.0);
        float _600 = abs(_598);
        float _602 = -_600;
        float _604 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _606 = precise::clamp(_604, 0.0, 1.0);
        float _608 = fma(_596, _88, -1.0);
        float _610 = _606 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
        float _612 = abs(_608);
        float _614 = -_612;
        float _616 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _618 = precise::clamp(_616, 0.0, 1.0);
        float _620 = fma(_572, _610, _522);
        float _622 = _610 + _524;
        float _624 = _618 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
        float _626 = fma(_594, _624, _620);
        float _628 = _622 + _624;
        _528 = _626;
        _530 = _628;
    }
    float _630 = _528;
    float _632 = _530;
    bool _634 = !_82;
    float _636 = _632;
    float _638 = _630;
    if (!_634)
    {
        float _640 = _58 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _642 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -6.0, _60);
        float _644 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 6.0, _60);
        float _646 = trunc(_640);
        int _648 = int(_646);
        float _650 = _642 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _652 = _644 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _654 = trunc(_650);
        int _656 = int(_654);
        float _658 = trunc(_652);
        int _660 = int(_658);
        int _662 = _648;
        int _664 = 0;
        int _666 = 0;
        int _668 = _38(_662, _664, _666, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _670 = _656;
        int _672 = 0;
        int _674 = 1;
        int _676 = _38(_670, _672, _674, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _678 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_668, _676)), 0).xy;
        float _680 = _678.x;
        float _682 = _678.y;
        int _684 = _648;
        int _686 = 0;
        int _688 = 0;
        int _690 = _38(_684, _686, _688, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        int _692 = _660;
        int _694 = 0;
        int _696 = 1;
        int _698 = _38(_692, _694, _696, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
        float2 _700 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_690, _698)), 0).xy;
        float _702 = _700.x;
        float _704 = _700.y;
        float _706 = fma(_682, _88, -1.0);
        float _708 = abs(_706);
        float _710 = -_708;
        float _712 = fma(_710, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _714 = precise::clamp(_712, 0.0, 1.0);
        float _716 = fma(_704, _88, -1.0);
        float _718 = _714 * (*spvDescriptorSet0.fp_c3)._m0[15].z;
        float _720 = abs(_716);
        float _722 = -_720;
        float _724 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
        float _726 = precise::clamp(_724, 0.0, 1.0);
        float _728 = fma(_680, _718, _630);
        float _730 = _718 + _632;
        float _732 = _726 * (*spvDescriptorSet0.fp_c3)._m0[15].z;
        float _734 = fma(_702, _732, _728);
        float _736 = _730 + _732;
        _636 = _736;
        _638 = _734;
    }
    float _738 = _636;
    float _740 = _638;
    float _742 = 1.0 / _738;
    float _744 = _742 * _740;
    out.m_32.x = _744;
    out.m_32.y = _68;
    return out;
}

