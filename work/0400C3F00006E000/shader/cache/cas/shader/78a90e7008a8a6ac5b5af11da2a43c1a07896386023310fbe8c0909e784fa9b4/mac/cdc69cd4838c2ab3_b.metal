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
int _42(thread const int& _1587, thread const int& _1588, constant _10& support_buffer)
{
    int _1591 = 1 + _1588;
    float _1593 = support_buffer._m5[_1591].x;
    float _1595 = abs(_1593);
    bool _1597 = _1595 == 1.0;
    if (_1597)
    {
        return _1587;
    }
    float _1599 = float(_1587);
    float _1601 = _1599 / _1595;
    int _1603 = int(_1601);
    return _1603;
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
    float2 _712 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712))).x;
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
    float _106 = _60 * _82;
    float _108 = _60 * _94;
    float _110 = precise::max(_104, _106);
    float _112 = _60 * _88;
    bool _114 = _110 != 0.0;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    bool _124 = !_122;
    if (!_124)
    {
        float _126 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _128 = fma(_110, _126, 1.0);
        float _130 = log2(_128);
        float _132 = _130 + (-1.0);
        float _134 = trunc(_132);
        int _136 = int(_134);
        float _138 = float(_136);
        float _140 = trunc(_138);
        int _142 = int(_140);
        float _144 = _138 + 1.0;
        float _146 = trunc(_144);
        int _148 = int(_146);
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).x;
        int _152 = _150;
        int _154 = 1;
        int _156 = _42(_152, _154, (*spvDescriptorSet0.support_buffer));
        int _158 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _160 = _158;
        int _162 = 1;
        int _164 = _42(_160, _162, (*spvDescriptorSet0.support_buffer));
        int _166 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).x;
        int _168 = _166;
        int _170 = 1;
        int _172 = _42(_168, _170, (*spvDescriptorSet0.support_buffer));
        int _174 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).y;
        int _176 = _174;
        int _178 = 1;
        int _180 = _42(_176, _178, (*spvDescriptorSet0.support_buffer));
        float _182 = float(_156);
        float _184 = float(_164);
        float _186 = 1.0 / _182;
        float _188 = fma(_62, _182, -0.5);
        float _190 = fma(_64, _184, -0.5);
        float _192 = floor(_188);
        float _194 = floor(_190);
        float _196 = float(_172);
        float _198 = float(_180);
        float _200 = fma(_62, _196, -0.5);
        float _202 = -_192;
        float _204 = _188 + _202;
        float _206 = fma(_64, _198, -0.5);
        float _208 = floor(_200);
        float _210 = -_204;
        float _212 = _210 + 1.0;
        float _214 = -_204;
        float _216 = _214 + 2.0;
        float _218 = -_194;
        float _220 = _190 + _218;
        float _222 = _212 * _212;
        float _224 = floor(_206);
        float _226 = -_220;
        float _228 = _226 + 1.0;
        float _230 = _212 * _222;
        float _232 = _216 * _216;
        float _234 = -_220;
        float _236 = _234 + 2.0;
        float _238 = _228 * _228;
        float _240 = _230 * 4.0;
        float _242 = 1.0 / _184;
        float _244 = _228 * _238;
        float _246 = -_240;
        float _248 = fma(_216, _232, _246);
        float _250 = -_230;
        float _252 = _250 + 6.0;
        float _254 = _236 * _236;
        float _256 = _244 * 4.0;
        float _258 = -_208;
        float _260 = _200 + _258;
        float _262 = -_248;
        float _264 = _262 + _252;
        float _266 = 1.0 / _196;
        float _268 = -_256;
        float _270 = fma(_236, _254, _268);
        float _272 = -_260;
        float _274 = _272 + 1.0;
        float _276 = _264 * 0.16666667163372039794921875;
        float _278 = -_244;
        float _280 = _278 + 6.0;
        float _282 = -_260;
        float _284 = _282 + 2.0;
        float _286 = _274 * _274;
        float _288 = _230 + _248;
        float _290 = -_270;
        float _292 = _290 + _280;
        float _294 = 1.0 / _276;
        float _296 = _274 * _286;
        float _298 = -_224;
        float _300 = _206 + _298;
        float _302 = _292 * 0.16666667163372039794921875;
        float _304 = _284 * _284;
        float _306 = _296 * 4.0;
        float _308 = -_300;
        float _310 = _308 + 1.0;
        float _312 = -_296;
        float _314 = _312 + 6.0;
        float _316 = _288 * 0.16666667163372039794921875;
        float _318 = -_306;
        float _320 = fma(_284, _304, _318);
        float _322 = _310 * _310;
        float _324 = -_300;
        float _326 = _324 + 2.0;
        float _328 = 1.0 / _316;
        float _330 = -_320;
        float _332 = _330 + _314;
        float _334 = _310 * _322;
        float _336 = _204 * _204;
        float _338 = _326 * _326;
        float _340 = _332 * 0.16666667163372039794921875;
        float _342 = _334 * 4.0;
        float _344 = _244 + _270;
        float _346 = _204 * _336;
        float _348 = 1.0 / _302;
        float _350 = -_342;
        float _352 = fma(_326, _338, _350);
        float _354 = _344 * 0.16666667163372039794921875;
        float _356 = _192 + 1.5;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = _192 + (-0.5);
        float _362 = _220 * _220;
        float _364 = -_334;
        float _366 = _364 + 6.0;
        float _368 = 1.0 / _354;
        float _370 = fma(_358, _294, _356);
        float _372 = _248 * 0.16666667163372039794921875;
        float _374 = _220 * _362;
        float _376 = _296 + _320;
        float _378 = -_352;
        float _380 = _378 + _366;
        float _382 = fma(_372, _328, _360);
        float _384 = _334 + _352;
        float _386 = _194 + (-0.5);
        float _388 = _194 + 1.5;
        float _390 = _374 * 0.16666667163372039794921875;
        float _392 = _376 * 0.16666667163372039794921875;
        float _394 = _380 * 0.16666667163372039794921875;
        float _396 = _384 * 0.16666667163372039794921875;
        float _398 = _270 * 0.16666667163372039794921875;
        float _400 = 1.0 / _392;
        float _402 = fma(_390, _348, _388);
        float _404 = _382 * _186;
        float _406 = fma(_398, _368, _386);
        float _408 = _260 * _260;
        float _410 = _300 * _300;
        float _412 = _370 * _186;
        float _414 = _320 * 0.16666667163372039794921875;
        float _416 = 1.0 / _340;
        float _418 = _260 * _408;
        float _420 = _300 * _410;
        float _422 = _208 + (-0.5);
        float _424 = _208 + 1.5;
        float _426 = _224 + (-0.5);
        float _428 = _418 * 0.16666667163372039794921875;
        float _430 = _352 * 0.16666667163372039794921875;
        float _432 = 1.0 / _396;
        float _434 = _406 * _242;
        float _436 = _224 + 1.5;
        float _438 = _420 * 0.16666667163372039794921875;
        float _440 = fma(_414, _400, _422);
        float _442 = _402 * _242;
        float _444 = 1.0 / _394;
        float _446 = fma(_428, _416, _424);
        float _448 = _440 * _266;
        float _450 = _446 * _266;
        float _452 = 1.0 / _198;
        float _454 = fma(_430, _432, _426);
        float _456 = fma(_438, _444, _436);
        float _458 = _454 * _452;
        float2 _1229 = float2(_404, _434);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_138)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1244 = float2(_412, _434);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_138)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1259 = float2(_404, _442);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_138)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float _486 = _456 * _452;
        float2 _1277 = float2(_412, _442);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1277, float2(0.0), isnan(_1277)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1277, float2(0.0), isnan(_1277)), level(_138)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float2 _1292 = float2(_448, _458);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1292, float2(0.0), isnan(_1292)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1292, float2(0.0), isnan(_1292)), level(_144)).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        float2 _1307 = float2(_450, _458);
        float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1307, float2(0.0), isnan(_1307)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1307, float2(0.0), isnan(_1307)), level(_144)).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        float2 _1322 = float2(_448, _486);
        float3 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1322, float2(0.0), isnan(_1322)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1322, float2(0.0), isnan(_1322)), level(_144)).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float2 _1337 = float2(_450, _486);
        float3 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1337, float2(0.0), isnan(_1337)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1337, float2(0.0), isnan(_1337)), level(_144)).xyz;
        float _522 = _520.x;
        float _524 = _520.y;
        float _526 = _520.z;
        float _528 = 0.0 + _130;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = fma(_108, _530, _112);
        float _534 = -_138;
        float _536 = _132 + _534;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = _530 * _108;
        float _542 = -_474;
        float _544 = _466 + _542;
        float _546 = -_472;
        float _548 = _464 + _546;
        float _550 = -_476;
        float _552 = _468 + _550;
        float _554 = -_490;
        float _556 = _480 + _554;
        float _558 = fma(_316, _548, _472);
        float _560 = -_494;
        float _562 = _484 + _560;
        float _564 = fma(_316, _552, _476);
        float _566 = fma(_316, _556, _490);
        float _568 = -_492;
        float _570 = _482 + _568;
        float _572 = -_508;
        float _574 = _500 + _572;
        float _576 = -_510;
        float _578 = _502 + _576;
        float _580 = fma(_316, _562, _494);
        float _582 = fma(_316, _570, _492);
        float _584 = -_526;
        float _586 = _518 + _584;
        float _588 = -_506;
        float _590 = _498 + _588;
        float _592 = fma(_392, _574, _508);
        float _594 = -_522;
        float _596 = _514 + _594;
        float _598 = -_524;
        float _600 = _516 + _598;
        float _602 = fma(_392, _578, _510);
        float _604 = fma(_392, _586, _526);
        float _606 = fma(_392, _590, _506);
        float _608 = fma(_392, _596, _522);
        float _610 = fma(_316, _544, _474);
        float _612 = -_566;
        float _614 = _612 + _558;
        float _616 = fma(_392, _600, _524);
        float _618 = -_580;
        float _620 = _618 + _564;
        float _622 = 1.0 / _532;
        float _624 = -_604;
        float _626 = _624 + _602;
        float _628 = fma(_354, _614, _566);
        float _630 = -_608;
        float _632 = _630 + _606;
        float _634 = -_582;
        float _636 = _634 + _610;
        float _638 = -_616;
        float _640 = _638 + _592;
        float _642 = fma(_354, _620, _580);
        float _644 = fma(_396, _626, _604);
        float _646 = fma(_396, _632, _608);
        float _648 = fma(_354, _636, _582);
        float _650 = fma(_396, _640, _616);
        float _652 = -_642;
        float _654 = _652 + _644;
        float _656 = -_628;
        float _658 = _656 + _646;
        float _660 = -_648;
        float _662 = _660 + _650;
        float _664 = fma(_538, _654, _642);
        float _666 = fma(_538, _658, _628);
        float _668 = _622 * _540;
        float _670 = fma(_538, _662, _648);
        float _672 = _664 * _540;
        float _674 = _666 * _668;
        float _676 = _670 * _668;
        float _678 = _672 * _622;
        out.m_34.x = _674;
        out.m_34.y = _676;
        out.m_34.z = _678;
        out.m_34.w = _532;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _112;
    return out;
}

