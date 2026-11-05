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
    float2 _307 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_307, float2(0.0), isnan(_307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_307, float2(0.0), isnan(_307))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _74 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _86 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _96 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _86);
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _100 = 1.0 / _90;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _108 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _102 * _100;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _106 * _100;
    float _116 = _108 * _100;
    float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _120 = _112 * _72;
    float _122 = _112 * _74;
    float _124 = fma(_120, 1.5, _114);
    float _126 = fma(_120, 0.5, _114);
    float _128 = fma(_120, -0.5, _114);
    float _130 = fma(_120, -1.5, _114);
    float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _118);
    float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _136 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _138 = fma(_122, 0.5, _116);
    float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _132);
    float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _134);
    float _144 = fma(_122, 1.5, _116);
    float _146 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _136);
    float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _142);
    float3 _519 = float3(_124, _144, float(0));
    float3 _523 = select(_519, float3(0.0), isnan(_519));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _523.xy, uint(rint(_523.z)), _112);
    float3 _530 = float3(_126, _144, float(0));
    float3 _532 = select(_530, float3(0.0), isnan(_530));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _532.xy, uint(rint(_532.z)), _112);
    float3 _539 = float3(_128, _144, float(0));
    float3 _541 = select(_539, float3(0.0), isnan(_539));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _541.xy, uint(rint(_541.z)), _112);
    float3 _548 = float3(_130, _144, float(0));
    float3 _550 = select(_548, float3(0.0), isnan(_548));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _550.xy, uint(rint(_550.z)), _112);
    float _160 = 1.0 / _148;
    float _162 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _146);
    float3 _564 = float3(_124, _138, float(0));
    float3 _566 = select(_564, float3(0.0), isnan(_564));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _566.xy, uint(rint(_566.z)), _112);
    float3 _573 = float3(_126, _138, float(0));
    float3 _575 = select(_573, float3(0.0), isnan(_573));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _575.xy, uint(rint(_575.z)), _112);
    float3 _582 = float3(_128, _138, float(0));
    float3 _584 = select(_582, float3(0.0), isnan(_582));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _584.xy, uint(rint(_584.z)), _112);
    float _170 = _150 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _172 = _162 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _174 = fma(_122, -0.5, _116);
    float _176 = _152 + _154;
    float _178 = _170 * _160;
    float _180 = _172 * _160;
    float _182 = _176 + _156;
    float3 _614 = float3(_130, _138, float(0));
    float3 _616 = select(_614, float3(0.0), isnan(_614));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _616.xy, uint(rint(_616.z)), _112);
    float3 _623 = float3(_124, _174, float(0));
    float3 _625 = select(_623, float3(0.0), isnan(_623));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _625.xy, uint(rint(_625.z)), _112);
    float3 _632 = float3(_126, _174, float(0));
    float3 _634 = select(_632, float3(0.0), isnan(_632));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _634.xy, uint(rint(_634.z)), _112);
    float3 _641 = float3(_128, _174, float(0));
    float3 _643 = select(_641, float3(0.0), isnan(_641));
    float _190 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _643.xy, uint(rint(_643.z)), _112);
    float2 _649 = float2(_178, _180);
    float2 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_649, float2(0.0), isnan(_649))).xy;
    float _196 = _194.x;
    float _198 = _194.y;
    float3 _662 = float3(_130, _174, float(0));
    float3 _664 = select(_662, float3(0.0), isnan(_662));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _664.xy, uint(rint(_664.z)), _112);
    float _202 = fma(_122, -1.5, _116);
    float3 _674 = float3(_124, _202, float(0));
    float3 _676 = select(_674, float3(0.0), isnan(_674));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _676.xy, uint(rint(_676.z)), _112);
    float3 _683 = float3(_126, _202, float(0));
    float3 _685 = select(_683, float3(0.0), isnan(_683));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _685.xy, uint(rint(_685.z)), _112);
    float3 _692 = float3(_128, _202, float(0));
    float3 _694 = select(_692, float3(0.0), isnan(_692));
    float _208 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _694.xy, uint(rint(_694.z)), _112);
    float3 _701 = float3(_130, _202, float(0));
    float3 _703 = select(_701, float3(0.0), isnan(_701));
    float _210 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _703.xy, uint(rint(_703.z)), _112);
    float2 _709 = float2(_48, _50);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_709, float2(0.0), isnan(_709))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_709, float2(0.0), isnan(_709))).x;
    float _214 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _216 = _182 + _158;
    float _218 = -_66;
    float _220 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _222 = _218 + _220;
    float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _214);
    float _226 = _216 + _164;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _224);
    float _234 = _226 + _166;
    float _236 = _232 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _238 = _234 + _168;
    float _240 = precise::min(_236, 1.0);
    float _242 = _238 + _184;
    float _244 = -_196;
    float _246 = fma(_244, _196, _198);
    float _248 = -_196;
    float _250 = _240 + _248;
    float _252 = _242 + _186;
    float _254 = fma(_250, _250, _246);
    float _256 = _252 + _188;
    bool _260 = _250 <= 0.001000000047497451305389404296875;
    float _262 = float(_260);
    float _264 = 1.0 / _254;
    float _266 = _256 + _190;
    float _268 = _266 + _200;
    float _270 = _268 + _204;
    float _272 = _270 + _206;
    float _274 = _246 * _264;
    float _276 = _272 + _208;
    float _278 = -_66;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _282 = _278 + _280;
    float _284 = precise::max(_274, _262);
    float _286 = _276 + _210;
    float _288 = _282 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = precise::min(_284, 1.0);
    float _294 = fma(_286, 0.0625, _290);
    float _296 = _230 + _292;
    out.m_41.x = _212;
    out.m_41.y = _294;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _296;
    return out;
}

