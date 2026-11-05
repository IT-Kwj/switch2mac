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
    constant _16* vp_c3 [[id(0)]];
    texture3d<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(0)]];
    float4 m_33 [[attribute(1)]];
    float4 m_29 [[attribute(2)]];
    float4 m_27 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_27.z;
    float _60 = in.m_27.w;
    float _62 = in.m_29.x;
    float _64 = in.m_29.y;
    float _66 = in.m_29.z;
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    float _74 = in.m_31.z;
    float _76 = in.m_31.w;
    float _78 = _60 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _82 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].x, _78);
    float _84 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[6].x, _80);
    float _86 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[4].z, _82);
    float _88 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _90 = _86 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _88 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float3 _284 = float3(_92, _96, 0.0);
    float _98 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_284, float3(0.0), isnan(_284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_284, float3(0.0), isnan(_284)), level(0.0)).y;
    float _100 = in.m_33.x;
    float _102 = in.m_33.y;
    float _104 = in.m_33.z;
    float _106 = in.m_35.x;
    float _108 = in.m_35.y;
    float _110 = in.m_35.z;
    float _112 = _56 * _102;
    float _114 = _64 * _102;
    float _116 = _72 * _102;
    float _118 = fma(_54, _100, _112);
    float _120 = fma(_62, _100, _114);
    float _122 = fma(_70, _100, _116);
    float _124 = _108 * _56;
    float _126 = fma(_58, _104, _118);
    float _128 = fma(_66, _104, _120);
    float _130 = fma(_74, _104, _122);
    float _132 = _108 * _64;
    float _134 = _126 * _126;
    float _136 = fma(_106, _54, _124);
    float _138 = _108 * _72;
    float _140 = fma(_106, _62, _132);
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_110, _58, _136);
    float _146 = fma(_106, _70, _138);
    float _148 = fma(_110, _66, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = fma(_110, _74, _146);
    float _154 = _148 + _68;
    float _156 = rsqrt(_150);
    float _158 = _152 + _76;
    float _160 = _128 * _156;
    float _162 = _126 * _156;
    float _164 = _130 * _156;
    out.m_38.x = _160;
    out.m_38.y = _162;
    out.m_38.z = _164;
    float _166 = _98 + _144;
    float _168 = _166 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _170 = _166 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[2].x, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[0].x, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[1].x, _172);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].x, _174);
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[2].z, _176);
    float _186 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[0].z, _178);
    float _188 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[1].z, _180);
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[3].z, _182);
    float _192 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _194 = _186 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _196 = _188 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = _190 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_40.x = _154;
    out.m_40.y = _166;
    out.m_40.z = _158;
    out.gl_Position.x = _194;
    out.gl_Position.y = _196;
    out.gl_Position.z = _192;
    out.gl_Position.w = _198;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_27.z;
    float _60 = in.m_27.w;
    float _62 = in.m_29.x;
    float _64 = in.m_29.y;
    float _66 = in.m_29.z;
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    float _74 = in.m_31.z;
    float _76 = in.m_31.w;
    float _78 = _60 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _82 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].x, _78);
    float _84 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[6].x, _80);
    float _86 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[4].z, _82);
    float _88 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _90 = _86 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _88 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float3 _284 = float3(_92, _96, 0.0);
    float _98 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_284, float3(0.0), isnan(_284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_284, float3(0.0), isnan(_284)), level(0.0)).y;
    float _100 = in.m_33.x;
    float _102 = in.m_33.y;
    float _104 = in.m_33.z;
    float _106 = in.m_35.x;
    float _108 = in.m_35.y;
    float _110 = in.m_35.z;
    float _112 = _56 * _102;
    float _114 = _64 * _102;
    float _116 = _72 * _102;
    float _118 = fma(_54, _100, _112);
    float _120 = fma(_62, _100, _114);
    float _122 = fma(_70, _100, _116);
    float _124 = _108 * _56;
    float _126 = fma(_58, _104, _118);
    float _128 = fma(_66, _104, _120);
    float _130 = fma(_74, _104, _122);
    float _132 = _108 * _64;
    float _134 = _126 * _126;
    float _136 = fma(_106, _54, _124);
    float _138 = _108 * _72;
    float _140 = fma(_106, _62, _132);
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_110, _58, _136);
    float _146 = fma(_106, _70, _138);
    float _148 = fma(_110, _66, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = fma(_110, _74, _146);
    float _154 = _148 + _68;
    float _156 = rsqrt(_150);
    float _158 = _152 + _76;
    float _160 = _128 * _156;
    float _162 = _126 * _156;
    float _164 = _130 * _156;
    out.m_38.x = _160;
    out.m_38.y = _162;
    out.m_38.z = _164;
    float _166 = _98 + _144;
    float _168 = _166 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _170 = _166 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[2].x, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[0].x, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[1].x, _172);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].x, _174);
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[2].z, _176);
    float _186 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[0].z, _178);
    float _188 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[1].z, _180);
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[3].z, _182);
    float _192 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _194 = _186 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _196 = _188 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = _190 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_40.x = _154;
    out.m_40.y = _166;
    out.m_40.z = _158;
    out.gl_Position.x = _194;
    out.gl_Position.y = _196;
    out.gl_Position.z = _192;
    out.gl_Position.w = _198;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_27.z;
    float _60 = in.m_27.w;
    float _62 = in.m_29.x;
    float _64 = in.m_29.y;
    float _66 = in.m_29.z;
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    float _74 = in.m_31.z;
    float _76 = in.m_31.w;
    float _78 = _60 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _82 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].x, _78);
    float _84 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[6].x, _80);
    float _86 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[4].z, _82);
    float _88 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _90 = _86 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _88 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float3 _284 = float3(_92, _96, 0.0);
    float _98 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_284, float3(0.0), isnan(_284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_284, float3(0.0), isnan(_284)), level(0.0)).y;
    float _100 = in.m_33.x;
    float _102 = in.m_33.y;
    float _104 = in.m_33.z;
    float _106 = in.m_35.x;
    float _108 = in.m_35.y;
    float _110 = in.m_35.z;
    float _112 = _56 * _102;
    float _114 = _64 * _102;
    float _116 = _72 * _102;
    float _118 = fma(_54, _100, _112);
    float _120 = fma(_62, _100, _114);
    float _122 = fma(_70, _100, _116);
    float _124 = _108 * _56;
    float _126 = fma(_58, _104, _118);
    float _128 = fma(_66, _104, _120);
    float _130 = fma(_74, _104, _122);
    float _132 = _108 * _64;
    float _134 = _126 * _126;
    float _136 = fma(_106, _54, _124);
    float _138 = _108 * _72;
    float _140 = fma(_106, _62, _132);
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_110, _58, _136);
    float _146 = fma(_106, _70, _138);
    float _148 = fma(_110, _66, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = fma(_110, _74, _146);
    float _154 = _148 + _68;
    float _156 = rsqrt(_150);
    float _158 = _152 + _76;
    float _160 = _128 * _156;
    float _162 = _126 * _156;
    float _164 = _130 * _156;
    out.m_38.x = _160;
    out.m_38.y = _162;
    out.m_38.z = _164;
    float _166 = _98 + _144;
    float _168 = _166 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _170 = _166 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[2].x, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[0].x, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[1].x, _172);
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].x, _174);
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[2].z, _176);
    float _186 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[0].z, _178);
    float _188 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[1].z, _180);
    float _190 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[3].z, _182);
    float _192 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _194 = _186 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _196 = _188 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = _190 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_40.x = _154;
    out.m_40.y = _166;
    out.m_40.z = _158;
    out.gl_Position.x = _194;
    out.gl_Position.y = _196;
    out.gl_Position.z = _192;
    out.gl_Position.w = _198;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

