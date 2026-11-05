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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _228 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _74);
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _78);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _80);
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _102 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = 1.0 / _94;
    float _108 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _102);
    float _112 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _84);
    float _114 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _108);
    float _116 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _110);
    float _118 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _112);
    float _120 = 1.0 / _104;
    float _122 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _114);
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _128 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _130 = _98 * _106;
    float _132 = _100 * _106;
    float2 _408 = float2(_130, _132);
    float2 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_408, float2(0.0), isnan(_408))).xy;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _124 * _120;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _128 * _120;
    float _148 = _126 * _120;
    float _150 = rint(_144);
    float _152 = precise::max(_150, 0.0);
    uint _155 = uint(_152);
    uint _157 = clamp(_155, 0u, 65535u);
    float3 _445 = float3(_146, _148, float(int(_157)));
    float3 _449 = select(_445, float3(0.0), isnan(_445));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _449.xy, uint(rint(_449.z)), 1.0);
    float _161 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _163 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _161);
    float _165 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _163);
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _169 = precise::min(_167, 1.0);
    float _171 = -_64;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _175 = _171 + _173;
    float _177 = -_138;
    float _179 = fma(_177, _138, _140);
    float _181 = -_138;
    float _183 = _169 + _181;
    float _185 = -_64;
    float _187 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _189 = _185 + _187;
    float _191 = fma(_183, _183, _179);
    bool _195 = _183 <= 0.001000000047497451305389404296875;
    float _197 = float(_195);
    float _199 = _189 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _175 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = 1.0 / _191;
    float _209 = _201 + _159;
    float _211 = _179 * _207;
    float _213 = precise::max(_211, _197);
    float _215 = precise::min(_213, 1.0);
    float _217 = _205 + _215;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _209;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _217;
    return out;
}

