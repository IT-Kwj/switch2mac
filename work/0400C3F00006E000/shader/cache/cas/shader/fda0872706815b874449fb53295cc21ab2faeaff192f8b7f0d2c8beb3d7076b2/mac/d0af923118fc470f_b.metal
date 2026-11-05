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
};

static inline __attribute__((always_inline))
int _40(thread const int& _892, thread const int& _893, constant _10& support_buffer)
{
    int _896 = 1 + _893;
    float _898 = support_buffer._m5[_896].x;
    float _900 = abs(_898);
    bool _902 = _900 == 1.0;
    if (_902)
    {
        return _892;
    }
    float _904 = float(_892);
    float _906 = _904 / _900;
    int _908 = int(_906);
    return _908;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _412 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float _66 = -_64;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = 1.0 / _68;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_74)
    {
        discard_fragment();
    }
    if (_74)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    bool _88 = _78 != 0.0;
    bool _90 = isnan(_78);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    bool _98 = !_96;
    if (!_98)
    {
        float _100 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _102 = fma(_78, _100, 1.0);
        float _104 = log2(_102);
        float _106 = _104 + (-1.0);
        float _108 = trunc(_106);
        int _110 = int(_108);
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).x;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_110), spvDescriptorSet0.fp_t_tcb_A.get_height(_110)).y;
        int _122 = _120;
        int _124 = 1;
        int _126 = _40(_122, _124, (*spvDescriptorSet0.support_buffer));
        float _128 = float(_118);
        float _130 = float(_126);
        float _132 = fma(_60, _128, -0.5);
        float _134 = fma(_62, _130, -0.5);
        float _136 = 1.0 / _128;
        float _138 = floor(_132);
        float _140 = floor(_134);
        float _142 = -_138;
        float _144 = _132 + _142;
        float _146 = -_144;
        float _148 = _146 + 1.0;
        float _150 = -_144;
        float _152 = _150 + 2.0;
        float _154 = -_140;
        float _156 = _134 + _154;
        float _158 = _148 * _148;
        float _160 = _140 + 1.5;
        float _162 = -_156;
        float _164 = _162 + 1.0;
        float _166 = _148 * _158;
        float _168 = -_156;
        float _170 = _168 + 2.0;
        float _172 = _152 * _152;
        float _174 = _164 * _164;
        float _176 = -_166;
        float _178 = _176 + 6.0;
        float _180 = _170 * _170;
        float _182 = _164 * _174;
        float _184 = _166 * 4.0;
        float _186 = _182 * 4.0;
        float _188 = -_184;
        float _190 = fma(_152, _172, _188);
        float _192 = _156 * _156;
        float _194 = 1.0 / _130;
        float _196 = -_186;
        float _198 = fma(_170, _180, _196);
        float _200 = -_190;
        float _202 = _200 + _178;
        float _204 = -_182;
        float _206 = _204 + 6.0;
        float _208 = _156 * _192;
        float _210 = _182 + _198;
        float _212 = _202 * 0.16666667163372039794921875;
        float _214 = -_198;
        float _216 = _214 + _206;
        float _218 = _198 * 0.16666667163372039794921875;
        float _220 = _210 * 0.16666667163372039794921875;
        float _222 = 1.0 / _212;
        float _224 = _216 * 0.16666667163372039794921875;
        float _226 = _166 + _190;
        float _228 = _144 * _144;
        float _230 = _138 + (-0.5);
        float _232 = _138 + 1.5;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _144 * _228;
        float _238 = 1.0 / _220;
        float _240 = _190 * 0.16666667163372039794921875;
        float _242 = _208 * 0.16666667163372039794921875;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = 1.0 / _234;
        float _248 = fma(_244, _222, _232);
        float _250 = 1.0 / _224;
        float _252 = fma(_240, _246, _230);
        float _254 = _140 + (-0.5);
        float _256 = _248 * _136;
        float _258 = fma(_218, _238, _254);
        float _260 = fma(_242, _250, _160);
        float _262 = _258 * _194;
        float _264 = _252 * _136;
        float _266 = _260 * _194;
        float2 _704 = float2(_264, _262);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_704, float2(0.0), isnan(_704)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_704, float2(0.0), isnan(_704)), level(_106)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _719 = float2(_256, _262);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_719, float2(0.0), isnan(_719)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_719, float2(0.0), isnan(_719)), level(_106)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _734 = float2(_264, _266);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_734, float2(0.0), isnan(_734)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_734, float2(0.0), isnan(_734)), level(_106)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float2 _749 = float2(_256, _266);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_749, float2(0.0), isnan(_749)), level(_106)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_749, float2(0.0), isnan(_749)), level(_106)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float _302 = precise::min(_82, _86);
        float _304 = 0.0 + _104;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = -_282;
        float _310 = _274 + _308;
        float _312 = -_284;
        float _314 = _276 + _312;
        float _316 = -_280;
        float _318 = _272 + _316;
        float _320 = fma(_234, _310, _282);
        float _322 = -_296;
        float _324 = _288 + _322;
        float _326 = -_298;
        float _328 = _290 + _326;
        float _330 = -_300;
        float _332 = _292 + _330;
        float _334 = fma(_234, _318, _280);
        float _336 = fma(_234, _314, _284);
        float _338 = fma(_234, _324, _296);
        float _340 = fma(_234, _328, _298);
        float _342 = fma(_234, _332, _300);
        float _344 = -_338;
        float _346 = _344 + _334;
        float _348 = -_340;
        float _350 = _348 + _320;
        float _352 = -_342;
        float _354 = _352 + _336;
        float _356 = fma(_220, _346, _338);
        float _358 = fma(_220, _350, _340);
        float _360 = fma(_220, _354, _342);
        float _362 = -_356;
        float _364 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[13].x, _362);
        float _366 = -_358;
        float _368 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[13].y, _366);
        float _370 = -_360;
        float _372 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[13].z, _370);
        float _374 = fma(_302, _364, _356);
        float _376 = fma(_302, _368, _358);
        float _378 = fma(_302, _372, _360);
        out.m_34.x = _374;
        out.m_34.y = _376;
        out.m_34.z = _378;
        out.m_34.w = _306;
        return out;
    }
    discard_fragment();
    return out;
}

