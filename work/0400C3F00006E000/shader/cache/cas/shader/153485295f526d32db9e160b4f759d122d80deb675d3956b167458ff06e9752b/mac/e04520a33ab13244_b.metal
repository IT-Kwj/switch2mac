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
int _40(thread const int& _859, thread const int& _860, constant _10& support_buffer)
{
    int _863 = 1 + _860;
    float _865 = support_buffer._m5[_863].x;
    float _867 = abs(_865);
    bool _869 = _867 == 1.0;
    if (_869)
    {
        return _859;
    }
    float _871 = float(_859);
    float _873 = _871 / _867;
    int _875 = int(_873);
    return _875;
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
    float2 _404 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    bool _80 = _68 != 0.0;
    bool _82 = isnan(_68);
    bool _84 = _80 || _82;
    bool _86 = isnan(0.0);
    bool _88 = _84 || _86;
    bool _90 = !_88;
    if (!_90)
    {
        float _92 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _94 = fma(_68, _92, 1.0);
        float _96 = log2(_94);
        float _98 = _96 + (-1.0);
        float _100 = trunc(_98);
        int _102 = int(_100);
        int _104 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).x;
        int _106 = _104;
        int _108 = 1;
        int _110 = _40(_106, _108, (*spvDescriptorSet0.support_buffer));
        int _112 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_102), spvDescriptorSet0.fp_t_tcb_A.get_height(_102)).y;
        int _114 = _112;
        int _116 = 1;
        int _118 = _40(_114, _116, (*spvDescriptorSet0.support_buffer));
        float _120 = float(_110);
        float _122 = float(_118);
        float _124 = fma(_60, _120, -0.5);
        float _126 = fma(_62, _122, -0.5);
        float _128 = 1.0 / _120;
        float _130 = floor(_124);
        float _132 = floor(_126);
        float _134 = -_130;
        float _136 = _124 + _134;
        float _138 = -_136;
        float _140 = _138 + 1.0;
        float _142 = -_136;
        float _144 = _142 + 2.0;
        float _146 = -_132;
        float _148 = _126 + _146;
        float _150 = _140 * _140;
        float _152 = _132 + 1.5;
        float _154 = -_148;
        float _156 = _154 + 1.0;
        float _158 = _140 * _150;
        float _160 = -_148;
        float _162 = _160 + 2.0;
        float _164 = _144 * _144;
        float _166 = _156 * _156;
        float _168 = -_158;
        float _170 = _168 + 6.0;
        float _172 = _162 * _162;
        float _174 = _156 * _166;
        float _176 = _158 * 4.0;
        float _178 = _174 * 4.0;
        float _180 = -_176;
        float _182 = fma(_144, _164, _180);
        float _184 = _148 * _148;
        float _186 = 1.0 / _122;
        float _188 = -_178;
        float _190 = fma(_162, _172, _188);
        float _192 = -_182;
        float _194 = _192 + _170;
        float _196 = -_174;
        float _198 = _196 + 6.0;
        float _200 = _148 * _184;
        float _202 = _174 + _190;
        float _204 = _194 * 0.16666667163372039794921875;
        float _206 = -_190;
        float _208 = _206 + _198;
        float _210 = _190 * 0.16666667163372039794921875;
        float _212 = _202 * 0.16666667163372039794921875;
        float _214 = 1.0 / _204;
        float _216 = _208 * 0.16666667163372039794921875;
        float _218 = _158 + _182;
        float _220 = _136 * _136;
        float _222 = _130 + (-0.5);
        float _224 = _130 + 1.5;
        float _226 = _218 * 0.16666667163372039794921875;
        float _228 = _136 * _220;
        float _230 = 1.0 / _212;
        float _232 = _182 * 0.16666667163372039794921875;
        float _234 = _200 * 0.16666667163372039794921875;
        float _236 = _228 * 0.16666667163372039794921875;
        float _238 = 1.0 / _226;
        float _240 = fma(_236, _214, _224);
        float _242 = 1.0 / _216;
        float _244 = fma(_232, _238, _222);
        float _246 = _132 + (-0.5);
        float _248 = _240 * _128;
        float _250 = fma(_210, _230, _246);
        float _252 = fma(_234, _242, _152);
        float _254 = _250 * _186;
        float _256 = _244 * _128;
        float _258 = _252 * _186;
        float2 _670 = float2(_256, _254);
        float3 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_670, float2(0.0), isnan(_670)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_670, float2(0.0), isnan(_670)), level(_98)).xyz;
        float _264 = _262.x;
        float _266 = _262.y;
        float _268 = _262.z;
        float2 _685 = float2(_248, _254);
        float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_685, float2(0.0), isnan(_685)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_685, float2(0.0), isnan(_685)), level(_98)).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        float2 _700 = float2(_256, _258);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_700, float2(0.0), isnan(_700)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_700, float2(0.0), isnan(_700)), level(_98)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _715 = float2(_248, _258);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_715, float2(0.0), isnan(_715)), level(_98)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_715, float2(0.0), isnan(_715)), level(_98)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float _294 = precise::min(_72, _76);
        float _296 = 0.0 + _96;
        float _298 = precise::clamp(_296, 0.0, 1.0);
        float _300 = -_274;
        float _302 = _266 + _300;
        float _304 = -_276;
        float _306 = _268 + _304;
        float _308 = -_272;
        float _310 = _264 + _308;
        float _312 = fma(_226, _302, _274);
        float _314 = -_288;
        float _316 = _280 + _314;
        float _318 = -_290;
        float _320 = _282 + _318;
        float _322 = -_292;
        float _324 = _284 + _322;
        float _326 = fma(_226, _310, _272);
        float _328 = fma(_226, _306, _276);
        float _330 = fma(_226, _316, _288);
        float _332 = fma(_226, _320, _290);
        float _334 = fma(_226, _324, _292);
        float _336 = -_330;
        float _338 = _336 + _326;
        float _340 = -_332;
        float _342 = _340 + _312;
        float _344 = -_334;
        float _346 = _344 + _328;
        float _348 = fma(_212, _338, _330);
        float _350 = fma(_212, _342, _332);
        float _352 = fma(_212, _346, _334);
        float _354 = -_348;
        float _356 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[13].x, _354);
        float _358 = -_350;
        float _360 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[13].y, _358);
        float _362 = -_352;
        float _364 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[13].z, _362);
        float _366 = fma(_294, _356, _348);
        float _368 = fma(_294, _360, _350);
        float _370 = fma(_294, _364, _352);
        out.m_34.x = _366;
        out.m_34.y = _368;
        out.m_34.z = _370;
        out.m_34.w = _298;
        return out;
    }
    discard_fragment();
    return out;
}

