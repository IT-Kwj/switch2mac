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
int _40(thread const int& _1561, thread const int& _1562, constant _10& support_buffer)
{
    int _1565 = 1 + _1562;
    float _1567 = support_buffer._m5[_1565].x;
    float _1569 = abs(_1567);
    bool _1571 = _1569 == 1.0;
    if (_1571)
    {
        return _1561;
    }
    float _1573 = float(_1561);
    float _1575 = _1573 / _1569;
    int _1577 = int(_1575);
    return _1577;
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
    float2 _700 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    bool _78 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    bool _84 = !_78;
    float _86 = _84 ? _74 : 0.0;
    float _88 = precise::max(_86, _82);
    bool _90 = _88 != 0.0;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan(0.0);
    bool _98 = _94 || _96;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::min(_102, _106);
    bool _110 = !_98;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_88, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = float(_122);
        float _126 = trunc(_124);
        int _128 = int(_126);
        float _130 = _124 + 1.0;
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _40(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _40(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _40(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _40(_162, _164, (*spvDescriptorSet0.support_buffer));
        float _168 = float(_142);
        float _170 = float(_150);
        float _172 = 1.0 / _168;
        float _174 = fma(_60, _168, -0.5);
        float _176 = fma(_62, _170, -0.5);
        float _178 = floor(_174);
        float _180 = floor(_176);
        float _182 = float(_158);
        float _184 = float(_166);
        float _186 = fma(_60, _182, -0.5);
        float _188 = -_178;
        float _190 = _174 + _188;
        float _192 = fma(_62, _184, -0.5);
        float _194 = floor(_186);
        float _196 = _178 + (-0.5);
        float _198 = -_190;
        float _200 = _198 + 1.0;
        float _202 = -_190;
        float _204 = _202 + 2.0;
        float _206 = _200 * _200;
        float _208 = -_180;
        float _210 = _176 + _208;
        float _212 = _204 * _204;
        float _214 = floor(_192);
        float _216 = _200 * _206;
        float _218 = -_210;
        float _220 = _218 + 1.0;
        float _222 = -_210;
        float _224 = _222 + 2.0;
        float _226 = _180 + 1.5;
        float _228 = _216 * 4.0;
        float _230 = _220 * _220;
        float _232 = 1.0 / _170;
        float _234 = -_228;
        float _236 = fma(_204, _212, _234);
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = _220 * _230;
        float _244 = _224 * _224;
        float _246 = _216 + _236;
        float _248 = -_236;
        float _250 = _248 + _240;
        float _252 = _242 * 4.0;
        float _254 = 1.0 / _182;
        float _256 = _246 * 0.16666667163372039794921875;
        float _258 = _250 * 0.16666667163372039794921875;
        float _260 = -_194;
        float _262 = _186 + _260;
        float _264 = -_252;
        float _266 = fma(_224, _244, _264);
        float _268 = -_242;
        float _270 = _268 + 6.0;
        float _272 = -_214;
        float _274 = _192 + _272;
        float _276 = -_262;
        float _278 = _276 + 1.0;
        float _280 = -_262;
        float _282 = _280 + 2.0;
        float _284 = -_266;
        float _286 = _284 + _270;
        float _288 = -_274;
        float _290 = _288 + 1.0;
        float _292 = _278 * _278;
        float _294 = -_274;
        float _296 = _294 + 2.0;
        float _298 = _286 * 0.16666667163372039794921875;
        float _300 = _290 * _290;
        float _302 = _278 * _292;
        float _304 = _242 + _266;
        float _306 = 1.0 / _258;
        float _308 = _290 * _300;
        float _310 = _282 * _282;
        float _312 = _302 * 4.0;
        float _314 = -_302;
        float _316 = _314 + 6.0;
        float _318 = _308 * 4.0;
        float _320 = -_308;
        float _322 = _320 + 6.0;
        float _324 = -_312;
        float _326 = fma(_282, _310, _324);
        float _328 = _296 * _296;
        float _330 = 1.0 / _298;
        float _332 = _304 * 0.16666667163372039794921875;
        float _334 = -_326;
        float _336 = _334 + _316;
        float _338 = -_318;
        float _340 = fma(_296, _328, _338);
        float _342 = _190 * _190;
        float _344 = _210 * _210;
        float _346 = _336 * 0.16666667163372039794921875;
        float _348 = -_340;
        float _350 = _348 + _322;
        float _352 = _190 * _342;
        float _354 = 1.0 / _256;
        float _356 = _178 + 1.5;
        float _358 = _350 * 0.16666667163372039794921875;
        float _360 = _302 + _326;
        float _362 = _210 * _344;
        float _364 = _352 * 0.16666667163372039794921875;
        float _366 = _236 * 0.16666667163372039794921875;
        float _368 = _360 * 0.16666667163372039794921875;
        float _370 = _180 + (-0.5);
        float _372 = _308 + _340;
        float _374 = 1.0 / _332;
        float _376 = fma(_364, _306, _356);
        float _378 = _362 * 0.16666667163372039794921875;
        float _380 = _372 * 0.16666667163372039794921875;
        float _382 = _266 * 0.16666667163372039794921875;
        float _384 = _274 * _274;
        float _386 = fma(_378, _330, _226);
        float _388 = _262 * _262;
        float _390 = 1.0 / _368;
        float _392 = fma(_366, _354, _196);
        float _394 = _274 * _384;
        float _396 = _262 * _388;
        float _398 = _194 + (-0.5);
        float _400 = _392 * _172;
        float _402 = _376 * _172;
        float _404 = _194 + 1.5;
        float _406 = 1.0 / _346;
        float _408 = fma(_382, _374, _370);
        float _410 = _326 * 0.16666667163372039794921875;
        float _412 = _214 + (-0.5);
        float _414 = _396 * 0.16666667163372039794921875;
        float _416 = _340 * 0.16666667163372039794921875;
        float _418 = _408 * _232;
        float _420 = _214 + 1.5;
        float _422 = 1.0 / _380;
        float _424 = _394 * 0.16666667163372039794921875;
        float _426 = fma(_410, _390, _398);
        float _428 = _386 * _232;
        float _430 = 1.0 / _358;
        float _432 = fma(_414, _406, _404);
        float _434 = 1.0 / _184;
        float _436 = fma(_416, _422, _412);
        float2 _1184 = float2(_400, _418);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1184, float2(0.0), isnan(_1184)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1184, float2(0.0), isnan(_1184)), level(_124)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float _448 = fma(_424, _430, _420);
        float _450 = _426 * _254;
        float _452 = _432 * _254;
        float _454 = _436 * _434;
        float _456 = _448 * _434;
        float2 _1215 = float2(_402, _418);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1215, float2(0.0), isnan(_1215)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1215, float2(0.0), isnan(_1215)), level(_124)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1230 = float2(_400, _428);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1230, float2(0.0), isnan(_1230)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1230, float2(0.0), isnan(_1230)), level(_124)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1245 = float2(_402, _428);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1245, float2(0.0), isnan(_1245)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1245, float2(0.0), isnan(_1245)), level(_124)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1260 = float2(_450, _454);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1260, float2(0.0), isnan(_1260)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1260, float2(0.0), isnan(_1260)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1275 = float2(_452, _454);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1290 = float2(_450, _456);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1305 = float2(_452, _456);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1305, float2(0.0), isnan(_1305)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1305, float2(0.0), isnan(_1305)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = 0.0 + _116;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_124;
        float _520 = _118 + _518;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = -_460;
        float _526 = _442 + _524;
        float _528 = -_462;
        float _530 = _444 + _528;
        float _532 = -_464;
        float _534 = _446 + _532;
        float _536 = -_478;
        float _538 = _470 + _536;
        float _540 = fma(_256, _530, _462);
        float _542 = -_480;
        float _544 = _472 + _542;
        float _546 = fma(_256, _526, _460);
        float _548 = fma(_256, _538, _478);
        float _550 = -_476;
        float _552 = _468 + _550;
        float _554 = fma(_256, _544, _480);
        float _556 = -_492;
        float _558 = _484 + _556;
        float _560 = -_548;
        float _562 = _560 + _540;
        float _564 = -_508;
        float _566 = _500 + _564;
        float _568 = -_494;
        float _570 = _486 + _568;
        float _572 = -_496;
        float _574 = _488 + _572;
        float _576 = fma(_332, _562, _548);
        float _578 = -_510;
        float _580 = _502 + _578;
        float _582 = -_512;
        float _584 = _504 + _582;
        float _586 = fma(_256, _552, _476);
        float _588 = fma(_368, _558, _492);
        float _590 = fma(_368, _566, _508);
        float _592 = fma(_368, _570, _494);
        float _594 = fma(_368, _580, _510);
        float _596 = fma(_256, _534, _464);
        float _598 = fma(_368, _574, _496);
        float _600 = fma(_368, _584, _512);
        float _602 = -_586;
        float _604 = _602 + _546;
        float _606 = -_590;
        float _608 = _606 + _588;
        float _610 = -_594;
        float _612 = _610 + _592;
        float _614 = -_554;
        float _616 = _614 + _596;
        float _618 = -_600;
        float _620 = _618 + _598;
        float _622 = fma(_332, _604, _586);
        float _624 = fma(_380, _608, _590);
        float _626 = fma(_380, _612, _594);
        float _628 = fma(_332, _616, _554);
        float _630 = fma(_380, _620, _600);
        float _632 = -_622;
        float _634 = _632 + _624;
        float _636 = -_576;
        float _638 = _636 + _626;
        float _640 = -_628;
        float _642 = _640 + _630;
        float _644 = fma(_522, _634, _622);
        float _646 = fma(_522, _638, _576);
        float _648 = fma(_522, _642, _628);
        float _650 = -_644;
        float _652 = fma(_644, (*spvDescriptorSet0.fp_c3)._m0[13].x, _650);
        float _654 = -_646;
        float _656 = fma(_646, (*spvDescriptorSet0.fp_c3)._m0[13].y, _654);
        float _658 = -_648;
        float _660 = fma(_648, (*spvDescriptorSet0.fp_c3)._m0[13].z, _658);
        float _662 = fma(_108, _652, _644);
        float _664 = fma(_108, _656, _646);
        float _666 = fma(_108, _660, _648);
        out.m_34.x = _662;
        out.m_34.y = _664;
        out.m_34.z = _666;
        out.m_34.w = _516;
        return out;
    }
    discard_fragment();
    return out;
}

