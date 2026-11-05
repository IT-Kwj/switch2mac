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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1719, thread const int& _1720, constant _10& support_buffer)
{
    int _1723 = 1 + _1720;
    float _1725 = support_buffer._m5[_1723].x;
    float _1727 = abs(_1725);
    bool _1729 = _1727 == 1.0;
    if (_1729)
    {
        return _1719;
    }
    float _1731 = float(_1719);
    float _1733 = _1731 / _1727;
    int _1735 = int(_1733);
    return _1735;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _760 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).x;
    bool _72 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_72)
    {
        discard_fragment();
    }
    float2 _780 = float2(_64, _66);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_780, float2(0.0), isnan(_780))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_780, float2(0.0), isnan(_780))).x;
    if (_72)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _76 = in.m_38.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_38.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::max(_74, _96);
    float _100 = _62 * _80;
    float _102 = _62 * _86;
    float _104 = precise::max(_98, _100);
    float _106 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _104 != 0.0;
    bool _112 = isnan(_104);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    float _120 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _62 * _92;
    float _126 = precise::min(_122, _108);
    bool _128 = !_118;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_104, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = float(_140);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = _142 + 1.0;
        float _150 = trunc(_148);
        int _152 = int(_150);
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _156 = _154;
        int _158 = 2;
        int _160 = _44(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _164 = _162;
        int _166 = 2;
        int _168 = _44(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _172 = _170;
        int _174 = 2;
        int _176 = _44(_172, _174, (*spvDescriptorSet0.support_buffer));
        int _178 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _180 = _178;
        int _182 = 2;
        int _184 = _44(_180, _182, (*spvDescriptorSet0.support_buffer));
        float _186 = float(_160);
        float _188 = float(_168);
        float _190 = 1.0 / _186;
        float _192 = fma(_64, _186, -0.5);
        float _194 = fma(_66, _188, -0.5);
        float _196 = floor(_192);
        float _198 = float(_176);
        float _200 = float(_184);
        float _202 = fma(_64, _198, -0.5);
        float _204 = floor(_194);
        float _206 = -_196;
        float _208 = _192 + _206;
        float _210 = fma(_66, _200, -0.5);
        float _212 = floor(_202);
        float _214 = _196 + 1.5;
        float _216 = -_208;
        float _218 = _216 + 1.0;
        float _220 = -_208;
        float _222 = _220 + 2.0;
        float _224 = _196 + (-0.5);
        float _226 = _218 * _218;
        float _228 = _222 * _222;
        float _230 = -_204;
        float _232 = _194 + _230;
        float _234 = 1.0 / _188;
        float _236 = _218 * _226;
        float _238 = -_232;
        float _240 = _238 + 2.0;
        float _242 = _232 * _232;
        float _244 = _236 * 4.0;
        float _246 = -_236;
        float _248 = _246 + 6.0;
        float _250 = -_212;
        float _252 = _202 + _250;
        float _254 = _240 * _240;
        float _256 = -_244;
        float _258 = fma(_222, _228, _256);
        float _260 = -_232;
        float _262 = _260 + 1.0;
        float _264 = floor(_210);
        float _266 = -_252;
        float _268 = _266 + 1.0;
        float _270 = -_258;
        float _272 = _270 + _248;
        float _274 = _262 * _262;
        float _276 = _232 * _242;
        float _278 = _272 * 0.16666667163372039794921875;
        float _280 = _262 * _274;
        float _282 = _208 * _208;
        float _284 = _276 * 0.16666667163372039794921875;
        float _286 = 1.0 / _200;
        float _288 = _280 * 4.0;
        float _290 = _208 * _282;
        float _292 = -_288;
        float _294 = fma(_240, _254, _292);
        float _296 = -_264;
        float _298 = _210 + _296;
        float _300 = -_280;
        float _302 = _300 + 6.0;
        float _304 = 1.0 / _278;
        float _306 = _268 * _268;
        float _308 = _290 * 0.16666667163372039794921875;
        float _310 = -_298;
        float _312 = _310 + 1.0;
        float _314 = -_294;
        float _316 = _314 + _302;
        float _318 = _268 * _306;
        float _320 = -_298;
        float _322 = _320 + 2.0;
        float _324 = _312 * _312;
        float _326 = 1.0 / _198;
        float _328 = _318 * 4.0;
        float _330 = _316 * 0.16666667163372039794921875;
        float _332 = _312 * _324;
        float _334 = _280 + _294;
        float _336 = _332 * 4.0;
        float _338 = fma(_308, _304, _214);
        float _340 = -_252;
        float _342 = _340 + 2.0;
        float _344 = _236 + _258;
        float _346 = 1.0 / _330;
        float _348 = _334 * 0.16666667163372039794921875;
        float _350 = _342 * _342;
        float _352 = _344 * 0.16666667163372039794921875;
        float _354 = _258 * 0.16666667163372039794921875;
        float _356 = -_328;
        float _358 = fma(_342, _350, _356);
        float _360 = _322 * _322;
        float _362 = 1.0 / _352;
        float _364 = -_318;
        float _366 = _364 + 6.0;
        float _368 = _318 + _358;
        float _370 = -_336;
        float _372 = fma(_322, _360, _370);
        float _374 = -_332;
        float _376 = _374 + 6.0;
        float _378 = -_358;
        float _380 = _378 + _366;
        float _382 = _368 * 0.16666667163372039794921875;
        float _384 = _332 + _372;
        float _386 = 1.0 / _348;
        float _388 = -_372;
        float _390 = _388 + _376;
        float _392 = _204 + (-0.5);
        float _394 = _294 * 0.16666667163372039794921875;
        float _396 = _380 * 0.16666667163372039794921875;
        float _398 = _390 * 0.16666667163372039794921875;
        float _400 = _358 * 0.16666667163372039794921875;
        float _402 = fma(_354, _362, _224);
        float _404 = _204 + 1.5;
        float _406 = 1.0 / _382;
        float _408 = _384 * 0.16666667163372039794921875;
        float _410 = _402 * _190;
        float _412 = fma(_284, _346, _404);
        float _414 = _298 * _298;
        float _416 = _338 * _190;
        float _418 = fma(_394, _386, _392);
        float _420 = _252 * _252;
        float _422 = 1.0 / _398;
        float _424 = _298 * _414;
        float _426 = _212 + (-0.5);
        float _428 = _252 * _420;
        float _430 = _212 + 1.5;
        float _432 = _264 + 1.5;
        float _434 = _424 * 0.16666667163372039794921875;
        float _436 = _418 * _234;
        float _438 = 1.0 / _408;
        float _440 = fma(_400, _406, _426);
        float _442 = _264 + (-0.5);
        float _444 = _372 * 0.16666667163372039794921875;
        float _446 = _412 * _234;
        float _448 = _428 * 0.16666667163372039794921875;
        float _450 = 1.0 / _396;
        float _452 = fma(_434, _422, _432);
        float _454 = _440 * _326;
        float _456 = _452 * _286;
        float _458 = fma(_444, _438, _442);
        float _460 = _458 * _286;
        float2 _1281 = float2(_410, _436);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1281, float2(0.0), isnan(_1281)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1281, float2(0.0), isnan(_1281)), level(_142)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1296 = float2(_416, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1296, float2(0.0), isnan(_1296)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1296, float2(0.0), isnan(_1296)), level(_142)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1311 = float2(_410, _446);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1311, float2(0.0), isnan(_1311)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1311, float2(0.0), isnan(_1311)), level(_142)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float _488 = fma(_448, _450, _430);
        float2 _1330 = float2(_416, _446);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1330, float2(0.0), isnan(_1330)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1330, float2(0.0), isnan(_1330)), level(_142)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float _498 = _488 * _326;
        float2 _1348 = float2(_454, _460);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1348, float2(0.0), isnan(_1348)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1348, float2(0.0), isnan(_1348)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1363 = float2(_498, _460);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1363, float2(0.0), isnan(_1363)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1363, float2(0.0), isnan(_1363)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1378 = float2(_454, _456);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1378, float2(0.0), isnan(_1378)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1378, float2(0.0), isnan(_1378)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1393 = float2(_498, _456);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1393, float2(0.0), isnan(_1393)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1393, float2(0.0), isnan(_1393)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = -_142;
        float _534 = _136 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = 0.0 + _134;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = fma(_124, _540, _102);
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = -_474;
        float _550 = _466 + _548;
        float _552 = fma(_352, _546, _476);
        float _554 = -_478;
        float _556 = _470 + _554;
        float _558 = -_494;
        float _560 = _484 + _558;
        float _562 = -_492;
        float _564 = _482 + _562;
        float _566 = -_496;
        float _568 = _486 + _566;
        float _570 = fma(_352, _550, _474);
        float _572 = fma(_352, _560, _494);
        float _574 = fma(_352, _564, _492);
        float _576 = fma(_352, _556, _478);
        float _578 = -_512;
        float _580 = _504 + _578;
        float _582 = -_572;
        float _584 = _582 + _552;
        float _586 = -_510;
        float _588 = _502 + _586;
        float _590 = -_514;
        float _592 = _506 + _590;
        float _594 = fma(_382, _580, _512);
        float _596 = fma(_348, _584, _572);
        float _598 = -_528;
        float _600 = _520 + _598;
        float _602 = -_526;
        float _604 = _518 + _602;
        float _606 = -_530;
        float _608 = _522 + _606;
        float _610 = fma(_382, _588, _510);
        float _612 = fma(_382, _600, _528);
        float _614 = fma(_382, _604, _526);
        float _616 = fma(_352, _568, _496);
        float _618 = fma(_382, _592, _514);
        float _620 = -_612;
        float _622 = _620 + _594;
        float _624 = fma(_382, _608, _530);
        float _626 = -_574;
        float _628 = _626 + _570;
        float _630 = -_614;
        float _632 = _630 + _610;
        float _634 = fma(_408, _622, _612);
        float _636 = -_616;
        float _638 = _636 + _576;
        float _640 = -_624;
        float _642 = _640 + _618;
        float _644 = fma(_348, _628, _574);
        float _646 = fma(_408, _632, _614);
        float _648 = -_596;
        float _650 = _648 + _634;
        float _652 = fma(_348, _638, _616);
        float _654 = fma(_408, _642, _624);
        float _656 = -_644;
        float _658 = _656 + _646;
        float _660 = fma(_536, _650, _596);
        float _662 = _540 * _124;
        float _664 = -_652;
        float _666 = _664 + _654;
        float _668 = fma(_536, _658, _644);
        float _670 = _660 * 0.586600005626678466796875;
        float _672 = 1.0 / _542;
        float _674 = fma(_536, _666, _652);
        float _676 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _678 = fma(_668, 0.29890000820159912109375, _670);
        float _680 = fma(_674, 0.1143999993801116943359375, _678);
        float _682 = -_674;
        float _684 = _682 + _680;
        float _686 = -_668;
        float _688 = _686 + _680;
        float _690 = -_660;
        float _692 = _690 + _680;
        float _694 = fma(_676, _684, _674);
        float _696 = fma(_676, _688, _668);
        float _698 = fma(_676, _692, _660);
        float _700 = -_694;
        float _702 = fma(_694, (*spvDescriptorSet0.fp_c3)._m0[13].z, _700);
        float _704 = -_696;
        float _706 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[13].x, _704);
        float _708 = -_698;
        float _710 = fma(_698, (*spvDescriptorSet0.fp_c3)._m0[13].y, _708);
        float _712 = fma(_126, _702, _694);
        float _714 = fma(_126, _706, _696);
        float _716 = _672 * _662;
        float _718 = fma(_126, _710, _698);
        float _720 = _712 * _662;
        float _722 = _714 * _716;
        float _724 = _718 * _716;
        float _726 = _720 * _672;
        out.m_36.x = _722;
        out.m_36.y = _724;
        out.m_36.z = _726;
        out.m_36.w = _542;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _102;
    return out;
}

