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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float2 _230 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _70);
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _68);
    float _80 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _86 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _88 = 1.0 / _76;
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _98 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _90);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _94 * _88;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _100 * _88;
    float _110 = _102 * _88;
    float _112 = _106 * _84;
    float _114 = _106 * _96;
    float _116 = fma(_112, 1.5, _108);
    float _118 = fma(_114, 1.5, _110);
    float _120 = fma(_112, 0.5, _108);
    float _122 = fma(_112, -0.5, _108);
    float _124 = fma(_112, -1.5, _108);
    float3 _392 = float3(_116, _118, float(0));
    float3 _396 = select(_392, float3(0.0), isnan(_392));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _396.xy, uint(rint(_396.z)), _106);
    float3 _403 = float3(_120, _118, float(0));
    float3 _405 = select(_403, float3(0.0), isnan(_403));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _405.xy, uint(rint(_405.z)), _106);
    float3 _412 = float3(_122, _118, float(0));
    float3 _414 = select(_412, float3(0.0), isnan(_412));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _414.xy, uint(rint(_414.z)), _106);
    float3 _421 = float3(_124, _118, float(0));
    float3 _423 = select(_421, float3(0.0), isnan(_421));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _423.xy, uint(rint(_423.z)), _106);
    float _134 = fma(_114, 0.5, _110);
    float3 _433 = float3(_116, _134, float(0));
    float3 _435 = select(_433, float3(0.0), isnan(_433));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _435.xy, uint(rint(_435.z)), _106);
    float3 _442 = float3(_120, _134, float(0));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _444.xy, uint(rint(_444.z)), _106);
    float3 _451 = float3(_122, _134, float(0));
    float3 _453 = select(_451, float3(0.0), isnan(_451));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _453.xy, uint(rint(_453.z)), _106);
    float _142 = fma(_114, -0.5, _110);
    float3 _463 = float3(_124, _134, float(0));
    float3 _465 = select(_463, float3(0.0), isnan(_463));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _465.xy, uint(rint(_465.z)), _106);
    float3 _472 = float3(_116, _142, float(0));
    float3 _474 = select(_472, float3(0.0), isnan(_472));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _474.xy, uint(rint(_474.z)), _106);
    float3 _481 = float3(_120, _142, float(0));
    float3 _483 = select(_481, float3(0.0), isnan(_481));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _483.xy, uint(rint(_483.z)), _106);
    float3 _490 = float3(_122, _142, float(0));
    float3 _492 = select(_490, float3(0.0), isnan(_490));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _492.xy, uint(rint(_492.z)), _106);
    float3 _499 = float3(_124, _142, float(0));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _501.xy, uint(rint(_501.z)), _106);
    float _154 = fma(_114, -1.5, _110);
    float3 _511 = float3(_116, _154, float(0));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _513.xy, uint(rint(_513.z)), _106);
    float3 _520 = float3(_120, _154, float(0));
    float3 _522 = select(_520, float3(0.0), isnan(_520));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _522.xy, uint(rint(_522.z)), _106);
    float3 _529 = float3(_122, _154, float(0));
    float3 _531 = select(_529, float3(0.0), isnan(_529));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _531.xy, uint(rint(_531.z)), _106);
    float3 _538 = float3(_124, _154, float(0));
    float3 _540 = select(_538, float3(0.0), isnan(_538));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _540.xy, uint(rint(_540.z)), _106);
    float2 _546 = float2(_46, _48);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float _166 = -_60;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _170 = _166 + _168;
    float _172 = _170 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = _126 + _128;
    float _178 = _176 + _130;
    float _180 = _178 + _132;
    float _182 = _180 + _136;
    float _184 = _182 + _138;
    float _186 = _184 + _140;
    float _188 = _186 + _144;
    float _190 = _188 + _146;
    float _192 = _190 + _148;
    float _194 = _192 + _150;
    float _196 = _194 + _152;
    float _198 = _196 + _156;
    float _200 = _198 + _158;
    float _202 = _200 + _160;
    float _204 = -_60;
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _208 = _204 + _206;
    float _210 = _202 + _162;
    float _212 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_210, 0.0625, _174);
    float _218 = _214 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _164;
    out.m_39.y = _216;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _218;
    return out;
}

