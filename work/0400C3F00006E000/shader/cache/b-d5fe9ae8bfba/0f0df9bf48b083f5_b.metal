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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _255 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_255, float2(0.0), isnan(_255))).x;
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
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _80 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _86 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _98 = 1.0 / _86;
    float _100 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = _102 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = _104 * _98;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _100 * _98;
    float _114 = _106 * _98;
    float _116 = _110 * _94;
    float _118 = fma(_116, 1.5, _112);
    float _120 = fma(_116, 0.5, _112);
    float _122 = fma(_116, -0.5, _112);
    float _124 = fma(_116, -1.5, _112);
    float _126 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _128 = _110 * _126;
    float _130 = fma(_128, 1.5, _114);
    float _132 = fma(_128, 0.5, _114);
    float3 _424 = float3(_118, _130, float(0));
    float3 _428 = select(_424, float3(0.0), isnan(_424));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _428.xy, uint(rint(_428.z)), _110);
    float3 _435 = float3(_120, _130, float(0));
    float3 _437 = select(_435, float3(0.0), isnan(_435));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _437.xy, uint(rint(_437.z)), _110);
    float3 _444 = float3(_122, _130, float(0));
    float3 _446 = select(_444, float3(0.0), isnan(_444));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _446.xy, uint(rint(_446.z)), _110);
    float3 _453 = float3(_124, _130, float(0));
    float3 _455 = select(_453, float3(0.0), isnan(_453));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _455.xy, uint(rint(_455.z)), _110);
    float3 _462 = float3(_118, _132, float(0));
    float3 _464 = select(_462, float3(0.0), isnan(_462));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _464.xy, uint(rint(_464.z)), _110);
    float3 _471 = float3(_120, _132, float(0));
    float3 _473 = select(_471, float3(0.0), isnan(_471));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _473.xy, uint(rint(_473.z)), _110);
    float _146 = fma(_128, -0.5, _114);
    float _148 = fma(_128, -1.5, _114);
    float3 _486 = float3(_122, _132, float(0));
    float3 _488 = select(_486, float3(0.0), isnan(_486));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _488.xy, uint(rint(_488.z)), _110);
    float2 _494 = float2(_48, _50);
    float2 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_494, float2(0.0), isnan(_494))).xy;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _134 + _136;
    float _162 = _160 + _138;
    float _164 = _162 + _140;
    float _166 = _164 + _142;
    float3 _519 = float3(_124, _132, float(0));
    float3 _521 = select(_519, float3(0.0), isnan(_519));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _521.xy, uint(rint(_521.z)), _110);
    float3 _528 = float3(_118, _146, float(0));
    float3 _530 = select(_528, float3(0.0), isnan(_528));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _530.xy, uint(rint(_530.z)), _110);
    float3 _537 = float3(_120, _146, float(0));
    float3 _539 = select(_537, float3(0.0), isnan(_537));
    float _172 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _539.xy, uint(rint(_539.z)), _110);
    float3 _546 = float3(_122, _146, float(0));
    float3 _548 = select(_546, float3(0.0), isnan(_546));
    float _174 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _548.xy, uint(rint(_548.z)), _110);
    float _176 = fma(_158, 2.0, -1.0);
    float _178 = _166 + _144;
    float _180 = fma(_156, 2.0, -1.0);
    float _182 = _176 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _184 = _178 + _150;
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _188 = fma(_182, 2.0, _50);
    float _190 = fma(_186, 2.0, _48);
    float3 _582 = float3(_124, _146, float(0));
    float3 _584 = select(_582, float3(0.0), isnan(_582));
    float _192 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _584.xy, uint(rint(_584.z)), _110);
    float3 _591 = float3(_118, _148, float(0));
    float3 _593 = select(_591, float3(0.0), isnan(_591));
    float _194 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _593.xy, uint(rint(_593.z)), _110);
    float3 _600 = float3(_120, _148, float(0));
    float3 _602 = select(_600, float3(0.0), isnan(_600));
    float _196 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _602.xy, uint(rint(_602.z)), _110);
    float3 _609 = float3(_122, _148, float(0));
    float3 _611 = select(_609, float3(0.0), isnan(_609));
    float _198 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _611.xy, uint(rint(_611.z)), _110);
    float3 _618 = float3(_124, _148, float(0));
    float3 _620 = select(_618, float3(0.0), isnan(_618));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _620.xy, uint(rint(_620.z)), _110);
    float2 _626 = float2(_190, _188);
    float _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float _204 = -_66;
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _208 = _204 + _206;
    float _210 = -_66;
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _214 = _210 + _212;
    float _216 = _208 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _226 = _184 + _168;
    float _228 = _226 + _170;
    float _230 = _228 + _172;
    float _232 = _230 + _174;
    float _234 = _232 + _192;
    float _236 = _234 + _194;
    float _238 = _236 + _196;
    float _240 = _238 + _198;
    float _242 = _240 + _200;
    float _244 = fma(_242, 0.0625, _218);
    out.m_41.x = _202;
    out.m_41.y = _244;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _224;
    return out;
}

