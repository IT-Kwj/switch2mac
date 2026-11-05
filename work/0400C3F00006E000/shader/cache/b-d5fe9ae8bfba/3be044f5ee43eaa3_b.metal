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
    float2 _223 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_223, float2(0.0), isnan(_223))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _241 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_241, float2(0.0), isnan(_241))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _95 * (-1.44269502162933349609375);
    float _99 = abs(_72);
    float _101 = log2(_99);
    float _103 = abs(_76);
    float _105 = log2(_103);
    float _107 = abs(_74);
    float _109 = log2(_107);
    float _111 = _101 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = _105 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _115 = exp2(_111);
    float _117 = _109 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _119 = exp2(_113);
    float _121 = exp2(_117);
    float _123 = _81 + _115;
    float _125 = _123 * _97;
    float _127 = _85 + _119;
    float _129 = exp2(_125);
    float _131 = _127 * _97;
    float _133 = _83 + _121;
    float _135 = exp2(_131);
    float _137 = _133 * _97;
    float _139 = exp2(_137);
    float _141 = -_129;
    float _143 = _141 + 1.0;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _147 = -_135;
    float _149 = _147 + 1.0;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _153 = -_139;
    float _155 = _153 + 1.0;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _358 = float3(_145, _157, _151);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_358, float3(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_358, float3(0.0), isnan(_358))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = abs(_161);
    float _169 = log2(_167);
    float _171 = abs(_163);
    float _173 = log2(_171);
    float _175 = abs(_165);
    float _177 = log2(_175);
    float _179 = _169 * 0.4545454680919647216796875;
    float _181 = _173 * 0.4545454680919647216796875;
    float _183 = exp2(_179);
    float _185 = _177 * 0.4545454680919647216796875;
    float _187 = exp2(_181);
    float _189 = exp2(_185);
    out.m_41.x = _183;
    out.m_41.y = _187;
    out.m_41.z = _189;
    out.m_41.w = _87;
    return out;
}

