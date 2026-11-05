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
int _42(thread const int& _999, thread const int& _1000, constant _10& support_buffer)
{
    int _1003 = 1 + _1000;
    float _1005 = support_buffer._m5[_1003].x;
    float _1007 = abs(_1005);
    bool _1009 = _1007 == 1.0;
    if (_1009)
    {
        return _999;
    }
    float _1011 = float(_999);
    float _1013 = _1011 / _1007;
    int _1015 = int(_1013);
    return _1015;
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
    float2 _460 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_460, float2(0.0), isnan(_460))).x;
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
        float _162 = float(_160);
        float _164 = float(_152);
        float _166 = fma(_64, _162, -0.5);
        float _168 = fma(_62, _164, -0.5);
        float _170 = floor(_166);
        float _172 = floor(_168);
        float _174 = -_170;
        float _176 = _166 + _174;
        float _178 = -_176;
        float _180 = _178 + 1.0;
        float _182 = _176 * _176;
        float _184 = -_172;
        float _186 = _168 + _184;
        float _188 = _180 * _180;
        float _190 = _176 * _182;
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = _180 * _188;
        float _198 = -_186;
        float _200 = _198 + 2.0;
        float _202 = -_176;
        float _204 = _202 + 2.0;
        float _206 = _194 * _194;
        float _208 = _196 * 4.0;
        float _210 = _200 * _200;
        float _212 = _204 * _204;
        float _214 = _194 * _206;
        float _216 = _172 + (-0.5);
        float _218 = _172 + 1.5;
        float _220 = -_208;
        float _222 = fma(_204, _212, _220);
        float _224 = _214 * 4.0;
        float _226 = -_214;
        float _228 = _226 + 6.0;
        float _230 = -_196;
        float _232 = _230 + 6.0;
        float _234 = 1.0 / _164;
        float _236 = -_224;
        float _238 = fma(_200, _210, _236);
        float _240 = _196 + _222;
        float _242 = -_222;
        float _244 = _242 + _232;
        float _246 = _222 * 0.16666667163372039794921875;
        float _248 = -_238;
        float _250 = _248 + _228;
        float _252 = _214 + _238;
        float _254 = _240 * 0.16666667163372039794921875;
        float _256 = _244 * 0.16666667163372039794921875;
        float _258 = _250 * 0.16666667163372039794921875;
        float _260 = _252 * 0.16666667163372039794921875;
        float _262 = 1.0 / _254;
        float _264 = _170 + 1.5;
        float _266 = _238 * 0.16666667163372039794921875;
        float _268 = _190 * 0.16666667163372039794921875;
        float _270 = 1.0 / _260;
        float _272 = 1.0 / _258;
        float _274 = 1.0 / _256;
        float _276 = fma(_266, _270, _216);
        float _278 = _276 * _234;
        float _280 = 1.0 / _162;
        float _282 = _170 + (-0.5);
        float _284 = fma(_246, _262, _282);
        float _286 = fma(_268, _274, _264);
        float _288 = _186 * _186;
        float _290 = _186 * _288;
        float _292 = _290 * 0.16666667163372039794921875;
        float _294 = fma(_292, _272, _218);
        float _296 = _284 * _280;
        float _298 = _286 * _280;
        float _300 = _294 * _234;
        float2 _784 = float2(_278, _296);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_784, float2(0.0), isnan(_784)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_784, float2(0.0), isnan(_784)), level(_140)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _799 = float2(_300, _296);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_799, float2(0.0), isnan(_799)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_799, float2(0.0), isnan(_799)), level(_140)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _814 = float2(_278, _298);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_814, float2(0.0), isnan(_814)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_814, float2(0.0), isnan(_814)), level(_140)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float2 _829 = float2(_300, _298);
        float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_829, float2(0.0), isnan(_829)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_829, float2(0.0), isnan(_829)), level(_140)).xyz;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = 0.0 + _138;
        float _338 = precise::clamp(_336, 0.0, 1.0);
        float _340 = fma(_88, _338, _86);
        float _342 = _338 * _88;
        float _344 = -_318;
        float _346 = _310 + _344;
        float _348 = -_314;
        float _350 = _306 + _348;
        float _352 = -_316;
        float _354 = _308 + _352;
        float _356 = -_334;
        float _358 = _326 + _356;
        float _360 = -_330;
        float _362 = _322 + _360;
        float _364 = fma(_260, _346, _318);
        float _366 = -_332;
        float _368 = _324 + _366;
        float _370 = fma(_260, _358, _334);
        float _372 = fma(_260, _350, _314);
        float _374 = fma(_260, _362, _330);
        float _376 = 1.0 / _340;
        float _378 = fma(_260, _354, _316);
        float _380 = fma(_260, _368, _332);
        float _382 = -_370;
        float _384 = _382 + _364;
        float _386 = -_374;
        float _388 = _386 + _372;
        float _390 = -_380;
        float _392 = _390 + _378;
        float _394 = fma(_254, _384, _370);
        float _396 = fma(_254, _388, _374);
        float _398 = fma(_254, _392, _380);
        float _400 = -_394;
        float _402 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[13].z, _400);
        float _404 = -_396;
        float _406 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
        float _408 = -_398;
        float _410 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[13].y, _408);
        float _412 = fma(_118, _402, _394);
        float _414 = fma(_118, _406, _396);
        float _416 = _376 * _342;
        float _418 = fma(_118, _410, _398);
        float _420 = _412 * _342;
        float _422 = _414 * _416;
        float _424 = _418 * _416;
        float _426 = _420 * _376;
        out.m_36.x = _422;
        out.m_36.y = _424;
        out.m_36.z = _426;
        out.m_36.w = _340;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

