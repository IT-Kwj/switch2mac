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
int _40(thread const int& _1512, thread const int& _1513, constant _10& support_buffer)
{
    int _1516 = 1 + _1513;
    float _1518 = support_buffer._m5[_1516].x;
    float _1520 = abs(_1518);
    bool _1522 = _1520 == 1.0;
    if (_1522)
    {
        return _1512;
    }
    float _1524 = float(_1512);
    float _1526 = _1524 / _1520;
    int _1528 = int(_1526);
    return _1528;
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
    float2 _682 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_682, float2(0.0), isnan(_682))).x;
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
        float _184 = _170 * _170;
        float _186 = -_160;
        float _188 = _156 + _186;
        float _190 = floor(_166);
        float _192 = _178 * _178;
        float _194 = _182 * _182;
        float _196 = -_188;
        float _198 = _196 + 1.0;
        float _200 = -_188;
        float _202 = _200 + 2.0;
        float _204 = _178 * _192;
        float _206 = _170 * _184;
        float _208 = _198 * _198;
        float _210 = floor(_174);
        float _212 = _204 * 4.0;
        float _214 = _198 * _208;
        float _216 = _202 * _202;
        float _218 = -_212;
        float _220 = fma(_182, _194, _218);
        float _222 = -_204;
        float _224 = _222 + 6.0;
        float _226 = _214 * 4.0;
        float _228 = -_190;
        float _230 = _166 + _228;
        float _232 = _204 + _220;
        float _234 = -_220;
        float _236 = _234 + _224;
        float _238 = -_226;
        float _240 = fma(_202, _216, _238);
        float _242 = -_230;
        float _244 = _242 + 1.0;
        float _246 = -_214;
        float _248 = _246 + 6.0;
        float _250 = _236 * 0.16666667163372039794921875;
        float _252 = -_230;
        float _254 = _252 + 2.0;
        float _256 = _244 * _244;
        float _258 = -_210;
        float _260 = _174 + _258;
        float _262 = -_240;
        float _264 = _262 + _248;
        float _266 = _254 * _254;
        float _268 = _244 * _256;
        float _270 = -_260;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _250;
        float _276 = _264 * 0.16666667163372039794921875;
        float _278 = _268 * 4.0;
        float _280 = -_260;
        float _282 = _280 + 2.0;
        float _284 = _232 * 0.16666667163372039794921875;
        float _286 = -_278;
        float _288 = fma(_254, _266, _286);
        float _290 = -_268;
        float _292 = _290 + 6.0;
        float _294 = _272 * _272;
        float _296 = 1.0 / _276;
        float _298 = _268 + _288;
        float _300 = -_288;
        float _302 = _300 + _292;
        float _304 = _272 * _294;
        float _306 = _282 * _282;
        float _308 = _298 * 0.16666667163372039794921875;
        float _310 = _302 * 0.16666667163372039794921875;
        float _312 = _304 * 4.0;
        float _314 = 1.0 / _284;
        float _316 = _214 + _240;
        float _318 = -_304;
        float _320 = _318 + 6.0;
        float _322 = -_312;
        float _324 = fma(_282, _306, _322);
        float _326 = _158 + 1.5;
        float _328 = _316 * 0.16666667163372039794921875;
        float _330 = _206 * 0.16666667163372039794921875;
        float _332 = -_324;
        float _334 = _332 + _320;
        float _336 = _304 + _324;
        float _338 = 1.0 / _328;
        float _340 = fma(_330, _274, _326);
        float _342 = _334 * 0.16666667163372039794921875;
        float _344 = _158 + (-0.5);
        float _346 = _188 * _188;
        float _348 = _220 * 0.16666667163372039794921875;
        float _350 = _240 * 0.16666667163372039794921875;
        float _352 = _188 * _346;
        float _354 = fma(_348, _314, _344);
        float _356 = _160 + (-0.5);
        float _358 = 1.0 / _308;
        float _360 = _160 + 1.5;
        float _362 = _352 * 0.16666667163372039794921875;
        float _364 = _336 * 0.16666667163372039794921875;
        float _366 = fma(_350, _338, _356);
        float _368 = _230 * _230;
        float _370 = fma(_362, _296, _360);
        float _372 = 1.0 / _310;
        float _374 = _260 * _260;
        float _376 = _354 * _152;
        float _378 = _230 * _368;
        float _380 = _366 * _172;
        float _382 = _340 * _152;
        float _384 = _370 * _172;
        float _386 = _260 * _374;
        float _388 = 1.0 / _342;
        float _390 = _190 + (-0.5);
        float _392 = _210 + (-0.5);
        float _394 = _210 + 1.5;
        float _396 = _288 * 0.16666667163372039794921875;
        float _398 = _190 + 1.5;
        float _400 = _378 * 0.16666667163372039794921875;
        float _402 = _386 * 0.16666667163372039794921875;
        float _404 = 1.0 / _162;
        float _406 = fma(_396, _358, _390);
        float _408 = fma(_400, _372, _398);
        float _410 = _324 * 0.16666667163372039794921875;
        float _412 = 1.0 / _364;
        float _414 = fma(_402, _388, _394);
        float _416 = 1.0 / _164;
        float _418 = _406 * _404;
        float _420 = _408 * _404;
        float _422 = fma(_410, _412, _392);
        float2 _1142 = float2(_376, _380);
        float3 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1142, float2(0.0), isnan(_1142)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1142, float2(0.0), isnan(_1142)), level(_104)).xyz;
        float _428 = _426.x;
        float _430 = _426.y;
        float _432 = _426.z;
        float _434 = _422 * _416;
        float _436 = _414 * _416;
        float2 _1163 = float2(_382, _380);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1163, float2(0.0), isnan(_1163)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1163, float2(0.0), isnan(_1163)), level(_104)).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float2 _1178 = float2(_376, _384);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1178, float2(0.0), isnan(_1178)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1178, float2(0.0), isnan(_1178)), level(_104)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1193 = float2(_382, _384);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1193, float2(0.0), isnan(_1193)), level(_104)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1193, float2(0.0), isnan(_1193)), level(_104)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1208 = float2(_418, _434);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1208, float2(0.0), isnan(_1208)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1208, float2(0.0), isnan(_1208)), level(_110)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1223 = float2(_420, _434);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1223, float2(0.0), isnan(_1223)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1223, float2(0.0), isnan(_1223)), level(_110)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1238 = float2(_418, _436);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1238, float2(0.0), isnan(_1238)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1238, float2(0.0), isnan(_1238)), level(_110)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1253 = float2(_420, _436);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1253, float2(0.0), isnan(_1253)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1253, float2(0.0), isnan(_1253)), level(_110)).xyz;
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
        float _508 = _428 + _506;
        float _510 = -_442;
        float _512 = _430 + _510;
        float _514 = -_456;
        float _516 = _448 + _514;
        float _518 = -_460;
        float _520 = _452 + _518;
        float _522 = fma(_284, _508, _440);
        float _524 = -_458;
        float _526 = _450 + _524;
        float _528 = fma(_284, _512, _442);
        float _530 = fma(_284, _516, _456);
        float _532 = -_444;
        float _534 = _432 + _532;
        float _536 = fma(_284, _526, _458);
        float _538 = -_530;
        float _540 = _538 + _522;
        float _542 = -_474;
        float _544 = _466 + _542;
        float _546 = -_536;
        float _548 = _546 + _528;
        float _550 = -_472;
        float _552 = _464 + _550;
        float _554 = -_488;
        float _556 = _480 + _554;
        float _558 = -_476;
        float _560 = _468 + _558;
        float _562 = fma(_328, _548, _536);
        float _564 = fma(_308, _544, _474);
        float _566 = -_490;
        float _568 = _482 + _566;
        float _570 = -_492;
        float _572 = _484 + _570;
        float _574 = fma(_308, _552, _472);
        float _576 = fma(_308, _556, _488);
        float _578 = fma(_308, _568, _490);
        float _580 = fma(_284, _534, _444);
        float _582 = fma(_284, _520, _460);
        float _584 = fma(_308, _560, _476);
        float _586 = fma(_308, _572, _492);
        float _588 = -_576;
        float _590 = _588 + _574;
        float _592 = -_578;
        float _594 = _592 + _564;
        float _596 = -_582;
        float _598 = _596 + _580;
        float _600 = -_586;
        float _602 = _600 + _584;
        float _604 = fma(_328, _540, _530);
        float _606 = fma(_364, _590, _576);
        float _608 = fma(_364, _594, _578);
        float _610 = fma(_328, _598, _582);
        float _612 = fma(_364, _602, _586);
        float _614 = -_604;
        float _616 = _614 + _606;
        float _618 = -_562;
        float _620 = _618 + _608;
        float _622 = -_610;
        float _624 = _622 + _612;
        float _626 = fma(_500, _616, _604);
        float _628 = fma(_500, _620, _562);
        float _630 = fma(_500, _624, _610);
        float _632 = -_626;
        float _634 = fma(_626, (*spvDescriptorSet0.fp_c3)._m0[13].x, _632);
        float _636 = -_628;
        float _638 = fma(_628, (*spvDescriptorSet0.fp_c3)._m0[13].y, _636);
        float _640 = -_630;
        float _642 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[13].z, _640);
        float _644 = fma(_494, _634, _626);
        float _646 = fma(_494, _638, _628);
        float _648 = fma(_494, _642, _630);
        out.m_34.x = _644;
        out.m_34.y = _646;
        out.m_34.z = _648;
        out.m_34.w = _504;
        return out;
    }
    discard_fragment();
    return out;
}

