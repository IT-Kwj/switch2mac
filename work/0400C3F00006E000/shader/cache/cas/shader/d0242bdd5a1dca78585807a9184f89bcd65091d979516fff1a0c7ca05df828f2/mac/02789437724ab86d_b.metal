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
    float2 _263 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_263, float2(0.0), isnan(_263))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _281 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = abs(_72);
    float _99 = log2(_97);
    float _101 = abs(_76);
    float _103 = log2(_101);
    float _105 = abs(_74);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = exp2(_109);
    float _113 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_113);
    float _119 = exp2(_115);
    float _121 = _81 + _111;
    float _123 = _121 * _95;
    float _125 = _85 + _117;
    float _127 = fma(_123, 6.19999980926513671875, 1.7000000476837158203125);
    float _129 = _125 * _95;
    float _131 = fma(_123, _127, 0.0599999986588954925537109375);
    float _133 = _83 + _119;
    float _135 = 1.0 / _131;
    float _137 = fma(_129, 6.19999980926513671875, 1.7000000476837158203125);
    float _139 = _133 * _95;
    float _141 = fma(_129, _137, 0.0599999986588954925537109375);
    float _143 = fma(_123, 6.19999980926513671875, 0.5);
    float _145 = fma(_139, 6.19999980926513671875, 1.7000000476837158203125);
    float _147 = 1.0 / _141;
    float _149 = _123 * _143;
    float _151 = fma(_139, _145, 0.0599999986588954925537109375);
    float _153 = fma(_129, 6.19999980926513671875, 0.5);
    float _155 = _149 * _135;
    float _157 = 1.0 / _151;
    float _159 = fma(_139, 6.19999980926513671875, 0.5);
    float _161 = _129 * _153;
    float _163 = _139 * _159;
    float _165 = _161 * _147;
    float _167 = abs(_155);
    float _169 = log2(_167);
    float _171 = _163 * _157;
    float _173 = abs(_165);
    float _175 = log2(_173);
    float _177 = abs(_171);
    float _179 = log2(_177);
    float _181 = _169 * 2.2000000476837158203125;
    float _183 = _175 * 2.2000000476837158203125;
    float _185 = exp2(_181);
    float _187 = _179 * 2.2000000476837158203125;
    float _189 = exp2(_183);
    float _191 = exp2(_187);
    float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _195 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _197 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _451 = float3(_193, _197, _195);
    float3 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_451, float3(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_451, float3(0.0), isnan(_451))).xyz;
    float _201 = _199.x;
    float _203 = _199.y;
    float _205 = _199.z;
    float _207 = abs(_201);
    float _209 = log2(_207);
    float _211 = abs(_203);
    float _213 = log2(_211);
    float _215 = abs(_205);
    float _217 = log2(_215);
    float _219 = _209 * 0.4545454680919647216796875;
    float _221 = _213 * 0.4545454680919647216796875;
    float _223 = exp2(_219);
    float _225 = _217 * 0.4545454680919647216796875;
    float _227 = exp2(_221);
    float _229 = exp2(_225);
    out.m_41.x = _223;
    out.m_41.y = _227;
    out.m_41.z = _229;
    out.m_41.w = _87;
    return out;
}

