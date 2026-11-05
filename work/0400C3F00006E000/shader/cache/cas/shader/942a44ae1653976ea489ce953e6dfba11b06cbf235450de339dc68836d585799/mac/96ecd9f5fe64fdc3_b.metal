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
    float2 _251 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_251, float2(0.0), isnan(_251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_251, float2(0.0), isnan(_251))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _82 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _74);
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _88 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _90 = 1.0 / _78;
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _96 * _90;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _98 * _90;
    float _110 = _102 * _90;
    float _112 = _106 * _86;
    float _114 = fma(_112, 1.5, _108);
    float _116 = fma(_112, 0.5, _108);
    float _118 = fma(_112, -0.5, _108);
    float _120 = fma(_112, -1.5, _108);
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _124 = _106 * _122;
    float _126 = fma(_124, 1.5, _110);
    float _128 = fma(_124, 0.5, _110);
    float3 _416 = float3(_114, _126, float(0));
    float3 _420 = select(_416, float3(0.0), isnan(_416));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _420.xy, uint(rint(_420.z)), _106);
    float3 _427 = float3(_116, _126, float(0));
    float3 _429 = select(_427, float3(0.0), isnan(_427));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _429.xy, uint(rint(_429.z)), _106);
    float3 _436 = float3(_118, _126, float(0));
    float3 _438 = select(_436, float3(0.0), isnan(_436));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _438.xy, uint(rint(_438.z)), _106);
    float3 _445 = float3(_120, _126, float(0));
    float3 _447 = select(_445, float3(0.0), isnan(_445));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _447.xy, uint(rint(_447.z)), _106);
    float3 _454 = float3(_114, _128, float(0));
    float3 _456 = select(_454, float3(0.0), isnan(_454));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _456.xy, uint(rint(_456.z)), _106);
    float3 _463 = float3(_116, _128, float(0));
    float3 _465 = select(_463, float3(0.0), isnan(_463));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _465.xy, uint(rint(_465.z)), _106);
    float _142 = fma(_124, -0.5, _110);
    float _144 = fma(_124, -1.5, _110);
    float3 _478 = float3(_118, _128, float(0));
    float3 _480 = select(_478, float3(0.0), isnan(_478));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _480.xy, uint(rint(_480.z)), _106);
    float2 _486 = float2(_48, _50);
    float2 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_486, float2(0.0), isnan(_486))).xy;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _130 + _132;
    float _158 = _156 + _134;
    float _160 = _158 + _136;
    float _162 = _160 + _138;
    float3 _511 = float3(_120, _128, float(0));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _513.xy, uint(rint(_513.z)), _106);
    float3 _520 = float3(_114, _142, float(0));
    float3 _522 = select(_520, float3(0.0), isnan(_520));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _522.xy, uint(rint(_522.z)), _106);
    float3 _529 = float3(_116, _142, float(0));
    float3 _531 = select(_529, float3(0.0), isnan(_529));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _531.xy, uint(rint(_531.z)), _106);
    float3 _538 = float3(_118, _142, float(0));
    float3 _540 = select(_538, float3(0.0), isnan(_538));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _540.xy, uint(rint(_540.z)), _106);
    float _172 = fma(_154, 2.0, -1.0);
    float _174 = _162 + _140;
    float _176 = fma(_152, 2.0, -1.0);
    float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _180 = _174 + _146;
    float _182 = _176 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _184 = fma(_178, 2.0, _50);
    float _186 = fma(_182, 2.0, _48);
    float3 _574 = float3(_120, _142, float(0));
    float3 _576 = select(_574, float3(0.0), isnan(_574));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _576.xy, uint(rint(_576.z)), _106);
    float3 _583 = float3(_114, _144, float(0));
    float3 _585 = select(_583, float3(0.0), isnan(_583));
    float _190 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _585.xy, uint(rint(_585.z)), _106);
    float3 _592 = float3(_116, _144, float(0));
    float3 _594 = select(_592, float3(0.0), isnan(_592));
    float _192 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _594.xy, uint(rint(_594.z)), _106);
    float3 _601 = float3(_118, _144, float(0));
    float3 _603 = select(_601, float3(0.0), isnan(_601));
    float _194 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _603.xy, uint(rint(_603.z)), _106);
    float3 _610 = float3(_120, _144, float(0));
    float3 _612 = select(_610, float3(0.0), isnan(_610));
    float _196 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _612.xy, uint(rint(_612.z)), _106);
    float2 _618 = float2(_186, _184);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float _200 = -_62;
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _204 = _200 + _202;
    float _206 = -_62;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _210 = _206 + _208;
    float _212 = _204 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _218 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _222 = _180 + _164;
    float _224 = _222 + _166;
    float _226 = _224 + _168;
    float _228 = _226 + _170;
    float _230 = _228 + _188;
    float _232 = _230 + _190;
    float _234 = _232 + _192;
    float _236 = _234 + _194;
    float _238 = _236 + _196;
    float _240 = fma(_238, 0.0625, _214);
    out.m_41.x = _198;
    out.m_41.y = _240;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _220;
    return out;
}

