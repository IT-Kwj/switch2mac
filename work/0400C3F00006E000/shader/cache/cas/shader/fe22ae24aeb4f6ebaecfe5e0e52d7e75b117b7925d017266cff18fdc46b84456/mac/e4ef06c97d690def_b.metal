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
    float2 _239 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_239, float2(0.0), isnan(_239))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _257 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_257, float2(0.0), isnan(_257))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _81 + _72;
    float _99 = _85 + _76;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, 6.19999980926513671875, 1.7000000476837158203125);
    float _111 = fma(_105, 6.19999980926513671875, 1.7000000476837158203125);
    float _113 = fma(_107, 6.19999980926513671875, 1.7000000476837158203125);
    float _115 = fma(_103, _109, 0.0599999986588954925537109375);
    float _117 = fma(_105, _111, 0.0599999986588954925537109375);
    float _119 = fma(_107, _113, 0.0599999986588954925537109375);
    float _121 = fma(_103, 6.19999980926513671875, 0.5);
    float _123 = fma(_107, 6.19999980926513671875, 0.5);
    float _125 = 1.0 / _117;
    float _127 = _103 * _121;
    float _129 = fma(_105, 6.19999980926513671875, 0.5);
    float _131 = _107 * _123;
    float _133 = _105 * _129;
    float _135 = 1.0 / _115;
    float _137 = 1.0 / _119;
    float _139 = _133 * _125;
    float _141 = _127 * _135;
    float _143 = abs(_139);
    float _145 = log2(_143);
    float _147 = _131 * _137;
    float _149 = abs(_141);
    float _151 = log2(_149);
    float _153 = abs(_147);
    float _155 = log2(_153);
    float _157 = _145 * 2.2000000476837158203125;
    float _159 = _151 * 2.2000000476837158203125;
    float _161 = exp2(_157);
    float _163 = _155 * 2.2000000476837158203125;
    float _165 = exp2(_159);
    float _167 = exp2(_163);
    float _169 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _171 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _173 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _397 = float3(_171, _173, _169);
    float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_397, float3(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_397, float3(0.0), isnan(_397))).xyz;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = abs(_177);
    float _185 = log2(_183);
    float _187 = abs(_179);
    float _189 = log2(_187);
    float _191 = abs(_181);
    float _193 = log2(_191);
    float _195 = _185 * 0.4545454680919647216796875;
    float _197 = _189 * 0.4545454680919647216796875;
    float _199 = exp2(_195);
    float _201 = _193 * 0.4545454680919647216796875;
    float _203 = exp2(_197);
    float _205 = exp2(_201);
    out.m_41.x = _199;
    out.m_41.y = _203;
    out.m_41.z = _205;
    out.m_41.w = _87;
    return out;
}

