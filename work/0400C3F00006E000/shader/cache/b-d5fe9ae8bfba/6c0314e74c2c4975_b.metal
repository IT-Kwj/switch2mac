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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1618, thread const int& _1619, constant _10& support_buffer)
{
    int _1622 = 1 + _1619;
    float _1624 = support_buffer._m5[_1622].x;
    float _1626 = abs(_1624);
    bool _1628 = _1626 == 1.0;
    if (_1628)
    {
        return _1618;
    }
    float _1630 = float(_1618);
    float _1632 = _1630 / _1626;
    int _1634 = int(_1632);
    return _1634;
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
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _90);
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    bool _108 = _100 != 0.0;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = precise::min(_98, _104);
    bool _120 = !_116;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_100, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        float _134 = float(_132);
        float _136 = trunc(_134);
        int _138 = int(_136);
        float _140 = _134 + 1.0;
        float _142 = trunc(_140);
        int _144 = int(_142);
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _172 = _170;
        int _174 = 1;
        int _176 = _42(_172, _174, (*spvDescriptorSet0.support_buffer));
        float _178 = float(_152);
        float _180 = float(_160);
        float _182 = fma(_62, _178, -0.5);
        float _184 = fma(_64, _180, -0.5);
        float _186 = float(_168);
        float _188 = floor(_182);
        float _190 = float(_176);
        float _192 = fma(_62, _186, -0.5);
        float _194 = floor(_184);
        float _196 = -_188;
        float _198 = _182 + _196;
        float _200 = floor(_192);
        float _202 = _188 + 1.5;
        float _204 = _188 + (-0.5);
        float _206 = -_198;
        float _208 = _206 + 1.0;
        float _210 = -_198;
        float _212 = _210 + 2.0;
        float _214 = _208 * _208;
        float _216 = _212 * _212;
        float _218 = -_194;
        float _220 = _184 + _218;
        float _222 = 1.0 / _178;
        float _224 = _208 * _214;
        float _226 = -_220;
        float _228 = _226 + 1.0;
        float _230 = -_220;
        float _232 = _230 + 2.0;
        float _234 = _224 * 4.0;
        float _236 = _228 * _228;
        float _238 = 1.0 / _180;
        float _240 = -_234;
        float _242 = fma(_212, _216, _240);
        float _244 = -_224;
        float _246 = _244 + 6.0;
        float _248 = fma(_64, _190, -0.5);
        float _250 = -_242;
        float _252 = _250 + _246;
        float _254 = floor(_248);
        float _256 = _252 * 0.16666667163372039794921875;
        float _258 = _228 * _236;
        float _260 = _198 * _198;
        float _262 = _232 * _232;
        float _264 = _258 * 4.0;
        float _266 = 1.0 / _256;
        float _268 = _198 * _260;
        float _270 = -_200;
        float _272 = _192 + _270;
        float _274 = -_264;
        float _276 = fma(_232, _262, _274);
        float _278 = -_258;
        float _280 = _278 + 6.0;
        float _282 = _268 * 0.16666667163372039794921875;
        float _284 = -_272;
        float _286 = _284 + 1.0;
        float _288 = -_254;
        float _290 = _248 + _288;
        float _292 = -_276;
        float _294 = _292 + _280;
        float _296 = _286 * _286;
        float _298 = 1.0 / _186;
        float _300 = -_290;
        float _302 = _300 + 1.0;
        float _304 = _286 * _296;
        float _306 = fma(_282, _266, _202);
        float _308 = -_272;
        float _310 = _308 + 2.0;
        float _312 = _294 * 0.16666667163372039794921875;
        float _314 = _224 + _242;
        float _316 = _304 * 4.0;
        float _318 = _310 * _310;
        float _320 = _302 * _302;
        float _322 = _314 * 0.16666667163372039794921875;
        float _324 = 1.0 / _312;
        float _326 = -_316;
        float _328 = fma(_310, _318, _326);
        float _330 = _258 + _276;
        float _332 = _302 * _320;
        float _334 = -_304;
        float _336 = _334 + 6.0;
        float _338 = -_290;
        float _340 = _338 + 2.0;
        float _342 = _330 * 0.16666667163372039794921875;
        float _344 = _332 * 4.0;
        float _346 = 1.0 / _322;
        float _348 = _340 * _340;
        float _350 = -_328;
        float _352 = _350 + _336;
        float _354 = _304 + _328;
        float _356 = _242 * 0.16666667163372039794921875;
        float _358 = -_344;
        float _360 = fma(_340, _348, _358);
        float _362 = _220 * _220;
        float _364 = -_332;
        float _366 = _364 + 6.0;
        float _368 = 1.0 / _342;
        float _370 = _332 + _360;
        float _372 = _220 * _362;
        float _374 = _354 * 0.16666667163372039794921875;
        float _376 = _194 + (-0.5);
        float _378 = _194 + 1.5;
        float _380 = _276 * 0.16666667163372039794921875;
        float _382 = -_360;
        float _384 = _382 + _366;
        float _386 = fma(_356, _346, _204);
        float _388 = _372 * 0.16666667163372039794921875;
        float _390 = _370 * 0.16666667163372039794921875;
        float _392 = _352 * 0.16666667163372039794921875;
        float _394 = 1.0 / _374;
        float _396 = _384 * 0.16666667163372039794921875;
        float _398 = fma(_388, _324, _378);
        float _400 = _386 * _222;
        float _402 = fma(_380, _368, _376);
        float _404 = _272 * _272;
        float _406 = _290 * _290;
        float _408 = _328 * 0.16666667163372039794921875;
        float _410 = 1.0 / _390;
        float _412 = _272 * _404;
        float _414 = _290 * _406;
        float _416 = _200 + (-0.5);
        float _418 = _200 + 1.5;
        float _420 = _254 + (-0.5);
        float _422 = _360 * 0.16666667163372039794921875;
        float _424 = _306 * _222;
        float _426 = 1.0 / _392;
        float _428 = _412 * 0.16666667163372039794921875;
        float _430 = fma(_408, _394, _416);
        float _432 = _402 * _238;
        float _434 = _254 + 1.5;
        float _436 = _414 * 0.16666667163372039794921875;
        float _438 = _398 * _238;
        float _440 = _430 * _298;
        float _442 = 1.0 / _396;
        float _444 = fma(_422, _410, _420);
        float _446 = 1.0 / _190;
        float _448 = fma(_428, _426, _418);
        float _450 = _448 * _298;
        float _452 = fma(_436, _442, _434);
        float2 _1222 = float2(_400, _432);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1222, float2(0.0), isnan(_1222)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1222, float2(0.0), isnan(_1222)), level(_134)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1237 = float2(_424, _432);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1237, float2(0.0), isnan(_1237)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1237, float2(0.0), isnan(_1237)), level(_134)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1252 = float2(_400, _438);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1252, float2(0.0), isnan(_1252)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1252, float2(0.0), isnan(_1252)), level(_134)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = _444 * _446;
        float _482 = _452 * _446;
        float2 _1273 = float2(_424, _438);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1273, float2(0.0), isnan(_1273)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1273, float2(0.0), isnan(_1273)), level(_134)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1288 = float2(_440, _480);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1288, float2(0.0), isnan(_1288)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1288, float2(0.0), isnan(_1288)), level(_140)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1303 = float2(_450, _480);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1303, float2(0.0), isnan(_1303)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1303, float2(0.0), isnan(_1303)), level(_140)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1318 = float2(_440, _482);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1318, float2(0.0), isnan(_1318)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1318, float2(0.0), isnan(_1318)), level(_140)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1333 = float2(_450, _482);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1333, float2(0.0), isnan(_1333)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1333, float2(0.0), isnan(_1333)), level(_140)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float _524 = -_134;
        float _526 = _128 + _524;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        float _530 = 0.0 + _126;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = fma(_88, _532, _86);
        float _536 = _532 * _88;
        float _538 = -_466;
        float _540 = _458 + _538;
        float _542 = -_468;
        float _544 = _460 + _542;
        float _546 = -_470;
        float _548 = _462 + _546;
        float _550 = fma(_322, _540, _466);
        float _552 = fma(_322, _544, _468);
        float _554 = fma(_322, _548, _470);
        float _556 = -_486;
        float _558 = _474 + _556;
        float _560 = -_488;
        float _562 = _476 + _560;
        float _564 = -_490;
        float _566 = _478 + _564;
        float _568 = fma(_322, _558, _486);
        float _570 = fma(_322, _562, _488);
        float _572 = fma(_322, _566, _490);
        float _574 = -_568;
        float _576 = _574 + _550;
        float _578 = -_502;
        float _580 = _494 + _578;
        float _582 = -_504;
        float _584 = _496 + _582;
        float _586 = -_506;
        float _588 = _498 + _586;
        float _590 = -_522;
        float _592 = _514 + _590;
        float _594 = fma(_374, _580, _502);
        float _596 = fma(_374, _584, _504);
        float _598 = -_518;
        float _600 = _510 + _598;
        float _602 = -_520;
        float _604 = _512 + _602;
        float _606 = fma(_374, _588, _506);
        float _608 = fma(_374, _592, _522);
        float _610 = fma(_374, _600, _518);
        float _612 = fma(_374, _604, _520);
        float _614 = -_572;
        float _616 = _614 + _554;
        float _618 = -_608;
        float _620 = _618 + _606;
        float _622 = -_610;
        float _624 = _622 + _594;
        float _626 = -_612;
        float _628 = _626 + _596;
        float _630 = -_570;
        float _632 = _630 + _552;
        float _634 = fma(_342, _616, _572);
        float _636 = fma(_390, _620, _608);
        float _638 = fma(_342, _576, _568);
        float _640 = fma(_390, _624, _610);
        float _642 = fma(_390, _628, _612);
        float _644 = 1.0 / _534;
        float _646 = fma(_342, _632, _570);
        float _648 = -_634;
        float _650 = _648 + _636;
        float _652 = -_638;
        float _654 = _652 + _640;
        float _656 = -_646;
        float _658 = _656 + _642;
        float _660 = fma(_528, _650, _634);
        float _662 = fma(_528, _654, _638);
        float _664 = fma(_528, _658, _646);
        float _666 = -_660;
        float _668 = fma(_660, (*spvDescriptorSet0.fp_c3)._m0[13].z, _666);
        float _670 = -_662;
        float _672 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].x, _670);
        float _674 = -_664;
        float _676 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].y, _674);
        float _678 = fma(_118, _668, _660);
        float _680 = fma(_118, _672, _662);
        float _682 = _644 * _536;
        float _684 = fma(_118, _676, _664);
        float _686 = _678 * _536;
        float _688 = _680 * _682;
        float _690 = _684 * _682;
        float _692 = _686 * _644;
        out.m_36.x = _688;
        out.m_36.y = _690;
        out.m_36.z = _692;
        out.m_36.w = _534;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

