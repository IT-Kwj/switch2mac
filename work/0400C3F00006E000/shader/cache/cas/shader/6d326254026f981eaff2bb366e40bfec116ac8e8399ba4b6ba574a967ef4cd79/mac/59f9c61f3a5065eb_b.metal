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
int _44(thread const int& _973, thread const int& _974, constant _10& support_buffer)
{
    int _977 = 1 + _974;
    float _979 = support_buffer._m5[_977].x;
    float _981 = abs(_979);
    bool _983 = _981 == 1.0;
    if (_983)
    {
        return _973;
    }
    float _985 = float(_973);
    float _987 = _985 / _981;
    int _989 = int(_987);
    return _989;
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
    float2 _450 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).x;
    float2 _461 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_461, float2(0.0), isnan(_461))).x;
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
    float _104 = _62 * _88;
    float _106 = precise::max(_102, _90);
    float _108 = _62 * _82;
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
        float _160 = 1.0 / _152;
        float _162 = floor(_156);
        float _164 = floor(_158);
        float _166 = -_162;
        float _168 = _156 + _166;
        float _170 = -_168;
        float _172 = _170 + 1.0;
        float _174 = -_168;
        float _176 = _174 + 2.0;
        float _178 = -_164;
        float _180 = _158 + _178;
        float _182 = _172 * _172;
        float _184 = -_180;
        float _186 = _184 + 1.0;
        float _188 = _172 * _182;
        float _190 = -_180;
        float _192 = _190 + 2.0;
        float _194 = _176 * _176;
        float _196 = _186 * _186;
        float _198 = _188 * 4.0;
        float _200 = -_188;
        float _202 = _200 + 6.0;
        float _204 = _186 * _196;
        float _206 = _192 * _192;
        float _208 = -_198;
        float _210 = fma(_176, _194, _208);
        float _212 = _204 * 4.0;
        float _214 = 1.0 / _154;
        float _216 = -_210;
        float _218 = _216 + _202;
        float _220 = -_212;
        float _222 = fma(_192, _206, _220);
        float _224 = -_204;
        float _226 = _224 + 6.0;
        float _228 = _218 * 0.16666667163372039794921875;
        float _230 = _188 + _210;
        float _232 = _168 * _168;
        float _234 = -_222;
        float _236 = _234 + _226;
        float _238 = _180 * _180;
        float _240 = _230 * 0.16666667163372039794921875;
        float _242 = 1.0 / _228;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _204 + _222;
        float _248 = _168 * _232;
        float _250 = _180 * _238;
        float _252 = _164 + (-0.5);
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = _222 * 0.16666667163372039794921875;
        float _258 = 1.0 / _244;
        float _260 = _162 + (-0.5);
        float _262 = _162 + 1.5;
        float _264 = _164 + 1.5;
        float _266 = _248 * 0.16666667163372039794921875;
        float _268 = _250 * 0.16666667163372039794921875;
        float _270 = _210 * 0.16666667163372039794921875;
        float _272 = 1.0 / _254;
        float _274 = fma(_266, _242, _262);
        float _276 = _274 * _160;
        float _278 = 1.0 / _240;
        float _280 = fma(_268, _258, _264);
        float _282 = _280 * _214;
        float _284 = fma(_256, _272, _252);
        float _286 = _284 * _214;
        float _288 = fma(_270, _278, _260);
        float _290 = _288 * _160;
        float2 _755 = float2(_290, _286);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_755, float2(0.0), isnan(_755)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_755, float2(0.0), isnan(_755)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _770 = float2(_276, _286);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_770, float2(0.0), isnan(_770)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_770, float2(0.0), isnan(_770)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _785 = float2(_290, _282);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _800 = float2(_276, _282);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800)), level(_130)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = -_304;
        float _328 = _296 + _326;
        float _330 = -_306;
        float _332 = _298 + _330;
        float _334 = -_320;
        float _336 = _312 + _334;
        float _338 = -_308;
        float _340 = _300 + _338;
        float _342 = -_322;
        float _344 = _314 + _342;
        float _346 = -_324;
        float _348 = _316 + _346;
        float _350 = 0.0 + _128;
        float _352 = precise::clamp(_350, 0.0, 1.0);
        float _354 = fma(_240, _328, _304);
        float _356 = fma(_240, _332, _306);
        float _358 = fma(_240, _340, _308);
        float _360 = fma(_240, _336, _320);
        float _362 = fma(_240, _344, _322);
        float _364 = fma(_240, _348, _324);
        float _366 = fma(_104, _352, _108);
        float _368 = -_360;
        float _370 = _368 + _354;
        float _372 = -_362;
        float _374 = _372 + _356;
        float _376 = -_364;
        float _378 = _376 + _358;
        float _380 = 1.0 / _366;
        float _382 = fma(_254, _370, _360);
        float _384 = fma(_254, _374, _362);
        float _386 = fma(_254, _378, _364);
        float _388 = _352 * _382;
        float _390 = _352 * _384;
        float _392 = _352 * _386;
        float _394 = -_388;
        float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _398 = -_390;
        float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _402 = -_392;
        float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _406 = fma(_108, _396, _388);
        float _408 = fma(_108, _400, _390);
        float _410 = fma(_108, _404, _392);
        float _412 = _406 * _380;
        float _414 = _408 * _380;
        float _416 = _410 * _380;
        out.m_38.x = _412;
        out.m_38.y = _414;
        out.m_38.z = _416;
        out.m_38.w = _366;
        return out;
    }
    out.m_38.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_38.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_38.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_38.w = _108;
    return out;
}

