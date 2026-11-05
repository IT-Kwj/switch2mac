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
int _42(thread const int& _1570, thread const int& _1571, constant _10& support_buffer)
{
    int _1574 = 1 + _1571;
    float _1576 = support_buffer._m5[_1574].x;
    float _1578 = abs(_1576);
    bool _1580 = _1578 == 1.0;
    if (_1580)
    {
        return _1570;
    }
    float _1582 = float(_1570);
    float _1584 = _1582 / _1578;
    int _1586 = int(_1584);
    return _1586;
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
    float2 _706 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
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
    float _100 = _60 * _82;
    float _102 = _60 * _88;
    float _104 = _60 * _94;
    float _106 = precise::max(_98, _100);
    bool _108 = _106 != 0.0;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    bool _118 = !_116;
    if (!_118)
    {
        float _120 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _122 = fma(_106, _120, 1.0);
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
        float _188 = floor(_184);
        float _190 = float(_166);
        float _192 = float(_174);
        float _194 = fma(_62, _190, -0.5);
        float _196 = -_186;
        float _198 = _182 + _196;
        float _200 = fma(_64, _192, -0.5);
        float _202 = floor(_194);
        float _204 = -_198;
        float _206 = _204 + 1.0;
        float _208 = -_198;
        float _210 = _208 + 2.0;
        float _212 = -_188;
        float _214 = _184 + _212;
        float _216 = _206 * _206;
        float _218 = floor(_200);
        float _220 = -_214;
        float _222 = _220 + 1.0;
        float _224 = _206 * _216;
        float _226 = _210 * _210;
        float _228 = -_214;
        float _230 = _228 + 2.0;
        float _232 = _222 * _222;
        float _234 = _224 * 4.0;
        float _236 = 1.0 / _178;
        float _238 = _222 * _232;
        float _240 = -_234;
        float _242 = fma(_210, _226, _240);
        float _244 = -_224;
        float _246 = _244 + 6.0;
        float _248 = _230 * _230;
        float _250 = _238 * 4.0;
        float _252 = -_202;
        float _254 = _194 + _252;
        float _256 = -_242;
        float _258 = _256 + _246;
        float _260 = 1.0 / _190;
        float _262 = -_250;
        float _264 = fma(_230, _248, _262);
        float _266 = -_254;
        float _268 = _266 + 1.0;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = -_238;
        float _274 = _272 + 6.0;
        float _276 = -_254;
        float _278 = _276 + 2.0;
        float _280 = _268 * _268;
        float _282 = _224 + _242;
        float _284 = -_264;
        float _286 = _284 + _274;
        float _288 = 1.0 / _270;
        float _290 = _268 * _280;
        float _292 = -_218;
        float _294 = _200 + _292;
        float _296 = _286 * 0.16666667163372039794921875;
        float _298 = _278 * _278;
        float _300 = _290 * 4.0;
        float _302 = -_294;
        float _304 = _302 + 1.0;
        float _306 = -_290;
        float _308 = _306 + 6.0;
        float _310 = _282 * 0.16666667163372039794921875;
        float _312 = -_300;
        float _314 = fma(_278, _298, _312);
        float _316 = _304 * _304;
        float _318 = -_294;
        float _320 = _318 + 2.0;
        float _322 = 1.0 / _310;
        float _324 = -_314;
        float _326 = _324 + _308;
        float _328 = _304 * _316;
        float _330 = _198 * _198;
        float _332 = _320 * _320;
        float _334 = _326 * 0.16666667163372039794921875;
        float _336 = _328 * 4.0;
        float _338 = _238 + _264;
        float _340 = _198 * _330;
        float _342 = 1.0 / _296;
        float _344 = -_336;
        float _346 = fma(_320, _332, _344);
        float _348 = _338 * 0.16666667163372039794921875;
        float _350 = _186 + 1.5;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = _186 + (-0.5);
        float _356 = _214 * _214;
        float _358 = -_328;
        float _360 = _358 + 6.0;
        float _362 = 1.0 / _348;
        float _364 = fma(_352, _288, _350);
        float _366 = _242 * 0.16666667163372039794921875;
        float _368 = _214 * _356;
        float _370 = _290 + _314;
        float _372 = -_346;
        float _374 = _372 + _360;
        float _376 = fma(_366, _322, _354);
        float _378 = _328 + _346;
        float _380 = _188 + (-0.5);
        float _382 = _188 + 1.5;
        float _384 = _368 * 0.16666667163372039794921875;
        float _386 = _370 * 0.16666667163372039794921875;
        float _388 = _374 * 0.16666667163372039794921875;
        float _390 = _378 * 0.16666667163372039794921875;
        float _392 = _264 * 0.16666667163372039794921875;
        float _394 = 1.0 / _386;
        float _396 = fma(_384, _342, _382);
        float _398 = _376 * _180;
        float _400 = fma(_392, _362, _380);
        float _402 = _254 * _254;
        float _404 = _294 * _294;
        float _406 = _364 * _180;
        float _408 = _314 * 0.16666667163372039794921875;
        float _410 = 1.0 / _334;
        float _412 = _254 * _402;
        float _414 = _294 * _404;
        float _416 = _202 + (-0.5);
        float _418 = _202 + 1.5;
        float _420 = _218 + (-0.5);
        float _422 = _412 * 0.16666667163372039794921875;
        float _424 = _346 * 0.16666667163372039794921875;
        float _426 = 1.0 / _390;
        float _428 = _400 * _236;
        float _430 = _218 + 1.5;
        float _432 = _414 * 0.16666667163372039794921875;
        float _434 = fma(_408, _394, _416);
        float _436 = _396 * _236;
        float _438 = 1.0 / _388;
        float _440 = fma(_422, _410, _418);
        float _442 = _434 * _260;
        float _444 = _440 * _260;
        float _446 = 1.0 / _192;
        float _448 = fma(_424, _426, _420);
        float _450 = fma(_432, _438, _430);
        float _452 = _448 * _446;
        float2 _1212 = float2(_398, _428);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212)), level(_132)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1227 = float2(_406, _428);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1227, float2(0.0), isnan(_1227)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1227, float2(0.0), isnan(_1227)), level(_132)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1242 = float2(_398, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_132)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = _450 * _446;
        float2 _1260 = float2(_406, _436);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1260, float2(0.0), isnan(_1260)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1260, float2(0.0), isnan(_1260)), level(_132)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1275 = float2(_442, _452);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_138)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1290 = float2(_444, _452);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_138)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1305 = float2(_442, _480);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1305, float2(0.0), isnan(_1305)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1305, float2(0.0), isnan(_1305)), level(_138)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1320 = float2(_444, _480);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1320, float2(0.0), isnan(_1320)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1320, float2(0.0), isnan(_1320)), level(_138)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float _522 = 0.0 + _124;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = fma(_104, _524, _102);
        float _528 = -_132;
        float _530 = _126 + _528;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = _524 * _104;
        float _536 = -_468;
        float _538 = _460 + _536;
        float _540 = -_466;
        float _542 = _458 + _540;
        float _544 = -_470;
        float _546 = _462 + _544;
        float _548 = -_484;
        float _550 = _474 + _548;
        float _552 = fma(_310, _542, _466);
        float _554 = -_488;
        float _556 = _478 + _554;
        float _558 = fma(_310, _546, _470);
        float _560 = fma(_310, _550, _484);
        float _562 = -_486;
        float _564 = _476 + _562;
        float _566 = -_502;
        float _568 = _494 + _566;
        float _570 = -_504;
        float _572 = _496 + _570;
        float _574 = fma(_310, _556, _488);
        float _576 = fma(_310, _564, _486);
        float _578 = -_520;
        float _580 = _512 + _578;
        float _582 = -_500;
        float _584 = _492 + _582;
        float _586 = fma(_386, _568, _502);
        float _588 = -_516;
        float _590 = _508 + _588;
        float _592 = -_518;
        float _594 = _510 + _592;
        float _596 = fma(_386, _572, _504);
        float _598 = fma(_386, _580, _520);
        float _600 = fma(_386, _584, _500);
        float _602 = fma(_386, _590, _516);
        float _604 = fma(_310, _538, _468);
        float _606 = -_560;
        float _608 = _606 + _552;
        float _610 = fma(_386, _594, _518);
        float _612 = -_574;
        float _614 = _612 + _558;
        float _616 = 1.0 / _526;
        float _618 = -_598;
        float _620 = _618 + _596;
        float _622 = fma(_348, _608, _560);
        float _624 = -_602;
        float _626 = _624 + _600;
        float _628 = -_576;
        float _630 = _628 + _604;
        float _632 = -_610;
        float _634 = _632 + _586;
        float _636 = fma(_348, _614, _574);
        float _638 = fma(_390, _620, _598);
        float _640 = fma(_390, _626, _602);
        float _642 = fma(_348, _630, _576);
        float _644 = fma(_390, _634, _610);
        float _646 = -_636;
        float _648 = _646 + _638;
        float _650 = -_622;
        float _652 = _650 + _640;
        float _654 = -_642;
        float _656 = _654 + _644;
        float _658 = fma(_532, _648, _636);
        float _660 = fma(_532, _652, _622);
        float _662 = _616 * _534;
        float _664 = fma(_532, _656, _642);
        float _666 = _658 * _534;
        float _668 = _660 * _662;
        float _670 = _664 * _662;
        float _672 = _666 * _616;
        out.m_34.x = _668;
        out.m_34.y = _670;
        out.m_34.z = _672;
        out.m_34.w = _526;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _102;
    return out;
}

