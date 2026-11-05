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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture3d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _241 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_241, float2(0.0), isnan(_241))).x;
    float2 _253 = float2(_50, _52);
    float3 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_253, float2(0.0), isnan(_253))).xyz;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = in.m_40.y;
    float _68 = in.m_40.x;
    float _70 = -_54;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _72);
    float _76 = _74 * _66;
    float _78 = _74 * _68;
    float _80 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _86 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _94 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _96 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _104 = _96 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[3].x, _102);
    float _110 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[5].x, _104);
    float _112 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].z, _108);
    float _114 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].z, _110);
    float _116 = _112 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _118 = _114 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float3 _383 = float3(_116, _118, 0.0);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_383, float3(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_383, float3(0.0), isnan(_383))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float3 _401 = float3(_116, _118, 0.0);
    float4 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_401, float3(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_401, float3(0.0), isnan(_401))).xyzw;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _131.w;
    float3 _417 = float3(_116, _118, 0.0);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_417, float3(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_417, float3(0.0), isnan(_417))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float _151 = fma(_62, 2.0, -1.0);
    float _153 = fma(_60, 2.0, -1.0);
    float _155 = fma(_64, 2.0, -1.0);
    float _157 = _151 * _151;
    float _159 = fma(_153, _153, _157);
    float _161 = fma(_155, _155, _159);
    float _163 = rsqrt(_161);
    float _165 = _151 * _163;
    float _167 = _153 * _163;
    float _169 = _155 * _163;
    float _171 = _165 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _175 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[1].x, _171);
    float _177 = _165 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _179 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].x, _173);
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].z, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].x, _177);
    float _185 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].z, _179);
    float _187 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[2].z, _183);
    float _189 = _181 * _125;
    float _191 = _181 * _135;
    float _193 = _181 * _145;
    float _195 = fma(_185, _129, _189);
    float _197 = fma(_185, _139, _191);
    float _199 = fma(_185, _149, _193);
    float _201 = fma(_187, _127, _195);
    float _203 = fma(_187, _137, _197);
    float _205 = fma(_187, _147, _199);
    float _207 = _201 * 0.3257299959659576416015625;
    float _209 = _203 * 0.3257299959659576416015625;
    float _211 = _205 * 0.3257299959659576416015625;
    float _213 = fma(_123, 0.2820999920368194580078125, _207);
    float _215 = fma(_133, 0.2820999920368194580078125, _209);
    float _217 = fma(_143, 0.2820999920368194580078125, _211);
    float _219 = precise::max(0.0, _213);
    float _221 = precise::max(0.0, _215);
    float _223 = precise::max(0.0, _217);
    float _225 = _219 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _227 = _221 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _229 = _223 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    out.m_43.x = _225;
    out.m_43.y = _227;
    out.m_43.z = _229;
    return out;
}

