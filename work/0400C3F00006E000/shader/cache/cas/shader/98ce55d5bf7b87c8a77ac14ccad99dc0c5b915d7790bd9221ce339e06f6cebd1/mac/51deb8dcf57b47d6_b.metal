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
int _42(thread const int& _1067, thread const int& _1068, constant _10& support_buffer)
{
    int _1071 = 1 + _1068;
    float _1073 = support_buffer._m5[_1071].x;
    float _1075 = abs(_1073);
    bool _1077 = _1075 == 1.0;
    if (_1077)
    {
        return _1067;
    }
    float _1079 = float(_1067);
    float _1081 = _1079 / _1075;
    int _1083 = int(_1081);
    return _1083;
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
    float2 _486 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).x;
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
    float _106 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = precise::max(_100, _104);
    float _112 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = precise::max(_110, _90);
    float _118 = precise::min(_108, _114);
    bool _122 = _116 != 0.0;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan(0.0);
    bool _130 = _126 || _128;
    bool _132 = !_130;
    if (!_132)
    {
        float _134 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _136 = fma(_116, _134, 1.0);
        float _138 = log2(_136);
        float _140 = _138 + (-1.0);
        float _142 = trunc(_140);
        int _144 = int(_142);
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        float _162 = float(_152);
        float _164 = float(_160);
        float _166 = fma(_62, _162, -0.5);
        float _168 = fma(_64, _164, -0.5);
        float _170 = 1.0 / _162;
        float _172 = floor(_166);
        float _174 = floor(_168);
        float _176 = -_172;
        float _178 = _166 + _176;
        float _180 = 1.0 / _164;
        float _182 = -_178;
        float _184 = _182 + 1.0;
        float _186 = -_178;
        float _188 = _186 + 2.0;
        float _190 = -_174;
        float _192 = _168 + _190;
        float _194 = _184 * _184;
        float _196 = _174 + 1.5;
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = _184 * _194;
        float _204 = -_192;
        float _206 = _204 + 2.0;
        float _208 = _188 * _188;
        float _210 = _200 * _200;
        float _212 = _178 * _178;
        float _214 = _206 * _206;
        float _216 = _200 * _210;
        float _218 = _202 * 4.0;
        float _220 = _178 * _212;
        float _222 = _172 + (-0.5);
        float _224 = _216 * 4.0;
        float _226 = -_218;
        float _228 = fma(_188, _208, _226);
        float _230 = -_202;
        float _232 = _230 + 6.0;
        float _234 = -_224;
        float _236 = fma(_206, _214, _234);
        float _238 = -_216;
        float _240 = _238 + 6.0;
        float _242 = -_228;
        float _244 = _242 + _232;
        float _246 = -_236;
        float _248 = _246 + _240;
        float _250 = _244 * 0.16666667163372039794921875;
        float _252 = _202 + _228;
        float _254 = _192 * _192;
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = _216 + _236;
        float _260 = _252 * 0.16666667163372039794921875;
        float _262 = 1.0 / _250;
        float _264 = _192 * _254;
        float _266 = _258 * 0.16666667163372039794921875;
        float _268 = _174 + (-0.5);
        float _270 = _236 * 0.16666667163372039794921875;
        float _272 = _172 + 1.5;
        float _274 = _228 * 0.16666667163372039794921875;
        float _276 = _220 * 0.16666667163372039794921875;
        float _278 = 1.0 / _266;
        float _280 = _264 * 0.16666667163372039794921875;
        float _282 = 1.0 / _260;
        float _284 = fma(_276, _262, _272);
        float _286 = 1.0 / _256;
        float _288 = fma(_270, _278, _268);
        float _290 = _288 * _180;
        float _292 = fma(_274, _282, _222);
        float _294 = _284 * _170;
        float _296 = _292 * _170;
        float _298 = fma(_280, _286, _196);
        float _300 = _298 * _180;
        float2 _810 = float2(_296, _290);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_810, float2(0.0), isnan(_810)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_810, float2(0.0), isnan(_810)), level(_140)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _825 = float2(_294, _290);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825)), level(_140)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _840 = float2(_296, _300);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840)), level(_140)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float2 _855 = float2(_294, _300);
        float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_855, float2(0.0), isnan(_855)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_855, float2(0.0), isnan(_855)), level(_140)).xyz;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = 0.0 + _138;
        float _338 = precise::clamp(_336, 0.0, 1.0);
        float _340 = fma(_88, _338, _86);
        float _342 = -_316;
        float _344 = _308 + _342;
        float _346 = -_314;
        float _348 = _306 + _346;
        float _350 = -_332;
        float _352 = _324 + _350;
        float _354 = -_330;
        float _356 = _322 + _354;
        float _358 = fma(_260, _344, _316);
        float _360 = fma(_260, _348, _314);
        float _362 = fma(_260, _352, _332);
        float _364 = -_318;
        float _366 = _310 + _364;
        float _368 = -_334;
        float _370 = _326 + _368;
        float _372 = fma(_260, _356, _330);
        float _374 = -_362;
        float _376 = _374 + _358;
        float _378 = fma(_260, _366, _318);
        float _380 = fma(_260, _370, _334);
        float _382 = -_372;
        float _384 = _382 + _360;
        float _386 = fma(_266, _376, _362);
        float _388 = _338 * _88;
        float _390 = -_380;
        float _392 = _390 + _378;
        float _394 = fma(_266, _384, _372);
        float _396 = _386 * 0.586600005626678466796875;
        float _398 = 1.0 / _340;
        float _400 = fma(_266, _392, _380);
        float _402 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _404 = fma(_394, 0.29890000820159912109375, _396);
        float _406 = fma(_400, 0.1143999993801116943359375, _404);
        float _408 = -_400;
        float _410 = _408 + _406;
        float _412 = -_394;
        float _414 = _412 + _406;
        float _416 = -_386;
        float _418 = _416 + _406;
        float _420 = fma(_402, _410, _400);
        float _422 = fma(_402, _414, _394);
        float _424 = fma(_402, _418, _386);
        float _426 = -_420;
        float _428 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[13].z, _426);
        float _430 = -_422;
        float _432 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[13].x, _430);
        float _434 = -_424;
        float _436 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[13].y, _434);
        float _438 = fma(_118, _428, _420);
        float _440 = fma(_118, _432, _422);
        float _442 = _398 * _388;
        float _444 = fma(_118, _436, _424);
        float _446 = _438 * _388;
        float _448 = _440 * _442;
        float _450 = _444 * _442;
        float _452 = _446 * _398;
        out.m_36.x = _448;
        out.m_36.y = _450;
        out.m_36.z = _452;
        out.m_36.w = _340;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

