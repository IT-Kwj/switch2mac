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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c4 [[id(1)]];
};

struct main0_out
{
    float4 m_33 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_35 [[user(locn8)]];
    float4 m_41 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    float4 m_28 [[attribute(9)]];
    float4 m_30 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_24.x;
    float _57 = in.m_24.y;
    float _59 = in.m_24.z;
    float _61 = in.m_26.x;
    float _63 = in.m_26.y;
    float _65 = in.m_26.z;
    float _67 = in.m_28.x;
    float _69 = in.m_28.y;
    float _71 = in.m_30.x;
    float _73 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _93 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _95 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _99 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _101 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _103 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _93);
    float _105 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _107 = _97 * _97;
    float _109 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _101 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _105 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _117 = fma(_103, _103, _107);
    float _119 = _109 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _121 = _105 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _123 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[1].x, _115);
    float _125 = fma(_111, _111, _117);
    float _127 = _105 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[0].x, _121);
    float _131 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[1].z, _123);
    float _133 = rsqrt(_125);
    float _135 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _127);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[0].z, _129);
    float _139 = _131 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_33.z = _67;
    float _141 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[2].z, _135);
    float _143 = _137 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _145 = _139 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    out.m_33.w = _69;
    float _147 = _139 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _149 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[9].x, _145);
    float _151 = _139 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[10].x, _147);
    out.m_35.x = _71;
    float _155 = _139 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[7].x, _151);
    float _159 = _103 * _133;
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[8].x, _155);
    float _163 = _141 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _165 = _97 * _133;
    float _167 = _111 * _133;
    float _169 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[8].z, _161);
    float _171 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[7].z, _157);
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[9].z, _149);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[10].z, _153);
    float _177 = _169 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _179 = _171 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _113;
    out.m_37.y = _105;
    out.m_37.z = _119;
    out.m_39.x = _159;
    out.m_39.y = _165;
    out.m_39.z = _167;
    out.m_41.w = _163;
    out.gl_Position.x = _179;
    out.gl_Position.y = _177;
    out.gl_Position.z = _181;
    out.gl_Position.w = _183;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_24.x;
    float _57 = in.m_24.y;
    float _59 = in.m_24.z;
    float _61 = in.m_26.x;
    float _63 = in.m_26.y;
    float _65 = in.m_26.z;
    float _67 = in.m_28.x;
    float _69 = in.m_28.y;
    float _71 = in.m_30.x;
    float _73 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _93 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _95 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _99 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _101 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _103 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _93);
    float _105 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _107 = _97 * _97;
    float _109 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _101 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _105 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _117 = fma(_103, _103, _107);
    float _119 = _109 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _121 = _105 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _123 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[1].x, _115);
    float _125 = fma(_111, _111, _117);
    float _127 = _105 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[0].x, _121);
    float _131 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[1].z, _123);
    float _133 = rsqrt(_125);
    float _135 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _127);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[0].z, _129);
    float _139 = _131 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_33.z = _67;
    float _141 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[2].z, _135);
    float _143 = _137 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _145 = _139 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    out.m_33.w = _69;
    float _147 = _139 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _149 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[9].x, _145);
    float _151 = _139 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[10].x, _147);
    out.m_35.x = _71;
    float _155 = _139 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[7].x, _151);
    float _159 = _103 * _133;
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[8].x, _155);
    float _163 = _141 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _165 = _97 * _133;
    float _167 = _111 * _133;
    float _169 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[8].z, _161);
    float _171 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[7].z, _157);
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[9].z, _149);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[10].z, _153);
    float _177 = _169 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _179 = _171 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _113;
    out.m_37.y = _105;
    out.m_37.z = _119;
    out.m_39.x = _159;
    out.m_39.y = _165;
    out.m_39.z = _167;
    out.m_41.w = _163;
    out.gl_Position.x = _179;
    out.gl_Position.y = _177;
    out.gl_Position.z = _181;
    out.gl_Position.w = _183;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_24.x;
    float _57 = in.m_24.y;
    float _59 = in.m_24.z;
    float _61 = in.m_26.x;
    float _63 = in.m_26.y;
    float _65 = in.m_26.z;
    float _67 = in.m_28.x;
    float _69 = in.m_28.y;
    float _71 = in.m_30.x;
    float _73 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _93 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _95 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _99 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _101 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _103 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _93);
    float _105 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _107 = _97 * _97;
    float _109 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _101 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _105 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _117 = fma(_103, _103, _107);
    float _119 = _109 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _121 = _105 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _123 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[1].x, _115);
    float _125 = fma(_111, _111, _117);
    float _127 = _105 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[0].x, _121);
    float _131 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[1].z, _123);
    float _133 = rsqrt(_125);
    float _135 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _127);
    float _137 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[0].z, _129);
    float _139 = _131 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_33.z = _67;
    float _141 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[2].z, _135);
    float _143 = _137 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _145 = _139 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    out.m_33.w = _69;
    float _147 = _139 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _149 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[9].x, _145);
    float _151 = _139 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _153 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[10].x, _147);
    out.m_35.x = _71;
    float _155 = _139 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[7].x, _151);
    float _159 = _103 * _133;
    float _161 = fma(_143, (*spvDescriptorSet0.vp_c4)._m0[8].x, _155);
    float _163 = _141 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _165 = _97 * _133;
    float _167 = _111 * _133;
    float _169 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[8].z, _161);
    float _171 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[7].z, _157);
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[9].z, _149);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[10].z, _153);
    float _177 = _169 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _179 = _171 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _113;
    out.m_37.y = _105;
    out.m_37.z = _119;
    out.m_39.x = _159;
    out.m_39.y = _165;
    out.m_39.z = _167;
    out.m_41.w = _163;
    out.gl_Position.x = _179;
    out.gl_Position.y = _177;
    out.gl_Position.z = _181;
    out.gl_Position.w = _183;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

