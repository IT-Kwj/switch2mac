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
int _40(thread const int& _1448, thread const int& _1449, constant _10& support_buffer)
{
    int _1452 = 1 + _1449;
    float _1454 = support_buffer._m5[_1452].x;
    float _1456 = abs(_1454);
    bool _1458 = _1456 == 1.0;
    if (_1458)
    {
        return _1448;
    }
    float _1460 = float(_1448);
    float _1462 = _1460 / _1456;
    int _1464 = int(_1462);
    return _1464;
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
    float2 _660 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_660, float2(0.0), isnan(_660))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_660, float2(0.0), isnan(_660))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = precise::max(_68, _72);
    bool _78 = _74 != 0.0;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan(0.0);
    bool _86 = _82 || _84;
    bool _88 = !_86;
    if (!_88)
    {
        float _90 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _92 = fma(_74, _90, 1.0);
        float _94 = log2(_92);
        float _96 = _94 + (-1.0);
        float _98 = trunc(_96);
        int _100 = int(_98);
        float _102 = float(_100);
        float _104 = trunc(_102);
        int _106 = int(_104);
        float _108 = _102 + 1.0;
        float _110 = trunc(_108);
        int _112 = int(_110);
        int _114 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).x;
        int _116 = _114;
        int _118 = 1;
        int _120 = _40(_116, _118, (*spvDescriptorSet0.support_buffer));
        int _122 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).y;
        int _124 = _122;
        int _126 = 1;
        int _128 = _40(_124, _126, (*spvDescriptorSet0.support_buffer));
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_112), spvDescriptorSet0.fp_t_tcb_A.get_height(_112)).x;
        int _132 = _130;
        int _134 = 1;
        int _136 = _40(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_112), spvDescriptorSet0.fp_t_tcb_A.get_height(_112)).y;
        int _140 = _138;
        int _142 = 1;
        int _144 = _40(_140, _142, (*spvDescriptorSet0.support_buffer));
        float _146 = float(_120);
        float _148 = float(_128);
        float _150 = 1.0 / _146;
        float _152 = fma(_60, _146, -0.5);
        float _154 = fma(_62, _148, -0.5);
        float _156 = floor(_152);
        float _158 = float(_136);
        float _160 = fma(_60, _158, -0.5);
        float _162 = float(_144);
        float _164 = floor(_154);
        float _166 = fma(_62, _162, -0.5);
        float _168 = -_156;
        float _170 = _152 + _168;
        float _172 = floor(_160);
        float _174 = -_170;
        float _176 = _174 + 1.0;
        float _178 = -_170;
        float _180 = _178 + 2.0;
        float _182 = _176 * _176;
        float _184 = -_164;
        float _186 = _154 + _184;
        float _188 = _180 * _180;
        float _190 = floor(_166);
        float _192 = _176 * _182;
        float _194 = -_186;
        float _196 = _194 + 1.0;
        float _198 = -_186;
        float _200 = _198 + 2.0;
        float _202 = _192 * 4.0;
        float _204 = _196 * _196;
        float _206 = 1.0 / _148;
        float _208 = -_202;
        float _210 = fma(_180, _188, _208);
        float _212 = -_192;
        float _214 = _212 + 6.0;
        float _216 = _196 * _204;
        float _218 = _200 * _200;
        float _220 = -_210;
        float _222 = _220 + _214;
        float _224 = _216 * 4.0;
        float _226 = 1.0 / _158;
        float _228 = _222 * 0.16666667163372039794921875;
        float _230 = -_172;
        float _232 = _160 + _230;
        float _234 = -_224;
        float _236 = fma(_200, _218, _234);
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = -_190;
        float _244 = _166 + _242;
        float _246 = -_232;
        float _248 = _246 + 1.0;
        float _250 = -_232;
        float _252 = _250 + 2.0;
        float _254 = -_236;
        float _256 = _254 + _240;
        float _258 = -_244;
        float _260 = _258 + 1.0;
        float _262 = _248 * _248;
        float _264 = _252 * _252;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = _260 * _260;
        float _270 = _248 * _262;
        float _272 = -_244;
        float _274 = _272 + 2.0;
        float _276 = _192 + _210;
        float _278 = _260 * _268;
        float _280 = _270 * 4.0;
        float _282 = _216 + _236;
        float _284 = -_270;
        float _286 = _284 + 6.0;
        float _288 = 1.0 / _228;
        float _290 = -_280;
        float _292 = fma(_252, _264, _290);
        float _294 = _274 * _274;
        float _296 = _278 * 4.0;
        float _298 = _276 * 0.16666667163372039794921875;
        float _300 = -_292;
        float _302 = _300 + _286;
        float _304 = -_278;
        float _306 = _304 + 6.0;
        float _308 = -_296;
        float _310 = fma(_274, _294, _308);
        float _312 = _170 * _170;
        float _314 = 1.0 / _298;
        float _316 = _282 * 0.16666667163372039794921875;
        float _318 = -_310;
        float _320 = _318 + _306;
        float _322 = _170 * _312;
        float _324 = _156 + 1.5;
        float _326 = _278 + _310;
        float _328 = _320 * 0.16666667163372039794921875;
        float _330 = _322 * 0.16666667163372039794921875;
        float _332 = _270 + _292;
        float _334 = 1.0 / _316;
        float _336 = _210 * 0.16666667163372039794921875;
        float _338 = fma(_330, _288, _324);
        float _340 = _156 + (-0.5);
        float _342 = _332 * 0.16666667163372039794921875;
        float _344 = _164 + (-0.5);
        float _346 = _164 + 1.5;
        float _348 = _236 * 0.16666667163372039794921875;
        float _350 = 1.0 / _266;
        float _352 = _326 * 0.16666667163372039794921875;
        float _354 = _186 * _186;
        float _356 = fma(_336, _314, _340);
        float _358 = _302 * 0.16666667163372039794921875;
        float _360 = _244 * _244;
        float _362 = _186 * _354;
        float _364 = 1.0 / _328;
        float _366 = fma(_348, _334, _344);
        float _368 = _362 * 0.16666667163372039794921875;
        float _370 = _244 * _360;
        float _372 = _356 * _150;
        float _374 = _338 * _150;
        float _376 = _232 * _232;
        float _378 = _190 + (-0.5);
        float _380 = 1.0 / _352;
        float _382 = fma(_368, _350, _346);
        float _384 = _190 + 1.5;
        float _386 = _310 * 0.16666667163372039794921875;
        float _388 = _370 * 0.16666667163372039794921875;
        float _390 = _232 * _376;
        float _392 = _366 * _206;
        float _394 = _382 * _206;
        float _396 = 1.0 / _162;
        float _398 = fma(_388, _364, _384);
        float _400 = _172 + (-0.5);
        float _402 = _172 + 1.5;
        float _404 = _292 * 0.16666667163372039794921875;
        float _406 = _390 * 0.16666667163372039794921875;
        float _408 = 1.0 / _358;
        float _410 = fma(_386, _380, _378);
        float _412 = 1.0 / _342;
        float _414 = _410 * _396;
        float _416 = _398 * _396;
        float _418 = fma(_406, _408, _402);
        float2 _1110 = float2(_372, _392);
        float3 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1110, float2(0.0), isnan(_1110)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1110, float2(0.0), isnan(_1110)), level(_102)).xyz;
        float _424 = _422.x;
        float _426 = _422.y;
        float _428 = _422.z;
        float2 _1125 = float2(_374, _392);
        float3 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1125, float2(0.0), isnan(_1125)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1125, float2(0.0), isnan(_1125)), level(_102)).xyz;
        float _432 = _430.x;
        float _434 = _430.y;
        float _436 = _430.z;
        float2 _1140 = float2(_372, _394);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1140, float2(0.0), isnan(_1140)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1140, float2(0.0), isnan(_1140)), level(_102)).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float _446 = fma(_404, _412, _400);
        float _448 = _446 * _226;
        float _450 = _418 * _226;
        float2 _1165 = float2(_374, _394);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1165, float2(0.0), isnan(_1165)), level(_102)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1165, float2(0.0), isnan(_1165)), level(_102)).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float2 _1180 = float2(_448, _414);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1180, float2(0.0), isnan(_1180)), level(_108)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1180, float2(0.0), isnan(_1180)), level(_108)).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        float2 _1195 = float2(_450, _414);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1195, float2(0.0), isnan(_1195)), level(_108)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1195, float2(0.0), isnan(_1195)), level(_108)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1210 = float2(_448, _416);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1210, float2(0.0), isnan(_1210)), level(_108)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1210, float2(0.0), isnan(_1210)), level(_108)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1225 = float2(_450, _416);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1225, float2(0.0), isnan(_1225)), level(_108)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1225, float2(0.0), isnan(_1225)), level(_108)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float _492 = 0.0 + _94;
        float _494 = precise::clamp(_492, 0.0, 1.0);
        float _496 = -_102;
        float _498 = _96 + _496;
        float _500 = precise::clamp(_498, 0.0, 1.0);
        float _502 = -_432;
        float _504 = _424 + _502;
        float _506 = -_434;
        float _508 = _426 + _506;
        float _510 = -_436;
        float _512 = _428 + _510;
        float _514 = fma(_298, _504, _432);
        float _516 = fma(_298, _508, _434);
        float _518 = fma(_298, _512, _436);
        float _520 = -_456;
        float _522 = _442 + _520;
        float _524 = -_454;
        float _526 = _440 + _524;
        float _528 = -_458;
        float _530 = _444 + _528;
        float _532 = fma(_298, _522, _456);
        float _534 = fma(_298, _526, _454);
        float _536 = -_472;
        float _538 = _464 + _536;
        float _540 = -_470;
        float _542 = _462 + _540;
        float _544 = -_532;
        float _546 = _544 + _516;
        float _548 = -_474;
        float _550 = _466 + _548;
        float _552 = fma(_342, _538, _472);
        float _554 = -_486;
        float _556 = _478 + _554;
        float _558 = fma(_316, _546, _532);
        float _560 = -_488;
        float _562 = _480 + _560;
        float _564 = -_490;
        float _566 = _482 + _564;
        float _568 = fma(_298, _530, _458);
        float _570 = fma(_342, _542, _470);
        float _572 = fma(_342, _556, _486);
        float _574 = fma(_342, _562, _488);
        float _576 = fma(_342, _550, _474);
        float _578 = fma(_342, _566, _490);
        float _580 = -_568;
        float _582 = _580 + _518;
        float _584 = -_534;
        float _586 = _584 + _514;
        float _588 = -_572;
        float _590 = _588 + _570;
        float _592 = -_574;
        float _594 = _592 + _552;
        float _596 = -_578;
        float _598 = _596 + _576;
        float _600 = fma(_316, _582, _568);
        float _602 = fma(_316, _586, _534);
        float _604 = fma(_352, _590, _572);
        float _606 = fma(_352, _594, _574);
        float _608 = fma(_352, _598, _578);
        float _610 = -_602;
        float _612 = _610 + _604;
        float _614 = -_558;
        float _616 = _614 + _606;
        float _618 = -_600;
        float _620 = _618 + _608;
        float _622 = fma(_500, _612, _602);
        float _624 = fma(_500, _616, _558);
        float _626 = fma(_500, _620, _600);
        out.m_34.x = _622;
        out.m_34.y = _624;
        out.m_34.z = _626;
        out.m_34.w = _494;
        return out;
    }
    discard_fragment();
    return out;
}

