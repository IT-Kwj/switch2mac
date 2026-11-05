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
int _42(thread const int& _1028, thread const int& _1029, constant _10& support_buffer)
{
    int _1032 = 1 + _1029;
    float _1034 = support_buffer._m5[_1032].x;
    float _1036 = abs(_1034);
    bool _1038 = _1036 == 1.0;
    if (_1038)
    {
        return _1028;
    }
    float _1040 = float(_1028);
    float _1042 = _1040 / _1036;
    int _1044 = int(_1042);
    return _1044;
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
    float2 _472 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
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
    float _122 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
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
        float _180 = -_178;
        float _182 = _180 + 1.0;
        float _184 = -_178;
        float _186 = _184 + 2.0;
        float _188 = -_174;
        float _190 = _168 + _188;
        float _192 = _182 * _182;
        float _194 = _186 * _186;
        float _196 = -_190;
        float _198 = _196 + 1.0;
        float _200 = _182 * _192;
        float _202 = -_190;
        float _204 = _202 + 2.0;
        float _206 = _198 * _198;
        float _208 = -_200;
        float _210 = _208 + 6.0;
        float _212 = _204 * _204;
        float _214 = _198 * _206;
        float _216 = _200 * 4.0;
        float _218 = _214 * 4.0;
        float _220 = -_216;
        float _222 = fma(_186, _194, _220);
        float _224 = -_214;
        float _226 = _224 + 6.0;
        float _228 = 1.0 / _164;
        float _230 = -_218;
        float _232 = fma(_204, _212, _230);
        float _234 = _200 + _222;
        float _236 = -_222;
        float _238 = _236 + _210;
        float _240 = _222 * 0.16666667163372039794921875;
        float _242 = _214 + _232;
        float _244 = -_232;
        float _246 = _244 + _226;
        float _248 = _234 * 0.16666667163372039794921875;
        float _250 = _238 * 0.16666667163372039794921875;
        float _252 = _242 * 0.16666667163372039794921875;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = 1.0 / _248;
        float _258 = _190 * _190;
        float _260 = _178 * _178;
        float _262 = _232 * 0.16666667163372039794921875;
        float _264 = _174 + 1.5;
        float _266 = _190 * _258;
        float _268 = _178 * _260;
        float _270 = _174 + (-0.5);
        float _272 = 1.0 / _252;
        float _274 = _172 + (-0.5);
        float _276 = _266 * 0.16666667163372039794921875;
        float _278 = _172 + 1.5;
        float _280 = _268 * 0.16666667163372039794921875;
        float _282 = 1.0 / _254;
        float _284 = fma(_240, _256, _274);
        float _286 = _284 * _170;
        float _288 = 1.0 / _250;
        float _290 = fma(_262, _272, _270);
        float _292 = fma(_276, _282, _264);
        float _294 = _290 * _228;
        float _296 = _292 * _228;
        float _298 = fma(_280, _288, _278);
        float _300 = _298 * _170;
        float2 _796 = float2(_286, _294);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_796, float2(0.0), isnan(_796)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_796, float2(0.0), isnan(_796)), level(_140)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _811 = float2(_300, _294);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_811, float2(0.0), isnan(_811)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_811, float2(0.0), isnan(_811)), level(_140)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _826 = float2(_286, _296);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_826, float2(0.0), isnan(_826)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_826, float2(0.0), isnan(_826)), level(_140)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float2 _841 = float2(_300, _296);
        float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_841, float2(0.0), isnan(_841)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_841, float2(0.0), isnan(_841)), level(_140)).xyz;
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
        float _358 = fma(_248, _344, _316);
        float _360 = fma(_248, _348, _314);
        float _362 = fma(_248, _352, _332);
        float _364 = -_318;
        float _366 = _310 + _364;
        float _368 = -_334;
        float _370 = _326 + _368;
        float _372 = fma(_248, _356, _330);
        float _374 = -_362;
        float _376 = _374 + _358;
        float _378 = fma(_248, _366, _318);
        float _380 = fma(_248, _370, _334);
        float _382 = -_372;
        float _384 = _382 + _360;
        float _386 = fma(_252, _376, _362);
        float _388 = _130 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _390 = -_380;
        float _392 = _390 + _378;
        float _394 = fma(_252, _384, _372);
        float _396 = _386 * 0.586600005626678466796875;
        float _398 = fma(_252, _392, _380);
        float _400 = fma(_394, 0.29890000820159912109375, _396);
        float _402 = fma(_398, 0.1143999993801116943359375, _400);
        float _404 = -_394;
        float _406 = _404 + _402;
        float _408 = -_386;
        float _410 = _408 + _402;
        float _412 = -_398;
        float _414 = _412 + _402;
        float _416 = fma(_388, _406, _394);
        float _418 = fma(_388, _410, _386);
        float _420 = fma(_388, _414, _398);
        float _422 = -_416;
        float _424 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[13].x, _422);
        float _426 = -_418;
        float _428 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[13].y, _426);
        float _430 = -_420;
        float _432 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[13].z, _430);
        float _434 = fma(_130, _424, _416);
        float _436 = fma(_130, _428, _418);
        float _438 = fma(_130, _432, _420);
        out.m_36.x = _434;
        out.m_36.y = _436;
        out.m_36.z = _438;
        out.m_36.w = _340;
        return out;
    }
    discard_fragment();
    return out;
}

