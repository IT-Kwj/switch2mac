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
    float2 _288 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_288, float2(0.0), isnan(_288))).x;
    float _58 = in.m_40.w;
    float _60 = in.m_42.w;
    float _62 = in.m_40.y;
    float _64 = in.m_40.x;
    float _66 = in.m_40.z;
    float _68 = in.m_42.x;
    float _70 = in.m_42.y;
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
    float _94 = fma(_92, _66, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _100 = -_76;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _104 = -_72;
    float _106 = fma(_104, _68, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _108 = -_72;
    float _110 = fma(_108, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _112 = -_76;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _116 = 1.0 / _80;
    float _118 = _96 * _90;
    float _120 = _94 * _90;
    float _122 = _98 * _90;
    float _124 = _102 * _90;
    float _126 = _114 * _90;
    float _128 = fma(_106, _116, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _130 = fma(_110, _116, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float2 _435 = float2(_52, _54);
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_435, float2(0.0), isnan(_435))).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float2 _449 = float2(_122, _118);
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449)), _120);
    float2 _457 = float2(_124, _118);
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457)), _120);
    float2 _465 = float2(_122, _126);
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465)), _120);
    float _148 = _128 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _150 = _130 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _481 = float2(_124, _126);
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481)), _120);
    float2 _489 = float2(_148, _150);
    float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_489, float2(0.0), isnan(_489))).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = in.m_42.z;
    float _164 = -_72;
    float _166 = fma(_164, _162, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _168 = fma(_166, -0.5, 0.5);
    bool _172 = _168 <= 1.0;
    bool _174 = isnan(_168);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = float(_180);
    float _184 = _168 * _182;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = abs(_186);
    float _190 = log2(_188);
    float _192 = precise::min(_106, _110);
    float _194 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _196 = precise::max(_106, _110);
    bool _198 = _192 >= 0.0;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan(0.0);
    bool _206 = _202 || _204;
    float _208 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _194);
    bool _210 = _80 >= _196;
    bool _212 = isnan(_80);
    bool _214 = _210 || _212;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = _218 && _206;
    float _222 = float(_220);
    float _224 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _208);
    float _226 = _190 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _228 = rsqrt(_224);
    float _230 = exp2(_226);
    float _232 = _222 * _230;
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
    float _256 = -_228;
    float _258 = fma(_256, _250, 0.0);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _254 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _264 = _156 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _266 = _262 * _260;
    float _268 = _158 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _270 = _160 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _272 = _264 * _266;
    float _274 = _268 * _266;
    float _276 = _270 * _266;
    out.m_45.x = _272;
    out.m_45.y = _274;
    out.m_45.z = _276;
    out.m_45.w = 0.0;
    return out;
}

