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
    float4 m_25 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    float _53 = _51 * 2.0;
    float _55 = _49 * 2.0;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.gl_Position.x = _55;
    out.gl_Position.y = _53;
    out.gl_Position.z = 1.0;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[0].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[1].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[2].x, _61);
    float _69 = _53 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _71 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _73 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _79 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _81 = _53 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _83 = _53 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _87 = _53 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _89 = _53 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _91 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _93 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _95 = _53 * (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _97 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
    float _99 = _63 + (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _101 = _65 + (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _103 = _67 + (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[3].x, _69);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _73);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    float _111 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _113 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].x, _77);
    float _115 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].x, _79);
    float _117 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[9].x, _81);
    float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[10].x, _83);
    float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[11].x, _85);
    float _123 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[12].x, _87);
    float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[13].x, _89);
    float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _91);
    float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _93);
    float _131 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[16].x, _95);
    float _133 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _97);
    out.m_25.x = _99;
    out.m_25.y = _101;
    out.m_25.z = _103;
    float _135 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c3)._m0[5].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _143 = _113 + (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _145 = _115 + (*spvDescriptorSet0.vp_c3)._m0[8].z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c3)._m0[9].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c3)._m0[10].z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c3)._m0[12].z;
    float _155 = _125 + (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _159 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    float _163 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].z;
    out.m_27.x = _135;
    out.m_27.y = _137;
    out.m_27.z = _139;
    out.m_29.x = _141;
    out.m_29.y = _143;
    out.m_29.z = _145;
    out.m_31.x = _147;
    out.m_31.y = _149;
    out.m_31.z = _151;
    out.m_33.x = _153;
    out.m_33.y = _155;
    out.m_33.z = _157;
    out.m_35.x = _159;
    out.m_35.y = _161;
    out.m_35.z = _163;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    float _53 = _51 * 2.0;
    float _55 = _49 * 2.0;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.gl_Position.x = _55;
    out.gl_Position.y = _53;
    out.gl_Position.z = 1.0;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[0].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[1].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[2].x, _61);
    float _69 = _53 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _71 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _73 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _79 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _81 = _53 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _83 = _53 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _87 = _53 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _89 = _53 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _91 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _93 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _95 = _53 * (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _97 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
    float _99 = _63 + (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _101 = _65 + (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _103 = _67 + (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[3].x, _69);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _73);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    float _111 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _113 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].x, _77);
    float _115 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].x, _79);
    float _117 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[9].x, _81);
    float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[10].x, _83);
    float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[11].x, _85);
    float _123 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[12].x, _87);
    float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[13].x, _89);
    float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _91);
    float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _93);
    float _131 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[16].x, _95);
    float _133 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _97);
    out.m_25.x = _99;
    out.m_25.y = _101;
    out.m_25.z = _103;
    float _135 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c3)._m0[5].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _143 = _113 + (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _145 = _115 + (*spvDescriptorSet0.vp_c3)._m0[8].z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c3)._m0[9].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c3)._m0[10].z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c3)._m0[12].z;
    float _155 = _125 + (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _159 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    float _163 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].z;
    out.m_27.x = _135;
    out.m_27.y = _137;
    out.m_27.z = _139;
    out.m_29.x = _141;
    out.m_29.y = _143;
    out.m_29.z = _145;
    out.m_31.x = _147;
    out.m_31.y = _149;
    out.m_31.z = _151;
    out.m_33.x = _153;
    out.m_33.y = _155;
    out.m_33.z = _157;
    out.m_35.x = _159;
    out.m_35.y = _161;
    out.m_35.z = _163;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    float _53 = _51 * 2.0;
    float _55 = _49 * 2.0;
    float _57 = _53 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _59 = _53 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    out.gl_Position.x = _55;
    out.gl_Position.y = _53;
    out.gl_Position.z = 1.0;
    float _63 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[0].x, _57);
    float _65 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[1].x, _59);
    float _67 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[2].x, _61);
    float _69 = _53 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _71 = _53 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _73 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _79 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _81 = _53 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _83 = _53 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _87 = _53 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _89 = _53 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _91 = _53 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _93 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _95 = _53 * (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _97 = _53 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
    float _99 = _63 + (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _101 = _65 + (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _103 = _67 + (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[3].x, _69);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].x, _73);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    float _111 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _113 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].x, _77);
    float _115 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].x, _79);
    float _117 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[9].x, _81);
    float _119 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[10].x, _83);
    float _121 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[11].x, _85);
    float _123 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[12].x, _87);
    float _125 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[13].x, _89);
    float _127 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[14].x, _91);
    float _129 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[15].x, _93);
    float _131 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[16].x, _95);
    float _133 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[17].x, _97);
    out.m_25.x = _99;
    out.m_25.y = _101;
    out.m_25.z = _103;
    float _135 = _105 + (*spvDescriptorSet0.vp_c3)._m0[3].z;
    float _137 = _109 + (*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c3)._m0[5].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c3)._m0[6].z;
    float _143 = _113 + (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _145 = _115 + (*spvDescriptorSet0.vp_c3)._m0[8].z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c3)._m0[9].z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c3)._m0[10].z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c3)._m0[12].z;
    float _155 = _125 + (*spvDescriptorSet0.vp_c3)._m0[13].z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _159 = _129 + (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _161 = _131 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    float _163 = _133 + (*spvDescriptorSet0.vp_c3)._m0[17].z;
    out.m_27.x = _135;
    out.m_27.y = _137;
    out.m_27.z = _139;
    out.m_29.x = _141;
    out.m_29.y = _143;
    out.m_29.z = _145;
    out.m_31.x = _147;
    out.m_31.y = _149;
    out.m_31.z = _151;
    out.m_33.x = _153;
    out.m_33.y = _155;
    out.m_33.z = _157;
    out.m_35.x = _159;
    out.m_35.y = _161;
    out.m_35.z = _163;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

