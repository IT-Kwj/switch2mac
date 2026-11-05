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
int _42(thread const int& _1498, thread const int& _1499, constant _10& support_buffer)
{
    int _1502 = 1 + _1499;
    float _1504 = support_buffer._m5[_1502].x;
    float _1506 = abs(_1504);
    bool _1508 = _1506 == 1.0;
    if (_1508)
    {
        return _1498;
    }
    float _1510 = float(_1498);
    float _1512 = _1510 / _1506;
    int _1514 = int(_1512);
    return _1514;
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
    float2 _684 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).x;
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
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _90);
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
        float _180 = floor(_176);
        float _182 = float(_158);
        float _184 = float(_166);
        float _186 = fma(_62, _182, -0.5);
        float _188 = -_178;
        float _190 = _174 + _188;
        float _192 = fma(_64, _184, -0.5);
        float _194 = floor(_186);
        float _196 = -_190;
        float _198 = _196 + 1.0;
        float _200 = -_190;
        float _202 = _200 + 2.0;
        float _204 = -_180;
        float _206 = _176 + _204;
        float _208 = _198 * _198;
        float _210 = floor(_192);
        float _212 = -_206;
        float _214 = _212 + 1.0;
        float _216 = _198 * _208;
        float _218 = _202 * _202;
        float _220 = -_206;
        float _222 = _220 + 2.0;
        float _224 = _214 * _214;
        float _226 = _216 * 4.0;
        float _228 = 1.0 / _170;
        float _230 = _214 * _224;
        float _232 = -_226;
        float _234 = fma(_202, _218, _232);
        float _236 = -_216;
        float _238 = _236 + 6.0;
        float _240 = _222 * _222;
        float _242 = _230 * 4.0;
        float _244 = -_194;
        float _246 = _186 + _244;
        float _248 = -_234;
        float _250 = _248 + _238;
        float _252 = 1.0 / _182;
        float _254 = -_242;
        float _256 = fma(_222, _240, _254);
        float _258 = -_246;
        float _260 = _258 + 1.0;
        float _262 = _250 * 0.16666667163372039794921875;
        float _264 = -_246;
        float _266 = _264 + 2.0;
        float _268 = -_230;
        float _270 = _268 + 6.0;
        float _272 = _260 * _260;
        float _274 = _216 + _234;
        float _276 = _266 * _266;
        float _278 = -_256;
        float _280 = _278 + _270;
        float _282 = _260 * _272;
        float _284 = -_210;
        float _286 = _192 + _284;
        float _288 = 1.0 / _262;
        float _290 = _280 * 0.16666667163372039794921875;
        float _292 = _282 * 4.0;
        float _294 = -_286;
        float _296 = _294 + 1.0;
        float _298 = -_282;
        float _300 = _298 + 6.0;
        float _302 = _274 * 0.16666667163372039794921875;
        float _304 = -_292;
        float _306 = fma(_266, _276, _304);
        float _308 = _296 * _296;
        float _310 = -_286;
        float _312 = _310 + 2.0;
        float _314 = 1.0 / _302;
        float _316 = -_306;
        float _318 = _316 + _300;
        float _320 = _296 * _308;
        float _322 = _190 * _190;
        float _324 = _312 * _312;
        float _326 = _318 * 0.16666667163372039794921875;
        float _328 = _320 * 4.0;
        float _330 = _230 + _256;
        float _332 = _190 * _322;
        float _334 = 1.0 / _290;
        float _336 = -_328;
        float _338 = fma(_312, _324, _336);
        float _340 = _330 * 0.16666667163372039794921875;
        float _342 = _178 + 1.5;
        float _344 = _332 * 0.16666667163372039794921875;
        float _346 = -_320;
        float _348 = _346 + 6.0;
        float _350 = _178 + (-0.5);
        float _352 = _206 * _206;
        float _354 = 1.0 / _340;
        float _356 = fma(_344, _288, _342);
        float _358 = _234 * 0.16666667163372039794921875;
        float _360 = -_338;
        float _362 = _360 + _348;
        float _364 = _206 * _352;
        float _366 = _282 + _306;
        float _368 = fma(_358, _314, _350);
        float _370 = _320 + _338;
        float _372 = 1.0 / _326;
        float _374 = _362 * 0.16666667163372039794921875;
        float _376 = _180 + (-0.5);
        float _378 = _366 * 0.16666667163372039794921875;
        float _380 = _370 * 0.16666667163372039794921875;
        float _382 = _256 * 0.16666667163372039794921875;
        float _384 = _194 + 1.5;
        float _386 = _338 * 0.16666667163372039794921875;
        float _388 = 1.0 / _374;
        float _390 = _180 + 1.5;
        float _392 = _364 * 0.16666667163372039794921875;
        float _394 = fma(_382, _354, _376);
        float _396 = _286 * _286;
        float _398 = _246 * _246;
        float _400 = fma(_392, _334, _390);
        float _402 = _368 * _172;
        float _404 = 1.0 / _378;
        float _406 = _286 * _396;
        float _408 = _246 * _398;
        float _410 = _194 + (-0.5);
        float _412 = _356 * _172;
        float _414 = _394 * _228;
        float _416 = _210 + 1.5;
        float _418 = _306 * 0.16666667163372039794921875;
        float _420 = 1.0 / _380;
        float _422 = _406 * 0.16666667163372039794921875;
        float _424 = _210 + (-0.5);
        float _426 = _408 * 0.16666667163372039794921875;
        float _428 = _400 * _228;
        float _430 = fma(_422, _388, _416);
        float _432 = fma(_426, _372, _384);
        float _434 = 1.0 / _184;
        float _436 = fma(_418, _404, _410);
        float _438 = _436 * _252;
        float _440 = _432 * _252;
        float _442 = fma(_386, _420, _424);
        float2 _1161 = float2(_402, _414);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1161, float2(0.0), isnan(_1161)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1161, float2(0.0), isnan(_1161)), level(_124)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float _454 = _442 * _434;
        float _456 = _430 * _434;
        float2 _1182 = float2(_412, _414);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1182, float2(0.0), isnan(_1182)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1182, float2(0.0), isnan(_1182)), level(_124)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1197 = float2(_402, _428);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1197, float2(0.0), isnan(_1197)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1197, float2(0.0), isnan(_1197)), level(_124)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1212 = float2(_412, _428);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1212, float2(0.0), isnan(_1212)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1212, float2(0.0), isnan(_1212)), level(_124)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float2 _1227 = float2(_438, _454);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1227, float2(0.0), isnan(_1227)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1227, float2(0.0), isnan(_1227)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1242 = float2(_440, _454);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1242, float2(0.0), isnan(_1242)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1242, float2(0.0), isnan(_1242)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1257 = float2(_438, _456);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float2(0.0), isnan(_1257)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float2(0.0), isnan(_1257)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1272 = float2(_440, _456);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1272, float2(0.0), isnan(_1272)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1272, float2(0.0), isnan(_1272)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = 0.0 + _116;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = fma(_88, _516, _86);
        float _520 = -_124;
        float _522 = _118 + _520;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = -_460;
        float _528 = _448 + _526;
        float _530 = -_462;
        float _532 = _450 + _530;
        float _534 = -_464;
        float _536 = _452 + _534;
        float _538 = fma(_302, _528, _460);
        float _540 = -_478;
        float _542 = _470 + _540;
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = -_480;
        float _550 = _472 + _548;
        float _552 = fma(_302, _532, _462);
        float _554 = fma(_302, _542, _478);
        float _556 = -_492;
        float _558 = _484 + _556;
        float _560 = -_494;
        float _562 = _486 + _560;
        float _564 = -_496;
        float _566 = _488 + _564;
        float _568 = fma(_302, _536, _464);
        float _570 = fma(_378, _558, _492);
        float _572 = fma(_378, _562, _494);
        float _574 = -_508;
        float _576 = _500 + _574;
        float _578 = -_510;
        float _580 = _502 + _578;
        float _582 = -_512;
        float _584 = _504 + _582;
        float _586 = fma(_302, _546, _476);
        float _588 = fma(_378, _576, _508);
        float _590 = fma(_378, _580, _510);
        float _592 = fma(_302, _550, _480);
        float _594 = fma(_378, _566, _496);
        float _596 = fma(_378, _584, _512);
        float _598 = -_586;
        float _600 = _598 + _538;
        float _602 = -_554;
        float _604 = _602 + _552;
        float _606 = -_588;
        float _608 = _606 + _570;
        float _610 = -_590;
        float _612 = _610 + _572;
        float _614 = -_592;
        float _616 = _614 + _568;
        float _618 = -_596;
        float _620 = _618 + _594;
        float _622 = fma(_340, _600, _586);
        float _624 = fma(_340, _604, _554);
        float _626 = fma(_380, _608, _588);
        float _628 = fma(_380, _612, _590);
        float _630 = fma(_340, _616, _592);
        float _632 = fma(_380, _620, _596);
        float _634 = -_622;
        float _636 = _634 + _626;
        float _638 = -_624;
        float _640 = _638 + _628;
        float _642 = -_630;
        float _644 = _642 + _632;
        float _646 = fma(_524, _636, _622);
        float _648 = fma(_524, _640, _624);
        float _650 = fma(_524, _644, _630);
        out.m_36.x = _646;
        out.m_36.y = _648;
        out.m_36.z = _650;
        out.m_36.w = _518;
        return out;
    }
    discard_fragment();
    return out;
}

