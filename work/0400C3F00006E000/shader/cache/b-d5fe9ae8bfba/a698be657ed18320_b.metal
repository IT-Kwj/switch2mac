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
int _40(thread const int& _1431, thread const int& _1432, constant _10& support_buffer)
{
    int _1435 = 1 + _1432;
    float _1437 = support_buffer._m5[_1435].x;
    float _1439 = abs(_1437);
    bool _1441 = _1439 == 1.0;
    if (_1441)
    {
        return _1431;
    }
    float _1443 = float(_1431);
    float _1445 = _1443 / _1439;
    int _1447 = int(_1445);
    return _1447;
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
    float2 _654 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_654, float2(0.0), isnan(_654))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    bool _72 = _68 != 0.0;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan(0.0);
    bool _80 = _76 || _78;
    bool _82 = !_80;
    if (!_82)
    {
        float _84 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _86 = fma(_68, _84, 1.0);
        float _88 = log2(_86);
        float _90 = _88 + (-1.0);
        float _92 = trunc(_90);
        int _94 = int(_92);
        float _96 = float(_94);
        float _98 = trunc(_96);
        int _100 = int(_98);
        float _102 = _96 + 1.0;
        float _104 = trunc(_102);
        int _106 = int(_104);
        int _108 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_100), spvDescriptorSet0.fp_t_tcb_A.get_height(_100)).x;
        int _110 = _108;
        int _112 = 1;
        int _114 = _40(_110, _112, (*spvDescriptorSet0.support_buffer));
        int _116 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_100), spvDescriptorSet0.fp_t_tcb_A.get_height(_100)).y;
        int _118 = _116;
        int _120 = 1;
        int _122 = _40(_118, _120, (*spvDescriptorSet0.support_buffer));
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _40(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _40(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_114);
        float _142 = float(_122);
        float _144 = 1.0 / _140;
        float _146 = fma(_60, _140, -0.5);
        float _148 = fma(_62, _142, -0.5);
        float _150 = floor(_146);
        float _152 = float(_130);
        float _154 = fma(_60, _152, -0.5);
        float _156 = float(_138);
        float _158 = floor(_148);
        float _160 = fma(_62, _156, -0.5);
        float _162 = -_150;
        float _164 = _146 + _162;
        float _166 = floor(_154);
        float _168 = -_164;
        float _170 = _168 + 1.0;
        float _172 = -_164;
        float _174 = _172 + 2.0;
        float _176 = _170 * _170;
        float _178 = -_158;
        float _180 = _148 + _178;
        float _182 = _174 * _174;
        float _184 = floor(_160);
        float _186 = _170 * _176;
        float _188 = -_180;
        float _190 = _188 + 1.0;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _186 * 4.0;
        float _198 = _190 * _190;
        float _200 = 1.0 / _142;
        float _202 = -_196;
        float _204 = fma(_174, _182, _202);
        float _206 = -_186;
        float _208 = _206 + 6.0;
        float _210 = _190 * _198;
        float _212 = _194 * _194;
        float _214 = -_204;
        float _216 = _214 + _208;
        float _218 = _210 * 4.0;
        float _220 = 1.0 / _152;
        float _222 = _216 * 0.16666667163372039794921875;
        float _224 = -_166;
        float _226 = _154 + _224;
        float _228 = -_218;
        float _230 = fma(_194, _212, _228);
        float _232 = -_210;
        float _234 = _232 + 6.0;
        float _236 = -_184;
        float _238 = _160 + _236;
        float _240 = -_226;
        float _242 = _240 + 1.0;
        float _244 = -_226;
        float _246 = _244 + 2.0;
        float _248 = -_230;
        float _250 = _248 + _234;
        float _252 = -_238;
        float _254 = _252 + 1.0;
        float _256 = _242 * _242;
        float _258 = _246 * _246;
        float _260 = _250 * 0.16666667163372039794921875;
        float _262 = _254 * _254;
        float _264 = _242 * _256;
        float _266 = -_238;
        float _268 = _266 + 2.0;
        float _270 = _186 + _204;
        float _272 = _254 * _262;
        float _274 = _264 * 4.0;
        float _276 = _210 + _230;
        float _278 = -_264;
        float _280 = _278 + 6.0;
        float _282 = 1.0 / _222;
        float _284 = -_274;
        float _286 = fma(_246, _258, _284);
        float _288 = _268 * _268;
        float _290 = _272 * 4.0;
        float _292 = _270 * 0.16666667163372039794921875;
        float _294 = -_286;
        float _296 = _294 + _280;
        float _298 = -_272;
        float _300 = _298 + 6.0;
        float _302 = -_290;
        float _304 = fma(_268, _288, _302);
        float _306 = _164 * _164;
        float _308 = 1.0 / _292;
        float _310 = _276 * 0.16666667163372039794921875;
        float _312 = -_304;
        float _314 = _312 + _300;
        float _316 = _164 * _306;
        float _318 = _150 + 1.5;
        float _320 = _272 + _304;
        float _322 = _314 * 0.16666667163372039794921875;
        float _324 = _316 * 0.16666667163372039794921875;
        float _326 = _264 + _286;
        float _328 = 1.0 / _310;
        float _330 = _204 * 0.16666667163372039794921875;
        float _332 = fma(_324, _282, _318);
        float _334 = _150 + (-0.5);
        float _336 = _326 * 0.16666667163372039794921875;
        float _338 = _158 + (-0.5);
        float _340 = _158 + 1.5;
        float _342 = _230 * 0.16666667163372039794921875;
        float _344 = 1.0 / _260;
        float _346 = _320 * 0.16666667163372039794921875;
        float _348 = _180 * _180;
        float _350 = fma(_330, _308, _334);
        float _352 = _296 * 0.16666667163372039794921875;
        float _354 = _238 * _238;
        float _356 = _180 * _348;
        float _358 = 1.0 / _322;
        float _360 = fma(_342, _328, _338);
        float _362 = _356 * 0.16666667163372039794921875;
        float _364 = _238 * _354;
        float _366 = _350 * _144;
        float _368 = _332 * _144;
        float _370 = _226 * _226;
        float _372 = _184 + (-0.5);
        float _374 = 1.0 / _346;
        float _376 = fma(_362, _344, _340);
        float _378 = _184 + 1.5;
        float _380 = _304 * 0.16666667163372039794921875;
        float _382 = _364 * 0.16666667163372039794921875;
        float _384 = _226 * _370;
        float _386 = _360 * _200;
        float _388 = _376 * _200;
        float _390 = 1.0 / _156;
        float _392 = fma(_382, _358, _378);
        float _394 = _166 + (-0.5);
        float _396 = _166 + 1.5;
        float _398 = _286 * 0.16666667163372039794921875;
        float _400 = _384 * 0.16666667163372039794921875;
        float _402 = 1.0 / _352;
        float _404 = fma(_380, _374, _372);
        float _406 = 1.0 / _336;
        float _408 = _404 * _390;
        float _410 = _392 * _390;
        float _412 = fma(_400, _402, _396);
        float2 _1093 = float2(_366, _386);
        float3 _416 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1093, float2(0.0), isnan(_1093)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1093, float2(0.0), isnan(_1093)), level(_96)).xyz;
        float _418 = _416.x;
        float _420 = _416.y;
        float _422 = _416.z;
        float2 _1108 = float2(_368, _386);
        float3 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1108, float2(0.0), isnan(_1108)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1108, float2(0.0), isnan(_1108)), level(_96)).xyz;
        float _426 = _424.x;
        float _428 = _424.y;
        float _430 = _424.z;
        float2 _1123 = float2(_366, _388);
        float3 _432 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1123, float2(0.0), isnan(_1123)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1123, float2(0.0), isnan(_1123)), level(_96)).xyz;
        float _434 = _432.x;
        float _436 = _432.y;
        float _438 = _432.z;
        float _440 = fma(_398, _406, _394);
        float _442 = _440 * _220;
        float _444 = _412 * _220;
        float2 _1148 = float2(_368, _388);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1148, float2(0.0), isnan(_1148)), level(_96)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1148, float2(0.0), isnan(_1148)), level(_96)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1163 = float2(_442, _408);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1163, float2(0.0), isnan(_1163)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1163, float2(0.0), isnan(_1163)), level(_102)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1178 = float2(_444, _408);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1178, float2(0.0), isnan(_1178)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1178, float2(0.0), isnan(_1178)), level(_102)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float2 _1193 = float2(_442, _410);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1193, float2(0.0), isnan(_1193)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1193, float2(0.0), isnan(_1193)), level(_102)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1208 = float2(_444, _410);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1208, float2(0.0), isnan(_1208)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1208, float2(0.0), isnan(_1208)), level(_102)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float _486 = 0.0 + _88;
        float _488 = precise::clamp(_486, 0.0, 1.0);
        float _490 = -_96;
        float _492 = _90 + _490;
        float _494 = precise::clamp(_492, 0.0, 1.0);
        float _496 = -_426;
        float _498 = _418 + _496;
        float _500 = -_428;
        float _502 = _420 + _500;
        float _504 = -_430;
        float _506 = _422 + _504;
        float _508 = fma(_292, _498, _426);
        float _510 = fma(_292, _502, _428);
        float _512 = fma(_292, _506, _430);
        float _514 = -_450;
        float _516 = _436 + _514;
        float _518 = -_448;
        float _520 = _434 + _518;
        float _522 = -_452;
        float _524 = _438 + _522;
        float _526 = fma(_292, _516, _450);
        float _528 = fma(_292, _520, _448);
        float _530 = -_466;
        float _532 = _458 + _530;
        float _534 = -_464;
        float _536 = _456 + _534;
        float _538 = -_526;
        float _540 = _538 + _510;
        float _542 = -_468;
        float _544 = _460 + _542;
        float _546 = fma(_336, _532, _466);
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = fma(_310, _540, _526);
        float _554 = -_482;
        float _556 = _474 + _554;
        float _558 = -_484;
        float _560 = _476 + _558;
        float _562 = fma(_292, _524, _452);
        float _564 = fma(_336, _536, _464);
        float _566 = fma(_336, _550, _480);
        float _568 = fma(_336, _556, _482);
        float _570 = fma(_336, _544, _468);
        float _572 = fma(_336, _560, _484);
        float _574 = -_562;
        float _576 = _574 + _512;
        float _578 = -_528;
        float _580 = _578 + _508;
        float _582 = -_566;
        float _584 = _582 + _564;
        float _586 = -_568;
        float _588 = _586 + _546;
        float _590 = -_572;
        float _592 = _590 + _570;
        float _594 = fma(_310, _576, _562);
        float _596 = fma(_310, _580, _528);
        float _598 = fma(_346, _584, _566);
        float _600 = fma(_346, _588, _568);
        float _602 = fma(_346, _592, _572);
        float _604 = -_596;
        float _606 = _604 + _598;
        float _608 = -_552;
        float _610 = _608 + _600;
        float _612 = -_594;
        float _614 = _612 + _602;
        float _616 = fma(_494, _606, _596);
        float _618 = fma(_494, _610, _552);
        float _620 = fma(_494, _614, _594);
        out.m_34.x = _616;
        out.m_34.y = _618;
        out.m_34.z = _620;
        out.m_34.w = _488;
        return out;
    }
    discard_fragment();
    return out;
}

