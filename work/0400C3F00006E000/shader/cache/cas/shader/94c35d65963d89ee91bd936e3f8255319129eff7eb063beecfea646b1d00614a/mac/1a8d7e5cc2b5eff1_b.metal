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
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
    float4 m_27 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    out.m_25.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    out.m_27.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _51 = _45 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _45 >= 0.0;
    bool _57 = isnan(_45);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = _84;
    if (!_51)
    {
        int _88 = ~_76;
        int _90 = _88 + 1;
        _86 = _90;
    }
    int _92 = _86;
    int _94 = ~_78;
    int _96 = _94 + 1;
    int _98 = _96 + 1;
    int _100 = _98;
    if (!_53)
    {
        int _102 = ~_78;
        int _104 = _102 + 1;
        _100 = _104;
    }
    int _106 = _100;
    float _108 = float(_92);
    float _110 = float(_106);
    float _112 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float _114 = fma(_108, 0.5, 0.5);
    float _116 = fma(_110, -0.5, 0.5);
    float _118 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].w);
    float _120 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[1].x, (*spvDescriptorSet0.vp_c3)._m0[1].z);
    float _122 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[1].y, (*spvDescriptorSet0.vp_c3)._m0[1].w);
    float _124 = _120 * 3.1415927410125732421875;
    float _126 = _120 * 9.424777984619140625;
    float _128 = _120 * 15.7079639434814453125;
    float _130 = _122 * 3.1415927410125732421875;
    float _132 = _122 * 9.424777984619140625;
    float _134 = _120 * 78.53981781005859375;
    float _136 = _122 * 15.7079639434814453125;
    float _138 = _122 * 78.53981781005859375;
    out.gl_Position.x = _112;
    out.gl_Position.y = _118;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.m_25.x = _120;
    out.m_27.x = _120;
    out.m_25.y = _122;
    out.m_27.y = _122;
    out.m_29.x = _124;
    out.m_29.y = _130;
    out.m_29.z = _126;
    out.m_29.w = _132;
    out.m_31.x = _128;
    out.m_31.y = _136;
    out.m_31.z = _134;
    out.m_31.w = _138;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    out.m_25.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    out.m_27.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _51 = _45 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _45 >= 0.0;
    bool _57 = isnan(_45);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = _84;
    if (!_51)
    {
        int _88 = ~_76;
        int _90 = _88 + 1;
        _86 = _90;
    }
    int _92 = _86;
    int _94 = ~_78;
    int _96 = _94 + 1;
    int _98 = _96 + 1;
    int _100 = _98;
    if (!_53)
    {
        int _102 = ~_78;
        int _104 = _102 + 1;
        _100 = _104;
    }
    int _106 = _100;
    float _108 = float(_92);
    float _110 = float(_106);
    float _112 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float _114 = fma(_108, 0.5, 0.5);
    float _116 = fma(_110, -0.5, 0.5);
    float _118 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].w);
    float _120 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[1].x, (*spvDescriptorSet0.vp_c3)._m0[1].z);
    float _122 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[1].y, (*spvDescriptorSet0.vp_c3)._m0[1].w);
    float _124 = _120 * 3.1415927410125732421875;
    float _126 = _120 * 9.424777984619140625;
    float _128 = _120 * 15.7079639434814453125;
    float _130 = _122 * 3.1415927410125732421875;
    float _132 = _122 * 9.424777984619140625;
    float _134 = _120 * 78.53981781005859375;
    float _136 = _122 * 15.7079639434814453125;
    float _138 = _122 * 78.53981781005859375;
    out.gl_Position.x = _112;
    out.gl_Position.y = _118;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.m_25.x = _120;
    out.m_27.x = _120;
    out.m_25.y = _122;
    out.m_27.y = _122;
    out.m_29.x = _124;
    out.m_29.y = _130;
    out.m_29.z = _126;
    out.m_29.w = _132;
    out.m_31.x = _128;
    out.m_31.y = _136;
    out.m_31.z = _134;
    out.m_31.w = _138;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    out.m_25.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    out.m_27.w = (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _51 = _45 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _45 >= 0.0;
    bool _57 = isnan(_45);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = _84;
    if (!_51)
    {
        int _88 = ~_76;
        int _90 = _88 + 1;
        _86 = _90;
    }
    int _92 = _86;
    int _94 = ~_78;
    int _96 = _94 + 1;
    int _98 = _96 + 1;
    int _100 = _98;
    if (!_53)
    {
        int _102 = ~_78;
        int _104 = _102 + 1;
        _100 = _104;
    }
    int _106 = _100;
    float _108 = float(_92);
    float _110 = float(_106);
    float _112 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[0].x, (*spvDescriptorSet0.vp_c3)._m0[0].z);
    float _114 = fma(_108, 0.5, 0.5);
    float _116 = fma(_110, -0.5, 0.5);
    float _118 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[0].y, (*spvDescriptorSet0.vp_c3)._m0[0].w);
    float _120 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[1].x, (*spvDescriptorSet0.vp_c3)._m0[1].z);
    float _122 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[1].y, (*spvDescriptorSet0.vp_c3)._m0[1].w);
    float _124 = _120 * 3.1415927410125732421875;
    float _126 = _120 * 9.424777984619140625;
    float _128 = _120 * 15.7079639434814453125;
    float _130 = _122 * 3.1415927410125732421875;
    float _132 = _122 * 9.424777984619140625;
    float _134 = _120 * 78.53981781005859375;
    float _136 = _122 * 15.7079639434814453125;
    float _138 = _122 * 78.53981781005859375;
    out.gl_Position.x = _112;
    out.gl_Position.y = _118;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.m_25.x = _120;
    out.m_27.x = _120;
    out.m_25.y = _122;
    out.m_27.y = _122;
    out.m_29.x = _124;
    out.m_29.y = _130;
    out.m_29.z = _126;
    out.m_29.w = _132;
    out.m_31.x = _128;
    out.m_31.y = _136;
    out.m_31.z = _134;
    out.m_31.w = _138;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

