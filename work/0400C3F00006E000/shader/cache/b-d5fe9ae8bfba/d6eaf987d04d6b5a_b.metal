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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
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
    float2 _248 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float2 _259 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_259, float2(0.0), isnan(_259))).xy;
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
    float _90 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].z, _88);
    float _98 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _102 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _104 = _94 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _106 = _96 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _108 = 1.0 / _100;
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _102);
    float _112 = fma(_60, 2.0, -1.0);
    float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _116 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _118 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
    float _120 = 1.0 / _116;
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
    float _124 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _126 = _104 * _108;
    float _128 = _106 * _108;
    float _130 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _98);
    float _134 = fma(_62, 2.0, -1.0);
    float _136 = _112 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _138 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    float2 _429 = float2(_126, _128);
    float2 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_429, float2(0.0), isnan(_429))).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
    float _148 = fma(_136, 2.0, _50);
    float _150 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
    float _152 = _134 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _156 = _124 * _120;
    float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _160 = _154 * _120;
    float _162 = fma(_152, 2.0, _52);
    float _164 = _158 * _120;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = rint(_166);
    float _170 = precise::max(_168, 0.0);
    uint _173 = uint(_170);
    uint _175 = clamp(_173, 0u, 65535u);
    float3 _494 = float3(_156, _160, float(int(_175)));
    float3 _498 = select(_494, float3(0.0), isnan(_494));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _498.xy, uint(rint(_498.z)), 1.0);
    float2 _503 = float2(_148, _162);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503))).x;
    float _181 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _183 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].x, _181);
    float _185 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].z, _183);
    float _187 = _185 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _189 = precise::min(_187, 1.0);
    float _191 = -_72;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _195 = _191 + _193;
    float _197 = _195 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = -_142;
    float _203 = fma(_201, _142, _144);
    float _205 = -_142;
    float _207 = _189 + _205;
    float _209 = fma(_207, _207, _203);
    bool _213 = _207 <= 0.001000000047497451305389404296875;
    float _215 = float(_213);
    float _217 = 1.0 / _209;
    float _219 = _203 * _217;
    float _221 = -_72;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _225 = _221 + _223;
    float _227 = precise::max(_219, _215);
    float _229 = _225 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = precise::min(_227, 1.0);
    float _235 = _231 + _177;
    float _237 = _199 + _233;
    out.m_43.x = _179;
    out.m_43.y = _235;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _237;
    return out;
}

