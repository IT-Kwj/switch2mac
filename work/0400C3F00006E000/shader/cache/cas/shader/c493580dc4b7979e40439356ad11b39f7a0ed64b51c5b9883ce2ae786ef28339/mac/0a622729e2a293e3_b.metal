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
    float2 _303 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _60 = -_50;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _52;
    float _72 = _68 * _54;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _94);
    float _102 = 1.0 / _92;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _100);
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = _106 * _102;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _96 * _102;
    float _114 = _98 * _102;
    float _116 = _70 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _118 = _110 * _56;
    float _120 = _110 * _58;
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _116);
    float _124 = fma(_118, 1.5, _112);
    float _126 = fma(_120, 1.5, _114);
    float _128 = fma(_118, 0.5, _112);
    float _130 = fma(_118, -0.5, _112);
    float _132 = fma(_118, -1.5, _112);
    float3 _478 = float3(_124, _126, float(0));
    float3 _482 = select(_478, float3(0.0), isnan(_478));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _482.xy, uint(rint(_482.z)), _110);
    float3 _489 = float3(_128, _126, float(0));
    float3 _491 = select(_489, float3(0.0), isnan(_489));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _491.xy, uint(rint(_491.z)), _110);
    float3 _498 = float3(_130, _126, float(0));
    float3 _500 = select(_498, float3(0.0), isnan(_498));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _500.xy, uint(rint(_500.z)), _110);
    float3 _507 = float3(_132, _126, float(0));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _509.xy, uint(rint(_509.z)), _110);
    float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _122);
    float _144 = _70 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _146 = _70 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _148 = _142 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _150 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _152 = fma(_120, 0.5, _114);
    float _154 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _146);
    float _156 = 1.0 / _148;
    float3 _550 = float3(_124, _152, float(0));
    float3 _552 = select(_550, float3(0.0), isnan(_550));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _552.xy, uint(rint(_552.z)), _110);
    float _160 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _154);
    float _162 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _150);
    float _164 = _160 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _166 = _162 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _577 = float3(_128, _152, float(0));
    float3 _579 = select(_577, float3(0.0), isnan(_577));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _579.xy, uint(rint(_579.z)), _110);
    float _170 = _164 * _156;
    float _172 = _166 * _156;
    float _174 = _134 + _136;
    float _176 = _174 + _138;
    float _178 = _176 + _140;
    float _180 = fma(_120, -0.5, _114);
    float3 _604 = float3(_130, _152, float(0));
    float3 _606 = select(_604, float3(0.0), isnan(_604));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _606.xy, uint(rint(_606.z)), _110);
    float3 _613 = float3(_132, _152, float(0));
    float3 _615 = select(_613, float3(0.0), isnan(_613));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _615.xy, uint(rint(_615.z)), _110);
    float3 _622 = float3(_124, _180, float(0));
    float3 _624 = select(_622, float3(0.0), isnan(_622));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _624.xy, uint(rint(_624.z)), _110);
    float3 _631 = float3(_128, _180, float(0));
    float3 _633 = select(_631, float3(0.0), isnan(_631));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _633.xy, uint(rint(_633.z)), _110);
    float2 _639 = float2(_170, _172);
    float2 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_639, float2(0.0), isnan(_639))).xy;
    float _194 = _192.x;
    float _196 = _192.y;
    float3 _652 = float3(_130, _180, float(0));
    float3 _654 = select(_652, float3(0.0), isnan(_652));
    float _198 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _654.xy, uint(rint(_654.z)), _110);
    float _200 = fma(_120, -1.5, _114);
    float3 _664 = float3(_132, _180, float(0));
    float3 _666 = select(_664, float3(0.0), isnan(_664));
    float _202 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _666.xy, uint(rint(_666.z)), _110);
    float3 _673 = float3(_124, _200, float(0));
    float3 _675 = select(_673, float3(0.0), isnan(_673));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _675.xy, uint(rint(_675.z)), _110);
    float3 _682 = float3(_128, _200, float(0));
    float3 _684 = select(_682, float3(0.0), isnan(_682));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _684.xy, uint(rint(_684.z)), _110);
    float3 _691 = float3(_130, _200, float(0));
    float3 _693 = select(_691, float3(0.0), isnan(_691));
    float _208 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _693.xy, uint(rint(_693.z)), _110);
    float3 _700 = float3(_132, _200, float(0));
    float3 _702 = select(_700, float3(0.0), isnan(_700));
    float _210 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _702.xy, uint(rint(_702.z)), _110);
    float _212 = _70 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _214 = _178 + _158;
    float _216 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _212);
    float _218 = _214 + _168;
    float _220 = -_68;
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _224 = _220 + _222;
    float _226 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _216);
    float _228 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _226 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _234 = precise::min(_232, 1.0);
    float _236 = _218 + _182;
    float _238 = _236 + _184;
    float _240 = -_194;
    float _242 = fma(_240, _194, _196);
    float _244 = -_194;
    float _246 = _234 + _244;
    float _248 = _238 + _186;
    float _250 = -_68;
    float _252 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _254 = _250 + _252;
    float _256 = fma(_246, _246, _242);
    float _258 = _248 + _188;
    bool _262 = _246 <= 0.001000000047497451305389404296875;
    float _264 = float(_262);
    float _266 = _254 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = 1.0 / _256;
    float _272 = _258 + _198;
    float _274 = _272 + _202;
    float _276 = _274 + _204;
    float _278 = _276 + _206;
    float _280 = _242 * _270;
    float _282 = _278 + _208;
    float _284 = precise::max(_280, _264);
    float _286 = _282 + _210;
    float _288 = precise::min(_284, 1.0);
    float _290 = fma(_286, 0.0625, _268);
    float _292 = _230 + _288;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _290;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _292;
    return out;
}

