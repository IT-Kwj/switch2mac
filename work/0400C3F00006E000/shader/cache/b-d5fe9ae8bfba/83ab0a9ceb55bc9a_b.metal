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
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    bool _66 = _60 != 0.0;
    bool _68 = isnan(_60);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    bool _76 = !_74;
    if (!_76)
    {
        float _78 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _80 = fma(_60, _78, 1.0);
        float _82 = log2(_80);
        float _84 = _82 + (-1.0);
        float _86 = trunc(_84);
        int _88 = int(_86);
        float _90 = float(_88);
        float _92 = trunc(_90);
        int _94 = int(_92);
        float _96 = _90 + 1.0;
        float _98 = trunc(_96);
        int _100 = int(_98);
        int _102 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_94), spvDescriptorSet0.fp_t_tcb_8.get_height(_94)).x;
        int _104 = _102;
        int _106 = 0;
        int _108 = _40(_104, _106, (*spvDescriptorSet0.support_buffer));
        int _110 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_94), spvDescriptorSet0.fp_t_tcb_8.get_height(_94)).y;
        int _112 = _110;
        int _114 = 0;
        int _116 = _40(_112, _114, (*spvDescriptorSet0.support_buffer));
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_100), spvDescriptorSet0.fp_t_tcb_8.get_height(_100)).x;
        int _120 = _118;
        int _122 = 0;
        int _124 = _40(_120, _122, (*spvDescriptorSet0.support_buffer));
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_100), spvDescriptorSet0.fp_t_tcb_8.get_height(_100)).y;
        int _128 = _126;
        int _130 = 0;
        int _132 = _40(_128, _130, (*spvDescriptorSet0.support_buffer));
        float _134 = in.m_31.x;
        float _136 = gl_FragCoord.w;
        float _138 = _134 * _136;
        float _140 = in.m_31.y;
        float _142 = gl_FragCoord.w;
        float _144 = _140 * _142;
        float _146 = _58 * _138;
        float _148 = _58 * _144;
        float _150 = float(_108);
        float _152 = float(_116);
        float _154 = 1.0 / _150;
        float _156 = fma(_146, _150, -0.5);
        float _158 = fma(_148, _152, -0.5);
        float _160 = floor(_156);
        float _162 = float(_124);
        float _164 = float(_132);
        float _166 = fma(_146, _162, -0.5);
        float _168 = floor(_158);
        float _170 = fma(_148, _164, -0.5);
        float _172 = -_160;
        float _174 = _156 + _172;
        float _176 = floor(_166);
        float _178 = -_174;
        float _180 = _178 + 1.0;
        float _182 = -_174;
        float _184 = _182 + 2.0;
        float _186 = -_168;
        float _188 = _158 + _186;
        float _190 = _180 * _180;
        float _192 = 1.0 / _152;
        float _194 = _184 * _184;
        float _196 = -_188;
        float _198 = _196 + 1.0;
        float _200 = _180 * _190;
        float _202 = -_188;
        float _204 = _202 + 2.0;
        float _206 = _198 * _198;
        float _208 = _200 * 4.0;
        float _210 = floor(_170);
        float _212 = _198 * _206;
        float _214 = -_176;
        float _216 = _166 + _214;
        float _218 = -_208;
        float _220 = fma(_184, _194, _218);
        float _222 = _204 * _204;
        float _224 = _212 * 4.0;
        float _226 = -_216;
        float _228 = _226 + 1.0;
        float _230 = -_200;
        float _232 = _230 + 6.0;
        float _234 = _200 + _220;
        float _236 = -_224;
        float _238 = fma(_204, _222, _236);
        float _240 = -_212;
        float _242 = _240 + 6.0;
        float _244 = _228 * _228;
        float _246 = -_216;
        float _248 = _246 + 2.0;
        float _250 = -_220;
        float _252 = _250 + _232;
        float _254 = -_238;
        float _256 = _254 + _242;
        float _258 = _228 * _244;
        float _260 = -_210;
        float _262 = _170 + _260;
        float _264 = _248 * _248;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = _258 * 4.0;
        float _270 = -_262;
        float _272 = _270 + 1.0;
        float _274 = _252 * 0.16666667163372039794921875;
        float _276 = _234 * 0.16666667163372039794921875;
        float _278 = -_268;
        float _280 = fma(_248, _264, _278);
        float _282 = -_258;
        float _284 = _282 + 6.0;
        float _286 = _272 * _272;
        float _288 = 1.0 / _274;
        float _290 = _258 + _280;
        float _292 = -_280;
        float _294 = _292 + _284;
        float _296 = _272 * _286;
        float _298 = _174 * _174;
        float _300 = _294 * 0.16666667163372039794921875;
        float _302 = _296 * 4.0;
        float _304 = _174 * _298;
        float _306 = -_262;
        float _308 = _306 + 2.0;
        float _310 = _212 + _238;
        float _312 = 1.0 / _276;
        float _314 = -_296;
        float _316 = _314 + 6.0;
        float _318 = _308 * _308;
        float _320 = _310 * 0.16666667163372039794921875;
        float _322 = _238 * 0.16666667163372039794921875;
        float _324 = -_302;
        float _326 = fma(_308, _318, _324);
        float _328 = _160 + 1.5;
        float _330 = _304 * 0.16666667163372039794921875;
        float _332 = 1.0 / _266;
        float _334 = -_326;
        float _336 = _334 + _316;
        float _338 = _160 + (-0.5);
        float _340 = fma(_330, _288, _328);
        float _342 = _336 * 0.16666667163372039794921875;
        float _344 = _220 * 0.16666667163372039794921875;
        float _346 = _290 * 0.16666667163372039794921875;
        float _348 = 1.0 / _320;
        float _350 = fma(_344, _312, _338);
        float _352 = _168 + (-0.5);
        float _354 = _168 + 1.5;
        float _356 = _350 * _154;
        float _358 = _210 + (-0.5);
        float _360 = 1.0 / _300;
        float _362 = _340 * _154;
        float _364 = 1.0 / _342;
        float _366 = _188 * _188;
        float _368 = fma(_322, _348, _352);
        float _370 = _216 * _216;
        float _372 = _188 * _366;
        float _374 = _296 + _326;
        float _376 = _216 * _370;
        float _378 = 1.0 / _346;
        float _380 = _372 * 0.16666667163372039794921875;
        float _382 = _374 * 0.16666667163372039794921875;
        float _384 = _280 * 0.16666667163372039794921875;
        float _386 = _326 * 0.16666667163372039794921875;
        float _388 = fma(_380, _332, _354);
        float _390 = _262 * _262;
        float _392 = _368 * _192;
        float _394 = 1.0 / _162;
        float _396 = _210 + 1.5;
        float _398 = _262 * _390;
        float _400 = _176 + (-0.5);
        float _402 = _388 * _192;
        float _404 = _176 + 1.5;
        float _406 = _398 * 0.16666667163372039794921875;
        float _408 = _376 * 0.16666667163372039794921875;
        float _410 = 1.0 / _382;
        float _412 = fma(_384, _378, _400);
        float _414 = fma(_406, _364, _396);
        float _416 = fma(_408, _360, _404);
        float _418 = 1.0 / _164;
        float _420 = _412 * _394;
        float _422 = _416 * _394;
        float _424 = fma(_386, _410, _358);
        float2 _1150 = float2(_356, _392);
        float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1150, float2(0.0), isnan(_1150)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1150, float2(0.0), isnan(_1150)), level(_90)).xyz;
        float _430 = _428.x;
        float _432 = _428.y;
        float _434 = _428.z;
        float2 _1167 = float2(_362, _392);
        float3 _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1167, float2(0.0), isnan(_1167)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1167, float2(0.0), isnan(_1167)), level(_90)).xyz;
        float _438 = _436.x;
        float _440 = _436.y;
        float _442 = _436.z;
        float _444 = _424 * _418;
        float _446 = _414 * _418;
        float2 _1188 = float2(_356, _402);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1188, float2(0.0), isnan(_1188)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1188, float2(0.0), isnan(_1188)), level(_90)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1203 = float2(_362, _402);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1203, float2(0.0), isnan(_1203)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1203, float2(0.0), isnan(_1203)), level(_90)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1218 = float2(_420, _444);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1218, float2(0.0), isnan(_1218)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1218, float2(0.0), isnan(_1218)), level(_96)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1233 = float2(_422, _444);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1233, float2(0.0), isnan(_1233)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1233, float2(0.0), isnan(_1233)), level(_96)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1248 = float2(_420, _446);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1248, float2(0.0), isnan(_1248)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_96)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1263 = float2(_422, _446);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1263, float2(0.0), isnan(_1263)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_96)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float _496 = in.m_29.y;
        float _498 = gl_FragCoord.w;
        float _500 = _496 * _498;
        float _502 = 0.0 + _82;
        float _504 = precise::clamp(_502, 0.0, 1.0);
        float _506 = -_438;
        float _508 = _430 + _506;
        float _510 = -_440;
        float _512 = _432 + _510;
        float _514 = -_442;
        float _516 = _434 + _514;
        float _518 = _58 * _500;
        float _520 = fma(_276, _508, _438);
        float _522 = fma(_276, _512, _440);
        float _524 = fma(_276, _516, _442);
        float _526 = -_458;
        float _528 = _450 + _526;
        float _530 = -_460;
        float _532 = _452 + _530;
        float _534 = -_462;
        float _536 = _454 + _534;
        float _538 = fma(_276, _528, _458);
        float _540 = fma(_276, _532, _460);
        float _542 = fma(_276, _536, _462);
        float _544 = -_474;
        float _546 = _466 + _544;
        float _548 = -_538;
        float _550 = _548 + _520;
        float _552 = -_540;
        float _554 = _552 + _522;
        float _556 = -_490;
        float _558 = _482 + _556;
        float _560 = -_476;
        float _562 = _468 + _560;
        float _564 = fma(_320, _550, _538);
        float _566 = fma(_320, _554, _540);
        float _568 = -_492;
        float _570 = _484 + _568;
        float _572 = -_478;
        float _574 = _470 + _572;
        float _576 = -_494;
        float _578 = _486 + _576;
        float _580 = fma(_346, _546, _474);
        float _582 = fma(_346, _558, _490);
        float _584 = fma(_346, _562, _476);
        float _586 = fma(_346, _570, _492);
        float _588 = fma(_346, _574, _478);
        float _590 = fma(_346, _578, _494);
        float _592 = -_582;
        float _594 = _592 + _580;
        float _596 = -_586;
        float _598 = _596 + _584;
        float _600 = -_542;
        float _602 = _600 + _524;
        float _604 = -_590;
        float _606 = _604 + _588;
        float _608 = fma(_382, _594, _582);
        float _610 = fma(_382, _598, _586);
        float _612 = fma(_320, _602, _542);
        float _614 = fma(_382, _606, _590);
        float _616 = -_90;
        float _618 = _84 + _616;
        float _620 = precise::clamp(_618, 0.0, 1.0);
        float _622 = -_564;
        float _624 = _622 + _608;
        float _626 = fma(_518, _504, _62);
        float _628 = -_566;
        float _630 = _628 + _610;
        float _632 = -_612;
        float _634 = _632 + _614;
        float _636 = fma(_620, _624, _564);
        float _638 = 1.0 / _626;
        float _640 = fma(_620, _630, _566);
        float _642 = fma(_620, _634, _612);
        float _644 = _504 * _636;
        float _646 = _504 * _640;
        float _648 = _504 * _642;
        float _650 = -_644;
        float _652 = _650 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _654 = -_646;
        float _656 = _654 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _658 = -_648;
        float _660 = _658 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _662 = fma(_62, _652, _644);
        float _664 = fma(_62, _656, _646);
        float _666 = fma(_62, _660, _648);
        float _668 = _662 * _638;
        float _670 = _664 * _638;
        float _672 = _666 * _638;
        out.m_34.x = _668;
        out.m_34.y = _670;
        out.m_34.z = _672;
        out.m_34.w = _626;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _62;
    return out;
}

