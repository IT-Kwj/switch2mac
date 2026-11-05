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
    float2 _224 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _66);
    float _76 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _68);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _70);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _74);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _86 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _78);
    float _88 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _80);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _98 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _102 = 1.0 / _90;
    float _104 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _98);
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _104);
    float _112 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _106);
    float _114 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _108);
    float _116 = 1.0 / _100;
    float _118 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _110);
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _118 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _126 = _94 * _102;
    float _128 = _96 * _102;
    float2 _400 = float2(_126, _128);
    float2 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_400, float2(0.0), isnan(_400))).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _120 * _116;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _122 * _116;
    float _144 = _124 * _116;
    float _146 = rint(_140);
    float _148 = precise::max(_146, 0.0);
    uint _151 = uint(_148);
    uint _153 = clamp(_151, 0u, 65535u);
    float3 _437 = float3(_142, _144, float(int(_153)));
    float3 _441 = select(_437, float3(0.0), isnan(_437));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _441.xy, uint(rint(_441.z)), 1.0);
    float _157 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _159 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _157);
    float _161 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _159);
    float _163 = _161 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _165 = precise::min(_163, 1.0);
    float _167 = -_60;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _171 = _167 + _169;
    float _173 = -_134;
    float _175 = fma(_173, _134, _136);
    float _177 = -_134;
    float _179 = _165 + _177;
    float _181 = -_60;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _185 = _181 + _183;
    float _187 = fma(_179, _179, _175);
    bool _191 = _179 <= 0.001000000047497451305389404296875;
    float _193 = float(_191);
    float _195 = _185 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _171 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = 1.0 / _187;
    float _205 = _197 + _155;
    float _207 = _175 * _203;
    float _209 = precise::max(_207, _193);
    float _211 = precise::min(_209, 1.0);
    float _213 = _201 + _211;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _205;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _213;
    return out;
}

