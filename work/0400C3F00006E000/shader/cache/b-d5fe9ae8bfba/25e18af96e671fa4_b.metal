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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1533, thread const int& _1534, constant _10& support_buffer)
{
    int _1537 = 1 + _1534;
    float _1539 = support_buffer._m5[_1537].x;
    float _1541 = abs(_1539);
    bool _1543 = _1541 == 1.0;
    if (_1543)
    {
        return _1533;
    }
    float _1545 = float(_1533);
    float _1547 = _1545 / _1541;
    int _1549 = int(_1547);
    return _1549;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_31.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_31.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _702 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_702, float2(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_702, float2(0.0), isnan(_702))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _62 * _74;
    float _96 = _62 * _80;
    float _98 = _62 * _86;
    float _100 = _62 * _92;
    float _102 = fma(_68, _94, _96);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    bool _108 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _110 = fma(_68, _98, _100);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    bool _114 = !_108;
    float _116 = _114 ? _104 : 0.0;
    float _118 = precise::max(_116, _112);
    bool _120 = _118 != 0.0;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.0);
    bool _128 = _124 || _126;
    bool _130 = !_128;
    if (!_130)
    {
        float _132 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _134 = fma(_118, _132, 1.0);
        float _136 = log2(_134);
        float _138 = _136 + (-1.0);
        float _140 = trunc(_138);
        int _142 = int(_140);
        float _144 = float(_142);
        float _146 = trunc(_144);
        int _148 = int(_146);
        float _150 = _144 + 1.0;
        float _152 = trunc(_150);
        int _154 = int(_152);
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).x;
        int _158 = _156;
        int _160 = 1;
        int _162 = _44(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_148), spvDescriptorSet0.fp_t_tcb_A.get_height(_148)).y;
        int _166 = _164;
        int _168 = 1;
        int _170 = _44(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_154), spvDescriptorSet0.fp_t_tcb_A.get_height(_154)).x;
        int _174 = _172;
        int _176 = 1;
        int _178 = _44(_174, _176, (*spvDescriptorSet0.support_buffer));
        int _180 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_154), spvDescriptorSet0.fp_t_tcb_A.get_height(_154)).y;
        int _182 = _180;
        int _184 = 1;
        int _186 = _44(_182, _184, (*spvDescriptorSet0.support_buffer));
        float _188 = float(_162);
        float _190 = float(_170);
        float _192 = 1.0 / _188;
        float _194 = fma(_64, _188, -0.5);
        float _196 = fma(_66, _190, -0.5);
        float _198 = floor(_194);
        float _200 = float(_178);
        float _202 = fma(_64, _200, -0.5);
        float _204 = float(_186);
        float _206 = floor(_196);
        float _208 = fma(_66, _204, -0.5);
        float _210 = -_198;
        float _212 = _194 + _210;
        float _214 = floor(_202);
        float _216 = -_212;
        float _218 = _216 + 1.0;
        float _220 = -_212;
        float _222 = _220 + 2.0;
        float _224 = _218 * _218;
        float _226 = -_206;
        float _228 = _196 + _226;
        float _230 = floor(_208);
        float _232 = _218 * _224;
        float _234 = -_228;
        float _236 = _234 + 1.0;
        float _238 = _222 * _222;
        float _240 = -_228;
        float _242 = _240 + 2.0;
        float _244 = _232 * 4.0;
        float _246 = _236 * _236;
        float _248 = 1.0 / _190;
        float _250 = -_244;
        float _252 = fma(_222, _238, _250);
        float _254 = -_232;
        float _256 = _254 + 6.0;
        float _258 = _236 * _246;
        float _260 = _242 * _242;
        float _262 = -_252;
        float _264 = _262 + _256;
        float _266 = _258 * 4.0;
        float _268 = 1.0 / _200;
        float _270 = _264 * 0.16666667163372039794921875;
        float _272 = -_214;
        float _274 = _202 + _272;
        float _276 = -_266;
        float _278 = fma(_242, _260, _276);
        float _280 = -_230;
        float _282 = _208 + _280;
        float _284 = -_258;
        float _286 = _284 + 6.0;
        float _288 = -_274;
        float _290 = _288 + 1.0;
        float _292 = -_274;
        float _294 = _292 + 2.0;
        float _296 = -_282;
        float _298 = _296 + 1.0;
        float _300 = -_278;
        float _302 = _300 + _286;
        float _304 = _290 * _290;
        float _306 = _294 * _294;
        float _308 = -_282;
        float _310 = _308 + 2.0;
        float _312 = _302 * 0.16666667163372039794921875;
        float _314 = _290 * _304;
        float _316 = _298 * _298;
        float _318 = _232 + _252;
        float _320 = 1.0 / _270;
        float _322 = _314 * 4.0;
        float _324 = _298 * _316;
        float _326 = _258 + _278;
        float _328 = -_314;
        float _330 = _328 + 6.0;
        float _332 = -_322;
        float _334 = fma(_294, _306, _332);
        float _336 = _310 * _310;
        float _338 = _324 * 4.0;
        float _340 = _318 * 0.16666667163372039794921875;
        float _342 = -_334;
        float _344 = _342 + _330;
        float _346 = -_324;
        float _348 = _346 + 6.0;
        float _350 = -_338;
        float _352 = fma(_310, _336, _350);
        float _354 = _212 * _212;
        float _356 = 1.0 / _340;
        float _358 = _326 * 0.16666667163372039794921875;
        float _360 = -_352;
        float _362 = _360 + _348;
        float _364 = _212 * _354;
        float _366 = _198 + 1.5;
        float _368 = _324 + _352;
        float _370 = _362 * 0.16666667163372039794921875;
        float _372 = _364 * 0.16666667163372039794921875;
        float _374 = 1.0 / _358;
        float _376 = _314 + _334;
        float _378 = _228 * _228;
        float _380 = fma(_372, _320, _366);
        float _382 = _198 + (-0.5);
        float _384 = _376 * 0.16666667163372039794921875;
        float _386 = _206 + (-0.5);
        float _388 = _206 + 1.5;
        float _390 = 1.0 / _312;
        float _392 = _252 * 0.16666667163372039794921875;
        float _394 = _278 * 0.16666667163372039794921875;
        float _396 = _368 * 0.16666667163372039794921875;
        float _398 = _344 * 0.16666667163372039794921875;
        float _400 = _228 * _378;
        float _402 = fma(_392, _356, _382);
        float _404 = _282 * _282;
        float _406 = 1.0 / _370;
        float _408 = _400 * 0.16666667163372039794921875;
        float _410 = fma(_394, _374, _386);
        float _412 = _402 * _192;
        float _414 = _380 * _192;
        float _416 = _274 * _274;
        float _418 = _282 * _404;
        float _420 = _410 * _248;
        float _422 = 1.0 / _396;
        float _424 = fma(_408, _390, _388);
        float _426 = _274 * _416;
        float _428 = _214 + (-0.5);
        float _430 = _230 + (-0.5);
        float _432 = _424 * _248;
        float _434 = _214 + 1.5;
        float _436 = _230 + 1.5;
        float _438 = 1.0 / _398;
        float _440 = _352 * 0.16666667163372039794921875;
        float _442 = _418 * 0.16666667163372039794921875;
        float _444 = _426 * 0.16666667163372039794921875;
        float _446 = _334 * 0.16666667163372039794921875;
        float _448 = fma(_442, _406, _436);
        float _450 = 1.0 / _204;
        float _452 = fma(_440, _422, _430);
        float _454 = 1.0 / _384;
        float _456 = fma(_444, _438, _434);
        float _458 = _456 * _268;
        float _460 = _452 * _450;
        float _462 = _448 * _450;
        float2 _1199 = float2(_412, _420);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1199, float2(0.0), isnan(_1199)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1199, float2(0.0), isnan(_1199)), level(_144)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float _474 = fma(_446, _454, _428);
        float2 _1218 = float2(_414, _420);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1218, float2(0.0), isnan(_1218)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1218, float2(0.0), isnan(_1218)), level(_144)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1233 = float2(_412, _432);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1233, float2(0.0), isnan(_1233)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1233, float2(0.0), isnan(_1233)), level(_144)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1248 = float2(_414, _432);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_144)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float _500 = _474 * _268;
        float2 _1266 = float2(_500, _460);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1266, float2(0.0), isnan(_1266)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1266, float2(0.0), isnan(_1266)), level(_150)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1281 = float2(_458, _460);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1281, float2(0.0), isnan(_1281)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1281, float2(0.0), isnan(_1281)), level(_150)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1296 = float2(_500, _462);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1296, float2(0.0), isnan(_1296)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1296, float2(0.0), isnan(_1296)), level(_150)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float2 _1311 = float2(_458, _462);
        float3 _526 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1311, float2(0.0), isnan(_1311)), level(_150)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1311, float2(0.0), isnan(_1311)), level(_150)).xyz;
        float _528 = _526.x;
        float _530 = _526.y;
        float _532 = _526.z;
        float _534 = -_144;
        float _536 = _138 + _534;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = 0.0 + _136;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        float _544 = -_478;
        float _546 = _468 + _544;
        float _548 = -_480;
        float _550 = _470 + _548;
        float _552 = -_496;
        float _554 = _488 + _552;
        float _556 = -_494;
        float _558 = _486 + _556;
        float _560 = fma(_340, _546, _478);
        float _562 = fma(_340, _550, _480);
        float _564 = fma(_340, _554, _496);
        float _566 = -_482;
        float _568 = _472 + _566;
        float _570 = -_498;
        float _572 = _490 + _570;
        float _574 = fma(_340, _558, _494);
        float _576 = -_564;
        float _578 = _576 + _562;
        float _580 = fma(_340, _568, _482);
        float _582 = -_514;
        float _584 = _506 + _582;
        float _586 = -_512;
        float _588 = _504 + _586;
        float _590 = fma(_358, _578, _564);
        float _592 = -_516;
        float _594 = _508 + _592;
        float _596 = fma(_384, _584, _514);
        float _598 = -_528;
        float _600 = _520 + _598;
        float _602 = -_530;
        float _604 = _522 + _602;
        float _606 = -_532;
        float _608 = _524 + _606;
        float _610 = fma(_340, _572, _498);
        float _612 = fma(_384, _588, _512);
        float _614 = fma(_384, _600, _528);
        float _616 = fma(_384, _604, _530);
        float _618 = fma(_384, _594, _516);
        float _620 = fma(_384, _608, _532);
        float _622 = -_610;
        float _624 = _622 + _580;
        float _626 = -_574;
        float _628 = _626 + _560;
        float _630 = -_614;
        float _632 = _630 + _612;
        float _634 = -_616;
        float _636 = _634 + _596;
        float _638 = -_620;
        float _640 = _638 + _618;
        float _642 = fma(_358, _624, _610);
        float _644 = fma(_358, _628, _574);
        float _646 = fma(_396, _632, _614);
        float _648 = fma(_396, _636, _616);
        float _650 = fma(_396, _640, _620);
        float _652 = -_644;
        float _654 = _652 + _646;
        float _656 = -_590;
        float _658 = _656 + _648;
        float _660 = -_642;
        float _662 = _660 + _650;
        float _664 = fma(_538, _654, _644);
        float _666 = fma(_538, _658, _590);
        float _668 = fma(_538, _662, _642);
        out.m_38.x = _664;
        out.m_38.y = _666;
        out.m_38.z = _668;
        out.m_38.w = _542;
        return out;
    }
    discard_fragment();
    return out;
}

