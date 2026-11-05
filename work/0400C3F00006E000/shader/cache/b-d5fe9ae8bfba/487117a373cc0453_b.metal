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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = in.m_22.z;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[6].z * 0.15915493667125701904296875;
    float _47 = _45 * 6.283185482025146484375;
    float _49 = sin(_47);
    bool _53 = _41 >= 0.0;
    bool _55 = isnan(_41);
    bool _57 = _53 || _55;
    bool _59 = isnan(0.0);
    bool _61 = _57 || _59;
    float _63 = _41 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _65 = _39 > 0.0;
    float _67 = _41 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _69 = _41 > 0.0;
    float _71 = _41 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _73 = _39 >= 0.0;
    bool _75 = isnan(_39);
    bool _77 = _73 || _75;
    bool _79 = isnan(0.0);
    bool _81 = _77 || _79;
    float _83 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[2].x, _63);
    bool _85 = !_69;
    int _88 = _85 ? 0 : 1;
    float _90 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[3].x, _67);
    int _92 = _81 ? 0 : 1;
    float _94 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    int _96 = ~_88;
    int _98 = _96 + 1;
    int _100 = _98 + 1;
    float _102 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    int _104 = _100;
    if (_61)
    {
        int _106 = ~_88;
        int _108 = _106 + 1;
        _104 = _108;
    }
    int _110 = _104;
    float _112 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    int _114 = ~_92;
    int _116 = _114 + 1;
    int _118 = _116 + 1;
    float _120 = _45 * 6.283185482025146484375;
    float _122 = cos(_120);
    int _124 = _118;
    if (!_65)
    {
        int _126 = ~_92;
        int _128 = _126 + 1;
        _124 = _128;
    }
    int _130 = _124;
    float _132 = _41 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _134 = float(_130);
    float _136 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[1].x, _132);
    float _138 = float(_110);
    float _140 = fma(_134, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].z);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[1].z, _136);
    float _144 = fma(_138, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].w);
    float _146 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _148 = _49 * _144;
    float _150 = _122 * _144;
    float _152 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[4].z, _94);
    float _154 = _112 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _156 = -_148;
    float _158 = fma(_122, _140, _156);
    float _160 = fma(_49, _140, _150);
    float _162 = _102 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _164 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _166 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[6].x, 0.5);
    float _168 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[6].y, 0.5);
    out.gl_Position.x = _146;
    out.gl_Position.y = _162;
    out.gl_Position.z = _154;
    out.gl_Position.w = _164;
    out.m_25.x = _166;
    out.m_25.y = _168;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = in.m_22.z;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[6].z * 0.15915493667125701904296875;
    float _47 = _45 * 6.283185482025146484375;
    float _49 = sin(_47);
    bool _53 = _41 >= 0.0;
    bool _55 = isnan(_41);
    bool _57 = _53 || _55;
    bool _59 = isnan(0.0);
    bool _61 = _57 || _59;
    float _63 = _41 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _65 = _39 > 0.0;
    float _67 = _41 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _69 = _41 > 0.0;
    float _71 = _41 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _73 = _39 >= 0.0;
    bool _75 = isnan(_39);
    bool _77 = _73 || _75;
    bool _79 = isnan(0.0);
    bool _81 = _77 || _79;
    float _83 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[2].x, _63);
    bool _85 = !_69;
    int _88 = _85 ? 0 : 1;
    float _90 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[3].x, _67);
    int _92 = _81 ? 0 : 1;
    float _94 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    int _96 = ~_88;
    int _98 = _96 + 1;
    int _100 = _98 + 1;
    float _102 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    int _104 = _100;
    if (_61)
    {
        int _106 = ~_88;
        int _108 = _106 + 1;
        _104 = _108;
    }
    int _110 = _104;
    float _112 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    int _114 = ~_92;
    int _116 = _114 + 1;
    int _118 = _116 + 1;
    float _120 = _45 * 6.283185482025146484375;
    float _122 = cos(_120);
    int _124 = _118;
    if (!_65)
    {
        int _126 = ~_92;
        int _128 = _126 + 1;
        _124 = _128;
    }
    int _130 = _124;
    float _132 = _41 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _134 = float(_130);
    float _136 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[1].x, _132);
    float _138 = float(_110);
    float _140 = fma(_134, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].z);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[1].z, _136);
    float _144 = fma(_138, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].w);
    float _146 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _148 = _49 * _144;
    float _150 = _122 * _144;
    float _152 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[4].z, _94);
    float _154 = _112 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _156 = -_148;
    float _158 = fma(_122, _140, _156);
    float _160 = fma(_49, _140, _150);
    float _162 = _102 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _164 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _166 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[6].x, 0.5);
    float _168 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[6].y, 0.5);
    out.gl_Position.x = _146;
    out.gl_Position.y = _162;
    out.gl_Position.z = _154;
    out.gl_Position.w = _164;
    out.m_25.x = _166;
    out.m_25.y = _168;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = in.m_22.z;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[6].z * 0.15915493667125701904296875;
    float _47 = _45 * 6.283185482025146484375;
    float _49 = sin(_47);
    bool _53 = _41 >= 0.0;
    bool _55 = isnan(_41);
    bool _57 = _53 || _55;
    bool _59 = isnan(0.0);
    bool _61 = _57 || _59;
    float _63 = _41 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _65 = _39 > 0.0;
    float _67 = _41 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _69 = _41 > 0.0;
    float _71 = _41 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _73 = _39 >= 0.0;
    bool _75 = isnan(_39);
    bool _77 = _73 || _75;
    bool _79 = isnan(0.0);
    bool _81 = _77 || _79;
    float _83 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[2].x, _63);
    bool _85 = !_69;
    int _88 = _85 ? 0 : 1;
    float _90 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[3].x, _67);
    int _92 = _81 ? 0 : 1;
    float _94 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[4].x, _71);
    int _96 = ~_88;
    int _98 = _96 + 1;
    int _100 = _98 + 1;
    float _102 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[2].z, _83);
    int _104 = _100;
    if (_61)
    {
        int _106 = ~_88;
        int _108 = _106 + 1;
        _104 = _108;
    }
    int _110 = _104;
    float _112 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[3].z, _90);
    int _114 = ~_92;
    int _116 = _114 + 1;
    int _118 = _116 + 1;
    float _120 = _45 * 6.283185482025146484375;
    float _122 = cos(_120);
    int _124 = _118;
    if (!_65)
    {
        int _126 = ~_92;
        int _128 = _126 + 1;
        _124 = _128;
    }
    int _130 = _124;
    float _132 = _41 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _134 = float(_130);
    float _136 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[1].x, _132);
    float _138 = float(_110);
    float _140 = fma(_134, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].z);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[1].z, _136);
    float _144 = fma(_138, 0.5, (*spvDescriptorSet0.vp_c3)._m0[5].w);
    float _146 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _148 = _49 * _144;
    float _150 = _122 * _144;
    float _152 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[4].z, _94);
    float _154 = _112 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _156 = -_148;
    float _158 = fma(_122, _140, _156);
    float _160 = fma(_49, _140, _150);
    float _162 = _102 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _164 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _166 = fma(_158, (*spvDescriptorSet0.vp_c3)._m0[6].x, 0.5);
    float _168 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[6].y, 0.5);
    out.gl_Position.x = _146;
    out.gl_Position.y = _162;
    out.gl_Position.z = _154;
    out.gl_Position.w = _164;
    out.m_25.x = _166;
    out.m_25.y = _168;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

