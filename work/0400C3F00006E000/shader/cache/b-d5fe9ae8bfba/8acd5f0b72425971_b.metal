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
    float2 _232 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_232, float2(0.0), isnan(_232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_232, float2(0.0), isnan(_232))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _74);
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _84);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _90);
    float _100 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _102 = _92 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _104 = 1.0 / _96;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _100);
    float _110 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _112 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _108);
    float _116 = 1.0 / _106;
    float _118 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _76);
    float _120 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _118);
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _120);
    float _128 = _102 * _104;
    float _130 = _124 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _132 = _126 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _134 = _130 * _104;
    float _136 = _110 * _116;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float2 _417 = float2(_128, _134);
    float2 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_417, float2(0.0), isnan(_417))).xy;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _132 * _116;
    float _150 = _122 * _116;
    float _152 = rint(_138);
    float _154 = precise::max(_152, 0.0);
    uint _157 = uint(_154);
    uint _159 = clamp(_157, 0u, 65535u);
    float3 _449 = float3(_148, _150, float(int(_159)));
    float3 _453 = select(_449, float3(0.0), isnan(_449));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _453.xy, uint(rint(_453.z)), 1.0);
    float2 _458 = float2(_48, _50);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float _165 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _167 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _165);
    float _169 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _167);
    float _171 = _169 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _173 = precise::min(_171, 1.0);
    float _175 = -_66;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _179 = _175 + _177;
    float _181 = -_66;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _185 = _181 + _183;
    float _187 = _179 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _185 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = -_144;
    float _197 = fma(_195, _144, _146);
    float _199 = -_144;
    float _201 = _173 + _199;
    float _203 = fma(_201, _201, _197);
    bool _207 = _201 <= 0.001000000047497451305389404296875;
    float _209 = float(_207);
    float _211 = 1.0 / _203;
    float _213 = _189 + _161;
    float _215 = _197 * _211;
    float _217 = precise::max(_215, _209);
    float _219 = precise::min(_217, 1.0);
    float _221 = _193 + _219;
    out.m_41.x = _163;
    out.m_41.y = _213;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _221;
    return out;
}

