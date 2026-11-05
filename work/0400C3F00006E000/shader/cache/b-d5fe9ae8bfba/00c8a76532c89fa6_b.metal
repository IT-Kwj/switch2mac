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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _1417, thread const int& _1418, constant _10& support_buffer)
{
    int _1421 = 1 + _1418;
    float _1423 = support_buffer._m5[_1421].x;
    float _1425 = abs(_1423);
    bool _1427 = _1425 == 1.0;
    if (_1427)
    {
        return _1417;
    }
    float _1429 = float(_1417);
    float _1431 = _1429 / _1425;
    int _1433 = int(_1431);
    return _1433;
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
    float2 _650 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_650, float2(0.0), isnan(_650))).x;
    bool _68 = _64 != 0.0;
    bool _70 = isnan(_64);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.0);
    bool _76 = _72 || _74;
    bool _78 = !_76;
    if (!_78)
    {
        float _80 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _82 = fma(_64, _80, 1.0);
        float _84 = log2(_82);
        float _86 = _84 + (-1.0);
        float _88 = trunc(_86);
        int _90 = int(_88);
        float _92 = float(_90);
        float _94 = trunc(_92);
        int _96 = int(_94);
        float _98 = _92 + 1.0;
        float _100 = trunc(_98);
        int _102 = int(_100);
        int _104 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_96), spvDescriptorSet0.fp_t_tcb_A.get_height(_96)).x;
        int _106 = _104;
        int _108 = 1;
        int _110 = _40(_106, _108, (*spvDescriptorSet0.support_buffer));
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_96), spvDescriptorSet0.fp_t_tcb_A.get_height(_96)).y;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).x;
        int _122 = _120;
        int _124 = 1;
        int _126 = _40(_122, _124, (*spvDescriptorSet0.support_buffer));
        int _128 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).y;
        int _130 = _128;
        int _132 = 1;
        int _134 = _40(_130, _132, (*spvDescriptorSet0.support_buffer));
        float _136 = float(_110);
        float _138 = float(_118);
        float _140 = 1.0 / _136;
        float _142 = fma(_60, _136, -0.5);
        float _144 = fma(_62, _138, -0.5);
        float _146 = floor(_142);
        float _148 = float(_126);
        float _150 = fma(_60, _148, -0.5);
        float _152 = float(_134);
        float _154 = floor(_144);
        float _156 = fma(_62, _152, -0.5);
        float _158 = -_146;
        float _160 = _142 + _158;
        float _162 = floor(_150);
        float _164 = -_160;
        float _166 = _164 + 1.0;
        float _168 = -_160;
        float _170 = _168 + 2.0;
        float _172 = _166 * _166;
        float _174 = -_154;
        float _176 = _144 + _174;
        float _178 = _170 * _170;
        float _180 = floor(_156);
        float _182 = _166 * _172;
        float _184 = -_176;
        float _186 = _184 + 1.0;
        float _188 = -_176;
        float _190 = _188 + 2.0;
        float _192 = _182 * 4.0;
        float _194 = _186 * _186;
        float _196 = 1.0 / _138;
        float _198 = -_192;
        float _200 = fma(_170, _178, _198);
        float _202 = -_182;
        float _204 = _202 + 6.0;
        float _206 = _186 * _194;
        float _208 = _190 * _190;
        float _210 = -_200;
        float _212 = _210 + _204;
        float _214 = _206 * 4.0;
        float _216 = 1.0 / _148;
        float _218 = _212 * 0.16666667163372039794921875;
        float _220 = -_162;
        float _222 = _150 + _220;
        float _224 = -_214;
        float _226 = fma(_190, _208, _224);
        float _228 = -_206;
        float _230 = _228 + 6.0;
        float _232 = -_180;
        float _234 = _156 + _232;
        float _236 = -_222;
        float _238 = _236 + 1.0;
        float _240 = -_222;
        float _242 = _240 + 2.0;
        float _244 = -_226;
        float _246 = _244 + _230;
        float _248 = -_234;
        float _250 = _248 + 1.0;
        float _252 = _238 * _238;
        float _254 = _242 * _242;
        float _256 = _246 * 0.16666667163372039794921875;
        float _258 = _250 * _250;
        float _260 = _238 * _252;
        float _262 = -_234;
        float _264 = _262 + 2.0;
        float _266 = _182 + _200;
        float _268 = _250 * _258;
        float _270 = _260 * 4.0;
        float _272 = _206 + _226;
        float _274 = -_260;
        float _276 = _274 + 6.0;
        float _278 = 1.0 / _218;
        float _280 = -_270;
        float _282 = fma(_242, _254, _280);
        float _284 = _264 * _264;
        float _286 = _268 * 4.0;
        float _288 = _266 * 0.16666667163372039794921875;
        float _290 = -_282;
        float _292 = _290 + _276;
        float _294 = -_268;
        float _296 = _294 + 6.0;
        float _298 = -_286;
        float _300 = fma(_264, _284, _298);
        float _302 = _160 * _160;
        float _304 = 1.0 / _288;
        float _306 = _272 * 0.16666667163372039794921875;
        float _308 = -_300;
        float _310 = _308 + _296;
        float _312 = _160 * _302;
        float _314 = _146 + 1.5;
        float _316 = _268 + _300;
        float _318 = _310 * 0.16666667163372039794921875;
        float _320 = _312 * 0.16666667163372039794921875;
        float _322 = _260 + _282;
        float _324 = 1.0 / _306;
        float _326 = _200 * 0.16666667163372039794921875;
        float _328 = fma(_320, _278, _314);
        float _330 = _146 + (-0.5);
        float _332 = _322 * 0.16666667163372039794921875;
        float _334 = _154 + (-0.5);
        float _336 = _154 + 1.5;
        float _338 = _226 * 0.16666667163372039794921875;
        float _340 = 1.0 / _256;
        float _342 = _316 * 0.16666667163372039794921875;
        float _344 = _176 * _176;
        float _346 = fma(_326, _304, _330);
        float _348 = _292 * 0.16666667163372039794921875;
        float _350 = _234 * _234;
        float _352 = _176 * _344;
        float _354 = 1.0 / _318;
        float _356 = fma(_338, _324, _334);
        float _358 = _352 * 0.16666667163372039794921875;
        float _360 = _234 * _350;
        float _362 = _346 * _140;
        float _364 = _328 * _140;
        float _366 = _222 * _222;
        float _368 = _180 + (-0.5);
        float _370 = 1.0 / _342;
        float _372 = fma(_358, _340, _336);
        float _374 = _180 + 1.5;
        float _376 = _300 * 0.16666667163372039794921875;
        float _378 = _360 * 0.16666667163372039794921875;
        float _380 = _222 * _366;
        float _382 = _356 * _196;
        float _384 = _372 * _196;
        float _386 = 1.0 / _152;
        float _388 = fma(_378, _354, _374);
        float _390 = _162 + (-0.5);
        float _392 = _162 + 1.5;
        float _394 = _282 * 0.16666667163372039794921875;
        float _396 = _380 * 0.16666667163372039794921875;
        float _398 = 1.0 / _348;
        float _400 = fma(_376, _370, _368);
        float _402 = 1.0 / _332;
        float _404 = _400 * _386;
        float _406 = _388 * _386;
        float _408 = fma(_396, _398, _392);
        float2 _1079 = float2(_362, _382);
        float3 _412 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1079, float2(0.0), isnan(_1079)), level(_92)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1079, float2(0.0), isnan(_1079)), level(_92)).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float2 _1094 = float2(_364, _382);
        float3 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1094, float2(0.0), isnan(_1094)), level(_92)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1094, float2(0.0), isnan(_1094)), level(_92)).xyz;
        float _422 = _420.x;
        float _424 = _420.y;
        float _426 = _420.z;
        float2 _1109 = float2(_362, _384);
        float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1109, float2(0.0), isnan(_1109)), level(_92)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1109, float2(0.0), isnan(_1109)), level(_92)).xyz;
        float _430 = _428.x;
        float _432 = _428.y;
        float _434 = _428.z;
        float _436 = fma(_394, _402, _390);
        float _438 = _436 * _216;
        float _440 = _408 * _216;
        float2 _1134 = float2(_364, _384);
        float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1134, float2(0.0), isnan(_1134)), level(_92)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1134, float2(0.0), isnan(_1134)), level(_92)).xyz;
        float _444 = _442.x;
        float _446 = _442.y;
        float _448 = _442.z;
        float2 _1149 = float2(_438, _404);
        float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1149, float2(0.0), isnan(_1149)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1149, float2(0.0), isnan(_1149)), level(_98)).xyz;
        float _452 = _450.x;
        float _454 = _450.y;
        float _456 = _450.z;
        float2 _1164 = float2(_440, _404);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1164, float2(0.0), isnan(_1164)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1164, float2(0.0), isnan(_1164)), level(_98)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1179 = float2(_438, _406);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1179, float2(0.0), isnan(_1179)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1179, float2(0.0), isnan(_1179)), level(_98)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1194 = float2(_440, _406);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1194, float2(0.0), isnan(_1194)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1194, float2(0.0), isnan(_1194)), level(_98)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float _482 = 0.0 + _84;
        float _484 = precise::clamp(_482, 0.0, 1.0);
        float _486 = -_92;
        float _488 = _86 + _486;
        float _490 = precise::clamp(_488, 0.0, 1.0);
        float _492 = -_422;
        float _494 = _414 + _492;
        float _496 = -_424;
        float _498 = _416 + _496;
        float _500 = -_426;
        float _502 = _418 + _500;
        float _504 = fma(_288, _494, _422);
        float _506 = fma(_288, _498, _424);
        float _508 = fma(_288, _502, _426);
        float _510 = -_446;
        float _512 = _432 + _510;
        float _514 = -_444;
        float _516 = _430 + _514;
        float _518 = -_448;
        float _520 = _434 + _518;
        float _522 = fma(_288, _512, _446);
        float _524 = fma(_288, _516, _444);
        float _526 = -_462;
        float _528 = _454 + _526;
        float _530 = -_460;
        float _532 = _452 + _530;
        float _534 = -_522;
        float _536 = _534 + _506;
        float _538 = -_464;
        float _540 = _456 + _538;
        float _542 = fma(_332, _528, _462);
        float _544 = -_476;
        float _546 = _468 + _544;
        float _548 = fma(_306, _536, _522);
        float _550 = -_478;
        float _552 = _470 + _550;
        float _554 = -_480;
        float _556 = _472 + _554;
        float _558 = fma(_288, _520, _448);
        float _560 = fma(_332, _532, _460);
        float _562 = fma(_332, _546, _476);
        float _564 = fma(_332, _552, _478);
        float _566 = fma(_332, _540, _464);
        float _568 = fma(_332, _556, _480);
        float _570 = -_558;
        float _572 = _570 + _508;
        float _574 = -_524;
        float _576 = _574 + _504;
        float _578 = -_562;
        float _580 = _578 + _560;
        float _582 = -_564;
        float _584 = _582 + _542;
        float _586 = -_568;
        float _588 = _586 + _566;
        float _590 = fma(_306, _572, _558);
        float _592 = fma(_306, _576, _524);
        float _594 = fma(_342, _580, _562);
        float _596 = fma(_342, _584, _564);
        float _598 = fma(_342, _588, _568);
        float _600 = -_592;
        float _602 = _600 + _594;
        float _604 = -_548;
        float _606 = _604 + _596;
        float _608 = -_590;
        float _610 = _608 + _598;
        float _612 = fma(_490, _602, _592);
        float _614 = fma(_490, _606, _548);
        float _616 = fma(_490, _610, _590);
        out.m_34.x = _612;
        out.m_34.y = _614;
        out.m_34.z = _616;
        out.m_34.w = _484;
        return out;
    }
    discard_fragment();
    return out;
}

