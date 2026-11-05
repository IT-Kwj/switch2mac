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
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(3)]];
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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    float _54 = as_type<float>(in.m_25.x);
    uint _57 = uint(int(uint(_52) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c3)._m0[int(_59)][_61];
    uint _65 = uint(int(uint(_52) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _52 & 3;
    int _75 = _73 << 3;
    uint _77 = uint(int(uint(as_type<int>(_71)) >> uint(_75)));
    int _79 = int(_77) & 255;
    int _81 = ~as_type<int>(_54);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    float _89 = in.m_28.x;
    float _91 = in.m_28.y;
    float _93 = in.m_28.z;
    int _95 = 0;
    if (!_87)
    {
        float _97 = as_type<float>(in.m_25.y);
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    bool _101 = false;
    if (_87)
    {
        _101 = false;
    }
    bool _103 = _101;
    uint _105 = extract_bits(as_type<uint>(_63), 24u, 8u);
    float _107 = float(_105);
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _111 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _113 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _115 = _91 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[1].x, _109);
    float _119 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[2].x, _111);
    float _121 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[3].x, _113);
    uint _123 = extract_bits(uint(_79), 0u, 8u);
    float _125 = float(_123);
    float _127 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[4].x, _115);
    float _129 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].z, _117);
    int _131 = 0;
    bool _133 = _103;
    if (!_87)
    {
        int _135 = ~_99;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].z, _121);
    float _145 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].z, _119);
    float _147 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    if (!_87)
    {
        int _149 = ~_141;
        _133 = _149 != 0;
    }
    bool _151 = _133;
    uint _153 = extract_bits(as_type<uint>(_63), 16u, 8u);
    float _155 = float(_153);
    float _157 = _129 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _159 = _143 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _161 = _107 * 0.0039215688593685626983642578125;
    float _163 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _165 = _147 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _167 = extract_bits(as_type<uint>(_63), 8u, 8u);
    float _169 = float(_167);
    float _171 = _125 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _157;
    out.gl_Position.y = _163;
    out.gl_Position.z = _159;
    out.gl_Position.w = _165;
    float _173 = _155 * 0.0039215688593685626983642578125;
    float _175 = _169 * 0.0039215688593685626983642578125;
    out.m_31.x = _161;
    out.m_31.y = _173;
    out.m_31.z = _175;
    out.m_31.w = _171;
    if (!_151)
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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    float _54 = as_type<float>(in.m_25.x);
    uint _57 = uint(int(uint(_52) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c3)._m0[int(_59)][_61];
    uint _65 = uint(int(uint(_52) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _52 & 3;
    int _75 = _73 << 3;
    uint _77 = uint(int(uint(as_type<int>(_71)) >> uint(_75)));
    int _79 = int(_77) & 255;
    int _81 = ~as_type<int>(_54);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    float _89 = in.m_28.x;
    float _91 = in.m_28.y;
    float _93 = in.m_28.z;
    int _95 = 0;
    if (!_87)
    {
        float _97 = as_type<float>(in.m_25.y);
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    bool _101 = false;
    if (_87)
    {
        _101 = false;
    }
    bool _103 = _101;
    uint _105 = extract_bits(as_type<uint>(_63), 24u, 8u);
    float _107 = float(_105);
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _111 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _113 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _115 = _91 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[1].x, _109);
    float _119 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[2].x, _111);
    float _121 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[3].x, _113);
    uint _123 = extract_bits(uint(_79), 0u, 8u);
    float _125 = float(_123);
    float _127 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[4].x, _115);
    float _129 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].z, _117);
    int _131 = 0;
    bool _133 = _103;
    if (!_87)
    {
        int _135 = ~_99;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].z, _121);
    float _145 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].z, _119);
    float _147 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    if (!_87)
    {
        int _149 = ~_141;
        _133 = _149 != 0;
    }
    bool _151 = _133;
    uint _153 = extract_bits(as_type<uint>(_63), 16u, 8u);
    float _155 = float(_153);
    float _157 = _129 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _159 = _143 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _161 = _107 * 0.0039215688593685626983642578125;
    float _163 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _165 = _147 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _167 = extract_bits(as_type<uint>(_63), 8u, 8u);
    float _169 = float(_167);
    float _171 = _125 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _157;
    out.gl_Position.y = _163;
    out.gl_Position.z = _159;
    out.gl_Position.w = _165;
    float _173 = _155 * 0.0039215688593685626983642578125;
    float _175 = _169 * 0.0039215688593685626983642578125;
    out.m_31.x = _161;
    out.m_31.y = _173;
    out.m_31.z = _175;
    out.m_31.w = _171;
    if (!_151)
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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    float _54 = as_type<float>(in.m_25.x);
    uint _57 = uint(int(uint(_52) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.vp_c3)._m0[int(_59)][_61];
    uint _65 = uint(int(uint(_52) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _52 & 3;
    int _75 = _73 << 3;
    uint _77 = uint(int(uint(as_type<int>(_71)) >> uint(_75)));
    int _79 = int(_77) & 255;
    int _81 = ~as_type<int>(_54);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    float _89 = in.m_28.x;
    float _91 = in.m_28.y;
    float _93 = in.m_28.z;
    int _95 = 0;
    if (!_87)
    {
        float _97 = as_type<float>(in.m_25.y);
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    bool _101 = false;
    if (_87)
    {
        _101 = false;
    }
    bool _103 = _101;
    uint _105 = extract_bits(as_type<uint>(_63), 24u, 8u);
    float _107 = float(_105);
    float _109 = _91 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _111 = _91 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _113 = _91 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _115 = _91 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[1].x, _109);
    float _119 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[2].x, _111);
    float _121 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[3].x, _113);
    uint _123 = extract_bits(uint(_79), 0u, 8u);
    float _125 = float(_123);
    float _127 = fma(_89, (*spvDescriptorSet0.vp_c3)._m0[4].x, _115);
    float _129 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[1].z, _117);
    int _131 = 0;
    bool _133 = _103;
    if (!_87)
    {
        int _135 = ~_99;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[3].z, _121);
    float _145 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[2].z, _119);
    float _147 = fma(_93, (*spvDescriptorSet0.vp_c3)._m0[4].z, _127);
    if (!_87)
    {
        int _149 = ~_141;
        _133 = _149 != 0;
    }
    bool _151 = _133;
    uint _153 = extract_bits(as_type<uint>(_63), 16u, 8u);
    float _155 = float(_153);
    float _157 = _129 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _159 = _143 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _161 = _107 * 0.0039215688593685626983642578125;
    float _163 = _145 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _165 = _147 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _167 = extract_bits(as_type<uint>(_63), 8u, 8u);
    float _169 = float(_167);
    float _171 = _125 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _157;
    out.gl_Position.y = _163;
    out.gl_Position.z = _159;
    out.gl_Position.w = _165;
    float _173 = _155 * 0.0039215688593685626983642578125;
    float _175 = _169 * 0.0039215688593685626983642578125;
    out.m_31.x = _161;
    out.m_31.y = _173;
    out.m_31.z = _175;
    out.m_31.w = _171;
    if (!_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

