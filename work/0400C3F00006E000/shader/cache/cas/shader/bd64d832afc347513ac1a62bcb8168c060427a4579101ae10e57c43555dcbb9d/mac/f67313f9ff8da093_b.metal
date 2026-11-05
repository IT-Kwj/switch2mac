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
    float2 _199 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_199, float2(0.0), isnan(_199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_199, float2(0.0), isnan(_199))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _217 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_217, float2(0.0), isnan(_217))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_217, float2(0.0), isnan(_217))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _95 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _99 = abs(_76);
    float _101 = log2(_99);
    float _103 = abs(_74);
    float _105 = log2(_103);
    float _107 = abs(_72);
    float _109 = log2(_107);
    float _111 = _101 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = _105 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _115 = exp2(_111);
    float _117 = _109 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _119 = exp2(_113);
    float _121 = exp2(_117);
    float _123 = _85 + _115;
    float _125 = _83 + _119;
    float _127 = fma(_125, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _129 = _81 + _121;
    float _131 = fma(_123, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _133 = fma(_129, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _305 = float3(_133, _127, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_305, float3(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_305, float3(0.0), isnan(_305))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = abs(_137);
    float _145 = log2(_143);
    float _147 = abs(_139);
    float _149 = log2(_147);
    float _151 = abs(_141);
    float _153 = log2(_151);
    float _155 = _145 * 2.2000000476837158203125;
    float _157 = _149 * 2.2000000476837158203125;
    float _159 = exp2(_155);
    float _161 = _153 * 2.2000000476837158203125;
    float _163 = exp2(_157);
    float _165 = exp2(_161);
    out.m_41.x = _159;
    out.m_41.y = _163;
    out.m_41.z = _165;
    out.m_41.w = _87;
    return out;
}

