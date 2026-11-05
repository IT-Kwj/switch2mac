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
    float2 _265 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float2 _276 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_276, float2(0.0), isnan(_276))).xy;
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
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _84 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].x, _78);
    float _86 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _88 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].x, _82);
    float _90 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _92 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _94 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _98 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].z, _88);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _102 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].x, _94);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _108 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _90);
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].z, _102);
    float _112 = 1.0 / _100;
    float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _106);
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _120 = _98 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _124 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
    float _126 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _116);
    float _128 = 1.0 / _104;
    float _130 = _122 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _132 = _118 * _112;
    float _134 = _120 * _112;
    float _136 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
    float _138 = _126 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _140 = fma(_60, 2.0, -1.0);
    float _142 = fma(_62, 2.0, -1.0);
    float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _459 = float2(_132, _134);
    float2 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_459, float2(0.0), isnan(_459))).xy;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _130 * _128;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _138 * _128;
    float _158 = _144 * _128;
    float _160 = _142 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _162 = _154 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _164 = _140 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _170 = fma(_164, 2.0, _50);
    float _172 = fma(_166, 0.5, _156);
    float _174 = fma(_166, -0.5, _156);
    float _176 = fma(_168, 0.5, _158);
    float _178 = fma(_168, -0.5, _158);
    float _180 = fma(_160, 2.0, _52);
    float3 _527 = float3(_172, _176, float(0));
    float3 _531 = select(_527, float3(0.0), isnan(_527));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _531.xy, uint(rint(_531.z)), _154);
    float3 _538 = float3(_174, _176, float(0));
    float3 _540 = select(_538, float3(0.0), isnan(_538));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _540.xy, uint(rint(_540.z)), _154);
    float3 _547 = float3(_172, _178, float(0));
    float3 _549 = select(_547, float3(0.0), isnan(_547));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _549.xy, uint(rint(_549.z)), _154);
    float3 _556 = float3(_174, _178, float(0));
    float3 _558 = select(_556, float3(0.0), isnan(_556));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _558.xy, uint(rint(_558.z)), _154);
    float2 _564 = float2(_170, _180);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564))).x;
    float _192 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _194 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].x, _192);
    float _196 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].z, _194);
    float _198 = _196 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _200 = precise::min(_198, 1.0);
    float _202 = -_72;
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _206 = _202 + _204;
    float _208 = -_72;
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _212 = _208 + _210;
    float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -_148;
    float _224 = fma(_222, _148, _150);
    float _226 = -_148;
    float _228 = _200 + _226;
    float _230 = fma(_228, _228, _224);
    bool _234 = _228 <= 0.001000000047497451305389404296875;
    float _236 = float(_234);
    float _238 = 1.0 / _230;
    float _240 = _182 + _184;
    float _242 = _224 * _238;
    float _244 = _240 + _186;
    float _246 = precise::max(_242, _236);
    float _248 = _244 + _188;
    float _250 = precise::min(_246, 1.0);
    float _252 = fma(_248, 0.25, _216);
    float _254 = _220 + _250;
    out.m_43.x = _190;
    out.m_43.y = _252;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _254;
    return out;
}

