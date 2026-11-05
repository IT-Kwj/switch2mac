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
    texture2d<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _134 = float2(0.5);
    float _50 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_134, float2(0.0), isnan(_134)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_134, float2(0.0), isnan(_134)), level(0.0)).x;
    float2 _142 = float2(0.5);
    float _52 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_142, float2(0.0), isnan(_142)), level(0.0)).y;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_29.y;
    float _60 = in.m_29.x;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _66 = _62 * _54;
    float _68 = _64 * _56;
    float _70 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _72 = _58 + _70;
    float _74 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    out.m_32.y = _58;
    float _76 = _72 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _78 = _72 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _80 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _82 = _60 + _80;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _86 = -_74;
    float _88 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].w, _86);
    out.m_32.x = _60;
    float _90 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[4].x, _76);
    float _92 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[5].x, _78);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[1].w, _84);
    float _96 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _98 = _90 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _100 = _92 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _102 = _94 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.m_34.x = _98;
    out.m_34.y = _100;
    out.gl_Position.x = _102;
    out.gl_Position.y = _96;
    float _104 = _50 * _52;
    float _106 = _104 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _110 = _106 > 0.0;
    bool _112 = isnan(_106);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    out.m_36.x = _106;
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _134 = float2(0.5);
    float _50 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_134, float2(0.0), isnan(_134)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_134, float2(0.0), isnan(_134)), level(0.0)).x;
    float2 _142 = float2(0.5);
    float _52 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_142, float2(0.0), isnan(_142)), level(0.0)).y;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_29.y;
    float _60 = in.m_29.x;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _66 = _62 * _54;
    float _68 = _64 * _56;
    float _70 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _72 = _58 + _70;
    float _74 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    out.m_32.y = _58;
    float _76 = _72 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _78 = _72 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _80 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _82 = _60 + _80;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _86 = -_74;
    float _88 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].w, _86);
    out.m_32.x = _60;
    float _90 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[4].x, _76);
    float _92 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[5].x, _78);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[1].w, _84);
    float _96 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _98 = _90 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _100 = _92 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _102 = _94 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.m_34.x = _98;
    out.m_34.y = _100;
    out.gl_Position.x = _102;
    out.gl_Position.y = _96;
    float _104 = _50 * _52;
    float _106 = _104 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _110 = _106 > 0.0;
    bool _112 = isnan(_106);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    out.m_36.x = _106;
    if (_118)
    {
        return out;
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float2 _134 = float2(0.5);
    float _50 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_134, float2(0.0), isnan(_134)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_134, float2(0.0), isnan(_134)), level(0.0)).x;
    float2 _142 = float2(0.5);
    float _52 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_142, float2(0.0), isnan(_142)), level(0.0)).y;
    float _54 = in.m_27.x;
    float _56 = in.m_27.y;
    float _58 = in.m_29.y;
    float _60 = in.m_29.x;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[2].x, (*spvDescriptorSet0.vp_c3)._m0[3].x, (*spvDescriptorSet0.vp_c3)._m0[3].z);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[2].y, (*spvDescriptorSet0.vp_c3)._m0[3].y, (*spvDescriptorSet0.vp_c3)._m0[3].w);
    float _66 = _62 * _54;
    float _68 = _64 * _56;
    float _70 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _72 = _58 + _70;
    float _74 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    out.m_32.y = _58;
    float _76 = _72 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _78 = _72 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _80 = -(*spvDescriptorSet0.vp_c3)._m0[6].x;
    float _82 = _60 + _80;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _86 = -_74;
    float _88 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].w, _86);
    out.m_32.x = _60;
    float _90 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[4].x, _76);
    float _92 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[5].x, _78);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[1].w, _84);
    float _96 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[2].z, (*spvDescriptorSet0.vp_c3)._m0[1].y);
    float _98 = _90 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _100 = _92 + (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _102 = _94 + (*spvDescriptorSet0.vp_c3)._m0[1].x;
    out.m_34.x = _98;
    out.m_34.y = _100;
    out.gl_Position.x = _102;
    out.gl_Position.y = _96;
    float _104 = _50 * _52;
    float _106 = _104 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _110 = _106 > 0.0;
    bool _112 = isnan(_106);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    out.m_36.x = _106;
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.x = 100.0;
    out.gl_Position.y = 100.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

