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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1629, thread const int& _1630, constant _10& support_buffer)
{
    int _1633 = 1 + _1630;
    float _1635 = support_buffer._m5[_1633].x;
    float _1637 = abs(_1635);
    bool _1639 = _1637 == 1.0;
    if (_1639)
    {
        return _1629;
    }
    float _1641 = float(_1629);
    float _1643 = _1641 / _1637;
    int _1645 = int(_1643);
    return _1645;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _726 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_98, _102);
    float _106 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _60 * _82;
    float _112 = precise::max(_104, _110);
    float _114 = _60 * _88;
    bool _116 = _112 != 0.0;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _60 * _94;
    float _132 = precise::min(_108, _128);
    bool _134 = !_124;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_112, _136, 1.0);
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
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        int _176 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).x;
        int _178 = _176;
        int _180 = 1;
        int _182 = _42(_178, _180, (*spvDescriptorSet0.support_buffer));
        int _184 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_158), spvDescriptorSet0.fp_t_tcb_A.get_height(_158)).y;
        int _186 = _184;
        int _188 = 1;
        int _190 = _42(_186, _188, (*spvDescriptorSet0.support_buffer));
        float _192 = float(_166);
        float _194 = float(_174);
        float _196 = 1.0 / _192;
        float _198 = fma(_62, _192, -0.5);
        float _200 = fma(_64, _194, -0.5);
        float _202 = floor(_198);
        float _204 = float(_182);
        float _206 = float(_190);
        float _208 = fma(_62, _204, -0.5);
        float _210 = floor(_200);
        float _212 = -_202;
        float _214 = _198 + _212;
        float _216 = 1.0 / _194;
        float _218 = _202 + (-0.5);
        float _220 = -_214;
        float _222 = _220 + 1.0;
        float _224 = -_214;
        float _226 = _224 + 2.0;
        float _228 = _222 * _222;
        float _230 = _226 * _226;
        float _232 = -_210;
        float _234 = _200 + _232;
        float _236 = floor(_208);
        float _238 = _222 * _228;
        float _240 = fma(_64, _206, -0.5);
        float _242 = -_234;
        float _244 = _242 + 1.0;
        float _246 = _214 * _214;
        float _248 = _238 * 4.0;
        float _250 = -_238;
        float _252 = _250 + 6.0;
        float _254 = _244 * _244;
        float _256 = 1.0 / _206;
        float _258 = -_248;
        float _260 = fma(_226, _230, _258);
        float _262 = -_234;
        float _264 = _262 + 2.0;
        float _266 = _244 * _254;
        float _268 = -_260;
        float _270 = _268 + _252;
        float _272 = _264 * _264;
        float _274 = _266 * 4.0;
        float _276 = floor(_240);
        float _278 = _270 * 0.16666667163372039794921875;
        float _280 = _214 * _246;
        float _282 = -_236;
        float _284 = _208 + _282;
        float _286 = -_274;
        float _288 = fma(_264, _272, _286);
        float _290 = -_266;
        float _292 = _290 + 6.0;
        float _294 = _202 + 1.5;
        float _296 = -_284;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _278;
        float _302 = _280 * 0.16666667163372039794921875;
        float _304 = -_288;
        float _306 = _304 + _292;
        float _308 = -_276;
        float _310 = _240 + _308;
        float _312 = _298 * _298;
        float _314 = 1.0 / _204;
        float _316 = -_310;
        float _318 = _316 + 2.0;
        float _320 = _298 * _312;
        float _322 = _306 * 0.16666667163372039794921875;
        float _324 = fma(_302, _300, _294);
        float _326 = -_310;
        float _328 = _326 + 1.0;
        float _330 = -_284;
        float _332 = _330 + 2.0;
        float _334 = _320 * 4.0;
        float _336 = _238 + _260;
        float _338 = _328 * _328;
        float _340 = _332 * _332;
        float _342 = 1.0 / _322;
        float _344 = _336 * 0.16666667163372039794921875;
        float _346 = _328 * _338;
        float _348 = -_334;
        float _350 = fma(_332, _340, _348);
        float _352 = _266 + _288;
        float _354 = _318 * _318;
        float _356 = _346 * 4.0;
        float _358 = -_320;
        float _360 = _358 + 6.0;
        float _362 = 1.0 / _344;
        float _364 = _352 * 0.16666667163372039794921875;
        float _366 = -_356;
        float _368 = fma(_318, _354, _366);
        float _370 = -_346;
        float _372 = _370 + 6.0;
        float _374 = _320 + _350;
        float _376 = _260 * 0.16666667163372039794921875;
        float _378 = -_350;
        float _380 = _378 + _360;
        float _382 = -_368;
        float _384 = _382 + _372;
        float _386 = 1.0 / _364;
        float _388 = _346 + _368;
        float _390 = _380 * 0.16666667163372039794921875;
        float _392 = _384 * 0.16666667163372039794921875;
        float _394 = _234 * _234;
        float _396 = _288 * 0.16666667163372039794921875;
        float _398 = _350 * 0.16666667163372039794921875;
        float _400 = _234 * _394;
        float _402 = _374 * 0.16666667163372039794921875;
        float _404 = fma(_376, _362, _218);
        float _406 = _210 + (-0.5);
        float _408 = _210 + 1.5;
        float _410 = 1.0 / _402;
        float _412 = _388 * 0.16666667163372039794921875;
        float _414 = _400 * 0.16666667163372039794921875;
        float _416 = fma(_396, _386, _406);
        float _418 = _284 * _284;
        float _420 = _404 * _196;
        float _422 = fma(_414, _342, _408);
        float _424 = _310 * _310;
        float _426 = 1.0 / _412;
        float _428 = _324 * _196;
        float _430 = _284 * _418;
        float _432 = _416 * _216;
        float _434 = _236 + (-0.5);
        float _436 = _310 * _424;
        float _438 = _422 * _216;
        float _440 = _236 + 1.5;
        float _442 = 1.0 / _390;
        float _444 = _276 + (-0.5);
        float _446 = _368 * 0.16666667163372039794921875;
        float _448 = fma(_398, _410, _434);
        float _450 = _276 + 1.5;
        float _452 = _430 * 0.16666667163372039794921875;
        float _454 = _436 * 0.16666667163372039794921875;
        float _456 = 1.0 / _392;
        float _458 = fma(_446, _426, _444);
        float _460 = _448 * _314;
        float2 _1248 = float2(_420, _432);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_148)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1263 = float2(_428, _432);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_148)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = fma(_452, _442, _440);
        float _482 = _480 * _314;
        float _484 = fma(_454, _456, _450);
        float _486 = _458 * _256;
        float _488 = _484 * _256;
        float2 _1295 = float2(_420, _438);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1295, float2(0.0), isnan(_1295)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1295, float2(0.0), isnan(_1295)), level(_148)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1310 = float2(_428, _438);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1310, float2(0.0), isnan(_1310)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1310, float2(0.0), isnan(_1310)), level(_148)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1325 = float2(_460, _486);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1325, float2(0.0), isnan(_1325)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1325, float2(0.0), isnan(_1325)), level(_154)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1340 = float2(_482, _486);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1340, float2(0.0), isnan(_1340)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1340, float2(0.0), isnan(_1340)), level(_154)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float2 _1355 = float2(_460, _488);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1355, float2(0.0), isnan(_1355)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1355, float2(0.0), isnan(_1355)), level(_154)).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float2 _1370 = float2(_482, _488);
        float3 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1370, float2(0.0), isnan(_1370)), level(_154)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1370, float2(0.0), isnan(_1370)), level(_154)).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        float _538 = 0.0 + _140;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = fma(_130, _540, _114);
        float _544 = -_474;
        float _546 = _466 + _544;
        float _548 = -_476;
        float _550 = _468 + _548;
        float _552 = -_478;
        float _554 = _470 + _552;
        float _556 = fma(_344, _546, _474);
        float _558 = fma(_344, _550, _476);
        float _560 = fma(_344, _554, _478);
        float _562 = -_502;
        float _564 = _494 + _562;
        float _566 = -_500;
        float _568 = _492 + _566;
        float _570 = -_504;
        float _572 = _496 + _570;
        float _574 = fma(_344, _564, _502);
        float _576 = fma(_344, _568, _500);
        float _578 = -_148;
        float _580 = _142 + _578;
        float _582 = precise::clamp(_580, 0.0, 1.0);
        float _584 = -_518;
        float _586 = _510 + _584;
        float _588 = -_574;
        float _590 = _588 + _558;
        float _592 = -_516;
        float _594 = _508 + _592;
        float _596 = -_520;
        float _598 = _512 + _596;
        float _600 = fma(_402, _586, _518);
        float _602 = fma(_364, _590, _574);
        float _604 = -_532;
        float _606 = _524 + _604;
        float _608 = -_534;
        float _610 = _526 + _608;
        float _612 = -_536;
        float _614 = _528 + _612;
        float _616 = fma(_402, _594, _516);
        float _618 = fma(_402, _606, _532);
        float _620 = fma(_402, _610, _534);
        float _622 = fma(_344, _572, _504);
        float _624 = fma(_402, _598, _520);
        float _626 = fma(_402, _614, _536);
        float _628 = -_576;
        float _630 = _628 + _556;
        float _632 = -_618;
        float _634 = _632 + _616;
        float _636 = -_620;
        float _638 = _636 + _600;
        float _640 = -_622;
        float _642 = _640 + _560;
        float _644 = -_626;
        float _646 = _644 + _624;
        float _648 = fma(_364, _630, _576);
        float _650 = fma(_412, _634, _618);
        float _652 = fma(_412, _638, _620);
        float _654 = fma(_364, _642, _622);
        float _656 = fma(_412, _646, _626);
        float _658 = -_648;
        float _660 = _658 + _650;
        float _662 = -_602;
        float _664 = _662 + _652;
        float _666 = -_654;
        float _668 = _666 + _656;
        float _670 = fma(_582, _660, _648);
        float _672 = fma(_582, _664, _602);
        float _674 = fma(_582, _668, _654);
        float _676 = -_670;
        float _678 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].x, _676);
        float _680 = -_672;
        float _682 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].y, _680);
        float _684 = -_674;
        float _686 = fma(_674, (*spvDescriptorSet0.fp_c3)._m0[13].z, _684);
        float _688 = fma(_132, _678, _670);
        float _690 = fma(_132, _682, _672);
        float _692 = fma(_132, _686, _674);
        out.m_34.x = _688;
        out.m_34.y = _690;
        out.m_34.z = _692;
        out.m_34.w = _542;
        return out;
    }
    discard_fragment();
    return out;
}

