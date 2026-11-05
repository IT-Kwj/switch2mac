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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    uint _57 = uint(int(uint(int(_55)) >> uint(2)));
    int _59 = int(_55) & 3;
    float _61 = (*spvDescriptorSet0.vp_c3)._m0[int(_57)][_59];
    int _63 = as_type<int>(_61) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _65 = _63 << 4;
    int _67 = _65 + 208;
    float _69 = as_type<float>(in.m_25.x);
    uint _71 = uint(int(uint(_67) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_67) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _67 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = as_type<int>(_69) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _99 = _95 != 0;
    float _101 = in.m_28.x;
    float _103 = in.m_28.y;
    float _105 = in.m_28.z;
    int _107 = 0;
    if (!_99)
    {
        float _109 = as_type<float>(in.m_25.y);
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    bool _113 = false;
    if (_99)
    {
        _113 = false;
    }
    bool _115 = _113;
    uint _117 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _119 = float(_117);
    float _121 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _123 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _125 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _127 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _129 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _121);
    float _131 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _123);
    float _133 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _125);
    uint _135 = extract_bits(uint(_93), 0u, 8u);
    float _137 = float(_135);
    float _139 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _127);
    float _141 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _129);
    int _143 = 0;
    bool _145 = _115;
    if (!_99)
    {
        int _147 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _143 = _149 ? (-1) : 0;
    }
    int _151 = _143;
    float _153 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _131);
    float _155 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _139);
    float _157 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _133);
    if (!_99)
    {
        int _159 = ~_151;
        _145 = _159 != 0;
    }
    bool _161 = _145;
    uint _163 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _165 = float(_163);
    float _167 = _141 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _119 * 0.0039215688593685626983642578125;
    float _173 = _153 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _175 = _157 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _177 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _179 = float(_177);
    float _181 = _137 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _173;
    out.gl_Position.z = _175;
    out.gl_Position.w = _169;
    float _183 = _165 * 0.0039215688593685626983642578125;
    float _185 = _179 * 0.0039215688593685626983642578125;
    out.m_31.x = _183;
    out.m_31.y = _171;
    out.m_31.z = _185;
    out.m_31.w = _181;
    if (!_161)
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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    uint _57 = uint(int(uint(int(_55)) >> uint(2)));
    int _59 = int(_55) & 3;
    float _61 = (*spvDescriptorSet0.vp_c3)._m0[int(_57)][_59];
    int _63 = as_type<int>(_61) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _65 = _63 << 4;
    int _67 = _65 + 208;
    float _69 = as_type<float>(in.m_25.x);
    uint _71 = uint(int(uint(_67) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_67) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _67 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = as_type<int>(_69) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _99 = _95 != 0;
    float _101 = in.m_28.x;
    float _103 = in.m_28.y;
    float _105 = in.m_28.z;
    int _107 = 0;
    if (!_99)
    {
        float _109 = as_type<float>(in.m_25.y);
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    bool _113 = false;
    if (_99)
    {
        _113 = false;
    }
    bool _115 = _113;
    uint _117 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _119 = float(_117);
    float _121 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _123 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _125 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _127 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _129 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _121);
    float _131 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _123);
    float _133 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _125);
    uint _135 = extract_bits(uint(_93), 0u, 8u);
    float _137 = float(_135);
    float _139 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _127);
    float _141 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _129);
    int _143 = 0;
    bool _145 = _115;
    if (!_99)
    {
        int _147 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _143 = _149 ? (-1) : 0;
    }
    int _151 = _143;
    float _153 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _131);
    float _155 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _139);
    float _157 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _133);
    if (!_99)
    {
        int _159 = ~_151;
        _145 = _159 != 0;
    }
    bool _161 = _145;
    uint _163 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _165 = float(_163);
    float _167 = _141 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _119 * 0.0039215688593685626983642578125;
    float _173 = _153 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _175 = _157 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _177 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _179 = float(_177);
    float _181 = _137 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _173;
    out.gl_Position.z = _175;
    out.gl_Position.w = _169;
    float _183 = _165 * 0.0039215688593685626983642578125;
    float _185 = _179 * 0.0039215688593685626983642578125;
    out.m_31.x = _183;
    out.m_31.y = _171;
    out.m_31.z = _185;
    out.m_31.w = _181;
    if (!_161)
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
    int _48 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _50 = _48 << 4;
    int _52 = _50 + 208;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    uint _57 = uint(int(uint(int(_55)) >> uint(2)));
    int _59 = int(_55) & 3;
    float _61 = (*spvDescriptorSet0.vp_c3)._m0[int(_57)][_59];
    int _63 = as_type<int>(_61) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _65 = _63 << 4;
    int _67 = _65 + 208;
    float _69 = as_type<float>(in.m_25.x);
    uint _71 = uint(int(uint(_67) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_67) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _67 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = as_type<int>(_69) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _99 = _95 != 0;
    float _101 = in.m_28.x;
    float _103 = in.m_28.y;
    float _105 = in.m_28.z;
    int _107 = 0;
    if (!_99)
    {
        float _109 = as_type<float>(in.m_25.y);
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    bool _113 = false;
    if (_99)
    {
        _113 = false;
    }
    bool _115 = _113;
    uint _117 = extract_bits(as_type<uint>(_77), 16u, 8u);
    float _119 = float(_117);
    float _121 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _123 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _125 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _127 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _129 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _121);
    float _131 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _123);
    float _133 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _125);
    uint _135 = extract_bits(uint(_93), 0u, 8u);
    float _137 = float(_135);
    float _139 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _127);
    float _141 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _129);
    int _143 = 0;
    bool _145 = _115;
    if (!_99)
    {
        int _147 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _143 = _149 ? (-1) : 0;
    }
    int _151 = _143;
    float _153 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _131);
    float _155 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _139);
    float _157 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _133);
    if (!_99)
    {
        int _159 = ~_151;
        _145 = _159 != 0;
    }
    bool _161 = _145;
    uint _163 = extract_bits(as_type<uint>(_77), 24u, 8u);
    float _165 = float(_163);
    float _167 = _141 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _119 * 0.0039215688593685626983642578125;
    float _173 = _153 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _175 = _157 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _177 = extract_bits(as_type<uint>(_77), 8u, 8u);
    float _179 = float(_177);
    float _181 = _137 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _167;
    out.gl_Position.y = _173;
    out.gl_Position.z = _175;
    out.gl_Position.w = _169;
    float _183 = _165 * 0.0039215688593685626983642578125;
    float _185 = _179 * 0.0039215688593685626983642578125;
    out.m_31.x = _183;
    out.m_31.y = _171;
    out.m_31.z = _185;
    out.m_31.w = _181;
    if (!_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

