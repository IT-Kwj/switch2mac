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
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_36.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_36.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _229 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_229, float2(0.0), isnan(_229))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_229, float2(0.0), isnan(_229))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _247 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_247, float2(0.0), isnan(_247))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _83 + _74;
    float _99 = _81 + _72;
    float _101 = _85 + _76;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = _103 * 0.586600005626678466796875;
    float _111 = _105 * (-1.44269502162933349609375);
    float _113 = _107 * (-1.44269502162933349609375);
    float _115 = _103 * (-1.44269502162933349609375);
    float _117 = fma(_105, 0.29890000820159912109375, _109);
    float _119 = exp2(_111);
    float _121 = fma(_107, 0.1143999993801116943359375, _117);
    float _123 = _121 * (-1.44269502162933349609375);
    float _125 = 1.0 / _121;
    float _127 = exp2(_123);
    float _129 = -_119;
    float _131 = _129 + 1.0;
    float _133 = exp2(_113);
    float _135 = exp2(_115);
    float _137 = -_127;
    float _139 = _137 + 1.0;
    float _141 = _139 * _125;
    float _143 = _139 * _139;
    float _145 = _105 * _141;
    float _147 = _107 * _141;
    float _149 = -_133;
    float _151 = _149 + 1.0;
    float _153 = _103 * _141;
    float _155 = -_145;
    float _157 = _131 + _155;
    float _159 = -_147;
    float _161 = _151 + _159;
    float _163 = -_135;
    float _165 = _163 + 1.0;
    float _167 = fma(_143, _157, _145);
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = fma(_143, _161, _147);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = -_153;
    float _177 = _165 + _175;
    float _179 = fma(_143, _177, _153);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _185 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _187 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _407 = float3(_185, _187, _183);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_407, float3(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_407, float3(0.0), isnan(_407))).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    out.m_41.x = _191;
    out.m_41.y = _193;
    out.m_41.z = _195;
    out.m_41.w = _87;
    return out;
}

