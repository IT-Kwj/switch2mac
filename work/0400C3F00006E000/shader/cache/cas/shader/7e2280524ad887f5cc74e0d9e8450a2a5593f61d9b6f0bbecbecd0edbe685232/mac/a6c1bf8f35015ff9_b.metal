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
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1066, thread const int& _1067, constant _10& support_buffer)
{
    int _1070 = 1 + _1067;
    float _1072 = support_buffer._m5[_1070].x;
    float _1074 = abs(_1072);
    bool _1076 = _1074 == 1.0;
    if (_1076)
    {
        return _1066;
    }
    float _1078 = float(_1066);
    float _1080 = _1078 / _1074;
    int _1082 = int(_1080);
    return _1082;
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
    float2 _482 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _60 * _82;
    float _102 = precise::max(_98, _100);
    float _104 = _60 * _94;
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _60 * _88;
    float _126 = precise::min(_118, _122);
    bool _128 = !_114;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_102, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _152 = _150;
        int _154 = 1;
        int _156 = _42(_152, _154, (*spvDescriptorSet0.support_buffer));
        float _158 = float(_148);
        float _160 = float(_156);
        float _162 = fma(_62, _158, -0.5);
        float _164 = fma(_64, _160, -0.5);
        float _166 = 1.0 / _158;
        float _168 = floor(_162);
        float _170 = floor(_164);
        float _172 = -_168;
        float _174 = _162 + _172;
        float _176 = 1.0 / _160;
        float _178 = -_174;
        float _180 = _178 + 1.0;
        float _182 = -_174;
        float _184 = _182 + 2.0;
        float _186 = -_170;
        float _188 = _164 + _186;
        float _190 = _180 * _180;
        float _192 = _170 + 1.5;
        float _194 = -_188;
        float _196 = _194 + 1.0;
        float _198 = _180 * _190;
        float _200 = -_188;
        float _202 = _200 + 2.0;
        float _204 = _184 * _184;
        float _206 = _196 * _196;
        float _208 = _174 * _174;
        float _210 = _202 * _202;
        float _212 = _196 * _206;
        float _214 = _198 * 4.0;
        float _216 = _174 * _208;
        float _218 = _168 + (-0.5);
        float _220 = _212 * 4.0;
        float _222 = -_214;
        float _224 = fma(_184, _204, _222);
        float _226 = -_198;
        float _228 = _226 + 6.0;
        float _230 = -_220;
        float _232 = fma(_202, _210, _230);
        float _234 = -_212;
        float _236 = _234 + 6.0;
        float _238 = -_224;
        float _240 = _238 + _228;
        float _242 = -_232;
        float _244 = _242 + _236;
        float _246 = _240 * 0.16666667163372039794921875;
        float _248 = _198 + _224;
        float _250 = _188 * _188;
        float _252 = _244 * 0.16666667163372039794921875;
        float _254 = _212 + _232;
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = 1.0 / _246;
        float _260 = _188 * _250;
        float _262 = _254 * 0.16666667163372039794921875;
        float _264 = _170 + (-0.5);
        float _266 = _232 * 0.16666667163372039794921875;
        float _268 = _168 + 1.5;
        float _270 = _224 * 0.16666667163372039794921875;
        float _272 = _216 * 0.16666667163372039794921875;
        float _274 = 1.0 / _262;
        float _276 = _260 * 0.16666667163372039794921875;
        float _278 = 1.0 / _256;
        float _280 = fma(_272, _258, _268);
        float _282 = 1.0 / _252;
        float _284 = fma(_266, _274, _264);
        float _286 = _284 * _176;
        float _288 = fma(_270, _278, _218);
        float _290 = _280 * _166;
        float _292 = _288 * _166;
        float _294 = fma(_276, _282, _192);
        float _296 = _294 * _176;
        float2 _810 = float2(_292, _286);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_810, float2(0.0), isnan(_810)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_810, float2(0.0), isnan(_810)), level(_136)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _825 = float2(_290, _286);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825)), level(_136)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _840 = float2(_292, _296);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840)), level(_136)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _855 = float2(_290, _296);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_855, float2(0.0), isnan(_855)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_855, float2(0.0), isnan(_855)), level(_136)).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 0.0 + _134;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = fma(_104, _334, _124);
        float _338 = -_312;
        float _340 = _304 + _338;
        float _342 = -_310;
        float _344 = _302 + _342;
        float _346 = -_328;
        float _348 = _320 + _346;
        float _350 = -_326;
        float _352 = _318 + _350;
        float _354 = fma(_256, _340, _312);
        float _356 = fma(_256, _344, _310);
        float _358 = fma(_256, _348, _328);
        float _360 = -_314;
        float _362 = _306 + _360;
        float _364 = -_330;
        float _366 = _322 + _364;
        float _368 = fma(_256, _352, _326);
        float _370 = -_358;
        float _372 = _370 + _354;
        float _374 = fma(_256, _362, _314);
        float _376 = fma(_256, _366, _330);
        float _378 = -_368;
        float _380 = _378 + _356;
        float _382 = fma(_262, _372, _358);
        float _384 = _334 * _104;
        float _386 = -_376;
        float _388 = _386 + _374;
        float _390 = fma(_262, _380, _368);
        float _392 = _382 * 0.586600005626678466796875;
        float _394 = 1.0 / _336;
        float _396 = fma(_262, _388, _376);
        float _398 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _400 = fma(_390, 0.29890000820159912109375, _392);
        float _402 = fma(_396, 0.1143999993801116943359375, _400);
        float _404 = -_396;
        float _406 = _404 + _402;
        float _408 = -_390;
        float _410 = _408 + _402;
        float _412 = -_382;
        float _414 = _412 + _402;
        float _416 = fma(_398, _406, _396);
        float _418 = fma(_398, _410, _390);
        float _420 = fma(_398, _414, _382);
        float _422 = -_416;
        float _424 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[13].z, _422);
        float _426 = -_418;
        float _428 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[13].x, _426);
        float _430 = -_420;
        float _432 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[13].y, _430);
        float _434 = fma(_126, _424, _416);
        float _436 = fma(_126, _428, _418);
        float _438 = _394 * _384;
        float _440 = fma(_126, _432, _420);
        float _442 = _434 * _384;
        float _444 = _436 * _438;
        float _446 = _440 * _438;
        float _448 = _442 * _394;
        out.m_34.x = _444;
        out.m_34.y = _446;
        out.m_34.z = _448;
        out.m_34.w = _336;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _124;
    return out;
}

