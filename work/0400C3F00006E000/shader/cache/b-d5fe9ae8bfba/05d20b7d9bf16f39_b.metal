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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1067, thread const int& _1068, constant _10& support_buffer)
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
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _486 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).x;
    float2 _497 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_497, float2(0.0), isnan(_497))).x;
    float _72 = in.m_35.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = _62 * _82;
    float _94 = _62 * _88;
    float _96 = -_68;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _100 = 1.0 / _98;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = precise::max(_70, _104);
    float _108 = precise::max(_106, _94);
    bool _112 = _108 != 0.0;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    float _122 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = precise::min(_124, _128);
    bool _132 = !_120;
    if (!_132)
    {
        float _134 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _136 = fma(_108, _134, 1.0);
        float _138 = log2(_136);
        float _140 = _138 + (-1.0);
        float _142 = trunc(_140);
        int _144 = int(_142);
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).x;
        int _148 = _146;
        int _150 = 2;
        int _152 = _44(_148, _150, (*spvDescriptorSet0.support_buffer));
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_144), spvDescriptorSet0.fp_t_tcb_A.get_height(_144)).y;
        int _156 = _154;
        int _158 = 2;
        int _160 = _44(_156, _158, (*spvDescriptorSet0.support_buffer));
        float _162 = float(_152);
        float _164 = float(_160);
        float _166 = fma(_64, _162, -0.5);
        float _168 = fma(_66, _164, -0.5);
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
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_810, float2(0.0), isnan(_810)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_810, float2(0.0), isnan(_810)), level(_140)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _825 = float2(_294, _290);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825)), level(_140)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _840 = float2(_296, _300);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840)), level(_140)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float2 _855 = float2(_294, _300);
        float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_855, float2(0.0), isnan(_855)), level(_140)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_855, float2(0.0), isnan(_855)), level(_140)).xyz;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = 0.0 + _138;
        float _338 = precise::clamp(_336, 0.0, 1.0);
        float _340 = fma(_90, _338, _92);
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
        float _388 = _338 * _90;
        float _390 = -_380;
        float _392 = _390 + _378;
        float _394 = fma(_266, _384, _372);
        float _396 = _386 * 0.586600005626678466796875;
        float _398 = 1.0 / _340;
        float _400 = fma(_266, _392, _380);
        float _402 = _130 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
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
        float _438 = fma(_130, _428, _420);
        float _440 = fma(_130, _432, _422);
        float _442 = _398 * _388;
        float _444 = fma(_130, _436, _424);
        float _446 = _438 * _388;
        float _448 = _440 * _442;
        float _450 = _444 * _442;
        float _452 = _446 * _398;
        out.m_38.x = _448;
        out.m_38.y = _450;
        out.m_38.z = _452;
        out.m_38.w = _340;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _92;
    return out;
}

