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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    const device _23* vp_s0 [[id(1)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = as_type<float>(int(gl_InstanceIndex));
    float _65 = as_type<float>(int(gl_BaseInstance));
    int _68 = as_type<int>(_63) - as_type<int>(_65);
    float _70 = in.m_34.x;
    float _72 = in.m_34.y;
    float _74 = in.m_34.z;
    int _76 = _68 << 5;
    int _78 = _76 + 20;
    uint _81 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _76 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _76 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _76 + 16;
    uint _99 = uint(int(uint(_78) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_99)]);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    float _105 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_103)]);
    int _107 = _76 + 28;
    int _109 = _76 + 12;
    int _111 = _76 + 24;
    uint _113 = uint(int(uint(_107) >> uint(2)));
    float _115 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_113)]);
    uint _117 = uint(int(uint(_109) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    uint _121 = uint(int(uint(_111) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_121)]);
    float _125 = _72 + (-0.5);
    float _127 = fma(_125, _101, _89);
    float _129 = fma(_105, _70, _83);
    float _131 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _133 = fma(_105, _74, _95);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].x, _131);
    float _137 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].z, _135);
    float _139 = _137 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _141 = _127 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _143 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _145 = 1.0 / _139;
    float _147 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[0].x, _141);
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].x, _143);
    float _151 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[0].z, _147);
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].z, _149);
    float _157 = 1.0 / _105;
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = _153 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _167 = _161 * _145;
    float _169 = _163 * _145;
    float _171 = _165 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = fma(_167, 0.5, 0.5);
    float _175 = fma(_169, -0.5, 0.5);
    out.m_37.x = _83;
    out.m_37.y = _95;
    out.m_39.x = _119;
    out.m_41.x = _123;
    out.m_43.x = _115;
    out.m_45.x = _157;
    out.gl_Position.x = _161;
    out.gl_Position.y = _163;
    out.gl_Position.z = _171;
    out.gl_Position.w = _139;
    out.m_47.x = _167;
    out.m_47.y = _169;
    out.m_49.x = _173;
    out.m_49.y = _175;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = as_type<float>(int(gl_InstanceIndex));
    float _65 = as_type<float>(int(gl_BaseInstance));
    int _68 = as_type<int>(_63) - as_type<int>(_65);
    float _70 = in.m_34.x;
    float _72 = in.m_34.y;
    float _74 = in.m_34.z;
    int _76 = _68 << 5;
    int _78 = _76 + 20;
    uint _81 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _76 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _76 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _76 + 16;
    uint _99 = uint(int(uint(_78) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_99)]);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    float _105 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_103)]);
    int _107 = _76 + 28;
    int _109 = _76 + 12;
    int _111 = _76 + 24;
    uint _113 = uint(int(uint(_107) >> uint(2)));
    float _115 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_113)]);
    uint _117 = uint(int(uint(_109) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    uint _121 = uint(int(uint(_111) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_121)]);
    float _125 = _72 + (-0.5);
    float _127 = fma(_125, _101, _89);
    float _129 = fma(_105, _70, _83);
    float _131 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _133 = fma(_105, _74, _95);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].x, _131);
    float _137 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].z, _135);
    float _139 = _137 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _141 = _127 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _143 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _145 = 1.0 / _139;
    float _147 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[0].x, _141);
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].x, _143);
    float _151 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[0].z, _147);
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].z, _149);
    float _157 = 1.0 / _105;
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = _153 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _167 = _161 * _145;
    float _169 = _163 * _145;
    float _171 = _165 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = fma(_167, 0.5, 0.5);
    float _175 = fma(_169, -0.5, 0.5);
    out.m_37.x = _83;
    out.m_37.y = _95;
    out.m_39.x = _119;
    out.m_41.x = _123;
    out.m_43.x = _115;
    out.m_45.x = _157;
    out.gl_Position.x = _161;
    out.gl_Position.y = _163;
    out.gl_Position.z = _171;
    out.gl_Position.w = _139;
    out.m_47.x = _167;
    out.m_47.y = _169;
    out.m_49.x = _173;
    out.m_49.y = _175;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = as_type<float>(int(gl_InstanceIndex));
    float _65 = as_type<float>(int(gl_BaseInstance));
    int _68 = as_type<int>(_63) - as_type<int>(_65);
    float _70 = in.m_34.x;
    float _72 = in.m_34.y;
    float _74 = in.m_34.z;
    int _76 = _68 << 5;
    int _78 = _76 + 20;
    uint _81 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw0.x);
    int _85 = _76 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.y);
    int _91 = _76 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.z);
    int _97 = _76 + 16;
    uint _99 = uint(int(uint(_78) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_99)]);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    float _105 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_103)]);
    int _107 = _76 + 28;
    int _109 = _76 + 12;
    int _111 = _76 + 24;
    uint _113 = uint(int(uint(_107) >> uint(2)));
    float _115 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_113)]);
    uint _117 = uint(int(uint(_109) >> uint(2)));
    float _119 = as_type<float>(_dmw0.w);
    uint _121 = uint(int(uint(_111) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_121)]);
    float _125 = _72 + (-0.5);
    float _127 = fma(_125, _101, _89);
    float _129 = fma(_105, _70, _83);
    float _131 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _133 = fma(_105, _74, _95);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].x, _131);
    float _137 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].z, _135);
    float _139 = _137 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _141 = _127 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _143 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _145 = 1.0 / _139;
    float _147 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[0].x, _141);
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].x, _143);
    float _151 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[0].z, _147);
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].z, _149);
    float _157 = 1.0 / _105;
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = _153 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _167 = _161 * _145;
    float _169 = _163 * _145;
    float _171 = _165 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = fma(_167, 0.5, 0.5);
    float _175 = fma(_169, -0.5, 0.5);
    out.m_37.x = _83;
    out.m_37.y = _95;
    out.m_39.x = _119;
    out.m_41.x = _123;
    out.m_43.x = _115;
    out.m_45.x = _157;
    out.gl_Position.x = _161;
    out.gl_Position.y = _163;
    out.gl_Position.z = _171;
    out.gl_Position.w = _139;
    out.m_47.x = _167;
    out.m_47.y = _169;
    out.m_49.x = _173;
    out.m_49.y = _175;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

