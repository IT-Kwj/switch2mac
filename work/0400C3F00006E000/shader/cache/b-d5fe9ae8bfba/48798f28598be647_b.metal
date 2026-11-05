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
int _42(thread const int& _895, thread const int& _896, constant _10& support_buffer)
{
    int _899 = 1 + _896;
    float _901 = support_buffer._m5[_899].x;
    float _903 = abs(_901);
    bool _905 = _903 == 1.0;
    if (_905)
    {
        return _895;
    }
    float _907 = float(_895);
    float _909 = _907 / _903;
    int _911 = int(_909);
    return _911;
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
    float2 _420 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).x;
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
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_98, _102);
    float _106 = _60 * _82;
    float _108 = _60 * _88;
    float _110 = precise::max(_104, _106);
    float _112 = _60 * _94;
    bool _114 = _110 != 0.0;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    bool _124 = !_122;
    if (!_124)
    {
        float _126 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _128 = fma(_110, _126, 1.0);
        float _130 = log2(_128);
        float _132 = _130 + (-1.0);
        float _134 = trunc(_132);
        int _136 = int(_134);
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        float _154 = float(_144);
        float _156 = float(_152);
        float _158 = fma(_62, _154, -0.5);
        float _160 = fma(_64, _156, -0.5);
        float _162 = 1.0 / _154;
        float _164 = floor(_158);
        float _166 = floor(_160);
        float _168 = -_164;
        float _170 = _158 + _168;
        float _172 = -_170;
        float _174 = _172 + 1.0;
        float _176 = -_170;
        float _178 = _176 + 2.0;
        float _180 = -_166;
        float _182 = _160 + _180;
        float _184 = _174 * _174;
        float _186 = _178 * _178;
        float _188 = -_182;
        float _190 = _188 + 1.0;
        float _192 = _174 * _184;
        float _194 = -_182;
        float _196 = _194 + 2.0;
        float _198 = _190 * _190;
        float _200 = _196 * _196;
        float _202 = _190 * _198;
        float _204 = _192 * 4.0;
        float _206 = _202 * 4.0;
        float _208 = -_204;
        float _210 = fma(_178, _186, _208);
        float _212 = -_202;
        float _214 = _212 + 6.0;
        float _216 = -_192;
        float _218 = _216 + 6.0;
        float _220 = -_206;
        float _222 = fma(_196, _200, _220);
        float _224 = 1.0 / _156;
        float _226 = -_210;
        float _228 = _226 + _218;
        float _230 = -_222;
        float _232 = _230 + _214;
        float _234 = _228 * 0.16666667163372039794921875;
        float _236 = _232 * 0.16666667163372039794921875;
        float _238 = _202 + _222;
        float _240 = _192 + _210;
        float _242 = _170 * _170;
        float _244 = _182 * _182;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _234;
        float _252 = _170 * _242;
        float _254 = _182 * _244;
        float _256 = _166 + (-0.5);
        float _258 = _222 * 0.16666667163372039794921875;
        float _260 = _164 + (-0.5);
        float _262 = _166 + 1.5;
        float _264 = _164 + 1.5;
        float _266 = 1.0 / _246;
        float _268 = _210 * 0.16666667163372039794921875;
        float _270 = _252 * 0.16666667163372039794921875;
        float _272 = _254 * 0.16666667163372039794921875;
        float _274 = 1.0 / _248;
        float _276 = 1.0 / _236;
        float _278 = fma(_258, _266, _256);
        float _280 = fma(_270, _250, _264);
        float _282 = _278 * _224;
        float _284 = _280 * _162;
        float _286 = fma(_268, _274, _260);
        float _288 = _286 * _162;
        float _290 = fma(_272, _276, _262);
        float _292 = _290 * _224;
        float2 _740 = float2(_288, _282);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_740, float2(0.0), isnan(_740)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_740, float2(0.0), isnan(_740)), level(_132)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _755 = float2(_284, _282);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_755, float2(0.0), isnan(_755)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_755, float2(0.0), isnan(_755)), level(_132)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _770 = float2(_288, _292);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_770, float2(0.0), isnan(_770)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_770, float2(0.0), isnan(_770)), level(_132)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _785 = float2(_284, _292);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_132)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float _328 = 0.0 + _130;
        float _330 = precise::clamp(_328, 0.0, 1.0);
        float _332 = fma(_112, _330, _108);
        float _334 = -_306;
        float _336 = _298 + _334;
        float _338 = -_310;
        float _340 = _302 + _338;
        float _342 = -_308;
        float _344 = _300 + _342;
        float _346 = fma(_248, _336, _306);
        float _348 = fma(_248, _340, _310);
        float _350 = fma(_248, _344, _308);
        float _352 = -_322;
        float _354 = _314 + _352;
        float _356 = -_324;
        float _358 = _316 + _356;
        float _360 = -_326;
        float _362 = _318 + _360;
        float _364 = fma(_248, _354, _322);
        float _366 = fma(_248, _358, _324);
        float _368 = fma(_248, _362, _326);
        float _370 = -_364;
        float _372 = _370 + _346;
        float _374 = -_366;
        float _376 = _374 + _350;
        float _378 = -_368;
        float _380 = _378 + _348;
        float _382 = fma(_246, _372, _364);
        float _384 = fma(_246, _376, _366);
        float _386 = fma(_246, _380, _368);
        out.m_34.x = _382;
        out.m_34.y = _384;
        out.m_34.z = _386;
        out.m_34.w = _332;
        return out;
    }
    discard_fragment();
    return out;
}

