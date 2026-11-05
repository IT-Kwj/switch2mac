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
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
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
int _42(thread const int& _1523, thread const int& _1524, constant _10& support_buffer)
{
    int _1527 = 1 + _1524;
    float _1529 = support_buffer._m5[_1527].x;
    float _1531 = abs(_1529);
    bool _1533 = _1531 == 1.0;
    if (_1533)
    {
        return _1523;
    }
    float _1535 = float(_1523);
    float _1537 = _1535 / _1531;
    int _1539 = int(_1537);
    return _1539;
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
    float2 _694 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_694, float2(0.0), isnan(_694))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = precise::max(_66, _86);
    bool _96 = _92 != 0.0;
    bool _98 = isnan(_92);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.0);
    bool _104 = _100 || _102;
    bool _106 = !_104;
    if (!_106)
    {
        float _108 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _110 = fma(_92, _108, 1.0);
        float _112 = log2(_110);
        float _114 = _112 + (-1.0);
        float _116 = trunc(_114);
        int _118 = int(_116);
        float _120 = float(_118);
        float _122 = trunc(_120);
        int _124 = int(_122);
        float _126 = _120 + 1.0;
        float _128 = trunc(_126);
        int _130 = int(_128);
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _158 = _156;
        int _160 = 1;
        int _162 = _42(_158, _160, (*spvDescriptorSet0.support_buffer));
        float _164 = float(_138);
        float _166 = float(_146);
        float _168 = 1.0 / _164;
        float _170 = fma(_62, _164, -0.5);
        float _172 = fma(_64, _166, -0.5);
        float _174 = floor(_170);
        float _176 = float(_154);
        float _178 = float(_162);
        float _180 = fma(_62, _176, -0.5);
        float _182 = floor(_172);
        float _184 = fma(_64, _178, -0.5);
        float _186 = -_174;
        float _188 = _170 + _186;
        float _190 = floor(_180);
        float _192 = -_188;
        float _194 = _192 + 1.0;
        float _196 = -_188;
        float _198 = _196 + 2.0;
        float _200 = _188 * _188;
        float _202 = _194 * _194;
        float _204 = -_182;
        float _206 = _172 + _204;
        float _208 = _198 * _198;
        float _210 = _188 * _200;
        float _212 = _194 * _202;
        float _214 = -_206;
        float _216 = _214 + 1.0;
        float _218 = floor(_184);
        float _220 = -_206;
        float _222 = _220 + 2.0;
        float _224 = _212 * 4.0;
        float _226 = _216 * _216;
        float _228 = -_224;
        float _230 = fma(_198, _208, _228);
        float _232 = _216 * _226;
        float _234 = -_212;
        float _236 = _234 + 6.0;
        float _238 = -_190;
        float _240 = _180 + _238;
        float _242 = _222 * _222;
        float _244 = _232 * 4.0;
        float _246 = -_230;
        float _248 = _246 + _236;
        float _250 = -_240;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _166;
        float _256 = -_244;
        float _258 = fma(_222, _242, _256);
        float _260 = _248 * 0.16666667163372039794921875;
        float _262 = _252 * _252;
        float _264 = -_240;
        float _266 = _264 + 2.0;
        float _268 = -_232;
        float _270 = _268 + 6.0;
        float _272 = _252 * _262;
        float _274 = -_218;
        float _276 = _184 + _274;
        float _278 = _266 * _266;
        float _280 = _212 + _230;
        float _282 = _272 * 4.0;
        float _284 = -_276;
        float _286 = _284 + 1.0;
        float _288 = 1.0 / _260;
        float _290 = _280 * 0.16666667163372039794921875;
        float _292 = -_282;
        float _294 = fma(_266, _278, _292);
        float _296 = -_272;
        float _298 = _296 + 6.0;
        float _300 = _286 * _286;
        float _302 = -_276;
        float _304 = _302 + 2.0;
        float _306 = -_258;
        float _308 = _306 + _270;
        float _310 = -_294;
        float _312 = _310 + _298;
        float _314 = _286 * _300;
        float _316 = _304 * _304;
        float _318 = 1.0 / _290;
        float _320 = _312 * 0.16666667163372039794921875;
        float _322 = _314 * 4.0;
        float _324 = _232 + _258;
        float _326 = _308 * 0.16666667163372039794921875;
        float _328 = -_314;
        float _330 = _328 + 6.0;
        float _332 = -_322;
        float _334 = fma(_304, _316, _332);
        float _336 = _324 * 0.16666667163372039794921875;
        float _338 = _174 + 1.5;
        float _340 = _210 * 0.16666667163372039794921875;
        float _342 = 1.0 / _326;
        float _344 = -_334;
        float _346 = _344 + _330;
        float _348 = _174 + (-0.5);
        float _350 = fma(_340, _288, _338);
        float _352 = _206 * _206;
        float _354 = _272 + _294;
        float _356 = _230 * 0.16666667163372039794921875;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = 1.0 / _336;
        float _362 = _206 * _352;
        float _364 = _314 + _334;
        float _366 = _354 * 0.16666667163372039794921875;
        float _368 = fma(_356, _318, _348);
        float _370 = _182 + (-0.5);
        float _372 = _364 * 0.16666667163372039794921875;
        float _374 = _258 * 0.16666667163372039794921875;
        float _376 = _182 + 1.5;
        float _378 = 1.0 / _358;
        float _380 = _362 * 0.16666667163372039794921875;
        float _382 = fma(_380, _342, _376);
        float _384 = _240 * _240;
        float _386 = fma(_374, _360, _370);
        float _388 = 1.0 / _372;
        float _390 = _368 * _168;
        float _392 = _276 * _276;
        float _394 = _240 * _384;
        float _396 = _350 * _168;
        float _398 = _386 * _254;
        float _400 = _276 * _392;
        float _402 = _382 * _254;
        float _404 = 1.0 / _320;
        float _406 = _218 + (-0.5);
        float _408 = _218 + 1.5;
        float _410 = _294 * 0.16666667163372039794921875;
        float _412 = _190 + (-0.5);
        float _414 = _190 + 1.5;
        float _416 = _334 * 0.16666667163372039794921875;
        float _418 = _400 * 0.16666667163372039794921875;
        float _420 = 1.0 / _366;
        float _422 = _394 * 0.16666667163372039794921875;
        float _424 = fma(_416, _388, _406);
        float _426 = fma(_418, _378, _408);
        float _428 = 1.0 / _178;
        float _430 = fma(_422, _404, _414);
        float _432 = 1.0 / _176;
        float _434 = fma(_410, _420, _412);
        float2 _1155 = float2(_390, _398);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1155, float2(0.0), isnan(_1155)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1155, float2(0.0), isnan(_1155)), level(_120)).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float2 _1170 = float2(_396, _398);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1170, float2(0.0), isnan(_1170)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1170, float2(0.0), isnan(_1170)), level(_120)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float2 _1185 = float2(_390, _402);
        float3 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1185, float2(0.0), isnan(_1185)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1185, float2(0.0), isnan(_1185)), level(_120)).xyz;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float2 _1200 = float2(_396, _402);
        float3 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1200, float2(0.0), isnan(_1200)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1200, float2(0.0), isnan(_1200)), level(_120)).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        float _470 = _424 * _428;
        float _472 = _434 * _432;
        float _474 = _430 * _432;
        float _476 = _426 * _428;
        float2 _1227 = float2(_472, _470);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1227, float2(0.0), isnan(_1227)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1227, float2(0.0), isnan(_1227)), level(_126)).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        float2 _1242 = float2(_474, _470);
        float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_126)).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        float2 _1257 = float2(_472, _476);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float2(0.0), isnan(_1257)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float2(0.0), isnan(_1257)), level(_126)).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        float2 _1272 = float2(_474, _476);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1272, float2(0.0), isnan(_1272)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1272, float2(0.0), isnan(_1272)), level(_126)).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        float _510 = 0.0 + _112;
        float _512 = precise::clamp(_510, 0.0, 1.0);
        float _514 = fma(_90, _512, _88);
        float _516 = -_120;
        float _518 = _114 + _516;
        float _520 = precise::clamp(_518, 0.0, 1.0);
        float _522 = _512 * _90;
        float _524 = -_450;
        float _526 = _442 + _524;
        float _528 = -_448;
        float _530 = _440 + _528;
        float _532 = -_464;
        float _534 = _456 + _532;
        float _536 = -_452;
        float _538 = _444 + _536;
        float _540 = -_468;
        float _542 = _460 + _540;
        float _544 = fma(_290, _530, _448);
        float _546 = fma(_290, _534, _464);
        float _548 = -_466;
        float _550 = _458 + _548;
        float _552 = fma(_290, _538, _452);
        float _554 = fma(_290, _542, _468);
        float _556 = fma(_290, _526, _450);
        float _558 = fma(_290, _550, _466);
        float _560 = -_546;
        float _562 = _560 + _544;
        float _564 = -_554;
        float _566 = _564 + _552;
        float _568 = -_490;
        float _570 = _482 + _568;
        float _572 = -_492;
        float _574 = _484 + _572;
        float _576 = -_488;
        float _578 = _480 + _576;
        float _580 = 1.0 / _514;
        float _582 = -_508;
        float _584 = _500 + _582;
        float _586 = fma(_366, _570, _490);
        float _588 = -_504;
        float _590 = _496 + _588;
        float _592 = -_506;
        float _594 = _498 + _592;
        float _596 = fma(_366, _574, _492);
        float _598 = fma(_366, _584, _508);
        float _600 = fma(_366, _578, _488);
        float _602 = fma(_366, _590, _504);
        float _604 = fma(_366, _594, _506);
        float _606 = -_598;
        float _608 = _606 + _596;
        float _610 = fma(_336, _562, _546);
        float _612 = -_602;
        float _614 = _612 + _600;
        float _616 = -_558;
        float _618 = _616 + _556;
        float _620 = -_604;
        float _622 = _620 + _586;
        float _624 = fma(_336, _566, _554);
        float _626 = fma(_372, _608, _598);
        float _628 = fma(_372, _614, _602);
        float _630 = fma(_336, _618, _558);
        float _632 = fma(_372, _622, _604);
        float _634 = -_624;
        float _636 = _634 + _626;
        float _638 = -_610;
        float _640 = _638 + _628;
        float _642 = _580 * _522;
        float _644 = -_630;
        float _646 = _644 + _632;
        float _648 = fma(_520, _636, _624);
        float _650 = fma(_520, _640, _610);
        float _652 = fma(_520, _646, _630);
        float _654 = _648 * _522;
        float _656 = _650 * _642;
        float _658 = _652 * _642;
        float _660 = _654 * _580;
        out.m_36.x = _656;
        out.m_36.y = _658;
        out.m_36.z = _660;
        out.m_36.w = _514;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _88;
    return out;
}

