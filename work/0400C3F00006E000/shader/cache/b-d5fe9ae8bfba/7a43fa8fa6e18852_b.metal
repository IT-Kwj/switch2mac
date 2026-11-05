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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _284 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_284, float2(0.0), isnan(_284))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_284, float2(0.0), isnan(_284))).x;
    float _58 = in.m_38.w;
    float _60 = in.m_38.y;
    float _62 = in.m_38.x;
    float _64 = in.m_38.z;
    float _66 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _68 = -_66;
    float _70 = fma(_68, _58, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _72 = -_66;
    float _74 = fma(_72, _60, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _76 = -_66;
    float _78 = fma(_76, _62, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _80 = -_66;
    float _82 = fma(_80, _64, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _84 = 1.0 / _70;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c4)._m0[17].y, _74);
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c4)._m0[17].x, _78);
    float _90 = -_70;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c4)._m0[17].x, _78);
    float _94 = -_70;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c4)._m0[17].y, _74);
    float2 _373 = float2(_52, _54);
    float3 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_373, float2(0.0), isnan(_373))).xyz;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _86 * _84;
    float _110 = _88 * _84;
    float _112 = _92 * _84;
    float _114 = _96 * _84;
    float _116 = _82 * _84;
    float2 _402 = float2(_110, _108);
    float _118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402)), _116);
    float2 _410 = float2(_112, _108);
    float _120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410)), _116);
    float2 _418 = float2(_110, _114);
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418)), _116);
    float2 _426 = float2(_112, _114);
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), _116);
    float _126 = in.m_40.w;
    float _128 = in.m_40.x;
    float _130 = in.m_40.y;
    float _132 = -_66;
    float _134 = fma(_132, _126, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _136 = in.m_42.x;
    float _138 = -_66;
    float _140 = fma(_138, _128, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _142 = -_134;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _146 = in.m_42.y;
    bool _150 = _144 <= 1.0;
    bool _152 = isnan(_144);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = float(_158);
    float _162 = _144 * _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = in.m_42.z;
    float _168 = abs(_164);
    float _170 = log2(_168);
    float _172 = -_66;
    float _174 = fma(_172, _130, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _176 = -_66;
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _180 = fma(_176, _136, _178);
    float _182 = _170 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _184 = -_66;
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _188 = fma(_184, _146, _186);
    float _190 = precise::min(_140, _174);
    float _192 = precise::max(_140, _174);
    float _194 = _188 * _188;
    float _196 = exp2(_182);
    bool _198 = _190 >= 0.0;
    bool _200 = isnan(_190);
    bool _202 = _198 || _200;
    bool _204 = isnan(0.0);
    bool _206 = _202 || _204;
    float _208 = fma(_180, _180, _194);
    float _210 = -_66;
    float _212 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _214 = fma(_210, _166, _212);
    bool _216 = _134 >= _192;
    bool _218 = isnan(_134);
    bool _220 = _216 || _218;
    bool _222 = isnan(_192);
    bool _224 = _220 || _222;
    bool _226 = _224 && _206;
    float _228 = float(_226);
    float _230 = fma(_214, _214, _208);
    float _232 = rsqrt(_230);
    float _234 = _228 * _196;
    float _236 = fma(_104, 2.0, -1.0);
    float _238 = fma(_102, 2.0, -1.0);
    float _240 = fma(_106, 2.0, -1.0);
    float _242 = _236 * _188;
    float _244 = fma(_238, _180, _242);
    float _246 = fma(_240, _214, _244);
    float _248 = _118 + _120;
    float _250 = -_232;
    float _252 = fma(_250, _246, 0.0);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _248 + _122;
    float _258 = _256 + _124;
    float _260 = _258 * _234;
    float _262 = _260 * 0.25;
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _266 = _264 * _254;
    float _268 = _266 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _270 = _266 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _272 = _266 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_45.x = _268;
    out.m_45.y = _270;
    out.m_45.z = _272;
    out.m_45.w = 0.0;
    return out;
}

