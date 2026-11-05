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
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
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
int _42(thread const int& _1578, thread const int& _1579, constant _10& support_buffer)
{
    int _1582 = 1 + _1579;
    float _1584 = support_buffer._m5[_1582].x;
    float _1586 = abs(_1584);
    bool _1588 = _1586 == 1.0;
    if (_1588)
    {
        return _1578;
    }
    float _1590 = float(_1578);
    float _1592 = _1590 / _1586;
    int _1594 = int(_1592);
    return _1594;
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
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_712, float2(0.0), isnan(_712))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = precise::max(_66, _86);
    bool _96 = _92 != 0.0;
    bool _98 = isnan(_92);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.0);
    bool _104 = _100 || _102;
    bool _106 = !_104;
    if (!_106)
    {
        float _108 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _110 = fma(_92, _108, 1.0);
        float _112 = log2(_110);
        float _114 = _112 + (-1.0);
        float _116 = trunc(_114);
        int _118 = int(_116);
        float _120 = float(_118);
        float _122 = trunc(_120);
        int _124 = int(_122);
        float _126 = _120 + 1.0;
        float _128 = trunc(_126);
        int _130 = int(_128);
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        float _164 = float(_138);
        float _166 = float(_146);
        float _168 = 1.0 / _164;
        float _170 = fma(_62, _164, -0.5);
        float _172 = fma(_64, _166, -0.5);
        float _174 = floor(_170);
        float _176 = floor(_172);
        float _178 = float(_154);
        float _180 = float(_162);
        float _182 = fma(_62, _178, -0.5);
        float _184 = -_174;
        float _186 = _170 + _184;
        float _188 = fma(_64, _180, -0.5);
        float _190 = floor(_182);
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = -_186;
        float _198 = _196 + 2.0;
        float _200 = _186 * _186;
        float _202 = -_176;
        float _204 = _172 + _202;
        float _206 = _194 * _194;
        float _208 = _198 * _198;
        float _210 = floor(_188);
        float _212 = -_204;
        float _214 = _212 + 1.0;
        float _216 = _194 * _206;
        float _218 = -_204;
        float _220 = _218 + 2.0;
        float _222 = _186 * _200;
        float _224 = _214 * _214;
        float _226 = _216 * 4.0;
        float _228 = 1.0 / _166;
        float _230 = _214 * _224;
        float _232 = -_226;
        float _234 = fma(_198, _208, _232);
        float _236 = -_216;
        float _238 = _236 + 6.0;
        float _240 = _220 * _220;
        float _242 = _230 * 4.0;
        float _244 = -_190;
        float _246 = _182 + _244;
        float _248 = -_234;
        float _250 = _248 + _238;
        float _252 = -_210;
        float _254 = _188 + _252;
        float _256 = -_242;
        float _258 = fma(_220, _240, _256);
        float _260 = -_246;
        float _262 = _260 + 1.0;
        float _264 = _250 * 0.16666667163372039794921875;
        float _266 = -_246;
        float _268 = _266 + 2.0;
        float _270 = -_230;
        float _272 = _270 + 6.0;
        float _274 = _262 * _262;
        float _276 = _216 + _234;
        float _278 = _268 * _268;
        float _280 = -_258;
        float _282 = _280 + _272;
        float _284 = _262 * _274;
        float _286 = -_254;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _264;
        float _292 = _282 * 0.16666667163372039794921875;
        float _294 = _284 * 4.0;
        float _296 = -_254;
        float _298 = _296 + 2.0;
        float _300 = _276 * 0.16666667163372039794921875;
        float _302 = -_294;
        float _304 = fma(_268, _278, _302);
        float _306 = -_284;
        float _308 = _306 + 6.0;
        float _310 = _288 * _288;
        float _312 = 1.0 / _292;
        float _314 = _284 + _304;
        float _316 = -_304;
        float _318 = _316 + _308;
        float _320 = _288 * _310;
        float _322 = _298 * _298;
        float _324 = _314 * 0.16666667163372039794921875;
        float _326 = _318 * 0.16666667163372039794921875;
        float _328 = _320 * 4.0;
        float _330 = 1.0 / _300;
        float _332 = _230 + _258;
        float _334 = -_320;
        float _336 = _334 + 6.0;
        float _338 = -_328;
        float _340 = fma(_298, _322, _338);
        float _342 = _222 * 0.16666667163372039794921875;
        float _344 = _332 * 0.16666667163372039794921875;
        float _346 = _174 + 1.5;
        float _348 = -_340;
        float _350 = _348 + _336;
        float _352 = _258 * 0.16666667163372039794921875;
        float _354 = 1.0 / _344;
        float _356 = fma(_342, _290, _346);
        float _358 = _350 * 0.16666667163372039794921875;
        float _360 = _174 + (-0.5);
        float _362 = _204 * _204;
        float _364 = _234 * 0.16666667163372039794921875;
        float _366 = _176 + 1.5;
        float _368 = _204 * _362;
        float _370 = fma(_364, _330, _360);
        float _372 = _176 + (-0.5);
        float _374 = _320 + _340;
        float _376 = 1.0 / _324;
        float _378 = _368 * 0.16666667163372039794921875;
        float _380 = _374 * 0.16666667163372039794921875;
        float _382 = fma(_352, _354, _372);
        float _384 = _246 * _246;
        float _386 = fma(_378, _312, _366);
        float _388 = _254 * _254;
        float _390 = 1.0 / _326;
        float _392 = _370 * _168;
        float _394 = _246 * _384;
        float _396 = _382 * _228;
        float _398 = _356 * _168;
        float _400 = _386 * _228;
        float _402 = _254 * _388;
        float _404 = _190 + (-0.5);
        float _406 = 1.0 / _358;
        float _408 = _210 + (-0.5);
        float _410 = _210 + 1.5;
        float _412 = _304 * 0.16666667163372039794921875;
        float _414 = _190 + 1.5;
        float _416 = _394 * 0.16666667163372039794921875;
        float _418 = _402 * 0.16666667163372039794921875;
        float _420 = fma(_412, _376, _404);
        float _422 = 1.0 / _178;
        float _424 = fma(_416, _390, _414);
        float _426 = _340 * 0.16666667163372039794921875;
        float _428 = 1.0 / _380;
        float _430 = fma(_418, _406, _410);
        float _432 = 1.0 / _180;
        float _434 = _420 * _422;
        float _436 = _424 * _422;
        float _438 = fma(_426, _428, _408);
        float2 _1179 = float2(_392, _396);
        float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1179, float2(0.0), isnan(_1179)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1179, float2(0.0), isnan(_1179)), level(_120)).xyz;
        float _444 = _442.x;
        float _446 = _442.y;
        float _448 = _442.z;
        float2 _1194 = float2(_398, _396);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1194, float2(0.0), isnan(_1194)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1194, float2(0.0), isnan(_1194)), level(_120)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float _458 = _438 * _432;
        float _460 = _430 * _432;
        float2 _1215 = float2(_392, _400);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1215, float2(0.0), isnan(_1215)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1215, float2(0.0), isnan(_1215)), level(_120)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1230 = float2(_398, _400);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1230, float2(0.0), isnan(_1230)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1230, float2(0.0), isnan(_1230)), level(_120)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1245 = float2(_434, _458);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1245, float2(0.0), isnan(_1245)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1245, float2(0.0), isnan(_1245)), level(_126)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1260 = float2(_436, _458);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1260, float2(0.0), isnan(_1260)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1260, float2(0.0), isnan(_1260)), level(_126)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1275 = float2(_434, _460);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_126)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1290 = float2(_436, _460);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_126)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float _510 = -_120;
        float _512 = _114 + _510;
        float _514 = precise::clamp(_512, 0.0, 1.0);
        float _516 = -_452;
        float _518 = _444 + _516;
        float _520 = -_454;
        float _522 = _446 + _520;
        float _524 = -_456;
        float _526 = _448 + _524;
        float _528 = fma(_300, _518, _452);
        float _530 = fma(_300, _522, _454);
        float _532 = fma(_300, _526, _456);
        float _534 = -_472;
        float _536 = _464 + _534;
        float _538 = -_474;
        float _540 = _466 + _538;
        float _542 = fma(_300, _536, _472);
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = fma(_300, _540, _474);
        float _550 = fma(_300, _546, _476);
        float _552 = -_548;
        float _554 = _552 + _530;
        float _556 = -_490;
        float _558 = _482 + _556;
        float _560 = -_488;
        float _562 = _480 + _560;
        float _564 = -_492;
        float _566 = _484 + _564;
        float _568 = fma(_344, _554, _548);
        float _570 = fma(_324, _558, _490);
        float _572 = -_504;
        float _574 = _496 + _572;
        float _576 = -_506;
        float _578 = _498 + _576;
        float _580 = -_508;
        float _582 = _500 + _580;
        float _584 = fma(_324, _562, _488);
        float _586 = fma(_324, _566, _492);
        float _588 = fma(_324, _574, _504);
        float _590 = fma(_324, _578, _506);
        float _592 = fma(_324, _582, _508);
        float _594 = -_542;
        float _596 = _594 + _528;
        float _598 = -_588;
        float _600 = _598 + _584;
        float _602 = -_550;
        float _604 = _602 + _532;
        float _606 = -_590;
        float _608 = _606 + _570;
        float _610 = -_592;
        float _612 = _610 + _586;
        float _614 = fma(_344, _596, _542);
        float _616 = fma(_380, _600, _588);
        float _618 = 0.0 + _112;
        float _620 = precise::clamp(_618, 0.0, 1.0);
        float _622 = fma(_344, _604, _550);
        float _624 = fma(_380, _608, _590);
        float _626 = fma(_380, _612, _592);
        float _628 = -_614;
        float _630 = _628 + _616;
        float _632 = fma(_90, _620, _88);
        float _634 = -_568;
        float _636 = _634 + _624;
        float _638 = -_622;
        float _640 = _638 + _626;
        float _642 = fma(_514, _630, _614);
        float _644 = 1.0 / _632;
        float _646 = fma(_514, _636, _568);
        float _648 = fma(_514, _640, _622);
        float _650 = _620 * _642;
        float _652 = _620 * _646;
        float _654 = _620 * _648;
        float _656 = -_650;
        float _658 = _656 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _660 = -_652;
        float _662 = _660 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _664 = -_654;
        float _666 = _664 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _668 = fma(_88, _658, _650);
        float _670 = fma(_88, _662, _652);
        float _672 = fma(_88, _666, _654);
        float _674 = _668 * _644;
        float _676 = _670 * _644;
        float _678 = _672 * _644;
        out.m_36.x = _674;
        out.m_36.y = _676;
        out.m_36.z = _678;
        out.m_36.w = _632;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _88;
    return out;
}

