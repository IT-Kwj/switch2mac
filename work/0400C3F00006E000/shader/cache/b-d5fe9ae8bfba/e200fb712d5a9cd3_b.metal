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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texturecube_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _76 * _68;
    float _82 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _82 * 0.15915493667125701904296875;
    float _88 = _76 * _74;
    float _90 = _86 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_84, _92, _80);
    float _96 = fma(_84, _92, _88);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _888 = float2(_96, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_888, float2(0.0), isnan(_888))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _905 = float2(_100, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_905, float2(0.0), isnan(_905))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_905, float2(0.0), isnan(_905))).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _108 * _108;
    float _122 = fma(_106, _106, _120);
    float _124 = fma(_110, _110, _122);
    float _126 = rsqrt(_124);
    float _128 = _108 * _126;
    float _130 = _106 * _126;
    float _132 = _110 * _126;
    float _134 = _128 * _128;
    float _136 = fma(_130, _130, _134);
    float _138 = sqrt(_136);
    bool _142 = _138 >= 0.00999999977648258209228515625;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan(0.00999999977648258209228515625);
    bool _150 = _146 || _148;
    float _152 = 0.0;
    float _154 = _126;
    float _156 = _134;
    float _158 = _138;
    if (!_150)
    {
        float _160 = fma(_132, _132, _134);
        _152 = _160;
    }
    float _162 = _152;
    float _164 = _130 * _116;
    float _166 = _128 * _116;
    if (!_150)
    {
        _154 = 0.0;
    }
    float _168 = _154;
    float _170 = _96;
    float _172 = _168;
    if (!_150)
    {
        float _174 = rsqrt(_162);
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (!_150)
    {
        float _180 = _132 * _176;
        _156 = _180;
    }
    float _182 = _156;
    float _184 = _182;
    if (!_150)
    {
        float _186 = _128 * _176;
        _178 = _186;
    }
    float _188 = _178;
    float _190 = 0.0;
    float _192 = _188;
    if (!_150)
    {
        float _194 = _132 * _182;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = 0.0;
    float _200 = _196;
    if (!_150)
    {
        float _202 = fma(_130, _188, -0.0);
        _198 = _202;
    }
    float _204 = _198;
    float _206 = _204;
    if (!_150)
    {
        float _208 = _130 * _182;
        _158 = _208;
    }
    float _210 = _158;
    float _212 = _210;
    if (!_150)
    {
        float _214 = -_188;
        float _216 = -_196;
        float _218 = fma(_128, _214, _216);
        _200 = _218;
    }
    float _220 = _200;
    float _222 = _220;
    if (!_150)
    {
        float _224 = -_188;
        float _226 = (-0.0) + _224;
        _192 = _226;
    }
    float _228 = _192;
    bool _230 = !_150;
    float _232 = _228;
    if (!_230)
    {
        float _234 = rsqrt(_136);
        float _236 = _128 * _234;
        float _238 = -_234;
        float _240 = _130 * _238;
        float _242 = _132 * _236;
        float _244 = _130 * _240;
        float _246 = _132 * _240;
        float _248 = _242 * _242;
        float _250 = -_244;
        float _252 = fma(_128, _236, _250);
        float _254 = fma(_246, _246, _248);
        float _256 = fma(_252, _252, _254);
        float _258 = rsqrt(_256);
        float _260 = _246 * _258;
        float _262 = _252 * _258;
        float _264 = -_242;
        float _266 = fma(_264, _258, -0.0);
        _206 = _240;
        _222 = _236;
        _184 = _266;
        _172 = _260;
        _212 = 0.0;
        _232 = _262;
    }
    float _268 = _206;
    float _270 = _222;
    float _272 = _184;
    float _274 = _172;
    float _276 = _212;
    float _278 = _232;
    float _280 = fma(_114, _268, _166);
    float _282 = fma(_114, _270, _164);
    float _284 = _132 * _116;
    float _286 = in.m_44.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_118, _272, _280);
    float _294 = fma(_118, _274, _282);
    float _296 = fma(_114, _276, _284);
    float _298 = in.m_44.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _292 * _292;
    float _306 = in.m_46.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = fma(_118, _278, _296);
    float _314 = in.m_46.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = fma(_294, _294, _304);
    float _322 = in.m_46.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_312, _312, _320);
    float _330 = rsqrt(_328);
    float _332 = _76 * _290;
    float _334 = -_128;
    float _336 = fma(_292, _330, _334);
    float _338 = -_130;
    float _340 = fma(_294, _330, _338);
    float _342 = _76 * _302;
    float _344 = _332 * _332;
    float _346 = fma(_336, (*spvDescriptorSet0.fp_c4)._m0[0].z, _128);
    float _348 = fma(_340, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _350 = -_132;
    float _352 = fma(_312, _330, _350);
    float _354 = fma(_342, _342, _344);
    float _356 = _346 * _346;
    float _358 = _76 * _310;
    float _360 = fma(_352, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _362 = _76 * _318;
    float _364 = fma(_348, _348, _356);
    float _366 = sqrt(_354);
    float _368 = _76 * _326;
    float _370 = fma(_360, _360, _364);
    float _372 = 1.0 / _358;
    float _374 = rsqrt(_370);
    float _376 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _378 = fma(_366, (*spvDescriptorSet0.fp_c4)._m0[1].x, _376);
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = _362 * _372;
    float _384 = _368 * _372;
    float _386 = fma(_382, 0.5, 0.5);
    float _388 = fma(_384, -0.5, 0.5);
    float _390 = _348 * _374;
    float _392 = _360 * _374;
    float _394 = -_390;
    float _396 = fma(_380, _394, _390);
    float _398 = -_392;
    float _400 = fma(_380, _398, _392);
    float _402 = fma(_396, 0.0199999995529651641845703125, _386);
    float _404 = fma(_400, 0.0199999995529651641845703125, _388);
    float2 _1335 = float2(_402, _404);
    float _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1335, float2(0.0), isnan(_1335))).x;
    float _408 = in.m_44.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = -_342;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _418 = -_332;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _422 = _384 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _424 = _384 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _426 = _384 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _428 = _384 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _430 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[7].x, _422);
    float _432 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[5].x, _424);
    float _434 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[4].x, _426);
    float _436 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[6].x, _428);
    float _438 = _76 * _412;
    float _440 = -_438;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _444 = _442 * _442;
    float _446 = fma(_416, _416, _444);
    float _448 = fma(_420, _420, _446);
    float _450 = rsqrt(_448);
    float _452 = _442 * _450;
    float _454 = _416 * _450;
    float _456 = _420 * _450;
    float _458 = fma(_406, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _430);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
    float _464 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _434);
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _436);
    float _468 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _470 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _472 = _464 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _474 = 1.0 / _468;
    float _476 = -_438;
    float _478 = fma(_470, _474, _476);
    float _480 = -_342;
    float _482 = fma(_472, _474, _480);
    float _484 = _466 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _486 = _452 * _478;
    float _488 = -_332;
    float _490 = fma(_484, _474, _488);
    float _492 = fma(_454, _482, _486);
    float _494 = fma(_456, _490, _492);
    bool _496 = _494 > 0.0;
    float _498 = _388;
    float _500 = _494;
    float _502 = _486;
    if (_496)
    {
        float2 _1512 = float2(_386, _388);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1512, float2(0.0), isnan(_1512))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1512, float2(0.0), isnan(_1512))).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        _498 = _506;
        _500 = _508;
        _502 = _510;
    }
    float _512 = _498;
    float _514 = _500;
    float _516 = _502;
    float _518 = _346 * _374;
    float _520 = -_518;
    float _522 = _520 + 1.0;
    float _524 = fma(_380, _522, _518);
    float _526 = -_452;
    float _528 = _524 * _526;
    float _530 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _532 = -_454;
    float _534 = fma(_396, _532, _528);
    float _536 = -_456;
    float _538 = fma(_400, _536, _534);
    float _540 = _538 + _538;
    float _542 = -_540;
    float _544 = -_452;
    float _546 = fma(_524, _542, _544);
    float _548 = -_540;
    float _550 = -_454;
    float _552 = fma(_396, _548, _550);
    float _554 = -_540;
    float _556 = -_456;
    float _558 = fma(_400, _554, _556);
    float _560 = abs(_552);
    float _562 = abs(_546);
    float _564 = precise::max(_560, _562);
    float _566 = abs(_558);
    float _568 = precise::max(_566, _564);
    float _570 = 1.0 / _568;
    float _572 = _558 * _570;
    float _574 = _552 * _570;
    float _576 = _546 * _570;
    float4 _1618 = float4(_574, _576, _572, float(0));
    float4 _1622 = select(_1618, float4(0.0), isnan(_1618));
    float3 _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1622.xyz, uint(rint(_1622.w)), level(_530)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1622.xyz, uint(rint(_1622.w)), level(_530)).xyz;
    float _580 = _578.x;
    float _582 = _578.y;
    float _584 = _578.z;
    float _586 = _512;
    float _588 = _514;
    float _590 = _516;
    if (!_496)
    {
        float2 _1641 = float2(_402, _404);
        float3 _592 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1641, float2(0.0), isnan(_1641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1641, float2(0.0), isnan(_1641))).xyz;
        float _594 = _592.x;
        float _596 = _592.y;
        float _598 = _592.z;
        _586 = _594;
        _588 = _596;
        _590 = _598;
    }
    float _600 = _586;
    float _602 = _588;
    float _604 = _590;
    float _606 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _608 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _610 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _608);
    float _612 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _610);
    float _614 = rsqrt(_612);
    float _616 = _614 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _618 = _614 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _620 = -_616;
    float _622 = _452 + _620;
    float _624 = _614 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _626 = -_618;
    float _628 = _454 + _626;
    float _630 = -_616;
    float _632 = _524 * _630;
    float _634 = _622 * _622;
    float _636 = -_624;
    float _638 = _456 + _636;
    float _640 = -_618;
    float _642 = fma(_396, _640, _632);
    float _644 = fma(_628, _628, _634);
    float _646 = -_624;
    float _648 = fma(_400, _646, _642);
    float _650 = fma(_638, _638, _644);
    float _652 = rsqrt(_650);
    float _654 = _622 * _652;
    float _656 = _628 * _652;
    float _658 = _638 * _652;
    float _660 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _662 = _524 * _654;
    float _664 = _524 * _452;
    float _666 = precise::max(_648, 9.9999999392252902907785028219223e-09);
    float _668 = 0.0 + _648;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = fma(_396, _656, _662);
    float _674 = _606 * _606;
    float _676 = _674 * 0.5;
    float _678 = fma(_660, _660, -1.0);
    float _680 = fma(_396, _454, _664);
    float _682 = fma(_400, _658, _672);
    float _684 = -_676;
    float _686 = _684 + 1.0;
    float _688 = fma(_400, _456, _680);
    float _690 = precise::max(_682, 9.9999999392252902907785028219223e-09);
    float _692 = fma(_666, _686, _676);
    float _694 = precise::max(_688, 9.9999999392252902907785028219223e-09);
    float _696 = _690 * _690;
    float _698 = 1.0 / _692;
    float _700 = fma(_694, _686, _676);
    float _702 = fma(_696, _678, 1.0);
    float _704 = precise::max(_702, 9.9999999392252902907785028219223e-09);
    float _706 = 1.0 / _700;
    float _708 = fma(_694, -5.554729938507080078125, -6.9831600189208984375);
    float _710 = 1.0 / _704;
    float _712 = _694 * _708;
    float _714 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _716 = 1.0 + _714;
    float _718 = exp2(_712);
    float _720 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _722 = fma(_78, (*spvDescriptorSet0.fp_c4)._m0[1].z, _720);
    float _724 = _660 * _710;
    float _726 = _698 * _706;
    float _728 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _730 = 1.0 + _728;
    float _732 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _734 = 1.0 + _732;
    float _736 = _724 * _724;
    float _738 = _736 * 0.3183098733425140380859375;
    float _740 = fma(_730, _718, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _742 = fma(_716, _718, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _744 = fma(_734, _718, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _746 = _738 * _726;
    float _748 = _746 * 0.25;
    float _750 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _752 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _754 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _756 = _740 * _748;
    float _758 = _742 * _748;
    float _760 = _744 * _748;
    float _762 = _750 * _756;
    float _764 = _752 * _758;
    float _766 = _754 * _760;
    float _768 = _740 * _580;
    float _770 = _744 * _584;
    float _772 = _742 * _582;
    float _774 = _600 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _776 = fma(_768, (*spvDescriptorSet0.fp_c4)._m0[7].x, _762);
    float _778 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[7].z, _766);
    float _780 = fma(_772, (*spvDescriptorSet0.fp_c4)._m0[7].y, _764);
    float _782 = precise::max(0.0, _722);
    float _784 = -_740;
    float _786 = _784 + 1.0;
    float _788 = -_742;
    float _790 = _788 + 1.0;
    float _792 = -_744;
    float _794 = _792 + 1.0;
    float _796 = _602 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _798 = _604 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _800 = fma(_774, _786, _776);
    float _802 = -_782;
    float _804 = _802 + 1.0;
    float _806 = precise::clamp(_804, 0.0, 1.0);
    float _808 = fma(_796, _790, _780);
    float _810 = fma(_798, _794, _778);
    out.m_49.x = _800;
    out.m_49.y = _808;
    out.m_49.z = _810;
    out.m_49.w = _806;
    return out;
}

