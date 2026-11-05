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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texturecube<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_31 [[color(0)]];
    float4 m_33 [[color(1)]];
    float4 m_35 [[color(2)]];
    float4 m_37 [[color(3)]];
    float4 m_39 [[color(4)]];
    float4 m_41 [[color(5)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_28.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_28.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _251 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_251, float2(0.0), isnan(_251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_251, float2(0.0), isnan(_251))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = abs(_72);
    float _80 = abs(_74);
    float _82 = precise::max(_78, _80);
    float _84 = abs(_74);
    float _86 = abs(_76);
    float _88 = precise::max(_84, _86);
    float _90 = abs(_72);
    float _92 = abs(_76);
    float _94 = precise::max(_90, _92);
    float _96 = abs(_76);
    float _98 = precise::max(_96, _82);
    float _100 = abs(_72);
    float _102 = precise::max(_100, _88);
    float _104 = abs(_74);
    float _106 = precise::max(_104, _94);
    float _108 = 1.0 / _98;
    float _110 = 1.0 / _106;
    float _112 = 1.0 / _102;
    float _114 = _74 * _108;
    float _116 = _72 * _108;
    float _118 = -_108;
    float _120 = _72 * _118;
    float _122 = _76 * _108;
    float _124 = -_108;
    float _126 = _76 * _124;
    float _128 = -_110;
    float _130 = _74 * _128;
    float _132 = _74 * _110;
    float _134 = -_110;
    float _136 = _76 * _134;
    float _138 = _72 * _110;
    float _140 = -_110;
    float _142 = _72 * _140;
    float _144 = _74 * _112;
    float _146 = _72 * _112;
    float _148 = -_112;
    float _150 = _72 * _148;
    float _152 = -_112;
    float _154 = _76 * _152;
    float _156 = _76 * _112;
    float3 _372 = float3(_116, _114, _122);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float3(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float3(0.0), isnan(_372))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float3 _391 = float3(_136, _138, _130);
    float4 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_391, float3(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_391, float3(0.0), isnan(_391))).xyzw;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _169.w;
    float3 _408 = float3(_154, _144, _146);
    float4 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_408, float3(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_408, float3(0.0), isnan(_408))).xyzw;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = _179.w;
    float3 _425 = float3(_120, _114, _126);
    float4 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_425, float3(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_425, float3(0.0), isnan(_425))).xyzw;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float _197 = _189.w;
    float3 _442 = float3(_136, _142, _132);
    float4 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_442, float3(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_442, float3(0.0), isnan(_442))).xyzw;
    float _201 = _199.x;
    float _203 = _199.y;
    float _205 = _199.z;
    float _207 = _199.w;
    float3 _459 = float3(_156, _144, _150);
    float4 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_459, float3(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_459, float3(0.0), isnan(_459))).xyzw;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    float _217 = _209.w;
    out.m_31.x = _161;
    out.m_31.y = _163;
    out.m_31.z = _165;
    out.m_31.w = _167;
    out.m_33.x = _191;
    out.m_33.y = _193;
    out.m_33.z = _195;
    out.m_33.w = _197;
    out.m_35.x = _171;
    out.m_35.y = _173;
    out.m_35.z = _175;
    out.m_35.w = _177;
    out.m_37.x = _201;
    out.m_37.y = _203;
    out.m_37.z = _205;
    out.m_37.w = _207;
    out.m_39.x = _181;
    out.m_39.y = _183;
    out.m_39.z = _185;
    out.m_39.w = _187;
    out.m_41.x = _211;
    out.m_41.y = _213;
    out.m_41.z = _215;
    out.m_41.w = _217;
    return out;
}

