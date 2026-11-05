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
    float2 _308 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _100 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = 1.0 / _94;
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _110 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _112 = _104 * _106;
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _100 * _106;
    float _118 = _110 * _106;
    float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _124 = fma(_102, 0.5, _116);
    float _126 = rint(_114);
    float _128 = precise::max(_126, 0.0);
    uint _131 = uint(_128);
    uint _133 = clamp(_131, 0u, 65535u);
    float _135 = fma(_102, 1.5, _116);
    float _137 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _120);
    float _139 = fma(_122, 1.5, _118);
    float _141 = fma(_102, -0.5, _116);
    float _143 = fma(_102, -1.5, _116);
    float _145 = fma(_122, 0.5, _118);
    float _147 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _149 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _147);
    float3 _517 = float3(_135, _139, float(int(_133)));
    float3 _521 = select(_517, float3(0.0), isnan(_517));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _521.xy, uint(rint(_521.z)), 1.0);
    float3 _529 = float3(_124, _139, float(int(_133)));
    float3 _531 = select(_529, float3(0.0), isnan(_529));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _531.xy, uint(rint(_531.z)), 1.0);
    float3 _539 = float3(_141, _139, float(int(_133)));
    float3 _541 = select(_539, float3(0.0), isnan(_539));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _541.xy, uint(rint(_541.z)), 1.0);
    float3 _549 = float3(_143, _139, float(int(_133)));
    float3 _551 = select(_549, float3(0.0), isnan(_549));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _551.xy, uint(rint(_551.z)), 1.0);
    float3 _559 = float3(_124, _145, float(int(_133)));
    float3 _561 = select(_559, float3(0.0), isnan(_559));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _561.xy, uint(rint(_561.z)), 1.0);
    float _161 = _92 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _163 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _149);
    float _165 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _137);
    float _167 = 1.0 / _161;
    float _169 = _163 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _171 = _165 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _173 = fma(_122, -0.5, _118);
    float3 _596 = float3(_141, _145, float(int(_133)));
    float3 _598 = select(_596, float3(0.0), isnan(_596));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _598.xy, uint(rint(_598.z)), 1.0);
    float3 _606 = float3(_135, _145, float(int(_133)));
    float3 _608 = select(_606, float3(0.0), isnan(_606));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _608.xy, uint(rint(_608.z)), 1.0);
    float3 _616 = float3(_143, _145, float(int(_133)));
    float3 _618 = select(_616, float3(0.0), isnan(_616));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _618.xy, uint(rint(_618.z)), 1.0);
    float3 _626 = float3(_135, _173, float(int(_133)));
    float3 _628 = select(_626, float3(0.0), isnan(_626));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _628.xy, uint(rint(_628.z)), 1.0);
    float3 _636 = float3(_124, _173, float(int(_133)));
    float3 _638 = select(_636, float3(0.0), isnan(_636));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _638.xy, uint(rint(_638.z)), 1.0);
    float3 _646 = float3(_141, _173, float(int(_133)));
    float3 _648 = select(_646, float3(0.0), isnan(_646));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _648.xy, uint(rint(_648.z)), 1.0);
    float _187 = _169 * _167;
    float _189 = _171 * _167;
    float _191 = fma(_122, -1.5, _118);
    float2 _662 = float2(_187, _189);
    float2 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_662, float2(0.0), isnan(_662))).xy;
    float _197 = _195.x;
    float _199 = _195.y;
    float3 _677 = float3(_143, _173, float(int(_133)));
    float3 _679 = select(_677, float3(0.0), isnan(_677));
    float _201 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _679.xy, uint(rint(_679.z)), 1.0);
    float3 _687 = float3(_135, _191, float(int(_133)));
    float3 _689 = select(_687, float3(0.0), isnan(_687));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _689.xy, uint(rint(_689.z)), 1.0);
    float3 _697 = float3(_124, _191, float(int(_133)));
    float3 _699 = select(_697, float3(0.0), isnan(_697));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _699.xy, uint(rint(_699.z)), 1.0);
    float3 _707 = float3(_141, _191, float(int(_133)));
    float3 _709 = select(_707, float3(0.0), isnan(_707));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _709.xy, uint(rint(_709.z)), 1.0);
    float3 _717 = float3(_143, _191, float(int(_133)));
    float3 _719 = select(_717, float3(0.0), isnan(_717));
    float _209 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _719.xy, uint(rint(_719.z)), 1.0);
    float _211 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _213 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _211);
    float _215 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _213);
    float _217 = _215 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _219 = precise::min(_217, 1.0);
    float _221 = -_64;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _225 = _221 + _223;
    float _227 = _225 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _151 + _153;
    float _233 = _231 + _155;
    float _235 = _233 + _157;
    float _237 = _235 + _177;
    float _239 = _237 + _159;
    float _241 = _239 + _175;
    float _243 = _241 + _179;
    float _245 = -_197;
    float _247 = fma(_245, _197, _199);
    float _249 = -_197;
    float _251 = _219 + _249;
    float _253 = _243 + _181;
    float _255 = fma(_251, _251, _247);
    float _257 = _253 + _183;
    bool _261 = _251 <= 0.001000000047497451305389404296875;
    float _263 = float(_261);
    float _265 = _257 + _185;
    float _267 = 1.0 / _255;
    float _269 = _265 + _201;
    float _271 = _269 + _203;
    float _273 = _271 + _205;
    float _275 = _247 * _267;
    float _277 = _273 + _207;
    float _279 = -_64;
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _283 = _279 + _281;
    float _285 = precise::max(_275, _263);
    float _287 = _277 + _209;
    float _289 = _283 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = precise::min(_285, 1.0);
    float _295 = fma(_287, 0.0625, _291);
    float _297 = _229 + _293;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _295;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _297;
    return out;
}

