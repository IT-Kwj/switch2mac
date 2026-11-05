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
int _40(thread const int& _1596, thread const int& _1597, constant _10& support_buffer)
{
    int _1600 = 1 + _1597;
    float _1602 = support_buffer._m5[_1600].x;
    float _1604 = abs(_1602);
    bool _1606 = _1604 == 1.0;
    if (_1606)
    {
        return _1596;
    }
    float _1608 = float(_1596);
    float _1610 = _1608 / _1604;
    int _1612 = int(_1610);
    return _1612;
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
    float2 _710 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).x;
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
        float _186 = -_162;
        float _188 = _158 + _186;
        float _190 = floor(_168);
        float _192 = _180 * _180;
        float _194 = -_188;
        float _196 = _194 + 1.0;
        float _198 = -_188;
        float _200 = _198 + 2.0;
        float _202 = _180 * _192;
        float _204 = _184 * _184;
        float _206 = _196 * _196;
        float _208 = floor(_176);
        float _210 = _202 * 4.0;
        float _212 = _196 * _206;
        float _214 = _200 * _200;
        float _216 = -_210;
        float _218 = fma(_184, _204, _216);
        float _220 = -_202;
        float _222 = _220 + 6.0;
        float _224 = _212 * 4.0;
        float _226 = -_190;
        float _228 = _168 + _226;
        float _230 = _202 + _218;
        float _232 = -_218;
        float _234 = _232 + _222;
        float _236 = -_224;
        float _238 = fma(_200, _214, _236);
        float _240 = -_228;
        float _242 = _240 + 1.0;
        float _244 = -_212;
        float _246 = _244 + 6.0;
        float _248 = _234 * 0.16666667163372039794921875;
        float _250 = -_228;
        float _252 = _250 + 2.0;
        float _254 = _242 * _242;
        float _256 = -_238;
        float _258 = _256 + _246;
        float _260 = -_208;
        float _262 = _176 + _260;
        float _264 = _252 * _252;
        float _266 = _242 * _254;
        float _268 = _258 * 0.16666667163372039794921875;
        float _270 = -_262;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _248;
        float _276 = _266 * 4.0;
        float _278 = -_266;
        float _280 = _278 + 6.0;
        float _282 = _230 * 0.16666667163372039794921875;
        float _284 = _172 * _172;
        float _286 = -_276;
        float _288 = fma(_252, _264, _286);
        float _290 = _272 * _272;
        float _292 = -_262;
        float _294 = _292 + 2.0;
        float _296 = 1.0 / _282;
        float _298 = -_288;
        float _300 = _298 + _280;
        float _302 = _272 * _290;
        float _304 = _294 * _294;
        float _306 = _172 * _284;
        float _308 = _300 * 0.16666667163372039794921875;
        float _310 = _212 + _238;
        float _312 = _302 * 4.0;
        float _314 = 1.0 / _268;
        float _316 = -_302;
        float _318 = _316 + 6.0;
        float _320 = _310 * 0.16666667163372039794921875;
        float _322 = -_312;
        float _324 = fma(_294, _304, _322);
        float _326 = _160 + 1.5;
        float _328 = _306 * 0.16666667163372039794921875;
        float _330 = _266 + _288;
        float _332 = _218 * 0.16666667163372039794921875;
        float _334 = 1.0 / _320;
        float _336 = fma(_328, _274, _326);
        float _338 = _160 + (-0.5);
        float _340 = _188 * _188;
        float _342 = _330 * 0.16666667163372039794921875;
        float _344 = -_324;
        float _346 = _344 + _318;
        float _348 = _162 + 1.5;
        float _350 = _188 * _340;
        float _352 = fma(_332, _296, _338);
        float _354 = _302 + _324;
        float _356 = _162 + (-0.5);
        float _358 = 1.0 / _342;
        float _360 = _238 * 0.16666667163372039794921875;
        float _362 = _346 * 0.16666667163372039794921875;
        float _364 = _350 * 0.16666667163372039794921875;
        float _366 = _354 * 0.16666667163372039794921875;
        float _368 = fma(_360, _334, _356);
        float _370 = _228 * _228;
        float _372 = fma(_364, _314, _348);
        float _374 = 1.0 / _308;
        float _376 = _262 * _262;
        float _378 = _228 * _370;
        float _380 = _352 * _154;
        float _382 = _368 * _174;
        float _384 = _262 * _376;
        float _386 = _372 * _174;
        float _388 = _190 + (-0.5);
        float _390 = 1.0 / _164;
        float _392 = _288 * 0.16666667163372039794921875;
        float _394 = _190 + 1.5;
        float _396 = _378 * 0.16666667163372039794921875;
        float _398 = _208 + (-0.5);
        float _400 = fma(_392, _358, _388);
        float _402 = _324 * 0.16666667163372039794921875;
        float _404 = _336 * _154;
        float _406 = 1.0 / _366;
        float _408 = fma(_396, _374, _394);
        float _410 = _208 + 1.5;
        float _412 = _384 * 0.16666667163372039794921875;
        float _414 = 1.0 / _362;
        float _416 = _400 * _390;
        float _418 = _408 * _390;
        float _420 = 1.0 / _166;
        float _422 = fma(_402, _406, _398);
        float2 _1181 = float2(_380, _382);
        float3 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1181, float2(0.0), isnan(_1181)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1181, float2(0.0), isnan(_1181)), level(_106)).xyz;
        float _428 = _426.x;
        float _430 = _426.y;
        float _432 = _426.z;
        float _434 = fma(_412, _414, _410);
        float _436 = _422 * _420;
        float _438 = _434 * _420;
        float2 _1206 = float2(_404, _382);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1206, float2(0.0), isnan(_1206)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1206, float2(0.0), isnan(_1206)), level(_106)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1221 = float2(_380, _386);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1221, float2(0.0), isnan(_1221)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1221, float2(0.0), isnan(_1221)), level(_106)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float2 _1236 = float2(_404, _386);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1236, float2(0.0), isnan(_1236)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1236, float2(0.0), isnan(_1236)), level(_106)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1251 = float2(_416, _436);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1251, float2(0.0), isnan(_1251)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1251, float2(0.0), isnan(_1251)), level(_112)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1266 = float2(_418, _436);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1266, float2(0.0), isnan(_1266)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1266, float2(0.0), isnan(_1266)), level(_112)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1281 = float2(_416, _438);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1281, float2(0.0), isnan(_1281)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1281, float2(0.0), isnan(_1281)), level(_112)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1296 = float2(_418, _438);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1296, float2(0.0), isnan(_1296)), level(_112)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1296, float2(0.0), isnan(_1296)), level(_112)).xyz;
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
        float _510 = _428 + _508;
        float _512 = -_444;
        float _514 = _430 + _512;
        float _516 = -_458;
        float _518 = _450 + _516;
        float _520 = -_446;
        float _522 = _432 + _520;
        float _524 = fma(_282, _510, _442);
        float _526 = -_460;
        float _528 = _452 + _526;
        float _530 = fma(_282, _518, _458);
        float _532 = fma(_282, _514, _444);
        float _534 = -_462;
        float _536 = _454 + _534;
        float _538 = fma(_282, _528, _460);
        float _540 = -_530;
        float _542 = _540 + _524;
        float _544 = -_474;
        float _546 = _466 + _544;
        float _548 = -_478;
        float _550 = _470 + _548;
        float _552 = -_492;
        float _554 = _484 + _552;
        float _556 = fma(_320, _542, _530);
        float _558 = -_476;
        float _560 = _468 + _558;
        float _562 = -_490;
        float _564 = _482 + _562;
        float _566 = fma(_342, _554, _492);
        float _568 = -_538;
        float _570 = _568 + _532;
        float _572 = fma(_342, _560, _476);
        float _574 = fma(_342, _546, _474);
        float _576 = fma(_342, _564, _490);
        float _578 = -_494;
        float _580 = _486 + _578;
        float _582 = -_566;
        float _584 = _582 + _572;
        float _586 = fma(_282, _522, _446);
        float _588 = fma(_282, _536, _462);
        float _590 = fma(_320, _570, _538);
        float _592 = fma(_342, _550, _478);
        float _594 = -_576;
        float _596 = _594 + _574;
        float _598 = fma(_342, _580, _494);
        float _600 = fma(_366, _584, _566);
        float _602 = -_588;
        float _604 = _602 + _586;
        float _606 = fma(_366, _596, _576);
        float _608 = -_598;
        float _610 = _608 + _592;
        float _612 = -_590;
        float _614 = _612 + _600;
        float _616 = fma(_320, _604, _588);
        float _618 = -_556;
        float _620 = _618 + _606;
        float _622 = fma(_366, _610, _598);
        float _624 = fma(_502, _614, _590);
        float _626 = fma(_502, _620, _556);
        float _628 = -_616;
        float _630 = _628 + _622;
        float _632 = _624 * 0.586600005626678466796875;
        float _634 = _496 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _636 = fma(_502, _630, _616);
        float _638 = fma(_626, 0.29890000820159912109375, _632);
        float _640 = fma(_636, 0.1143999993801116943359375, _638);
        float _642 = -_626;
        float _644 = _642 + _640;
        float _646 = -_624;
        float _648 = _646 + _640;
        float _650 = -_636;
        float _652 = _650 + _640;
        float _654 = fma(_634, _644, _626);
        float _656 = fma(_634, _648, _624);
        float _658 = fma(_634, _652, _636);
        float _660 = -_654;
        float _662 = fma(_654, (*spvDescriptorSet0.fp_c3)._m0[13].x, _660);
        float _664 = -_656;
        float _666 = fma(_656, (*spvDescriptorSet0.fp_c3)._m0[13].y, _664);
        float _668 = -_658;
        float _670 = fma(_658, (*spvDescriptorSet0.fp_c3)._m0[13].z, _668);
        float _672 = fma(_496, _662, _654);
        float _674 = fma(_496, _666, _656);
        float _676 = fma(_496, _670, _658);
        out.m_34.x = _672;
        out.m_34.y = _674;
        out.m_34.z = _676;
        out.m_34.w = _506;
        return out;
    }
    discard_fragment();
    return out;
}

