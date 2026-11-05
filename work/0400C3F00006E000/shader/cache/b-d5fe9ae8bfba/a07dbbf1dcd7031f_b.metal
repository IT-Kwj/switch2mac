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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1626, thread const int& _1627, constant _10& support_buffer)
{
    int _1630 = 1 + _1627;
    float _1632 = support_buffer._m5[_1630].x;
    float _1634 = abs(_1632);
    bool _1636 = _1634 == 1.0;
    if (_1636)
    {
        return _1626;
    }
    float _1638 = float(_1626);
    float _1640 = _1638 / _1634;
    int _1642 = int(_1640);
    return _1642;
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
    float2 _728 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_728, float2(0.0), isnan(_728))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_728, float2(0.0), isnan(_728))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = precise::max(_100, _104);
    float _108 = precise::max(_106, _90);
    bool _112 = _108 != 0.0;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    bool _122 = !_120;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_108, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        float _136 = float(_134);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = _136 + 1.0;
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        int _164 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _166 = _164;
        int _168 = 1;
        int _170 = _42(_166, _168, (*spvDescriptorSet0.support_buffer));
        int _172 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _174 = _172;
        int _176 = 1;
        int _178 = _42(_174, _176, (*spvDescriptorSet0.support_buffer));
        float _180 = float(_154);
        float _182 = float(_162);
        float _184 = 1.0 / _180;
        float _186 = fma(_62, _180, -0.5);
        float _188 = fma(_64, _182, -0.5);
        float _190 = floor(_186);
        float _192 = float(_170);
        float _194 = float(_178);
        float _196 = fma(_62, _192, -0.5);
        float _198 = floor(_188);
        float _200 = fma(_64, _194, -0.5);
        float _202 = -_190;
        float _204 = _186 + _202;
        float _206 = floor(_196);
        float _208 = -_204;
        float _210 = _208 + 1.0;
        float _212 = -_204;
        float _214 = _212 + 2.0;
        float _216 = -_198;
        float _218 = _188 + _216;
        float _220 = _210 * _210;
        float _222 = _214 * _214;
        float _224 = floor(_200);
        float _226 = -_218;
        float _228 = _226 + 1.0;
        float _230 = _210 * _220;
        float _232 = -_218;
        float _234 = _232 + 2.0;
        float _236 = _228 * _228;
        float _238 = _230 * 4.0;
        float _240 = _234 * _234;
        float _242 = 1.0 / _182;
        float _244 = _228 * _236;
        float _246 = -_238;
        float _248 = fma(_214, _222, _246);
        float _250 = -_230;
        float _252 = _250 + 6.0;
        float _254 = -_206;
        float _256 = _196 + _254;
        float _258 = _244 * 4.0;
        float _260 = -_248;
        float _262 = _260 + _252;
        float _264 = -_256;
        float _266 = _264 + 1.0;
        float _268 = -_258;
        float _270 = fma(_234, _240, _268);
        float _272 = -_256;
        float _274 = _272 + 2.0;
        float _276 = _262 * 0.16666667163372039794921875;
        float _278 = _266 * _266;
        float _280 = -_224;
        float _282 = _200 + _280;
        float _284 = -_244;
        float _286 = _284 + 6.0;
        float _288 = _274 * _274;
        float _290 = _266 * _278;
        float _292 = -_282;
        float _294 = _292 + 1.0;
        float _296 = -_270;
        float _298 = _296 + _286;
        float _300 = 1.0 / _276;
        float _302 = _290 * 4.0;
        float _304 = _298 * 0.16666667163372039794921875;
        float _306 = _230 + _248;
        float _308 = -_302;
        float _310 = fma(_274, _288, _308);
        float _312 = _294 * _294;
        float _314 = -_290;
        float _316 = _314 + 6.0;
        float _318 = -_282;
        float _320 = _318 + 2.0;
        float _322 = _306 * 0.16666667163372039794921875;
        float _324 = _294 * _312;
        float _326 = _204 * _204;
        float _328 = -_310;
        float _330 = _328 + _316;
        float _332 = _320 * _320;
        float _334 = _324 * 4.0;
        float _336 = 1.0 / _322;
        float _338 = _204 * _326;
        float _340 = _330 * 0.16666667163372039794921875;
        float _342 = -_334;
        float _344 = fma(_320, _332, _342);
        float _346 = _244 + _270;
        float _348 = -_324;
        float _350 = _348 + 6.0;
        float _352 = _190 + 1.5;
        float _354 = _338 * 0.16666667163372039794921875;
        float _356 = 1.0 / _304;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = -_344;
        float _362 = _360 + _350;
        float _364 = fma(_354, _300, _352);
        float _366 = _218 * _218;
        float _368 = _290 + _310;
        float _370 = _362 * 0.16666667163372039794921875;
        float _372 = _190 + (-0.5);
        float _374 = 1.0 / _358;
        float _376 = _248 * 0.16666667163372039794921875;
        float _378 = _218 * _366;
        float _380 = _324 + _344;
        float _382 = _368 * 0.16666667163372039794921875;
        float _384 = fma(_376, _336, _372);
        float _386 = _198 + (-0.5);
        float _388 = _198 + 1.5;
        float _390 = 1.0 / _340;
        float _392 = _380 * 0.16666667163372039794921875;
        float _394 = _270 * 0.16666667163372039794921875;
        float _396 = _256 * _256;
        float _398 = _310 * 0.16666667163372039794921875;
        float _400 = _344 * 0.16666667163372039794921875;
        float _402 = _256 * _396;
        float _404 = 1.0 / _382;
        float _406 = _378 * 0.16666667163372039794921875;
        float _408 = fma(_394, _374, _386);
        float _410 = _206 + (-0.5);
        float _412 = _402 * 0.16666667163372039794921875;
        float _414 = fma(_406, _356, _388);
        float _416 = _384 * _184;
        float _418 = _364 * _184;
        float _420 = 1.0 / _370;
        float _422 = _282 * _282;
        float _424 = _408 * _242;
        float _426 = _414 * _242;
        float _428 = _224 + (-0.5);
        float _430 = _282 * _422;
        float _432 = _206 + 1.5;
        float _434 = _224 + 1.5;
        float _436 = 1.0 / _392;
        float _438 = _430 * 0.16666667163372039794921875;
        float _440 = fma(_398, _404, _410);
        float _442 = fma(_412, _390, _432);
        float _444 = 1.0 / _192;
        float _446 = fma(_438, _420, _434);
        float _448 = 1.0 / _194;
        float _450 = fma(_400, _436, _428);
        float2 _1221 = float2(_416, _424);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1221, float2(0.0), isnan(_1221)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1221, float2(0.0), isnan(_1221)), level(_136)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = _440 * _444;
        float _464 = _442 * _444;
        float _466 = _450 * _448;
        float _468 = _446 * _448;
        float2 _1248 = float2(_418, _424);
        float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1248, float2(0.0), isnan(_1248)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1248, float2(0.0), isnan(_1248)), level(_136)).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        float2 _1263 = float2(_416, _426);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1263, float2(0.0), isnan(_1263)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1263, float2(0.0), isnan(_1263)), level(_136)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1278 = float2(_418, _426);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_136)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1293 = float2(_462, _466);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_142)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1308 = float2(_464, _466);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_142)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float2 _1323 = float2(_462, _468);
        float3 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_142)).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        float2 _1338 = float2(_464, _468);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1338, float2(0.0), isnan(_1338)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1338, float2(0.0), isnan(_1338)), level(_142)).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        float _526 = -_136;
        float _528 = _130 + _526;
        float _530 = precise::clamp(_528, 0.0, 1.0);
        float _532 = -_472;
        float _534 = _456 + _532;
        float _536 = -_474;
        float _538 = _458 + _536;
        float _540 = -_488;
        float _542 = _480 + _540;
        float _544 = -_476;
        float _546 = _460 + _544;
        float _548 = fma(_322, _534, _472);
        float _550 = -_490;
        float _552 = _482 + _550;
        float _554 = fma(_322, _542, _488);
        float _556 = -_492;
        float _558 = _484 + _556;
        float _560 = fma(_322, _538, _474);
        float _562 = fma(_322, _552, _490);
        float _564 = -_504;
        float _566 = _496 + _564;
        float _568 = fma(_322, _558, _492);
        float _570 = -_508;
        float _572 = _500 + _570;
        float _574 = -_562;
        float _576 = _574 + _560;
        float _578 = -_506;
        float _580 = _498 + _578;
        float _582 = -_520;
        float _584 = _512 + _582;
        float _586 = -_524;
        float _588 = _516 + _586;
        float _590 = fma(_358, _576, _562);
        float _592 = fma(_382, _580, _506);
        float _594 = -_522;
        float _596 = _514 + _594;
        float _598 = fma(_382, _566, _504);
        float _600 = fma(_382, _572, _508);
        float _602 = fma(_382, _584, _520);
        float _604 = fma(_382, _596, _522);
        float _606 = fma(_322, _546, _476);
        float _608 = fma(_382, _588, _524);
        float _610 = -_554;
        float _612 = _610 + _548;
        float _614 = -_602;
        float _616 = _614 + _598;
        float _618 = -_568;
        float _620 = _618 + _606;
        float _622 = -_604;
        float _624 = _622 + _592;
        float _626 = -_608;
        float _628 = _626 + _600;
        float _630 = fma(_358, _612, _554);
        float _632 = fma(_392, _616, _602);
        float _634 = 0.0 + _128;
        float _636 = precise::clamp(_634, 0.0, 1.0);
        float _638 = fma(_358, _620, _568);
        float _640 = fma(_392, _624, _604);
        float _642 = fma(_392, _628, _608);
        float _644 = -_630;
        float _646 = _644 + _632;
        float _648 = fma(_88, _636, _86);
        float _650 = -_590;
        float _652 = _650 + _640;
        float _654 = -_638;
        float _656 = _654 + _642;
        float _658 = fma(_530, _646, _630);
        float _660 = 1.0 / _648;
        float _662 = fma(_530, _652, _590);
        float _664 = fma(_530, _656, _638);
        float _666 = _636 * _658;
        float _668 = _636 * _662;
        float _670 = _636 * _664;
        float _672 = -_666;
        float _674 = _672 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _676 = -_668;
        float _678 = _676 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _680 = -_670;
        float _682 = _680 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _684 = fma(_86, _674, _666);
        float _686 = fma(_86, _678, _668);
        float _688 = fma(_86, _682, _670);
        float _690 = _684 * _660;
        float _692 = _686 * _660;
        float _694 = _688 * _660;
        out.m_36.x = _690;
        out.m_36.y = _692;
        out.m_36.z = _694;
        out.m_36.w = _648;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}

