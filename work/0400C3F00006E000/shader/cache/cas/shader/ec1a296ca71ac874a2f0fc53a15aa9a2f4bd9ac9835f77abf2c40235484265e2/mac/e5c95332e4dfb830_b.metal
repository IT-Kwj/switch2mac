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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1613, thread const int& _1614, constant _10& support_buffer)
{
    int _1617 = 1 + _1614;
    float _1619 = support_buffer._m5[_1617].x;
    float _1621 = abs(_1619);
    bool _1623 = _1621 == 1.0;
    if (_1623)
    {
        return _1613;
    }
    float _1625 = float(_1613);
    float _1627 = _1625 / _1621;
    int _1629 = int(_1627);
    return _1629;
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
    float2 _724 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).x;
    float2 _735 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_735, float2(0.0), isnan(_735))).x;
    float _72 = in.m_35.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = _62 * _82;
    float _94 = _62 * _88;
    float _96 = -_68;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _100 = 1.0 / _98;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = precise::max(_70, _104);
    float _108 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = precise::max(_106, _94);
    bool _116 = _112 != 0.0;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = precise::min(_128, _110);
    bool _132 = !_124;
    if (!_132)
    {
        float _134 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _136 = fma(_112, _134, 1.0);
        float _138 = log2(_136);
        float _140 = _138 + (-1.0);
        float _142 = trunc(_140);
        int _144 = int(_142);
        float _146 = float(_144);
        float _148 = trunc(_146);
        int _150 = int(_148);
        float _152 = _146 + 1.0;
        float _154 = trunc(_152);
        int _156 = int(_154);
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).x;
        int _160 = _158;
        int _162 = 2;
        int _164 = _44(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_150), spvDescriptorSet0.fp_t_tcb_A.get_height(_150)).y;
        int _168 = _166;
        int _170 = 2;
        int _172 = _44(_168, _170, (*spvDescriptorSet0.support_buffer));
        int _174 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_156), spvDescriptorSet0.fp_t_tcb_A.get_height(_156)).x;
        int _176 = _174;
        int _178 = 2;
        int _180 = _44(_176, _178, (*spvDescriptorSet0.support_buffer));
        int _182 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_156), spvDescriptorSet0.fp_t_tcb_A.get_height(_156)).y;
        int _184 = _182;
        int _186 = 2;
        int _188 = _44(_184, _186, (*spvDescriptorSet0.support_buffer));
        float _190 = float(_164);
        float _192 = float(_172);
        float _194 = 1.0 / _190;
        float _196 = fma(_64, _190, -0.5);
        float _198 = fma(_66, _192, -0.5);
        float _200 = floor(_196);
        float _202 = float(_180);
        float _204 = float(_188);
        float _206 = fma(_64, _202, -0.5);
        float _208 = floor(_198);
        float _210 = -_200;
        float _212 = _196 + _210;
        float _214 = 1.0 / _192;
        float _216 = _200 + (-0.5);
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = -_212;
        float _224 = _222 + 2.0;
        float _226 = _220 * _220;
        float _228 = _224 * _224;
        float _230 = -_208;
        float _232 = _198 + _230;
        float _234 = floor(_206);
        float _236 = _220 * _226;
        float _238 = fma(_66, _204, -0.5);
        float _240 = -_232;
        float _242 = _240 + 1.0;
        float _244 = _212 * _212;
        float _246 = _236 * 4.0;
        float _248 = -_236;
        float _250 = _248 + 6.0;
        float _252 = _242 * _242;
        float _254 = 1.0 / _204;
        float _256 = -_246;
        float _258 = fma(_224, _228, _256);
        float _260 = -_232;
        float _262 = _260 + 2.0;
        float _264 = _242 * _252;
        float _266 = -_258;
        float _268 = _266 + _250;
        float _270 = _262 * _262;
        float _272 = _264 * 4.0;
        float _274 = floor(_238);
        float _276 = _268 * 0.16666667163372039794921875;
        float _278 = _212 * _244;
        float _280 = -_234;
        float _282 = _206 + _280;
        float _284 = -_272;
        float _286 = fma(_262, _270, _284);
        float _288 = -_264;
        float _290 = _288 + 6.0;
        float _292 = _200 + 1.5;
        float _294 = -_282;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _276;
        float _300 = _278 * 0.16666667163372039794921875;
        float _302 = -_286;
        float _304 = _302 + _290;
        float _306 = -_274;
        float _308 = _238 + _306;
        float _310 = _296 * _296;
        float _312 = 1.0 / _202;
        float _314 = -_308;
        float _316 = _314 + 2.0;
        float _318 = _296 * _310;
        float _320 = _304 * 0.16666667163372039794921875;
        float _322 = fma(_300, _298, _292);
        float _324 = -_308;
        float _326 = _324 + 1.0;
        float _328 = -_282;
        float _330 = _328 + 2.0;
        float _332 = _318 * 4.0;
        float _334 = _236 + _258;
        float _336 = _326 * _326;
        float _338 = _330 * _330;
        float _340 = 1.0 / _320;
        float _342 = _334 * 0.16666667163372039794921875;
        float _344 = _326 * _336;
        float _346 = -_332;
        float _348 = fma(_330, _338, _346);
        float _350 = _264 + _286;
        float _352 = _316 * _316;
        float _354 = _344 * 4.0;
        float _356 = -_318;
        float _358 = _356 + 6.0;
        float _360 = 1.0 / _342;
        float _362 = _350 * 0.16666667163372039794921875;
        float _364 = -_354;
        float _366 = fma(_316, _352, _364);
        float _368 = -_344;
        float _370 = _368 + 6.0;
        float _372 = _318 + _348;
        float _374 = _258 * 0.16666667163372039794921875;
        float _376 = -_348;
        float _378 = _376 + _358;
        float _380 = -_366;
        float _382 = _380 + _370;
        float _384 = 1.0 / _362;
        float _386 = _344 + _366;
        float _388 = _378 * 0.16666667163372039794921875;
        float _390 = _382 * 0.16666667163372039794921875;
        float _392 = _232 * _232;
        float _394 = _286 * 0.16666667163372039794921875;
        float _396 = _348 * 0.16666667163372039794921875;
        float _398 = _232 * _392;
        float _400 = _372 * 0.16666667163372039794921875;
        float _402 = fma(_374, _360, _216);
        float _404 = _208 + (-0.5);
        float _406 = _208 + 1.5;
        float _408 = 1.0 / _400;
        float _410 = _386 * 0.16666667163372039794921875;
        float _412 = _398 * 0.16666667163372039794921875;
        float _414 = fma(_394, _384, _404);
        float _416 = _282 * _282;
        float _418 = _402 * _194;
        float _420 = fma(_412, _340, _406);
        float _422 = _308 * _308;
        float _424 = 1.0 / _410;
        float _426 = _322 * _194;
        float _428 = _282 * _416;
        float _430 = _414 * _214;
        float _432 = _234 + (-0.5);
        float _434 = _308 * _422;
        float _436 = _420 * _214;
        float _438 = _234 + 1.5;
        float _440 = 1.0 / _388;
        float _442 = _274 + (-0.5);
        float _444 = _366 * 0.16666667163372039794921875;
        float _446 = fma(_396, _408, _432);
        float _448 = _274 + 1.5;
        float _450 = _428 * 0.16666667163372039794921875;
        float _452 = _434 * 0.16666667163372039794921875;
        float _454 = 1.0 / _390;
        float _456 = fma(_444, _424, _442);
        float _458 = _446 * _312;
        float2 _1231 = float2(_418, _430);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_146)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1246 = float2(_426, _430);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_146)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float _478 = fma(_450, _440, _438);
        float _480 = _478 * _312;
        float _482 = fma(_452, _454, _448);
        float _484 = _456 * _254;
        float _486 = _482 * _254;
        float2 _1278 = float2(_418, _436);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_146)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1293 = float2(_426, _436);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_146)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_146)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1308 = float2(_458, _484);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_152)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_152)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1323 = float2(_480, _484);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_152)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_152)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float2 _1338 = float2(_458, _486);
        float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1338, float2(0.0), isnan(_1338)), level(_152)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1338, float2(0.0), isnan(_1338)), level(_152)).xyz;
        float _522 = _520.x;
        float _524 = _520.y;
        float _526 = _520.z;
        float2 _1353 = float2(_480, _486);
        float3 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1353, float2(0.0), isnan(_1353)), level(_152)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1353, float2(0.0), isnan(_1353)), level(_152)).xyz;
        float _530 = _528.x;
        float _532 = _528.y;
        float _534 = _528.z;
        float _536 = 0.0 + _138;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = fma(_92, _538, _90);
        float _542 = -_472;
        float _544 = _464 + _542;
        float _546 = -_474;
        float _548 = _466 + _546;
        float _550 = -_476;
        float _552 = _468 + _550;
        float _554 = fma(_342, _544, _472);
        float _556 = fma(_342, _548, _474);
        float _558 = fma(_342, _552, _476);
        float _560 = -_500;
        float _562 = _492 + _560;
        float _564 = -_498;
        float _566 = _490 + _564;
        float _568 = -_502;
        float _570 = _494 + _568;
        float _572 = fma(_342, _562, _500);
        float _574 = fma(_342, _566, _498);
        float _576 = -_146;
        float _578 = _140 + _576;
        float _580 = precise::clamp(_578, 0.0, 1.0);
        float _582 = -_516;
        float _584 = _508 + _582;
        float _586 = -_572;
        float _588 = _586 + _556;
        float _590 = -_514;
        float _592 = _506 + _590;
        float _594 = -_518;
        float _596 = _510 + _594;
        float _598 = fma(_400, _584, _516);
        float _600 = fma(_362, _588, _572);
        float _602 = -_530;
        float _604 = _522 + _602;
        float _606 = -_532;
        float _608 = _524 + _606;
        float _610 = -_534;
        float _612 = _526 + _610;
        float _614 = fma(_400, _592, _514);
        float _616 = fma(_400, _604, _530);
        float _618 = fma(_400, _608, _532);
        float _620 = fma(_342, _570, _502);
        float _622 = fma(_400, _596, _518);
        float _624 = fma(_400, _612, _534);
        float _626 = -_574;
        float _628 = _626 + _554;
        float _630 = -_616;
        float _632 = _630 + _614;
        float _634 = -_618;
        float _636 = _634 + _598;
        float _638 = -_620;
        float _640 = _638 + _558;
        float _642 = -_624;
        float _644 = _642 + _622;
        float _646 = fma(_362, _628, _574);
        float _648 = fma(_410, _632, _616);
        float _650 = fma(_410, _636, _618);
        float _652 = fma(_362, _640, _620);
        float _654 = fma(_410, _644, _624);
        float _656 = -_646;
        float _658 = _656 + _648;
        float _660 = -_600;
        float _662 = _660 + _650;
        float _664 = -_652;
        float _666 = _664 + _654;
        float _668 = fma(_580, _658, _646);
        float _670 = fma(_580, _662, _600);
        float _672 = fma(_580, _666, _652);
        float _674 = -_668;
        float _676 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].x, _674);
        float _678 = -_670;
        float _680 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].y, _678);
        float _682 = -_672;
        float _684 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].z, _682);
        float _686 = fma(_130, _676, _668);
        float _688 = fma(_130, _680, _670);
        float _690 = fma(_130, _684, _672);
        out.m_38.x = _686;
        out.m_38.y = _688;
        out.m_38.z = _690;
        out.m_38.w = _540;
        return out;
    }
    discard_fragment();
    return out;
}

