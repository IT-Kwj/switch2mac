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
    float2 _303 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _82 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _90 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _94 = 1.0 / _82;
    float _96 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _104 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = _96 * _94;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _100 * _94;
    float _112 = _104 * _94;
    float _114 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _116 = _108 * _90;
    float _118 = _108 * _102;
    float _120 = fma(_116, 1.5, _110);
    float _122 = fma(_116, 0.5, _110);
    float _124 = fma(_116, -0.5, _110);
    float _126 = fma(_116, -1.5, _110);
    float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _114);
    float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _132 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _134 = fma(_118, 0.5, _112);
    float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _128);
    float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _130);
    float _140 = fma(_118, 1.5, _112);
    float _142 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _132);
    float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _138);
    float3 _511 = float3(_120, _140, float(0));
    float3 _515 = select(_511, float3(0.0), isnan(_511));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _515.xy, uint(rint(_515.z)), _108);
    float3 _522 = float3(_122, _140, float(0));
    float3 _524 = select(_522, float3(0.0), isnan(_522));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _524.xy, uint(rint(_524.z)), _108);
    float3 _531 = float3(_124, _140, float(0));
    float3 _533 = select(_531, float3(0.0), isnan(_531));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _533.xy, uint(rint(_533.z)), _108);
    float3 _540 = float3(_126, _140, float(0));
    float3 _542 = select(_540, float3(0.0), isnan(_540));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _542.xy, uint(rint(_542.z)), _108);
    float _156 = 1.0 / _144;
    float _158 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float3 _556 = float3(_120, _134, float(0));
    float3 _558 = select(_556, float3(0.0), isnan(_556));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _558.xy, uint(rint(_558.z)), _108);
    float3 _565 = float3(_122, _134, float(0));
    float3 _567 = select(_565, float3(0.0), isnan(_565));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _567.xy, uint(rint(_567.z)), _108);
    float3 _574 = float3(_124, _134, float(0));
    float3 _576 = select(_574, float3(0.0), isnan(_574));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _576.xy, uint(rint(_576.z)), _108);
    float _166 = _146 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _168 = _158 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _170 = fma(_118, -0.5, _112);
    float _172 = _148 + _150;
    float _174 = _166 * _156;
    float _176 = _168 * _156;
    float _178 = _172 + _152;
    float3 _606 = float3(_126, _134, float(0));
    float3 _608 = select(_606, float3(0.0), isnan(_606));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _608.xy, uint(rint(_608.z)), _108);
    float3 _615 = float3(_120, _170, float(0));
    float3 _617 = select(_615, float3(0.0), isnan(_615));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _617.xy, uint(rint(_617.z)), _108);
    float3 _624 = float3(_122, _170, float(0));
    float3 _626 = select(_624, float3(0.0), isnan(_624));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _626.xy, uint(rint(_626.z)), _108);
    float3 _633 = float3(_124, _170, float(0));
    float3 _635 = select(_633, float3(0.0), isnan(_633));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _635.xy, uint(rint(_635.z)), _108);
    float2 _641 = float2(_174, _176);
    float2 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_641, float2(0.0), isnan(_641))).xy;
    float _192 = _190.x;
    float _194 = _190.y;
    float3 _654 = float3(_126, _170, float(0));
    float3 _656 = select(_654, float3(0.0), isnan(_654));
    float _196 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _656.xy, uint(rint(_656.z)), _108);
    float _198 = fma(_118, -1.5, _112);
    float3 _666 = float3(_120, _198, float(0));
    float3 _668 = select(_666, float3(0.0), isnan(_666));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _668.xy, uint(rint(_668.z)), _108);
    float3 _675 = float3(_122, _198, float(0));
    float3 _677 = select(_675, float3(0.0), isnan(_675));
    float _202 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _677.xy, uint(rint(_677.z)), _108);
    float3 _684 = float3(_124, _198, float(0));
    float3 _686 = select(_684, float3(0.0), isnan(_684));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _686.xy, uint(rint(_686.z)), _108);
    float3 _693 = float3(_126, _198, float(0));
    float3 _695 = select(_693, float3(0.0), isnan(_693));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _695.xy, uint(rint(_695.z)), _108);
    float2 _701 = float2(_48, _50);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_701, float2(0.0), isnan(_701))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_701, float2(0.0), isnan(_701))).x;
    float _210 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _212 = _178 + _154;
    float _214 = -_62;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _218 = _214 + _216;
    float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _210);
    float _222 = _212 + _160;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _220);
    float _230 = _222 + _162;
    float _232 = _228 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _234 = _230 + _164;
    float _236 = precise::min(_232, 1.0);
    float _238 = _234 + _180;
    float _240 = -_192;
    float _242 = fma(_240, _192, _194);
    float _244 = -_192;
    float _246 = _236 + _244;
    float _248 = _238 + _182;
    float _250 = fma(_246, _246, _242);
    float _252 = _248 + _184;
    bool _256 = _246 <= 0.001000000047497451305389404296875;
    float _258 = float(_256);
    float _260 = 1.0 / _250;
    float _262 = _252 + _186;
    float _264 = _262 + _196;
    float _266 = _264 + _200;
    float _268 = _266 + _202;
    float _270 = _242 * _260;
    float _272 = _268 + _204;
    float _274 = -_62;
    float _276 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _278 = _274 + _276;
    float _280 = precise::max(_270, _258);
    float _282 = _272 + _206;
    float _284 = _278 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = precise::min(_280, 1.0);
    float _290 = fma(_282, 0.0625, _286);
    float _292 = _226 + _288;
    out.m_41.x = _208;
    out.m_41.y = _290;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _292;
    return out;
}

