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
    float2 _267 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).x;
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
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _70);
    float _80 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _74);
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _78);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _80);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _88);
    float _98 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _102 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _82);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = 1.0 / _94;
    float _108 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _98);
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _112 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _114 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _92);
    float _116 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _118 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _120 = _110 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _122 = 1.0 / _104;
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _126 = _112 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _130 = _118 * _106;
    float _132 = _124 * _106;
    float _134 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _136 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _138 = _120 * _122;
    float _140 = _126 * _122;
    float _142 = _128 * _122;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = fma(_144, _134, _138);
    float _148 = -_134;
    float _150 = fma(_144, _148, _138);
    float _152 = fma(_144, _136, _140);
    float _154 = -_136;
    float _156 = fma(_144, _154, _140);
    float3 _492 = float3(_146, _152, float(0));
    float3 _496 = select(_492, float3(0.0), isnan(_492));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _496.xy, uint(rint(_496.z)), _144);
    float3 _503 = float3(_138, _152, float(0));
    float3 _505 = select(_503, float3(0.0), isnan(_503));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _505.xy, uint(rint(_505.z)), _144);
    float3 _512 = float3(_150, _152, float(0));
    float3 _514 = select(_512, float3(0.0), isnan(_512));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _514.xy, uint(rint(_514.z)), _144);
    float3 _521 = float3(_146, _140, float(0));
    float3 _523 = select(_521, float3(0.0), isnan(_521));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _523.xy, uint(rint(_523.z)), _144);
    float2 _529 = float2(_132, _130);
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_529, float2(0.0), isnan(_529))).xy;
    float _170 = _168.x;
    float _172 = _168.y;
    float3 _542 = float3(_138, _140, float(0));
    float3 _544 = select(_542, float3(0.0), isnan(_542));
    float _174 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _544.xy, uint(rint(_544.z)), _144);
    float3 _551 = float3(_150, _140, float(0));
    float3 _553 = select(_551, float3(0.0), isnan(_551));
    float _176 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _553.xy, uint(rint(_553.z)), _144);
    float3 _560 = float3(_146, _156, float(0));
    float3 _562 = select(_560, float3(0.0), isnan(_560));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _562.xy, uint(rint(_562.z)), _144);
    float3 _569 = float3(_138, _156, float(0));
    float3 _571 = select(_569, float3(0.0), isnan(_569));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _571.xy, uint(rint(_571.z)), _144);
    float3 _578 = float3(_150, _156, float(0));
    float3 _580 = select(_578, float3(0.0), isnan(_578));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _580.xy, uint(rint(_580.z)), _144);
    float _184 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _184);
    float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _186);
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _192 = -_64;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _196 = _192 + _194;
    float _198 = _196 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _158 + _160;
    float _204 = _202 + _162;
    float _206 = precise::min(_190, 1.0);
    float _208 = -_170;
    float _210 = fma(_208, _170, _172);
    float _212 = -_170;
    float _214 = _206 + _212;
    float _216 = _204 + _164;
    float _218 = -_64;
    float _220 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _222 = _218 + _220;
    float _224 = fma(_214, _214, _210);
    float _226 = _216 + _174;
    bool _230 = _214 <= 0.001000000047497451305389404296875;
    float _232 = float(_230);
    float _234 = _222 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = 1.0 / _224;
    float _240 = _226 + _176;
    float _242 = _240 + _178;
    float _244 = _242 + _180;
    float _246 = _210 * _238;
    float _248 = precise::max(_246, _232);
    float _250 = _244 + _182;
    float _252 = precise::min(_248, 1.0);
    float _254 = fma(_250, 0.111111111938953399658203125, _236);
    float _256 = _200 + _252;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _254;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _256;
    return out;
}

