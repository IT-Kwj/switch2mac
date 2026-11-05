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
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_38.x;
    float _54 = in.m_38.y;
    float2 _286 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_286, float2(0.0), isnan(_286))).x;
    float _58 = in.m_40.w;
    float _60 = in.m_42.w;
    float _62 = in.m_40.y;
    float _64 = in.m_40.x;
    float _66 = in.m_42.x;
    float _68 = in.m_42.y;
    float _70 = in.m_40.z;
    float _72 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _58, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _78 = -_72;
    float _80 = fma(_78, _60, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _82 = -_72;
    float _84 = fma(_82, _62, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _86 = -_72;
    float _88 = fma(_86, _64, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _90 = 1.0 / _76;
    float _92 = -_72;
    float _94 = fma(_92, _66, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _98 = -_72;
    float _100 = fma(_98, _68, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _102 = -_72;
    float _104 = fma(_102, _70, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _106 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _108 = -_76;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _112 = -_76;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _116 = 1.0 / _80;
    float _118 = _96 * _90;
    float _120 = _104 * _90;
    float _122 = _106 * _90;
    float _124 = _110 * _90;
    float _126 = _114 * _90;
    float _128 = fma(_94, _116, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _130 = fma(_100, _116, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float2 _433 = float2(_52, _54);
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_433, float2(0.0), isnan(_433))).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float2 _447 = float2(_122, _118);
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447)), _120);
    float2 _455 = float2(_124, _118);
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455)), _120);
    float2 _463 = float2(_122, _126);
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463)), _120);
    float _148 = _128 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _150 = _130 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _479 = float2(_124, _126);
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479)), _120);
    float2 _487 = float2(_148, _150);
    float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_487, float2(0.0), isnan(_487))).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = in.m_42.z;
    float _164 = precise::min(_94, _100);
    float _166 = precise::max(_94, _100);
    bool _170 = _164 >= 0.0;
    bool _172 = isnan(_164);
    bool _174 = _170 || _172;
    bool _176 = isnan(0.0);
    bool _178 = _174 || _176;
    bool _180 = _80 >= _166;
    bool _182 = isnan(_80);
    bool _184 = _180 || _182;
    bool _186 = isnan(_166);
    bool _188 = _184 || _186;
    bool _190 = _188 && _178;
    float _192 = float(_190);
    float _194 = -_72;
    float _196 = fma(_194, _162, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _198 = fma(_196, -0.5, 0.5);
    bool _200 = _198 <= 1.0;
    bool _202 = isnan(_198);
    bool _204 = _200 || _202;
    bool _206 = isnan(1.0);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = _198 * _210;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = abs(_214);
    float _218 = log2(_216);
    float _220 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _222 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _220);
    float _224 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _222);
    float _226 = rsqrt(_224);
    float _228 = _218 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _230 = exp2(_228);
    float _232 = _192 * _230;
    float _234 = fma(_138, 2.0, -1.0);
    float _236 = fma(_136, 2.0, -1.0);
    float _238 = _142 + _144;
    float _240 = fma(_140, 2.0, -1.0);
    float _242 = _234 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _244 = _238 + _146;
    float _246 = fma(_236, (*spvDescriptorSet0.fp_c4)._m0[15].x, _242);
    float _248 = _244 + _152;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c4)._m0[15].z, _246);
    float _252 = _248 * _232;
    float _254 = _252 * 0.25;
    float _256 = -_226;
    float _258 = fma(_256, _250, 0.0);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _156 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _264 = _254 * _260;
    float _266 = _158 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _268 = _160 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _270 = _262 * _264;
    float _272 = _266 * _264;
    float _274 = _268 * _264;
    out.m_45.x = _270;
    out.m_45.y = _272;
    out.m_45.z = _274;
    return out;
}

