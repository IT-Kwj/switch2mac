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
    float2 _175 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_175, float2(0.0), isnan(_175))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _193 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_193, float2(0.0), isnan(_193))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_193, float2(0.0), isnan(_193))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _95 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _99 = _85 + _76;
    float _101 = _81 + _72;
    float _103 = _83 + _74;
    float _105 = fma(_99, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _107 = fma(_101, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _109 = fma(_103, _97, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _251 = float3(_107, _109, _105);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_251, float3(0.0), isnan(_251))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_251, float3(0.0), isnan(_251))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = abs(_113);
    float _121 = log2(_119);
    float _123 = abs(_115);
    float _125 = log2(_123);
    float _127 = abs(_117);
    float _129 = log2(_127);
    float _131 = _121 * 0.4545454680919647216796875;
    float _133 = _125 * 0.4545454680919647216796875;
    float _135 = exp2(_131);
    float _137 = _129 * 0.4545454680919647216796875;
    float _139 = exp2(_133);
    float _141 = exp2(_137);
    out.m_41.x = _135;
    out.m_41.y = _139;
    out.m_41.z = _141;
    out.m_41.w = _87;
    return out;
}

