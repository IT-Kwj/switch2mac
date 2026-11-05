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
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    uint4 m_23 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = as_type<float>(in.m_23.x);
    int _43 = as_type<int>(_40) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _45 = _43 << 4;
    int _47 = _45 + 160;
    uint _50 = uint(int(uint(_47) >> uint(2)));
    uint _52 = uint(int(uint(int(_50)) >> uint(2)));
    int _54 = int(_50) & 3;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[int(_52)][_54];
    uint _58 = uint(int(uint(as_type<int>(_56)) >> uint(5)));
    int _60 = int(_58) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _62 = _60 << 4;
    int _64 = _62 + 160;
    float _66 = in.m_26.x;
    float _68 = in.m_26.y;
    float _70 = in.m_26.z;
    uint _72 = uint(int(uint(_64) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c3)._m0[int(_74)][_76];
    float _80 = _68 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _82 = _68 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _86 = _68 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _88 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].x, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].x, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].x, _84);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].x, _86);
    int _96 = as_type<int>(_56) & 31;
    bool _100 = uint(_96) < 32u;
    int _102 = 1 << _96;
    int _104 = _100 ? _102 : 0;
    float _106 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[2].z, _88);
    float _108 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    float _110 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[4].z, _92);
    float _112 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[5].z, _94);
    float _114 = _108 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _116 = _110 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _118 = _104 & as_type<int>(_78);
    bool _120 = _118 != 0;
    float _122 = _106 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _124 = _112 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _122;
    out.gl_Position.y = _114;
    out.gl_Position.z = _116;
    out.gl_Position.w = _124;
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.w = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = as_type<float>(in.m_23.x);
    int _43 = as_type<int>(_40) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _45 = _43 << 4;
    int _47 = _45 + 160;
    uint _50 = uint(int(uint(_47) >> uint(2)));
    uint _52 = uint(int(uint(int(_50)) >> uint(2)));
    int _54 = int(_50) & 3;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[int(_52)][_54];
    uint _58 = uint(int(uint(as_type<int>(_56)) >> uint(5)));
    int _60 = int(_58) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _62 = _60 << 4;
    int _64 = _62 + 160;
    float _66 = in.m_26.x;
    float _68 = in.m_26.y;
    float _70 = in.m_26.z;
    uint _72 = uint(int(uint(_64) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c3)._m0[int(_74)][_76];
    float _80 = _68 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _82 = _68 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _86 = _68 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _88 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].x, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].x, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].x, _84);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].x, _86);
    int _96 = as_type<int>(_56) & 31;
    bool _100 = uint(_96) < 32u;
    int _102 = 1 << _96;
    int _104 = _100 ? _102 : 0;
    float _106 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[2].z, _88);
    float _108 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    float _110 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[4].z, _92);
    float _112 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[5].z, _94);
    float _114 = _108 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _116 = _110 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _118 = _104 & as_type<int>(_78);
    bool _120 = _118 != 0;
    float _122 = _106 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _124 = _112 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _122;
    out.gl_Position.y = _114;
    out.gl_Position.z = _116;
    out.gl_Position.w = _124;
    if (_120)
    {
        return out;
    }
    out.gl_Position.w = -1.0;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = as_type<float>(in.m_23.x);
    int _43 = as_type<int>(_40) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _45 = _43 << 4;
    int _47 = _45 + 160;
    uint _50 = uint(int(uint(_47) >> uint(2)));
    uint _52 = uint(int(uint(int(_50)) >> uint(2)));
    int _54 = int(_50) & 3;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[int(_52)][_54];
    uint _58 = uint(int(uint(as_type<int>(_56)) >> uint(5)));
    int _60 = int(_58) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _62 = _60 << 4;
    int _64 = _62 + 160;
    float _66 = in.m_26.x;
    float _68 = in.m_26.y;
    float _70 = in.m_26.z;
    uint _72 = uint(int(uint(_64) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c3)._m0[int(_74)][_76];
    float _80 = _68 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _82 = _68 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _84 = _68 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _86 = _68 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _88 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].x, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].x, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].x, _84);
    float _94 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].x, _86);
    int _96 = as_type<int>(_56) & 31;
    bool _100 = uint(_96) < 32u;
    int _102 = 1 << _96;
    int _104 = _100 ? _102 : 0;
    float _106 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[2].z, _88);
    float _108 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    float _110 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[4].z, _92);
    float _112 = fma(_70, (*spvDescriptorSet0.vp_c3)._m0[5].z, _94);
    float _114 = _108 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _116 = _110 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _118 = _104 & as_type<int>(_78);
    bool _120 = _118 != 0;
    float _122 = _106 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _124 = _112 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _122;
    out.gl_Position.y = _114;
    out.gl_Position.z = _116;
    out.gl_Position.w = _124;
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

