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
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
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
    float2 _291 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291))).x;
    float2 _302 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_302, float2(0.0), isnan(_302))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _72 = -_54;
    float _74 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _76 = 1.0 / _74;
    float _78 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _80 = _76 * _78;
    float _82 = _80 * _64;
    float _84 = _80 * _66;
    float _86 = _82 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _88 = _82 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _90 = _82 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _92 = _82 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _94 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[15].x, _86);
    float _96 = _82 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _98 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[13].x, _90);
    float _100 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[12].x, _92);
    float _102 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].z, _94);
    float _104 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _106 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].z, _98);
    float _108 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].z, _100);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _112 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[3].x, _88);
    float _114 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _118 = 1.0 / _110;
    float _120 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].z, _112);
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _124 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[0].x, _96);
    float _126 = _106 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _128 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
    float _130 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[2].x, _104);
    float _132 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
    float _134 = 1.0 / _122;
    float _136 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
    float _138 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _142 = _116 * _118;
    float _144 = _126 * _118;
    float _146 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _148 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _150 = fma(_62, 2.0, -1.0);
    float _152 = fma(_60, 2.0, -1.0);
    float _154 = _140 * _134;
    float _156 = _146 * _134;
    float _158 = _148 * _134;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = _150 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _164 = _152 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _166 = fma(_160, _68, _154);
    float _168 = fma(_160, _70, _156);
    float3 _531 = float3(_166, _168, float(0));
    float3 _535 = select(_531, float3(0.0), isnan(_531));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _535.xy, uint(rint(_535.z)), _160);
    float _172 = -_70;
    float _174 = fma(_160, _172, _156);
    float _176 = fma(_162, 2.0, _52);
    float _178 = fma(_164, 2.0, _50);
    float _180 = -_68;
    float _182 = fma(_160, _180, _154);
    float3 _560 = float3(_154, _168, float(0));
    float3 _562 = select(_560, float3(0.0), isnan(_560));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _562.xy, uint(rint(_562.z)), _160);
    float3 _569 = float3(_182, _168, float(0));
    float3 _571 = select(_569, float3(0.0), isnan(_569));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _571.xy, uint(rint(_571.z)), _160);
    float3 _578 = float3(_166, _156, float(0));
    float3 _580 = select(_578, float3(0.0), isnan(_578));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _580.xy, uint(rint(_580.z)), _160);
    float3 _587 = float3(_154, _156, float(0));
    float3 _589 = select(_587, float3(0.0), isnan(_587));
    float _190 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _589.xy, uint(rint(_589.z)), _160);
    float2 _595 = float2(_142, _144);
    float2 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_595, float2(0.0), isnan(_595))).xy;
    float _194 = _192.x;
    float _196 = _192.y;
    float3 _608 = float3(_182, _156, float(0));
    float3 _610 = select(_608, float3(0.0), isnan(_608));
    float _198 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _610.xy, uint(rint(_610.z)), _160);
    float3 _617 = float3(_166, _174, float(0));
    float3 _619 = select(_617, float3(0.0), isnan(_617));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _619.xy, uint(rint(_619.z)), _160);
    float3 _626 = float3(_154, _174, float(0));
    float3 _628 = select(_626, float3(0.0), isnan(_626));
    float _202 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _628.xy, uint(rint(_628.z)), _160);
    float3 _635 = float3(_182, _174, float(0));
    float3 _637 = select(_635, float3(0.0), isnan(_635));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _637.xy, uint(rint(_637.z)), _160);
    float2 _643 = float2(_178, _176);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_643, float2(0.0), isnan(_643))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_643, float2(0.0), isnan(_643))).x;
    float _208 = _82 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _210 = -_80;
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _214 = _210 + _212;
    float _216 = -_80;
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _220 = _216 + _218;
    float _222 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[14].x, _208);
    float _224 = _214 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].z, _222);
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _236 = precise::min(_234, 1.0);
    float _238 = _170 + _184;
    float _240 = -_194;
    float _242 = fma(_240, _194, _196);
    float _244 = -_194;
    float _246 = _236 + _244;
    float _248 = _238 + _186;
    float _250 = fma(_246, _246, _242);
    float _252 = _248 + _188;
    bool _256 = _246 <= 0.001000000047497451305389404296875;
    float _258 = float(_256);
    float _260 = 1.0 / _250;
    float _262 = _252 + _190;
    float _264 = _262 + _198;
    float _266 = _264 + _200;
    float _268 = _242 * _260;
    float _270 = _266 + _202;
    float _272 = precise::max(_268, _258);
    float _274 = _270 + _204;
    float _276 = precise::min(_272, 1.0);
    float _278 = fma(_274, 0.111111111938953399658203125, _226);
    float _280 = _230 + _276;
    out.m_43.x = _206;
    out.m_43.y = _278;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _280;
    return out;
}

