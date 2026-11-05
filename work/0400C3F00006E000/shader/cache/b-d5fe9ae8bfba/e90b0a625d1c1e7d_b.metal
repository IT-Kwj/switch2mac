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
int _40(thread const int& _1528, thread const int& _1529, constant _10& support_buffer)
{
    int _1532 = 1 + _1529;
    float _1534 = support_buffer._m5[_1532].x;
    float _1536 = abs(_1534);
    bool _1538 = _1536 == 1.0;
    if (_1538)
    {
        return _1528;
    }
    float _1540 = float(_1528);
    float _1542 = _1540 / _1536;
    int _1544 = int(_1542);
    return _1544;
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
    float2 _684 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).x;
    bool _68 = _64 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_68)
    {
        discard_fragment();
    }
    if (_68)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _80 = precise::clamp(_78, 0.0, 1.0);
    bool _82 = _72 != 0.0;
    bool _84 = isnan(_72);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.0);
    bool _90 = _86 || _88;
    bool _92 = !_90;
    if (!_92)
    {
        float _94 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _96 = fma(_72, _94, 1.0);
        float _98 = log2(_96);
        float _100 = _98 + (-1.0);
        float _102 = trunc(_100);
        int _104 = int(_102);
        float _106 = float(_104);
        float _108 = trunc(_106);
        int _110 = int(_108);
        float _112 = _106 + 1.0;
        float _114 = trunc(_112);
        int _116 = int(_114);
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).x;
        int _120 = _118;
        int _122 = 1;
        int _124 = _40(_120, _122, (*spvDescriptorSet0.support_buffer));
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).y;
        int _128 = _126;
        int _130 = 1;
        int _132 = _40(_128, _130, (*spvDescriptorSet0.support_buffer));
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).x;
        int _136 = _134;
        int _138 = 1;
        int _140 = _40(_136, _138, (*spvDescriptorSet0.support_buffer));
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).y;
        int _144 = _142;
        int _146 = 1;
        int _148 = _40(_144, _146, (*spvDescriptorSet0.support_buffer));
        float _150 = float(_124);
        float _152 = float(_132);
        float _154 = 1.0 / _150;
        float _156 = fma(_60, _150, -0.5);
        float _158 = fma(_62, _152, -0.5);
        float _160 = floor(_156);
        float _162 = floor(_158);
        float _164 = float(_140);
        float _166 = float(_148);
        float _168 = fma(_60, _164, -0.5);
        float _170 = -_160;
        float _172 = _156 + _170;
        float _174 = 1.0 / _152;
        float _176 = fma(_62, _166, -0.5);
        float _178 = -_172;
        float _180 = _178 + 1.0;
        float _182 = -_172;
        float _184 = _182 + 2.0;
        float _186 = _172 * _172;
        float _188 = -_162;
        float _190 = _158 + _188;
        float _192 = floor(_168);
        float _194 = _180 * _180;
        float _196 = _184 * _184;
        float _198 = -_190;
        float _200 = _198 + 1.0;
        float _202 = -_190;
        float _204 = _202 + 2.0;
        float _206 = _180 * _194;
        float _208 = _172 * _186;
        float _210 = _200 * _200;
        float _212 = floor(_176);
        float _214 = _206 * 4.0;
        float _216 = _200 * _210;
        float _218 = _204 * _204;
        float _220 = -_214;
        float _222 = fma(_184, _196, _220);
        float _224 = -_206;
        float _226 = _224 + 6.0;
        float _228 = _216 * 4.0;
        float _230 = -_192;
        float _232 = _168 + _230;
        float _234 = _206 + _222;
        float _236 = -_222;
        float _238 = _236 + _226;
        float _240 = -_228;
        float _242 = fma(_204, _218, _240);
        float _244 = -_232;
        float _246 = _244 + 1.0;
        float _248 = -_216;
        float _250 = _248 + 6.0;
        float _252 = _238 * 0.16666667163372039794921875;
        float _254 = -_232;
        float _256 = _254 + 2.0;
        float _258 = _246 * _246;
        float _260 = -_212;
        float _262 = _176 + _260;
        float _264 = -_242;
        float _266 = _264 + _250;
        float _268 = _256 * _256;
        float _270 = _246 * _258;
        float _272 = -_262;
        float _274 = _272 + 1.0;
        float _276 = 1.0 / _252;
        float _278 = _266 * 0.16666667163372039794921875;
        float _280 = _270 * 4.0;
        float _282 = -_262;
        float _284 = _282 + 2.0;
        float _286 = _234 * 0.16666667163372039794921875;
        float _288 = -_280;
        float _290 = fma(_256, _268, _288);
        float _292 = -_270;
        float _294 = _292 + 6.0;
        float _296 = _274 * _274;
        float _298 = 1.0 / _278;
        float _300 = _270 + _290;
        float _302 = -_290;
        float _304 = _302 + _294;
        float _306 = _274 * _296;
        float _308 = _284 * _284;
        float _310 = _300 * 0.16666667163372039794921875;
        float _312 = _304 * 0.16666667163372039794921875;
        float _314 = _306 * 4.0;
        float _316 = 1.0 / _286;
        float _318 = _216 + _242;
        float _320 = -_306;
        float _322 = _320 + 6.0;
        float _324 = -_314;
        float _326 = fma(_284, _308, _324);
        float _328 = _160 + 1.5;
        float _330 = _318 * 0.16666667163372039794921875;
        float _332 = _208 * 0.16666667163372039794921875;
        float _334 = -_326;
        float _336 = _334 + _322;
        float _338 = _306 + _326;
        float _340 = 1.0 / _330;
        float _342 = fma(_332, _276, _328);
        float _344 = _336 * 0.16666667163372039794921875;
        float _346 = _160 + (-0.5);
        float _348 = _190 * _190;
        float _350 = _222 * 0.16666667163372039794921875;
        float _352 = _242 * 0.16666667163372039794921875;
        float _354 = _190 * _348;
        float _356 = fma(_350, _316, _346);
        float _358 = _162 + (-0.5);
        float _360 = 1.0 / _310;
        float _362 = _162 + 1.5;
        float _364 = _354 * 0.16666667163372039794921875;
        float _366 = _338 * 0.16666667163372039794921875;
        float _368 = fma(_352, _340, _358);
        float _370 = _232 * _232;
        float _372 = fma(_364, _298, _362);
        float _374 = 1.0 / _312;
        float _376 = _262 * _262;
        float _378 = _356 * _154;
        float _380 = _232 * _370;
        float _382 = _368 * _174;
        float _384 = _342 * _154;
        float _386 = _372 * _174;
        float _388 = _262 * _376;
        float _390 = 1.0 / _344;
        float _392 = _192 + (-0.5);
        float _394 = _212 + (-0.5);
        float _396 = _212 + 1.5;
        float _398 = _290 * 0.16666667163372039794921875;
        float _400 = _192 + 1.5;
        float _402 = _380 * 0.16666667163372039794921875;
        float _404 = _388 * 0.16666667163372039794921875;
        float _406 = 1.0 / _164;
        float _408 = fma(_398, _360, _392);
        float _410 = fma(_402, _374, _400);
        float _412 = _326 * 0.16666667163372039794921875;
        float _414 = 1.0 / _366;
        float _416 = fma(_404, _390, _396);
        float _418 = 1.0 / _166;
        float _420 = _408 * _406;
        float _422 = _410 * _406;
        float _424 = fma(_412, _414, _394);
        float2 _1159 = float2(_378, _382);
        float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1159, float2(0.0), isnan(_1159)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1159, float2(0.0), isnan(_1159)), level(_106)).xyz;
        float _430 = _428.x;
        float _432 = _428.y;
        float _434 = _428.z;
        float _436 = _424 * _418;
        float _438 = _416 * _418;
        float2 _1180 = float2(_384, _382);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1180, float2(0.0), isnan(_1180)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1180, float2(0.0), isnan(_1180)), level(_106)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1195 = float2(_378, _386);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_106)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1210 = float2(_384, _386);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_106)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1225 = float2(_420, _436);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1225, float2(0.0), isnan(_1225)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1225, float2(0.0), isnan(_1225)), level(_112)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1240 = float2(_422, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1240, float2(0.0), isnan(_1240)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1240, float2(0.0), isnan(_1240)), level(_112)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1255 = float2(_420, _438);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1255, float2(0.0), isnan(_1255)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1255, float2(0.0), isnan(_1255)), level(_112)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1270 = float2(_422, _438);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1270, float2(0.0), isnan(_1270)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1270, float2(0.0), isnan(_1270)), level(_112)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float _496 = precise::min(_76, _80);
        float _498 = -_106;
        float _500 = _100 + _498;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = 0.0 + _98;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = -_442;
        float _510 = _430 + _508;
        float _512 = -_444;
        float _514 = _432 + _512;
        float _516 = -_458;
        float _518 = _450 + _516;
        float _520 = -_462;
        float _522 = _454 + _520;
        float _524 = fma(_286, _510, _442);
        float _526 = -_460;
        float _528 = _452 + _526;
        float _530 = fma(_286, _514, _444);
        float _532 = fma(_286, _518, _458);
        float _534 = -_446;
        float _536 = _434 + _534;
        float _538 = fma(_286, _528, _460);
        float _540 = -_532;
        float _542 = _540 + _524;
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = -_538;
        float _550 = _548 + _530;
        float _552 = -_474;
        float _554 = _466 + _552;
        float _556 = -_490;
        float _558 = _482 + _556;
        float _560 = -_478;
        float _562 = _470 + _560;
        float _564 = fma(_330, _550, _538);
        float _566 = fma(_310, _546, _476);
        float _568 = -_492;
        float _570 = _484 + _568;
        float _572 = -_494;
        float _574 = _486 + _572;
        float _576 = fma(_310, _554, _474);
        float _578 = fma(_310, _558, _490);
        float _580 = fma(_310, _570, _492);
        float _582 = fma(_286, _536, _446);
        float _584 = fma(_286, _522, _462);
        float _586 = fma(_310, _562, _478);
        float _588 = fma(_310, _574, _494);
        float _590 = -_578;
        float _592 = _590 + _576;
        float _594 = -_580;
        float _596 = _594 + _566;
        float _598 = -_584;
        float _600 = _598 + _582;
        float _602 = -_588;
        float _604 = _602 + _586;
        float _606 = fma(_330, _542, _532);
        float _608 = fma(_366, _592, _578);
        float _610 = fma(_366, _596, _580);
        float _612 = fma(_330, _600, _584);
        float _614 = fma(_366, _604, _588);
        float _616 = -_606;
        float _618 = _616 + _608;
        float _620 = -_564;
        float _622 = _620 + _610;
        float _624 = -_612;
        float _626 = _624 + _614;
        float _628 = fma(_502, _618, _606);
        float _630 = fma(_502, _622, _564);
        float _632 = fma(_502, _626, _612);
        float _634 = -_628;
        float _636 = fma(_628, (*spvDescriptorSet0.fp_c3)._m0[13].x, _634);
        float _638 = -_630;
        float _640 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[13].y, _638);
        float _642 = -_632;
        float _644 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[13].z, _642);
        float _646 = fma(_496, _636, _628);
        float _648 = fma(_496, _640, _630);
        float _650 = fma(_496, _644, _632);
        out.m_34.x = _646;
        out.m_34.y = _648;
        out.m_34.z = _650;
        out.m_34.w = _506;
        return out;
    }
    discard_fragment();
    return out;
}

