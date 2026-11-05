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
    float2 _277 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_277, float2(0.0), isnan(_277))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _295 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_295, float2(0.0), isnan(_295))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = abs(_74);
    float _99 = log2(_97);
    float _101 = abs(_72);
    float _103 = log2(_101);
    float _105 = abs(_76);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _83 + _113;
    float _123 = _121 * _95;
    float _125 = _81 + _117;
    float _127 = _123 * 0.586600005626678466796875;
    float _129 = _123 * (-1.44269502162933349609375);
    float _131 = _125 * _95;
    float _133 = _85 + _119;
    float _135 = fma(_131, 0.29890000820159912109375, _127);
    float _137 = _131 * (-1.44269502162933349609375);
    float _139 = exp2(_129);
    float _141 = _133 * _95;
    float _143 = fma(_141, 0.1143999993801116943359375, _135);
    float _145 = _141 * (-1.44269502162933349609375);
    float _147 = exp2(_137);
    float _149 = _143 * (-1.44269502162933349609375);
    float _151 = exp2(_149);
    float _153 = 1.0 / _143;
    float _155 = -_147;
    float _157 = _155 + 1.0;
    float _159 = exp2(_145);
    float _161 = -_151;
    float _163 = _161 + 1.0;
    float _165 = -_139;
    float _167 = _165 + 1.0;
    float _169 = _163 * _153;
    float _171 = _163 * _163;
    float _173 = _141 * _169;
    float _175 = _131 * _169;
    float _177 = _123 * _169;
    float _179 = -_159;
    float _181 = _179 + 1.0;
    float _183 = -_175;
    float _185 = _157 + _183;
    float _187 = -_177;
    float _189 = _167 + _187;
    float _191 = -_173;
    float _193 = _181 + _191;
    float _195 = fma(_171, _185, _175);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = fma(_171, _189, _177);
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = fma(_171, _193, _173);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _209 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _211 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _485 = float3(_207, _209, _211);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_485, float3(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_485, float3(0.0), isnan(_485))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = abs(_215);
    float _223 = log2(_221);
    float _225 = abs(_217);
    float _227 = log2(_225);
    float _229 = abs(_219);
    float _231 = log2(_229);
    float _233 = _223 * 2.2000000476837158203125;
    float _235 = _227 * 2.2000000476837158203125;
    float _237 = exp2(_233);
    float _239 = _231 * 2.2000000476837158203125;
    float _241 = exp2(_235);
    float _243 = exp2(_239);
    out.m_41.x = _237;
    out.m_41.y = _241;
    out.m_41.z = _243;
    out.m_41.w = _87;
    return out;
}

