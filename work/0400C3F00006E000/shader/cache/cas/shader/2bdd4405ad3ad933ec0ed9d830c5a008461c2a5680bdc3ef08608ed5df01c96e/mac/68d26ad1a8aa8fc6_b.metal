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
    float2 _256 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _82 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _86 = 1.0 / _78;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _70);
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _96 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _90);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = _92 * _86;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _98 * _86;
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _110 = _100 * _86;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _114 = rint(_104);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = fma(_108, 1.5, _110);
    float _125 = fma(_112, 1.5, _106);
    float _127 = fma(_112, 0.5, _106);
    float3 _416 = float3(_125, _123, float(int(_121)));
    float3 _420 = select(_416, float3(0.0), isnan(_416));
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _420.xy, uint(rint(_420.z)), 1.0);
    float3 _428 = float3(_127, _123, float(int(_121)));
    float3 _430 = select(_428, float3(0.0), isnan(_428));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _430.xy, uint(rint(_430.z)), 1.0);
    float2 _435 = float2(_48, _50);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_435, float2(0.0), isnan(_435))).xy;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = fma(_112, -0.5, _106);
    float _143 = fma(_112, -1.5, _106);
    float _145 = fma(_108, 0.5, _110);
    float _147 = fma(_108, -0.5, _110);
    float _149 = fma(_108, -1.5, _110);
    float _151 = fma(_137, 2.0, -1.0);
    float _153 = fma(_139, 2.0, -1.0);
    float _155 = _129 + _131;
    float _157 = _151 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _159 = _153 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _485 = float3(_141, _123, float(int(_121)));
    float3 _487 = select(_485, float3(0.0), isnan(_485));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _487.xy, uint(rint(_487.z)), 1.0);
    float3 _495 = float3(_143, _123, float(int(_121)));
    float3 _497 = select(_495, float3(0.0), isnan(_495));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _497.xy, uint(rint(_497.z)), 1.0);
    float3 _505 = float3(_125, _145, float(int(_121)));
    float3 _507 = select(_505, float3(0.0), isnan(_505));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _507.xy, uint(rint(_507.z)), 1.0);
    float3 _515 = float3(_127, _145, float(int(_121)));
    float3 _517 = select(_515, float3(0.0), isnan(_515));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _517.xy, uint(rint(_517.z)), 1.0);
    float3 _525 = float3(_141, _145, float(int(_121)));
    float3 _527 = select(_525, float3(0.0), isnan(_525));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _527.xy, uint(rint(_527.z)), 1.0);
    float3 _535 = float3(_143, _145, float(int(_121)));
    float3 _537 = select(_535, float3(0.0), isnan(_535));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _537.xy, uint(rint(_537.z)), 1.0);
    float3 _545 = float3(_125, _147, float(int(_121)));
    float3 _547 = select(_545, float3(0.0), isnan(_545));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _547.xy, uint(rint(_547.z)), 1.0);
    float3 _555 = float3(_127, _147, float(int(_121)));
    float3 _557 = select(_555, float3(0.0), isnan(_555));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _557.xy, uint(rint(_557.z)), 1.0);
    float3 _565 = float3(_141, _147, float(int(_121)));
    float3 _567 = select(_565, float3(0.0), isnan(_565));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _567.xy, uint(rint(_567.z)), 1.0);
    float _179 = fma(_157, 2.0, _48);
    float _181 = fma(_159, 2.0, _50);
    float3 _581 = float3(_143, _147, float(int(_121)));
    float3 _583 = select(_581, float3(0.0), isnan(_581));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _583.xy, uint(rint(_583.z)), 1.0);
    float3 _591 = float3(_125, _149, float(int(_121)));
    float3 _593 = select(_591, float3(0.0), isnan(_591));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _593.xy, uint(rint(_593.z)), 1.0);
    float3 _601 = float3(_127, _149, float(int(_121)));
    float3 _603 = select(_601, float3(0.0), isnan(_601));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _603.xy, uint(rint(_603.z)), 1.0);
    float3 _611 = float3(_141, _149, float(int(_121)));
    float3 _613 = select(_611, float3(0.0), isnan(_611));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _613.xy, uint(rint(_613.z)), 1.0);
    float3 _621 = float3(_143, _149, float(int(_121)));
    float3 _623 = select(_621, float3(0.0), isnan(_621));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _623.xy, uint(rint(_623.z)), 1.0);
    float2 _628 = float2(_179, _181);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float _195 = -_62;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _199 = _195 + _197;
    float _201 = -_62;
    float _203 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _205 = _201 + _203;
    float _207 = _199 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _205 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _213 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _217 = _155 + _161;
    float _219 = _217 + _163;
    float _221 = _219 + _165;
    float _223 = _221 + _167;
    float _225 = _223 + _169;
    float _227 = _225 + _171;
    float _229 = _227 + _173;
    float _231 = _229 + _175;
    float _233 = _231 + _177;
    float _235 = _233 + _183;
    float _237 = _235 + _185;
    float _239 = _237 + _187;
    float _241 = _239 + _189;
    float _243 = _241 + _191;
    float _245 = fma(_243, 0.0625, _209);
    out.m_41.x = _193;
    out.m_41.y = _245;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _215;
    return out;
}

