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
int _42(thread const int& _1553, thread const int& _1554, constant _10& support_buffer)
{
    int _1557 = 1 + _1554;
    float _1559 = support_buffer._m5[_1557].x;
    float _1561 = abs(_1559);
    bool _1563 = _1561 == 1.0;
    if (_1563)
    {
        return _1553;
    }
    float _1565 = float(_1553);
    float _1567 = _1565 / _1561;
    int _1569 = int(_1567);
    return _1569;
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
    float2 _700 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700))).x;
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
    float _96 = _60 * _82;
    float _98 = _60 * _88;
    float _100 = precise::max(_92, _94);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_100, _114, 1.0);
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
        float _266 = -_232;
        float _268 = _266 + 6.0;
        float _270 = -_248;
        float _272 = _270 + 2.0;
        float _274 = _262 * _262;
        float _276 = _218 + _236;
        float _278 = -_258;
        float _280 = _278 + _268;
        float _282 = 1.0 / _264;
        float _284 = _262 * _274;
        float _286 = -_212;
        float _288 = _194 + _286;
        float _290 = _280 * 0.16666667163372039794921875;
        float _292 = _272 * _272;
        float _294 = _284 * 4.0;
        float _296 = -_288;
        float _298 = _296 + 1.0;
        float _300 = -_284;
        float _302 = _300 + 6.0;
        float _304 = _276 * 0.16666667163372039794921875;
        float _306 = -_294;
        float _308 = fma(_272, _292, _306);
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
        float _336 = 1.0 / _290;
        float _338 = -_330;
        float _340 = fma(_314, _326, _338);
        float _342 = _332 * 0.16666667163372039794921875;
        float _344 = _180 + 1.5;
        float _346 = _334 * 0.16666667163372039794921875;
        float _348 = _180 + (-0.5);
        float _350 = _208 * _208;
        float _352 = -_322;
        float _354 = _352 + 6.0;
        float _356 = 1.0 / _342;
        float _358 = fma(_346, _282, _344);
        float _360 = _236 * 0.16666667163372039794921875;
        float _362 = _208 * _350;
        float _364 = _284 + _308;
        float _366 = -_340;
        float _368 = _366 + _354;
        float _370 = fma(_360, _316, _348);
        float _372 = _322 + _340;
        float _374 = _182 + (-0.5);
        float _376 = _182 + 1.5;
        float _378 = _362 * 0.16666667163372039794921875;
        float _380 = _364 * 0.16666667163372039794921875;
        float _382 = _368 * 0.16666667163372039794921875;
        float _384 = _372 * 0.16666667163372039794921875;
        float _386 = _258 * 0.16666667163372039794921875;
        float _388 = 1.0 / _380;
        float _390 = fma(_378, _336, _376);
        float _392 = _370 * _174;
        float _394 = fma(_386, _356, _374);
        float _396 = _248 * _248;
        float _398 = _288 * _288;
        float _400 = _358 * _174;
        float _402 = _308 * 0.16666667163372039794921875;
        float _404 = 1.0 / _328;
        float _406 = _248 * _396;
        float _408 = _288 * _398;
        float _410 = _196 + (-0.5);
        float _412 = _196 + 1.5;
        float _414 = _212 + (-0.5);
        float _416 = _406 * 0.16666667163372039794921875;
        float _418 = _340 * 0.16666667163372039794921875;
        float _420 = 1.0 / _384;
        float _422 = _394 * _230;
        float _424 = _212 + 1.5;
        float _426 = _408 * 0.16666667163372039794921875;
        float _428 = fma(_402, _388, _410);
        float _430 = _390 * _230;
        float _432 = 1.0 / _382;
        float _434 = fma(_416, _404, _412);
        float _436 = _428 * _254;
        float _438 = _434 * _254;
        float _440 = 1.0 / _186;
        float _442 = fma(_418, _420, _414);
        float _444 = fma(_426, _432, _424);
        float _446 = _442 * _440;
        float2 _1195 = float2(_392, _422);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_126)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float2 _1210 = float2(_400, _422);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_126)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1225 = float2(_392, _430);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1225, float2(0.0), isnan(_1225)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1225, float2(0.0), isnan(_1225)), level(_126)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float _474 = _444 * _440;
        float2 _1243 = float2(_400, _430);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1243, float2(0.0), isnan(_1243)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1243, float2(0.0), isnan(_1243)), level(_126)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1258 = float2(_436, _446);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1258, float2(0.0), isnan(_1258)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1258, float2(0.0), isnan(_1258)), level(_132)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1273 = float2(_438, _446);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1273, float2(0.0), isnan(_1273)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1273, float2(0.0), isnan(_1273)), level(_132)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1288 = float2(_436, _474);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1288, float2(0.0), isnan(_1288)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1288, float2(0.0), isnan(_1288)), level(_132)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1303 = float2(_438, _474);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1303, float2(0.0), isnan(_1303)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1303, float2(0.0), isnan(_1303)), level(_132)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float _516 = 0.0 + _118;
        float _518 = precise::clamp(_516, 0.0, 1.0);
        float _520 = fma(_98, _518, _96);
        float _522 = -_126;
        float _524 = _120 + _522;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        float _528 = _518 * _98;
        float _530 = -_462;
        float _532 = _454 + _530;
        float _534 = -_460;
        float _536 = _452 + _534;
        float _538 = -_464;
        float _540 = _456 + _538;
        float _542 = -_478;
        float _544 = _468 + _542;
        float _546 = fma(_304, _536, _460);
        float _548 = -_482;
        float _550 = _472 + _548;
        float _552 = fma(_304, _540, _464);
        float _554 = fma(_304, _544, _478);
        float _556 = -_480;
        float _558 = _470 + _556;
        float _560 = -_496;
        float _562 = _488 + _560;
        float _564 = -_498;
        float _566 = _490 + _564;
        float _568 = fma(_304, _550, _482);
        float _570 = fma(_304, _558, _480);
        float _572 = -_514;
        float _574 = _506 + _572;
        float _576 = -_494;
        float _578 = _486 + _576;
        float _580 = fma(_380, _562, _496);
        float _582 = -_510;
        float _584 = _502 + _582;
        float _586 = -_512;
        float _588 = _504 + _586;
        float _590 = fma(_380, _566, _498);
        float _592 = fma(_380, _574, _514);
        float _594 = fma(_380, _578, _494);
        float _596 = fma(_380, _584, _510);
        float _598 = fma(_304, _532, _462);
        float _600 = -_554;
        float _602 = _600 + _546;
        float _604 = fma(_380, _588, _512);
        float _606 = -_568;
        float _608 = _606 + _552;
        float _610 = 1.0 / _520;
        float _612 = -_592;
        float _614 = _612 + _590;
        float _616 = fma(_342, _602, _554);
        float _618 = -_596;
        float _620 = _618 + _594;
        float _622 = -_570;
        float _624 = _622 + _598;
        float _626 = -_604;
        float _628 = _626 + _580;
        float _630 = fma(_342, _608, _568);
        float _632 = fma(_384, _614, _592);
        float _634 = fma(_384, _620, _596);
        float _636 = fma(_342, _624, _570);
        float _638 = fma(_384, _628, _604);
        float _640 = -_630;
        float _642 = _640 + _632;
        float _644 = -_616;
        float _646 = _644 + _634;
        float _648 = -_636;
        float _650 = _648 + _638;
        float _652 = fma(_526, _642, _630);
        float _654 = fma(_526, _646, _616);
        float _656 = _610 * _528;
        float _658 = fma(_526, _650, _636);
        float _660 = _652 * _528;
        float _662 = _654 * _656;
        float _664 = _658 * _656;
        float _666 = _660 * _610;
        out.m_34.x = _662;
        out.m_34.y = _664;
        out.m_34.z = _666;
        out.m_34.w = _520;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _96;
    return out;
}

