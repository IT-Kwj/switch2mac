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
    float2 _231 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _58 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].z, _56);
    float _60 = _58 * _50;
    float _62 = _58 * _52;
    float _64 = _60 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _66 = _60 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _68 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _64);
    float _70 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _66);
    float _72 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = _60 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[3].z, _68);
    float _78 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[2].z, _70);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _84 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = _78 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _88 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, _80);
    float _90 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _92 = 1.0 / _84;
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _102 = _86 * _92;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _96 * _92;
    float _108 = _98 * _92;
    float _110 = fma(_94, 1.5, _106);
    float _112 = rint(_104);
    float _114 = precise::max(_112, 0.0);
    uint _117 = uint(_114);
    uint _119 = clamp(_117, 0u, 65535u);
    float _121 = fma(_100, 1.5, _108);
    float _123 = fma(_94, 0.5, _106);
    float _125 = fma(_94, -0.5, _106);
    float _127 = fma(_94, -1.5, _106);
    float _129 = fma(_100, 0.5, _108);
    float _131 = fma(_100, -0.5, _108);
    float3 _405 = float3(_110, _121, float(int(_119)));
    float3 _409 = select(_405, float3(0.0), isnan(_405));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _409.xy, uint(rint(_409.z)), 1.0);
    float3 _417 = float3(_123, _121, float(int(_119)));
    float3 _419 = select(_417, float3(0.0), isnan(_417));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _419.xy, uint(rint(_419.z)), 1.0);
    float3 _427 = float3(_125, _121, float(int(_119)));
    float3 _429 = select(_427, float3(0.0), isnan(_427));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _429.xy, uint(rint(_429.z)), 1.0);
    float3 _437 = float3(_127, _121, float(int(_119)));
    float3 _439 = select(_437, float3(0.0), isnan(_437));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _439.xy, uint(rint(_439.z)), 1.0);
    float3 _447 = float3(_110, _129, float(int(_119)));
    float3 _449 = select(_447, float3(0.0), isnan(_447));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _449.xy, uint(rint(_449.z)), 1.0);
    float3 _457 = float3(_123, _129, float(int(_119)));
    float3 _459 = select(_457, float3(0.0), isnan(_457));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _459.xy, uint(rint(_459.z)), 1.0);
    float3 _467 = float3(_125, _129, float(int(_119)));
    float3 _469 = select(_467, float3(0.0), isnan(_467));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _469.xy, uint(rint(_469.z)), 1.0);
    float3 _477 = float3(_127, _129, float(int(_119)));
    float3 _479 = select(_477, float3(0.0), isnan(_477));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _479.xy, uint(rint(_479.z)), 1.0);
    float3 _487 = float3(_110, _131, float(int(_119)));
    float3 _489 = select(_487, float3(0.0), isnan(_487));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _489.xy, uint(rint(_489.z)), 1.0);
    float3 _497 = float3(_123, _131, float(int(_119)));
    float3 _499 = select(_497, float3(0.0), isnan(_497));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _499.xy, uint(rint(_499.z)), 1.0);
    float _153 = fma(_100, -1.5, _108);
    float3 _510 = float3(_125, _131, float(int(_119)));
    float3 _512 = select(_510, float3(0.0), isnan(_510));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _512.xy, uint(rint(_512.z)), 1.0);
    float3 _520 = float3(_127, _131, float(int(_119)));
    float3 _522 = select(_520, float3(0.0), isnan(_520));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _522.xy, uint(rint(_522.z)), 1.0);
    float3 _530 = float3(_110, _153, float(int(_119)));
    float3 _532 = select(_530, float3(0.0), isnan(_530));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _532.xy, uint(rint(_532.z)), 1.0);
    float3 _540 = float3(_123, _153, float(int(_119)));
    float3 _542 = select(_540, float3(0.0), isnan(_540));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _542.xy, uint(rint(_542.z)), 1.0);
    float3 _550 = float3(_125, _153, float(int(_119)));
    float3 _552 = select(_550, float3(0.0), isnan(_550));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _552.xy, uint(rint(_552.z)), 1.0);
    float3 _560 = float3(_127, _153, float(int(_119)));
    float3 _562 = select(_560, float3(0.0), isnan(_560));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _562.xy, uint(rint(_562.z)), 1.0);
    float _167 = -_58;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _171 = _167 + _169;
    float _173 = -_58;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _177 = _173 + _175;
    float _179 = _171 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _177 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _185 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _189 = _133 + _135;
    float _191 = _189 + _137;
    float _193 = _191 + _139;
    float _195 = _193 + _141;
    float _197 = _195 + _143;
    float _199 = _197 + _145;
    float _201 = _199 + _147;
    float _203 = _201 + _149;
    float _205 = _203 + _151;
    float _207 = _205 + _155;
    float _209 = _207 + _157;
    float _211 = _209 + _159;
    float _213 = _211 + _161;
    float _215 = _213 + _163;
    float _217 = _215 + _165;
    float _219 = fma(_217, 0.0625, _181);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _219;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _187;
    return out;
}

