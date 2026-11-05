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
int _42(thread const int& _1537, thread const int& _1538, constant _10& support_buffer)
{
    int _1541 = 1 + _1538;
    float _1543 = support_buffer._m5[_1541].x;
    float _1545 = abs(_1543);
    bool _1547 = _1545 == 1.0;
    if (_1547)
    {
        return _1537;
    }
    float _1549 = float(_1537);
    float _1551 = _1549 / _1545;
    int _1553 = int(_1551);
    return _1553;
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
    float2 _698 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_698, float2(0.0), isnan(_698))).x;
    float _68 = in.m_33.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _88);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_96, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        float _124 = float(_122);
        float _126 = trunc(_124);
        int _128 = int(_126);
        float _130 = _124 + 1.0;
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _42(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _42(_162, _164, (*spvDescriptorSet0.support_buffer));
        float _168 = float(_142);
        float _170 = float(_150);
        float _172 = 1.0 / _168;
        float _174 = fma(_62, _168, -0.5);
        float _176 = fma(_64, _170, -0.5);
        float _178 = floor(_174);
        float _180 = float(_158);
        float _182 = float(_166);
        float _184 = fma(_62, _180, -0.5);
        float _186 = floor(_176);
        float _188 = fma(_64, _182, -0.5);
        float _190 = -_178;
        float _192 = _174 + _190;
        float _194 = floor(_184);
        float _196 = -_192;
        float _198 = _196 + 1.0;
        float _200 = -_192;
        float _202 = _200 + 2.0;
        float _204 = _192 * _192;
        float _206 = _198 * _198;
        float _208 = -_186;
        float _210 = _176 + _208;
        float _212 = _202 * _202;
        float _214 = _192 * _204;
        float _216 = _198 * _206;
        float _218 = -_210;
        float _220 = _218 + 1.0;
        float _222 = floor(_188);
        float _224 = -_210;
        float _226 = _224 + 2.0;
        float _228 = _216 * 4.0;
        float _230 = _220 * _220;
        float _232 = -_228;
        float _234 = fma(_202, _212, _232);
        float _236 = _220 * _230;
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = -_194;
        float _244 = _184 + _242;
        float _246 = _226 * _226;
        float _248 = _236 * 4.0;
        float _250 = -_234;
        float _252 = _250 + _240;
        float _254 = -_244;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _170;
        float _260 = -_248;
        float _262 = fma(_226, _246, _260);
        float _264 = _252 * 0.16666667163372039794921875;
        float _266 = _256 * _256;
        float _268 = -_244;
        float _270 = _268 + 2.0;
        float _272 = -_236;
        float _274 = _272 + 6.0;
        float _276 = _256 * _266;
        float _278 = -_222;
        float _280 = _188 + _278;
        float _282 = _270 * _270;
        float _284 = _216 + _234;
        float _286 = _276 * 4.0;
        float _288 = -_280;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _264;
        float _294 = _284 * 0.16666667163372039794921875;
        float _296 = -_286;
        float _298 = fma(_270, _282, _296);
        float _300 = -_276;
        float _302 = _300 + 6.0;
        float _304 = _290 * _290;
        float _306 = -_280;
        float _308 = _306 + 2.0;
        float _310 = -_262;
        float _312 = _310 + _274;
        float _314 = -_298;
        float _316 = _314 + _302;
        float _318 = _290 * _304;
        float _320 = _308 * _308;
        float _322 = 1.0 / _294;
        float _324 = _316 * 0.16666667163372039794921875;
        float _326 = _318 * 4.0;
        float _328 = _236 + _262;
        float _330 = _312 * 0.16666667163372039794921875;
        float _332 = -_318;
        float _334 = _332 + 6.0;
        float _336 = -_326;
        float _338 = fma(_308, _320, _336);
        float _340 = _328 * 0.16666667163372039794921875;
        float _342 = _178 + 1.5;
        float _344 = _214 * 0.16666667163372039794921875;
        float _346 = 1.0 / _330;
        float _348 = -_338;
        float _350 = _348 + _334;
        float _352 = _178 + (-0.5);
        float _354 = fma(_344, _292, _342);
        float _356 = _210 * _210;
        float _358 = _276 + _298;
        float _360 = _234 * 0.16666667163372039794921875;
        float _362 = _350 * 0.16666667163372039794921875;
        float _364 = 1.0 / _340;
        float _366 = _210 * _356;
        float _368 = _318 + _338;
        float _370 = _358 * 0.16666667163372039794921875;
        float _372 = fma(_360, _322, _352);
        float _374 = _186 + (-0.5);
        float _376 = _368 * 0.16666667163372039794921875;
        float _378 = _262 * 0.16666667163372039794921875;
        float _380 = _186 + 1.5;
        float _382 = 1.0 / _362;
        float _384 = _366 * 0.16666667163372039794921875;
        float _386 = fma(_384, _346, _380);
        float _388 = _244 * _244;
        float _390 = fma(_378, _364, _374);
        float _392 = 1.0 / _376;
        float _394 = _372 * _172;
        float _396 = _280 * _280;
        float _398 = _244 * _388;
        float _400 = _354 * _172;
        float _402 = _390 * _258;
        float _404 = _280 * _396;
        float _406 = _386 * _258;
        float _408 = 1.0 / _324;
        float _410 = _222 + (-0.5);
        float _412 = _222 + 1.5;
        float _414 = _298 * 0.16666667163372039794921875;
        float _416 = _194 + (-0.5);
        float _418 = _194 + 1.5;
        float _420 = _338 * 0.16666667163372039794921875;
        float _422 = _404 * 0.16666667163372039794921875;
        float _424 = 1.0 / _370;
        float _426 = _398 * 0.16666667163372039794921875;
        float _428 = fma(_420, _392, _410);
        float _430 = fma(_422, _382, _412);
        float _432 = 1.0 / _182;
        float _434 = fma(_426, _408, _418);
        float _436 = 1.0 / _180;
        float _438 = fma(_414, _424, _416);
        float2 _1169 = float2(_394, _402);
        float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1169, float2(0.0), isnan(_1169)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1169, float2(0.0), isnan(_1169)), level(_124)).xyz;
        float _444 = _442.x;
        float _446 = _442.y;
        float _448 = _442.z;
        float2 _1184 = float2(_400, _402);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1184, float2(0.0), isnan(_1184)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1184, float2(0.0), isnan(_1184)), level(_124)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float2 _1199 = float2(_394, _406);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1199, float2(0.0), isnan(_1199)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1199, float2(0.0), isnan(_1199)), level(_124)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1214 = float2(_400, _406);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1214, float2(0.0), isnan(_1214)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1214, float2(0.0), isnan(_1214)), level(_124)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float _474 = _428 * _432;
        float _476 = _438 * _436;
        float _478 = _434 * _436;
        float _480 = _430 * _432;
        float2 _1241 = float2(_476, _474);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1241, float2(0.0), isnan(_1241)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1241, float2(0.0), isnan(_1241)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1256 = float2(_478, _474);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1256, float2(0.0), isnan(_1256)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1256, float2(0.0), isnan(_1256)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1271 = float2(_476, _480);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1271, float2(0.0), isnan(_1271)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1271, float2(0.0), isnan(_1271)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1286 = float2(_478, _480);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1286, float2(0.0), isnan(_1286)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1286, float2(0.0), isnan(_1286)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = 0.0 + _116;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = fma(_86, _516, _90);
        float _520 = -_124;
        float _522 = _118 + _520;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = _516 * _86;
        float _528 = -_454;
        float _530 = _446 + _528;
        float _532 = -_452;
        float _534 = _444 + _532;
        float _536 = -_468;
        float _538 = _460 + _536;
        float _540 = -_456;
        float _542 = _448 + _540;
        float _544 = -_472;
        float _546 = _464 + _544;
        float _548 = fma(_294, _534, _452);
        float _550 = fma(_294, _538, _468);
        float _552 = -_470;
        float _554 = _462 + _552;
        float _556 = fma(_294, _542, _456);
        float _558 = fma(_294, _546, _472);
        float _560 = fma(_294, _530, _454);
        float _562 = fma(_294, _554, _470);
        float _564 = -_550;
        float _566 = _564 + _548;
        float _568 = -_558;
        float _570 = _568 + _556;
        float _572 = -_494;
        float _574 = _486 + _572;
        float _576 = -_496;
        float _578 = _488 + _576;
        float _580 = -_492;
        float _582 = _484 + _580;
        float _584 = 1.0 / _518;
        float _586 = -_512;
        float _588 = _504 + _586;
        float _590 = fma(_370, _574, _494);
        float _592 = -_508;
        float _594 = _500 + _592;
        float _596 = -_510;
        float _598 = _502 + _596;
        float _600 = fma(_370, _578, _496);
        float _602 = fma(_370, _588, _512);
        float _604 = fma(_370, _582, _492);
        float _606 = fma(_370, _594, _508);
        float _608 = fma(_370, _598, _510);
        float _610 = -_602;
        float _612 = _610 + _600;
        float _614 = fma(_340, _566, _550);
        float _616 = -_606;
        float _618 = _616 + _604;
        float _620 = -_562;
        float _622 = _620 + _560;
        float _624 = -_608;
        float _626 = _624 + _590;
        float _628 = fma(_340, _570, _558);
        float _630 = fma(_376, _612, _602);
        float _632 = fma(_376, _618, _606);
        float _634 = fma(_340, _622, _562);
        float _636 = fma(_376, _626, _608);
        float _638 = -_628;
        float _640 = _638 + _630;
        float _642 = -_614;
        float _644 = _642 + _632;
        float _646 = _584 * _526;
        float _648 = -_634;
        float _650 = _648 + _636;
        float _652 = fma(_524, _640, _628);
        float _654 = fma(_524, _644, _614);
        float _656 = fma(_524, _650, _634);
        float _658 = _652 * _526;
        float _660 = _654 * _646;
        float _662 = _656 * _646;
        float _664 = _658 * _584;
        out.m_36.x = _660;
        out.m_36.y = _662;
        out.m_36.z = _664;
        out.m_36.w = _518;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _90;
    return out;
}

