#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_26 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
    float4 m_31 [[attribute(1)]];
    float4 m_33 [[attribute(4)]];
    uint4 m_23 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    int _50 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _54 = _50 != 0;
    int _56 = 0;
    if (!_54)
    {
        _56 = 1073741824;
    }
    int _58 = _56;
    if (!_54)
    {
        out.m_26.x = 0.0;
    }
    int _60 = 0;
    if (!_54)
    {
        _60 = 1065353216;
    }
    int _62 = _60;
    if (!_54)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _185 = as_type<float>(_58);
        out.gl_Position.z = _185;
        float _188 = as_type<float>(_62);
        out.gl_Position.w = _188;
    }
    if (!_54)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _64 = in.m_29.x;
    float _66 = in.m_29.y;
    float _68 = in.m_29.z;
    float _70 = in.m_31.x;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.z;
    float _78 = in.m_33.w;
    float _80 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _82 = _66 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _86 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[0].x, _82);
    float _90 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _84);
    out.gl_PointSize = _70;
    float _92 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _86);
    float _94 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[0].z, _88);
    float _96 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _90);
    out.m_26.x = _72;
    float _98 = _92 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _100 = _94 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = _96 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    out.m_26.y = _74;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _106 = _98 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _108 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _110 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _112 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[4].x, _104);
    float _114 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[3].x, _106);
    float _116 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[5].x, _108);
    float _118 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[6].x, _110);
    float _120 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[4].z, _112);
    float _122 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    float _124 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[5].z, _116);
    float _126 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[6].z, _118);
    float _128 = _120 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _130 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _76;
    out.m_26.w = _78;
    out.gl_Position.x = _130;
    out.gl_Position.y = _128;
    out.gl_Position.z = _132;
    out.gl_Position.w = _134;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    int _50 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _54 = _50 != 0;
    int _56 = 0;
    if (!_54)
    {
        _56 = 1073741824;
    }
    int _58 = _56;
    if (!_54)
    {
        out.m_26.x = 0.0;
    }
    int _60 = 0;
    if (!_54)
    {
        _60 = 1065353216;
    }
    int _62 = _60;
    if (!_54)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _185 = as_type<float>(_58);
        out.gl_Position.z = _185;
        float _188 = as_type<float>(_62);
        out.gl_Position.w = _188;
    }
    if (!_54)
    {
        return out;
    }
    float _64 = in.m_29.x;
    float _66 = in.m_29.y;
    float _68 = in.m_29.z;
    float _70 = in.m_31.x;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.z;
    float _78 = in.m_33.w;
    float _80 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _82 = _66 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _86 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[0].x, _82);
    float _90 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _84);
    out.gl_PointSize = _70;
    float _92 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _86);
    float _94 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[0].z, _88);
    float _96 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _90);
    out.m_26.x = _72;
    float _98 = _92 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _100 = _94 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = _96 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    out.m_26.y = _74;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _106 = _98 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _108 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _110 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _112 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[4].x, _104);
    float _114 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[3].x, _106);
    float _116 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[5].x, _108);
    float _118 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[6].x, _110);
    float _120 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[4].z, _112);
    float _122 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    float _124 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[5].z, _116);
    float _126 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[6].z, _118);
    float _128 = _120 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _130 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _76;
    out.m_26.w = _78;
    out.gl_Position.x = _130;
    out.gl_Position.y = _128;
    out.gl_Position.z = _132;
    out.gl_Position.w = _134;
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
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    int _50 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _54 = _50 != 0;
    int _56 = 0;
    if (!_54)
    {
        _56 = 1073741824;
    }
    int _58 = _56;
    if (!_54)
    {
        out.m_26.x = 0.0;
    }
    int _60 = 0;
    if (!_54)
    {
        _60 = 1065353216;
    }
    int _62 = _60;
    if (!_54)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _185 = as_type<float>(_58);
        out.gl_Position.z = _185;
        float _188 = as_type<float>(_62);
        out.gl_Position.w = _188;
    }
    if (!_54)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _64 = in.m_29.x;
    float _66 = in.m_29.y;
    float _68 = in.m_29.z;
    float _70 = in.m_31.x;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.z;
    float _78 = in.m_33.w;
    float _80 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _82 = _66 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _86 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[0].x, _82);
    float _90 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _84);
    out.gl_PointSize = _70;
    float _92 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _86);
    float _94 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[0].z, _88);
    float _96 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _90);
    out.m_26.x = _72;
    float _98 = _92 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _100 = _94 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = _96 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    out.m_26.y = _74;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _106 = _98 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _108 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _110 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _112 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[4].x, _104);
    float _114 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[3].x, _106);
    float _116 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[5].x, _108);
    float _118 = fma(_100, (*spvDescriptorSet0.vp_c3)._m0[6].x, _110);
    float _120 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[4].z, _112);
    float _122 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    float _124 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[5].z, _116);
    float _126 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[6].z, _118);
    float _128 = _120 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _130 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _76;
    out.m_26.w = _78;
    out.gl_Position.x = _130;
    out.gl_Position.y = _128;
    out.gl_Position.z = _132;
    out.gl_Position.w = _134;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

