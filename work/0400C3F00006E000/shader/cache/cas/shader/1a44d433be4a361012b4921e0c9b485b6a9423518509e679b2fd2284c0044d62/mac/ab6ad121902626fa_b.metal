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
    float2 _219 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).x;
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
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _70);
    float _80 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _74);
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _78);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _88);
    float _98 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _102 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _82);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = 1.0 / _94;
    float _108 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _98);
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _84);
    float _112 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _114 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _116 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _118 = _102 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _120 = _110 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _122 = 1.0 / _104;
    float _124 = _112 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _126 = _114 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _130 = _118 * _106;
    float _132 = _120 * _106;
    float _134 = _124 * _122;
    float _136 = _126 * _122;
    float _138 = _128 * _122;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float2 _410 = float2(_130, _132);
    float2 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_410, float2(0.0), isnan(_410))).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float3 _424 = float3(_134, _136, float(0));
    float3 _428 = select(_424, float3(0.0), isnan(_424));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _428.xy, uint(rint(_428.z)), _140);
    float _152 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _154 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _152);
    float _156 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _154);
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _160 = precise::min(_158, 1.0);
    float _162 = -_64;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _166 = _162 + _164;
    float _168 = -_146;
    float _170 = fma(_168, _146, _148);
    float _172 = -_146;
    float _174 = _160 + _172;
    float _176 = -_64;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _180 = _176 + _178;
    float _182 = fma(_174, _174, _170);
    bool _186 = _174 <= 0.001000000047497451305389404296875;
    float _188 = float(_186);
    float _190 = _180 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _166 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = 1.0 / _182;
    float _200 = _192 + _150;
    float _202 = _170 * _198;
    float _204 = precise::max(_202, _188);
    float _206 = precise::min(_204, 1.0);
    float _208 = _196 + _206;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _200;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _208;
    return out;
}

