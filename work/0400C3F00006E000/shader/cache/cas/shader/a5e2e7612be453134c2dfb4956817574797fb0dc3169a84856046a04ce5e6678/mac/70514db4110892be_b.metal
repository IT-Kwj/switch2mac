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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1546, thread const int& _1547, constant _10& support_buffer)
{
    int _1550 = 1 + _1547;
    float _1552 = support_buffer._m5[_1550].x;
    float _1554 = abs(_1552);
    bool _1556 = _1554 == 1.0;
    if (_1556)
    {
        return _1546;
    }
    float _1558 = float(_1546);
    float _1560 = _1558 / _1554;
    int _1562 = int(_1560);
    return _1562;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _694 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694))).x;
    float2 _705 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_705, float2(0.0), isnan(_705))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = precise::max(_68, _78);
    bool _88 = _84 != 0.0;
    bool _90 = isnan(_84);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::min(_100, _82);
    bool _104 = !_96;
    if (!_104)
    {
        float _106 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = fma(_84, _106, 1.0);
        float _110 = log2(_108);
        float _112 = _110 + (-1.0);
        float _114 = trunc(_112);
        int _116 = int(_114);
        float _118 = float(_116);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = _118 + 1.0;
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _132 = _130;
        int _134 = 2;
        int _136 = _42(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _140 = _138;
        int _142 = 2;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _148 = _146;
        int _150 = 2;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _156 = _154;
        int _158 = 2;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        float _162 = float(_136);
        float _164 = float(_144);
        float _166 = 1.0 / _162;
        float _168 = fma(_62, _162, -0.5);
        float _170 = fma(_64, _164, -0.5);
        float _172 = floor(_168);
        float _174 = floor(_170);
        float _176 = float(_152);
        float _178 = float(_160);
        float _180 = fma(_62, _176, -0.5);
        float _182 = -_172;
        float _184 = _168 + _182;
        float _186 = fma(_64, _178, -0.5);
        float _188 = floor(_180);
        float _190 = _172 + (-0.5);
        float _192 = -_184;
        float _194 = _192 + 1.0;
        float _196 = -_184;
        float _198 = _196 + 2.0;
        float _200 = _194 * _194;
        float _202 = -_174;
        float _204 = _170 + _202;
        float _206 = _198 * _198;
        float _208 = floor(_186);
        float _210 = _194 * _200;
        float _212 = -_204;
        float _214 = _212 + 1.0;
        float _216 = -_204;
        float _218 = _216 + 2.0;
        float _220 = _174 + 1.5;
        float _222 = _210 * 4.0;
        float _224 = _214 * _214;
        float _226 = 1.0 / _164;
        float _228 = -_222;
        float _230 = fma(_198, _206, _228);
        float _232 = -_210;
        float _234 = _232 + 6.0;
        float _236 = _214 * _224;
        float _238 = _218 * _218;
        float _240 = _210 + _230;
        float _242 = -_230;
        float _244 = _242 + _234;
        float _246 = _236 * 4.0;
        float _248 = 1.0 / _176;
        float _250 = _240 * 0.16666667163372039794921875;
        float _252 = _244 * 0.16666667163372039794921875;
        float _254 = -_188;
        float _256 = _180 + _254;
        float _258 = -_246;
        float _260 = fma(_218, _238, _258);
        float _262 = -_236;
        float _264 = _262 + 6.0;
        float _266 = -_208;
        float _268 = _186 + _266;
        float _270 = -_256;
        float _272 = _270 + 1.0;
        float _274 = -_256;
        float _276 = _274 + 2.0;
        float _278 = -_260;
        float _280 = _278 + _264;
        float _282 = -_268;
        float _284 = _282 + 1.0;
        float _286 = _272 * _272;
        float _288 = -_268;
        float _290 = _288 + 2.0;
        float _292 = _280 * 0.16666667163372039794921875;
        float _294 = _284 * _284;
        float _296 = _272 * _286;
        float _298 = _236 + _260;
        float _300 = 1.0 / _252;
        float _302 = _284 * _294;
        float _304 = _276 * _276;
        float _306 = _296 * 4.0;
        float _308 = -_296;
        float _310 = _308 + 6.0;
        float _312 = _302 * 4.0;
        float _314 = -_302;
        float _316 = _314 + 6.0;
        float _318 = -_306;
        float _320 = fma(_276, _304, _318);
        float _322 = _290 * _290;
        float _324 = 1.0 / _292;
        float _326 = _298 * 0.16666667163372039794921875;
        float _328 = -_320;
        float _330 = _328 + _310;
        float _332 = -_312;
        float _334 = fma(_290, _322, _332);
        float _336 = _184 * _184;
        float _338 = _204 * _204;
        float _340 = _330 * 0.16666667163372039794921875;
        float _342 = -_334;
        float _344 = _342 + _316;
        float _346 = _184 * _336;
        float _348 = 1.0 / _250;
        float _350 = _172 + 1.5;
        float _352 = _344 * 0.16666667163372039794921875;
        float _354 = _296 + _320;
        float _356 = _204 * _338;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = _230 * 0.16666667163372039794921875;
        float _362 = _354 * 0.16666667163372039794921875;
        float _364 = _174 + (-0.5);
        float _366 = _302 + _334;
        float _368 = 1.0 / _326;
        float _370 = fma(_358, _300, _350);
        float _372 = _356 * 0.16666667163372039794921875;
        float _374 = _366 * 0.16666667163372039794921875;
        float _376 = _260 * 0.16666667163372039794921875;
        float _378 = _268 * _268;
        float _380 = fma(_372, _324, _220);
        float _382 = _256 * _256;
        float _384 = 1.0 / _362;
        float _386 = fma(_360, _348, _190);
        float _388 = _268 * _378;
        float _390 = _256 * _382;
        float _392 = _188 + (-0.5);
        float _394 = _386 * _166;
        float _396 = _370 * _166;
        float _398 = _188 + 1.5;
        float _400 = 1.0 / _340;
        float _402 = fma(_376, _368, _364);
        float _404 = _320 * 0.16666667163372039794921875;
        float _406 = _208 + (-0.5);
        float _408 = _390 * 0.16666667163372039794921875;
        float _410 = _334 * 0.16666667163372039794921875;
        float _412 = _402 * _226;
        float _414 = _208 + 1.5;
        float _416 = 1.0 / _374;
        float _418 = _388 * 0.16666667163372039794921875;
        float _420 = fma(_404, _384, _392);
        float _422 = _380 * _226;
        float _424 = 1.0 / _352;
        float _426 = fma(_408, _400, _398);
        float _428 = 1.0 / _178;
        float _430 = fma(_410, _416, _406);
        float2 _1169 = float2(_394, _412);
        float3 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1169, float2(0.0), isnan(_1169)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1169, float2(0.0), isnan(_1169)), level(_118)).xyz;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _434.z;
        float _442 = fma(_418, _424, _414);
        float _444 = _420 * _248;
        float _446 = _426 * _248;
        float _448 = _430 * _428;
        float _450 = _442 * _428;
        float2 _1200 = float2(_396, _412);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1200, float2(0.0), isnan(_1200)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1200, float2(0.0), isnan(_1200)), level(_118)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1215 = float2(_394, _422);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1215, float2(0.0), isnan(_1215)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1215, float2(0.0), isnan(_1215)), level(_118)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1230 = float2(_396, _422);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1230, float2(0.0), isnan(_1230)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1230, float2(0.0), isnan(_1230)), level(_118)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1245 = float2(_444, _448);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1245, float2(0.0), isnan(_1245)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1245, float2(0.0), isnan(_1245)), level(_124)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1260 = float2(_446, _448);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1260, float2(0.0), isnan(_1260)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1260, float2(0.0), isnan(_1260)), level(_124)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1275 = float2(_444, _450);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1275, float2(0.0), isnan(_1275)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1275, float2(0.0), isnan(_1275)), level(_124)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1290 = float2(_446, _450);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1290, float2(0.0), isnan(_1290)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1290, float2(0.0), isnan(_1290)), level(_124)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float _508 = 0.0 + _110;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        float _512 = -_118;
        float _514 = _112 + _512;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_454;
        float _520 = _436 + _518;
        float _522 = -_456;
        float _524 = _438 + _522;
        float _526 = -_458;
        float _528 = _440 + _526;
        float _530 = -_472;
        float _532 = _464 + _530;
        float _534 = fma(_250, _524, _456);
        float _536 = -_474;
        float _538 = _466 + _536;
        float _540 = fma(_250, _520, _454);
        float _542 = fma(_250, _532, _472);
        float _544 = -_470;
        float _546 = _462 + _544;
        float _548 = fma(_250, _538, _474);
        float _550 = -_486;
        float _552 = _478 + _550;
        float _554 = -_542;
        float _556 = _554 + _534;
        float _558 = -_502;
        float _560 = _494 + _558;
        float _562 = -_488;
        float _564 = _480 + _562;
        float _566 = -_490;
        float _568 = _482 + _566;
        float _570 = fma(_326, _556, _542);
        float _572 = -_504;
        float _574 = _496 + _572;
        float _576 = -_506;
        float _578 = _498 + _576;
        float _580 = fma(_250, _546, _470);
        float _582 = fma(_362, _552, _486);
        float _584 = fma(_362, _560, _502);
        float _586 = fma(_362, _564, _488);
        float _588 = fma(_362, _574, _504);
        float _590 = fma(_250, _528, _458);
        float _592 = fma(_362, _568, _490);
        float _594 = fma(_362, _578, _506);
        float _596 = -_580;
        float _598 = _596 + _540;
        float _600 = -_584;
        float _602 = _600 + _582;
        float _604 = -_588;
        float _606 = _604 + _586;
        float _608 = -_548;
        float _610 = _608 + _590;
        float _612 = -_594;
        float _614 = _612 + _592;
        float _616 = fma(_326, _598, _580);
        float _618 = fma(_374, _602, _584);
        float _620 = fma(_374, _606, _588);
        float _622 = fma(_326, _610, _548);
        float _624 = fma(_374, _614, _594);
        float _626 = -_616;
        float _628 = _626 + _618;
        float _630 = -_570;
        float _632 = _630 + _620;
        float _634 = -_622;
        float _636 = _634 + _624;
        float _638 = fma(_516, _628, _616);
        float _640 = fma(_516, _632, _570);
        float _642 = fma(_516, _636, _622);
        float _644 = -_638;
        float _646 = fma(_638, (*spvDescriptorSet0.fp_c3)._m0[13].x, _644);
        float _648 = -_640;
        float _650 = fma(_640, (*spvDescriptorSet0.fp_c3)._m0[13].y, _648);
        float _652 = -_642;
        float _654 = fma(_642, (*spvDescriptorSet0.fp_c3)._m0[13].z, _652);
        float _656 = fma(_102, _646, _638);
        float _658 = fma(_102, _650, _640);
        float _660 = fma(_102, _654, _642);
        out.m_36.x = _656;
        out.m_36.y = _658;
        out.m_36.z = _660;
        out.m_36.w = _510;
        return out;
    }
    discard_fragment();
    return out;
}

