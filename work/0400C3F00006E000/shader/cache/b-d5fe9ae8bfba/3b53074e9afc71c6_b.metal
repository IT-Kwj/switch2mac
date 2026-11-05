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
    float4 m_34 [[user(locn1)]];
    float4 m_32 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_VertexIndex));
    float _50 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _52 = in.m_27.x;
    float _54 = in.m_27.y;
    float _56 = in.m_27.z;
    bool _60 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _62 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _64 = _60 || _62;
    bool _66 = isnan(8.0);
    bool _68 = _64 || _66;
    float _70 = in.m_27.w;
    float _72 = in.m_29.x;
    float _74 = in.m_29.y;
    float _76 = 0.0;
    if (!_68)
    {
        _76 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_68)
    {
        float _82 = _78 * 0.5;
        _80 = _82;
    }
    float _84 = _80;
    float _86 = float(as_type<int>(_48));
    bool _88 = _84 < _86;
    bool _90 = !_68;
    bool _92 = _88 && _90;
    float _94 = _54 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _54 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _98 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _100 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].x, _96);
    out.m_32.x = _72;
    float _102 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[12].z, _100);
    out.m_32.y = _74;
    float _104 = _84;
    if (!_92)
    {
        _104 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _106 = _104;
    float _108 = _106;
    if (_92)
    {
        float _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _108 = _110;
    }
    float _112 = _108;
    float _114 = _54 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _116 = _54 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = -_112;
    float _120 = _118 + _86;
    float _122 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].x, _114);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _126 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[11].z, _98);
    float _128 = _120 * _50;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[10].z, _122);
    float _134 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[13].z, _124);
    float _136 = _126 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _138 = _102 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _140 = _132 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _142 = _134 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = _130 * _70;
    out.gl_Position.x = _140;
    out.gl_Position.y = _136;
    out.gl_Position.z = _138;
    out.gl_Position.w = _142;
    out.m_34.x = _144;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_VertexIndex));
    float _50 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _52 = in.m_27.x;
    float _54 = in.m_27.y;
    float _56 = in.m_27.z;
    bool _60 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _62 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _64 = _60 || _62;
    bool _66 = isnan(8.0);
    bool _68 = _64 || _66;
    float _70 = in.m_27.w;
    float _72 = in.m_29.x;
    float _74 = in.m_29.y;
    float _76 = 0.0;
    if (!_68)
    {
        _76 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_68)
    {
        float _82 = _78 * 0.5;
        _80 = _82;
    }
    float _84 = _80;
    float _86 = float(as_type<int>(_48));
    bool _88 = _84 < _86;
    bool _90 = !_68;
    bool _92 = _88 && _90;
    float _94 = _54 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _54 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _98 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _100 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].x, _96);
    out.m_32.x = _72;
    float _102 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[12].z, _100);
    out.m_32.y = _74;
    float _104 = _84;
    if (!_92)
    {
        _104 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _106 = _104;
    float _108 = _106;
    if (_92)
    {
        float _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _108 = _110;
    }
    float _112 = _108;
    float _114 = _54 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _116 = _54 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = -_112;
    float _120 = _118 + _86;
    float _122 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].x, _114);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _126 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[11].z, _98);
    float _128 = _120 * _50;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[10].z, _122);
    float _134 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[13].z, _124);
    float _136 = _126 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _138 = _102 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _140 = _132 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _142 = _134 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = _130 * _70;
    out.gl_Position.x = _140;
    out.gl_Position.y = _136;
    out.gl_Position.z = _138;
    out.gl_Position.w = _142;
    out.m_34.x = _144;
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_VertexIndex));
    float _50 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _52 = in.m_27.x;
    float _54 = in.m_27.y;
    float _56 = in.m_27.z;
    bool _60 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _62 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _64 = _60 || _62;
    bool _66 = isnan(8.0);
    bool _68 = _64 || _66;
    float _70 = in.m_27.w;
    float _72 = in.m_29.x;
    float _74 = in.m_29.y;
    float _76 = 0.0;
    if (!_68)
    {
        _76 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_68)
    {
        float _82 = _78 * 0.5;
        _80 = _82;
    }
    float _84 = _80;
    float _86 = float(as_type<int>(_48));
    bool _88 = _84 < _86;
    bool _90 = !_68;
    bool _92 = _88 && _90;
    float _94 = _54 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _54 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _98 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _100 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].x, _96);
    out.m_32.x = _72;
    float _102 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[12].z, _100);
    out.m_32.y = _74;
    float _104 = _84;
    if (!_92)
    {
        _104 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _106 = _104;
    float _108 = _106;
    if (_92)
    {
        float _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _108 = _110;
    }
    float _112 = _108;
    float _114 = _54 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _116 = _54 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = -_112;
    float _120 = _118 + _86;
    float _122 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].x, _114);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _126 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[11].z, _98);
    float _128 = _120 * _50;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[10].z, _122);
    float _134 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[13].z, _124);
    float _136 = _126 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _138 = _102 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _140 = _132 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _142 = _134 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = _130 * _70;
    out.gl_Position.x = _140;
    out.gl_Position.y = _136;
    out.gl_Position.z = _138;
    out.gl_Position.w = _142;
    out.m_34.x = _144;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

