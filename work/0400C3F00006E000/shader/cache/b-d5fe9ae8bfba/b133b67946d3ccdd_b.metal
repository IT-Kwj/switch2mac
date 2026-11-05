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
int _44(thread const int& _1500, thread const int& _1501, constant _10& support_buffer)
{
    int _1504 = 1 + _1501;
    float _1506 = support_buffer._m5[_1504].x;
    float _1508 = abs(_1506);
    bool _1510 = _1508 == 1.0;
    if (_1510)
    {
        return _1500;
    }
    float _1512 = float(_1500);
    float _1514 = _1512 / _1508;
    int _1516 = int(_1514);
    return _1516;
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
    float2 _682 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_682, float2(0.0), isnan(_682))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = _62 * _74;
    float _84 = _62 * _80;
    float _86 = -_68;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _90 = 1.0 / _88;
    bool _94 = _90 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_94)
    {
        discard_fragment();
    }
    float _96 = fma(_82, _90, _84);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    if (_94)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _100 = _98 != 0.0;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_98, _112, 1.0);
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
        int _142 = _44(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _44(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _154 = _152;
        int _156 = 1;
        int _158 = _44(_154, _156, (*spvDescriptorSet0.support_buffer));
        int _160 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _162 = _160;
        int _164 = 1;
        int _166 = _44(_162, _164, (*spvDescriptorSet0.support_buffer));
        float _168 = float(_142);
        float _170 = float(_150);
        float _172 = 1.0 / _168;
        float _174 = fma(_64, _168, -0.5);
        float _176 = fma(_66, _170, -0.5);
        float _178 = floor(_174);
        float _180 = float(_158);
        float _182 = fma(_64, _180, -0.5);
        float _184 = float(_166);
        float _186 = floor(_176);
        float _188 = fma(_66, _184, -0.5);
        float _190 = -_178;
        float _192 = _174 + _190;
        float _194 = floor(_182);
        float _196 = -_192;
        float _198 = _196 + 1.0;
        float _200 = -_192;
        float _202 = _200 + 2.0;
        float _204 = _198 * _198;
        float _206 = -_186;
        float _208 = _176 + _206;
        float _210 = floor(_188);
        float _212 = _198 * _204;
        float _214 = -_208;
        float _216 = _214 + 1.0;
        float _218 = _202 * _202;
        float _220 = -_208;
        float _222 = _220 + 2.0;
        float _224 = _212 * 4.0;
        float _226 = _216 * _216;
        float _228 = 1.0 / _170;
        float _230 = -_224;
        float _232 = fma(_202, _218, _230);
        float _234 = -_212;
        float _236 = _234 + 6.0;
        float _238 = _216 * _226;
        float _240 = _222 * _222;
        float _242 = -_232;
        float _244 = _242 + _236;
        float _246 = _238 * 4.0;
        float _248 = 1.0 / _180;
        float _250 = _244 * 0.16666667163372039794921875;
        float _252 = -_194;
        float _254 = _182 + _252;
        float _256 = -_246;
        float _258 = fma(_222, _240, _256);
        float _260 = -_210;
        float _262 = _188 + _260;
        float _264 = -_238;
        float _266 = _264 + 6.0;
        float _268 = -_254;
        float _270 = _268 + 1.0;
        float _272 = -_254;
        float _274 = _272 + 2.0;
        float _276 = -_262;
        float _278 = _276 + 1.0;
        float _280 = -_258;
        float _282 = _280 + _266;
        float _284 = _270 * _270;
        float _286 = _274 * _274;
        float _288 = -_262;
        float _290 = _288 + 2.0;
        float _292 = _282 * 0.16666667163372039794921875;
        float _294 = _270 * _284;
        float _296 = _278 * _278;
        float _298 = _212 + _232;
        float _300 = 1.0 / _250;
        float _302 = _294 * 4.0;
        float _304 = _278 * _296;
        float _306 = _238 + _258;
        float _308 = -_294;
        float _310 = _308 + 6.0;
        float _312 = -_302;
        float _314 = fma(_274, _286, _312);
        float _316 = _290 * _290;
        float _318 = _304 * 4.0;
        float _320 = _298 * 0.16666667163372039794921875;
        float _322 = -_314;
        float _324 = _322 + _310;
        float _326 = -_304;
        float _328 = _326 + 6.0;
        float _330 = -_318;
        float _332 = fma(_290, _316, _330);
        float _334 = _192 * _192;
        float _336 = 1.0 / _320;
        float _338 = _306 * 0.16666667163372039794921875;
        float _340 = -_332;
        float _342 = _340 + _328;
        float _344 = _192 * _334;
        float _346 = _178 + 1.5;
        float _348 = _304 + _332;
        float _350 = _342 * 0.16666667163372039794921875;
        float _352 = _344 * 0.16666667163372039794921875;
        float _354 = 1.0 / _338;
        float _356 = _294 + _314;
        float _358 = _208 * _208;
        float _360 = fma(_352, _300, _346);
        float _362 = _178 + (-0.5);
        float _364 = _356 * 0.16666667163372039794921875;
        float _366 = _186 + (-0.5);
        float _368 = _186 + 1.5;
        float _370 = 1.0 / _292;
        float _372 = _232 * 0.16666667163372039794921875;
        float _374 = _258 * 0.16666667163372039794921875;
        float _376 = _348 * 0.16666667163372039794921875;
        float _378 = _324 * 0.16666667163372039794921875;
        float _380 = _208 * _358;
        float _382 = fma(_372, _336, _362);
        float _384 = _262 * _262;
        float _386 = 1.0 / _350;
        float _388 = _380 * 0.16666667163372039794921875;
        float _390 = fma(_374, _354, _366);
        float _392 = _382 * _172;
        float _394 = _360 * _172;
        float _396 = _254 * _254;
        float _398 = _262 * _384;
        float _400 = _390 * _228;
        float _402 = 1.0 / _376;
        float _404 = fma(_388, _370, _368);
        float _406 = _254 * _396;
        float _408 = _194 + (-0.5);
        float _410 = _210 + (-0.5);
        float _412 = _404 * _228;
        float _414 = _194 + 1.5;
        float _416 = _210 + 1.5;
        float _418 = 1.0 / _378;
        float _420 = _332 * 0.16666667163372039794921875;
        float _422 = _398 * 0.16666667163372039794921875;
        float _424 = _406 * 0.16666667163372039794921875;
        float _426 = _314 * 0.16666667163372039794921875;
        float _428 = fma(_422, _386, _416);
        float _430 = 1.0 / _184;
        float _432 = fma(_420, _402, _410);
        float _434 = 1.0 / _364;
        float _436 = fma(_424, _418, _414);
        float _438 = _436 * _248;
        float _440 = _432 * _430;
        float _442 = _428 * _430;
        float2 _1167 = float2(_392, _400);
        float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1167, float2(0.0), isnan(_1167)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1167, float2(0.0), isnan(_1167)), level(_124)).xyz;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _446.z;
        float _454 = fma(_426, _434, _408);
        float2 _1186 = float2(_394, _400);
        float3 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1186, float2(0.0), isnan(_1186)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1186, float2(0.0), isnan(_1186)), level(_124)).xyz;
        float _458 = _456.x;
        float _460 = _456.y;
        float _462 = _456.z;
        float2 _1201 = float2(_392, _412);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1201, float2(0.0), isnan(_1201)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1201, float2(0.0), isnan(_1201)), level(_124)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1216 = float2(_394, _412);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1216, float2(0.0), isnan(_1216)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1216, float2(0.0), isnan(_1216)), level(_124)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float _480 = _454 * _248;
        float2 _1234 = float2(_480, _440);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1234, float2(0.0), isnan(_1234)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1234, float2(0.0), isnan(_1234)), level(_130)).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        float2 _1249 = float2(_438, _440);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1249, float2(0.0), isnan(_1249)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1249, float2(0.0), isnan(_1249)), level(_130)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float2 _1264 = float2(_480, _442);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1264, float2(0.0), isnan(_1264)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1264, float2(0.0), isnan(_1264)), level(_130)).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        float2 _1279 = float2(_438, _442);
        float3 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1279, float2(0.0), isnan(_1279)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1279, float2(0.0), isnan(_1279)), level(_130)).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        float _514 = -_124;
        float _516 = _118 + _514;
        float _518 = precise::clamp(_516, 0.0, 1.0);
        float _520 = 0.0 + _116;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = -_458;
        float _526 = _448 + _524;
        float _528 = -_460;
        float _530 = _450 + _528;
        float _532 = -_476;
        float _534 = _468 + _532;
        float _536 = -_474;
        float _538 = _466 + _536;
        float _540 = fma(_320, _526, _458);
        float _542 = fma(_320, _530, _460);
        float _544 = fma(_320, _534, _476);
        float _546 = -_462;
        float _548 = _452 + _546;
        float _550 = -_478;
        float _552 = _470 + _550;
        float _554 = fma(_320, _538, _474);
        float _556 = -_544;
        float _558 = _556 + _542;
        float _560 = fma(_320, _548, _462);
        float _562 = -_494;
        float _564 = _486 + _562;
        float _566 = -_492;
        float _568 = _484 + _566;
        float _570 = fma(_338, _558, _544);
        float _572 = -_496;
        float _574 = _488 + _572;
        float _576 = fma(_364, _564, _494);
        float _578 = -_508;
        float _580 = _500 + _578;
        float _582 = -_510;
        float _584 = _502 + _582;
        float _586 = -_512;
        float _588 = _504 + _586;
        float _590 = fma(_320, _552, _478);
        float _592 = fma(_364, _568, _492);
        float _594 = fma(_364, _580, _508);
        float _596 = fma(_364, _584, _510);
        float _598 = fma(_364, _574, _496);
        float _600 = fma(_364, _588, _512);
        float _602 = -_590;
        float _604 = _602 + _560;
        float _606 = -_554;
        float _608 = _606 + _540;
        float _610 = -_594;
        float _612 = _610 + _592;
        float _614 = -_596;
        float _616 = _614 + _576;
        float _618 = -_600;
        float _620 = _618 + _598;
        float _622 = fma(_338, _604, _590);
        float _624 = fma(_338, _608, _554);
        float _626 = fma(_376, _612, _594);
        float _628 = fma(_376, _616, _596);
        float _630 = fma(_376, _620, _600);
        float _632 = -_624;
        float _634 = _632 + _626;
        float _636 = -_570;
        float _638 = _636 + _628;
        float _640 = -_622;
        float _642 = _640 + _630;
        float _644 = fma(_518, _634, _624);
        float _646 = fma(_518, _638, _570);
        float _648 = fma(_518, _642, _622);
        out.m_38.x = _644;
        out.m_38.y = _646;
        out.m_38.z = _648;
        out.m_38.w = _522;
        return out;
    }
    discard_fragment();
    return out;
}

