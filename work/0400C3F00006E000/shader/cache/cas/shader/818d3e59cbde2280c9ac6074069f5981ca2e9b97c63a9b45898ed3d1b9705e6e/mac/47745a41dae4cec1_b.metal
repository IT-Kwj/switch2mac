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
int _40(thread const int& _1529, thread const int& _1530, constant _10& support_buffer)
{
    int _1533 = 1 + _1530;
    float _1535 = support_buffer._m5[_1533].x;
    float _1537 = abs(_1535);
    bool _1539 = _1537 == 1.0;
    if (_1539)
    {
        return _1529;
    }
    float _1541 = float(_1529);
    float _1543 = _1541 / _1537;
    int _1545 = int(_1543);
    return _1545;
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
    float2 _688 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_688, float2(0.0), isnan(_688))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    bool _82 = _74 != 0.0;
    bool _84 = isnan(_74);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.0);
    bool _90 = _86 || _88;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    bool _96 = !_90;
    if (!_96)
    {
        float _98 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _100 = fma(_74, _98, 1.0);
        float _102 = log2(_100);
        float _104 = _102 + (-1.0);
        float _106 = trunc(_104);
        int _108 = int(_106);
        float _110 = float(_108);
        float _112 = trunc(_110);
        int _114 = int(_112);
        float _116 = _110 + 1.0;
        float _118 = trunc(_116);
        int _120 = int(_118);
        int _122 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).x;
        int _124 = _122;
        int _126 = 1;
        int _128 = _40(_124, _126, (*spvDescriptorSet0.support_buffer));
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_114), spvDescriptorSet0.fp_t_tcb_A.get_height(_114)).y;
        int _132 = _130;
        int _134 = 1;
        int _136 = _40(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_120), spvDescriptorSet0.fp_t_tcb_A.get_height(_120)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _40(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_120), spvDescriptorSet0.fp_t_tcb_A.get_height(_120)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _40(_148, _150, (*spvDescriptorSet0.support_buffer));
        float _154 = float(_128);
        float _156 = float(_136);
        float _158 = 1.0 / _154;
        float _160 = fma(_60, _154, -0.5);
        float _162 = fma(_62, _156, -0.5);
        float _164 = floor(_160);
        float _166 = floor(_162);
        float _168 = float(_144);
        float _170 = float(_152);
        float _172 = fma(_60, _168, -0.5);
        float _174 = -_164;
        float _176 = _160 + _174;
        float _178 = 1.0 / _156;
        float _180 = fma(_62, _170, -0.5);
        float _182 = -_176;
        float _184 = _182 + 1.0;
        float _186 = -_176;
        float _188 = _186 + 2.0;
        float _190 = _176 * _176;
        float _192 = -_166;
        float _194 = _162 + _192;
        float _196 = floor(_172);
        float _198 = _184 * _184;
        float _200 = _188 * _188;
        float _202 = -_194;
        float _204 = _202 + 1.0;
        float _206 = -_194;
        float _208 = _206 + 2.0;
        float _210 = _184 * _198;
        float _212 = _176 * _190;
        float _214 = _204 * _204;
        float _216 = floor(_180);
        float _218 = _210 * 4.0;
        float _220 = _204 * _214;
        float _222 = _208 * _208;
        float _224 = -_218;
        float _226 = fma(_188, _200, _224);
        float _228 = -_210;
        float _230 = _228 + 6.0;
        float _232 = _220 * 4.0;
        float _234 = -_196;
        float _236 = _172 + _234;
        float _238 = _210 + _226;
        float _240 = -_226;
        float _242 = _240 + _230;
        float _244 = -_232;
        float _246 = fma(_208, _222, _244);
        float _248 = -_236;
        float _250 = _248 + 1.0;
        float _252 = -_220;
        float _254 = _252 + 6.0;
        float _256 = _242 * 0.16666667163372039794921875;
        float _258 = -_236;
        float _260 = _258 + 2.0;
        float _262 = _250 * _250;
        float _264 = -_216;
        float _266 = _180 + _264;
        float _268 = -_246;
        float _270 = _268 + _254;
        float _272 = _260 * _260;
        float _274 = _250 * _262;
        float _276 = -_266;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _256;
        float _282 = _270 * 0.16666667163372039794921875;
        float _284 = _274 * 4.0;
        float _286 = -_266;
        float _288 = _286 + 2.0;
        float _290 = _238 * 0.16666667163372039794921875;
        float _292 = -_284;
        float _294 = fma(_260, _272, _292);
        float _296 = -_274;
        float _298 = _296 + 6.0;
        float _300 = _278 * _278;
        float _302 = 1.0 / _282;
        float _304 = _274 + _294;
        float _306 = -_294;
        float _308 = _306 + _298;
        float _310 = _278 * _300;
        float _312 = _288 * _288;
        float _314 = _304 * 0.16666667163372039794921875;
        float _316 = _308 * 0.16666667163372039794921875;
        float _318 = _310 * 4.0;
        float _320 = 1.0 / _290;
        float _322 = _220 + _246;
        float _324 = -_310;
        float _326 = _324 + 6.0;
        float _328 = -_318;
        float _330 = fma(_288, _312, _328);
        float _332 = _164 + 1.5;
        float _334 = _322 * 0.16666667163372039794921875;
        float _336 = _212 * 0.16666667163372039794921875;
        float _338 = -_330;
        float _340 = _338 + _326;
        float _342 = _310 + _330;
        float _344 = 1.0 / _334;
        float _346 = fma(_336, _280, _332);
        float _348 = _340 * 0.16666667163372039794921875;
        float _350 = _164 + (-0.5);
        float _352 = _194 * _194;
        float _354 = _226 * 0.16666667163372039794921875;
        float _356 = _246 * 0.16666667163372039794921875;
        float _358 = _194 * _352;
        float _360 = fma(_354, _320, _350);
        float _362 = _166 + (-0.5);
        float _364 = 1.0 / _314;
        float _366 = _166 + 1.5;
        float _368 = _358 * 0.16666667163372039794921875;
        float _370 = _342 * 0.16666667163372039794921875;
        float _372 = fma(_356, _344, _362);
        float _374 = _236 * _236;
        float _376 = fma(_368, _302, _366);
        float _378 = 1.0 / _316;
        float _380 = _266 * _266;
        float _382 = _360 * _158;
        float _384 = _236 * _374;
        float _386 = _372 * _178;
        float _388 = _346 * _158;
        float _390 = _376 * _178;
        float _392 = _266 * _380;
        float _394 = 1.0 / _348;
        float _396 = _196 + (-0.5);
        float _398 = _216 + (-0.5);
        float _400 = _216 + 1.5;
        float _402 = _294 * 0.16666667163372039794921875;
        float _404 = _196 + 1.5;
        float _406 = _384 * 0.16666667163372039794921875;
        float _408 = _392 * 0.16666667163372039794921875;
        float _410 = 1.0 / _168;
        float _412 = fma(_402, _364, _396);
        float _414 = fma(_406, _378, _404);
        float _416 = _330 * 0.16666667163372039794921875;
        float _418 = 1.0 / _370;
        float _420 = fma(_408, _394, _400);
        float _422 = 1.0 / _170;
        float _424 = _412 * _410;
        float _426 = _414 * _410;
        float _428 = fma(_416, _418, _398);
        float2 _1159 = float2(_382, _386);
        float3 _432 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1159, float2(0.0), isnan(_1159)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1159, float2(0.0), isnan(_1159)), level(_110)).xyz;
        float _434 = _432.x;
        float _436 = _432.y;
        float _438 = _432.z;
        float _440 = _428 * _422;
        float _442 = _420 * _422;
        float2 _1180 = float2(_388, _386);
        float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1180, float2(0.0), isnan(_1180)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1180, float2(0.0), isnan(_1180)), level(_110)).xyz;
        float _446 = _444.x;
        float _448 = _444.y;
        float _450 = _444.z;
        float2 _1195 = float2(_382, _390);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_110)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1210 = float2(_388, _390);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_110)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_110)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1225 = float2(_424, _440);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1225, float2(0.0), isnan(_1225)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1225, float2(0.0), isnan(_1225)), level(_116)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1240 = float2(_426, _440);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1240, float2(0.0), isnan(_1240)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1240, float2(0.0), isnan(_1240)), level(_116)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1255 = float2(_424, _442);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1255, float2(0.0), isnan(_1255)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1255, float2(0.0), isnan(_1255)), level(_116)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1270 = float2(_426, _442);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1270, float2(0.0), isnan(_1270)), level(_116)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1270, float2(0.0), isnan(_1270)), level(_116)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float _500 = precise::min(_94, _78);
        float _502 = -_110;
        float _504 = _104 + _502;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = 0.0 + _102;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_446;
        float _514 = _434 + _512;
        float _516 = -_448;
        float _518 = _436 + _516;
        float _520 = -_462;
        float _522 = _454 + _520;
        float _524 = -_466;
        float _526 = _458 + _524;
        float _528 = fma(_290, _514, _446);
        float _530 = -_464;
        float _532 = _456 + _530;
        float _534 = fma(_290, _518, _448);
        float _536 = fma(_290, _522, _462);
        float _538 = -_450;
        float _540 = _438 + _538;
        float _542 = fma(_290, _532, _464);
        float _544 = -_536;
        float _546 = _544 + _528;
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = -_542;
        float _554 = _552 + _534;
        float _556 = -_478;
        float _558 = _470 + _556;
        float _560 = -_494;
        float _562 = _486 + _560;
        float _564 = -_482;
        float _566 = _474 + _564;
        float _568 = fma(_334, _554, _542);
        float _570 = fma(_314, _550, _480);
        float _572 = -_496;
        float _574 = _488 + _572;
        float _576 = -_498;
        float _578 = _490 + _576;
        float _580 = fma(_314, _558, _478);
        float _582 = fma(_314, _562, _494);
        float _584 = fma(_314, _574, _496);
        float _586 = fma(_290, _540, _450);
        float _588 = fma(_290, _526, _466);
        float _590 = fma(_314, _566, _482);
        float _592 = fma(_314, _578, _498);
        float _594 = -_582;
        float _596 = _594 + _580;
        float _598 = -_584;
        float _600 = _598 + _570;
        float _602 = -_588;
        float _604 = _602 + _586;
        float _606 = -_592;
        float _608 = _606 + _590;
        float _610 = fma(_334, _546, _536);
        float _612 = fma(_370, _596, _582);
        float _614 = fma(_370, _600, _584);
        float _616 = fma(_334, _604, _588);
        float _618 = fma(_370, _608, _592);
        float _620 = -_610;
        float _622 = _620 + _612;
        float _624 = -_568;
        float _626 = _624 + _614;
        float _628 = -_616;
        float _630 = _628 + _618;
        float _632 = fma(_506, _622, _610);
        float _634 = fma(_506, _626, _568);
        float _636 = fma(_506, _630, _616);
        float _638 = -_632;
        float _640 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[13].x, _638);
        float _642 = -_634;
        float _644 = fma(_634, (*spvDescriptorSet0.fp_c3)._m0[13].y, _642);
        float _646 = -_636;
        float _648 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[13].z, _646);
        float _650 = fma(_500, _640, _632);
        float _652 = fma(_500, _644, _634);
        float _654 = fma(_500, _648, _636);
        out.m_34.x = _650;
        out.m_34.y = _652;
        out.m_34.z = _654;
        out.m_34.w = _510;
        return out;
    }
    discard_fragment();
    return out;
}

