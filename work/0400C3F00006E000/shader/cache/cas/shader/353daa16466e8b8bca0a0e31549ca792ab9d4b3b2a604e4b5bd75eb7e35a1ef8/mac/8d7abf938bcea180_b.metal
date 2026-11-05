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
int _42(thread const int& _1625, thread const int& _1626, constant _10& support_buffer)
{
    int _1629 = 1 + _1626;
    float _1631 = support_buffer._m5[_1629].x;
    float _1633 = abs(_1631);
    bool _1635 = _1633 == 1.0;
    if (_1635)
    {
        return _1625;
    }
    float _1637 = float(_1625);
    float _1639 = _1637 / _1633;
    int _1641 = int(_1639);
    return _1641;
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
    float2 _724 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::max(_92, _96);
    float _100 = _60 * _76;
    float _102 = precise::max(_98, _100);
    float _104 = _60 * _82;
    float _106 = _60 * _88;
    bool _108 = _102 != 0.0;
    bool _110 = isnan(_102);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    bool _118 = !_116;
    if (!_118)
    {
        float _120 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _122 = fma(_102, _120, 1.0);
        float _124 = log2(_122);
        float _126 = _124 + (-1.0);
        float _128 = trunc(_126);
        int _130 = int(_128);
        float _132 = float(_130);
        float _134 = trunc(_132);
        int _136 = int(_134);
        float _138 = _132 + 1.0;
        float _140 = trunc(_138);
        int _142 = int(_140);
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _154 = _152;
        int _156 = 1;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).x;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _170 = _168;
        int _172 = 1;
        int _174 = _42(_170, _172, (*spvDescriptorSet0.support_buffer));
        float _176 = float(_150);
        float _178 = float(_158);
        float _180 = 1.0 / _176;
        float _182 = fma(_62, _176, -0.5);
        float _184 = fma(_64, _178, -0.5);
        float _186 = floor(_182);
        float _188 = float(_166);
        float _190 = float(_174);
        float _192 = fma(_62, _188, -0.5);
        float _194 = floor(_184);
        float _196 = fma(_64, _190, -0.5);
        float _198 = -_186;
        float _200 = _182 + _198;
        float _202 = floor(_192);
        float _204 = -_200;
        float _206 = _204 + 1.0;
        float _208 = -_200;
        float _210 = _208 + 2.0;
        float _212 = -_194;
        float _214 = _184 + _212;
        float _216 = _206 * _206;
        float _218 = floor(_196);
        float _220 = _210 * _210;
        float _222 = -_214;
        float _224 = _222 + 1.0;
        float _226 = _206 * _216;
        float _228 = -_214;
        float _230 = _228 + 2.0;
        float _232 = _194 + (-0.5);
        float _234 = _224 * _224;
        float _236 = _226 * 4.0;
        float _238 = _194 + 1.5;
        float _240 = 1.0 / _178;
        float _242 = _224 * _234;
        float _244 = -_202;
        float _246 = _192 + _244;
        float _248 = -_236;
        float _250 = fma(_210, _220, _248);
        float _252 = _230 * _230;
        float _254 = _242 * 4.0;
        float _256 = -_246;
        float _258 = _256 + 1.0;
        float _260 = -_226;
        float _262 = _260 + 6.0;
        float _264 = -_246;
        float _266 = _264 + 2.0;
        float _268 = -_254;
        float _270 = fma(_230, _252, _268);
        float _272 = -_242;
        float _274 = _272 + 6.0;
        float _276 = _258 * _258;
        float _278 = -_218;
        float _280 = _196 + _278;
        float _282 = -_250;
        float _284 = _282 + _262;
        float _286 = -_270;
        float _288 = _286 + _274;
        float _290 = _258 * _276;
        float _292 = -_280;
        float _294 = _292 + 1.0;
        float _296 = _226 + _250;
        float _298 = _288 * 0.16666667163372039794921875;
        float _300 = _266 * _266;
        float _302 = _290 * 4.0;
        float _304 = _284 * 0.16666667163372039794921875;
        float _306 = _296 * 0.16666667163372039794921875;
        float _308 = 1.0 / _188;
        float _310 = -_302;
        float _312 = fma(_266, _300, _310);
        float _314 = _294 * _294;
        float _316 = -_290;
        float _318 = _316 + 6.0;
        float _320 = _294 * _314;
        float _322 = -_312;
        float _324 = _322 + _318;
        float _326 = 1.0 / _304;
        float _328 = _200 * _200;
        float _330 = _320 * 4.0;
        float _332 = _242 + _270;
        float _334 = _324 * 0.16666667163372039794921875;
        float _336 = _200 * _328;
        float _338 = _186 + 1.5;
        float _340 = _270 * 0.16666667163372039794921875;
        float _342 = 1.0 / _306;
        float _344 = -_280;
        float _346 = _344 + 2.0;
        float _348 = _346 * _346;
        float _350 = 1.0 / _298;
        float _352 = -_330;
        float _354 = fma(_346, _348, _352);
        float _356 = _332 * 0.16666667163372039794921875;
        float _358 = -_320;
        float _360 = _358 + 6.0;
        float _362 = _336 * 0.16666667163372039794921875;
        float _364 = _290 + _312;
        float _366 = -_354;
        float _368 = _366 + _360;
        float _370 = 1.0 / _356;
        float _372 = fma(_362, _326, _338);
        float _374 = _214 * _214;
        float _376 = _368 * 0.16666667163372039794921875;
        float _378 = _186 + (-0.5);
        float _380 = _250 * 0.16666667163372039794921875;
        float _382 = _214 * _374;
        float _384 = _320 + _354;
        float _386 = 1.0 / _334;
        float _388 = _364 * 0.16666667163372039794921875;
        float _390 = fma(_380, _342, _378);
        float _392 = _384 * 0.16666667163372039794921875;
        float _394 = _354 * 0.16666667163372039794921875;
        float _396 = 1.0 / _388;
        float _398 = _382 * 0.16666667163372039794921875;
        float _400 = fma(_398, _350, _238);
        float _402 = fma(_340, _370, _232);
        float _404 = _390 * _180;
        float _406 = 1.0 / _392;
        float _408 = _372 * _180;
        float _410 = _246 * _246;
        float _412 = _280 * _280;
        float _414 = _202 + (-0.5);
        float _416 = _402 * _240;
        float _418 = _246 * _410;
        float _420 = _280 * _412;
        float _422 = 1.0 / _376;
        float _424 = _202 + 1.5;
        float _426 = _312 * 0.16666667163372039794921875;
        float _428 = _418 * 0.16666667163372039794921875;
        float _430 = _218 + (-0.5);
        float _432 = _400 * _240;
        float _434 = fma(_426, _396, _414);
        float _436 = fma(_428, _386, _424);
        float _438 = 1.0 / _190;
        float _440 = _218 + 1.5;
        float _442 = _420 * 0.16666667163372039794921875;
        float _444 = fma(_394, _406, _430);
        float _446 = _434 * _308;
        float _448 = _436 * _308;
        float _450 = fma(_442, _422, _440);
        float2 _1227 = float2(_404, _416);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1227, float2(0.0), isnan(_1227)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1227, float2(0.0), isnan(_1227)), level(_132)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = _444 * _438;
        float _464 = _450 * _438;
        float2 _1248 = float2(_408, _416);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_132)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1263 = float2(_404, _432);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_132)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1278 = float2(_408, _432);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_132)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1293 = float2(_446, _462);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_138)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1308 = float2(_448, _462);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_138)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1323 = float2(_446, _464);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_138)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1338 = float2(_448, _464);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1338, float2(0.0), isnan(_1338)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1338, float2(0.0), isnan(_1338)), level(_138)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float _522 = -_132;
        float _524 = _126 + _522;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        float _528 = -_468;
        float _530 = _456 + _528;
        float _532 = -_470;
        float _534 = _458 + _532;
        float _536 = -_484;
        float _538 = _476 + _536;
        float _540 = -_472;
        float _542 = _460 + _540;
        float _544 = fma(_306, _530, _468);
        float _546 = -_486;
        float _548 = _478 + _546;
        float _550 = fma(_306, _538, _484);
        float _552 = -_488;
        float _554 = _480 + _552;
        float _556 = fma(_306, _534, _470);
        float _558 = fma(_306, _548, _486);
        float _560 = -_500;
        float _562 = _492 + _560;
        float _564 = fma(_306, _554, _488);
        float _566 = -_504;
        float _568 = _496 + _566;
        float _570 = -_558;
        float _572 = _570 + _556;
        float _574 = -_502;
        float _576 = _494 + _574;
        float _578 = -_516;
        float _580 = _508 + _578;
        float _582 = -_520;
        float _584 = _512 + _582;
        float _586 = fma(_356, _572, _558);
        float _588 = fma(_388, _576, _502);
        float _590 = -_518;
        float _592 = _510 + _590;
        float _594 = fma(_388, _562, _500);
        float _596 = fma(_388, _568, _504);
        float _598 = fma(_388, _580, _516);
        float _600 = fma(_388, _592, _518);
        float _602 = fma(_306, _542, _472);
        float _604 = fma(_388, _584, _520);
        float _606 = -_550;
        float _608 = _606 + _544;
        float _610 = -_598;
        float _612 = _610 + _594;
        float _614 = -_564;
        float _616 = _614 + _602;
        float _618 = -_600;
        float _620 = _618 + _588;
        float _622 = -_604;
        float _624 = _622 + _596;
        float _626 = fma(_356, _608, _550);
        float _628 = fma(_392, _612, _598);
        float _630 = 0.0 + _124;
        float _632 = precise::clamp(_630, 0.0, 1.0);
        float _634 = fma(_356, _616, _564);
        float _636 = fma(_392, _620, _600);
        float _638 = fma(_392, _624, _604);
        float _640 = -_626;
        float _642 = _640 + _628;
        float _644 = fma(_106, _632, _104);
        float _646 = -_586;
        float _648 = _646 + _636;
        float _650 = -_634;
        float _652 = _650 + _638;
        float _654 = fma(_526, _642, _626);
        float _656 = 1.0 / _644;
        float _658 = fma(_526, _648, _586);
        float _660 = fma(_526, _652, _634);
        float _662 = _632 * _654;
        float _664 = _632 * _658;
        float _666 = _632 * _660;
        float _668 = -_662;
        float _670 = _668 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _672 = -_664;
        float _674 = _672 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _676 = -_666;
        float _678 = _676 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _680 = fma(_104, _670, _662);
        float _682 = fma(_104, _674, _664);
        float _684 = fma(_104, _678, _666);
        float _686 = _680 * _656;
        float _688 = _682 * _656;
        float _690 = _684 * _656;
        out.m_34.x = _686;
        out.m_34.y = _688;
        out.m_34.z = _690;
        out.m_34.w = _644;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _104;
    return out;
}

