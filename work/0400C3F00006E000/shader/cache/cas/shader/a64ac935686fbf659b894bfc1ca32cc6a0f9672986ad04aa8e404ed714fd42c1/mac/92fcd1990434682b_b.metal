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
    float4 m_30 [[user(locn0)]];
    float4 m_28 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_25 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = in.m_25.x;
    float _48 = in.m_25.y;
    bool _52 = as_type<int>(_44) > 0;
    int _55 = as_type<int>(_44);
    if (_52)
    {
        int _57 = as_type<int>(_44) + (-1);
        _55 = _57;
    }
    int _59 = _55;
    int _61 = 0;
    int _63 = _59;
    if (_52)
    {
        int _65 = _59 >> 31;
        _61 = _65;
    }
    int _67 = _61;
    int _69 = _67;
    if (_52)
    {
        int _71 = _67 & 31;
        _69 = _71;
    }
    int _73 = _69;
    int _75 = _73;
    if (_52)
    {
        int _77 = _59 + _73;
        _75 = _77;
    }
    int _79 = _75;
    int _81 = _79;
    if (!_52)
    {
        _63 = 32;
    }
    int _83 = _63;
    int _85 = _83;
    if (_52)
    {
        int _87 = _79 >> 5;
        _81 = _87;
    }
    int _89 = _81;
    if (_52)
    {
        int _91 = _89 << 4;
        int _93 = _91 + 48;
        _85 = _93;
    }
    int _95 = _85;
    float _97 = _46 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _99 = _48 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _101 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    uint _104 = uint(int(uint(_95) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.vp_c3)._m0[int(_106)][_108];
    int _112 = int(_104) + 1;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    int _116 = _112 & 3;
    float _118 = (*spvDescriptorSet0.vp_c3)._m0[int(_114)][_116];
    float _120 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _122 = _99 + _101;
    float _124 = _97 + _120;
    float _126 = fma(_97, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _128 = fma(_99, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c3)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[int(_142)][_144];
    float _148 = -_122;
    float _150 = _148 + 1.0;
    out.gl_Position.x = _126;
    out.gl_Position.y = _128;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_28.x = _124;
    out.m_28.y = _150;
    out.m_30.x = _110;
    out.m_30.y = _118;
    out.m_30.z = _138;
    out.m_30.w = _146;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = in.m_25.x;
    float _48 = in.m_25.y;
    bool _52 = as_type<int>(_44) > 0;
    int _55 = as_type<int>(_44);
    if (_52)
    {
        int _57 = as_type<int>(_44) + (-1);
        _55 = _57;
    }
    int _59 = _55;
    int _61 = 0;
    int _63 = _59;
    if (_52)
    {
        int _65 = _59 >> 31;
        _61 = _65;
    }
    int _67 = _61;
    int _69 = _67;
    if (_52)
    {
        int _71 = _67 & 31;
        _69 = _71;
    }
    int _73 = _69;
    int _75 = _73;
    if (_52)
    {
        int _77 = _59 + _73;
        _75 = _77;
    }
    int _79 = _75;
    int _81 = _79;
    if (!_52)
    {
        _63 = 32;
    }
    int _83 = _63;
    int _85 = _83;
    if (_52)
    {
        int _87 = _79 >> 5;
        _81 = _87;
    }
    int _89 = _81;
    if (_52)
    {
        int _91 = _89 << 4;
        int _93 = _91 + 48;
        _85 = _93;
    }
    int _95 = _85;
    float _97 = _46 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _99 = _48 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _101 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    uint _104 = uint(int(uint(_95) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.vp_c3)._m0[int(_106)][_108];
    int _112 = int(_104) + 1;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    int _116 = _112 & 3;
    float _118 = (*spvDescriptorSet0.vp_c3)._m0[int(_114)][_116];
    float _120 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _122 = _99 + _101;
    float _124 = _97 + _120;
    float _126 = fma(_97, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _128 = fma(_99, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c3)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[int(_142)][_144];
    float _148 = -_122;
    float _150 = _148 + 1.0;
    out.gl_Position.x = _126;
    out.gl_Position.y = _128;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_28.x = _124;
    out.m_28.y = _150;
    out.m_30.x = _110;
    out.m_30.y = _118;
    out.m_30.z = _138;
    out.m_30.w = _146;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = in.m_25.x;
    float _48 = in.m_25.y;
    bool _52 = as_type<int>(_44) > 0;
    int _55 = as_type<int>(_44);
    if (_52)
    {
        int _57 = as_type<int>(_44) + (-1);
        _55 = _57;
    }
    int _59 = _55;
    int _61 = 0;
    int _63 = _59;
    if (_52)
    {
        int _65 = _59 >> 31;
        _61 = _65;
    }
    int _67 = _61;
    int _69 = _67;
    if (_52)
    {
        int _71 = _67 & 31;
        _69 = _71;
    }
    int _73 = _69;
    int _75 = _73;
    if (_52)
    {
        int _77 = _59 + _73;
        _75 = _77;
    }
    int _79 = _75;
    int _81 = _79;
    if (!_52)
    {
        _63 = 32;
    }
    int _83 = _63;
    int _85 = _83;
    if (_52)
    {
        int _87 = _79 >> 5;
        _81 = _87;
    }
    int _89 = _81;
    if (_52)
    {
        int _91 = _89 << 4;
        int _93 = _91 + 48;
        _85 = _93;
    }
    int _95 = _85;
    float _97 = _46 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _99 = _48 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _101 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    uint _104 = uint(int(uint(_95) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.vp_c3)._m0[int(_106)][_108];
    int _112 = int(_104) + 1;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    int _116 = _112 & 3;
    float _118 = (*spvDescriptorSet0.vp_c3)._m0[int(_114)][_116];
    float _120 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _122 = _99 + _101;
    float _124 = _97 + _120;
    float _126 = fma(_97, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _128 = fma(_99, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    int _130 = _95 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    uint _134 = uint(int(uint(int(_132)) >> uint(2)));
    int _136 = int(_132) & 3;
    float _138 = (*spvDescriptorSet0.vp_c3)._m0[int(_134)][_136];
    int _140 = int(_132) + 1;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    int _144 = _140 & 3;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[int(_142)][_144];
    float _148 = -_122;
    float _150 = _148 + 1.0;
    out.gl_Position.x = _126;
    out.gl_Position.y = _128;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_28.x = _124;
    out.m_28.y = _150;
    out.m_30.x = _110;
    out.m_30.y = _118;
    out.m_30.z = _138;
    out.m_30.w = _146;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

