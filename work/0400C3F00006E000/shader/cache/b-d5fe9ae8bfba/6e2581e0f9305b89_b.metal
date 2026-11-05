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
int _44(thread const int& _1736, thread const int& _1737, constant _10& support_buffer)
{
    int _1740 = 1 + _1737;
    float _1742 = support_buffer._m5[_1740].x;
    float _1744 = abs(_1742);
    bool _1746 = _1744 == 1.0;
    if (_1746)
    {
        return _1736;
    }
    float _1748 = float(_1736);
    float _1750 = _1748 / _1744;
    int _1752 = int(_1750);
    return _1752;
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
    float2 _766 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_766, float2(0.0), isnan(_766))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_766, float2(0.0), isnan(_766))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _798 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_798, float2(0.0), isnan(_798))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_798, float2(0.0), isnan(_798))).x;
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
    float _108 = _62 * _92;
    float _110 = precise::max(_104, _106);
    float _112 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    bool _116 = _110 != 0.0;
    bool _118 = isnan(_110);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _62 * _98;
    float _132 = precise::min(_128, _114);
    bool _134 = !_124;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_110, _136, 1.0);
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
        float _206 = float(_190);
        float _208 = fma(_64, _204, -0.5);
        float _210 = floor(_200);
        float _212 = -_202;
        float _214 = _198 + _212;
        float _216 = fma(_66, _206, -0.5);
        float _218 = floor(_208);
        float _220 = _202 + 1.5;
        float _222 = -_214;
        float _224 = _222 + 1.0;
        float _226 = -_214;
        float _228 = _226 + 2.0;
        float _230 = _202 + (-0.5);
        float _232 = _224 * _224;
        float _234 = _228 * _228;
        float _236 = -_210;
        float _238 = _200 + _236;
        float _240 = 1.0 / _194;
        float _242 = _224 * _232;
        float _244 = -_238;
        float _246 = _244 + 2.0;
        float _248 = _238 * _238;
        float _250 = _242 * 4.0;
        float _252 = -_242;
        float _254 = _252 + 6.0;
        float _256 = -_218;
        float _258 = _208 + _256;
        float _260 = _246 * _246;
        float _262 = -_250;
        float _264 = fma(_228, _234, _262);
        float _266 = -_238;
        float _268 = _266 + 1.0;
        float _270 = floor(_216);
        float _272 = -_258;
        float _274 = _272 + 1.0;
        float _276 = -_264;
        float _278 = _276 + _254;
        float _280 = _268 * _268;
        float _282 = _238 * _248;
        float _284 = _278 * 0.16666667163372039794921875;
        float _286 = _268 * _280;
        float _288 = _214 * _214;
        float _290 = _282 * 0.16666667163372039794921875;
        float _292 = 1.0 / _206;
        float _294 = _286 * 4.0;
        float _296 = _214 * _288;
        float _298 = -_294;
        float _300 = fma(_246, _260, _298);
        float _302 = -_270;
        float _304 = _216 + _302;
        float _306 = -_286;
        float _308 = _306 + 6.0;
        float _310 = 1.0 / _284;
        float _312 = _274 * _274;
        float _314 = _296 * 0.16666667163372039794921875;
        float _316 = -_304;
        float _318 = _316 + 1.0;
        float _320 = -_300;
        float _322 = _320 + _308;
        float _324 = _274 * _312;
        float _326 = -_304;
        float _328 = _326 + 2.0;
        float _330 = _318 * _318;
        float _332 = 1.0 / _204;
        float _334 = _324 * 4.0;
        float _336 = _322 * 0.16666667163372039794921875;
        float _338 = _318 * _330;
        float _340 = _286 + _300;
        float _342 = _338 * 4.0;
        float _344 = fma(_314, _310, _220);
        float _346 = -_258;
        float _348 = _346 + 2.0;
        float _350 = _242 + _264;
        float _352 = 1.0 / _336;
        float _354 = _340 * 0.16666667163372039794921875;
        float _356 = _348 * _348;
        float _358 = _350 * 0.16666667163372039794921875;
        float _360 = _264 * 0.16666667163372039794921875;
        float _362 = -_334;
        float _364 = fma(_348, _356, _362);
        float _366 = _328 * _328;
        float _368 = 1.0 / _358;
        float _370 = -_324;
        float _372 = _370 + 6.0;
        float _374 = _324 + _364;
        float _376 = -_342;
        float _378 = fma(_328, _366, _376);
        float _380 = -_338;
        float _382 = _380 + 6.0;
        float _384 = -_364;
        float _386 = _384 + _372;
        float _388 = _374 * 0.16666667163372039794921875;
        float _390 = _338 + _378;
        float _392 = 1.0 / _354;
        float _394 = -_378;
        float _396 = _394 + _382;
        float _398 = _210 + (-0.5);
        float _400 = _300 * 0.16666667163372039794921875;
        float _402 = _386 * 0.16666667163372039794921875;
        float _404 = _396 * 0.16666667163372039794921875;
        float _406 = _364 * 0.16666667163372039794921875;
        float _408 = fma(_360, _368, _230);
        float _410 = _210 + 1.5;
        float _412 = 1.0 / _388;
        float _414 = _390 * 0.16666667163372039794921875;
        float _416 = _408 * _196;
        float _418 = fma(_290, _352, _410);
        float _420 = _304 * _304;
        float _422 = _344 * _196;
        float _424 = fma(_400, _392, _398);
        float _426 = _258 * _258;
        float _428 = 1.0 / _404;
        float _430 = _304 * _420;
        float _432 = _218 + (-0.5);
        float _434 = _258 * _426;
        float _436 = _218 + 1.5;
        float _438 = _270 + 1.5;
        float _440 = _430 * 0.16666667163372039794921875;
        float _442 = _424 * _240;
        float _444 = 1.0 / _414;
        float _446 = fma(_406, _412, _432);
        float _448 = _270 + (-0.5);
        float _450 = _378 * 0.16666667163372039794921875;
        float _452 = _418 * _240;
        float _454 = _434 * 0.16666667163372039794921875;
        float _456 = 1.0 / _402;
        float _458 = fma(_440, _428, _438);
        float _460 = _446 * _332;
        float _462 = _458 * _292;
        float _464 = fma(_450, _444, _448);
        float _466 = _464 * _292;
        float2 _1298 = float2(_416, _442);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1298, float2(0.0), isnan(_1298)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1298, float2(0.0), isnan(_1298)), level(_148)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1313 = float2(_422, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1313, float2(0.0), isnan(_1313)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1313, float2(0.0), isnan(_1313)), level(_148)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1328 = float2(_416, _452);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1328, float2(0.0), isnan(_1328)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1328, float2(0.0), isnan(_1328)), level(_148)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = fma(_454, _456, _436);
        float2 _1347 = float2(_422, _452);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1347, float2(0.0), isnan(_1347)), level(_148)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1347, float2(0.0), isnan(_1347)), level(_148)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float _504 = _494 * _332;
        float2 _1365 = float2(_460, _466);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1365, float2(0.0), isnan(_1365)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1365, float2(0.0), isnan(_1365)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1380 = float2(_504, _466);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1380, float2(0.0), isnan(_1380)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1380, float2(0.0), isnan(_1380)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1395 = float2(_460, _462);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1395, float2(0.0), isnan(_1395)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1395, float2(0.0), isnan(_1395)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1410 = float2(_504, _462);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1410, float2(0.0), isnan(_1410)), level(_154)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1410, float2(0.0), isnan(_1410)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = -_148;
        float _540 = _142 + _538;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = 0.0 + _140;
        float _546 = precise::clamp(_544, 0.0, 1.0);
        float _548 = fma(_130, _546, _108);
        float _550 = -_482;
        float _552 = _474 + _550;
        float _554 = -_480;
        float _556 = _472 + _554;
        float _558 = fma(_358, _552, _482);
        float _560 = -_484;
        float _562 = _476 + _560;
        float _564 = -_500;
        float _566 = _490 + _564;
        float _568 = -_498;
        float _570 = _488 + _568;
        float _572 = -_502;
        float _574 = _492 + _572;
        float _576 = fma(_358, _556, _480);
        float _578 = fma(_358, _566, _500);
        float _580 = fma(_358, _570, _498);
        float _582 = fma(_358, _562, _484);
        float _584 = -_518;
        float _586 = _510 + _584;
        float _588 = -_578;
        float _590 = _588 + _558;
        float _592 = -_516;
        float _594 = _508 + _592;
        float _596 = -_520;
        float _598 = _512 + _596;
        float _600 = fma(_388, _586, _518);
        float _602 = fma(_354, _590, _578);
        float _604 = -_534;
        float _606 = _526 + _604;
        float _608 = -_532;
        float _610 = _524 + _608;
        float _612 = -_536;
        float _614 = _528 + _612;
        float _616 = fma(_388, _594, _516);
        float _618 = fma(_388, _606, _534);
        float _620 = fma(_388, _610, _532);
        float _622 = fma(_358, _574, _502);
        float _624 = fma(_388, _598, _520);
        float _626 = -_618;
        float _628 = _626 + _600;
        float _630 = fma(_388, _614, _536);
        float _632 = -_580;
        float _634 = _632 + _576;
        float _636 = -_620;
        float _638 = _636 + _616;
        float _640 = fma(_414, _628, _618);
        float _642 = -_622;
        float _644 = _642 + _582;
        float _646 = -_630;
        float _648 = _646 + _624;
        float _650 = fma(_354, _634, _580);
        float _652 = fma(_414, _638, _620);
        float _654 = -_602;
        float _656 = _654 + _640;
        float _658 = fma(_354, _644, _622);
        float _660 = fma(_414, _648, _630);
        float _662 = -_650;
        float _664 = _662 + _652;
        float _666 = fma(_542, _656, _602);
        float _668 = _546 * _130;
        float _670 = -_658;
        float _672 = _670 + _660;
        float _674 = fma(_542, _664, _650);
        float _676 = _666 * 0.586600005626678466796875;
        float _678 = 1.0 / _548;
        float _680 = fma(_542, _672, _658);
        float _682 = _132 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _684 = fma(_674, 0.29890000820159912109375, _676);
        float _686 = fma(_680, 0.1143999993801116943359375, _684);
        float _688 = -_680;
        float _690 = _688 + _686;
        float _692 = -_674;
        float _694 = _692 + _686;
        float _696 = -_666;
        float _698 = _696 + _686;
        float _700 = fma(_682, _690, _680);
        float _702 = fma(_682, _694, _674);
        float _704 = fma(_682, _698, _666);
        float _706 = -_700;
        float _708 = fma(_700, (*spvDescriptorSet0.fp_c3)._m0[13].z, _706);
        float _710 = -_702;
        float _712 = fma(_702, (*spvDescriptorSet0.fp_c3)._m0[13].x, _710);
        float _714 = -_704;
        float _716 = fma(_704, (*spvDescriptorSet0.fp_c3)._m0[13].y, _714);
        float _718 = fma(_132, _708, _700);
        float _720 = fma(_132, _712, _702);
        float _722 = _678 * _668;
        float _724 = fma(_132, _716, _704);
        float _726 = _718 * _668;
        float _728 = _720 * _722;
        float _730 = _724 * _722;
        float _732 = _726 * _678;
        out.m_36.x = _728;
        out.m_36.y = _730;
        out.m_36.z = _732;
        out.m_36.w = _548;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _108;
    return out;
}

