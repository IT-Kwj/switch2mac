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
    texturecube_array<float> fp_t_tcb_A [[id(3)]];
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
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_34.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float2 _289 = float2(_72, _70);
    float3 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289))).xyz;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = abs(_78);
    float _86 = abs(_80);
    float _88 = precise::max(_84, _86);
    float _90 = abs(_80);
    float _92 = abs(_82);
    float _94 = precise::max(_90, _92);
    float _96 = abs(_82);
    float _98 = precise::max(_96, _88);
    float _100 = abs(_78);
    float _102 = abs(_82);
    float _104 = precise::max(_100, _102);
    float _106 = abs(_78);
    float _108 = precise::max(_106, _94);
    float _110 = abs(_80);
    float _112 = precise::max(_110, _104);
    float _114 = 1.0 / _98;
    float _116 = 1.0 / _108;
    float _118 = 1.0 / _112;
    float _120 = _78 * _114;
    float _122 = _80 * _114;
    float _124 = _82 * _114;
    float _126 = -_114;
    float _128 = _78 * _126;
    float _130 = -_114;
    float _132 = _82 * _130;
    float _134 = rint((*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _136 = precise::max(_134, 0.0);
    uint _139 = uint(_136);
    uint _141 = clamp(_139, 0u, 65535u);
    float _143 = _80 * _116;
    float _145 = _78 * _116;
    float _147 = -_116;
    float _149 = _82 * _147;
    float _151 = -_116;
    float _153 = _78 * _151;
    float _155 = -_118;
    float _157 = _82 * _155;
    float _159 = _78 * _118;
    float _161 = -_118;
    float _163 = _80 * _161;
    float _165 = -_118;
    float _167 = _78 * _165;
    float _169 = _80 * _118;
    float _171 = _82 * _116;
    float4 _426 = float4(_120, _122, _124, float(int(_141)));
    float4 _430 = select(_426, float4(0.0), isnan(_426));
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _430.xyz, uint(rint(_430.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _430.xyz, uint(rint(_430.w))).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float4 _446 = float4(_157, _159, _163, float(int(_141)));
    float4 _448 = select(_446, float4(0.0), isnan(_446));
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _448.xyz, uint(rint(_448.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _448.xyz, uint(rint(_448.w))).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float4 _464 = float4(_149, _143, _145, float(int(_141)));
    float4 _466 = select(_464, float4(0.0), isnan(_464));
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _466.xyz, uint(rint(_466.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _466.xyz, uint(rint(_466.w))).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float4 _482 = float4(_128, _122, _132, float(int(_141)));
    float4 _484 = select(_482, float4(0.0), isnan(_482));
    float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _484.xyz, uint(rint(_484.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _484.xyz, uint(rint(_484.w))).xyz;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = _197.z;
    float4 _500 = float4(_157, _167, _169, float(int(_141)));
    float4 _502 = select(_500, float4(0.0), isnan(_500));
    float3 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _502.xyz, uint(rint(_502.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _502.xyz, uint(rint(_502.w))).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float4 _518 = float4(_171, _143, _153, float(int(_141)));
    float4 _520 = select(_518, float4(0.0), isnan(_518));
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _520.xyz, uint(rint(_520.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _520.xyz, uint(rint(_520.w))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _175 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _223 = _177 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _225 = _179 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _227 = _183 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _229 = _185 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _231 = _187 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _233 = _191 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _235 = _193 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _237 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _239 = _199 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _241 = _201 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _243 = _203 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _245 = _207 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _247 = _209 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _249 = _211 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _251 = _215 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _253 = _217 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _255 = _219 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_37.x = _221;
    out.m_37.y = _223;
    out.m_37.z = _225;
    out.m_37.w = 1.0;
    out.m_39.x = _239;
    out.m_39.y = _241;
    out.m_39.z = _243;
    out.m_39.w = 1.0;
    out.m_41.x = _227;
    out.m_41.y = _229;
    out.m_41.z = _231;
    out.m_41.w = 1.0;
    out.m_43.x = _245;
    out.m_43.y = _247;
    out.m_43.z = _249;
    out.m_43.w = 1.0;
    out.m_45.x = _233;
    out.m_45.y = _235;
    out.m_45.z = _237;
    out.m_45.w = 1.0;
    out.m_47.x = _251;
    out.m_47.y = _253;
    out.m_47.z = _255;
    out.m_47.w = 1.0;
    return out;
}

