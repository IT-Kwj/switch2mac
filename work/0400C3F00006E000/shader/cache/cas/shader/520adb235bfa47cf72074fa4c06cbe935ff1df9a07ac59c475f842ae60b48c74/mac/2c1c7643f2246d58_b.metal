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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _219 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).x;
    float2 _231 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_231, float2(0.0), isnan(_231))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _70 = 1.0 / _68;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = _70 * _72;
    float _76 = _74 * _62;
    float _78 = _74 * _64;
    float _80 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _88 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _92 = fma(_58, 2.0, -1.0);
    float _94 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _96 = fma(_60, 2.0, -1.0);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _104 = _92 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _106 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _100);
    float _110 = 1.0 / _98;
    float _112 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _102);
    float _114 = fma(_104, 2.0, _48);
    float _116 = _106 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _118 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _122 = _96 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _124 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _126 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _128 = fma(_122, 2.0, _50);
    float _130 = _116 * _110;
    float _132 = _118 * _110;
    float _134 = _120 * _110;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = fma(_136, _124, _130);
    float _140 = fma(_136, _126, _132);
    float _142 = -_124;
    float _144 = fma(_136, _142, _130);
    float _146 = -_126;
    float _148 = fma(_136, _146, _132);
    float3 _413 = float3(_138, _140, float(0));
    float3 _417 = select(_413, float3(0.0), isnan(_413));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _417.xy, uint(rint(_417.z)), _136);
    float3 _424 = float3(_130, _140, float(0));
    float3 _426 = select(_424, float3(0.0), isnan(_424));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _426.xy, uint(rint(_426.z)), _136);
    float3 _433 = float3(_144, _140, float(0));
    float3 _435 = select(_433, float3(0.0), isnan(_433));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _435.xy, uint(rint(_435.z)), _136);
    float3 _442 = float3(_138, _132, float(0));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _444.xy, uint(rint(_444.z)), _136);
    float3 _451 = float3(_130, _132, float(0));
    float3 _453 = select(_451, float3(0.0), isnan(_451));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _453.xy, uint(rint(_453.z)), _136);
    float3 _460 = float3(_144, _132, float(0));
    float3 _462 = select(_460, float3(0.0), isnan(_460));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _462.xy, uint(rint(_462.z)), _136);
    float3 _469 = float3(_138, _148, float(0));
    float3 _471 = select(_469, float3(0.0), isnan(_469));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _471.xy, uint(rint(_471.z)), _136);
    float3 _478 = float3(_130, _148, float(0));
    float3 _480 = select(_478, float3(0.0), isnan(_478));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _480.xy, uint(rint(_480.z)), _136);
    float3 _487 = float3(_144, _148, float(0));
    float3 _489 = select(_487, float3(0.0), isnan(_487));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _489.xy, uint(rint(_489.z)), _136);
    float2 _495 = float2(_114, _128);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float _170 = _150 + _152;
    float _172 = _170 + _154;
    float _174 = _172 + _156;
    float _176 = _174 + _158;
    float _178 = _176 + _160;
    float _180 = _178 + _162;
    float _182 = -_74;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _186 = _182 + _184;
    float _188 = -_74;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _192 = _188 + _190;
    float _194 = _180 + _164;
    float _196 = _186 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _192 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _194 + _166;
    float _206 = _202 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _208 = fma(_204, 0.111111111938953399658203125, _198);
    out.m_41.x = _168;
    out.m_41.y = _208;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _206;
    return out;
}

