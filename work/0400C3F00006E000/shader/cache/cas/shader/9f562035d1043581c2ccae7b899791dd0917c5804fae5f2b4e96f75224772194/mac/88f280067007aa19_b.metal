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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_32 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _44 = in.m_32.x;
    float _46 = in.m_32.y;
    float2 _235 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_235, float2(0.0), isnan(_235))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _50;
    float _66 = _62 * _52;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _76);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _88 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _96 = 1.0 / _88;
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _106 = _90 * _96;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _100 * _96;
    float _112 = _102 * _96;
    float _114 = fma(_98, 1.5, _110);
    float _116 = rint(_108);
    float _118 = precise::max(_116, 0.0);
    uint _121 = uint(_118);
    uint _123 = clamp(_121, 0u, 65535u);
    float _125 = fma(_104, 1.5, _112);
    float _127 = fma(_98, 0.5, _110);
    float _129 = fma(_98, -0.5, _110);
    float _131 = fma(_98, -1.5, _110);
    float _133 = fma(_104, 0.5, _112);
    float _135 = fma(_104, -0.5, _112);
    float3 _413 = float3(_114, _125, float(int(_123)));
    float3 _417 = select(_413, float3(0.0), isnan(_413));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _417.xy, uint(rint(_417.z)), 1.0);
    float3 _425 = float3(_127, _125, float(int(_123)));
    float3 _427 = select(_425, float3(0.0), isnan(_425));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _427.xy, uint(rint(_427.z)), 1.0);
    float3 _435 = float3(_129, _125, float(int(_123)));
    float3 _437 = select(_435, float3(0.0), isnan(_435));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _437.xy, uint(rint(_437.z)), 1.0);
    float3 _445 = float3(_131, _125, float(int(_123)));
    float3 _447 = select(_445, float3(0.0), isnan(_445));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _447.xy, uint(rint(_447.z)), 1.0);
    float3 _455 = float3(_114, _133, float(int(_123)));
    float3 _457 = select(_455, float3(0.0), isnan(_455));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _457.xy, uint(rint(_457.z)), 1.0);
    float3 _465 = float3(_127, _133, float(int(_123)));
    float3 _467 = select(_465, float3(0.0), isnan(_465));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _467.xy, uint(rint(_467.z)), 1.0);
    float3 _475 = float3(_129, _133, float(int(_123)));
    float3 _477 = select(_475, float3(0.0), isnan(_475));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _477.xy, uint(rint(_477.z)), 1.0);
    float3 _485 = float3(_131, _133, float(int(_123)));
    float3 _487 = select(_485, float3(0.0), isnan(_485));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _487.xy, uint(rint(_487.z)), 1.0);
    float3 _495 = float3(_114, _135, float(int(_123)));
    float3 _497 = select(_495, float3(0.0), isnan(_495));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _497.xy, uint(rint(_497.z)), 1.0);
    float3 _505 = float3(_127, _135, float(int(_123)));
    float3 _507 = select(_505, float3(0.0), isnan(_505));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _507.xy, uint(rint(_507.z)), 1.0);
    float _157 = fma(_104, -1.5, _112);
    float3 _518 = float3(_129, _135, float(int(_123)));
    float3 _520 = select(_518, float3(0.0), isnan(_518));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _520.xy, uint(rint(_520.z)), 1.0);
    float3 _528 = float3(_131, _135, float(int(_123)));
    float3 _530 = select(_528, float3(0.0), isnan(_528));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _530.xy, uint(rint(_530.z)), 1.0);
    float3 _538 = float3(_114, _157, float(int(_123)));
    float3 _540 = select(_538, float3(0.0), isnan(_538));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _540.xy, uint(rint(_540.z)), 1.0);
    float3 _548 = float3(_127, _157, float(int(_123)));
    float3 _550 = select(_548, float3(0.0), isnan(_548));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _550.xy, uint(rint(_550.z)), 1.0);
    float3 _558 = float3(_129, _157, float(int(_123)));
    float3 _560 = select(_558, float3(0.0), isnan(_558));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _560.xy, uint(rint(_560.z)), 1.0);
    float3 _568 = float3(_131, _157, float(int(_123)));
    float3 _570 = select(_568, float3(0.0), isnan(_568));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _570.xy, uint(rint(_570.z)), 1.0);
    float _171 = -_62;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _175 = _171 + _173;
    float _177 = -_62;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _181 = _177 + _179;
    float _183 = _175 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _181 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _189 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _193 = _137 + _139;
    float _195 = _193 + _141;
    float _197 = _195 + _143;
    float _199 = _197 + _145;
    float _201 = _199 + _147;
    float _203 = _201 + _149;
    float _205 = _203 + _151;
    float _207 = _205 + _153;
    float _209 = _207 + _155;
    float _211 = _209 + _159;
    float _213 = _211 + _161;
    float _215 = _213 + _163;
    float _217 = _215 + _165;
    float _219 = _217 + _167;
    float _221 = _219 + _169;
    float _223 = fma(_221, 0.0625, _185);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _223;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _191;
    return out;
}

