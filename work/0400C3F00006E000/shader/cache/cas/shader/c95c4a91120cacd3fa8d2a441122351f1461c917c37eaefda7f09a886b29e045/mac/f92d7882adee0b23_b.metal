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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _263 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _66);
    float _76 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _68);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _74);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _88 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _78);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _94 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _98 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _80);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _102 = 1.0 / _90;
    float _104 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _108 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _110 = _88 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _112 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _114 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _106);
    float _116 = _98 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _118 = 1.0 / _100;
    float _120 = _108 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _122 = _112 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _110 * _102;
    float _128 = _120 * _102;
    float _130 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _132 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _134 = _116 * _118;
    float _136 = _122 * _118;
    float _138 = _124 * _118;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = fma(_140, _130, _134);
    float _144 = -_130;
    float _146 = fma(_140, _144, _134);
    float _148 = fma(_140, _132, _136);
    float _150 = -_132;
    float _152 = fma(_140, _150, _136);
    float3 _484 = float3(_142, _148, float(0));
    float3 _488 = select(_484, float3(0.0), isnan(_484));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _488.xy, uint(rint(_488.z)), _140);
    float3 _495 = float3(_134, _148, float(0));
    float3 _497 = select(_495, float3(0.0), isnan(_495));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _497.xy, uint(rint(_497.z)), _140);
    float3 _504 = float3(_146, _148, float(0));
    float3 _506 = select(_504, float3(0.0), isnan(_504));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _506.xy, uint(rint(_506.z)), _140);
    float3 _513 = float3(_142, _136, float(0));
    float3 _515 = select(_513, float3(0.0), isnan(_513));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _515.xy, uint(rint(_515.z)), _140);
    float2 _521 = float2(_128, _126);
    float2 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_521, float2(0.0), isnan(_521))).xy;
    float _166 = _164.x;
    float _168 = _164.y;
    float3 _534 = float3(_134, _136, float(0));
    float3 _536 = select(_534, float3(0.0), isnan(_534));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _536.xy, uint(rint(_536.z)), _140);
    float3 _543 = float3(_146, _136, float(0));
    float3 _545 = select(_543, float3(0.0), isnan(_543));
    float _172 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _545.xy, uint(rint(_545.z)), _140);
    float3 _552 = float3(_142, _152, float(0));
    float3 _554 = select(_552, float3(0.0), isnan(_552));
    float _174 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _554.xy, uint(rint(_554.z)), _140);
    float3 _561 = float3(_134, _152, float(0));
    float3 _563 = select(_561, float3(0.0), isnan(_561));
    float _176 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _563.xy, uint(rint(_563.z)), _140);
    float3 _570 = float3(_146, _152, float(0));
    float3 _572 = select(_570, float3(0.0), isnan(_570));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _572.xy, uint(rint(_572.z)), _140);
    float _180 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _180);
    float _184 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _182);
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _188 = -_60;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _192 = _188 + _190;
    float _194 = _192 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _154 + _156;
    float _200 = _198 + _158;
    float _202 = precise::min(_186, 1.0);
    float _204 = -_166;
    float _206 = fma(_204, _166, _168);
    float _208 = -_166;
    float _210 = _202 + _208;
    float _212 = _200 + _160;
    float _214 = -_60;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _218 = _214 + _216;
    float _220 = fma(_210, _210, _206);
    float _222 = _212 + _170;
    bool _226 = _210 <= 0.001000000047497451305389404296875;
    float _228 = float(_226);
    float _230 = _218 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = 1.0 / _220;
    float _236 = _222 + _172;
    float _238 = _236 + _174;
    float _240 = _238 + _176;
    float _242 = _206 * _234;
    float _244 = precise::max(_242, _228);
    float _246 = _240 + _178;
    float _248 = precise::min(_244, 1.0);
    float _250 = fma(_246, 0.111111111938953399658203125, _232);
    float _252 = _196 + _248;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _250;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _252;
    return out;
}

