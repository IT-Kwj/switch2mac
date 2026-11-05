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
    float2 _283 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_283, float2(0.0), isnan(_283))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _300 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float2(0.0), isnan(_300))).xyzw;
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
    bool _111 = _103 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _119 = _115 || _117;
    bool _121 = _105 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _123 = isnan(_105);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _129 = _125 || _127;
    bool _131 = !_119;
    float _133 = _131 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _135 = !_119;
    float _137 = _135 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _139 = _107 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _141 = isnan(_107);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _147 = _143 || _145;
    bool _149 = !_129;
    float _151 = _149 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _153 = fma(_103, _133, _137);
    bool _155 = !_129;
    float _157 = _155 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _159 = !_147;
    float _161 = _159 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _163 = 1.0 / _153;
    bool _165 = !_147;
    float _167 = _165 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _169 = fma(_105, _151, _157);
    float _171 = fma(_107, _161, _167);
    float _173 = 1.0 / _169;
    bool _175 = !_119;
    float _177 = _175 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _179 = !_147;
    float _181 = _179 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _183 = !_129;
    float _185 = _183 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _187 = !_129;
    float _189 = _187 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _191 = 1.0 / _171;
    bool _193 = !_119;
    float _195 = _193 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _197 = !_147;
    float _199 = _197 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _201 = fma(_105, _185, _189);
    float _203 = fma(_103, _177, _195);
    float _205 = fma(_107, _181, _199);
    float _207 = _201 * _173;
    float _209 = _203 * _163;
    float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _213 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _215 = _205 * _191;
    float _217 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _549 = float3(_213, _217, _211);
    float3 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_549, float3(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_549, float3(0.0), isnan(_549))).xyz;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = _219.z;
    float _227 = abs(_221);
    float _229 = log2(_227);
    float _231 = abs(_223);
    float _233 = log2(_231);
    float _235 = abs(_225);
    float _237 = log2(_235);
    float _239 = _229 * 0.4545454680919647216796875;
    float _241 = _233 * 0.4545454680919647216796875;
    float _243 = exp2(_239);
    float _245 = _237 * 0.4545454680919647216796875;
    float _247 = exp2(_241);
    float _249 = exp2(_245);
    out.m_41.x = _243;
    out.m_41.y = _247;
    out.m_41.z = _249;
    out.m_41.w = _87;
    return out;
}

