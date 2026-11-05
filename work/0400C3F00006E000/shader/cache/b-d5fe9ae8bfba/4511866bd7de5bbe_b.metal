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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _908, thread const int& _909, constant _10& support_buffer)
{
    int _912 = 1 + _909;
    float _914 = support_buffer._m5[_912].x;
    float _916 = abs(_914);
    bool _918 = _916 == 1.0;
    if (_918)
    {
        return _908;
    }
    float _920 = float(_908);
    float _922 = _920 / _916;
    int _924 = int(_922);
    return _924;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _422 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).x;
    float2 _433 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_433, float2(0.0), isnan(_433))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    bool _82 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _84 = !_82;
    float _86 = _84 ? _78 : 0.0;
    float _88 = precise::max(_68, _86);
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    bool _94 = _88 != 0.0;
    bool _96 = isnan(_88);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.0);
    bool _102 = _98 || _100;
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::min(_106, _92);
    bool _110 = !_102;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_88, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 2;
        int _130 = _42(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 2;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_62, _140, -0.5);
        float _146 = fma(_64, _142, -0.5);
        float _148 = 1.0 / _140;
        float _150 = floor(_144);
        float _152 = floor(_146);
        float _154 = -_150;
        float _156 = _144 + _154;
        float _158 = -_156;
        float _160 = _158 + 1.0;
        float _162 = -_156;
        float _164 = _162 + 2.0;
        float _166 = -_152;
        float _168 = _146 + _166;
        float _170 = _160 * _160;
        float _172 = _164 * _164;
        float _174 = -_168;
        float _176 = _174 + 1.0;
        float _178 = _160 * _170;
        float _180 = _176 * _176;
        float _182 = _178 * 4.0;
        float _184 = _176 * _180;
        float _186 = -_168;
        float _188 = _186 + 2.0;
        float _190 = -_182;
        float _192 = fma(_164, _172, _190);
        float _194 = -_178;
        float _196 = _194 + 6.0;
        float _198 = _184 * 4.0;
        float _200 = _188 * _188;
        float _202 = _178 + _192;
        float _204 = -_192;
        float _206 = _204 + _196;
        float _208 = _192 * 0.16666667163372039794921875;
        float _210 = -_198;
        float _212 = fma(_188, _200, _210);
        float _214 = -_184;
        float _216 = _214 + 6.0;
        float _218 = _206 * 0.16666667163372039794921875;
        float _220 = _202 * 0.16666667163372039794921875;
        float _222 = _184 + _212;
        float _224 = -_212;
        float _226 = _224 + _216;
        float _228 = 1.0 / _142;
        float _230 = _168 * _168;
        float _232 = _222 * 0.16666667163372039794921875;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _212 * 0.16666667163372039794921875;
        float _238 = _168 * _230;
        float _240 = _150 + (-0.5);
        float _242 = _152 + 1.5;
        float _244 = 1.0 / _232;
        float _246 = _156 * _156;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = _156 * _246;
        float _252 = _150 + 1.5;
        float _254 = _152 + (-0.5);
        float _256 = 1.0 / _220;
        float _258 = _250 * 0.16666667163372039794921875;
        float _260 = 1.0 / _218;
        float _262 = fma(_236, _244, _254);
        float _264 = _262 * _228;
        float _266 = 1.0 / _234;
        float _268 = fma(_208, _256, _240);
        float _270 = fma(_258, _260, _252);
        float _272 = _270 * _148;
        float _274 = fma(_248, _266, _242);
        float _276 = _268 * _148;
        float _278 = _274 * _228;
        float2 _722 = float2(_276, _264);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_722, float2(0.0), isnan(_722)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_722, float2(0.0), isnan(_722)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _737 = float2(_272, _264);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_737, float2(0.0), isnan(_737)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_737, float2(0.0), isnan(_737)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _752 = float2(_276, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_752, float2(0.0), isnan(_752)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_752, float2(0.0), isnan(_752)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _767 = float2(_272, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767)), level(_118)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767)), level(_118)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float _314 = 0.0 + _116;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        float _318 = -_292;
        float _320 = _284 + _318;
        float _322 = -_294;
        float _324 = _286 + _322;
        float _326 = fma(_220, _320, _292);
        float _328 = -_296;
        float _330 = _288 + _328;
        float _332 = fma(_220, _324, _294);
        float _334 = -_308;
        float _336 = _300 + _334;
        float _338 = -_310;
        float _340 = _302 + _338;
        float _342 = -_312;
        float _344 = _304 + _342;
        float _346 = fma(_220, _330, _296);
        float _348 = fma(_220, _336, _308);
        float _350 = fma(_220, _340, _310);
        float _352 = fma(_220, _344, _312);
        float _354 = -_348;
        float _356 = _354 + _326;
        float _358 = -_350;
        float _360 = _358 + _332;
        float _362 = -_352;
        float _364 = _362 + _346;
        float _366 = fma(_232, _356, _348);
        float _368 = fma(_232, _360, _350);
        float _370 = fma(_232, _364, _352);
        float _372 = -_366;
        float _374 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[13].x, _372);
        float _376 = -_368;
        float _378 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[13].y, _376);
        float _380 = -_370;
        float _382 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[13].z, _380);
        float _384 = fma(_108, _374, _366);
        float _386 = fma(_108, _378, _368);
        float _388 = fma(_108, _382, _370);
        out.m_36.x = _384;
        out.m_36.y = _386;
        out.m_36.z = _388;
        out.m_36.w = _316;
        return out;
    }
    discard_fragment();
    return out;
}

