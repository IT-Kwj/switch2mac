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
    float2 _271 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _54;
    float _72 = _68 * _56;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _76);
    float _86 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _88 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _92 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _106 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _110 = 1.0 / _98;
    float _112 = _70 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _114 = _70 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _118 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _112);
    float _122 = 1.0 / _102;
    float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _120);
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _128 = _116 * _110;
    float _130 = _106 * _110;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _114);
    float _136 = _118 * _110;
    float _138 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _140 = fma(_132, _58, _128);
    float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _134);
    float _144 = fma(_132, _138, _136);
    float _146 = _142 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _478 = float3(_140, _144, float(0));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _482.xy, uint(rint(_482.z)), _132);
    float _150 = _126 * _122;
    float _152 = _146 * _122;
    float _154 = -_138;
    float _156 = fma(_132, _154, _136);
    float _158 = -_58;
    float _160 = fma(_132, _158, _128);
    float3 _507 = float3(_128, _144, float(0));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _509.xy, uint(rint(_509.z)), _132);
    float3 _516 = float3(_160, _144, float(0));
    float3 _518 = select(_516, float3(0.0), isnan(_516));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _518.xy, uint(rint(_518.z)), _132);
    float3 _525 = float3(_140, _136, float(0));
    float3 _527 = select(_525, float3(0.0), isnan(_525));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _527.xy, uint(rint(_527.z)), _132);
    float3 _534 = float3(_128, _136, float(0));
    float3 _536 = select(_534, float3(0.0), isnan(_534));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _536.xy, uint(rint(_536.z)), _132);
    float2 _542 = float2(_150, _152);
    float2 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_542, float2(0.0), isnan(_542))).xy;
    float _174 = _172.x;
    float _176 = _172.y;
    float3 _555 = float3(_160, _136, float(0));
    float3 _557 = select(_555, float3(0.0), isnan(_555));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _557.xy, uint(rint(_557.z)), _132);
    float3 _564 = float3(_140, _156, float(0));
    float3 _566 = select(_564, float3(0.0), isnan(_564));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _566.xy, uint(rint(_566.z)), _132);
    float3 _573 = float3(_128, _156, float(0));
    float3 _575 = select(_573, float3(0.0), isnan(_573));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _575.xy, uint(rint(_575.z)), _132);
    float3 _582 = float3(_160, _156, float(0));
    float3 _584 = select(_582, float3(0.0), isnan(_582));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _584.xy, uint(rint(_584.z)), _132);
    float2 _590 = float2(_48, _50);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_590, float2(0.0), isnan(_590))).x;
    float _188 = _70 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _190 = -_68;
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _194 = _190 + _192;
    float _196 = -_68;
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _200 = _196 + _198;
    float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _188);
    float _204 = _194 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = _200 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _202);
    float _214 = _212 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _216 = precise::min(_214, 1.0);
    float _218 = _148 + _162;
    float _220 = _218 + _164;
    float _222 = _220 + _166;
    float _224 = -_174;
    float _226 = fma(_224, _174, _176);
    float _228 = -_174;
    float _230 = _216 + _228;
    float _232 = _222 + _168;
    float _234 = fma(_230, _230, _226);
    bool _238 = _230 <= 0.001000000047497451305389404296875;
    float _240 = float(_238);
    float _242 = 1.0 / _234;
    float _244 = _232 + _178;
    float _246 = _244 + _180;
    float _248 = _226 * _242;
    float _250 = _246 + _182;
    float _252 = precise::max(_248, _240);
    float _254 = _250 + _184;
    float _256 = precise::min(_252, 1.0);
    float _258 = fma(_254, 0.111111111938953399658203125, _206);
    float _260 = _210 + _256;
    out.m_41.x = _186;
    out.m_41.y = _258;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _260;
    return out;
}

