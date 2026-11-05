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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture3d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture3d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
    float4 m_40 [[color(2)]];
    float4 m_42 [[color(3)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _49 = in.m_33.y;
    float _51 = in.m_33.x;
    float _53 = -_49;
    float _55 = _53 + 1.0;
    float3 _295 = float3(_51, _55, 0.0);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_295, float3(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_295, float3(0.0), isnan(_295))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float3 _315 = float3(_51, _55, 0.125);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_315, float3(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_315, float3(0.0), isnan(_315))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float3 _331 = float3(_51, _55, 0.0);
    float4 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_331, float3(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_331, float3(0.0), isnan(_331))).xyzw;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = _78.w;
    float3 _347 = float3(_51, _55, 0.125);
    float4 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_347, float3(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_347, float3(0.0), isnan(_347))).xyzw;
    float _90 = _88.x;
    float _92 = _88.y;
    float _94 = _88.z;
    float _96 = _88.w;
    float3 _363 = float3(_51, _55, 0.0);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_363, float3(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_363, float3(0.0), isnan(_363))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float3 _379 = float3(_51, _55, 0.125);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_379, float3(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_379, float3(0.0), isnan(_379))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float3 _395 = float3(_51, _55, 0.0);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_395, float3(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_395, float3(0.0), isnan(_395))).x;
    float3 _403 = float3(_51, _55, 0.125);
    float3 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_403, float3(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_403, float3(0.0), isnan(_403))).xyz;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = -_66;
    float _132 = _76 + _130;
    float _134 = -_64;
    float _136 = _74 + _134;
    float _138 = -_60;
    float _140 = _70 + _138;
    float _142 = -_62;
    float _144 = _72 + _142;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _148 = precise::max(_132, _146);
    float _150 = -_80;
    float _152 = _90 + _150;
    float _154 = -_82;
    float _156 = _92 + _154;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _160 = precise::max(_136, _158);
    float _162 = -_84;
    float _164 = _94 + _162;
    float _166 = precise::min(_148, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _168 = -_100;
    float _170 = _110 + _168;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _174 = precise::max(_152, _172);
    float _176 = -_102;
    float _178 = _112 + _176;
    float _180 = precise::min(_160, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _182 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[4].x, _66);
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _186 = precise::max(_156, _184);
    float _188 = -_86;
    float _190 = _96 + _188;
    float _192 = precise::min(_174, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _194 = -_104;
    float _196 = _114 + _194;
    float _198 = precise::min(_186, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _200 = -_106;
    float _202 = _116 + _200;
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _206 = precise::max(_140, _204);
    float _208 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[4].x, _64);
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _212 = precise::max(_164, _210);
    float _214 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[4].x, _80);
    float _216 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[4].x, _82);
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _220 = precise::max(_170, _218);
    float _222 = -_118;
    float _224 = _124 + _222;
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _228 = precise::max(_178, _226);
    float _230 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _232 = precise::max(_144, _230);
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[4].x, _118);
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _238 = precise::max(_190, _236);
    float _240 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _242 = precise::max(_196, _240);
    float _244 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _246 = precise::max(_202, _244);
    float _248 = precise::min(_206, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _250 = precise::min(_212, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _252 = precise::min(_220, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _254 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[4].x, _60);
    float _256 = precise::min(_228, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _258 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[4].x, _84);
    float _260 = precise::min(_232, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _262 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[4].x, _100);
    float _264 = precise::min(_238, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _266 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].x, _102);
    float _268 = precise::min(_242, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _270 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _62);
    float _272 = precise::min(_246, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _274 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].x, _86);
    float _276 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _104);
    float _278 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _106);
    out.m_36.x = _254;
    out.m_36.y = _270;
    out.m_36.z = _208;
    out.m_36.w = _182;
    out.m_38.x = _214;
    out.m_38.y = _216;
    out.m_38.z = _258;
    out.m_38.w = _274;
    out.m_40.x = _262;
    out.m_40.y = _266;
    out.m_40.z = _276;
    out.m_40.w = _278;
    out.m_42.x = _234;
    out.m_42.y = _126;
    out.m_42.z = _128;
    return out;
}

