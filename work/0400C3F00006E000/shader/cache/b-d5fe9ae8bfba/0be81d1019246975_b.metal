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
};

static inline __attribute__((always_inline))
int _40(thread const int& _1580, thread const int& _1581, constant _10& support_buffer)
{
    int _1584 = 1 + _1581;
    float _1586 = support_buffer._m5[_1584].x;
    float _1588 = abs(_1586);
    bool _1590 = _1588 == 1.0;
    if (_1590)
    {
        return _1580;
    }
    float _1592 = float(_1580);
    float _1594 = _1592 / _1588;
    int _1596 = int(_1594);
    return _1596;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _708 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_708, float2(0.0), isnan(_708))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    bool _80 = _68 != 0.0;
    bool _82 = isnan(_68);
    bool _84 = _80 || _82;
    bool _86 = isnan(0.0);
    bool _88 = _84 || _86;
    bool _90 = !_88;
    if (!_90)
    {
        float _92 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _94 = fma(_68, _92, 1.0);
        float _96 = log2(_94);
        float _98 = _96 + (-1.0);
        float _100 = trunc(_98);
        int _102 = int(_100);
        float _104 = float(_102);
        float _106 = trunc(_104);
        int _108 = int(_106);
        float _110 = _104 + 1.0;
        float _112 = trunc(_110);
        int _114 = int(_112);
        int _116 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_108), spvDescriptorSet0.fp_t_tcb_A.get_height(_108)).x;
        int _118 = _116;
        int _120 = 1;
        int _122 = _40(_118, _120, (*spvDescriptorSet0.support_buffer));
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_108), spvDescriptorSet0.fp_t_tcb_A.get_height(_108)).y;
        int _126 = _124;
        int _128 = 1;
        int _130 = _40(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _40(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _40(_142, _144, (*spvDescriptorSet0.support_buffer));
        float _148 = float(_122);
        float _150 = float(_130);
        float _152 = 1.0 / _148;
        float _154 = fma(_60, _148, -0.5);
        float _156 = fma(_62, _150, -0.5);
        float _158 = floor(_154);
        float _160 = floor(_156);
        float _162 = float(_138);
        float _164 = float(_146);
        float _166 = fma(_60, _162, -0.5);
        float _168 = -_158;
        float _170 = _154 + _168;
        float _172 = 1.0 / _150;
        float _174 = fma(_62, _164, -0.5);
        float _176 = -_170;
        float _178 = _176 + 1.0;
        float _180 = -_170;
        float _182 = _180 + 2.0;
        float _184 = -_160;
        float _186 = _156 + _184;
        float _188 = floor(_166);
        float _190 = _178 * _178;
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = -_186;
        float _198 = _196 + 2.0;
        float _200 = _178 * _190;
        float _202 = _182 * _182;
        float _204 = _194 * _194;
        float _206 = floor(_174);
        float _208 = _200 * 4.0;
        float _210 = _194 * _204;
        float _212 = _198 * _198;
        float _214 = -_208;
        float _216 = fma(_182, _202, _214);
        float _218 = -_200;
        float _220 = _218 + 6.0;
        float _222 = _210 * 4.0;
        float _224 = -_188;
        float _226 = _166 + _224;
        float _228 = _200 + _216;
        float _230 = -_216;
        float _232 = _230 + _220;
        float _234 = -_222;
        float _236 = fma(_198, _212, _234);
        float _238 = -_226;
        float _240 = _238 + 1.0;
        float _242 = -_210;
        float _244 = _242 + 6.0;
        float _246 = _232 * 0.16666667163372039794921875;
        float _248 = -_226;
        float _250 = _248 + 2.0;
        float _252 = _240 * _240;
        float _254 = -_236;
        float _256 = _254 + _244;
        float _258 = -_206;
        float _260 = _174 + _258;
        float _262 = _250 * _250;
        float _264 = _240 * _252;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = -_260;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _246;
        float _274 = _264 * 4.0;
        float _276 = -_264;
        float _278 = _276 + 6.0;
        float _280 = _228 * 0.16666667163372039794921875;
        float _282 = _170 * _170;
        float _284 = -_274;
        float _286 = fma(_250, _262, _284);
        float _288 = _270 * _270;
        float _290 = -_260;
        float _292 = _290 + 2.0;
        float _294 = 1.0 / _280;
        float _296 = -_286;
        float _298 = _296 + _278;
        float _300 = _270 * _288;
        float _302 = _292 * _292;
        float _304 = _170 * _282;
        float _306 = _298 * 0.16666667163372039794921875;
        float _308 = _210 + _236;
        float _310 = _300 * 4.0;
        float _312 = 1.0 / _266;
        float _314 = -_300;
        float _316 = _314 + 6.0;
        float _318 = _308 * 0.16666667163372039794921875;
        float _320 = -_310;
        float _322 = fma(_292, _302, _320);
        float _324 = _158 + 1.5;
        float _326 = _304 * 0.16666667163372039794921875;
        float _328 = _264 + _286;
        float _330 = _216 * 0.16666667163372039794921875;
        float _332 = 1.0 / _318;
        float _334 = fma(_326, _272, _324);
        float _336 = _158 + (-0.5);
        float _338 = _186 * _186;
        float _340 = _328 * 0.16666667163372039794921875;
        float _342 = -_322;
        float _344 = _342 + _316;
        float _346 = _160 + 1.5;
        float _348 = _186 * _338;
        float _350 = fma(_330, _294, _336);
        float _352 = _300 + _322;
        float _354 = _160 + (-0.5);
        float _356 = 1.0 / _340;
        float _358 = _236 * 0.16666667163372039794921875;
        float _360 = _344 * 0.16666667163372039794921875;
        float _362 = _348 * 0.16666667163372039794921875;
        float _364 = _352 * 0.16666667163372039794921875;
        float _366 = fma(_358, _332, _354);
        float _368 = _226 * _226;
        float _370 = fma(_362, _312, _346);
        float _372 = 1.0 / _306;
        float _374 = _260 * _260;
        float _376 = _226 * _368;
        float _378 = _350 * _152;
        float _380 = _366 * _172;
        float _382 = _260 * _374;
        float _384 = _370 * _172;
        float _386 = _188 + (-0.5);
        float _388 = 1.0 / _162;
        float _390 = _286 * 0.16666667163372039794921875;
        float _392 = _188 + 1.5;
        float _394 = _376 * 0.16666667163372039794921875;
        float _396 = _206 + (-0.5);
        float _398 = fma(_390, _356, _386);
        float _400 = _322 * 0.16666667163372039794921875;
        float _402 = _334 * _152;
        float _404 = 1.0 / _364;
        float _406 = fma(_394, _372, _392);
        float _408 = _206 + 1.5;
        float _410 = _382 * 0.16666667163372039794921875;
        float _412 = 1.0 / _360;
        float _414 = _398 * _388;
        float _416 = _406 * _388;
        float _418 = 1.0 / _164;
        float _420 = fma(_400, _404, _396);
        float2 _1164 = float2(_378, _380);
        float3 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1164, float2(0.0), isnan(_1164)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1164, float2(0.0), isnan(_1164)), level(_104)).xyz;
        float _426 = _424.x;
        float _428 = _424.y;
        float _430 = _424.z;
        float _432 = fma(_410, _412, _408);
        float _434 = _420 * _418;
        float _436 = _432 * _418;
        float2 _1189 = float2(_402, _380);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1189, float2(0.0), isnan(_1189)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1189, float2(0.0), isnan(_1189)), level(_104)).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float2 _1204 = float2(_378, _384);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1204, float2(0.0), isnan(_1204)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1204, float2(0.0), isnan(_1204)), level(_104)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1219 = float2(_402, _384);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1219, float2(0.0), isnan(_1219)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1219, float2(0.0), isnan(_1219)), level(_104)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1234 = float2(_414, _434);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1234, float2(0.0), isnan(_1234)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1234, float2(0.0), isnan(_1234)), level(_110)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1249 = float2(_416, _434);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1249, float2(0.0), isnan(_1249)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1249, float2(0.0), isnan(_1249)), level(_110)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1264 = float2(_414, _436);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1264, float2(0.0), isnan(_1264)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1264, float2(0.0), isnan(_1264)), level(_110)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1279 = float2(_416, _436);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1279, float2(0.0), isnan(_1279)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1279, float2(0.0), isnan(_1279)), level(_110)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float _494 = precise::min(_72, _76);
        float _496 = -_104;
        float _498 = _98 + _496;
        float _500 = precise::clamp(_498, 0.0, 1.0);
        float _502 = 0.0 + _96;
        float _504 = precise::clamp(_502, 0.0, 1.0);
        float _506 = -_440;
        float _508 = _426 + _506;
        float _510 = -_442;
        float _512 = _428 + _510;
        float _514 = -_456;
        float _516 = _448 + _514;
        float _518 = -_444;
        float _520 = _430 + _518;
        float _522 = fma(_280, _508, _440);
        float _524 = -_458;
        float _526 = _450 + _524;
        float _528 = fma(_280, _516, _456);
        float _530 = fma(_280, _512, _442);
        float _532 = -_460;
        float _534 = _452 + _532;
        float _536 = fma(_280, _526, _458);
        float _538 = -_528;
        float _540 = _538 + _522;
        float _542 = -_472;
        float _544 = _464 + _542;
        float _546 = -_476;
        float _548 = _468 + _546;
        float _550 = -_490;
        float _552 = _482 + _550;
        float _554 = fma(_318, _540, _528);
        float _556 = -_474;
        float _558 = _466 + _556;
        float _560 = -_488;
        float _562 = _480 + _560;
        float _564 = fma(_340, _552, _490);
        float _566 = -_536;
        float _568 = _566 + _530;
        float _570 = fma(_340, _558, _474);
        float _572 = fma(_340, _544, _472);
        float _574 = fma(_340, _562, _488);
        float _576 = -_492;
        float _578 = _484 + _576;
        float _580 = -_564;
        float _582 = _580 + _570;
        float _584 = fma(_280, _520, _444);
        float _586 = fma(_280, _534, _460);
        float _588 = fma(_318, _568, _536);
        float _590 = fma(_340, _548, _476);
        float _592 = -_574;
        float _594 = _592 + _572;
        float _596 = fma(_340, _578, _492);
        float _598 = fma(_364, _582, _564);
        float _600 = -_586;
        float _602 = _600 + _584;
        float _604 = fma(_364, _594, _574);
        float _606 = -_596;
        float _608 = _606 + _590;
        float _610 = -_588;
        float _612 = _610 + _598;
        float _614 = fma(_318, _602, _586);
        float _616 = -_554;
        float _618 = _616 + _604;
        float _620 = fma(_364, _608, _596);
        float _622 = fma(_500, _612, _588);
        float _624 = fma(_500, _618, _554);
        float _626 = -_614;
        float _628 = _626 + _620;
        float _630 = _622 * 0.586600005626678466796875;
        float _632 = _494 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _634 = fma(_500, _628, _614);
        float _636 = fma(_624, 0.29890000820159912109375, _630);
        float _638 = fma(_634, 0.1143999993801116943359375, _636);
        float _640 = -_624;
        float _642 = _640 + _638;
        float _644 = -_622;
        float _646 = _644 + _638;
        float _648 = -_634;
        float _650 = _648 + _638;
        float _652 = fma(_632, _642, _624);
        float _654 = fma(_632, _646, _622);
        float _656 = fma(_632, _650, _634);
        float _658 = -_652;
        float _660 = fma(_652, (*spvDescriptorSet0.fp_c3)._m0[13].x, _658);
        float _662 = -_654;
        float _664 = fma(_654, (*spvDescriptorSet0.fp_c3)._m0[13].y, _662);
        float _666 = -_656;
        float _668 = fma(_656, (*spvDescriptorSet0.fp_c3)._m0[13].z, _666);
        float _670 = fma(_494, _660, _652);
        float _672 = fma(_494, _664, _654);
        float _674 = fma(_494, _668, _656);
        out.m_34.x = _670;
        out.m_34.y = _672;
        out.m_34.z = _674;
        out.m_34.w = _504;
        return out;
    }
    discard_fragment();
    return out;
}

