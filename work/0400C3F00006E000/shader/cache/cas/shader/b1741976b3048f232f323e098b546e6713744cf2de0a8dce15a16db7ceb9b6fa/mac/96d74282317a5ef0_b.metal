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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _269 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_269, float2(0.0), isnan(_269))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_269, float2(0.0), isnan(_269))).x;
    float2 _280 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_280, float2(0.0), isnan(_280))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _72 = 1.0 / _70;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _76 = _72 * _74;
    float _78 = _76 * _64;
    float _80 = _76 * _66;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _88 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _90 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _82);
    float _92 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _84);
    float _94 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _86);
    float _96 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _90);
    float _100 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _102 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _92);
    float _104 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _94);
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _108 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _100);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _114 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _108);
    float _118 = 1.0 / _106;
    float _120 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
    float _122 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _88);
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _126 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _128 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _114);
    float _130 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _120);
    float _132 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
    float _134 = 1.0 / _110;
    float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _140 = _124 * _118;
    float _142 = _126 * _118;
    float _144 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _461 = float2(_140, _142);
    float2 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_461, float2(0.0), isnan(_461))).xy;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _136 * _134;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _138 * _134;
    float _158 = fma(_60, 2.0, -1.0);
    float _160 = fma(_62, 2.0, -1.0);
    float _162 = _154 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _164 = _144 * _134;
    float _166 = _158 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _168 = _160 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _170 = _162 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _172 = _162 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _174 = fma(_166, 2.0, _50);
    float _176 = fma(_170, 0.5, _156);
    float _178 = fma(_170, -0.5, _156);
    float _180 = fma(_172, 0.5, _164);
    float _182 = fma(_172, -0.5, _164);
    float _184 = fma(_168, 2.0, _52);
    float3 _535 = float3(_176, _180, float(0));
    float3 _539 = select(_535, float3(0.0), isnan(_535));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _539.xy, uint(rint(_539.z)), _154);
    float3 _546 = float3(_178, _180, float(0));
    float3 _548 = select(_546, float3(0.0), isnan(_546));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _548.xy, uint(rint(_548.z)), _154);
    float3 _555 = float3(_176, _182, float(0));
    float3 _557 = select(_555, float3(0.0), isnan(_555));
    float _190 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _557.xy, uint(rint(_557.z)), _154);
    float3 _564 = float3(_178, _182, float(0));
    float3 _566 = select(_564, float3(0.0), isnan(_564));
    float _192 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _566.xy, uint(rint(_566.z)), _154);
    float2 _572 = float2(_174, _184);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_572, float2(0.0), isnan(_572))).x;
    float _196 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _198 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _196);
    float _200 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _198);
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _204 = precise::min(_202, 1.0);
    float _206 = -_76;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _210 = _206 + _208;
    float _212 = -_76;
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _216 = _212 + _214;
    float _218 = _210 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = -_148;
    float _228 = fma(_226, _148, _150);
    float _230 = -_148;
    float _232 = _204 + _230;
    float _234 = fma(_232, _232, _228);
    bool _238 = _232 <= 0.001000000047497451305389404296875;
    float _240 = float(_238);
    float _242 = 1.0 / _234;
    float _244 = _186 + _188;
    float _246 = _228 * _242;
    float _248 = _244 + _190;
    float _250 = precise::max(_246, _240);
    float _252 = _248 + _192;
    float _254 = precise::min(_250, 1.0);
    float _256 = fma(_252, 0.25, _220);
    float _258 = _224 + _254;
    out.m_43.x = _194;
    out.m_43.y = _256;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _258;
    return out;
}

