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
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _1467, thread const int& _1468, constant _10& support_buffer)
{
    int _1471 = 1 + _1468;
    float _1473 = support_buffer._m5[_1471].x;
    float _1475 = abs(_1473);
    bool _1477 = _1475 == 1.0;
    if (_1477)
    {
        return _1467;
    }
    float _1479 = float(_1467);
    float _1481 = _1479 / _1475;
    int _1483 = int(_1481);
    return _1483;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = 1.0 / _44;
    float _54 = _52 * _50;
    bool _58 = _54 != 0.0;
    bool _60 = isnan(_54);
    bool _62 = _58 || _60;
    bool _64 = isnan(0.0);
    bool _66 = _62 || _64;
    bool _68 = !_66;
    if (!_68)
    {
        float _70 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _72 = fma(_54, _70, 1.0);
        float _74 = log2(_72);
        float _76 = _74 + (-1.0);
        float _78 = trunc(_76);
        int _80 = int(_78);
        float _82 = float(_80);
        float _84 = trunc(_82);
        int _86 = int(_84);
        float _88 = _82 + 1.0;
        float _90 = trunc(_88);
        int _92 = int(_90);
        int _94 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_86), spvDescriptorSet0.fp_t_tcb_8.get_height(_86)).x;
        int _96 = _94;
        int _98 = 0;
        int _100 = _40(_96, _98, (*spvDescriptorSet0.support_buffer));
        int _102 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_86), spvDescriptorSet0.fp_t_tcb_8.get_height(_86)).y;
        int _104 = _102;
        int _106 = 0;
        int _108 = _40(_104, _106, (*spvDescriptorSet0.support_buffer));
        int _110 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_92), spvDescriptorSet0.fp_t_tcb_8.get_height(_92)).x;
        int _112 = _110;
        int _114 = 0;
        int _116 = _40(_112, _114, (*spvDescriptorSet0.support_buffer));
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_92), spvDescriptorSet0.fp_t_tcb_8.get_height(_92)).y;
        int _120 = _118;
        int _122 = 0;
        int _124 = _40(_120, _122, (*spvDescriptorSet0.support_buffer));
        float _126 = in.m_31.x;
        float _128 = gl_FragCoord.w;
        float _130 = _126 * _128;
        float _132 = in.m_31.y;
        float _134 = gl_FragCoord.w;
        float _136 = _132 * _134;
        float _138 = _52 * _130;
        float _140 = float(_100);
        float _142 = float(_108);
        float _144 = _52 * _136;
        float _146 = 1.0 / _140;
        float _148 = fma(_138, _140, -0.5);
        float _150 = fma(_144, _142, -0.5);
        float _152 = floor(_148);
        float _154 = floor(_150);
        float _156 = float(_116);
        float _158 = float(_124);
        float _160 = fma(_138, _156, -0.5);
        float _162 = -_152;
        float _164 = _148 + _162;
        float _166 = fma(_144, _158, -0.5);
        float _168 = floor(_160);
        float _170 = _152 + 1.5;
        float _172 = -_164;
        float _174 = _172 + 1.0;
        float _176 = -_164;
        float _178 = _176 + 2.0;
        float _180 = -_154;
        float _182 = _150 + _180;
        float _184 = _174 * _174;
        float _186 = 1.0 / _142;
        float _188 = -_182;
        float _190 = _188 + 1.0;
        float _192 = -_182;
        float _194 = _192 + 2.0;
        float _196 = _190 * _190;
        float _198 = _194 * _194;
        float _200 = -_168;
        float _202 = _160 + _200;
        float _204 = _174 * _184;
        float _206 = _190 * _196;
        float _208 = floor(_166);
        float _210 = _178 * _178;
        float _212 = _204 * 4.0;
        float _214 = _206 * 4.0;
        float _216 = -_202;
        float _218 = _216 + 1.0;
        float _220 = -_212;
        float _222 = fma(_178, _210, _220);
        float _224 = -_214;
        float _226 = fma(_194, _198, _224);
        float _228 = -_204;
        float _230 = _228 + 6.0;
        float _232 = _218 * _218;
        float _234 = -_206;
        float _236 = _234 + 6.0;
        float _238 = 1.0 / _156;
        float _240 = -_222;
        float _242 = _240 + _230;
        float _244 = _218 * _232;
        float _246 = -_226;
        float _248 = _246 + _236;
        float _250 = _206 + _226;
        float _252 = -_208;
        float _254 = _166 + _252;
        float _256 = _242 * 0.16666667163372039794921875;
        float _258 = -_202;
        float _260 = _258 + 2.0;
        float _262 = _244 * 4.0;
        float _264 = -_254;
        float _266 = _264 + 1.0;
        float _268 = -_254;
        float _270 = _268 + 2.0;
        float _272 = _248 * 0.16666667163372039794921875;
        float _274 = _204 + _222;
        float _276 = _266 * _266;
        float _278 = -_244;
        float _280 = _278 + 6.0;
        float _282 = 1.0 / _256;
        float _284 = _250 * 0.16666667163372039794921875;
        float _286 = _266 * _276;
        float _288 = _260 * _260;
        float _290 = _274 * 0.16666667163372039794921875;
        float _292 = _286 * 4.0;
        float _294 = -_262;
        float _296 = fma(_260, _288, _294);
        float _298 = _270 * _270;
        float _300 = -_286;
        float _302 = _300 + 6.0;
        float _304 = 1.0 / _272;
        float _306 = -_296;
        float _308 = _306 + _280;
        float _310 = -_292;
        float _312 = fma(_270, _298, _310);
        float _314 = _164 * _164;
        float _316 = _244 + _296;
        float _318 = _308 * 0.16666667163372039794921875;
        float _320 = -_312;
        float _322 = _320 + _302;
        float _324 = _164 * _314;
        float _326 = 1.0 / _284;
        float _328 = _182 * _182;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _324 * 0.16666667163372039794921875;
        float _334 = _286 + _312;
        float _336 = _182 * _328;
        float _338 = _316 * 0.16666667163372039794921875;
        float _340 = fma(_332, _282, _170);
        float _342 = 1.0 / _290;
        float _344 = _152 + (-0.5);
        float _346 = _154 + (-0.5);
        float _348 = _154 + 1.5;
        float _350 = _222 * 0.16666667163372039794921875;
        float _352 = _336 * 0.16666667163372039794921875;
        float _354 = _226 * 0.16666667163372039794921875;
        float _356 = _334 * 0.16666667163372039794921875;
        float _358 = 1.0 / _330;
        float _360 = fma(_352, _304, _348);
        float _362 = fma(_354, _326, _346);
        float _364 = _312 * 0.16666667163372039794921875;
        float _366 = _296 * 0.16666667163372039794921875;
        float _368 = _362 * _186;
        float _370 = _208 + (-0.5);
        float _372 = 1.0 / _356;
        float _374 = fma(_350, _342, _344);
        float _376 = _254 * _254;
        float _378 = _202 * _202;
        float _380 = _360 * _186;
        float _382 = _374 * _146;
        float _384 = _254 * _376;
        float _386 = _202 * _378;
        float _388 = 1.0 / _318;
        float _390 = _208 + 1.5;
        float _392 = _384 * 0.16666667163372039794921875;
        float _394 = _168 + (-0.5);
        float _396 = _340 * _146;
        float _398 = _168 + 1.5;
        float _400 = _386 * 0.16666667163372039794921875;
        float _402 = fma(_392, _358, _390);
        float _404 = 1.0 / _338;
        float _406 = fma(_364, _372, _370);
        float _408 = 1.0 / _158;
        float _410 = fma(_400, _388, _398);
        float2 _1098 = float2(_382, _368);
        float3 _414 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098)), level(_82)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098)), level(_82)).xyz;
        float _416 = _414.x;
        float _418 = _414.y;
        float _420 = _414.z;
        float2 _1115 = float2(_396, _368);
        float3 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1115, float2(0.0), isnan(_1115)), level(_82)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1115, float2(0.0), isnan(_1115)), level(_82)).xyz;
        float _424 = _422.x;
        float _426 = _422.y;
        float _428 = _422.z;
        float _430 = fma(_366, _404, _394);
        float _432 = _430 * _238;
        float _434 = _410 * _238;
        float _436 = _406 * _408;
        float _438 = _402 * _408;
        float2 _1146 = float2(_382, _380);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1146, float2(0.0), isnan(_1146)), level(_82)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1146, float2(0.0), isnan(_1146)), level(_82)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1161 = float2(_396, _380);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1161, float2(0.0), isnan(_1161)), level(_82)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1161, float2(0.0), isnan(_1161)), level(_82)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1176 = float2(_432, _436);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1176, float2(0.0), isnan(_1176)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1176, float2(0.0), isnan(_1176)), level(_88)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1191 = float2(_434, _436);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1191, float2(0.0), isnan(_1191)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1191, float2(0.0), isnan(_1191)), level(_88)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1206 = float2(_432, _438);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1206, float2(0.0), isnan(_1206)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1206, float2(0.0), isnan(_1206)), level(_88)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1221 = float2(_434, _438);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1221, float2(0.0), isnan(_1221)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1221, float2(0.0), isnan(_1221)), level(_88)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float _488 = in.m_29.x;
        float _490 = gl_FragCoord.w;
        float _492 = _488 * _490;
        float _494 = in.m_29.y;
        float _496 = gl_FragCoord.w;
        float _498 = _494 * _496;
        float _500 = 0.0 + _74;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = _52 * _492;
        float _506 = _52 * _498;
        float _508 = fma(_506, _502, _504);
        float _510 = -_82;
        float _512 = _76 + _510;
        float _514 = precise::clamp(_512, 0.0, 1.0);
        float _516 = -_426;
        float _518 = _418 + _516;
        float _520 = -_424;
        float _522 = _416 + _520;
        float _524 = -_428;
        float _526 = _420 + _524;
        float _528 = fma(_290, _518, _426);
        float _530 = fma(_290, _522, _424);
        float _532 = fma(_290, _526, _428);
        float _534 = -_450;
        float _536 = _442 + _534;
        float _538 = -_454;
        float _540 = _446 + _538;
        float _542 = fma(_290, _536, _450);
        float _544 = -_452;
        float _546 = _444 + _544;
        float _548 = -_542;
        float _550 = _548 + _530;
        float _552 = -_468;
        float _554 = _460 + _552;
        float _556 = -_466;
        float _558 = _458 + _556;
        float _560 = -_470;
        float _562 = _462 + _560;
        float _564 = fma(_290, _546, _452);
        float _566 = fma(_338, _554, _468);
        float _568 = -_482;
        float _570 = _474 + _568;
        float _572 = -_484;
        float _574 = _476 + _572;
        float _576 = -_486;
        float _578 = _478 + _576;
        float _580 = fma(_338, _558, _466);
        float _582 = fma(_338, _570, _482);
        float _584 = fma(_338, _574, _484);
        float _586 = fma(_290, _540, _454);
        float _588 = fma(_338, _562, _470);
        float _590 = fma(_338, _578, _486);
        float _592 = -_564;
        float _594 = _592 + _528;
        float _596 = -_582;
        float _598 = _596 + _580;
        float _600 = -_584;
        float _602 = _600 + _566;
        float _604 = -_586;
        float _606 = _604 + _532;
        float _608 = -_590;
        float _610 = _608 + _588;
        float _612 = fma(_284, _550, _542);
        float _614 = fma(_284, _594, _564);
        float _616 = fma(_356, _598, _582);
        float _618 = fma(_356, _602, _584);
        float _620 = fma(_284, _606, _586);
        float _622 = fma(_356, _610, _590);
        float _624 = -_612;
        float _626 = _624 + _616;
        float _628 = -_614;
        float _630 = _628 + _618;
        float _632 = -_620;
        float _634 = _632 + _622;
        float _636 = fma(_514, _626, _612);
        float _638 = fma(_514, _630, _614);
        float _640 = fma(_514, _634, _620);
        out.m_34.x = _636;
        out.m_34.y = _638;
        out.m_34.z = _640;
        out.m_34.w = _508;
        return out;
    }
    discard_fragment();
    return out;
}

