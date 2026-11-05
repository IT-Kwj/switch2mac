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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _299 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _60 = -_50;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _76);
    float _82 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = _80 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _90 = 1.0 / _82;
    float _92 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _92);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _98 * _90;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _86 * _90;
    float _110 = _102 * _90;
    float _112 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _114 = _106 * _56;
    float _116 = _106 * _58;
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _112);
    float _120 = fma(_114, 1.5, _108);
    float _122 = fma(_116, 1.5, _110);
    float _124 = fma(_114, 0.5, _108);
    float _126 = fma(_114, -0.5, _108);
    float _128 = fma(_114, -1.5, _108);
    float3 _470 = float3(_120, _122, float(0));
    float3 _474 = select(_470, float3(0.0), isnan(_470));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _474.xy, uint(rint(_474.z)), _106);
    float3 _481 = float3(_124, _122, float(0));
    float3 _483 = select(_481, float3(0.0), isnan(_481));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _483.xy, uint(rint(_483.z)), _106);
    float3 _490 = float3(_126, _122, float(0));
    float3 _492 = select(_490, float3(0.0), isnan(_490));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _492.xy, uint(rint(_492.z)), _106);
    float3 _499 = float3(_128, _122, float(0));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _501.xy, uint(rint(_501.z)), _106);
    float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _118);
    float _140 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _142 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _144 = _138 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _140);
    float _148 = fma(_116, 0.5, _110);
    float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _142);
    float _152 = 1.0 / _144;
    float3 _542 = float3(_120, _148, float(0));
    float3 _544 = select(_542, float3(0.0), isnan(_542));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _544.xy, uint(rint(_544.z)), _106);
    float _156 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _150);
    float _158 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _146);
    float _160 = _156 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _162 = _158 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _569 = float3(_124, _148, float(0));
    float3 _571 = select(_569, float3(0.0), isnan(_569));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _571.xy, uint(rint(_571.z)), _106);
    float _166 = _160 * _152;
    float _168 = _162 * _152;
    float _170 = _130 + _132;
    float _172 = _170 + _134;
    float _174 = _172 + _136;
    float _176 = fma(_116, -0.5, _110);
    float3 _596 = float3(_126, _148, float(0));
    float3 _598 = select(_596, float3(0.0), isnan(_596));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _598.xy, uint(rint(_598.z)), _106);
    float3 _605 = float3(_128, _148, float(0));
    float3 _607 = select(_605, float3(0.0), isnan(_605));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _607.xy, uint(rint(_607.z)), _106);
    float3 _614 = float3(_120, _176, float(0));
    float3 _616 = select(_614, float3(0.0), isnan(_614));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _616.xy, uint(rint(_616.z)), _106);
    float3 _623 = float3(_124, _176, float(0));
    float3 _625 = select(_623, float3(0.0), isnan(_623));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _625.xy, uint(rint(_625.z)), _106);
    float2 _631 = float2(_166, _168);
    float2 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_631, float2(0.0), isnan(_631))).xy;
    float _190 = _188.x;
    float _192 = _188.y;
    float3 _644 = float3(_126, _176, float(0));
    float3 _646 = select(_644, float3(0.0), isnan(_644));
    float _194 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _646.xy, uint(rint(_646.z)), _106);
    float _196 = fma(_116, -1.5, _110);
    float3 _656 = float3(_128, _176, float(0));
    float3 _658 = select(_656, float3(0.0), isnan(_656));
    float _198 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _658.xy, uint(rint(_658.z)), _106);
    float3 _665 = float3(_120, _196, float(0));
    float3 _667 = select(_665, float3(0.0), isnan(_665));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _667.xy, uint(rint(_667.z)), _106);
    float3 _674 = float3(_124, _196, float(0));
    float3 _676 = select(_674, float3(0.0), isnan(_674));
    float _202 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _676.xy, uint(rint(_676.z)), _106);
    float3 _683 = float3(_126, _196, float(0));
    float3 _685 = select(_683, float3(0.0), isnan(_683));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _685.xy, uint(rint(_685.z)), _106);
    float3 _692 = float3(_128, _196, float(0));
    float3 _694 = select(_692, float3(0.0), isnan(_692));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _694.xy, uint(rint(_694.z)), _106);
    float _208 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _210 = _174 + _154;
    float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _208);
    float _214 = _210 + _164;
    float _216 = -_64;
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _220 = _216 + _218;
    float _222 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _212);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _222 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _230 = precise::min(_228, 1.0);
    float _232 = _214 + _178;
    float _234 = _232 + _180;
    float _236 = -_190;
    float _238 = fma(_236, _190, _192);
    float _240 = -_190;
    float _242 = _230 + _240;
    float _244 = _234 + _182;
    float _246 = -_64;
    float _248 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _250 = _246 + _248;
    float _252 = fma(_242, _242, _238);
    float _254 = _244 + _184;
    bool _258 = _242 <= 0.001000000047497451305389404296875;
    float _260 = float(_258);
    float _262 = _250 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = 1.0 / _252;
    float _268 = _254 + _194;
    float _270 = _268 + _198;
    float _272 = _270 + _200;
    float _274 = _272 + _202;
    float _276 = _238 * _266;
    float _278 = _274 + _204;
    float _280 = precise::max(_276, _260);
    float _282 = _278 + _206;
    float _284 = precise::min(_280, 1.0);
    float _286 = fma(_282, 0.0625, _264);
    float _288 = _226 + _284;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _286;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _288;
    return out;
}

