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
int _42(thread const int& _879, thread const int& _880, constant _10& support_buffer)
{
    int _883 = 1 + _880;
    float _885 = support_buffer._m5[_883].x;
    float _887 = abs(_885);
    bool _889 = _887 == 1.0;
    if (_889)
    {
        return _879;
    }
    float _891 = float(_879);
    float _893 = _891 / _887;
    int _895 = int(_893);
    return _895;
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
    float2 _418 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).x;
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
    bool _122 = !_120;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_108, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_142);
        float _154 = float(_150);
        float _156 = fma(_62, _152, -0.5);
        float _158 = fma(_64, _154, -0.5);
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
        float _184 = _176 * _176;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _172 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _188 * _188;
        float _198 = _194 * _194;
        float _200 = _188 * _196;
        float _202 = _190 * 4.0;
        float _204 = _200 * 4.0;
        float _206 = -_202;
        float _208 = fma(_176, _184, _206);
        float _210 = -_200;
        float _212 = _210 + 6.0;
        float _214 = -_190;
        float _216 = _214 + 6.0;
        float _218 = -_204;
        float _220 = fma(_194, _198, _218);
        float _222 = 1.0 / _154;
        float _224 = -_208;
        float _226 = _224 + _216;
        float _228 = -_220;
        float _230 = _228 + _212;
        float _232 = _226 * 0.16666667163372039794921875;
        float _234 = _230 * 0.16666667163372039794921875;
        float _236 = _200 + _220;
        float _238 = _190 + _208;
        float _240 = _168 * _168;
        float _242 = _180 * _180;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = 1.0 / _232;
        float _250 = _168 * _240;
        float _252 = _180 * _242;
        float _254 = _164 + (-0.5);
        float _256 = _220 * 0.16666667163372039794921875;
        float _258 = _162 + (-0.5);
        float _260 = _164 + 1.5;
        float _262 = _162 + 1.5;
        float _264 = 1.0 / _244;
        float _266 = _208 * 0.16666667163372039794921875;
        float _268 = _250 * 0.16666667163372039794921875;
        float _270 = _252 * 0.16666667163372039794921875;
        float _272 = 1.0 / _246;
        float _274 = 1.0 / _234;
        float _276 = fma(_256, _264, _254);
        float _278 = fma(_268, _248, _262);
        float _280 = _276 * _222;
        float _282 = _278 * _160;
        float _284 = fma(_266, _272, _258);
        float _286 = _284 * _160;
        float _288 = fma(_270, _274, _260);
        float _290 = _288 * _222;
        float2 _723 = float2(_286, _280);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_723, float2(0.0), isnan(_723)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_723, float2(0.0), isnan(_723)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _738 = float2(_282, _280);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_738, float2(0.0), isnan(_738)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_738, float2(0.0), isnan(_738)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _753 = float2(_286, _290);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _768 = float2(_282, _290);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = 0.0 + _128;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        float _330 = fma(_88, _328, _86);
        float _332 = -_304;
        float _334 = _296 + _332;
        float _336 = -_308;
        float _338 = _300 + _336;
        float _340 = -_306;
        float _342 = _298 + _340;
        float _344 = fma(_246, _334, _304);
        float _346 = fma(_246, _338, _308);
        float _348 = fma(_246, _342, _306);
        float _350 = -_320;
        float _352 = _312 + _350;
        float _354 = -_322;
        float _356 = _314 + _354;
        float _358 = -_324;
        float _360 = _316 + _358;
        float _362 = fma(_246, _352, _320);
        float _364 = fma(_246, _356, _322);
        float _366 = fma(_246, _360, _324);
        float _368 = -_362;
        float _370 = _368 + _344;
        float _372 = -_364;
        float _374 = _372 + _348;
        float _376 = -_366;
        float _378 = _376 + _346;
        float _380 = fma(_244, _370, _362);
        float _382 = fma(_244, _374, _364);
        float _384 = fma(_244, _378, _366);
        out.m_36.x = _380;
        out.m_36.y = _382;
        out.m_36.z = _384;
        out.m_36.w = _330;
        return out;
    }
    discard_fragment();
    return out;
}

