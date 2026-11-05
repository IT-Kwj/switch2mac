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
    float4 m_31 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _56 = _54 << 4;
    int _58 = _56 + 160;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    uint _67 = uint(int(uint(_58) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _77 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _75);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _79);
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _83 * _93;
    uint _97 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _99 = int(_97) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _101 = _99 << 4;
    int _103 = _101 + 160;
    float _105 = in.m_28.x;
    float _107 = in.m_28.y;
    float _109 = in.m_28.z;
    uint _111 = uint(int(uint(_103) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    float _119 = _107 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _121 = _107 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _123 = _107 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _125 = _107 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _127 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].x, _119);
    float _129 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].x, _121);
    float _131 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].x, _123);
    float _133 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[5].x, _125);
    int _135 = as_type<int>(_73) & 31;
    bool _139 = uint(_135) < 32u;
    int _141 = 1 << _135;
    int _143 = _139 ? _141 : 0;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[2].z, _127);
    float _147 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[3].z, _129);
    float _149 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].z, _131);
    float _151 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].z, _133);
    float _153 = _81 * _93;
    float _155 = _147 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _157 = _149 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _159 = _85 * _93;
    out.m_31.x = _95;
    out.m_31.y = _153;
    out.m_31.z = _159;
    int _161 = _143 & as_type<int>(_117);
    bool _163 = _161 != 0;
    float _165 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _167 = _151 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _165;
    out.gl_Position.y = _155;
    out.gl_Position.z = _157;
    out.gl_Position.w = _167;
    if (_163)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _56 = _54 << 4;
    int _58 = _56 + 160;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    uint _67 = uint(int(uint(_58) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _77 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _75);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _79);
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _83 * _93;
    uint _97 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _99 = int(_97) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _101 = _99 << 4;
    int _103 = _101 + 160;
    float _105 = in.m_28.x;
    float _107 = in.m_28.y;
    float _109 = in.m_28.z;
    uint _111 = uint(int(uint(_103) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    float _119 = _107 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _121 = _107 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _123 = _107 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _125 = _107 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _127 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].x, _119);
    float _129 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].x, _121);
    float _131 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].x, _123);
    float _133 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[5].x, _125);
    int _135 = as_type<int>(_73) & 31;
    bool _139 = uint(_135) < 32u;
    int _141 = 1 << _135;
    int _143 = _139 ? _141 : 0;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[2].z, _127);
    float _147 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[3].z, _129);
    float _149 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].z, _131);
    float _151 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].z, _133);
    float _153 = _81 * _93;
    float _155 = _147 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _157 = _149 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _159 = _85 * _93;
    out.m_31.x = _95;
    out.m_31.y = _153;
    out.m_31.z = _159;
    int _161 = _143 & as_type<int>(_117);
    bool _163 = _161 != 0;
    float _165 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _167 = _151 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _165;
    out.gl_Position.y = _155;
    out.gl_Position.z = _157;
    out.gl_Position.w = _167;
    if (_163)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].y);
    int _56 = _54 << 4;
    int _58 = _56 + 160;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    uint _67 = uint(int(uint(_58) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _77 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _75);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _79);
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _83 * _93;
    uint _97 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _99 = int(_97) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    int _101 = _99 << 4;
    int _103 = _101 + 160;
    float _105 = in.m_28.x;
    float _107 = in.m_28.y;
    float _109 = in.m_28.z;
    uint _111 = uint(int(uint(_103) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    float _119 = _107 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _121 = _107 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _123 = _107 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _125 = _107 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _127 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].x, _119);
    float _129 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].x, _121);
    float _131 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].x, _123);
    float _133 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[5].x, _125);
    int _135 = as_type<int>(_73) & 31;
    bool _139 = uint(_135) < 32u;
    int _141 = 1 << _135;
    int _143 = _139 ? _141 : 0;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[2].z, _127);
    float _147 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[3].z, _129);
    float _149 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].z, _131);
    float _151 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].z, _133);
    float _153 = _81 * _93;
    float _155 = _147 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _157 = _149 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _159 = _85 * _93;
    out.m_31.x = _95;
    out.m_31.y = _153;
    out.m_31.z = _159;
    int _161 = _143 & as_type<int>(_117);
    bool _163 = _161 != 0;
    float _165 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _167 = _151 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    out.gl_Position.x = _165;
    out.gl_Position.y = _155;
    out.gl_Position.z = _157;
    out.gl_Position.w = _167;
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

