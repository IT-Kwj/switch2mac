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
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1531, thread const int& _1532, constant _10& support_buffer)
{
    int _1535 = 1 + _1532;
    float _1537 = support_buffer._m5[_1535].x;
    float _1539 = abs(_1537);
    bool _1541 = _1539 == 1.0;
    if (_1541)
    {
        return _1531;
    }
    float _1543 = float(_1531);
    float _1545 = _1543 / _1539;
    int _1547 = int(_1545);
    return _1547;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _692 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).x;
    bool _72 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_72)
    {
        discard_fragment();
    }
    float2 _712 = float2(_64, _66);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_712, float2(0.0), isnan(_712))).x;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    if (_72)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _80 = in.m_38.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = precise::max(_74, _78);
    float _100 = _62 * _84;
    float _102 = _62 * _96;
    float _104 = precise::max(_98, _100);
    float _106 = _62 * _90;
    bool _108 = _104 != 0.0;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    bool _118 = !_116;
    if (!_118)
    {
        float _120 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _122 = fma(_104, _120, 1.0);
        float _124 = log2(_122);
        float _126 = _124 + (-1.0);
        float _128 = trunc(_126);
        int _130 = int(_128);
        float _132 = float(_130);
        float _134 = trunc(_132);
        int _136 = int(_134);
        float _138 = _132 + 1.0;
        float _140 = trunc(_138);
        int _142 = int(_140);
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _146 = _144;
        int _148 = 2;
        int _150 = _44(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _154 = _152;
        int _156 = 2;
        int _158 = _44(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).x;
        int _162 = _160;
        int _164 = 2;
        int _166 = _44(_162, _164, (*spvDescriptorSet0.support_buffer));
        int _168 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _170 = _168;
        int _172 = 2;
        int _174 = _44(_170, _172, (*spvDescriptorSet0.support_buffer));
        float _176 = float(_150);
        float _178 = float(_158);
        float _180 = 1.0 / _176;
        float _182 = fma(_64, _176, -0.5);
        float _184 = fma(_66, _178, -0.5);
        float _186 = floor(_182);
        float _188 = floor(_184);
        float _190 = float(_166);
        float _192 = float(_174);
        float _194 = fma(_64, _190, -0.5);
        float _196 = -_186;
        float _198 = _182 + _196;
        float _200 = fma(_66, _192, -0.5);
        float _202 = floor(_194);
        float _204 = -_198;
        float _206 = _204 + 1.0;
        float _208 = -_198;
        float _210 = _208 + 2.0;
        float _212 = -_188;
        float _214 = _184 + _212;
        float _216 = _206 * _206;
        float _218 = floor(_200);
        float _220 = -_214;
        float _222 = _220 + 1.0;
        float _224 = _206 * _216;
        float _226 = _210 * _210;
        float _228 = -_214;
        float _230 = _228 + 2.0;
        float _232 = _222 * _222;
        float _234 = _224 * 4.0;
        float _236 = 1.0 / _178;
        float _238 = _222 * _232;
        float _240 = -_234;
        float _242 = fma(_210, _226, _240);
        float _244 = -_224;
        float _246 = _244 + 6.0;
        float _248 = _230 * _230;
        float _250 = _238 * 4.0;
        float _252 = -_202;
        float _254 = _194 + _252;
        float _256 = -_242;
        float _258 = _256 + _246;
        float _260 = 1.0 / _190;
        float _262 = -_250;
        float _264 = fma(_230, _248, _262);
        float _266 = -_254;
        float _268 = _266 + 1.0;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = -_254;
        float _274 = _272 + 2.0;
        float _276 = -_238;
        float _278 = _276 + 6.0;
        float _280 = _268 * _268;
        float _282 = _224 + _242;
        float _284 = _274 * _274;
        float _286 = -_264;
        float _288 = _286 + _278;
        float _290 = _268 * _280;
        float _292 = -_218;
        float _294 = _200 + _292;
        float _296 = 1.0 / _270;
        float _298 = _288 * 0.16666667163372039794921875;
        float _300 = _290 * 4.0;
        float _302 = -_294;
        float _304 = _302 + 1.0;
        float _306 = -_290;
        float _308 = _306 + 6.0;
        float _310 = _282 * 0.16666667163372039794921875;
        float _312 = -_300;
        float _314 = fma(_274, _284, _312);
        float _316 = _304 * _304;
        float _318 = -_294;
        float _320 = _318 + 2.0;
        float _322 = 1.0 / _310;
        float _324 = -_314;
        float _326 = _324 + _308;
        float _328 = _304 * _316;
        float _330 = _198 * _198;
        float _332 = _320 * _320;
        float _334 = _326 * 0.16666667163372039794921875;
        float _336 = _328 * 4.0;
        float _338 = _238 + _264;
        float _340 = _198 * _330;
        float _342 = 1.0 / _298;
        float _344 = -_336;
        float _346 = fma(_320, _332, _344);
        float _348 = _338 * 0.16666667163372039794921875;
        float _350 = _186 + 1.5;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = -_328;
        float _356 = _354 + 6.0;
        float _358 = _186 + (-0.5);
        float _360 = _214 * _214;
        float _362 = 1.0 / _348;
        float _364 = fma(_352, _296, _350);
        float _366 = _242 * 0.16666667163372039794921875;
        float _368 = -_346;
        float _370 = _368 + _356;
        float _372 = _214 * _360;
        float _374 = _290 + _314;
        float _376 = fma(_366, _322, _358);
        float _378 = _328 + _346;
        float _380 = 1.0 / _334;
        float _382 = _370 * 0.16666667163372039794921875;
        float _384 = _188 + (-0.5);
        float _386 = _374 * 0.16666667163372039794921875;
        float _388 = _378 * 0.16666667163372039794921875;
        float _390 = _264 * 0.16666667163372039794921875;
        float _392 = _202 + 1.5;
        float _394 = _346 * 0.16666667163372039794921875;
        float _396 = 1.0 / _382;
        float _398 = _188 + 1.5;
        float _400 = _372 * 0.16666667163372039794921875;
        float _402 = fma(_390, _362, _384);
        float _404 = _294 * _294;
        float _406 = _254 * _254;
        float _408 = fma(_400, _342, _398);
        float _410 = _376 * _180;
        float _412 = 1.0 / _386;
        float _414 = _294 * _404;
        float _416 = _254 * _406;
        float _418 = _202 + (-0.5);
        float _420 = _364 * _180;
        float _422 = _402 * _236;
        float _424 = _218 + 1.5;
        float _426 = _314 * 0.16666667163372039794921875;
        float _428 = 1.0 / _388;
        float _430 = _414 * 0.16666667163372039794921875;
        float _432 = _218 + (-0.5);
        float _434 = _416 * 0.16666667163372039794921875;
        float _436 = _408 * _236;
        float _438 = fma(_430, _396, _424);
        float _440 = fma(_434, _380, _392);
        float _442 = 1.0 / _192;
        float _444 = fma(_426, _412, _418);
        float _446 = _444 * _260;
        float _448 = _440 * _260;
        float _450 = fma(_394, _428, _432);
        float2 _1195 = float2(_410, _422);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_132)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = _450 * _442;
        float _464 = _438 * _442;
        float2 _1216 = float2(_420, _422);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_132)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1231 = float2(_410, _436);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_132)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1246 = float2(_420, _436);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_132)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1261 = float2(_446, _462);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1261, float2(0.0), isnan(_1261)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1261, float2(0.0), isnan(_1261)), level(_138)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1276 = float2(_448, _462);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1276, float2(0.0), isnan(_1276)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1276, float2(0.0), isnan(_1276)), level(_138)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1291 = float2(_446, _464);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1291, float2(0.0), isnan(_1291)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1291, float2(0.0), isnan(_1291)), level(_138)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float2 _1306 = float2(_448, _464);
        float3 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306)), level(_138)).xyz;
        float _516 = _514.x;
        float _518 = _514.y;
        float _520 = _514.z;
        float _522 = 0.0 + _124;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = fma(_102, _524, _106);
        float _528 = -_132;
        float _530 = _126 + _528;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        float _534 = -_468;
        float _536 = _456 + _534;
        float _538 = -_470;
        float _540 = _458 + _538;
        float _542 = -_472;
        float _544 = _460 + _542;
        float _546 = fma(_310, _536, _468);
        float _548 = -_486;
        float _550 = _478 + _548;
        float _552 = -_484;
        float _554 = _476 + _552;
        float _556 = -_488;
        float _558 = _480 + _556;
        float _560 = fma(_310, _540, _470);
        float _562 = fma(_310, _550, _486);
        float _564 = -_500;
        float _566 = _492 + _564;
        float _568 = -_502;
        float _570 = _494 + _568;
        float _572 = -_504;
        float _574 = _496 + _572;
        float _576 = fma(_310, _544, _472);
        float _578 = fma(_386, _566, _500);
        float _580 = fma(_386, _570, _502);
        float _582 = -_516;
        float _584 = _508 + _582;
        float _586 = -_518;
        float _588 = _510 + _586;
        float _590 = -_520;
        float _592 = _512 + _590;
        float _594 = fma(_310, _554, _484);
        float _596 = fma(_386, _584, _516);
        float _598 = fma(_386, _588, _518);
        float _600 = fma(_310, _558, _488);
        float _602 = fma(_386, _574, _504);
        float _604 = fma(_386, _592, _520);
        float _606 = -_594;
        float _608 = _606 + _546;
        float _610 = -_562;
        float _612 = _610 + _560;
        float _614 = -_596;
        float _616 = _614 + _578;
        float _618 = -_598;
        float _620 = _618 + _580;
        float _622 = -_600;
        float _624 = _622 + _576;
        float _626 = -_604;
        float _628 = _626 + _602;
        float _630 = fma(_348, _608, _594);
        float _632 = fma(_348, _612, _562);
        float _634 = fma(_388, _616, _596);
        float _636 = fma(_388, _620, _598);
        float _638 = fma(_348, _624, _600);
        float _640 = fma(_388, _628, _604);
        float _642 = -_630;
        float _644 = _642 + _634;
        float _646 = -_632;
        float _648 = _646 + _636;
        float _650 = -_638;
        float _652 = _650 + _640;
        float _654 = fma(_532, _644, _630);
        float _656 = fma(_532, _648, _632);
        float _658 = fma(_532, _652, _638);
        out.m_36.x = _654;
        out.m_36.y = _656;
        out.m_36.z = _658;
        out.m_36.w = _526;
        return out;
    }
    discard_fragment();
    return out;
}

