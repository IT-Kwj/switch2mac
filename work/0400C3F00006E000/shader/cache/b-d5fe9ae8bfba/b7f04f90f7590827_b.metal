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
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_36.x;
    float _52 = in.m_36.y;
    float2 _262 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_262, float2(0.0), isnan(_262))).x;
    float _56 = in.m_38.w;
    float _58 = in.m_38.y;
    float _60 = in.m_38.x;
    float _62 = in.m_38.z;
    float _64 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _66 = -_64;
    float _68 = fma(_66, _56, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _70 = -_64;
    float _72 = fma(_70, _58, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _74 = -_64;
    float _76 = fma(_74, _60, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _78 = -_64;
    float _80 = fma(_78, _62, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _82 = 1.0 / _68;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[17].y, _72);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[17].x, _76);
    float _88 = -_68;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c4)._m0[17].x, _76);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c4)._m0[17].y, _72);
    float _96 = _84 * _82;
    float _98 = _86 * _82;
    float _100 = _90 * _82;
    float _102 = _94 * _82;
    float _104 = _80 * _82;
    float2 _366 = float2(_50, _52);
    float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_366, float2(0.0), isnan(_366))).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float2 _380 = float2(_98, _96);
    float _116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), _104);
    float2 _388 = float2(_100, _96);
    float _118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388)), _104);
    float2 _396 = float2(_98, _102);
    float _120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396)), _104);
    float2 _404 = float2(_100, _102);
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404)), _104);
    float _124 = in.m_40.z;
    float _126 = in.m_40.y;
    float _128 = -_64;
    float _130 = fma(_128, _124, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _132 = in.m_40.x;
    float _134 = fma(_130, -0.5, 0.5);
    float _136 = in.m_40.w;
    bool _140 = _134 <= 1.0;
    bool _142 = isnan(_134);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = float(_148);
    float _152 = _134 * _150;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = -_64;
    float _158 = fma(_156, _126, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _160 = abs(_154);
    float _162 = log2(_160);
    float _164 = -_64;
    float _166 = fma(_164, _132, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _168 = _162 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _170 = -_64;
    float _172 = fma(_170, _136, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _174 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _176 = precise::min(_166, _158);
    float _178 = exp2(_168);
    float _180 = precise::max(_166, _158);
    float _182 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _174);
    bool _184 = _176 >= 0.0;
    bool _186 = isnan(_176);
    bool _188 = _184 || _186;
    bool _190 = isnan(0.0);
    bool _192 = _188 || _190;
    float _194 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _182);
    bool _196 = _172 >= _180;
    bool _198 = isnan(_172);
    bool _200 = _196 || _198;
    bool _202 = isnan(_180);
    bool _204 = _200 || _202;
    bool _206 = _204 && _192;
    float _208 = float(_206);
    float _210 = rsqrt(_194);
    float _212 = _208 * _178;
    float _214 = fma(_112, 2.0, -1.0);
    float _216 = fma(_110, 2.0, -1.0);
    float _218 = fma(_114, 2.0, -1.0);
    float _220 = _116 + _118;
    float _222 = _214 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _224 = _220 + _120;
    float _226 = fma(_216, (*spvDescriptorSet0.fp_c4)._m0[15].x, _222);
    float _228 = _224 + _122;
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c4)._m0[15].z, _226);
    float _232 = _228 * _212;
    float _234 = _232 * 0.25;
    float _236 = -_210;
    float _238 = fma(_236, _230, 0.0);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _244 = _242 * _240;
    float _246 = _244 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _248 = _244 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _250 = _244 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_43.x = _246;
    out.m_43.y = _248;
    out.m_43.z = _250;
    out.m_43.w = 0.0;
    return out;
}

