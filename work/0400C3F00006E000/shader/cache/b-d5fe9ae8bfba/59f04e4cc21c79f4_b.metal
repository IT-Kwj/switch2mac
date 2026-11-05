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
    float2 _282 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_282, float2(0.0), isnan(_282))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_282, float2(0.0), isnan(_282))).x;
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
    float _98 = _86 * _84;
    float _100 = _88 * _84;
    float _102 = _92 * _84;
    float _104 = _96 * _84;
    float _106 = _82 * _84;
    float2 _386 = float2(_52, _54);
    float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_386, float2(0.0), isnan(_386))).xyz;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float2 _400 = float2(_100, _98);
    float _118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400)), _106);
    float2 _408 = float2(_102, _98);
    float _120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408)), _106);
    float2 _416 = float2(_100, _104);
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416)), _106);
    float2 _424 = float2(_102, _104);
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424)), _106);
    float _126 = in.m_40.w;
    float _128 = in.m_42.y;
    float _130 = in.m_40.x;
    float _132 = in.m_42.z;
    float _134 = in.m_40.y;
    float _136 = -_66;
    float _138 = fma(_136, _126, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _140 = in.m_42.x;
    float _142 = -_66;
    float _144 = fma(_142, _130, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _146 = -_138;
    float _148 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _150 = -_66;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _154 = fma(_150, _132, _152);
    float _156 = -_66;
    float _158 = fma(_156, _134, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    bool _162 = _148 <= 1.0;
    bool _164 = isnan(_148);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = float(_170);
    float _174 = precise::min(_144, _158);
    float _176 = precise::max(_144, _158);
    float _178 = _148 * _172;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -_66;
    float _184 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _186 = fma(_182, _128, _184);
    bool _188 = _174 >= 0.0;
    bool _190 = isnan(_174);
    bool _192 = _188 || _190;
    bool _194 = isnan(0.0);
    bool _196 = _192 || _194;
    float _198 = _186 * _186;
    float _200 = abs(_180);
    float _202 = log2(_200);
    bool _204 = _138 >= _176;
    bool _206 = isnan(_138);
    bool _208 = _204 || _206;
    bool _210 = isnan(_176);
    bool _212 = _208 || _210;
    bool _214 = _212 && _196;
    float _216 = float(_214);
    float _218 = -_66;
    float _220 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _222 = fma(_218, _140, _220);
    float _224 = _202 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _226 = fma(_222, _222, _198);
    float _228 = fma(_154, _154, _226);
    float _230 = exp2(_224);
    float _232 = rsqrt(_228);
    float _234 = _216 * _230;
    float _236 = fma(_114, 2.0, -1.0);
    float _238 = fma(_112, 2.0, -1.0);
    float _240 = fma(_116, 2.0, -1.0);
    float _242 = _118 + _120;
    float _244 = _236 * _186;
    float _246 = _242 + _122;
    float _248 = fma(_238, _222, _244);
    float _250 = _246 + _124;
    float _252 = fma(_240, _154, _248);
    float _254 = _250 * _234;
    float _256 = _254 * 0.25;
    float _258 = -_232;
    float _260 = fma(_258, _252, 0.0);
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _256 * _262;
    float _266 = _264 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _268 = _264 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _270 = _264 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_45.x = _266;
    out.m_45.y = _268;
    out.m_45.z = _270;
    return out;
}

