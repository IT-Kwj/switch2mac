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
int _42(thread const int& _1054, thread const int& _1055, constant _10& support_buffer)
{
    int _1058 = 1 + _1055;
    float _1060 = support_buffer._m5[_1058].x;
    float _1062 = abs(_1060);
    bool _1064 = _1062 == 1.0;
    if (_1064)
    {
        return _1054;
    }
    float _1066 = float(_1054);
    float _1068 = _1066 / _1062;
    int _1070 = int(_1068);
    return _1070;
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
    float2 _478 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
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
        float _258 = _178 * _178;
        float _260 = _190 * _190;
        float _262 = _232 * 0.16666667163372039794921875;
        float _264 = _178 * _258;
        float _266 = _190 * _260;
        float _268 = _174 + (-0.5);
        float _270 = 1.0 / _252;
        float _272 = _172 + (-0.5);
        float _274 = _174 + 1.5;
        float _276 = _266 * 0.16666667163372039794921875;
        float _278 = _172 + 1.5;
        float _280 = _264 * 0.16666667163372039794921875;
        float _282 = 1.0 / _254;
        float _284 = fma(_240, _256, _272);
        float _286 = 1.0 / _250;
        float _288 = fma(_262, _270, _268);
        float _290 = _288 * _228;
        float _292 = fma(_276, _282, _274);
        float _294 = _292 * _228;
        float _296 = fma(_280, _286, _278);
        float _298 = _284 * _170;
        float _300 = _296 * _170;
        float2 _802 = float2(_298, _290);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802)), level(_140)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _817 = float2(_300, _290);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_817, float2(0.0), isnan(_817)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_817, float2(0.0), isnan(_817)), level(_140)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _832 = float2(_298, _294);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_832, float2(0.0), isnan(_832)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_832, float2(0.0), isnan(_832)), level(_140)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float2 _847 = float2(_300, _294);
        float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_847, float2(0.0), isnan(_847)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_847, float2(0.0), isnan(_847)), level(_140)).xyz;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = -_316;
        float _338 = _308 + _336;
        float _340 = -_314;
        float _342 = _306 + _340;
        float _344 = fma(_248, _338, _316);
        float _346 = -_330;
        float _348 = _322 + _346;
        float _350 = fma(_248, _342, _314);
        float _352 = -_332;
        float _354 = _324 + _352;
        float _356 = -_318;
        float _358 = _310 + _356;
        float _360 = -_334;
        float _362 = _326 + _360;
        float _364 = fma(_248, _348, _330);
        float _366 = fma(_248, _354, _332);
        float _368 = fma(_248, _358, _318);
        float _370 = fma(_248, _362, _334);
        float _372 = -_364;
        float _374 = _372 + _350;
        float _376 = -_366;
        float _378 = _376 + _344;
        float _380 = 0.0 + _138;
        float _382 = precise::clamp(_380, 0.0, 1.0);
        float _384 = -_370;
        float _386 = _384 + _368;
        float _388 = fma(_252, _374, _364);
        float _390 = fma(_252, _378, _366);
        float _392 = fma(_88, _382, _86);
        float _394 = fma(_252, _386, _370);
        float _396 = -_388;
        float _398 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].x, _396);
        float _400 = -_390;
        float _402 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].y, _400);
        float _404 = 1.0 / _392;
        float _406 = -_394;
        float _408 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[13].z, _406);
        float _410 = fma(_130, _398, _388);
        float _412 = fma(_130, _402, _390);
        float _414 = fma(_130, _408, _394);
        float _416 = _382 * _410;
        float _418 = _382 * _412;
        float _420 = _382 * _414;
        float _422 = -_416;
        float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _426 = -_418;
        float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _430 = -_420;
        float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _434 = fma(_86, _424, _416);
        float _436 = fma(_86, _428, _418);
        float _438 = fma(_86, _432, _420);
        float _440 = _434 * _404;
        float _442 = _436 * _404;
        float _444 = _438 * _404;
        out.m_36.x = _440;
        out.m_36.y = _442;
        out.m_36.z = _444;
        out.m_36.w = _392;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}

