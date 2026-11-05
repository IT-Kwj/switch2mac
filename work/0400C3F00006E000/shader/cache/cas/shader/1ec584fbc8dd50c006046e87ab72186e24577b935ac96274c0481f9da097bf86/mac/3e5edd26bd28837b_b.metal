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
int _42(thread const int& _1514, thread const int& _1515, constant _10& support_buffer)
{
    int _1518 = 1 + _1515;
    float _1520 = support_buffer._m5[_1518].x;
    float _1522 = abs(_1520);
    bool _1524 = _1522 == 1.0;
    if (_1524)
    {
        return _1514;
    }
    float _1526 = float(_1514);
    float _1528 = _1526 / _1522;
    int _1530 = int(_1528);
    return _1530;
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
    float2 _686 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).x;
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
    float _94 = _60 * _76;
    float _96 = precise::max(_92, _94);
    float _98 = _60 * _82;
    float _100 = _60 * _88;
    bool _102 = _96 != 0.0;
    bool _104 = isnan(_96);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_96, _114, 1.0);
        float _118 = log2(_116);
        float _120 = _118 + (-1.0);
        float _122 = trunc(_120);
        int _124 = int(_122);
        float _126 = float(_124);
        float _128 = trunc(_126);
        int _130 = int(_128);
        float _132 = _126 + 1.0;
        float _134 = trunc(_132);
        int _136 = int(_134);
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        float _170 = float(_144);
        float _172 = float(_152);
        float _174 = 1.0 / _170;
        float _176 = fma(_62, _170, -0.5);
        float _178 = fma(_64, _172, -0.5);
        float _180 = floor(_176);
        float _182 = floor(_178);
        float _184 = float(_160);
        float _186 = float(_168);
        float _188 = fma(_62, _184, -0.5);
        float _190 = -_180;
        float _192 = _176 + _190;
        float _194 = fma(_64, _186, -0.5);
        float _196 = floor(_188);
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = -_192;
        float _204 = _202 + 2.0;
        float _206 = -_182;
        float _208 = _178 + _206;
        float _210 = _200 * _200;
        float _212 = floor(_194);
        float _214 = -_208;
        float _216 = _214 + 1.0;
        float _218 = _200 * _210;
        float _220 = _204 * _204;
        float _222 = -_208;
        float _224 = _222 + 2.0;
        float _226 = _216 * _216;
        float _228 = _218 * 4.0;
        float _230 = 1.0 / _172;
        float _232 = _216 * _226;
        float _234 = -_228;
        float _236 = fma(_204, _220, _234);
        float _238 = -_218;
        float _240 = _238 + 6.0;
        float _242 = _224 * _224;
        float _244 = _232 * 4.0;
        float _246 = -_196;
        float _248 = _188 + _246;
        float _250 = -_236;
        float _252 = _250 + _240;
        float _254 = 1.0 / _184;
        float _256 = -_244;
        float _258 = fma(_224, _242, _256);
        float _260 = -_248;
        float _262 = _260 + 1.0;
        float _264 = _252 * 0.16666667163372039794921875;
        float _266 = -_248;
        float _268 = _266 + 2.0;
        float _270 = -_232;
        float _272 = _270 + 6.0;
        float _274 = _262 * _262;
        float _276 = _218 + _236;
        float _278 = _268 * _268;
        float _280 = -_258;
        float _282 = _280 + _272;
        float _284 = _262 * _274;
        float _286 = -_212;
        float _288 = _194 + _286;
        float _290 = 1.0 / _264;
        float _292 = _282 * 0.16666667163372039794921875;
        float _294 = _284 * 4.0;
        float _296 = -_288;
        float _298 = _296 + 1.0;
        float _300 = -_284;
        float _302 = _300 + 6.0;
        float _304 = _276 * 0.16666667163372039794921875;
        float _306 = -_294;
        float _308 = fma(_268, _278, _306);
        float _310 = _298 * _298;
        float _312 = -_288;
        float _314 = _312 + 2.0;
        float _316 = 1.0 / _304;
        float _318 = -_308;
        float _320 = _318 + _302;
        float _322 = _298 * _310;
        float _324 = _192 * _192;
        float _326 = _314 * _314;
        float _328 = _320 * 0.16666667163372039794921875;
        float _330 = _322 * 4.0;
        float _332 = _232 + _258;
        float _334 = _192 * _324;
        float _336 = 1.0 / _292;
        float _338 = -_330;
        float _340 = fma(_314, _326, _338);
        float _342 = _332 * 0.16666667163372039794921875;
        float _344 = _180 + 1.5;
        float _346 = _334 * 0.16666667163372039794921875;
        float _348 = -_322;
        float _350 = _348 + 6.0;
        float _352 = _180 + (-0.5);
        float _354 = _208 * _208;
        float _356 = 1.0 / _342;
        float _358 = fma(_346, _290, _344);
        float _360 = _236 * 0.16666667163372039794921875;
        float _362 = -_340;
        float _364 = _362 + _350;
        float _366 = _208 * _354;
        float _368 = _284 + _308;
        float _370 = fma(_360, _316, _352);
        float _372 = _322 + _340;
        float _374 = 1.0 / _328;
        float _376 = _364 * 0.16666667163372039794921875;
        float _378 = _182 + (-0.5);
        float _380 = _368 * 0.16666667163372039794921875;
        float _382 = _372 * 0.16666667163372039794921875;
        float _384 = _258 * 0.16666667163372039794921875;
        float _386 = _196 + 1.5;
        float _388 = _340 * 0.16666667163372039794921875;
        float _390 = 1.0 / _376;
        float _392 = _182 + 1.5;
        float _394 = _366 * 0.16666667163372039794921875;
        float _396 = fma(_384, _356, _378);
        float _398 = _288 * _288;
        float _400 = _248 * _248;
        float _402 = fma(_394, _336, _392);
        float _404 = _370 * _174;
        float _406 = 1.0 / _380;
        float _408 = _288 * _398;
        float _410 = _248 * _400;
        float _412 = _196 + (-0.5);
        float _414 = _358 * _174;
        float _416 = _396 * _230;
        float _418 = _212 + 1.5;
        float _420 = _308 * 0.16666667163372039794921875;
        float _422 = 1.0 / _382;
        float _424 = _408 * 0.16666667163372039794921875;
        float _426 = _212 + (-0.5);
        float _428 = _410 * 0.16666667163372039794921875;
        float _430 = _402 * _230;
        float _432 = fma(_424, _390, _418);
        float _434 = fma(_428, _374, _386);
        float _436 = 1.0 / _186;
        float _438 = fma(_420, _406, _412);
        float _440 = _438 * _254;
        float _442 = _434 * _254;
        float _444 = fma(_388, _422, _426);
        float2 _1178 = float2(_404, _416);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1178, float2(0.0), isnan(_1178)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1178, float2(0.0), isnan(_1178)), level(_126)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float _456 = _444 * _436;
        float _458 = _432 * _436;
        float2 _1199 = float2(_414, _416);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1199, float2(0.0), isnan(_1199)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1199, float2(0.0), isnan(_1199)), level(_126)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1214 = float2(_404, _430);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_126)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1229 = float2(_414, _430);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1229, float2(0.0), isnan(_1229)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1229, float2(0.0), isnan(_1229)), level(_126)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1244 = float2(_440, _456);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1244, float2(0.0), isnan(_1244)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1244, float2(0.0), isnan(_1244)), level(_132)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1259 = float2(_442, _456);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_132)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1274 = float2(_440, _458);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_132)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1289 = float2(_442, _458);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1289, float2(0.0), isnan(_1289)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1289, float2(0.0), isnan(_1289)), level(_132)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float _516 = 0.0 + _118;
        float _518 = precise::clamp(_516, 0.0, 1.0);
        float _520 = fma(_100, _518, _98);
        float _522 = -_126;
        float _524 = _120 + _522;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        float _528 = -_462;
        float _530 = _450 + _528;
        float _532 = -_464;
        float _534 = _452 + _532;
        float _536 = -_466;
        float _538 = _454 + _536;
        float _540 = fma(_304, _530, _462);
        float _542 = -_480;
        float _544 = _472 + _542;
        float _546 = -_478;
        float _548 = _470 + _546;
        float _550 = -_482;
        float _552 = _474 + _550;
        float _554 = fma(_304, _534, _464);
        float _556 = fma(_304, _544, _480);
        float _558 = -_494;
        float _560 = _486 + _558;
        float _562 = -_496;
        float _564 = _488 + _562;
        float _566 = -_498;
        float _568 = _490 + _566;
        float _570 = fma(_304, _538, _466);
        float _572 = fma(_380, _560, _494);
        float _574 = fma(_380, _564, _496);
        float _576 = -_510;
        float _578 = _502 + _576;
        float _580 = -_512;
        float _582 = _504 + _580;
        float _584 = -_514;
        float _586 = _506 + _584;
        float _588 = fma(_304, _548, _478);
        float _590 = fma(_380, _578, _510);
        float _592 = fma(_380, _582, _512);
        float _594 = fma(_304, _552, _482);
        float _596 = fma(_380, _568, _498);
        float _598 = fma(_380, _586, _514);
        float _600 = -_588;
        float _602 = _600 + _540;
        float _604 = -_556;
        float _606 = _604 + _554;
        float _608 = -_590;
        float _610 = _608 + _572;
        float _612 = -_592;
        float _614 = _612 + _574;
        float _616 = -_594;
        float _618 = _616 + _570;
        float _620 = -_598;
        float _622 = _620 + _596;
        float _624 = fma(_342, _602, _588);
        float _626 = fma(_342, _606, _556);
        float _628 = fma(_382, _610, _590);
        float _630 = fma(_382, _614, _592);
        float _632 = fma(_342, _618, _594);
        float _634 = fma(_382, _622, _598);
        float _636 = -_624;
        float _638 = _636 + _628;
        float _640 = -_626;
        float _642 = _640 + _630;
        float _644 = -_632;
        float _646 = _644 + _634;
        float _648 = fma(_526, _638, _624);
        float _650 = fma(_526, _642, _626);
        float _652 = fma(_526, _646, _632);
        out.m_34.x = _648;
        out.m_34.y = _650;
        out.m_34.z = _652;
        out.m_34.w = _520;
        return out;
    }
    discard_fragment();
    return out;
}

