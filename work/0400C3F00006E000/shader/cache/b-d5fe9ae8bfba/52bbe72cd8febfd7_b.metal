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
int _44(thread const int& _918, thread const int& _919, constant _10& support_buffer)
{
    int _922 = 1 + _919;
    float _924 = support_buffer._m5[_922].x;
    float _926 = abs(_924);
    bool _928 = _926 == 1.0;
    if (_928)
    {
        return _918;
    }
    float _930 = float(_918);
    float _932 = _930 / _926;
    int _934 = int(_932);
    return _934;
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
    float2 _432 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float2 _443 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_443, float2(0.0), isnan(_443))).x;
    float _72 = in.m_35.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _96 = 1.0 / _94;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_70, _100);
    float _104 = _62 * _82;
    float _106 = precise::max(_102, _90);
    float _108 = _62 * _88;
    bool _112 = _106 != 0.0;
    bool _114 = isnan(_106);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    bool _122 = !_120;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_106, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 2;
        int _142 = _44(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 2;
        int _150 = _44(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_142);
        float _154 = float(_150);
        float _156 = fma(_64, _152, -0.5);
        float _158 = fma(_66, _154, -0.5);
        float _160 = floor(_156);
        float _162 = floor(_158);
        float _164 = -_160;
        float _166 = _156 + _164;
        float _168 = 1.0 / _154;
        float _170 = -_166;
        float _172 = _170 + 1.0;
        float _174 = -_166;
        float _176 = _174 + 2.0;
        float _178 = -_162;
        float _180 = _158 + _178;
        float _182 = _172 * _172;
        float _184 = _162 + (-0.5);
        float _186 = _162 + 1.5;
        float _188 = -_180;
        float _190 = _188 + 1.0;
        float _192 = _172 * _182;
        float _194 = -_180;
        float _196 = _194 + 2.0;
        float _198 = _176 * _176;
        float _200 = _190 * _190;
        float _202 = 1.0 / _152;
        float _204 = _196 * _196;
        float _206 = _190 * _200;
        float _208 = _192 * 4.0;
        float _210 = _206 * 4.0;
        float _212 = -_208;
        float _214 = fma(_176, _198, _212);
        float _216 = -_192;
        float _218 = _216 + 6.0;
        float _220 = -_210;
        float _222 = fma(_196, _204, _220);
        float _224 = -_206;
        float _226 = _224 + 6.0;
        float _228 = -_214;
        float _230 = _228 + _218;
        float _232 = _192 + _214;
        float _234 = _206 + _222;
        float _236 = -_222;
        float _238 = _236 + _226;
        float _240 = _230 * 0.16666667163372039794921875;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _234 * 0.16666667163372039794921875;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = _166 * _166;
        float _250 = 1.0 / _242;
        float _252 = _180 * _180;
        float _254 = _222 * 0.16666667163372039794921875;
        float _256 = _166 * _248;
        float _258 = _214 * 0.16666667163372039794921875;
        float _260 = _180 * _252;
        float _262 = _160 + (-0.5);
        float _264 = _160 + 1.5;
        float _266 = 1.0 / _244;
        float _268 = _256 * 0.16666667163372039794921875;
        float _270 = _260 * 0.16666667163372039794921875;
        float _272 = 1.0 / _240;
        float _274 = fma(_258, _250, _262);
        float _276 = 1.0 / _246;
        float _278 = fma(_254, _266, _184);
        float _280 = fma(_268, _272, _264);
        float _282 = _278 * _168;
        float _284 = fma(_270, _276, _186);
        float _286 = _274 * _202;
        float _288 = _280 * _202;
        float _290 = _284 * _168;
        float2 _737 = float2(_286, _282);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_737, float2(0.0), isnan(_737)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_737, float2(0.0), isnan(_737)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _752 = float2(_288, _282);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_752, float2(0.0), isnan(_752)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_752, float2(0.0), isnan(_752)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _767 = float2(_286, _290);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _782 = float2(_288, _290);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = 0.0 + _128;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        float _330 = fma(_108, _328, _104);
        float _332 = _328 * _108;
        float _334 = 1.0 / _330;
        float _336 = -_308;
        float _338 = _300 + _336;
        float _340 = -_304;
        float _342 = _296 + _340;
        float _344 = -_324;
        float _346 = _316 + _344;
        float _348 = fma(_242, _338, _308);
        float _350 = -_320;
        float _352 = _312 + _350;
        float _354 = -_306;
        float _356 = _298 + _354;
        float _358 = -_322;
        float _360 = _314 + _358;
        float _362 = fma(_242, _346, _324);
        float _364 = fma(_242, _342, _304);
        float _366 = fma(_242, _352, _320);
        float _368 = fma(_242, _356, _306);
        float _370 = fma(_242, _360, _322);
        float _372 = -_362;
        float _374 = _372 + _348;
        float _376 = -_366;
        float _378 = _376 + _364;
        float _380 = _334 * _332;
        float _382 = -_370;
        float _384 = _382 + _368;
        float _386 = fma(_244, _374, _362);
        float _388 = fma(_244, _378, _366);
        float _390 = fma(_244, _384, _370);
        float _392 = _386 * _332;
        float _394 = _388 * _380;
        float _396 = _390 * _380;
        float _398 = _392 * _334;
        out.m_38.x = _394;
        out.m_38.y = _396;
        out.m_38.z = _398;
        out.m_38.w = _330;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _104;
    return out;
}

