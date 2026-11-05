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
    float2 _292 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).x;
    float2 _303 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_303, float2(0.0), isnan(_303))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].z, _70);
    float _74 = _72 * _64;
    float _76 = _72 * _66;
    float _78 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _84 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].x, _78);
    float _86 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].x, _80);
    float _88 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].x, _82);
    float _90 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _92 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _106 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _108 = 1.0 / _98;
    float _110 = _106 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _114 = 1.0 / _110;
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _112);
    float _118 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _116);
    float _120 = _102 * _108;
    float _122 = _118 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _124 = _104 * _108;
    float _126 = fma(_60, 2.0, -1.0);
    float _128 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _130 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _132 = fma(_62, 2.0, -1.0);
    float _134 = _122 * _114;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
    float _140 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
    float _142 = _126 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _144 = _132 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _146 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
    float _148 = rint(_136);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    uint _155 = clamp(_153, 0u, 65535u);
    float _157 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
    float _159 = fma(_142, 2.0, _50);
    float _161 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _163 = _157 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _165 = _161 * _114;
    float _167 = _163 * _114;
    float _169 = fma(_144, 2.0, _52);
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _173 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _171, _165);
    float _175 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _165);
    float _177 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _167);
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _181 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _179, _167);
    float3 _556 = float3(_165, _177, float(int(_155)));
    float3 _560 = select(_556, float3(0.0), isnan(_556));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _560.xy, uint(rint(_560.z)), 1.0);
    float3 _568 = float3(_175, _177, float(int(_155)));
    float3 _570 = select(_568, float3(0.0), isnan(_568));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _570.xy, uint(rint(_570.z)), 1.0);
    float3 _578 = float3(_173, _177, float(int(_155)));
    float3 _580 = select(_578, float3(0.0), isnan(_578));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _580.xy, uint(rint(_580.z)), 1.0);
    float3 _588 = float3(_175, _167, float(int(_155)));
    float3 _590 = select(_588, float3(0.0), isnan(_588));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _590.xy, uint(rint(_590.z)), 1.0);
    float3 _598 = float3(_165, _167, float(int(_155)));
    float3 _600 = select(_598, float3(0.0), isnan(_598));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _600.xy, uint(rint(_600.z)), 1.0);
    float2 _605 = float2(_120, _124);
    float2 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_605, float2(0.0), isnan(_605))).xy;
    float _195 = _193.x;
    float _197 = _193.y;
    float3 _620 = float3(_173, _167, float(int(_155)));
    float3 _622 = select(_620, float3(0.0), isnan(_620));
    float _199 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _622.xy, uint(rint(_622.z)), 1.0);
    float3 _630 = float3(_175, _181, float(int(_155)));
    float3 _632 = select(_630, float3(0.0), isnan(_630));
    float _201 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _632.xy, uint(rint(_632.z)), 1.0);
    float3 _640 = float3(_165, _181, float(int(_155)));
    float3 _642 = select(_640, float3(0.0), isnan(_640));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _642.xy, uint(rint(_642.z)), 1.0);
    float3 _650 = float3(_173, _181, float(int(_155)));
    float3 _652 = select(_650, float3(0.0), isnan(_650));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _652.xy, uint(rint(_652.z)), 1.0);
    float2 _657 = float2(_159, _169);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_657, float2(0.0), isnan(_657))).x;
    float _209 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _211 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].x, _209);
    float _213 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].z, _211);
    float _215 = _213 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _217 = precise::min(_215, 1.0);
    float _219 = -_72;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _223 = _219 + _221;
    float _225 = -_72;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _229 = _225 + _227;
    float _231 = _223 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _229 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _185 + _183;
    float _241 = _239 + _187;
    float _243 = -_195;
    float _245 = fma(_243, _195, _197);
    float _247 = -_195;
    float _249 = _217 + _247;
    float _251 = _241 + _189;
    float _253 = fma(_249, _249, _245);
    float _255 = _251 + _191;
    bool _259 = _249 <= 0.001000000047497451305389404296875;
    float _261 = float(_259);
    float _263 = 1.0 / _253;
    float _265 = _255 + _199;
    float _267 = _265 + _201;
    float _269 = _245 * _263;
    float _271 = _267 + _203;
    float _273 = precise::max(_269, _261);
    float _275 = _271 + _205;
    float _277 = precise::min(_273, 1.0);
    float _279 = fma(_275, 0.111111111938953399658203125, _233);
    float _281 = _237 + _277;
    out.m_43.x = _207;
    out.m_43.y = _279;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _281;
    return out;
}

