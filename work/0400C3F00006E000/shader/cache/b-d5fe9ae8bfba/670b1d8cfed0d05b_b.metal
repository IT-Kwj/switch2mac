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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_39 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    float4 m_24 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_24.x;
    float _59 = in.m_24.y;
    float _61 = in.m_24.z;
    float _63 = in.m_24.w;
    float _65 = in.m_26.x;
    float _67 = in.m_26.y;
    float _69 = in.m_26.z;
    float _71 = in.m_28.y;
    float _73 = in.m_28.x;
    float _75 = in.m_26.w;
    float _77 = in.m_28.z;
    bool _81 = _57 > 2.0;
    float _83 = _59 * _59;
    bool _85 = _61 > 2.0;
    out.m_31.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_31.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].y, _67);
    float _91 = _67 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _93 = _67 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _95 = _67 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_33.y = _71;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[10].x, _91);
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[11].x, _93);
    float _101 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[12].x, _95);
    float _103 = _57;
    float _105 = _61;
    if (_81)
    {
        float _107 = _57 + (-10.0);
        _103 = _107;
    }
    float _109 = _103;
    float _111 = _67 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _113 = _63 * _63;
    if (_85)
    {
        float _115 = _61 + (-10.0);
        _105 = _115;
    }
    float _117 = _105;
    float _119 = fma(_109, _109, _83);
    out.m_33.x = _73;
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[13].x, _111);
    float _123 = fma(_117, _117, _113);
    out.m_35.x = _75;
    float _125 = sqrt(_119);
    float _127 = _89 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _129 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].y, _65);
    out.m_33.z = _77;
    float _131 = _87 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _133 = sqrt(_123);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[13].x, _127);
    float _137 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[13].z, _121);
    float _139 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].x, _65);
    float _141 = _81 ? (-1.0) : 1.0;
    float _143 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[12].z, _101);
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[13].x, _131);
    float _149 = -_125;
    float _151 = _149 + 1.0;
    float _153 = _85 ? (-1.0) : 1.0;
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[10].z, _97);
    float _157 = _117 * _59;
    float _159 = _141 * _151;
    float _161 = 1.0 / _145;
    float _163 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[11].z, _99);
    float _165 = _63 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _167 = -_133;
    float _169 = _167 + 1.0;
    float _171 = -_157;
    float _173 = fma(_109, _63, _171);
    float _175 = _159 * _63;
    float _177 = _155 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _179 = _153 * _169;
    float _181 = _163 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _183 = _143 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].y, _69);
    float _187 = _109 * _179;
    float _189 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].x, _69);
    float _191 = -_175;
    float _193 = fma(_179, _59, _191);
    out.gl_Position.x = _177;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _145;
    float _195 = -_187;
    float _197 = fma(_159, _117, _195);
    float _199 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[15].x, _165);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c3)._m0[13].z, _147);
    float _203 = _197 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].z, _135);
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[15].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[15].x, _203);
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_37.z = _207;
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[15].z, _211);
    float _217 = _177 * _161;
    float _219 = _181 * _161;
    out.m_39.w = _209;
    float _221 = fma(_217, 0.5, 0.5);
    float _223 = fma(_219, -0.5, 0.5);
    out.m_41.w = _213;
    out.m_43.x = _221;
    out.m_43.y = _223;
    out.m_37.x = _215;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_24.x;
    float _59 = in.m_24.y;
    float _61 = in.m_24.z;
    float _63 = in.m_24.w;
    float _65 = in.m_26.x;
    float _67 = in.m_26.y;
    float _69 = in.m_26.z;
    float _71 = in.m_28.y;
    float _73 = in.m_28.x;
    float _75 = in.m_26.w;
    float _77 = in.m_28.z;
    bool _81 = _57 > 2.0;
    float _83 = _59 * _59;
    bool _85 = _61 > 2.0;
    out.m_31.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_31.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].y, _67);
    float _91 = _67 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _93 = _67 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _95 = _67 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_33.y = _71;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[10].x, _91);
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[11].x, _93);
    float _101 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[12].x, _95);
    float _103 = _57;
    float _105 = _61;
    if (_81)
    {
        float _107 = _57 + (-10.0);
        _103 = _107;
    }
    float _109 = _103;
    float _111 = _67 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _113 = _63 * _63;
    if (_85)
    {
        float _115 = _61 + (-10.0);
        _105 = _115;
    }
    float _117 = _105;
    float _119 = fma(_109, _109, _83);
    out.m_33.x = _73;
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[13].x, _111);
    float _123 = fma(_117, _117, _113);
    out.m_35.x = _75;
    float _125 = sqrt(_119);
    float _127 = _89 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _129 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].y, _65);
    out.m_33.z = _77;
    float _131 = _87 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _133 = sqrt(_123);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[13].x, _127);
    float _137 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[13].z, _121);
    float _139 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].x, _65);
    float _141 = _81 ? (-1.0) : 1.0;
    float _143 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[12].z, _101);
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[13].x, _131);
    float _149 = -_125;
    float _151 = _149 + 1.0;
    float _153 = _85 ? (-1.0) : 1.0;
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[10].z, _97);
    float _157 = _117 * _59;
    float _159 = _141 * _151;
    float _161 = 1.0 / _145;
    float _163 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[11].z, _99);
    float _165 = _63 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _167 = -_133;
    float _169 = _167 + 1.0;
    float _171 = -_157;
    float _173 = fma(_109, _63, _171);
    float _175 = _159 * _63;
    float _177 = _155 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _179 = _153 * _169;
    float _181 = _163 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _183 = _143 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].y, _69);
    float _187 = _109 * _179;
    float _189 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].x, _69);
    float _191 = -_175;
    float _193 = fma(_179, _59, _191);
    out.gl_Position.x = _177;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _145;
    float _195 = -_187;
    float _197 = fma(_159, _117, _195);
    float _199 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[15].x, _165);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c3)._m0[13].z, _147);
    float _203 = _197 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].z, _135);
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[15].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[15].x, _203);
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_37.z = _207;
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[15].z, _211);
    float _217 = _177 * _161;
    float _219 = _181 * _161;
    out.m_39.w = _209;
    float _221 = fma(_217, 0.5, 0.5);
    float _223 = fma(_219, -0.5, 0.5);
    out.m_41.w = _213;
    out.m_43.x = _221;
    out.m_43.y = _223;
    out.m_37.x = _215;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_24.x;
    float _59 = in.m_24.y;
    float _61 = in.m_24.z;
    float _63 = in.m_24.w;
    float _65 = in.m_26.x;
    float _67 = in.m_26.y;
    float _69 = in.m_26.z;
    float _71 = in.m_28.y;
    float _73 = in.m_28.x;
    float _75 = in.m_26.w;
    float _77 = in.m_28.z;
    bool _81 = _57 > 2.0;
    float _83 = _59 * _59;
    bool _85 = _61 > 2.0;
    out.m_31.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_31.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c4)._m0[0].y, _67);
    float _91 = _67 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _93 = _67 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _95 = _67 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_33.y = _71;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[10].x, _91);
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[11].x, _93);
    float _101 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[12].x, _95);
    float _103 = _57;
    float _105 = _61;
    if (_81)
    {
        float _107 = _57 + (-10.0);
        _103 = _107;
    }
    float _109 = _103;
    float _111 = _67 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _113 = _63 * _63;
    if (_85)
    {
        float _115 = _61 + (-10.0);
        _105 = _115;
    }
    float _117 = _105;
    float _119 = fma(_109, _109, _83);
    out.m_33.x = _73;
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[13].x, _111);
    float _123 = fma(_117, _117, _113);
    out.m_35.x = _75;
    float _125 = sqrt(_119);
    float _127 = _89 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _129 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].y, _65);
    out.m_33.z = _77;
    float _131 = _87 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _133 = sqrt(_123);
    float _135 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[13].x, _127);
    float _137 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[13].z, _121);
    float _139 = fma(_109, (*spvDescriptorSet0.vp_c4)._m0[0].x, _65);
    float _141 = _81 ? (-1.0) : 1.0;
    float _143 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[12].z, _101);
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _147 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[13].x, _131);
    float _149 = -_125;
    float _151 = _149 + 1.0;
    float _153 = _85 ? (-1.0) : 1.0;
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[10].z, _97);
    float _157 = _117 * _59;
    float _159 = _141 * _151;
    float _161 = 1.0 / _145;
    float _163 = fma(_69, (*spvDescriptorSet0.vp_c3)._m0[11].z, _99);
    float _165 = _63 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _167 = -_133;
    float _169 = _167 + 1.0;
    float _171 = -_157;
    float _173 = fma(_109, _63, _171);
    float _175 = _159 * _63;
    float _177 = _155 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _179 = _153 * _169;
    float _181 = _163 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _183 = _143 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].y, _69);
    float _187 = _109 * _179;
    float _189 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[0].x, _69);
    float _191 = -_175;
    float _193 = fma(_179, _59, _191);
    out.gl_Position.x = _177;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _145;
    float _195 = -_187;
    float _197 = fma(_159, _117, _195);
    float _199 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[15].x, _165);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c3)._m0[13].z, _147);
    float _203 = _197 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].z, _135);
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[15].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[15].x, _203);
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_37.z = _207;
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[15].z, _211);
    float _217 = _177 * _161;
    float _219 = _181 * _161;
    out.m_39.w = _209;
    float _221 = fma(_217, 0.5, 0.5);
    float _223 = fma(_219, -0.5, 0.5);
    out.m_41.w = _213;
    out.m_43.x = _221;
    out.m_43.y = _223;
    out.m_37.x = _215;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

