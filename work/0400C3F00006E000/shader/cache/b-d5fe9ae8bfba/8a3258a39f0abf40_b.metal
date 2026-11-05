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
int _44(thread const int& _1697, thread const int& _1698, constant _10& support_buffer)
{
    int _1701 = 1 + _1698;
    float _1703 = support_buffer._m5[_1701].x;
    float _1705 = abs(_1703);
    bool _1707 = _1705 == 1.0;
    if (_1707)
    {
        return _1697;
    }
    float _1709 = float(_1697);
    float _1711 = _1709 / _1705;
    int _1713 = int(_1711);
    return _1713;
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
    float2 _752 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _784 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_784, float2(0.0), isnan(_784))).x;
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _82 = in.m_38.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_80, _102);
    float _106 = _62 * _86;
    float _108 = precise::max(_104, _106);
    float _110 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _62 * _92;
    bool _116 = _108 != 0.0;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _62 * _98;
    float _132 = precise::min(_112, _128);
    bool _134 = !_124;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_108, _136, 1.0);
        float _140 = log2(_138);
        float _142 = _140 + (-1.0);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = float(_146);
        float _150 = trunc(_148);
        int _152 = int(_150);
        float _154 = _148 + 1.0;
        float _156 = trunc(_154);
        int _158 = int(_156);
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _162 = _160;
        int _164 = 2;
        int _166 = _44(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _170 = _168;
        int _172 = 2;
        int _174 = _44(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).x;
        int _178 = _176;
        int _180 = 2;
        int _182 = _44(_178, _180, (*spvDescriptorSet0.support_buffer));
        int _184 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).y;
        int _186 = _184;
        int _188 = 2;
        int _190 = _44(_186, _188, (*spvDescriptorSet0.support_buffer));
        float _192 = float(_166);
        float _194 = float(_174);
        float _196 = 1.0 / _192;
        float _198 = fma(_64, _192, -0.5);
        float _200 = fma(_66, _194, -0.5);
        float _202 = floor(_198);
        float _204 = float(_182);
        float _206 = fma(_64, _204, -0.5);
        float _208 = floor(_200);
        float _210 = -_202;
        float _212 = _198 + _210;
        float _214 = floor(_206);
        float _216 = _202 + 1.5;
        float _218 = _202 + (-0.5);
        float _220 = -_212;
        float _222 = _220 + 1.0;
        float _224 = -_212;
        float _226 = _224 + 2.0;
        float _228 = _222 * _222;
        float _230 = _226 * _226;
        float _232 = -_208;
        float _234 = _200 + _232;
        float _236 = 1.0 / _194;
        float _238 = _222 * _228;
        float _240 = float(_190);
        float _242 = -_234;
        float _244 = _242 + 1.0;
        float _246 = _234 * _234;
        float _248 = _238 * 4.0;
        float _250 = fma(_66, _240, -0.5);
        float _252 = -_238;
        float _254 = _252 + 6.0;
        float _256 = -_248;
        float _258 = fma(_226, _230, _256);
        float _260 = _244 * _244;
        float _262 = floor(_250);
        float _264 = -_234;
        float _266 = _264 + 2.0;
        float _268 = -_258;
        float _270 = _268 + _254;
        float _272 = _244 * _260;
        float _274 = -_214;
        float _276 = _206 + _274;
        float _278 = _266 * _266;
        float _280 = _270 * 0.16666667163372039794921875;
        float _282 = _212 * _212;
        float _284 = _272 * 4.0;
        float _286 = -_276;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _204;
        float _292 = _212 * _282;
        float _294 = -_284;
        float _296 = fma(_266, _278, _294);
        float _298 = -_272;
        float _300 = _298 + 6.0;
        float _302 = _288 * _288;
        float _304 = _292 * 0.16666667163372039794921875;
        float _306 = -_262;
        float _308 = _250 + _306;
        float _310 = -_296;
        float _312 = _310 + _300;
        float _314 = 1.0 / _280;
        float _316 = _288 * _302;
        float _318 = -_308;
        float _320 = _318 + 1.0;
        float _322 = -_276;
        float _324 = _322 + 2.0;
        float _326 = -_308;
        float _328 = _326 + 2.0;
        float _330 = _316 * 4.0;
        float _332 = _320 * _320;
        float _334 = _312 * 0.16666667163372039794921875;
        float _336 = _234 * _246;
        float _338 = 1.0 / _240;
        float _340 = _320 * _332;
        float _342 = _336 * 0.16666667163372039794921875;
        float _344 = _340 * 4.0;
        float _346 = fma(_304, _314, _216);
        float _348 = _238 + _258;
        float _350 = _324 * _324;
        float _352 = _272 + _296;
        float _354 = 1.0 / _334;
        float _356 = _348 * 0.16666667163372039794921875;
        float _358 = -_330;
        float _360 = fma(_324, _350, _358);
        float _362 = _328 * _328;
        float _364 = -_316;
        float _366 = _364 + 6.0;
        float _368 = _352 * 0.16666667163372039794921875;
        float _370 = _316 + _360;
        float _372 = _258 * 0.16666667163372039794921875;
        float _374 = 1.0 / _356;
        float _376 = -_344;
        float _378 = fma(_328, _362, _376);
        float _380 = -_340;
        float _382 = _380 + 6.0;
        float _384 = -_360;
        float _386 = _384 + _366;
        float _388 = _370 * 0.16666667163372039794921875;
        float _390 = _340 + _378;
        float _392 = -_378;
        float _394 = _392 + _382;
        float _396 = _208 + (-0.5);
        float _398 = 1.0 / _368;
        float _400 = _296 * 0.16666667163372039794921875;
        float _402 = _394 * 0.16666667163372039794921875;
        float _404 = _386 * 0.16666667163372039794921875;
        float _406 = _360 * 0.16666667163372039794921875;
        float _408 = fma(_372, _374, _218);
        float _410 = _208 + 1.5;
        float _412 = 1.0 / _388;
        float _414 = _390 * 0.16666667163372039794921875;
        float _416 = _408 * _196;
        float _418 = fma(_342, _354, _410);
        float _420 = _308 * _308;
        float _422 = _346 * _196;
        float _424 = fma(_400, _398, _396);
        float _426 = _276 * _276;
        float _428 = 1.0 / _402;
        float _430 = _308 * _420;
        float _432 = _214 + (-0.5);
        float _434 = _276 * _426;
        float _436 = _214 + 1.5;
        float _438 = _262 + 1.5;
        float _440 = _430 * 0.16666667163372039794921875;
        float _442 = _424 * _236;
        float _444 = 1.0 / _414;
        float _446 = fma(_406, _412, _432);
        float _448 = _262 + (-0.5);
        float _450 = _378 * 0.16666667163372039794921875;
        float _452 = _418 * _236;
        float _454 = _434 * 0.16666667163372039794921875;
        float _456 = 1.0 / _404;
        float _458 = fma(_440, _428, _438);
        float _460 = _446 * _290;
        float _462 = _458 * _338;
        float _464 = fma(_450, _444, _448);
        float _466 = _464 * _338;
        float2 _1284 = float2(_416, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1284, float2(0.0), isnan(_1284)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1284, float2(0.0), isnan(_1284)), level(_148)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1299 = float2(_422, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_148)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1314 = float2(_416, _452);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1314, float2(0.0), isnan(_1314)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1314, float2(0.0), isnan(_1314)), level(_148)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = fma(_454, _456, _436);
        float2 _1333 = float2(_422, _452);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1333, float2(0.0), isnan(_1333)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1333, float2(0.0), isnan(_1333)), level(_148)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float _504 = _494 * _290;
        float2 _1351 = float2(_460, _466);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1351, float2(0.0), isnan(_1351)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1351, float2(0.0), isnan(_1351)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1366 = float2(_504, _466);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1366, float2(0.0), isnan(_1366)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1366, float2(0.0), isnan(_1366)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1381 = float2(_460, _462);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1381, float2(0.0), isnan(_1381)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1381, float2(0.0), isnan(_1381)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1396 = float2(_504, _462);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1396, float2(0.0), isnan(_1396)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1396, float2(0.0), isnan(_1396)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = -_148;
        float _540 = _142 + _538;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = -_482;
        float _546 = _474 + _544;
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = fma(_356, _546, _482);
        float _554 = -_484;
        float _556 = _476 + _554;
        float _558 = -_500;
        float _560 = _490 + _558;
        float _562 = -_498;
        float _564 = _488 + _562;
        float _566 = fma(_356, _550, _480);
        float _568 = -_502;
        float _570 = _492 + _568;
        float _572 = fma(_356, _560, _500);
        float _574 = fma(_356, _564, _498);
        float _576 = fma(_356, _556, _484);
        float _578 = -_518;
        float _580 = _510 + _578;
        float _582 = -_572;
        float _584 = _582 + _552;
        float _586 = -_516;
        float _588 = _508 + _586;
        float _590 = -_520;
        float _592 = _512 + _590;
        float _594 = fma(_388, _580, _518);
        float _596 = fma(_368, _584, _572);
        float _598 = -_534;
        float _600 = _526 + _598;
        float _602 = -_532;
        float _604 = _524 + _602;
        float _606 = fma(_388, _588, _516);
        float _608 = -_536;
        float _610 = _528 + _608;
        float _612 = fma(_388, _600, _534);
        float _614 = fma(_388, _604, _532);
        float _616 = -_574;
        float _618 = _616 + _566;
        float _620 = fma(_356, _570, _502);
        float _622 = -_612;
        float _624 = _622 + _594;
        float _626 = fma(_388, _592, _520);
        float _628 = fma(_388, _610, _536);
        float _630 = -_614;
        float _632 = _630 + _606;
        float _634 = fma(_414, _624, _612);
        float _636 = fma(_368, _618, _574);
        float _638 = -_620;
        float _640 = _638 + _576;
        float _642 = -_628;
        float _644 = _642 + _626;
        float _646 = fma(_414, _632, _614);
        float _648 = -_596;
        float _650 = _648 + _634;
        float _652 = fma(_368, _640, _620);
        float _654 = fma(_414, _644, _628);
        float _656 = -_636;
        float _658 = _656 + _646;
        float _660 = fma(_542, _650, _596);
        float _662 = _132 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _664 = -_652;
        float _666 = _664 + _654;
        float _668 = fma(_542, _658, _636);
        float _670 = _660 * 0.586600005626678466796875;
        float _672 = fma(_542, _666, _652);
        float _674 = fma(_668, 0.29890000820159912109375, _670);
        float _676 = fma(_672, 0.1143999993801116943359375, _674);
        float _678 = -_668;
        float _680 = _678 + _676;
        float _682 = -_660;
        float _684 = _682 + _676;
        float _686 = -_672;
        float _688 = _686 + _676;
        float _690 = fma(_662, _680, _668);
        float _692 = fma(_662, _684, _660);
        float _694 = fma(_662, _688, _672);
        float _696 = 0.0 + _140;
        float _698 = precise::clamp(_696, 0.0, 1.0);
        float _700 = -_690;
        float _702 = fma(_690, (*spvDescriptorSet0.fp_c3)._m0[13].x, _700);
        float _704 = -_692;
        float _706 = fma(_692, (*spvDescriptorSet0.fp_c3)._m0[13].y, _704);
        float _708 = -_694;
        float _710 = fma(_694, (*spvDescriptorSet0.fp_c3)._m0[13].z, _708);
        float _712 = fma(_130, _698, _114);
        float _714 = fma(_132, _702, _690);
        float _716 = fma(_132, _706, _692);
        float _718 = fma(_132, _710, _694);
        out.m_36.x = _714;
        out.m_36.y = _716;
        out.m_36.z = _718;
        out.m_36.w = _712;
        return out;
    }
    discard_fragment();
    return out;
}

