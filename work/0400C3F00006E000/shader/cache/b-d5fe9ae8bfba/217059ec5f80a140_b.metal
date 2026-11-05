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
int _44(thread const int& _880, thread const int& _881, constant _10& support_buffer)
{
    int _884 = 1 + _881;
    float _886 = support_buffer._m5[_884].x;
    float _888 = abs(_886);
    bool _890 = _888 == 1.0;
    if (_890)
    {
        return _880;
    }
    float _892 = float(_880);
    float _894 = _892 / _888;
    int _896 = int(_894);
    return _896;
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
    float2 _424 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).x;
    float _70 = in.m_33.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_35.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _62 * _74;
    float _96 = _62 * _80;
    float _98 = _62 * _86;
    float _100 = _62 * _92;
    float _102 = fma(_68, _94, _96);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    bool _108 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _110 = fma(_68, _98, _100);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    bool _114 = !_108;
    float _116 = _114 ? _104 : 0.0;
    float _118 = precise::max(_116, _112);
    bool _120 = _118 != 0.0;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.0);
    bool _128 = _124 || _126;
    bool _130 = !_128;
    if (!_130)
    {
        float _132 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _134 = fma(_118, _132, 1.0);
        float _136 = log2(_134);
        float _138 = _136 + (-1.0);
        float _140 = trunc(_138);
        int _142 = int(_140);
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).x;
        int _146 = _144;
        int _148 = 1;
        int _150 = _44(_146, _148, (*spvDescriptorSet0.support_buffer));
        int _152 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_142), spvDescriptorSet0.fp_t_tcb_A.get_height(_142)).y;
        int _154 = _152;
        int _156 = 1;
        int _158 = _44(_154, _156, (*spvDescriptorSet0.support_buffer));
        float _160 = float(_150);
        float _162 = float(_158);
        float _164 = fma(_64, _160, -0.5);
        float _166 = fma(_66, _162, -0.5);
        float _168 = 1.0 / _160;
        float _170 = floor(_164);
        float _172 = floor(_166);
        float _174 = -_170;
        float _176 = _164 + _174;
        float _178 = 1.0 / _162;
        float _180 = -_176;
        float _182 = _180 + 1.0;
        float _184 = -_176;
        float _186 = _184 + 2.0;
        float _188 = -_172;
        float _190 = _166 + _188;
        float _192 = _182 * _182;
        float _194 = -_190;
        float _196 = _194 + 1.0;
        float _198 = _182 * _192;
        float _200 = -_190;
        float _202 = _200 + 2.0;
        float _204 = _186 * _186;
        float _206 = _196 * _196;
        float _208 = _198 * 4.0;
        float _210 = _196 * _206;
        float _212 = _202 * _202;
        float _214 = -_208;
        float _216 = fma(_186, _204, _214);
        float _218 = -_198;
        float _220 = _218 + 6.0;
        float _222 = _210 * 4.0;
        float _224 = -_210;
        float _226 = _224 + 6.0;
        float _228 = _176 * _176;
        float _230 = -_216;
        float _232 = _230 + _220;
        float _234 = -_222;
        float _236 = fma(_202, _212, _234);
        float _238 = _190 * _190;
        float _240 = _176 * _228;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = -_236;
        float _246 = _244 + _226;
        float _248 = _198 + _216;
        float _250 = _190 * _238;
        float _252 = _172 + (-0.5);
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = _210 + _236;
        float _258 = _248 * 0.16666667163372039794921875;
        float _260 = 1.0 / _242;
        float _262 = _236 * 0.16666667163372039794921875;
        float _264 = _256 * 0.16666667163372039794921875;
        float _266 = _170 + (-0.5);
        float _268 = _216 * 0.16666667163372039794921875;
        float _270 = _170 + 1.5;
        float _272 = _172 + 1.5;
        float _274 = _240 * 0.16666667163372039794921875;
        float _276 = 1.0 / _264;
        float _278 = _250 * 0.16666667163372039794921875;
        float _280 = 1.0 / _258;
        float _282 = fma(_274, _260, _270);
        float _284 = 1.0 / _254;
        float _286 = fma(_262, _276, _252);
        float _288 = _282 * _168;
        float _290 = _286 * _178;
        float _292 = fma(_268, _280, _266);
        float _294 = _292 * _168;
        float _296 = fma(_278, _284, _272);
        float _298 = _296 * _178;
        float2 _728 = float2(_294, _290);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_728, float2(0.0), isnan(_728)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_728, float2(0.0), isnan(_728)), level(_138)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _743 = float2(_288, _290);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_743, float2(0.0), isnan(_743)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_743, float2(0.0), isnan(_743)), level(_138)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _758 = float2(_294, _298);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_758, float2(0.0), isnan(_758)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_758, float2(0.0), isnan(_758)), level(_138)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float2 _773 = float2(_288, _298);
        float3 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_773, float2(0.0), isnan(_773)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_773, float2(0.0), isnan(_773)), level(_138)).xyz;
        float _328 = _326.x;
        float _330 = _326.y;
        float _332 = _326.z;
        float _334 = 0.0 + _136;
        float _336 = precise::clamp(_334, 0.0, 1.0);
        float _338 = -_312;
        float _340 = _304 + _338;
        float _342 = -_314;
        float _344 = _306 + _342;
        float _346 = -_316;
        float _348 = _308 + _346;
        float _350 = fma(_258, _340, _312);
        float _352 = fma(_258, _344, _314);
        float _354 = fma(_258, _348, _316);
        float _356 = -_328;
        float _358 = _320 + _356;
        float _360 = -_330;
        float _362 = _322 + _360;
        float _364 = -_332;
        float _366 = _324 + _364;
        float _368 = fma(_258, _358, _328);
        float _370 = fma(_258, _362, _330);
        float _372 = fma(_258, _366, _332);
        float _374 = -_368;
        float _376 = _374 + _350;
        float _378 = -_370;
        float _380 = _378 + _352;
        float _382 = -_372;
        float _384 = _382 + _354;
        float _386 = fma(_264, _376, _368);
        float _388 = fma(_264, _380, _370);
        float _390 = fma(_264, _384, _372);
        out.m_38.x = _386;
        out.m_38.y = _388;
        out.m_38.z = _390;
        out.m_38.w = _336;
        return out;
    }
    discard_fragment();
    return out;
}

