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
    float2 _304 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _76 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _68);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _80 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _76);
    float _86 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _96 = _86 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _100 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _88);
    float _102 = 1.0 / _90;
    float _104 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = _92 * _102;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _96 * _102;
    float _114 = _106 * _102;
    float _116 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _120 = fma(_98, 0.5, _112);
    float _122 = rint(_110);
    float _124 = precise::max(_122, 0.0);
    uint _127 = uint(_124);
    uint _129 = clamp(_127, 0u, 65535u);
    float _131 = fma(_98, 1.5, _112);
    float _133 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _116);
    float _135 = fma(_118, 1.5, _114);
    float _137 = fma(_98, -0.5, _112);
    float _139 = fma(_98, -1.5, _112);
    float _141 = fma(_118, 0.5, _114);
    float _143 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _145 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _143);
    float3 _509 = float3(_131, _135, float(int(_129)));
    float3 _513 = select(_509, float3(0.0), isnan(_509));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _513.xy, uint(rint(_513.z)), 1.0);
    float3 _521 = float3(_120, _135, float(int(_129)));
    float3 _523 = select(_521, float3(0.0), isnan(_521));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _523.xy, uint(rint(_523.z)), 1.0);
    float3 _531 = float3(_137, _135, float(int(_129)));
    float3 _533 = select(_531, float3(0.0), isnan(_531));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _533.xy, uint(rint(_533.z)), 1.0);
    float3 _541 = float3(_139, _135, float(int(_129)));
    float3 _543 = select(_541, float3(0.0), isnan(_541));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _543.xy, uint(rint(_543.z)), 1.0);
    float3 _551 = float3(_120, _141, float(int(_129)));
    float3 _553 = select(_551, float3(0.0), isnan(_551));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _553.xy, uint(rint(_553.z)), 1.0);
    float _157 = _100 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _159 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _145);
    float _161 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _133);
    float _163 = 1.0 / _157;
    float _165 = _159 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _167 = _161 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _169 = fma(_118, -0.5, _114);
    float3 _588 = float3(_137, _141, float(int(_129)));
    float3 _590 = select(_588, float3(0.0), isnan(_588));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _590.xy, uint(rint(_590.z)), 1.0);
    float3 _598 = float3(_131, _141, float(int(_129)));
    float3 _600 = select(_598, float3(0.0), isnan(_598));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _600.xy, uint(rint(_600.z)), 1.0);
    float3 _608 = float3(_139, _141, float(int(_129)));
    float3 _610 = select(_608, float3(0.0), isnan(_608));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _610.xy, uint(rint(_610.z)), 1.0);
    float3 _618 = float3(_131, _169, float(int(_129)));
    float3 _620 = select(_618, float3(0.0), isnan(_618));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _620.xy, uint(rint(_620.z)), 1.0);
    float3 _628 = float3(_120, _169, float(int(_129)));
    float3 _630 = select(_628, float3(0.0), isnan(_628));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _630.xy, uint(rint(_630.z)), 1.0);
    float3 _638 = float3(_137, _169, float(int(_129)));
    float3 _640 = select(_638, float3(0.0), isnan(_638));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _640.xy, uint(rint(_640.z)), 1.0);
    float _183 = _165 * _163;
    float _185 = _167 * _163;
    float _187 = fma(_118, -1.5, _114);
    float2 _654 = float2(_183, _185);
    float2 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_654, float2(0.0), isnan(_654))).xy;
    float _193 = _191.x;
    float _195 = _191.y;
    float3 _669 = float3(_139, _169, float(int(_129)));
    float3 _671 = select(_669, float3(0.0), isnan(_669));
    float _197 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _671.xy, uint(rint(_671.z)), 1.0);
    float3 _679 = float3(_131, _187, float(int(_129)));
    float3 _681 = select(_679, float3(0.0), isnan(_679));
    float _199 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _681.xy, uint(rint(_681.z)), 1.0);
    float3 _689 = float3(_120, _187, float(int(_129)));
    float3 _691 = select(_689, float3(0.0), isnan(_689));
    float _201 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _691.xy, uint(rint(_691.z)), 1.0);
    float3 _699 = float3(_137, _187, float(int(_129)));
    float3 _701 = select(_699, float3(0.0), isnan(_699));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _701.xy, uint(rint(_701.z)), 1.0);
    float3 _709 = float3(_139, _187, float(int(_129)));
    float3 _711 = select(_709, float3(0.0), isnan(_709));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _711.xy, uint(rint(_711.z)), 1.0);
    float _207 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _209 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _207);
    float _211 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _209);
    float _213 = _211 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _215 = precise::min(_213, 1.0);
    float _217 = -_60;
    float _219 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _221 = _217 + _219;
    float _223 = _221 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _147 + _149;
    float _229 = _227 + _151;
    float _231 = _229 + _153;
    float _233 = _231 + _173;
    float _235 = _233 + _155;
    float _237 = _235 + _171;
    float _239 = _237 + _175;
    float _241 = -_193;
    float _243 = fma(_241, _193, _195);
    float _245 = -_193;
    float _247 = _215 + _245;
    float _249 = _239 + _177;
    float _251 = fma(_247, _247, _243);
    float _253 = _249 + _179;
    bool _257 = _247 <= 0.001000000047497451305389404296875;
    float _259 = float(_257);
    float _261 = _253 + _181;
    float _263 = 1.0 / _251;
    float _265 = _261 + _197;
    float _267 = _265 + _199;
    float _269 = _267 + _201;
    float _271 = _243 * _263;
    float _273 = _269 + _203;
    float _275 = -_60;
    float _277 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _279 = _275 + _277;
    float _281 = precise::max(_271, _259);
    float _283 = _273 + _205;
    float _285 = _279 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = precise::min(_281, 1.0);
    float _291 = fma(_283, 0.0625, _287);
    float _293 = _225 + _289;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _291;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _293;
    return out;
}

