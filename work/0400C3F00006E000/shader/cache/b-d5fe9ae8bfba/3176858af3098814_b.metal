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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
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
    float2 _308 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _82 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _94 = 1.0 / _86;
    float _96 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _110 = _98 * _94;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _102 * _94;
    float _116 = _104 * _94;
    float _118 = fma(_108, 0.5, _114);
    float _120 = rint(_112);
    float _122 = precise::max(_120, 0.0);
    uint _125 = uint(_122);
    uint _127 = clamp(_125, 0u, 65535u);
    float _129 = fma(_108, 1.5, _114);
    float _131 = fma(_108, -0.5, _114);
    float _133 = fma(_108, -1.5, _114);
    float _135 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _137 = fma(_106, 1.5, _116);
    float _139 = fma(_106, 0.5, _116);
    float _141 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _135);
    float3 _498 = float3(_129, _137, float(int(_127)));
    float3 _502 = select(_498, float3(0.0), isnan(_498));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _502.xy, uint(rint(_502.z)), 1.0);
    float3 _510 = float3(_118, _137, float(int(_127)));
    float3 _512 = select(_510, float3(0.0), isnan(_510));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _512.xy, uint(rint(_512.z)), 1.0);
    float3 _520 = float3(_131, _137, float(int(_127)));
    float3 _522 = select(_520, float3(0.0), isnan(_520));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _522.xy, uint(rint(_522.z)), 1.0);
    float3 _530 = float3(_133, _137, float(int(_127)));
    float3 _532 = select(_530, float3(0.0), isnan(_530));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _532.xy, uint(rint(_532.z)), 1.0);
    float3 _540 = float3(_118, _139, float(int(_127)));
    float3 _542 = select(_540, float3(0.0), isnan(_540));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _542.xy, uint(rint(_542.z)), 1.0);
    float3 _550 = float3(_131, _139, float(int(_127)));
    float3 _552 = select(_550, float3(0.0), isnan(_550));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _552.xy, uint(rint(_552.z)), 1.0);
    float _155 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _141);
    float _157 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _159 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _74);
    float _161 = fma(_106, -0.5, _116);
    float _163 = _155 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _165 = fma(_106, -1.5, _116);
    float _167 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _157);
    float _169 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _159);
    float _171 = 1.0 / _163;
    float3 _597 = float3(_129, _139, float(int(_127)));
    float3 _599 = select(_597, float3(0.0), isnan(_597));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _599.xy, uint(rint(_599.z)), 1.0);
    float3 _607 = float3(_133, _139, float(int(_127)));
    float3 _609 = select(_607, float3(0.0), isnan(_607));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _609.xy, uint(rint(_609.z)), 1.0);
    float _177 = _167 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _179 = _169 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _625 = float3(_118, _161, float(int(_127)));
    float3 _627 = select(_625, float3(0.0), isnan(_625));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _627.xy, uint(rint(_627.z)), 1.0);
    float3 _635 = float3(_129, _161, float(int(_127)));
    float3 _637 = select(_635, float3(0.0), isnan(_635));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _637.xy, uint(rint(_637.z)), 1.0);
    float3 _645 = float3(_131, _161, float(int(_127)));
    float3 _647 = select(_645, float3(0.0), isnan(_645));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _647.xy, uint(rint(_647.z)), 1.0);
    float3 _655 = float3(_133, _161, float(int(_127)));
    float3 _657 = select(_655, float3(0.0), isnan(_655));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _657.xy, uint(rint(_657.z)), 1.0);
    float _189 = _177 * _171;
    float _191 = _179 * _171;
    float2 _668 = float2(_189, _191);
    float2 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_668, float2(0.0), isnan(_668))).xy;
    float _197 = _195.x;
    float _199 = _195.y;
    float3 _683 = float3(_129, _165, float(int(_127)));
    float3 _685 = select(_683, float3(0.0), isnan(_683));
    float _201 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _685.xy, uint(rint(_685.z)), 1.0);
    float3 _693 = float3(_118, _165, float(int(_127)));
    float3 _695 = select(_693, float3(0.0), isnan(_693));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _695.xy, uint(rint(_695.z)), 1.0);
    float3 _703 = float3(_131, _165, float(int(_127)));
    float3 _705 = select(_703, float3(0.0), isnan(_703));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _705.xy, uint(rint(_705.z)), 1.0);
    float3 _713 = float3(_133, _165, float(int(_127)));
    float3 _715 = select(_713, float3(0.0), isnan(_713));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _715.xy, uint(rint(_715.z)), 1.0);
    float2 _720 = float2(_48, _50);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_720, float2(0.0), isnan(_720))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_720, float2(0.0), isnan(_720))).x;
    float _211 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _213 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _211);
    float _215 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _213);
    float _217 = _215 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _219 = precise::min(_217, 1.0);
    float _221 = -_62;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _225 = _221 + _223;
    float _227 = _225 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _143 + _145;
    float _233 = _231 + _147;
    float _235 = _233 + _149;
    float _237 = _235 + _173;
    float _239 = _237 + _151;
    float _241 = _239 + _153;
    float _243 = _241 + _175;
    float _245 = _243 + _183;
    float _247 = -_197;
    float _249 = fma(_247, _197, _199);
    float _251 = -_197;
    float _253 = _219 + _251;
    float _255 = _245 + _181;
    float _257 = fma(_253, _253, _249);
    float _259 = _255 + _185;
    bool _263 = _253 <= 0.001000000047497451305389404296875;
    float _265 = float(_263);
    float _267 = 1.0 / _257;
    float _269 = _259 + _187;
    float _271 = _269 + _201;
    float _273 = _271 + _203;
    float _275 = _273 + _205;
    float _277 = -_62;
    float _279 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _281 = _277 + _279;
    float _283 = _249 * _267;
    float _285 = _275 + _207;
    float _287 = _281 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = precise::max(_283, _265);
    float _293 = fma(_285, 0.0625, _229);
    float _295 = precise::min(_291, 1.0);
    float _297 = _289 + _295;
    out.m_41.x = _209;
    out.m_41.y = _293;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _297;
    return out;
}

