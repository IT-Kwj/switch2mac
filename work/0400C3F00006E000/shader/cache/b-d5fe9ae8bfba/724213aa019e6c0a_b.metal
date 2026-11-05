#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _256 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _82 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _74);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _78);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _82);
    float _92 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _106 = 1.0 / _98;
    float _108 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _110 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _114 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _116 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _110);
    float _118 = 1.0 / _96;
    float _120 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
    float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _116);
    float _124 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _120);
    float _128 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _130 = _112 * _106;
    float _132 = _126 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _134 = _102 * _118;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _140 = _128 * _118;
    float _142 = _132 * _118;
    float _144 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _146 = _138 * _106;
    float _148 = rint(_136);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    uint _155 = clamp(_153, 0u, 65535u);
    float _157 = fma(_144, 0.5, _140);
    float _159 = fma(_144, -0.5, _140);
    float _161 = fma(_124, 0.5, _142);
    float2 _480 = float2(_130, _146);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_480, float2(0.0), isnan(_480))).xy;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = fma(_124, -0.5, _142);
    float3 _499 = float3(_157, _161, float(int(_155)));
    float3 _503 = select(_499, float3(0.0), isnan(_499));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _503.xy, uint(rint(_503.z)), 1.0);
    float3 _511 = float3(_159, _161, float(int(_155)));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _513.xy, uint(rint(_513.z)), 1.0);
    float3 _521 = float3(_157, _171, float(int(_155)));
    float3 _523 = select(_521, float3(0.0), isnan(_521));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _523.xy, uint(rint(_523.z)), 1.0);
    float3 _531 = float3(_159, _171, float(int(_155)));
    float3 _533 = select(_531, float3(0.0), isnan(_531));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _533.xy, uint(rint(_533.z)), 1.0);
    float2 _538 = float2(_48, _50);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float _183 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _185 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _183);
    float _187 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _185);
    float _189 = _187 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _191 = precise::min(_189, 1.0);
    float _193 = -_66;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _197 = _193 + _195;
    float _199 = -_66;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _203 = _199 + _201;
    float _205 = _197 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _203 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = -_167;
    float _215 = fma(_213, _167, _169);
    float _217 = -_167;
    float _219 = _191 + _217;
    float _221 = fma(_219, _219, _215);
    bool _225 = _219 <= 0.001000000047497451305389404296875;
    float _227 = float(_225);
    float _229 = 1.0 / _221;
    float _231 = _173 + _175;
    float _233 = _215 * _229;
    float _235 = _231 + _177;
    float _237 = precise::max(_233, _227);
    float _239 = _235 + _179;
    float _241 = precise::min(_237, 1.0);
    float _243 = fma(_239, 0.25, _207);
    float _245 = _211 + _241;
    out.m_41.x = _181;
    out.m_41.y = _243;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _245;
    return out;
}

