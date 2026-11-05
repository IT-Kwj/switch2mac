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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texturecube<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
    float4 m_39 [[color(1)]];
    float4 m_41 [[color(2)]];
    float4 m_43 [[color(3)]];
    float4 m_45 [[color(4)]];
    float4 m_47 [[color(5)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _54 = gl_FragCoord.w;
    float _56 = in.m_34.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_34.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float2 _280 = float2(_70, _72);
    float3 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).xyz;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = abs(_78);
    float _86 = abs(_82);
    float _88 = precise::max(_84, _86);
    float _90 = abs(_78);
    float _92 = abs(_80);
    float _94 = precise::max(_90, _92);
    float _96 = abs(_80);
    float _98 = abs(_82);
    float _100 = precise::max(_96, _98);
    float _102 = abs(_80);
    float _104 = precise::max(_102, _88);
    float _106 = abs(_82);
    float _108 = precise::max(_106, _94);
    float _110 = abs(_78);
    float _112 = precise::max(_110, _100);
    float _114 = 1.0 / _108;
    float _116 = 1.0 / _104;
    float _118 = 1.0 / _112;
    float _120 = _80 * _114;
    float _122 = _82 * _114;
    float _124 = _78 * _114;
    float _126 = -_114;
    float _128 = _78 * _126;
    float _130 = -_114;
    float _132 = _82 * _130;
    float _134 = -_116;
    float _136 = _80 * _134;
    float _138 = _80 * _116;
    float _140 = -_116;
    float _142 = _82 * _140;
    float _144 = _78 * _116;
    float _146 = -_116;
    float _148 = _78 * _146;
    float _150 = _80 * _118;
    float _152 = _78 * _118;
    float _154 = -_118;
    float _156 = _78 * _154;
    float _158 = -_118;
    float _160 = _82 * _158;
    float _162 = _82 * _118;
    float3 _401 = float3(_124, _120, _122);
    float3 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_401, float3(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_401, float3(0.0), isnan(_401))).xyz;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float3 _418 = float3(_142, _144, _136);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_418, float3(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_418, float3(0.0), isnan(_418))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float3 _433 = float3(_160, _150, _152);
    float3 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float3(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float3(0.0), isnan(_433))).xyz;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float3 _448 = float3(_128, _120, _132);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_448, float3(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_448, float3(0.0), isnan(_448))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float3 _463 = float3(_142, _148, _138);
    float3 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float3(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float3(0.0), isnan(_463))).xyz;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float3 _478 = float3(_162, _150, _156);
    float3 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_478, float3(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_478, float3(0.0), isnan(_478))).xyz;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _166 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _214 = _168 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _216 = _170 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _218 = _174 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _220 = _176 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _222 = _178 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _224 = _182 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _226 = _184 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _228 = _186 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _230 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _232 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _234 = _194 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _236 = _198 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _238 = _200 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _240 = _202 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _242 = _206 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _244 = _208 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _246 = _210 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_37.x = _212;
    out.m_37.y = _214;
    out.m_37.z = _216;
    out.m_37.w = 1.0;
    out.m_39.x = _230;
    out.m_39.y = _232;
    out.m_39.z = _234;
    out.m_39.w = 1.0;
    out.m_41.x = _218;
    out.m_41.y = _220;
    out.m_41.z = _222;
    out.m_41.w = 1.0;
    out.m_43.x = _236;
    out.m_43.y = _238;
    out.m_43.z = _240;
    out.m_43.w = 1.0;
    out.m_45.x = _224;
    out.m_45.y = _226;
    out.m_45.z = _228;
    out.m_45.w = 1.0;
    out.m_47.x = _242;
    out.m_47.y = _244;
    out.m_47.z = _246;
    out.m_47.w = 1.0;
    return out;
}

