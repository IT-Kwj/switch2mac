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
    float2 _245 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _98 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _102 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _90);
    float _104 = 1.0 / _96;
    float _106 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _84);
    float _110 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _98);
    float _112 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _114 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _116 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _108);
    float _118 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _110);
    float _120 = 1.0 / _94;
    float _122 = _112 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _126 = _116 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _128 = _118 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _130 = _126 * _104;
    float _132 = _128 * _104;
    float _134 = _106 * _120;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _122 * _120;
    float _140 = _124 * _120;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _144 = _142 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _148 = fma(_144, 0.5, _138);
    float _150 = fma(_144, -0.5, _138);
    float _152 = fma(_146, 0.5, _140);
    float _154 = fma(_146, -0.5, _140);
    float2 _464 = float2(_130, _132);
    float2 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_464, float2(0.0), isnan(_464))).xy;
    float _160 = _158.x;
    float _162 = _158.y;
    float3 _478 = float3(_148, _152, float(0));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _482.xy, uint(rint(_482.z)), _136);
    float3 _489 = float3(_150, _152, float(0));
    float3 _491 = select(_489, float3(0.0), isnan(_489));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _491.xy, uint(rint(_491.z)), _136);
    float3 _498 = float3(_148, _154, float(0));
    float3 _500 = select(_498, float3(0.0), isnan(_498));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _500.xy, uint(rint(_500.z)), _136);
    float3 _507 = float3(_150, _154, float(0));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _509.xy, uint(rint(_509.z)), _136);
    float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _172);
    float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _174);
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _180 = precise::min(_178, 1.0);
    float _182 = -_160;
    float _184 = fma(_182, _160, _162);
    float _186 = -_160;
    float _188 = _180 + _186;
    float _190 = _164 + _166;
    float _192 = -_64;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _196 = _192 + _194;
    float _198 = fma(_188, _188, _184);
    bool _202 = _188 <= 0.001000000047497451305389404296875;
    float _204 = float(_202);
    float _206 = _190 + _168;
    float _208 = -_64;
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _212 = _208 + _210;
    float _214 = _196 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = 1.0 / _198;
    float _220 = _206 + _170;
    float _222 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_220, 0.25, _216);
    float _228 = _184 * _218;
    float _230 = precise::max(_228, _204);
    float _232 = precise::min(_230, 1.0);
    float _234 = _224 + _232;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _226;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _234;
    return out;
}

