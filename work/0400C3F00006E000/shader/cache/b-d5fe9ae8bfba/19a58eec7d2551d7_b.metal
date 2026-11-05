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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    uint _53 = uint(int(uint(_50) >> uint(2)));
    uint _55 = uint(int(uint(int(_53)) >> uint(2)));
    int _57 = int(_53) & 3;
    float _59 = (*spvDescriptorSet0.vp_c3)._m0[int(_55)][_57];
    int _61 = as_type<int>(_59) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _63 = _61 << 4;
    int _65 = _63 + 144;
    uint _67 = uint(int(uint(as_type<int>(_59)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _71 = uint(int(uint(_65) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _69 << 4;
    int _81 = _79 + 144;
    float _83 = in.m_26.x;
    float _85 = in.m_26.y;
    float _87 = in.m_26.z;
    uint _89 = uint(int(uint(_65) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c3)._m0[int(_91)][_93];
    int _97 = _65 & 3;
    int _99 = _97 << 3;
    uint _101 = uint(int(uint(as_type<int>(_95)) >> uint(_99)));
    int _103 = int(_101) & 255;
    uint _105 = uint(int(uint(_81) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    float _113 = _85 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _115 = _85 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _117 = _85 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _119 = _85 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _121 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _113);
    float _123 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _115);
    float _125 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _117);
    float _127 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[4].x, _119);
    int _129 = as_type<int>(_59) & 31;
    bool _133 = uint(_129) < 32u;
    int _135 = 1 << _129;
    int _137 = _133 ? _135 : 0;
    float _139 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[1].z, _121);
    float _141 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[2].z, _123);
    float _143 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    float _145 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[3].z, _125);
    float _147 = _141 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _149 = _145 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _151 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_103), 0u, 8u);
    float _157 = float(_155);
    uint _159 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _161 = float(_159);
    int _163 = _137 & as_type<int>(_111);
    bool _165 = _163 != 0;
    float _167 = _139 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _143 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _153 * 0.0039215688593685626983642578125;
    uint _173 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _175 = float(_173);
    float _177 = _157 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _147;
    out.gl_Position.z = _149;
    out.gl_Position.w = _169;
    float _179 = _161 * 0.0039215688593685626983642578125;
    float _181 = _175 * 0.0039215688593685626983642578125;
    out.m_29.x = _179;
    out.m_29.y = _171;
    out.m_29.z = _181;
    out.m_29.w = _177;
    if (_165)
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    uint _53 = uint(int(uint(_50) >> uint(2)));
    uint _55 = uint(int(uint(int(_53)) >> uint(2)));
    int _57 = int(_53) & 3;
    float _59 = (*spvDescriptorSet0.vp_c3)._m0[int(_55)][_57];
    int _61 = as_type<int>(_59) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _63 = _61 << 4;
    int _65 = _63 + 144;
    uint _67 = uint(int(uint(as_type<int>(_59)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _71 = uint(int(uint(_65) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _69 << 4;
    int _81 = _79 + 144;
    float _83 = in.m_26.x;
    float _85 = in.m_26.y;
    float _87 = in.m_26.z;
    uint _89 = uint(int(uint(_65) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c3)._m0[int(_91)][_93];
    int _97 = _65 & 3;
    int _99 = _97 << 3;
    uint _101 = uint(int(uint(as_type<int>(_95)) >> uint(_99)));
    int _103 = int(_101) & 255;
    uint _105 = uint(int(uint(_81) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    float _113 = _85 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _115 = _85 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _117 = _85 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _119 = _85 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _121 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _113);
    float _123 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _115);
    float _125 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _117);
    float _127 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[4].x, _119);
    int _129 = as_type<int>(_59) & 31;
    bool _133 = uint(_129) < 32u;
    int _135 = 1 << _129;
    int _137 = _133 ? _135 : 0;
    float _139 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[1].z, _121);
    float _141 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[2].z, _123);
    float _143 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    float _145 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[3].z, _125);
    float _147 = _141 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _149 = _145 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _151 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_103), 0u, 8u);
    float _157 = float(_155);
    uint _159 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _161 = float(_159);
    int _163 = _137 & as_type<int>(_111);
    bool _165 = _163 != 0;
    float _167 = _139 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _143 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _153 * 0.0039215688593685626983642578125;
    uint _173 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _175 = float(_173);
    float _177 = _157 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _147;
    out.gl_Position.z = _149;
    out.gl_Position.w = _169;
    float _179 = _161 * 0.0039215688593685626983642578125;
    float _181 = _175 * 0.0039215688593685626983642578125;
    out.m_29.x = _179;
    out.m_29.y = _171;
    out.m_29.z = _181;
    out.m_29.w = _177;
    if (_165)
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    uint _53 = uint(int(uint(_50) >> uint(2)));
    uint _55 = uint(int(uint(int(_53)) >> uint(2)));
    int _57 = int(_53) & 3;
    float _59 = (*spvDescriptorSet0.vp_c3)._m0[int(_55)][_57];
    int _61 = as_type<int>(_59) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _63 = _61 << 4;
    int _65 = _63 + 144;
    uint _67 = uint(int(uint(as_type<int>(_59)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _71 = uint(int(uint(_65) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _69 << 4;
    int _81 = _79 + 144;
    float _83 = in.m_26.x;
    float _85 = in.m_26.y;
    float _87 = in.m_26.z;
    uint _89 = uint(int(uint(_65) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c3)._m0[int(_91)][_93];
    int _97 = _65 & 3;
    int _99 = _97 << 3;
    uint _101 = uint(int(uint(as_type<int>(_95)) >> uint(_99)));
    int _103 = int(_101) & 255;
    uint _105 = uint(int(uint(_81) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    float _113 = _85 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _115 = _85 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _117 = _85 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _119 = _85 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _121 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[1].x, _113);
    float _123 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[2].x, _115);
    float _125 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[3].x, _117);
    float _127 = fma(_83, (*spvDescriptorSet0.vp_c3)._m0[4].x, _119);
    int _129 = as_type<int>(_59) & 31;
    bool _133 = uint(_129) < 32u;
    int _135 = 1 << _129;
    int _137 = _133 ? _135 : 0;
    float _139 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[1].z, _121);
    float _141 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[2].z, _123);
    float _143 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    float _145 = fma(_87, (*spvDescriptorSet0.vp_c3)._m0[3].z, _125);
    float _147 = _141 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _149 = _145 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _151 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_103), 0u, 8u);
    float _157 = float(_155);
    uint _159 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _161 = float(_159);
    int _163 = _137 & as_type<int>(_111);
    bool _165 = _163 != 0;
    float _167 = _139 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _143 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _153 * 0.0039215688593685626983642578125;
    uint _173 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _175 = float(_173);
    float _177 = _157 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _147;
    out.gl_Position.z = _149;
    out.gl_Position.w = _169;
    float _179 = _161 * 0.0039215688593685626983642578125;
    float _181 = _175 * 0.0039215688593685626983642578125;
    out.m_29.x = _179;
    out.m_29.y = _171;
    out.m_29.z = _181;
    out.m_29.w = _177;
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

